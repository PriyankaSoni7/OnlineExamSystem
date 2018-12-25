require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'Question validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:question)).to be_valid
    end
    it 'is invalid without question no.' do
      expect(FactoryBot.build(:question, ques_no: nil)).to be_invalid
    end
    it 'is invalid without first option' do
      expect(FactoryBot.build(:question, first_option: nil)).not_to be_valid
    end
    it 'is invalid without second option' do
      expect(FactoryBot.build(:question, second_option: nil)).not_to be_valid
    end
    it 'is invalid without third option' do
      expect(FactoryBot.build(:question, third_option: nil)).not_to be_valid
    end
    it 'is invalid without fourth option' do
      expect(FactoryBot.build(:question, fourth_option: nil)).not_to be_valid
    end
    it 'is invalid without answer' do
      expect(FactoryBot.build(:question, answer: nil)).not_to be_valid
    end
    it 'is invalid without timi limit' do
      expect(FactoryBot.build(:question, time_limit: nil)).not_to be_valid
    end
  end
end