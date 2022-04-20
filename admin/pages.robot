*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary
Resource  properties.resource

*** Variables ***
${DYNAMIC_RULES_GROUP_MEMBERS_LINK} =       xpath://h2/a
*** Keywords ***
#Login to the site
User Login With Admin Credentials   
    Input Text   id=username-input     ${ADMIN_USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  //div[@id='NavBar_Search']               
User Login With non-admin Credentials  
    Input Text   id=username-input     ${USER} 
    Input Text   id=password-input     ${USER_PASSWORD}
    Click Element   css:.control-group [value="Login"]
    Wait until Element is visible  //div[@id='NavBar_Search']               
#User's Profile
User Click View Your Profile In Profile Menu
    Wait until Element is visible   //button[@aria-label="John D User Menu"]
    Click Element   //button[@aria-label="John D User Menu"]                
    Click Element   //span[text()='View Your Profile']                      
User click “Achievements“ in Profile page
    Wait until Element is visible   //span[text()='Achievements']
    Click Element   //span[text()='Achievements']                           
    Wait until Element is visible  //span[text()='Badge2']
    Click Element   //span[text()='Badge2']                                 
    Wait until Element is visible    //span[text()='Complete Badge `']      
User Click Admin Link In Profile Menu  
    Click Element     //button[@aria-label="QA Super Admin User Menu"]       
    Click Element     //span[text()='Admin']                                
    Switch Window   NEW                                                     
#Admin pages
User Click Organisation Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
User Add New User
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/users/add']
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users/add']   
    Wait until Element is visible   css:[placeholder = "Username"]
    Input Text   css:[placeholder = "Username"]  ${USER} 
    Input Text   css:#email                      ${USER} 
    Input Text   css:[placeholder = "Password"]  ${USER_PASSWORD}
    Input Text   css:#password_confirmation  ${USER_PASSWORD}
    Input Text   css:#fname                  John
    Input Text   css:#lname                  D
    Wait until Element is visible  //button[@type='submit']
    Click Element  //button[@type='submit']                                    
Open User Menu in Organisation
    Click Element   css: #settings-tab                                      
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/users']       
User Click Settings and Badge Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   css: #settings-tab                                      
    Wait until Element is visible  xpath: //a[@href='https://qa.curatr3.com/admin/qa/award']   
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']      

#Settings
User Click New User Profile in Services
   Click Element  //a[@href='https://qa.curatr3.com/admin/org/1/settings']
   Click Element  //a[@href='https://qa.curatr3.com/admin/qa/services']
   Click Element  //h2[contains(text(),'UI/UX')]
   Click Element  //input[@id='new_user_profile']
   Scroll Element Into View  //input[@value='Save']
   Click Element  //input[@value='Save']
   Click Element  //span[contains(text(),'Front End')]
User Enable Dynamic Groups in Services
   Click Element  //a[@href='https://qa.curatr3.com/admin/org/1/settings']
   Click Element  //a[@href='https://qa.curatr3.com/admin/qa/services']
   Click Element  //h2[contains(text(),'Beta Features')]
   Click Element  //input[@id='TOGGLE_DYNAMIC_GROUPS']
   Click Element  //input[@value='Save']

#Badges
User Make New Badge
    Wait until Element is visible  xpath: //a[@id="award-add-button"]
    Click Element   //a[@id="award-add-button"]                             
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge1                                      
    Click Element  css: [type = "submit"]                                   
    Wait until Element is visible  css: .type-select                         
User Select Criteria
    Click Element  css:.type-select                                          
    Click Element  //option[@value='completion']                            
    Click Element  //div[contains(text(),'Save')]                           
    Wait until Element is visible  //input[@class='btn btn-primary pull-right'] 
User Make Badge Live   
    Click Element  //input[@class='btn btn-primary pull-right']             
    Wait until Element is visible  //input[@value='1']
    Click Element  //input[@value='1']                                     
    Click Element  //input[@value='Save']                                  
User Make Second Badge
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/award']      
    Wait until Element is visible  //a[@id="award-add-button"]
    Click Element   //a[@id="award-add-button"]                             
    Wait until Element is visible  name:name                       
    Input Text      name:name   Badge2                                      
    Click Element  css: [type = "submit"]                                   
    Wait until Element is visible  //*[@id="type-select-undefined"]         
User Select Criteria for the Second Badge
    Click Element  //*[@id="type-select-undefined"]                         
    Click Element  css:.type-select [value =completion]                   
    Click Element  //option[@value='Award']                                 
    Click Element  //*[@id="completion-model-select-undefined"]/option[4]   
    Click Element  css:div.btn[style]                                       
    Wait until Element is visible  //input[@class='btn btn-primary pull-right']  
#Learning Expirience
User Click Org link and LXP Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Click Element   //a[@href='https://qa.curatr3.com/admin/qa/dashboard']
    Wait until Element is visible  css:#learning-activities-tab
    Click Element  css:#learning-activities-tab                             

User Click New Learning Expirience button and make LX
    Click Element  css:#course-create-button                                
    Wait until Element is visible  //a[@href='javascript:showCreateCourseForm(false)']
    Click Element  //a[@href='javascript:showCreateCourseForm(false)']      
    Wait until Element is visible  //*[@id="name"]
    Input Text     //*[@id="name"]  testLX                                  
    Click Element  css:#visibility [value = 'public']                       
    Click Element  //*[@type='submit']     
User Add Object to LX
    Click Element  //a[@id='object-create-button']
    Click Element  //a[@title='Choose from Library']      
    Wait until Element is visible  //span[contains(text(),'Rapids Content')]    
    Click Element  //span[contains(text(),'Rapids Content')]
    Wait until Element is visible  //span[contains(text(),'Choose')]
    Click Element  //span[contains(text(),'Choose')]     
Assert User can search for new LX
    Click Element  //span[contains(text(),'Front End')] 
    Switch Window   NEW  
    Wait until Element is visible  //input[@id='searchButton']
    Input Text  //input[@id='searchButton']  testLX
    Wait until Element is visible  //span[contains(text(), 'testLX')]    

#Playlists
User Click New Playlists Link
    Wait until Element is visible  //*[@id="goals-tab"]
    Click Element  //*[@id="goals-tab"]                                     
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
User Click Dynamic Rules Link
    Wait until Element is visible  //a[@href='https://qa.curatr3.com/admin/qa/groups/23/overview']
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/groups/23/overview']
    Click Element  //a[@href='https://qa.curatr3.com/admin/qa/groups/23/rule-sets']

User Checks Boxes in Settings
    Wait until Element is visible  //span[contains(text(),'Add members who meet the published Rule Sets criteria')]
    Click Element  //span[contains(text(),'Add members who meet the published Rule Sets criteria')]
    Click Element  //span[contains(text(),'Remove members who do not meet the published Rule Sets criteria')]
User Click Start Adding Rule Sets
    Click Element  //span[contains(text(),'Start adding Rule Sets')]
User Click Add and Publish Rule
    Wait until Element is visible  //span[./text()="Add Rule"]
    Click Element  //span[./text()="Add Rule"]
    Wait until Element is visible  //input[@id='criteria_value-0']
    Click Element  //input[@id='criteria_value-0'] 
    Wait until Element is visible  //li[contains(text(),'Alarm Code')]
    Scroll Element Into View  //li[contains(text(),'Email Address')]
    Click Element  //li[contains(text(),'Email Address')]
    Wait until Element is visible  //div[@aria-haspopup='listbox']
    Click Element  //div[@aria-haspopup='listbox']
    Click Element  //span[contains(text(),'Is empty')]
    Click Element  //span[contains(text(),'Save')]
    Click Element  //span[contains(text(),'Publish Rules')]
    Click Element  //div[@role='dialog']//span[text()='Publish Rules']

