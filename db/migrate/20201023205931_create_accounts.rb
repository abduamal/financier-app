class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :user
      # t.integer :user_id
      t.string :name
      t.text :description
      t.integer :credit_limit
      t.float :balance
      t.float :account_number
      t.boolean :status

      t.timestamps
    end
  end
end
