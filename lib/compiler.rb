require "pry"
require "crack"
require "json"
require_relative 'character_card'
require_relative 'weapon_card'
require_relative 'armor_card'
require_relative 'deck'

class Compiler
  def initialize(file_path)
    @file_path = file_path
  end
  
  def compile
    deck = Deck.new
    character = CharacterCard.new
    weapons = WeaponCard.new
    armors = ArmorCard.new
    myXML = Crack::XML.parse(File.read(@file_path))

    deck.cards << character.create_card(myXML)

    binding.pry

    weapons.create_card(myXML, "melee") if myXML["document"]["public"]["character"]["melee"] != nil
    weapons.create_card(myXML, "ranged") if myXML["document"]["public"]["character"]["ranged"] != nil
    armors.create_card(myXML) if myXML["document"]["public"]["character"]["defenses"]["armor"] != nil

    weapons.class_cards.each do |w|
      deck.cards << w
    end

    armors.class_cards.each do |a|
      deck.cards << a
    end

    deck.save_deck("#{@file_path.split(".")[0]}"+".json", deck.cards)

    puts "Please check your current directory for a JSON file with your deck name."
  end
end