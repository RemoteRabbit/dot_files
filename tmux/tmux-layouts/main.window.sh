# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "main"

# Split window into panes.
split_v 25
split_h 90
split_h 10

# Run commands.
#run_cmd "top"     # runs in active pane
#run_cmd "date" 1  # runs in pane 1
select_pane 2
run_cmd "cmatrix"
select_pane 4
run_cmd "cmatrix"

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
select_pane 1
run_cmd "vim ."
