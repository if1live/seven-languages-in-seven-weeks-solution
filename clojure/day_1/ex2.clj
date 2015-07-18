;; 컬렉션 col의 자료형에 따라 :list, :map, :vector를 리턴하는 (collection-type col)이라는 함수를 구현하라

(defn collection-type [col]
  (if (= (class col) (class [])) :vector
      (if (= (class col) (class {})) :map
          :list)))

(println (collection-type '(1 2 3)))
(println (collection-type [1 2 3]))
(println (collection-type {:a 2, :b 3}))
