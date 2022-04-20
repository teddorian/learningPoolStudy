*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  ../../admin/properties.resource
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests

*** Test Cases ***
TC1 User Add Dynamic Rule
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Organisation Link
    User Enable Dynamic Groups in Services
    User Click Groups Link
    User Click Dynamic Rules Link
    User Checks Boxes in Settings
    User Click Start Adding Rule Sets
    User Click Add and Publish Rule

*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome
Teardown Steps After All Tests
    Close All Browsers