# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ApplicationsController do

  before do
    create(:application, :job_activated)
    create(:application_rejected, :job_activated)
    create(:application_interview, :job_activated)
    create(:application_interview, :job_deactivated)
    create(:application_hire, :job_activated)
  end

  describe "#index" do
    before do

    end
    it {
      get :index
      expect(response).to have_http_status(200)
    }
    it {
      get :index
      response_body = JSON.parse(response.body)
      expect(response_body.length).to be_present
    }

    it 'Application has notes' do
      application = create(:application_interview, :job_activated)
      Application::Event::Note.create(application: application, content: Faker::Lorem.sentences(number: rand(1..9)).join('. ') )
      Application::Event::Note.create(application: application, content: Faker::Lorem.sentences(number: rand(1..9)).join('. ') )

      get :index
      response_body = JSON.parse(response.body)
      expect(response_body[-1]["count_notes"]).not_to be_nil
    end
  end
end
