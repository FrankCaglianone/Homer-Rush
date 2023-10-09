;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;----------------------------------- LIBRARIES ------------------------------------------------------
; Libraries for interactive programs and drawing 
(require 2htdp/image)
(require racket/base)
  


;;------------------------------------------------- STRUCTURES --------------------------------------------------------------------------

; ------------------ SCENE -----------------------
;; Data types
; a Scene is a structure composed by:
; - image      : String
; - floors     : FLOORS
; - pos-init   : Number 
; - time       : Number
; interpretation: a scene is composed of an image, the floors, an initial position, and a time


;; Code 
(define-struct scene [image floors pos-init time])



; ------------------ GROUND ---------------------
;; Data types
; a Ground is composed by
; - start          : Number 
; - end            : Number 
; interpretation: a Ground as a start point and an end point


;; Code 
(define-struct ground [start end])



(provide (struct-out scene))
(provide (struct-out ground))



;------------------------------------ MAPS ----------------------------------------------------

;IMAGES DIMENSIONS
(define IMAGE-HEIGHT 224) ; the height in pixel of the image 
(define IMAGE-WIDTH 3392) ; the width in pixel of the image


;POSITION STANDARD
(define INITIAL-HEIGHT (* IMAGE-HEIGHT 2)) ; the height in pixel of the map 
(define INITIAL-WIDTH (* IMAGE-WIDTH 2))   ; the width in pixel of the map



;------------------------------------ MAP1 ----------------------------------------------------
; Floors of map 1
;; Data types 
; a floor is a List<structures> which is one of:
; - '()                        ; the empty list 
; - a list of structures       ;the non-empty list
; interpretation: a floor is a List<structures> of ground which is a structure 

;  a ground is a structure composed by:
; - a start width 
; - a start height 
; - an end width
; - an end height
; interpretation: a floor is composed of 2 starting point x and y and 2 ending points x and y 

(define M1-GROUND0 (make-ground (make-posn (+ INITIAL-WIDTH 100) 0)
                                (make-posn INITIAL-WIDTH 0)))
(define M1-GROUND1 (make-ground (make-posn INITIAL-WIDTH (- (* 2 INITIAL-HEIGHT)176.9))
                                (make-posn (- INITIAL-WIDTH 1250) (- (* 2 INITIAL-HEIGHT) 176.9))))
(define M1-GROUND2 (make-ground (make-posn (- INITIAL-WIDTH 1250) (* 2 INITIAL-HEIGHT))
                                (make-posn (- INITIAL-WIDTH 1368) (- (* 2 INITIAL-HEIGHT) 176.9))))
(define M1-GROUND3 (make-ground (make-posn (- INITIAL-WIDTH 1368) (- (* 2 INITIAL-HEIGHT)176.9))
                                (make-posn (- INITIAL-WIDTH 2100) (- (* 2 INITIAL-HEIGHT) 176.9))))
(define M1-GROUND4 (make-ground (make-posn (- INITIAL-WIDTH 2100) (- (* 2 INITIAL-HEIGHT)376))
                                (make-posn (- INITIAL-WIDTH 2300) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND5 (make-ground (make-posn (- INITIAL-WIDTH 2300) (* 2 INITIAL-HEIGHT))
                                (make-posn (- INITIAL-WIDTH 2376) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND6 (make-ground (make-posn (- INITIAL-WIDTH 2376) (- (* 2 INITIAL-HEIGHT)376))
                                (make-posn (- INITIAL-WIDTH 2576) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND7 (make-ground (make-posn (- INITIAL-WIDTH 2576) (* 2 INITIAL-HEIGHT))
                                (make-posn (- INITIAL-WIDTH 2652) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND8 (make-ground (make-posn (- INITIAL-WIDTH 2652) (- (* 2 INITIAL-HEIGHT)376))
                                (make-posn (- INITIAL-WIDTH 2852) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND9 (make-ground (make-posn (- INITIAL-WIDTH 2852) (* 2 INITIAL-HEIGHT))
                                (make-posn (- INITIAL-WIDTH 2964) (- (* 2 INITIAL-HEIGHT) 377))))
(define M1-GROUND10 (make-ground (make-posn (- INITIAL-WIDTH 2964) (- (* 2 INITIAL-HEIGHT)176.9))
                                 (make-posn (- INITIAL-WIDTH 4416) (- (* 2 INITIAL-HEIGHT)176.9))))
(define M1-GROUND11 (make-ground (make-posn (- INITIAL-WIDTH 4416) (- (* 2 INITIAL-HEIGHT)376))
                                 (make-posn (- INITIAL-WIDTH 4616) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND12 (make-ground (make-posn (- INITIAL-WIDTH 4616) (- (* 2 INITIAL-HEIGHT)176.9))
                                 (make-posn (- INITIAL-WIDTH 6648) (- (* 2 INITIAL-HEIGHT)176.9))))
(define M1-GROUND13 (make-ground (make-posn (- INITIAL-WIDTH 6648) (- (* 2 INITIAL-HEIGHT)376))
                                 (make-posn (- INITIAL-WIDTH 6848) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND14 (make-ground (make-posn (- INITIAL-WIDTH 6648) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 7050) (- (* 2 INITIAL-HEIGHT)450))))
(define M1-GROUND15 (make-ground (make-posn (- INITIAL-WIDTH 7050) (- (* 2 INITIAL-HEIGHT)450))
                                 (make-posn (- INITIAL-WIDTH 7500) (- (* 2 INITIAL-HEIGHT)450))))
(define M1-GROUND16 (make-ground (make-posn (- INITIAL-WIDTH 7500) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 7700) (- (* 2 INITIAL-HEIGHT)450))))
(define M1-GROUND17 (make-ground (make-posn (- INITIAL-WIDTH 7700) (- (* 2 INITIAL-HEIGHT)450))
                                 (make-posn (- INITIAL-WIDTH 8200) (- (* 2 INITIAL-HEIGHT)450))))
(define M1-GROUND18 (make-ground (make-posn (- INITIAL-WIDTH 8200) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 8340) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND19 (make-ground (make-posn (- INITIAL-WIDTH 8340) (- (* 2 INITIAL-HEIGHT)376))
                                 (make-posn (- INITIAL-WIDTH 8540) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND20 (make-ground (make-posn (- INITIAL-WIDTH 8540) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 8600) (- (* 2 INITIAL-HEIGHT)430))))
(define M1-GROUND21 (make-ground (make-posn (- INITIAL-WIDTH 8600) (- (* 2 INITIAL-HEIGHT)430))
                                 (make-posn (- INITIAL-WIDTH 8850) (- (* 2 INITIAL-HEIGHT)430))))
(define M1-GROUND22 (make-ground (make-posn (- INITIAL-WIDTH 8850) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 8950) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND23 (make-ground (make-posn (- INITIAL-WIDTH 8950) (- (* 2 INITIAL-HEIGHT)376))
                                 (make-posn (- INITIAL-WIDTH 9100) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND24 (make-ground (make-posn (- INITIAL-WIDTH 9100) (- (* 2 INITIAL-HEIGHT)176.9))
                                 (make-posn (- INITIAL-WIDTH 10450) (- (* 2 INITIAL-HEIGHT)176.9))))
(define M1-GROUND25 (make-ground (make-posn (- INITIAL-WIDTH 10450) (- (* 2 INITIAL-HEIGHT)376))
                                 (make-posn (- INITIAL-WIDTH 10600) (- (* 2 INITIAL-HEIGHT)376))))
(define M1-GROUND26 (make-ground (make-posn (- INITIAL-WIDTH 10600) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 10700) (- (* 2 INITIAL-HEIGHT)430))))
(define M1-GROUND27 (make-ground (make-posn (- INITIAL-WIDTH 10700) (- (* 2 INITIAL-HEIGHT)430))
                                 (make-posn (- INITIAL-WIDTH 11050) (- (* 2 INITIAL-HEIGHT)430))))
(define M1-GROUND28 (make-ground (make-posn (- INITIAL-WIDTH 11050) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 11150) (- (* 2 INITIAL-HEIGHT)300))))
(define M1-GROUND29 (make-ground (make-posn (- INITIAL-WIDTH 11150) (- (* 2 INITIAL-HEIGHT)300))
                                 (make-posn (- INITIAL-WIDTH 11500) (- (* 2 INITIAL-HEIGHT)300))))
(define M1-GROUND30 (make-ground (make-posn (- INITIAL-WIDTH 11500) (* 2 INITIAL-HEIGHT))
                                 (make-posn (- INITIAL-WIDTH 11560) (- (* 2 INITIAL-HEIGHT)176.9))))
(define M1-GROUND31 (make-ground (make-posn (- INITIAL-WIDTH 11560) (- (* 2 INITIAL-HEIGHT)176.9))
                                 (make-posn (- INITIAL-WIDTH 15000) (- (* 2 INITIAL-HEIGHT)176.9))))



; Initial floors
; Definition of all the floors of map 1
(define FLOORS_1 (list M1-GROUND0 M1-GROUND1 M1-GROUND2
                   M1-GROUND3 M1-GROUND4 M1-GROUND5
                   M1-GROUND6 M1-GROUND7 M1-GROUND8
                   M1-GROUND9 M1-GROUND10 M1-GROUND11
                   M1-GROUND12 M1-GROUND13 M1-GROUND14
                   M1-GROUND15 M1-GROUND16 M1-GROUND17
                   M1-GROUND18 M1-GROUND19 M1-GROUND20
                   M1-GROUND21 M1-GROUND22 M1-GROUND23
                   M1-GROUND24 M1-GROUND25 M1-GROUND26
                   M1-GROUND27 M1-GROUND28 M1-GROUND29
                   M1-GROUND30 M1-GROUND31))


; the structure scene with the image, floors, pos-init, time
(define MAP1 (make-scene (scale 5 (bitmap "MAP1.png")) FLOORS_1 (make-posn 6472 INITIAL-HEIGHT) 90)) 


; to export the MAP1 function to pther files   
(provide MAP1) 





;------------------------------------ MAP2 ----------------------------------------------------
; Floors of map 2
;; Data types 
; a floor is a List<structures> which is one of:
; - '()                        ; the empty list 
; - a list of structures       ;the non-empty list
; interpretation: a floor is a List<structures> of ground which is a structure 

;  a ground is a structure composed by:
; - a start width 
; - a start height 
; - an end width
; - an end height
; interpretation: a floor is composed of 2 starting point x and y and 2 ending points x and y


(define M2-GROUND0 (make-ground (make-posn (+ INITIAL-WIDTH 200) 0)
                             (make-posn INITIAL-WIDTH 0)))
(define M2-GROUND1 (make-ground (make-posn INITIAL-WIDTH (- (* 2 INITIAL-HEIGHT) 190))
                             (make-posn (- INITIAL-WIDTH 2234) (- (* 2 INITIAL-HEIGHT) 197))))
(define M2-GROUND2 (make-ground (make-posn (- INITIAL-WIDTH 2234) (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 2310) (- (* 2 INITIAL-HEIGHT) 220))))
(define M2-GROUND3 (make-ground (make-posn (- INITIAL-WIDTH 2310) (- (* 2 INITIAL-HEIGHT) 380))
                             (make-posn (- INITIAL-WIDTH 2592) (- (* 2 INITIAL-HEIGHT) 380))))
(define M2-GROUND4 (make-ground (make-posn (- INITIAL-WIDTH 2592) (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 2796)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND5 (make-ground (make-posn (- INITIAL-WIDTH 2796) (- (* 2 INITIAL-HEIGHT) 192))
                             (make-posn (- INITIAL-WIDTH 2832)  (- (* 2 INITIAL-HEIGHT) 192))))
(define M2-GROUND6 (make-ground (make-posn (- INITIAL-WIDTH 2832) (- (* 2 INITIAL-HEIGHT) 400))
                             (make-posn (- INITIAL-WIDTH 3060)  (- (* 2 INITIAL-HEIGHT) 400))))
(define M2-GROUND7 (make-ground (make-posn (- INITIAL-WIDTH 3060) (- (* 2 INITIAL-HEIGHT) 192))
                             (make-posn (- INITIAL-WIDTH 3168)  (- (* 2 INITIAL-HEIGHT) 192))))
(define M2-GROUND8 (make-ground (make-posn (- INITIAL-WIDTH 3168) (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 3336)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND9 (make-ground (make-posn (- INITIAL-WIDTH 3336) (- (* 2 INITIAL-HEIGHT) 400))
                             (make-posn (- INITIAL-WIDTH 3852)  (- (* 2 INITIAL-HEIGHT) 400))))
(define M2-GROUND10 (make-ground (make-posn (- INITIAL-WIDTH 3852) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 3984)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND11 (make-ground (make-posn (- INITIAL-WIDTH 3984) (- (* 2 INITIAL-HEIGHT) 190))
                              (make-posn (- INITIAL-WIDTH 4596)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND12 (make-ground (make-posn (- INITIAL-WIDTH 4596) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 4644)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND13 (make-ground (make-posn (- INITIAL-WIDTH 4644) (- (* 2 INITIAL-HEIGHT) 350))
                              (make-posn (- INITIAL-WIDTH 4872)  (- (* 2 INITIAL-HEIGHT) 350))))
(define M2-GROUND14 (make-ground (make-posn (- INITIAL-WIDTH 4872) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5028)  (- (* 2 INITIAL-HEIGHT) 350))))
(define M2-GROUND15 (make-ground (make-posn (- INITIAL-WIDTH 5028) (- (* 2 INITIAL-HEIGHT) 525))
                              (make-posn (- INITIAL-WIDTH 5532)  (- (* 2 INITIAL-HEIGHT) 525))))
(define M2-GROUND16 (make-ground (make-posn (- INITIAL-WIDTH 5532) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5676)  (- (* 2 INITIAL-HEIGHT) 525))))
(define M2-GROUND17 (make-ground (make-posn (- INITIAL-WIDTH 5676) (- (* 2 INITIAL-HEIGHT) 360))
                              (make-posn (- INITIAL-WIDTH 5940)  (- (* 2 INITIAL-HEIGHT) 360))))
(define M2-GROUND18 (make-ground (make-posn (- INITIAL-WIDTH 5940) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 6072)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND19 (make-ground (make-posn (- INITIAL-WIDTH 6072) (- (* 2 INITIAL-HEIGHT) 190))
                              (make-posn (- INITIAL-WIDTH 8150)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND20 (make-ground (make-posn (- INITIAL-WIDTH 8150) (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 8378)  (- (* 2 INITIAL-HEIGHT) 400))))
(define M2-GROUND21 (make-ground (make-posn (- INITIAL-WIDTH 8378) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8550)  (- (* 2 INITIAL-HEIGHT) 400))))
(define M2-GROUND22 (make-ground (make-posn (- INITIAL-WIDTH 8550) (- (* 2 INITIAL-HEIGHT) 575))
                              (make-posn (- INITIAL-WIDTH 9050)  (- (* 2 INITIAL-HEIGHT) 575))))
(define M2-GROUND23 (make-ground (make-posn (- INITIAL-WIDTH 9050) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9250)  (- (* 2 INITIAL-HEIGHT) 575))))
(define M2-GROUND24 (make-ground (make-posn (- INITIAL-WIDTH 9250) (- (* 2 INITIAL-HEIGHT) 505))
                              (make-posn (- INITIAL-WIDTH 9500)  (- (* 2 INITIAL-HEIGHT) 505))))
(define M2-GROUND25 (make-ground (make-posn (- INITIAL-WIDTH 9500) (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9690)  (- (* 2 INITIAL-HEIGHT) 505))))
(define M2-GROUND26 (make-ground (make-posn (- INITIAL-WIDTH 9690) (- (* 2 INITIAL-HEIGHT) 190))
                              (make-posn (- INITIAL-WIDTH 9740)  (- (* 2 INITIAL-HEIGHT) 190))))
(define M2-GROUND27 (make-ground (make-posn (- INITIAL-WIDTH 9740) (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 9968)  (- (* 2 INITIAL-HEIGHT) 400))))
(define M2-GROUND28 (make-ground (make-posn (- INITIAL-WIDTH 9968) (- (* 2 INITIAL-HEIGHT) 190))
                              (make-posn (- INITIAL-WIDTH 15000)  (- (* 2 INITIAL-HEIGHT) 190))))


;Initial floors
; Definition of all the floors of map 2
(define FLOORS_2 (list M2-GROUND0 M2-GROUND1 M2-GROUND2
                       M2-GROUND3 M2-GROUND4 M2-GROUND5
                       M2-GROUND6 M2-GROUND7 M2-GROUND8
                       M2-GROUND9 M2-GROUND10 M2-GROUND11
                       M2-GROUND12 M2-GROUND13 M2-GROUND14
                       M2-GROUND15 M2-GROUND16 M2-GROUND17
                       M2-GROUND18 M2-GROUND19 M2-GROUND20
                       M2-GROUND21 M2-GROUND22 M2-GROUND23
                       M2-GROUND24 M2-GROUND25 M2-GROUND26
                       M2-GROUND27 M2-GROUND28))

; the structure scene with the image, floors, pos-init, time
(define MAP2 (make-scene (scale 5 (bitmap "MAP2.png")) FLOORS_2 (make-posn 5908 INITIAL-HEIGHT) 90))


; to export the MAP2 function to other files 
(provide MAP2)



;------------------------------------ MAP3 ----------------------------------------------------
; Floors of map 3
;; Data types 
; a floor is a List<structures> which is one of:
; - '()                        ; the empty list 
; - a list of structures       ;the non-empty list
; interpretation: a floor is a List<structures> of ground which is a structure 

;  a ground is a structure composed by:
; - a start width 
; - a start height 
; - an end width
; - an end height
; interpretation: a floor is composed of 2 starting point x and y and 2 ending points x and y 


(define M3-GROUND0 (make-ground (make-posn (+ INITIAL-WIDTH 100) 0)
                             (make-posn INITIAL-WIDTH 0)))
(define M3-GROUND1 (make-ground (make-posn INITIAL-WIDTH (- (* 2 INITIAL-HEIGHT)176.9))
                             (make-posn (- INITIAL-WIDTH 996) (- (* 2 INITIAL-HEIGHT) 176.9))))
(define M3-GROUND2 (make-ground (make-posn (- INITIAL-WIDTH 996)  (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 1096) (- (* 2 INITIAL-HEIGHT) 176.9))))
(define M3-GROUND3 (make-ground (make-posn (- INITIAL-WIDTH 1096)  (- (* 2 INITIAL-HEIGHT)250))
                             (make-posn (- INITIAL-WIDTH 1332) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND4 (make-ground (make-posn (- INITIAL-WIDTH 1332)  (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 1440) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND5 (make-ground (make-posn (- INITIAL-WIDTH 1440)  (- (* 2 INITIAL-HEIGHT)300))
                             (make-posn (- INITIAL-WIDTH 1632) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND6 (make-ground (make-posn (- INITIAL-WIDTH 1632)  (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 1728) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND7 (make-ground (make-posn (- INITIAL-WIDTH 1728)  (- (* 2 INITIAL-HEIGHT)380))
                             (make-posn (- INITIAL-WIDTH 1920) (- (* 2 INITIAL-HEIGHT) 380))))
(define M3-GROUND8 (make-ground (make-posn (- INITIAL-WIDTH 1920)  (* 2 INITIAL-HEIGHT))
                             (make-posn (- INITIAL-WIDTH 2050) (- (* 2 INITIAL-HEIGHT) 380))))
(define M3-GROUND9 (make-ground (make-posn (- INITIAL-WIDTH 2050)  (- (* 2 INITIAL-HEIGHT)300))
                             (make-posn (- INITIAL-WIDTH 2244) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND10 (make-ground (make-posn (- INITIAL-WIDTH 2244)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 2344) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND11 (make-ground (make-posn (- INITIAL-WIDTH 2344)  (- (* 2 INITIAL-HEIGHT)400))
                              (make-posn (- INITIAL-WIDTH 2544) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND12 (make-ground (make-posn (- INITIAL-WIDTH 2544)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 2644) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND13 (make-ground (make-posn (- INITIAL-WIDTH 2644)  (- (* 2 INITIAL-HEIGHT)480))
                              (make-posn (- INITIAL-WIDTH 2844) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND14 (make-ground (make-posn (- INITIAL-WIDTH 2844)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 2944) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND15 (make-ground (make-posn (- INITIAL-WIDTH 2944)  (- (* 2 INITIAL-HEIGHT)480))
                              (make-posn (- INITIAL-WIDTH 3094) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND16 (make-ground (make-posn (- INITIAL-WIDTH 3094)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 3194) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND17 (make-ground (make-posn (- INITIAL-WIDTH 3194)  (- (* 2 INITIAL-HEIGHT)480))
                              (make-posn (- INITIAL-WIDTH 3394) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND18 (make-ground (make-posn (- INITIAL-WIDTH 3394)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 3494) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND19 (make-ground (make-posn (- INITIAL-WIDTH 3494)  (- (* 2 INITIAL-HEIGHT)580))
                              (make-posn (- INITIAL-WIDTH 3850) (- (* 2 INITIAL-HEIGHT) 580))))
(define M3-GROUND20 (make-ground (make-posn (- INITIAL-WIDTH 3850)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 3950) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND21 (make-ground (make-posn (- INITIAL-WIDTH 3950)  (- (* 2 INITIAL-HEIGHT) 320))
                              (make-posn (- INITIAL-WIDTH 4092) (- (* 2 INITIAL-HEIGHT) 320))))
(define M3-GROUND22 (make-ground (make-posn (- INITIAL-WIDTH 4092)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 4242) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND23 (make-ground (make-posn (- INITIAL-WIDTH 4242)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 4368) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND24 (make-ground (make-posn (- INITIAL-WIDTH 4368)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 4468) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND25 (make-ground (make-posn (- INITIAL-WIDTH 4468)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 4668) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND26 (make-ground (make-posn (- INITIAL-WIDTH 4668)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 4768) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND27 (make-ground (make-posn (- INITIAL-WIDTH 4768)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 4948) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND28 (make-ground (make-posn (- INITIAL-WIDTH 4948)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5000) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND29 (make-ground (make-posn (- INITIAL-WIDTH 5000)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 5076) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND30 (make-ground (make-posn (- INITIAL-WIDTH 5076)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5152) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND31 (make-ground (make-posn (- INITIAL-WIDTH 5152)  (- (* 2 INITIAL-HEIGHT) 480))
                              (make-posn (- INITIAL-WIDTH 5228) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND32 (make-ground (make-posn (- INITIAL-WIDTH 5228)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5304) (- (* 2 INITIAL-HEIGHT) 480))))
(define M3-GROUND33 (make-ground (make-posn (- INITIAL-WIDTH 5304)  (- (* 2 INITIAL-HEIGHT) 560))
                              (make-posn (- INITIAL-WIDTH 5380) (- (* 2 INITIAL-HEIGHT) 560))))
(define M3-GROUND34 (make-ground (make-posn (- INITIAL-WIDTH 5380)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5436) (- (* 2 INITIAL-HEIGHT) 560))))
(define M3-GROUND35 (make-ground (make-posn (- INITIAL-WIDTH 5436)  (- (* 2 INITIAL-HEIGHT) 640))
                              (make-posn (- INITIAL-WIDTH 5512) (- (* 2 INITIAL-HEIGHT) 640))))
(define M3-GROUND36 (make-ground (make-posn (- INITIAL-WIDTH 5512)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5588) (- (* 2 INITIAL-HEIGHT) 560))))
(define M3-GROUND37 (make-ground (make-posn (- INITIAL-WIDTH 5588)  (- (* 2 INITIAL-HEIGHT) 700))
                              (make-posn (- INITIAL-WIDTH 5714) (- (* 2 INITIAL-HEIGHT) 700))))
(define M3-GROUND38 (make-ground (make-posn (- INITIAL-WIDTH 5714)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 5825) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND39 (make-ground (make-posn (- INITIAL-WIDTH 5825)  (- (* 2 INITIAL-HEIGHT) 330))
                              (make-posn (- INITIAL-WIDTH 5950) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND40 (make-ground (make-posn (- INITIAL-WIDTH 5950)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 6050) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND41 (make-ground (make-posn (- INITIAL-WIDTH 6050)  (- (* 2 INITIAL-HEIGHT) 330))
                              (make-posn (- INITIAL-WIDTH 6200) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND42 (make-ground (make-posn (- INITIAL-WIDTH 6200)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 6300) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND43 (make-ground (make-posn (- INITIAL-WIDTH 6300)  (- (* 2 INITIAL-HEIGHT) 330))
                              (make-posn (- INITIAL-WIDTH 6500) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND44 (make-ground (make-posn (- INITIAL-WIDTH 6500)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 6600) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND45 (make-ground (make-posn (- INITIAL-WIDTH 6600)  (- (* 2 INITIAL-HEIGHT) 330))
                              (make-posn (- INITIAL-WIDTH 6750) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND46 (make-ground (make-posn (- INITIAL-WIDTH 6750)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 6800) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND47 (make-ground (make-posn (- INITIAL-WIDTH 6800)  (- (* 2 INITIAL-HEIGHT) 230))
                              (make-posn (- INITIAL-WIDTH 6950) (- (* 2 INITIAL-HEIGHT) 230))))
(define M3-GROUND48 (make-ground (make-posn (- INITIAL-WIDTH 6950)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 7050) (- (* 2 INITIAL-HEIGHT) 330))))
(define M3-GROUND49 (make-ground (make-posn (- INITIAL-WIDTH 7050)  (- (* 2 INITIAL-HEIGHT) 300))
                              (make-posn (- INITIAL-WIDTH 7125) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND50 (make-ground (make-posn (- INITIAL-WIDTH 7125)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 7175) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND51 (make-ground (make-posn (- INITIAL-WIDTH 7175)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 7275) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND52 (make-ground (make-posn (- INITIAL-WIDTH 7275)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 7325) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND53 (make-ground (make-posn (- INITIAL-WIDTH 7325)  (- (* 2 INITIAL-HEIGHT) 300))
                              (make-posn (- INITIAL-WIDTH 7425) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND54 (make-ground (make-posn (- INITIAL-WIDTH 7425)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 7550) (- (* 2 INITIAL-HEIGHT) 300))))
(define M3-GROUND55 (make-ground (make-posn (- INITIAL-WIDTH 7550)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 7650) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND56 (make-ground (make-posn (- INITIAL-WIDTH 7650)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 7800) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND57 (make-ground (make-posn (- INITIAL-WIDTH 7800)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 7925) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND58 (make-ground (make-posn (- INITIAL-WIDTH 7925)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8000) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND59 (make-ground (make-posn (- INITIAL-WIDTH 8000)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 8200) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND60 (make-ground (make-posn (- INITIAL-WIDTH 8200)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8300) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND61 (make-ground (make-posn (- INITIAL-WIDTH 8300)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 8375) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND62 (make-ground (make-posn (- INITIAL-WIDTH 8375)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8475) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND63 (make-ground (make-posn (- INITIAL-WIDTH 8475)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 8675) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND64 (make-ground (make-posn (- INITIAL-WIDTH 8675)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8775) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND65 (make-ground (make-posn (- INITIAL-WIDTH 8775)  (- (* 2 INITIAL-HEIGHT) 500))
                              (make-posn (- INITIAL-WIDTH 8855) (- (* 2 INITIAL-HEIGHT) 500))))
(define M3-GROUND66 (make-ground (make-posn (- INITIAL-WIDTH 8855)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 8955) (- (* 2 INITIAL-HEIGHT) 500))))
(define M3-GROUND67 (make-ground (make-posn (- INITIAL-WIDTH 8955)  (- (* 2 INITIAL-HEIGHT) 400))
                              (make-posn (- INITIAL-WIDTH 9065) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND68 (make-ground (make-posn (- INITIAL-WIDTH 9065)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9165) (- (* 2 INITIAL-HEIGHT) 400))))
(define M3-GROUND69 (make-ground (make-posn (- INITIAL-WIDTH 9165)  (- (* 2 INITIAL-HEIGHT) 250))
                              (make-posn (- INITIAL-WIDTH 9265) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND70 (make-ground (make-posn (- INITIAL-WIDTH 9265)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9365) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND71 (make-ground (make-posn (- INITIAL-WIDTH 9365)  (- (* 2 INITIAL-HEIGHT) 250))
                              (make-posn (- INITIAL-WIDTH 9465) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND72 (make-ground (make-posn (- INITIAL-WIDTH 9465)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9540) (- (* 2 INITIAL-HEIGHT) 250))))
(define M3-GROUND73 (make-ground (make-posn (- INITIAL-WIDTH 9540)  (- (* 2 INITIAL-HEIGHT) 350))
                              (make-posn (- INITIAL-WIDTH 9700) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND74 (make-ground (make-posn (- INITIAL-WIDTH 9700)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9780) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND75 (make-ground (make-posn (- INITIAL-WIDTH 9780)  (- (* 2 INITIAL-HEIGHT) 450))
                              (make-posn (- INITIAL-WIDTH 9850) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND76 (make-ground (make-posn (- INITIAL-WIDTH 9850)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 9950) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND77 (make-ground (make-posn (- INITIAL-WIDTH 9950)  (- (* 2 INITIAL-HEIGHT) 450))
                              (make-posn (- INITIAL-WIDTH 10150) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND78 (make-ground (make-posn (- INITIAL-WIDTH 10150)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 10200) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND79 (make-ground (make-posn (- INITIAL-WIDTH 10200)  (- (* 2 INITIAL-HEIGHT) 450))
                              (make-posn (- INITIAL-WIDTH 10375) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND80 (make-ground (make-posn (- INITIAL-WIDTH 10375)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 10475) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND81 (make-ground (make-posn (- INITIAL-WIDTH 10475)  (- (* 2 INITIAL-HEIGHT) 500))
                              (make-posn (- INITIAL-WIDTH 10925) (- (* 2 INITIAL-HEIGHT) 500))))
(define M3-GROUND82 (make-ground (make-posn (- INITIAL-WIDTH 10925)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 11000) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND83 (make-ground (make-posn (- INITIAL-WIDTH 11000)  (- (* 2 INITIAL-HEIGHT) 525))
                              (make-posn (- INITIAL-WIDTH 11100) (- (* 2 INITIAL-HEIGHT) 525))))
(define M3-GROUND84 (make-ground (make-posn (- INITIAL-WIDTH 11100)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 11225) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND85 (make-ground (make-posn (- INITIAL-WIDTH 11225)  (- (* 2 INITIAL-HEIGHT) 525))
                              (make-posn (- INITIAL-WIDTH 11325) (- (* 2 INITIAL-HEIGHT) 525))))
(define M3-GROUND86 (make-ground (make-posn (- INITIAL-WIDTH 11325)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 11350) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND87 (make-ground (make-posn (- INITIAL-WIDTH 11350)  (- (* 2 INITIAL-HEIGHT) 375))
                              (make-posn (- INITIAL-WIDTH 11500) (- (* 2 INITIAL-HEIGHT) 375))))
(define M3-GROUND88 (make-ground (make-posn (- INITIAL-WIDTH 11500)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 11600) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND89 (make-ground (make-posn (- INITIAL-WIDTH 11600)  (- (* 2 INITIAL-HEIGHT) 275))
                              (make-posn (- INITIAL-WIDTH 11800) (- (* 2 INITIAL-HEIGHT) 275))))
(define M3-GROUND90 (make-ground (make-posn (- INITIAL-WIDTH 11800)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 11850) (- (* 2 INITIAL-HEIGHT) 450))))
(define M3-GROUND91 (make-ground (make-posn (- INITIAL-WIDTH 11850)  (- (* 2 INITIAL-HEIGHT) 350))
                              (make-posn (- INITIAL-WIDTH 11950) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND92 (make-ground (make-posn (- INITIAL-WIDTH 11950)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 12050) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND93 (make-ground (make-posn (- INITIAL-WIDTH 12050)  (- (* 2 INITIAL-HEIGHT) 350))
                              (make-posn (- INITIAL-WIDTH 12150) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND94 (make-ground (make-posn (- INITIAL-WIDTH 12150)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 12250) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND95 (make-ground (make-posn (- INITIAL-WIDTH 12250)  (- (* 2 INITIAL-HEIGHT) 350))
                              (make-posn (- INITIAL-WIDTH 12300) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND96 (make-ground (make-posn (- INITIAL-WIDTH 12300)  (* 2 INITIAL-HEIGHT))
                              (make-posn (- INITIAL-WIDTH 12375) (- (* 2 INITIAL-HEIGHT) 350))))
(define M3-GROUND97 (make-ground (make-posn (- INITIAL-WIDTH 12375)  (- (* 2 INITIAL-HEIGHT) 176.9))
                              (make-posn (- INITIAL-WIDTH 14000) (- (* 2 INITIAL-HEIGHT) 176.9))))



;Initial floors
; Definition of all the floors of map 3
(define FLOORS_3 (list M3-GROUND0 M3-GROUND1 M3-GROUND2
                   M3-GROUND3 M3-GROUND4 M3-GROUND5
                   M3-GROUND6 M3-GROUND7 M3-GROUND8
                   M3-GROUND9 M3-GROUND10 M3-GROUND11
                   M3-GROUND12 M3-GROUND13 M3-GROUND14
                   M3-GROUND15 M3-GROUND16 M3-GROUND17
                   M3-GROUND18 M3-GROUND19 M3-GROUND20
                   M3-GROUND21 M3-GROUND22 M3-GROUND23
                   M3-GROUND24 M3-GROUND25 M3-GROUND26
                   M3-GROUND27 M3-GROUND28 M3-GROUND29
                   M3-GROUND30 M3-GROUND31 M3-GROUND32
                   M3-GROUND33 M3-GROUND34 M3-GROUND35
                   M3-GROUND36 M3-GROUND37 M3-GROUND38
                   M3-GROUND39 M3-GROUND40 M3-GROUND41
                   M3-GROUND42 M3-GROUND43 M3-GROUND44
                   M3-GROUND45 M3-GROUND46 M3-GROUND47
                   M3-GROUND48 M3-GROUND49 M3-GROUND50
                   M3-GROUND51 M3-GROUND52 M3-GROUND53
                   M3-GROUND54 M3-GROUND55 M3-GROUND56
                   M3-GROUND57 M3-GROUND58 M3-GROUND59
                   M3-GROUND60 M3-GROUND61 M3-GROUND62
                   M3-GROUND63 M3-GROUND64 M3-GROUND65
                   M3-GROUND66 M3-GROUND67 M3-GROUND68
                   M3-GROUND69 M3-GROUND70 M3-GROUND71
                   M3-GROUND72 M3-GROUND73 M3-GROUND74
                   M3-GROUND75 M3-GROUND76 M3-GROUND77
                   M3-GROUND78 M3-GROUND79 M3-GROUND80
                   M3-GROUND81 M3-GROUND82 M3-GROUND83
                   M3-GROUND84 M3-GROUND85 M3-GROUND86
                   M3-GROUND87 M3-GROUND88 M3-GROUND89
                   M3-GROUND90 M3-GROUND91 M3-GROUND92
                   M3-GROUND93 M3-GROUND94 M3-GROUND95
                   M3-GROUND96 M3-GROUND97))


; the structure scene with the image, floors, pos-init, time
(define MAP3 (make-scene (scale 5 (bitmap "MAP3.png")) FLOORS_3 (make-posn 6484 INITIAL-HEIGHT) 90))


; to export the MAP3 function to other files
(provide MAP3)






;------------------------------------ MENU ----------------------------------------------------
; the structure scene with the image, floors, pos-init, time

(define menu (make-scene (scale 5 (bitmap "menu.png")) 0 (make-posn 500 0) 0))

(define game-over (make-scene (scale 5 (bitmap "game_over.png")) 0 (make-posn 500 0) 0))

(define load (make-scene (scale 5 (bitmap "load.png")) 0 (make-posn 500 0) 0))

(define victory (make-scene (scale 5 (bitmap "victory.png")) 0 (make-posn 500 0) 0))

(define loss (make-scene (scale 5 (bitmap "loss.png")) 0 (make-posn 0 0) 0))




(provide menu)          ; export the menu function to other files
(provide game-over)     ; export the game-over function to other files
(provide load)          ; export the load function to other files
(provide victory)       ; export the victory function to other files
(provide loss)          ; export the loss function to other files
  