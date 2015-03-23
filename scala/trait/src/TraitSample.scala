/**
 * Created by ytaga on 2015/03/23.
 */
object TraitSample {
  def main(args: Array[String]) {
    val p = new Person("taro")
    p.coding
  }

}

trait Programmer {
  def coding = println("コーディングします")
}

class Person(val name:String) extends Programmer
