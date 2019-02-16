(defun reachable (transition start final input)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    ; (list 'incomplete)
    (setq start (list start))
    (cond 
        ((null input) (my-search start final))
        ( t (my-reachable transition (get_trans_states transition start (car input)) final (cdr input) ) )
	)
)

    
;; my tools

(defun my-reachable (transition start final input)
    (cond 
        ((null input) (my-search start final))
        ( t (my-reachable transition (get_trans_states transition start (car input)) final (cdr input) ) )
	)
)


(defun get_trans_states (transition start input)  
    (setq my-final '())
    (cond 
        (  (null start) my-final )
        ( t (triple-append 
        	my-final (funcall transition (car start) input)  (get_trans_states transition (cdr start) input)
        	))
    )
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

(defun my-search (start final)
	( cond 
	    (( or (null start) (null final)) nil )

	    ( (eql (car start) final)  t )
	    (t ( my-search (cdr start) final))
	)
)


