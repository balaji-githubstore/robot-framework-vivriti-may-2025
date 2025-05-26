*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Test Cases ***
TC1 Upload
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.royalcaribbean.com/
    
    ${actual_desc}      Get Text    xpath=//p[contains(text(),'most')]
    Log To Console    ${actual_desc}
    Should Contain    ${actual_desc}    Electronic Health Record
    Element Should Contain      xpath=//p[contains(text(),'most')]      Electronic Health Record and Medical Practice Management
    Element Text Should Be    xpath=//p[contains(text(),'most')]    The most popular open-source Electronic Health Record and Medical Practice Management solution.
    
    ${actual_username_placeholder}  Get Element Attribute    id=authUser    placeholder
    Log To Console    ${actual_username_placeholder}
    Element Attribute Value Should Be       id=authUser     placeholder     Username    Attribut not matching Username


    

