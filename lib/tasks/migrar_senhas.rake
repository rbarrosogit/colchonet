# encoding: utf-8
namespace :app do
  desc "Encripta todas as senhas que ainda não foram processadas no banco de dados"
  task migrar_senhas: :environment do
    unless User.attribute_names.include? "password"
      puts "Senha já migrada."
      return
    end
    User.find_each do |user|
      puts "Migrando usuário de id: ##{user.id} e nome #{user.full_name}"
      unencripted_password = user.attributes["password"]

      user.password = unencripted_password
      user.password_confirmation = unencripted_password
      user.save!
    end
  end
end
