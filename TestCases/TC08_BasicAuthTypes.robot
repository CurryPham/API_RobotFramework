*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}=    http://restapi.demoqa.com

*** Test Cases ***
BasicAuthTest
    ${auth}=    create list    ToolsQA      TestPassword
    create session    mysession     ${base_url}     auth=${auth}
    ${response}=    GET On Session     mysession   /authentication/CheckForAuthentication/
    log to console    ${response.content}
    should be equal as strings    ${response.status_code}   200
