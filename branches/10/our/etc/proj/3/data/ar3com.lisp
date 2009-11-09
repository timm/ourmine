(defun ar3com ()
  (table-deep-copy (data
   :name 'ar3com
   :columns '($loc $vg $ivg $v $l $d $e $b $t $lOCode $lOCcomment $locCodeAndComment $uniq_Op $uniq_Opnd $total_Op $total_Opnd $branchCount defects)
   :egs
   '(

(307 37 43 3104 611 20.4167 63373.3333 1.0347 3520.7407 147 44 5 23 138 366 245 94 true)
(3 1 0 32 14 4.5 144 0.010667 8 3 0 0 6 4 8 6 0 false)
(268 64 0 4102 821 31.004 127178.408 1.3673 7065.4671 174 22 0 23 125 484 337 190 false)
(11 1 2 84 32 3 252 0.028 14 9 0 0 4 10 17 15 0 false)
(9 1 1 57 24 3.1429 179.1429 0.019 9.9524 7 0 0 4 7 13 11 0 false)
(10 1 2 67 28 3.7143 248.8571 0.022333 13.8254 8 0 0 4 7 15 13 0 false)
(5 1 3 29 14 1.5 43.5 0.0096667 2.4167 5 0 0 3 5 9 5 0 false)
(28 4 2 346 102 16.3333 5651.3333 0.11533 313.963 22 1 0 12 18 53 49 8 false)
(26 3 2 280 85 14.0938 3946.25 0.093333 219.2361 20 0 0 11 16 44 41 4 false)
(15 1 7 113 41 4.3182 487.9545 0.037667 27.1086 11 0 0 5 11 22 19 0 false)
(23 3 7 201 61 6.25 1256.25 0.067 69.7917 17 1 0 9 18 36 25 4 false)
(10 1 3 127 47 8 1016 0.042333 56.4444 6 0 0 6 9 23 24 0 false)
(23 5 4 325 101 14.3333 4658.3333 0.10833 258.7963 17 1 0 10 15 58 43 16 false)
(76 16 17 1168 282 16.5714 19355.4286 0.38933 1075.3016 54 11 2 14 49 166 116 58 false)
(203 22 77 2881 652 58.2667 167866.2667 0.96033 9325.9037 103 37 6 23 60 348 304 58 false)
(64 10 8 669 172 15 10035 0.223 557.5 39 7 1 14 35 97 75 24 false)
(94 12 29 984 248 26.4857 26061.9429 0.328 1447.8857 56 17 3 18 35 145 103 32 false)
(31 1 24 413 130 8.4211 3477.8947 0.13767 193.2164 16 5 0 5 19 66 64 0 false)
(70 2 17 617 171 9.6833 5974.6167 0.20567 331.9231 34 15 0 7 30 88 83 2 false)
(20 1 9 113 41 3.1667 357.8333 0.037667 19.8796 3 8 0 4 12 22 19 0 false)
(285 15 109 2555 650 61.4583 157026.0417 0.85167 8723.669 167 40 3 15 36 355 295 40 false)
(61 4 10 550 156 15.2083 8364.5833 0.18333 464.6991 33 7 1 10 24 83 73 6 false)
(16 1 1 127 45 4.5833 582.0833 0.042333 32.338 11 0 0 5 12 23 22 0 false)
(17 1 1 127 45 4.5833 582.0833 0.042333 32.338 11 0 0 5 12 23 22 0 false)
(29 2 1 263 82 12.6667 3331.3333 0.087667 185.0741 20 1 1 10 15 44 38 2 false)
(82 10 2 530 148 12.54 6646.2 0.17667 369.2333 44 7 4 11 25 91 57 24 false)
(74 12 2 549 149 9.6667 5307 0.183 294.8333 43 10 4 10 30 91 58 28 false)
(77 9 3 816 195 13.92 11358.72 0.272 631.04 34 13 4 16 50 108 87 24 false)
(76 14 25 1182 273 19.6667 23246 0.394 1291.4444 55 2 1 19 57 155 118 46 false)
(23 2 24 453 136 9.1364 4138.7727 0.151 229.9318 18 0 0 6 22 69 67 4 false)
(19 3 0 194 59 12.0714 2341.8571 0.064667 130.1032 14 0 0 13 14 33 26 4 false)
(128 12 24 950 217 8.0522 7649.6269 0.31667 424.9793 65 21 3 13 67 134 83 26 false)
(115 10 10 1126 272 25.2614 28444.2955 0.37533 1580.2386 69 4 1 19 44 155 117 24 false)
(117 12 16 871 208 11.0385 9614.5 0.29033 534.1389 60 17 4 14 52 126 82 26 false)
(91 1 0 900 206 3.4459 3101.3514 0.3 172.2973 52 18 0 5 74 104 102 0 false)
(57 1 0 253 72 2.3333 590.3333 0.084333 32.7963 21 36 0 4 30 37 35 0 false)
(18 9 0 207 67 6.5333 1352.4 0.069 75.1333 7 6 0 7 15 39 28 16 false)
(91 17 20 1361 309 14.6176 19894.6177 0.45367 1105.2565 51 14 0 14 68 167 142 32 false)
(31 1 11 444 126 5.3448 2373.1034 0.148 131.8391 27 1 0 5 29 64 62 0 false)
(18 1 6 215 66 4.8 1032 0.071667 57.3333 14 0 0 6 20 34 32 0 true)
(26 5 0 352 100 13.9286 4902.8571 0.11733 272.381 16 0 0 13 21 55 45 8 false)
(11 5 1 153 52 8.3636 1279.6364 0.051 71.0909 7 0 0 8 11 29 23 8 false)
(31 4 2 267 82 8 2136 0.089 118.6667 21 0 0 8 18 46 36 8 false)
(17 2 1 110 37 4.5769 503.4615 0.036667 27.9701 8 2 1 7 13 20 17 2 false)
(115 28 1 1794 412 18.3 32830.2 0.598 1823.9 54 29 2 13 65 229 183 100 false)
(62 20 1 1181 291 18.7778 22176.5556 0.39367 1232.0309 31 12 0 13 45 161 130 68 false)
(58 7 3 451 124 14.5833 6577.0833 0.15033 365.3935 35 5 0 14 24 74 50 16 false)
(6 1 1 50 19 3.375 168.75 0.016667 9.375 4 0 0 6 8 10 9 0 false)
(5 1 0 42 17 2.8571 120 0.014 6.6667 4 0 0 5 7 9 8 0 false)
(155 32 0 2416 527 43.5 105096 0.80533 5838.6667 103 16 4 29 69 320 207 70 false)
(42 5 0 346 103 12.8333 4440.3333 0.11533 246.6852 31 3 1 11 18 61 42 16 false)
(445 79 18 5581 1170 45.7727 255457.5909 1.8603 14192.0884 272 64 11 19 99 693 477 208 true)
(43 9 5 461 126 14.28 6583.08 0.15367 365.7267 27 7 4 14 25 75 51 28 true)
(181 34 4 3029 614 28.487 86286.9913 1.0097 4793.7217 103 24 2 24 115 341 273 86 true)
(131 31 9 1844 408 32.303 59566.7879 0.61467 3309.266 90 12 4 26 66 244 164 74 false)
(15 5 1 149 47 7.6154 1134.6923 0.049667 63.0385 12 0 0 11 13 29 18 8 false)
(112 26 0 1140 282 23.8 27132 0.38 1507.3333 73 10 4 17 40 170 112 64 false)
(670 85 13 7140 1392 54.6655 390311.6197 2.38 21683.9789 394 195 31 27 142 817 575 244 true)
(173 40 0 2945 629 55.7597 164212.4351 0.98167 9122.9131 92 22 6 31 77 352 277 108 true)
(114 22 1 1329 314 33.5 44521.5 0.443 2473.4167 70 12 3 23 46 180 134 56 false)
(148 18 0 1441 355 28 40348 0.48033 2241.5556 102 5 0 16 42 208 147 48 false)
(10 7 1 196 68 9.5455 1870.9091 0.065333 103.9394 10 0 0 7 11 38 30 24 false)
(333 40 23 3533 821 56.5714 199866.8571 1.1777 11103.7143 186 53 9 18 56 469 352 114 true)
     ))))
