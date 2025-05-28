*** Settings ***
Library     RequestsLibrary
Library    OperatingSystem

Suite Setup     Create Session    alias=petstore    url=https://petstore.swagger.io/v2

*** Test Cases ***
TC1 Image Upload
    ${image_file2}  Get File For Streaming Upload    ${EXECDIR}${/}files${/}demo.jpg
    &{payload}      Create Dictionary       additionalMetadata=image/jpg
    &{files1}    Create Dictionary     file=${image_file2}

    ${response}     POST On Session     alias=petstore      url=/pet/5/uploadImage     data=${payload}
    ...   files=${files1}
    ...     expected_status=any

TC2 Multi Image Upload Dictionary
    &{payload}      Create Dictionary       additionalMetadata=image/png

    ${image_file1}  Get File For Streaming Upload    ${EXECDIR}${/}files${/}demo.jpg
    ${image_file2}  Get File For Streaming Upload    ${EXECDIR}${/}files${/}demo.jpg

    ${files}=    Create Dictionary    randombytes1    ${image_file1}    randombytes2    ${image_file2}      randombytes3    ${image_file2}

    ${response}     POST On Session     alias=petstore      url=/pet/5/uploadImage     data=${payload}
    ...   files=${files}
    ...     expected_status=any

TC3 Multi Image Upload List
    &{payload}      Create Dictionary       additionalMetadata=image/png

    ${image_file1}  Get File For Streaming Upload    ${EXECDIR}${/}files${/}demo.jpg
    ${image_file2}  Get File For Streaming Upload    ${EXECDIR}${/}files${/}demo.jpg

    ${file_1_tuple}=    Create List     demo.jpg   ${image_file1}
    ${file_2_tuple}=    Create List     demo.jpg   ${image_file2}

    ${file_1_upload}=    Create List    randombytes1    ${file_1_tuple}
    ${file_2_upload}=    Create List    randombytes2    ${file_2_tuple}

    ${files}=    Create List    ${file_1_upload}    ${file_2_upload}

    ${response}     POST On Session     alias=petstore      url=/pet/5/uploadImage     data=${payload}
    ...   files=@{files}
    ...     expected_status=any