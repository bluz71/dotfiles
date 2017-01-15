IEx.configure(
  colors: [eval_result: [:blue, :bright]],
  default_prompt: [
    "\e[G",
    [:green, :bright],
    "%prefix(%counter)",
    ">",
    :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string
)
