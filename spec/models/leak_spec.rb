require 'rails_helper'

RSpec.describe Leak, type: :model do
  it 'Leakが作成されること' do
    @leak = create(:leak)
    expect(@leak.present?).to eq(true)
  end

  it 'Leakがなければエラー' do
    expect(@leak.present?).to eq(false)
  end
end
