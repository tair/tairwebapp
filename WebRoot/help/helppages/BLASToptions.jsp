<html>
  <head>
    <title>BLAST Options and Defaults</title>
  </head>

<BODY BGCOLOR="#ffffff">
  
  <h1>BLAST Options and Defaults</h1>
  
  <table border = 1>
  <TR>
  <th> </th>
  <th><a href = "BLAST_help.jsp#methods">BLASTN</a></th>
  <th><a href = "BLAST_help.jsp#methods">BLASTP</a></th>
  <th><a href = "BLAST_help.jsp#methods">BLASTX</a></th>
  <th><a href = "BLAST_help.jsp#methods">TBLASTN</a></th>
  <th><a href = "BLAST_help.jsp#methods">TBLASTX</a></th>
  <th><a href = "BLAST_help.jsp#methods">PSIBLAST</a></th>
  </tr>
  <tr>
  <td><a name = "open"><a href="BLAST_help.jsp#open"><b>Gap opening penalty</b></a>:<br>
  cost to open a gap [integer]</td>
  <td align = center>default = 5</td>
  <td align = center>default = 11<br>
  limited <a href = "#value">values</a> are supported</td>
  <td align = center>default = 11<br>
  limited <a href = "#value">values</a> are supported</td>
  <td align = center>default = 11<br>
  limited <a href = "#value">values</a> are supported</td>
  <td align = center>default = 11<br>
  limited <a href = "#value">values</a> are supported</td>
  <td align = center>default = 5</td>
  </tr>
  <tr>
  <td><a name = "extend"><a href="BLAST_help.jsp#extend"><b>Gap extension penalty</b></a>:<br>
  cost to extend a gap [integer]</td>
  <td align = center>default = 2</td>
  <td align = center>default = 1<br>
    a 0 in this field means to use the default</td>
  <td align = center>default = 1<br>
    a 0 in this field means to use the default</td>
  <td align = center>default = 1<br>
    a 0 in this field means to use the default</td>
    <td align = center>default = 1<br>
    a 0 in this field means to use the default</td>
  <td align = center>default = 2</td> 
  </tr>
  <tr>
  <td><a name = "match"><a href="BLAST_help.jsp#match"><b>Nucleic match</b></a>:<br>
  reward for a match in the BLAST portion of run [integer]</td>
  <td align = center>default = 1</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>default = 1</td>
  </tr>
  <tr>
  <td width = "30"><a name = "mismatch"><a href="BLAST_help.jsp#mismatch"><b>Nucleic mismatch</b></a>:<br>
  penalty for a mismatch in the blast portion of run [integer]</td>
  <td align = center>default = -3</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>default = -3</td>
  </tr>
  <tr>
  <td width = "30"><b><a name="expect"><a href = "BLAST_help.jsp#expect">Expectation value</a></b>:<br>
  (E) [real]</td>
  <td align = center>default = 10.0</td>
  <td align = center>default = 10.0</td>
  <td align = center>default = 10.0</td>
  <td align = center>default = 10.0</td>
  <td align = center>default = 10.0</td>
  <td align = center>default = 10.0</td>
  </tr>
  <tr>
  <td width = "30"><a name = "word"><a href = "BLAST_help.jsp#word"><b>Word size</b></a>:<br>
  the size of the initial word that must be matched between the database and the query sequence</td>
  <td align = center>default = 11</td>
  <td align = center>default = 3</td>
  <td align = center>default = 3</td>
  <td align = center>default = 3</td>
  <td align = center>default = 3</td>
  <td align = center>default = 11</td>
  </tr>
  <tr>
  <td width = "30"><a name="descriptions"><a href = "BLAST_help.jsp#descriptions"><b>Max scores</b></a>:<br>
  Number of one-line descriptions (V) [Integer]</td>
  <td align = center>default = 25</td>
  <td align = center>default = 25</td>
  <td align = center>default = 25</td>
  <td align = center>default = 25</td>
  <td align = center>default = 25</td>
  <td align = center>default = 25</td>
  </tr>
  <tr>
  <td width = "30"><b><a name="alignments"><a href = "BLAST_help.jsp#alignments">Max alignments</b></a>:<br>
  number of alignments to show (B) [integer]</td>
  <td align = center>default = 15</td>
  <td align = center>default = 15</td>
  <td align = center>default = 15</td>
  <td align = center>default = 15</td>
  <td align = center>default = 15</td>
  <td align = center>default = 15</td>
  </tr>
  <tr>
  <td width = "30"><b>Query filter</b>:<br>
  filter applied to the query sequence</td>
  <td align = center>default = DUST</td>
  <td align = center>default = SEG</td>
  <td align = center>default = SEG</td>
  <td align = center>default = SEG</td>
  <td align = center>default = SEG</td>
  <td align = center>default = DUST</td>
  </tr>
  <tr>
  <td width = "30"><b><a name="gencodes"><a href = "BLAST_help.jsp#gencodes">Query genetic code</b></a>:<br>
  genetic code to be used in BLASTX translation of the query</td>
  <td align = center>n/a</td>
  <td align = center>n/a</td>
  <td align = center>default = universal</td>
  <td align = center>default = universal</td>
  <td align = center>default = universal</td>
  <td align = center>n/a</td>
  </tr>
  <tr>
  <td width = "30"><b><a name = "matrix"><a href = "http://twod.med.harvard.edu/seqanal/matrices.html">Matrix</a></b>:<br>
  substitution matrix to be used for amino acid comparisons</td>
  <td align = center>no default</td>
  <td align = center>default = blosum62</td>
  <td align = center>default = blosum62</td>
  <td align = center>default = blosum62</td>
  <td align = center>default = blosum62</td>
  <td align = center>no default</td>
  </tr>
  <tr>
  </table>
  <br>
  <br>
  <HR width = 50%>
  <h3>Supported and Suggested <a name = "value">Values</a> for Gap Open and Extension in BLASTP, BLASTX, TBLASTN, and TBLASTX</H3>
  <table border = 1>
  <tr>
  <th>Gaps Open</th>
  <th>Gap Extension</th>
  </tr>
  <tr>
  <td align = center>10</td>
  <td align = center>1</td>
  </tr>
  <tr>
  <td align = center>10</td>
  <td align = center>2</td>
  </tr>
  <tr>
  <td align = center>11</td>
  <td align = center>1</td>
  </tr>
  <tr>
  <td align = center>8</td>
  <td align = center>2</td>
  </tr>
  <tr>
  <td align = center>9</td>
  <td align = center>2</td
  </tr>
  </table>
  </html>




