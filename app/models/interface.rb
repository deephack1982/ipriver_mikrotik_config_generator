class Interface < ApplicationRecord
  belongs_to :config

  TYPE = ['unused','ppp','ethernet']
end
