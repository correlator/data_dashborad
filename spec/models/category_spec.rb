require 'rails_helper'

describe Category, type: :model do
  let(:admin) { FactoryGirl.create(:admin) }

  context 'audit trail' do
    let(:parks) { admin.categories.create(name: 'Parks') }
    it 'should know who created it' do
      expect(parks.created_by).to eq admin.email
    end

    it 'should have many pages' do
      2.times { parks.pages.create }
      expect(parks.pages.count).to eq 2
    end
  end
end
