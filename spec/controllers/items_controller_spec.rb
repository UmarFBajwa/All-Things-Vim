require 'rails_helper'
require_relative '../support/auth_helper.rb'

RSpec.describe ItemsController, type: :controller do
  let(:item) { create :item  }
  let(:category) { create :category  }
  before(:each) do
    @admin = create :admin
  end

  describe "#index" do
    it "renders the index page" do
      get :index

      expect(response).to have_rendered :index
    end

    it 'assigns items to created items' do
      @first = create :item
      @second = create :item

      get :index

      expect(assigns[:items]).to eq [@first, @second]
    end

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do
    it "renders the show page" do
      get :show, id: item.id

      expect(response).to have_rendered :show
    end

    it 'assigns the item to created item' do
      get :show, id: item.id

      expect(assigns[:item]).to eq item
    end

    it 'returns a success status' do
      get :show, id: item.id

      expect(response.status).to eq 200
    end
  end

  describe "#new" do
    it "renders the index page" do
      get :new, {}, { user_id: @admin.id  }

      expect(response).to have_rendered :new
    end

    it 'responds with a status of 200' do
      get :new, {}, { user_id: @admin.id  }

      expect(response.status).to eq 200
    end

    it 'assigns the items instance variable' do
      get :new, {}, { user_id: @admin.id  }

      expect(assigns[:item]).to be_a_new Item
    end

    it 'redirects an unauthenticed user' do
      get :new, {}, {}

      expect(response).to redirect_to root_path
    end

    it 'redirects a user thats not an admin' do
      user = create :user

      get :new, {}, { user_id: user.id}

      expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    let(:params) {
      {"item"=>{"name"=>"Danny", "price"=>20, "quantity"=>2, "description"=>"What?"},
       categories: [category.id]}
    }

    let(:empty_params) {
      {"item"=>{"name"=> nil, "price"=> nil  , "quantity"=> nil, "description"=> nil },
       categories: []}
    }

    context 'valid params' do
      it 'increments items in the database by 1' do
        expect{
          post :create, params, { user_id: @admin.id }
        }.to change{Item.count}.by(1)
      end

      it 'responds with a status of 302' do
        post :create, params, { user_id: @admin.id }

        expect(response.status).to eq(302)
      end

      it 'redirects to item' do
        post :create, params, { user_id: @admin.id }

        expect(response).to redirect_to item_path Item.last
      end
    end

    context 'invalid params' do
      it 'does not change the number of items' do
        expect{
          post :create, empty_params, { user_id: @admin.id }
        }.not_to change(Item.all, :size)
      end

      it 'responds with a status of 200' do
        post :create, empty_params, { user_id: @admin.id }

        expect(response.status).to eq 200
      end

      it 'renders new template' do
        post :create, empty_params, { user_id: @admin.id }

        expect(response).to have_rendered :new
      end
    end

    context 'non admin' do
      it 'redirects an unauthenticed user' do
        post :create, params, { }

        expect(response).to redirect_to root_path
      end

      it 'redirects a user thats not an admin' do
        user = create :user

        post :create, params, { user_id: user.id }

        expect(response).to redirect_to root_path
      end
    end

  end

  describe "GET #edit" do
    it "renders the edit page" do
      get :edit, { id: item.id}, {user_id: @admin.id}

      expect(response).to have_rendered :edit
    end

    it 'returns a 200 status' do
      get :edit, { id: item.id}, {user_id: @admin.id}

      expect(response.status).to eq 200
    end

    it 'assigns the item to instance var' do
      get :edit, { id: item.id}, {user_id: @admin.id}

      expect(assigns[:item]).to eq item
    end


    it 'redirects an unauthenticed user' do
      get :edit, { id: item.id}, {}

      expect(response).to redirect_to root_path
    end

    it 'redirects a user thats not an admin' do
      user = create :user

      get :edit, { id: item.id}, {user_id: user.id}

      expect(response).to redirect_to root_path
    end
  end


  describe "#update" do
    let(:params) {
      {"item"=>{"name"=>"Stuff", "price"=>20, "quantity"=>2, "description"=>"What?"},
       id: item.id,
       categories: [category.id]}
    }

    let(:empty_params) {
      {"item"=>{"name"=> nil, "price"=> nil  , "quantity"=> nil, "description"=> nil },
       id: item.id,
       categories: []}
    }

    context 'valid parameters' do
      it 'responds with a status of 302' do
        put :update, params, { user_id: @admin.id  }

        expect(response.status).to eq(302)
      end

      it 'updates an item in the database' do
        put :update, params, { user_id: @admin.id  }
        item.reload

        expect(item.name).to eq 'Stuff'
      end

      it 'assigns item to instance var' do
        put :update, params, { user_id: @admin.id  }

        expect(assigns[:item]).to eq item
      end

      it 'redirects to the item#show' do
        put :update, params, { user_id: @admin.id  }

        expect(response).to redirect_to item_path item
      end
    end

    context 'on invalid params' do
      it 'return 200 status' do
        put :update, empty_params, { user_id: @admin.id }

        expect(response.status).to eq 200
      end

      it 'assigns item to instance var' do
        put :update, empty_params, { user_id: @admin.id }

        expect(assigns[:item]).to eq item
      end

      it 'renders edit template' do
        put :update, empty_params, { user_id: @admin.id }

        expect(response).to have_rendered :edit
      end
    end

    context 'non admin' do
      it 'redirects an unauthenticed user' do
        put :update, params, { }

        expect(response).to redirect_to root_path
      end

      it 'redirects a user thats not an admin' do
        user = create :user

        put :update, params, { user_id: user.id  }

        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#destroy" do
    it 'responds with a status of 302' do
      delete :destroy, {id: item.id}, { user_id: @admin.id}

      expect(response.status).to eq(302)
    end

    it 'decrements the items in the database by 1' do
      item

      expect{
        delete :destroy, {id: item.id}, { user_id: @admin.id}
      }.to change{Item.count}.by(-1)
    end

    it 'redirects to the root path' do
      delete :destroy, {id: item.id}, { user_id: @admin.id}

      expect(response).to redirect_to root_path
    end
  end

end
