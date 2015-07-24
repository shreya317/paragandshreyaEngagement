class GuestsController < ApplicationController
  def index
  end

  def retrieve_guest
    guest = Guest.where({first_name: params[:first_name], last_name: params[:last_name], zip_code: params[:zip_code]}).first
    if guest.encrypted_id
      redirect_to "/guests/#{guest.encrypted_id}"
    else
      guest.encrypted_id = Digest::SHA2.hexdigest(guest.id.to_s)
      guest.save
      redirect_to "/guests/#{guest.encrypted_id}"
    end
  end

  def show
    @guest = Guest.find_by(encrypted_id: params[:id])
    @family_members = Guest.where(family_id: @guest.family_id)
  end

  def update_all
    params["guest"].keys.each do |id|
      @guest = Guest.find(id.to_i)
      attending = params["guest"][id][:attending] == "true" ?  true : false
      comments = params["guest"][id][:comments]
      @guest.update_attributes(attending: attending)
      @guest.update_attributes(comments: comments)
      @guest.save
    end
    redirect_to "/welcome/index"
  end

  private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :zip_code, :attending, :comments)
  end
end
