require'spec_helper'

describe ContactsController do

  describe 'GET #index' do
    context 'params[:letter] がある場合' do
      it "指定された文字で始まる連絡先を配列にまとめること"
      it ":index テンプレートを表示すること"
    end

    context 'params[:letter] がない場合' do
      it "全ての連絡先を配列にまとめること"
      it ":index テンプレートを表示すること"
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
    it "@contact に新しい連絡先を割り当てること"
    it ":new テンプレートを表示すること"
  end

  describe 'GET #edit' do
    it "@contact に要求された連絡先を割り当てること" 
    it ":edit テンプレートを表示すること"
  end

  describe "POST #create" do
    context "有効な属性の場合" do
      it "データベースに新しい連絡先を保存すること"
      it "contacts#show にリダイレクトすること"
    end

    context "無効な属性の場合" do
      it "データベースに新しい連絡先を保存しないこと"
      it ":new テンプレートを再表示すること"
    end

  end

  describe 'PATCH #update' do
    context "有効な属性の場合" do
      it "データベースの連絡先を更新すること"
      it "更新した連絡先のページへリダイレクトすること"
    end

    context "無効な属性の場合" do
      it "連絡先を更新しないこと"
      it ":edit テンプレートを再表示すること"
    end
  end

  describe 'DELETE #destroy' do
    it "データベースから連絡先を削除すること"
    it "contacts#index にリダイレクトすること"
  end

end

