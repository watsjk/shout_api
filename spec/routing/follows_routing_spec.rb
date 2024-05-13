# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FollowsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/follows').to route_to('follows#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/follows/1').to route_to('follows#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/follows').to route_to('follows#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/follows/1').to route_to('follows#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/follows/1').to route_to('follows#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/follows/1').to route_to('follows#destroy', id: '1')
    end
  end
end