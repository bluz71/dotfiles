IEx.configure(
  colors: [eval_result: [:green, :bright]],
  default_prompt: [
    "\e[G",
    [:blue],
    "%prefix(%counter)",
    ">",
    :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string
)
