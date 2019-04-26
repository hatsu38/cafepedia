require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'validations' do
    subject { build(:inquiry) }
    it { is_expected.to be_valid }
  end
end
