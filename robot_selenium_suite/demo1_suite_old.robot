*** Settings ***
Library     SeleniumLibrary

Test Teardown   Close Browser

*** Comments ***
Create Team Element is inside shadowroot
so you need to write javascript for it
you can copy js using chrome
So inspect the element, right click, copy js, paste it in console and run with click() method to verify and then use below keyword by passing js

*** Keywords ***
Click Using JavaScript
    [Arguments]     ${element_locator}      ${timeout}
    Wait Until Page Contains Element    ${element_locator}      ${timeout}
    Wait Until Element Is Visible    ${element_locator}      ${timeout}
    Wait Until Element Is Enabled    ${element_locator}      ${timeout}
    Click Element    ${element_locator}


*** Test Cases ***
TC1 Direct Click Using Javascript for Create Team
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://gaming.uefa.com/en/uefachampionsleague
    Click Element    id=onetrust-accept-btn-handler
    Scroll Element Into View    xpath=(//div[@class='lazyload-wrapper '])[3]
    Sleep    20s
    Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()

TC2 Using Customized Keyword for Create Team
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://gaming.uefa.com/en/uefachampionsleague
    Click Element    id=onetrust-accept-btn-handler
    Scroll Element Into View    xpath=(//div[@class='lazyload-wrapper '])[3]
    Click Using JavaScript    dom:document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span")    30s

