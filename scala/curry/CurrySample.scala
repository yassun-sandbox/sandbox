object CurrySample {
  def main(args: Array[String]): Unit = {
    val add = {(x:Int, y:Int, z:Int) => x + y + z}
    val addCurried = add.curried
    val addCurriedWithX = addCurried(1)
    val addCurriedWithXY = addCurriedWithX(2)

    println("addCurriedWithXY:" + addCurriedWithXY(3))
    println("addCurried(1)(2)(3):" + addCurried(1)(2)(3))
  }
}

