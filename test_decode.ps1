$data = @{
  beads = @(
    @{a=-1.5708; ci=0; d='floral'; s=9; sh='round'; tx='default'};
    @{a=-0.7854; ci=6; d='wave'; s=10; sh='round'; tx='default'}
  )
  msg='Hello there!'
  from='Alice'
  sc='#c8a882'
  st=3
}

$json = $data | ConvertTo-Json -Compress
$bytes = [System.Text.Encoding]::UTF8.GetBytes($json)
$enc = [System.Convert]::ToBase64String($bytes)
Write-Host "ENCODED_LEN:" $enc.Length
Write-Host "ENCODED_SAMPLE:" $enc.Substring(0,[Math]::Min(96,$enc.Length))

# simulate decode
$decodedBytes = [System.Convert]::FromBase64String($enc)
$decoded = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
Write-Host "DECODED_JSON:" $decoded
$parsed = $decoded | ConvertFrom-Json
Write-Host "Parsed beads count:" ($parsed.beads).Count
