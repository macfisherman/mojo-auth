# mojo-auth
Sample Mojo app with authentication

This Mojo app shows how to do authenication. A real app would also enable TLS.

Requires:
* Docker

Tested on:
* OS X

Steps to use:
1. docker build -t mojo-auth . <-- that is a period
2. ./docker-init
3. create a mojo-auth.conf file
   1. add the following line to it
   2. { db_password => 'auth' }
6. ./docker-auth
7. Point browser to http://localhost:3010
8. Protected pages are in the form /user/\<handle\>
