# spec/requests/records_spec.rb
require 'rails_helper'

RSpec.describe 'records API' do
  # Initialize the test data
  let!(:account) { create(:account) }
  let!(:records) { create_list(:record, 20, account_id: account.id) }
  let(:account_id) { account.id }
  let(:id) { records.first.id }

  # Test suite for GET /accounts/:account_id/records
  describe 'GET /accounts/:account_id/records' do
    before { get "/accounts/#{account_id}/records" }

    context 'when account exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all account records' do
        expect(json.size).to eq(20)
      end
    end

    context 'when account does not exist' do
      let(:account_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Account with 'id'=0/)
      end
    end
  end

  # Test suite for GET /accounts/:account_id/records/:id
  describe 'GET /accounts/:account_id/records/:id' do
    before { get "/accounts/#{account_id}/records/#{id}" }

    context 'when account record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the record' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when account record does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for PUT /accounts/:account_id/records
  describe 'POST /accounts/:account_id/records' do
    let(:valid_attributes) { { flow_direction: 'Visit' } }

    context 'when request attributes are valid' do
      before { post "/accounts/#{account_id}/records", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/accounts/#{account_id}/records", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Flow direction can't be blank/)
      end
    end
  end

  # Test suite for PUT /accounts/:account_id/records/:id
  describe 'PUT /accounts/:account_id/records/:id' do
    let(:valid_attributes) { { flow_direction: 'Mozart' } }

    before { put "/accounts/#{account_id}/records/#{id}", params: valid_attributes }

    context 'when record exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the record' do
        updated_record = Record.find(id)
        expect(updated_record.flow_direction).to match(/Mozart/)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for DELETE /accounts/:id
  describe 'DELETE /accounts/:id' do
    before { delete "/accounts/#{account_id}/records/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end