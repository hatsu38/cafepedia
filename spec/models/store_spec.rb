# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:store)).to be_present
    end
  end

  describe 'validations' do
    let(:store) { create(:store) }
    it 'is valid' do
      expect(store).to be_valid
    end
  end
end
