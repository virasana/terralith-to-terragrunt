include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${find_in_parent_folders("catalog/modules")}//ddb"
}

inputs = {
  name = "best-cat-ks-20260104-dev"
}