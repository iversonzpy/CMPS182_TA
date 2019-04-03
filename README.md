# CMPS182_TA
Some preparation for TAing CMPS182

Pengyang Zhou
- Lab Section: Wednesdays, 4 - 5 PM, BE-105
- Office hour: Wednesdays, 6 - 7 PM, BE-119

## Lab 1
### Goals
- Read Lab1 instructions (Lab1_S19.pdf) carefully. 
- Learn Command line, PostgreSQL, File operations, Gradiance.
### Command Line
- Windows/MacOS/Linux - CMD and Terminal
- Linux on Windows - Vitual Machines, like VMWare, Vitural Box, Linux on Window10.

- Common Unix/Linux Commands
http://genomewiki.ucsc.edu/genecats/index.php/UNIX_Commands

### Introduction to PostgreSQL

#### Connect to PostgreSQL
##### SSH to Unix Timeshare (Recommend)

```
ssh 'yourCruzID'@unix.ucsc.edu
```
After connected to unix.ucsc.edu, you can use psql to connect to PostgreSQL. Replace with your CurzId and password recieved in your email.
```
psql -h cmps182-db.lt.ucsc.edu -U 'yourCurzId'
```
Then, you will see:
```
-bash-4.2$ psql -h cmps182-db.lt.ucsc.edu -U yourCruzId
Password for user yourCruzId:
psql (10.7)
Type "help" for help.

yourCruzId=#
```

Useful PostgreSQL commands:
https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546


##### Connect to PostgreSQL from local computers
Recommend operation systems: Linun/MacOS
Install PostgreSQL, tutorial can be found at https://www.postgresql.org/download/

Run command line from terminal
```
psql -h cmps182-db.lt.ucsc.edu -U 'yourCurzId'
```

### Gradiance
Follow the gradiance instruction on CMPS182_S19_GeneralInformation.pdf


## Lab 2
//TO-DO

## Lab 3
//TO-DO

## Lab 4
//TO-DO