if [ "$SHLVL" -eq 1 ] && [ -n "$SSH_AGENT_PID" ]; then
	if hash ssh-agent 2>/dev/null; then
		eval $(ssh-agent -k)
	fi
fi
echo "Have a nice day!"

