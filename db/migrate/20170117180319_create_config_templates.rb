class CreateConfigTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :config_templates do |t|
      t.string :name
      t.string :description
      t.text :config_text

      t.timestamps
    end
  end
end
