require'spec_helper'

describe Contact do

  it "有効なファクトリを持つこと" do 
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  it "3 つの電話番号を持つこと" do
    expect(FactoryGirl.create(:contact).phones.count).to eq 3
  end

  it "名がなければ無効な状態であること" do
    contact = FactoryGirl.build(:contact, firstname: nil)
    expect(contact).to have(1).errors_on(:firstname)
  end

  it "姓がなければ無効な状態であること" do
    contact = FactoryGirl.build(:contact, lastname: nil)
    expect(contact).to have(1).errors_on(:lastname)
  end

  it "メールアドレスがなければ無効な状態であること" do
    contact = FactoryGirl.build(:contact, email: nil)
    expect(contact).to have(1).errors_on(:email)
  end

  it "重複したメールアドレスなら無効な状態であること" do
    FactoryGirl.create(:contact, email: "aaron@example.com")
    contact = FactoryGirl.build(:contact, email: "aaron@example.com")
    expect(contact).to have(1).errors_on(:email)
  end

  it "連絡先のフルネームを文字列として返すこと" do
    contact = FactoryGirl.build(:contact,firstname: "Jane", lastname: "Doe")
    expect(contact.name).to eq "Jane Doe"
  end

  describe "文字で姓をフィルタする" do

    before :each do
      @smith   = FactoryGirl.create(:contact, lastname: 'Smith',   email: 'jsmith@example.com')
      @jones   = FactoryGirl.create(:contact, lastname: 'Jones',   email: 'tjones@example.com')
      @johnson = FactoryGirl.create(:contact, lastname: 'Johnson', email: 'jjohnson@example.com')
    end

    context "マッチする文字の場合" do
      it "マッチした結果をソート済みの配列として返すこと" do
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    context "マッチしない文字の場合" do
      it "マッチした結果をソート済みの配列として返すこと" do
       expect(Contact.by_letter("J")).to_not include @smith
      end
    end

  end

end

