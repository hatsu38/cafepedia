# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Leak, type: :model do
  describe 'validations' do
    subject { build(:leak) }
    it { is_expected.to be_valid }
  end
end
