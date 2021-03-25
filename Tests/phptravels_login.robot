*** Settings ***
Library  Selenium2Library

Test Setup      Open test browser
Test Teardown   Close test browser

*** Variables ***
${SEARCH_URL}       https://www.phptravels.net/home
${search_account}      xpath=//*[@id="//header-waypoint-sticky"]/div[1]/div/div/div[2]/div/ul/li[3]/div
${search_login}     xpath=//*[@id="//header-waypoint-sticky"]/div[1]/div/div/div[2]/div/ul/li[3]/div/div/div/a[1]
${BROWSER}          Chrome
${user_id}          xpath=//input[@name='username']
${password}         xpath=//input[@name='password']
${login}            xpath=//*[@id="loginfrm"]/button
${id}               user@phptravels.com
${pwd}              demouser

*** Test Cases ***
Login on phptravels using user credentials
    #Open Browser  ${SEARCH_URL}  browser=${BROWSER}
    Wait Until Element Is Visible  ${search_account}
    Click Element   ${search_account}
    Wait Until Element Is Visible  ${search_login}
    Click Element   ${search_login}
    sleep  5s
    Wait Until Element Is Visible  ${user_id}
    Wait Until Element Is Visible  ${password}
    # User defined keyword
    Login User  ${id}  ${pwd}
    sleep  5s
    Set Selenium Implicit Wait  5s
    #Close All Browsers

*** Keywords ***
Open Test Browser
    Open browser  ${SEARCH_URL}  browser=${BROWSER}
Login User
    [Arguments]  ${id}  ${pwd}
    Enter userid  ${id}
    Enter password  ${pwd}
    Submit Form
Enter userid
    [Arguments]  ${id}
    Input Text  name:username  ${id}
Enter password
    [Arguments]  ${pwd}
    Input Text  name:password  ${pwd}
Submit Form
    Click Element  ${login}
Close Test Browser
    Close All Browsers
