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
  (class horizontal-panel%
    (super-new)
    (define titleoutput (new text-field% (label "    title")
                             (min-height 20)
                             (min-width 200)
                             (parent this)))
    (define output (new text-field% (label "blog")
                        (style '(multiple))
                        (min-height 100)
                        (min-width 400)
                        (parent this)))
    (define (callback button event)
      (define title-new-value (send titleoutput get-value))
      (define new-value (send output get-value))
      (save title-new-value new-value)
      (send output set-value "")
      (send titleoutput set-value "")
      (send howisit show #t))
    (define button (new button% (label "Submit")
                        (vert-margin 0)
                        (parent this)
                        (callback callback)))
    ))

(define howisit (new frame% (label "success")
                     (min-width 400)))

(define f (new frame% (label "prism blog post GUI") (min-width 400) (min-height 500)))

(define tib (new blogPost%
                 (parent f)))

(send f show #t)

