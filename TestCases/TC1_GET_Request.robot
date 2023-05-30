*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://dummyjson.com
${city}     Delhi

*** Test Cases ***
Get_WeatherInfo
    create session    myssion   ${base_url}
    ${response}=    GET On Session     myssion     /products
#    log to console    ${response.status_code}
#    log to console    ${response.content}
#    log to console    ${response.headers}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}   /products

#    ${contentTypeValue}=    get from dictionary ${response.headers}     ContentType
#    should be equal    ${contentTypeValue}  application/json