; n-chops
; n-bins
(defun n-chops (tbl &optional (n 8))
  "Equal-frequency discretization with N bins"
  (let ((colnum 0)
	(binsize (/ (negs tbl) n)))
    (dolist (column (table-columns tbl) tbl)
      (when (typep column 'numeric)
	(let ((binname 1)
	      (bincount 0))
	  (dolist (record (table-all (sort-on-gen tbl colnum :comp #'>)))
	    (incf bincount)
	    (when (>= bincount binsize)
	      (incf binname)
	      (setf bincount 0))
	    (setf (nth colnum (eg-features record)) binname))) ; MP: Dumb bin-naming.
	(setf (nth colnum (table-columns tbl)) (discrete-column column)))
      (incf colnum))))

(defun n-bins (tbl &optional (n 8))
  "Equal-width discretization with N bins"
  (let ((colnum 0))
    (dolist (column (table-columns tbl) tbl)
      (when (typep column 'numeric)
	(let ((norm (fill-normal tbl colnum)))
	  (dolist (record (table-all (sort-on-gen tbl colnum :comp #'>)))
	    (setf (nth colnum (eg-features record))
		  (round (* n (/ (- (nth colnum (eg-features record))
				    (normal-min norm))
				 (- (normal-max norm)
				    (normal-min norm))))))))
	(setf (nth colnum (table-columns tbl)) (discrete-column column)))
      (incf colnum))))
