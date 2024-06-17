class Application::Event < ApplicationRecord
  self.table_name = 'application_events'
  belongs_to :application

  after_create :create_initial_event

  def self.types
    %w[Application::Event::Interview Application::Event::Hired Application::Event::Rejected Application::Event::Note]
  end


  def create_initial_event
    # byebug
    if type == "Application::Event::Note"
      application.notes += 1
      application.save
    end

    application.job.ongoing += 1 if type == "Application::Event::Interview"
    application.job.rejected += 1 if type == "Application::Event::Rejected"
    application.job.hired += 1 if type == "Application::Event::Hired"
    application.job.save
  end
end
