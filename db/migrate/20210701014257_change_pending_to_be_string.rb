class ChangePendingToBeString < ActiveRecord::Migration[6.1]
  def change
    change_column :records, :pending, :string
  end
end
