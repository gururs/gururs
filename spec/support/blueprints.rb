require 'machinist/active_record'

Authorization.blueprint do
  user     { User.make! }
  provider { "facebook" }
  uid      { 10000 }
end

Event.blueprint do
  name          { 'Encontro GURU-RS Maio' }
  enroll_url    { 'http://nos.vc/pt/projects/360-encontro-guru-rs-maio' }
  proposals_url { '' }
  happens_at    { '' }
end

User.blueprint do
  name                  { 'Some nice guy' }
  email                 { "someniceguy#{sn}@gmail.com" }
  password              { 'niceguy123' }
  password_confirmation { 'niceguy123' }
end

Talk.blueprint do
  title { "What's new on Rails 4 and a bit of my experience with it" }
  event { Event.make! }
  user { User.make! }
end
