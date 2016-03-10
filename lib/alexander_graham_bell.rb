require 'erb'
require 'alexander_graham_bell/version'
require 'alexander_graham_bell/phone'

module AlexanderGrahamBell
  class << self
    def tel_link(phone_number, escaper = ERB::Util.method(:h))
      phone = Phone.new(phone_number)
      escaped_phone_number = escape_phone_number(phone_number, escaper)
      return escaped_phone_number unless phone.valid?
      "<a href=\"tel:#{phone.number}#{isub(phone)}\">#{escaped_phone_number}</a>"
    end

    def tel_href(phone_number)
      phone = Phone.new(phone_number)
      escaped_phone_number = escape_phone_number(phone_number)
      return "tel:#{escaped_phone_number}" unless phone.valid?
      "tel:#{phone.number}#{isub(phone)}"
    end

    private

    def escape_phone_number(phone_number, escaper = ERB::Util.method(:h))
      escaper ? escaper.call(phone_number) : phone_number
    end

    def isub(phone)
      ";isub=#{phone.extension}" unless phone.extension.nil?
    end
  end
end
