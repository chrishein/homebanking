Homebanking
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Simple homebanking / account balance web interface for clients. Allows admins to create Clients with multiple Users, each Client can have more than one Account.

Admin users can create and modify individual account movements or import Excel/CSV files with pre-defined columns to import multiple movements.

Users can download account movement details into an Excel file.

Provides basic content management for home page with rich text editor and image upload to [Cloudinary](http://cloudinary.com/).

Screenshots
-----------

![Login](/screenshots/login.jpg?raw=true "Login")

![Accounts](/screenshots/accounts.jpg?raw=true "Accounts")

![Movements](/screenshots/movements.jpg?raw=true "Movements")

Overview
--------

- Ruby 2.3.1
- Rails 4.2
- Devise
- Carrierwave
- Cloudinary
- Twitter Bootstrap

Development
------------

Run with:

```
heroku local
```

License
-------

Copyright Christian Hein 2016
