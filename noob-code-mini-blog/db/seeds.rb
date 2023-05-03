require 'faker'

games_category = Category.find_or_create_by!(name: 'Games')
books_category = Category.find_or_create_by!(name: 'Books')
movies_category = Category.find_or_create_by!(name: 'Movies')

User.create(name: 'Admin Boladão', password: '123456678', password_confirmation: '123456678',
kind: 'AD', email: 'adminemail@admin.com')

jornalist = User.create(name: 'Jornalista curioso', password: 'password', password_confirmation: 'password',
kind: 'JO', email: 'jornalistemail@jornalist.com')

villain = User.create(name: Faker::DcComics.villain, password: 'password', password_confirmation: 'password',
kind: 'JO', email: 'villain@jornalist.com')

hero = User.create(name: Faker::DcComics.hero, password: 'password', password_confirmation: 'password',
    kind: 'JO', email: 'hero@jornalist.com')

games_post = Post.find_or_create_by!(title: Faker::Esport.game,
description: Faker::Lorem.paragraph, category_id: games_category.id, user_id: jornalist.id)

books_post = Post.find_or_create_by!(title: Faker::Book.title,
    description: Faker::Lorem.paragraph, category_id: books_category.id, user_id: jornalist.id)

movies_post = Post.find_or_create_by!(title: Faker::Movie.title,
        description: Faker::Lorem.paragraph, category_id: movies_category.id, user_id: jornalist.id)

Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: games_post.id, user_id: hero.id)

Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: games_post.id, user_id: villain.id)


Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: books_post.id, user_id: hero.id)

Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: books_post.id, user_id: villain.id)


Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: movies_post.id, user_id: hero.id)

Comment.find_or_create_by!(comment: Faker::ChuckNorris.fact, post_id: movies_post.id, user_id: villain.id)
