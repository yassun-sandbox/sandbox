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


