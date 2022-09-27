require "faker"

User = Struct.new(
  :name,
  :active?,
  :accommodations,
  :last_cleaned_breakroom_at,
  :last_microwaved_fish_at,
  :level,
  :lat,
  :lng,
  keyword_init: true
) {
  def self.examples
    1000.times.map {
      missing_location = rand > 0.9

      User.new(
        name: Faker::Name.name,
        active?: Faker::Boolean.boolean,
        accommodations: [:mobility, :vision, :auditory].select { |type|
          rand > 0.85
        },
        last_cleaned_breakroom_at: (Faker::Time.backward unless rand > 0.99),
        last_microwaved_fish_at: (Faker::Time.backward if rand > 0.8),
        level: if (level_rand = rand) < 0.6
                 :staff
               elsif level_rand < 0.8
                 :manager
               elsif level_rand < 0.9
                 :director
               elsif level_rand < 0.95
                 :vp
               else
                 :c_suite
               end,
        lat: (Faker::Address.latitude unless missing_location),
        lng: (Faker::Address.longitude unless missing_location)
      )
    }
  end
}
