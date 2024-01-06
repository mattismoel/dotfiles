echo "Welcome back, Mattis!"

if command -v fortune &> /dev/null && command -v cowsay &> /dev/null; then
  fortune | cowsay
  echo
fi
