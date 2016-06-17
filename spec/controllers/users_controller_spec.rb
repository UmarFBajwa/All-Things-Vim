require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user  }

  describe "#show" do
    it "assigns the requested user as user" do
      get :show, {id: user.id}, { user_id: user.id  }

      expect(assigns[:user]).to eq(user)
    end

    it 'gives a success message' do
      get :show, {id: user.id}, { user_id: user.id  }

      expect(response.status).to eq 200
    end

    it 'renders the correct view' do
      get :show, {id: user.id}, { user_id: user.id  }

      expect(response).to have_rendered :show
    end
  end

  describe "#new" do
    it "assigns a new user as user" do
      get :new

      expect(assigns[:user]).to be_a_new User
    end

    it 'gives a success message' do
      get :new

      expect(response.status).to eq 200
    end

    it 'renders the correct view' do
      get :new

      expect(response).to have_rendered :new
    end
  end

  describe "#edit" do
    it "assigns the requested user as user" do
      get :edit, {id: user.id}, { user_id: user.id }

      expect(assigns[:user]).to eq(user)
    end

    it 'gives a success message' do
      get :edit, {id: user.id}, { user_id: user.id }

      expect(response.status).to eq 200
    end

    it 'renders the correct view' do
      get :edit, {id: user.id}, { user_id: user.id }

      expect(response).to have_rendered :edit
    end
  end

  describe "#create" do
    before(:each) do
      job = double('job')
      allow(SendEmailJob).to receive(:set).and_return(job)
      allow(job).to receive(:perform_later)
    end

    context "with correct fields" do
      let(:fields) { { name: 'tom', email: 'tom@tom.com', password: 'tomtom' } }

      it "creates a new User" do
        expect {
          post :create, {user: fields}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as user" do
        post :create, {user: fields}

        expect(assigns[:user]).to be_a(User)
      end

      it "redirects to the created user" do
        post :create, {user: fields}

        expect(response).to redirect_to root_path
      end
    end

    context "with invalid fields" do
      let(:wrong_fields) { {name: '', email: '', password: ''} }

      it "assigns a newly created but unsaved user as user" do
        post :create, {user: wrong_fields}

        expect(assigns[:user]).to be_a_new(User)
      end

      it "gives a success response" do
        post :create, {user: wrong_fields}

        expect(response.status).to eq 200
      end

      it "renders the new view" do
        post :create, {user: wrong_fields}

        expect(response).to have_rendered :new
      end
    end
  end

  describe "#update" do
    context "with valid field" do
      let(:new_field) {
        {user: { name: 'tim' , email: user.email, password: user.password },
         id: user.id  }
      }

      it "updates the requested user" do
        put :update, new_field , { user_id: user.id  }
        user.reload

        expect(user.name).to eq 'tim'
      end

      it "assigns the requested user as user" do
        put :update, new_field , { user_id: user.id  }

        expect(assigns[:user]).to eq(user)
      end

      it 'gives a redirect status' do
        put :update, new_field , { user_id: user.id  }

        expect(response.status).to eq 302
      end

      it "redirects to the user" do
        put :update, new_field , { user_id: user.id  }

        expect(response).to redirect_to root_path
      end
    end

    context "with invalid fields" do
      let(:empty_field) { { name: ''  } }

      it "assigns the user as user" do
        put :update, { id: user.id, user: empty_field }, { user_id: user.id  }

        expect(assigns[:user]).to eq(user)
      end

      it 'gives a success status' do
        put :update, { id: user.id, user: empty_field }, { user_id: user.id  }

        expect(response.status).to eq 200
      end

      it "renders the edit view" do
        put :update, { id: user.id, user: empty_field }, { user_id: user.id  }

        expect(response).to have_rendered :edit
      end
    end
  end

  describe "#destroy" do
    it "destroys the requested user" do
      user

      expect {
        delete :destroy, {id:  user}, { user_id: user.id }
      }.to change(User, :count).by(-1)
    end

    it "redirects to home page" do
      delete :destroy, {id:  user}, { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end
end
