
(defun matrix-add (m1 m2)
   ;; TODO: Incomplete function.
   ;; The next line should not be in your solution.
   ; (list 'incomplete)
  (cond
    ((or (null m1) (null m2)) nil)
    (t (cons (add-row (car m1) (car m2)) (matrix-add (cdr m1) (cdr m2))))
  )
)

(defun matrix-multiply (a b)
    ;; TODO: Incomplete function.
    ;; The next line should not be in your solution.
    ; (list 'incomplete)
  (cond
    ((or (null a) (null b)) nil)
    (t (matrix-multiply-helper a (matrix-transpose b)))
  )
)

(defun matrix-transpose (m)
    ;; TODO: Incomplete function
    ;; The next line should not be in your solution.
    ; (list 'incomplete)
  (cond
    ((null m) nil)
    ((null (car m)) nil)
    (t (cons (cars m) (matrix-transpose (cdrs m))))
  )
)

;; my tools

(defun add-row (r1 r2)
  (cond
    ((or (null r1) (null r2)) nil)
    (t (cons (+ (car r1) (car r2)) (add-row (cdr r1) (cdr r2))))
  )
)

(defun matrix-multiply-helper (m1 m2)
  (cond
    ((null m1) nil)
    (t (cons (multiply-row (car m1) m2) (matrix-multiply-helper (cdr m1) m2)))
  )
)

(defun cars (m)
	(cond
		((null m) nil)
		(t (cons (car (car m)) (cars (cdr m))))
	)
)

(defun cdrs (m)
	(cond 
		((null m) nil)
		(t (cons (cdr (car m)) (cdrs (cdr m))))
	)
)

(defun multiply-row (r1 m2)
  (cond
    ((null m2) nil)
    (t (cons (dot-product r1 (car m2)) (multiply-row r1 (cdr m2))))
  )
)

(defun dot-product (r1 r2)
  (cond
    ((or (null r1) (null r2)) 0)
    (t (+ (* (car r1) (car r2)) (dot-product (cdr r1) (cdr r2))))
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

(defun my-caar (a)
	(car(car a))
)

(defun my-cdar (a)
	(cdr(car a))
)