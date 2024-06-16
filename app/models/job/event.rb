class Job::Event < ApplicationRecord
  self.table_name = 'job_events'
  belongs_to :job

  def self.types
    %w[Job::Event::Activated Job::Event::Deactivated]
  end
end
