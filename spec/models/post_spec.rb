require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(email: 'test@test.com', password: 'password')
      post = Post.new(title: 'Post Title', body: 'This is a valid body.', user: user)
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post = Post.new(title: nil, body: 'This is a valid body.')
      expect(post).to_not be_valid
    end

    it 'is not valid without a body' do
      post = Post.new(title: 'Post Title', body: nil)
      expect(post).to_not be_valid
    end

    it 'is not valid if the title is too short' do
      post = Post.new(title: 'Hi', body: 'This is a valid body.')
      expect(post).to_not be_valid
    end
  end
end
