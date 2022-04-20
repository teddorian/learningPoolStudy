*** Settings ***
Library  SeleniumLibrary
Resource  ../../admin/properties.resource 
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests

*** Test Cases ***
TC1 "Verify User Can Make New LX
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Org link and LXP Link
    User Click New Learning Expirience button and make LX
*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome

Teardown Steps After All Tests
    Close All Browsers