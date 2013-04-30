;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(defpackage #:blogdemo-config (:export #:*base-directory*))
(defparameter blogdemo-config:*base-directory* 
  (make-pathname :name nil :type nil :defaults *load-truename*))

(asdf:defsystem #:blogdemo
  :serial t
  :description "awesome blaggerator"
  :author "big log"
  :license "scotch freedom lisc."
  :depends-on (:RESTAS :SEXML)
  :components ((:file "defmodule")
               (:file "util")
               (:file "template")
               (:file "blogdemo")))
