param AutomationAccountName string
param HostPoolName string
param LogAnalyticsWorkspaceId string
param PooledHostPool bool
param WorkspaceName string

var HostPoolLogs = [
  {
    category: 'Checkpoint'
    enabled: true
  }
  {
    category: 'Error'
    enabled: true
  }
  {
    category: 'Management'
    enabled: true
  }
  {
    category: 'Connection'
    enabled: true
  }
  {
    category: 'HostRegistration'
    enabled: true
  }
  {
    category: 'AgentHealthStatus'
    enabled: true
  }
  {
    category: 'ConnectionGraphicsData'
    enabled: true
  }
]


resource workspace 'Microsoft.DesktopVirtualization/workspaces@2022-07-05-preview' existing = {
  name: WorkspaceName
}

resource workspaceDiagnostics 'Microsoft.Insights/diagnosticSettings@2020-02-02' = {
  name: 'diag-${WorkspaceName}'
  scope: workspace
  properties: {
    logs: [
      {
        category: 'Checkpoint'
        enabled: true
      }
      {
        category: 'Error'
        enabled: true
      }
      {
        category: 'Management'
        enabled: true
      }
      {
        category: 'Feed'
        enabled: true
      }
    ]
    workspaceId: LogAnalyticsWorkspaceId
  }
}

resource hostPool 'Microsoft.DesktopVirtualization/hostPools@2022-04-01-preview' existing = {
  name: HostPoolName
}

resource hostPoolDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'diag-${HostPoolName}'
  scope: hostPool
  properties: {
    logs: HostPoolLogs
    workspaceId: LogAnalyticsWorkspaceId
  }
}

resource automationAccount 'Microsoft.Automation/automationAccounts@2022-08-08' existing = if(PooledHostPool) {
  name: AutomationAccountName
}

resource automationAccountDiagnostics 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = if(PooledHostPool) {
  name: 'diag-${AutomationAccountName}'
  scope: automationAccount
  properties: {
    logs: [
      {
        category: 'JobLogs'
        enabled: true
      }
      {
        category: 'JobStreams'
        enabled: true
      }
    ]
    workspaceId: LogAnalyticsWorkspaceId
  }
}
