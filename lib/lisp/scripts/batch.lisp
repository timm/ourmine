(defun batch(&optional (datafile "letter") (outputpath "tmp"))
  (load "miner.lisp")
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 0) ; disjunction
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 1 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 0) ; mean max-min
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 1 :meantype 1 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 0) ; mean largestgap
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 1 :useCentroid 0 :overfitDetect 0 :overfitRevert 0) ; original
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 1 :overfitDetect 0 :overfitRevert 0) ; centroids

;  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 1 :overfitRevert 0) ; relearn on overfit
  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 1) ; revert on overfit

  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 1) ; revert on overfit

  (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha 0 :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 1 :removeOutliers 1) ; remove outliers

  (dotimes (i 10)
    (demohyperpipesnew :dataFileName datafile :outputpath outputpath :Alpha (* 0.05 (+ i 1)) :countType 0 :meantype 0 :oldway 0 :useCentroid 0 :overfitDetect 0 :overfitRevert 0)
  )
  (quit)
)