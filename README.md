# iCard

## Authors

* Ziteng Li
* Carlos Caballero
* Han Chen
* Lintao Wang

## Purpose

* Create app that simulates studying with flash cards

## Features

* Extract data from special format file and convert to flash cards
* Keeps  track of score and keeps record of users progress
* Special mode that converts flash cards into multiple choice questions

## Control Flow

* At first a tableview shows a list of subjects. Given the subject the game begins showing one flash card at a time for the user to answer. At the end of the flash card set another view is presented with the information of the players accuracy and progress.

## Implementation

### Model

* FlashCardData.swift : Keeps the data that the user submitted
* Subjects.swift: Used to organized flash cards into subjects
* Some other API to get question, answer pairs (API to be determined)

### View

* FlashCardView.swift: holds the view that represents the flash card
* SubjectTableView.swift: holds the view that represents a group of flash cards

### Controller

* FlashCardViewController.swift:  controls with flash is displayed and keeps track of players score.
  
* SubjectTableViewController.swift: controls a table view of subjects, which represents the group of flashcard that are going to be used
  
  ​
  
  ​