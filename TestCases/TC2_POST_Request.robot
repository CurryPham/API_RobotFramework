*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://dummyjson.com/products
${city}     Delhi

*** Test Cases ***
Get_WeatherInfo
    create session    mysession   ${base_url}
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    POST On Session    mysession   /add    headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${res_body}=    convert to string    ${response.content}
    should contain    ${res_body}   101