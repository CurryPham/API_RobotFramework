*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
    create session    mysession     ${base_url}
    ${response}=    get request    mysession    /photos

    #Log to console ${response.headers}

    ${contentTypeValue}=    get from dictionary     ${response.headers}  Content-Type
    should be equal    ${contentTypeValue}      application/json; charset=utf-8

    ${contentEncpdeValue}=  get from dictionary     ${response.headers}  Content-Encoding
    should be equal     ${contentEncpdeValue}   gzip

#TestCookies
#    create session  mysession   ${base_url}
#    ${response}=    get request    mysession    /photos
#
#    log to console  ${response.cookies}
#    ${response}=    get from dictionary    ${response.cookies}  __cfuid