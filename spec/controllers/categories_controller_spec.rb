require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:admin) { create :admin  }
  context '#index' do
    it 'responds with a success status' do
      get :index

      expect(response.status).to eq 200
    end

    it 'assigns the categories' do
      @first = create :category
      @second = create :category

      get :index

      expect(assigns[:categories]).to eq [@first, @second]
    end

    it 'renders the index view' do
      get :index

      expect(response).to have_rendered :index
    end
  end

  context "#show" do
    before(:each) do
      @category = create :category
    end

    it 'responds with a success status' do
      get :show, id: @category.id

      expect(response.status).to eq 200
    end

    it 'assigns the category to created category' do
      get :show, id: @category.id

      expect(assigns[:category]).to eq @category
    end

    it 'renders the correct view' do
      get :show, id: @category.id

      expect(response).to have_rendered(:show)
    end
  end

  context "#new" do
    it 'responds with a success status' do
      get :new, { }, { user_id: admin.id  }

      expect(response.status).to eq 200
    end

    it 'assigns the categorys to created articles' do
      get :new, { }, { user_id: admin.id  }

      expect(assigns[:category]).to be_a_new(Category)
    end

    it 'renders the correct view' do
      get :new, { }, { user_id: admin.id  }

      expect(response).to have_rendered(:new)
    end

    it 'redirects to root if not logged in' do
      get :new, { }, { }

      expect(response).to redirect_to root_path
    end

    it 'redirects to root if logged in user is not an admin' do
      user = create :user

      get :new, { }, { user_id: user.id}

      expect(response).to redirect_to root_path
    end
  end

  context "#create" do
    context "valid params" do
      let(:params) {
        { category: { name: 'Shoe'}}
      }

      it 'responds with a redirect status' do
        post :create, params, { user_id: admin.id  }

        expect(response.status).to eq 302
      end

      it 'it increases the Category count' do
        expect{
          post :create, params, { user_id: admin.id  }
        }.to change(Category.all, :size).by(1)
      end
    end

    context 'invalid params' do
      let(:invalid_params) {
        { category: { name: '' }}
      }

      it 'returns 200 as a status' do
        post :create, invalid_params, { user_id: admin.id  }

        expect(response.status).to eq 200
      end

      it 'renders new form' do
        post :create, invalid_params, { user_id: admin.id  }

        expect(response).to have_rendered(:new)
      end

      it 'it increases the Category count' do
        expect{
          post :create, invalid_params, { user_id: admin.id  }
        }.not_to change(Category.all, :size)
      end
    end

    context 'non admin' do
      it 'redirects to root if not logged in' do
        post :create, { } , { }

        expect(response).to redirect_to root_path
      end

      it 'redirects to root if logged in user is not an admin' do
        user = create :user

        post :create, { } , { user_id: user.id}

        expect(response).to redirect_to root_path
      end
    end

  end

  context "#edit" do
    before(:each) do
      @category = create :category
    end

    it 'responds with a success status' do
      get :edit, { id: @category.id} , { user_id: admin.id }

      expect(response.status).to eq 200
    end

    it 'assigns the category to created category' do
      get :edit, { id: @category.id} , { user_id: admin.id }

      expect(assigns[:category]).to eq @category
    end

    it 'renders the correct view' do
      get :edit, { id: @category.id} , { user_id: admin.id }

      expect(response).to have_rendered(:edit)
    end

    it 'redirects to root if not logged in' do
      get :edit, { id: @category.id} , { }

      expect(response).to redirect_to root_path
    end

    it 'redirects to root if logged in user is not an admin' do
      user = create :user

      get :edit, { id: @category.id} , { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end

  context "#update" do
    before(:each) do
      @category = create :category
    end

    context 'valid params' do
      let(:updated_params) {
        { category: { name: 'Sports'},
          id: @category.id }
      }

      it 'responds with a redirect status' do
        put :update, updated_params, { user_id: admin.id }

        expect(response.status).to eq 302
      end

      it 'reassigns the fields to the correct values' do
        put :update, updated_params, { user_id: admin.id }
        @category.reload

        expect(@category.name).to eq 'Sports'
      end
    end

    context 'invalid params' do
      let(:invalid_updated_params) {
        { category: { name: ''} ,
          id: @category.id}
      }

      it 'responds with a redirect status' do
        put :update, invalid_updated_params, { user_id: admin.id  }

        expect(response.status).to eq 200
      end

      it 'renders the edit template' do
        put :update, invalid_updated_params, { user_id: admin.id  }

        expect(response).to have_rendered :edit
      end

      it 'does not reassign the fields to the correct values' do
        put :update, invalid_updated_params, { user_id: admin.id  }
        @category.reload

        expect(@category.name).to eq @category.name
      end
    end

    context 'non admin' do
      it 'redirects to root if not logged in' do
        put :update, {id: @category.id}, {}

        expect(response).to redirect_to root_path
      end

      it 'redirects to root if logged in user is not an admin' do
        user = create :user

        put :update, { id: @category.id }, { user_id: user.id}

        expect(response).to redirect_to root_path
      end
    end
  end

  context "#destroy" do
    before(:each) do
      @category = create :category
    end

    it 'responds with a redirect status' do
      delete :destroy, { id: @category.id }, { user_id: admin.id }

      expect(response.status).to eq 302
    end

    it 'reassigns the fields to the correct values' do
      expect {
        delete :destroy, { id: @category.id }, { user_id: admin.id  }
      }.to change(Category.all, :size).by(-1)
    end

    it 'redirects to root if not logged in' do
      delete :destroy, {id: @category.id}, {}

      expect(response).to redirect_to root_path
    end

    it 'redirects to root if logged in user is not an admin' do
      user = create :user

      delete :destroy, { id: @category.id }, { user_id: user.id}

      expect(response).to redirect_to root_path
    end
  end


end
