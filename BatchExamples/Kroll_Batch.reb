Description: Kroll RECmd Batch File
Author: Andrew Rathbun
Version: 1.0
Id: ecc582d5-a1b1-4256-ae64-ca2263b8f971
Keys:
#
# --------------------
# TABLE OF CONTENTS
# --------------------
#
# System Info
# Devices
# Network Shares
# User Accounts
# Program Execution
# User Activity
# Autoruns
# Third Party Applications
# Cloud Storage
# Services
# Microsoft Office/Office 365
# Web Browsers
# Installed Software
# Antivirus
# Volume Shadow Copies
#
# --------------------
# ACKNOWLEDGEMENT
# --------------------
#
# Special thanks to Mike Cary and Troy Larson for their work on the other RECmd Batch files that helped inspire development of this Batch file
#
# --------------------
# VERSION HISTORY
# --------------------
#
# | 1.0 | 2021-02-14 | Initial release |
#
# --------------------
# DOCUMENTATION
# --------------------
#
# https://docs.microsoft.com/en-US/troubleshoot/windows-server/performance/windows-registry-advanced-users
#
# --------------------
# GUIDELINES
# --------------------
#
# If you're not going to Recursive: true on a key or subkey, please prepend with a Category -> Description comment before the series of multiple entries for the values to be parsed
# In the above instance, if possible, save all documentation for the last entry in a series, unless a specific helpful reference exists for a given ValueName
# If an entry is using a Plugin to generate output, please include a comment about which Plugin is being used below that entry in this batch file
#
# --------------------
# SYSTEM INFO
# --------------------

# System Info -> Basic System Info
    -
        Description: Windows Boot Volume
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup
        ValueName: SystemPartition
        Recursive: false
        Comment: "Identifies the system volume where Windows booted from"

# https://www.microsoftpressstore.com/articles/article.aspx?p=2201310
# https://stackoverflow.com/questions/15361617/retrieve-the-partition-number-of-bootmgr-on-windows-vista-and-later

    -
        Description: ControlSet Configuration
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Select
        ValueName: Current
        Recursive: false
        Comment: "Displays value for the current ControlSet"

# https://what-when-how.com/windows-forensic-analysis/registry-analysis-windows-forensic-analysis-part-3/
# https://msirevolution.wordpress.com/2012/03/31/what-is-currentcontrolset001-in-windows-registry/

    -
        Description: ControlSet Configuration
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Select
        ValueName: Default
        Recursive: false
        Comment: "Displays value for the default ControlSet"

# https://what-when-how.com/windows-forensic-analysis/registry-analysis-windows-forensic-analysis-part-3/
# https://msirevolution.wordpress.com/2012/03/31/what-is-currentcontrolset001-in-windows-registry/

    -
        Description: ControlSet Configuration
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Select
        ValueName: Failed
        Recursive: false
        Comment: "Displays value for the ControlSet that was unable to boot Windows successfully"

# https://what-when-how.com/windows-forensic-analysis/registry-analysis-windows-forensic-analysis-part-3/
# https://msirevolution.wordpress.com/2012/03/31/what-is-currentcontrolset001-in-windows-registry/

    -
        Description: ControlSet Configuration
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Select
        ValueName: LastKnownGood
        Recursive: false
        Comment: "Displays value for the last known good ControlSet"

# https://what-when-how.com/windows-forensic-analysis/registry-analysis-windows-forensic-analysis-part-3/
# https://msirevolution.wordpress.com/2012/03/31/what-is-currentcontrolset001-in-windows-registry/

    -
        Description: Shutdown Time
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet00*\Control\Windows
        ValueName: ShutdownTime
        Recursive: false
        IncludeBinary: true
        BinaryConvert: FILETIME
        Comment: "Last system shutdown time"

# https://www.winhelponline.com/blog/how-to-determine-the-last-shutdown-date-and-time-in-windows/

    -
        Description: Windows OS Language
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\Nls\Language
        ValueName: InstallLanguage
        Recursive: false
        Comment: "Default OS Language, 0409 is English"

# https://serverfault.com/questions/957167/windows-10-1809-region-language-registry-keys
# https://www.itprotoday.com/windows-78/where-registry-language-setting-each-user-stored

    -
        Description: Virtual Memory Pagefile Encryption Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: NtfsEncryptPagingFile
        Recursive: false
        Comment: "Virtual Memory Pagefile Encryption, 0 = Disabled, 1 = Enabled"

# https://www.tenforums.com/tutorials/77782-enable-disable-virtual-memory-pagefile-encryption-windows-10-a.html

    -
        Description: TRIM Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: DisableDeleteNotification
        Recursive: false
        Comment: "TRIM, 0 = Enabled, 1 = Disabled"

# https://www.howtogeek.com/257196/how-to-check-if-trim-is-enabled-for-your-ssd-and-enable-it-if-it-isnt/

    -
        Description: NTFS File Compression Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: NtfsDisableCompression
        Recursive: false
        Comment: "NTFS File Compression, 0 = Enabled, 1 = Disabled"

# https://thegeekpage.com/enable-disable-ntfs-compression-windows-improve-performance/
# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior

    -
        Description: NTFS File Encryption Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: NtfsDisableEncryption
        Recursive: false
        Comment: "NTFS File Encryption, 0 = Enabled, 1 = Disabled"

# https://www.tenforums.com/tutorials/97782-enable-disable-ntfs-file-encryption-windows.html
# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior

    -
        Description: NTFS LastAccess Timestamp Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: NtfsDisableLastAccessUpdate
        Recursive: false
        Comment: "NTFS LastAccess Timestamp, 2147483650 = Enabled, 1 = Disabled"

# https://dfir.ru/2018/12/08/the-last-access-updates-are-almost-back/
# https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-behavior

    -
        Description: Long Paths Enabled
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Control\FileSystem
        ValueName: LongPathsEnabled
        Recursive: false
        Comment: "NTFS Long Paths, 0 = Disabled, 1 = Enabled"

# https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/

    -
        Description: Prefetch Status
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet00*\Control\Session Manager\Memory Management\PrefetchParameters
        ValueName: EnablePrefetcher
        Recursive: false
        Comment: "0 = Disabled, 1 = Application Prefetching Enabled, 2 = Boot Prefetching Enabled, 3 = Application and Boot Prefetching Enabled"

# https://www.thewindowsclub.com/disable-superfetch-prefetch-ssd
# https://youtu.be/f4RAtR_3zcs
# https://resources.infosecinstitute.com/topic/windows-systems-artifacts-digital-forensics-part-iii-prefetch-files/
# https://www.hackingarticles.in/forensic-investigation-prefetch-file/
# https://countuponsecurity.com/2016/05/16/digital-forensics-prefetch-artifacts/
# https://or10nlabs.tech/prefetch-forensics/

    -
        Description: System Time Zone Information
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet00*\Control\TimeZoneInformation
        Recursive: false
        Comment: "Displays the current Time Zone configuration for this system"

# TimeZoneInfo plugin

# https://kb.digital-detective.net/display/BF/Identification+of+Time+Zone+Settings+on+Suspect+Computer

    -
        Description: Network Connections
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion\NetworkList
        Recursive: true
        Comment: "Displays list of network connections"

# KnownNetworks plugin

# System Info -> System Info (Current)

    -
        Description: System Info (Current)
        HiveType: NTUSER
        Category: System Info
        KeyPath: Software\Microsoft\Windows Media\WMSDK\General
        ValueName: ComputerName
        Recursive: false
        Comment: "Name of computer used by the user"
    -
        Description: System Info (Current)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet00*\Control\ComputerName\ComputerName
        ValueName: ComputerName
        Recursive: false
        Comment: "Name of computer used by the user"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: SystemRoot
        Recursive: false
        Comment: "Current location of %SystemRoot% Environment Variable"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: RegisteredOwner
        Recursive: false
        Comment: "Current registered owner"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: RegisteredOrganization
        Recursive: false
        Comment: "Current registered organization"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: DisplayVersion
        Recursive: false
        Comment: "Current milestone update version"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: InstallTime
        IncludeBinary: true
        BinaryConvert: FILETIME
        Recursive: false
        Comment: "Current OS install time"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: ProductName
        Recursive: false
        Comment: "Current OS name"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: InstallDate
        Recursive: false
        Comment: "Current OS install date"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: InstallationType
        Recursive: false
        Comment: "Current OS installation type"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: EditionID
        Recursive: false
        Comment: "Current OS version and install info"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: CurrentMajorVersionNumber
        Recursive: false
        Comment: "Current OS version and install info"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: CurrentBuildNumber
        Recursive: false
        Comment: "Current OS version and install info"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: CurrentBuild
        Recursive: false
        Comment: "Current OS build information"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: CompositionEditionID
        Recursive: false
        Comment: "Current OS license type"
    -
        Description: System Info (Current)
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Microsoft\Windows NT\CurrentVersion
        ValueName: BuildLab
        Recursive: false
        Comment: "Current OS build information"

# System Info -> System Info (Historical)

    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: SystemRoot
        Recursive: false
        Comment: "Historical location of %SystemRoot% Environment Variable"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: RegisteredOwner
        Recursive: false
        Comment: "Historical registered owner"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: RegisteredOrganization
        Recursive: false
        Comment: "Historical registered organization"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: DisplayVersion
        Recursive: false
        Comment: "Historical milestone update version"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: InstallTime
        IncludeBinary: true
        BinaryConvert: FILETIME
        Recursive: false
        Comment: "Historical OS install time"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: ProductName
        Recursive: false
        Comment: "Historical OS name"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: InstallDate
        Recursive: false
        Comment: "Historical OS install date"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: InstallationType
        Recursive: false
        Comment: "Historical OS installation type"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: EditionID
        Recursive: false
        Comment: "Historical OS version and install info"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: CurrentMajorVersionNumber
        Recursive: false
        Comment: "Historical OS version and install info"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: CurrentBuildNumber
        Recursive: false
        Comment: "Historical OS version and install info"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: CurrentBuild
        Recursive: false
        Comment: "Historical OS build information"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: CompositionEditionID
        Recursive: false
        Comment: "Historical OS license type"
    -
        Description: System Info (Historical)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: Setup\Source OS*
        ValueName: BuildLab
        Recursive: false
        Comment: "Historical OS build information"

# https://az4n6.blogspot.com/2017/02/when-windows-lies.html
# https://www.nextofwindows.com/when-was-my-windows-10-originally-installed

# System Info -> Network Configuration (IPv4)

# DHCPNetworkHints plugin not used

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: AddressType
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpConnForceBroadcastFlag
        Recursive: false
        Comment: "DHCP Broadcast, 0 = Disabled, 1 = Enabled"

# https://support.microsoft.com/en-us/topic/windows-vista-can-t-get-an-ip-address-from-certain-routers-or-dhcp-servers-ee61b030-e749-878b-9725-247d8bd95c5e

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpDefaultGateway
        Recursive: false
        Comment: "Displays the ordered list of gateways that can be used as the default gateway for this system."

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc959606(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpDomain
        Recursive: false
        Comment: "Specifies the Domain Name System (DNS) domain name of the interface, as provided by the Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962456(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpDomainSearchList
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpGatewayHardware
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpGatewayHardwareCount
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpIPAddress
        Recursive: false
        Comment: "Specifies the IP addresses of the interface, as configured by Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962469(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpNameServer
        Recursive: false
        Comment: "Stores a list of Domain Name System (DNS) servers to which Windows Sockets sends queries when it resolves names for the interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962470(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpServer
        Recursive: false
        Comment: "Stores the IP address of the Dynamic Host Configuration Protocol (DHCP) server that granted the lease to the IP address stored in the value of the DhcpIPAddress entry"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962473(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpSubnetMask
        Recursive: false
        Comment: "Specifies the subnet mask for the IP address specified in the value of either the IPAddress entry or the DhcpIPAddress entry"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962474(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: DhcpSubnetMaskOpt
        Recursive: false
        Comment: "Specifies the subnet mask associated with a Dynamic Host Configuration Protocol (DHCP) option"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962475(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: Domain
        Recursive: false
        Comment: "Specifies the Domain Name System (DNS) domain name of the interface, as provided by the Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962476(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: EnableDHCP
        Recursive: false
        Comment: "DHCP status, 0 = Disabled, 1 = Enabled"

# https://docs.microsoft.com/en-us/previous-versions/windows/desktop/mscs/enabledhcp

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: EnableMulticast
        Recursive: false
        Comment: "Multicast status, 0 = Disabled, 1 = Enabled"

# https://www.microsoftpressstore.com/articles/article.aspx?p=2217263&seqNum=8

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: IPAddress
        Recursive: false
        Comment: "Specifies the IP addresses of the interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc938245(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: IsServerNapAware
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: Lease
        Recursive: false
        Comment: "Specifies how long the lease on the IP address for this interface is valid"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978464(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: LeaseObtainedTime
        Recursive: false
        IncludeBinary: true
        BinaryConvert: EPOCH
        Comment: "Stores the time that the interface acquired the lease on its IP address"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978465(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: LeaseTerminatesTime
        Recursive: false
        IncludeBinary: true
        BinaryConvert: EPOCH
        Comment: "Stores the time when the lease on the interfaces' IP address expires"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978467(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: NameServer
        Recursive: false
        Comment: "Stores a list of Domain Name System (DNS) servers to which Windows Sockets sends queries when it resolves names for this interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978468(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: RegisterAdapterName
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: RegistrationEnabled
        Recursive: false
        Comment: "Dynamic DNS registration for a specific network interface controller (NIC)"

# https://www.serverbrain.org/networking-guide-2003/configuring-dynamic-dns-registration-problem.html

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: SubnetMask
        Recursive: false
        Comment: "Specifies the subnet mask for the IP address specified in the value of IPAddress or DhcpIPAddress"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc938248(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: T1
        Recursive: false
        Comment: "Displays time that the DHCP client stores for when the service will try to renew its IP address lease"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978470(v=technet.10)

    -
        Description: Network Configuration (IPv4)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip\Parameters\Interfaces\*
        ValueName: T2
        Recursive: false
        Comment: "Displays time that the DHCP client stores for when the service will try to broadcast a renewal request"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978471(v=technet.10)?redirectedfrom=MSDN

# System Info - Network Configuration (IPv6)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: AddressType
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpConnForceBroadcastFlag
        Recursive: false
        Comment: "DHCP Broadcast, 0 = Disabled, 1 = Enabled"

# https://support.microsoft.com/en-us/topic/windows-vista-can-t-get-an-ip-address-from-certain-routers-or-dhcp-servers-ee61b030-e749-878b-9725-247d8bd95c5e

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpDefaultGateway
        Recursive: false
        Comment: "Displays the ordered list of gateways that can be used as the default gateway for this system."

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc959606(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpDomain
        Recursive: false
        Comment: "Specifies the Domain Name System (DNS) domain name of the interface, as provided by the Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962456(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpDomainSearchList
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpGatewayHardware
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpGatewayHardwareCount
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpIPAddress
        Recursive: false
        Comment: "Specifies the IP addresses of the interface, as configured by Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962469(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpNameServer
        Recursive: false
        Comment: "Stores a list of Domain Name System (DNS) servers to which Windows Sockets sends queries when it resolves names for the interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962470(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpServer
        Recursive: false
        Comment: "Stores the IP address of the Dynamic Host Configuration Protocol (DHCP) server that granted the lease to the IP address stored in the value of the DhcpIPAddress entry"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962473(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpSubnetMask
        Recursive: false
        Comment: "Specifies the subnet mask for the IP address specified in the value of either the IPAddress entry or the DhcpIPAddress entry"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962474(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: DhcpSubnetMaskOpt
        Recursive: false
        Comment: "Specifies the subnet mask associated with a Dynamic Host Configuration Protocol (DHCP) option"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962475(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: Domain
        Recursive: false
        Comment: "Specifies the Domain Name System (DNS) domain name of the interface, as provided by the Dynamic Host Configuration Protocol (DHCP)"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc962476(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: EnableDHCP
        Recursive: false
        Comment: "DHCP status, 0 = Disabled, 1 = Enabled"

# https://docs.microsoft.com/en-us/previous-versions/windows/desktop/mscs/enabledhcp

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: EnableMulticast
        Recursive: false
        Comment: "Multicast status, 0 = Disabled, 1 = Enabled"

# https://www.microsoftpressstore.com/articles/article.aspx?p=2217263&seqNum=8

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: IPAddress
        Recursive: false
        Comment: "Specifies the IP addresses of the interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc938245(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: IsServerNapAware
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: Lease
        Recursive: false
        Comment: "Specifies how long the lease on the IP address for this interface is valid"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978464(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: LeaseObtainedTime
        Recursive: false
        IncludeBinary: true
        BinaryConvert: EPOCH
        Comment: "Stores the time that the interface acquired the lease on its IP address"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978465(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: LeaseTerminatesTime
        Recursive: false
        IncludeBinary: true
        BinaryConvert: EPOCH
        Comment: "Stores the time when the lease on the interfaces' IP address expires"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978467(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: NameServer
        Recursive: false
        Comment: "Stores a list of Domain Name System (DNS) servers to which Windows Sockets sends queries when it resolves names for this interface"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978468(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: RegisterAdapterName
        Recursive: false
        Comment: ""
    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: RegistrationEnabled
        Recursive: false
        Comment: "Dynamic DNS registration for a specific network interface controller (NIC)"

# https://www.serverbrain.org/networking-guide-2003/configuring-dynamic-dns-registration-problem.html

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: SubnetMask
        Recursive: false
        Comment: "Specifies the subnet mask for the IP address specified in the value of IPAddress or DhcpIPAddress"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc938248(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: T1
        Recursive: false
        Comment: "Displays time that the DHCP client stores for when the service will try to renew its IP address lease"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978470(v=technet.10)

    -
        Description: Network Configuration (IPv6)
        HiveType: SYSTEM
        Category: System Info
        KeyPath: ControlSet*\Services\Tcpip6\Parameters\Interfaces\*
        ValueName: T2
        Recursive: false
        Comment: "Displays time that the DHCP client stores for when the service will try to broadcast a renewal request"

# https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/cc978471(v=technet.10)?redirectedfrom=MSDN

    -
        Description: Windows 10 Timeline Status
        HiveType: SOFTWARE
        Category: System Info
        KeyPath: Policies\Microsoft\Windows\System
        ValueName: EnableActivityFeed
        Recursive: false
        Comment: "Windows 10 Activity Timeline status, 0 = Disabled, 1 = Enabled"

# https://www.majorgeeks.com/content/page/how_to_disable_or_enable_timeline_in_windows_10.html

# --------------------
# Devices
# --------------------

    -
        Description: Bluetooth Devices
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Services\BTHPORT\Parameters\Devices
        Recursive: true
        Comment: "Displays the Bluetooth devices that have been connected to this computer"

# BTHPORT plugin

    -
        Description: Volume Info Cache
        HiveType: SOFTWARE
        Category: Devices
        KeyPath: Microsoft\Windows Search\VolumeInfoCache\*
        Recursive: false
        Comment: "2 = Removable, 3 = Fixed, 4 = Network, 5 = Optical, 6 = RAM disk, 0 = Unknown"

# VolumeInfoCache plugin
# https://docs.microsoft.com/en-us/dotnet/api/system.io.drivetype?view=net-5.0

# Devices -> USBSTOR
    -
        Description: USBSTOR
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Enum\USBSTOR\*\*\Properties\*\0004
        Recursive: false
        Comment: "USB device name"
    -
        Description: USBSTOR
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Enum\USBSTOR\*\*\Properties\*\0064
        Recursive: false
        Comment: "USB device install date"

# https://www.jaiminton.com/cheatsheet/DFIR/#usb-information-1
# https://www.13cubed.com/downloads/dfir_cheat_sheet.pdf

    -
        Description: USBSTOR
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Enum\USBSTOR\*\*\Properties\*\0065
        Recursive: false
        Comment: "USB device first install date"

# https://www.swiftforensics.com/2013/11/windows-8-new-registry-artifacts-part-1.html

    -
        Description: USBSTOR
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Enum\USBSTOR\*\*\Properties\*\0066
        Recursive: false
        Comment: "USB device last connected"

# https://www.jaiminton.com/cheatsheet/DFIR/#usb-information-1
# https://www.13cubed.com/downloads/dfir_cheat_sheet.pdf

    -
        Description: USBSTOR
        HiveType: SYSTEM
        Category: Devices
        KeyPath: ControlSet*\Enum\USBSTOR\*\*\Properties\*\0067
        Recursive: false
        Comment: "USB device last removal"

# https://www.jaiminton.com/cheatsheet/DFIR/#usb-information-1
# https://www.13cubed.com/downloads/dfir_cheat_sheet.pdf

    -
        Description: MountPoints2
        HiveType: NTUSER
        Category: Devices
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2
        Recursive: true
        Comment: "Mount Points - NTUSER"

# https://www.sans.org/security-resources/posters/windows-forensic-analysis/170/download
# https://eforensicsmag.com/investigating-usb-drives-using-mount-points-not-drive-letters-by-ali-hadi/
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://www.forensicfocus.com/articles/forensic-analysis-of-the-windows-registry/

    -
        Description: Mounted Devices
        HiveType: SYSTEM
        Category: Devices
        KeyPath: MountedDevices
        Recursive: false
        Comment: "Last Write Timestamp is for entire key, not each individual value"

# MountedDevices plugin
# https://what-when-how.com/windows-forensic-analysis/registry-analysis-windows-forensic-analysis-part-6/
# https://hatsoffsecurity.com/2014/12/04/mounted-devices-key/
# https://www.forensicfocus.com/articles/forensic-analysis-of-the-windows-registry/
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://www.binary-zone.com/2020/04/03/no-drive-letter-no-usb-think-again/
# https://windowsir.blogspot.com/2004/12/mounted-devices.html

    -
        Description: Portable Devices
        HiveType: SOFTWARE
        Category: Devices
        KeyPath: Microsoft\Windows Portable Devices\Devices\
        Recursive: true
        Comment: "Portable Devices"

# https://df-stream.com/2017/10/amcache-and-usb-device-tracking/

# --------------------
# Network Shares
# --------------------

# Network Shares -> Network Shares
    -
        Description: Network Shares
        HiveType: NTUSER
        Category: Network Shares
        KeyPath: Network
        ValueName: RemotePath
        Recursive: true
        Comment: "Displays the UNC path for a mounted network share"
    -
        Description: Network Shares
        HiveType: NTUSER
        Category: Network Shares
        KeyPath: Network
        ValueName: UserName
        Recursive: true
        Comment: "Displays the user account associated with the mounted network share"
    -
        Description: Network Shares
        HiveType: NTUSER
        Category: Network Shares
        KeyPath: Network
        ValueName: ProviderName
        Recursive: true
        Comment: "Displays the provider of the mounted network share"

# https://social.technet.microsoft.com/Forums/ie/en-US/65eb8a2f-988f-40a7-b6ff-616a050c8efc/list-all-mapped-drives-for-all-users-that-have-logged-into-a-computer?forum=ITCG

    -
        Description: Network Drive MRU
        HiveType: NTUSER
        Category: Network Shares
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU
        Recursive: false
        Comment: "Displays drives that were mapped by the user"

# https://community.spiceworks.com/topic/137045-remove-previously-mapped-network-drive-paths
# https://answers.microsoft.com/en-us/windows/forum/windows_7-networking/cleanup-network-drives-list/1247aca3-deb6-493d-b937-24b40087cbc7?auth=1

# --------------------
# User Accounts
# --------------------

    -
        Description: User Accounts (SAM)
        HiveType: SAM
        Category: User Accounts
        KeyPath: SAM\Domains\Account\Users
        Recursive: false
        Comment: "User accounts in SAM hive"

# UserAccounts plugin

    -
        Description: User Accounts (SOFTWARE)
        HiveType: SOFTWARE
        Category: User Accounts
        KeyPath: Microsoft\Windows NT\CurrentVersion\ProfileList\*
        ValueName: Sid
        IncludeBinary: true
        BinaryConvert: SID
        Recursive: true
        Comment: "Displays user SIDs found on system"
    -
        Description: User Accounts (SOFTWARE)
        HiveType: SOFTWARE
        Category: User Accounts
        KeyPath: Microsoft\Windows NT\CurrentVersion\ProfileList\*
        ValueName: ProfileImagePath
        Recursive: true
        Comment: "Displays path to user's folder"

# https://content-calpoly-edu.s3.amazonaws.com/cci/1/documents/ccic_forensics_manual/CCIC%20Chapter%204%20-%20Understanding%20the%20Registry.pdf

    -
        Description: User Accounts (SECURITY)
        HiveType: SECURITY
        Category: User Accounts
        KeyPath: Policy\Accounts\*
        Recursive: false
        Comment: "SIDs for Windows built-in accounts"

# https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/security-identifiers-in-windows

# --------------------
# Program Execution
# --------------------

    -
        Description: JumplistData
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Search\JumplistData
        Recursive: false
        Comment: "Displays last execution time of a program"

# JumplistData plugin
# https://twitter.com/sv2hui/status/1005763370186891269?lang=en

    -
        Description: RecentApps
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Search\RecentApps
        Recursive: true
        Comment: "RecentApps"

# RecentApps plugin

    -
        Description: RunMRU
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
        Recursive: false
        Comment: "Tracks commands from the Run box in the Start menu, lower MRU # (Value Data3) = more recent"

# RunMRU plugin
# https://digitalf0rensics.wordpress.com/2014/01/17/windows-registry-and-forensics-part2/
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://silo.tips/download/a-forensic-analysis-of-the-windows-registry

    -
        Description: AppCompatCache
        HiveType: SYSTEM
        Category: Program Execution
        KeyPath: ControlSet00*\Control\Session Manager\AppCompatCache
        IncludeBinary: true
        BinaryConvert: FILETIME
        Recursive: false
        Comment: "AppCompatCache, review AppCompatCacheParser output"

# https://medium.com/@bromiley/windows-wednesday-shim-cache-1997ba8b13e7

    -
        Description: CIDSizeMRU
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU
        Recursive: false
        Comment: "Recently ran applications, lower MRU # (Value Data3) = more recent"

# CIDSizeMRU plugin
# https://windowsir.blogspot.com/2013/07/howto-determine-user-access-to-files.html
# https://windowsir.blogspot.com/2013/07/howto-determine-program-execution.html

# Program Execution -> BAM/DAM

    -
        Description: Background Activity Moderator (BAM)
        HiveType: SYSTEM
        Category: Program Execution
        KeyPath: ControlSet*\Services\BAM\State\UserSettings\*
        Recursive: false
        Comment: "Displays the last execution time of a program"

# BamDam plugin
# https://www.andreafortuna.org/2018/05/23/forensic-artifacts-evidences-of-program-execution-on-windows-systems/
# https://www.cellebrite.com/en/analyzing-program-execution-windows-artifacts/
# https://www.linkedin.com/pulse/alternative-prefetch-bam-costas-katsavounidis/

    -
        Description: Background Activity Moderator (BAM)
        HiveType: SYSTEM
        Category: Program Execution
        KeyPath: ControlSet*\Services\BAM\UserSettings\*
        Recursive: false
        Comment: "Displays the last execution time of a program"

# BamDam plugin
# https://www.andreafortuna.org/2018/05/23/forensic-artifacts-evidences-of-program-execution-on-windows-systems/
# https://www.cellebrite.com/en/analyzing-program-execution-windows-artifacts/
# https://www.linkedin.com/pulse/alternative-prefetch-bam-costas-katsavounidis/

    -
        Description: Desktop Activity Moderator (DAM)
        HiveType: SYSTEM
        Category: Program Execution
        KeyPath: ControlSet*\Services\DAM\State\UserSettings\*
        Recursive: false
        Comment: "DAM"

# BamDam plugin
# https://www.cellebrite.com/en/analyzing-program-execution-windows-artifacts/

    -
        Description: Desktop Activity Moderator (DAM)
        HiveType: SYSTEM
        Category: Program Execution
        KeyPath: ControlSet*\Services\DAM\UserSettings\*
        Recursive: false
        Comment: "DAM"

# BamDam plugin
# https://www.cellebrite.com/en/analyzing-program-execution-windows-artifacts/

    -
        Description: Regedit.exe Last Run
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Applets\Regedit
        Recursive: false
        Comment: "Displays the last key opened with RegEdit"

# https://www.thewindowsclub.com/jump-to-any-registry-key-windows
# https://renenyffenegger.ch/notes/Windows/registry/tree/HKEY_CURRENT_USER/Software/Microsoft/Windows/CurrentVersion/Applets/Regedit/index

    -
        Description: LastVisitedPidlMRU
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU
        Recursive: false
        Comment: "ValueData 3 for artifact details"

# LastVisitedPidlMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru
# https://digitalf0rensics.wordpress.com/2014/01/17/windows-registry-and-forensics-part2/
# https://www.eshlomo.us/windows-forensics-analysis-evidence/

    -
        Description: LastVisitedPidlMRULegacy
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy
        Recursive: false
        Comment: "Tracks previously opened folders, Value Data 3 for artifact details"

# LastVisitedPidlMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru
# https://digitalf0rensics.wordpress.com/2014/01/17/windows-registry-and-forensics-part2/
# https://www.eshlomo.us/windows-forensics-analysis-evidence/
# https://lifars.com/wp-content/uploads/2020/05/NTUSER-Technical-Guide.pdf

    -
        Description: UserAssist
        HiveType: NTUSER
        Category: Program Execution
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\*\Count
        Recursive: false
        Comment: "GUI-based programs launched from the desktop"

# UserAssist plugin
# https://www.sans.org/security-resources/posters/windows-forensic-analysis/170/download
# https://blog.didierstevens.com/programs/userassist/
# https://www.andreafortuna.org/2018/05/23/forensic-artifacts-evidences-of-program-execution-on-windows-systems/
# https://countuponsecurity.com/tag/userassist/
# https://www.cellebrite.com/en/analyzing-program-execution-windows-artifacts/

# --------------------
# User Activity
# --------------------

    -
        Description: Pinned Taskbar Items
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\TaskBand
        ValueName: Favorites
        Recursive: false
        Comment: "Displays pinned Taskbar items"

# TaskBand plugin
# https://tzworks.net/prototype_page.php?proto_id=19

    -
        Description: TypedPaths
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths
        Recursive: false
        Comment: "Displays paths that were typed by the user in Windows Explorer"

# https://www.hecfblog.com/2018/09/daily-blog-483-typed-paths-amnesia.html
# http://windowsir.blogspot.com/2013/07/howto-determine-user-access-to-files.html

    -
        Description: TypedURLs
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Internet Explorer\TypedURLs
        Recursive: false
        Comment: "Internet Explorer/Edge Typed URLs"

# TypedURLs plugin
# https://crucialsecurity.wordpress.com/2011/03/14/typedurls-part-1/
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://tzworks.net/prototype_page.php?proto_id=19

    -
        Description: MS Office MRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: SOFTWARE\Microsoft\Office\*\*\User MRU\*\*
        Recursive: true
        Comment: "MS Office Recent Files, lower Item value (Value Name) = more recent"

# OfficeMRU plugin
# https://www.eshlomo.us/windows-forensics-analysis-evidence/
# https://www.sans.org/security-resources/posters/windows-forensic-analysis/170/download
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://df-stream.com/category/microsoft-office-forensics/

    -
        Description: WordWheelQuery
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery
        Recursive: true
        Comment: "User Searches"

# https://www.sans.org/security-resources/posters/windows-forensic-analysis/170/download
# https://tzworks.net/prototype_page.php?proto_id=19
# https://www.forensicfocus.com/forums/general/how-to-check-what-words-have-been-searched-in-computer/

    -
        Description: OpenSavePidlMRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder
        Recursive: false
        Comment: "FirstFolder, tracks the application's first folder that is presented to the user during an Open or Save As operation"

# FirstFolder plugin
# https://research.ijcaonline.org/cognition2015/number4/cog2174.pdf
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru/

    -
        Description: OpenSavePidlMRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU
        Recursive: false
        Comment: "Tracks files that have been opened or saved within a Windows shell dialog box"

# OpenSavePidlMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru/

    -
        Description: LastVisitedPidlMRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU
        Recursive: false
        Comment: "Tracks the specific executable used by an application to open the files documented in OpenSavePidlMRU"

# LastVisitedPidlMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru/

    -
        Description: LastVisitedPidlMRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy
        Recursive: false
        Comment: "Tracks the specific executable used by an application to open the files documented in OpenSavePidlMRU"

# LastVisitedPidlMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru/

    -
        Description: LastVisitedMRU
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU
        Recursive: false
        Comment: "Displays list of executables and last visited times"

# LastVisitedMRU plugin
# https://www.sans.org/blog/opensavemru-and-lastvisitedmru
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/

    -
        Description: RecentDocs
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs
        Recursive: true
        Comment: "Files recently opened from Windows Explorer"

# RecentDocs plugin
# https://forensic4cast.com/2019/03/the-recentdocs-key-in-windows-10/
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/
# https://digitalf0rensics.wordpress.com/2014/01/17/windows-registry-and-forensics-part2/
# https://www.sans.org/security-resources/posters/windows-forensic-analysis/170/download

    -
        Description: Recent File List
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\*\*\Recent File List
        Recursive: false
        Comment: "Displays recent files accessed by the user with an application"
    -
        Description: Recent Folder List
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\*\*\Recent Folder List
        Recursive: false
        Comment: ""
    -
        Description: Recent Document List
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\*\*\Settings\Recent Document List
        Recursive: false
        Comment: ""
    -
        Description: Recent
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\*\*\Recent
        Recursive: false
        Comment: ""
    -
        Description: RecentFind
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\*\*\RecentFind
        Recursive: false
        Comment: ""
    -
        Description: Recent File List
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\*\Recent File List
        Recursive: false
        Comment: ""
    -
        Description: User Shell Folders
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
        Recursive: false
        Comment: "Displays where a user's Shell folders are mapped to"

# User Activity -> FeatureUsage

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppBadgeUpdated
        Recursive: true
        Comment: "Displays the number of times the user has received a notification for an application"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppLaunch
        Recursive: true
        Comment: "Displays the number of times a pinned application was launched from the taskbar"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched
        Recursive: true
        Comment: "Displays the number of times an application switched focus (i.e. minimized, maximized, etc)"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView
        Recursive: true
        Comment: "Displays the number of times an application was right-clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: StartButton
        Recursive: true
        Comment: "Displays the number of times the Start button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: ClockButton
        Recursive: true
        Comment: "Displays the number of times the Clock button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: MultitaskingButton
        Recursive: true
        Comment: "Displays the number of times the Multitasking button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: NotificationCenterButton
        Recursive: true
        Comment: "Displays the number of times the Notification Center button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: SearchButton
        Recursive: true
        Comment: "Displays the number of times the Search button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: SearchBox
        Recursive: true
        Comment: "Displays the number of times the Search box was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

    -
        Description: FeatureUsage
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\TrayButtonClicked
        ValueName: ShowDesktopButton
        Recursive: true
        Comment: "Displays the number of times the Show Desktop button was clicked"

# https://www.group-ib.com/blog/featureusage
# https://www.crowdstrike.com/blog/how-to-employ-featureusage-for-windows-10-taskbar-forensics/

# User Activity -> Terminal Server Client (RDP)

    -
        Description: Terminal Server Client (RDP)
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Terminal Server Client
        Recursive: false
        Comment: "Device(s) that have established RDP connection to this system"

# TerminalServerClient plugin
# Default subkey stores previous RDP connection entries the user has connected to
# UsernameHint value stores the username used on remote machine during RDP session
# https://jpcertcc.github.io/ToolAnalysisResultSheet/details/mstsc.htm
# https://docs.microsoft.com/en-us/troubleshoot/windows-server/remote/remove-entries-from-remote-desktop-connection-computer
# https://www.cyberfox.blog/tag/rdp-mru/
# https://ir3e.com/chapter-14-other-applications/

    -
        Description: Mapped Network Drives
        HiveType: NTUSER
        Category: User Activity
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU
        Recursive: false
        Comment: "Displays drives that were mapped by the user"

# https://community.spiceworks.com/topic/137045-remove-previously-mapped-network-drive-paths
# https://answers.microsoft.com/en-us/windows/forum/windows_7-networking/cleanup-network-drives-list/1247aca3-deb6-493d-b937-24b40087cbc7?auth=1

# --------------------
# Autoruns
# --------------------

# https://www.microsoftpressstore.com/articles/article.aspx?p=2762082

    -
        Description: Run (Group Policy)
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
        Recursive: false
        Comment: "Group Policy Run Key"
    -
        Description: Run (NTUSER)
        HiveType: NTUSER
        Category: Autoruns
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Run
        Recursive: false
        Comment: "Program execution upon successful user logon"

# https://docs.microsoft.com/en-us/windows/win32/setupapi/run-and-runonce-registry-keys
# https://www.andreafortuna.org/2017/10/18/windows-registry-in-forensic-analysis/

    -
        Description: RunOnce (NTUSER)
        HiveType: NTUSER
        Category: Autoruns
        KeyPath: Software\Microsoft\Windows\CurrentVersion\RunOnce
        Recursive: false
        Comment: "Program execution upon successful user logon"

# https://docs.microsoft.com/en-us/windows/win32/setupapi/run-and-runonce-registry-keys

    -
        Description: Run (SYSTEM)
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\Run
        Recursive: false
        Comment: "Program execution upon successful user logon"

# https://docs.microsoft.com/en-us/windows/win32/setupapi/run-and-runonce-registry-keys

    -
        Description: RunOnce (SYSTEM)
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\RunOnce
        Recursive: false
        Comment: "Program execution upon successful user logon"

# https://docs.microsoft.com/en-us/windows/win32/setupapi/run-and-runonce-registry-keys

# Autoruns -> Startup Programs (SOFTWARE\NTUSER)

    -
        Description: Startup Programs
        HiveType: NTUSER
        Category: Autoruns
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"
    -
        Description: Startup Programs
        HiveType: NTUSER
        Category: Autoruns
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"
    -
        Description: Startup Programs
        HiveType: NTUSER
        Category: Autoruns
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"
    -
        Description: Startup Programs
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"
    -
        Description: Startup Programs
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run32
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"
    -
        Description: Startup Programs
        HiveType: SOFTWARE
        Category: Autoruns
        KeyPath: Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\StartupFolder
        Recursive: true
        Comment: "Displays list of programs that start up upon system boot"

# https://www.hexacorn.com/blog/2019/02/23/beyond-good-ol-run-key-part-104/

    -
        Description: Scheduled Tasks (TaskCache)
        HiveType: Software
        Category: Autoruns
        KeyPath: Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tasks
        Recursive: false
        Comment: "Displays Scheduled Tasks and their last start/stop time"

# TaskCache plugin
# https://digital-forensics.sans.org/media/DFPS_FOR508_v4.4_1-19.pdf
# https://www.jaiminton.com/cheatsheet/DFIR/#t1060-registry-run-keys--startup-folder
# https://jpcertcc.github.io/ToolAnalysisResultSheet/details/schtasks.htm
# https://dfirtnt.wordpress.com/registry-persistence-paths/

# --------------------
# Third Party Applications
# --------------------

# Do not include anything in NTUSER or SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall as that is covered already by Installed Software entries
# Sometimes, there are values for third-party applications not covered under the standard DisplayVersion, Publisher, InstallLocation, InstallDate, and DisplayName entries. I've seen Inno Setup: User, Inno Setup: Language, and Inno Setup: App Path
# For this section, please include a subheader and a URL, even if its only one entry per program

# Third-Party Applications -> TeamViewer - https://www.teamviewer.com/en-us/

    -
        Description: TeamViewer
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\TeamViewer
        ValueName: Meeting_UserName
        Recursive: false
        Comment: "Windows username of logged in user"
    -
        Description: TeamViewer
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\TeamViewer
        ValueName: BuddyLoginName
        Recursive: false
        Comment: "User's email associated with TeamViewer"
    -
        Description: TeamViewer
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\TeamViewer
        ValueName: BuddyDisplayName
        Recursive: false
        Comment: "User specified TeamViewer display name"

# Third-Party Applications -> Adobe - https://www.adobe.com/

    -
        Description: Adobe cRecentFiles
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Adobe
        Recursive: false
        Comment: "Displays files which were opened Adobe Reader by the user"

# Adobe plugin

    -
        Description: Adobe cRecentFolders
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Adobe\Acrobat Reader\DC\AVGeneral\cRecentFolders\*
        ValueName: tDIText
        Recursive: false
        Comment: "Displays folders where Adobe Reader opened a PDF file from"

# Third-Party Applications -> 7-Zip - https://www.7-zip.org/

    -
        Description: 7-Zip
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\7-Zip\Compression
        ValueName: ArcHistory
        Recursive: false
        Comment: "Displays list of files and folders that were used with 7-Zip"

# SevenZip plugin

# Third-Party Applications -> WinRAR - https://www.rarlab.com/

    -
        Description: WinRAR
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\WinRAR\ArcHistory
        Recursive: true
        Comment: "Displays history of archives that were used with WinRAR"
    -
        Description: WinRAR
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\WinRAR\DialogEditHistory\ArcName
        Recursive: true
        Comment: "Displays history of archives that were edited with WinRAR"
    -
        Description: WinRAR
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\WinRAR\DialogEditHistory\ExtrPath
        Recursive: true
        Comment: "Displays history of extraction paths that were used with WinRAR"

    -
        Description: WinRAR
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: WinRAR\Capabilities\FileAssociations
        Recursive: false
        Comment: "Displays list of archive file extensions and their association with WinRAR"

# Third-Party Applications -> Eraser - https://eraser.heidi.ie/

    -
        Description: Eraser
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Eraser
        Recursive: true
        Comment: "Potential evidence of anti-forensics"

# Third-Party Applications -> LogMeIn - https://www.logmein.com/home2/v4

    -
        Description: LogMeIn
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\LogMeIn
        Recursive: true
        Comment: "LogMeIn GoToMeeting"

# Third-Party Applications -> Macrium Reflect - https://www.macrium.com/

    -
        Description: Macrium Reflect
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Macrium\Reflect\Recent Folders\Image\*
        Recursive: false
        Comment: "Macrium Reflect image storage directory"
    -
        Description: Macrium Reflect
        HiveType: SYSTEM
        Category: Third Party Applications
        KeyPath: ControlSet*\Control\BackupRestore\FilesNotToSnapshotMacriumImage
        Recursive: true
        Comment: "Displays files that are not to be included in Macrium Reflect images"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium
        ValueName: LastRun
        Recursive: true
        Comment: "Command last ran by user"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium
        ValueName: Licensee
        Recursive: true
        Comment: "registered user"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\CBT\Sequence
        IncludeBinary: true
        BinaryConvert: FILETIME
        Recursive: true
        Comment: "Displays timestamps related to Macrium Reflect's CBT feature"

# https://knowledgebase.macrium.com/display/KNOW72/Macrium+Changed+Block+Tracker
# https://forum.macrium.com/PrintTopic35786.aspx

    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\Defaults
        Recursive: true
        Comment: "Displays default settings associated with Macrium Reflect on this computer"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\ImageGuardian
        Recursive: false
        Comment: "Displays Macrium Image Guardian status"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\Security
        ValueName: SID
        Recursive: true
        Comment: "Displays SID associated with Macrium Reflect on this computer"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\Security
        ValueName: App Path
        Recursive: true
        Comment: "Displays the application path associated with Macrium Reflect on this computer"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\MIG\Verified
        Recursive: true
        Comment: "Macrium Image Guardian Status, 1 = protected"
    -
        Description: Macrium Reflect
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Macrium\Reflect\VSS
        Recursive: true
        Comment: "Displays settings related to Macrium Reflect's interaction with VSS"

# Third-Party Applications -> WinSCP - https://winscp.net/eng/index.php

    -
        Description: WinSCP
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Martin Prikryl
        Recursive: true
        Comment: "WinSCP"
    -
        Description: WinSCP
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: WOW6432Node\Martin Prikryl
        Recursive: true
        Comment: "WinSCP"

# Third-Party Applications -> Ares - https://www.ares.net/

    -
        Description: Ares
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: Ares
        Recursive: true
        Comment: "Displays information relating to Ares"

# Ares plugin

# Third-Party Applications -> Soulseek - https://www.slsknet.org/news/

    -
        Description: Soulseek
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{8A4E1646-488C-4E5B-AC31-F784400E8D2D}_is1
        ValueName: "Inno Setup: User"
        Recursive: true
        Comment: "Displays the name of the user who installed Soulseek"
    -
        Description: Soulseek
        HiveType: SOFTWARE
        Category: Third Party Applications
        KeyPath: WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{8A4E1646-488C-4E5B-AC31-F784400E8D2D}_is1
        ValueName: "Inno Setup: Language"
        Recursive: true
        Comment: "Displays the language for which Soulseek was installed"

# Third-Party Applications -> Signal - https://signal.org/en/

    -
        Description: Signal
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\7d96caee-06e6-597c-9f2f-c7bb2e0948b4
        ValueName: InstallLocation
        Recursive: true
        Comment: "Displays the location where Signal is installed on the user's computer"

# Third-Party Applications -> Stardock Fences - https://www.stardock.com/products/fences/

    -
        Description: Stardock Fences
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Stardock\Fences\InitialSnapshot
        Recursive: true
        Comment: "Displays a list of links the user had on their desktop at the time of installation"
    -
        Description: Stardock Fences
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Stardock\Fences\Icons
        Recursive: true
        Comment: "Displays a list of icons on the user's desktop"
    -
        Description: Stardock Fences
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Stardock\Fences\Settings
        ValueName: ResolutionLast
        Recursive: true
        Comment: "Displays a list of connected monitors to the user's computer"
    -
        Description: Stardock Fences
        HiveType: NTUSER
        Category: Third Party Applications
        KeyPath: Software\Stardock\Fences\Settings
        ValueName: PrimaryMonitorLast
        Recursive: true
        Comment: "Displays the user's primary monitor"

# --------------------
# Cloud Storage
# --------------------

# Cloud Storage -> OneDrive

    -
        Description: OneDrive
        HiveType: NTUSER
        Category: Cloud Storage
        KeyPath: Software\Microsoft\Office\*\Common\Internet\Server*\http*\*
        Recursive: false
        Comment: "Displays folders present within a user's OneDrive"
    -
        Description: OneDrive
        HiveType: NTUSER
        Category: Cloud Storage
        KeyPath: Environment
        ValueName: OneDriveConsumer
        Recursive: false
        Comment: "Displays the user's (check HivePath) specified storage location for OneDrive"
    -
        Description: OneDrive
        HiveType: SOFTWARE
        Category: Cloud Storage
        KeyPath: Microsoft\Windows\CurrentVersion\Explorer\SyncRootManager\Dropbox*\UserSyncRoots
        Recursive: true
        Comment: "Displays the user's specified storage location for Dropbox"

# Cloud Storage -> Dropbox

    -
        Description: Dropbox
        HiveType: SOFTWARE
        Category: Cloud Storage
        KeyPath: Microsoft\Windows\CurrentVersion\Explorer\SyncRootManager\OneDrive*\UserSyncRoots
        Recursive: true
        Comment: "Displays the user's specified storage location for OneDrive"

# --------------------
# Services
# --------------------

    -
        Description: Services
        HiveType: SYSTEM
        Category: Services
        KeyPath: ControlSet*\Services
        Recursive: true
        Comment: "Displays list of services running on this computer"

# Services plugin

# --------------------
# Microsoft Office/Office 365
# --------------------

#    -
#        Description: Microsoft Office
#        HiveType: NTUSER
#        Category: Microsoft Office
#        KeyPath: Software\Microsoft\Office
#        Recursive: true
#        Comment: "Microsoft Office registry artifacts"
#
# Uncomment this if you want ALL registry artifacts for Microsoft Office. Be sure to comment out the below values since you won't need them anymore. On my system, recursive on the entire MS Office key returned 16,000+ lines.

    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: EmailAddresses
        Recursive: false
        Comment: "Lists email addresses registered to Microsoft Office on the user's system"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: EmailAddress
        Recursive: false
        Comment: "Lists email address registered to Microsoft Office on the user's system"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: FirstName
        Recursive: false
        Comment: "Lists first name for the registered Microsoft Office user"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: LastName
        Recursive: false
        Comment: "Lists last name for the registered Microsoft Office user"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: FriendlyName
        Recursive: false
        Comment: "Lists full name for the registered Microsoft Office user"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*
        ValueName: Initials
        Recursive: false
        Comment: "Lists initials for the registered Microsoft Office user"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Identities\*\AuthHistory
        Recursive: true
        IncludeBinary: true
        BinaryConvert: FILETIME
        Comment: "Displays time user was authenticated to the system's instance of Microsoft 365 for the first time"
    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\Common\Identity\Profiles\*
        Recursive: true
        Comment: "Displays time user was authenticated to the system's instance of Microsoft 365 for the first time"

    -
        Description: Microsoft Office
        HiveType: NTUSER
        Category: Microsoft Office
        KeyPath: Software\Microsoft\Office\*\*\Security\Trusted Documents\TrustRecords
        Recursive: true
        Comment: "Displays list of Office documents where the user may have clicked Enable Editing, Enable Macro, or Enable Content"

# TrustedDocuments plugin

# --------------------
# Web Browsers
# --------------------

    -
        Description: Google Chrome
        HiveType: NTUSER
        Category: Web Browsers
        KeyPath: Software\Google\Chrome
        Recursive: true
        Comment: "Google Chrome registry artifacts"
    -
        Description: Internet Explorer
        HiveType: NTUSER
        Category: Web Browsers
        KeyPath: Software\Microsoft\Internet Explorer
        Recursive: true
        Comment: "Internet Explorer registry artifacts"
    -
        Description: Microsoft Edge
        HiveType: NTUSER
        Category: Web Browsers
        KeyPath: Software\Microsoft\Edge
        Recursive: true
        Comment: "Microsoft Edge registry artifacts"

# --------------------
# Installed Software
# --------------------

    -
        Description: App Paths
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\App Paths\*
        Recursive: false
        Comment: "App Paths"

    -
        Description: App Paths
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\*
        Recursive: true
        Comment: "App Paths"

    -
        Description: File Extensions
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts
        Recursive: false
        Comment: "Tracks programs associated with file extensions"

# FileExts plugin
# https://www.marshall.edu/forensics/files/Brewer-PosterFinal.pdf
# https://digital-forensics.sans.org/summit-archives/2012/taking-registry-analysis-to-the-next-level.pdf

# Installed Software -> Add/Remove Program Entries
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: DisplayName
        Recursive: false
        Comment: "Displays name of installed software"
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: InstallDate
        Recursive: false
        Comment: "Displays date of software install, usually stored as YYYYMMDD"
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: Publisher
        Recursive: false
        Comment: "Displays developer of installed software"
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: DisplayVersion
        Recursive: false
        Comment: "Displays version of installed software"
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: EstimatedSize
        Recursive: false
        Comment: "Displays estimated size of installed software in kilobytes"
    -
        Description: Add/Remove Programs Entries
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: InstallLocation
        Recursive: false
        Comment: "Displays install location of installed software"

# https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/find-installed-software

# Installed Software -> InstallProperties
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: DisplayName
        Recursive: false
        Comment: "Displays the product name of the installed software"

# https://www.digitalforensics.com/blog/coreldraw-forensics-step-by-step/
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: InstallDate
        Recursive: false
        Comment: "Displays date of software install, usually stored as YYYYMMDD"
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: InstallSource
        Recursive: false
        Comment: "Displays the install source of the installed software (DisplayName)"
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: Publisher
        Recursive: false
        Comment: "Displays the Publisher of the installed software (DisplayName)"
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: RegCompany
        Recursive: false
        Comment: "Displays the Registered Company of the installed software (DisplayName)"
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: RegOwner
        Recursive: false
        Comment: "Displays the Registered Owner of the installed software (DisplayName)"
    -
        Description: Installed Software (InstallProperties)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Microsoft\Windows\CurrentVersion\Installer\UserData\*\Products\*\InstallProperties
        ValueName: DisplayVersion
        Recursive: false
        Comment: "Displays the version of the installed software (DisplayName)"

# Installed Software - Wow6432 (32-bit software installed on 64-bit OS)
    -
        Description: Installed Software (32-bit)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: DisplayName
        Recursive: false
        Comment: "Displays name of 32-bit software installed on 64-bit OS"
    -
        Description: Installed Software (32-bit)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: InstallDate
        Recursive: false
        Comment: "Displays install date (YYYYMMDD) of 32-bit software installed on 64-bit OS"
    -
        Description: Installed Software (32-bit)
        HiveType: SOFTWARE
        Category: Installed Software
        KeyPath: Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: Publisher
        Recursive: false
        Comment: "Displays Publisher of 32-bit software installed on 64-bit OS"

# https://www.advancedinstaller.com/user-guide/registry-wow6432-node.html
# https://docs.microsoft.com/en-us/windows/win32/sysinfo/32-bit-and-64-bit-application-data-in-the-registry

    -
        Description: Uninstall DisplayName
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: DisplayName
        Recursive: false
        Comment:
    -
        Description: Uninstall InstallDate
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: InstallDate
        Recursive: false
        Comment:
    -
        Description: Uninstall Publisher
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: Publisher
        Recursive: false
        Comment:
    -
        Description: Wow6432Node Uninstall DisplayName
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Wow6432Node\Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: DisplayName
        Recursive: false
        Comment:
    -
        Description: Wow6432Node Uninstall InstallDate
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Wow6432Node\Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: InstallDate
        Recursive: false
        Comment:
    -
        Description: Wow6432Node Uninstall Publisher
        HiveType: NTUSER
        Category: Installed Software
        KeyPath: Wow6432Node\Software\Microsoft\Windows\CurrentVersion\Uninstall\*
        ValueName: Publisher
        Recursive: false
        Comment:

# --------------------
# Antivirus
# --------------------

    -
        Description: Windows Defender
        HiveType: SOFTWARE
        Category: Antivirus
        KeyPath: Microsoft\Windows Defender\Real-Time Protection
        Recursive: false
        Comment: "Windows Defender Real-Time Protection Status, 0 = Enabled, 1 = Disabled"

# https://www.windowsphoneinfo.com/threads/cannot-open-security-dashboard-for-windows-defender.114537/

# --------------------
# Volume Shadow Copies
# --------------------

# https://docs.microsoft.com/en-us/windows/win32/vss/volume-shadow-copy-service-portal

    -
        Description: VSS
        HiveType: SYSTEM
        Category: Volume Shadow Copies
        KeyPath: ControlSet*\Control\BackupRestore\FilesNotToSnapshot
        Recursive: true
        Comment: "Displays files to be deleted from newly created shadow copies"

# https://medium.com/@bromiley/windows-wednesday-volume-shadow-copies-d20b60997c22#.11p1cb258
# https://docs.microsoft.com/en-us/windows/win32/backup/registry-keys-for-backup-and-restore#filesnottosnapshot

    -
        Description: VSS
        HiveType: SYSTEM
        Category: Volume Shadow Copies
        KeyPath: ControlSet*\Control\BackupRestore\FilesNotToSnapshotSave
        Recursive: true
        Comment: "Displays files to be deleted from newly created shadow copies"

# https://medium.com/@bromiley/windows-wednesday-volume-shadow-copies-d20b60997c22#.11p1cb258
# https://docs.microsoft.com/en-us/windows/win32/backup/registry-keys-for-backup-and-restore

    -
        Description: VSS
        HiveType: SYSTEM
        Category: Volume Shadow Copies
        KeyPath: ControlSet*\Control\BackupRestore\KeysNotToRestore
        Recursive: true
        Comment: "Displays the names of the registry subkeys and values that backup applications should not restore"

# https://medium.com/@bromiley/windows-wednesday-volume-shadow-copies-d20b60997c22#.11p1cb258
# https://docs.microsoft.com/en-us/windows/win32/backup/registry-keys-for-backup-and-restore#keysnottorestore

    -
        Description: VSS
        HiveType: SYSTEM
        Category: Volume Shadow Copies
        KeyPath: ControlSet*\Control\BackupRestore\FilesNotToBackup
        Recursive: true
        Comment: "Displays the names of the files and directories that backup applications should not backup or restore"

# https://medium.com/@bromiley/windows-wednesday-volume-shadow-copies-d20b60997c22#.11p1cb258
# https://docs.microsoft.com/en-us/windows/win32/backup/registry-keys-for-backup-and-restore#filesnottobackup

# More to come...stay tuned!
