*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
TC2
    Open Browser    url=https://www.medibuddy.in/    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    #click on login
    Click Element    link=Login
    #enter phome number
    Input Text    id=phone    89844432
        
