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

    it 'should return the orphaned pages when admin is singed in' do
      sign_in admin
      get :index
      expect(assigns(:pages)).to match_array [page1]
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

    it 'should render the page that was just created' do
      post :create, page: { name: 'First',
                            category_id: category.id,
                            admin_id: admin.id }
      expect(response).to render_template(:show)
    end
  end
end
