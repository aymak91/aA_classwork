class ChangeDescription < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cats, :description, true
  end
end