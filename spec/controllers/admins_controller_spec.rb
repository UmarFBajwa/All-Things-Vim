require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  context '#index' do
    before(:each) do
      @admin = create :admin
    end

    it 'returns a 200 status' do
      get :index, {}, { user_id: @admin.id}

      expect(response.status).to eq 200
    end

    it 'renders the index view' do
      get :index, {}, { user_id: @admin.id}

      expect(response).to have_rendered :index
    end

    it 'assigns the categoires instance var' do
      @first = create :category
      @second = create :category

      get :index, {}, { user_id: @admin.id}

      expect(assigns[:categories]).to eq [@first, @second]
    end

    it 'assigns the items instance var' do
      @first = create :item
      @second = create :item

      get :index, {}, { user_id: @admin.id}

      expect(assigns[:items]).to eq [@first, @second]
    end

    it 'redirects an unsigned in user' do
      get :index, {}, {}

      expect(response).to redirect_to root_path
    end


    it 'redirects a user who is not an admin' do
      user = create :user

      get :index, {}, { user_id: user.id}

      expect(response).to redirect_to root_path
    end
  end

end
