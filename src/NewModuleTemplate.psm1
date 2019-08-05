function New-VznModule {
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "", Justification="Just creates files", Scope="Function")]
  param(
    $Path
  )
  $TemplatePath = Join-Path $PSScriptRoot "Templates/VznModule"
  Invoke-Plaster -TemplatePath $TemplatePath -DestinationPath $Path
}