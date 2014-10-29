require'spec_helper'

describe ContactsController do

  describe 'GET #index' do

    context 'params[:letter] がある場合' do
      it "指定された文字で始まる連絡先を配列にまとめること" do
        smith = FactoryGirl.create(:contact, lastname: 'Smith')
        FactoryGirl.create(:contact, lastname: 'Jones')
        get :index, letter: 'S'
        expect(assigns(:contacts)).to match_array([smith])
      end

      it ":index テンプレートを表示すること" do
        get :index, letter: 'S'
        expect(response).to render_template :index
      end
    end

    context 'params[:letter] がない場合' do

      it "全ての連絡先を配列にまとめること" do
        smith = FactoryGirl.create(:contact, lastname: 'Smith')
        jones = FactoryGirl.create(:contact, lastname: 'Jones')
        get :index
        expect(assigns(:contacts)).to match_array([smith, jones])
      end

      it ":index テンプレートを表示すること" do
        get :index
        expect(response).to render_template :index
      end
    end

  end

  describe 'GET #show' do
    it "@contact に要求された連絡先を割り当てること" do
      contact = FactoryGirl.create(:contact)
      get :show, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it ":show テンプレートを表示すること" do
      contact = FactoryGirl.create(:contact)
      get :show, id: contact
      expect(response).to render_template :show
    end

  end

  describe 'GET #new' do
    it "@contact に新しい連絡先を割り当てること" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it ":new テンプレートを表示すること" do
      get :new
      expect(response).to render_template :new
    end

  end

  describe 'GET #edit' do
    it "@contact に要求された連絡先を割り当てること" do
      contact = FactoryGirl.create(:contact)
      get :edit, id: contact
      expect(assigns(:contact)).to eq contact
    end

    it ":edit テンプレートを表示すること" do
      contact = FactoryGirl.create(:contact)
      get :edit, id: contact
      expect(response).to render_template :edit
    end

  end

  describe "POST #create" do
    before :each do
      @phones = [
        FactoryGirl.attributes_for(:phone),
        FactoryGirl.attributes_for(:phone),
        FactoryGirl.attributes_for(:phone)
      ]
    end

    context "有効な属性の場合" do
      it "データベースに新しい連絡先を保存すること" do
        expect{
            post :create, contact: FactoryGirl.attributes_for(:contact, phones_attributes: @phones)
        }.to change(Contact, :count).by(1)
      end

      it "contacts#show にリダイレクトすること" do
        post :create, contact: FactoryGirl.attributes_for(:contact, phones_attributes: @phones)
        expect(response).to redirect_to contact_path(assigns[:contact])
      end
    end

    context "無効な属性の場合" do
      it "データベースに新しい連絡先を保存しないこと" do
        expect{
          post :create,
          contact: FactoryGirl.attributes_for(:invalid_contact)
        }.to_not change(Contact, :count)
      end

      it ":new テンプレートを再表示すること" do
        post :create,
        contact: FactoryGirl.attributes_for(:invalid_contact)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
        @contact = FactoryGirl.create(:contact, firstname: 'Lawrence', lastname: 'Smith')
    end

    context "有効な属性の場合" do

      it "要求された @contact を取得すること" do
        patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact)
        expect(assigns(:contact)).to eq(@contact)
      end

      it "@contact の属性を変更すること" do
        patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, firstname: "Larry", lastname: "Smith")
        @contact.reload
        expect(@contact.firstname).to eq("Larry")
        expect(@contact.lastname).to eq("Smith")
      end

      it "更新した連絡先のページへリダイレクトすること" do
        patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact)
        expect(response).to redirect_to @contact
      end

    end

    context "無効な属性の場合" do

      it "連絡先を更新しないこと" do
        patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, firstname: "Larry", lastname: nil)
        @contact.reload
        expect(@contact.firstname).to_not eq("Larry")
        expect(@contact.lastname).to eq("Smith")
      end

      it ":edit テンプレートを再表示すること" do
        patch :update, id: @contact, contact: FactoryGirl.attributes_for(:invalid_contact)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @contact = FactoryGirl.create(:contact)
    end

    it "データベースから連絡先を削除すること" do
      expect{ delete :destroy, id: @contact }.to change(Contact, :count).by(-1)
    end

    it "contacts#index にリダイレクトすること" do
      delete :destroy, id: @contact
      expect(response).to redirect_to contacts_url
    end

  end
end

