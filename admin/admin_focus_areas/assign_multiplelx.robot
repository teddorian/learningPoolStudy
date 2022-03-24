*** Settings ***
Library  SeleniumLibrary 
Resource  ../../admin/properties.resource 
Resource  ../../admin/pages.robot
Test Setup  Precondition Steps Before Each Test
Test Teardown  Teardown Steps After All Tests
Documentation  This Test Suite for the ticket https://learningpool.atlassian.net/browse/LXP-4552

*** Test Cases ***
TC1 Verify User Can Assign Multiple LX to Playlist
    User Login With Admin Credentials
    User Click Admin Link In Profile Menu
    User Click Organisation Link
    User Click New Playlists Link
    User Makes Playlist
    User Assigns Multiple LX to Playlist
    User Click Assign Learning Experiences and Choose Multiple LXs to Assign
    Verify LXs were added to Playlist
*** Keywords ***
Precondition Steps Before Each Test
    Open browser    ${BASE_URL}   chrome

Teardown Steps After All Tests
    Close All Browsers