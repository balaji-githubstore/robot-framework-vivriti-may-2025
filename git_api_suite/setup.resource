*** Settings ***
Library     RequestsLibrary

*** Variables ***
${TOKEN}       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
${GIT_USERNAME}     dbala-cloud

*** Keywords ***
Create Git Session with Bearer Token
    &{header}     Create Dictionary   accept=application/vnd.github+json    Authorization=Bearer ${TOKEN}
    Create Session    alias=gitapibearer    url=https://api.github.com   headers=${header}
