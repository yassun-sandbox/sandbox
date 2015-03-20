/**
 * Created by ytaga on 2015/03/20.
 */

// 抽象型
abstract class Base {
  // この時点では未定
  type SomethingFoo
  def show(something: SomethingFoo)
}

class Foo{
  def exec = println("Foo#execを実行")
}

class Ex1 extends Base{
  // 実装するタイミングで決定
  type SomethingFoo = Foo
  def show(something: SomethingFoo) = something.exec
}

/* 構造的部分型 */
class Sample {

  type IO = {
    def open(src:String): Boolean
    def close:Unit
  }

  // 構造的部分型を引数にとるファンクション
  def func(io:IO,src:String) = {
    io.open(src)
    println("func execute")
    io.close
  }
}

class FileIO {
  def open(src:String):Boolean = { println(src + "file open"); true }
  def close:Unit = println("file close")
}

class DatabaseIO {
  def open(url:String):Boolean = { println(url + "connection open"); true }
  def close:Unit = println("connection close")
}



