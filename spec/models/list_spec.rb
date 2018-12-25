require 'rails_helper'

RSpec.describe List, type: :model do
  context 'List validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:list)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:list, l_id: nil)).to be_invalid
    end
    it 'is invalid without marks' do
      expect(FactoryBot.build(:list, marks: nil)).not_to be_valid
    end
    it 'is invalid without pass' do
      expect(FactoryBot.build(:list, pass: nil)).not_to be_valid
    end
    it 'is invalid without fail' do
      expect(FactoryBot.build(:list, fail: nil)).not_to be_valid
    end
end