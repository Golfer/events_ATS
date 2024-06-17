# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    full_name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    description { Faker::Lorem.paragraphs(number: 12).join('. ') }

  end

  trait :job_activated do
    job { create(:job_activated) }
  end

  trait :job_deactivated do
    job { create(:job_deactivated) }
  end

  factory :application_rejected, parent: :application do
    after :create do |application|
      Application::Event::Rejected.create(application: application)
    end
  end

  factory :application_interview, parent: :application do
    after :create do |application|
      application.interview_date = Faker::Date.forward(days: 1)
      Application::Event::Interview.create(application: application)
    end
  end

  factory :application_hire, parent: :application_interview do
    after :create do |application|
      application.hire_date = Faker::Date.forward(days: 1)
      Application::Event::Hired.create(application: application)
    end
  end
end
