require_relative 'character_card'

class SpellCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["spellsmemorized"]["spell"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "#{path["name"]}",
          "icon": "white-book-#{path["level"]}",
          "contents": [
          "subtitle | Spell",
          "rule",
          "property | Class | #{path["class"]}",
          "property | Level | #{path["level"]}",
          "property | Cast Time | #{path["casttime"]}",
          "property | Duration | #{path["duration"]}",
          "property | Range | #{path["range"]}",
          "property | Target | #{path["target"]}",
          "property | Area | #{path["area"]}",
          "fill",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |s|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "#{s["name"]}",
          "icon": "white-book-#{s["level"]}",
          "contents": [
          "subtitle | Spell",
          "rule",
          "property | Class | #{s["class"]}",
          "property | Level | #{s["level"]}",
          "property | Cast Time | #{s["casttime"]}",
          "property | Duration | #{s["duration"]}",
          "property | Range | #{s["range"]}",
          "property | Target | #{s["target"]}",
          "property | Area | #{s["area"]}",
          "fill",
          "section | Description",
          "text | #{s["description"]}"[0..318]
        ]
      }
      end
    end
  end
end
