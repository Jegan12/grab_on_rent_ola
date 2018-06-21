class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone_no
      t.string :type
      t.integer :lat
      t.integer :long
      t.integer :external_id, null: false
      t.timestamps
    end
    execute %(CREATE SEQUENCE users_external_id_seq OWNED BY users.external_id
 START WITH 1)
    execute %(ALTER TABLE users ALTER COLUMN external_id SET DEFAULT NEXTVAL
('users_external_id_seq'))
  end
end
