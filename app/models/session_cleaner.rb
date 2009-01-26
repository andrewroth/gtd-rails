class SessionCleaner
  def self.remove_stale_sessions
    timeout = 720.minutes.ago
    CGI::Session::ActiveRecordStore::Session.destroy_all( ['updated_at < ? ', timeout] ) 
  end
end