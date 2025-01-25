# Extends FZF_COMP functionality to specified custom aliases


# @FIXME: Below works for some of use cases not all, needs logic improvement
# example: grss wont work if you've removed the file since FZF_COMP_PATH wont see it 
# ... need actual git functions

GIT_ALIASES_LIST=(grm ga gd gstp grs grss gds gdm gdms gdo gdom gstpp)
for ga in ${GIT_ALIASES_LIST[@]}; do 
  echo "_fzf_setup_completion path $ga"
  _fzf_setup_completion path $ga
done
