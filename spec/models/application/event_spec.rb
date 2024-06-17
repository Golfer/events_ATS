# frozen_string_literal: true

require 'rails_helper'

describe Application::Event do
  describe 'relationships' do
    it { is_expected.to belong_to(:application) }
  end
end
