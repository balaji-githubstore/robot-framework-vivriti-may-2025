*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Variables ***
${CREATE_NEW_ACCOUNT_LOCATOR}   document.querySelector("div[class='login'] > global-login").shadowRoot.querySelector('sign-in-form').shadowRoot.querySelector("a[aria-label='Create an account']")
*** Keywords ***
Click Using JavaScript
    [Arguments]     ${element_locator}      ${timeout}
    Wait Until Page Contains Element    ${element_locator}      ${timeout}
    Wait Until Element Is Visible    ${element_locator}      ${timeout}
    Wait Until Element Is Enabled    ${element_locator}      ${timeout}
    Click Element    ${element_locator}

*** Test Cases ***
TC1 
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.royalcaribbean.com/
    #click on sign in
    Click Element    xpath=//span[text()='Sign In']
    Sleep    8s
#    wait for condition
    Execute Javascript   ${CREATE_NEW_ACCOUNT_LOCATOR}.scrollIntoView()
    Execute Javascript   ${CREATE_NEW_ACCOUNT_LOCATOR}.click()
    Sleep    5s
    
    #click on create new account
    #enter first name as john

*** Test Cases ***
TC2
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.royalcaribbean.com/account/signin
#    Wait Until Page Contains    Royal Caribbean
#    Wait For Condition    return document.querySelector("div[class='login'] > global-login").shadowRoot.querySelector('sign-in-form').shadowRoot.querySelector("a[aria-label='Create an account']").tagName=="A"
#    ...  timeout=30s
    Click Using JavaScript    dom:${CREATE_NEW_ACCOUNT_LOCATOR}     30s


