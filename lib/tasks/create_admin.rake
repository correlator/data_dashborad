require 'rake'

task :create_admin, [:email] => :environment do |t, args|
    Admin.create(email: args[:email], password: SecureRandom.base64, super_admin: true)
end
