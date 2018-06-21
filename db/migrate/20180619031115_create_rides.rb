class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides, id: :uuid do |t|
      t.integer :status, default: 0, null: false
      t.string :driver_id
      t.string :customer_id
      t.datetime :pick_up_time
      t.datetime :drop_time
      t.integer :lat
      t.integer :long
      t.integer :external_id, null: false

      t.timestamps
    end
    execute %(CREATE SEQUENCE rides_external_id_seq OWNED BY rides.external_id
START WITH 1)
    execute %(ALTER TABLE rides ALTER COLUMN external_id SET DEFAULT NEXTVAL
('rides_external_id_seq'))
  end
end
