## T2A1 Workbook

>##### *ACME Corporation is looking for devs with an understanding of Rails. The following set of questions relate to this RfQ-requirement.*

##### Q1. Describe the architecture of a typical Rails application (wc 200-300)
Rails is based around two principles: 'Don't Repeat Yourself' and 'Convention Over Configuration' (Rails Guides 2020). The architecture of a Rails app is largely based around implementing these principles resulting in the creation of the MVC or Model, Controller and View concept. Each of these components play a vital role in the overall function and user experience of the Rails application, whilst adhering to the Rails principles. 
The Model holds all of the logic behind the app and interacts with the database. It then uses that data and performs the necessary validations and returns the information to the controller. This is made possible bty ActiveRecord. Active record turns our Ruby code into SQL so that the data can be interpreted by the database.
The View involves everything that the client see's. When a client makes a request to visit a particular page of the application, the view renders the appropriate content. This is done with the help of HTML files constructed with embedded Ruby language. Rails also has the ability to implement appropriate styling with css and functionality with javascript.
Lastly the Controller. The controller is the only component that can interact with both the model and view. It controls the overall flow of the application based on the requests from the client and then performs the appropriate actions.
This communication between the MVC would not be possible without the route system within Ruby. The route file has specific routes that communicate with each part of the application making the overall function possible.
This architecture facilitates the contruction of Rails applications that follow the principles of Rails and streamline the process for developers.


##### Q2. Identify a database management system (DBMS) commonly used in web applications (including Rails) and discuss the pros and cons of this database. (wc 150-250)
PostgreSql
PostgreSQL is a popular open source database management system. 'Postgres' started as a project at The University of California in 1986 with the aim of creating a database that supported different data types(Postgresql tutorial). It gets its name from the orginal project 'Ingres' in combination with the language base and support for Structured Query Language or SQL. Since its inception, it has developed into a very advanced and stable database management system with a large community. Because of this, it is the primary database management system used with both web and mobile applications.
'Postgres' is mainly used as an object relational database management system. This essentially means that it is a database where the information is represented by tables with columns and rows(Ed lesson?). Non-relational databases can also be supported by Postgres. All platforms can run Postgres and it supports a wide variety of computer languages such as Python, Javascript(Node.js), C# and Ruby(Rails) just to name a few(EDUCBA 2020). Unlike other systems, Postgres supports a wide variety of data types, not just usual ones in promgamming such as strings and integers but also includes video, audio and images. It can easily integrate and its functions can be customized to the users needs. Postgres has a positive reputation in the indsutry for management of data integrity.
It is managed by a very experienced developer community and is freuqently updated and improved.
However as it is such an old language, it is much slower than other database management systems available. The installation of Postgres itself is notoriously difficult, especially for beginngers. The other issue with Postgres is that other opensource do not support postgres, so it cannot be used. 
It is clear that the advantages far outweigh the disadvantages of using Postgresql as a database management system, which is why it is used by some of the worlds largest companies such as Apple and Instagram, choose to use it as a database management system(POSTGRES TUTORIAL)

>##### ACME Corporation is very big on project management, documentation and process. This will be a key metric in their decision to award the project. The following set of questions relate to this RfQ-requirement.

##### Q3. Discuss the implementation of *Agile* project management methodology (wc 200-300)
...


##### Q4. Provide an *overview* and *description* of a standard source control workflow (wc 100-200)
...
 GIT?

##### Q5. Provide an *overview* and *description* of a standard software testing process (*e.g.*, manual testing) (wc 100-200)
...

>##### Having suffered several cyber attacks in the past and resultant remedial audits ACME Corporation takes compliance, security and privacy very seriously. The following set of questions relate to this RfQ-requirement.

##### Q6. Discuss and analyse requirements related to information system security and how they relate to the project (wc 100-200)
...

##### Q7. Discuss common methods of protecting information and data and how you would apply them to the project (wc 100-200)
authenticity token
...

##### Q8. Research what your legal obligations are in relation to handling user data and how they can be met for the project (wc 100-200)
...


>##### ACME Corporation has specifically requested the app to be based on a relational database. The next set of questions relate to this RfQ-requirement.

##### Q9. Describe the structural aspects of the relational database model. Your description should include information about the structure in which data is stored and how relations are represented in that structure. (wc 100-200)
Relational database is data represented by tables with columns and rows.

##### Q10. Describe the integrity aspects of the relational database model. Your description should include information about the types of data integrity and how they can be enforced in a relational database. (wc 100-200)
Data integrity displayed with normalisation rules as well as the key functions

##### Q11. Describe the manipulative aspects of the relational database model. Your description should include information about the ways in which data is manipulated (added, removed, changed, and retrieved) in a relational database. (wc 100-200)
...


>##### Companies (including ACME Corporation) value previous project experience and case studies. The following set of questions relate to this RfQ-requirement.

##### Q12. Conduct research into a marketplace website (app) and answer the following parts:  (wc 50-100 per part)

##### a. List and describe the software used by the app.


##### b. Describe the hardware used to host the app.
NGINX - webserver
Amazon Ec2 - secure virtual computer cloud

##### c. Describe the interaction of technologies within the app
Firebase - mobile web application framework

##### d. Describe the way data is structured within the app
Postgresql

##### e. Identify entities which must be tracked by the app
Streamers/content creators, viewers, followers, subscriptions, bit purchases, donations, advertisers, 
    
##### f. Identify the relationships and associations between the entities you have identified in part (e)
...
    
##### g. Design a schema using an Entity Relationship Diagram (ERD) appropriate for the database of this website (assuming a relational database model)
...

### References

1. 'What is Rails?' Getting Started With Ruby, Ruby Guides 2020, viewed 16th October 2020 from <https://guides.rubyonrails.org/getting_started.html>
2. Twitch, stackshare 2020, viewed 16th October 2020 from <https://stackshare.io/twitch/twitch>
3. 'What is PostgreSql?' PostgreSql Tutorial 2020, viewed 20th October 2020 from <https://www.postgresqltutorial.com/what-is-postgresql/>
4. 'What is Postsql?' EDUCBA 2020, 'Introduction to Postgresql', viewed 20th October 2020 from <https://www.educba.com/what-is-postgresql/>
5. 'What is postsql? Introduction, history, features, advantages', Guru99 2020, viewed 20th October 2020 from <https://www.guru99.com/introduction-postgresql.html>
