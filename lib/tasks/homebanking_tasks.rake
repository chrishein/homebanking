require 'highline/import'

namespace :homebanking do
  desc 'Create confirmed and authenticated user account'
  task create_user: :environment do
    say 'Creating user. Please answer questions...'

    user = User.new({
      email:        ask("Email address:\t"),
      password:     ask("Password:\t") { |q| q.echo = '*' },

      role: choose do |menu|
        menu.prompt = "Select role  "
        menu.choices(:user, :admin)
        menu.default = :user
      end,

      confirmation_sent_at: Time.zone.now,
      confirmed_at:         Time.zone.now,
      confirmation_token:   'Generated account'
    })

    if user.save
      say 'User successfully created'
    else
      say 'Error:'
      user.errors.full_messages.each { |e| say "\t#{e}" }
      say 'Please try again...'
    end
  end
end
