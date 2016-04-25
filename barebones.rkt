#lang web-server/insta
(require "database.rkt")
(require xml)

; start: request -> response
; Consumes a request, and produces a page that displays all of the
; web content.
(define (start request)
  (render-blog-page request))

; render-blog-page: blog request -> response
; Consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page request)
  (response/xexpr
   `(html (head (title "My Blog"))
          '(link ([rel "stylesheet"] [type "text/css"] [href
                                                          "http://alexcushing.com/public/racketstyle.css"]))
          (body (h1 '(a ((href "http://prsmphoto.com/")) "prism")(div, (displayMarkup))))))
