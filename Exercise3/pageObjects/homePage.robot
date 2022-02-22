*** Settings ***
Resource  basePage.robot

*** Variables ***
${ACCEPT_COOKIES}=    css:[title="Ja, ik accepteer cookies"]
${SMART_TXT}=         xpath://a[@class='smartphones']
${ABOUTUS}=           xpath://ul[@class='bulletSeparatedList']//a[normalize-space()='Over Tweakers']

*** Keywords ***

Go To Home
    Click Element  ${ACCEPT_COOKIES}

Get Smartphones text
    Wait Until Element Is Visible  ${SMART_TXT}
    ${text}=  Get Text  ${SMART_TXT}
    [Return]  ${text}

Go from Home to About Us
    Click Element  ${ABOUTUS}