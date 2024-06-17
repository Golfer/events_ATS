# frozen_string_literal: true

require 'rails_helper'

describe Job do
  it { is_expected.to validate_presence_of(:title) }

  describe 'relationships' do
    it { is_expected.to have_many(:events) }
    it { is_expected.to have_many(:applications) }
  end
end
