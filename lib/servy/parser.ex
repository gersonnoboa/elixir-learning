defmodule Servy.Parser do
  alias Servy.Conv

  def parse(request) do
    [top, params_string] = String.split(request, "\r\n\r\n")

    [request_line | header_lines] = top |> String.split("\r\n")

    headers = parse_headers(header_lines, %{})
    params = params_string |> parse_params(headers["Content-Type"])

    [method, path, _] =
      request_line
      |> String.split(" ")

    %Conv{method: method, path: path, params: params, headers: headers}
  end

  defp parse_params(params_string, "application/x-www-form-urlencoded") do
    params_string |> String.trim() |> URI.decode_query()
  end

  defp parse_params(_, _), do: %{}

  @doc """
  Parses

  ## Examples

  """
  def parse_headers([head | tail], headers) do
    [key, value] = String.split(head, ": ")
    headers = Map.put(headers, key, value)
    parse_headers(tail, headers)
  end

  def parse_headers([], headers), do: headers
end
