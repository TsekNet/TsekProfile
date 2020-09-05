# Make it easy to edit this profile once it's installed
function Edit-Profile {
  if ($host.Name -match "ise") {
    $psISE.CurrentPowerShellTab.Files.Add($profile)
  }
  else {
    code-insiders $profile
  }
}