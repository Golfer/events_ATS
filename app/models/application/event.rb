class Application::Event < ApplicationRecord
  self.table_name = 'application_events'
  belongs_to :application

  after_create :create_initial_event

  def self.types
    %w[Application::Event::Interview Application::Event::Hired Application::Event::Rejected Application::Event::Note]
  end


  def create_initial_event
    if self.type == "Application::Event::Note"
      self.application.notes += 1
      return self.application.save!
    end

    self.application.job.ongoing += 1 if self.type == "Application::Event::Interview"
    self.application.job.rejected += 1 if self.type == "Application::Event::Rejected"
    self.application.job.hired += 1 if self.type == "Application::Event::Hired"
    self.application.job.save!
  end
end
