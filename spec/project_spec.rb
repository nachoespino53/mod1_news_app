# require_relative '../config/environment.rb'
# require_relative '../bin/run'


describe '#run' do
  it "welcomes the user and stores their first and last name" do

    subject.stub(:gets).and_return(response)

  end
end
#Failure/Error: require_relative '../config/environment.rb'

# "should return topics if user chooses topics"
#
# "should return saved articles if user chooses saved articles"
