object TupleImmutable {

  def get(x1: Int, x2: Int) = {
    (x1, x2)
  }

  def main(args: Array[String]){
    val tuple = get(1, 2)
    tuple._1 = 3
  }

}
