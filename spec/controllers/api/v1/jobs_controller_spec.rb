# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::JobsController do
  before do
    create(:job_activated)
    create(:job_activated)
    create(:job_deactivated)
  end

  describe "#index" do
    it {
      get :index
      expect(response).to have_http_status(200)
    }
    it {
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body.length).to be_present
    }
    it "status job_deactivated" do
      create(:job)
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body[-1]["status"]).to eql('deactivated')
    end
  end
end
