# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :descriptions

      t.timestamps
    end

    add_index(:jobs, :title)
  end
end
