require 'spec_helper'

describe Event do
  describe '#name' do

    it { should validate_presence_of(:name) }

    context 'nilの場合' do
      let(:event){ Event.new(name:nil) }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end

    context '空白の場合' do
      let(:event){ Event.new(name:'') }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end


    context '「Rails勉強会」の場合' do
      let(:event){ Event.new(name:'Rails勉強会') }

      it 'validであること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context '50文字のとき' do
      let(:event){ Event.new(name:'A' * 50) }

      it 'validであること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end

    context '51文字のとき' do
      let(:event){ Event.new(name:'A' * 51) }

      it 'validでないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end

  end
end

