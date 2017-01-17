json.extract! config, :id, :system_name, :password, :snmp_community, :snmp_address, :snmp_contact, :snmp_location, :created_at, :updated_at
json.url config_url(config, format: :json)