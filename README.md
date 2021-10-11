# Bookmark Manager

A functioning bookmark manager that allows a user to view, add, update and delete bookmarks

```
bundle install
rackup
```
## User Stories

```
As a user
So that I can see all of my bookmarks
I want to be able to list them
```
![Sequence Diagram](https://drive.google.com/uc?export=view&id=1X71JC8pvlVaI8QYUA4i51mvQq3B_ysUe)


| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

