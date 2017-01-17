class CreateInterfaces < ActiveRecord::Migration[5.0]
  def change
    create_table :interfaces do |t|
      t.string :name
      t.string :ip
      t.string :subnet
      t.string :gateway
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
