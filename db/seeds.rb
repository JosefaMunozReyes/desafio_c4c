# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
until Publication.count == 10 do
    Publication.create(title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false))
end

until Comment.count == 10 do
    Comment.create(contenido: Faker::Lorem.paragraph_by_chars(number: 200,
    supplemental: false), publicacion_id: publication.sample.id, user_id:
    users.sample.id)
end

r_type = %w[publication comment]
comments = Comment.all
kinds = Publication::Kinds

until Reaction.count == 10 do rel_type = r_type.sample
if rel_type == "article"
    Reaction.create(publication_id: publication.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
else
    Reaction.create(comment_id: comments.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)end
end