class CreateAllTables < ActiveRecord::Migration[7.0]
  def change

    create_table "admins", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admins_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    end

    create_table "images", force: :cascade do |t|
      t.text "url"
      t.integer "order"
      t.integer "phone_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["phone_id"], name: "index_images_on_phone_id"
    end

    create_table "phones", force: :cascade do |t|
      t.string "name"
      t.text "description"
      t.float "price"
      t.text "url"
      t.integer "seller_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "publish"
      t.string "slug"
      t.index ["seller_id"], name: "index_phones_on_seller_id"
      t.index ["slug"], name: "index_phones_on_slug", unique: true
    end

    create_table "phones_property_values", id: false, force: :cascade do |t|
      t.integer "phone_id"
      t.integer "property_value_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["phone_id"], name: "index_phones_property_values_on_phone_id"
      t.index ["property_value_id"], name: "index_phones_property_values_on_property_value_id"
    end

    create_table "properties", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "order"
      t.integer "property_group_id"
      t.boolean "key_feature"
      t.index ["property_group_id"], name: "index_properties_on_property_group_id"
    end

    create_table "property_groups", force: :cascade do |t|
      t.string "name"
      t.integer "order"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "property_values", force: :cascade do |t|
      t.string "property_data"
      t.integer "property_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["property_id"], name: "index_property_values_on_property_id"
    end

    create_table "sellers", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_foreign_key "images", "phones", column: "phone_id"
  end

end
