require "faker"

BreakRoom = Struct.new(
  :name,
  :clean?,
  :lat,
  :lng,
  keyword_init: true
) {
  def self.example
      BreakRoom.new(
        name: Faker::Movies::StarWars.planet,
        clean?: Faker::Boolean.boolean,
        lat: Faker::Address.latitude,
        lng: Faker::Address.longitude
      )
  end
}
