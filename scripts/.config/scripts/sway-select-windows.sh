#!/usr/bin/env bash
# source: https://www.reddit.com/r/swaywm/comments/fjsrk9/need_a_bit_of_help_with_configuring_wofi/

swaymsg -t get_tree | jq -r '
        # descend to workspace or scratchpad
        .nodes[].nodes[]
        # save workspace name as .w
        | {"w": .name} + (
                if .nodes then # workspace
                        [recurse(.nodes[])]
                else # scratchpad
                        []
                end
                + .floating_nodes
                | .[]
                # select nodes with no children (windows)
                | select(.nodes==[])
        )
        | ((.id | tostring) + "\t "
        # remove markup and index from workspace name, replace scratch with "[S]"
        + (.w | sub("__i3_scratch"; "[S]"))
        + "\t " +  .name)
        ' | grep -v __i3_scratch | wofi --show dmenu --prompt='Focus a window' | {
    read -r id name
    swaymsg "[con_id=$id]" focus
}
