#!/bin/bash
ENVS="test qa prod"

if [[ $# -ne 1 ]]; then
    echo "Usage example:: bash $0 johnd"
    exit 2
fi

read -d '' parser << 'EOF'
BEGIN {
    FS=","
}

/^accounts:|^services::accounts:|^vars::logging_es::users:/ { ++n }

{
    if (p == 0) {
        if ($1 !~  /^    /) {
            p=1
        }
    }
    if (n == 3 ) {
        if ($1 == "  - username: "ENVIRON["USER"])
            p=0
    }
    else {
        if ($1 == "  "ENVIRON["USER"]":") {
            if (n == 1) {
                p=2
            }
            else {
                p=0
            }
        }
    }
    if (p != 0) {
        if (h == 1) {
            h=0
            if ($1 !~ /^    #/) {
                print $0
            }
        }
        else {
            print $0
        }
        if (p == 2){
            print "    ensure: absent"
            p=1
            h=1
        }
    }
}
EOF

for env in ${ENVS}; do
    USER=$1 awk "${parser}" "hieradata/env/${env}/accounts.yaml" > tmp
    mv tmp "hieradata/env/${env}/accounts.yaml"
done

echo "Done"
echo "Make sure, it still works, run:  git diff"
