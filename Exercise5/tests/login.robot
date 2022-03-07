*** Settings ***
Resource            ../pageObjects/loginPage.robot

Suite Setup  Open My Website
Suite Teardown  Close browser

*** Variables ***

*** Test Cases ***

Login with wrong password
    Fill in login username  tomsmith
    Fill in login password  incorrectPassword
    ${error}=  Login and get error code
    Should Contain  ${error}  Your password is invalid!

Login with wrong username
    Fill in login username  tom
    Fill in login password  incorrectPassword
    ${error}=  Login and get error code
    Should Contain  ${error}  Your username is invalid!

Login with correct credentials
    Fill in login username  tomsmith
    Fill in login password  SuperSecretPassword!
    ${success}=  Login and get error code
    Should Contain  ${success}  You logged into a secure area!
    Location Should Be  https://the-internet.herokuapp.com/secure
    Click Element  css:.icon-2x.icon-signout

Login and logout
    Fill in login username  tomsmith
    Fill in login password  SuperSecretPassword!
    ${success}=  Login and get error code
    Click Element  css:.icon-2x.icon-signout
    Location Should Be  https://the-internet.herokuapp.com/login