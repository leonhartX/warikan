class ChangeDefaultToBooks < ActiveRecord::Migration[5.0]
  def change
    change_column_default :books, :total, 0
    change_column_default :books, :member, 1
  end
end
