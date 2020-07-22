class UsersController < ApplicationController
  def myfeed
    @userposts = User.find(params[:id]).posts
  end
end
