
;question 1:(remove-identities E)
;This function replace any term of the form (+ 0 Exp), (+ Exp 0), (- Exp 0), (* 1 Exp), (* Exp 1) by Exp.
;If it is including such forms, then will return nested Exp. Otherwise, return raw Exp.

;I make a recursion like a binary-tree to solve it and terminate the recursion if it is an atom,
;I solve it following the different forms including '+, '- and '*.
;Also, when the recursion's result has not changed, it will return Exp to backtrack all results.

;Test cases: 
; (remove-identities '(+ x 0)) -> x
; (remove-identities '(+ (+ 5 0) 1)) -> (+ 5 1)


(defun remove-identities (E) 

    (if (atom E) E
    	(cond 
    		( (eq '+ (car E)) 
    			(cond 
    				( (eq 0 (cadr E)) (remove-identities (caddr E)) )
    				( (eq 0 (caddr E)) (remove-identities (cadr E)) )
    				( T 
    					( if ( and (eq (cadr E) (remove-identities (cadr E)) ) (eq (caddr E) (remove-identities (caddr E)))) E
    						(remove-identities (list (car E) (remove-identities (cadr E)) (remove-identities (caddr E)))) 
    					)
    				)
    			)
    		)
    		( (eq '- (car E))
    			(cond
    				( (eq 0 (caddr E)) (remove-identities (cadr E)) )
    				( T 
    					( if ( and (eq (cadr E) (remove-identities (cadr E)) ) (eq (caddr E) (remove-identities (caddr E)))) E
    						(remove-identities (list (car E) (remove-identities (cadr E)) (remove-identities (caddr E)))) 
    					)
    				)
    			)
    		)
    		( (eq '* (car E))
    			(cond
    				( (eq 1 (cadr E)) (remove-identities (caddr E)) )
    				( (eq 1 (caddr E)) (remove-identities (cadr E)) )
    		    	( T 
    					( if ( and (eq (cadr E) (remove-identities (cadr E)) ) (eq (caddr E) (remove-identities (caddr E)))) E
    						(remove-identities (list (car E) (remove-identities (cadr E)) (remove-identities (caddr E)))) 
    					)
    				)
    			)
    		)
    		(T E)
    	)
    )
)


;question2:(simplify-zeroes E)
;This function replace any term of the form (* 0 Exp), (* Exp 0), (- Exp Exp) by Exp.
;If it is including such forms, then will return nested Exp. Otherwise, return raw Exp.

;I make a recursion like a binary-tree to solve it and terminate the recursion if it is an atom.
;Also, when the recursion's result has not changed, it will return Exp to backtrack all results.
;For the (- Exp Exp) zero expression, the first Exp and second Exp argument must be equal, not just equivalent. 
;For example, (- (+ x 1) (+ 1 x)) would not be simplified whereas (- (+ x 1) (+ x 1)) would be simplified.

;Test cases: 
; (simplify-zeroes 0) -> 0
; (simplify-zeroes '(* x (* 0 0))) -> 0
;


(defun simplify-zeroes (E)
  (if (atom E) E
  	(cond 
  		( (eq '* (car E)) 
  			(cond
				( (or (eq 0 (cadr E)) (eq 0 (caddr E))) 0)
				( (eq 0 (simplify-zeroes (cadr E))) 0)
				( (eq 0 (simplify-zeroes (caddr E))) 0)
				( T (list (car E) (simplify-zeroes (cadr E)) (simplify-zeroes (caddr E))) )
  			)
  		)
  		( (eq '- (car E))
 			(cond
				( (eq (cadr E) (caddr E)) 0)
	  			( (equal (simplify-zeroes (cadr E)) (simplify-zeroes (caddr E)))  0 )
				( T (list (car E) (simplify-zeroes (cadr E)) (simplify-zeroes (caddr E))) )
  			)
  		)
  		(T (list (car E) (simplify-zeroes (cadr E)) (simplify-zeroes (caddr E))) )
  	)
  )
)


;question3:(simplify E)
;This function repeatedly call question1 and question2:
; 1. remove-identities, followed by 
; 2. simplify-zeroes, 
; until no more simplification is possible in either step 1 or 2

;I also make a recursion to solve it and terminate the recursion if it is not changed.

;Test cases: 
; (simplify '(- (+ 0 x) (+ x 0))) -> 0
; (simplify '(+ (- 0 (* 0 x)) (* x 1))) -> x
; (simplify '(+ 1 (- x x))) -> 1

(defun simplify (E)
	(cond
		( (equal E (simplify-zeroes (remove-identities E))) E )
		( T ( simplify (simplify-zeroes (remove-identities E))) )
	)
)

;question4:(normalize P)
;This function compact the polynomial P.
; PExpr as a Compact Representation of Polynomials
; The input P is an arbitrary PExpr. 
; return the normal form of P. 

; Helper functions:
; add-item (P1 P2):return the sum of two terms.
; merge-item (P):return PExpr with only one item per exponent.
; get-res (P):return results without 0.

;My solution has three steps:
;First step is to sort them by second item.
;Second step is to merge them and return the list by recursion.
;Last step is to get all result by remove items 0.

;Test cases: 
; normalize '((5 . 10) (3 . 4) (7 . 0)) -> '((5 . 10) (3 . 4) (7 . 0))
; normalize '((5 . 3) (0 . 2) (3 . 1) (7 . 0))) -> '((5 . 3) (3 . 1) (7 . 0))


(defun add-item (P1 P2)
	(cons ( + (car P1) (car P2)) (cdr P1))
)

(defun merge-item (P)
	(if (null P) P
		(if (eq (cdar P) (cdadr P)) (merge-item (cons (add-item (car P) (cadr P)) (cddr P)))
			(cons (car P) (merge-item (cdr P)))
		)
	)
)

(defun get-res (P)
	(if (null P) nil
		(if (eq 0 (caar P)) (get-res (cdr P))
			(cons (car P) (get-res (cdr P)))
		)
	)
)

(defun normalize (P)
	(if (null P) nil
		(let* ((res  (merge-item (sort P (lambda (P1 P2) (>= (cdr P1) (cdr P2))))) ) )
			(get-res res)
		)
	)
)



;question5-1:
; (poly-add P1 P2)
; (poly-subtract P1 P2) 
; the input is two PExprs P1 and P2.
; return is P1 + P2 and P1 - P2;

;I make a easy solution to solve them.
;poly-add can transfer to normalize by append function.
;poly-subtract can transfer to poly-add by negative P2.

;Test cases: 
; (poly-add '((5 . 2) (3 . 1) (7 . 0)) 
; 			'((5 . 2) (3 . 1) (7 . 0))) -> '((10 . 2) (6 . 1) (14 . 0))  
; (poly-subtract '((-9 . 0)) '((5 . 0))) -> '((-14 . 0))


(defun poly-add (P1 P2)
  (normalize (append P1 P2)))

(defun poly-subtract (P1 P2)
	(let* ((negP2 (mapcar (lambda (x) (cons ( - (car x) ) (cdr x))) P2) ))
		(poly-add P1 negP2)
	)
)


;question5-2:
; (poly-muliply p1 p2)
; input p1, p2: polynomial expressions
; return the normalized product of two polynomial expressions p1 * p2.

;My solution also have three steps:
;First step is to multiply item by item, x * x.
;Second step is to multiply P by item, x * (x + 1).
;Last step is to multiply P by P, (x + 1) * (x + 1).

;Test cases: ]
; poly-multiply  nil '((5 . 3) (1 . 2) (3 . 1) (7 . 0))) -> 'NIL
; poly-multiply '((5 . 2) (3 . 1) (7 . 0)) '((-10 . 0))) -> '((-50 . 2) (-30 . 1) (-70 . 0))


; x * x
(defun multiply-item-item (Pt1 Pt2)
	(cons ( * (car Pt1) (car Pt2) ) (+ (cdr Pt1) (cdr Pt2)))
)

; x * (x + 1)
(defun multiply-item-poly (Pt1 P)
	(if (null (car P)) nil
		(cons (multiply-item-item Pt1 (car P)) (multiply-item-poly Pt1 (cdr P)))
	)
)

; (x + 1) * (x + 1)
(defun poly-multiply (P1 P2)
	(if (null (car P1)) nil
		(normalize (append (multiply-item-poly (car P1) P2) (poly-multiply (cdr P1) P2)) )
	)
)

;question5-3:
; (polynomial E)
; input E is a simple lisp expression
; return a polynomial expression equivalent to E in normal form  

;I make a solution by a recursion, with the base cases:
; 1. integer n - represent by (n . 0) 
; 2. atom x - represent by (1 . 1)

;Test cases: 
; (polynomial -42) -> '((-42 . 0))
; (polynomial '(+ (+ 5 0) (- 4 9))) -> nil


(defun polynomial (E)
	(if (atom E) (cond
		  	( (integerp E) (cons (cons E 0) nil) )
			( (eq 'x E) (cons (cons 1 1) nil) )
			( T nil )
		)
		(cond 
			( (eq '+ (car E)) (poly-add (polynomial (cadr E)) (polynomial (caddr E))) )
			( (eq '- (car E)) (poly-subtract (polynomial (cadr E)) (polynomial (caddr E))) )
			( (eq '* (car E)) (poly-multiply (polynomial (cadr E)) (polynomial (caddr E))) )
			( T nil )
		)
	)
)


;question6:(print-pexpr P)
; (print-pexpr P)
; input P: a polynomial expression in normal form
; return a string representing P in the "common sense" format:
; Print terms in the form cx^n, where c and n are integer
; Print " + " (space plus space) or " - " (space minus space) between the terms, depending on whether the next term has a positive or negative coefficient
; Print terms in sorted order from highest to lowest exponent
; Do not print the 1 if the coefficient is 1, except for the constant term
; Print -, not -1 if the coefficient is -1, except for the constant term
; Do not print *x^0 for a constant term
; Print x instead of x^1
; Print 0 if the PExpr is nil.
; and e.g -x^2 + 2x + 1.

;I make many tools functions like the hints.
; Helper functions:
; concat (S1 S2): return concatenate two strings.
; tri-concat (S1 S2 D3): return format the string output, 2x^2
; print-sign (t1): return the print of the sign of the expression S.
; print-operation (t1): return the print of the operation, + -.
; print-constant (t1): return the print of constant, 2.
; print-term (t1 flag): return each item and two situations.
; print-recursive-pexpr (str P): return the results of P by recursion.

;The main idea is to deal with the two different situations:
;the first item and the back items.

;Test cases: 
; (print-pexpr '((23 . 0))) -> "23"
; (print-pexpr '((-1 . 1) (-1 . 0))) -> "-x - 1"


(defun concat (S1 S2) 
	(concatenate 'string S1 S2)
)

(defun tri-concat (S1 S2 D3)
	(concatenate 'string S1 S2 "x^" (write-to-string D3))
)

; print the sign of the expression S.
(defun print-sign (t1)
	(if (< (car t1) 0) "-" "")
)

(defun print-operation (t1)
	(if (> (car t1) 0) " + " 
		" - "
	)
)

(defun print-constant (t1)
	(if (eq 1 (abs (car t1))) ""
		(write-to-string (abs (car t1)))
	)
)

(defun print-term (t1 flag)
	(if (equal "first" flag) 
		(cond 
			( (eq 0 (cdr t1)) (write-to-string (car t1)) )
			( (eq 1 (cdr t1)) (concat (concat (print-sign t1) (print-constant t1)) "x" ) )
			( t (tri-concat (print-sign t1) (print-constant t1) (cdr t1)) )
		)
		(cond 
		  	( (eq 0 (cdr t1)) (concat (print-operation t1) (write-to-string (abs (car t1)))) )
			( (eq 1 (cdr t1)) (concat (concat (print-operation t1) (print-constant t1)) "x" ) )
			( t (tri-concat (print-operation t1) (print-constant t1) (cdr t1)) )
		)
	)
)

(defun print-recursive-pexpr (str P)
	(if (null P) str
		(print-recursive-pexpr (concat str (print-term (car P) "second")) (cdr P))
	)
)

(defun print-pexpr (P)
	(if (null P) "0"
		(print-recursive-pexpr (print-term (car P) "first") (cdr P))
	)
)