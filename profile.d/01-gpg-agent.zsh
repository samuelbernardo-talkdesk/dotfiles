# gpg agent

# Set GNUPGHOME if unset
if [ -z ${GNUPGHOME+x} ]; then
  export GNUPGHOME="$HOME/.gnupg"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-agent --daemon --write-env-file "${GNUPGHOME}/.gpg-agent-info" >/dev/null 2>&1
fi

if [ -f "${GNUPGHOME}/.gpg-agent-info" ]; then
  . "${GNUPGHOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
#  export SSH_AUTH_SOCK
#  export SSH_AGENT_PID
fi

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

