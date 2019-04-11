# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @mainstore = create(:mainstore)
    @store =  @mainstore.stores.last
  end

  it 'storeが作成されていること' do
    expect(@store.present?).to eq(true)
  end

  it 'Mainstoreに紐づいていること' do
    expect(@store.mainstore.id).to eq(@mainstore.id)
  end

end
