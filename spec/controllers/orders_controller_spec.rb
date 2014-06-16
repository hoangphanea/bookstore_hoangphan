require 'spec_helper'

describe OrdersController do
  let (:book) { FactoryGirl.create(:book) }
  let (:book1) { FactoryGirl.create(:book) }
  let (:book2) { FactoryGirl.create(:book) }
  let (:user) { FactoryGirl.create(:user) }
  let (:user2) { FactoryGirl.create(:user) }
  let (:order) { FactoryGirl.create(:order, user_id: user.id) }
  let (:order2) { FactoryGirl.create(:order, user_id: user2.id) }

  before do
    order.order_lines.create(book_id: book1)
    order.order_lines.create(book_id: book2)
    order2.order_lines.create(book_id: book)
    subject.stub(:current_user) { user }
  end

  context "index" do
    it "should set @orders" do
      get :index
      assigns[:orders].should include(order)
      assigns[:orders].should_not include(order2)
    end
  end

  context "show" do
    it "should set @order" do
      get :show, id: order.id
      assigns[:order].should eq(order)
    end
  end

  context "edit" do
    it "should set @showcart" do
      get :edit, id: order.id
      assigns[:showcart].should eq true
    end
  end

  context "update" do
    it "should update @order" do
      put :update, id: order.id, order: { shipping_address: "Some address" }
      expect(response).to redirect_to books_path
    end

    it "should fail if any attribute is invalid" do
      put :update, id: order.id, order: { order_date: "xxxyyyy" }
      expect(response).not_to redirect_to books_path
    end
  end

  context "destroy" do
    it "should delete @order" do
      delete :destroy, id: order.id
      expect(response).to redirect_to books_path
    end
  end
end