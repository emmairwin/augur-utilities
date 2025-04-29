# Generate ALTER TABLE statements for 512 partitioned constraints
output_file = "alter_constraints.sql"

with open(output_file, "w") as f:
    for i in range(1, 513):  # 1 to 512 inclusive
        constraint_name = f"issue_events_cntrb_id_fkey{i}"
        statement = f'''ALTER TABLE "augur_data"."issue_events" ALTER CONSTRAINT "{constraint_name}" DEFERRABLE INITIALLY DEFERRED;'''
        f.write(statement + "\n")

print(f"✅ SQL script written to {output_file}")

