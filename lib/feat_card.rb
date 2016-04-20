require_relative 'character_card'

class FeatCard < CharacterCard

  def create_card(xml_file)
    path = xml_file["document"]["public"]["character"]["feats"]["feat"]

    if path.class == Hash
      @class_cards << {
        "count": 1,
        "color": "green",
          "title": "#{path["name"]}",
          "icon": nil,
          "contents": [
          "subtitle | Feat",
          "rule",
          "property | Category | #{path["categorytext"]}",
          "section | Description",
          "text | #{path["description"]}"[0..318]
        ]
      }
    elsif path.class == Array
      path.each do |f|
        @class_cards << {
        "count": 1,
        "color": "green",
          "title": "#{f["name"]}",
          "icon": nil,
          "contents": [
          "subtitle | Feat",
          "rule",
          "property | Category | #{f["categorytext"]}",
          "fill",
          "section | Description",
          "text | #{f["description"]}"[0..318]
        ]
      }
      end
    end
  end
end
