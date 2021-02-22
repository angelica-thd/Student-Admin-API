require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user) }


  #let(:auth_token) { AuthenticateUser.new(user.email, user.password).call }


  # User signup test suite
  describe 'POST /signup' do
    let(:valid_attributes) do
      attributes_for(:user, password_confirmation: user.password)
    end
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: valid_headers.except('Authorization') }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Username can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end


  # User update test suite
  describe 'PUT /update' do
    let(:headers) {valid_headers}
    let(:valid_attributes) { { name: 'Peter Parker',
                               email: 'peter@parker.com',
                               password: 'test'}.to_json }
    context 'when valid request' do
      before { put '/update', params: valid_attributes, headers: headers }

      it 'updates the current user' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match(/User updated successfully./)
      end

      it 'returns the updated user' do
        expect(json['new_credentials']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { put '/update', params: {}, headers: {} }

      it 'does not update the user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end

  # User destroy test suite
  describe 'DELETE /delete' do
    let(:headers) {valid_headers}
    context 'when valid request' do
      before { delete '/delete', params: {}, headers: headers }

      it 'deletes the current user' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match(/User deleted successfully./)
      end

    end

    context 'when invalid request' do
      before { delete '/delete', params: {}, headers: {} }

      it 'does not delete the user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end

  # User me test suite
  describe 'GET /me' do
    let(:headers) {valid_headers}
    context 'when valid request' do
      before { get '/me', params: {}, headers: headers }

      it 'returns the current user info' do
        expect(response).to have_http_status(200)
      end

      it 'returns the type of user' do
        expect(json['user']).not_to be_nil
      end

    end

    context 'when invalid request' do
      before { get '/me', params: {}, headers: {} }

      it 'does not return the user info' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end
end
