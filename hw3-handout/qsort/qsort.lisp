(defun pivot (n xs)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  ; (list 'incomplete)

  (setq left (list ))
  (setq right (list ))
  (partition n xs)
  (setq res (list left right))
)


(defun quicksort (xs)
  ;; TODO: Incomplete function.
  ;; The next line should not be in your solution.
  ;; (list 'incomplete)
  (cond
    ((null xs) nil)
    (t
      (let* ((piv (car xs)) (progress (pivot piv xs)))
        (cond
          ((and (null (car progress)) (null (my-cadr progress))) nil)
          ((null (car progress)) (double-append (list piv) (quicksort (my-cdadr progress))))
          ((null (my-cadr progress)) (double-append (quicksort (car progress)) (list piv)))
          (t (append (quicksort (car progress)) (list piv) (quicksort (my-cdadr progress))))
        )
      )
    )
  )
)

(defun partition (n mlist)   
    (cond 
    	(mlist  
	    	(cond 
	    		((< (car mlist) n) (my-progn
	    			(setq left (double-append left (list (car mlist))))
	    			(partition n (cdr mlist))
	    			))
	    		(t (my-progn
	    			(setq right (double-append right (list (car mlist))))
	    			(partition n (cdr mlist))
	    			))
	    	)
    	)   
    )  
)  

(defun my-cdadr (x)
	(cdr(car(cdr x)))
)

(defun my-cadr (x)
	(car(cdr x))
)

(defun my-progn (x1 x2)

)

(defun double-append (a b)
	(cond 
		( (null a) b)
		( (null b) a)
		(t 
			(cons (car a) (double-append (cdr a) b))
		)
	)
)

(defun triple-append (a b c)
	(double-append a (double-append b c))
)