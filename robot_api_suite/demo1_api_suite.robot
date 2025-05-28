*** Settings ***
Library     RequestsLibrary
Library    OperatingSystem

Suite Setup     Setup Session

*** Keywords ***
Setup Session
    Create Session    alias=petstore    url=https://petstore.swagger.io/v2
    Create Session    alias=petstore1    url=https://petstore.swagger.io/v2
*** Test Cases ***
TC1
#    Create Session    alias=petstore    url=https://petstore.swagger.io/v2

    ${response}     GET On Session      alias=petstore     url=/pet/10
    Log    ${response.status_code}
    Log    ${response.text}
    Log    ${response.json()}
    Log    ${response.json()}[id]
    Log    ${response.json()}[category][id]
    Log    ${response.json()}
    Log    ${response.json()}[tags]
    Log    ${response.json()}[tags][0]
    Log    ${response.json()}[tags][0][id]
    Should Contain    ${response.text}    10
#    ${expected_id}  Convert To Integer    10
#    Should Be Equal    ${response.json()}[id]    ${expected_id} 
    Should Be Equal As Integers    ${response.json()}[id]    10
    
TC2 Invalid Pet
#    Create Session    alias=petstore    url=https://petstore.swagger.io/v2
    ${response}     GET On Session      alias=petstore     url=/pet/109     expected_status=404
    Log    ${response.json()}

