*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
TC1
    Open Browser    url=https://www.facebook.com/    browser=chrome
    ${actual_title}  Get Title
    Log To Console    ${actual_title}
    Should Be Equal As Strings    ${actual_title}     Facebook – log in or sign up

TC2
    Open Browser    url=https://www.facebook.com/    browser=chrome
    Title Should Be    Facebook – log in or sign up

TC3
    Open Browser    url=https://www.facebook.com/    browser=chrome     alias=b1
    Open Browser    url=https://www.google.com/    browser=edge     alias=b2
    Log Title
    Switch Browser    b1
    Log Title
    Close Browser
    Close All Browsers

TC4_Sign_in
    Open Browser    url=https://www.facebook.com/    browser=chrome
    Input Text    id:email    hello8894454545455@gmail.com
    Input Password    id=pass    welcome123
    Click Element    name=login

TC5_Sign_Up
    Open Browser    url=https://www.facebook.com/    browser=chrome
    Click Element    link=Create new account
    Input Text    name=firstname    john
    Click Element    xpath=//input[@value='-1']
#    Select Radio Button    sex    -1
    Select From List By Label    id=day     20
#    Select From List By Value    id=month   12
#    Select From List By Index    id=month   11
    Select From List By Label    id=month   Dec

TC2
    Open Browser    url=https://www.medibuddy.in/    browser=chrome
