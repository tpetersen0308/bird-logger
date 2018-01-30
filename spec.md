# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
      - App includes User, Sighting, and Bird models.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
      - Users have many sightings, Birds have many sightings.
- [x] Include user accounts
- [x] Ensure that users can't modify content created by other users
      - Users may only edit or delete their own sightings. Birds, once created, cannot be modified.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      - These CRUD actions are all written in app/controllers/sightings_controller.rb
- [x] Include user input validations
      - Users cannot create an account without valid username, email, and password. 
      - Sightings cannot be created without a bird.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
      - All validation failures are accompanied by a flash message upon redirect.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message