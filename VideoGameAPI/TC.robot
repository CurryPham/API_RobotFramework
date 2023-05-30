*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}     http://localhost:8080/

*** Test Cases ***
TC1:Return all the videos games(GET)
    create session  mysession   ${base_url}
    ${response}=    get request    mysession    /app/videogames
    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

TC2:Add a new video game (POST)
    create session  mysession   ${base_url}
    ${body}=    create dictionary    id=100 name=Spider-Man releaseDate=2023-05-30T06:29:11.419Z    reviewScore=5   category=Adventure rating=Universal
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    post request    mysession   app/videogames data=${body}    header=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200
#
    ${res_body}=    convert to string   ${response.content}
    should contain    ${res_body}   Record Added Successfully

TC3:Return the details of a single game by ID(GET)
    create session  mysession   ${base_url}
    ${response}=    get request    mysession    app/videogames/100
    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200
#
    ${res_body}=    convert to string   ${response.content}
    should contain    ${res_body}   Spider-Man      #Name of the game

TC2:Update an existing video gmae by specifying a new body (PUT)
    create session  mysession   ${base_url}
    ${body}=    create dictionary    id=100 name=PacMan releaseDate=2023-05-30T06:29:11.419Z    reviewScore=5   category=Adventure rating=Universal
    ${header}=  create dictionary    Content-Type=application/json
    ${response}=    put request    mysession   app/videogames data=${body}    header=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200
#
    ${res_body}=    convert to string   ${response.content}
    should contain    ${res_body}   PacMan

TC5: Delete a video game by ID (DELETE)
    [Tags]    Test
    create session  mysession   ${base_url}
    ${response}=    delete request    mysession    app/videogames/100

    #VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200
    ${res_body}=    convert to string   ${response.content}
    should contain    ${res_body}   Record Deleted Successfully