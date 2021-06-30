class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :flow_direction
      t.string :frequency
      t.string :time_span
      t.boolean :pending
      t.boolean :savings
      t.string :category
      t.text :description
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
