*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Test Cases ***
Testcase1:
    ${json_obj}=     load json from file    D:/API_RobotFramework/jsondata.json

    ${name_value}=  get value from json    ${json_obj}  $.name
    should be equal     ${name_value[0]}     John

    ${street_value}=  get value from json    ${json_obj}  $.address.streetname
    should be equal    ${street_value[0]}   xyz

    ${street_number_value}=  get value from json    ${json_obj}  $.address.number.landline
    should be equal     ${street_number_value[0]}     123

    ${type_value}=  get value from json    ${json_obj}  $.phoneNumber[0].type
    should be equal    ${type_value[0]}   home