(defn create
  []
  (atom {}))

(defn my-get
  [cache key]
  (@cache key))

(defn my-put
  ([cache value-map]
   (swap! cache merge value-map))
  ([cache key value]
   (swap! cache assoc key value)))


(def ac (create))
(my-put ac :quote "I'm your father, Luke.")
(println (str "Cached item: " (my-get ac :quote)))
