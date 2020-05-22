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

    mkdir_p "#{etc}/gmenv/versions" if File.directory?("#{etc}/gmenv/versions")
    mkdir_p "versions"
    ln_s "#{etc}/gmenv/versions", "versions"
  end
  
  test do
    system bin/"gmenv", "--version"
  end
end
