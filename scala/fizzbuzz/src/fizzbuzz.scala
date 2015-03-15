/**
 * Created by ytaga on 2015/03/15.
 */
object fizzbuzz {
  def main(args: Array[String]) {
    for(i <- 1 to 100) println(fizzbuzz(i))
  }

  def fizzbuzz(i:Int): String = {
    if(i % 3 == 0 && i % 5 == 0) return "Fizz Buzz"
    if(i % 3 == 0) return "Fizz"
    if(i % 5 == 0) return "Buzz"
    i.toString()
  }
}
