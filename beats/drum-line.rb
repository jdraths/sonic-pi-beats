# http://citme.music.asu.edu/resources-steam/remixsonicpicode/
#========================#
# Coded by Jared O’Leary #
#   www.JaredOLeary.com  #
#========================#

use_random_seed 4
use_bpm 120
use_debug false

q = 1
e = 0.5
s = 0.25
t = 0.125
de = 0.75

count = 1
master_unquant = 0.05

live_loop :time do
  sleep 4
  count += 1
  count = 1 if (count > 4)
end

live_loop :floor do
  bd_arr = [(ring 10, 5, 10), (ring 6, 10, 6)]
  
  4.times do
    bd_unquant = rrand(0, master_unquant)
    sleep bd_unquant / 2
    
    sample :drum_bass_hard, amp: rrand(0.75, 1.1), rate: rrand(0.999, 1.001) unless one_in(10) || count > 3
    sample :drum_bass_hard, amp: rrand(0.75, 1.1), rate: rrand(0.999, 1.001) if one_in(3) && count == 4
    sleep s - (bd_unquant / 2)
    
    3.times do
      bd_unquant = rrand(0, master_unquant)
      sleep bd_unquant / 2
      sample :drum_bass_hard, amp: rrand(0.25, 1), rate: rrand(0.999, 1.001) if one_in(count == 4 ? bd_arr[1].tick : bd_arr[0].tick)
      
      sample :drum_splash_soft, amp: rrand(0.25, 1), rate: rrand(0.999, 1.001), release: 0.3 if one_in(6) && count == 4
      sleep s - (bd_unquant / 2)
    end
  end
end

live_loop :hhat do
  hh_amp = (ring 0.4, 0)
  hh_arr = [(ring 20, 10), (ring 10, 12, 20, 12), (ring 5, 12), (ring 1, 8)]
  hh_r = (ring 2, 4)
  
  if one_in(2)
    sample :drum_splash_hard, amp: rrand(0.2, 0.7), rate: rrand(0.999, 1.001) if one_in(2)
  else
    sample :drum_splash_soft, amp: rrand(0.2, 0.7), rate: rrand(0.999, 1.001) if one_in(2)
  end
  
  32.times do
    if one_in(2) && count > 1
      2.times do
        hh_unquant = rrand(0, master_unquant)
        sleep hh_unquant / 2
        sample :drum_cymbal_closed, amp: (rrand(0.15, 0.4) + hh_amp.tick), rate: rrand(0.999, 1.001) unless one_in(hh_arr[count - 1].tick)
        sleep t - (hh_unquant / 2)
        
        sleep hh_unquant / 2
        sample :drum_cymbal_closed, amp: (rrand(0.15, 0.4) + hh_amp.tick), rate: rrand(0.999, 1.001) if one_in(hh_arr[count - 1].tick) && count > 1
        sleep t - (hh_unquant / 2)
      end
    else
      hh_unquant = rrand(0, master_unquant)
      sleep hh_unquant / 2
      sample :drum_cymbal_closed, amp: (rrand(0.15, 0.4) + hh_amp.tick), rate: rrand(0.999, 1.001) if one_in(4) || count == 1
      sleep s - (hh_unquant / 2)
      
      hh_unquant = rrand(0, master_unquant)
      sleep hh_unquant / 2
      sample :drum_cymbal_closed, amp: (rrand(0.15, 0.4) + hh_amp.tick), rate: rrand(0.999, 1.001) if one_in(4) && count != 1
      sleep s - (hh_unquant / 2)
    end
  end
end

live_loop :snare, delay: q do
  sd_amp = (ring 0, 0.4)
  sd_arr = [(ring 20, 7, 6, 6), (ring 15, 4, 6, 5), (ring 10, 4, 8, 4), (ring 4, 3, 3, 3)]
  drums = [:drum_snare_soft, :drum_tom_lo_soft, :drum_tom_hi_soft, :drum_tom_mid_soft]
  
  sample :drum_snare_soft, amp: rrand(0.6, 1), rate: rrand(0.999, 1.001) unless one_in(20)
  8.times do
    sd_unquant = rrand(0, master_unquant)
    sleep sd_unquant / 2
    sample :drum_snare_soft, amp: (rrand(0.15, 0.5) + sd_amp.tick), rate: rrand(0.999, 1.001)  if one_in(sd_arr[count - 1].tick) && count < 4
    sample drums.choose, amp: (rrand(0.15, 0.5) + sd_amp.look), rate: rrand(0.999, 1.001)  if one_in(sd_arr[count - 1].look) && count == 4
    sleep s - (sd_unquant / 2)
  end
end