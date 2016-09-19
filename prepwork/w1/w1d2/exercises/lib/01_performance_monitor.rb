def measure(n = 1, &prc)
  start_time = Time.now
  n.times do
    prc.call
  end
  end_time = Time.now
  elapsed = ((end_time - start_time)/n).to_f
end
