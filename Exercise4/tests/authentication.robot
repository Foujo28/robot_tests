*** Settings ***
Resource            ../pageObjects/basePage.robot
Resource            ../pageObjects/accountPage.robot

Suite Setup  Open My Website and go to Account
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Login without email
    Clear fields
    Fill in login password  somepassword
    ${error}=  Login and get error code
    Should Be Equal  ${error}  Error: Username is required.

Login with unexisting account
    Clear fields
    Fill in login username  dflkdfkldf
    Fill in login password  sdklfbkjfdnk
    ${error}=  Login and get error code
    Should Be Equal  ${error}  ERROR: Invalid username. Lost your password?

Login without password
    Clear fields
    Fill in login username  dfklfdklfdklvmnb
    ${error}=  Login and get error code
    Should Be Equal  ${error}  Error: Password is required.