# _Ruby Volunteer_

#### _Volunteer Tracking App, 5.5.2017_

#### By _**Starlynne Start**_

## Description

_This is a volunteer and project tracking app designed to allow a user to add/delete/modify volunteer projects, and add/delete volunteers on a project utilizing psql. Created for Epicodus Ruby databases solo project._

## Setup/Installation Requirements

_You will need a psql database and Ruby to use this app._
* _clone this repository to desktop_
_Database set-up:_
* _CREATE DATABASE volunteer_tracker_
* _CREATE TABLE projects (id serial PRIMARY KEY, name varchar, description text)_
* _CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, skill varchar, project_id int)_
_Ruby_
* _you will need the gems required in the Gemfile within this repository_
* _use command line to install needed gems_
_Running the app_
* _run ruby app.rb in the command line_
* _visit localhost:4567 in your browser_

## Known Bugs

_Certain words entered into the project description field can cause errors (help, make)_

## Specs

 _See spec file_

## Support and contact details

_Comment, concerns or suggestions welcome! lewis.start0905@gmail.com_

## Technologies Used

_HTML, CSS, Bootstrap, Ruby, PSQL_

### License

*MIT*

Copyright (c) 2017 **_Starlynne Start_**
