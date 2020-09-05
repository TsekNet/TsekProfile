# Compute file hashes - useful for checking successful downloads
function Get-FileHash256 {
  $sha_256_hash = (Get-FileHash -Algorithm SHA256 $args).hash
  Write-Output "Hash for $args is '$sha_256_hash' (copied to clipboard)."
  $sha_256_hash | clip
}