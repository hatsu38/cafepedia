# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:inquiry)).to be_present
    end
  end

  describe 'validations' do
    let(:inquiry) { create(:inquiry) }
    it 'is valid' do
      expect(inquiry).to be_valid
    end
  end
end
