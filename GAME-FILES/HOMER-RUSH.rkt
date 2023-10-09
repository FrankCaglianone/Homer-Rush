;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HOMER-RUSH) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;--------------------------------------------------- LIBRARIES --------------------------------------------------------------------------
(require 2htdp/image)
(require 2htdp/universe)
(require "Homer-Simpson.rkt")
(require "images.rkt")

;;---------------------------------------------------- CONSTANTS --------------------------------------------------------------------------
;; Data Types
; a IMAGE-HEIGHT is a number
; interpretation: the height in pixels of the image
; a IMAGE-WIDTH is a number
; interpretation: the width in pixels of the image
; a INITIAL-HEIGHT
; ; interpretation: the height in pixels of the map 
; a INITIAL-WIDTH
; interpretation: the width in pixels of the map
; a FRAME-INTERVAL is a number
; interpretation: the interval of the frame
; a SPEED is a number
; interpretation: the speed at which the background moves
; a GRAVITY is a number
; interpretation: vertical player's speed


; height of the map
(define IMAGE-HEIGHT 224)
; width of the map
(define IMAGE-WIDTH 3392)
; initial height 
(define INITIAL-HEIGHT (* IMAGE-HEIGHT 2))
; initial width
(define INITIAL-WIDTH (* IMAGE-WIDTH 2))
; frames
(define FRAME-INTERVAL (/ 1 50))
; moving speed 
(define SPEED (* FRAME-INTERVAL 600))
; gravity 
(define GRAVITY 20)



;;------------------------------------------------- STRUCTURES --------------------------------------------------------------------------

;--------- BACKGROUND DEFINITION ---------
; a Back is a Structure composed by 
;            -  scene     : Number 
;            -  pos       : Scene 
;            -  hspeed    : Number
;            -  floors    : List<ground>
;            -  max-time  : Number
; interpretation: the background of the game


;; Code
(define-struct back [scene pos hspeed floors max-time])


;; Examples 
(define INITIAL-BACK (make-back 0 500 0 0 0))
(define BACK-0 (make-back 1 (scene-pos-init MAP1) 0 (scene-floors MAP1) 0))
(define BACK-1 (make-back 1 (posn-x (scene-pos-init MAP1)) 0 (scene-floors MAP1) 0))
(define BACK-2 (make-back 2 (scene-pos-init MAP2) 0 (scene-floors MAP2) 0))
(define BACK-3 (make-back 4 500 0 0 0))
(define BACK-WIN (make-back 6 (scene-pos-init victory ) 0 0 0))




;--------- PLAYER DEFINITION ---------
; a Player is a Structure composed by 
;            - display     : Boolean
;            - skin        : Number 
;            - pos         : Number 
;            - jump        : Boolean
;            - jstart      : Number 
;            - end-jump?   : Boolean
; interpretation: the main character of the game


;; Code 
(define-struct player [display skin pos jump jstart end-jump?])



;; Examples 
(define INITIAL-PLAYER (make-player #false 0 -100 #false -10 #true))
(define PLAYER-1 (make-player #true 0 200 #true 0 #false))
(define PLAYER-2 (make-player #true 0 500 #false 0 #false))




;--------- TIME DEFINITION ---------
; a Seconds is a Structure composed by 
;            - count    : Number
;            - sec      : Number 
; interpretation: used to keep the timing of the game 


;; Code 
(define-struct seconds [count sec])


;; Examples 
(define BASE-SECONDS (make-seconds 0 0))





;--------------- BASE APPSTATE ----------------
; a world is a Structure composed by 
;            - menu?     : Boolean
;            - in-game?  : Boolean 
;            - start?    : Boolean
;            - map       : Back
;            - time      : Seconds
;            - homer     : Player
;            - end?      : Boolean
;            - quit?     : Boolean
; interpretation: the AppState of the game


;; Code
(define-struct world (menu? in-game? start? map time homer end? quit?))


;; Examples
(define INITIAL-WORLD (make-world #true #false #false INITIAL-BACK BASE-SECONDS INITIAL-PLAYER #false #false))
(define INITIAL-0 (make-world #true #true #false INITIAL-BACK BASE-SECONDS INITIAL-PLAYER #false #false))
(define WORLD-0 (make-world #false #false #false BACK-1 BASE-SECONDS PLAYER-1 #false #false))
(define WORLD-1 (make-world #false #true #true BACK-1 BASE-SECONDS PLAYER-1 #false #false))
(define WORLD-2 (make-world 0 0 0 (make-back 0 0 0 0 0) (make-seconds 0 0) (make-player 0 0 -150 #false 0 #true) 0 0))
(define WORLD-3 (make-world 0 #true 0 (make-back 0 0 0 0 0) (make-seconds 0 0) (make-player 0 0 -150 #false 0 #true) #false 0))
(define WORLD-4 (make-world #false #true #true (make-back 1 0 1 0 0) (make-seconds 0 0) (make-player 0 0 -150 #false 0 #true) 1 0))
(define WORLD-5 (make-world #true #false #false BACK-1 BASE-SECONDS INITIAL-PLAYER #false #false))
(define WORLD-6 (make-world #true #false #false BACK-1 BASE-SECONDS PLAYER-2 #false #false))


 
;;---------------------------------------------------- RENDERING --------------------------------------------------------------------------
;-------------- CLOCK VIEW -------------
; Code of the stopwatch image 
(define (stopwatch sec)
  (overlay/xy (overlay/xy
            (text/font "TIME:" 24 "black" "Helvetica" "roman" "normal" "bold" #false)
            100 -1
            (text/font (number->string sec) 25 "black" "Helvetica" "roman" "normal" "bold" #false))
              -5 -5
           (rectangle 150 30 "outline" "black")))




;--------- PLAYER RENDER ---------
;; Input/Output
; skin : Number -> Image
; it returns the image of whether homer is moving or not 


;; Examples
(check-expect (skin 0) static-homer)
(check-expect (skin 1) moving-homer)


; Code
(define (skin homer)
  (if (= homer 0)
      static-homer
      moving-homer))



;--------- MAP SETTING ---------   
; Input/Output
; map? : number -> scene
; takes a number and returns the respective scene


;; Examples
(check-expect (map? 0) menu)
(check-expect (map? 1) MAP1)
(check-expect (map? 2) MAP2)
(check-expect (map? 3) MAP3)
(check-expect (map? 4) load)
(check-expect (map? 5) game-over)
(check-expect (map? 6) victory)


; Code
(define (map? number)
  (cond 
    [(= number 0) menu]
    [(= number 1) MAP1]
    [(= number 2) MAP2]
    [(= number 3) MAP3]
    [(= number 4) load]
    [(= number 5) game-over]
    [(= number 6) victory]))



;--------- FINAL SCENE ---------
;; Input/Output
; win? : Number Number -> Image
; takes the seconds and if they are higher or lower than the max-time? returns an image of either victory or loss


;; Examples
(check-expect (win? (make-seconds 0 200) 90) (scene-image loss))
(check-expect (win? (make-seconds 0 150) 90) (scene-image loss))
(check-expect (win? (make-seconds 0 30) 90) (scene-image victory))
(check-expect (win? (make-seconds 0 60) 90) (scene-image victory))

 

;; Code 
(define (win? seconds max-time)
  (if (> max-time (seconds-sec seconds))
      (scene-image victory)
      (scene-image loss)))


 



;--------- BACKGROUND CHOOSER ---------
;; Input/Output
; back-scene? : AppState -> Image
; it ouputs the chosen image


;; Examples
(check-expect (back-scene? (make-world #true 0 0 0 0 0 0 0)) (scene-image (map? 0)))  
(check-expect (back-scene? (make-world 0 #false 0 0 0 0 #true 0)) (scene-image game-over))
(check-expect (back-scene? (make-world 0 #false 0 0 0 0 #false 0)) (scene-image load))     
(check-expect (back-scene? (make-world #false #true 0 BACK-2 0 0 #false 0)) (scene-image MAP2))  
(check-expect (back-scene? (make-world #false #true 0 BACK-WIN BASE-SECONDS 0 #true 0)) (scene-image loss))  
(check-expect (back-scene? (make-world #false #true 0 BACK-WIN BASE-SECONDS 0 #true 0)) (scene-image loss))  
 
  
;; Code 
(define (back-scene? world)
  (cond
    [(equal? (world-menu? world) #true) (scene-image (map? 0))]
    [(equal? (world-in-game? world) #false)
     (if (equal? (world-end? world) #true)
         (scene-image game-over)   
         (scene-image load))]
    [(equal? (world-in-game? world) #true)
     (if (equal? (world-end? world) #false)
         (scene-image (map? (back-scene (world-map world))))
         (win? (world-time world) (scene-time (map? (back-scene (world-map world))))))]))


 



;--------- CLOCK HEIGHT ---------
; Input/Output
; clock-height : Boolean Boolean -> Number
; it outputs the height position of the clock 

; Examples
(check-expect (clock-height #true #false) 50)
(check-expect (clock-height #false #false) -50)
(check-expect (clock-height #true #true) -50)
(check-expect (clock-height #false #true) -50)



; Code
(define (clock-height in-game? end?)
  (if (and (equal? in-game? #true) (equal? end? #false))
       50
      -50))



;--------- PLAYER HEIGHT ---------
;; Input/Output
; player-height : AppState -> Number
; it returns the position of homer in the world


;; Examples
(check-expect (player-height INITIAL-WORLD) -150)
(check-expect (player-height INITIAL-0) -100)


; Code
(define (player-height world)
   (if (and (equal? (world-in-game? world) #true) (equal? (world-end? world) #false))
      (player-pos (world-homer world))
      -150))


 

;--------- GAMING WINDOW ---------
;; Code for the gaming window 
(define play
  (empty-scene  1000 (* 2 INITIAL-HEIGHT))) 




;--------- WORLD RENDER ---------
;; Data types
; a List<Functions> is one of:
;  - '()                         ; empty list
;  - (cons String List<Functions>)  ; nonempty list
; interpretation: a list of Functions is a list made of Functions such as stopwatch, skin, back-scene, etc...
;; Input/output
;draw-world: Appstate -> Image


;; Examples
(check-expect (draw-world WORLD-5)
              (place-images
               (list (stopwatch (seconds-sec (world-time WORLD-5)))
                     (skin (player-skin (world-homer WORLD-5)))
                     (back-scene? WORLD-5))
               (list (make-posn 100 (clock-height (world-in-game? WORLD-5) (world-end? WORLD-5)))
                     (make-posn 250 (player-height WORLD-5))
                     (make-posn (back-pos (world-map WORLD-5)) INITIAL-HEIGHT))
               play))




;; Code
(define (draw-world world)
  (place-images
   (list (stopwatch (seconds-sec (world-time world)))
         (skin (player-skin (world-homer world)))
         (back-scene? world))
   (list (make-posn 100 (clock-height (world-in-game? world) (world-end? world)))
         (make-posn 250 (player-height world))
         (make-posn (back-pos (world-map world)) INITIAL-HEIGHT))
   play))



 
 
;;------------------------------------------- WORLD GENERATION --------------------------------------------------------------------------

;--------- STARTING/QUITTING GAME ---------
;; Input/Output
; check-menu : AppState String -> AppState
; it checks if you are in the menu 



;; Examples
(check-expect (check-menu INITIAL-WORLD "q") (construct INITIAL-WORLD #true #false #false 0 0 0 #false #false 0 #true #false #true))
(check-expect (check-menu INITIAL-WORLD "1") (construct INITIAL-WORLD #false #false #false (start-point 1) 1 0 #false #false 0 #true #false #false))
(check-expect (check-menu WORLD-1 "1") WORLD-1)


  

;; Code 
(define (check-menu world key)
 (if (equal? (world-menu? world) #true)
     (cond
       [(equal? key "q") (construct world #true #false #false 0 0 0 #false #false 0 #true #false #true)]
       [else (construct world  #false  #false  #false (start-point (string->number key)) (string->number key) 0 #false #false 0 #true #false #false)]) world))
              


;----------- START GAME -------------
;; Input/Output
; check-load : AppState -> Appstate
; it checks if you are on the loading 


;; Examples 
(check-expect (check-load (make-world #true 0 0 0 0 0 0 0)) (make-world #true 0 0 0 0 0 0 0))
(check-expect (check-load WORLD-0) (construct WORLD-0 #false #true #false (posn-x (scene-pos-init (map? (back-scene (world-map WORLD-0))))) (back-scene (world-map WORLD-0)) 0 #true #false 0 #true #false #false))


;; Code 
(define (check-load world)
  (if (and (equal? (world-menu? world) #false) (equal? (world-start? world) #false))
      (construct world #false #true #false (posn-x (scene-pos-init (map? (back-scene (world-map world))))) (back-scene (world-map world)) 0 #true #false 0 #true #false #false)
      world))

 

;----------- STARTING GAME -----------
;; Input/output
; start-point : Number -> Number
; it returns the image in the initial position of the map chosen


;; Examples
(check-expect (start-point 1) (posn-x (scene-pos-init MAP1)))
(check-expect (start-point 2) (posn-x (scene-pos-init MAP2)))
(check-expect (start-point 3) (posn-x (scene-pos-init MAP3)))


;; Code
(define (start-point number) 
  (cond  
    [(= number 1) (posn-x (scene-pos-init MAP1))]
    [(= number 2) (posn-x (scene-pos-init MAP2))]
    [(= number 3) (posn-x (scene-pos-init MAP3))]))




;--------- TIME UPDATE ---------
;; Input/Output
; time-keeper : AppState -> seconds 
; it increases by one the seconds of the stopwatch



;; Examples
(check-expect (time-keeper (make-world #true 0 #true 0 (make-seconds 0 0) 0 0 0)) (make-seconds 1 0))
(check-expect (time-keeper (make-world #false 10 #true 5 (make-seconds 25 0) 0 0 0)) (make-seconds 0 1))
(check-expect (time-keeper (make-world #false #true #false 5 (make-seconds 25 0) 0 #true 0)) (make-seconds 25 0))
(check-expect (time-keeper (make-world #false #true #false 5 (make-seconds 25 0) 0 #false 0)) (make-seconds 0 0))


;; Code
(define (time-keeper world)
  (if (equal? (world-start? world) #true)
      (if (< (seconds-count (world-time world)) 25)                                                   
          (make-seconds (+ 1 (seconds-count (world-time world))) (seconds-sec (world-time world)))
          (make-seconds 0 (+ 1  (seconds-sec (world-time world)))))
      (if (and (equal? (world-in-game? world) #true) (equal? (world-end? world) #true))
          (world-time world)
          (make-seconds 0 0))))





;--------- END GAME ---------
;; Input/Output
; check-end : AppState -> AppState
; it checks if the game has ended  



;; Examples
(check-expect (check-end (make-world #true 0 0 0 0 0 0 0)) (make-world #true 0 0 0 0 0 0 0))
(check-expect (check-end WORLD-4) (construct WORLD-4 #true #false #false (posn-x (scene-pos-init (map? 0))) 0 0 #true #false 0 #true #false #false))



;; Code
(define (check-end world)
  (if (and (equal? (world-menu? world) #false) (or (equal? (world-in-game? world) #true) (equal? (world-end? world) #true)))
      (construct world #true #false #false (posn-x (scene-pos-init (map? 0))) 0 0 #true #false 0 #true #false #false)
      world))



;;------------------------------------------- JUMP SECTOR --------------------------------------------------------------------------

;--------- CHECK IF WANTING TO JUMP ---------
;; Input/Output
; check-vspeed : Appstate  Boolean Number Boolean --> Number


;; Examples 
(check-expect (check-vspeed (make-world #false #false #false (make-back 1 (scene-pos-init MAP1) 0 (scene-floors MAP1) 0) 0 (make-player #true 1 12 #true 12 #false) #false #false) #true 12 #false)
              0)

;; Code 
(define (check-vspeed world jump jstart end-jump?)
  (if (equal? (back-floors (world-map world)) 0)
      0
      (if jump
          (homer-jump world jstart) 
          (homer-fall world jstart))))



;--------- SET JUMPING SPEED ---------
;; Input/Output
; homer-jump : Appstate Number -> Number


;; Examples 
(check-expect (homer-jump WORLD-1 3) 0)
(check-expect (homer-jump WORLD-1 12) 0)
(check-expect (homer-jump WORLD-1 -300) (- GRAVITY))


;; Code
(define (homer-jump player jstart)
  (if (> (player-pos (world-homer player)) (- (check-height jstart (back-floors (world-map player))) 300))
      (- GRAVITY)
      0))


;--------- SET FALLING SPEED ---------
;; Input/Output
; homer-fall : Appstate Number -> Number


(check-expect (homer-fall WORLD-1 3) GRAVITY)
(check-expect (homer-fall WORLD-1 12) GRAVITY)

(define (homer-fall world jstart)
   (if (<= (+ (player-pos (world-homer world)) GRAVITY) (check-height (back-pos (world-map world)) (back-floors (world-map world))))
       GRAVITY
       0))

; TODO put check expect






;--------- CHECKING HOW MUCH TO JUMP ---------
;; Input/Output
; check-height : Number Ground -> Number


;; Examples 
(check-expect (check-height 2000 (scene-floors MAP2)) 546)



;; Code 
(define (check-height pos map)
  (cond
    [(and (>= (posn-x (ground-start (first map))) pos) (<= (posn-x (ground-end (first map))) pos))
     (posn-y (ground-start (first map)))]
    [else (check-height pos (rest map))]))


;; Input/output
; show-player: Appstate Ground Boolean Boolean Boolean -> Number
(define (show-player world map in-game start end)
  (if (and (equal? in-game #true) (equal? end #false))
      (if (equal? start #false)
          (posn-y (ground-start (second (scene-floors (map? map)))))
          (player-pos (world-homer world)))
      -150))





;;------------------------------------------- HORIZONTAL MOVEMENT --------------------------------------------------------------------------

;--------- CHECK IF WALL ---------
; Input/Output
; wall? : Number Number Ground -> Boolean
; it checks if there is a wall


;; Examples
(check-expect (wall? 4678 719.1 (scene-floors MAP1)) #false)
(check-expect (wall? 4678 520 (scene-floors MAP1)) #true)


;; Code 
(define (wall? x-map y-player grounds)
  (if (and (>= (posn-x (ground-start (first grounds))) x-map) (<= (posn-x (ground-end (first grounds))) x-map))
      (if (> y-player (posn-y (ground-start (first grounds))))
          #false
          #true)
      (wall? x-map y-player (rest grounds))))




;--------- CHECK IF MOVING ---------
; Input/Output
; check-speed : Number Number Number Ground -> Number
; it outputs an AppState that checks id the player is moving 



;; Examples
(check-expect (check-speed 0 0 0 0) 0)
(check-expect (check-speed (- SPEED) 4678 520 (scene-floors MAP1)) (- SPEED))
(check-expect (check-speed SPEED 4678 1000 (scene-floors MAP1)) 0)


;; Code
(define (check-speed speed x-map y-player ground)
  (cond
    [(= speed 0) 0] 
    [else (if (wall? (+ x-map speed) y-player ground) speed 0)]))





;--------- CHECK IN PLAYABLE MAP ---------
;; Input/Output 
; check-start : AppState Boolean Boolean Boolean Number Number Number Boolean Boolean Number Boolean Boolean Boolean -> AppState
; it outputs an AppState that check if the game has started



;; Examples
(check-expect (check-start WORLD-2 0 0 0 0 0 0 0 0 0 0 0 0) (construct WORLD-2 0 0 0 0 0 0 0 0 0 0 0 0))
(check-expect (check-start WORLD-3 0 #true 0 0 0 0 0 0 0 0 #false 0) (make-world 0 #true 0 (make-back 0 0 0 0 0) (make-seconds 0 0) (make-player 0 0 -150 #false 0 #true) #false 0))


;; Code
(define (check-start world menu in-game start hpos map hspeed display jump jstart end-jump? end quit)
  (if (and (equal? in-game #true) (equal? end #false))
      (construct world menu in-game start hpos map hspeed display jump jstart end-jump? end quit)
      world))





;;------------------------------------------- VARIABLE SETTINGS --------------------------------------------------------------------------
;--------- SKIN CHANGING ---------
;; Input/Output
; check-skin : Number Number -> Number
; it takes a variable and returns a Number refering to one of static-homer and moving-homer


;; Examples
(check-expect (check-skin 0 0) 0)
(check-expect (check-skin 1 1) 0)
(check-expect (check-skin 1 0) 1)
(check-expect (check-skin 0 1) 0)


;; Code
(define (check-skin hspeed skin)
  (cond
    [(= hspeed 0) 0]
    [else (if (= skin 1)
              0
              1)]))


;--------- SET VARIABLE JUMP ---------
;; Input/Output
; check-jump: Number -> Boolean
; it takes a number and returns a boolean


;; Examples
(check-expect (check-jump 1) #false)
(check-expect (check-jump 2) #false)
(check-expect (check-jump -20) #true)



;; Code
(define (check-jump vspeed)
  (if (= vspeed (- GRAVITY))
      #true
      #false)) 


;--------- SET VARIABLE MAP2 ---------
;; Input/Output
; check-end-jump? : Number -> Boolean
; it takes a number and returns a boolean


;; Examples
(check-expect (check-end-jump? 0) #true)
(check-expect (check-end-jump? 1) #false) 



;; Code 
(define (check-end-jump? vspeed)
  (if (= vspeed 0)
      #true
      #false))




;--------- SETS VARIABLE JSTART ---------
; Input/Output
; check-jstart : AppState Boolean Number -> Number


;; Examples
(check-expect (check-jstart 0 #true 0) 0) 


;; Code 
(define (check-jstart world jump jstart)
  (if (equal? jump #true)
      jstart 
      (back-pos (world-map world)))) 




;--------- BUILDING APPSTATE ---------
;; Input/Output
; construct : AppState Boolean Boolean Boolean Number Number Number Boolean Boolean Number Boolean Boolean Boolean -> AppState


;; Code
(define (construct world menu in-game start hpos map hspeed display jump jstart end-jump? end quit)
  (make-world
   menu
   in-game
   start (make-back map
                    (+ hpos (check-speed hspeed
                                         (back-pos (world-map world))
                                         (player-pos (world-homer world))
                                         (back-floors (world-map world))))
                    (check-speed hspeed
                                 (back-pos (world-map world))
                                 (player-pos (world-homer world))
                                 (back-floors (world-map world)))
                    (scene-floors (map? map))
                    (scene-time (map? map)))
   (time-keeper world)
   (make-player display (check-skin (check-speed hspeed
                                                 (back-pos (world-map world))
                                                 (player-pos (world-homer world))
                                                 (back-floors (world-map world))) (player-skin (world-homer world)))
                (+ (check-vspeed world jump jstart end-jump?)
                   (show-player world map in-game start end))
                (check-jump (check-vspeed world jump jstart end-jump?)) (check-jstart world jump jstart) (check-end-jump? (check-vspeed world jump jstart end-jump?)))
   end quit))



;;------------------------------------------ BIG BANG OPERATIONS --------------------------------------------------------------------------


;--------- ON TICK OPERATIONS ---------
;; Input/Output 
; tock : AppState -> AppState
; it returns an AppState of the map


;; Code
(define (tock world)
  (cond
    [(and (equal? (world-menu? world) #false) (equal? (world-in-game? world) #false) (equal? (world-end? world) #false))
     (construct world #false #false #false (posn-x (scene-pos-init (map? 4))) (back-scene (world-map world)) 0
                  #false #false 0 #false #false #false)]
    [(> (+ 20 (player-pos (world-homer world))) (* 2 INITIAL-HEIGHT))               ;To check if homer has fallen  
     (construct world #false #false #false (posn-x (scene-pos-init (map? 5))) (back-scene (world-map world))
                0 #false #false 0 #false #true #false)]
    [(and (equal? (back-scene (world-map world)) 2) (< (back-pos (world-map world)) -5816))              ;homer has reaced the end 
     (construct world #false #true #false (posn-x (scene-pos-init (map? 6)))
                (back-scene (world-map world)) 0 #false #false 0 #false #true #false)]
    [(< (back-pos (world-map world)) -5816)              ;homer has reaced the end 
     (construct world #false #true #false (posn-x (scene-pos-init (map? 6)))
                (back-scene (world-map world)) 0 #false #false 0 #false #true #false)]
    [else (construct world (world-menu? world) (world-in-game? world) (world-start? world) (back-pos (world-map world)) (back-scene (world-map world))
                     (back-hspeed (world-map world)) (player-display (world-homer world)) (player-jump (world-homer world)) (player-jstart (world-homer world))
                     (player-end-jump? (world-homer world)) (world-end? world) (world-quit? world))]))

(check-expect (tock INITIAL-WORLD) (make-world #true #false #false (make-back 0 500 0 0 0) (make-seconds 0 0) (make-player #false 0 -150 #false 500 #true) #false #false))





;--------- HANDLING KEYS ---------
;; Input/Output 
; key-event : AppState String -> AppState
; it returns an AppState when the keys are pressed


;; Code
(define (key-event world key)
  (cond
    [(or (string=? key "1") (string=? key "2") (string=? key "3") (string=? key "q"))
     (check-menu world key)]
    [(string=? key "s")
     (check-load world)]
    [(string=? key "escape")
     (check-end world)]
    [(and (string=? key " ") (equal? (player-end-jump? (world-homer world)) #true))
     (check-start world (world-menu? world) (world-in-game? world) #true (back-pos (world-map world))
                  (back-scene (world-map world)) (back-hspeed (world-map world)) #true #true
                  (back-pos (world-map world)) #false (world-end? world) (world-quit? world))]
    [(string=? key "left")
     (check-start world (world-menu? world) (world-in-game? world) #true (back-pos (world-map world))
                  (back-scene (world-map world)) SPEED #true (player-jump (world-homer world))
                  (player-jstart (world-homer world))
                  (player-end-jump? (world-homer world)) (world-end? world) (world-quit? world))]
    [(string=? key "right")
     (check-start world (world-menu? world) (world-in-game? world) #true (back-pos (world-map world))
                  (back-scene (world-map world)) (- SPEED) #true (player-jump (world-homer world))
                  (player-jstart (world-homer world))
                  (player-end-jump? (world-homer world)) (world-end? world) (world-quit? world))]
    [else world]))

;--------- RELEASE KEYS ---------
;; Input/Output 
; key-release : AppState String -> AppState
; it returns an AppState when the keys are released


;; Code
(define (key-release world key)
  (cond
    [(string=? key "left")                                    
      (check-start world (world-menu? world) (world-in-game? world) #true (back-pos (world-map world))
                  (back-scene (world-map world)) 0 #true (player-jump (world-homer world))
                  (player-jstart (world-homer world))
                  (player-end-jump? (world-homer world)) (world-end? world) (world-quit? world))]
    [(string=? key "right")
     (check-start world (world-menu? world) (world-in-game? world) #true (back-pos (world-map world))
                  (back-scene (world-map world)) 0 #true (player-jump (world-homer world))
                  (player-jstart (world-homer world))
                  (player-end-jump? (world-homer world)) (world-end? world) (world-quit? world))]
    [else world]))




;--------- GAME CONTROLLER ---------
(big-bang INITIAL-WORLD
  [to-draw draw-world]
  [on-tick tock FRAME-INTERVAL]
  [on-key key-event]
  [on-release key-release]
  [stop-when world-quit?]
  [close-on-stop #true])