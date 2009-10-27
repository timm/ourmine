;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% Horsepower treated as the class attribute.
;%
;% As used by Kilpatrick, D. & Cameron-Jones, M. (1998). Numeric prediction
;% using instance-based learning with encoding length selection. In Progress
;% in Connectionist-Based Information Systems. Singapore: Springer-Verlag.
;%
;% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;%
;% 1. Title: 1985 Auto Imports Database
;%
;% 2. Source Information:
;%    -- Creator/Donor: Jeffrey C. Schlimmer (Jeffrey.Schlimmer@a.gp.cs.cmu.edu)
;%    -- Date: 19 May 1987
;%    -- Sources:
;%      1) 1985 Model Import Car and Truck Specifications, 1985 Ward's
;%         Automotive Yearbook.
;%      2) Personal Auto Manuals, Insurance Services Office, 160 Water
;%         Street, New York, NY 10038
;%      3) Insurance Collision Report, Insurance Institute for Highway
;%         Safety, Watergate 600, Washington, DC 20037
;%
;% 3. Past Usage:
;%    -- Kibler,~D., Aha,~D.~W., \& Albert,~M. (1989).  Instance-based prediction
;%       of real-valued attributes.  {\it Computational Intelligence}, {\it 5},
;%       51--57.
;%          -- Predicted price of car using all numeric and Boolean attributes
;%          -- Method: an instance-based learning (IBL) algorithm derived from a
;%             localized k-nearest neighbor algorithm.  Compared with a
;%             linear regression prediction...so all instances
;%             with missing attribute values were discarded.  This resulted with
;%             a training set of 159 instances, which was also used as a test
;%             set (minus the actual instance during testing).
;%          -- Results: Percent Average Deviation Error of Prediction from Actual
;%             -- 11.84% for the IBL algorithm
;%             -- 14.12% for the resulting linear regression equation
;%
;% 4. Relevant Information:
;%    -- Description
;%       This data set consists of three types of entities: (a) the
;%       specification of an auto in terms of various characteristics, (b)
;%       its assigned insurance risk rating, (c) its normalized losses in use
;%       as compared to other cars.  The second rating corresponds to the
;%       degree to which the auto is more risky than its price indicates.
;%       Cars are initially assigned a risk factor symbol associated with its
;%       price.   Then, if it is more risky (or less), this symbol is
;%       adjusted by moving it up (or down) the scale.  Actuarians call this
;%       process "symboling".  A value of +3 indicates that the auto is
;%       risky, -3 that it is probably pretty safe.
;%
;%       The third factor is the relative average loss payment per insured
;%       vehicle year.  This value is normalized for all autos within a
;%       particular size classification (two-door small, station wagons,
;%       sports/speciality, etc...), and represents the average loss per car
;%       per year.
;%
;%    -- Note: Several of the attributes in the database could be used as a
;%             "class" attribute.
;%
;% 5. Number of Instances: 205
;%
;% 6. Number of Attributes: 26 total
;%    -- 15 continuous
;%    -- 1 integer
;%    -- 10 nominal
;%
;% 7. Attribute Information:
;%      Attribute:                Attribute Range:
;%      ------------------        -----------------------------------------------
;%   1. symboling:                -3, -2, -1, 0, 1, 2, 3.
;%   2. normalized-losses:        continuous from 65 to 256.
;%   3. make:                     alfa-romero, audi, bmw, chevrolet, dodge, honda,
;%                                isuzu, jaguar, mazda, mercedes-benz, mercury,
;%                                mitsubishi, nissan, peugot, plymouth, porsche,
;%                                renault, saab, subaru, toyota, volkswagen, volvo
;%   4. fuel-type:                diesel, gas.
;%   5. aspiration:               std, turbo.
;%   6. num-of-doors:             four, two.
;%   7. body-style:               hardtop, wagon, sedan, hatchback, convertible.
;%   8. drive-wheels:             4wd, fwd, rwd.
;%   9. engine-location:          front, rear.
;%  10. wheel-base:               continuous from 86.6 120.9.
;%  11. length:                   continuous from 141.1 to 208.1.
;%  12. width:                    continuous from 60.3 to 72.3.
;%  13. height:                   continuous from 47.8 to 59.8.
;%  14. curb-weight:              continuous from 1488 to 4066.
;%  15. engine-type:              dohc, dohcv, l, ohc, ohcf, ohcv, rotor.
;%  16. num-of-cylinders:         eight, five, four, six, three, twelve, two.
;%  17. engine-size:              continuous from 61 to 326.
;%  18. fuel-system:              1bbl, 2bbl, 4bbl, idi, mfi, mpfi, spdi, spfi.
;%  19. bore:                     continuous from 2.54 to 3.94.
;%  20. stroke:                   continuous from 2.07 to 4.17.
;%  21. compression-ratio:        continuous from 7 to 23.
;%  22. horsepower:               continuous from 48 to 288.
;%  23. peak-rpm:                 continuous from 4150 to 6600.
;%  24. city-mpg:                 continuous from 13 to 49.
;%  25. highway-mpg:              continuous from 16 to 54.
;%  26. price:                    continuous from 5118 to 45400.
;%
;% 8. Missing Attribute Values: (denoted by "?")
;%    Attribute #:   Number of instances missing a value:
;%    2.             41
;%    6.             2
;%    19.            4
;%    20.            4
;%    22.            2
;%    23.            2
;%    26.            4%
;%
(defun autoHorse ()
  (data
    :name 'autoHorse
    :columns '(symboling normalized-losses make fuel-type aspiration num-of-doors body-style drive-wheels engine-location wheel-base length width height curb-weight engine-type num-of-cylinders engine-size fuel-system bore stroke compression-ratio peak-rpm city-mpg highway-mpg price class)
    :egs
    '(
      (3 ? alfa-romero gas std 2 convertible rwd front 88.6 168.8 64.1 48.8 2548 dohc 4 130 mpfi 3.47 2.68 9 5000 21 27 13495 111)
      (3 ? alfa-romero gas std 2 convertible rwd front 88.6 168.8 64.1 48.8 2548 dohc 4 130 mpfi 3.47 2.68 9 5000 21 27 16500 111)
      (1 ? alfa-romero gas std 2 hatchback rwd front 94.5 171.2 65.5 52.4 2823 ohcv 6 152 mpfi 2.68 3.47 9 5000 19 26 16500 154)
      (2 164 audi gas std 4 sedan fwd front 99.8 176.6 66.2 54.3 2337 ohc 4 109 mpfi 3.19 3.4 10 5500 24 30 13950 102)
      (2 164 audi gas std 4 sedan 4wd front 99.4 176.6 66.4 54.3 2824 ohc 5 136 mpfi 3.19 3.4 8 5500 18 22 17450 115)
      (2 ? audi gas std 2 sedan fwd front 99.8 177.3 66.3 53.1 2507 ohc 5 136 mpfi 3.19 3.4 8.5 5500 19 25 15250 110)
      (1 158 audi gas std 4 sedan fwd front 105.8 192.7 71.4 55.7 2844 ohc 5 136 mpfi 3.19 3.4 8.5 5500 19 25 17710 110)
      (1 ? audi gas std 4 wagon fwd front 105.8 192.7 71.4 55.7 2954 ohc 5 136 mpfi 3.19 3.4 8.5 5500 19 25 18920 110)
      (1 158 audi gas turbo 4 sedan fwd front 105.8 192.7 71.4 55.9 3086 ohc 5 131 mpfi 3.13 3.4 8.3 5500 17 20 23875 140)
      (0 ? audi gas turbo 2 hatchback 4wd front 99.5 178.2 67.9 52 3053 ohc 5 131 mpfi 3.13 3.4 7 5500 16 22 ? 160)
      (2 192 bmw gas std 2 sedan rwd front 101.2 176.8 64.8 54.3 2395 ohc 4 108 mpfi 3.5 2.8 8.8 5800 23 29 16430 101)
      (0 192 bmw gas std 4 sedan rwd front 101.2 176.8 64.8 54.3 2395 ohc 4 108 mpfi 3.5 2.8 8.8 5800 23 29 16925 101)
      (0 188 bmw gas std 2 sedan rwd front 101.2 176.8 64.8 54.3 2710 ohc 6 164 mpfi 3.31 3.19 9 4250 21 28 20970 121)
      (0 188 bmw gas std 4 sedan rwd front 101.2 176.8 64.8 54.3 2765 ohc 6 164 mpfi 3.31 3.19 9 4250 21 28 21105 121)
      (1 ? bmw gas std 4 sedan rwd front 103.5 189 66.9 55.7 3055 ohc 6 164 mpfi 3.31 3.19 9 4250 20 25 24565 121)
      (0 ? bmw gas std 4 sedan rwd front 103.5 189 66.9 55.7 3230 ohc 6 209 mpfi 3.62 3.39 8 5400 16 22 30760 182)
      (0 ? bmw gas std 2 sedan rwd front 103.5 193.8 67.9 53.7 3380 ohc 6 209 mpfi 3.62 3.39 8 5400 16 22 41315 182)
      (0 ? bmw gas std 4 sedan rwd front 110 197 70.9 56.3 3505 ohc 6 209 mpfi 3.62 3.39 8 5400 15 20 36880 182)
      (2 121 chevrolet gas std 2 hatchback fwd front 88.4 141.1 60.3 53.2 1488 l 3 61 2bbl 2.91 3.03 9.5 5100 47 53 5151 48)
      (1 98 chevrolet gas std 2 hatchback fwd front 94.5 155.9 63.6 52 1874 ohc 4 90 2bbl 3.03 3.11 9.6 5400 38 43 6295 70)
      (0 81 chevrolet gas std 4 sedan fwd front 94.5 158.8 63.6 52 1909 ohc 4 90 2bbl 3.03 3.11 9.6 5400 38 43 6575 70)
      (1 118 dodge gas std 2 hatchback fwd front 93.7 157.3 63.8 50.8 1876 ohc 4 90 2bbl 2.97 3.23 9.41 5500 37 41 5572 68)
      (1 118 dodge gas std 2 hatchback fwd front 93.7 157.3 63.8 50.8 1876 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 6377 68)
      (1 118 dodge gas turbo 2 hatchback fwd front 93.7 157.3 63.8 50.8 2128 ohc 4 98 mpfi 3.03 3.39 7.6 5500 24 30 7957 102)
      (1 148 dodge gas std 4 hatchback fwd front 93.7 157.3 63.8 50.6 1967 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 6229 68)
      (1 148 dodge gas std 4 sedan fwd front 93.7 157.3 63.8 50.6 1989 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 6692 68)
      (1 148 dodge gas std 4 sedan fwd front 93.7 157.3 63.8 50.6 1989 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 7609 68)
      (1 148 dodge gas turbo ? sedan fwd front 93.7 157.3 63.8 50.6 2191 ohc 4 98 mpfi 3.03 3.39 7.6 5500 24 30 8558 102)
      (-1 110 dodge gas std 4 wagon fwd front 103.3 174.6 64.6 59.8 2535 ohc 4 122 2bbl 3.34 3.46 8.5 5000 24 30 8921 88)
      (3 145 dodge gas turbo 2 hatchback fwd front 95.9 173.2 66.3 50.2 2811 ohc 4 156 mfi 3.6 3.9 7 5000 19 24 12964 145)
      (2 137 honda gas std 2 hatchback fwd front 86.6 144.6 63.9 50.8 1713 ohc 4 92 1bbl 2.91 3.41 9.6 4800 49 54 6479 58)
      (2 137 honda gas std 2 hatchback fwd front 86.6 144.6 63.9 50.8 1819 ohc 4 92 1bbl 2.91 3.41 9.2 6000 31 38 6855 76)
      (1 101 honda gas std 2 hatchback fwd front 93.7 150 64 52.6 1837 ohc 4 79 1bbl 2.91 3.07 10.1 5500 38 42 5399 60)
      (1 101 honda gas std 2 hatchback fwd front 93.7 150 64 52.6 1940 ohc 4 92 1bbl 2.91 3.41 9.2 6000 30 34 6529 76)
      (1 101 honda gas std 2 hatchback fwd front 93.7 150 64 52.6 1956 ohc 4 92 1bbl 2.91 3.41 9.2 6000 30 34 7129 76)
      (0 110 honda gas std 4 sedan fwd front 96.5 163.4 64 54.5 2010 ohc 4 92 1bbl 2.91 3.41 9.2 6000 30 34 7295 76)
      (0 78 honda gas std 4 wagon fwd front 96.5 157.1 63.9 58.3 2024 ohc 4 92 1bbl 2.92 3.41 9.2 6000 30 34 7295 76)
      (0 106 honda gas std 2 hatchback fwd front 96.5 167.5 65.2 53.3 2236 ohc 4 110 1bbl 3.15 3.58 9 5800 27 33 7895 86)
      (0 106 honda gas std 2 hatchback fwd front 96.5 167.5 65.2 53.3 2289 ohc 4 110 1bbl 3.15 3.58 9 5800 27 33 9095 86)
      (0 85 honda gas std 4 sedan fwd front 96.5 175.4 65.2 54.1 2304 ohc 4 110 1bbl 3.15 3.58 9 5800 27 33 8845 86)
      (0 85 honda gas std 4 sedan fwd front 96.5 175.4 62.5 54.1 2372 ohc 4 110 1bbl 3.15 3.58 9 5800 27 33 10295 86)
      (0 85 honda gas std 4 sedan fwd front 96.5 175.4 65.2 54.1 2465 ohc 4 110 mpfi 3.15 3.58 9 5800 24 28 12945 101)
      (1 107 honda gas std 2 sedan fwd front 96.5 169.1 66 51 2293 ohc 4 110 2bbl 3.15 3.58 9.1 5500 25 31 10345 100)
      (0 ? isuzu gas std 4 sedan rwd front 94.3 170.7 61.8 53.5 2337 ohc 4 111 2bbl 3.31 3.23 8.5 4800 24 29 6785 78)
      (1 ? isuzu gas std 2 sedan fwd front 94.5 155.9 63.6 52 1874 ohc 4 90 2bbl 3.03 3.11 9.6 5400 38 43 ? 70)
      (0 ? isuzu gas std 4 sedan fwd front 94.5 155.9 63.6 52 1909 ohc 4 90 2bbl 3.03 3.11 9.6 5400 38 43 ? 70)
      (2 ? isuzu gas std 2 hatchback rwd front 96 172.6 65.2 51.4 2734 ohc 4 119 spfi 3.43 3.23 9.2 5000 24 29 11048 90)
      (0 145 jaguar gas std 4 sedan rwd front 113 199.6 69.6 52.8 4066 dohc 6 258 mpfi 3.63 4.17 8.1 4750 15 19 32250 176)
      (0 ? jaguar gas std 4 sedan rwd front 113 199.6 69.6 52.8 4066 dohc 6 258 mpfi 3.63 4.17 8.1 4750 15 19 35550 176)
      (0 ? jaguar gas std 2 sedan rwd front 102 191.7 70.6 47.8 3950 ohcv 12 326 mpfi 3.54 2.76 11.5 5000 13 17 36000 262)
      (1 104 mazda gas std 2 hatchback fwd front 93.1 159.1 64.2 54.1 1890 ohc 4 91 2bbl 3.03 3.15 9 5000 30 31 5195 68)
      (1 104 mazda gas std 2 hatchback fwd front 93.1 159.1 64.2 54.1 1900 ohc 4 91 2bbl 3.03 3.15 9 5000 31 38 6095 68)
      (1 104 mazda gas std 2 hatchback fwd front 93.1 159.1 64.2 54.1 1905 ohc 4 91 2bbl 3.03 3.15 9 5000 31 38 6795 68)
      (1 113 mazda gas std 4 sedan fwd front 93.1 166.8 64.2 54.1 1945 ohc 4 91 2bbl 3.03 3.15 9 5000 31 38 6695 68)
      (1 113 mazda gas std 4 sedan fwd front 93.1 166.8 64.2 54.1 1950 ohc 4 91 2bbl 3.08 3.15 9 5000 31 38 7395 68)
      (3 150 mazda gas std 2 hatchback rwd front 95.3 169 65.7 49.6 2380 rotor 2 70 4bbl ? ? 9.4 6000 17 23 10945 101)
      (3 150 mazda gas std 2 hatchback rwd front 95.3 169 65.7 49.6 2380 rotor 2 70 4bbl ? ? 9.4 6000 17 23 11845 101)
      (3 150 mazda gas std 2 hatchback rwd front 95.3 169 65.7 49.6 2385 rotor 2 70 4bbl ? ? 9.4 6000 17 23 13645 101)
      (3 150 mazda gas std 2 hatchback rwd front 95.3 169 65.7 49.6 2500 rotor 2 80 mpfi ? ? 9.4 6000 16 23 15645 135)
      (1 129 mazda gas std 2 hatchback fwd front 98.8 177.8 66.5 53.7 2385 ohc 4 122 2bbl 3.39 3.39 8.6 4800 26 32 8845 84)
      (0 115 mazda gas std 4 sedan fwd front 98.8 177.8 66.5 55.5 2410 ohc 4 122 2bbl 3.39 3.39 8.6 4800 26 32 8495 84)
      (1 129 mazda gas std 2 hatchback fwd front 98.8 177.8 66.5 53.7 2385 ohc 4 122 2bbl 3.39 3.39 8.6 4800 26 32 10595 84)
      (0 115 mazda gas std 4 sedan fwd front 98.8 177.8 66.5 55.5 2410 ohc 4 122 2bbl 3.39 3.39 8.6 4800 26 32 10245 84)
      (0 ? mazda diesel std ? sedan fwd front 98.8 177.8 66.5 55.5 2443 ohc 4 122 idi 3.39 3.39 22.7 4650 36 42 10795 64)
      (0 115 mazda gas std 4 hatchback fwd front 98.8 177.8 66.5 55.5 2425 ohc 4 122 2bbl 3.39 3.39 8.6 4800 26 32 11245 84)
      (0 118 mazda gas std 4 sedan rwd front 104.9 175 66.1 54.4 2670 ohc 4 140 mpfi 3.76 3.16 8 5000 19 27 18280 120)
      (0 ? mazda diesel std 4 sedan rwd front 104.9 175 66.1 54.4 2700 ohc 4 134 idi 3.43 3.64 22 4200 31 39 18344 72)
      (-1 93 mercedes-benz diesel turbo 4 sedan rwd front 110 190.9 70.3 56.5 3515 ohc 5 183 idi 3.58 3.64 21.5 4350 22 25 25552 123)
      (-1 93 mercedes-benz diesel turbo 4 wagon rwd front 110 190.9 70.3 58.7 3750 ohc 5 183 idi 3.58 3.64 21.5 4350 22 25 28248 123)
      (0 93 mercedes-benz diesel turbo 2 hardtop rwd front 106.7 187.5 70.3 54.9 3495 ohc 5 183 idi 3.58 3.64 21.5 4350 22 25 28176 123)
      (-1 93 mercedes-benz diesel turbo 4 sedan rwd front 115.6 202.6 71.7 56.3 3770 ohc 5 183 idi 3.58 3.64 21.5 4350 22 25 31600 123)
      (-1 ? mercedes-benz gas std 4 sedan rwd front 115.6 202.6 71.7 56.5 3740 ohcv 8 234 mpfi 3.46 3.1 8.3 4750 16 18 34184 155)
      (3 142 mercedes-benz gas std 2 convertible rwd front 96.6 180.3 70.5 50.8 3685 ohcv 8 234 mpfi 3.46 3.1 8.3 4750 16 18 35056 155)
      (0 ? mercedes-benz gas std 4 sedan rwd front 120.9 208.1 71.7 56.7 3900 ohcv 8 308 mpfi 3.8 3.35 8 4500 14 16 40960 184)
      (1 ? mercedes-benz gas std 2 hardtop rwd front 112 199.2 72 55.4 3715 ohcv 8 304 mpfi 3.8 3.35 8 4500 14 16 45400 184)
      (1 ? mercury gas turbo 2 hatchback rwd front 102.7 178.4 68 54.8 2910 ohc 4 140 mpfi 3.78 3.12 8 5000 19 24 16503 175)
      (2 161 mitsubishi gas std 2 hatchback fwd front 93.7 157.3 64.4 50.8 1918 ohc 4 92 2bbl 2.97 3.23 9.4 5500 37 41 5389 68)
      (2 161 mitsubishi gas std 2 hatchback fwd front 93.7 157.3 64.4 50.8 1944 ohc 4 92 2bbl 2.97 3.23 9.4 5500 31 38 6189 68)
      (2 161 mitsubishi gas std 2 hatchback fwd front 93.7 157.3 64.4 50.8 2004 ohc 4 92 2bbl 2.97 3.23 9.4 5500 31 38 6669 68)
      (1 161 mitsubishi gas turbo 2 hatchback fwd front 93 157.3 63.8 50.8 2145 ohc 4 98 spdi 3.03 3.39 7.6 5500 24 30 7689 102)
      (3 153 mitsubishi gas turbo 2 hatchback fwd front 96.3 173 65.4 49.4 2370 ohc 4 110 spdi 3.17 3.46 7.5 5500 23 30 9959 116)
      (3 153 mitsubishi gas std 2 hatchback fwd front 96.3 173 65.4 49.4 2328 ohc 4 122 2bbl 3.35 3.46 8.5 5000 25 32 8499 88)
      (3 ? mitsubishi gas turbo 2 hatchback fwd front 95.9 173.2 66.3 50.2 2833 ohc 4 156 spdi 3.58 3.86 7 5000 19 24 12629 145)
      (3 ? mitsubishi gas turbo 2 hatchback fwd front 95.9 173.2 66.3 50.2 2921 ohc 4 156 spdi 3.59 3.86 7 5000 19 24 14869 145)
      (3 ? mitsubishi gas turbo 2 hatchback fwd front 95.9 173.2 66.3 50.2 2926 ohc 4 156 spdi 3.59 3.86 7 5000 19 24 14489 145)
      (1 125 mitsubishi gas std 4 sedan fwd front 96.3 172.4 65.4 51.6 2365 ohc 4 122 2bbl 3.35 3.46 8.5 5000 25 32 6989 88)
      (1 125 mitsubishi gas std 4 sedan fwd front 96.3 172.4 65.4 51.6 2405 ohc 4 122 2bbl 3.35 3.46 8.5 5000 25 32 8189 88)
      (1 125 mitsubishi gas turbo 4 sedan fwd front 96.3 172.4 65.4 51.6 2403 ohc 4 110 spdi 3.17 3.46 7.5 5500 23 30 9279 116)
      (-1 137 mitsubishi gas std 4 sedan fwd front 96.3 172.4 65.4 51.6 2403 ohc 4 110 spdi 3.17 3.46 7.5 5500 23 30 9279 116)
      (1 128 nissan gas std 2 sedan fwd front 94.5 165.3 63.8 54.5 1889 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 5499 69)
      (1 128 nissan diesel std 2 sedan fwd front 94.5 165.3 63.8 54.5 2017 ohc 4 103 idi 2.99 3.47 21.9 4800 45 50 7099 55)
      (1 128 nissan gas std 2 sedan fwd front 94.5 165.3 63.8 54.5 1918 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 6649 69)
      (1 122 nissan gas std 4 sedan fwd front 94.5 165.3 63.8 54.5 1938 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 6849 69)
      (1 103 nissan gas std 4 wagon fwd front 94.5 170.2 63.8 53.5 2024 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 7349 69)
      (1 128 nissan gas std 2 sedan fwd front 94.5 165.3 63.8 54.5 1951 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 7299 69)
      (1 128 nissan gas std 2 hatchback fwd front 94.5 165.6 63.8 53.3 2028 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 7799 69)
      (1 122 nissan gas std 4 sedan fwd front 94.5 165.3 63.8 54.5 1971 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 7499 69)
      (1 103 nissan gas std 4 wagon fwd front 94.5 170.2 63.8 53.5 2037 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 7999 69)
      (2 168 nissan gas std 2 hardtop fwd front 95.1 162.4 63.8 53.3 2008 ohc 4 97 2bbl 3.15 3.29 9.4 5200 31 37 8249 69)
      (0 106 nissan gas std 4 hatchback fwd front 97.2 173.4 65.2 54.7 2324 ohc 4 120 2bbl 3.33 3.47 8.5 5200 27 34 8949 97)
      (0 106 nissan gas std 4 sedan fwd front 97.2 173.4 65.2 54.7 2302 ohc 4 120 2bbl 3.33 3.47 8.5 5200 27 34 9549 97)
      (0 128 nissan gas std 4 sedan fwd front 100.4 181.7 66.5 55.1 3095 ohcv 6 181 mpfi 3.43 3.27 9 5200 17 22 13499 152)
      (0 108 nissan gas std 4 wagon fwd front 100.4 184.6 66.5 56.1 3296 ohcv 6 181 mpfi 3.43 3.27 9 5200 17 22 14399 152)
      (0 108 nissan gas std 4 sedan fwd front 100.4 184.6 66.5 55.1 3060 ohcv 6 181 mpfi 3.43 3.27 9 5200 19 25 13499 152)
      (3 194 nissan gas std 2 hatchback rwd front 91.3 170.7 67.9 49.7 3071 ohcv 6 181 mpfi 3.43 3.27 9 5200 19 25 17199 160)
      (3 194 nissan gas turbo 2 hatchback rwd front 91.3 170.7 67.9 49.7 3139 ohcv 6 181 mpfi 3.43 3.27 7.8 5200 17 23 19699 200)
      (1 231 nissan gas std 2 hatchback rwd front 99.2 178.5 67.9 49.7 3139 ohcv 6 181 mpfi 3.43 3.27 9 5200 19 25 18399 160)
      (0 161 peugot gas std 4 sedan rwd front 107.9 186.7 68.4 56.7 3020 l 4 120 mpfi 3.46 3.19 8.4 5000 19 24 11900 97)
      (0 161 peugot diesel turbo 4 sedan rwd front 107.9 186.7 68.4 56.7 3197 l 4 152 idi 3.7 3.52 21 4150 28 33 13200 95)
      (0 ? peugot gas std 4 wagon rwd front 114.2 198.9 68.4 58.7 3230 l 4 120 mpfi 3.46 3.19 8.4 5000 19 24 12440 97)
      (0 ? peugot diesel turbo 4 wagon rwd front 114.2 198.9 68.4 58.7 3430 l 4 152 idi 3.7 3.52 21 4150 25 25 13860 95)
      (0 161 peugot gas std 4 sedan rwd front 107.9 186.7 68.4 56.7 3075 l 4 120 mpfi 3.46 2.19 8.4 5000 19 24 15580 95)
      (0 161 peugot diesel turbo 4 sedan rwd front 107.9 186.7 68.4 56.7 3252 l 4 152 idi 3.7 3.52 21 4150 28 33 16900 95)
      (0 ? peugot gas std 4 wagon rwd front 114.2 198.9 68.4 56.7 3285 l 4 120 mpfi 3.46 2.19 8.4 5000 19 24 16695 95)
      (0 ? peugot diesel turbo 4 wagon rwd front 114.2 198.9 68.4 58.7 3485 l 4 152 idi 3.7 3.52 21 4150 25 25 17075 95)
      (0 161 peugot gas std 4 sedan rwd front 107.9 186.7 68.4 56.7 3075 l 4 120 mpfi 3.46 3.19 8.4 5000 19 24 16630 97)
      (0 161 peugot diesel turbo 4 sedan rwd front 107.9 186.7 68.4 56.7 3252 l 4 152 idi 3.7 3.52 21 4150 28 33 17950 95)
      (0 161 peugot gas turbo 4 sedan rwd front 108 186.7 68.3 56 3130 l 4 134 mpfi 3.61 3.21 7 5600 18 24 18150 142)
      (1 119 plymouth gas std 2 hatchback fwd front 93.7 157.3 63.8 50.8 1918 ohc 4 90 2bbl 2.97 3.23 9.4 5500 37 41 5572 68)
      (1 119 plymouth gas turbo 2 hatchback fwd front 93.7 157.3 63.8 50.8 2128 ohc 4 98 spdi 3.03 3.39 7.6 5500 24 30 7957 102)
      (1 154 plymouth gas std 4 hatchback fwd front 93.7 157.3 63.8 50.6 1967 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 6229 68)
      (1 154 plymouth gas std 4 sedan fwd front 93.7 167.3 63.8 50.8 1989 ohc 4 90 2bbl 2.97 3.23 9.4 5500 31 38 6692 68)
      (1 154 plymouth gas std 4 sedan fwd front 93.7 167.3 63.8 50.8 2191 ohc 4 98 2bbl 2.97 3.23 9.4 5500 31 38 7609 68)
      (-1 74 plymouth gas std 4 wagon fwd front 103.3 174.6 64.6 59.8 2535 ohc 4 122 2bbl 3.35 3.46 8.5 5000 24 30 8921 88)
      (3 ? plymouth gas turbo 2 hatchback rwd front 95.9 173.2 66.3 50.2 2818 ohc 4 156 spdi 3.59 3.86 7 5000 19 24 12764 145)
      (3 186 porsche gas std 2 hatchback rwd front 94.5 168.9 68.3 50.2 2778 ohc 4 151 mpfi 3.94 3.11 9.5 5500 19 27 22018 143)
      (3 ? porsche gas std 2 hardtop rwd rear 89.5 168.9 65 51.6 2756 ohcf 6 194 mpfi 3.74 2.9 9.5 5900 17 25 32528 207)
      (3 ? porsche gas std 2 hardtop rwd rear 89.5 168.9 65 51.6 2756 ohcf 6 194 mpfi 3.74 2.9 9.5 5900 17 25 34028 207)
      (3 ? porsche gas std 2 convertible rwd rear 89.5 168.9 65 51.6 2800 ohcf 6 194 mpfi 3.74 2.9 9.5 5900 17 25 37028 207)
      (1 ? porsche gas std 2 hatchback rwd front 98.4 175.7 72.3 50.5 3366 dohcv 8 203 mpfi 3.94 3.11 10 5750 17 28 ? 288)
      (0 ? renault gas std 4 wagon fwd front 96.1 181.5 66.5 55.2 2579 ohc 4 132 mpfi 3.46 3.9 8.7 ? 23 31 9295 ?)
      (2 ? renault gas std 2 hatchback fwd front 96.1 176.8 66.6 50.5 2460 ohc 4 132 mpfi 3.46 3.9 8.7 ? 23 31 9895 ?)
      (3 150 saab gas std 2 hatchback fwd front 99.1 186.6 66.5 56.1 2658 ohc 4 121 mpfi 3.54 3.07 9.31 5250 21 28 11850 110)
      (2 104 saab gas std 4 sedan fwd front 99.1 186.6 66.5 56.1 2695 ohc 4 121 mpfi 3.54 3.07 9.3 5250 21 28 12170 110)
      (3 150 saab gas std 2 hatchback fwd front 99.1 186.6 66.5 56.1 2707 ohc 4 121 mpfi 2.54 2.07 9.3 5250 21 28 15040 110)
      (2 104 saab gas std 4 sedan fwd front 99.1 186.6 66.5 56.1 2758 ohc 4 121 mpfi 3.54 3.07 9.3 5250 21 28 15510 110)
      (3 150 saab gas turbo 2 hatchback fwd front 99.1 186.6 66.5 56.1 2808 dohc 4 121 mpfi 3.54 3.07 9 5500 19 26 18150 160)
      (2 104 saab gas turbo 4 sedan fwd front 99.1 186.6 66.5 56.1 2847 dohc 4 121 mpfi 3.54 3.07 9 5500 19 26 18620 160)
      (2 83 subaru gas std 2 hatchback fwd front 93.7 156.9 63.4 53.7 2050 ohcf 4 97 2bbl 3.62 2.36 9 4900 31 36 5118 69)
      (2 83 subaru gas std 2 hatchback fwd front 93.7 157.9 63.6 53.7 2120 ohcf 4 108 2bbl 3.62 2.64 8.7 4400 26 31 7053 73)
      (2 83 subaru gas std 2 hatchback 4wd front 93.3 157.3 63.8 55.7 2240 ohcf 4 108 2bbl 3.62 2.64 8.7 4400 26 31 7603 73)
      (0 102 subaru gas std 4 sedan fwd front 97.2 172 65.4 52.5 2145 ohcf 4 108 2bbl 3.62 2.64 9.5 4800 32 37 7126 82)
      (0 102 subaru gas std 4 sedan fwd front 97.2 172 65.4 52.5 2190 ohcf 4 108 2bbl 3.62 2.64 9.5 4400 28 33 7775 82)
      (0 102 subaru gas std 4 sedan fwd front 97.2 172 65.4 52.5 2340 ohcf 4 108 mpfi 3.62 2.64 9 5200 26 32 9960 94)
      (0 102 subaru gas std 4 sedan 4wd front 97 172 65.4 54.3 2385 ohcf 4 108 2bbl 3.62 2.64 9 4800 24 25 9233 82)
      (0 102 subaru gas turbo 4 sedan 4wd front 97 172 65.4 54.3 2510 ohcf 4 108 mpfi 3.62 2.64 7.7 4800 24 29 11259 111)
      (0 89 subaru gas std 4 wagon fwd front 97 173.5 65.4 53 2290 ohcf 4 108 2bbl 3.62 2.64 9 4800 28 32 7463 82)
      (0 89 subaru gas std 4 wagon fwd front 97 173.5 65.4 53 2455 ohcf 4 108 mpfi 3.62 2.64 9 5200 25 31 10198 94)
      (0 85 subaru gas std 4 wagon 4wd front 96.9 173.6 65.4 54.9 2420 ohcf 4 108 2bbl 3.62 2.64 9 4800 23 29 8013 82)
      (0 85 subaru gas turbo 4 wagon 4wd front 96.9 173.6 65.4 54.9 2650 ohcf 4 108 mpfi 3.62 2.64 7.7 4800 23 23 11694 111)
      (1 87 toyota gas std 2 hatchback fwd front 95.7 158.7 63.6 54.5 1985 ohc 4 92 2bbl 3.05 3.03 9 4800 35 39 5348 62)
      (1 87 toyota gas std 2 hatchback fwd front 95.7 158.7 63.6 54.5 2040 ohc 4 92 2bbl 3.05 3.03 9 4800 31 38 6338 62)
      (1 74 toyota gas std 4 hatchback fwd front 95.7 158.7 63.6 54.5 2015 ohc 4 92 2bbl 3.05 3.03 9 4800 31 38 6488 62)
      (0 77 toyota gas std 4 wagon fwd front 95.7 169.7 63.6 59.1 2280 ohc 4 92 2bbl 3.05 3.03 9 4800 31 37 6918 62)
      (0 81 toyota gas std 4 wagon 4wd front 95.7 169.7 63.6 59.1 2290 ohc 4 92 2bbl 3.05 3.03 9 4800 27 32 7898 62)
      (0 91 toyota gas std 4 wagon 4wd front 95.7 169.7 63.6 59.1 3110 ohc 4 92 2bbl 3.05 3.03 9 4800 27 32 8778 62)
      (0 91 toyota gas std 4 sedan fwd front 95.7 166.3 64.4 53 2081 ohc 4 98 2bbl 3.19 3.03 9 4800 30 37 6938 70)
      (0 91 toyota gas std 4 hatchback fwd front 95.7 166.3 64.4 52.8 2109 ohc 4 98 2bbl 3.19 3.03 9 4800 30 37 7198 70)
      (0 91 toyota diesel std 4 sedan fwd front 95.7 166.3 64.4 53 2275 ohc 4 110 idi 3.27 3.35 22.5 4500 34 36 7898 56)
      (0 91 toyota diesel std 4 hatchback fwd front 95.7 166.3 64.4 52.8 2275 ohc 4 110 idi 3.27 3.35 22.5 4500 38 47 7788 56)
      (0 91 toyota gas std 4 sedan fwd front 95.7 166.3 64.4 53 2094 ohc 4 98 2bbl 3.19 3.03 9 4800 38 47 7738 70)
      (0 91 toyota gas std 4 hatchback fwd front 95.7 166.3 64.4 52.8 2122 ohc 4 98 2bbl 3.19 3.03 9 4800 28 34 8358 70)
      (0 91 toyota gas std 4 sedan fwd front 95.7 166.3 64.4 52.8 2140 ohc 4 98 2bbl 3.19 3.03 9 4800 28 34 9258 70)
      (1 168 toyota gas std 2 sedan rwd front 94.5 168.7 64 52.6 2169 ohc 4 98 2bbl 3.19 3.03 9 4800 29 34 8058 70)
      (1 168 toyota gas std 2 hatchback rwd front 94.5 168.7 64 52.6 2204 ohc 4 98 2bbl 3.19 3.03 9 4800 29 34 8238 70)
      (1 168 toyota gas std 2 sedan rwd front 94.5 168.7 64 52.6 2265 dohc 4 98 mpfi 3.24 3.08 9.4 6600 26 29 9298 112)
      (1 168 toyota gas std 2 hatchback rwd front 94.5 168.7 64 52.6 2300 dohc 4 98 mpfi 3.24 3.08 9.4 6600 26 29 9538 112)
      (2 134 toyota gas std 2 hardtop rwd front 98.4 176.2 65.6 52 2540 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 8449 116)
      (2 134 toyota gas std 2 hardtop rwd front 98.4 176.2 65.6 52 2536 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 9639 116)
      (2 134 toyota gas std 2 hatchback rwd front 98.4 176.2 65.6 52 2551 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 9989 116)
      (2 134 toyota gas std 2 hardtop rwd front 98.4 176.2 65.6 52 2679 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 11199 116)
      (2 134 toyota gas std 2 hatchback rwd front 98.4 176.2 65.6 52 2714 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 11549 116)
      (2 134 toyota gas std 2 convertible rwd front 98.4 176.2 65.6 53 2975 ohc 4 146 mpfi 3.62 3.5 9.3 4800 24 30 17669 116)
      (-1 65 toyota gas std 4 sedan fwd front 102.4 175.6 66.5 54.9 2326 ohc 4 122 mpfi 3.31 3.54 8.7 4200 29 34 8948 92)
      (-1 65 toyota diesel turbo 4 sedan fwd front 102.4 175.6 66.5 54.9 2480 ohc 4 110 idi 3.27 3.35 22.5 4500 30 33 10698 73)
      (-1 65 toyota gas std 4 hatchback fwd front 102.4 175.6 66.5 53.9 2414 ohc 4 122 mpfi 3.31 3.54 8.7 4200 27 32 9988 92)
      (-1 65 toyota gas std 4 sedan fwd front 102.4 175.6 66.5 54.9 2414 ohc 4 122 mpfi 3.31 3.54 8.7 4200 27 32 10898 92)
      (-1 65 toyota gas std 4 hatchback fwd front 102.4 175.6 66.5 53.9 2458 ohc 4 122 mpfi 3.31 3.54 8.7 4200 27 32 11248 92)
      (3 197 toyota gas std 2 hatchback rwd front 102.9 183.5 67.7 52 2976 dohc 6 171 mpfi 3.27 3.35 9.3 5200 20 24 16558 161)
      (3 197 toyota gas std 2 hatchback rwd front 102.9 183.5 67.7 52 3016 dohc 6 171 mpfi 3.27 3.35 9.3 5200 19 24 15998 161)
      (-1 90 toyota gas std 4 sedan rwd front 104.5 187.8 66.5 54.1 3131 dohc 6 171 mpfi 3.27 3.35 9.2 5200 20 24 15690 156)
      (-1 ? toyota gas std 4 wagon rwd front 104.5 187.8 66.5 54.1 3151 dohc 6 161 mpfi 3.27 3.35 9.2 5200 19 24 15750 156)
      (2 122 volkswagen diesel std 2 sedan fwd front 97.3 171.7 65.5 55.7 2261 ohc 4 97 idi 3.01 3.4 23 4800 37 46 7775 52)
      (2 122 volkswagen gas std 2 sedan fwd front 97.3 171.7 65.5 55.7 2209 ohc 4 109 mpfi 3.19 3.4 9 5250 27 34 7975 85)
      (2 94 volkswagen diesel std 4 sedan fwd front 97.3 171.7 65.5 55.7 2264 ohc 4 97 idi 3.01 3.4 23 4800 37 46 7995 52)
      (2 94 volkswagen gas std 4 sedan fwd front 97.3 171.7 65.5 55.7 2212 ohc 4 109 mpfi 3.19 3.4 9 5250 27 34 8195 85)
      (2 94 volkswagen gas std 4 sedan fwd front 97.3 171.7 65.5 55.7 2275 ohc 4 109 mpfi 3.19 3.4 9 5250 27 34 8495 85)
      (2 94 volkswagen diesel turbo 4 sedan fwd front 97.3 171.7 65.5 55.7 2319 ohc 4 97 idi 3.01 3.4 23 4500 37 42 9495 68)
      (2 94 volkswagen gas std 4 sedan fwd front 97.3 171.7 65.5 55.7 2300 ohc 4 109 mpfi 3.19 3.4 10 5500 26 32 9995 100)
      (3 ? volkswagen gas std 2 convertible fwd front 94.5 159.3 64.2 55.6 2254 ohc 4 109 mpfi 3.19 3.4 8.5 5500 24 29 11595 90)
      (3 256 volkswagen gas std 2 hatchback fwd front 94.5 165.7 64 51.4 2221 ohc 4 109 mpfi 3.19 3.4 8.5 5500 24 29 9980 90)
      (0 ? volkswagen gas std 4 sedan fwd front 100.4 180.2 66.9 55.1 2661 ohc 5 136 mpfi 3.19 3.4 8.5 5500 19 24 13295 110)
      (0 ? volkswagen diesel turbo 4 sedan fwd front 100.4 180.2 66.9 55.1 2579 ohc 4 97 idi 3.01 3.4 23 4500 33 38 13845 68)
      (0 ? volkswagen gas std 4 wagon fwd front 100.4 183.1 66.9 55.1 2563 ohc 4 109 mpfi 3.19 3.4 9 5500 25 31 12290 88)
      (-2 103 volvo gas std 4 sedan rwd front 104.3 188.8 67.2 56.2 2912 ohc 4 141 mpfi 3.78 3.15 9.5 5400 23 28 12940 114)
      (-1 74 volvo gas std 4 wagon rwd front 104.3 188.8 67.2 57.5 3034 ohc 4 141 mpfi 3.78 3.15 9.5 5400 23 28 13415 114)
      (-2 103 volvo gas std 4 sedan rwd front 104.3 188.8 67.2 56.2 2935 ohc 4 141 mpfi 3.78 3.15 9.5 5400 24 28 15985 114)
      (-1 74 volvo gas std 4 wagon rwd front 104.3 188.8 67.2 57.5 3042 ohc 4 141 mpfi 3.78 3.15 9.5 5400 24 28 16515 114)
      (-2 103 volvo gas turbo 4 sedan rwd front 104.3 188.8 67.2 56.2 3045 ohc 4 130 mpfi 3.62 3.15 7.5 5100 17 22 18420 162)
      (-1 74 volvo gas turbo 4 wagon rwd front 104.3 188.8 67.2 57.5 3157 ohc 4 130 mpfi 3.62 3.15 7.5 5100 17 22 18950 162)
      (-1 95 volvo gas std 4 sedan rwd front 109.1 188.8 68.9 55.5 2952 ohc 4 141 mpfi 3.78 3.15 9.5 5400 23 28 16845 114)
      (-1 95 volvo gas turbo 4 sedan rwd front 109.1 188.8 68.8 55.5 3049 ohc 4 141 mpfi 3.78 3.15 8.7 5300 19 25 19045 160)
      (-1 95 volvo gas std 4 sedan rwd front 109.1 188.8 68.9 55.5 3012 ohcv 6 173 mpfi 3.58 2.87 8.8 5500 18 23 21485 134)
      (-1 95 volvo diesel turbo 4 sedan rwd front 109.1 188.8 68.9 55.5 3217 ohc 6 145 idi 3.01 3.4 23 4800 26 27 22470 106)
      (-1 95 volvo gas turbo 4 sedan rwd front 109.1 188.8 68.9 55.5 3062 ohc 4 141 mpfi 3.78 3.15 9.5 5400 19 25 22625 114)
      )))
