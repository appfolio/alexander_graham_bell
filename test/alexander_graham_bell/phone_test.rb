require 'test_helper'

module AlexanderGrahamBell
  class PhoneTest < Minitest::Test
    def test_initialize
      assert_raises(TypeError) { Phone.new(nil) }
      assert_raises(TypeError) { Phone.new([]) }
      assert_raises(TypeError) { Phone.new({}) }
      assert_raises(TypeError) { Phone.new(true) }

      p = Phone.new('+1 805 234 5678')
      assert_equal '+1', p.international
      assert_equal '805', p.area_code
      assert_equal '234', p.telephone_exchange
      assert_equal '5678', p.line_number
      assert_nil p.extension
    end

    def test_international
      assert_equal '+1', Phone.new('+18052345678').international
      assert_equal '+1', Phone.new('+1 8052345678').international
      assert_equal '1', Phone.new('18052345678').international
      assert_nil Phone.new('8052345678').international
      assert_nil Phone.new('+28052345678').international
      assert_nil Phone.new('28052345678').international
      assert_nil Phone.new('523-5678').international
    end

    def test_area_code
      assert_equal '805', Phone.new('+18052345678').area_code
      assert_equal '831', Phone.new('18312345678').area_code
      assert_equal '444', Phone.new('1-444-2345678').area_code
      assert_equal '444', Phone.new('+14442345678').area_code
      assert_nil Phone.new('28052345678').area_code
      assert_nil Phone.new('0002223333').area_code
      assert_nil Phone.new('11223334444').area_code
      assert_nil Phone.new('523-5678').area_code
    end

    def test_telephone_exchange
      assert_equal '234', Phone.new('+1805-234-5678').telephone_exchange
      assert_equal '234', Phone.new('234-5678').telephone_exchange
      assert_nil Phone.new('+1805-134-5678').telephone_exchange
    end

    def test_line_number
      assert_equal '5678', Phone.new('+1805-234-5678').line_number
      assert_equal '5678', Phone.new('234-5678').line_number
      # invalid area code means everything is nil
      assert_nil Phone.new('+1005-234-5678').line_number
    end

    def test_extension
      assert_equal '2', Phone.new('555-1234  , 2').extension
      assert_equal '9865', Phone.new('555-1234X9865').extension
      assert_equal '8888', Phone.new('555-1234X:8888').extension
      assert_equal '2', Phone.new('555-1234x2').extension
      assert_equal '2', Phone.new('555-1234x:2').extension
      assert_equal '2', Phone.new('555-1234x.2').extension
      assert_equal '2', Phone.new('555-1234ext2').extension
      assert_equal '5', Phone.new('555-1234 ext: 5').extension
      assert_equal '5', Phone.new('555-1234 ext    : 5').extension
      assert_equal '67', Phone.new('831-555-1234, ext. 67').extension
      assert_equal '67', Phone.new('831-555-1234extension67').extension
      assert_equal '67', Phone.new('831-555-1234, extension 67').extension
      assert_equal '67', Phone.new('831-555-1234, extension. 67').extension
      assert_equal '67', Phone.new('831-555-1234, extension:67').extension
      assert_equal '2', Phone.new('555-1234,. 2').extension
      assert_nil Phone.new('831-555-1234').extension
      assert_nil Phone.new('555-1234').extension
      assert_nil Phone.new('1800-976-4533').extension
    end

    def test_valid__valid_numbers
      assert Phone.new('8 00-234-4321').valid?
      assert Phone.new('80 0-234-4321').valid?
      assert Phone.new('800-2 34-4321').valid?
      assert Phone.new('800-23 4-4321').valid?
      assert Phone.new('800-234-4 321').valid?
      assert Phone.new('800-234-43 21').valid?
      assert Phone.new('800-234-432 1').valid?
      assert Phone.new('+1-8-0-0.-.2.3.4 - 4 3 2  1').valid?

      assert Phone.new('(800)234-4321').valid?
      assert Phone.new('--.-.-.-..-  (800)234-4321').valid?
      assert Phone.new('+1(800)234-4321').valid?
      assert Phone.new('+1(666)234-4321').valid?
      assert Phone.new('1-234-567-8901').valid?
      assert Phone.new('1-234-567-8901 x1234').valid?
      assert Phone.new('1-234-567-8901 ext1234').valid?
      assert Phone.new('1-234-567-8901 ext   1234').valid?
      assert Phone.new('1.234.567.8901').valid?
      assert Phone.new('1-(234 567-8901').valid?
      assert Phone.new('12345678901').valid?
      assert Phone.new('1   234...567---8901').valid?
      assert Phone.new('5678901').valid?
      assert Phone.new('1-(2)3(4)-))(567-8901').valid?
    end

    def test_valid__invalid_numbers
      refute Phone.new('678901').valid?
      refute Phone.new('+800-234-4321').valid?
      refute Phone.new('333a333b3333').valid?
      refute Phone.new('+1-033-333-3333').valid?
      refute Phone.new('+1-133-333-3333').valid?
      refute Phone.new('+1-393-333-3333').valid?
      refute Phone.new('+1-333-033-3333').valid?
      refute Phone.new('+1-333-133-3333').valid?
      refute Phone.new('+1-333-033-3333').valid?
      refute Phone.new('++1-333-033-3333').valid?
      refute Phone.new('+5-333-033-3333').valid?
      refute Phone.new('+1-)333(-033-3333').valid?
      refute Phone.new('+1-333-(033)-3333').valid?
      refute Phone.new('dude, a phone number').valid?
      refute Phone.new('').valid?
    end

    def test_number
      assert_equal '+18052345678', Phone.new('+1-805.234    5678 ext 2').number
      assert_equal '8052345678', Phone.new('8052345678').number
      assert_equal '', Phone.new('0052345678').number
    end

    def test_number_with_extension
      assert_equal '+18052345678 ext 2', Phone.new('+1-805.234    5678 ext 2').number_with_extension
      assert_equal '+18052345678 x: 2', Phone.new('+1-805.234    5678 ext 2').number_with_extension(' x: ')
      assert_equal '+18052345678,2', Phone.new('+1-805.234    5678 ext 2').number_with_extension(',')
      assert_equal '+18052345678', Phone.new('+1-805-234-5678').number_with_extension
      assert_equal '', Phone.new('+1-005-234-5678 ext 2').number_with_extension
    end
  end
end
