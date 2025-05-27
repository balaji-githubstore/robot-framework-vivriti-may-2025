*** Settings ***
Library     DatabaseLibrary

Suite Setup     Connect To Database     db_module=pymysql     db_name=dbfree_db    db_user=dbfree_db
    ...     db_password=12345678     dbHost=db4free.net      dbPort=3306    alias=db1

Suite Teardown      Disconnect From Database


*** Test Cases ***
TC1
    ${row_count}     Row Count    select * from Products
    Log To Console    ${row_count}
    Disconnect From Database

TC2
    Row Count Is Equal To X    select * from Products where productname='laptop'    1
    Row Count Is Greater Than X    select * from Products where productname='laptop'    0
    Row Count Is Less Than X    select * from Products where productname='laptop'    10
    #assume we add product id 2
    Check If Exists In Database    select * from Products where product_id=2
    #assume we delete product id 2
    Check If Not Exists In Database    select * from Products where product_id=2

TC3 Update Insert Delete 
    Execute Sql String    Insert into Products (product_id,productname,description) values (4,'mobile','iphone')
    Execute Sql String    update Products set productname='mobile' where product_id=3
    Execute Sql String    Delete from Products where product_id=3
    Check If Not Exists In Database    select * from Products where product_id=3


    
    
    
    
    