import sys

if len(sys.argv) < 2:
    print("Usage: python3 generate_nginx.py <domain>")
    sys.exit(1)

domain_base = sys.argv[1]
instances = 8

template = """# Auto-generated nginx configuration for Augur instances

{servers}
"""

server_block = """
server {{
    listen 80;
    server_name augur{i}.{domain_base};

    location / {{
        proxy_pass http://127.0.0.1:{api_port};
    }}
}}
"""

servers = ""
for i in range(1, instances + 1):
    servers += server_block.format(i=i, api_port=6000+i, domain_base=domain_base)

with open("nginx.conf", "w") as f:
    f.write(template.format(servers=servers))

print(f"nginx.conf generated successfully for domain base: {domain_base}")
