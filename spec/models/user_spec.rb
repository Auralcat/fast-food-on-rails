# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Field validations' do
    user = User.new(name: 'Random Steve',
                    password: 'supersafepass',
                    location: 'Knowhere')
    context 'general validations' do
      it 'is valid with all the validations' do
        expect(user).to be_valid
      end

      it 'is not valid without a name' do
        user.name = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without a password' do
        user.password = nil
        expect(user).to_not be_valid
      end
    end

    context 'passwords' do
      it 'does not save blank passwords' do
        user.password = ''
        expect(user).to_not be_valid
      end

      it 'does not save passwords longer than 30 characters' do
        user.password = 'a' * 31
        expect(user).to_not be_valid
      end

      it 'does not save passwords shorter than 4 characters' do
        user.password = 'b' * 3
        expect(user).to_not be_valid
      end
    end
  end
end
