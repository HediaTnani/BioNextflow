#!/usr/bin/env nextflow 
/*
 * Copyright (c) 2018, Centre for Genomic Regulation (CRG).
 *
 *   This file is part of 'BioNextflow'.
 *
 *   BioNextflow is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   BioNextflow is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with BioNextflow.  If not, see <http://www.gnu.org/licenses/>.
 */

/* 
 *
 * @authors
 * Luca Cozzuto <lucacozzuto@gmail.com>
 *
 * 
 */
    


	process testFunction {
	echo true
	
	script:
	    def myclass = new Reporter(PI:"Luca", user:"Luca", email:"lucacozzuto@gmail.com", application:"NGS", id:"mm9", title:"RNAseq", subtitle:"subtitle ( ciccio) ")
	    myclass.makeMultiQCreport()
	}
	
