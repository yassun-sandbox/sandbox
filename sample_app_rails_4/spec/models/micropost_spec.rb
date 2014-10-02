require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }

  # ユーザーに紐づくMicropostを自動生成する
  before { @micropost = user.microposts.build(content: "Lorem ipsum") }
  subject { @micropost }

  # micropostモデルに必要な属性を保持しているか。
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  # micropostに関連するユーザーが取得できるか。
  it { should respond_to(:user) }
  its(:user) { should eq user }

  # バリデーション
  it { should be_valid }

  describe "when user_id is not present" do

    # ユーザーIDがnullは許可しない
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

end
