require 'faker'

25.times do |i|
  @post = Note.create({:title => Faker::Company.catch_phrase, :content => Faker::Lorem.paragraphs(paragraph_count = 3)})
end
