# VolunteerHUB-DB
VolunteerHUB-DB is sql scripts and database properties for database that is using by VolunteerHub project.

These scripts and properties are needed to run database for VolunteerHUB project.

## Technology Stack

Derby Server Database

## Database Setup

- Install Derby Server DB according to next Derby Tutorial:

```url
https://db.apache.org/derby/papers/DerbyTut/index.html
```

- Create volunteer-hub-db database. You can use Derby Tutorial or any other way for it.

- Copy next two files to %DERBY_INSTALL%\bin folder:
```
src\db-properties\derby\derby.properties

This property file turn on connection authentication, sql authorization and contains database users credentials.
```

```
src\db-properties\derby\stopNetworkServerAsAdmin.bat

This bat script is used to shutdown Derby Server under Admin credentials. 
```

- Run Derby Server use any way.
```
For example, run next but script:
%DERBY_INSTALL%\bin\startNetworkServer.bat
```

- Connect as admin to volunteer-hub-db database. You can find admin credentials in derby.properties file.
```
For example, you can use next url:
jdbc:derby://localhost:1527/volunteer-hub-db;create=false 
```

- Run next script use any way:
```
!NOTE!: Apache Derby can only execute one SQL query at a time. Therefore, you need to run each SQL query separately in each script!
```

```
src\scripts\tables.sql

This script creates all necessary tables.
```

```
src\scripts\grants.sql

This script add all necessary grants to volunteer-hub database user.
```

```
- src\scripts\data\users.sql
- src\scripts\data\events.sql
- src\scripts\data\activities.sql
- src\scripts\data\volunteers.sql

This scripts fill initial test data to tables.
!NOTE!: Data model has foreign keys! Therefore you need run data scripts in strict order!
```

## Data model

- APP_USER - contains all users that were registered in volunteer-hub
- EVENT - contains all events that were created by users
- ACTIVITY - contains all activities that were created and added to events
- VOLUNTEER - contains all volunteers. Volunteer is user that is participated in particular activity of event.

## Permission model

Current permission model is assign grants to users and not use roles.

This model was chosen because currently we have only one user for volunteer-hub project (except database admin) and not complex security requirements.

## Restrictions

- You can't use synonyms because Apache Derby doesn't support it.
- You can't create database user using sql by reason of Apache Derby restrictions.
- Apache Derby can only execute one SQL query at a time. Therefore, you need to run each SQL query separately in each script.
- First 1000 ids of each table were reserved for insert data from scripts.

## Author

Yaraslau Dubovik

Senior Software Engineer

www.linkedin.com/in/yaraslaudubovik

## License

- It is prohibited to use the source code or its modifications for commercial purposes
- It is permitted to use the source code and its modifications for non-commercial purposes only with the consent of the author