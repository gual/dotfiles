if status is-interactive
    if not set -q TMUX
        # List existing sessions
        set -l sessions (tmux list-sessions 2>/dev/null)
        
        if test (count $sessions) -eq 0
            # No sessions exist, create a new one
            tmux new-session -s main
        else
            # Sessions exist, attach to the first one or create new
            tmux attach-session -t main 2>/dev/null; or tmux new-session -s main
        end
    end
end

