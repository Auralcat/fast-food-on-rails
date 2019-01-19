# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Field validations' do
    let(:user) { Fabricate(:user) }
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

    context 'email' do
      subject { Fabricate(:user) }
      it { is_expected.to validate_uniqueness_of(:email) }
      it 'is supposed to be a valid email address' do
        user.email = 'random@email'
        expect(user).to_not be_valid
      end
    end

    context 'names' do
      subject { Fabricate(:user) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    # Password constraints are implemented and tested by Fabrication,
    # so they don't need to be here.
  end
end
