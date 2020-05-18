class Store < ApplicationRecord
  belongs_to :restaurant
  has_one :address, as: :addressable, :dependent => :destroy
  serialize :hash

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

  def pick_up_providers
    if pick_up
      return ["Envio a domicilio", "Retirar por el local"]
    else
      return ["Envio a domicilio"]
    end
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

  def next_available_day
    wday = Time.zone.now.to_datetime.wday  + 1
    return "para mañana" if delivery_days[wday] || (delivery_days[0] && wday == 7)
    wday = 0 if wday == 7

    7.times do |num|
      return "para el #{Date::DAYNAMES[wday]}" if delivery_days[wday]
      if wday >= 6
        wday = 0
      else
        wday += 1
      end
    end
  end

  def next_available_time
    if day_for_order.positive?
      day_for_order > 1 ? next_available_day : "para mañana"
    elsif (next_day_hour < (Time.zone.now.hour + Time.zone.now.to_datetime.min.to_f / 60).round(1)) || next_day_hour.zero?
      return next_available_day
    else
      return "hasta las #{next_day_hour.to_i}:#{(next_day_hour % next_day_hour.to_i).zero? ? "00" : ((next_day_hour % next_day_hour.to_i) * 60).to_i}hs"
    end
  end

  def disabled
    tomorrow = next_available_time == "para mañana" ? 1 : 0
    first_day_open = day_for_order.positive? ? (Date.today + day_for_order.days) : (Date.today + tomorrow.days)
    [(Date.today..Date.today + 60).reject { |day| delivery_days[day.wday] }.map(&:to_s), (Date.today...first_day_open).map(&:to_s)].flatten.uniq
  end
end
