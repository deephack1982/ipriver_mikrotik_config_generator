class ConfigTemplate < ApplicationRecord
  has_many :configs

  validates :name, :description, :config_text, presence: true
end
