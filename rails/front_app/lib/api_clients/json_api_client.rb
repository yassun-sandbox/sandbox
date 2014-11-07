module JsonApiClient

  def get_json(paths=[], query_hash={})
    api_url= "http://localhost"
    paths.each { | path | api_url = File.join(api_url, path) }
    uri = URI.parse(api_url)

    uri.query = query_hash.to_param
    uri.port = 3333

    begin
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.get(uri.request_uri)
      end

      case response
      when Net::HTTPSuccess
        json = response.body
        JSON.parse(json)
      else
        puts [uri.to_s, response.value].join(" : ")
        nil
      end
    rescue => e
      puts [uri.to_s, e.class, e].join(" : ")
      nil
    end
  end

  module_function :get_json

end
