class Ninode < Formula
  desc "Terminal-based server monitoring built with React 19 and OpenTUI"
  homepage "https://github.com/michaelsieminski/ninode"
  version "0.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
