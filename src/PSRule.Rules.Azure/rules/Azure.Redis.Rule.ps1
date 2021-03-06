# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Validation rules for Azure Redis Cache
#

# Synopsis: Redis Cache should only accept secure connections
Rule 'Azure.Redis.NonSslPort' -Type 'Microsoft.Cache/Redis' -Tag @{ release = 'GA'; ruleSet = '2020_06' } {
    $TargetObject.properties.enableNonSslPort -eq $False
}

# Synopsis: Redis Cache should reject TLS versions older then 1.2
Rule 'Azure.Redis.MinTLS' -Type 'Microsoft.Cache/Redis' -Tag @{ release = 'GA'; ruleSet = '2020_06' } {
    $TargetObject.properties.minimumTlsVersion -eq '1.2'
}
