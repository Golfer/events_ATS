# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :events, as: :eventable, dependent: :destroy

  validates :title, presence: true

  def add_event(event_class, data = {})
    event_class.constantize.create(eventable: self, data: data)
  end

  def current_status
    return 'deactivated' if events.empty?

    return 'activated' if event_type == 'Job::Event::Activated'
    return 'deactivated' if event_type == 'Job::Event::Deactivated'

    'deactivated'
  end

  def event_type
    @event_type ||= events.order(created_at: :desc).first.type
  end

  def rejected_candidates
    events.where(type: 'Application::Event::Rejected').count
  end

  def hired_candidates
    events.where(type: 'Application::Event::Hired').count
  end

  def ongoing_applications
    events.where(type: ['Application::Event::Interview', 'Application::Event::Applied']).count
  end
end
