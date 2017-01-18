class AddTypeToInterface < ActiveRecord::Migration[5.0]
  def change
    add_column :interfaces, :interface_type, :string
  end
end
