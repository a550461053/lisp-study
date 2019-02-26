;Cmput 325 Winter 2019 Assignment 1
;1431912 hryniw James Hryniw

#| --------- QUESTION 1 ---------
 (remove-identities E)
 E: simple lisp expression 
 Recursively simplifies binary expressions of the form (+ 0 Exp), (+ Exp 0), (* 1 Exp)
 and (* Exp 1).

 The function replaces identity expressions in applicative order.
 We terminate the recursion when we recurse on an atom. If it is not an atom, 
 we know that we are dealing with a binary expression of the form (op exp1 exp2).
 The binary expression is then checked against all possible identities and replaced with
 the corresponding expression. For example: (+ 0 Exp) becomes Exp. 

e.g test cases
 (remove-identities '(+ 0 'y)) -> y
 (remove-identities '(+ (+ 0 0) (+ 1 5))) -> (+ 1 5)
|#

(defun remove-identities (E)
  (if (atom E) E
    (let ( (Expr (list (car E) (remove-identities (cadr E)) (remove-identities (caddr E)))) )
      (cond ( (and (eq '+ (car Expr)) (eq 0 (caddr Expr))) (remove-identities (cadr Expr)) )
	    ( (and (eq '+ (car Expr)) (eq 0 (cadr Expr))) (remove-identities (caddr Expr)) )
	    ( (and (eq '- (car Expr)) (eq 0 (caddr Expr))) (remove-identities (cadr Expr)) )
	    ( (and (eq '* (car Expr)) (eq 1 (caddr Expr))) (remove-identities (cadr Expr)) )
	    ( (and (eq '* (car Expr)) (eq 1 (cadr Expr))) (remove-identities (caddr Expr)) )
	    ( t Expr )))))

#| --------- QUESTION 2 --------- 
 (simplify-zeroes E)
 E: simple lisp expression
 Recursively simplifies binary expressions of the form (* 0 Exp), (* Exp 0), (- Exp Exp)
 to 0.

 The function replaces zero expressions in applicative order.
 We terminate the recursion when we recurse on an atom. If it is not an atom,
 we know that we are dealing with a binary expression of the form (op exp1 exp2).
 The binary expression is checked against all possible zero expressions. 
 For example: (* Exp 0) becomes 0.

 Note: For the (- Exp Exp) zero expression, Exp as the first and second argument must
 be equal, not just equivalent. For example, (- (+ x 2) (+ 2 x)) would not be simplified
 whereas (- (+ x 2) (+ x 2)) would be simplified.
  
e.g test cases
 (simplify-zeroes '(* 'x 0)) -> 0
 (simplify-zeroes '(* 0 'x)) -> 0
 (simplify-zeroes '(- (+ 'x (- 'x 2)) (+ 'x (- 'x 2)))) -> 0
 (simplify-zeroes '(- (+ x 2) (+ 2 x))) -> (- (+ x 2) (+ 2 x))
|#

(defun simplify-zeroes (E)
  (if (atom E) E
    (let ( (Expr (list (car E) (simplify-zeroes (cadr E)) (simplify-zeroes (caddr E)))) )
      (cond ( (and (eq '* (car Expr)) (eq 0 (caddr Expr))) 0 )
	    ( (and (eq '* (car Expr)) (eq 0 (cadr Expr))) 0 )
	    ( (and (eq '- (car Expr)) (equal (cadr Expr) (caddr Expr))) 0 )
	    ( t Expr )))))

#| --------- QUESTION 3 ---------
 (simplify E)
 E: simple lisp expression
 
 Simplifies both zero and identity expressions until no more simplifications
 of those types are possible. 

 Tries to simplify the expression by calling remove-identites 
 then calling simplify-zeros on the expression. Checks the result against the original
 expression for any simplifications. If the expression was simplified, call simplify recursively
 on the simplified expression, otherwise terminate the recursion. 

 The order that simplify-zeros and remove-identities are called does not matter. The reasoning
 is that either function will exhaust all possible simplifications of a certain type, so it 
 only makes sense to call each function in alternating order (e.g remove-identities, 
 simplify-zeros, remove-identities, etc...). Given that, we can consider that the expression can 
 only be simplified in two distinct orders, starting with a call to remove-identities or a
 call to simplify-zeroes. However, if the first call does not simplify the expression, we actually 
 fall into the other ordering. Therefore, calling either function first in the simplify function is  capable of calling the two simplification functions in any possible sequence. So the call order 
 does not matter. The underlying condition is that simplify-zeroes and remove-identities are not abl e to simplify the same types of expressions in different ways, and by their definitions they do not. 
e.g test cases
 (simplify '(- (+ 0 x) (+ x 0))) -> 0
 (simplify '(+ (- 0 (* 0 x)) (* x 1))) -> x
|#

(defun simplify (E)
  (let ( (S (simplify-zeroes (remove-identities E))) )
    (if (equal E S)
      E
      (simplify S))))

#| --------- QUESTION 4 ---------
 (normalize P)
 P: arbitrary polynomial expression
 
 Returns the normal form of P, which obeys the following properties.
 1. Exponents are in decreasing order
 2. No two terms have the same exponent 
 3. There are no 0 coefficients
 
 Normalization is done through a simple 3-step process, with each step corresponding to one
 of the criteria above.
 1. We sort the terms in P by their exponent
 2. We iterate over each term in P, combining adjacent terms if they have the same
    exponent.
 3. Finally, terms are filtered if they have a 0 coefficient
 
 Helper functions:
 (sort-terms P): returns P with terms sorted in decreasing order 
   (mylast '((5 . 2) (7 . 0) (3 . 1))) -> '((5 . 2) (3 . 1) (7 . 0))
 (add-terms t1 t2): returns the sum of two terms WITH THE SAME EXPONENT
   (add-terms '(-4 . 2) '(6 . 2)) -> (2 . 2) 
 (merge-terms P): returns equivalent P expression with only one term per exponent
   (merge-terms '((5 . 2) (-7 . 2) (3 . 2) (2 . 0))) -> ((1 . 2) (2 . 0))
 
 Note: Polynomials are generally stored in arguments/variables prefaced with 'p'
 whereas terms are prefaced with 't'

e.g test cases
 (normalize '((2 . 3) (6 . 0) (2 . 1))) -> ((2 . 3) (2 . 1) (6 . 0))
 (normalize '((2 . 2) (1 . 3) (5 . 2))) -> ((1 . 3) (7 . 2))
 (normalize '((1 . 4) (0 . 2) (1 . 1))) -> ((1 . 4) (1 . 1))
|#

(defun sort-terms (P)
  (sort P (lambda (t1 t2) (>= (cdr t1) (cdr t2)))))

(defun add-terms (t1 t2)
  (cons (+ (car t1) (car t2)) (cdr t1)))

(defun merge-terms (P)
  (if (null P) P
      (let ( (t1 (car P)) (t2 (cadr P)) )
	(if (eq (cdr t1) (cdr t2))
	    (merge-terms (cons (add-terms t1 t2) (cddr P)))
	    (cons t1 (merge-terms (cdr P)))))))

(defun normalize (P)
  (remove-if (lambda (t1) (eq (car t1) 0)) (merge-terms (sort-terms P))))

#| --------- QUESTION 5-1 ---------
 (poly-add p1 p2)
 (poly-subtract p1 p2) 
 p1, p2: polynomial expressions
 Returns the normalized sum / difference of two polynomial expressions.
 
 Since poly-subtract is implemented in terms of poly-add as the sum p1 + (- p2),
 we only explicitly implemented binary addition. To do this, we need to sum all 
 terms with the same exponent. HEY WAIT, we already did that for one polynomial
 expression in (normalize P). So, simply union the polynomials and normalize them.
  
 Helper functions:
 (negate P): returns -P, by returning the negative of every term in P
   (negate '((3 . 1) (-2 . 0))) -> ((-3 . 1) (2 . 0))

e.g test cases
 (poly-add '((1 . 0)) '((1 . 0)) -> ((2 . 0))
 (poly-add '((3 . 2) (2 . 1) (-4 . 0)) '((2 . 2) (1 . 0))) -> ((5 . 2) (2 . 1) (-3 . 0))
 (poly-subtract '((-2 . 2)) '((-2 . 2) (4 . 1) (-1 . 0))) -> ((-4 . 1) (1 . 0))
|#

(defun poly-add (p1 p2)
  (normalize (append p1 p2)))

(defun negate (P)
  (mapcar (lambda (t1) (cons (- (car t1)) (cdr t1))) P))

(defun poly-subtract (p1 p2)
  (poly-add p1 (negate p2)))

#| --------- QUESTION 5-2 ---------
 (poly-muliply p1 p2)
 p1, p2: polynomial expressions
 Returns the normalized product of two polynomial expressions.
 
 Works using a two level mapping where 
 1. each term in p1 is multiplied to every term in p2. The result is a list of lists of terms
    where each sublist is the product of one term in p1 with every term in p2.
 2. the list of lists of terms is flattened into one list of terms (i.e a polynomial)
 3. the polynomial is normalized

 Helper functions:
 (true-list a): returns T if a is a nil-terminated list (i.e "true" list) or the empty list.
   (true-list '(1)) -> t
   (true-list '(1 . 1)) -> nil
 (flatten L): converts a deeply nested list into a shallow list of atoms and/or dotted pairs
   (flatten '(((1 . 1) (2 . 2)) (3 . 3))) -> ((1 . 1) (2 . 2) (3 . 3))
 (mult-terms t1 t2): returns the simple product of two terms

e.g test cases
 ; x * 2 = 2x
 (poly-multiply '((1 . 1)) '((2 . 0))) -> (2 . 1)
 ; (x + 1) * (x - 1) = x^2 - 1
 (poly-multiply '((1 . 1) (1 . 0)) '((1 . 1) (-1 . 0))) -> ((1 . 2) (-1 . 0))
|#

(defun true-list (a)
  (cond ( (null a) t )
	( (not (consp a)) nil )
	( t (true-list (cdr a)) ))) 

(defun flatten (L)
  (cond ( (null L) nil )
	( (not (true-list (car L))) (cons (car L) (flatten (cdr L))) )
	( t (append (flatten (car L)) (flatten (cdr L))) )))

(defun mult-terms (t1 t2)
  (cons (* (car t1) (car t2)) (+ (cdr t1) (cdr t2))))

(defun poly-multiply (p1 p2)
  (normalize (flatten
    (mapcar (lambda (t1)
              (mapcar (lambda (t2)
		        (mult-terms t1 t2)) p2)) p1))))

#| --------- QUESTION 5-3 ---------
 (polynomial E)
 E: simple lisp expression
 Returns a polynomial expression equivalent to E in normal form  
 
 Converts integers, symbols and +, -, * expressions to polynomial form.
 We only support the variable x. Any other variable will 
 The base cases:
   integer n -> (n . 0)
   x -> (1 . 1)
 The +, -, and * operations are delegated to the poly-add, poly-subtract, 
 and poly-multiply functions.
 
e.g test cases
(polynomial '(+ 1 0)) -> (1 . 0)
(polynomial '(* (+ x 1) (- x 1))) -> ((1 . 2) (-1 . 0))
|#

(defun polynomial (E)
  (cond ( (integerp E) (cons (cons E 0) nil) )
	( (eq 'x E) (cons (cons 1 1) nil) )
	( (eq '+ (car E)) (poly-add (polynomial (cadr E)) (polynomial (caddr E))) )
	( (eq '- (car E)) (poly-subtract (polynomial (cadr E)) (polynomial (caddr E))) )
	( (eq '* (car E)) (poly-multiply (polynomial (cadr E)) (polynomial (caddr E))) )))

#| --------- QUESTION 6 ---------
 (print-pexpr P)
 P: a polynomial expression in normal form
 Outputs a polynomial as a string in the "common sense" format.
 e.g -x^2 + 2x + 1
  
 Prints the first element differently because it cannot be preceeded by an operand.
 Otherwise, prints P term-by-term, with 0 and 1 exponents and +-1 constant multipliers
 not being printed. If P is nil, prints "0"

 Helper functions:
  (concat s1 s2):           concatenates two strings
  (print-sign t1):          prints the sign (- or nothing) of t1
  (print-constant t1):      prints the absolute value of t1's constant, except for +-1
  (print-first-term t1):    prints t1 as a first term, with a sign instead of a preceeding operand
  (print-operand t1):       prints " + " or " - " depending on the sign of t1
  (print-term t1):          prints t1 with a preceeding operand
  (print-rest-pexpr acc P): prints all terms in P, should be seeded with the first term in acc     

e.g test cases
 (print-pexpr '((4 . 0))) -> "4"
 (print-pexpr '((3 . 2) (-2 . 1) (1 . 0))) -> "3x^2 - 2x + 1"
 (print-pexpr nil) -> "0" 
|#

(defun concat (s1 s2)
  (concatenate 'string s1 s2))

(defun print-sign (t1)
  (if (< (car t1) 0) "-" ""))

(defun print-constant (t1)
  (if (= (abs (car t1)) 1) ""
      (write-to-string (abs (car t1)))))

(defun print-first-term (t1)
  (cond ( (= 0 (cdr t1)) (write-to-string (car t1)) )
	( (= 1 (cdr t1)) (concat (concat (print-sign t1) (print-constant t1)) "x" ) )
	( t (format nil "~A~Ax^~D" (print-sign t1) (print-constant t1) (cdr t1)) )))

(defun print-operand (t1)
  (if (< (car t1) 0) " - " " + "))

(defun print-term (t1)
  (cond ( (= 0 (cdr t1)) (concat (print-operand t1) (write-to-string (abs (car t1)))) )
	( (= 1 (cdr t1)) (concat (concat (print-operand t1) (print-constant t1)) "x" ) )
	( t (format nil "~A~Ax^~D" (print-operand t1) (print-constant t1) (cdr t1)) )))

(defun print-rest-pexpr (acc P)
  (if (null P) acc
      (print-rest-pexpr (concat acc (print-term (car P))) (cdr P))))

(defun print-pexpr (P)
  (if (null P) "0"
      (print-rest-pexpr (print-first-term (car P)) (cdr P))))