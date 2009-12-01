(defun eg-synthesize-new (eg i j)
  (push (coin-flip (nth i (eg-features eg))
                   (nth j (eg-features eg))) (eg-features eg)))

(flet ((get-synthetic-name (tbl i j)
         (format nil "synthetic:(~a,~a)"
                 (header-name (nth i (table-columns tbl)))
                 (header-name (nth j (table-columns tbl))))))
  (defun synthesize-pair-column (tbl i j)
    (let ((col (make-discrete :name (get-synthetic-name tbl i j)
                              :classp nil
                              :ignorep nil)))
      (push col (table-columns tbl))
      (dolist (eg (table-all tbl) tbl)
        (eg-synthesize-new eg i j)))))

(defun preprocess-2b (tbl &optional (n (length (table-columns tbl))))
  (let ((x (- (ceiling (/ (* n n) 2)) n))
        (new-columns 0))
    (dotimes (i (length (table-columns tbl)))
      (when (< i new-columns) (setf i new-columns))
      (dotimes (j (length (table-columns tbl)))
        (when (< j new-columns) (setf j new-columns))
        (if (= x new-columns) (return-from preprocess-2b tbl))
        (unless (= i j)
          (synthesize-pair-column tbl i j)
          (incf i)
          (incf j)
          (incf (table-class tbl))
          (incf new-columns))))
    tbl))

(defun twob (train test &key (stream t))
  (nb (preprocess-2b train) test :stream stream))