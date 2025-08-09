require "latest"
require "minitest/autorun"

describe "Latest" do

  BIN = File.expand_path("../../bin/latest", __FILE__)
  
  STABLE_VERSION_REGEX = /\d+(\.\d+)*/                        # 11.2.123
  PRE_VERSION_REGEX    = /--pre \d+(\.\d+)*(.[a-z\.?\d]+)+/i  # 0.1.23.beta.1
  DOWNLOADS_REGEX      = /\(\d+ downloads?\)/                 # (10 downloads)

  def assert_version_match(name, string, prerelease=false)
    regex = Regexp.new("#{name} #{prerelease ? PRE_VERSION_REGEX : STABLE_VERSION_REGEX} #{DOWNLOADS_REGEX}")
    string.strip.must_match regex 
  end

  it "should have a version constant" do
    assert Latest.const_defined?(:VERSION)
  end
  
  it "should have a latest executable" do
    assert File.exists?(BIN)
    assert File.executable?(BIN)
  end
  
  it "should return usage string" do
    Latest.usage.must_equal "Usage: latest [GEM [--pre]] [GEM2 [--pre]] etc"
  end
  
  describe "#latest" do
    
    def cmd(params)
      `#{BIN} #{params}`.strip
    end
    
    it "should return usage when no arguments are given" do
      cmd("").must_equal Latest.usage
    end
    
    it "should return version with -v or --version" do
      expected = "Latest v#{Latest::VERSION}"
      cmd("-v").must_equal expected
      cmd("--version").must_equal expected
    end
     
    it "should fetch and print multiple gems" do
      out = cmd("rake minitest latest").split("\n")
      assert_version_match "rake",     out[0]
      assert_version_match "minitest", out[1]
      assert_version_match "latest",   out[2]
    end
    
    it "should fetch and print prerelease version" do
      out = cmd("rake --pre")
      assert_version_match "rake", out, true
    end
    
    it "should fetch and print mixed normal and prerelease versions" do
      out = cmd("rake --pre shoulda --pre latest").split("\n")
      assert_version_match "rake",    out[0], true
      assert_version_match "shoulda", out[1], true
      assert_version_match "latest",  out[2]
    end
    
    it "should rescue GemNotFoundError and print it's error message" do
      out = cmd("omg-non-existant-gem-2")
      out.must_equal "omg-non-existant-gem-2 [Error] `omg-non-existant-gem-2` could not be found on rubygems.org"
    end
    
    it "should rescue standard error and print it's error message" do
      out = cmd("^")
      out.must_equal "^ [Error] bad URI(is not URI?): https://rubygems.org/api/v1/versions/^.json"
    end
  
  end
  
end
