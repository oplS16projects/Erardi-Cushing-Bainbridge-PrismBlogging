#lang racket
(require racket/gui/base)
(require db)
(define textInButton%
  (class horizontal-panel%
    (super-new)
    (init-field text)
    (define (callback button event)
      (define new-value (string-append (send output get-value) text))
      (send output set-value new-value))
    (define button (new button% [label "Submit"]
                                (vert-margin 0)
                                [parent this]
                                [callback callback]))
    (define output (new text-field% [label "blog"]
                                    (vert-margin 0)
                                    [parent this]))))


(define f (new frame% [label "prism"] (min-width 400) (min-height 100)))
(define tib (new textInButton%
                 [text " * pretend this just did something for now * "]
                 [parent f]))
(send f show #t)
