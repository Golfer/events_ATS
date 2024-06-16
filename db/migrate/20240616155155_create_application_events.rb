class CreateApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_events do |t|
      t.string :type
      t.references :application, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
