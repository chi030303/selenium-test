from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import sys
import pymysql
import time
from datetime import datetime


# 设置标准输出编码为UTF-8，解决中文输出乱码的问题
sys.stdout.reconfigure(encoding='utf-8')    

# 爬取货币名称和货币代号数据，并返回数据
def crawl_currency_data(url):
    # 创建一个Selenium WebDriver
    driver = webdriver.Edge()  # 请确保你已经安装了Edge浏览器并下载了对应版本的edgedriver

    try:
        # 打开指定网页
        driver.get(url)

        # 等待页面加载（你可以根据实际情况调整等待时间）
        driver.implicitly_wait(10)

        # 定位到目标元素
        currency_table = driver.find_element(By.CLASS_NAME, 'container.currency')
        rows = currency_table.find_elements(By.TAG_NAME, 'tr')

        # 提取货币名称和代码信息
        currency_data = {}
        for row in rows[2:]:  # 从第三行开始提取数据
            columns = row.find_elements(By.TAG_NAME, 'td')

            # 检查列表长度是否符合预期
            if len(columns) >= 5:
                country = columns[0].text.strip()
                currency_name = columns[1].text.strip()
                currency_code = columns[4].text.strip()
                currency_data[country] = {'名称': currency_name, '代码': currency_code}

        return currency_data

    finally:
        # 关闭浏览器
        driver.quit()

# 将数据存入MySQL数据库
def insert_currency_data(currency_data):
    # 数据库连接参数
    connection_params = {
        'host': 'localhost',
        'user': 'root', # 这里更改为自己的用户名
        'password': 'GJyg6841!', # 这里更改为自己的密码
        'database': 'currency_db' # 这里更改为自己的数据库
    }

    # 连接到数据库
    connection = pymysql.connect(**connection_params)
    try:
        # 创建数据库游标
        cursor = connection.cursor()

        # 表名
        table_name = 'currency_mapping_table'

        # 检查表是否存在，不存在就自动创建
        cursor.execute(f"SHOW TABLES LIKE '{table_name}'")
        table_exists = cursor.fetchone()

        # 如果表不存在，则创建表
        if not table_exists:
            create_table_query = f'''
            CREATE TABLE {table_name} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                currency_name VARCHAR(50),
                currency_code VARCHAR(10)
            )
            '''
            cursor.execute(create_table_query)
            print(f"创建表 {table_name}")

        # 插入数据的 SQL 语句
        insert_query = f"INSERT INTO {table_name} (currency_name, currency_code) VALUES (%s, %s)"

        # 检查表是否为空
        cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
        row_count = cursor.fetchone()[0]

        if row_count == 0:
            # 表为空，执行插入操作
            # 执行插入操作
            for country, data in currency_data.items():
                currency_name = data['名称']
                currency_code = data['代码']
                values = (currency_name, currency_code)
                cursor.execute(insert_query, values)

            # 提交事务
            connection.commit()
            print("数据成功插入到数据库")
        else:
            # 表不为空，给出提示
            print(f"表 {table_name} 不为空，不执行插入操作")

    except Exception as e:
        print(f"发生错误: {e}")

    finally:
        # 关闭游标和连接
        cursor.close()
        connection.close()

# 根据货币代号获取货币名称，通过之前存在数据库中的数据
def get_currency_name_by_code(currency_code):
    try:
        # 数据库连接参数
        connection_params = {
            'host': 'localhost',
            'user': 'root',  # 这里更改为自己的用户名
            'password': 'GJyg6841!',  # 这里更改为自己的密码
            'database': 'currency_db'  # 这里更改为自己的数据库
        }

        # 连接到数据库
        connection = pymysql.connect(**connection_params)
        cursor = connection.cursor()

        # 表名
        table_name = 'currency_mapping_table'

        # 查询货币名称的 SQL 语句
        query = f"SELECT currency_name FROM {table_name} WHERE currency_code = %s"

        # 执行查询
        cursor.execute(query, (currency_code,))
        result = cursor.fetchone()

        if result:
            # 如果找到对应的货币名称，返回结果
            return result[0]
        else:
            # 如果未找到对应的货币名称，返回提示
          raise ValueError(f"未找到货币代号为 {currency_code} 的货币名称")

    except Exception as e:
        # 输出错误信息
        print(f"发生错误: {e}")

        # 结束程序
        sys.exit()

    finally:
        # 关闭游标和连接
        cursor.close()
        connection.close()

# 自动输入日期、货币名称，获取获取现汇卖出价
def get_value(url, input_date, input_currency_name):
    try:
        # 添加User-Agent
        options = webdriver.EdgeOptions()
        options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")

        # 创建一个Selenium WebDriver
        driver = webdriver.Edge(options=options)

        # 打开指定网页
        driver.get(url)

        # 在打开网页后等待一段时间
        driver.implicitly_wait(10)  # 10秒的等待时间

        # 输入日期
        date_input = driver.find_element(By.CSS_SELECTOR, '#historysearchform > div > table > tbody > tr > td:nth-child(4) > div > input')
        date_input.clear()
        date_input.send_keys(input_date)

        # 选择货币名称
        currency_select = driver.find_element(By.ID, 'pjname')
        currency_select.click()

        # 等待货币名称选择项出现
        currency_option_xpath = f'//select[@id="pjname"]/option[text()="{input_currency_name}"]'
        try:
            # 判断货币名称是否存在于选择项中
            currency_option = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, currency_option_xpath))
            )
        except:
            # 如果货币名称不存在，输出错误信息并结束程序
            print(f"未找到货币名称: {input_currency_name}")
            return None

        # 选择货币名称
        currency_option.click()

        # 模拟点击查询按钮
        search_button = driver.find_element(By.XPATH, '//*[@id="historysearchform"]/div/table/tbody/tr/td[7]/input')
        search_button.click()

        # 接下来，等待查询结果加载完成，提取现汇卖出价等信息
        # 请根据实际情况调整等待时间和选择器
        sell_rate_locator = (By.XPATH, '/html/body/div/div[4]/table/tbody/tr[2]/td[4]')
        sell_rate = WebDriverWait(driver, 20).until(
            EC.presence_of_element_located(sell_rate_locator)
        )

        # 获取现汇卖出价
        sell_rate_value = sell_rate.text.strip()

        # 打印结果
        print(sell_rate_value)
        return sell_rate_value
    except Exception as e:
        print(f"发生错误: {e}")
    finally:
        # 关闭浏览器
        driver.quit()

# 主函数，按照python3 selenium_test.py <日期> <货币代码>的格式在终端输入
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 selenium_test.py <日期> <货币代码>")
    else:
        # 爬取货币名称和货币代号，并存入数据库
        result = crawl_currency_data('https://www.11meigui.com/tools/currency')
        insert_currency_data(result)
        # 对输入信息进行判断，如果输入信息无误，再继续操作
        date_input = sys.argv[1]
        try:
            formatted_input_date = datetime.strptime(date_input, "%Y%m%d").strftime("%Y-%m-%d")
        except ValueError:
            print("错误：日期格式无效。请使用YYYYMMDD格式的日期。")
        currency_code_input = sys.argv[2].upper()  # 转换为大写
        currency_name = get_currency_name_by_code(currency_code_input)

        get_value("https://www.boc.cn/sourcedb/whpj/",formatted_input_date, currency_name)
