(defun learn (&key (k 8)
              (cluster   #'(lambda (data) (k-means data k))))

  (let* ((train (make-data-k))
         (clusters (funcall cluster train))
         (cluster-tables '())
         (lst-centroids '()))
    (setf cluster-tables (make-cluster-tables clusters train))
    (setf lst-centroids (get-cls-means cluster-tables))
    (values cluster-tables lst-centroids)))


(defun no-disc-nb (train)
  "split into 10 bins and apply naive bayes"
  (let* ((lst (split2bins train))
         (train (xindex (car lst)))
         (test (xindex (car (cdr lst)))))
    ;(format t "~A~%"  train)
    ;(format t "~A~%" test)
   (nb-num train test)))


(defun disc-nb (train)
  "discretize and apply naive bayes"
  (no-disc-nb (discretize train)))
         
      
                     
(defun make-cluster-tables (clusters train)
  (let* ((cluster-tables '())
         (cluster-nr 1))
    (dolist (obj clusters)
      (setf cluster-tables (append cluster-tables
                                   (list (data :name cluster-nr :columns (get-col-names (table-columns train)) :egs obj))))
      (setf cluster-nr (incf cluster-nr)))
    (del-empty-clusters cluster-tables)))



(defun get-col-names (lst)
  (let* ((lst-cols))
  (dolist (obj lst (reverse lst-cols))
    (setf lst-cols (cons (header-name obj) lst-cols)))))


(defun get-cls-means(cluster-tables)
  (let* ((centroids '()))
   (dolist (obj cluster-tables centroids)
     (let* ((features (get-features (table-all obj)))
            (class (table-class obj)))
       (setf centroids (append centroids (list (cluster-mean features class))))))))

(defun del-empty-clusters (cluster-tables)
  (dolist (obj cluster-tables cluster-tables)
    (if (not (table-all obj))
        (setf cluster-tables (remove obj cluster-tables)))))

(defun get-closest-centroid (one lstCentroids)
  (let ((dist most-positive-fixnum)
        (position))
    (dolist (obj lstCentroids position)
      (if ( <= (euc one obj) dist)
          (progn (setf dist (euc one obj))
                 (setf position (position obj lstCentroids :test #'equal)))))))
                 
    