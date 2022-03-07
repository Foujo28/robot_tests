*** Settings ***
Resource            ../pageObjects/basePage.robot
Resource            ../pageObjects/accountPage.robot

Suite Setup  Open My Website and go to Account
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Test without email
    Fill in login password  somepassword
    ${error}=  Login and get error code
    Should Be Equal  ${error}  Error: Username is required.

Test with unexisting account
    Fill in login username  someusername
    Fill in login password  somepassword
    ${error}=  Login and get error code
    Should Be Equal  ${error}  ERROR: Invalid username. Lost your password?

Test without password
    Fill in login username  someusername
    ${error}=  Login and get error code
    Should Be Equal  ${error}  Error: Password is required.