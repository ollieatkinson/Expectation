def bin_available? bin
  system("command -v #{bin} 2&> /dev/null")
  $?.success?
end
