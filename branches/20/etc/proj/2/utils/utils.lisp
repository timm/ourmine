(defun do-over-features (tbl func)
	(dolist (item (table-all tbl)) 
		(setf (eg-features item) (mapcar func (eg-features item)))))

(defun gimme-classes (tbl)
	(mapcar #'eg-class (table-all tbl)))

(defun count-classes (table)
  (let ((class-count (make-hash-table)) (seen nil) (ranks nil))
    (dolist (x (table-all table)) 
      (if (null (gethash (eg-class x) class-count))
        (setf (gethash (eg-class x) class-count) 1 seen (append seen (list (eg-class x))))
        (setf (gethash (eg-class x) class-count) (+ 1 (gethash (eg-class x) class-count)))
      )
    )
    (dolist (x seen)
      (setf ranks (append ranks (list (list x (gethash x class-count)))))
    )
    ranks
  )
)

(defun minority-class (table)
  (let ((minority (list nil 0)) (ranks (count-classes table)))
    (dolist (x ranks)
      (if (or (< (second x) (second minority)) (equalp (second minority) 0))
        (setf minority x)
      )
    )
    (first minority)
  )
)

(defun minority-diff (table)
  (let ((ranks (count-classes table)) (minority (minority-class table)) (minimum nil))
    (dolist (x ranks)
      (if (equalp minority (first x))
        (setf minimum (second x) ranks (remove x ranks))
      )
    )
    (dolist (x ranks)
      (setf (second x) (- (second x) minimum))
    )
    ranks
  )
)

