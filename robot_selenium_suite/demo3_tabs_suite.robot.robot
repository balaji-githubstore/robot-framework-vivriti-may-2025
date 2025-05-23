*** Settings ***
Library  SeleniumLibrary


Test Setup      Open Browser    browser=chrome
Test Teardown     Close Browser

*** Test Cases ***
TC1
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.db4free.net/
#    click on phpMyAdmin »\
    Click Element    partial link=phpMyAdmin
    Switch Window   phpMyAdmin
    Element Text Should Be    xpath=//h1[contains(normalize-space(),'Welcom')]    Welcome to phpMyAdmin
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
#    Element Text Should Be    id=pma_errors    Error 1045: Access denied for user. Additional error information may be available, but is being hidden by the $cfg['Servers'][$i]['hide_connection_errors'] configuration directive.
#   Assert error contains "Access denied for user."
    Element Should Contain   id=pma_errors    Access denied for user.
#    Page Should Contain    Access denied for user.
    Close Window
    Switch Window   db4free.net - MySQL Database for free
    Log Title

TC2
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.db4free.net/
#    click on phpMyAdmin »\
    Click Element    partial link=phpMyAdmin
    Switch Window   NEW
    Element Text Should Be    xpath=//h1[contains(normalize-space(),'Welcom')]    Welcome to phpMyAdmin
    Input Text    id=input_username    admin
    Input Password    id=input_password    admin123
    Click Element    id=input_go
#    Element Text Should Be    id=pma_errors    Error 1045: Access denied for user. Additional error information may be available, but is being hidden by the $cfg['Servers'][$i]['hide_connection_errors'] configuration directive.
#   Assert error contains "Access denied for user."
    Element Should Contain   id=pma_errors    Access denied for user.
#    Page Should Contain    Access denied for user.
    Close Window
    Switch Window   MAIN
    Log Title


TC3
    [Setup]
    Log To Console    hello
    [Teardown]
