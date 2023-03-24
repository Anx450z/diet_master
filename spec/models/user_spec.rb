require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'when new user is created' do
    context 'when user enters valid details' do
      @user = User.create(email: 'test2@example.com', password: 'test123')
      @user.save!
      it 'should create a new user'do
        expect(@user.valid?).to eq(true)
      end
    end
  end
end
