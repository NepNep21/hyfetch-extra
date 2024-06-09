# AUTOMATICALLY GENERATED by `shtab`



_shtab_hyfetch_option_strings=('-h' '--help' '-c' '--config' '-C' '--config-file' '-p' '--preset' '-m' '--mode' '-b' '--backend' '--c-scale' '--c-set-l' '-V' '--version' '--debug' '--distro' '--test-distro' '--ascii-file')



_shtab_hyfetch__p_choices=('map' 'aam' 'transage' 'rainbow' 'transgender' 'nonbinary' 'agender' 'queer' 'genderfluid' 'bisexual' 'pansexual' 'polysexual' 'omnisexual' 'omniromantic' 'gay-men' 'lesbian' 'abrosexual' 'asexual' 'aromantic' 'aroace1' 'aroace2' 'aroace3' 'autosexual' 'intergender' 'greygender' 'akiosexual' 'bigender' 'demigender' 'demiboy' 'demigirl' 'transmasculine' 'transfeminine' 'genderfaun' 'demifaun' 'genderfae' 'demifae' 'neutrois' 'biromantic1' 'biromantic2' 'autoromantic' 'boyflux2' 'finsexual' 'unlabeled1' 'unlabeled2' 'pangender' 'gendernonconforming1' 'gendernonconforming2' 'femboy' 'tomboy' 'gendervoid' 'voidgirl' 'voidboy' 'plural' 'beiyang' 'burger')
_shtab_hyfetch___preset_choices=('map' 'aam' 'transage' 'rainbow' 'transgender' 'nonbinary' 'agender' 'queer' 'genderfluid' 'bisexual' 'pansexual' 'polysexual' 'omnisexual' 'omniromantic' 'gay-men' 'lesbian' 'abrosexual' 'asexual' 'aromantic' 'aroace1' 'aroace2' 'aroace3' 'autosexual' 'intergender' 'greygender' 'akiosexual' 'bigender' 'demigender' 'demiboy' 'demigirl' 'transmasculine' 'transfeminine' 'genderfaun' 'demifaun' 'genderfae' 'demifae' 'neutrois' 'biromantic1' 'biromantic2' 'autoromantic' 'boyflux2' 'finsexual' 'unlabeled1' 'unlabeled2' 'pangender' 'gendernonconforming1' 'gendernonconforming2' 'femboy' 'tomboy' 'gendervoid' 'voidgirl' 'voidboy' 'plural' 'beiyang' 'burger')
_shtab_hyfetch__m_choices=('8bit' 'rgb')
_shtab_hyfetch___mode_choices=('8bit' 'rgb')
_shtab_hyfetch__b_choices=('neofetch' 'fastfetch' 'fastfetch-old')
_shtab_hyfetch___backend_choices=('neofetch' 'fastfetch' 'fastfetch-old')

_shtab_hyfetch__h_nargs=0
_shtab_hyfetch___help_nargs=0
_shtab_hyfetch__c_nargs=0
_shtab_hyfetch___config_nargs=0
_shtab_hyfetch__V_nargs=0
_shtab_hyfetch___version_nargs=0
_shtab_hyfetch___debug_nargs=0
_shtab_hyfetch___test_print_nargs=0
_shtab_hyfetch___ask_exit_nargs=0


# $1=COMP_WORDS[1]
_shtab_compgen_files() {
  compgen -f -- $1  # files
}

# $1=COMP_WORDS[1]
_shtab_compgen_dirs() {
  compgen -d -- $1  # recurse into subdirs
}

# $1=COMP_WORDS[1]
_shtab_replace_nonword() {
  echo "${1//[^[:word:]]/_}"
}

# set default values (called for the initial parser & any subparsers)
_set_parser_defaults() {
  local subparsers_var="${prefix}_subparsers[@]"
  sub_parsers=${!subparsers_var}

  local current_option_strings_var="${prefix}_option_strings[@]"
  current_option_strings=${!current_option_strings_var}

  completed_positional_actions=0

  _set_new_action "pos_${completed_positional_actions}" true
}

# $1=action identifier
# $2=positional action (bool)
# set all identifiers for an action's parameters
_set_new_action() {
  current_action="${prefix}_$(_shtab_replace_nonword $1)"

  local current_action_compgen_var=${current_action}_COMPGEN
  current_action_compgen="${!current_action_compgen_var}"

  local current_action_choices_var="${current_action}_choices[@]"
  current_action_choices="${!current_action_choices_var}"

  local current_action_nargs_var="${current_action}_nargs"
  if [ -n "${!current_action_nargs_var}" ]; then
    current_action_nargs="${!current_action_nargs_var}"
  else
    current_action_nargs=1
  fi

  current_action_args_start_index=$(( $word_index + 1 ))

  current_action_is_positional=$2
}

# Notes:
# `COMPREPLY`: what will be rendered after completion is triggered
# `completing_word`: currently typed word to generate completions for
# `${!var}`: evaluates the content of `var` and expand its content as a variable
#     hello="world"
#     x="hello"
#     ${!x} -> ${hello} -> "world"
_shtab_hyfetch() {
  local completing_word="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=()

  prefix=_shtab_hyfetch
  word_index=0
  _set_parser_defaults
  word_index=1

  # determine what arguments are appropriate for the current state
  # of the arg parser
  while [ $word_index -ne $COMP_CWORD ]; do
    local this_word="${COMP_WORDS[$word_index]}"

    if [[ -n $sub_parsers && " ${sub_parsers[@]} " =~ " ${this_word} " ]]; then
      # valid subcommand: add it to the prefix & reset the current action
      prefix="${prefix}_$(_shtab_replace_nonword $this_word)"
      _set_parser_defaults
    fi

    if [[ " ${current_option_strings[@]} " =~ " ${this_word} " ]]; then
      # a new action should be acquired (due to recognised option string or
      # no more input expected from current action);
      # the next positional action can fill in here
      _set_new_action $this_word false
    fi

    if [[ "$current_action_nargs" != "*" ]] && \
       [[ "$current_action_nargs" != "+" ]] && \
       [[ "$current_action_nargs" != *"..." ]] && \
       (( $word_index + 1 - $current_action_args_start_index >= \
          $current_action_nargs )); then
      $current_action_is_positional && let "completed_positional_actions += 1"
      _set_new_action "pos_${completed_positional_actions}" true
    fi

    let "word_index+=1"
  done

  # Generate the completions

  if [[ "${completing_word}" == -* ]]; then
    # optional argument started: use option strings
    COMPREPLY=( $(compgen -W "${current_option_strings[*]}" -- "${completing_word}") )
  else
    # use choices & compgen
    local IFS=$'\n' # items may contain spaces, so delimit using newline
    COMPREPLY=( $([ -n "${current_action_compgen}" ] \
                  && "${current_action_compgen}" "${completing_word}") )
    unset IFS
    COMPREPLY+=( $(compgen -W "${current_action_choices[*]}" -- "${completing_word}") )
  fi

  return 0
}

complete -o filenames -F _shtab_hyfetch hyfetch
