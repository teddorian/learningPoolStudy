*** Settings ***
Library  SeleniumLibrary
Resource  ../../admin/properties.resource 
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests

*** Test Cases ***
TC1 Verify User Can Enable new "My Profile" page
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Organisation Link
    User Click New User Profile in Services

*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome

Teardown Steps After All Tests
    Close All Browsers