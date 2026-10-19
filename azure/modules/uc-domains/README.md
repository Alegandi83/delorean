# Unity Catalog Discover domains

This module creates a Discover domain hierarchy backed by governed tags:

* One governed tag (`databricks_tag_policy`) for the domain: `tag_<deploy_id>_<domain>_<deploy_ver>`
* One governed tag for each subdomain: `tag_<deploy_id>_<domain>_<deploy_ver>/<subdomain>` (the Domains API requires subdomain tag keys in the form `<parent tag key>/<subdomain name>`)
* The top-level domain (`databricks_domain`) bound to the domain tag: `dom-<deploy_id>-<domain>-<deploy_ver>`
* One subdomain per entry of `subdomains`, child of the domain and bound to its own tag: `dom-<deploy_id>-<subdomain>-<deploy_ver>`

The domain name is set as `domain_id`, the only identifier the Domains API lets the caller choose (`name` is computed by the server as `domains/<domain_id>`). The domain ID must conform to RFC-1034 (lowercase letters, numbers and hyphens), so underscores in names are turned into hyphens.

Governed tags and domains are account-level objects, but they are managed through a workspace-level provider: call this module once, passing a single workspace provider, otherwise the same tag keys are created twice and the deployment fails.
