
#! /usr/bin/env nix-shell

# Remove System administrator from Login screen:
sed -i 's/"SystemAccount=false"/"SystemAccount=true"/g' /var/lib/AccountsService/users/root
echo "Result after Login screen cleanup:"
cat /var/lib/AccountsService/users/root
