# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Supprime toutes les données existantes pour éviter les doublons
Order.destroy_all
Article.destroy_all
User.destroy_all

# Création de quelques utilisateurs
user1 = User.create(email: "vendeur@example.com", password: "password123")
user2 = User.create(email: "acheteur@example.com", password: "password123")

# Création d'articles pour le vendeur
article1 = Article.create(name: "Article de qualité", description: "Un article de haute qualité", price: 100, vendor: user1)
article2 = Article.create(name: "Produit de luxe", description: "Un produit de luxe très rare", price: 500, vendor: user1)

# Création d'une commande pour l'acheteur, pour acheter l'article1
Order.create(user: user2, article: article1)

# Affiche un message dans la console pour confirmer la création des données
puts "Seed terminée ! Utilisateurs, articles, et commandes créés avec succès."