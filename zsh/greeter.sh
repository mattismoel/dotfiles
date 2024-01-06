echo "Welcome back, Mattis!"

if command -v fortune &> /dev/null && command -v cowsay &> /dev/null; then
  randomfortune=$(fortune)

  while [[ ${#randomfortune} -gt 100 ]]; do
    randomfortune="$(fortune)"
  done

  echo "$randomfortune" | cowsay
  echo
fi
