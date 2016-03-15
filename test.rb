$:.unshift 'lib'
require 'pp'
require 'adapter/pstore'
require 'toystore'

class User
  include Toy::Store
  adapter :pstore, ::PStore.new('kv.pstore')

  attribute :name, String
end

user = User.create(:name => 'John')

pp user
pp User.read(user.id)

user.destroy
pp User.read(user.id)
