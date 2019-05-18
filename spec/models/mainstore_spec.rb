# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mainstore, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:mainstore)).to be_present
    end
  end

  describe 'validations' do
    let(:mainstore) { create(:mainstore) }
    it 'is valid' do
      expect(mainstore).to be_valid
    end
  end
end
