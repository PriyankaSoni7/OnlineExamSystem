require 'rails_helper'

RSpec.describe Diff_set, type: :model do
  context 'Diff_set validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:diff_set)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:diff_set, id: nil)).to be_invalid
    end
    it 'is invalid without easy set' do
      expect(FactoryBot.build(:diff_set, easy: nil)).not_to be_valid
    end
    it 'is invalid without medium set' do
      expect(FactoryBot.build(:diff_set, medium: nil)).not_to be_valid
    end
    it 'is invalid without difficult set' do
      expect(FactoryBot.build(:diff_set, difficult: nil)).not_to be_valid
    end
  end
end