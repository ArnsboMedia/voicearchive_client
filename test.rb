require 'voicearchive/v2/supplier_client'

Voicearchive::V2::SupplierClient.new('MySecretApiKey', 'https://system.voicearchive.com').search_suppliers(search: { status: '2,4' })
