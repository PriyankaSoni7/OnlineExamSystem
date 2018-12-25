require 'rails_helper'

RSpec.describe Question_set, type: :model do
  context 'Question_set validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:question_set)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:question_set, sub_id: nil)).to be_invalid
    end
    it 'is invalid without sub name' do
      expect(FactoryBot.build(:question_set, sub_name: nil)).not_to be_valid
    end
    it 'is invalid without no. of question' do
      expect(FactoryBot.build(:question_set, no_of_ques: nil)).not_to be_valid
    end
end