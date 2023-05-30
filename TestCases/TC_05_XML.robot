*** Settings ***
Library    XML
Library    os
Library    Collections

*** Test Cases ***
Testcase1:
    ${xml_obj}=     parse xml    D:/API_RobotFramework/xmldata.xml

    ${name_value}=      get element text     ${xml_obj}  .//name
    should be equal     ${name_value}     John

    ${street_value}=  get element text    ${xml_obj}  .//address/streetname
    should be equal    ${street_value}   xyz

    element text should be    ${xml_obj}    xyz     .//address/streetname

    ${street_number_value}=  get element text    ${xml_obj}  .//address/number/landline
    should be equal     ${street_number_value}     123

    ${type_value}=  get element text    ${xml_obj}  .//phoneNumber[1]/type
    should be equal    ${type_value}   home

#    element attribute should be     ${xml_obj}  name    John

    ${child_element}=  get child elements    ${xml_obj}  .//phoneNumber[1]/type
    should not be empty    ${child_element}   home