require 'erb'
require 'alexander_graham_bell/version'
require 'alexander_graham_bell/phone'

module AlexanderGrahamBell
  class << self
    def tel_link(phone_number)
      phone = Phone.new(phone_number)
      escaped_phone_number = escape_phone_number(phone_number)
      return escaped_phone_number unless phone.valid?
      "<a href=\"#{tel_href(phone_number)}\">#{escaped_phone_number}</a>"
    end

    def tel_href(phone_number)
      phone = Phone.new(phone_number)
      escaped_phone_number = escape_phone_number(phone_number)
      return "tel:#{escaped_phone_number}" unless phone.valid?
      "tel:#{phone.number}#{isub(phone)}"
    end

    private

    def escape_phone_number(phone_number)
      ERB::Util.h(phone_number)
    end

    def isub(phone)
      ";isub=#{phone.extension}" unless phone.extension.nil?
    end
  end
end
