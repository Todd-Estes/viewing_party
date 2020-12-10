class PartiesController < ApplicationController
  def new
    @movie_id = params[:id].to_i

    @details = SearchFacade.details(@movie_id)
  end

  def create
    user = User.find(current_user.id)
    day = params[:day].values.join('/')
    start_time = params[:start_time].values.join(':')

    @party = Party.create!(
      movie_title: params[:movie_title],
      duration: params[:duration],
      day: day,
      start_time: start_time,
      user_id: user.id
    )

    party_guests = params[:friend_ids]
    party_guests.each do |guest_id|
      @party.guests.create!(user_id: guest_id.to_i)
    end
    redirect_to dashboard_path
  end
end
