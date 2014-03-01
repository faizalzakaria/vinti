
class Reminder

  def self.feed(msg)
    me = FbGraph::User.me(session['facebook_access_token'])
    me.feed!(
      :message => msg,
      )
  end

end
