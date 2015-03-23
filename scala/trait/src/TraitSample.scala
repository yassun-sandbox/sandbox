/**
 * Created by ytaga on 2015/03/23.
 */
object TraitSample {
  def main(args: Array[String]) {
    val p = new Person("taro")
    p.coding

    // traitのコンストラクタを実行
    val p2 = new Person("taro") with ProjectManager
    p2.manage


  }

}

trait Programmer {
  def coding = println("コーディングします")
  def write = println("コードを書きます")
}

class Person(val name:String) extends Programmer

// コンストラクタ付きトレイト
trait ProjectManager {
  val budget:Int = 100000000
  println("budget="+ budget)

  def manage = println("プロジェクト管理します")
}


trait  Writer {
  def write = println("記事を書きます")
}

class Peson2 extends Programmer with Writer {
  // superは指定する事も可能
  override def write = super[Programmer].write

}
