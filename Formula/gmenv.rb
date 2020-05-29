class Gmenv < Formula
  desc "Grey Matter version manager inspired by tfenv"
  homepage "https://github.com/greymatter-io/gmenv"
  url "https://github.com/chrisbsmith/gmenv/archive/0.2.6.tar.gz"
  sha256 "f8d3c4647ffc0435ec1f71786d6c000f8a32aeb939c0d0846fb9996e1e2b9d43"
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
