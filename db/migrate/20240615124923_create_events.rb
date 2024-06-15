# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :type
      t.references :eventable, polymorphic: true, null: false
      t.jsonb :data
      t.text :note

      t.timestamps
    end

    add_index(:events, %i[eventable_type eventable_id])
  end
end
