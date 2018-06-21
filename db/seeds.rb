# frozen_string_literal: true

Admin.create!(name: 'Admin',
              email: 'admin@admin.com',
              password: 'admin')

%w[driver1 driver2 driver3 driver4 driver5].each_with_index do |name, index|

  Driver.create!(name: name,
                 email: name + '@ola.com',
                 password: name,
                 type: 'Driver',
                 lat: index + 1,
                 long: index + 1
  )
end
