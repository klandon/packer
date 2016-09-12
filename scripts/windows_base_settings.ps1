#Gets the content of EC2Config Config.xml and enables Password Generation, UserData and DynamicVolumeSize for next boot
    $EC2SettingsFile="$($Env:ProgramFiles)\Amazon\Ec2ConfigService\Settings\Config.xml"

    $xml = [xml](get-content $EC2SettingsFile)
    $xmlElement = $xml.get_DocumentElement()
    $xmlElementToModify = $xmlElement.Plugins

    write-log " Setting Config.xml"
    foreach ($element in $xmlElementToModify.Plugin)
    {
	    write-log " $($element.name)"
	    if ($element.name -eq "Ec2SetPassword")
	    {
		    $element.State="Enabled"
	    }
	    elseif ($element.name -eq "Ec2HandleUserData")
	    {
		    $element.State="Enabled"
	    }
	    elseif ($element.name -eq "Ec2DynamicBootVolumeSize")
	    {
		    $element.State="Enabled"
	    }
	    write-log "  $($element.State)"
    }
    $xml.Save($EC2SettingsFile)

#Gets the content of EC2Config BundleConfig.xml and enables the RDP Cert element so new cert is generated
    $EC2SettingsFile="$($Env:ProgramFiles)\Amazon\Ec2ConfigService\Settings\BundleConfig.xml"

    $xml = [xml](get-content $EC2SettingsFile)
    $xmlElement = $xml.get_DocumentElement()
    $xmlElementToModify = $xmlElement.Property

    write-log " Setting BundleConfig.xml"
    foreach ($element in $xmlElementToModify)
    {
	    write-log " $($element.name)"
	    if ($element.name -eq "SetPasswordAfterSysprep")
	    {
		    $element.Value="Yes"
	    }
	    write-log "  $($element.Value)"
    }
    $xml.Save($EC2SettingsFile)