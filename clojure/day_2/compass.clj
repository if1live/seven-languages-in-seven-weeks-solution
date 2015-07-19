(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

(def directions [:north :east :south :west])

(defn turn
  [base amount]
  (rem (+ base amount) (count directions)))

;; (println (turn 1 1))
;; (println (turn 3 1))
;; (println (turn 2 3))

(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  Object
  (toString [this] (str "[" (direction this) "]")))

(def c (SimpleCompass. 0))
(println (left c))
(println c)
(println (:bearing c))
