*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Keywords ***
Launch Browser And Navigate To Url
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://datatables.net/extensions/select/examples/checkbox/selectPage.html

Select Checkbox For Name
    [Arguments]         ${employee_name}
    ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    FOR    ${i}    IN RANGE    1    ${row_count}+1
        ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
         Log To Console    ${name}
         IF    '${name}'=='${employee_name}'
             Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
             BREAK
         END
    END


*** Test Cases ***
TC1 Name
    Launch Browser And Navigate To Url
    ${name1}  Get Text    xpath=//table[@id='example']/tbody/tr[1]/td[2]
    Log To Console    ${name1}


TC2 All Names
    Launch Browser And Navigate To Url
    FOR    ${counter}    IN RANGE    1    10

        ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
        FOR    ${i}    IN RANGE    1    ${row_count}+1
            Scroll Element Into View    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
            Log To Console    ${name}
        END
        Click Element    css=[aria-label="Last"]
    END


TC3
    Launch Browser And Navigate To Url
    ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
    FOR    ${i}    IN RANGE    1    ${row_count}+1
        ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
         Log To Console    ${name}
         IF    '${name}'=='Cedric Kelly'
             Click Element    xpath=//table[@id='example']/tbody/tr[${i}]/td[1]
             BREAK
         END
    END

TC3_Verify_Checkbox_Selection
    Launch Browser And Navigate To Url
    Select Checkbox For Name    Ashton Cox


TC5 Print All Names From All Page
    Launch Browser And Navigate To Url

    FOR    ${page}    IN RANGE    1    7
       ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
       FOR    ${i}    IN RANGE    1    ${row_count}+1
         ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
         Log To Console    ${name}
        END
        ${output}   Run Keyword And Ignore Error    Click Element   xpath=//button[@aria-label='NEXT']
        Exit For Loop If    '${output}[0]'=='FAIL'
    END

TC6 Print All Names From All Page
    Launch Browser And Navigate To Url

    FOR    ${page}    IN RANGE    1    7
       ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
       FOR    ${i}    IN RANGE    1    ${row_count}+1
         ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
         Log To Console    ${name}
        END
        ${output}   Run Keyword And Ignore Error    Element Should Be Enabled   xpath=//button[@aria-label='NEXT']
        Exit For Loop If    '${output}[0]'=='FAIL'
        Click Element    xpath=//button[@aria-label='NEXT']
    END

TC6
    Launch Browser And Navigate To Url
    ${output}   Run Keyword And Ignore Error    Click Element   xpath=//button[@aria-label='Next555']
    Log To Console    ${output}
    Log To Console    ${output}[0]
    
    
TC6 Print All Names From All Page
    Launch Browser And Navigate To Url
    ${output}   Run Keyword And Ignore Error    Element Should Be Enabled   xpath=//button[@aria-label='NEXT']
    WHILE    '${output}[0]'=='PASS'
       ${row_count}    Get Element Count    xpath=//table[@id='example']/tbody/tr
       FOR    ${i}    IN RANGE    1    ${row_count}+1
        Scroll Element Into View    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        ${name}  Get Text    xpath=//table[@id='example']/tbody/tr[${i}]/td[2]
        Log To Console    ${name}
        END
        Click Element    xpath=//button[@aria-label='NEXT']
        ${output}   Run Keyword And Ignore Error    Element Should Be Enabled   xpath=//button[@aria-label='NEXT']
    END

TC7
    Launch Browser And Navigate To Url
    Table Should Contain    xpath=//table[@id='example']    Cedric Kelly
    Table Row Should Contain    xpath=//table[@id='example']    1    Tiger Nixon

