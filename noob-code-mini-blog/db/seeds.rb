require 'faker'

gamesCategory = Category.create(name: "Games")
booksCategory = Category.create(name: "Books")
moviesCategory = Category.create(name: "Movies")

admin = User.create(name: 'Admin Boladão dono de tudo', password: '123456678', password_confirmation: '123456678', kind: 'AD', email: 'adminemail@admin.com')

jornalist = User.create(name: 'Jornalista bom de bola', password: 'password', password_confirmation: 'password', kind: 'JO', email: 'jornalistemail@jornalist.com')

gamesPost = Post.create(title: 'Elden Ring é pika irmaõ', description: 'Elden Ring vai te deixar maluco e tu vai querer chorar pra tua mãe, mas é gód.', category_id: gamesCategory.id, user_id: jornalist.id)