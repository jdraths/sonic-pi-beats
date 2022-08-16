# https://gist.github.com/pjagielski/a1d8667ea7d7998144ff807e9e0c9b4e
use_bpm 130

samps = "path_to_breaks" ## download from http://www.junglebreaks.co.uk/breaks.html

ch1  = [61,68,78]
ch2  = [61,68,76]
ch3  = [64,71,76]
ch4  = [59,66,75]
ch5  = [59,66,76]
ch6  = [57,64,76]
ch7  = [57,64,85]
ch8  = [57,64,83]
ch9  = [57,64,80]
ch10 = [59,66,73]
ch11 = [59,66,71]
ch12 = [57,64,71]

live_loop :piano do
  use_synth :piano
  with_synth_defaults amp: 0.75 do
    with_fx :bpf, centre: 90 do
      play_pattern_timed [78, 76, 76, [], 76, 76, 76, 76,
                          75, 75, 76, 76, [], 85, 83, 80,
                          78, 76, 76, [], 76, 76, 76, 76,
                          73, 73, 71, 71, [], 85, 83, 80,
                          ], 0.5
    end
  end
end

live_loop :saws do
  sync :piano
  ##| stop
  use_synth :tech_saws
  with_synth_defaults sustain_level: 0.75, release: 1.25, cutoff: 130, amp: 1.5 do
    play_pattern_timed [ch1,  ch2,  ch2,  [],
                        ch3,  ch3,  ch3,  ch3,
                        ch4,  ch4,  ch5,  ch6,
                        [],   ch7,  ch8,  ch9,
                        ch1,  ch2,  ch2,  [],
                        ch3,  ch3,  ch3,  ch3,
                        ch10, ch10, ch11, ch12,
    [],   ch7,  ch8,  ch9],
      0.5
  end
end

live_loop :break do
  sync :saws
  ##| stop
  2.times do
    sample samps, "apache", beat_stretch: 16, amp: 1.5, finish: 0.5
    2.times do
      sample :loop_amen, beat_stretch: 4
      2.times do
        sample samps, "hotpants", beat_stretch: 8, amp: 1.5, finish: 0.25
        sleep 2
      end
    end
  end
end