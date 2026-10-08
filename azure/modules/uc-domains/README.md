# Unity Catalog Discover domains

This module creates a Discover domain hierarchy backed by governed tags:

* One governed tag (`databricks_tag_policy`) for the domain: `tag_<deploy_id>_<domain>_<deploy_ver>`
* One governed tag for each subdomain: `tag_<deploy_id>_<subdomain>_<deploy_ver>`
* The top-level domain (`databricks_domain`) bound to the domain tag
* One subdomain per entry of `subdomains`, child of the domain and bound to its own tag

Governed tags and domains are account-level objects, but they are managed through a workspace-level provider: call this module once, passing a single workspace provider, otherwise the same tag keys are created twice and the deployment fails.
