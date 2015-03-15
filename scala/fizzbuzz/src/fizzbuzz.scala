/**
 * Created by ytaga on 2015/03/15.
 */
object fizzbuzz {
  def main(args: Array[String]) {
    for(i <- 1 to 100) println(fizzbuzz(i))
    fizzbuzz2(100)
  }

  def fizzbuzz1(i:Int): String = {
    if(i % 3 == 0 && i % 5 == 0) return "Fizz Buzz"
    if(i % 3 == 0) return "Fizz"
    if(i % 5 == 0) return "Buzz"
    i.toString()
  }

   def fizzbuzz2(n:Int) = {
     1 to n
   } filter{
     n => n % 2 == 0
   } map {
     case n if n % 15 == 0 => "FizzBuzz"
     case n if n % 3  == 0 => "Fizz"
     case n if n % 5  == 0 => "Buzz"
     case n                => n.toString
   } foreach { e =>
     println( e )
   }

}
