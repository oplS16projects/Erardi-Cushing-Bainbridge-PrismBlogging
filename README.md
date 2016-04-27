# PRISM BLOGGING
Our project is focused on creating a platform for us to write blogs to update users on changes for our GUI II project website, Prism.

##Authors
Alex Cushing

Tyler Bainbridge

James Erardi

##Overview
Prism is a website for photographers to keep a minimal portfolio of their photographs for their friends and other followers to see. For this project we created a GUI interface in which we can write blogs to update users on recent developments in this website, Prism. When a blog is finished, it is submitted and saved into the postgreSQL database. This database is accessed and displayed online using web applications in racket.

##Screenshot
![screenshot of application](https://raw.githubusercontent.com/oplS16projects/Erardi-Cushing-Bainbridge-PrismBlogging/master/Screenshot%20from%202016-04-27%2011-39-55.png)

Here's a demonstration of how to display an image that's uploaded to this repo:
![screenshot showing env diagram](withdraw.png)

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.

##External Technology and Libraries
Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).

##Favorite Scheme Expressions
####Mark (a team member)
Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Lillian (another team member)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc. 

