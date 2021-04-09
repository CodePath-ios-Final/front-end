Original App Design Project - README Template
===

# Yum Me!

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Yum Me! is a recipe generator that suggests dishes you should make for a day based on your provided ingredients.

### App Evaluation
- **Category:** Food Suggestion.
- **Mobile:** This app will be developed for the mobile platform.
- **Story:** Users add their dietary restriction and the ingredients in their fridge. Yum Me! will suggest recipes that contain those list 
- **Market:** Yum Me! is an app designed for anyone with a daily struggle of deciding what to cook for the day.
- **Habit:** This app can be used daily at the beginning of the user’s day to prep for their 3 meals for the day.
- **Scope:** Users can include anyone who is able to cook and faces the daily struggle of “what should I eat today”.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

[ ] Users can sign up and create an account.<br>
[ ] Users can add their dietary preferences.<br>
[ ] Users can add their grocery list and preferred items in their pantry.<br>
[ ] Users can get daily recipes depending on what items are expiring closer to the date.<br>
[ ] Users can share recipes with others.<br>
[ ] Users can rate recipes.<br>


**Optional Nice-to-have Stories**
[ ] Users can create their own recipes.<br>
[ ] Users can capture a photo of their fridge's shelves or the recipt from their grocery shopping then Yum Me! will recognize the ingredients available and suggest recipes based on those.<br>
[ ]Users can add their calories limit for the day and Yum Me! will suggest dishes within that limit.<br>

### 2. Screen Archetypes

* Login/Sign up screen
* Diet restriction screen.
* Items input screen.
* Recipes suggestion screen.
* Profile.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Screen
* Dietary input screen.
* Add ingredient screen.
* Recipe screen.
* User profile & setting screen.

**Flow Navigation** (Screen to Screen)

* Authentication -> Dietary input screen (for first-time user only).
* Dietary input screen -> Add ingredient screen.
* Add ingredient screen -> recipe screen.


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="http://g.recordit.co/LVqFme6tJo.gif" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- Authentication with Firebase Firestore.
- Dietary restriction:
	- For new users: Add their dietary restriction to Firestore.
	- For existing users: Fetch their dietary restriction from Firestore.
- Add the items they have for the day to Firestore.
- Fetch all the recipe from Firebase and filter them based on those ingredient.
- Add/update/delete users' profile through the setting section.
