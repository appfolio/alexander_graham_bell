module AlexanderGrahamBell
  class Phone
    # modified from https://www.safaribooksonline.com/library/view/regular-expressions-cookbook/9781449327453/ch04s02.html#I_programlisting4_d1e22044
    # ORIGINAL_REGEX = /^(\+?1)?[-.\s]*\(?([2-9][0-8]\d)\)?[-.\s]*([2-9]\d{2})[-.\s]*(\d{4})\s*((x|ext)\s*\d+)?$/i
    INTERNATIONAL_REGEX = /^(\+?1)?/
    AREA_CODE_REGEX = /([2-9][0-8]\d)?/
    TELEPHONE_EXCHANGE_REGEX = /([2-9]\d{2})/
    LINE_NUMBER_REGEX = /(\d{4})/
    EXTENSION_REGEX = /(?:(?:,|,?(?:x|ext|extension):?)(\d+))?$/i
    PHONE_REGEX = /(?:(?:#{INTERNATIONAL_REGEX}#{AREA_CODE_REGEX})?#{TELEPHONE_EXCHANGE_REGEX}#{LINE_NUMBER_REGEX}#{EXTENSION_REGEX})?/

    attr_reader :international, :area_code, :telephone_exchange, :line_number, :extension

    def initialize(phone_number)
      unless phone_number.instance_of?(String)
        raise TypeError,
              "Expected phone_number to be of type String but got #{phone_number.class.name}"
      end

      phone_number = clean(phone_number)

      @international, @area_code, @telephone_exchange, @line_number, @extension = PHONE_REGEX.match(phone_number).captures
    end

    def valid?
      return [@telephone_exchange, @line_number].all?
    end

    def number
      [@international, @area_code, @telephone_exchange, @line_number].reject(&:nil?).join
    end

    def number_with_extension(extension_separator = ' ext ')
      extension = @extension.nil? ? '' : extension_separator + @extension
      number + extension
    end

    private

    def clean(dirty_number)
      dirty_number.gsub(/[-.()\s]/, '')
    end
  end
end
