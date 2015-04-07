object TypeParamSample {

  class TypeParam[T](val t: T) {
    def get: T = this.t
  }

  def main(args: Array[String]): Unit = {
    val stringTypeParam = new TypeParam[String]("test")
    println(stringTypeParam.get)

    val intTypeParam = new TypeParam[Int](1)
    println(intTypeParam.get)
  }

}
