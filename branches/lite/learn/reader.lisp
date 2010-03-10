(defun file->data (file &optional (label #'identity))
  (let ((dat (make-data 
	      :rows (file->lists file #'reverse))))
    (lists->data dat label)))

(defun lists->data (dat label)
  (let ((header (rest  (first (data-rows dat))))
	(rows   (rest  (data-rows dat))))
    (labels ((rightsize (x) (= (1+ (length header))  (length x)))
	     (oops(x)       (error "~a not ~a long"  x (length header))))
      (setf (data-labels dat) header)
      (setf (data-rows dat) 
	    (mapcar #'(lambda(list)
			(when list
			  (if (rightsize list)
			      (list->data list dat label)
			      (oops list))))))
      dat)))

(defun list->data (list dat label)
  (let ((i 0)
	(class (funcall label (first list)))
	(row   (make-row)))
    (more class (data-classes dat))
    (unless (member class (data-classes dat))
      (let ((new (1+ (length (data-classes dat))))
	    (push `(class . ,(1+ old)) 
	      (data-classes dat)))))
    (setf (row-cells row)
	  (mapcar #'(lambda(cell)
		      (unless (eql cell (data-minssing dat))
			(more `(,class ,(incf i) ,cell)
			      (data-counts dat)))
		      cell)
		  (rest list)))
    (setf (row-class row) class)))

(deftest !file->data ()
  (let ((dat (file->data 
	      "../data/weather-nominal.dat")))
    (test
     (with-output-to-string (str)
       (showh (data-counts dat) :str str))
       "H: ((NO 0 FALSE) . 2) 
        H: ((NO 0 TRUE) . 3) 
        H: ((NO 1 HIGH) . 4) 
        H: ((NO 1 NORMAL) . 1) 
        H: ((NO 2 COOL) . 1) 
        H: ((NO 2 HOT) . 2) 
        H: ((NO 2 MILD) . 2) 
        H: ((NO 3 RAINY) . 2) 
        H: ((NO 3 SUNNY) . 3) 
        H: ((YES 0 FALSE) . 6) 
        H: ((YES 0 TRUE) . 3) 
        H: ((YES 1 HIGH) . 3) 
        H: ((YES 1 NORMAL) . 6) 
        H: ((YES 2 COOL) . 3) 
        H: ((YES 2 HOT) . 2) 
        H: ((YES 2 MILD) . 4) 
        H: ((YES 3 OVERCAST) . 4) 
        H: ((YES 3 RAINY) . 3) 
        H: ((YES 3 SUNNY) . 2) " )))
