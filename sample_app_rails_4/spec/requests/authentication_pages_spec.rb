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

    describe "with invalid information" do
      before { click_button "Sign in" }

      # ページ遷移してない
      it { should have_title('Sign in') }

      # エラーメッセージが出ているか
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

    end
  end
end

