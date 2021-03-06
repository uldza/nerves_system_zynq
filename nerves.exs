use Mix.Config

version =
  Path.join(__DIR__, "VERSION")
  |> File.read!
  |> String.strip

pkg = :nerves_system_zynq

config pkg, :nerves_env,
  type: :system,
  version: version,
  compiler: :nerves_package,
  artifact_url: [
    "https://github.com/uldza/nerves_system_zynq/raw/master/nerves_system_zynq.tar.gz"
  ],
  platform: Nerves.System.BR,
  platform_config: [
    defconfig: "nerves_defconfig",
  ],
  checksum: [
    "nerves_defconfig",
    "rootfs-additions",
    "fwup.conf",
    "zynq-busybox.config",
    "nerves.exs",
    "uboot-script.cmd",
    "post-createfs.sh",
    "board",
    "VERSION"
  ]
