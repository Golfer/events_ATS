# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    title { Faker::Job.title }
    descriptions { Faker::Lorem.paragraphs(number: rand(10..30)).join('. ') }
  end

  factory :job_deactivated, parent: :job do
    after :create do |job|
      Job::Event::Deactivated.create(job: job)
    end
  end

  factory :job_activated, parent: :job do
    after :create do |job|
      Job::Event::Activated.create(job: job)
    end
  end
end
