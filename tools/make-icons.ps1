param([string]$Out)
Add-Type -AssemblyName System.Drawing
New-Item -ItemType Directory -Force $Out | Out-Null

$cobalt = [System.Drawing.Color]::FromArgb(27,58,138)
$deep   = [System.Drawing.Color]::FromArgb(20,45,110)
$turq   = [System.Drawing.Color]::FromArgb(95,214,202)
$red    = [System.Drawing.Color]::FromArgb(196,18,47)
$white  = [System.Drawing.Color]::White

function Draw-Rosette($g, [float]$cx, [float]$cy, [float]$s, [bool]$filled, [bool]$letter) {
  # rosette in a -50..50 unit box, scaled by $s px per unit
  $petal = New-Object System.Drawing.Drawing2D.GraphicsPath
  $petal.AddBezier([float]0,[float]-20,[float]11,[float]-27,[float]11,[float]-39,[float]0,[float]-46)
  $petal.AddBezier([float]0,[float]-46,[float]-11,[float]-39,[float]-11,[float]-27,[float]0,[float]-20)
  $petal.CloseFigure()
  $turqBrush = New-Object System.Drawing.SolidBrush $turq
  $pen = New-Object System.Drawing.Pen $turq, ([float](3.4*$s))
  for ($k = 0; $k -lt 8; $k++) {
    $p = $petal.Clone()
    $m = New-Object System.Drawing.Drawing2D.Matrix
    $m.Translate($cx, $cy); $m.Scale($s, $s); $m.Rotate(45*$k)
    $p.Transform($m)
    if ($filled) { $g.FillPath($turqBrush, $p) } else { $g.DrawPath($pen, $p) }
  }
  $r = 48*$s
  $g.DrawEllipse($pen, $cx-$r, $cy-$r, 2*$r, 2*$r)
  $rc = 16*$s
  if ($filled) {
    $g.FillEllipse((New-Object System.Drawing.SolidBrush $red), $cx-$rc, $cy-$rc, 2*$rc, 2*$rc)
  } else { $g.DrawEllipse($pen, $cx-$rc, $cy-$rc, 2*$rc, 2*$rc) }
  if ($letter) {
    $font = New-Object System.Drawing.Font 'Georgia', ([float](19*$s)), ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = 'Center'; $sf.LineAlignment = 'Center'
    $g.DrawString([string][char]0x00C7, $font, (New-Object System.Drawing.SolidBrush $white), (New-Object System.Drawing.RectangleF ($cx-$rc*1.5), ($cy-$rc*1.5+1.2*$s), (3*$rc), (3*$rc)), $sf)
  }
}

function New-Canvas([int]$w, [int]$h) {
  $bmp = New-Object System.Drawing.Bitmap $w, $h
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.SmoothingMode = 'AntiAlias'; $g.TextRenderingHint = 'AntiAliasGridFit'; $g.InterpolationMode = 'HighQualityBicubic'
  $g.Clear($cobalt)
  return @($bmp, $g)
}

function Save-Icon([int]$size, [float]$frac, [string]$name) {
  $c = New-Canvas $size $size; $bmp = $c[0]; $g = $c[1]
  # outer ring radius = 48 units -> frac of size
  $s = ($size * $frac) / 48
  Draw-Rosette $g ($size/2) ($size/2) $s $true ($size -ge 64)
  $bmp.Save((Join-Path $Out $name), [System.Drawing.Imaging.ImageFormat]::Png)
  $g.Dispose(); $bmp.Dispose()
}

Save-Icon 512 0.40 'icon-512.png'
Save-Icon 192 0.40 'icon-192.png'
Save-Icon 512 0.31 'icon-maskable-512.png'
Save-Icon 180 0.36 'apple-touch-icon.png'
Save-Icon 64  0.44 'favicon-64.png'

# share preview 1200x630
$c = New-Canvas 1200 630; $bmp = $c[0]; $g = $c[1]
$band = New-Object System.Drawing.SolidBrush $deep
$g.FillRectangle($band, 0, 0, 1200, 56); $g.FillRectangle($band, 0, 574, 1200, 56)
for ($x = 28; $x -lt 1200; $x += 56) { Draw-Rosette $g $x 28 0.48 $false $false; Draw-Rosette $g $x 602 0.48 $false $false }
Draw-Rosette $g 1015 315 3.4 $true $true
$u=[char]0xFC; $cc=[char]0xE7; $nd=[char]0x2013; $md=[char]0xB7
$title = New-Object System.Drawing.Font 'Georgia', 74, ([System.Drawing.FontStyle]::Bold), ([System.Drawing.GraphicsUnit]::Pixel)
$sub = New-Object System.Drawing.Font 'Segoe UI', 32, ([System.Drawing.FontStyle]::Regular), ([System.Drawing.GraphicsUnit]::Pixel)
$subBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(219,228,255))
$g.DrawString("T${u}rk${cc}e Derinlik", $title, (New-Object System.Drawing.SolidBrush $white), 70, 180)
$g.FillRectangle((New-Object System.Drawing.SolidBrush $red), 78, 290, 90, 8)
$g.DrawString("B2${nd}C2 Turkish for heritage speakers", $sub, $subBrush, 74, 325)
$g.DrawString("Flashcards ${md} grammar ${md} Istanbul accent", $sub, $subBrush, 74, 375)
$bmp.Save((Join-Path $Out 'og-image.png'), [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
Get-ChildItem $Out | Select-Object Name, Length
