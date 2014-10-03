require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }

  # リレーションレコードを新規作成
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  # メソッドが呼び出し可能かの確認
  describe "follower methods" do
    # respond_to = メソッドを呼び出しできるかどうか
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }

    # its = subjectで指定しているrelationship
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

  # null値が取れないことの確認
  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  # null値が取れないことの確認
  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

end
