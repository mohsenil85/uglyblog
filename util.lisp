(in-package #:blogdemo)
;;;utils
;;;
(defun slug (string)
  (substitute #\- #\Space
              (string-downcase 
                (string-trim '(#\Space #\Tab #\Newline)
                             string))))

(defun validate-post-id (id)
  (let ((id (parse-integer id :junk-allowed t)))
    (if (< id (length *posts*))
      id
      nil)))


(defun get-authors ()
  (loop for post in *posts*
        collect (getf post :author-id)))


(defun validate-author-id (author-id)
  (find author-id (get-authors) :test #'string=))


(defun logged-on-p ()
  (hunchentoot:session-value :username))


 
(defun start-blogdemo (&optional (port 8000))
  (start '#:blogdemo :port port :render-method 'html-frame))

(defun validate-author-id (author-id)
  (find author-id (get-authors) :test #'string=))


(defun logged-on-p ()
  (hunchentoot:session-value :username))


 
