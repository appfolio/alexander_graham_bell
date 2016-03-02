require 'erb'
require 'alexander_graham_bell/version'
require 'alexander_graham_bell/phone'

module AlexanderGrahamBell
  def self.tel_link(phone_number)
    phone = Phone.new(phone_number)
    if phone.valid?
      escaped_phone_number = ERB::Util::html_escape(phone_number)
      html_safe "<a href=\"tel:#{phone.number}#{isub(phone)}\">#{escaped_phone_number}</a>"
    else
      phone_number
    end
  end

  private

  def self.html_safe(link)
    (defined? ''.html_safe == 'method') ? link.html_safe : link
  end

  def self.isub(phone)
    ";isub=#{phone.extension}" unless phone.extension.nil?
  end
end
