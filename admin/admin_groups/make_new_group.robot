*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  ../../admin/properties.resource
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests

*** Test Cases ***
TC1 User Makes New Group
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Organisation Link
    User Click Groups Link
    User Add New Group
    User Open Group That Was Added

*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome
Teardown Steps After All Tests
    Close All Browsers