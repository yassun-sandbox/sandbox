package controllers

import play.api._
import play.api.mvc._

import play.api.db.slick._
import models.Tables._
import profile.simple._

import play.api.data._
import play.api.data.Forms._

object UserController extends Controller {

  // フォームの値を格納する
  case class UserForm(id: Option[Long], name: String, companyId: Option[Int])

  // formのデータ⇔ケースクラスの変換を行う
  val userForm = Form(
    mapping(
      "id"        -> optional(longNumber),
      "name"      -> nonEmptyText(maxLength = 20),
      "companyId" -> optional(number)
    )(UserForm.apply)(UserForm.unapply)
  )

  /**
   * 一覧表示
   */
  def list = DBAction { implicit rs =>

    // ユーザをIDの昇順でソートして取得
    val users = Users.sortBy(t => t.id).list

    // テンプレートをレンダリングしてレスポンスを返却
    Ok(views.html.user.list(users))
  }

  /**
   * 登録・編集画面表示
   */
  def edit(id: Option[Long]) = DBAction { implicit rs =>
    // リクエストパラメータにIDが存在する場合
    val form = if(id.isDefined) {

      // IDからユーザ情報を1件取得
      val user = Users.filter(_.id === id.get.bind).first

      // 値をフォームに詰める
      userForm.fill(UserForm(Some(user.id), user.name, user.companyId))

    } else {

      // リクエストパラメータにIDが存在しない場合
      userForm

    }

    // 会社一覧を取得
    val companies = Companies.sortBy(t => t.id).list

    Ok(views.html.user.edit(form, companies))
  }

  /**
   * 登録実行
   */
  def create = TODO

  /**
   * 更新実行
   */
  def update = TODO

  /**
   * 削除実行
   */
  def remove(id: Long) = TODO

}


