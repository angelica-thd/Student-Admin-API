require 'rails_helper'

RSpec.describe 'Students API', type: :request do
  let(:user) {create(:user)}
  let(:student) { create(:student,id_number: 'p12345',user_id: user.id) }
  let(:user_email) {user.email}
  let(:user_id) {user.id}
  let(:valid_attributes) do
    attributes_for(:student)
  end
  # Student signup test suite
  describe 'POST /signup/student' do

    context 'when valid request' do
      before { post '/signup/student', params: valid_attributes.to_json, headers: valid_headers }

      it 'creates a new student' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Student created successfully/)
      end
    end

    context 'when invalid request' do
      before { post '/signup/student', params: {}, headers: {} }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end


  # find student test suite
  describe 'POST /find/student' do
    let(:headers) {valid_headers_auth_only}
    let(:valid_attributes) { { email: user_email } }
    let(:invalid_attributes) { { email: 'admin@mail.com' } }
    context 'when valid request' do
      before { post '/find/student', params: valid_attributes, headers: headers }

      it 'finds the student based on the email given' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match("Student found.")
      end

    end

    context 'when unauthorized request' do
      before { post '/find/student', params: valid_attributes, headers: {} }

      it 'does not find the student' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end

    context 'when user is not student request' do
      before { post '/find/student', params: invalid_attributes, headers: headers }

      it 'does not find the student' do
        expect(response).to have_http_status(404)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Couldn't find User")
      end
    end
  end

  # Student update test suite
  describe 'PUT update/student' do
    let(:headers) { { "Authorization" => token_generator(student.user_id) }}
    let(:valid_attributes) { { university: 'University of Piraeus' } }
    context 'when valid request' do
      before { put '/update/student', params: valid_attributes, headers: headers }

      it 'updates the current student' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match("Student updated successfully.")
      end

    end

    context 'when unauthorized request' do
      before { put '/update/student', params: {}, headers: {} }

      it 'does not update the student' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end

  # Student delete test suite
  describe 'DELETE delete/student' do
    let(:headers) { { "Authorization" => token_generator(student.user_id) }}
    context 'when valid request' do
      before { delete '/delete/student', params: {}, headers: headers }

      it 'deletes the current student' do
        expect(response).to have_http_status(200)
      end

      it 'returns success message' do
        expect(json['message']).to match("Student deleted successfully.")
      end

    end

    context 'when invalid request' do
      before { delete '/delete/student', params: {}, headers: {} }

      it 'does not delete the user info' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match("Missing token")
      end
    end
  end
end
