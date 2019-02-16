
; (defun match (pattern assertion)
;    ;; TODO: incomplete function. 
;    ;; The next line should not be in your solution.
;    ; (list 'incomplete)
; )

(defun match (pattern assertion)
    (cond
		((or (null pattern) (null assertion)) (equal pattern assertion))
		((equal (car pattern) '?) (match (cdr pattern) (cdr assertion)))
		((equal (car pattern) '!) (when-equal-! pattern assertion))
		(t (and (equal (car pattern) (car assertion)) (match (cdr pattern) (cdr assertion))))
    )
) 

(defun when-equal-! (pattern assertion)
	(cond 
		((match (cdr pattern) (cdr assertion)) t)
		(t (match pattern (cdr assertion)))
	)
)