GURL=(https://github.com/jeffreytse/zsh-vi-mode.git https://github.com/zsh-users/zsh-syntax-highlighting.git https://github.com/sindresorhus/pure.git)
for g in ${GURL[@]};
do
  echo git clone $g
  git clone $g
done
