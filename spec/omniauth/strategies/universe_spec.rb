RSpec.describe OmniAuth::Strategies::Universe do
  def app
    lambda do |_|
      [200, {}, ['Hello, world.']]
    end
  end

  let(:fresh_strategy) { Class.new(OmniAuth::Strategies::Universe) }
  let(:options) { {} }

  before { OmniAuth.config.test_mode = true }
  after { OmniAuth.config.test_mode = false }

  subject(:strategy) { fresh_strategy.new(app, options) }

  it_behaves_like 'an oauth2 strategy'

  describe '#authorize_params' do
    subject(:authorize_params) { strategy.authorize_params }

    # context 'when a "ref" is set' do
    #   let(:options) { {authorize_params: {ref: 'test123'}} }

    #   it { is_expected.to have_key(:ref) }

    #   describe '#[:ref]' do
    #     subject { authorize_params[:ref] }

    #     it { is_expected.to eq('test123') }
    #   end
    # end

    # context 'when a "ref" is not set' do
    #   it { is_expected.to_not have_key(:ref) }
    # end
  end

  describe '#client' do
    subject(:client) { strategy.client }

    it_behaves_like 'an oauth2 strategy client'

    describe '#options' do
      subject(:client_options) { client.options }

      describe '[:authorize_url]' do
        subject { client_options[:authorize_url] }

        it { is_expected.to eq('/oauth/authorize') }
      end

      describe '[:token_url]' do
        subject { client_options[:token_url] }

        it { is_expected.to eq('/oauth/token') }
      end
    end

    describe '#site' do
      subject { client.site }

      it { is_expected.to eq('https://universe.com') }
    end
  end

  describe '#callback_path' do
    subject { strategy.callback_path }

    it { is_expected.to eq('/auth/universe/callback') }
  end

  describe '#info' do
    let(:access_token) { instance_double('AccessToken') }
    let(:parsed) { instance_double('Response', parsed: response) }

    before do
      allow(access_token).to receive(:get).and_return(parsed)
      allow(strategy).to receive(:access_token).and_return(access_token)
    end

    subject(:info) { strategy.info }

    context 'with complete information' do
      let(:response) do
        {
          'first_name' => 'Test',
          'last_name' => 'User',
          'name' => 'Test User',
          'id' => '123456789012',
          'email' => 'test@email.com'
        }
      end

      describe 'email' do
        subject { response['email'] }

        it { is_expected.to eq('test@email.com') }
      end

      describe 'first_name' do
        subject { response['first_name'] }

        it { is_expected.to eq('Test') }
      end

      describe 'full_name' do
        subject { response['name'] }

        it { is_expected.to eq('Test User') }
      end

      describe 'last_name' do
        subject { response['last_name'] }

        it { is_expected.to eq('User') }
      end
    end

    context 'with incomplete information' do
      let(:response) do
        {
          'id' => '123456789012',
          'email' => 'test@email.com'
        }
      end

      describe 'email' do
        subject { response['email'] }

        it { is_expected.to eq('test@email.com') }
      end

      describe 'first_name' do
        subject { response['first_name'] }

        it { is_expected.to be_nil }
      end

      describe 'full_name' do
        subject { response['name'] }

        it { is_expected.to be_nil }
      end

      describe 'last_name' do
        subject { response['last_name'] }

        it { is_expected.to be_nil }
      end
    end
  end
end
