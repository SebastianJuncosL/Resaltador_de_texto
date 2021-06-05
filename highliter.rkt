;;; Sebastian Juncos
;;; Carolina Ortega
;;; Ximena Gonzalez

;;; Syntax Highliter with Mutlithread

;;; All files must be in the same directory
#lang racket

(provide main)
(require racket/trace)

(define (make-elements json-string)
  (let loop ([values-for-html empty] [json-string json-string])
    (if (string=? json-string "")
      values-for-html
      (let
        ([token
          (cond [(regexp-match #px"^[\\d]+\\.\\d+" json-string) (list "integer" (car(regexp-match #px"^[\\d]+\\.\\d+" json-string)))]
            [(regexp-match #px"^[\\d]+" json-string) (list "integer"(car(regexp-match #px"^[\\d]+" json-string)))]
            [(regexp-match #px"^true|false|null" json-string)(list "specialvar" (car(regexp-match #px"^true|false|null" json-string)))]
            [(regexp-match #px"^(\"[^\"]+\")(\\s*:)" json-string) (list "key" (cadr (regexp-match #px"^(\"[^\"]+\")(\\s*:)" json-string)))]
            [(regexp-match #px"^[,\\[\\]{}():]" json-string) (list "specialchar" (car(regexp-match #px"^[,\\[\\]{}():]" json-string)))]
            [(regexp-match #px"^[\r\n]+" json-string) (list "newline" (car(regexp-match #px"^[\r\n]+" json-string)))]
            [(regexp-match #px"^\\s" json-string) (list "invisible" (car(regexp-match #px"^\\s" json-string)))]
            [(regexp-match #px"^\"[^\"]+\"|\"\"" json-string) (list "string" (car (regexp-match #px"^\"[^\"]+\"|\"\"" json-string)))])])
        (loop 
          (append values-for-html token)(substring json-string (string-length (cadr token)))
        )
      )
    )
  )
)

(define (create-html token new-html-file-name)
  (let loop
    ([token token][list-html '("<!DOCTYPE html><html lang=\"en\"><head><link rel=\"stylesheet\" href=\"highliter.css\"><title>Highliter</title></head><body>")])
    (if (empty? token)
      (write-file (string-append new-html-file-name ".html") (append list-html '("</body></html>")))
      (loop 
        (cddr token)
        (append list-html 
          (list
            (cond
              [(string=? (car token) "newline") "<br>"]
              [(string=? (car token) "invisible") "&nbsp;"]
              [else (string-append "<span class='" (car token) "'>" (cadr token) "</span>")])))))))

(define (write-file out-file-path data)
  (call-with-output-file out-file-path
    #:exists 'truncate
    (lambda (out)
      (let loop
        ([lst data])
        (cond
          [(not (empty? lst))
             (displayln (car lst) out)
             (loop (cdr lst))])))))


(define (main in-file-path)
  (let*
    ([html-chunks (list "<span class='" "'>" "</span>")]
    [read-json-string (file->string in-file-path)]
    [dictionary (make-elements read-json-string)]
    [new-html-file-name (car (regexp-match #px"^[\\w-]+" in-file-path))])
    (create-html dictionary new-html-file-name)
    (print "cerrado")))

;;; -------------------------------------------------------------------------------


(define (find-files)
  (let loop
    ([values-files empty][json-string (map path->string (directory-list))])
    (if (empty? json-string)
      values-files
      (loop
        (if (regexp-match? #px".json$" (car json-string))
          (append values-files (list (car json-string)))
          values-files
        )
        (cdr json-string)
      )
    )
  )
)

(define (make-future current-file)
  (future (lambda()(main current-file)))
)

(define (divide-in-futures)
  (define futures (map make-future (find-files)))
  (map touch futures)
)
