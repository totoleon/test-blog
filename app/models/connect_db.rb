class ConnectDb < ActiveRecord::Base
  establish_connection(:test)
  self.table_name 'my_external_table'
end
