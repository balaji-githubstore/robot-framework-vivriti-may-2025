*** Settings ***
Library    Collections

*** Variables ***
${BROWSER_NAME}     chrome
@{COLORS}   red  green  yellow  blue
&{OPTIONS}      download.dir=C:${/}logs   browser=chrome

*** Test Cases ***
TC1
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    Append To List  ${COLORS}   orange  white
    Log To Console    ${COLORS}
    Remove Values From List    ${COLORS}    orange
    Log To Console    ${COLORS}

TC2
    Log To Console    ${OPTIONS}[download.dir]

TC3
   @{numbers}    Create List    4  5   8  44  555
   &{machine}   Create Dictionary    platform=Windows    machineName=Lenovo



