### T.P.R Tracker - T1A3

Welcome to the TPR tracker. This app is designed to easily track the temperature, pulse and respiratory rate of inpatients in a veterinary hospital.
The TPR Tracker is a convenient way for vets and nurses to keep track of their inpatients vital signs. The app allows for each nurse and vet in the hospital to enter their account details and accurately log the temperature, pulse and respiration rate of the inpatients in their care. If the staff member doesn't have an account, an account can be created so they are linked to the data that has been logged to a specific patient. Once in their account, the vet or nurse will have the ability to add a new patient or view the log of an existing patient. Any staff member with an account will be able to read the log for any inpatient and add a new one. Once the information has been logged, the nurse or vet can log out of their account. Each entry that the vet or nurse has made will be time stamped and their username will be attached to comply with veterinary industry record keeping protocols.

I have developed this app so there is a digital record and process of logging and viewing patient details. Currently in most hospitals, paper records are still used for logging information on patient cage cards. While the animal still needs to be identified by a cage card, this will solve the problem of monitoring sheets being misplaced or eaten by the patient. It will also make the log easily accessible to vets or nurses who aren't in the hospital area, but would like to access the records from their consultation room. This app will also save time and effort of someone having to upload the monitoring sheet to the animals record.

# Features
- User Login/Creation Feature : Allows a vet or nurse to login or out of their account so that accurate records can be made.    This feature also allows to create user accounts with a username and password. If they do not make an account or use their existing one, they wont be able to log or access the information.
- Patient Profile Search/Profile Creation Feature: Allows the vet or nurse to find current inpatients and view the file. This feature also allows the user to create a new patient file as they are admitted to hospital.
- TPR Log and View Feature: Allows the user to easily log the temperature, pulse and respiration rate of the patient they are examining. The data can then be viewed instantly presented in table format.
- Navigation Menu's: Allows to easily navigate through the app. Customized help menus are also featured depending on which menu you are in. The main menu gives general user tips, and the patient menu provides a table of normal TPR values for common species.


## Installation
In your computers terminal, move to the directory that hold the downloaded file and run the following command

**insert image here of bash script**

Gem requirements
 - gem install tty prompt
 - gem install tty table
 - gem install colorize

 System Requirements
 Ruby 2.7.4 

App requirements
- User account will need to be made in order to attached identitiy to each record
- Ensure csv files have appropriate headings (see below example)



## R7 - User interaction
- explain how a member of the target audience will use it
Veterinarians and veterinary nurses will use this in order to save time, log accurate patient information and have this information accessible to everyone. First the user will log in or create an account. During a round, they will approach the animals kennel, confirm the identification of the animal and either navigate to its file or create one. They then perform their check of vital signs, and log it in to the animals file. They then exit that animals file (assuming everything is within normal range) and repeat the process with the next animal. As rounds happen frequently, the log will contain the identity of the vet or nurse who logged it, the time and date. Each patient's file will be amended with each entry so there is a complete picture of its progress throughout it's hospital stay. This can then be attached to the animals digital records.
Develop an outline of the user interaction and experience for the application.
Your outline must include:
- how the user will find out how to interact with / use each feature
First the app will need the user to log in, it presents them with an option to create an account if the don't already have one.This will loop until they log in, create an account or decide to exit the app.
The user will be presented with a prompt "What would you like to do?" followed by a list of the options:
"Find Patient"
"Add Patient"
"Help"
"Exit"
If they select "Find Patient", they will be able to type the patients first and last name. If the patient exists, the user will be presented with the patient menu options:
"Add log"
"View Log"
"Help - Normal Values"
Exit 
If the user selects add log, they will be prompted to add the patients temperature, pulse rate and respiratory rate. They will then loop back to the menu where they can either view the log or repeat the process for the next patient.
If they select 'view log' the animals monitoring record will print to the screen in a table. 
If the user is unsure of a value they have inputted, they can select the help menu which will present a table of the normal values for dogs, cats and guinea pigs.
When the user has finished, they can exit this menu, which loops back to the main, where they can log out of the app.

## Error Handling
- how errors will be handled by the application and displayed to the user
As this app is largely based on user input, this leaves room for errors.
All input is required, nothing can be left empty. The user is presented with a 'value required' message if no input is received.
If in correct data types are entered, for example when the app is expecting numbers, like in the log feature, an error message will appear stating that the value entered cannot be converted, so number will need to be inputted to move forward.
In terms of authentication, users are presented with error messages if usernames, passwords or patient names are incorrect, and are direct back to the appropriate menu.
If the database files (Csv) are empty, the user will be notified and prompted to create either a user or patient profile.



## R8 Control Flow Diagram





## R3 References
ascii paw
https://ascii.co.uk/art/pawprints
ascii font
http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20

## R4 Github repository & Trello Board
https://github.com/Ashlie-G/T1A3_2
https://trello.com/b/t89yNIU2/tprp-monitor