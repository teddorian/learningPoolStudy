*** Settings ***
Library   DatabaseLibrary
Resource  ../../admin/database.resource

*** Keywords ***
Connect
    Connect To Database    pymysql    ${DB_NAME}    ${DB_USERNAME}    ${DB_PASSWORD}    ${DB_HOST}    ${DB_PORT}
Disconnect
    Disconnect From Database
Make a group in Database
    [Arguments]    ${org_id}    ${name}    ${external_id}    ${description}    ${visibility}
    ${org_id}         Normalize Value    ${org_id}
    ${name}           Normalize Value    ${name}
    ${external_id}    Normalize Value    ${external_id}
    ${description}    Normalize Value    ${description}
    ${visibility}     Normalize Value    ${visibility}
    Connect
    Execute SQL string   ISERT INTO 'groups' ('org_id', 'name', 'external_id', 'description', 'visibility')
    ${id}     Get Id Of Last Inserted Item
    Disconnect
    [Return]    ${id}
Make a User in Database
    [Arguments]  ${org_id}    ${uuid}    ${username}    ${sso_id}    ${email}    ${password}    ${fname}    ${lname}    ${tag_line}    ${summary}
    ${org_id}        Normalize Value     ${org_id}
    ${uuid}          Normalize Value     ${uuid} 
    ${username}      Normalize Value     ${username}
    ${sso_id}        Normalize Value     ${sso_id}
    ${email}         Normalize Value     ${email}
    ${password}      Normalize Value     ${password}
    ${fname}         Normalize Value     ${fname}
    ${lname}         Normalize Value     ${lname}
    ${tag_line}      Normalize Value     ${tag_line}
    ${summary}       Normalize Value     ${summary}
    Connect
    Execute SQL string   ISERT INTO 'users' ('org_id', 'uuid', 'username', 'sso_id', 'email', 'password', 'fname', 'lname', 'tag_line', 'summary')
    ${id}     Get Id Of Last Inserted Item
    Disconnect
    [Return]    ${id}
Remove User From Database By Id
    [Arguments]  ${id}
    Connect
    Execute SQL string  DELETE FROM users WHERE id = ${id};
    Disconnect
    [Return]    ${id}