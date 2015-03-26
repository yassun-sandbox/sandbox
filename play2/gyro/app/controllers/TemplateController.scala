package controllers

import play.api._
import play.api.mvc._


/**
 * Created by ytaga on 2015/03/26.
 */
object TemplateController extends Controller {
  def show = Action {
    val list = List[String]("lemon","mikan","nanao")

    Ok(views.html.show("Hello Scala Templates!",list))
  }
}
