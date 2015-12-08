# iCard

## Authors

* Ziteng Li
* Carlos Caballero
* Han Chen
* Lintao Wang

## Purpose

* Create app that simulates studying with flash cards

## Features

* Extract data from jservice.io API and convert to flash cards
* Keeps  track of score
* Special mode that converts flash cards into multiple choice questions

## Control Flow

* At first a tableview shows a list of subjects. Given the subject the game begins showing one flash card at a time for the user to answer.

## Implementation

### Model

* Category.swift: Used to organized flash cards into categories
* Used JService.io API to get question, answer pairs

### View

* ClassicViewController.swift: holds the view that represents the flash card
* MultipleChoiceViewController.swift: holds the view that represents the multiple choice game
* MainViewController.swift: holds the view of the main screen to choose category and mode

### Controller

* ClassicViewController.swift: controls the views to simulate flash card
* MultipleChoiceViewController.swift: controls the multiple choice game views
* MainViewController.swift: controls the next view given a category and a mode
  
  ​
  
  ​