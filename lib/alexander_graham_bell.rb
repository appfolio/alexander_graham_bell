require 'alexander_graham_bell/version'
require 'alexander_graham_bell/phone'

module AlexanderGrahamBell
  def self.tel_link(phone_number)
    phone = Phone.new(phone_number)
    if phone.valid?
      "<a href=\"tel:#{phone.number}#{isub(phone)}\">#{phone_number}</a>"
    else
      phone_number
    end
  end

  private

  def self.isub(phone)
    ";isub=#{phone.extension}" unless phone.extension.nil?
  end
end
