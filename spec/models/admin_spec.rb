require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'Admin validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:admin)).to be_valid
    end
    it 'is invalid without name' do
      expect(FactoryBot.build(:admin, name: nil)).to be_invalid
    end
    it 'is invalid without address' do
      expect(FactoryBot.build(:admin, address: nil)).not_to be_valid
    end
    it 'is invalid without phone_no' do
      expect(FactoryBot.build(:admin, phone_no: nil)).not_to be_valid
    end
    it 'is invalid to take character for phone_no' do
      expect(FactoryBot.build(:admin, phone_no: 'jhgjf12')).to be_invalid
    end
    it 'is invalid to less than 10 digit  phone_no' do
      expect(
        FactoryBot.build(:admin, phone_no: '9898797678912')
      ).to be_invalid
    end
  end
end