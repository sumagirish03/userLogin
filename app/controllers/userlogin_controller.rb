require 'bcrypt'

class UserloginController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
       # current_user = Userlogin.find_by_id(session)[:current_user_id]
        #render html: "hello db"
        render json: Userlogin.all 
        #render json: current_user
    end
    def show
        v = Userlogin.find(params[:id])
        render json: v
    end
    def create
          #v=!params[:username].empty? and !params[:useremail].empty? and !params[:password].empty?
          v = !params[:username].empty?
          if (v)
            p = Userlogin.create(
              'username': params[:username],
              'useremail': params[:useremail],
              'password': params[:useremail]
            )
            puts p
            render json: "User Created"
          else
          render json: "User does not exist"
          end
    end
    def update
        v = Userlogin.exists?(params[:id])
        puts v
        if (v)
          s = Userlogin.find_by_id(params[:id])
          s.update('username': params[:username], 'useremail': params[:useremail], 'password': params[:password])
          render json: "User details updated"
        else
          render json: "User does not exist"
        end
    end
    def destroy
      v = Userlogin.exists?(params[:id])
      if(v)
        u = Userlogin.find_by_id(params[:id])
        u.destroy
        render json: "User deleted"
      else
        render json: "User not found"
      end
    end
end