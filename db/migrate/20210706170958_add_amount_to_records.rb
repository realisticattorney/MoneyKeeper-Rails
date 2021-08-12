class AddAmountToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :amount, :integer
  end
end
