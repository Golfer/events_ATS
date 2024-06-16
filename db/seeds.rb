# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

5.times do
  job = Job.create(title: Faker::Job.title, descriptions: Faker::Lorem.paragraphs(number: rand(10..30)).join('. '))
  %w[Job::Event::Activated Job::Event::Deactivated].sample.constantize.create(job: job)
end

def jobs
  Job.all
end

jobs.each do |job|
  rand(1..10).times do
    status = %w[Application::Event::Interview Application::Event::Rejected]
    interview_date = rand(1..3)
    hire_date = rand(4..7)
    application = Application.create(full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}", description: Faker::Lorem.paragraphs(number: 12).join('. '), job: job)
    if [true, false].sample
      rand(1..3).times do
        Application::Event::Note.create(application: application, content: Faker::Lorem.sentences(number: rand(1..9)).join('. ') )
      end
    end
    event_type = status.shuffle!.shift
    event_type.constantize.create(application: application)

    if event_type.scan(/Interview/i).last.present?
      application.update(interview_date: Faker::Date.forward(days: interview_date))
      if [true, false].sample
        Application::Event::Hired.create(application: application)
        application.update(hire_date:  Faker::Date.forward(days: hire_date))
      end
    end
  end
end
