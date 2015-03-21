/**
 * Created by ytaga on 2015/03/21.
 */
object ImplicitConversion {
  def main(args: Array[String]) {
    val str:String = 10

  }

  // implicitキーワードは型エラー時に挿入される
  implicit def intToString(num:Int):String = {
    println("数値から文字列へ変換")
    num.toString
  }
}
