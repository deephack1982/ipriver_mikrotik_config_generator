class Config < ApplicationRecord
  belongs_to :config_template
  has_many :interfaces, autosave: true, :inverse_of => :config

  accepts_nested_attributes_for :interfaces
end
