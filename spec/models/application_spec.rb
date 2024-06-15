# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:events) }
  end
end
