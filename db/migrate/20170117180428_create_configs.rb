class CreateConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :configs do |t|
      t.string :system_name
      t.string :password
      t.string :snmp_community
      t.string :snmp_address
      t.string :snmp_contact
      t.string :snmp_location

      t.timestamps
    end
  end
end
