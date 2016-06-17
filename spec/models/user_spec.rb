require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password}
  it { should validate_uniqueness_of :email }
  it { should validate_length_of(:name).is_at_most(50)  }
  it { should validate_length_of(:email).is_at_most(255)  }
  it { should validate_length_of(:password).is_at_least(6)  }

  context 'validates format of the email' do
    before(:each) do
      @user = build :user
    end

    it 'an email without @ is invalid' do
      @user.email = 'wrongemail.com'

      expect(@user.valid?).to eq false
    end

    it 'an email with a . after @ is invalid' do
      @user.email = 'wrong.email@somewherecom'

      expect(@user.valid?).to eq false
    end
  end

  context '#authenticate' do
    before(:each) do
      @user = create :user
    end

    it 'returns the user for valid password' do
      correct_password = @user.password

      expect(@user.authenticate(correct_password)).to eq @user
    end

    it 'returns false for an invalid password' do
      expect(@user.authenticate('wrong password')).to eq false
    end
  end
end
