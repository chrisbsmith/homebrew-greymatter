class Gmenv < Formula
  desc "Grey Matter version manager inspired by tfenv"
  homepage "https://github.com/greymatter-io/gmenv"
  url "https://github.com/greymatter-io/gmenv/archive/0.2.1.tar.gz"
  sha256 "b5f1c3fc626a172211f99ff8be3d2140c3da8b781a048eec39a24f9966228a56"
  head "https://github.com/greymatter-io/gmenv.git"

  bottle :unneeded

  uses_from_macos "tar"

  def install
    prefix.install ["bin", "libexec", "lib"]
#     prefix.install "lib" if build.head?
  end

  def post_install
    versions_path = HOMEBREW_PREFIX/"etc/#{name}/versions"
    versions_local = "#{prefix}/versions"

    mkdir_p versions_path unless versions_path.directory?

    ln_s versions_path, versions_local
  end

  test do
    system bin/"gmenv", "--version"
  end
end
