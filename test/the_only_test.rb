require "app"
require "capybara"
require "capybara/dsl"

class TheOnlyTest < Minitest::Test
  include Capybara::DSL

  def setup
    Capybara.app = Sinatra::Application.new
  end

  def test_page
    visit "/"
    assert page.has_content?("CatSay")
    assert page.has_selector?(".dn[data-testid='stairs']")
    assert page.has_selector?(".dn[data-testid='piano']")
  end

  def test_form
    visit "/"
    fill_in "zoni-message", with: "Hello"
    fill_in "carlos-message", with:  "Hi, there!"
    select  "piano"
    click_on "Command My Cats!"
    assert page.has_content?("Hello")
    assert page.has_selector?(".dn[data-testid='stairs']")
    assert page.has_selector?(".db[data-testid='piano']")
    within ".db[data-testid='piano']" do
      assert page.has_content?("Hello")
      assert page.has_content?("Hi, there!")
    end
    assert page.has_selector?("input[value='Hello']")
    assert page.has_selector?("input[value='Hi, there!']")
  end

end
