require_relative 'character_card'

class DefensiveAbilityCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["defensive"]["special"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Defensive Ability",
          "icon": nil,
          "contents": [
          "subtitle | #{path["shortname"]}",
          "rule",
          "property | Type | #{path["type"]}",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |da|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "Defensive Ability",
          "icon": nil,
          "contents": [
          "subtitle | #{da["shortname"]}",
          "rule",
          "property | Type | #{da["type"]}",
          "fill",
          "section | Description",
          "text | #{da["description"]}"[0..318]
        ]
      }
      end
    end
  end
end
