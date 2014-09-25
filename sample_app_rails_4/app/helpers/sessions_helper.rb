module SessionsHelper
  def sign_in(user)

    # トークンを新規作成する。
    remember_token = User.new_remember_token

    # 暗号化されていないトークンをブラウザのcookiesに保存する
    cookies.permanent[:remember_token] = remember_token

    # 暗号化したトークンをデータベースに保存する
    user.update_attribute(:remember_token, User.encrypt(remember_token))

    # 与えられたユーザーを現在のユーザーに設定する
    self.current_user = user

  end

end
