# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    type { '' }
    eventable { nil }
    data { '' }
    note { 'MyText' }
  end
end
