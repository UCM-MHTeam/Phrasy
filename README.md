# Phrasy - iOS Mental Wellness App (WIP)

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Bridging the silence/ambiguity gap between friends and mental health/illness

Mental health and mental illness can be tough to deal with, especially when communicating our emotions or gauging how a friend is feeling behind the notorious "I'm okay" or "I'm tired" reply. Phrasy helps facilitate the user to phrase their thoughts into words when they cannot find the words to answer the many small-talk and check-in questions.

### App Evaluation

- **Category:** Health and Wellness
- **Mobile:** The phraser system feature can be used on mobile devices and is also viable on a desktop version. Everything else seems to only be viable on mobile since features like statuses and statistics are preferred at a quick glance.
- **Story:** Allows the user to form phrases when they cannot find the words themselves. Phrases include labeling emotions, declaring intentions, offering support,  etc.
- **Market:** General audience of all ages 4+
- **Habit:** Main functionality is not habit based, however mood tracking will heavily rely on it.
- **Scope:** Focal point is the message phraser first, which can require additional help from professionals and online sources to create phrases for effective communication.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can log-in
* User can register for an account
* User can view other user status' at a glance (only among friends)
* User can find friends through a query
* User can view a list of (CA-local) hotlines, wellness centers, etc
* **User can draft a message based on certain criteria**
    *    Uses a survey form to suggest phrases based on their mood, intention, etc. for a message to send

**Optional Nice-to-have Stories**
* Users can view their friends' mood stats
* Chat board (one on one)  (can rethink later)
* User can share/forward message to different apps (IM, FB Messenger, etc.)
* User can see their own profiles



### 2. Screen Archetypes
* Login/Signup Page
    * User can log-in
    * User can register for an account
* Feed
    * User can view other user status' at a glance
* User Profile 
    * User can see their own profiles
    * User can view other user status' at a glance
* Search Friends
    * User can find friends through a query
* Resources Page
    * Users can view a list of hotlines and wellness resouces 
* Message Draft
    * **User can draft a message based on their current mood**    
* **[Opt.]** Profile for mood stats

### 3. Navigation

**Tab Navigation** (Tab to Screen)
* Search Friends
* Message Draft
* Settings


**Flow Navigation**
* Login/Signup <-> Feed
* Settings <-> Resources
* **[Opt]** Feed <-> user profiles/stats

## Wireframes
First Draft
<img src="" width=600>
![](https://i.imgur.com/Ujfhr04.jpg)

### [BONUS] Digital Wireframes & Mockups ([Figma Link](https://www.figma.com/file/0RJG7CmvWGkx2tHmbDKAQ8/CodePath-iOS-MH-App?node-id=0%3A1))
> Below the Message frame, we plan on implementing there a form that can take the user's current feeling/intention and creates a phrase to be sent out.

![](https://i.imgur.com/AHLQTZR.png)


### [BONUS] Interactive Prototype ([Figma Preview Link](https://www.figma.com/proto/0RJG7CmvWGkx2tHmbDKAQ8/CodePath-iOS-MH-App?node-id=7%3A34&scaling=scale-down))
![](https://i.imgur.com/U3GVE9x.gif)


## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
