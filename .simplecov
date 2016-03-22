SimpleCov.start 'rails' do
  add_filter 'app/secrets'
  add_group 'Api-Doc', 'app/api-doc'
  add_group 'Assets', 'app/assets'
  add_group 'Mailers', 'app/mailers'
  add_group 'Services', 'app/services'
end