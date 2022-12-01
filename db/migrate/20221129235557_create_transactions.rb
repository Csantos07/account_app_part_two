class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :balance
      t.string :name
      t.string :type
      t.string :date
      t.string :recurring
      t.belongs_to :user, type: :uuid
      t.belongs_to :account, type: :uuid

      t.timestamps
    end
  end
end
