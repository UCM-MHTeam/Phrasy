# Phrasy - iOS Original App

![](https://i.imgur.com/S9w0jzf.png)

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Progress](#Progress)

## Overview
### Description
Bridging the silence/ambiguity gap between friends and mental health/illness

Mental health and mental illness can be tough to deal with, especially when communicating our emotions or gauging how a friend is feeling behind the notorious "I'm okay" or "I'm tired" reply. Phrasy helps facilitate the user to phrase their thoughts into words when they cannot find the words to answer the many small-talk and check-in questions.

### App Evaluation

- **Category:** Health and Wellness
- **Mobile:** The phrase system feature can be used on mobile devices and is also viable on a desktop version. Everything else seems to only be viable on mobile since features like statuses and statistics are preferred at a quick glance.
- **Story:** Allows the user to form phrases when they cannot find the words themselves. Phrases include labeling emotions, declaring intentions, offering support,  etc.
- **Market:** College/university students and young adults ages 17+
- **Habit:** Main functionality is not habit based, however mood tracking will heavily rely on it.
- **Scope:** Focal point is the message phraser first, which can require additional help from professionals and online sources to create phrases for effective communication.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Stories**

- [x] User can log-in
- [x] User can register for an account
- [x] User can view other user status' at a glance (only among friends)
- [x] User can find friends through a query
- [x] User can view a list of (CA-local) hotlines, wellness centers, etc
- [x] **User can draft a message based on certain criteria**
    * Uses a survey form to suggest phrases based on their mood, intention, etc. for a message to send

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

### First Draft
![](https://i.imgur.com/Ujfhr04.jpg) </img>


### Digital Wireframes & Mockups
> Below the Message frame, we plan on implementing there a form that can take the user's current feeling/intention and creates a phrase to be sent out.

![](https://i.imgur.com/AHLQTZR.png)


### Interactive Prototype
![](https://i.imgur.com/U3GVE9x.gif)


## Schema 
### Models

<details>
    <summary>Person</summary>
    
| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| objectId | String   | unique id for user     |
| userName | String   | name of user |
| userImage | String  | image of user |
| friends  | Array    | list of person objects |
| UpdateCell | Pointer to another Parse Object | mood update |

</details>

<details>
    <summary>UpdateCell</summary>
    
    
| Property 1 | Type 2 | Description 3 |
| -------- | -------- | -------- |
| objectId     | String     | unique id for the the user status     |
| userImage | Pointer to User | image user |
| userName  | Pointer to User | name of user |
| moodString | String | current mood description|
| moodColor | String | current visual of mood |

    
</details>



<!-- Profile -->
<!-- TBD -->


### Networking
<!-- - [ List of Network Requests by Screen ] -->

<details>
    <summary>Login Screen: (READ) Fetch user account</summary>
    
```
let username = usernameField.text!
let password = passwordField.text!
                
PFUser.logInWithUsername(inBackground: username, password: password){
    (user, error) in
        if user != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }else{
            print("Error: \(error?.localizedDescription)");
        }
}
```
    
</details>


<details>
    <summary>Sign Up Screen: (POST) Create new user</summary>

```
let user = PFUser()
user.username = usernameField.text
user.password = passwordField.text
user.email = emailField.text PFObject
user["phone"] = phoneNumField.text
user["friends"] = [PFObject]()    //nil initially because no friends

user.signUpInBackground { (success, error) in
    if success {
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
    }else{
        print("Error: \(error?.localizedDescription)");
    }
}
```

</details>

<details>
    <summary>Feed (Read/GET) Query all of user updates for collection view</summary>
    
``` 
//var upCells = [PFObject]()    //take into account
let query = PFQuery(className:"friends","UpdateCell.friends")
query.includeKeys(["userName", "userImage","moodString","moodColor",
        "userImage.userName","moodString.userName","moodColor.userName"])
query.limit = 20        //Temporary limit 20 but should # of friends

query.findObjectsInBackground { (upCells, error) in
    if upCells != nil{
        self.posts = upCells!
        self.tableView.reloadData()   //TB -> CV
    }
}
```
    
    
    
</details>

        
<details>
    <summary>Friend Search</summary>

- (Read/Get) Query users with **EXACT** username

    ```
    var people = [PFObject]()
    let query = PFQuery(className:"Person")
    query.includeKeys(["userName"])
    query.limit = 1        //**EXACT username***

    query.findObjectsInBackground { (Person, error) in
        if Person != nil{
            self.people = Person!
            self.tableView.reloadData()   
        }
    }

    ```
- (Update/PUT) Add a new friend to current user

    ```
    let allUsers = PFQuery(className: "Person")
    allUsers.findObjectsInBackground { (Person, error)
        if Person != nil{

        user.addUniqueObjects(from: ***Unique ID***)
        }
    }

    ```

</details>
    


<!-- - [**Opt**] Profile
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
 -->

## Progress

**Milestone #1**: Phrase Engine (to be continued to next milestone)

![](https://i.imgur.com/4qUmTsJ.gif)

**Milestone #2**: Working Phrase Engine and Login View (to be continued to next milestone)

![](https://i.imgur.com/TxCgrNS.gif)
![](https://i.imgur.com/3NJGXrR.gif)

**Milestone #3**: Phrase Engine polishing and Friends View (to be continued to next milestone)

![](https://i.imgur.com/dzH7Ddw.gif)
![](https://i.imgur.com/TY2F4DD.gif)

**Milestone #4**: Home (Friends) View, Search Functionality, and design tweaking

![](https://i.imgur.com/nGr0iDg.gif)

