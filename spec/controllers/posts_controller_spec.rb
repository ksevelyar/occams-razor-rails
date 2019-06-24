# frozen_string_literal: true

require 'rails_helper'

describe PostsController, type: :controller do
  # describe 'GET #index' do
  #   it 'returns a success response' do
  #     post = Post.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe 'GET #show' do
  #   it 'returns a success response' do
  #     post = Post.create! valid_attributes
  #     get :show, params: { id: post.to_param }, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe 'POST #create' do
  #   context 'with valid params' do
  #     it 'creates a new Post' do
  #       expect do
  #         post :create, params: { post: valid_attributes }, session: valid_session
  #       end.to change(Post, :count).by(1)
  #     end
  #
  #     it 'renders a JSON response with the new post' do
  #       post :create, params: { post: valid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       expect(response.location).to eq(post_url(Post.last))
  #     end
  #   end
  #
  #   context 'with invalid params' do
  #     it 'renders a JSON response with errors for the new post' do
  #       post :create, params: { post: invalid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end
  #
  # describe 'PUT #update' do
  #   context 'with valid params' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end
  #
  #     it 'updates the requested post' do
  #       post = Post.create! valid_attributes
  #       put :update, params: { id: post.to_param, post: new_attributes }, session: valid_session
  #       post.reload
  #       skip('Add assertions for updated state')
  #     end
  #
  #     it 'renders a JSON response with the post' do
  #       post = Post.create! valid_attributes
  #
  #       put :update, params: { id: post.to_param, post: valid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  #
  #   context 'with invalid params' do
  #     it 'renders a JSON response with errors for the post' do
  #       post = Post.create! valid_attributes
  #
  #       put :update, params: { id: post.to_param, post: invalid_attributes }, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end
  #
  # describe 'DELETE #destroy' do
  #   it 'destroys the requested post' do
  #     post = Post.create! valid_attributes
  #     expect do
  #       delete :destroy, params: { id: post.to_param }, session: valid_session
  #     end.to change(Post, :count).by(-1)
  #   end
  # end
end
