require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

class SampleBlog::App::PostsHelperTest < Test::Unit::TestCase
  context "SampleBlog::App::PostsHelper" do
    setup do
      @helpers = Class.new
      @helpers.extend SampleBlog::App::PostsHelper
    end

    should "return nil" do
      assert_equal nil, @helpers.foo
    end
  end
end
