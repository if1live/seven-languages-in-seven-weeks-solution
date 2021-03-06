// sizer 애플리케이션을 이용해서
// 어느 페이지에 포함된 링크의 수를 세는 메세지를 추가하라

// 보너스 문제: sizer가 주어진 페이지에 담긴 링크를 따라가도록 만들라.
// 그리고 방문한 페이지도 로드하라.
// 예를 들어 "google.com"에 대한 sizer는 구글 페이지의 크기와
// 그것이 가리키는 다른 모든 페이지의 크기를 계산해야 한다.

import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageSize(url: String) = Source.fromURL(url).mkString.length

  val linkReg = "<a href=\"([^> \"]*)\"".r
  def getHtml(url: String) =  Source.fromURL(url).mkString

  def getLinkCount(url: String):Int = {
    val html = getHtml(url)
    linkReg.findAllIn(html).matchData.length
  }

  def getLinks(url: String): List[String] = {
    val html = getHtml(url)
    var matches = linkReg.findAllIn(html).matchData
    var links = matches.map(m => m.group(1)).toList
    // ?lang=id 무시
    links = links.filter(link => link.charAt(0) != '?')
    // #supported_languages 는 내부 링크니까 무시
    links = links.filter(link => link.charAt(0) != '#')

    var schemaLinks = links.filter(link => link.substring(0, 2) == "//")
    links = links diff schemaLinks
    var outerLinks = links.filter(link => link.charAt(0) != '/')
    var innerLinks = links diff outerLinks

    schemaLinks = schemaLinks.map(link => "http:" + link)
    innerLinks = innerLinks.map(link => url + link)

    var retval = (schemaLinks ++ outerLinks ++ innerLinks).toSet.toList
    return retval
  }
}

val urls = List(
  "https://www.amazon.com/",
  "https://www.twitter.com/",
  // 예외가 발생해서 주석처리
  // java.nio.charset.MalformedInputException: Input length = 1
  //"http://www.google.com/",
  "http://www.cnn.com/")

def timeMethod(method: () => Unit) {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
  for(url <- urls) {
    println("Size for " + url + ": " + PageLoader.getPageSize(url))
  }
}

def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageSize(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size for " + url + ": " + size)
    }
  }
}

def getLinkCountConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getLinkCount(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, count) =>
        println("Link Count for " + url + ": " + count)
    }
  }
}

def getTotalPageSizeConcurrently() = {
  val caller = self
  var rootUrl = "https://www.twitter.com/"
  var links = PageLoader.getLinks(rootUrl)
  for(url <- links) {
    actor { caller ! (url, PageLoader.getPageSize(url)) }
  }

  var sizeList = List(0)
  for(i <- 1 to links.size) {
    receive {
      case (url, size) =>
        println("element size for " + url + ": " + size)
        sizeList = size.asInstanceOf[Int] :: sizeList
    }
  }
  var totalSize = (0 /: sizeList) {(sum, i) => sum + i}
  println("Total Page size for " + rootUrl + ": " + totalSize)
}

if(args.length == 0) {
  println("Sequential run: ")
  timeMethod { getPageSizeSequentially }
  println("Concurrently run: ")
  timeMethod { getPageSizeConcurrently }

} else if(args(0) == "link_count") {
  println("Concurrently Link count: ")
  timeMethod { getLinkCountConcurrently }

} else if(args(0) == "total_page_size") {
  println("Concurrently Total Page Size: ")
  timeMethod { getTotalPageSizeConcurrently }

} else {
  println("Unknown command")
}
