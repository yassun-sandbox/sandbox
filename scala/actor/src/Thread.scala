/**
 * Created by ytaga on 2015/03/22.
 */
import scala.actors.Actor
import scala.actors.Actor._

object Thread {
  def main(args: Array[String]) {

    /* Javaと同様にThreadクラスを使用するパターン */
    this.threadSampleCall

    /* scalaのactorを使用するパターン */
    val ma = new MyActor
    ma.start()

    // 直接作成するパターン
    val ma2 = actor {
      println("Hello MyActor for factory ")
    }

  }

  def threadSampleCall {
    println("ThreadSample#main start")
    for (i <- 0 to 3){
      val t = new Thread(new ThreadSample("[Thread-" + i + "]"))
      t.start()
    }
    println("ThreadSample#main end")
  }
}

class ThreadSample(name:String) extends Runnable {
  def run() = {
    for (i <- 0 to 3){
      println(name + "count=" + i)
    }
  }
}

class MyActor extends Actor {
  def act {
    println("Hello MyActor")
  }
}
