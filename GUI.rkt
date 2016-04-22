#lang racket
(require racket/gui/base)
(require "newdb.rkt")


(define (save new-value)
  display new-value)

(define textInButton%
  (class horizontal-panel%
    (super-new)
    (init-field text)
    (define (callback button event)
      (define new-value (send output get-value))
      (save new-value))
    (define button (new button% (label "Submit")
                        (vert-margin 0)
                        (parent this)
                        (callback callback)))
    (define output (new text-field% (label "blog")
                        (min-height 450)
                        (min-width 400)
                        (vert-margin 0)
                        (parent this)))
    ))


(define f (new frame% (label "prism blog post GUI") (min-width 400) (min-height 500)))

(define tib (new textInButton%
                 (text "******")
                 (parent f)))

(send f show #t)

