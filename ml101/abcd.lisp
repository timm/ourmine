(defun results-report (results)
	"Update all fields in a hash of results"
  (dohash (klass result results results)
    (result-report result)))
    
(defun result-report (result)
"Update all fields in one result"
  (with-slots ( a b c d acc pf prec pd f) result
    (let ((zip (float (expt 10 -16))))
      (setf acc  (/ (+ a d) (+ zip a b c d))
            pf   (/ c       (+ zip a c    ))
            prec (/ d       (+ zip c d    ))
            pd   (/ d       (+ zip b d    ))
            f    (/ (* 2 prec pd) (+ zip prec pd)))
      result)))

(defun klasses->results (tbl &optional note)
 "For each class in a table, generate one place to store results"
  (let ((results (make-hash-table)))
    (dolist (klass (theklasses tbl) results)
      (let ((name (klass-name klass)))
	(setf (gethash name results)
	      (make-result :target name :details note))))))
    
(defun results-add (results actual predicted)
  (dohash (target result results results)
    (with-slots (a b c d) result
      (if (eql actual target)
	  (if (eql predicted actual)
	      (incf d)
	      (incf b))
	  (if (eql predicted target)
	      (incf c)
	      (incf  a))))))
