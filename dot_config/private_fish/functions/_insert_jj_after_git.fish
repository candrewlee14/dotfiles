function _insert_jj_after_git
    # Get current items
    set -l current_items $tide_left_prompt_items
    
    # Check if jj already exists
    if not contains jj $current_items
        # Find git's position
        set -l git_pos (contains -i git $current_items)
        
        if test $git_pos -gt 0
            # Create new list: items before git + git + jj + items after git
            set -l new_items $current_items[1..$git_pos] jj $current_items[(math $git_pos + 1)..-1]
            
            # Update the universal variable
            set -U tide_left_prompt_items $new_items
        end
    end
end
