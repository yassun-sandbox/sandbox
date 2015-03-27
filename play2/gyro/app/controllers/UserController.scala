package controllers

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._
import models._


/**
 * Created by ytaga on 2015/03/27.
 */
object UserController extends Controller {

  // Form定義
  val userForm = Form(
    mapping("name" -> text, "email" -> text )(User.apply)(User.unapply)
  )

  // 初期画面関数
  def entryInit = Action {
    val filledFrom = userForm.fill(User("user name", "email address"))
    Ok(views.html.user.entry(filledFrom))
  }

  // ユーザー登録関数
  def entrySubmit = Action { implicit request =>
    val user = userForm.bindFromRequest.get
    println(user)
    Ok(views.html.user.entrySubmit())
  }


}
