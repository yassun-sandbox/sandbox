/**
 * Created by ytaga on 2015/03/19.
 */
object typeParameter {

  def main (args: Array[String]): Unit = {
    val x = new MySample[String]
    x.set("hello1")
    println(x.get)

    // 型パラメータ有りファンクション

    // 型推論
    println(x.func("hello2"))

    // 型指定
    println(x.func[String]("hello3"))
    println(x.func[Int](4))

  }

}
