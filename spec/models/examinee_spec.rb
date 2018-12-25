require 'rails_helper'

RSpec.describe Examinee, type: :model do
  context 'Examinee validation' do
    it 'has valid factory' do
      expect(FactoryBot.build(:examinee)).to be_valid
    end
    it 'is invalid without id' do
      expect(FactoryBot.build(:examinee, id: nil)).not_to be_valid
    end
    it 'is invalid without name' do
      expect(FactoryBot.build(:examinee, name: nil)).to be_invalid
    end
    it 'is invalid without address' do
      expect(FactoryBot.build(:examinee, address: nil)).not_to be_valid
    end
    it 'is invalid without email' do
      expect(FactoryBot.build(:examinee, email: nil)).not_to be_valid
    end
    it 'is invalid without phone_no' do
      expect(FactoryBot.build(:examinee, phone_no: nil)).not_to be_valid
    end
    it 'is invalid to take character for phone_no' do
      expect(FactoryBot.build(:examinee, phone_no: 'jhgjf12')).to be_invalid
    end
    it 'is invalid to less than 10 digit  phone_no' do
      expect(
        FactoryBot.build(:examinee, phone_no: '9898797678912')
      ).to be_invalid
    end
  end
endrequire 'rails_helper'

RSpec.describe Examinee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
