require 'addressable/uri'
require 'rest-client'


def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html?name=michael'
    ).to_s

    puts RestClient.post(url)
end

index_users
