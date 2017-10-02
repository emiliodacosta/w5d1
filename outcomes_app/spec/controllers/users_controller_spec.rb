require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST #create' do
    context "with invalid params" do
      it "should render new with invalid params" do
        post(:create, params: {
          user: {
            username: 'doestntmatter', password: 'star'
          }
        })
        expect(response).to render_template("new")
        expect(response).to have_http_status(422)
      end
    end

    context "with valid params" do
      it "should redirect to the users index with valid params" do
        post(:create, params: {
          user: {
            username: 'Joe',
            password: '123456'
          }
        })
      expect(response).to redirect_to('/users')
      end
    end
  end
end
