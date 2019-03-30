defmodule AcordesWeb.TabView do
  use AcordesWeb, :view

  @note "Do#|Do|Reb|Re#|Re|Mib|Mi|Fa#|Fa|Solb|Sol#|Sol|Lab|La#|La|Sib|Si|C#|C|Db|D#|D|Eb|E|F#|F|Gb|G#|G|Ab|A#|A|Bb|B"
  @mode "maj7|7-4|m7|m|13|11|9|7|6|5|sus4|"
  @chord "(#{@note})(#{@mode})(/(#{@note}))?"

  @chord_regex ~r/#{@chord}/i
  @chord_line_regex ~r/\A(#{@chord}|\s|:|intro|riff)+\z/i

  def beautiful_content(content) do
    content
    |> String.split("\n")
    |> Enum.map(&beautify_if_chords_line/1)
    |> Enum.join("\n")
  end

  defp beautify_if_chords_line(line) do
    case is_chord_line?(line) do
      true -> String.replace(line, @chord_regex, "<span class=\"chord\">\\0</span>")
      _ -> line
    end
  end

  defp is_chord_line?(line) do
    String.match?(line, @chord_line_regex)
  end
end
