require 'rails_helper'

RSpec.describe JsonApiClient do

  describe '#get_json' do

    context 'APIからの戻り値が存在する場合' do
      let(:user){ fixture_json('user1.json') }
      before do
        stub_request(:get, %r(#{JSON_API_URL}/users/1.*)).to_return({
          :body   => fixture('user1.json'),
          :status => 200
        })
      end

      it "JSONパースされた結果が取得できること" do
        expect(JsonApiClient.get_json(["users","1"])).to eq user
      end
    end

    context 'APIからの戻り値が存在しない場合' do
      before do
        stub_request(:get,"#{JSON_API_URL}").to_return({ :status => 404 })
      end

      it "nilが返却されること" do
        expect(JsonApiClient.get_json).to be_nil
      end
    end

  end
end

