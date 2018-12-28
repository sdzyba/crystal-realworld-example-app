class CreateUsers
  include Clear::Migration

  def change(dir)
    create_table "users" do |t|
      t.string "email", unique: true, null: false
      t.string "encrypted_password", null: false
      t.string "username", unique: true
      t.string "image"
      t.string "bio"

      t.datetime "created_at", null: false, default: "NOW()"
      t.datetime "updated_at", null: false, default: "NOW()"
    end
  end
end
