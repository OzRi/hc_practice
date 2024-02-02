# frozen_string_literal: true

require_relative 'pokemon'
require_relative 'pikachu'

poke = Pokemon.new('リザードン', 'ほのお', 'ひこう', 100)
puts poke.name
puts poke.type1
poke.attack

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
pika.attack
pika.change_name('テキセツ')
puts pika.name
pika.change_name('poop')
puts pika.name
pika.attack
