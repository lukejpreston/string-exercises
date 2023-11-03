require './exercise'

describe Exercise do
  xcontext 'reverse the string' do
    it 'reverses the string hello to olleh' do
      expect(described_class.reverse('hello')).to eq('olleh')
    end

    it 'reverses the string R2-D2 to R2-D2' do
      expect(described_class.reverse('R2-D2')).to eq('R2-D2')
    end
  end

  xcontext 'strip the bad letters' do
    it 'does not change caps and lowercase' do
      expect(described_class.clean('HeLlO')).to eq('HeLlO')
    end

    it 'does not remove numbers' do
      expect(described_class.clean('He110')).to eq('He110')
    end

    it 'removes the invalid characters !' do
      expect(described_class.clean('he!!o')).to eq('heo')
    end

    it 'removes the invalid characters #$' do
      expect(described_class.clean('#hello$')).to eq('hello')
    end

    it 'removes the invalid characters !@#$%^&*' do
      expect(described_class.clean('h!e@l#l$o%y^o&u*')).to eq('helloyou')
    end

    it 'keeps _-' do
      expect(described_class.clean('Hello_you-there')).to eq('Hello_you-there')
    end
  end

  xcontext 'counts characters in strings' do
    it 'no input counts the length of the string' do
      expect(described_class.count('hello')).to eq(5)
    end

    it 'counts the number of characters in the string' do
      expect(described_class.count('hello', 'l')).to eq(2)
    end

    it 'returns 0 when the character does not match' do
      expect(described_class.count('hello', 'x')).to eq(0)
    end
  end

  xcontext 'insert characters into a string' do
    it 'can insert the letter at the start with no params' do
      expect(described_class.insert('ello', 'h')).to eq('hello')
    end

    it 'can insert the letter at the index' do
      expect(described_class.insert('he', 'y', 2)).to eq('hey')
    end

    it 'insert the letter at the end if the index is out of bounds' do
      expect(described_class.insert('he', 'y', 200)).to eq('hey')
    end
  end
end