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

      # 一件しかデータが存在しない場合は、複数形にならない事を確認
      describe "post 1 micropost" do
        before { click_button "Post" }
        it {should have_content('1 micropost')}
      end

      # 一件しかデータが存在しない場合は、複数形にならない事を確認
      describe "post 2 microposts" do
        before do
            click_button "Post"
            fill_in 'micropost_content', with: "Lorem ipsum"
            click_button "Post"
        end
        it {should have_content('2 microposts')}
      end

    end

    # 削除の確認
    describe "micropost destruction" do
      before { FactoryGirl.create(:micropost, user: user) }

      describe "as correct user" do
        before { visit root_path }

        it "should delete a micropost" do
          expect { click_link "delete" }.to change(Micropost, :count).by(-1)
        end

      end
    end

  end
end

