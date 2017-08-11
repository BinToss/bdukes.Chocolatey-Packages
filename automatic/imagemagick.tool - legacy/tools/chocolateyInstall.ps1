﻿$packageArgs = @{
  packageName    = 'imagemagick.tool'
  url            = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.8-3-portable-Q16-x86.zip'
  url64          = 'https://www.imagemagick.org/download/binaries/ImageMagick-6.9.8-3-portable-Q16-x64.zip'
  checksum       = 'a45aa42db08ee73ebd2770827d5058798ee70969a520e03b1f2a9e8086349da8'
  checksum64     = 'd681a376f89e184f792194daec5a2bc888b8297ef204bd973118d4e8f4e4f6e5'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

try {
    Get-WebHeaders $packageArgs.url
}
catch {
    $packageArgs.url = $packageArgs.url -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
    $packageArgs.url64 = $packageArgs.url64 -replace 'https://www.imagemagick.org/download/binaries/', 'http://ftp.icm.edu.pl/pub/graphics/ImageMagick/binaries/'
}

Install-ChocolateyZipPackage @packageArgs