require "awesome_print"

require_relative "user"
require_relative "break_room"
require_relative "gets_distance"

class SortsBreakRoomDutyRoster
  def sort(break_room = BreakRoom.example, users = User.examples)
    users.sort_by { |user|
      [
        user.active? ? 0 : 1,
        user.accommodations.include?(:mobility) ? 1 : 0,

        user.last_cleaned_breakroom_at.nil? ? Time.parse("1999-01-01") : user.last_cleaned_breakroom_at,
        user.last_microwaved_fish_at.nil? ? Time.parse("2999-01-01") : user.last_microwaved_fish_at,

        -1 * case user.level
        when :staff then 1
        when :manager then 2
        when :director then 3
        when :vp then 4
        when :c_suite then 5
        end,

        GetsDistance.new.get(user.lat, user.lng, break_room.lat, break_room.lng) || Float::INFINITY
      ]
    }
  end
end

ap SortsBreakRoomDutyRoster.new.sort.first(10)
