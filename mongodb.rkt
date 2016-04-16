#lang racket
(require mongodb)

(define m (create-mongo [#:host "localhost" #:port 27017]))
;;eventually work in the mongolab database (for prism)
(define d (make-mongo-db m ))

(current-mongo-db d)
;;schema for a blog post
(define-mongo-struct post "blogs"
  ([title #:required]
   [body #:required]
   [date #:required] ;;perhaps auto write date?
   ))
 
(define p
  (make-post #:title "A test blog post to see if this worked"
             #:body "Please work"))

(define p
  (make-post #:title "Another test blog post to see if this worked"
             #:body "Please work"))