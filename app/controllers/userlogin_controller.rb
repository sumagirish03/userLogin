require 'bcrypt'

class UserloginController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        current_user = User.find_by_id(session)[:current_user_id]
        #render html: "hello db"
        render json: Userlogin.all 
    end
    def show 
        v = Userlogin.find(params[:id])
        render json: v
    end
    def create
          #v=!params[:name].empty? and !params[:email].empty? and params[:address].empty? and !params[:password].empty? and !params[:phone_number].empty? and !params[:role_id].nil?
          v = !params[:username].empty?
          if (v)
            p = Userlogin.create(
              'username': params[:username],
              'useremail': params[:useremail],
              'password': params[:password]
            )
            puts p
            render json: "User Created"
          else
          render json: "User does not exist"
          end
      end
    end