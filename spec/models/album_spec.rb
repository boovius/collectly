require 'rails_helper'

RSpec.describe Album do
  describe 'image_path' do
    let(:album_attrs) {{
      title: 'an album',
      image_url: image_url,
    }}

    let(:album) {
      Album.create(
        title: album_attrs[:title],
        image_url: album_attrs[:image_url]
      )
    }

    context 'when image url is present' do
      let(:image_url) { 'http://aws.com/something' }

      it 'returns the image url' do
        expect(album.image_path).to eq image_url
      end
    end

    context 'when image url is not present' do
      let(:image_url) { '' }

      it 'returns the path to the placeholder image' do
        expect(album.image_path).to eq '/images/album-placeholder.png'
      end
    end
  end
end
