*** Settings ***
Resource  ../helpers/browser.robot

*** Variables ***

${LOGIN_USER}=  css:#username
${LOGIN_PASS}=  css:#password
${REG_USER}=    css:#reg_email
${REG_PASS}=    css:#reg_password
${ERROR}=


*** Keywords ***
Fill in login username
    [Arguments]  ${login}
    Input Text  ${LOGIN_USER}  ${login}

Fill in login password
    [Arguments]  ${login}
    Input Text  ${LOGIN_PASS}  ${login}

Login
    Click Button  css:input[value='Login']

Register
    Click Button  css:input[value='Register']

Get error text
    ${error}=  Get Text  xpath://div[@id='body']//li[1]
    [return]  ${error}

Login and get error code
    Login
    ${error}=  Get error text
    Log  ${error}
    [return]  ${error}

Fill in register username
    [Arguments]  ${user}
    Input Text  ${REG_USER}  ${user}

Fill in register password
    [Arguments]  ${password}
    Input Text  ${REG_PASS}  ${password}

Register and get error code
    Register
    Sleep  2s
    ${error}=  Get error text
    Log  ${error}
    [return]  ${error}

Clear fields
    Clear Element Text  ${LOGIN_USER}
    Clear Element Text  ${LOGIN_PASS}
    Clear Element Text  ${REG_USER}
    Clear Element Text  ${REG_PASS}