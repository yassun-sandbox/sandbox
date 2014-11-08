require 'rails_helper'
require "webmock/rspec"

RSpec.describe JsonApiClient do

  describe '#get_json' do

    context 'APIからの戻り値が存在する場合' do
      it "JSONパースされた結果が取得できること"
    end

    context 'APIからの戻り値が存在しない場合' do
      before do
        stub_request(:get,"http://localhost:3333/").to_return({
          :status => 404
        })
      end

      it "nilが返却されること" do
        expect(JsonApiClient.get_json).to be_nil
      end
    end

  end

end

