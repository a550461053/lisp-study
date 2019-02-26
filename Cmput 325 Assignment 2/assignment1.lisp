;Name:Su Dong
;Student number:1435208
;course:cmput325
;year:2019
;assignment number:1

;question 1:(issorted L)
;This function checks whether a given list of integers L is sorted in increasing order. If it is in increasing order, then will
;return T. Otherwise, return nil. 

;At first, it checks the size of given list. If it is less or equal to 1, we assume it is sorted and return T. Otherwise, we 
;compare the first element and second element in the list. If the first element is larger than the second one, return nil. If 
;not, we recurse the function and compare the second element and the third one continously till the last one elemment.

;Test cases: 
;(issorted '(5 9 12))
;(issorted '(1 2 3 4 5 5))


(defun issorted (L)
      (if (null(cdr L))
            T
            (if (>= (car L) (cadr L))
                  nil
                  (issorted(cdr L))
            )
      )
) 

;question2:(numbers N)
;we take nonnegative integer N and produce a list of all integers from 1 up to and including N 

;at first, we need to check the value of N. If N is larger than 0, we add the number N to the list with function append. 
;Then recurse the function numbers. If N is 0 or less than, return nil

;test cases:
;(numbers 0)
;(numbers 1)

(defun numbers (N) 
    (if (> N 0)
        (append (numbers (- N 1)) (cons N nil))
        nil
    )
)

;question3:(palindrome L)
;give a list L, this function checks whether L is palindrom, which means reads the same from the front and the back

;for the problem, we define other two functions called mylast and removelast to complete the task. The fuction mylast 
;is for getting the last element from the given list L. By (null (cdr L)), if it returns T then we can know there is only 
;one element left in list L. Otherwise, it keeps recursing. The fuction removelast is for cutting the last element from 
;list L becasuse we always need to compare whether the first element is equal to last one in L. This is what the function 
;palindrom is doing. If it returns T, shows that the list L reads the from the front and the back. Otherwise, return nil.

;testcases:
;(palindrome '(a b c b a))
;(palindrome '(a b c c b a))

(defun mylast (L)
     (if (null (cdr L))
         (car L)
         (mylast (cdr L))
     )
)

(defun removeLast (L)
     (if (null (cdr L))
         nil
         (cons (car L) (removeLast (cdr L)))
     )
)

(defun palindrome (L)
    (if (null(cdr L))
        T  
        (if (equal (car L) (mylast L))
            (palindrome(cdr(removelast L)))
            nil
        )
    )
)

;question4(replace1 atom1 atom2 list)
;the function replaces all the instances of atom1 by atom2 in elements of list.Sublist should be left as they are;
;wont replace anything inside a sublist

;the fuction will check whether there is element in the list first. If not, return nil. If there are elements in the list, 
;we compare the first element in the list with A1. If they are the same, we replace A2 with A1 and add the A2 into another
;list. If they are not the same, we add A1 into another list. Then it keeps recursing till the end of the origninal list. 

;testcases:
;(replace1 'a 'b '(a a b c a d))
;(replace1 'a 'b '(a (a)))


(defun replace1 (A1 A2 L)
	(if (null L)
		nil
		(if (equal A1 (car L)) 
			(cons A2 (replace1 A1 A2 (cdr L)))
			(cons (car L) (replace1 A1 A2 (cdr L)))
		)
  )
)

;question5: (common L1 L2)
;give the two lists L1 and L2. This function counts how many atoms are contained in both L1 and l2. And no atom appears 
;more than once.

;we use one build in function called member. It can locate the element if it exists in the list. At first, we check whether 
;the list 1 is empty. If it is, return 0 Then we use the first element in the list 1 to locate in the list 2. If it can locate, which means there
;is the same element appearing in the list 2, then plus 1. It it cant, plus 0. The function keeps recursing till the end of 
;list 1.

;testcases
;(common '(a b c) '(c b a))
;(common '(a b c d) '(e f b g d))

(defun common(L1 L2)
    (if (null L1)
        0
        (if (null (member(car L1) L2)) 
            (+ 0 (common(cdr L1) L2))        
            (+ 1 (common(cdr L1) L2))        
        )
    )
)