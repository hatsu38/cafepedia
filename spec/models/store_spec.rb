# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = build(:store)
  end

  it 'storeが作成されていること' do
    expect(@store.present?).to eq(true)
  end
end
