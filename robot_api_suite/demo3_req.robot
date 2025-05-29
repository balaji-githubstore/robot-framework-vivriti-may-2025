*** Settings ***
Library     RequestsLibrary
Library    RPA.JSON

*** Test Cases ***
TC1 List User
    &{header}       Create Dictionary       x-api-key=reqres-free-v1
    Create Session    alias=req    url=https://reqres.in    headers=${header}
    ${response}     GET On Session  alias=req       url=api/users?page=2
    Log    ${response.json()}[data]
    ${data_count}   Get Length    ${response.json()}[data]
    Log     ${data_count}
    FOR    ${i}    IN RANGE    0    ${data_count}
        Log    ${response.json()}[data][${i}][email]
    END

TC2 List User
    &{header}       Create Dictionary       x-api-key=reqres-free-v1
    Create Session    alias=req    url=https://reqres.in    headers=${header}
    ${response}     GET On Session  alias=req       url=api/users?page=2
    Log    ${response.json()}[data]

    FOR    ${item}    IN    @{response.json()}[data]
        Log    ${item}[email]
    END

TC3 List User
    &{header}       Create Dictionary       x-api-key=reqres-free-v1
    Create Session    alias=req    url=https://reqres.in    headers=${header}
    ${response}     GET On Session  alias=req       url=api/users?page=2
    Log    ${response.json()}
    ${value}     Get value from JSON    ${response.json()}    $.page
    Log    ${value}
    ${value}     Get value from JSON    ${response.json()}    $.data[0].email
    Log    ${value}
    ${value}     Get values from JSON    ${response.json()}    $.data[*].email
    Log    ${value}
    ${value}     Get values from JSON    ${response.json()}    $..email
    Log    ${value}
    ${value}     Get value from JSON    ${response.json()}    $..email
    Log    ${value}
        

