# frozen_string_literal: true

require 'rails_helper'

describe StoresController, type: :controller do
  before do
    @mainstores = create(:mainstore)
    @stores = @mainstores.stores
  end

  it 'Topページの表示' do
    get :index
    expect(response.status).to eq 200
  end
end
