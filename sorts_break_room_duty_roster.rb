require "awesome_print"
require "put"

require_relative "user"
require_relative "break_room"
require_relative "gets_distance"

class SortsBreakRoomDutyRoster
  def sort(break_room = BreakRoom.example, users = User.examples)
    users.sort_by { |user|
      [
        (Put.first if user.active?),
        (Put.last if user.accommodations.include?(:mobility)),

        Put.asc(user.last_cleaned_breakroom_at, nils_first: true),
        Put.desc(user.last_microwaved_fish_at),

        Put.desc(case user.level
        when :staff then 1
        when :manager then 2
        when :director then 3
        when :vp then 4
        when :c_suite then 5
        end),

        Put.asc(GetsDistance.new.get(user.lat, user.lng, break_room.lat, break_room.lng))
      ]
    }
  end
end

ap SortsBreakRoomDutyRoster.new.sort.first(10)
