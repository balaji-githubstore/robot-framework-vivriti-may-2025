*** Settings ***
Documentation     This example demonstrates how to use current library
Library      AutoRecorder      mode=test
Library      SeleniumLibrary

*** Test Cases ***
Example Test
    Open Browser    http://google.com    gc
    Sleep    5s
    Close Browser