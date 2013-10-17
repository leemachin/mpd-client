require 'spec_helper'

describe Song do

  let(:song1) { MPD::Song.new({ title: 'Back in Black', album: 'Back in Black', genre: 'Rock', date: '1980' }) }
  let(:song2) { MPD::Song.new({ title: 'Highway to Hell', album: 'Highway to Hell', genre: 'Rock', date: '1979' }) }

  before do
    MPDConnection.mpd.stub(:queue).and_return([song1, song2])
  end

  it 'returns the queue of songs' do
    queue = Song.queue
    expect(queue).to have(2).items
  end
end