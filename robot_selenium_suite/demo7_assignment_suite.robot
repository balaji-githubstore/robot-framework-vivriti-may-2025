*** Comments ***
Task 3 (Important)
1. Navigate onto http://demo.openemr.io/b/openemr/
2. Update username as admin
3. Update password as pass
4. Select language as English (Indian)
5. Click on the login button
6. Click on Patient Click New Search
7. Add the first name, last name
8. Update DOB as today's date
driver.findElement(By.id("form_DOB")).sendKeys("2024-01-12");
9. Update the gender
10. . Click on the create new patient button above the form
11. . Click on confirm create new patient button.
12. . Print the text from alert box (if any error before handling alert add 5 sec wait)
13. . Handle alert
14. Close the Happy Birthday popup

*** Settings ***
Library  SeleniumLibrary

Test Teardown     Run Keywords      Log Title      AND      Close Browser

*** Test Cases ***
TC1 Add Patient
    Open Browser    browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://demo.openemr.io/b/openemr
    Input Text    css=#authUser    admin
    Input Text    css=#clearPass    pass
    Select From List By Label    css=select[name='languageChoice'   English (Indian)
    Click Element    id=login-button
    Click Element    xpath=//div[text()='Patient']
    Click Element    xpath=//div[text()='New/Search']
    Select Frame    name=pat
    Input Text    id=form_fname    john
    Input Text    id=form_DOB    2025-05-24
