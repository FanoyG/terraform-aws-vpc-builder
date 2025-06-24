import os
from logger_setup import setup_logger

# Setup logging
logging = setup_logger()

print("🧙‍♂️ Welcome to IAM Builder CLI 🔐")
logging.info("Started IAM Builder CLI session")

# 🧑‍🤝‍🧑 Group
group = input("👉 Enter IAM group name: ").strip()
logging.info(f"Group Name: {group}")

# 👤 Users
users = input("👉 Enter IAM usernames (comma-separated): ").strip().split(',')
user_list = "[" + ",".join([f'"{u.strip()}"' for u in users]) + "]"
escaped_user_list = user_list.replace('"', '\\"')
logging.info(f"User List: {user_list}")

# 🔐 Extra Policies
extra_policies = input("🔐 Enter extra policy names (comma-separated, like AmazonEC2ReadOnlyAccess): ").strip().split(',')
full_arns = [
    '"arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"',
    '"arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"',
]
full_arns += [f'"arn:aws:iam::aws:policy/{p.strip()}"' for p in extra_policies if p.strip()]
policy_list = "[" + ",".join(full_arns) + "]"
escaped_policy_list = policy_list.replace('"', '\\"')
logging.info(f"Policy List: {policy_list}")

# 🏷️ Tags
print("\n🏷️ Enter Tags (press Enter to accept default values):")
owner = input("  Owner (default: Fanoy): ").strip() or "Fanoy"
project = input("  Project (default: IAM-Builder): ").strip() or "IAM-Builder"
managed_by = input("  ManagedBy (default: Terraform): ").strip() or "Terraform"
env = input("  Environment (default: dev): ").strip() or "dev"

tags = (
    '{'
    f'"Owner"="{owner}",'
    f'"Project"="{project}",'
    f'"ManagedBy"="{managed_by}",'
    f'"Environment"="{env}"'
    '}'
)
escaped_tags = tags.replace('"', '\\"')
logging.info(f"Tags: {tags}")

# ⚙️ Change to Terraform directory
os.chdir("environments/dev")

# 🚀 Run Terraform
cmd = (
    f'terraform apply -auto-approve '
    f'-var="group_name={group}" '
    f'-var="user_names={escaped_user_list}" '
    f'-var="group_policy_arns={escaped_policy_list}" '
    f'-var="default_tags={escaped_tags}"'
)

logging.info("Final Terraform Command:\n" + cmd)
print("\n📜 Running command:\n")
print(cmd)
os.system(cmd)
