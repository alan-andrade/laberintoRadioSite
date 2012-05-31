class Shoutcast
  include HTTParty

  basic_auth Yetting.shoutcast['auth']['username'], Yetting.shoutcast['auth']['password']
  base_uri   Yetting.shoutcast['base']


  def self.get_listeners
    get( '/admin.cgi?sid=1&mode=viewxml&page=3' )
  end

end
