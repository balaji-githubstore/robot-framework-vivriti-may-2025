*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Test Cases ***
TC1 Name
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/selectPage.html

    ${name1}  Get Text    xpath=//table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}


TC2 All Names
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/selectPage.html

    FOR    ${counter}    IN RANGE    1    10

        ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1
            ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name}
        END
        Click Element    css=[aria-label="Last"]
    END


TC3
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/selectPage.html

    FOR    ${i}    IN RANGE    1    11
        ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
         Log To Console    ${name}
         IF    '${name}'=='Cedric Kelly'
             Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
             BREAK
         END
    END
