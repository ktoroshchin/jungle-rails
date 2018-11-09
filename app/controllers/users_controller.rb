class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.password == @user.password_confirmation

      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
          UserMailer.welcome_email(@user.id).deliver_now
          session[:user_id] = @user.id

          format.html { redirect_to('/', notice: 'User was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end



    else
      redirect_to '/signup'

    end
  end




private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
