require 'spec_helper'

describe Relationship do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }

  # リレーションレコードを新規作成
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do

    # respond_to = メソッドを呼び出しできるかどうか
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }

    # its = subjectで指定しているrelationship
    its(:follower) { should eq follower }
    its(:followed) { should eq followed }
  end

end
