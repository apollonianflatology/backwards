RSpec.shared_examples 'reverser' do
  using described_class

  describe '#backwards' do
    it 'reverses a string' do
      expect('a'.backwards).to eq('a')
      expect('abcd'.backwards).to eq('dcba')
      expect('abcde'.backwards).to eq('edcba')
    end

    context 'when given an empty string' do
      it 'returns an empty string' do
        expect(''.backwards).to eq('')
      end
    end

    context 'when given a multibyte string' do
      it 'reverses it' do
        expect('🐧🤖🦞'.backwards).to eq('🦞🤖🐧')
        expect('🐧'.backwards).to eq('🐧')
      end
    end
  end
end
