*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Test Cases ***
TC1 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://smallpdf.com/pdf-to-word
    Choose File    xpath=//input[@type='file']    D:${/}Balaji${/}Company${/}demo.pdf
    Sleep    5s

TC2 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://smallpdf.com/pdf-to-word
    Choose File    xpath=//input[@type='file']    ${EXECDIR}${/}files${/}demo.pdf
    Sleep    5s

TC3 Actions
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://online-video-cutter.com
    Mouse Down    xpath=//a[normalize-space()='Audio']
    Click Element    xpath=//a[normalize-space()='Change Speed']

TC4 Javascript
    Open Browser    browser=chrome  options=add_argument("start-maximized");add_argument("--disable-notifications");
#    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']
    Input Text    xpath=//div[@id='book-flight']//input[@aria-label='From']    chennai
    Click Element    xpath=//div[@id='book-flight']//div[text()='MAA']
#    Press Keys  xpath=//div[@id='book-flight']//input[@aria-label='From']   ENTER
    Input Text    xpath=//div[@id='book-flight']//input[@aria-label='To']    kuala lum
    Click Element    xpath=(//div[@id='book-flight']//div[text()='KUL'])[2]
    #approach 1 
#    Input Text    name=dateDeparture    03 Jun 2025
    #approach 2 - automate calendar
    #approach 3 - use javascript
    Execute Javascript  document.querySelector("input[name='dateDeparture']").value='30 Jun 2025'
    Execute Javascript  document.querySelector("input[name='dateReturn']").value='30 Jul 2025'
    Sleep    5s


TC5 Javascript
    Open Browser    browser=chrome  options=add_argument("start-maximized");add_argument("--disable-notifications");
#    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    Click Element    xpath=//span[text()='Accept all cookies']
    #approach 1
#    Input Text    name=dateDeparture    03 Jun 2025
    #approach 2 - automate calendar
    #approach 3 - use javascript
    ${ele1}   Get WebElement    xpath=//input[@name='dateDeparture']
    Execute Javascript  arguments[0].value='30 Jun 2025'    ARGUMENTS   ${ele1}

    ${ele2}   Get WebElement    xpath=//input[@name='dateReturn']
    Execute Javascript  arguments[0].value='30 Jul 2025'    ARGUMENTS   ${ele2}

    ${output}   Execute Javascript     return document.querySelector("input[name='dateReturn']").value
    Log To Console    ${output}
    ${output}   Execute Javascript     return document.title
    Log To Console    ${output}




TC7 Not required
    Execute Javascript  document.querySelector("input[name='dateDeparture']").value='30 Jun 2025';document.querySelector("input[name='dateReturn']").value='30 Jul 2025'

    ${ele1}   Get WebElement    xpath=//input[@name='dateDeparture']
    ${ele2}   Get WebElement    xpath=//input[@name='dateReturn']
    Execute Javascript  arguments[0].value='30 Jul 2025';arguments[1].value='30 Jul 2025';    ARGUMENTS    ${ele1}   ${ele2}

TC4 Javascript
    Open Browser    browser=chrome  options=add_argument("start-maximized");add_argument("--disable-notifications");
#    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://www.malaysiaairlines.com/us/en/home.html
    #approach 1
#    Input Text    name=dateDeparture    03 Jun 2025
    #approach 2 - automate calendar
    #approach 3 - use javascript
    ${ele}  Get WebElement    xpath=//input[@name='dateDeparture']
    Assign Id To Element    xpath=//input[@name='dateDeparture']    departureDate
    Execute Javascript  document.querySelector("#departureDate").value='30 Jun 2025'
    Sleep    5s


TC7 Validation
