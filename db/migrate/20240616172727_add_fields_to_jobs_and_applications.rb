class AddFieldsToJobsAndApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :hired, :integer, default: 0
    add_column :jobs, :rejected, :integer, default: 0
    add_column :jobs, :ongoing, :integer, default: 0
    add_column :applications, :notes, :integer, default: 0
  end
end
