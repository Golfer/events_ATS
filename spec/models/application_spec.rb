# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do

  it { is_expected.to validate_presence_of(:full_name) }

  describe 'relationships' do
    it { is_expected.to belong_to(:job) }
    it { is_expected.to have_many(:events) }
  end
end
