class CreateInvolvements < ActiveRecord::Migration[5.0]
  def change
    create_table :involvements do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
    
    add_index :involvements, [:user_id, :book_id], unique: true
  end
end
