# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/accounts').to route_to('accounts#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/accounts/1').to route_to('accounts#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/accounts').to route_to('accounts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/accounts/1').to route_to('accounts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/accounts/1').to route_to('accounts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/accounts/1').to route_to('accounts#destroy', id: '1')
    end
  end
end
