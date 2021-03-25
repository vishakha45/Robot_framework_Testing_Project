*** Settings ***
Library  Selenium2Library
# Suite Setup     Open browser    ${URL}   ${BROWSER}
# Suite Teardown  Close All Browsers

*** Variables ***
${SEARCH_URL}       http://www.google.com
${search_form}      css=form[name=f]
${search_query}     css=input[name=q]
${search_term}      Lambdatest Login
${click_lt_link}    //h3[.='Login - LambdaTest']

#Lambdatest URL details
${LT_URL}           https://accounts.lambdatest.com/login
${BROWSER}          Chrome
${user_id}          xpath=//input[@name='email']
${password}         xpath=//input[@id='userpassword']

*** Test Cases ***
Search for Lambdatest
    Open Browser  ${SEARCH_URL}  browser=${BROWSER}
    Wait Until Element Is Visible  ${search_form}
    Wait Until Element Is Visible  ${search_query}
    Input Text      ${search_query}   ${EMPTY}
    Input Text      ${search_query}   ${search_term}
    Submit Form
    Click Element   ${click_lt_link}

Login on Lambdatest
    Wait Until Element Is Visible  ${user_id}
    Wait Until Element Is Visible  ${password}
    # User defined keyword
    Enter userid and password
    Submit Form
    Set Selenium Implicit Wait  5s
    Close All Browsers

*** Keywords ***
Enter userid and password
    Input Text  name:email      vishakha4.g@gmail.com
    Input Text  name:password   Lambda123

Simulation of Action Chains
	sleep  5s
    Log    "Click on Test Logs"
    click element  //span[contains(.,'Issue Tracker')]
	sleep  5s
	Set Selenium Implicit Wait  5s