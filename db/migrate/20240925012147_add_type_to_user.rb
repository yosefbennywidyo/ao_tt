class AddTypeToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :type, :string
  end
end
