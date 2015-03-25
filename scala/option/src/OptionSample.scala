/**
 * Created by ytaga on 2015/03/25.
 */
object OptionSample {
  def main(args: Array[String]): Unit = {

    val map = Map(1 -> "Moses", 2 -> "Lucas", 3 -> "Henderson", 5 -> null)

    // Some型が取得できる。
    val p1 = map get 2
    println(p1.get)

    // 値がnullでもSome型が取得できる
    val p2 = map get 5
    println(p2.get)

    // キーが存在しない場合はNone型が取得できる
    val p3 = map get 6

    // 値が存在しないのでエラー
    //println(p3.get)

  }

}
