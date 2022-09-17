require 'rails_helper'

RSpec.describe PublicRecipesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/public_recipes').to route_to('public_recipes#index')
    end

    it 'routes to #new' do
      expect(get: '/public_recipes/new').to route_to('public_recipes#new')
    end

    it 'routes to #show' do
      expect(get: '/public_recipes/1').to route_to('public_recipes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/public_recipes/1/edit').to route_to('public_recipes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/public_recipes').to route_to('public_recipes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/public_recipes/1').to route_to('public_recipes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/public_recipes/1').to route_to('public_recipes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/public_recipes/1').to route_to('public_recipes#destroy', id: '1')
    end
  end
end
