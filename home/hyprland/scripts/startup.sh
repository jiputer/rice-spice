#!/bin/bash


export XCURSOR_THEME="Capitaine Cursors"
export XCURSOR_SIZE=24


######################
# Bash Completion
######################
# Enable ble.sh for live autosuggestions
# Blesh setup
#
BLE_SH_PATH="$(nix path-info nixpkgs#blesh)/share/blesh/ble.sh"

echo "$BLE_SH_PATH"
if [[ -f "$BLE_SH_PATH" && $- == *i* ]]; then
        echo "Sourcing ble.sh"
        export BLECON_CSI_PROMPT_MARK=1
        source "$BLE_SH_PATH" --noattach
        eval "$(starship init bash)"
        ble-attach
        # Gruvbox colors for ble.sh
        # Gruvbox colors for ble.sh with bright red

        # Argument parsing
        ble-face argument_error=fg=235,bg=#ff5f5f
        ble-face argument_option=fg=72
        ble-face auto_complete=fg=246,bg=223
        ble-face cmdinfo_cd_cdpath=fg=66,bg=72

        # Commands
        ble-face command_alias=fg=72
        ble-face command_builtin=fg=106
        ble-face command_builtin_dot=fg=#ff5f5f,bold
        ble-face command_directory=fg=66,underline
        ble-face command_file=fg=106
        ble-face command_function=fg=106
        ble-face command_jobs=fg=#ff5f5f,bold
        ble-face command_keyword=fg=66

        # Disabled
        ble-face disabled=fg=246

        # Filenames
        ble-face filename_block=fg=172,bg=235,underline
        ble-face filename_character=fg=223,bg=235,underline
        ble-face filename_directory=fg=66,underline
        ble-face filename_directory_sticky=fg=223,bg=66,underline
        ble-face filename_executable=fg=106,underline
        ble-face filename_link=fg=72,underline
        ble-face filename_ls_colors=underline
        ble-face filename_orphan=fg=72,bg=223,underline
        ble-face filename_other=underline
        ble-face filename_pipe=fg=106,bg=235,underline
        ble-face filename_setgid=fg=235,bg=172,underline
        ble-face filename_setuid=fg=235,bg=172,underline
        ble-face filename_socket=fg=72,bg=235,underline
        ble-face filename_url=fg=66,underline
        ble-face filename_warning=fg=#ff5f5f,underline

        # Overwrite mode
        ble-face overwrite_mode=fg=#282828,bg=#d65d0e

        # Prompt/status
        ble-face prompt_status_line=fg=223,bg=246

        # Regions
        ble-face region=fg=#282828,bg=#458588
        ble-face region_insert=fg=66,bg=223
        ble-face region_match=fg=223,bg=66
        ble-face region_target=fg=#282828,bg=#689d6a

        # Syntax
        ble-face syntax_brace=fg=72,bold
        ble-face syntax_command=fg=172
        ble-face syntax_comment=fg=246
        ble-face syntax_default=none
        ble-face syntax_delimiter=bold
        ble-face syntax_document=fg=246
        ble-face syntax_document_begin=fg=246,bold
        ble-face syntax_error=fg=#ff5f5f
        ble-face syntax_escape=fg=132
        ble-face syntax_expr=fg=66
        ble-face syntax_function_name=fg=106,bold
        ble-face syntax_glob=fg=#ff5f5f,bold
        ble-face syntax_history_expansion=fg=223,bg=66
        ble-face syntax_param_expansion=fg=132
        ble-face syntax_quotation=fg=106,bold
        ble-face syntax_quoted=fg=106
        ble-face syntax_tilde=fg=66,bold
        ble-face syntax_varname=fg=172

        # Variables
        ble-face varname_array=fg=172,bold
        ble-face varname_empty=fg=66
        ble-face varname_export=fg=#ff5f5f,bold
        ble-face varname_expr=fg=106,bold
        ble-face varname_hash=fg=72,bold
        ble-face varname_number=fg=106
        ble-face varname_readonly=fg=#ff5f5f
        ble-face varname_transform=fg=66,bold
        ble-face varname_unset=fg=#ff5f5f

        # Bells
        ble-face vbell=reverse
        ble-face vbell_erase=bg=223
        ble-face vbell_flash=fg=106,reverse

fi


######################
# FZF
######################
# (if fzf installed system-wide via NixOS config, fzf shell integration should be fine)

# Optional: Keybinding for fuzzy directory cd (Ctrl+F)
# fzf_cd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2>/dev/null | fzf +m)
#  if [ -n "$dir" ]; then
#    cd "$dir"
#  fi
# }
# Bind Ctrl+F to fzf_cd
# bind -x '"\C-f": fzf_cd'


######################
# Starship Prompt
######################
# Pretty prompt with git status, versions, battery, etc
eval "$(starship init bash)"

######################
# Environment Variables (optional tweaks)
######################
# Fzf default options: preview files, etc.
# export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND='fd --type d'
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# History
HISTSIZE=4000
HISTFILESIZE=10000

