*** Settings ***
Library     SeleniumLibrary
Library     AutoItLibrary

*** Test Cases ***
TC1 Windows Auth Option 1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
##    http://user:password@domain.com/
    Go To    url=https://john:john123@demo.guru99.com/test/basic_auth.php
    Sleep    5s
    AutoItLibrary.Send      John
    AutoItLibrary.Send      {ENTER}
    AutoItLibrary.Send      John123
    AutoItLibrary.Send      {ENTER}

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    xpath=//span[text()='Select PDF file']
    Sleep    2s
    Control Focus       Open       ${EMPTY}     Edit1
    Control Set Text    Open    ${EMPTY}    Edit1   ${EXECDIR}${/}files${/}demo.pdf
    Control Click   Open    ${EMPTY}    Button1

