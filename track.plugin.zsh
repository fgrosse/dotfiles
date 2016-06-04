function _track_commands() {
  local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
      subcommand)
        subcommands=(
          "add:Add a new activity"
          "commit:Commit all tracked activities to redmine"
          "continue:Start a new activity using the name of an existing activity"
          "edit:Edit an existing activity"
          "ls:Show all activities of a day"
          "print:Print information about tracked activities"
          "rm:Remove an activity by ID"
          "stop:Stop the currently running activity"
        )
        _describe -t subcommands 'commands' subcommands && ret=0
    esac

    return ret
}

compdef _track_commands track
