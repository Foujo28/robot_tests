*** Settings ***
Resource  ../helpers/browser.robot

*** Keywords ***
Open My Website
    [Arguments]  ${url}=${BASE_URL}  ${browser}=${BROWSER}
    Open Browser  ${url}  ${browser}

Navigate To Account
    Click Link  css:a[href='http://practice.automationtesting.in/my-account/']

Open My Website and go to Account
    Open My Website
    Navigate To Account

