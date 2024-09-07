require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = User.create(email: 'test@test.com', password: 'password')
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new post' do
      expect {
        post :create, params: { post: { title: 'New Post', body: 'New body of the post.', user: @user } }
      }.to change(Post, :count).by(1)
    end
  end
end
