#!/usr/bin/env bash
#
# Description of the script.

## vanilla comp enablement (just enables default defined in fzf.config)
## batch1: echo/python/3//source/patch
complete -F __fzf_default_completion echo
complete -F __fzf_default_completion python
complete -F __fzf_default_completion python3
complete -F __fzf_default_completion bash
complete -F __fzf_default_completion source
complete -F __fzf_default_completion ansible
complete -F __fzf_default_completion ansible-playbook
complete -F __fzf_default_completion patch
complete -F __fzf_default_completion diff

## extra special comp enablement
_fzf_complete_special_notrigger() {
	FZF_COMPLETION_TRIGGER='' _fzf_host_completion
}
complete -o bashdefault -o default -F _fzf_complete_special_notrigger ssh
