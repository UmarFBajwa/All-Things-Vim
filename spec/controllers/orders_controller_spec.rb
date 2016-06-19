require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context '#basket' do
    before(:each) do
      @user = create :user
    end

    context 'without an order created' do
      it 'renders the basket view' do
        get :basket, {}, {user_id: @user.id}
        expect(response).to have_rendered :basket
      end

      it 'assigns nil if no order created' do
        get :basket, {}, {user_id: @user.id}
        expect(assigns[:order]).to be_nil
      end
    end

    context 'with an order created' do
      before(:each) do
        @order = create(:order, user: @user)
        @ordered_item = create(:ordered_item, order: @order)
      end

      it 'renders the basket view' do
        get :basket, {}, {user_id: @user.id}
        expect(response).to have_rendered :basket
      end

      it 'assigns the order instance var' do
        get :basket, {}, {user_id: @user.id}
        expect(assigns[:order]).to eq @order
      end
    end
  end

  context '#checkout' do
    before(:each) do
      @user = create :user
      @order = create(:order, user: @user)
      @ordered_item = create(:ordered_item, order: @order)
    end

    it 'assigns order instance var' do
      put :update, {}, { user_id: @user.id }

      expect(assigns[:order]).to eq @order
    end

    it 'updates order#checked_out to true' do
      put :update, {}, { user_id: @user.id }

      @order.reload
      expect(@order.checked_out).to eq true
    end

    it 'updates the item stock' do
      stock = @ordered_item.item.quantity
      ordered = @ordered_item.order_quantity

      put :update, {}, { user_id: @user.id }

      @ordered_item.reload
      expect(@ordered_item.item.quantity).to eq(stock-ordered)
    end

    it 'redirects to the root path' do
      put :update, {}, { user_id: @user.id }

      expect(response).to redirect_to thank_you_path
    end
  end

  context '#thank_you' do
    before(:each) do
      @user = create :user
    end

    it 'renders the thank you view' do
      get :thank_you, {}, {user_id: @user.id}

      expect(response).to have_rendered :thank_you
    end

    it 'returns a success status' do
      get :thank_you, {}, {user_id: @user.id}

      expect(response.status).to eq 200
    end

    it 'assigns the order instance var' do
      order = create(:order, user: @user)

      get :thank_you, {}, { user_id: @user.id}

      expect(assigns[:order]).to eq order
    end
  end

  context '#index' do
    before(:each) do
      @user = create :user
    end

    it 'renders the index view' do
      get :index, {}, { user_id: @user.id}

      expect(response).to have_rendered :index
    end

    it 'returns a sucees status' do
      get :index, {}, { user_id: @user.id}

      expect(response.status).to eq 200
    end

    it 'assigns orders to a collection of orders' do
      first = create(:order, user: @user)
      second = create(:order, user: @user)

      get :index, {}, { user_id: @user.id}

      expect(assigns[:orders]).to eq [first, second]
    end
  end
end
