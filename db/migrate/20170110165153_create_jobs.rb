class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :company
      t.string :city
      t.string :state
      t.string :country
      t.datetime :published_date
      t.text :description
      t.integer :latitude
      t.integer :longitude
      t.string :jobkey
      t.boolean :expired
      t.string :source
      t.string :url

      t.timestamps
    end
  end
end
