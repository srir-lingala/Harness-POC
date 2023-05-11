resource "harness_platform_environment" "example" {
  identifier = "identifier"
  name       = "name"
  org_id     = "org_id"
  project_id = "project_id"
  tags       = ["foo:bar", "baz"]
  type       = "PreProduction"

  ## ENVIRONMENT V2 Update
  ## The YAML is needed if you want to define the Environment Variables and Overrides for the environment
  ## Not Mandatory for Environment Creation nor Pipeline Usage

  yaml = <<-EOT
               environment:
  name: Playpen-Primary-Prod
  identifier: ProductionPrimary
  description: ""
  tags: {}
  type: Production
  orgIdentifier: default
  projectIdentifier: nexus
  variables: []
  overrides:
    manifests:
      - manifest:
          identifier: Namespace
          type: Values
          spec:
            store:
              type: Harness
              spec:
                files:
                  - /Namespace/prodValues.yaml
      EOT
}
