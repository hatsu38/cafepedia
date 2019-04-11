require 'rails_helper'

RSpec.describe Mainstore, type: :model do
  before do
    @mainstore = create(:mainstore)
  end

  it 'mainstoreが作成されていること' do
    expect(@mainstore.present?).to eq(true)
  end

  it 'Storeを複数持っていること' do
    expect(@mainstore.stores.present?).to eq(true)
  end
end
