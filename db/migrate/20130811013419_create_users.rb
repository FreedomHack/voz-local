class CreateUsers < ActiveRecord::Migration
  def up
  	create_table :users do |t|
  		t.string :email
  		t.string :first_name
  		t.string :last_name
  		t.string :password_hash
  		t.string :password_salt
  	end
  end

  def down
  	drop_table :users
  end
end
