package controllers

import play.api._
import play.api.mvc._

/**
 * Created by ytaga on 2015/03/18.
 */
object SampleController extends Controller{

  def sample1 = Action {
    Ok(views.html.index("Sample Controller#sample1"))
  }

  def sample2 = Action {
    Redirect(routes.SampleController.sample1)
  }

  def sample5(fixedValue: String) = Action {
    println("fixedValue:" + fixedValue)
    Ok(views.html.index("fixedValue:" + fixedValue))
  }

  def sample6(defaultValue:Int) = Action {
    println("defaultValue:" + defaultValue)
    Ok(views.html.index("defaultValue:"+ defaultValue))
  }

  // 引数でOption型を使用する。
  def sample7(optValue:Option[String]) = Action {
    println("optValue:" + optValue)
    val res = optValue match {
      case Some(opt) => opt
      case None => "nothing"
    }
    Ok(views.html.index("optValue:" + res))
  }


}
