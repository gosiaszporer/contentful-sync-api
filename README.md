# Contentful recruitment task - Synchronization Api for offline agents

## Setup
1. Install gems:
```
bundle install
```
2. Make sure all specs pass:
```
rspec
```
3. Start server
```
rails s
```
## Documentation
Documentation available at
```
\docs
```
## My approach
I used noSQL database mongoDB to create Product with one record that contains all items as objects. I created four requests:
1. For Initial synchronization
2. For secondary synchronization
3. To reset all data
4. To list all product's items
I used rubocop to make sure that the code meets acceptable standards.

Looking forward to get some feedback! 😃
