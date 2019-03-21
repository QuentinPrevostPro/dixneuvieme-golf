class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_all = User.all
    @carsharing = Carsharing.all
    @passenger_array = []
    @passenger_id_array = []
  end
  def destroy
    User.find(params[:id]).destroy
    Carsharing.all.where(driver_id:params[:id]).each {|carsharing| carsharing.destroy}
    Carsharingreview.all.where(passenger_id:params[:id]).each {|review| review.destroy}
    Golfcomment.all.where(user_id:params[:id]).each {|comment| comment.destroy}
    Privatemessage.all.where(sender_id:params[:id]).each {|message| message.destroy}
    Privatemessage.all.where(recipient_id:params[:id]).each {|messagess| message.destroy}
    flash[:success] = "Profil supprimé"
    redirect_to root_path
  end
end
