require 'rails_helper'

RSpec.describe 'new', type: :request do
  include Warden::Test::Helpers
  context 'non-signed in user' do
    it 'redirects to a root path' do
      get '/posts/new'
      expect(response).to redirect_to(root_path)
    end
  end

  context 'signed in user' do
    let(:user) { create(:user) }
    before(:each) { login_as user }

    it 'renders a new template' do
      get '/posts/new'
      expect(response).to render_template(:new)
    end
  end
end
