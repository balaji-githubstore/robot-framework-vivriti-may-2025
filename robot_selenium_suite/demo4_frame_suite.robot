*** Settings ***
Library  SeleniumLibrary

Test Teardown   Close Browser

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/
    Select Frame    xpath=//frame[@name='login_page']
    #enter userid as john1234
    Input Text    name=fldLoginUserId    john123
    #click on continue
    Click Element    link=CONTINUE
    Unselect Frame
