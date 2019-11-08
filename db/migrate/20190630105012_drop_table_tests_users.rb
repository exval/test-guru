class DropTableTestsUsers < ActiveRecord::Migration[5.2]
  def up
  	drop_table :user_test, if_exists: true
  end
end
