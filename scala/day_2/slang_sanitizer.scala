// 1. 욕설 Shoot과 Darn을 욕이 아닌 Pucky와 Beans로 대체하는 메소드를 가진
// Censor라는 트레이트를 작성하라.
// 이러한 욕설을 대체 단어에 대응시키기 위해서 맵을 이용하라.
// 2. 욕설과 대체어를 파일에서 읽어 들여 위으 문제를 처리하라.

import scala.io.Source

trait Censor {
  var sanitizeTable = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

  def sanitize(line: String) = {
    var tmp = line
    sanitizeTable.foreach(pair => {
      val before = pair._1
      val after = pair._2
      tmp = tmp.replace(before, after)
    })
    tmp
  }

  def loadDict() {
    val filename = "dict.txt"
    var dict = Map[String, String]()
    for(line <- Source.fromFile(filename).getLines()) {
      val tokens = line.split(":")
      val before = tokens(0)
      val after = tokens(1)
      dict += before -> after
    }
    sanitizeTable = dict
  }
}

class Line(text: String) extends Censor{
  val line = text
}

val sample = new Line("test 1: Shoot, test 2: Darn")
val retval_1 = sample.sanitize(sample.line)
println(retval_1)

sample.loadDict
val retval_2 = sample.sanitize(sample.line)
println(retval_2)
