# ~/.bashrc: executed by bash for interactive shells.

# Source global definitions if available
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable Starship prompt
eval "$(starship init bash)"

# Handy aliases
alias ll='ls -lah --color=auto'
alias ls='ls --color=auto'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias ..='cd ..'
alias ...='cd ../..'

# Environment variables
export EDITOR=vim
export HISTCONTROL=ignoredups:erasedups  # avoid duplicate entries
export HISTSIZE=10000
export HISTFILESIZE=20000

# Enable color support for ls and grep if available
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
fi

# Add your custom functions or variables below

# Add terminal-config directory to PATH so custom scripts inside can be run from anywhere
export PATH="$HOME/terminal-config:$PATH"

# Add betterlockscreen to PATH for easy command access
export PATH="$PATH:$HOME/.local/bin"

# Ollama start chat 
function ollama-start-chat() {
  local history_file="$HOME/.ollama_chat_history.txt"
  local CYAN='\033[0;36m'
  local NC='\033[0m' # No Color

  # Create history file if it doesn't exist (but don't print contents)
  if [[ ! -f "$history_file" ]]; then
    touch "$history_file"
  fi

  echo "Starting Ollama chat with llama3. Type 'exit' to quit."

  while true; do
    # Show prompt with cyan "You:" label
    echo -ne "${CYAN}You:${NC} "
    read -r input
    [[ "$input" == "exit" ]] && break

    # Append your message to history with label (no colors)
    echo -e "You: $input" >> "$history_file"

    # Blank line before Ollama responds
    echo ""

    # Get Ollama response using full history as prompt
    response=$(cat "$history_file" | ollama run llama3)

    # Display with Ollama prompt and color, with blank line before for spacing
    echo -e "\n${CYAN}Ollama:${NC} $response"

    # Save Ollama response to history with label (no color codes)
    echo -e "Ollama: $response" >> "$history_file"
  done

  echo "Chat session ended."
}

export PATH="$HOME/.npm/bin:$PATH"

export PATH="$HOME/zig-linux-x86_64-0.13.0:$PATH"
export PATH=$PATH:/usr/lib/protonmail/bridge

#BAT THEME
export BAT_THEME="Dracula"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/jrm423/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/jrm423/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/jrm423/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/jrm423/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
fastfetch
