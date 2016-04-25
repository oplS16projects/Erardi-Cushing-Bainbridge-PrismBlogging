#lang web-server/insta
(require "database.rkt")
(require xml)

; A blog is a (listof post)
; and a post is a (post title body)
(struct post (title body))
 
; BLOG: blog
; The static blog.
(define BLOG
  (list (post "Second Post" "This is another post")
        (post "First Post" "This is my first post")))
 
; start: request -> response
; Consumes a request, and produces a page that displays all of the
; web content.
(define (start request)
  (render-blog-page BLOG request))

(define newString "<div><p>")
(define newNewString "")
(define (printStuff7)
  (for ([i 4])
    (set! newString (string-append newString "hello"))) (string->xexpr (string-append newString "</p></div>")))
(printStuff7)

(display (printStuff7))


; render-blog-page: blog request -> response
; Consumes a blog and a request, and produces an HTML page
; of the content of the blog.
(define (render-blog-page a-blog request)
  (response/xexpr
   `(html (head (title "My Blog"))
          '(link ([rel "stylesheet"] [type "text/css"] [href
                                                          "http://alexcushing.com/public/racketstyle.css"]))
          (body (h1 "prism")(div, (printStuff3))))))

;recurisive
(define (printStuff5 start fin)
  (cond
    ((< start fin)
      (string-append (string->xexpr "<p>hello</p>") (printStuff5 (+ 1 start) fin)))))




(define (printStuff2)
    (string->xexpr "<p>hello</p>"))
(display (printStuff2))

(define (printStuff num othernum)
  (if (< num othernum)
      ('(p "memes")
       (printStuff (+ num 1) othernum))
  '(p "lol")))
 
; render-post: post -> xexpr
; Consumes a post, produces an xexpr fragment of the post.
(define (render-post a-post)
  `(div ((class "post"))
        ,(post-title a-post)
        (p ,(post-body a-post))))
 
; render-posts: blog -> xexpr
; Consumes a blog, produces an xexpr fragment
; of all its posts.
(define (render-posts a-blog)
  `(div ((class "posts"))
        ,@(map render-post a-blog)))
