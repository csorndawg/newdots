#!/usr/bin/env bash

## extra special comp enablement
_fzf_complete_special_notrigger() {
	FZF_COMPLETION_TRIGGER='' _fzf_host_completion
}
complete -o bashdefault -o default -F _fzf_complete_special_notrigger ssh
