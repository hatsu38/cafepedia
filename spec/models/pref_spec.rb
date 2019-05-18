# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pref, type: :model do
  describe '.create' do
    it '生成できる' do
      expect(create(:city)).to be_present
    end
  end
end
