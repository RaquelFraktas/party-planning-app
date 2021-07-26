# README

Welcome to my Ruby on Rails app. It uses Rails 6.1.4. 

This app helps keep you in the loop of all the cool parties happening in your area. There are two types of users- a host, and a guest. The user will have the option to create any type of account. 

A host will be able to create parties, and the guest has the option to RSVP. Both users can post comments on the events pages.

Please run `bundle install` to install your gemfile for this program. 

Run `rails db:migrate`.
Run `rails db:seed`.

Since this app uses the `Omniauth gem` for Facebook and Google, you will need to grab the ClientID, and the SecretKey from both sites and create a `.env` file in the root directory of this app. 


`FACEBOOK_KEY=XXXX
FACEBOOK_SECRET=XXXX

GOOGLE_CLIENT_ID=XXXX
GOOGLE_CLIENT_SECRET=XXXX`


The detailed instructions on how to access the keys from the developer sites are located on the Facebook and Google `Omniauth` documentation. 

https://github.com/simi/omniauth-facebook
https://github.com/zquestz/omniauth-google-oauth2

In order to access most components of this site, you must be logged in as a user.
