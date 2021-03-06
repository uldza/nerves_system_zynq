defmodule NervesSystemZynq.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_zynq,
     version: @version,
     elixir: "~> 1.3",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves, "~> 0.5", runtime: false},
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.10.0", runtime: false},
     {:nerves_system_br, "~> 0.12.0", runtime: false}]
  end

  defp description do
    """
    Nerves System - Digilent Zybo
    """
  end

  defp package do
    [maintainers: ["Uldza"],
     files: ["rootfs-additions", "board", "zynq-busybox.config", "LICENSE",
             "mix.exs", "nerves_defconfig", "nerves.exs", "README.md",
             "VERSION", "fwup.conf", "post-createfs.sh", "uboot-script.cmd"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/uldza/nerves_system_zynq"}]
  end
end
