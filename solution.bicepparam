using './solution.bicep'

param _artifactsLocation = ''
param _artifactsLocationSasToken = ''
param AppGroupName = 'none'
param AppGroupType = 'Desktop'
param avdOsImage = 'win11_23h2_office'
param ComputeGalleryName = ''
param ComputeGallerySubId = ''
param ComputeGalleryRG = ''
param ComputeGalleryImage = ''
param CustomRdpProperty = ''
param DCRStatus = ''
param DCRNewName = ''
param DCRExisting = ''
param dedicatedHostId = ''
param dedicatedHostTagName = ''
param DiskSku = 'Standard_LRS'
param diskEncryptionSetResId = ''
param DomainName = ''
param DomainUser = ''
param DomainPassword = ''
param HostPoolAltToken = ''
param HostPoolKind = 'Pooled'
param HostPoolLBType = 'DepthFirst'
param HostPoolName = 'none'
param HostPoolOption = 'New'
param HostPoolRGStatus = 'Existing'
param HostPoolWorkspaceName = 'none'
param KeyVaultDomainOption = false
param KeyVaultDomName = ''
param KeyVaultDomResId = ''
param KeyVaultLocalOption = false
param KeyVaultLocName = ''
param KeyVaultLocResId = ''
param LogAnalyticsRG = ''
param LogAnalyticsSubId = ''
param LogAnalyticsWorkspaceName = ''
param NumSessionHosts = 0
param NumUsersPerHost = 0
param PostDeployContainerId = ''
param PostDeployOption = false
param PostDeployOptVDOT = false
param PostDeployScript = ''
param ResGroupIdMonitor = ''
param ResourceGroupHP = ''
param ResourceGroupVMs = ''
param Restart = true
param RGVMsStatus = 'New'
param StartVmOnConnect = true
param Subnet = ''
param Tags = {}
param UpdateWindows = false
param UserIdentityName = 'none'
param OUPath = ''
param UseCustomImage = false
param VmIndexStart = 0
param VmPrefix = ''
param ValidationEnvironment = false
param VirtualNetwork = ''
param VirtualNetworkResourceGroup = ''
param VmPassword = ''
param VmSize = ''
param VmUsername = ''

