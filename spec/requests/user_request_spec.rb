require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before(:each) do
      get '/users'
    end
    it 'Users index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:show)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('THIS IS THE LIST OF USERS')
    end
  end

  context 'show' do
    before(:each) do
      get '/users/3'
    end
    it 'Users index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:show)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:index)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('DISPLAY USER PER ID')
    end
  end
end
