require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:category1) do
    FactoryGirl.create(:category, order: 1, admin_id: admin.id)
  end
  let(:category2) do
    FactoryGirl.create(:category, order: 2, admin_id: admin.id)
  end

  describe '#index' do
    before do
      category1
      category2
    end

    it 'should return the categories in order when admin is singed in' do
      sign_in admin
      get :index
      expect(assigns(:categories)).to eq [category1, category2]
    end

    it 'should redirect to root when admin is singed out' do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
