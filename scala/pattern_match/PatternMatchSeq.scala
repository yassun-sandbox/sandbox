object PatternMatchSeq {

  def main(args: Array[String]): Unit = {
    val seq = Seq(1, 2, 3, 4)

    val result = seq match {
      case Seq(1, a, _*) => a
      case _ => 0
    }

    println("number:" + result)
  }

}
