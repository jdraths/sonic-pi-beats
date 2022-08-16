
live_loop :oom_pa_pa do
  play :C2
  sleep 0.5
  play [:E4, :G4]
  sleep 0.5
  play [:E4, :G4]
  sleep 0.5
end

live_loop :boom_ching_a_ling do
  play :C4
  sleep 0.5
  play [:C5, :G5]
  sleep 0.25
  play [:C6, :G6]
  sleep 0.25
  play [:C5, :G5]
  sleep 0.5
end

# how can we improve this?
# 1. variables for the repeated notes & pairs
# 2. variables for the repeated sleep durations

live_loop :oom_pa_pa do
  # declarations
  oom = play :C2
  pa = play [:E4, :G4]
  beatSleep = sleep 0.5
  
  # music
  oom
  beatSleep
  pa
  beatSleep
  pa
  beatSleep
end

live_loop :boom_ching_a_ling do
  play :C4
  sleep 0.5
  play [:C5, :G5]
  sleep 0.25
  play [:C6, :G6]
  sleep 0.25
  play [:C5, :G5]
  sleep 0.5
end