require'spec_helper'

describe NewsRelease, focus:true do

  it { should validate_presence_of :released_on }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it "フォーマットされた日付とタイトルの文字列を返すこと" do
    news_release = NewsRelease.new( released_on: '2013-07-31', title: 'BigCo hires new CEO')
    expect(news_release.title_with_date).to eq '2013-07-31: BigCo hires new CEO'
  end

end
