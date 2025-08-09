require "latest"
require "minitest/autorun"

FAKE_VERSIONS = [
  {"authors"=>"Bogus", "built_at"=>"2011-10-22T00:00:00Z", "description"=>"Bogus...", "downloads_count"=>10000, "number"=>"1.0.1",     "summary"=>"Bogus", "platform"=>"ruby", "prerelease"=>false},
  {"authors"=>"Bogus", "built_at"=>"2011-06-05T00:00:00Z", "description"=>"Bogus...", "downloads_count"=>1000,  "number"=>"1.0.0",     "summary"=>"Bogus", "platform"=>"ruby", "prerelease"=>false},
  {"authors"=>"Bogus", "built_at"=>"2011-06-01T00:00:00Z", "description"=>"Bogus...", "downloads_count"=>100,   "number"=>"1.0.0.rc1", "summary"=>"Bogus", "platform"=>"ruby", "prerelease"=>true},
  {"authors"=>"Bogus", "built_at"=>"2011-05-20T00:00:00Z", "description"=>"Bogus...", "downloads_count"=>10,    "number"=>"0.9.9",     "summary"=>"Bogus", "platform"=>"ruby", "prerelease"=>false},
  {"authors"=>"Bogus", "built_at"=>"2011-03-13T04:00:00Z", "description"=>"Bogus...", "downloads_count"=>1,     "number"=>"0.9.9.rc1", "summary"=>"Bogus", "platform"=>"ruby", "prerelease"=>true}
]

describe Latest::Gem do

  describe "#initialize" do
  
    it "should initialize with a name" do
      @gem = Latest::Gem.new("rake")
      @gem.name.must_equal "rake"
      @gem.pre.must_equal false
    end
    
    it "should initialize with a name and pre" do
      @gem = Latest::Gem.new("rake --pre")
      @gem.name.must_equal "rake"
      @gem.pre.must_equal true
    end
    
    it "should raise a name parse error when an invalid pre flag is given" do
      %w(pre -pre PRE --PRE a 0 ?).each do |i|
        lambda {
          Latest::Gem.new("rake #{i}")
        }.must_raise Latest::Gem::NameParseError
      end    
    end
    
    it "should raise a name parse error when more than two arguments are given" do
      lambda { 
        Latest::Gem.new("rake --pre omg")
      }.must_raise Latest::Gem::NameParseError
    end
  
  end
  
  describe "#fetch" do
    
    before do
      @gem = Latest::Gem.new("rake")
    end
    
    it "should return it's url on rubygems" do
      @gem.send(:url).must_equal "https://rubygems.org/api/v1/versions/rake.json"
    end
    
    it "should parse it's url into a uri" do
      @gem.send(:uri).must_equal URI.parse("https://rubygems.org/api/v1/versions/rake.json")
    end
    
    it "should send a request and return an HTTP response" do
      @gem.send(:send_request).class.ancestors.must_include Net::HTTPResponse
    end
    
    it "should fetch and parse response into an array" do
      @gem.fetch
      @gem.versions.must_be_instance_of Array
    end
  
    it "should raise GemNotFoundError when gem is not found" do
      @gem.instance_variable_set("@response", Net::HTTPNotFound.new(1.0, 404, "NotFound"))
      lambda {
        @gem.send(:parse_response)
      }.must_raise Latest::Gem::GemNotFoundError
    end
    
    it "should throw a RequestError when rubygems responds with an unexpected status" do
      @gem.instance_variable_set("@response", Net::HTTPBadRequest.new(1.0, 400, "BadRequest"))
      lambda {
        @gem.send(:parse_response)
      }.must_raise Latest::Gem::RequestError
    end
    
  end
  
  describe "#parse_versions" do
  
    before do
      @gem = Latest::Gem.new("fake")        
      @gem.instance_variable_set("@response", Net::HTTPOK.new(1.0, 200, "OK"))
      @gem.instance_variable_set("@versions", FAKE_VERSIONS)
    end
    
    it "should not find latest version if versions are empty" do
      @gem.instance_variable_set("@versions", [])
      @gem.version.must_equal "(not found)"
    end
    
    it "should find latest version" do
      @gem.version.must_equal "1.0.1"
    end
    
    it "should find latest prerelease version" do
      @gem.instance_variable_set("@pre", true)
      @gem.version.must_equal "1.0.0.rc1"
    end
    
    it "should set the total number of downloads when a version is found" do
      @gem.version.must_equal "1.0.1"
      @gem.downloads.must_equal 10000
    end
    
    it "should find latest version, change to prerelease, then find the latest version again" do
      @gem.version.must_equal "1.0.1"
      @gem.pre = true
      @gem.version.must_equal "1.0.0.rc1"    
    end
    
  end
  
end
