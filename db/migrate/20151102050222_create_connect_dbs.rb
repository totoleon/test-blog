class CreateConnectDbs < ActiveRecord::Migration
  def change
    create_table :connect_dbs do |t|

      t.timestamps null: false
    end
  end
end
