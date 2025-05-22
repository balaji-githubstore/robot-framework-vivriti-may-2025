*** Settings ***
Library  DateTime

*** Variables ***
${BROWSER_NAME}     chromebrowser

*** Test Cases ***
TC1
  Log To Console  hello world
  Log To Console    message=hello
  Log To Console   ${BROWSER_NAME}
  Log   Checklogs
  Log To Console    hello  world

TC2
   ${num1}=  Set Variable   10
   ${num2}  Set Variable   20
   Set Local Variable    ${my_name}     red
   ${result}  Evaluate    ${num1}+${num2}
   Log To Console    ${result}
    Log To Console   ${BROWSER_NAME}

TC3
    ${current_date}  Get Current Date
    Log    ${current_date}
TC5
  Log To Console    hello${SPACE}${SPACE}world