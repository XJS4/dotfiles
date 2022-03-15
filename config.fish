if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo (whoami)@(hostnamectl --static) (pwd) "% "
end

set fish_greeting  "Welcome <|._.|>"

alias cls="clear"
alias dir="ls -la"
alias :q="exit"
