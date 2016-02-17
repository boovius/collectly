require 'rails_helper'

RSpec.describe CollectionService do
  describe 'add_song' do
    subject { described_class.add_song hash }

    context 'given a hash with only a song title' do
      let(:hash) {{
        song: 'Across the Universe',
        album: '',
        artist: '',
      }}

      it 'adds the song' do
        subject

        expect(Song.all.length).to eq 1
        expect(Song.first.title).to eq(hash[:song])
      end

      context 'when song title already exists' do
        before do
          Song.create(title: hash[:song])
          expect(Song.all.length).to eq 1
        end

        it 'does not add the duplicate song' do
          subject

          expect(Song.all.length).to eq 1
        end
      end
    end


    context 'given a hash with a song title and album title' do
      let(:hash) {{
        song: 'Across the Universe',
        album: 'let it be',
        artist: '',
      }}

      it 'adds the song and album' do
        subject

        expect(Song.all.length).to eq 1
        expect(Song.first.title).to eq(hash[:song])
        expect(Album.all.length).to eq 1
        expect(Album.first.title).to eq(hash[:album])
        expect(Song.first.album).to eq(Album.first)
      end

      context 'when album exists but song on album does not' do
        before do
          Album.create(title: hash[:album])
          expect(Album.all.length).to eq 1
        end

        it 'adds the song and album' do
          subject

          expect(Song.all.length).to eq 1
          expect(Song.first.title).to eq(hash[:song])
          expect(Album.all.length).to eq 1
          expect(Album.first.title).to eq(hash[:album])
          expect(Song.first.album).to eq(Album.first)
        end
      end

      context 'when song and album exist' do
        before do
          album = Album.create(title: hash[:album])
          expect(Album.all.length).to eq 1
          Song.create(title: hash[:song], album: album)
          expect(Song.all.length).to eq 1
          expect(Song.first.album).to eq(Album.first)
        end

        it 'does not add the new song' do
          subject

          expect(Song.all.length).to eq 1
          expect(Album.all.length).to eq 1
        end
      end
    end

    context 'given a hash with a song, ablum, and artist' do

      let(:hash) {{
        song: 'Across the Universe',
        album: 'let it be',
        artist: 'The Beatles',
      }}

      it 'adds the song and album' do
        subject

        expect(Song.all.length).to eq 1
        expect(Song.first.title).to eq(hash[:song])
        expect(Album.all.length).to eq 1
        expect(Album.first.title).to eq(hash[:album])
        expect(Song.first.album).to eq(Album.first)
        expect(Artist.all.length).to eq 1
        expect(Artist.first.title).to eq(hash[:artist])
        expect(Album.first.artist).to eq(hash[:artist])
        expect(Song.first.artist).to eq(Album.first.artist)
      end
    end
  end
end
