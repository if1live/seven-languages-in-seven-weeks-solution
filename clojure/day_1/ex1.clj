;; 문자열 st의 길이가 n보다 크면 true를 리턴하는 (big st n)이라는 함수를 구현하라

(defn big [st n]
  (if (> (count st) n) true false))

(println (big "sora" 3))
(println (big "sora" 4))
(println (big "sora" 5))

