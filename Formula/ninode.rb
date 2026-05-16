class Ninode < Formula
  desc "Terminal-based server monitoring built with React 19 and OpenTUI"
  homepage "https://github.com/michaelsieminski/ninode"
  version "0.1.0"
  license "MIT"

  depends_on arch: :arm64 if OS.mac?

  on_macos do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-arm64"
      sha256 "3bd21b45b46050b4649ddd37c31f58f729388193096583e8c357ff874acb0287"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-arm64"
      sha256 "de0d9f3f2d818b690fa1440916e87eda8d7337c59d5fccf3a12ffb7ccdff5590"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-x64"
      sha256 "c4beebe3160dd9b5b4de0650b0138ddb526fc68cbf29f8c4be0fceb3da6a6019"
    end
  end

  def install
    binary = Dir["ninode-*"].first
    odie "no ninode binary found in download" if binary.nil?
    bin.install binary => "ninode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ninode --version")
  end
end
