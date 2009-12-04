; manually reduce the data set to only the passed columns and the class
(defun prune-columns (data column-list)
    (let* ((tbl (features-as-a-list data))
           (trans-tbl (transpose tbl))
           (pruned-tbl (list ))
           (cols (columns-header (table-columns data)))
           (pruned-cols (list ))
           (class-col (table-class data)))

        (setf column-list (append column-list (list class-col)))

        (dolist (col column-list)
            (setf pruned-cols (append pruned-cols (list (nth col cols))))
            (setf pruned-tbl (append pruned-tbl (list (nth col trans-tbl))))
        )
         
        (setf tbl (transpose pruned-tbl))

        (data :name (table-name data)
              :columns pruned-cols
              :egs tbl
        )
    )
)

(defun prune-table (data column-list range-list)
(format t "~A~%~A~%" column-list range-list)
    (let* ((tbl (features-as-a-list data))
           (new-tbl (list ))
           (flag 0))
        (dolist (inst tbl)
            (setf flag 0)
            (dolist (col column-list)
                (when (eql (nth col inst) (nth col range-list))
                    (setf flag 1)
                    (format t "inst: ~A~%~A~T~A~%" inst (nth col inst) (nth col range-list)))
            )
            (when (= flag 1)
                (push inst new-tbl)
            )
        )
(format "here i am~%")
        (prune-columns (build-a-data (table-name data) (columns-header (table-columns data)) new-tbl) column-list)
    )   
)
