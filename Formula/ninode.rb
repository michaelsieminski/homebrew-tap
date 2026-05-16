class Ninode < Formula
  desc "Terminal-based server monitoring built with React 19 and OpenTUI"
  homepage "https://github.com/michaelsieminski/ninode"
  version "0.1.2"
  license "MIT"

  depends_on arch: :arm64 if OS.mac?

  on_macos do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-arm64"
      sha256 "83d93db4a01b5772a763c2294b20ade830b6cdc6d249c88757d5c79ff863bb67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-arm64"
      sha256 "a6ab68f17bf216613897e40ff67dbc5d41edb2448beb702a8d89313424181ab6"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-x64"
      sha256 "3d24b3b2aaeae4ffd21a5bbe4401f09685c868119ee8733aea766e6f1d98f66d"
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
