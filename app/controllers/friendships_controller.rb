class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
    @all_users = User.all.compact
    @all_users.delete(current_user)
  end

  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to myfriends_user_path(params[:user_id]), notice: 'Friendship was successfully created.' }
      else
        format.html { redirect_to myfriends_user_path(params[:user_id]), notice: 'Friendship failed to be created.' }
      end
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id]) # returns a list/array
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
