require 'spec_helper'

describe Event do
  describe '#name' do
    context '空白の時' do
      let(:event){ Event.new(name:'') }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
  end
end

