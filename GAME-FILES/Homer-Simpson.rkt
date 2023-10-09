;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Homer-Simpson) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)
(require racket/base)

(provide static-homer)
(provide moving-homer)







(define static-homer (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (rectangle 60 10 "solid" (make-color 255 218 0))
             -10
             10
             (beside
              (rectangle 40 10 "solid" (make-color 255 218 0))
              (rectangle 10 10 "solid" (make-color 255 255 255))
              (rectangle 10 10 "solid" (make-color 0 0 0))
              (rectangle 10 10 "solid" (make-color 255 218 0))
             ))
             0
             20
             (beside
              (rectangle 40 10 "solid" (make-color 255 218 0))
              (rectangle 20 10 "solid" (make-color 255 255 255))
              (rectangle 30 10 "solid" (make-color 255 218 0))
             ))
             0
             30
             (rectangle 90 10 "solid" (make-color 255 218 0))
             )
             0
             40
             (beside
              (rectangle 60 10 "solid" (make-color 255 218 0))
              (rectangle 30 10 "solid" (make-color 210 179 113))
             ))
             10
             50
             (beside
              (rectangle 50 10 "solid" (make-color 255 218 0))
              (rectangle 30 10 "solid" (make-color 210 179 113))
             ))
             0
             60
             (rectangle 60 10 "solid" (make-color 255 255 255))
             )
             -10
             70
             (rectangle 100 10 "solid" (make-color 255 255 255))
             )
             -10
             80
             (rectangle 120 10 "solid" (make-color 255 255 255))
             )
             0
             90
             (beside
              (rectangle 30 10 "solid" (make-color 255 218 0))
              (rectangle 60 10 "solid" (make-color 6 14 247))
              (rectangle 30 10 "solid" (make-color 255 218 0))
             ))
             0
             100
             (beside
              (rectangle 20 10 "solid" (make-color 255 218 0))
              (rectangle 80 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 255 218 0))
             ))
             20
             110
             (beside
              (rectangle 30 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 0 0 180 0))
              (rectangle 30 10 "solid" (make-color 6 14 247))
             ))
             10
             120
             (beside
              (rectangle 30 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 0 0 180 0))
              (rectangle 30 10 "solid" (make-color 6 14 247))
             ))
             10
             130
             (beside
              (rectangle 40 10 "solid" (make-color 63 78 69))
              (rectangle 10 10 "solid" (make-color 0 0 180 0))
              (rectangle 40 10 "solid" (make-color 63 78 69))
             )))
             

(define moving-homer (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (underlay/xy (rectangle 60 10 "solid" (make-color 255 218 0))
             -10
             10
             (beside
              (rectangle 40 10 "solid" (make-color 255 218 0))
              (rectangle 10 10 "solid" (make-color 255 255 255))
              (rectangle 10 10 "solid" (make-color 0 0 0))
              (rectangle 10 10 "solid" (make-color 255 218 0))
             ))
             0
             20
             (beside
              (rectangle 40 10 "solid" (make-color 255 218 0))
              (rectangle 20 10 "solid" (make-color 255 255 255))
              (rectangle 30 10 "solid" (make-color 255 218 0))
             ))
             0
             30
             (rectangle 90 10 "solid" (make-color 255 218 0))
             )
             0
             40
             (beside
              (rectangle 60 10 "solid" (make-color 255 218 0))
              (rectangle 30 10 "solid" (make-color 210 179 113))
             ))
             10
             50
             (beside
              (rectangle 50 10 "solid" (make-color 255 218 0))
              (rectangle 30 10 "solid" (make-color 210 179 113))
             ))
             0
             60
             (rectangle 60 10 "solid" (make-color 255 255 255))
             )
             -10
             70
             (rectangle 100 10 "solid" (make-color 255 255 255))
             )
             -10
             80
             (rectangle 120 10 "solid" (make-color 255 255 255))
             )
             0
             90
             (beside
              (rectangle 30 10 "solid" (make-color 255 218 0))
              (rectangle 60 10 "solid" (make-color 6 14 247))
              (rectangle 30 10 "solid" (make-color 255 218 0))
             ))
             0
             100
             (beside
              (rectangle 20 10 "solid" (make-color 255 218 0))
              (rectangle 80 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 255 218 0))
             ))
             20
             110
             (beside
              (rectangle 30 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 0 0 180 0))
              (rectangle 30 10 "solid" (make-color 6 14 247))
             ))
             30
             120
             (beside
              (rectangle 30 10 "solid" (make-color 6 14 247))
              (rectangle 20 10 "solid" (make-color 0 0 180 0))
              (rectangle 30 10 "solid" (make-color 6 14 247))
             ))
             30
             130
             (beside
              (rectangle 40 10 "solid" (make-color 63 78 69))
              (rectangle 10 10 "solid" (make-color 0 0 180 0))
              (rectangle 40 10 "solid" (make-color 63 78 69))
             )))