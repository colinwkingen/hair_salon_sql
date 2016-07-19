## Astro Salon

#### By Colin Kingen, 2016


## Description

This is a project that uses a database to explore one to many information
relationships. It allows a user, presumably a salon employeee, to alter
the stylists and clients present and assign clients to stylists. All persistent
data is stored in postgresql databases.


## Setup/Installation Requirements

To recreate the database necessary for this app, in postgresql do:

postgres=# CREATE DATABASE hair_salon;
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);


This app is viewable at: https://github.com/colinwkingen/hair_salon_sql

To install this repository into a new project each time, first

* Clone the github repository using the git clone command from /Desktop
* Create a new folder in the Desktop with your project name

## Known Bugs

No currently known bugs.

## Support and contact details

Contact me on github if you have any questions.

## Technologies Used

* HTML
* Sinatra
* Ruby
* postgreSQL


### License

Licensed under the MIT License

Copyright (c) 2016 **Colin W Kingen**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
