function Get-DiskReport {
	Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName localhost
}