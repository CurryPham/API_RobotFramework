*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}=    https://maps.googleapis.com/
${req_url}=   /maps/api/place/nearbysearch/json

*** Test Cases ***
BeaberAuthTest
    create session    mysession     ${base_url}
    ${param}=    create dictionary     location=-33.8670522,151.1957362     radius=500      types=food      name=harbour    key=YOUR_API_KEY

    ${response}=    GET    On Session     mysession   ${req_url}    params=${param}
    log to console    ${response.status_code}
    log to console    ${response.content}
    should be equal as strings    ${response.status_code}   200
