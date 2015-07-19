;; loop와 recur를 사용하는 재귀
(defn size [v]
  (if (empty? v)
    0
    (inc (count (rest v)))))
(println (size [1 2 3]))

(loop [x 1] x)

(defn size [v]
  (loop [l v, c 0]
    (if (empty? l)
      c
      (recur (rest l) (inc c)))))
(println (size [1 2 3]))

;; 시퀀스
[1 2 3]
(rest [1 2 3])

;;; 검사
(println (every? number? [1 2 3 :four]))
(println (some nil? [1 2 nil]))
(println (not-every? odd? [1 3 5]))
(println (not-any? number? [:one :two :three]))

;;; 시퀀스 변경하기
(def words ["luke" "chewie" "han" "lando"])
(println
 (filter (fn [word] (> (count word) 4)) words))

(println
 (map (fn [x] (* x x)) [1 1 2 3 5]))

(def colors ["red" "blue"])
(def toys ["block" "car"])

(println
 (for [x colors] (str "I like " x)))
(println
 (for [x colors, y toys] (str "I like " x " " y "s")))

(defn small-word? [w] (< (count w) 4))
(println
 (for [x colors, y toys, :when (small-word? y)]
   (str "I like " x " " y "s")))

(println
 (reduce + [1 2 3 4]))
(println
 (reduce * [1 2 3 4 5]))

(println (sort  [3 1 2 4]))

(defn abs [x] (if (< x 0) (- x) x))
(println
 (sort-by abs [-1 -4 3 2]))

;; 게으른 평가
;;; 범위를 이용한 유한한 시퀀스
(println
 (range 1 10))
(println
 (range 1 10 3))
(println
 (range 10))

;;; 무한한 시퀀스와 take
(println
 (take 3 (repeat "Use the force, Luke")))

(println
 (take 5 (cycle [:lather :rinse :repeat])))

(println
 (->> [:lather :rinse :repeat] (cycle) (drop 2) (take 5)))

(println
 (take 5 (interpose :and (cycle [:lather :rinse :repeat]))))

(println
 (take 20 (interleave (cycle (range 2)) (cycle (range 3)))))

(println
 (take 5 (iterate inc 1)))
(println
 (take 5 (iterate dec 0)))

(defn fib-pair [[a b]] [b (+ a b)])
(println (fib-pair [3 5]))

(println
 (take 5 (map first (iterate fib-pair [1 1]))))
(println
 (nth (map first (iterate fib-pair [1 1])) 20))

(defn factorial [n] (apply * (take n (iterate inc 1))))
(println (factorial 5))

(defn factorial [n] (apply * (range 1 (inc n))))
(println (factorial 5))

;; 매크로
;; 고장난 unless
(defn unless [test body] (if (not test) body))
(unless true (println "Danger, danger Will Robinson"))

(macroexpand ''something-we-do-not-want-interpreted)
(macroexpand '#(count %))

(defmacro unless [test body]
  (list 'if (list 'not test) body))
(macroexpand '(unless test body))
(unless true (println "No more dange, Will."))
(unless false (println "Now, THIS is the FORCE"))
