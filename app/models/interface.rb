class Interface < ApplicationRecord
  belongs_to :config

  TYPE = ['unused','ppp','ethernet']

  with_options if: "interface_type == 'ethernet'" do |ethernet|
    ethernet.validates :ip, :subnet, presence: true
  end

  with_options if: "interface_type == 'ppp'" do |ppp|
      ppp.validates :username, :password, presence: true
  end

  validate :real_ip_address, :real_gateway_address

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
end
