# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  describe '.create' do
    let!(:pref) { build(:pref) }
    it '生成できる' do
      expect(create(:city, pref: pref)).to be_present
      expect(create(:city).pref).to be_present
    end
  end
end
