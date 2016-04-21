require_relative 'character_card'

class SkillCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["skills"]["skill"]

    if path.class == Hash && path["value"].to_i > 0
      @class_cards << {
        "count": 1,
        "color": "orange",
          "title": "#{path[name]}",
          "icon": nil,
          "contents": [
          "subtitle | Skill",
          "rule",
          "property | Value | #{path["value"]}",
          "property | Ranks | #{path["ranks"]}",
          "property | #{path["attrname"]} Bonus: | #{path["attrname"]} #{path["attrbonus"]}",
          "section | Description",
          "text | #{path["description"]}"[0..500]
        ]
      }
    elsif path.class == Array
      path.each do |sc|
        if sc["value"].to_i > 0
          @class_cards << {
          "count": 1,
          "color": "orange",
            "title": "#{sc["name"]}",
            "icon": nil,
            "contents": [
            "subtitle | Skill",
            "rule",
            "property | Value | #{sc["value"]}",
            "property | Ranks | #{sc["ranks"]}",
            "property | #{sc["attrname"]} Bonus: | #{sc["attrbonus"]}",
            "section | Description",
            "text | #{sc["description"]}"[0..500]
          ]
        }
        end
      end
    end
  end
end
