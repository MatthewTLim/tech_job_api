require 'rails_helper'

RSpec.describe 'Jobs API', type: :request do
  let(:base_url) { 'http://localhost:5000/jobs' }

  describe 'GET /jobs' do
    context 'when there are jobs' do
      before do
        create_list(:job, 5)
      end

      it 'returns all jobs' do
        get base_url
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(5)
      end
    end

    context 'when there are no jobs' do
      it 'returns an empty array' do
        get base_url
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'when there are a large number of jobs' do
      before do
        create_list(:job, 1000)
      end

      it 'returns all jobs' do
        get base_url
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(1000)
      end
    end
  end

  describe 'GET /jobs/:id' do
    context 'when the job exists' do
      let(:job) { create(:job) }

      it 'returns the job' do
        get "#{base_url}/#{job.id}"
        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json['id']).to eq(job.id)
      end
    end

    context 'when the job does not exist' do
      it 'returns a not found error' do
        get "#{base_url}/9999"
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Job not found')
      end
    end
  end
end
