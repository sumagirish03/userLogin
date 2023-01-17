class CreateUserlogin < ActiveRecord::Migration[7.0]
  def change
    create_table :userlogins do |t|
      t.string :username
      t.string :useremail
      t.string :password_digest
      
      t.timestamps
    end
  end
end
