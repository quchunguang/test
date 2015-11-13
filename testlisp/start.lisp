#!/usr/bin/clisp

(write-line "Hello World")
(write (+ 1 2 3))

(setq x 10)
(setq y 34.567)
(setq ch nil)
(setq n 123.78)
(setq bg 11.0e+4)
(setq r 124/2)
(print x)
(print y)
(print n)
(print ch)
(print bg)
(print r)
(print (type-of x))
(print (type-of y))
(print (type-of n))
(print (type-of ch))
(print (type-of bg))
(print (type-of r))

(print (cons 4 5))
(print (list 4 5 6))
(print (+ (+ 3 4) (+ (+ 4 5) 6)))

(defun foo (x y) (+ x y 5))
(print (foo 5 0))

; 以递归调用的方式定义函数 fact
(defun fact (x)
    (if (> x 0)
        (* x (fact (- x 1)))
        1))
(print (fact 5))

(defun bar (x)                  ; 一个函数的定义里面如果有很多语句句的话
    (setq x (* x 3))            ; 那整个函数的返回值，
    (setq x (/ x 2))            ; 将会是最后的一个语句句
    (+ x 4))
(print (bar 6))

(format t "An atom: ~S~%and a list: ~S~%and an integer: ~D~%"
          nil (list 5) 6)

