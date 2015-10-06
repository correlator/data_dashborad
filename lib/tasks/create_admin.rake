require 'rake'

task :create_admin, [:email] => :environment do |t, args|
    new_admin = Admin.create(email: args[:email], password: SecureRandom.base64, super_admin: true)
    new_admin.send_reset_password_instructions
end
