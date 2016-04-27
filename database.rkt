#lang racket
(require db)
(require xml)

(provide displayMarkup)
(provide createBlogPost)

;;; Connecting to a database in the cloud. 
(define pgc
  (postgresql-connect
   #:server "ec2-54-235-64-239.compute-1.amazonaws.com"
   #:port 5432
   #:user "wnzhkkaivwijul"
   #:database "dbu5lo07i41k3g"
   #:password "xF6aT4Dz6iBEyxEywvli5Tm1hN"
   #:ssl 'yes))

;;Create post function for adding posts from the GUI app. 
(define (createBlogPost title body)
  (query-exec pgc "insert into posts.newTable values($1, $2)" title body)
  )

;;Given an element of the db, get the title and string trailing whitespace.
(define (getTitle element)
  (string-trim(vector-ref element 0))
  )

;;Given an element of the db, get the body and string trailing whitespace.
(define (getBody element)
  (string-trim(vector-ref element 1))
  )

;;Get all of the posts from the DB and store them in a vector.
(define (allPosts)
  (query-rows pgc "select * from posts.newTable")
  )


;;(getTitle (getPost allPosts))
;;(getBody (getPost allPosts))

;;(define (displayAllBlogs posts)
;;(vector-map (lambda (x) (display (getPost x))) posts)
;;)


;;markup variables
(define root "<div class='posts'>")
(define closeRoot "</div>")
(define openPost "<div class='post'>")
(define closePost "</div>")
(define openTitle "<h2>")
(define closeTitle "</h2> ")
(define openBody "<p>")
(define closeBody "</p> ")

;;variables for holding markup
(define newString "")
(set! newString openTitle)
(define markup "") ;;all markup to be displayed
(define tempMarkup "") ;;temp markup for title and body to then add to markup

;;Write markup for displaying title.
(define (makeTitle title)
  (set! tempMarkup openTitle)
  (set! tempMarkup (string-append tempMarkup title))
  (set! tempMarkup (string-append tempMarkup closeTitle))
  (set! markup (string-append markup tempMarkup))
  (set! tempMarkup "")
  )

;;Write markup for displaying body.
(define (makeBody body)
  (set! tempMarkup openBody)
  (set! tempMarkup (string-append tempMarkup body))
  (set! tempMarkup (string-append tempMarkup closeBody))
  (set! markup (string-append markup tempMarkup))
  (set! tempMarkup "")
  )

;;Creating a root tag for the posts.
(define (makeopenRoot)
  (set! markup (string-append markup root))
  )

(define (makecloseRoot)
  (set! markup (string-append markup closeRoot))
  )

;;Creating a div for each posts for styling.
(define (makeOpenPost)
  (set! markup (string-append markup openPost))
  )

(define (makeClosePost)
  (set! markup (string-append markup closePost))
  )

;;For displaying the markup onto the web page.
(define (displayMarkup)
  (set! markup "")
  (makeopenRoot)
  (map (lambda (row) (makeOpenPost) (makeTitle (getTitle row)) (makeBody (getBody row)) (makeClosePost) ) (allPosts))
  (makecloseRoot)
  (string->xexpr markup))


