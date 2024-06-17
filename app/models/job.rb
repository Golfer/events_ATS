# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :events, class_name: 'Job::Event', dependent: :destroy
  has_many :applications, dependent: :destroy
  validates :title, presence: true

  def status
    return 'activated' if event_type == 'Job::Event::Activated'
    return 'deactivated' if event_type == 'Job::Event::Deactivated'

    'deactivated'
  end

  def event_type
    events.order(created_at: :desc).first&.type
  end
end
