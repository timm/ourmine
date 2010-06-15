(defun samep (x  y)
  (labels  ((white (c)
	      (member c '(#\Space #\Tab #\Newline #\Page) :test #'char=))
	    (whiteout (s)
	      (remove-if #'white  s)))
    (string= (whiteout (format nil "~(~a~)" x))
	     (whiteout (format nil "~(~a~)" y)))))

(defun lt (x y)
  (if (string< (format nil "~a" x) (format nil "~a" y))
      t
      nil))
