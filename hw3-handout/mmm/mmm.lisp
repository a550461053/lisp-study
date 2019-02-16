(defun min-mean-max (xs)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    ; (list 'incomplete)
    (setq len (getlength xs))
    (setq s 0)
    (setq sum (getsum xs))
    (setq mean (/ sum len))

    (setq mymax (car xs))
    (setq mymin (car xs))
    (setq res-max (maxofnums xs))
    (setq res-min (minofnums xs)) 
    (setq res (list res-min mean res-max))
)

(defun mymax (x y)
	(cond ((> x y) x) (t y))
)

(defun getlength(mlist)
	(cond (mlist
		; (progn (setf *length* (cond (mlist) *length* ))
		(+ (getlength (cdr mlist)) 1))
		(t 0)
	)
)

(defun getsum(mlist)
	(cond (mlist
		(my-progn (setq s (+ s (car mlist)))
		(getsum (cdr mlist))))
		(t s) 
	)
)
  
(defun maxofnums(mlist)   
    (cond 
    	(mlist  
        (my-progn (setq mymax (cond ((> mymax (car mlist)) mymax) (t (car mlist))))  
        (maxofnums (cdr mlist))))  
        (t mymax)   
    )  
)  
  
(defun minofnums(mlist)   
    (cond 
    	(mlist  
        	(my-progn 
	        	(setq mymin (cond ((< mymin (car mlist)) mymin) (t (car mlist))))  
	        	(minofnums (cdr mlist))
        	)
        )  
        (t mymin)  
    )  
)  

(defun my-progn (x1 x2)
	(and x1 x2)
)

