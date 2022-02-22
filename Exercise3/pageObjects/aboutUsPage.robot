*** Settings ***
Resource  basePage.robot

*** Variables ***
${ABOUTUS_TXT}=  css:.centeredContent

*** Keywords ***

Get about us text
    ${text}=  Get Text  ${ABOUTUS_TXT}
    [Return]  ${text}