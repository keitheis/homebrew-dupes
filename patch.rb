require 'formula'

class Patch < Formula
  homepage 'http://savannah.gnu.org/projects/patch/'
  # Use a slightly newer version with build fixes
  url 'http://alpha.gnu.org/gnu/patch/patch-2.6.1.136-31a7.tar.gz'
  md5 '80975a976d9adbcacb61fe6b002c559d'
  version '2.6.1'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
