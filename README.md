# Adds instructions for Omniauth here!!

# README

GIGASSIST

This application was created with Ruby on Rails to help musicians organize and prepare for upcoming gigs. 

* Setup Rails App
Install the gems required by the application by running 'bundle install'
Migrate all tables and create the database by running 'rails db:migrate'
Seed the database by running 'rails db:seed'

* Google Authentication
OPTIONAL: You will need to create your own Google ID and Secret to utilize google authentication. If you would like to take advantage of this feature complete the following steps:
1. Visit https://console.cloud.google.com/
2. Create a New Project
3. Under the "API & Services" tab, select "OAuth Consent Screen"
4. Select "External" or "Internal" User type
5. Fill out the App information (not all fields are necessary)
6. Move to the "Credentials" tab and select "Create Credentials"
7. From the dropdown select OAuth Client ID
8. Select "Web Application"
9. Under "Authorized redirect URI's" add http://localhost:3000/admins/auth/google_oauth2/callback
10. You will then see your unique ID and Secret. Create a .env file at the root folder of the application and fill it out as follows:
       GOOGLE_KEY=YOUR_KEY_HERE
       GOOGLE_SECRET=YOUR_SECRET_HERE

* Start Server
Start the server by running 'rails s'

* Enjoy Gigassist 
You can find the app by pointing your browser to http://localhost:3000. 
If everything worked you can: 

    - Sign up via Google or with a unique name. 
    - Login via Google or with a saved name and password.
    - Create gigs that will be organized by date
    - Edit gigs
    - View gig set lists
    - View your master song list with all upcoming (unique) songs organized by date
    - View your gig, band, and song stats
    - NOTE: If a bandmate adds a gig and setlist, these will automatically populate in your account!
