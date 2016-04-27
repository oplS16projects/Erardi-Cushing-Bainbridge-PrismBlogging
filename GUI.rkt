#lang racket
(require racket/gui/base)
(require db)

(define pgc
  (postgresql-connect
   #:server "ec2-54-235-64-239.compute-1.amazonaws.com"
   #:port 5432
   #:user "wnzhkkaivwijul"
   #:database "dbu5lo07i41k3g"
   #:password "xF6aT4Dz6iBEyxEywvli5Tm1hN"
   #:ssl 'yes))
(define testTitle "I HOPE THIS WORKED")
(define testBody "THIS SHOULD BE THE BODY") ;;these variables are placeholders for what will be filled with user entered data

(define (createBlogPost title body)
  (query-exec pgc "insert into posts.newTable values($1, $2)" title body))

(define (save title-new-value new-value)
  (display "title: ")
  (display title-new-value)
  (display "\nblog: ")
  (display new-value)
  (display "\n")
  (createBlogPost title-new-value new-value))

(define blogPost%
  (class object% ; object% instead of horizontal-panel%
    ; This argument is explicit now.
    ; If other code relies on other arguments, specify them here.
    (init parent)
    (super-new)
    (define panel
      (new horizontal-panel% ; this new call is explicit now
           [parent parent]   ; you can later add more arguments
           [alignment '(left top)])) ; and it won't break things
    (define titleoutput
      (new text-field%
           [label "    title"]
           [min-height 20]
           [min-width 200]
           [vert-margin 20]
           [horiz-margin 10]
           [parent panel])) ; panel instead of this
    (define output
      (new text-field%
           [label "blog"]
           [style '(multiple)]
           [min-height 20]
           [vert-margin 20]
           [min-width 400]
           [parent panel])) ; panel instead of this
    (define (callback button event)
      (define title-new-value (send titleoutput get-value))
      (define new-value (send output get-value))
      (save title-new-value new-value)
      (send output set-value "")
      (send titleoutput set-value "SUCCESS"))
      ;(send howisit show #t))
    (define button
      (new button%
           [label "Submit"]
           [vert-margin 0]
           [horiz-margin 10]
           [parent panel] ; panel instead of this
           [callback callback]))
    ))

(define f (new frame% [label "blog post GUI"] [min-width 400] [min-height 500]))

(define tib (new blogPost%
                 [parent f]))

(send f show #t)

