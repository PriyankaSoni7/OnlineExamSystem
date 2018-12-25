require 'rails_helper'

RSpec.describe Editability, type: :model do
  context 'Editability validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:editability)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:editability, e_id: nil)).to be_invalid
    end
    it 'is invalid without activation' do
      expect(FactoryBot.build(:editability, activate: nil)).not_to be_valid
    end
    it 'is invalid without deactivation' do
      expect(FactoryBot.build(:editability, deactivate: nil)).not_to be_valid
    end
    it 'is invalid without add new question' do
      expect(FactoryBot.build(:editability, add_new_ques: nil)).not_to be_valid
    end
    it 'is invalid without add new option' do
      expect(FactoryBot.build(:editability, add_option: nil)).not_to be_valid
    end
  end
end