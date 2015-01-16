class CreateUsersData < ActiveRecord::Migration
  def change
  	create_table :users do |t|
      t.string  :name
      t.string  :username
      t.string  :password
      t.string  :email
      t.string	:mobile_no
      t.string  :location 
      t.timestamps
	end

    add_index :users, :name
    add_index :users, :mobile_no
   end

end
