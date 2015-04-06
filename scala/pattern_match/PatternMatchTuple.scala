object PatternMatchTuple {

  def main(args: Array[String]): Unit = {
    val tuple = (1, 2, "OK")

    val result = tuple match {
      case (1, 2, x) => x
      case _ => "NG"
    }

    println("result:" + result)
  }

}
