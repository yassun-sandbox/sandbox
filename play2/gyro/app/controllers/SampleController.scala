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
    Ok(views.html.index("Sample Controller#sample2"))
  }

  def sample5(fixedValue: String) = Action {
    println("fixedValue:" + fixedValue)
    Ok(views.html.index("fixedValue:" + fixedValue))
  }

  def sample6(defaultValue:Int) = Action {
    println("defaultValue:" + defaultValue)
    Ok(views.html.index("defaultValue:"+ defaultValue))
  }

}
