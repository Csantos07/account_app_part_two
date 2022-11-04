class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.uuid :user_id, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :balance

      t.timestamps
    end
  end
end
