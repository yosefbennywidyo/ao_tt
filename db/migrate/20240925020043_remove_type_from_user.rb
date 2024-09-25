class RemoveTypeFromUser < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :type, :string
  end
end
