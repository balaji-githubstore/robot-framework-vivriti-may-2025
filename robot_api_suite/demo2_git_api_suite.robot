*** Settings ***
Library     RequestsLibrary



*** Variables ***
${GIT_USERNAME}     balaji-githubstore
${TOKEN}     jjjjjjj


*** Keywords ***
Create Git Session With Basic Auth
    ${auth}     Create List     balaji-githubstore      ${TOKEN}
    Create Session    alias=gitapibasic    url=https://api.github.com   auth=${auth}

Create Git Session with Bearer Token
    &{header}     Create Dictionary   accept=application/vnd.github+json    Authorization=Bearer ${TOKEN}
    Create Session    alias=gitapibearer    url=https://api.github.com   headers=${header}

*** Test Cases ***
TC1 Get Repo Details
    ${repo_name}    Set Variable    repo1
    ${git_username}    Set Variable    dbala-cloud
    Create Git Session with Bearer Token
    GET On Session  alias=gitapibearer
