
## 🛠 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or higher
- Properly configured credentials for your cloud provider (e.g., AWS, Azure, GCP)
- Remote backend (optional but recommended)

## 🚀 Usage

Run the following commands from the root directory or specific environment/module directories.

### 1. Initialize Terraform
Initializes the working directory and downloads necessary providers and modules.

```bash
terraform init
```
### 2. Validate Terraform
Validate the current code before the plan.
```

terraform validate

```
### 3. Plan Terraform
If the code is validate then plan it. check the changes and output of code.
```

terraform plan
```
### 4. Apply Terraform
Finally apply the terraform creating the resources.
```

terraform apply
```
### 5. Destroy Terraform
If we want to delete the resources then run this command.
```

terraform destroy

