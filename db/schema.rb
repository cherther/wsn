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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110104205516) do

  create_table "catalogs", :force => true do |t|
    t.string   "catalog_name",       :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id",                           :null => false
    t.integer  "contact_type_id",                   :null => false
    t.binary   "is_default",         :limit => 255, :null => false
    t.string   "contact_name",       :limit => 100
    t.string   "company_name",       :limit => 100
    t.string   "address_1",          :limit => 100
    t.string   "address_2",          :limit => 100
    t.string   "city",               :limit => 100
    t.string   "state_region",       :limit => 50
    t.string   "postal_code",        :limit => 50
    t.string   "country",            :limit => 50
    t.string   "phone_1",            :limit => 50
    t.string   "phone_2",            :limit => 50
    t.string   "fax",                :limit => 50
    t.string   "email",              :limit => 250
    t.string   "admin_email",        :limit => 250
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "contents", :force => true do |t|
    t.integer  "catalog_id",                          :null => false
    t.binary   "is_controlled_allin", :limit => 255,  :null => false
    t.string   "title",               :limit => 300,  :null => false
    t.string   "artist",              :limit => 300,  :null => false
    t.string   "writers",             :limit => 500
    t.integer  "pop"
    t.integer  "country"
    t.integer  "release_year"
    t.string   "record_label",        :limit => 300
    t.text     "lyrics"
    t.text     "lyrics_index"
    t.text     "notes"
    t.text     "keywords"
    t.text     "similar_songs"
    t.text     "licensing_notes"
    t.text     "sounds_like"
    t.string   "instruments",         :limit => 5000
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "contents_lists", :id => false, :force => true do |t|
    t.integer "list_id",    :null => false
    t.integer "content_id", :null => false
  end

  create_table "contents_tags", :id => false, :force => true do |t|
    t.integer "content_id", :null => false
    t.integer "tag_id",     :null => false
  end

  create_table "invitations", :force => true do |t|
    t.string   "invitation_email_address",                :null => false
    t.datetime "expiration_date",                         :null => false
    t.integer  "invitation_status",        :limit => 2,   :null => false
    t.integer  "user_id"
    t.binary   "is_plan_invitation",       :limit => 255, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "lists", :force => true do |t|
    t.integer  "user_id",                                                          :null => false
    t.string   "list_name",                                                        :null => false
    t.integer  "number_items"
    t.decimal  "compressed_size",                   :precision => 28, :scale => 4
    t.string   "archive_name",       :limit => 256
    t.binary   "is_last_processed",  :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
    t.integer  "contents_count"
  end

  create_table "media", :force => true do |t|
    t.integer  "content_id",                        :null => false
    t.integer  "media_version",                     :null => false
    t.datetime "media_date",                        :null => false
    t.binary   "is_remote",          :limit => 255, :null => false
    t.string   "media_type",         :limit => 5
    t.integer  "media_bitrate"
    t.integer  "media_size",         :limit => 8
    t.integer  "media_length",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "plan_balances", :force => true do |t|
    t.integer  "pricing_plan_id",          :null => false
    t.integer  "number_of_songs",          :null => false
    t.integer  "number_of_invited_users",  :null => false
    t.integer  "number_of_catalog_admins", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "pricing_plans", :force => true do |t|
    t.string   "pricing_plan_name",                                                      :null => false
    t.string   "promo_message"
    t.binary   "is_promo",                 :limit => 255,                                :null => false
    t.binary   "is_featured",              :limit => 255,                                :null => false
    t.binary   "is_enabled",               :limit => 255,                                :null => false
    t.binary   "show_on_site",             :limit => 255,                                :null => false
    t.decimal  "plan_charge",                             :precision => 28, :scale => 4
    t.string   "plan_recurrance"
    t.integer  "number_of_songs"
    t.integer  "number_of_invited_users"
    t.integer  "number_of_catalog_admins"
    t.binary   "custom_contactus",         :limit => 255,                                :null => false
    t.binary   "custom_siteprofile",       :limit => 255,                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "privileges", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "catalog_id", :null => false
    t.integer "role_id",    :null => false
  end

  create_table "representations", :force => true do |t|
    t.integer  "content_id",                                          :null => false
    t.integer  "rights_type_id",                                      :null => false
    t.decimal  "representation_share", :precision => 28, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "representations_territories", :id => false, :force => true do |t|
    t.integer "representation_id", :null => false
    t.integer "territory_id",      :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role_name",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "search_properties", :force => true do |t|
    t.string   "property_name",          :limit => 50,  :null => false
    t.string   "display_name",           :limit => 100, :null => false
    t.string   "short_name",             :limit => 50,  :null => false
    t.string   "search_group",           :limit => 50
    t.integer  "search_menu_order",                     :null => false
    t.integer  "search_type_id",         :limit => 2
    t.string   "search_predicate",       :limit => 50
    t.string   "property_type",          :limit => 50,  :null => false
    t.string   "lookup_name",            :limit => 50
    t.string   "list_name",              :limit => 10
    t.integer  "access_level",           :limit => 2,   :null => false
    t.binary   "is_listable",            :limit => 255, :null => false
    t.binary   "is_cacheable",           :limit => 255, :null => false
    t.binary   "is_indexable",           :limit => 255, :null => false
    t.binary   "include_in_search_menu", :limit => 255, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "site_profiles", :force => true do |t|
    t.string   "profile_name",         :limit => 50,  :null => false
    t.string   "company_name",         :limit => 100, :null => false
    t.string   "contact_address_1",    :limit => 100, :null => false
    t.string   "contact_address_2",    :limit => 100
    t.string   "contact_city",         :limit => 100, :null => false
    t.string   "contact_state_region", :limit => 50,  :null => false
    t.string   "contact_postal_code",  :limit => 50,  :null => false
    t.string   "contact_country",      :limit => 50,  :null => false
    t.string   "contact_phone",        :limit => 50,  :null => false
    t.string   "contact_fax",          :limit => 50
    t.string   "contact_email",        :limit => 250, :null => false
    t.string   "admin_email",          :limit => 250, :null => false
    t.binary   "has_profile_logo",     :limit => 255, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "pricing_plan_id",                                        :null => false
    t.integer  "user_id",                                                :null => false
    t.datetime "subscription_start_date",                                :null => false
    t.datetime "subscription_end_date"
    t.decimal  "plan_charge",             :precision => 28, :scale => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag_name",           :limit => 100, :null => false
    t.integer  "tag_type_id",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "territories", :force => true do |t|
    t.string   "territory_code",     :limit => 50,  :null => false
    t.string   "territory_name",     :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
  end

  create_table "user_catalogs", :id => false, :force => true do |t|
    t.integer "user_id",    :null => false
    t.integer "catalog_id", :null => false
    t.integer "role_id",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_name",                                    :null => false
    t.string   "password_hash"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "parent_user_id"
    t.integer  "plan_user_id",                                 :null => false
    t.integer  "role_id",                                      :null => false
    t.integer  "site_profile_id",                              :null => false
    t.integer  "pricing_plan_id",                              :null => false
    t.integer  "plan_balance_id",                              :null => false
    t.binary   "invitation_id",                :limit => 255
    t.datetime "registered_on",                                :null => false
    t.string   "signature",                    :limit => 1000
    t.binary   "show_debug_info",              :limit => 255
    t.binary   "append_signature_to_title",    :limit => 255,  :null => false
    t.binary   "has_agreed_to_privacy_policy", :limit => 255,  :null => false
    t.binary   "has_allowed_communication",    :limit => 255,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_user_id"
    t.integer  "updated_by_user_id"
    t.string   "salt"
  end

  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end
