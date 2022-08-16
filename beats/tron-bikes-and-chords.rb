# try composing with: https://sonic-pi.mehackit.org/exercises/en/09-keys-chords-and-scales/01-piano.html
#
# save to github: https://github.com/jdraths/sonic-pi-beats

# taken from: Tron Bikes here: https://sonic-pi.net/#examples
live_loop :tron_bikes do
  
  with_synth :dsaw do
    with_fx(:slicer, phase: [0.25,0.125].choose) do
      with_fx(:reverb, room: 0.5, mix: 0.3) do
        start_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
        final_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
        
        p = play start_note, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2), pan: rrand(-1, 0), pan_slide: rrand(4, 8)
        control p, note: final_note, cutoff: rrand(80, 120), pan: rrand(0, 1)
      end
    end
  end
  
  sleep 3
  sync :chord_inversions
end

# Chord Inversions

# Coded by Adrian Cheater

# (in a single tweet)
# https://twitter.com/wpgFactoid/status/666692596605976576
live_loop :chord_inversions do
  # 4 loops
  [1, 3, 6, 4].each do |d|
    
    # 6 beats
    (range -3, 3).each do |i|
      play_chord (chord_degree d, :c, :major, 3, invert: i)
      sleep 0.25
    end
    
  end
  ##| sample :vinyl_rewind
end

