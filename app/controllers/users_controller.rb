class UsersController < ApplicationController
  expose(:user)
  before_action :redirect_if_not_owner, only: [:update]
  def show
  end

  def update
    if self.user.update(user_params)
      redirect_to user_url(user.id), notice: 'User was successfully updated.'
    else
      render action: 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def redirect_if_not_owner
    if user != current_user
      flash[:error] = 'You are not allowed to edit this user.'
      redirect_to user_url(user.id) and return
    end
  end
end