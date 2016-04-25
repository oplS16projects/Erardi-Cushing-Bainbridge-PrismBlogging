#lang racket
(require db)
(require xml)

(provide displayMarkup)


(define pgc
    (postgresql-connect
     #:server "ec2-54-235-64-239.compute-1.amazonaws.com"
     #:port 5432
     #:user "wnzhkkaivwijul"
     #:database "dbu5lo07i41k3g"
     #:password "xF6aT4Dz6iBEyxEywvli5Tm1hN"
     #:ssl 'yes))
(define testTitle "I HOPE THIS WORKED")
(define testBody "THIS SHOULD BE THE BODY") ;;these variables arep laceholders for what will be filled with user entered data

(define (createBlogPost title body)
  (query-exec pgc "insert into posts.newTable values($1, $2)" title body)
  )

(define (getTitle element)
  (string-trim(vector-ref element 0))
  )

(define (getBody element)
  (string-trim(vector-ref element 1))
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

(define root "<div class='posts'>")
(define closeRoot "</div>")

(define openPost "<div class='post'>")
(define closePost "</div>")

(define openTitle "<h2>")
(define closeTitle "</h2> ")

(define openBody "<p>")
(define closeBody "</p> ")

(define newString "")
(set! newString openTitle)
(define markup "")
(define tempMarkup "")

(define (makeTitle title)
  (set! tempMarkup openTitle)
  (set! tempMarkup (string-append tempMarkup title))
  (set! tempMarkup (string-append tempMarkup closeTitle))
  (set! markup (string-append markup tempMarkup))
  (set! tempMarkup "")
  )

(define (makeBody body)
  (set! tempMarkup openBody)
  (set! tempMarkup (string-append tempMarkup body))
  (set! tempMarkup (string-append tempMarkup closeBody))
  (set! markup (string-append markup tempMarkup))
  (set! tempMarkup "")
  )

(define (makeopenRoot)
  (set! markup (string-append markup root))
  )

(define (makecloseRoot)
  (set! markup (string-append markup closeRoot))
  )

(define (makeOpenPost)
  (set! markup (string-append markup openPost))
  )

(define (makeClosePost)
  (set! markup (string-append markup closePost))
  )


(define (displayMarkup)
  (makeopenRoot)
  (map (lambda (row) (makeTitle (getTitle row)) (makeBody (getBody row)) ) (allPosts))
  (makecloseRoot)
  (string->xexpr markup))

         ;;(string->xexpr (string-append newString closeTitle))
         ;;(set! newString (string-append newString (getBody (getPost posts))))

