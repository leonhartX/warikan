class OauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_oauth(request.env["omniauth.auth"].except("extra"))
    # debugger
    if @user.persisted?
      flash.notice = "ログインしました！"
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end