*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  ../../admin/properties.resource 
Resource  ../../admin/database.resource
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests
Documentation  This Test Suite for the ticket https://learningpool.atlassian.net/browse/LXP-4176

*** Test Cases ***
TC1 "Verify User Can Make New Live Badge with Complete course criteria"
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Settings and Badge Link
    User Make New Badge
    User Select Criteria
    User Make Badge Live
TC2 "Verify User Can Make Second Live Badge with Complete Badge criteria"
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Settings and Badge Link 
    User Make Second Badge
    User Select Criteria for the Second Badge
    User Make Badge Live
TC3 "Admin Make New User"
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    Open User Menu in Organisation
    User Add New User
TC4 "Verify User Can Open Badge with Complete Badge criteria page in Profile-Achievements"
    User Login With non-admin Credentials
    User Click View Your Profile In Profile Menu
    User click “Achievements“ in Profile page

*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome

Teardown Steps After All Tests
    ##Delete Badge in Database
    Close All Browsers
    
    
    