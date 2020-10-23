class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.belongs_to :account, null: false, foreign_key: true
      # t.integer :account_id
      t.datetime :date
      t.date :due_date
      t.boolean :status
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
