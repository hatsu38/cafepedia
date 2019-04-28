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

  describe 'Contact' do
    context 'work' do
      let(:params) do
        {
          message: 'お問い合わせです！',
          email: 'example@gmail.com',
        }
      end
      let(:inquiry) do
        {
          message: 'お問い合わせです！',
          email: 'example@gmail.com',
        }
      end
      it 'save出来ること' do
        post :contact, params: { inquiry: params }
        aggregate_failures do
          expect(response.status).to eq(204)
          latest_inquiry = Inquiry.last
          expect(latest_inquiry.message).to eq('お問い合わせです！')
          expect(latest_inquiry.email).to eq('example@gmail.com')
        end
      end

      describe 'メールが送れること' do
        subject { InquiryMailer.send_mail(inquiry).deliver_now }
        it 'work' do
          expect(response.status).to eq(200)
        end
      end
    end

    context 'validation errorr' do
      let(:params) do
        {
          message: '',
          email: 'example@gmail.com',
        }
      end

      it 'work' do
        post :contact, params: { inquiry: params }
        aggregate_failures do
          expect(response.status).to eq(200)
          expect(response).to render_template(:index)
        end
      end
    end
  end

  describe 'Leak' do
    context 'work' do
      let(:params) do
        {
          name: 'カフェの名前',
          address: '東京都',
          url: 'https://example.com',
          socket: true,
          wifi: true,
          smoking: true,
        }
      end
      it 'leak-save出来ること' do
        post :leak, params: { leak: params }
        aggregate_failures do
          expect(response.status).to eq(204)
          latest_leak = Leak.last
          expect(latest_leak.name).to eq(params[:name])
          expect(latest_leak.address).to eq(params[:address])
          expect(latest_leak.url).to eq(params[:url])
          expect(latest_leak.address).to eq(params[:address])
          expect(latest_leak.socket).to eq(params[:socket])
          expect(latest_leak.wifi).to eq(params[:wifi])
          expect(latest_leak.smoking).to eq(params[:smoking])
        end
      end

      describe 'メールが送れること' do
        let(:leak) { create(:leak) }
        subject { LeakMailer.send_mail(leak).deliver_now }
        it 'work' do
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
