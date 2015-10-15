;; 참고와 트랜젝션 메모리
;; 참조

(println
 (ref "Attack of the Clones"))

(def movie (ref "Star Wars"))
(println movie)
(println (deref movie))
(println @movie)

;; java.lang.IllegalStateException: No transaction running
;; (alter movie str ": The Empire Strikes Back")
(dosync (alter movie str ": The Empire Strikes Back"))
(dosync (ref-set movie "Star Wars: The Revenge of the Sith"))
(println @movie)

;; 원자 사용하기
(println (atom "Split at your own risk."))
(def danger (atom "Split at your own risk."))
(println danger)
(println @danger)

(reset! danger "Split with impunity")
(println danger)
(println @danger)

(def top-sellers (atom []))
(swap! top-sellers conj {:title "Seven Languages", :author "Tate"})
(println top-sellers)
(swap! top-sellers conj {:title "Programming Clojure" :author "Halloway"})
(println top-sellers)

;; 에이전트 이용하기
;;(defn twice [x] (* 2 x))
;;(def tribbles (agent 1))
;;(send tribbles twice)
;;(println @tribbles)
