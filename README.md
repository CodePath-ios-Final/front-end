# Yum Me!

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Yum Me! is a recipe generator that suggests dishes you should make for a day based on your diet and user provided ingredients.

### App Evaluation
- **Category:** Recipes Suggestion.
- **Mobile:** This app will be developed for the mobile platform.
- **Story:** Users add their dietary restrictions and the pantry ingredients to a list. Yum Me! will suggest recipes that fit the dietary restrictions and entail pantry ingredients. 
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
<img src="http://g.recordit.co/LVqFme6tJo.gif" width=600>

### Digital Wireframes & Mockups
<img src="http://g.recordit.co/IDAtUjv2A1.gif" width=600>

### [BONUS] Interactive Prototype

## Schema 
### Models
### Recipes		
| Property | Type | Description |
| --- | --- | --- |
| recipeId | String | unique ID for the recipe|
| recipeName | String | name for recipe |
| recipeDescription | String | description for recipe |
| recipePhoto | String | recipe photo |
| instructions | array	| cooking instructions for the recipe |
| cookTime | Integer | recipe's average cooking time |
| ingredients | map | map of recipe's ingredientIDs |
| dietaryPreferences | map | map of the recipe's dietary preferences |
		
### Users		
| Property | Type | Description |
| --- | --- | --- |
| userId | String | unique ID for the user |
| provider| String | authentication provider for the user |
| name | String | user's greeting name |
| dietaryRestriction | map | user's chosen dietary restrictions |
| email | String | user's email |
| password | String | user's password |
| recipeHistory | array | user's past cooked recipes |
| pantry | map | user's ingredients in pantry | 
		
### Ingredients		
| Property | Type | Description |
| --- | --- | --- |
| ingredientID | String | unique ID for the ingredient |
| dietaryRetriction | map | dietary restriction the ingredient can be featured in |
| ingredientName | String | ingredient's name | 

### Networking

- Onboarding
  - (Update/PUT) Add  or update user’s personal information
```
self.ref.child("users").child(user.uid).setValue(["name": name])
self.ref.child("users").child(user.uid).setValue(["email": email]
self.ref.child("users").child(user.uid).setValue(["provider": providerID]) 
```
  - (Update/PUT) Add  or update user’s dietary recommendations

```self.ref.child("users").child(user.uid).setValue(["diet":diet])```
  - (Update/PUT) Add  or update user’s pantry ingredients
```self.ref.child("users").child(user.uid).setValue(["ingredients": ingredient])```
- Home page
  - (Read/GET) Get user’s dietary recommendations for recipe recommendations
  - (Read/GET) Get user’s pantry ingredients for recipe recommendations
  - (Read/GET) Get all recipes
```let userID = Auth.auth().currentUser?.uid
ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
  // Get user value
  let value = snapshot.value as? NSDictionary
  let username = value?["username"] as? String ?? ""
  let user = User(username: username)

  // ...
  }) { (error) in
    print(error.localizedDescription)
}
```
- Recipe Page
  - (Read/Get) get recipe’s information
  - (Create/POST) Add recipe to user’s recipe history
```self.ref.child("users").child(user.uid).setValue(["recipeHistory": recipe])```
- Update pantry page
  - (Delete) delete ingredients from user’s pantry
```self.ref.child("users").child(user.uid).removeValue(["pantry": ingredient])```
Review Recipe Page
  - (Create/POST) Add user’s review to recipe
```self.ref.child("users/\(user.uid)/recipeHistory").setValue(recipe)```
- Recipe History
  - (Read/GET) Get user’s recipe history
