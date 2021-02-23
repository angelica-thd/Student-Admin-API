# README

An API-only REST-ful application of a 2 type user: main user - secondary user, implemented with Ruby on Rails.
For the needs of my course of SaaS the main user is an "admin" and the secondary user is a "student".


* Ruby version: ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32] 
  Rails version: Rails 5.1.7

* For testing: 'rspec' gem, httpie 
* For user authentication token generation: 'jwt' gem
* For user password encryption: 'bcrypt' gem (~> 3.1.7)

* Database creation

* Database initialization

* How to run the test suites: on the project's directory run `bundle exec rspec` or to individually run a test suite `bundle exec rspec spec/{dir_of_tests_name} -fd`


* Services: 
  * This app has a two-factor user authentication (email-password) for all users and provides an authentication token on each session for each user
    The user can use the token for each request like so: 
    `{port}/{request_path} {request_attrivutes} Authorization:{auth_token}`
    httpie exampple: `httpie :3000/find/student email=test@example.com Authorization:eyh...fJKH`
  * API /route endpoints: 
  1.  post 'auth/login' -> User login 
  2.  get 'auth/logout' -> User logout
  3.  post 'signup'-> User signup
  4.  get 'me'-> get User credentials and basic information
  5.  put 'update'-> update User's credentials 
  6.  delete 'delete'-> delete User
  7.  post 'signup/student' -> Student signup
  8.  post 'find/student' -> Find student by email
  9.  put 'update/student' -> Update student's information
  10. delete 'delete/student' -> Delete student
  
  * Disclaimer: In order to sign up as a student a user must already have an account as a basic user.
