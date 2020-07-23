class UsersController < ApplicationController
  def myfeed
    @userposts = User.find(params[:id]).posts
    @userid = User.find(params[:id]).id
  end

  def myfriends
    @userposts = User.find(params[:id]).posts
    @user_id = User.find(params[:id]).id
  end
end
