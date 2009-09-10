(defun nb (train test &key (stream t))
  (let* ((acc 0)
	(all  (table-all test))
	(max  (length all)))
    (dolist (one all (/ acc max))
      (let* ((got     (bayes-classify (eg-features one) (xindex train)))
	     (want    (eg-class one))
	     (success (eql got want)))
	(incf acc (if success 1.0 0.0))
	(format stream "~a ~a ~a ~a~%"  got want  
		(round (* 100 (/ acc max)))
		(if success "   " "<--"))))))

(defun nb-simple (train test &key (stream t))
  (xindex train)
  (dolist (one (table-all test))
    (let* ((got     (bayes-classify (eg-features one) train))
	   (want    (eg-class one))
	   (success (eql got want)))
      (format stream "~a ~a ~a~%"  got want (if (eql got want) "   " "<--")))))

(defun bayes-classify (one tbl &optional (m 2) (k 1))
  (let* ((classes        (klasses tbl))
         (nclasses       (nklasses tbl))
         (n              (f        tbl))
	 (classi         (table-class tbl))
         (like           most-negative-fixnum)
         (classification (first classes)))
    (dolist (class classes)
      (let* ((prior (/ (f tbl class)
                        n))
             (tmp prior))
        (doitems (feature i one)
          (let ((small-sigma 0)
                (sum-of-frequency-for-feature-value 0))
            (dolist (class classes)
              (if (> (f tbl class i feature) 0)
                  (incf small-sigma))
              (incf sum-of-frequency-for-feature-value (expt (f tbl class i feature) 2))
              )
            (setf sum-of-frequency-for-feature-value (sqrt sum-of-frequency-for-feature-value))
            (unless (= classi i)
              (unless (unknownp feature)
                (let ((delta (/
                              (/ (* (log (+ (f tbl class i feature) 1)) (log (/ (length classes) small-sigma))) sum-of-frequency-for-feature-value)
                              (f tbl class))))
                
                  (setf tmp (* tmp delta)))))))
        (when (> tmp like)
          (setf like tmp
                classification class))))
    classification))

(defun stress-test-nb (&optional (repeats 10000))
  (with-output-to-string (str)
    (dotimes (i repeats t)
      (random-test-nb1 0.2 str)))
  t)

  (defun make-weather (eg)
    (data :name    'weather 
	  :columns '(forecast temp humidity windy play)  
	  :egs      eg))
  
(let 
    ((egs     '((sunny    hot  high   FALSE skip) 
		(sunny    hot  high   TRUE  skip)
		(rainy    cool normal TRUE  skip)     
		(sunny    mild high   FALSE skip)
		(overcast cool normal TRUE  play)
		(overcast hot  high   FALSE play)
		(rainy    mild high   FALSE play)
		(rainy    cool normal FALSE play)
		(sunny    cool normal FALSE play)
		(rainy    mild normal FALSE play)
		(rainy    mild high   TRUE  skip)
		(sunny    mild normal TRUE  play)
		(overcast mild high   TRUE  play)
		(overcast hot  normal FALSE play))))
  
  (defun random-test-nb1 (&optional (n 0.3) (str t))
    (let* (train 
	   test
	   (k         (* n (length egs))))
      (dolist (eg (shuffle egs))
	(if (> (decf k) 0)
	    (push eg test)
	    (push eg train)))
      (nb (make-weather train)
	  (make-weather test)
	  :stream str)))
  
  (defun self-test-nb ()
    (nb (make-weather egs) 
	(make-weather egs)))
 
  (defun self-simple-test-nb ()
    (nb-simple  (make-weather egs) 
		(make-weather egs)))

 )
