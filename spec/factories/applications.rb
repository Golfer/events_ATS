# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    full_name { 'test Applicant' }
    interview_date { '2024-06-15 13:49:29' }
    hire_date { '2024-06-15 13:49:29' }
    description { 'MyString' }
  end
end
