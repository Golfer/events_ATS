# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :full_name
      t.datetime :interview_date
      t.datetime :hire_date
      t.string :description

      t.timestamps
    end

    add_index(:applications, :full_name)
  end
end
