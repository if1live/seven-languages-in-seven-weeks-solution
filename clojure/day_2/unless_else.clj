;; 매크로를 사용하는 else 조건과 함께 unless을 구현하라

(defn unless [test body else_body] (if (not test) body else_body))

;; invalid unless-else
(println "## invalid unless-else")
(unless true (println "hello") (println "world"))
(unless false (println "hello") (println "world"))

(defmacro unless [test body else_body]
  (list 'if (list 'not test) body else_body))
(macroexpand '(unless test body else_body))

(println "## macro based unless-else")
(unless true (println "hello") (println "world"))
(unless false (println "hello") (println "world"))
