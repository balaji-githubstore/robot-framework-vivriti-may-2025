*** Settings ***
Library     RequestsLibrary
Resource    setup.resource

*** Test Cases ***
TC1 Get Repo Details
    ${response}     GET On Session      alias=gitapibearer      url=/repos/${GIT_USERNAME}/Durgaa
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

TC3 Update Git Details
   &{body}      Create Dictionary      name=repo1     private=${True}

   ${response}      Patch On Session      alias=gitapibearer  url=repos/${GIT_USERNAME}/repo1
   ...      json=${body}    expected_status=any
   Status Should Be    200
   Log    ${response}



