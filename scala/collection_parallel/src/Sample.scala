/**
 * Created by ytaga on 2015/03/22.
 */
object Sample {
  def main(args: Array[String]) {

    // 未並列時の結果
    // num =1
    // num =2
    // num =3
    // num =4
    // 4188msec
    sum

    // 並列化時の結果
    // num =4
    // num =2
    // num =3
    // num =1
    // 1084msec
    parSum

  }

  def sum = {
    val start = System.currentTimeMillis()
    val list = List(1,2,3,4)
    for(elem <- list){ exec(elem) }
    println((System.currentTimeMillis() - start) + "msec")
  }

  def parSum = {
    val start = System.currentTimeMillis()
    val list = List(1,2,3,4)
    for(elem <- list.par){ exec(elem) }
    println((System.currentTimeMillis() - start) + "msec")
  }


  def exec(num:Int) = {
    Thread.sleep(1000)
    println("num =" + num)
  }

}
