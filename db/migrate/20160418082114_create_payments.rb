class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.datetime :date, null: false
      t.integer :category, default: 0, null: false
      t.integer :unit, default: 0, null: false
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :payments, [:user_id, :book_id]
  end
end
