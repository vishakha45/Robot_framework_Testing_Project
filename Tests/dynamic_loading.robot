*** Settings ***
Library  Selenium2Library

Test Setup      Open test browser
Test Teardown   Close test browser

*** Variables ***

@{_tmp}
    ...  browserName: ${browserName},
    ...  platform: ${platform},
    ...  version: ${version},
    ...  visual: ${visual},
    ...  network: ${network},
    ...  console: ${console},
    ...  name: Handling Dynamic Content with Robot Framework [with click on Login Button]

${BROWSER}          ${ROBOT_BROWSER}
${CAPABILITIES}     ${EMPTY.join(${_tmp})}
# Visit https://accounts.lambdatest.com/profile to get the details
${KEY}              vishakha4.g:R9JIgOQLWHSbUEdebGrq4K4GX1gJJ2pRkWiKZdr4pZcwmA9iBM
${REMOTE_URL}       http://${KEY}@hub.lambdatest.com/wd/hub

*** Keywords ***

Open test browser
    Log  Open the URL in Browser
    Open browser  https://lambdatest.com  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Close all browsers

*** Test Cases ***

Dynamic loading of content
    wait until page contains   Free Sign Up
    set selenium implicit wait  10
    Log    "Home Button is loaded"
    wait until page contains   Log in
    set selenium implicit wait  10
    Log    "Login Button is loaded"
    Log    "Click on the Login Button"
    click element  xpath=//a[.='Log in']