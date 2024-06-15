# frozen_string_literal: true

class Application < ApplicationRecord
  has_many :events, as: :eventable, dependent: :destroy

  validates :full_name, presence: true

  def add_event(event_class, data = {})
    event_class.constantize.create(eventable: self, data: data)
  end

  def current_status
    return 'applied' if events.empty?

    return 'interview' if event_type == 'Job::Event::Interview'
    return 'hired' if event_type == 'Job::Event::Hired'
    return 'rejected' if event_type == 'Job::Event::Rejected'
    return 'note' if event_type == 'Job::Event::Note'

    'applied'
  end

  def event_type
    @event_type ||= events.order(created_at: :desc).first.type
  end

  def last_interview_date
    events.where(type: 'Application::Event::Interview').order(created_at: :desc).first&.created_at
  end
end
