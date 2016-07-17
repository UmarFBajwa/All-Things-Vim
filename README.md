# Vim Shop

## Summary
A Rails app built over the course of a 1 week educational game, attempting to replicate real world project deadlines and regular changes of requirements. Next to daily requirement requests, the code-base was swapped among teams of 2 persons to learn from other's coding styles and build on an existing archtiecture.

The stack is Ruby on Rails, PostgreSQL, JavaScript (AJAX and the JQuery library), HAML and Bootstrap CSS (combined with custom elements).

The functionality includes user authentication, admin roles, article management, inventory management and checkout.

## Methodology
* Day 1:
  * Create and document user stories in Trello board
  * Whiteboard basuc mockups and user flows
  * Design Schema
  * Write model, controller and feature tests
  * Create product catalog with a seed file and a user interface

* Day 2:
  * User authentication
  * Stock management
  * Admin panel + CRUD functionality on articles
  * Flash messages (success & failure)

# TO DO >>>>>

Complete methodology


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
