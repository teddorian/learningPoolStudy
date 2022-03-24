*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  properties.resource
Resource  database.resource

*** Keywords ***
#Data Base
Delete Badge in Database
    Connect To Database Using Custom Params  pymssql  ${DB_NAME} , ${DB_USERNAME}, ${DB_HOST}, ${DB_PASSWORD}, ${DB_PORT}
    Execute SQL String   DELETE FROM awards WHERE id = ${BADGE1_ID};
    Disconnect From Database
    

#Login to the site
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
#User's Profile
User Click View Your Profile In Profile Menu
    Wait until Element is visible   //button[@aria-label="John D User Menu"]
    Click Element   //button[@aria-label="John D User Menu"]                #open User's profile menu
    Click Element   //span[text()='View Your Profile']                      #User click View Your Profile link
User click “Achievements“ in Profile page
    Wait until Element is visible   //span[text()='Achievements']
    Click Element   //span[text()='Achievements']                           #User click Achivements link
    Wait until Element is visible  //span[text()='Badge2']
    Click Element   //span[text()='Badge2']                                 #User click Badge2 with complete Badge1 criteria
    Wait until Element is visible    //span[text()='Complete Badge `']      #Verify Badge2 sidebar opened
User Click Admin Link In Profile Menu  
    Click Element     //button[@aria-label="QA Super Admin User Menu"]      #open User's profile menu 
    Click Element     //span[text()='Admin']                                #User click Admin link
    Switch Window   NEW                                                     #swithch to the tab to continue test
#Admin pages
User Click Organisation Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
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
Open User Menu in Organisation
    Click Element   css: #settings-tab                                      #User click Settings link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users']       #User open User page
User Click Settings and Badge Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   css: #settings-tab                                      #User click Settings link
    Wait until Element is visible  xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']      #User click Badge link in menu

#Settings
User Click New User Profile in Services
   Click Element  //a[@href='https://qa.curatr3.com/admin/org/1/settings']
   Click Element  //a[@href='https://qa.curatr3.com/admin/qa/services']
   Click Element  //h2[contains(text(),'UI/UX')]
   Click Element  //input[@id='new_user_profile']
   Scroll Element Into View  //input[@value='Save']
   Click Element  //input[@value='Save']
   Click Element  //span[contains(text(),'Front End')]
   #Get Window Handles  @{WindowHandles}  
   #Switch Window  @{WindowHandles}

#Badges
User Make New Badge
    Wait until Element is visible  xpath: //a[@id="award-add-button"]
    Click Element   //a[@id="award-add-button"]                             #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge1                                      #User type in the Name filed
    Click Element  css: [type = "submit"]                                   #User click Submit button
    Wait until Element is visible  css: .type-select                         #wait User Must element select criteria for the badge
User Select Criteria
    Click Element  css:.type-select                                         #User select User Must criteria dropdown for the badge
    Click Element  css:.type-select [value =count]                          #User select Completion criteria
    Click Element  css:div.btn[style]                                       #User click tick icon to save criteria
    Wait until Element is visible  //input[@class='btn btn-primary pull-right'] 
User Make Badge Live   
    Click Element  //input[@class='btn btn-primary pull-right']             #User click Setings icon to make badge live
    Wait until Element is visible  //input[@value='1']
    Click Element  //input[@value='1']                                      #User click live radio button
    Click Element  //input[@value='Save']                                   #User click Save button
User Make Second Badge
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']      #User click Badge link in menu
    Wait until Element is visible  //a[@id="award-add-button"]
    Click Element   //a[@id="award-add-button"]                             #User click Add Badge buttom
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge2                                      #User type in the Name filed
    Click Element  css: [type = "submit"]                                   #User click Submit button
    Wait until Element is visible  //*[@id="type-select-undefined"]         #wait element select criteria for the badge
User Select Criteria for the Second Badge
    Click Element  //*[@id="type-select-undefined"]                         #User select criteria dropdown for the badge
    Click Element  css:.type-select [value =completion]                   
    Click Element  //option[@value='Award']                                 #User selrct Completion criteria with badge value
    Click Element  //*[@id="completion-model-select-undefined"]/option[4]   #User select Completion criteria with badge 1 value
    Click Element  css:div.btn[style]                                       #User click tick icon to save criteria
    Wait until Element is visible  //input[@class='btn btn-primary pull-right']  #Assert criteria saved and Badge page oppened
#Learning Expirience
User Click Org link and LXP Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Wait until Element is visible  css:#learning-activities-tab
    Click Element  css:#learning-activities-tab                             #User Click Learning Expirience menu

User Click New Learning Expirience button and make LX
    Click Element  css:#course-create-button                                #User Click New Learning Expirience button
    Wait until Element is visible  //a[@href='javascript:showCreateCourseForm(false)']
    Click Element  //a[@href='javascript:showCreateCourseForm(false)']      #User Confirm LX making
    Wait until Element is visible  //*[@id="name"]
    Input Text     //*[@id="name"]  testLX                                  #User type LX name
    Click Element  css:#visibility [value = 'public']                       #User choose visibility
    Click Element  //*[@type='submit']                                      #User click Submit button

#Playlists
User Click New Playlists Link
    Wait until Element is visible  //*[@id="goals-tab"]
    Click Element  //*[@id="goals-tab"]                                     #User Click Focus Areas tab
    Click Element  //span[contains(text(),'New Playlist')] 
User Makes Playlist
    Wait until Element is visible   //input[@name='name']
    Input Text  //input[@name='name']  1testPlaylist 
    Input Text  //textarea[@name='description']  1testDescription
    Scroll Element Into View  //input[@name='ordering']
    Input Text  //input[@name='ordering']  1
    Click Element   //button[@type='submit']
User Assigns Multiple LX to Playlist
    Wait until Element is visible  //td[contains(text(),'1testPlaylist')]
    Click Element  //td[contains(text(),'1testPlaylist')]
User Click Assign Learning Experiences and Choose Multiple LXs to Assign
    Wait until Element is visible  //span[contains(text(),'Assign Learning Experiences')]
    Click Element  //span[contains(text(),'Assign Learning Experiences')]
    Wait until Element is visible  //span[contains(text(),'Multi Level - Multi Object')]
    Click Element  //span[contains(text(),'Multi Level - Multi Object')]
    Click Element  //span[contains(text(),'Rapids')]
    Click Element  //span[contains(text(),'Submit')]
Verify LXs were added to Playlist 
    Page Should Contain Element  //span[contains(text(),'Multi Level - Multi Object')]
    
#Groups
User Click Groups Link 
    Wait until Element is visible  //li[@id='groups-tab']
    Click Element   //li[@id='groups-tab']
User Add New Group
    Wait until Element is visible  //a[@id='group-add-button']
    Click Element   //a[@id='group-add-button']
    Wait until Element is visible  //input[@id='name']
    Input Text      //input[@id='name']   1testGroupe
    Click Element   //button[@type='submit']
User Open Group That Was Added
    Wait until Element is visible  //a[contains(text(),'1testGroupe')]
    Click Element  //a[contains(text(),'1testGroupe')]
User Click Dynamic Group Link
    Wait until Element is visible  //a[contains(text(),'auto')]
    Click Element  //a[contains(text(),'auto')]
    Click Element  //a[@href="https://qa.curatr3.com/admin/qa/groups/23/rule-sets"]
User Checks Boxes in Settings
    Wait until Element is visible  //span[contains(text(),'Add members who meet the published Rule Sets criteria')]
    Click Element  //span[contains(text(),'Add members who meet the published Rule Sets criteria')]
    Click Element  //span[contains(text(),'Remove members who do not meet the published Rule Sets criteria')]