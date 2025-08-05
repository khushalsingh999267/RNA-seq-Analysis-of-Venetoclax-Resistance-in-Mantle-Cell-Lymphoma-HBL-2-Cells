#!/bin/bash

in_dir="/nobackup/biol5178M/group1"
out_dir="/home/home02/vmtk5639/myproject/trimmed_read"

mkdir -p "$out_dir"

for sample in "$in_dir"/*.fastq.gz; do
base=$(basename "$sample" .fastq.gz)
/nobackup/leedsomics_tools/TrimGalore-0.6.6/trim_galore \
--quality 20 \
--length 36 \
--cores 14 \
--output_dir "$out_dir" \
"$sample" &
done
wait



== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 5699524 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 29.1%
  C: 34.5%
  G: 19.0%
  T: 17.4%
  none/other: 0.1%

Overview of removed sequences
length	count	expect	max.err	error counts
1	4058930	4387472.5	0	4058930
2	1234410	1096868.1	0	1234410
3	295435	274217.0	0	295435
4	73023	68554.3	0	73023
5	16597	17138.6	0	16597
6	2710	4284.6	0	2710
7	1881	1071.2	0	1881
8	1537	267.8	0	1537
9	1582	66.9	0	1430 152
10	1750	16.7	1	1283 467
11	1158	4.2	1	1004 154
12	1060	1.0	1	961 99
13	915	0.3	1	853 62
14	762	0.3	1	711 51
15	692	0.3	1	651 41
16	613	0.3	1	570 43
17	520	0.3	1	490 30
18	476	0.3	1	443 33
19	397	0.3	1	353 44
20	316	0.3	1	290 26
21	200	0.3	1	181 19
22	156	0.3	1	139 17
23	98	0.3	1	90 8
24	67	0.3	1	56 11
25	55	0.3	1	44 11
26	30	0.3	1	24 6
27	29	0.3	1	17 12
28	27	0.3	1	18 9
29	15	0.3	1	9 6
30	12	0.3	1	9 3
31	24	0.3	1	7 17
32	12	0.3	1	3 9
33	26	0.3	1	9 17
34	16	0.3	1	6 10
35	27	0.3	1	13 14
36	18	0.3	1	9 9
37	22	0.3	1	10 12
38	21	0.3	1	13 8
39	18	0.3	1	8 10
40	32	0.3	1	24 8
41	45	0.3	1	32 13
42	18	0.3	1	9 9
43	29	0.3	1	23 6
44	20	0.3	1	9 11
45	44	0.3	1	36 8
46	24	0.3	1	14 10
47	115	0.3	1	91 24
48	87	0.3	1	32 55
49	261	0.3	1	15 246
50	3212	0.3	1	37 3175


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407833.fastq.gz
=============================================
17549890 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	26279 (0.1%)

20000000 sequences processed
20000000 sequences processed
20000000 sequences processed
20000000 sequences processed
This is cutadapt 1.18 with Python 3.7.13
Command line parameters: -j 8 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /nobackup/biol5178M/group1/SRR7407806.fastq.gz
Processing reads on 8 cores in single-end mode ...
Finished in 358.70 s (18 us/read; 3.29 M reads/minute).

=== Summary ===

Total reads processed:              19,670,700
Reads with adapters:                 6,402,586 (32.5%)
Reads written (passing filters):    19,670,700 (100.0%)

Total basepairs processed:   983,535,000 bp
Quality-trimmed:               2,296,461 bp (0.2%)
Total written (filtered):    971,786,228 bp (98.8%)

=== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 6402586 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 29.1%
  C: 34.2%
  G: 19.0%
  T: 17.5%
  none/other: 0.2%

Overview of removed sequences
length	count	expect	max.err	error counts
1	4537321	4917675.0	0	4537321
2	1399316	1229418.8	0	1399316
3	336534	307354.7	0	336534
4	82832	76838.7	0	82832
5	18492	19209.7	0	18492
6	3053	4802.4	0	3053
7	2124	1200.6	0	2124
8	1649	300.2	0	1649
9	1715	75.0	0	1551 164
10	1911	18.8	1	1425 486
11	1189	4.7	1	1042 147
12	1093	1.2	1	1005 88
13	949	0.3	1	898 51
14	826	0.3	1	792 34
15	740	0.3	1	709 31
16	647	0.3	1	616 31
17	560	0.3	1	523 37
18	523	0.3	1	501 22
19	372	0.3	1	354 18
20	253	0.3	1	244 9
21	210	0.3	1	184 26
22	161	0.3	1	144 17
23	102	0.3	1	86 16
24	62	0.3	1	51 11
25	46	0.3	1	42 4
26	32	0.3	1	24 8
27	25	0.3	1	17 8
28	30	0.3	1	12 18
29	16	0.3	1	12 4
30	10	0.3	1	5 5
31	22	0.3	1	5 17
32	15	0.3	1	9 6
33	52	0.3	1	16 36
34	20	0.3	1	9 11
35	20	0.3	1	8 12
36	15	0.3	1	6 9
37	20	0.3	1	8 12
38	37	0.3	1	15 22
39	24	0.3	1	11 13
40	23	0.3	1	15 8
41	47	0.3	1	24 23
42	30	0.3	1	20 10
43	25	0.3	1	14 11
44	28	0.3	1	11 17
45	48	0.3	1	41 7
46	35	0.3	1	13 22
47	105	0.3	1	78 27
48	161	0.3	1	29 132
49	639	0.3	1	51 588
50	8427	0.3	1	557 7870


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407806.fastq.gz
=============================================
19670700 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	26965 (0.1%)

This is cutadapt 1.18 with Python 3.7.13
Command line parameters: -j 8 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /nobackup/biol5178M/group1/SRR7407805.fastq.gz
Processing reads on 8 cores in single-end mode ...
Finished in 376.55 s (17 us/read; 3.63 M reads/minute).

=== Summary ===

Total reads processed:              22,802,467
Reads with adapters:                 7,405,669 (32.5%)
Reads written (passing filters):    22,802,467 (100.0%)

Total basepairs processed: 1,140,123,350 bp
Quality-trimmed:               1,781,302 bp (0.2%)
Total written (filtered):  1,127,964,805 bp (98.9%)

=== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 7405669 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 28.9%
  C: 34.5%
  G: 19.4%
  T: 17.2%
  none/other: 0.0%

Overview of removed sequences
length	count	expect	max.err	error counts
1	5250766	5700616.8	0	5250766
2	1637709	1425154.2	0	1637709
3	394503	356288.5	0	394503
4	93347	89072.1	0	93347
5	19194	22268.0	0	19194
6	1849	5567.0	0	1849
7	846	1391.8	0	846
8	549	347.9	0	549
9	706	87.0	0	493 213
10	922	21.7	1	419 503
11	482	5.4	1	344 138
12	344	1.4	1	272 72
13	305	0.3	1	285 20
14	232	0.3	1	215 17
15	208	0.3	1	198 10
16	200	0.3	1	186 14
17	195	0.3	1	183 12
18	140	0.3	1	132 8
19	140	0.3	1	125 15
20	120	0.3	1	105 15
21	76	0.3	1	53 23
22	74	0.3	1	62 12
23	52	0.3	1	44 8
24	47	0.3	1	33 14
25	35	0.3	1	31 4
26	20	0.3	1	15 5
27	29	0.3	1	17 12
28	33	0.3	1	17 16
29	15	0.3	1	10 5
30	16	0.3	1	12 4
31	27	0.3	1	13 14
32	28	0.3	1	18 10
33	49	0.3	1	22 27
34	29	0.3	1	14 15
35	32	0.3	1	22 10
36	31	0.3	1	19 12
37	41	0.3	1	28 13
38	42	0.3	1	25 17
39	35	0.3	1	22 13
40	42	0.3	1	33 9
41	83	0.3	1	51 32
42	35	0.3	1	31 4
43	43	0.3	1	38 5
44	29	0.3	1	22 7
45	94	0.3	1	86 8
46	41	0.3	1	35 6
47	171	0.3	1	152 19
48	70	0.3	1	39 31
49	104	0.3	1	26 78
50	1489	0.3	1	38 1451


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407805.fastq.gz
=============================================
22802467 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	17391 (0.1%)

This is cutadapt 1.18 with Python 3.7.13
Command line parameters: -j 8 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /nobackup/biol5178M/group1/SRR7407832.fastq.gz
Processing reads on 8 cores in single-end mode ...
Finished in 416.37 s (17 us/read; 3.53 M reads/minute).

=== Summary ===

Total reads processed:              24,480,980
Reads with adapters:                 7,845,113 (32.0%)
Reads written (passing filters):    24,480,980 (100.0%)

Total basepairs processed: 1,224,049,000 bp
Quality-trimmed:               2,445,224 bp (0.2%)
Total written (filtered):  1,210,508,333 bp (98.9%)

=== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 7845113 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 28.4%
  C: 35.3%
  G: 19.6%
  T: 16.7%
  none/other: 0.1%

Overview of removed sequences
length	count	expect	max.err	error counts
1	5559302	6120245.0	0	5559302
2	1740495	1530061.2	0	1740495
3	413095	382515.3	0	413095
4	98184	95628.8	0	98184
5	20568	23907.2	0	20568
6	2032	5976.8	0	2032
7	942	1494.2	0	942
8	686	373.6	0	686
9	794	93.4	0	572 222
10	1062	23.3	1	492 570
11	559	5.8	1	391 168
12	409	1.5	1	324 85
13	340	0.4	1	322 18
14	327	0.4	1	311 16
15	279	0.4	1	256 23
16	221	0.4	1	201 20
17	201	0.4	1	186 15
18	188	0.4	1	179 9
19	146	0.4	1	129 17
20	123	0.4	1	111 12
21	108	0.4	1	83 25
22	85	0.4	1	65 20
23	53	0.4	1	44 9
24	49	0.4	1	33 16
25	24	0.4	1	19 5
26	25	0.4	1	18 7
27	29	0.4	1	20 9
28	35	0.4	1	23 12
29	27	0.4	1	22 5
30	26	0.4	1	21 5
31	26	0.4	1	12 14
32	25	0.4	1	12 13
33	43	0.4	1	17 26
34	28	0.4	1	15 13
35	37	0.4	1	16 21
36	33	0.4	1	23 10
37	33	0.4	1	17 16
38	48	0.4	1	31 17
39	40	0.4	1	27 13
40	36	0.4	1	25 11
41	59	0.4	1	40 19
42	37	0.4	1	22 15
43	42	0.4	1	28 14
44	34	0.4	1	18 16
45	58	0.4	1	54 4
46	48	0.4	1	41 7
47	170	0.4	1	150 20
48	95	0.4	1	49 46
49	168	0.4	1	17 151
50	3639	0.4	1	59 3580


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407832.fastq.gz
=============================================
24480980 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	31494 (0.1%)

This is cutadapt 1.18 with Python 3.7.13
Command line parameters: -j 8 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /nobackup/biol5178M/group1/SRR7407834.fastq.gz
Processing reads on 8 cores in single-end mode ...
Finished in 468.83 s (17 us/read; 3.56 M reads/minute).

=== Summary ===

Total reads processed:              27,834,113
Reads with adapters:                 9,012,666 (32.4%)
Reads written (passing filters):    27,834,113 (100.0%)

Total basepairs processed: 1,391,705,650 bp
Quality-trimmed:               2,184,231 bp (0.2%)
Total written (filtered):  1,376,846,965 bp (98.9%)

=== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 9012666 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 28.8%
  C: 34.9%
  G: 19.4%
  T: 16.9%
  none/other: 0.0%

Overview of removed sequences
length	count	expect	max.err	error counts
1	6402684	6958528.2	0	6402684
2	1979945	1739632.1	0	1979945
3	476354	434908.0	0	476354
4	113990	108727.0	0	113990
5	23787	27181.8	0	23787
6	2648	6795.4	0	2648
7	1273	1698.9	0	1273
8	1013	424.7	0	1013
9	1090	106.2	0	839 251
10	1433	26.5	1	738 695
11	832	6.6	1	634 198
12	555	1.7	1	443 112
13	516	0.4	1	478 38
14	430	0.4	1	392 38
15	412	0.4	1	394 18
16	361	0.4	1	331 30
17	296	0.4	1	273 23
18	248	0.4	1	233 15
19	230	0.4	1	211 19
20	187	0.4	1	168 19
21	152	0.4	1	121 31
22	116	0.4	1	93 23
23	78	0.4	1	64 14
24	56	0.4	1	35 21
25	41	0.4	1	28 13
26	45	0.4	1	36 9
27	31	0.4	1	21 10
28	40	0.4	1	17 23
29	38	0.4	1	24 14
30	33	0.4	1	26 7
31	34	0.4	1	15 19
32	20	0.4	1	11 9
33	53	0.4	1	14 39
34	40	0.4	1	23 17
35	45	0.4	1	19 26
36	51	0.4	1	33 18
37	52	0.4	1	35 17
38	44	0.4	1	28 16
39	52	0.4	1	40 12
40	59	0.4	1	41 18
41	103	0.4	1	75 28
42	56	0.4	1	40 16
43	49	0.4	1	44 5
44	47	0.4	1	27 20
45	98	0.4	1	85 13
46	56	0.4	1	38 18
47	189	0.4	1	175 14
48	99	0.4	1	54 45
49	167	0.4	1	29 138
50	2438	0.4	1	72 2366


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407834.fastq.gz
=============================================
27834113 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	20931 (0.1%)

30000000 sequences processed
This is cutadapt 1.18 with Python 3.7.13
Command line parameters: -j 8 -e 0.1 -q 20 -O 1 -a AGATCGGAAGAGC /nobackup/biol5178M/group1/SRR7407807.fastq.gz
Processing reads on 8 cores in single-end mode ...
Finished in 523.57 s (16 us/read; 3.73 M reads/minute).

=== Summary ===

Total reads processed:              32,581,203
Reads with adapters:                10,591,095 (32.5%)
Reads written (passing filters):    32,581,203 (100.0%)

Total basepairs processed: 1,629,060,150 bp
Quality-trimmed:               2,281,576 bp (0.1%)
Total written (filtered):  1,611,677,041 bp (98.9%)

=== Adapter 1 ===

Sequence: AGATCGGAAGAGC; Type: regular 3'; Length: 13; Trimmed: 10591095 times.

No. of allowed errors:
0-9 bp: 0; 10-13 bp: 1

Bases preceding removed adapters:
  A: 28.7%
  C: 34.7%
  G: 19.3%
  T: 17.2%
  none/other: 0.1%

Overview of removed sequences
length	count	expect	max.err	error counts
1	7514316	8145300.8	0	7514316
2	2322943	2036325.2	0	2322943
3	559286	509081.3	0	559286
4	134180	127270.3	0	134180
5	29509	31817.6	0	29509
6	4420	7954.4	0	4420
7	2900	1988.6	0	2900
8	2273	497.1	0	2273
9	2264	124.3	0	1981 283
10	2525	31.1	1	1783 742
11	1634	7.8	1	1445 189
12	1422	1.9	1	1307 115
13	1177	0.5	1	1138 39
14	993	0.5	1	950 43
15	898	0.5	1	876 22
16	792	0.5	1	769 23
17	688	0.5	1	667 21
18	554	0.5	1	539 15
19	460	0.5	1	440 20
20	324	0.5	1	309 15
21	304	0.5	1	269 35
22	221	0.5	1	191 30
23	135	0.5	1	128 7
24	97	0.5	1	70 27
25	49	0.5	1	38 11
26	37	0.5	1	31 6
27	37	0.5	1	28 9
28	36	0.5	1	21 15
29	24	0.5	1	13 11
30	32	0.5	1	18 14
31	43	0.5	1	17 26
32	40	0.5	1	22 18
33	54	0.5	1	14 40
34	39	0.5	1	11 28
35	54	0.5	1	27 27
36	36	0.5	1	22 14
37	41	0.5	1	20 21
38	52	0.5	1	29 23
39	30	0.5	1	14 16
40	53	0.5	1	35 18
41	71	0.5	1	48 23
42	43	0.5	1	34 9
43	39	0.5	1	29 10
44	40	0.5	1	25 15
45	85	0.5	1	74 11
46	48	0.5	1	29 19
47	159	0.5	1	122 37
48	106	0.5	1	43 63
49	260	0.5	1	20 240
50	5272	0.5	1	38 5234


RUN STATISTICS FOR INPUT FILE: /nobackup/biol5178M/group1/SRR7407807.fastq.gz
=============================================
32581203 sequences processed in total
Sequences removed because they became shorter than the length cutoff of 36 bp:	23641 (0.1%)

ALL DONEEEEEEE!!!!!!!


