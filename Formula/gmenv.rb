class Gmenv < Formula
  desc "Grey Matter version manager inspired by tfenv"
  homepage "https://github.com/greymatter-io/gmenv"
  url "https://github.com/chrisbsmith/gmenv/archive/0.2.3.tar.gz"
  sha256 "d1e116da9690abc02e7f96ad9b39058807a7f973d9858fb5f1ef3cecaf0a2275"
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
