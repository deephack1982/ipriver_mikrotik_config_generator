class AddConfigToInterface < ActiveRecord::Migration[5.0]
  def change
    add_reference :interfaces, :config, foreign_key: true
  end
end
