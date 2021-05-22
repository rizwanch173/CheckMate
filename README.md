# checkmate

# Description

* Flutter / Codeigniter coder for a Tinder / HotOrNot clone project.
Main requirements:
* Flutter - Codigniter 3 or higher - Mysql
Main functionalities :
* Account creation / sign-in ( with shared preferences for "remember me")
After login:
* 5 bottom menus ( like instagram) :
* Home : leave it empty
* Swap : images uploaded by other users will show here, and user can swip right if he likes or left if he dislikes. 
* When swiping right he should choose a score 4 or 5 or 6 points. 
* If he swips left he then can choose to score 1 or 2 or 3 points. 
* When confirmed, the score is stored in the database for that particular image associated with that particular user who voted, so he doesn't vote twice. 
* Also add ability to report image, and if image is reported more 10 times it should be blocked from being displayed.
* Upload : Upload image ( camera and library ) with ability to crop, select multiple (like instagram carousel ), and add a comment that can include hashtags. 
* Search : search by usernames or hashtag, returns link to searched user profile, or list of images that contain the hashtag
* Profile : User profile where he can view all his uploaded images with median score for each, delete image, update email, nickname, password, and check his total median score from swips that other users give him for all his images including the deleted ones, as the score for the deleted one stays in the database.
