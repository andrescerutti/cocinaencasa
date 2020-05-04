class Store < ApplicationRecord
  belongs_to :restaurant
  has_one :address, as: :addressable, :dependent => :destroy

  reverse_geocoded_by "addresses.latitude", "addresses.longitude"

  def delivery_days
    [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
  end

  def available
    days = {
      "lunes"  => monday,
      "martes" => tuesday,
      "miércoles" => wednesday,
      "jueves"    => thursday,
      "viernes"   => friday,
      "sábado"    => saturday,
      "domingo"   => sunday
    }.select {|day, value| value}.keys

    return days.join(" y ").capitalize if days.length <= 2
    days[0..-2].join(", ").capitalize + " y " + days[-1]
  end

  def disabled
    (Date.today..Date.today + 60).reject { |day| delivery_days[day.wday] }.map(&:to_s)
  end
end
