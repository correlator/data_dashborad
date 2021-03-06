require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:category) do
    FactoryGirl.create(:category, order: 1, admin_id: admin.id)
  end
  let(:page1) do
    FactoryGirl.create(:page, category_id: category.id, admin_id: admin.id)
  end
  let(:page2) do
    FactoryGirl.create(:page, category_id: category.id, admin_id: admin.id)
  end

  describe '#index' do
    before do
      page1.update(category_id: 0)
      page2
    end

    it 'should redirect to root when admin is singed out' do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#create' do
    before { sign_in admin }

    it 'should create pages when admin is singed in' do
      expect do
        post :create, page: { name: 'First',
                              category_id: category.id,
                              admin_id: admin.id }
      end.to change { Page.count }.by 1
    end

    it 'should redirect to the admin categories path' do
      post :create, page: { name: 'First',
                            category_id: category.id,
                            admin_id: admin.id }
      expect(response).to redirect_to admin_categories_path
    end
  end
end
