require'spec_helper'

describe Contact do

  it "姓と名とメールがあれば有効な状態であること" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Sumner',
      email: 'tester@example.com')

    expect(contact).to be_valid
  end

  it "名がなければ無効な状態であること" do
    expect(Contact.new(firstname: nil)).to have(1).errors_on(:firstname)
  end

  it "姓がなければ無効な状態であること" do
    expect(Contact.new(lastname: nil)).to have(1).errors_on(:firstname)
  end

  it "メールアドレスがなければ無効な状態であること" do
    expect(Contact.new(email: nil)).to have(1).errors_on(:firstname)
  end

  it "重複したメールアドレスなら無効な状態であること" do
   Contact.create(
      firstname: 'Joe', lastname: 'Tester',
        email: 'tester@example.com')

   contact = Contact.new(
      firstname: 'Jane', lastname: 'Tester',
        email: 'tester@example.com')

   expect(contact).to have(1).errors_on(:email)

  end

  it "連絡先のフルネームを文字列として返すこと"


end
