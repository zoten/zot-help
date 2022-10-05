# Application

Debug, run, profile applications

## Slow starts

From [stratus3d post](https://stratus3d.com/blog/2022/08/17/debugging-a-slow-starting-elixir-application/?utm_medium=email&utm_source=elixir-radar)

```
defmodule StartupBenchmark do
  def run(application) do
    complete_deps = deps_list(application) # (1)

    dep_start_times = Enum.map(complete_deps, fn(app) -> # (2)
      case :timer.tc(fn() -> Application.start(app) end) do
        {time, :ok} -> {time, app}
        # Some dependencies like :kernel may have already been started, we can ignore them
        {time, {:error, {:already_started, _}}} -> {time, app}
        # Raise an exception if we get an non-successful return value
        {time, error} -> raise(error)
      end
    end)

    dep_start_times
    |> Enum.sort() # (3)
    |> Enum.reverse()
  end

  defp deps_list(app) do
    # Get all dependencies for the app
    deps = Application.spec(app, :applications)

    # Recursively call to get all sub-dependencies
    complete_deps = Enum.map(deps, fn(dep) -> deps_list(dep) end)

    # Build a complete list of sub dependencies, with the top level application
    # requiring them listed last, also remove any duplicates
    [complete_deps, [app]]
    |> List.flatten()
    |> Enum.uniq()
  end
end
```
