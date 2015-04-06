import scala.util.Random

object PatternMatchConst {

  def main(args: Array[String]): Unit = {
    val random = Random.nextBoolean

    val num = random match {
      case true => 1
      case false => 0
    }

    println("random:" + random)
    println("number:" + num)
  }

}
