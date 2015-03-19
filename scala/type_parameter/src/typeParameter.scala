/**
 * Created by ytaga on 2015/03/19.
 */
object typeParameter {

  def main (args: Array[String]): Unit = {
    val x = new MySample[String]
    x.set("hello")
    println(x.get)
  }

}
