class AddReferenceToJob < ActiveRecord::Migration[7.1]
  def change
    add_reference :applications, :job, index: true
  end
end
