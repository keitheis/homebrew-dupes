require 'formula'

class Zlib < Formula
  url 'http://zlib.net/zlib-1.2.6.tar.gz'
  homepage 'http://www.zlib.net/'
  md5 '618e944d7c7cd6521551e30b32322f4a'

  keg_only :provided_by_osx

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
