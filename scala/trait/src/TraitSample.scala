/**
 * Created by ytaga on 2015/03/23.
 */
object TraitSample {
  def main(args: Array[String]) {
    val p1 = new Person("taro")
    p1.coding

    // traitのコンストラクタを実行
    val p2 = new Person("taro") with ProjectManager
    p2.manage

    // traitのインスタンス化
    // 無名クラスを作成してミックスインされた状態
    val p3 = new Programmer {}


    // traitの積み重ね
    val p4 = new Person3 with Programmer3
    p4.work(60)





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

abstract class Enginner {
  println("class Enginner constructor")

  def work(time:Int)
}

class Person3 extends Enginner {
  println("class Person3 constructor")

  def work(time:Int) = {
    println("Person3#work start")
    println("１つのタスクを"+ time +"分で行います")
    println("Person3#work end")
  }
}

// 抽象クラスをスーパクラスにすることも可能
// Programmer3を継承できるのは、Enginnerのサブクラスのみ
trait Programmer3 extends Enginner {
  println("trait Programmer constructor")
  abstract override def work(time:Int) = {
    println("Programmer#work start")
    super.work(time - 15)
    println("Programmer#work end")
  }
}


