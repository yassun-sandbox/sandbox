/**
 * Created by ytaga on 2015/03/21.
 */
object ImplicitConversion {
  def main(args: Array[String]) {
    val str:String = 10
    val strDate:String = new java.util.Date()

    // implicit な変数を準備
    implicit val hello:String = "hello!"
    greeting("taro")

    // view bound
    // implicit yTox が存在するので変換引数に指定可能
    val a = new Z[Y]

  }

  // implicitキーワードは型エラー時に挿入される
  implicit def intToString(num:Int):String = {
    println("数値から文字列へ変換")
    num.toString
  }

  // java.util.Date が Stringとして扱われた場合に呼び出される
  implicit def dateToString(date:java.util.Date):String = {
    import java.text._
    println("java.util.DateからStringへ変換")
    val sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")
    sdf.format(date)
  }

  // 同じ型変換がある場合はエラーになる
  //implicit def dateToString2(date:java.util.Date):String = {
  //}

  //implicit param
  def greeting(name:String)(implicit greet:String) = {
    println(greet + name)
  }

  // view bound
  implicit def yTox(y:Y):X = new X


}
