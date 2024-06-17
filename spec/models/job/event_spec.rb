# frozen_string_literal: true

require 'rails_helper'

describe Job::Event do
  describe 'relationships' do
    it { is_expected.to belong_to(:job) }
  end
end
