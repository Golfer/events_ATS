# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :job
  has_many :events, class_name: 'Application::Event', dependent: :destroy

  validates :full_name, presence: true

  def status
    return 'interview' if event_type == 'Application::Event::Interview'
    return 'hired' if event_type == 'Application::Event::Hired'
    return 'rejected' if event_type == 'Application::Event::Rejected'

    'applied'
  end

  def event_type
    events.where.not(type: "Application::Event::Note").order(created_at: :desc).first&.type
  end

  def last_interview_date
    events.where(type: 'Application::Event::Interview').order(created_at: :desc).first&.created_at
  end

  def list_notes
    events.where(type: "Application::Event::Note").order(created_at: :desc)
  end
end
