require 'rails_helper'

RSpec.describe CollectionService do
  describe 'add_song' do
    subject { described_class.add_song hash }

    context 'given a hash with only a song title' do
      let(:hash) {{
        song: 'let it be',
        album: '',
        artists: '',
      }}

      before { subject }

      it 'adds the song' do
        expect(Song.all.length).to eq 1
        expect(Song.first.title).to eq('let it be')
      end

      context 'when song title already exists' do
        before do
          Song.create(title: hash[:song])
          expect(Song.all.length).to eq 1

          subject
        end

        it 'does not add the duplicate song' do
          expect(Song.all.length).to eq 1
          expect(Song.first.title).to eq('let it be')
        end
      end
    end


    context 'given a hash with a song title' do

    end
    context 'given a hash with a song title' do

    end
    context 'given a hash with a song title' do

    end
    context 'given a hash with a song title' do

    end
  end
end
