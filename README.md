# selenium-test
conda env create -f selenium_env.yml  导入conda环境，这里我的conda环境导出的可能有点问题，但是不影响实际运行
使用mysql数据库创建currency_db数据库，使用sql语句'''
            CREATE TABLE {table_name} (
                id INT AUTO_INCREMENT PRIMARY KEY,
                currency_name VARCHAR(50),
                currency_code VARCHAR(10)
            )
            '''，创建一个表文件currency_mapping_table，不然可能执行起来会有点问题