class ProfilsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    if params[:id].to_i == current_user.id
      @user = current_user
    else 
      @user = User.find(params[:id])
    end
  end

end
