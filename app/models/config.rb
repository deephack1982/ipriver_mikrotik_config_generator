class Config < ApplicationRecord
  belongs_to :config_template
  has_many :interfaces
end
