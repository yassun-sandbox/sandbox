/**
 * Created by ytaga on 2015/03/20.
 */
object AbstractType {
  def main(args: Array[String]) {
    // 抽象型の呼出し
    val x = new Ex1
    x.show(new Foo)

    val y = new Sample
    y.func(new FileIO, "test.txt")
    y.func(new DatabaseIO, "databaseUrl")

  }

}
