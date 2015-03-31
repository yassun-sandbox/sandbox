package controllers

import play.api._
import play.api.mvc._

import play.api.db.slick._
import models.Tables._
import profile.simple._

object UserController extends Controller {

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
  def edit(id: Option[Long]) = TODO

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


