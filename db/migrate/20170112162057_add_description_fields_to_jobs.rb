class AddDescriptionFieldsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company_description, :text
    add_column :jobs, :contract, :string
    add_column :jobs, :salary, :string
    add_column :jobs, :candidate_description, :text
  end
end
