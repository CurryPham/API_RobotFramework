*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

*** Variables ***
${base_url}=    http://restapi.demoqa.com
${bearer_token}=   "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BeaberAuthTest
    create session    mysession     ${base_url}
    ${header}=    create dictionary     Authorization=${bearer_token}   Content-Type=text/xml
    ${req_body}=    get file    D:/API_RobotFramework/PostData.txt

    ${response}=    POST On Session     mysession   /    data=${req_body}    headers=${header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    should be equal as strings    ${response.status_code}   200
