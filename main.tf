resource "snowflake_api_authentication_integration_with_authorization_code_grant" "api_authentication_integration_with_authorization_code_grants" {
  for_each = var.api_authentication_integration_with_authorization_code_grants

  enabled                      = each.value.enabled
  name                         = each.value.name
  oauth_client_id              = each.value.oauth_client_id
  oauth_client_secret          = each.value.oauth_client_secret
  comment                      = each.value.comment
  oauth_access_token_validity  = each.value.oauth_access_token_validity
  oauth_allowed_scopes         = each.value.oauth_allowed_scopes
  oauth_authorization_endpoint = each.value.oauth_authorization_endpoint
  oauth_client_auth_method     = each.value.oauth_client_auth_method
  oauth_refresh_token_validity = each.value.oauth_refresh_token_validity
  oauth_token_endpoint         = each.value.oauth_token_endpoint

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

