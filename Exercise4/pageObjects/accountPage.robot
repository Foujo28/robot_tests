*** Settings ***
Resource  ../helpers/browser.robot

*** Keywords ***
Fill in login username
    [Arguments]  ${login}
    Input Text  css:#username  ${login}

Fill in login password
    [Arguments]  ${login}
    Input Text  css:#password  ${login}

Login
    Click Button  css:input[value='Login']

Get login error text
    ${error}=  Get Text  xpath://div[@id='body']//li[1]
    [return]  ${error}

Login and get error code
    Login
    ${error}=  Get login error text
    Log  ${error}
    [return]  ${error}
