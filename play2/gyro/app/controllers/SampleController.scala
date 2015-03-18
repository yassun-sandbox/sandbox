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
}
