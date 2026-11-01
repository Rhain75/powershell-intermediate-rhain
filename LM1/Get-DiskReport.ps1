<#
.SYNOPSIS
Gets disk information from PC
.DESCRIPTION
Get-DiskReport uses Get-CimInstance to get the disk information from the pc I specify (if no name is given it checks the local pc)
.PARAMETER ComputerName
the name of the pc to check
.EXAMPLE PS C:> Get-DiskReport -ComputerName PC01
#>


function Get-DiskReport {
	param (
		[string]$ComputerName = "localhost"
	)
	
	Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $ComputerName
}