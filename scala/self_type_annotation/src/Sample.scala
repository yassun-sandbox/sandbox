/**
 * Created by ytaga on 2015/03/24.
 */
object Sample {
  def main(args: Array[String]) {

    // DI
    val c1 = new MyController with MyServiceImpl1
    c1.execute

    val c2 = new MyController with MyServiceImpl2
    c2.execute

  }
}

trait MyService {
  def findAll():String
}

trait MyServiceImpl1 extends MyService {
  def findAll():String = "MyServiceImpl1#findAll"
}

trait MyServiceImpl2 extends MyService {
  def findAll():String = "MyServiceImpl2#findAll"
}

class MyController {
  self: MyService =>

  def execute = {
    println(findAll())
  }
}