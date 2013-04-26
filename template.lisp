(in-package #:blogdemo)

(<:augment-with-doctype "html" "" :auto-emit-p t)

(defun html-frame (context)
  (<:html
    (<:head (<:title (getf context :title)))
    (<:body
      (<:div
        (<:h1 (getf context :title))
        (<:a :href (genurl 'home ) "HOME") " | "
        (if (logged-on-p)
          (list 
            (<:a :href (genurl 'add ) "ADD A BLAG POST") " | "
            (<:a :href (genurl 'logout)
                 (format nil "Logout ~A"
                         (hunchentoot:session-value :username))))
          (<:a :href (genurl 'login) "LOOOG IIIN"))
        (<:hr))
      (getf context :body))))

(defun render-post (post)
  (list
    (<:div
      (<:h2 (<:a :href 
                 (genurl 'post :id (position post *posts* :test #'equal ))
                 (getf post :title)))
      (<:h3 (<:a :href
                 (genurl 'author :id (getf post :author-id))
                 "BY :" (getf post :author)))
      (<:p (getf post :content)))
    (<:hr)))

(defun add-post-form ()
  (<:form :action (genurl 'add/post) :method "post"
          "Author Name: " (<:br)
          (<:input :type "text" :name "author") (<:br)
          "TItle:  " (<:br)
          (<:input :type "text" :name "title") (<:br)
          "Author Name: " (<:br)
          (<:textarea :name "content" :rows 15 :cols 80) (<:br)
          (<:input :type "submit" :name "SUBMIT!")(<:br)))

(defun login-form ()
  (<:form :action (genurl 'login/post) :method :post
          "User Name" (<:br)
          (<:input :type "text" :name "username" ) (<:br)
          "Password" (<:br)
          (<:input :type "password" :name "password" ) (<:br)
          (<:input :type "submit" :name "LOGAN!")(<:br)))
          
