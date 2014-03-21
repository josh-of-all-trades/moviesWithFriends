class Notifications < ActionMailer::Base
  default from: "movieswithfriends@example.com"

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
    @event_creator = User.find(Event.find(movie.event_id)).name
    mail to: User.find(Event.find(movie.event_id)).email
  end
end
