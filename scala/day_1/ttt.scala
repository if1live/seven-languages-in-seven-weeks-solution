// X, O, 스페이스 문자를 이용해서 틱택토 보드를 만들고,
// 승자가 있는지, 비겼는지, 아니면 아직 게임이 진행중인지를
// 판별하는 게임 프로그램을 작성하라. 필요하면 클래스를 활용하라
// 보너스 문제: 두 사람이 틱택토 게임을 수행하도록 하라

import scala.util.control.Breaks._

// constant
val GAME_CONTINUE = 0
val GAME_DRAW = 1
val GAME_OVER = 2

class Board(data: (String, String, String)) {
  val map = List(
    List(data._1(0), data._1(1), data._1(2)),
    List(data._2(0), data._2(1), data._2(2)),
    List(data._3(0), data._3(1), data._3(2))
  )

  def nextBoard(pos: Int, ch: Char): Board = {
    val fulldata = data()
    var arr = List[Char]()
    for(i <- 0 to 8) {
      arr = arr ++ List(fulldata(i))
    }
    arr = arr.updated(pos, ch)

    val lineA = (new StringBuilder + arr(0) + arr(1) + arr(2)).toString
    val lineB = (new StringBuilder + arr(3) + arr(4) + arr(5)).toString
    val lineC = (new StringBuilder + arr(6) + arr(7) + arr(8)).toString
    new Board((lineA, lineB, lineC))
  }

  def isEmpty(pos: Int): Boolean = {
    val y = pos / 3
    val x = pos % 3
    map(y)(x) == ' '
  }

  def data(): String = {
    val builder = new StringBuilder
    map.foreach(row => row.foreach(ch => builder + ch))
    builder.toString
  }

  def checkLine(line: String): Char = line match {
    case "OOO" => 'O'
    case "XXX" => 'X'
    case _ => ' '
  }

  def lines(): List[String] = {
    var lines = List[String]()

    // vertical : |
    lines = lines ++ (0 to 2).map { x =>
      val builder = new StringBuilder
      for(y <- 0 to 2) {
        builder + map(y)(x)
      }
      builder.toString
    }

    // horizontal : -
    lines = lines ++ (0 to 2).map { y =>
      val builder = new StringBuilder
      for(x <- 0 to 2) {
        builder + map(y)(x)
      }
      builder.toString
    }

    // dir : / + \
    val crossA = (new StringBuilder + map(2)(0) + map(1)(1) + map(0)(2)).toString
    val crossB = (new StringBuilder + map(0)(2) + map(1)(1) + map(2)(0)).toString
    lines = lines ++ List(crossA, crossB)

    lines
  }

  def check():Int = {
    lines().foreach { line =>
      if(checkLine(line) != ' ') {
        return GAME_OVER
      }
    }

    // continue = space exist
    if(data().exists(ch => ch == ' ')) {
      return GAME_CONTINUE
    }

    return GAME_DRAW
  }

  def printStatus(status: Int) = status match {
    case GAME_CONTINUE => println("continue")
    case GAME_DRAW => println("draw")
    case GAME_OVER => println("over")
  }
}

class Renderer {
  def draw(board: Board) {
    println("=====")
    for(y <- 0 to 2) {
      for(x <- 0 to 2) {
        val ch = board.map(y)(x)
        val pos = y * 3 + x
        if(ch == ' ') {
          print(pos)
        } else {
          print(ch)
        }
        if(x != 2) {
          print("|")
        } else {
          println("")
        }
      }

      if(y != 2) {
        println("-+-+-")
      }
    }
    println("=====")
  }
}

class Game {
  val input = readLine("prompt> ")
}

val emptyBoard = new Board((
  "   ",
  "   ",
  "   "
))
println(emptyBoard.check == GAME_CONTINUE)

val continueBoard = new Board((
  "X X",
  " O ",
  "  O"
))
println(continueBoard.check == GAME_CONTINUE)

val drawBoard = new Board((
  "XOX",
  "XOO",
  "OXO"
))
println(drawBoard.check == GAME_DRAW)

val endBoard = new Board((
  "OOO",
  "XX ",
  "   "
))
println(endBoard.check == GAME_OVER)


val renderer = new Renderer
var board = new Board(("   ", "   ", "   "))

(0 to 9).foreach { x =>
  renderer.draw(board)

  // read input
  breakable {
    while(true) {
      val input = readLine("prompt> ")
      if(input.length > 1) { }
      else if(input < "0" || input > "9") { }
      else if(board.isEmpty(input.toInt) == false) { }
      else {
        if(x % 2 == 0) {
          board = board.nextBoard(input.toInt, 'O')
        } else {
          board = board.nextBoard(input.toInt, 'X')
        }
        break
      }
    }
  }

  board.printStatus(board.check)
}
