## R3 References
ascii paw
https://ascii.co.uk/art/pawprints
ascii font
http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20

## R4 Github repository & Trello Board
https://github.com/Ashlie-G/T1A3_2
https://trello.com/b/t89yNIU2/tprp-monitor
## R5
Develop a statement of purpose and scope for your application. It must include:
- describe at a high level what the application will do
The TPRP Monitor is a convenient way for vets and nurses to keep track of their inpatients vital signs. The app allows for each nurse and vet in the hospital to enter their account details and accurately log the temperature, pulse, respiration rate and pain scale of the inpatients in their care. If the staff member doesn't have an account, an account can be created so that a person is linked to the data that has been logged to a specific patient. Once in their account, the vet or nurse will have the ability to add a new patient or view the log of an existing patient. Any staff member with an account will be able to read the log for any inpatient and add a new one. Once the information have been logged, the nurse or vet can log out of their account. Each entry that the vet or nurse has made will be time stamped and their username will be attached to comply with veterinary industry record keeping protocols.

- identify the problem it will solve and explain why you are developing it
I am developing this app so there is a digital way of logged patient details so that everyone case easily access them. Currently in most hospitals, paper records are still used for logging information off in patients on cage cards. While the animal still needs to be identified by a cage card, this will solve the problem of monitoring sheets being misplaced or eaten by the patient. It will also make the log easily accessible to vets or nurses who aren't in the hospital area, but would like to access the records from their consultation room. This app will also save time and effort of someone having to upload the monitoring sheet to the animals record.

- identify the target audience
The target audience for the TPRP Monitor is veterinarians and veterinary nurses working in clinics or hospitals.

- explain how a member of the target audience will use it
Veterinarians and veterinary nurses will use this in order to save time, log accurate patient information and have this information accessible to everyone. First the user will log in or create an account. During a round, they will approach the animals kennel, confirm the identification of the animal and either navigate to its file or create one. They then perform their check of vital signs, and log it in to the animals file. They then exit that animals file (assuming everything is within normal range) and repeat the process with the next animal. As rounds happen frequently, the log will contain the identity of the vet or nurse who logged it, the time and date. Each patient's file will be amended with each entry so there is a complete picture of its progress throughout it's hospital stay. This can then be attached to the animals digital records.

## R6
Develop a list of features that will be included in the application. It must include:
- at least THREE features
- describe each feature
Menu - The app will feature an opening menu to determine what the user would like to do. They are provided with a selection of options. They will be prompted to enter an available option or exit the app.
User creation, Log in and out - This feature will allow a vet or nurse to login or out of their account so that accurate records can be made. If they dont have an account, this feature also allows to create one with a username and password. If they do not make an account or use their existing one, they wont be able to log or access the information.
Patient file creator or viewer - This feature allows the vet or nurse to view file of an inpatient as well as create one if the patient hasn't yet been checked. If the patient doesn't exisit the user will be prompted to create a new file or enter the correct details to access a current patients file.
Log reader - This feature allows anyone who is logeed in to the app to see the log of the inpatient to monitor its vital signs. 
Help - The help feature is the user guide to navigate the app. It will also feature normal values for species as a reminder the user.

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

## R7
Develop an outline of the user interaction and experience for the application.
Your outline must include:
- how the user will find out how to interact with / use each feature
First the app will need the user to log in, it presents them with an option to create an account if the don't already have one.This will loop until they log in, create an account or decide to exit the app.
The user will be presented with a prompt "What would you like to do?" followed by a list of the options:
"Find Patient"
"New Patient"
"Help"
If they select "find patient", they will be able to type the patients first and last name. If the patient exists it will present the details and option to create log or read already existing log. If the patient doesnt exist it will display "Sorry, this patient is not in the system" and will loop back to the menu.
If they select create log, they will be prompted to add the patients temperature, rulse rate, respiratory rate and pain scale. They will then loop back to the menu to repeat the process for the next patient.
If they select 'read log' the animals monitoring record will print to the screen. There will be an option to exit this page which will loop back ot the menu.
When they have finished, there will be an option to log out of the app.



- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user
If the user doesn't input the correct information, the will be presented with an error message and will be looped back to the what would you like to do menu if logged in or the do you have an account prompt if not logged in.

## R8 Control Flow Diagram

## R9 Trello Board
https://trello.com/b/t89yNIU2/tprp-monitor