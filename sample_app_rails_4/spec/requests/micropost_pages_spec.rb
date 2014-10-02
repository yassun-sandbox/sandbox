require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    # 登録失敗
    describe "with invalid information" do

      # Micropost数に変更が無いこと
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end

      # エラー画面の表示
      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end

    end

    # 登録成功
    describe "with valid information" do

      # コンテンツへ入力
      before { fill_in 'micropost_content', with: "Lorem ipsum" }

      # データが１件増えている事
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end

    end

  end
end

