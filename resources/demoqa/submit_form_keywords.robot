*** Settings ***
Library    SeleniumLibrary
Resource    resources/Globalsettings.robot

*** Keywords ***
Navigate To Text Box Page
    Go To    ${TEXT_BOX_PAGE}
    Maximize Browser Window
    Wait Until Page Contains Element    ${TEXT_BOX_PAGE_TITLE}    timeout=10s
    Capture Page Screenshot    screenshots/demoqasubmitform/navigate_to_textbox_page.png
    

Submit The Form
    [Arguments]    ${USER_TEXT_VALUE}    ${USER_EMAIL_VALUE}    ${CURRENT_ADDRESS_VALUE}    ${PERMANENT_ADDRESS_VALUE}
    Navigate To Text Box Page
    Input Text    ${USER_TEXT_FIELD}    ${USER_TEXT_VALUE}        
    Input Text    ${USER_EMAIL_FIELD}    ${USER_EMAIL_VALUE}            
    Input Text    ${CURRENT_ADDRESS_FIELD}        ${CURRENT_ADDRESS_VALUE}
    Input Text    ${PERMANENT_ADDRESS_FIELD}    ${PERMANENT_ADDRESS_VALUE}
    Clear Element Text    ${PERMANENT_ADDRESS_FIELD}
    Input Text    ${PERMANENT_ADDRESS_FIELD}    ${PERMANENT_ADDRESS_VALUE}
    Get Text    ${USER_EMAIL_FIELD}
    Scroll Element Into View    ${SUBMIT_BTN}            
    Click Button    ${SUBMIT_BTN}
    Wait Until Element Is Visible    ${OUTPUT_CSS}    timeout=10s
    Element Should Contain    ${NAME_OUTPUT}    ${USER_TEXT_VALUE}
    Element Should Contain    ${EMAIL_OUTPUT}    ${USER_EMAIL_VALUE}
    Element Should Contain    ${CURRENT_ADDRESS_OUTPUT}    ${CURRENT_ADDRESS_VALUE}
    Element Should Contain    ${PERMANENT_ADDRESS_OUTPUT}    ${PERMANENT_ADDRESS_VALUE}    
    Scroll Element Into View    ${PERMANENT_ADDRESS_OUTPUT}
    Capture Page Screenshot    screenshots/demoqasubmitform/submit_the_form.png
