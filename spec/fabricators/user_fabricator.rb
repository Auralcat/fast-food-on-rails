# frozen_string_literal: true

Fabricator(:user) do
  id               1
  name             'Average Joe'
  email            'valid@email.com'
  password         'IWannaEatTheWorld'
  password_digest  'Readers Digest'
  location         'Knowhere'
end
