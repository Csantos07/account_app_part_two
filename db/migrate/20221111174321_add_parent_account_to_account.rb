class AddParentAccountToAccount < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :parent_account, type: :uuid, foreign_key: { to_table: :accounts }
  end
end
