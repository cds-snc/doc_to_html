locals {
    billing_code      = "CostCentre"
    domain            = "doc-to-html.tbs.alpha.canada.ca"
    account_id        = "730335533085"
    product_name      = "doc_to_html"
    billing_tag_value = "DocToHtml"
    cost_center_code = "doc_to_html"
  }

inputs = {
    account_id        = local.account_id 
    env               = "staging"
    product_name      = local.product_name
    cost_center_code  = local.cost_center_code
    billing_code      = local.billing_code
    billing_tag_value = local.billing_tag_value
    domain            = local.domain
  }