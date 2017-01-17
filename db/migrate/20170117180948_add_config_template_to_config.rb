class AddConfigTemplateToConfig < ActiveRecord::Migration[5.0]
  def change
    add_reference :configs, :config_template, foreign_key: true
  end
end
