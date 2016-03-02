require 'test_helper'

# these tests are for rails
# rails monkeypatches html_safe onto the String class
# but we didn't want a direct dependency on rails

class String
  attr_accessor :html_safe_flag

  def html_safe
    self.html_safe_flag = true
    return self
  end
end

class RailsAlexanderGrahamBellTest < Minitest::Test
  def test_tel_link__escapes_unsafe_strings
    assert AlexanderGrahamBell.tel_link('8052345678').html_safe_flag
    refute AlexanderGrahamBell.tel_link('<a></a>').html_safe_flag
  end
end
