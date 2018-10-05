# require_relative '../config/environment.rb'
# require_relative '../bin/run'


describe '#welcome' do
  #   expect(welcome).to output("\nWelcome to our News App\n\nPlease tell us your first and last name:")
      it 'receives and returns name as input' do
        allow($stdin).to receive(:gets).and_return('foo')
        name = $stdin.gets

        expect(name).to eq('foo')
  end
end

# "should return topics if user chooses topics"

# describe '#welcome' do
#       it 'receives and returns name as input' do
#         allow($stdin).to receive(:gets).and_return('foo')
#         name = $stdin.gets
#
#         expect(name).to eq('foo')

# "should return saved articles if user chooses saved articles"
