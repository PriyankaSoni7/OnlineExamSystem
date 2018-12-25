require 'rails_helper'

RSpec.describe Submit, type: :model do
  context 'Submit validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:submit)).to be_valid
    end
    it 'is invalid without no. of questions attempt.' do
      expect(FactoryBot.build(:submit, no_of_ques_attempt: nil)).to be_invalid
    end
  end
end