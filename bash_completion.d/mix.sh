complete_mix_command() {
  [ -f mix.exs ] || exit 0
  mix help --search "$2"| cut -f1 -d'#' | cut -f2 -d' '
  return $?
}

complete -C complete_mix_command -o default mix
