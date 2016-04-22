#lang racket
(require db)
(require xml)

(define pgc
    (postgresql-connect
     #:server "localhost"
     #:port 5432
     #:user "prism"
     #:database "blogs"
     #:password "prism1"))
(define testTitle "I HOPE THIS WORKED")
(define testBody "THIS SHOULD BE THE BODY") ;;these variables arep laceholders for what will be filled with user entered data

(define (createBlogPost title body)
  (query-exec pgc "insert into posts.newTable values($1, $2)" title body)
  )

(define (getTitle element)
  (string-trim(vector-ref element 0))
  )

(define (getBody element)
  (string-trim(vector-ref (vector element) 1))
  )

(define (allPosts)
  (query-rows pgc "select * from posts.newTable")
  )

(define (getPost posts)
  (car (posts)))

;;(getTitle (getPost allPosts))
;;(getBody (getPost allPosts))

;;(define (displayAllBlogs posts)
  ;;(vector-map (lambda (x) (display (getPost x))) posts)
  ;;)

(define openTitle "<p>")
(define closeTitle "</p>")
(define newString "")
(set! newString openTitle)
(define (printStuff3 posts)
  (map (lambda (row) (set! newString (string-append newString (getTitle row)))) posts)
  
  )

         ;;(string->xexpr (string-append newString closeTitle))
         ;;(set! newString (string-append newString (getBody (getPost posts))))

