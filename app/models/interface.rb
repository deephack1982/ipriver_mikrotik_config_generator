class Interface < ApplicationRecord
  belongs_to :config

  TYPE = ['unused','ppp','ethernet-wan','ethernet-lan','sfp-wan']

  with_options if: "interface_type == 'ethernet-wan'" || "interface_type == 'sfp-wan'" do |ethernet|
    ethernet.validates :ip, :subnet, :gateway, presence: true
  end

  with_options if: "interface_type == 'ethernet-lan'" do |ethernet|
    ethernet.validates :ip, :subnet, presence: true
  end

  with_options if: "interface_type == 'ppp'" do |ppp|
      ppp.validates :username, :password, presence: true
  end

  validate :real_ip_address, :real_gateway_address, :real_subnet_definition

  def real_ip_address
    if ip.present? and not IPAddress.valid? ip
      errors.add(:ip, "Not valid IP address")
    end
  end

  def real_gateway_address
    if gateway.present? and not IPAddress.valid? gateway
      errors.add(:gateway, "Not valid gateway address")
    end
  end

  def real_subnet_definition
    if subnet.present? and not subnet.is_a? Integer and not subnet.length == 2
      errors.add(:subnet, "Not a valid subnet, use CIDR notation")
    end
  end
end
