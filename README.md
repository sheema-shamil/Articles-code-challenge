# Magazine Domain Ruby Code Challenge
This Ruby code challenge is designed to demonstrate proficiency in building out classes and their respective methods, as well as working with object relationships and aggregates.

## Table of Contents
Introduction
Topics
Project Setup
Deliverables
## Usage
Contributing
Introduction
For this assignment, we are working with a Magazine domain consisting of three models: Author, Article, and Magazine. An Author has many Articles, a Magazine has many Articles, and Articles belong to both Author and Magazine.

We have built out the classes and their respective methods to reflect these relationships, and included helper methods where necessary.

## Topics
The topics covered in this code challenge include:

1. Classes and Instances
2. Class and Instance Methods
3. Variable Scope
4. Object Relationships
5. Arrays and Array Methods
## Project Setup
To set up the project, follow these steps:

1. Clone the repository to your local machine
2. Install any necessary dependencies with bundle install
3. Configure the run file to your specifications
4. Create instances of the classes in the run file and try out the methods you just created
## Deliverables
The following classes and methods have been implemented:

Initializers, Readers, and Writers
1. Author
Author#initialize(name): An author is initialized with a name, as a string. A name cannot be changed after it is initialized
Author#name: Returns the name of the author
2. Magazine
Magazine#initialize(name, category): A magazine is initialized with a name as a string and a category as a string. The name and category of the magazine can be changed after being initialized.
Magazine#name: Returns the name of this magazine
Magazine#category: Returns the category of this magazine
Magazine.all: Returns an array of all Magazine instances
3. Article
Article#initialize(author, magazine, title): An article is initialized with an author as an Author object, a magazine as a Magazine object, and title as a string. An article cannot change its author, magazine, or title after it has been initialized.
Article#title: Returns the title for that given article
Article.all: Returns an array of all Article instances
Object Relationship Methods
Article
Article#author: Returns the author for that given article
Article#magazine: Returns the magazine for that given article
Author
Author#articles: Returns an array of Article instances the author has written
Author#magazines: Returns a unique array of Magazine instances for which the author has contributed to
Magazine
Magazine#contributors: Returns an array of Author instances who have written for this magazine
Associations and Aggregate Methods
Author
Author#add_article(magazine, title): Given a magazine (as a Magazine instance) and a title (as a string), creates a new Article instance and associates it with that author and that magazine.
Author#topic_areas: Returns a unique array of strings with the categories of the magazines the author has contributed to
Magazine
Magazine.find_by_name(name): Given a string of magazine name, this method returns the first magazine object that matches
Magazine#article_titles: Returns an array string of the titles of all articles written for that magazine
Magazine#contributing_authors: Returns an array of authors who have written more