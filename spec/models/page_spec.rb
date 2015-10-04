require 'rails_helper'

describe Page, type: :model do
  let(:admin) { FactoryGirl.create(:admin) }
  let(:category) { FactoryGirl.create(:category) }
  let(:page) { category.pages.create(admin_id: admin.id) }

  context 'audit trail' do
    it 'should know who created it' do
      expect(page.created_by).to eq admin.email
    end

    it 'should know its category' do
      expect(page.category).to eq category
    end
  end
end
