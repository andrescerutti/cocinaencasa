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

    return ["todos los días"] if days.count == 7
    days
  end

  def days_in_text
    if available.count == 1
      return available.first
    elsif available.count == 2
      return available.join(" y ")
    elsif available.count > 2
      return available[0..-2].join(", ") + " y " + available[-1]
    else
      return "no estamos entregando"
    end
  end

  def next_available_time
    if day_for_order.positive?
      day_for_order > 1 ? "para el #{(Time.zone.now.to_datetime + day_for_order.days).strftime('%A')}" : "para mañana"
    elsif next_day_hour < (Time.zone.now.hour + Time.zone.now.to_datetime.min.to_f / 60).round(1)
      return "para mañana"
    else
      return "hasta las #{next_day_hour.to_i}:#{(next_day_hour % next_day_hour.to_i).zero? ? "00" : ((next_day_hour % next_day_hour.to_i) * 60).to_i}hs"
    end
  end

  def disabled
    (Date.today..Date.today + 60).reject { |day| delivery_days[day.wday] }.map(&:to_s)
  end
end
