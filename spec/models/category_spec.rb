require 'rails_helper'

describe Category, type: :model do
  let(:admin) { FactoryGirl.create(:admin) }

  context 'audit trail' do
    let(:parks) { admin.categories.create(name: 'Parks') }
    it 'should know who created it' do
      expect(parks.created_by).to eq admin
    end
  end
end
