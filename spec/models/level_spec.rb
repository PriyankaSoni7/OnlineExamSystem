require 'rails_helper'

RSpec.describe Level, type: :model do
  context 'Level validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:level)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:level, id: nil)).to be_invalid
    end
    it 'is invalid without fresher' do
      expect(FactoryBot.build(:level, fresher: nil)).not_to be_valid
    end
    it 'is invalid without intermediate' do
      expect(FactoryBot.build(:level, intermediate: nil)).not_to be_valid
    end
    it 'is invalid without experienced' do
      expect(FactoryBot.build(:level, experienced: nil)).not_to be_valid
    end
end