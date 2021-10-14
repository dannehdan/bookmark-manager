# Bookmark Manager

A functioning bookmark manager that allows a user to view, add, update and delete bookmarks

```
bundle install
rackup
```
To set up the database:
```
psql
=> CREATE DATABASE bookmark_manager
=> \c bookmark_manager
```
Run the SQL scripts in `db/migrations` in order

You will also need to create a test database for running tests
```
psql
=> CREATE DATABASE bookmark_manager_test
=> \c bookmark_manager_test
```
And run the SQL scripts in `db/migrations` in order

## User Stories

```
As a user
So that I can see all of my bookmarks
I want to be able to list them
```
```
As a user
So that I can save a website
I would like to add a site's url to the bookmark manager
```
```
As a user
So that I can avoid storing old bookmarks
I would like to be able to delete a bookmark
```
![Sequence Diagram](https://drive.google.com/uc?export=view&id=1X71JC8pvlVaI8QYUA4i51mvQq3B_ysUe)


| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

