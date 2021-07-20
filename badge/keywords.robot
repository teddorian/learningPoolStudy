*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  properties.resource
Resource  database.resource

*** Keywords ***
Open User Menu in Organisation
    Click Element   css: #settings-tab                                     #User click Settings link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users']      #User open User page
User Add New User
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/users/add']
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users/add']   #User click Add User button
    Wait until Element is visible   css:[placeholder = "Username"]
    Input Text   css:[placeholder = "Username"]  ${USER} 
    Input Text   css:#email                      ${USER} 
    Input Text   css:[placeholder = "Password"]  ${USER_PASSWORD}
    Input Text   css:#password_confirmation  ${USER_PASSWORD}
    Input Text   css:#fname                  John
    Input Text   css:#lname                  D
    Wait until Element is visible  //button[@type='submit']
    Click Element  //button[@type='submit']                                 #User Submit new user   
User Login With Admin Credentials   
    Input Text   id=username-input     ${ADMIN_USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  //div[@id='NavBar_Search']               #Assert Page opened
User Login With non-admin Credentials  
    Input Text   id=username-input     ${USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  //div[@id='NavBar_Search']               #Assert Page opened
User Click View Your Profile In Profile Menu
    Wait until Element is visible   //button[@aria-label="John D User Menu"]
    Click Element   //button[@aria-label="John D User Menu"]                #open User's profile menu
    Click Element   //span[text()='View Your Profile']                      #User click View Your Profile link
User click “Achievements“ in Profile page
    Wait until Element is visible   //span[text()='Achievements']
    Click Element   //span[text()='Achievements']                         #User click Achivements link
    Click Element   //p[text()='Badge2']                                  #User click Badge2 with complete Badge1 criteria
    Wait until Element is visible    //span[text()='Complete Badge `']    #Verify Badge2 sidebar opened 
User Click Admin Link In Profile Menu  
    Click Element     //button[@aria-label="QA Super Admin User Menu"]    #open User's profile menu 
    Click Element     //span[text()='Admin']                              #User click Admin link
    Switch Window   NEW                                                   #swithch to the tab to continue test
User Click Settings and Badge Link 
    Click Element   css: #settings-tab                                    #User click Settings link
    Wait until Element is visible  xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']    #User click Badge link in menu
User Make New Badge
    Wait until Element is visible  xpath: //a[@id="award-add-button"]
    Click Element   //a[@id="award-add-button"]                           #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge1                                    #User type in the Name filed
    Click Element  css: [type = "submit"]                                 #User click Submit button
    Wait until Element is visible  //*[@id="type-select-undefined"]       #wait User Must element select criteria for the badge
User Select Criteria
    Click Element  //*[@id="type-select-undefined"]                       #User select User Must criteria dropdown for the badge
    Click Element  css:.type-select [value =completion]                   #User select Completion criteria
    Click Element  css:[style="display: inline-block;"]                   #User click tick icon to save criteria
    Wait until Element is visible  //a[@class='pull-right'] 
User Make Badge Live   
    Click Element  //a[@class='pull-right']                               #User click Setings icon to make badge live
    Wait until Element is visible  //input[@value='1']
    Click Element  //input[@value='1']                                    #User click live radio button
    Click Element  //input[@value='Save']                                 #User click Save button
User Make Second Badge
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']    #User click Badge link in menu
    Wait until Element is visible  //a[@id="award-add-button"]
    Click Element   xpath: //a[@id="award-add-button"]                    #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge2                                    #User type in the Name filed
    Click Element  css: [type = "submit"]                                 #User click Submit button
    Wait until Element is visible  //*[@id="type-select-undefined"]       #wait element select criteria for the badge
User Select Criteria for the Second Badge
    Click Element  //*[@id="type-select-undefined"]                       #User select criteria dropdown for the badge
    Click Element  css:.type-select [value =completion]                   
    Click Element  //option[@value='Award']                               #User selrct Completion criteria with badge value
    Click Element  //*[@id="completion-model-select-undefined"]/option[4]   #User select Completion criteria with badge 1 value
    Click Element  css:[style="display: inline-block;"]                     #User click tick icon to save criteria
    Wait until Element is visible  //a[@class='pull-right']                 #Assert criteria saved and Badge page oppened
Remove User
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USERNAME}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
    Execute SQL string  DELETE FROM users WHERE id = ${USER_id};