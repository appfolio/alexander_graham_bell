require 'erb'
require 'alexander_graham_bell/version'
require 'alexander_graham_bell/phone'

module AlexanderGrahamBell
  class << self
    def tel_link(phone_number, escaper = ERB::Util.method(:h))
      phone = Phone.new(phone_number)
      escaped_phone_number = escaper ? escaper.call(phone_number) : phone_number
      return escaped_phone_number unless phone.valid?
      "<a href=\"tel:#{phone.number}#{isub(phone)}\">#{escaped_phone_number}</a>"
    end

    private

    def isub(phone)
      ";isub=#{phone.extension}" unless phone.extension.nil?
    end
  end
end
