class Notifications < ActionMailer::Base
  default from: "support@movieswithfriends.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_movie.subject
  #
  def new_movie(movie)
    @greeting = "Hey"
    @movie_name = movie.title
    @id = movie.id
    @event = Event.find(movie.event_id).event_name
    @event_creator = User.find(Event.find(movie.event_id).creator_id).name
    mail to: User.find(Event.find(movie.event_id).creator_id).email
  end

  def attended(attend)
    @greeting = "Hey check this out!"
    @attendee = attend.attendee.name
    @id = attend.attendee_id
    @eventid = attend.event_attending_id
    @eventtitle = Event.find(attend.event_attending_id).event_name

    mail to: User.find(attend.event_attending.creator_id).email
  end
end
