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

ActiveRecord::Schema.define(version: 20170610213345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "servant_classes", force: :cascade do |t|
    t.string  "name"
    t.string  "icon"
    t.integer "sort_order"
  end

  create_table "servants", force: :cascade do |t|
    t.integer  "official_id"
    t.string   "name"
    t.integer  "rarity"
    t.integer  "servant_class_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "avatar"
    t.json     "portraits"
    t.integer  "cost",             default: 0,     null: false
    t.integer  "base_hp",          default: 0,     null: false
    t.integer  "base_atk",         default: 0,     null: false
    t.integer  "max_hp",           default: 0,     null: false
    t.integer  "max_atk",          default: 0,     null: false
    t.integer  "buster_cards",     default: 0,     null: false
    t.integer  "quick_cards",      default: 0,     null: false
    t.integer  "arts_cards",       default: 0,     null: false
    t.boolean  "unlockable",       default: false, null: false
    t.boolean  "limited",          default: false, null: false
    t.boolean  "unplayable",       default: false, null: false
    t.text     "comments",         default: [],    null: false, array: true
    t.string   "traits",           default: [],    null: false, array: true
    t.index ["servant_class_id"], name: "index_servants_on_servant_class_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.string  "taggable_type"
    t.integer "taggable_id"
    t.integer "tag_id"
    t.index ["tag_id", "taggable_id"], name: "index_taggings_on_tag_id_and_taggable_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "tag_id"], name: "index_taggings_on_taggable_id_and_tag_id", using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  add_foreign_key "servants", "servant_classes"
  add_foreign_key "taggings", "tags"
end
