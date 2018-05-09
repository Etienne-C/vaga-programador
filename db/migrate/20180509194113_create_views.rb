class CreateViews < ActiveRecord::Migration[5.0]
  def change
    create_table :views do |t|
      t.string :sender
      t.string :opener
      t.integer :open_counter, :integer, default: 0

      t.timestamps
    end
  end
end
