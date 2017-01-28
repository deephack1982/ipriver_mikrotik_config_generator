class Config < ApplicationRecord
  belongs_to :config_template
  has_many :interfaces, autosave: true, :inverse_of => :config, dependent: :destroy

  accepts_nested_attributes_for :interfaces

  validate :real_snmp_address

  validates :snmp_community, :snmp_contact, :snmp_location, :password, :system_name, presence: true

  def real_snmp_address
    if snmp_address.present? and not IPAddress.valid? snmp_address
      errors.add(:snmp_address, "Not valid SNMP address")
    end
  end
end
