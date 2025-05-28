*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
TC1 Get Repo Details
    ${response}     GET On Session      alias=gitapibearer      url=/repos/${GIT_USERNAME}/repo1
    ...   expected_status=any
    Log    ${response.json()}[private]
    Log    ${response.json()['private']}
    Should Not Be True    ${response.json()['private']}
#    assert the repo is public - key private should be false

TC2 Update Git Details
   ${body}  Get File For Streaming Upload    path=${EXECDIR}${/}files${/}repo_update.json
   ${response}      Patch On Session      alias=gitapibearer  url=/repos/${GIT_USERNAME}/repo1
   ...      data=${body}    expected_status=any
   Status Should Be    200
   Log    ${response}

TC2 Update Git Details
   &{body}      Create Dictionary      name="repo3"     private=${True}
   ${response}      Patch On Session      alias=gitapibearer  url=/repos/${GIT_USERNAME}/repo1
   ...      data=${body}    expected_status=any
   Status Should Be    200
   Log    ${response}

TC3
    ${file1}    Get File For Streaming Upload    path=${EXECDIR}${/}files${/}demo1.png
    ${file2}    Get File For Streaming Upload    path=${EXECDIR}${/}files${/}demo1.png

     ${files}=   Create Dictionary  randombytes1  ${file1}  randombytes2  ${file2}

     ${payload}   Create Dictionary      additionalMetadata=image/png

     Create Session    alias=pet    url=https://petstore.swagger.io/v2

     ${response}    POST On Session    alias=pet    url=pet/10/UploadImage     files=${files}      data=${payload}
     ...   expected_status=200
     Log    ${response}
