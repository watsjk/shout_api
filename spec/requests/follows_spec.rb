# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/follows', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Follow. As you add validations to Follow, be sure to
  # adjust the attributes here as well.
  let(:valid_follower) do
    Account.create! "uname": 'follower', "email": 'account1@shout.com', "password": 'simple88'
  end

  let(:valid_following) do
    Account.create! "uname": 'following', "email": 'account2@shout.com', "password": 'simple88'
  end

  let(:valid_attributes) do
    {
      "follower_id": valid_follower.id,
      "following_id": valid_following.id
    }
  end

  let(:invalid_attributes) do
    {}
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # FollowsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {
      "Accept": 'application/json',
      "Content-Type": 'application/json',
      "Authorization": 'Basic U2hvdXQ6U3VwZXJTZWNyZXQ='
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Follow.create! valid_attributes
      get follows_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      follow = Follow.create! valid_attributes
      get follow_url(follow), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Follow' do
        expect do
          post follows_url,
               params: { follow: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Follow, :count).by(1)
      end

      it 'renders a JSON response with the new follow' do
        post follows_url,
             params: { follow: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Follow' do
        expect do
          post follows_url,
               params: { follow: invalid_attributes }, as: :json
        end.to change(Follow, :count).by(0)
      end

      it 'renders a JSON response with errors for the new follow' do
        post follows_url,
             params: { follow: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    it 'not support follow updating' do
      follow = Follow.create! valid_attributes
      patch follow_url(follow),
            params: { follow: valid_follower }, headers: valid_headers, as: :json
      expect(response).to have_http_status(:not_implemented)
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested follow' do
      follow = Follow.create! valid_attributes
      expect do
        delete follow_url(follow), headers: valid_headers, as: :json
      end.to change(Follow, :count).by(-1)
    end
  end
end
