CLOJURE_JAR = ~/lang/clojure/clojure-1.7.0.jar

all: compass unless_else sample

compass:
	java -cp ${CLOJURE_JAR} clojure.main compass.clj

unless_else:
	java -cp ${CLOJURE_JAR} clojure.main unless_else.clj

sample:
	java -cp ${CLOJURE_JAR} clojure.main sample.clj
