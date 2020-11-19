/*
*  skewer module
* warning is failing because of the biocontainers is not using gzip2
*/

params.LABEL = ""
params.EXTRAPARS = ""

params.OUTPUT = "bwa_out"
params.CONTAINER = "quay.io/biocontainers/skewer:0.1.126--h2d50403_1"

process getVersion {
    container params.CONTAINER

    output:
	stdout emit: out    
    
    shell:
    """
	skewer --version | grep skewer | sed s/\\\t//g
	"""
}


process trimWithSkewer {
    label (params.LABEL)
    tag { pair_id }
    container params.CONTAINER

    input:
    tuple val(pair_id), path(reads)

    output:
    tuple val(pair_id), path("*trimmed*.fastq.gz"), emit: trimmed_reads
    path "*trimmed.log", emit: trim_log
    
    """
    skewer ${params.EXTRAPARS} -t ${task.cpus} -n -u -o ${pair_id} -z ${reads}
    """
}


workflow SKEWER {
    take: 
    fastq
    
    main:
		out = trimWithSkewer(fastq)
    emit:
        out.trimmed_reads
        out.trim_log
}

workflow GET_VERSION {
    main:
		getVersion()
    emit:
    	getVersion.out
}    


 

