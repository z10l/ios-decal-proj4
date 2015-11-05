# iCard

## Authors

* Ziteng Li
* Carlos Caballero
* Han Chen
* Lintao Wang

## Purpose

* Create app that simulates studying with flash cards. 

## Features

* Extract data from special format file and convert to flash cards
* Keeps  track of score and keeps record of users progress
* Special mode that converts flash cards into multiple choice questions 

## Control Flow

* At first a tableview shows a list of subjects. Given the subject the game begins showing one flash card at a time for the user to answer.

## Implementation

### Model

* FlashCardData.swift : Keeps the data that the user submitted.
* GameplayKit: Used to create the multiple choice questions
* Some other API to get question, answer pairs

### View

* FlashCardTableView.swift: holds the series of flash cards

### Controller

* FlashCardTableViewController.swift:  controls with flash is displayed and keeps track of players score.
  
  ​