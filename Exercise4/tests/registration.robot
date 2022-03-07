*** Settings ***
Resource            ../pageObjects/basePage.robot
Resource            ../pageObjects/accountPage.robot

Suite Setup  Open My Website and go to Account
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Register without email
    Clear fields
    Fill in register password  SOMEp##w0rd2022!!
    Sleep  2s
    ${error}=  Register and get error code
    Should Be Equal  ${error}  Error: Please provide a valid email address.

Register without password
    Clear fields
    Fill in register username  dfklfkdfk@fgohtu.com
    ${error}=  Register and get error code
    Should Be Equal  ${error}  Error: Please enter an account password.