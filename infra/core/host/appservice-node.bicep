param environmentName string
param location string = resourceGroup().location

param allowedOrigins array = []
param appCommandLine string = ''
param applicationInsightsName string
param appServicePlanId string
param appSettings object = {}
param keyVaultName string = ''
param linuxFxVersion string = 'NODE|16-lts'
param managedIdentity bool = !(empty(keyVaultName))
param scmDoBuildDuringDeployment bool = false
param serviceName string

module web 'appservice.bicep' = {
  name: '${serviceName}-appservice-node'
  params: {
    environmentName: environmentName
    location: location
    allowedOrigins: allowedOrigins
    appCommandLine: appCommandLine
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlanId
    appSettings: appSettings
    keyVaultName: keyVaultName
    linuxFxVersion: linuxFxVersion
    managedIdentity: managedIdentity
    scmDoBuildDuringDeployment: scmDoBuildDuringDeployment
    serviceName: serviceName
  }
}

output identityPrincipalId string = web.outputs.identityPrincipalId
output name string = web.outputs.name
output uri string = web.outputs.uri
