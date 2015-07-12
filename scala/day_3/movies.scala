val movies =
  <movies>
    <movie>The Indredibles</movie>
    <movie>WALL E</movie>
    <short>Jack Jack Attach</short>
    <short>Geri's Game</short>
  </movies>

(movies \ "_").foreach { movie =>
  movie match {
    case <movie>{movieName}</movie> => println(movieName)
    case <short>{shortName}</short> => println(shortName + " (short)")
  }
}
