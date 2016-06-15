# MVP 1

# FIRST ITERATION

- Document initial user stories.
- Whiteboard or prototype a few mockups and page flows and add them to the documentation.
- Whiteboard or design the data and schema you'll need to keep track of for this app to work and add to the documentation. If you use Schema Designer it's a good idea to paste the generated XML into a separate file in addition to adding a screenshot in the README.
- Add functionality for managing products to the included Rails application skeleton.  It'll be helpful to have a baseline where the client can enter products into the system, manage the products, and view them.
- We will not need any authentication mechanism.
- Include basic styles for the website and image placeholders for the products.
- Have RSpec model, controller, and feature tests.

Move through the the items above __as quickly__ as you can, without much attachment. These are just a starting point.  As we gather feedback and learn more about what it takes to develop the app, we want to be able to change these easily.  'Cause that's Agile and that's how we do it.

Happy Hacking, now GO Build! <3

# USER STORIES:
-As a User I can view all items
-As a User I can see a picture of each item
-As a User I can create new items
-As a User I can view a specific item
-As a User I can delete an Item
-As a User I can update an item
-As an Admin only I have access to item creation, edit, and deletion
-As an Admin I have a separate view (add, remove, edit) located at '/admin'
-As an Admin I can access via http_basic_authenticate_with_name
-Items include Name, Price, Quantity, Description
