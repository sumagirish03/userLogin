class Userlogin < ApplicationRecord
    has_secure_password
    #validates : name, :password, :address, :phone_number, :role_id, :email, presence: true
end
