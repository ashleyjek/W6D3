class UsersController < ApplicationController
    def index
        if params[:username]
            users = User.where(username: params[:username])
            render json: users
        else
            render json: User.all
        end
    end

   
    def create
        user = User.new(params.require(:user).permit(:username))
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update 

        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user_url(user)
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end 

    end 



    def destroy 
        user = User.find(params[:id])
        user.destroy
        redirect_to users_url
    end 

    private 
    def user_params
        params.require(:user).permit(:username)
    end 



end