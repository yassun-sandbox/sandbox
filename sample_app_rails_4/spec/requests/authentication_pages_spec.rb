require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    # ログイン失敗のテスト
    describe "with invalid information" do
      before { click_button "Sign in" }

      # ページ遷移してない
      it { should have_title('Sign in') }
      # エラーメッセージが出ているか
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      # ページを離れた際にエラーがでているか
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end

    end

    # ログイン成功のテスト
    describe "with valid information" do

      # テストデータの作成
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      # サインイン後のページが表示されている事
      it { should have_title(user.name) }
      it { should have_link('Profile',  href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }

      # サインインのリンクが無くなっている事
      it { should_not have_link('Sign in', href: signin_path) }

      # サインアウトの確認
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

    end

    describe "authorization" do

        describe "for non-signed-in users" do
          let(:user) { FactoryGirl.create(:user) }

          describe "in the Users controller" do

            # ログインしていない場合にedit pageを訪れた場合、ログイン画面が表示されるか？
            describe "visiting the edit page" do
              before { visit edit_user_path(user) }
              it { should have_title('Sign in') }
            end

            # ログインしていない場合にUpdate要求を行った場合、ログイン画面のリダイレクトが返されるか。
            describe "submitting to the update action" do
              before { patch user_path(user) }
              specify { expect(response).to redirect_to(signin_path) }
            end
          end
        end
    end
  end
end

