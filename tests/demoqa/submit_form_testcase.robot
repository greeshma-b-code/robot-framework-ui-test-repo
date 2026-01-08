*** Settings ***
Documentation    Test case to verify text box interactions on DemoQA site
Library    SeleniumLibrary
Library    DataDriver    data/demoqa/demoqa_submit_form_data.xlsx    sheet_name=TestData    
Resource    resources/Globalsettings.robot
Test Template    Text Box Interactions    
Test Setup    Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close All Browsers

        
*** Test Cases ***
Text Box Interactions
    [Tags]    demoqa    textbox    smoke


*** Keywords ***
Text Box Interactions
    [Arguments]    ${USER_TEXT_VALUE}    ${USER_EMAIL_VALUE}    ${CURRENT_ADDRESS_VALUE}    ${PERMANENT_ADDRESS_VALUE}
    Submit The Form    ${USER_TEXT_VALUE}    ${USER_EMAIL_VALUE}    ${CURRENT_ADDRESS_VALUE}    ${PERMANENT_ADDRESS_VALUE}

