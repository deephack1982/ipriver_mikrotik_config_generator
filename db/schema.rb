# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170117180948) do

  create_table "config_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.text     "config_text", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "system_name"
    t.string   "password"
    t.string   "snmp_community"
    t.string   "snmp_address"
    t.string   "snmp_contact"
    t.string   "snmp_location"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "template_id"
    t.integer  "config_template_id"
    t.index ["config_template_id"], name: "index_configs_on_config_template_id", using: :btree
    t.index ["template_id"], name: "index_configs_on_template_id", using: :btree
  end

  create_table "interfaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "subnet"
    t.string   "gateway"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "config_id"
    t.index ["config_id"], name: "index_interfaces_on_config_id", using: :btree
  end

  add_foreign_key "configs", "config_templates"
  add_foreign_key "interfaces", "configs"
end
