require "uri"
require "net/https"
require "json"

module Latest
  class Gem
    
    class NameParseError   < StandardError; end
    class GemNotFoundError < StandardError; end
    class RequestError     < StandardError; end
    
    attr_reader :name, :pre, :response, :downloads
    
    def initialize(name)
      @name, @pre = parse_name(name)
      self
    end
    
    def fetch
      @response = send_request
      parse_response
    end
    
    def versions
      @versions ||= fetch
    end
    
    def version
      @version ||= parse_versions
    end
    
    def pre=(value)
      @pre = !!value
      @version = parse_versions
    end
    
  private
    
    def url
      @url ||= "https://rubygems.org/api/v1/versions/#{name}.json"
    end
    
    def uri
      @uri ||= URI.parse(url)
    end
    
    def send_request
      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Get.new uri.request_uri      
        http.request(request)
      end
    end
  
    def parse_name(name)
      names = name.split(" ")
      case names.length
        when 1; [ names.first, false ]
        when 2
          return [ names.first, true ] if names.last == "--pre"
          raise Latest::Gem::NameParseError.new("Invalid prerelease flag. Try `latest #{names.first} --pre`")
        else raise Latest::Gem::NameParseError.new("Argument error, #{names.length} for 1-2")
      end
    end
    
    def parse_response
      case @response
        when Net::HTTPSuccess
          @versions = JSON.parse(@response.body)
        when Net::HTTPNotFound
           raise Latest::Gem::GemNotFoundError.new("`#{name}` could not be found on rubygems.org")
        else
          raise Latest::Gem::RequestError.new("An error occured while fetching `#{name}. Rubygems.org responded with status #{@response.code}")
      end
      @versions
    end
   
    def parse_versions
      @version = "(not found)"
      versions.each do |v|
        next unless v["prerelease"] == pre
        @version   = v["number"]
        @downloads = v["downloads_count"]
        break
      end
      @version
    end
      
  end
end
