*** Settings ***
Library  Selenium2Library
Library  LambdaTestStatus.py

*** Variables ***

@{_tmp}
    ...  browserName: ${browserName},
    ...  platform: ${platform},
    ...  version: ${version},
    ...  visual: ${visual},
    ...  network: ${network},
    ...  console: ${console},
    ...  name: Vishakha_Test_1


${BROWSER}          ${ROBOT_BROWSER}
${CAPABILITIES}     ${EMPTY.join(${_tmp})}
#${chromedriver}     E:\vishakha\fall2020\542\driver\chromedriver.exe
${REMOTE_URL}       http://vishakha4.g:R9JIgOQLWHSbUEdebGrq4K4GX1gJJ2pRkWiKZdr4pZcwmA9iBM@hub.lambdatest.com/wd/hub
${TIMEOUT}          3000

*** Keywords ***

Open test browser
    [Timeout]   ${TIMEOUT}
    Open browser  https://lambdatest.github.io/sample-todo-app/  browser=${BROWSER}
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${CAPABILITIES}

Close test browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    Close all browsers