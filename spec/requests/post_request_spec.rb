require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    before(:each) do
      get '/users/3/posts'
    end
    it 'Posts index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:show)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('LIST OF POSTS')
    end
  end

  context 'show' do
    before(:each) do
      get '/users/3/posts/2'
    end
    it 'Posts index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:show)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:index)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('DISPLAY POST PER ID')
    end
  end
end
