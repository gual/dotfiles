function gitlast
    # Default to 5 commits if no argument provided
    set -l count $argv[1]
    if test -z "$count"
        set count 5
    end
    
    # Cross-platform clipboard support
    if command -v pbcopy > /dev/null
        # macOS
        git log -n $count --stat | pbcopy
        echo "Last $count commits copied to clipboard (macOS)"
    else if command -v xclip > /dev/null
        # Linux with xclip
        git log -n $count --stat | xclip -selection clipboard
        echo "Last $count commits copied to clipboard (Linux/xclip)"
    else if command -v wl-copy > /dev/null
        # Linux with Wayland
        git log -n $count --stat | wl-copy
        echo "Last $count commits copied to clipboard (Linux/Wayland)"
    else if command -v clip.exe > /dev/null
        # Windows/WSL
        git log -n $count --stat | clip.exe
        echo "Last $count commits copied to clipboard (Windows)"
    else
        echo "Error: No clipboard utility found"
        echo "Please install one of: pbcopy (macOS), xclip (Linux), wl-copy (Wayland), or clip.exe (Windows)"
        return 1
    end
end
