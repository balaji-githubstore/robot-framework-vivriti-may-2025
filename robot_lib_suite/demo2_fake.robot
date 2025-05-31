*** Settings ***
Library     FakerLibrary


*** Test Cases ***
TC1
    ${words}    FakerLibrary.Words 
    Log To Console    ${words}
   ${words}     Credit Card Number  
   Log To Console    ${words}