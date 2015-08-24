Account.find_or_create_by(email: 'demo@example.com') do |a|
  a.password = '123456'
  a.password_confirmation = '123456'
end
