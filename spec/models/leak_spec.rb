# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Leak, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:leak)).to be_present
    end
  end

  describe 'validations' do
    let(:leak) { create(:leak) }
    it 'is valid' do
      expect(leak).to be_valid
    end
  end
end
