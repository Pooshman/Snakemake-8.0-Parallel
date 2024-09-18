# Rule to generate input files
rule generate_input_files:
    output:
        expand("input_file_{i}.txt", i=range(1, 6))
    run:
        for i in range(1, 6):
            with open(f"input_file_{i}.txt", "w") as f:
                f.write(f"This is input file {i}")

# Rule to process each file (these will run in parallel)
rule process_files:
    input:
        "input_file_{i}.txt"
    output:
        "output_file_{i}.txt"
    shell:
        "echo Processing {input} > {output}"

# Rule to aggregate the results into a single file (optional)
rule aggregate_results:
    input:
        expand("output_file_{i}.txt", i=range(1, 6))
    output:
        "final_output.txt"
    shell:
        "cat {input} > {output}"
