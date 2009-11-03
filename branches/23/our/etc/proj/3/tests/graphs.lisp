(let ((tbl-list (list (vehicle) (sick) (quake) (bolts) (autos) (ionosphere))))

(defun pre-processor-graph (tbl &key (n 2) (width 55) (old nil))
  (let ((chart))
    (when old
      (push (make-chart-item :name "old bore" :value (time-it n (slowbore (table-clone tbl)))) chart)) 
    (push (make-chart-item :name "bore" :value (time-it n (bore (table-clone tbl)))) chart)
    (push (make-chart-item :name "normalize" :value (time-it n (normalization (table-clone tbl)))) chart)
    (format t "Pre-processors~%")
    (show-bar-graph chart :width width)
    (format t  "~%")))

(defun discretizer-graph (tbl &key (n 2) (width 55))
  (let ((chart))
    (push (make-chart-item :name "n-bins" :value (time-it n (n-bins (table-clone tbl)))) chart)
    (push (make-chart-item :name "n-chops" :value (time-it n (n-chops (table-clone tbl)))) chart)
    (push (make-chart-item :name "normal chops" :value (time-it n (normal-chops (table-clone tbl)))) chart)
    (format t "Discretizers~%")
    (show-bar-graph chart :width width)
    (format t  "~%")))

(defun ffs-graph (tbl &key (n 2) (width 55))
  (let ((chart))
    (push (make-chart-item :name "b squared" :value (time-it n (b-squared (table-clone tbl)))) chart)
    (push (make-chart-item :name "nomograms" :value (time-it n (nomograms (table-clone tbl)))) chart)
    (format t "Feature Subset Selection~%")
    (show-bar-graph chart :width width)
    (format t  "~%")))
    
(defun show-all-graphs(&key (n 2) (width 55) (old nil))
  (pre-processor-graph (quake) :n n :width width :old old)
  (discretizer-graph (quake) :n n :width width)
  (ffs-graph (quake) :n n :width width)
  (multi-table-nomogram tbl-list :n n :width width)
  (multi-table-nomogram-pre tbl-list :n n :width width))

(defun multi-table-nomogram (tbllist &key (n 2) (width 55))
  (let ((chart))
    (dolist (tbl tbllist)
      (push (make-chart-item :name (format nil "~a" (table-name tbl)) :value (time-it n (b-squared tbl))) chart))
    (format t "Nomograms on different datasets~%")
    (show-bar-graph chart :width width)
    (format t "~%")))

(defun multi-table-nomogram-pre (tbllist &key (n 2) (width 55))
  (let ((chart))
    (dolist (tbl tbllist)
      (push (make-chart-item :name (format nil "~a" (table-name tbl))
                             :value (time-it n (b-squared (n-chops tbl)))) chart))
    (format t "Nomograms on different datasets with pre-processors~%")
    (show-bar-graph chart :width width)
    (format t "~%")))

)
    
