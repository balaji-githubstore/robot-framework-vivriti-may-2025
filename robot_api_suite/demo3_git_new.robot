*** Settings ***
Library     RequestsLibrary
Library    Process

Suite Setup     Create Git Session with Bearer Token
Suite Teardown  Delete All Sessions

*** Variables ***
${TOKEN}       yyyyyyyyyyyyyyyyyyyyy
${GIT_USERNAME}     dbala-cloud

*** Keywords ***
Create Git Session with Bearer Token
    &{header}     Create Dictionary   accept=application/vnd.github+json    Authorization=Bearer ${TOKEN}
    Create Session    alias=gitapibearer    url=https://api.github.com   headers=${header}

*** Test Cases ***
TC1 Get Repo Details
    ${response}     GET On Session      alias=gitapibearer      url=/repos/${GIT_USERNAME}/repo1
    ...   expected_status=any
    Log    ${response.json()}[private]
    Log    ${response.json()['private']}
    Should Not Be True    ${response.json()['private']}
#    assert the repo is public - key private should be false




