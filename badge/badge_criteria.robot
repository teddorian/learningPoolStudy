*** Settings ***
Library  SeleniumLibrary
Resource  properties.resource
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

Open User Menu in Organisation
    Click Element   css: #settings-tab                               #User click Settings link
    Wait until Element is visible  xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users']   #User open User page
User Add New User
    Wait until Element is visible  css:#page-title > div > div:nth-child(2) > div > a:nth-child(3)
    Click Element  css:#page-title > div > div:nth-child(2) > div > a:nth-child(3)   #User click Add User button
    Wait until Element is visible   css:[placeholder = "Username"]
    Input Text   css:[placeholder = "Username"]  ${USER} 
    Input Text   css:#email                      ${USER} 
    Input Text   css:[placeholder = "Password"]  ${USER_PASSWORD}
    Input Text   css:#password_confirmation  ${USER_PASSWORD}
    Input Text   css:#fname                  John
    Input Text   css:#lname                  D
    Wait until Element is visible  //*[@id="user-form"]/div/div[6]/div/button
    Click Element  //*[@id="user-form"]/div/div[6]/div/button  #User Submit new user   
User Login With Admin Credentials   
    Input Text   id=username-input     ${ADMIN_USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  css:#NavBar_Search
User Login With non-admin Credentials  
    Input Text   id=username-input     ${USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  css:#NavBar_Search
User Click View Your Profile In Profile Menu
    Wait until Element is visible   //*[@id="NavBar"]/div/div[3]/div/button/img
    Click Element   //*[@id="NavBar"]/div/div[3]/div/button/img      #open User's profile menu
    Click Element   css:#NavBar_UserMenuContainer_ListItem_profile   #User click View Your Profile link
    Wait until Element is visible   //*[@id="app-root"]/div[2]/div/section[2]/div[1]/div/div/div/button[2]/span[1]
    Click Element   //*[@id="app-root"]/div[2]/div/section[2]/div[1]/div/div/div/button[2]/span[1]  #User click Achievements link
User click “Achievements“ in Profile page
    Click Element   //*[@id="app-root"]/div[2]/div/section[2]/div[1]/div/div/div/button[2]/span[1]  #User click Achivements link
    Click Element   //*[@id="app-root"]/div[2]/div/section[2]/div[3]/button[1]/span[1]              #User click Badge2 with complete Badge1 criteria
    Wait until Element is visible   css:.sc-pzYib cVYBFK                                            #Verify Badge2 sidebar opened 
User Click Admin Link In Profile Menu 
    Click Element   css: [aria-label = "QA Super Admin User Menu"]   #open User's profile menu 
    Click Element    //*[@id="NavBar_UserMenuContainer_ListItem_admin"]  #User click Admin link
    Switch Window   NEW                                              #swithch to the tab to continue test
User Click Settings and Badge Link 
    Click Element   css: #settings-tab                               #User click Settings link
    Wait until Element is visible  xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element   xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   #User click Badge link in menu
User Make New Badge
    Wait until Element is visible  xpath: //a[@id="award-add-button"]
    Click Element   xpath: //a[@id="award-add-button"]               #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge1                               #User type in the Name filed
    Click Element  css: [type = "submit"]                            #User click Submit button
    Wait until Element is visible  //*[@id="type-select-undefined"]  #wait element select criteria for the badge
User Select Criteria
    Click Element  //*[@id="type-select-undefined"]                  #User select criteria dropdown for the badge
    Click Element  css:.type-select [value =completion]              #User select Completion criteria
    Click Element  css:[style="display: inline-block;"]              #User click tick icon to save criteria
    Wait until Element is visible  //*[@id="page-title"]/div/div[2]/h2/span[1]/a   
User Make Badge Live   
    Click Element  //*[@id="page-title"]/div/div[2]/h2/span[1]/a     #User click Setings icon to make badge live
    Wait until Element is visible  //*[@id="award-form"]/div/div[3]/div[2]/div/div/label[2]/input
    Click Element  //*[@id="award-form"]/div/div[3]/div[2]/div/div/label[2]/input   #User click live radio button
    Click Element  //*[@id="award-form"]/div/div[4]/div/input        #User click Save button
User Make Second Badge
    Click Element   xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']  #User click Badge link in menu
    Wait until Element is visible  xpath: //a[@id="award-add-button"]
    Click Element   xpath: //a[@id="award-add-button"]               #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge2                               #User type in the Name filed
    Click Element  css: [type = "submit"]                            #User click Submit button
    Wait until Element is visible  //*[@id="type-select-undefined"]  #wait element select criteria for the badge
User Select Criteria for the Second Badge
    Click Element  //*[@id="type-select-undefined"]                  #User select criteria dropdown for the badge
    Click Element  css:.type-select [value =completion]                   
    Click Element  //*[@id="sets-cont"]/div/div/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div/select/option[3]   #User selrct Completion criteria with badge value
    Click Element  //*[@id="completion-model-select-undefined"]/option[4]   #User select Completion criteria with badge 1 value
    Click Element  css:[style="display: inline-block;"]                     #User click tick icon to save criteria
    Wait until Element is visible  //*[@id="page-title"]/div/div[2]/h2/span[1]/a 

Teardown Steps After All Tests
    Close All Browsers