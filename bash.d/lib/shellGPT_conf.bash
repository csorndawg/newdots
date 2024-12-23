#!/usr/bin/bash

# shellGPT secure configuration
#shellGPT_API_Key="$(cat ~/git/fortknox/secrets/shellGPT_API_Key.txt)"
shellGPT_API_Key="$(cat ~/git/fortknox/secrets/chatGPT_shellGPT_api_key.txt)"
export OPENAI_API_KEY="$shellGPT_API_Key"

#TODO: will add logic to allow for multiple/follow-up questions"
sgptf() {
	# accepts filepath ARG for multiline prompts
	CHATGPT_PROMPT_FILE_PATH="$1"
	CHATGPT_PROMPT_TEXT="$(cat $CHATGPT_PROMPT_FILE_PATH)"
	sgpt $CHATGPT_PROMPT_TEXT
}
