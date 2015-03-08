$count = 0



Function Fix-VPN{
  
  $result = Test-Connection www.google.com -Quiet
  Write-Host $result
  if($result){
  
   Write-Host "Nothing Wrong Here!"
   exit

  }

  else{

   Write-Host "Restarting VPN"
   cd 'C:\Program Files\pia_manager'
   .\pia_manager.exe
   Start-Sleep -s 60
   if($count -lt 5){
     $count++
     Fix-VPN
     }
   else{
    Write-Host "Tried 5 times, something else is effed"
   }
  }
}

Fix-VPN