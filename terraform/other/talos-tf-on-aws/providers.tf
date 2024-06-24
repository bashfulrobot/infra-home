provider "aws" {
  region = "eu-central-1"
  max_retries = 3
  profile = "draios-dev-developer"

  ignore_tags {
    key_prefixes = ["AutoTag_"]
  }
}
