require 'formula'

class Diffutils < Formula
  homepage 'http://www.gnu.org/s/diffutils/'
  url 'http://ftpmirror.gnu.org/diffutils/diffutils-3.2.tar.gz'
  md5 '22e4deef5d8949a727b159d6bc65c1cc'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
