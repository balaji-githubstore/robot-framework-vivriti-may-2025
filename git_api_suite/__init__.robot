*** Settings ***
Resource    setup.resource

Suite Setup     Create Git Session with Bearer Token
Suite Teardown      Delete All Sessions
