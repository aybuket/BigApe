;;; aakgul13@ku.edu.tr    	  	   	 
;;;    	  	   	 
;;; Comp200 Project 1    	  	   	 
;;;    	  	   	 
;;; Before you start:    	  	   	 
;;; * Please read the "Project 1" handout.
;;;   (both available under Assignments on course website)
;;; * Plan your work with pencil and paper before starting to code.
;;;    	  	   	 
;;; While you are working:    	  	   	 
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;    	  	   	 
;;;     *** NOTHING WRITTEN GETS EXCHANGED ***
;;;    	  	   	 
;;; When you are done:    	  	   	 
;;; * Perform a final save and check-in.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please email comp200help@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;    	  	   	 
;;;     *** IF LOADING GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;;    	  	   	 
;;; * Before the definition of each procedure, please write a description
;;; * about what the procedure does and what its input and output should
;;; * be, making sure the lines are commented out with semi-columns.
;;;    	  	   	 
;;;    	  	   	 
;;; The following lines are necessary, please do not delete:
(define your-answer-here -1)    	  	   	 
;;;    	  	   	 
;;;    	  	   	 
;;;    	  	   	 
;;; A world with gorillas throwing explosive bananas
;;;    	  	   	 
;; Some utility definitions have been provided for you to make your
;; work easier.  Also some of the constants and procedures such as
;; gravity acceleration 9.8m/s2 or (degree2radian deg) are defined as
;; you can see below.    	  	   	 
    	  	   	 
(define pi (acos -1))			; value of pi for degree2radian
    	  	   	 
(define g 9.8)				; gravitational constant
    	  	   	 
;; Hint::for some values the degree2radian approaches to zero so do
;; not panic if do not get exactly zero while you are testing the test
;; cases.    	  	   	 
    	  	   	 
(define degree2radian    	  	   	 
  (lambda (deg)    	  	   	 
    (/ (* deg pi) 180.)))    	  	   	 
    	  	   	 
;; After each problem below, some test cases and their results are
;; given to use to check your results.
;;    	  	   	 
;; Please write brief comments where you see a "YOUR DOCUMENTATION
;; HERE" label and also write 3 extra test cases with their results
;; where you see a "YOUR TEST CASES" label.
;;    	  	   	 
    	  	   	 
    	  	   	 
;; Problem 1    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
;    	  	   	 
; I defined position using the formula uf=1/2at^2+vt+u
(define position    	  	   	 
  (lambda (a v u t)
    (+ (* .5 a t t) (* v t) u)    	  	   	 
    ))    	  	   	 
    	  	   	 
; Test cases    	  	   	 
;(position 0 0 0 0) 	; -> 0
;(position 0 0 20 0) 	; -> 20
;(position 0 5 10 10) 	; -> 60
;(position 2 2 2 2)	; -> 10.0
;(position 5 5 5 5)	; -> 92.5
    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(position 10 5 4 2)	; -> 34.0    	  	   	 
;(position 6 20 4 2)	; -> 56.0   	  	   	 
;(position 4 3 2 1)	; -> 7.0   	  	   	 
    	  	   	 
    	  	   	 
;; Problem 2    	  	   	 
    	  	   	 
; Finds first root of az^2 + bz + c = 0
; Finding the roots of a quadratic equation, we use the formulas (-b-√b^2-4ac)/2a and (-b+√b^2-4ac)/2a.
; I use the formula with - is the first root and with + is the second root. If ∆ is less then 0, then the equaiton has an complex root.
; In this part, the root1 and root2 will return false if the roots are complex number.
(define root1    	  	   	 
  (lambda (a b c)
    (if (< (- (* b b) (* 4 a c)) 0)
          #f
          (/ (- (* b -1) (sqrt(- (* b b) (* 4 a c)))) (* 2 a)))    	  	   	 
    ))    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
;    	  	   	 
(define root2    	  	   	 
  (lambda (a b c)
    (if (< (- (* b b) (* 4 a c)) 0)
          #f
          (/ (+ (* b -1) (sqrt(- (* b b) (* 4 a c)))) (* 2 a)))   	  	   	 
    ))    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; larger-root returns the positive root, if there is no positive reel root, than it returns #f.   	  	   	 
(define larger-root    	  	   	 
  (lambda (a b c)    	  	   	 
      (if (< (- (* b b) (* 4 a c)) 0)
          #f
          (if (> (root1 a b c) (root2 a b c)) (root1 a b c) (root2 a b c)))   	  	   	 
    ))    	  	   	 
    	  	   	 
; Test cases    	  	   	 
;(root1 5 3 6)  ;-> #f  be careful about these kinds of conditions.
;(root2 6 3 6)  ;-> #f  be careful about these kinds of conditions.
;(larger-root 1 0 -4)	; -> 2
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(root1 2 6 4)		; -> -2    	  	   	 
;(root2 10 8 3)		; -> #f    	  	   	 
;(larger-root 1 5 6)	; -> -2   	  	   	 
    	  	   	 
    	  	   	 
;; Problem 3    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; flight-time calcutes the larger root of the eqution 1/2gt^2-vt-h=0 
(define flight-time    	  	   	 
  (lambda (vertical-velocity elevation)
      (larger-root (* .5 g) (* -1 vertical-velocity) (* -1 elevation))    	  	   	 
    ))    	  	   	 
    	  	   	 
; Test cases    	  	   	 
;(flight-time 0 0)	; -> 0
;(flight-time 0 100)	; -> approx 4.5
;(flight-time 100 0)	; -> approx 20.4
;(flight-time 100 100)	; -> approx 21.4
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(flight-time 50 50)	; -> approx 11.1    	  	   	 
;(flight-time 40 20)	; -> approx 8.6    	  	   	 
;(flight-time 45 99)	; -> approx 11.02   	  	   	 
    	  	   	 
    	  	   	 
;; Problem 4    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; distance calculates flight time using vertical velocity and by multiplying with horizontal velocity, find the distance of the banana.    	  	   	 
(define distance    	  	   	 
  (lambda (angle velocity elevation)
      (if (= angle 90)
          0
      (* (cos (degree2radian angle)) velocity (flight-time (* velocity (sin (degree2radian angle))) elevation)))    	  	   	 
    ))    	  	   	 
    	  	   	 
; Test cases -- (distance angle velocity elevation)
;(distance 45 0 100)	; -> 0
;(distance 0 10 0)	; -> 0
;(distance 90 10 0)	; -> 0
;(distance 45 10 0)	; -> approx 10.2
;(distance 30 10 0)	; -> approx 8.8
;(distance 90 10 100)	; -> 0
;(distance 45 10 100)   ; -> approx 37.45 	  	   	 
;(distance 30 10 100)   ; -> approx 43.79 	  	   	 
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(distance 47 10 89)	; -> approx 34.6   	  	   	 
;(distance 38 3 15)	; -> approx 4.6    	  	   	 
;(distance 19 5 27)	; -> approx 11.91    	  	   	 
    	  	   	 
    	  	   	 
;; Problem 5    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; hit? controls if the target is inside the burst cirle of bananas or not.   	  	   	 
(define hit?    	  	   	 
  (lambda (angle velocity elevation burst-radius target-distance)
      (<= (abs (- target-distance (distance angle velocity elevation))) burst-radius)
    	  	   	 
    ))    	  	   	 
    	  	   	 
; Tests    	  	   	 
;(distance 45 10 0)	; -> approx 10.2
;(hit? 45 10 0 1 10)	; -> #t
;(hit? 45 10 0 1 50)	; -> #f
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(distance 38 10 30)	; -> approx 25.07   	  	   	 
;(hit? 38 10 30 2 27)	; -> #t    	  	   	 
;(hit? 38 10 30 2 30)	; -> #f    	  	   	 
    	  	   	 
    	  	   	 
;; Problem 6    	  	   	 
    	  	   	 
;;;Reading input from user.    	  	   	 
(define (read-prompt msg)    	  	   	 
  (display msg)    	  	   	 
  (read))    	  	   	 
    	  	   	 
; game    	  	   	 
;    	  	   	 
; With your procedures above, we have enough to play the game!
;    	  	   	 
; Note that this procedure uses some gory Scheme internally
; that you are not yet expected to understand. Treat this as
; a black box and don't worry about the internal details.
;    	  	   	 
    	  	   	 
(define play    	  	   	 
  (lambda (separation burst-radius height1 height2)
    (display "G1 (")  (display height1) (display "m high)")
    (display " --- ") (display separation)
    (display "m  --- G2 (")  (display height2) (display "m high)" )
    (newline)    	  	   	 
    (let* ((angle1 (read-prompt "Player 1 Angle: "))
	   (velocity1 (read-prompt "Player 1 Velocity: "))
	   (angle2    (read-prompt "Player 2 Angle: "))
	   (velocity2 (read-prompt "Player 2 Velocity: ")))
      (cond ((hit? angle1 velocity1 height1 burst-radius separation)
	     (display "Player 2 destroyed!")
	     (newline))    	  	   	 
	    ((hit? angle2 velocity2 height2 burst-radius separation)
	     (display "Player 1 destroyed!")
	     (newline))    	  	   	 
	    (else    	  	   	 
	     (newline)    	  	   	 
	     ; Feedback to player 1
	     (display "Player 1's banana went ")
	     (display (distance angle1 velocity1 height1))
	     (display "m") (newline)
	     ; Feedback to player 2
	     (display "Player 2's banana went ")
	     (display (distance angle2 velocity2 height2))
	     (display "m") (newline)
	     ; Loop    	  	   	 
	     (play separation burst-radius height1 height2))))))
    	  	   	 
; Try it out by evaluating the following:
;(play 10 1 3 2)    	  	   	 
    	  	   	 
; Insert a transcript of your play here, by cutting and pasting from
; the DrRacket console.    	  	   	 
; YOUR TRANSCRIPT HERE    	  	   	 
G1 (3m high) --- 10m  --- G2 (2m high)
Player 1 Angle: 45
Player 1 Velocity: 30
Player 2 Angle: 45
50
Player 2 Velocity: 
Player 1's banana went 94.74465805071888m
Player 2's banana went 257.08660196317976m
G1 (3m high) --- 10m  --- G2 (2m high)
Player 1 Angle: 45
Player 1 Velocity: 22
Player 2 Angle: 40
Player 2 Velocity: 15

Player 1's banana went 52.224784797439156m
Player 2's banana went 24.784781268182382m
G1 (3m high) --- 10m  --- G2 (2m high)
Player 1 Angle: 45
Player 1 Velocity: 12
Player 2 Angle: 40
Player 2 Velocity: 10

Player 1's banana went 17.249420384892602m
Player 2's banana went 12.038650739418932m
G1 (3m high) --- 10m  --- G2 (2m high)
Player 1 Angle: 45
Player 1 Velocity: 8
Player 2 Angle: 40
Player 2 Velocity: 7

Player 1's banana went 8.765675274423842m
Player 2's banana went 6.680789489638191m
G1 (3m high) --- 10m  --- G2 (2m high)
Player 1 Angle: 45
Player 1 Velocity: 10
Player 2 Angle: 40
Player 2 Velocity: 9
Player 1 destroyed!    	  	   	 
    	  	   	 
;; Problem 7    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; short? controls if the given velocity is less than needed or not.      	  	   	 
(define short?    	  	   	 
  (lambda (angle velocity elevation target-distance)
    (< (distance angle velocity elevation) target-distance)
    ))    	  	   	 
; long? controls if the given velocity is bigger than needed or not.    	  	   	 
(define long?    	  	   	 
  (lambda (angle velocity elevation target-distance)
    (> (distance angle velocity elevation) target-distance)
    ))    	  	   	 
; defining the min and max velocity    	  	   	 
(define *min-velocity* 0)    	  	   	 
(define *max-velocity* 50)    	  	   	 
; find-velocity is an iterative procedure that uses helper method.   	  	   	 
(define find-velocity    	  	   	 
  (lambda (angle elevation burst-radius target-distance)
    (find-velocity-helper angle *min-velocity* *max-velocity*
			  elevation burst-radius target-distance)))
; helper method uses short?, long? and hit? procedures and until finding the velocity does the bineary research to find velocity
; or min and max velocities are out of the range returns #f
; Because of the binary search, the order of the growth is theta(logn)
(define find-velocity-helper    	  	   	 
  (lambda (angle min-vel max-vel elevation burst-radius target-distance)
    ;; idea is to try two extremes, if out of range return #f
    ;; else use binary search    	  	   	 
    (cond ((short? angle max-vel elevation target-distance)
           #f
           )    	  	   	 
	  ((long? angle min-vel elevation target-distance)
           #f
           )    	  	   	 
	  ((hit? angle (* .5 (+ min-vel max-vel)) elevation  burst-radius target-distance)
           (* .5 (+ min-vel max-vel))
           )
          (else (if (long? angle (* .5 (+ min-vel max-vel)) elevation target-distance)
                (find-velocity-helper angle min-vel (* .5 (+ min-vel max-vel)) elevation burst-radius target-distance)
                (find-velocity-helper angle (* .5 (+ min-vel max-vel)) max-vel elevation burst-radius target-distance)))
          )    	  	   	 
    ))    	  	      	  	   	 
    	  	   	 
;; YOUR TEST CASES HERE    	  	   	 
;(short? 47 *max-velocity* 89 34.6)	; -> #f    	  	   	 
;(long? 47 *min-velocity* 89 34.6)	; -> #f   	  	   	 
;(fin-velocity 47 89 0.01 34.6)		; -> approx 10.0   	  	   	 
    	  	   	 
;; Problem 8    	  	   	 
    	  	   	 
; Some scheme stuff to communicate with gorilla. Don't
; worry about the details, just the interface
;    	  	   	 
(define tell-gorilla    	  	   	 
  (lambda (angle velocity)    	  	   	 
    (if (or (not angle) (not velocity))
	 (display (list "Sorry, no angle and velocity works"))
	 (display (list "Throw at" angle "degrees and" velocity "meters/sec")))
    (list angle velocity)))    	  	   	 
    	  	   	 
; Tests    	  	   	 
;(tell-gorilla 30 15)    	  	   	 
;(tell-gorilla #f 15)    	  	   	 
;(tell-gorilla 30 #f)    	  	   	 
    	  	   	 
    	  	   	 
; A bogus find-throw procedure that
; simply refuses to find a correct solution, but
; instead just tells the gorilla anything (not a
; smart thing for a pet programmer to do!)
;    	  	   	 
; Hint: Do something that is more clever then the below procedure:)!!
;    	  	   	 
;(define find-throw    	  	   	 
;  (lambda (elevation burst-radius target-distance)
;    (tell-gorilla 45 10)))    	  	   	 
    	  	   	 
;(find-throw 10 default-radius default-target)
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; find-throw is an iterative procedure that uses the helper method
; Because of the linear search, the order of the growth is theta(n)
(define find-throw    	  	   	 
  (lambda (elevation burst-radius target-distance)
    (find-throw-helper 0 elevation burst-radius target-distance)))
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; helper method uses find-velocity mehtod and find the right angle and velocity to hit the target.
; it uses the linear search by increasing the angle and calculating if there is a velocity that can hit the target or not.
;
(define find-throw-helper    	  	   	 
  (lambda (angle elevation burst-radius target-distance)
    (if (= angle 90) (tell-gorilla #f #f)
          (if (find-velocity angle elevation burst-radius target-distance)
           (tell-gorilla angle (find-velocity angle elevation burst-radius target-distance)) (find-throw-helper (+ angle 1) elevation burst-radius target-distance)))    	  	   	 
    ))    	  	   	 
    	  	   	 
    	  	   	 
; Test cases    	  	   	 
;    	  	   	 
;Find throw angle and velocity    	  	   	 
;(find-throw     10 1 20)	; -> (18 11) - other values may work
; It returns (0 14.0625) when I use the procedure, but when I give angle=18, it returns (18 11.71875)
; Verify that the suggested angle and velocity goes the distance:
;(distance 18 11 10)    	  	   	 
;    	  	   	 
; Hint: Does find-throw give the correct results when you check it
; with the distance procedure?
; Other values match with the result of distance procedure.
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(find-throw 0 1 60)	; -> (Throw at 7 degrees and 49.21875 meters/sec)'(7 49.21875)    	  	   	 
;(find-throw 0 1 200)	; -> (Throw at 26 degrees and 49.8046875 meters/sec)'(26 49.8046875)   	  	   	 
;(find-throw 0 0.001 500); -> (Sorry, no angle and velocity works)'(#f #f)   	  	   	 
    	  	   	 
;; Problem 9    	  	   	 
    	  	   	 
; How many bananas in a bundle survive a bounce
; num-survive shows the how many banana left on one bounce  	  	   	 
(define num-survive    	  	   	 
  (lambda (num)    	  	   	 
    (if (even? num)    	  	   	 
	(/ num 2)    	  	   	 
	(/ (- num 1) 2))))    	  	   	 
    	  	   	 
; Tests    	  	   	 
;(num-survive 5)	; -> 2    	  	   	 
;(num-survive 2)	; -> 1    	  	   	 
;(num-survive 1)	; -> 0    	  	   	 
;    	  	   	 
;YOUR TEST CASES HERE...    	  	   	 
;(num-survive 9)	; -> 4    	  	   	 
;(num-survive 79)	; -> 79   	  	   	 
;(num-survive 44)	; -> 22   	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; bundle-bounces calculates how many times the banana packet bounce.
(define bundle-bounces    	  	   	 
  (lambda (num)    	  	   	 
    (if (= (num-survive num) 0)
        0
        (+ 1 (bundle-bounces (num-survive num))))    	  	   	 
    ))    	  	   	 
    	  	   	 
; Test cases    	  	   	 
;(bundle-bounces 5)	; -> 2
;(bundle-bounces 20)	; -> 4
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(bundle-bounces 89)	; -> 6   	  	   	 
;(bundle-bounces 37)	; -> 5   	  	   	 
;(bundle-bounces 23)	; -> 4   	  	   	 
    	  	   	 
    	  	   	 
;; Problem 10    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
; bundle-distance calculates the distance when the banana packet bounce.   	  	   	 
(define bundle-distance    	  	   	 
  (lambda (num angle velocity elevation)
      (cond ((= num 0) 0)
        ((= (num-survive num) 0)
          (distance angle velocity elevation))
          (else (+ (distance angle velocity elevation) (bundle-distance (num-survive num) angle (* 2 velocity) 0))))    	  	   	 
    ))    	  	   	 
    	  	   	 
; Hint: be careful about the test cases
; When there is one banana in the packet, banana packet does not bounce, then it is equal to distance.
; If there is no banana in the packet, there is no distance. If angle=90, there is no distance and the just bounces on same position.
; Test cases    	  	   	 
;(distance 0 10 50)		; -> approx 31.9
;(bundle-distance 1 0 10 50)	; -> approx 31.9 ****(one base case)****
;(bundle-distance 0 0 10 50)	; -> 0           ****(another base case)****
;(bundle-distance 5 0 10 50)	; -> approx 31.9
;(bundle-distance 5 90 10 50)	; -> 0
;    	  	   	 
;(bundle-distance  2 45 10 50)  ; -> approx 69.1  	  	   	 
;(bundle-distance 20 45 10 50)	; -> approx 3497.6
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(bundle-distance 5 30 10 5)	; -> approx 190.96   	  	   	 
;(bundle-distance 2 85 10 6)	; -> approx 9.3   	  	   	 
;(bundle-distance 10 15 5 10)	; -> approx 114.7   	  	   	 
    	  	   	 
    	  	   	 
;; Problem 11    	  	   	 
    	  	   	 
; YOUR DOCUMENTATION HERE...    	  	   	 
;    	  	   	 
; Hint: Think about how you code the previus find-throw for the case
; without bundle and find out what extra procedures you will need :)
;    	  	   	 
; shortbundle? looks if bouncing distance with given velocity is short for the target or not.   	  	   	 
(define shortbundle?    	  	   	 
  (lambda (num angle velocity elevation target-distance)
    (< (bundle-distance num angle velocity elevation) target-distance)
    ))
; longbundle? looks if bouncing distance with given velocity is farther than needed or not.
(define longbundle?    	  	   	 
  (lambda (num angle velocity elevation target-distance)
    (> (bundle-distance num angle velocity elevation) target-distance)
    ))
; find-bundle-velocity is an iterative procedure that using helper method.
(define find-bundle-velocity    	  	   	 
  (lambda (num angle elevation burst-radius target-distance)
    (find-bundle-velocity-helper num angle *min-velocity* *max-velocity*
			  elevation burst-radius target-distance)))
; hitbundle? looks if the target in the bouncing banana's packet's burst circle.
(define hitbundle?    	  	   	 
  (lambda (num angle velocity elevation burst-radius target-distance)
      (<= (abs (- target-distance (bundle-distance num angle velocity elevation))) burst-radius)
    	  	   	 
    ))
; helper method uses shortbundle?, longbundle? and hitbundle? procedures and until finding the bundle velocity does the bineary research to find bundle velocity
; or min and max velocities are out of the range returns #f
(define find-bundle-velocity-helper    	  	   	 
  (lambda (num angle min-vel max-vel elevation burst-radius target-distance)
    ;; idea is to try two extremes, if out of range return #f
    ;; else use binary search    	  	   	 
    (cond ((shortbundle? num angle max-vel elevation target-distance)
           #f
           )    	  	   	 
	  ((longbundle? num angle min-vel elevation target-distance)
           #f
           )    	  	   	 
	  ((hitbundle? num angle (* .5 (+ min-vel max-vel)) elevation  burst-radius target-distance)
           (* .5 (+ min-vel max-vel))
           )
          (else (if (longbundle? num angle (* .5 (+ min-vel max-vel)) elevation target-distance)
                (find-bundle-velocity-helper num angle min-vel (* .5 (+ min-vel max-vel)) elevation burst-radius target-distance)
                (find-bundle-velocity-helper num angle (* .5 (+ min-vel max-vel)) max-vel elevation burst-radius target-distance)))
          )    	  	   	 
    ))
; find-bundle-throw is an iterative procedure that using helper method.
(define find-bundle-throw    	  	   	 
  (lambda (num elevation burst-radius target-distance)
    (find-bundle-throw-helper num 0 elevation burst-radius target-distance)
    ))
; helper method uses find-bundle-velocity mehtod and find the right angle and velocity to hit the target while bouncing.
; it uses the linear search by increasing the angle and calculating if there is a velocity that can hit the target or not.
(define find-bundle-throw-helper
    (lambda (num angle elevation burst-radius target-distance)
          (if (= angle 90) (tell-gorilla #f #f)
          (if (find-bundle-velocity num angle elevation burst-radius target-distance)
           (tell-gorilla angle (find-bundle-velocity num angle elevation burst-radius target-distance))
           (find-bundle-throw-helper num (+ angle 1) elevation burst-radius target-distance)))
    ))

; Test cases    	  	   	 
;(define default-radius 1)    	  	   	 
;(define default-target 10)    	  	   	 
; Some previous single-banana throws...
;(find-throw          10 default-radius default-target)
;(find-bundle-throw 1 10 default-radius default-target)
;    	  	   	 
; Test - when single banana fails, can a bundle succeed?
; When the banana packet's bounces, it can go farther, then when find-throw fail, it can successed.
;(find-throw           50 default-radius 400)	; -> (#f #f)
;(find-bundle-throw 10 50 default-radius 400)	; -> (73 9)
;    	  	   	 
; YOUR TEST CASES HERE...    	  	   	 
;(find-throw 10 1 100)	; -> (6 49.21875)    	  	   	 
;(find-bundle-throw 7 10 1 100)	; -> (1 28.515625)   	  	   	 
;(find-throw 0 0.001 500)	; -> (#f #f)   	  	   	 
;(find-bundle-throw 10 0 0.001 500) ; -> (1 40.642356872558594)   	  	   	 
    	  	   	 
    	  	   	 
; Congratulations! You have reached the end of Project 1!
; We encourage you to work with your project partner on problem sets
; as long as you acknowledge it and so long as you observe the rules
; on collaboration (see the Comp101 Syllabus section on
; Collaboration).    	  	   	 
    	  	   	 
; If you cooperated with other students, tutors, or others, please
; indicate your consultants' names.  Otherwise, write "I worked alone
; using only the course reference materials."


;; I worked with Muratcan Aşgün.