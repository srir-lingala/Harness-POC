resource "harness_platform_service" "example" {
  identifier  = "identifier"
  name        = "name"
  description = "test"
  org_id      = "org_id"
  project_id  = "project_id"

  ## SERVICE V2 UPDATE
  ## We now take in a YAML that can define the service definition for a given Service
  ## It isn't mandatory for Service creation 
  ## It is mandatory for Service use in a pipeline

  yaml = <<-EOT
                service:
  name: nginx primary
  identifier: nginx_primary
  serviceDefinition:
    type: Kubernetes
    spec:
      manifests:
        - manifest:
            identifier: Nginx
            type: HelmChart
            spec:
              store:
                type: Github
                spec:
                  connectorRef: sritest
                  gitFetchType: Commit
                  folderPath: /helm-charts/
                  repoName: <+pipeline.variables.HELM_REPO>
                  commitId: <+pipeline.variables.RELEASE_TAG>
              valuesPaths:
                - /helm-charts/Values.yaml
              skipResourceVersioning: false
              enableDeclarativeRollback: false
              helmVersion: V3
              gitOpsEnabled: false
              EOT
}
