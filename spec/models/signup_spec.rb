require 'rails_helper'

RSpec.describe Signup, type: :model do
  context 'Signup validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:signup)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:signup, name: nil)).to be_invalid
    end
    it 'is invalid without first name' do
      expect(FactoryBot.build(:signup, first_name: nil)).to be_invalid
    end
    it 'is invalid without last name' do
      expect(FactoryBot.build(:signup, last_name: nil)).not_to be_valid
    end
    it 'is invalid without address' do
      expect(FactoryBot.build(:signup, address: nil)).not_to be_valid
    end
    it 'is invalid without phone_no' do
      expect(FactoryBot.build(:signup, phone_no: nil)).not_to be_valid
    end
    it 'is invalid to take character for phone_no' do
      expect(FactoryBot.build(:signup, phone_no: 'jhgjf12')).to be_invalid
    end
    it 'is invalid to less than 10 digit  phone_no' do
      expect(
        FactoryBot.build(:signup, phone_no: '9898797678912')
      ).to be_invalid
    end
    it 'is invalid without college name' do
      expect(FactoryBot.build(:signup, college_name: nil)).not_to be_valid
    end
  end
end