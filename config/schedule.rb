# You can change this as you please
# The above job runs every one hour
every '00 * * * *' do
  runner "MainParser.new"
end
