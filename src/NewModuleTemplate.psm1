function New-PlasterModule {
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "", Justification="Just creates files", Scope="Function")]
  param(
    $Path
  )
  $TemplatePath = Join-Path $PSScriptRoot "Templates/NewModule"
  Invoke-Plaster -TemplatePath $TemplatePath -DestinationPath $Path
}