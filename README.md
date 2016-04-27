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

##Concepts Demonstrated
Identify the OPL concepts demonstrated in your project. Be brief. A simple list and example is sufficient. 
**Recursion and high level functions** such as map were implemented for writing markup from database information.
Used **Database Queries** to insert and retrieve information from a PostgreSQL database located in the cloud.

##External Technology and Libraries
Briefly describe the existing technology you utilized, and how you used it. Provide a link to that technology(ies).

[The Graphical Interface Toolkit](http://docs.racket-lang.org/gui/index.html)
Alex used this library to create a GUI interface for creating a blog post (title, body) as well as a success confirmation. 

[Web Applications in Racket](http://docs.racket-lang.org/web-server/)
James used this library to create a web page for displaying the blog posts in a browser. 

[CSS](https://developer.mozilla.org/en-US/search?q=css) 
Alex wrote CSS for styling the web page to make it aesthetically pleasing.

[Database](http://docs.racket-lang.org/db/):
Tyler wrote queries for inserting information into a database as well as retrieving blog posts to wrap in HTML to display and style the posts in James’ web application.

##Favorite Scheme Expressions
####Mark (a team member)
Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Tyler
I wrote a function that utilizes a map which uses a lambda expression as well as other functions to write HTML Markup to display the blogs on the page. 
```scheme
(define (displayMarkup)
  (set! markup "")
  (makeopenRoot)
  (map (lambda (row) (makeOpenPost) (makeTitle (getTitle row)) (makeBody (getBody row)) (makeClosePost) ) (allPosts))
  (makecloseRoot)
  (string->xexpr markup))
```

###Alex
I wrote the GUI and this is an example of how you can manipulate the properties.
```racket
(define output
      (new text-field%
           [label "blog"]
           [style '(multiple)]
           [min-height 20]
           [vert-margin 20]
           [min-width 400]
           [parent panel]))
  ```
###James
This snippet is an example of calling a function that writes the markup to the DOM
```racket
(define (render-blog-page request)
  (response/xexpr
   `(html (head (title "Prism Blog"))
          '(link ([rel "stylesheet"]
                  [type "text/css"] [href
                                     "http://alexcushing.com/public/racketstyle.css"]))
          (body'(a ((href "http://prsmphoto.com/")) "prism")(div, (displayMarkup))))))
```

##Additional Remarks
Please checkout prism! www.prsmphoto.com

#How to Download and Run
Download the source files, run GUI.rkt to enter and write blog files, and run barebones.rkt to run the server and see the post after it is submitted

Include what file to run, what to do with that file, how to interact with the app when its running, etc. 

