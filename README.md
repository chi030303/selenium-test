# selenium-test
conda env create -f selenium_env.yml  导入conda环境，这里我的conda环境导出的可能有点问题，但是不影响实际运行。

使用mysql数据库创建currency_db数据库，使用sql语句
'''CREATE TABLE currency_mapping_table ( id INT AUTO_INCREMENT PRIMARY KEY, currency_name VARCHAR(50), currency_code VARCHAR(10) )'''，创建一个表文件currency_mapping_table，直接运行的话可能会显示找不到表文件。
currency_mapping_table.sql就是根据https://www.11meigui.com/tools/currency 货币标准符号的网站来爬取的数据，包括每个货币名称对应的货币代号。