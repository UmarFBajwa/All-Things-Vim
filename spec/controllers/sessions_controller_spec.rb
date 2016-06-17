require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context '#new' do
    it 'returns a 200 status' do
      get :new

      expect(response.status).to eq 200
    end

    it 'renders the new view' do
      get :new

      expect(response).to have_rendered :new
    end
  end

  context '#create' do
    before(:each) do
      @user = create :user
    end

    context 'successful login' do
      let(:params) {
        { session: { email: @user.email, password: @user.password} }
      }

      it 'redirects to user profile' do
        post :create, params

        expect(response).to redirect_to user_path(@user)
      end

      it 'sets the session id to users id' do
        post :create, params

        expect(session[:user_id]).to eq @user.id
      end
    end


    context 'unsucessful login' do
      let(:params) {
        { session: { email: @user.email, password: 'Wrong Password'} }
      }

      it 'redirects to login' do
        post :create, params

        expect(response).to redirect_to login_path
      end

      it 'does not set the user_id in session' do
        post :create, params

        expect(session[:user_id]).to be nil
      end
    end
  end

  context '#destroy' do
    before(:each) do
      @user = create :user
      session[:user_id] = @user.id
    end

    it 'redirects to the root path' do
      delete :destroy

      expect(response).to redirect_to root_path
    end

    it 'removes the session user id' do
      delete :destroy

      expect(session[:user_id]).to be nil
    end
  end

end
