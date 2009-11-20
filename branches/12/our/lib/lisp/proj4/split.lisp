(defun traintest-pdata()
  (let* ((data (set-data))
         (len (length data))
         (test '())
         (ndx)
         ;(temp)
         ;(class-col (table-class data))
         (test-size (floor (* len 0.10))))
    (dotimes (n test-size (list (xindex (append-tables test))  data))
      (setf ndx (random (length data)))
      (setf test (append test (list (nth ndx data))))
      (setf data (remove (nth ndx data) data)))))
