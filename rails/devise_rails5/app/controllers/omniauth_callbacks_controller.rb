class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    pp @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    if @user.persisted?
      puts "登録済"
      sign_in_and_redirect @user
    else
      puts "新規登録"
      session["devise.user_attributes"] = @user.attributes
      pp new_user_registration_url
      redirect_to new_user_registration_url
    end
  end
end
