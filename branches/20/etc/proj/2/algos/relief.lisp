;;; Claimee: Drew

;;; Run a trial of n comparisons and weight the importance of each column.

(print " - Loading Relief") ;; Output for a pretty log

;;; Find closest neighbor.  Find-same-class is for locating closest hit and closest miss.

(defun closest-member (table row-number find-same-class)
  (let ((target-class (eg-class (nth row-number (table-all table)))))
    (loop for i from 1 to (length (table-all table)) do
      (let ((left (nth (- row-number i) (table-all table))) (right (nth (+ row-number i) (table-all table))))
        (if (equalp (eg-class left) target-class)
          (if find-same-class
            (return (- row-number i))
          )
          (if (not find-same-class)
            (return (- row-number i))
          )
        )
        (if (equalp (eg-class right) target-class)
          (if find-same-class
            (return (+ row-number i))
          )
          (if (not find-same-class)
            (return (+ row-number i))
          )
        )
      )
    )
  )
)

;;; Find difference metric.

(defun relief-diff (column-num target neighbor &optional (divisor-n 1))
  (let ((score 0) (target-feature (nth column-num (eg-features target))) (neighbor-feature (nth column-num (eg-features neighbor))))
    (if (and (realp target-feature) (realp neighbor-feature))
      (setf score (+ score (/ (abs (- target-feature neighbor-feature)) (+ target-feature neighbor-feature))))
      (if (equalp target-feature neighbor-feature)
        (setf score (+ score 1))
      )
    )
    (/ score divisor-n)
  )
)

;;; Run loop n times, return list of weights.

(defun relief (table &optional (iterations nil))
  (if (null iterations)
    (setf iterations 250)
  )
  (let ((column-weights (make-list (length (eg-features (first (table-all table)))) :initial-element 0)))
    (loop for i from 0 to iterations do
      (let* ((record-num (random (length (table-all table)))) (hit (closest-member table record-num t)) (miss (closest-member table record-num nil)))
        (loop for j from 0 to (- (length column-weights) 1) do
          (let 
              ((round-score-hit (relief-diff j (nth record-num (table-all table)) (nth hit (table-all table)) iterations)) 
               (round-score-miss (relief-diff j (nth record-num (table-all table)) (nth miss (table-all table)) iterations)))
            (setf (nth j column-weights) (- (+ (nth j column-weights) round-score-miss) round-score-hit))
          )
        )
      )
    )
    column-weights
  )
)
