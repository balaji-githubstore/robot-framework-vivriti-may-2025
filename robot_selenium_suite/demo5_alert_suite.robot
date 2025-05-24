*** Settings ***
Library  SeleniumLibrary

Test Teardown   Close Browser

*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
#    Click Element    xpath=//img[contains(@src,'go.gif77777')]
    ${actual_alert_text}    Handle Alert    action=LEAVE    timeout=10s
    Log To Console    ${actual_alert_text}
#    Alert Should Be Present

TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[contains(@src,'go.gif')]
    Alert Should Be Present     text=Customer ID${SPACE}${SPACE}cannot be left blank.     timeout=20s
    Sleep    2s


