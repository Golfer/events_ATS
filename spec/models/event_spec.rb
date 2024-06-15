# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'relationships' do
    it { expect(subject).to have_attribute :type }
    it { expect(subject).to be_a_kind_of described_class }
  end
end
