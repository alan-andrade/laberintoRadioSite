class Shoutcast
  include HTTParty

   base_uri   Yetting.shoutcast['base']

  class Admin < self
    URL = { listeners: '/admin.cgi?sid=1&mode=viewxml&page=3' }

    basic_auth Yetting.shoutcast['auth']['username'], Yetting.shoutcast['auth']['password']

    def self.get_listeners
      get( URL[:listeners] )
    end
  end

  class Public
    URLS = { stats: '/stats' }
  end

end
