# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_BananaTracker_session',
  :secret      => '32a055cf8c1d9f9607e7fcaa6021d01a6b969ecd3a88740485f0b3335c26b65897ec8f04fe4272cf81694f400d055d773e7f88d0b8273a41aa2e86d66513252a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
