# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
ReWordProject::Application.config.secret_key_base = Rails.env.production? ? ENV['SESSION_SECRET'] : 'e3fa6e43a56bc6f47214e69b1a9c3a700d0633aa48b1861e907f82d096720d1fc82692d066813c691f4cd2d402d9b36b42737aedbc0432b38900b17e68d59710'
