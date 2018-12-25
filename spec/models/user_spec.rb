require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:user)).to be_valid
    end
    it 'is invalid without username ' do
      expect(FactoryBot.build(:user, username: nil)).to be_invalid
    end
    it 'is invalid without password ' do
      expect(FactoryBot.build(:user, password: nil)).to be_invalid
    end
    it 'is invalid without password_confirmation ' do
      expect(FactoryBot.build(:user, password_confirmation: nil)).to be_invalid
    end
    it 'is invalid to take character for password' do
      expect(FactoryBot.build(:user, password_confirmation: 'jhgjf12')).to be_invalid
    end
    it 'is invalid to less than 10 digit  password' do
      expect(
        FactoryBot.build(:user, password: '9898797678912')
      ).to be_invalid
    end
    it 'is invalid to has less then 10 digit  password_confirmation' do
      expect(FactoryBot.build(:user, password_confirmation: '98912')).to be_invalid
    end   
  end
end