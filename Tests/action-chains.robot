*** Settings ***
Library  Selenium2Library

Test Setup      Open test browser
Test Teardown   Close All browsers

*** Variables ***

@{_tmp}
    ...  browserName: ${browserName},
    ...  platform: ${platform},
    ...  version: ${version},
    ...  visual: ${visual},
    ...  network: ${network},
    ...  console: ${console},
    ...  name: [Python] Action Chains with Robot Framework [with click on Automation Button]

${BROWSER}          ${ROBOT_BROWSER}
${CAPABILITIES}     ${EMPTY.join(${_tmp})}
# Visit https://accounts.lambdatest.com/profile to get the details
${KEY}              vishakha4.g:R9JIgOQLWHSbUEdebGrq4K4GX1gJJ2pRkWiKZdr4pZcwmA9iBM

${REMOTE_URL}       https://${KEY}@hub.lambdatest.com/wd/hub

#Lambdatest URL details
${LT_URL}           https://accounts.lambdatest.com/login
${user_id}          name:email
${password}         name:password

${lt_username}			vishakha4.g@gmail.com
${lt_password}			Lambda123

*** Keywords ***

Open test browser
    Log  Open the URL in Browser
    Open browser  https://accounts.lambdatest.com/login  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}
	Maximize Browser Window

*** Test Cases ***

Login on Lambdatest
    Wait Until Element Is Visible  ${user_id}
    Wait Until Element Is Visible  ${password}
    Input Text      ${user_id}     ${lt_username}
    Input Text      ${password}    ${lt_password}
    Submit Form
    Set Selenium Implicit Wait  5s
	sleep  5s
    Log    "Click on Automation button"
    click element  xpath=//*[@id="header"]/div[2]/div[5]
	sleep  5s
	Set Selenium Implicit Wait  5s