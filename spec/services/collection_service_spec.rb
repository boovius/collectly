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
        expect(subject).to eq true

        expect(Song.all.length).to eq 1
        expect(Song.first.title).to eq(hash[:song])
      end

      context 'when song title already exists' do
        before do
          Song.create(title: hash[:song])
          expect(Song.all.length).to eq 1
        end

        it 'does not add the duplicate song' do
          expect(subject).to eq false

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

      let(:song) { Song.first }
      let(:album) { Album.first }
      let(:artist) { Artist.first }

      it 'adds the song and album' do
        subject

        expect(Song.all.length).to eq 1
        expect(song.title).to eq(hash[:song])
        expect(Album.all.length).to eq 1
        expect(album.title).to eq(hash[:album])
        expect(song.album).to eq(album)
        expect(Artist.all.length).to eq 1
        expect(artist.name).to eq(hash[:artist].downcase)
        expect(album.artist).to eq(artist)
        expect(song.artist).to eq(artist)
      end

      context 'when given artist is same as existing one' do
        shared_examples 'creates record with hash of existing artist' do
          |existing_artist_name, given_artist_name, correct_name, total|

          let(:hash) {{
            song: 'Across the Universe',
            album: 'let it be',
            artist: given_artist_name,
          }}

          let(:existing_artist) { Artist.create(name: existing_artist_name) }
          let(:existing_album) {
            Album.create(title: hash[:album], artist: existing_artist)
          }

          before do
            expect(existing_artist).to_not be_nil
            expect(Artist.all.length).to eq 1
            expect(existing_album).to_not be_nil
            expect(Album.all.length).to eq 1
            Song.create(title: hash[:song], album: existing_album)
            expect(Song.all.length).to eq 1
          end

          it 'adds the song and album' do
            subject

            expect(Song.all.length).to eq total
            expect(Song.last.title).to eq(hash[:song])
            expect(Album.all.length).to eq total
            expect(Album.last.title).to eq(hash[:album])
            expect(Song.last.album).to eq(Album.last)
            expect(Artist.all.length).to eq total
            expect(Artist.last.name).to eq(correct_name)
            expect(Album.last.artist).to eq(Artist.last)
          end
        end

        it_behaves_like 'creates record with hash of existing artist',
          'the beatles', 'the beatles', 'the beatles', 1
        it_behaves_like 'creates record with hash of existing artist',
          'the beatles', 'The Beatles', 'the beatles', 1
        it_behaves_like 'creates record with hash of existing artist',
          'the beatles', 'tHe beAtles', 'the beatles', 1
        it_behaves_like 'creates record with hash of existing artist',
          'the beatles', 'tHebeAtles', 'thebeatles', 2
      end
    end

    context 'album artwork' do
      let(:hash) {{
        song: 'Across the Universe',
        album: 'let it be',
        artist: 'The Beatles',
        album_image_url: album_artwork,
      }}

      let(:song) { Song.first }
      let(:album) { Album.first }
      let(:artist) { Artist.first }

      context 'given hash of album of artwork' do
        let(:album_artwork) { 'https://s3.amazonaws.com/ablumpic' }

        it 'adds the song and album' do
          subject

          expect(Song.all.length).to eq 1
          expect(song.title).to eq(hash[:song])
          expect(Album.all.length).to eq 1
          expect(album.title).to eq(hash[:album])
          expect(song.album).to eq(album)
          expect(Artist.all.length).to eq 1
          expect(artist.name).to eq(hash[:artist].downcase)
          expect(album.artist).to eq(artist)
          expect(song.artist).to eq(artist)
          expect(album.image_url).to eq(album_artwork)
        end
      end

      context 'given hash with no album artwork' do
        let(:album_artwork) { '' }

        it 'adds the song and album' do
          subject

          expect(Song.all.length).to eq 1
          expect(song.title).to eq(hash[:song])
          expect(Album.all.length).to eq 1
          expect(album.title).to eq(hash[:album])
          expect(song.album).to eq(album)
          expect(Artist.all.length).to eq 1
          expect(artist.name).to eq(hash[:artist].downcase)
          expect(album.artist).to eq(artist)
          expect(song.artist).to eq(artist)
          expect(album.image_url).to eq('')
        end
      end
    end
  end
end
