SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding ='UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path','', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: anomaly; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA anomaly;

ALTER SCHEMA anomaly OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: anomaly_type; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.anomaly_type (
    id SERIAL PRIMARY KEY,
    label character varying NOT NULL,
    description character varying NOT NULL
);

ALTER TABLE anomaly.anomaly_type OWNER TO postgres;

--
-- Name: vessels; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.vessels (
    id SERIAL PRIMARY KEY,
    mmsi integer NOT NULL
);

ALTER TABLE anomaly.vessels OWNER TO postgres;

--
-- Name: confidence; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.confidence (
    id SERIAL PRIMARY KEY,
    label character varying NOT NULL,
    description character varying NOT NULL
);

ALTER TABLE anomaly.confidence OWNER TO postgres;

--
-- Name: priority; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.priority (
    id SERIAL PRIMARY KEY,
    label character varying NOT NULL,
    description character varying NOT NULL
);

ALTER TABLE anomaly.priority OWNER TO postgres;

--
-- Name: confirmation_status; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.confirmation_status (
    id SERIAL PRIMARY KEY,
    label character varying NOT NULL,
    description character varying NOT NULL
);

ALTER TABLE anomaly.confirmation_status OWNER TO postgres;

--
-- Name: anomalies; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.anomalies (
    id INTEGER PRIMARY KEY,
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    timestamp timestamp NOT NULL,
    confirmation_status integer,
    confidence integer,
    priority integer,
    anomaly_type integer,
    CONSTRAINT fk_cs
        FOREIGN KEY(confirmation_status) 
        REFERENCES anomaly.confirmation_status(id),
    CONSTRAINT fk_conf
        FOREIGN KEY(confidence) 
        REFERENCES anomaly.confidence(id),
    CONSTRAINT fk_priority
        FOREIGN KEY(priority) 
        REFERENCES anomaly.priority(id),
    CONSTRAINT fk_atype
        FOREIGN KEY(anomaly_type) 
        REFERENCES anomaly.anomaly_type(id)
);

ALTER TABLE anomaly.anomalies OWNER TO postgres;

--
-- Name: involvement; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.involvement (
    vessel_id INTEGER NOT NULL references anomaly.vessels ON UPDATE CASCADE,
    anomaly_id INTEGER NOT NULL references anomaly.anomalies ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(vessel_id, anomaly_id)
);

ALTER TABLE anomaly.involvement OWNER TO postgres;


COPY anomaly.anomaly_type (label, description) FROM stdin;
Smuggling	'Vessel is performing smuggling'
IllegalDiving	'Vessel engaged in Illegal diving activities'
UnauthorizedCountry	'Unauthorized country'
SuspiciousVesselIdentity	'A vessel detected having an ID from a database with suspicious vessels'
ShiftingOfCargo	'Shifting of vessel’s cargo'
WithoutAisTransmission	'Vessel is detected from sensor without receiving AIS info'
VesselAppeared	'Vessel has suddenly appeared'
VesselDisappeared	'Vessel is no longer detected by any sensor'
LostRadarContact	'Vessel is no longer detected from radar'
LostCameraObject	'Vessel is no longer detected from camera'
VesselVelocityNotConsistent	'Velocity of vessel is not consistent with actual movement'
VesselCourseNotConsistent	'Course of vessel is not consistent with actual movement'
NavigationalStatusNotConsistent	'Navigational status of vessel is not consistent with actual movement'
VesselPositionNotConsistent	'Position updates of vessel are not consistent with actual movement'
TimeIncompatibility	'Time updates of vessel are incompatible (greater than a threshold)'
SpaceIncompatibility	'Position updates of vessel are incompatible (greater than a threshold)'
VesselDynamicVsStaticAttributesInconsistency	'Generic vessel static attributes not consistent with dynamic values'
VesselStaticAttributesInconsistency	'Vessel static attributes inconsistent'
AisParameterCloned	'Two vessels having two or more AIS parameters the same'
AisParameterChanged	'A vessel detected changing a static AIS parameter'
IncongrousVesselBehavior	'The behavior pattern of a vessel is not coherent respect to the declared type coming from AIS flow'
HighSpeed	'Vessel is moving with high speed'
LowSpeed	'Vessel is moving with low speed'
Loitering	'Vessel is loitering'
Drifting	'Vessel is drifting'
VesselStopped	'Vessel has stopped'
AbnormalSpeedChange	'Abnormal speed change of vessel'
ComplexAlert	'An alert created using multiple rules combined'
Other	'Any other maritime anomaly type not covered'
NonSpecified	'Maritime anomaly type not specified'
UnexpectedMovement	'Unexpected movement'
VesselWithErraticMovements	'Vessel is sailing with an erratic pattern'
VesselAbnormalManeuvering	'Vessel is making abnormal maneuvers'
AbnormalCourseChange	'Abnormal course change of vessel'
VesselEnteringRoute	'A vessel in entering a route or shipping lane'
VesselDeviationFromRoute	'A vessel in deviating from a route or shipping lane'
DivergentVesselBehavior	'The behavior that is different respect to the others in a given area'
AbnormalVesselBehavior	'The case of an uncommon pattern'
UnstableVesselBehavior	'Vessel that is suddenly changes its behavior'
AisLowFrequency	'Receiving AIS information with low frequency'
AisHighFrequency	'Receiving AIS information with high frequency'
LostAisSignal	'Lost Ais signal of vessel'
DoNotAnswerOnVhfCh16	'Vessel does not answer on vhf channel 16'
AlongsideMovement	'Vessels moving in group (constant distance, similar heading and speed)'
VesselsApproaching	'Vessel approaching another vessel'
VesselsMovingAway	'Vessel moving away from another vessel'
VesselsCrossing	Two'vessels crossing each other’s routes'
VesselImminentCollision	'Vessel is in collision course with another vessel'
Splitting	'Two tracks appear in the location of a single vessel'
Merging	'Two vessels merge in one track'
DomainViolation	'A vessel is entering the area defined around another vessel'
ObjectsInAreaAboveThreshold	'The total number of vessels in the area are above a threshold'
MovementsBetweenAreas	'Vessel is moving from one area to another'
VesselApproachinglocation	'Vessel is approaching a location'
VesselMovingAwayLocation	'Vessel is moving away from a location'
VesselMovingAwayLine	'Vessel is moving away from a border line'
VesselCrossingLine	'Vessel is crossing a line'
VesselApproachingLine	'Vessel is approaching a line'
VesselCrossingArea	'Vessel is crossing the outer boundaries of an area'
VesselMovingAwayArea	'Vessel is moving away from an area'
VesselEnteringArea	'Vessel is entering an area'
VesselRevisitingArea	'Vessel is entering an area that has visited before'
VesselExitingArea	'Vessel is exiting from an area'
VesselApproachingArea	'Vessel is approaching an area'
StainOfOilSighted	'Stain of oil sighted'
\.

COPY anomaly.vessels (mmsi) FROM stdin;
224096950
224097160
224102950
224107960
224126630
224133630
224001990
224022660
224588000
224600000
224692000
210117000
210754000
212175000
212302000
212657000
212772000
215594000
215637000
215684000
215685000
215703000
215712000
247379500
247456000
248236000
248498000
255805601
255996000
255998000
255998001
255998002
255998003
255998004
255998005
255998006
255998007
255998008
255998009
255998010
255998011
255998012
255998013
255998014
255998015
255998016
255998017
255998018
255998019
255998020
255998021
255998022
255998023
255998024
255998025
255998026
255998027
255998028
255998029
255998030
255998031
255998032
255998033
255998034
255998035
255998036
255998037
255998038
255998039
255998040
255998041
255998042
255998043
255998044
255998045
255998046
255998047
255998048
255998049
255998050
255998051
255998052
255998053
255998054
255998055
255998056
255998057
255998058
255998059
255998060
255998061
255998062
255998063
255998064
255998065
255998066
255998067
255998068
255998069
255998070
255998071
255998072
255998073
255998074
255998075
255998076
255998077
255998078
255998079
255998080
255998081
255998082
255998083
255998084
255998085
255998086
255998087
255998088
255998089
255998090
255998091
255998092
255998093
255998094
255998095
255998096
255998097
255998098
255998099
255998100
255998101
255998102
255998103
255998104
255998105
255998106
255998107
255998108
255998109
255998110
255998111
255998112
255998113
255998114
255998115
255998116
255998117
255998118
255998119
255998120
255998121
255998122
255998123
255998124
255998125
255998126
255998127
255998128
255998129
255998130
255998131
255998132
255998133
255998134
255998135
255998136
255998137
255998138
255998139
255998140
255998141
255998142
255998143
255998144
255998145
255998146
255998147
255998148
255998149
255998150
255998151
255998152
255998153
255998154
255998155
255998156
255998157
255998158
255998159
255998160
255998161
255998162
255998163
255998164
255998165
255998166
255998167
255998168
255998169
255998170
255998171
255998172
255998173
255998174
255998175
255998176
255998177
255998178
255998179
255998180
255998181
255998182
255998183
255998184
255998185
255998186
255998187
255998188
255998189
255998190
255998191
255998192
255998193
255998194
255998195
255998196
255998197
255998198
255998199
255998200
255998201
255998202
255998203
255998204
255998205
255998206
255998207
255998208
255998209
255998210
255998211
255998212
255998213
255998214
255998215
255998216
255998217
255998218
255998219
255998220
255998221
255998222
255998223
255998224
255998225
255998226
255998227
255998228
255998229
255998230
255998231
255998232
255998233
255998234
255998235
255998236
255998237
255998238
255998239
255998240
255998241
255998242
255998243
255998244
255998245
255998246
255998247
255998248
255998249
255998250
255998251
255998252
255998253
255998254
255998255
255998256
255998257
255998258
255998259
255998260
255998261
255998262
255998263
255998264
255998265
255998266
255998267
255998268
255998269
255998270
255998271
255998272
255998273
255998274
255998275
255998276
255998277
255998278
255998279
255998280
255998281
255998282
255998283
255998284
255998285
255998286
255998287
255998288
255998289
255998290
255998291
255998292
255998293
255998294
255998295
255998296
255998297
255998298
255998299
255998300
255998301
255998302
255998303
255998304
255998305
255998306
255998307
255998308
255998309
255998310
255998311
255998312
255998313
255998314
255998315
255998316
255998317
255998318
255998319
255998320
255998321
255998322
255998323
255998324
255998325
255998326
255998327
255998328
255998329
255998330
255998331
255998332
255998333
255998334
255998335
255998336
255998337
255998338
255998339
255998340
255998341
255998342
255998343
255998344
255998345
255998346
255998347
255998348
255998349
255998350
255998351
255998352
255998353
255998354
255998355
255998356
255998357
255998358
255998359
255998360
255998361
255998362
255998363
255998364
255998365
255998366
255998367
255998368
255998369
255998370
255998371
255998372
255998373
255998374
255998375
255998376
255998377
255998378
255998379
\.

COPY anomaly.confidence (label, description) FROM stdin;
Percentage	"The percentage of confidence. In most cases this is derived artificial intelligence means (0 to 100)"
Level	"The level of confidence expressed in natural text language"
\.

COPY anomaly.priority (label, description) FROM stdin;
VeryHigh	"Very high priority"
High	"High priority"
Medium	"Medium priority"
Low	"Low priority"
VeryLow	"Very low priority"
NonSpecified	"Priority unspecified"
\.

COPY anomaly.confirmation_status (label, description) FROM stdin;
Pending	"The confirmation is pending"
Failed	"The confirmation of the entity has failed"
Confirmed	"Entity has been confirmed"
VisuallyConfirmed	"Entity has been visually confirmed"
Unconfirmed	"Entity remains unconfirmed"
Other	"Other confirmation status not covered"
NonSpecified	"Confirmation status not specified"
\.

COPY anomaly.anomalies (id, lat, lon, timestamp, confidence, confirmation_status, priority, anomaly_type) FROM stdin;
1	45.15614662875782	-2.0819068348696343	2021-12-05 02:46:56	1	5	1	47
2	44.584975351773565	-1.626452889404283	2021-08-30 22:58:47	1	3	4	19
3	45.80021107076193	-2.2771684590080077	2021-05-06 10:51:50	2	1	1	12
4	44.54155862199165	-2.0201687026945914	2021-07-15 21:21:30	2	5	1	2
5	45.36054920906506	-2.1043605353175607	2021-03-20 16:59:41	1	4	5	24
6	45.41101180366537	-1.8986396062396906	2021-02-16 13:35:46	2	6	2	48
7	45.97030870231457	-2.1977506118722108	2021-04-30 06:11:15	2	7	6	5
8	44.058135745067474	-1.876935662991185	2021-12-03 21:44:29	1	3	6	2
9	45.695543694601255	-1.6399055331510675	2021-03-19 14:01:23	1	6	5	45
10	44.179545889232685	-1.6762075368057583	2021-03-25 04:53:56	1	4	3	9
11	45.57419678853597	-1.6882768942189217	2021-07-22 09:55:33	2	2	2	5
12	44.06230023914332	-1.873274836978975	2021-08-28 07:33:38	1	6	1	28
13	45.426461055153034	-2.172784152256627	2021-12-04 09:31:47	2	2	4	11
14	43.90855715681406	-2.2634832746123186	2021-06-15 12:31:58	2	4	6	9
15	44.339535712879595	-1.671992498674545	2021-02-24 20:20:10	2	2	6	6
16	44.215382117571835	-2.2489558367796576	2021-09-02 07:52:25	2	1	5	41
17	45.81015004640834	-1.636421892220397	2021-01-16 21:57:13	2	7	5	4
18	43.75756955108914	-2.172680518817562	2021-08-26 23:23:35	1	3	2	62
19	43.78502640948857	-2.1966271875587413	2021-11-01 02:32:16	2	3	3	45
20	44.611868771920385	-1.6308715119142319	2021-03-09 05:27:43	2	7	6	60
21	44.95752447815072	-1.838692113970858	2021-12-18 20:08:37	1	1	5	12
22	44.385459919022736	-1.8127719343033784	2021-06-30 03:10:23	2	3	6	22
23	45.712413391192165	-1.7988169930343019	2021-11-17 23:54:46	1	2	4	38
24	44.004665746306856	-1.9362493407368597	2021-12-14 04:49:08	2	1	1	32
25	45.413776870968604	-2.002384868454204	2021-10-13 18:42:18	2	7	2	37
26	45.76141456171914	-2.064738460342893	2021-05-21 10:45:57	2	6	3	59
27	44.74029951660459	-1.7282228892795517	2021-05-11 02:01:26	1	7	1	40
28	45.89640000646837	-1.9654982480690506	2021-05-13 16:54:04	1	4	1	59
29	44.41544741554424	-1.6281835991735278	2021-09-16 05:39:43	2	6	6	54
30	45.72919065516242	-1.6145353007231087	2021-02-26 22:28:42	1	2	5	58
31	44.43383143150414	-1.846636285623613	2021-02-26 01:19:38	1	1	2	19
32	44.244492734785084	-1.9816970341524351	2021-12-08 09:07:09	1	5	3	65
33	44.80954793679682	-1.9090715413267774	2021-07-08 01:14:56	1	1	4	30
34	43.79614057774358	-2.239066376724731	2021-02-17 21:40:14	1	7	4	13
35	43.99827170715702	-2.0599296763642054	2021-01-21 08:08:30	2	1	5	31
36	44.5202045074566	-2.2104589856755967	2021-10-28 05:33:01	2	4	1	63
37	45.97766126218111	-1.9270155619294842	2021-04-18 08:41:38	1	5	3	2
38	45.18219571534602	-1.9650246135179437	2021-10-31 11:46:49	1	5	4	8
39	44.06514725542024	-1.9524024215081996	2021-01-25 00:20:15	2	2	4	12
40	45.87727929575672	-1.8574234623662655	2021-06-29 18:24:30	1	7	4	4
41	45.2101402667283	-2.2660849995458308	2021-11-27 13:42:10	1	5	2	17
42	44.653920875967664	-1.6535691985488805	2021-11-15 15:13:53	1	5	4	22
43	44.64286790016673	-1.9682910700388137	2021-07-31 17:46:46	2	3	3	61
44	44.936104005665364	-1.9738871274315744	2021-10-31 02:11:38	2	7	3	2
45	45.481860475198204	-2.054455574774327	2021-03-12 08:15:50	2	3	1	31
46	45.43304026907083	-2.2396526069348557	2021-12-08 01:47:51	1	5	3	57
47	44.815123407805665	-2.1945416014376615	2021-02-04 03:02:57	1	3	5	7
48	44.38324301611296	-2.1520772763230274	2021-10-29 14:49:04	2	6	6	19
49	45.92681646137099	-1.6326923974505394	2021-06-22 14:34:12	1	5	2	44
50	44.09715339194509	-1.8958467351166732	2021-09-16 10:25:43	1	2	1	20
51	44.9479304302198	-2.0633664184342613	2021-12-25 09:21:06	2	4	1	50
52	45.839667277443006	-1.6767841707437867	2021-08-16 00:33:54	1	4	4	22
53	44.33310855755771	-1.6048611221201126	2021-05-20 08:20:42	2	7	5	47
54	43.98183015396021	-1.9959548266929534	2021-01-05 18:40:38	1	1	6	42
55	44.36673759460735	-1.8864972092551886	2021-03-02 23:26:10	2	4	4	15
56	44.55769615432745	-1.7131372143537271	2021-01-21 09:16:33	1	5	5	36
57	44.70227870172096	-1.5606147768331662	2021-05-24 06:41:02	2	5	6	47
58	45.904445301122074	-1.8847560087057234	2021-06-17 10:25:26	1	7	1	31
59	45.74337777105613	-1.8605402944230263	2021-11-06 03:04:53	2	1	5	56
60	43.78140403327062	-1.7662835728947792	2021-04-13 06:36:45	2	5	4	62
61	45.52720668835318	-1.901250901479171	2021-08-12 22:47:52	1	5	5	55
62	44.23115165543031	-1.6075966851954875	2021-03-18 02:44:51	1	6	5	24
63	45.55535491943266	-1.6529221005287638	2021-11-06 09:39:56	1	2	2	6
64	43.83538349062391	-2.0354334221683708	2021-08-21 20:53:13	2	1	3	48
65	43.98140293502128	-2.1495754522473938	2021-02-19 16:47:11	1	6	4	48
66	45.096149731505214	-2.1241242741443975	2021-08-27 06:12:18	2	1	1	54
67	44.50472994007394	-1.6664074652448875	2021-11-14 17:58:54	2	6	3	57
68	43.88043685335028	-1.7468482798706113	2021-03-27 12:48:52	2	6	1	39
69	45.54976522120078	-1.8293751514113255	2021-11-10 20:33:24	2	2	2	56
70	44.13134159671798	-2.0702607866792024	2021-09-06 21:59:09	2	4	6	51
71	45.09895295670797	-2.285806694829692	2021-01-24 11:16:43	2	7	1	27
72	44.92508357837329	-1.560205225795254	2021-12-22 19:25:17	2	4	6	59
73	44.43053345292258	-1.7352352635911368	2021-03-29 19:30:59	2	2	4	14
74	44.13637948195455	-1.8513651909292173	2021-05-07 17:22:49	1	5	4	12
75	45.36511529352205	-2.0583880730876802	2021-06-17 10:08:29	2	2	5	52
76	45.6878146813618	-1.9594648531865175	2021-06-24 22:57:31	2	1	6	63
77	45.516401730082926	-2.2806600750849113	2021-07-26 00:59:36	1	2	5	61
78	44.449524779503214	-2.2965191780511107	2021-10-10 07:43:42	1	3	5	9
79	44.14164416410629	-1.5362460995946199	2021-01-01 07:39:25	2	1	5	26
80	44.02515751433437	-1.7650280256902962	2021-06-06 21:30:50	2	7	6	6
81	44.470045801413	-2.0341460996241025	2021-04-12 10:38:25	2	4	3	64
82	45.812788416710234	-1.76091052552251	2021-02-26 15:09:43	2	7	4	44
83	44.285815095196035	-1.878393050994881	2021-06-06 06:18:19	1	6	3	56
84	44.44964587422742	-1.7770438603011365	2021-04-24 04:22:12	2	2	6	49
85	44.015226373594544	-1.816742318074071	2021-04-06 00:46:02	1	3	5	60
86	44.84618233678522	-1.6495790884350292	2021-03-08 13:46:16	1	4	2	38
87	45.45395622840166	-1.9833982799920649	2021-09-11 02:39:59	1	5	1	29
88	45.02113892203015	-1.8746503058475283	2021-05-14 11:22:14	2	7	2	25
89	45.11229347457499	-1.6361627851743121	2021-04-05 00:18:34	2	2	5	58
90	44.23504529560405	-1.6270279486276498	2021-06-08 08:57:22	2	7	3	4
91	44.298300603210336	-1.7078680314034649	2021-06-11 21:47:36	2	4	6	34
92	45.73261889671105	-1.9603714263106053	2021-06-08 22:46:34	1	1	2	43
93	45.27845401995768	-2.1048576738990126	2021-10-26 21:05:55	2	2	5	21
94	43.80350215478865	-1.943372684845891	2021-01-27 23:27:36	1	7	4	19
95	44.27951533796227	-1.5336350066202202	2021-05-22 10:17:57	1	3	1	18
96	45.59381258384323	-1.7313590373117946	2021-09-11 21:17:19	1	4	1	16
97	44.40188483727913	-1.9036939683866403	2021-12-16 15:01:25	2	1	6	36
98	44.488193804302895	-1.8105508818975713	2021-08-17 08:59:28	2	4	5	38
99	45.00862244135222	-1.9781567493942633	2021-12-30 00:06:53	1	3	4	51
100	44.2758400453339	-2.2113847098621693	2021-10-17 08:34:53	1	7	1	23
101	43.79741581105852	-1.774765130860468	2021-04-23 12:17:28	2	5	3	24
102	45.320752881561305	-1.7909733634365912	2021-09-22 10:58:53	2	2	2	30
103	45.27548482407051	-1.6590497340320225	2021-04-24 22:38:01	1	1	2	11
104	44.320371689772635	-2.1412674567575216	2021-02-18 20:50:41	2	4	5	13
105	45.509602145297634	-2.1503120670285427	2021-03-04 06:59:23	1	6	4	43
106	44.162211442001045	-1.6936515954175047	2021-12-06 20:24:48	2	5	5	38
107	44.01011960524641	-2.2806565403670995	2021-02-07 21:48:22	1	5	5	5
108	44.72724451107352	-1.8087487846184276	2021-07-11 02:16:40	2	5	6	34
109	45.535657412628176	-1.7738355772098637	2021-12-11 22:36:19	2	6	4	63
110	43.737829726703225	-1.8513275904528985	2021-01-11 13:09:29	2	4	5	16
111	45.04240118471847	-1.8479725077253677	2021-09-19 19:29:34	1	1	6	2
112	45.18146001974524	-1.8292288436031066	2021-03-12 04:17:46	2	6	2	34
113	44.72981040761585	-1.8021629871312093	2021-11-26 19:51:55	2	5	2	30
114	44.32189332134186	-1.6098787138444337	2021-10-20 04:15:05	2	7	5	34
115	45.081564910073396	-1.8723917996000388	2021-12-01 14:54:09	2	5	5	60
116	45.735664860058	-1.8687435111395625	2021-10-12 02:56:52	2	2	4	13
117	45.58586621695563	-1.7350025221838152	2021-08-17 23:05:52	2	1	6	21
118	44.93629828771504	-2.1739434223858245	2021-04-24 07:40:31	2	3	5	53
119	45.02095345414647	-1.8406592222152756	2021-11-19 05:07:30	2	7	6	32
120	45.890466046508436	-2.0534182623846426	2021-10-15 06:06:39	1	2	6	63
121	45.78476037542217	-1.7853555994598271	2021-10-27 03:00:59	2	3	1	51
122	44.30363635254441	-1.8264065221688983	2021-10-12 20:36:36	1	4	4	5
123	44.148294880028665	-2.18448250740297	2021-10-26 10:54:41	2	7	1	60
124	45.25999623992027	-1.6662223894160983	2021-10-14 14:53:25	1	7	4	23
125	45.10387277363395	-1.8470045538714412	2021-06-13 22:40:21	1	4	1	32
126	45.33941447611288	-2.0211204751012892	2021-07-14 06:37:43	2	6	6	12
127	43.85046549904987	-1.5618499064839155	2021-02-11 23:13:09	2	6	4	64
128	44.30701431341575	-1.9327809262478075	2021-02-02 12:49:37	1	5	4	19
129	44.98375242883392	-1.7494382835249276	2021-09-02 01:33:53	2	6	3	30
130	44.36389613883609	-2.093792959669525	2021-07-24 16:21:43	1	6	6	2
131	44.966632634043954	-1.58282731520845	2021-06-15 04:13:19	1	4	5	21
132	44.585185974368756	-1.6009515993559456	2021-10-12 06:04:01	1	2	6	5
133	45.06330496896628	-2.0886725166327853	2021-03-04 08:37:33	2	3	1	45
134	45.88576307235879	-1.9906514560832194	2021-09-18 21:50:28	2	3	3	56
135	43.97482844835984	-1.8448961359924623	2021-05-23 12:58:29	1	3	1	53
136	43.93858596271982	-1.599368876854507	2021-10-25 20:19:15	2	4	5	4
137	44.449171071403015	-1.9328812099571069	2021-06-03 07:02:07	2	6	6	29
138	45.444116075753826	-2.0978908141371746	2021-12-17 10:17:49	1	4	6	65
139	45.643205792833925	-2.2864362980236166	2021-07-29 23:59:20	1	2	4	43
140	44.80310139702705	-2.100130899280242	2021-09-11 07:24:25	1	2	4	40
141	45.46757261355924	-2.154702208165717	2021-05-17 10:27:17	2	2	5	33
142	45.99535962922238	-1.9702512623717827	2021-07-03 21:24:47	1	4	4	24
143	45.16150105285103	-1.9647634051463982	2021-03-17 20:23:17	2	2	3	56
144	44.772248863116374	-1.9840485281929965	2021-04-30 20:10:47	2	1	1	24
145	44.596450213719834	-1.5991774686814626	2021-09-20 08:57:57	1	7	2	25
146	44.969336501086005	-2.2980611972143334	2021-04-16 18:53:32	2	7	1	25
147	45.67228078747048	-2.101854544808459	2021-09-30 10:57:41	1	3	1	15
148	45.54973444202374	-1.5760433925628305	2021-11-02 15:38:23	1	1	5	7
149	43.964815084794004	-2.240190288501614	2021-09-15 06:45:56	1	2	3	11
150	44.10585188848091	-1.7609861828940563	2021-04-07 22:14:15	1	6	4	59
151	44.897161820733075	-2.259587577561653	2021-07-21 18:45:47	1	2	6	4
152	43.74034544514187	-1.7339435387858586	2021-03-23 00:18:49	1	2	6	25
153	44.63520255210877	-2.050836077544922	2021-04-01 09:56:42	1	1	3	60
154	44.18445463082068	-1.583821086729204	2021-05-04 18:22:14	2	5	1	38
155	44.029222002128336	-1.9461114857105613	2021-04-08 15:51:25	1	4	4	1
156	44.76304013004515	-1.599187983446894	2021-05-25 18:01:45	2	7	2	14
157	45.4183112848053	-2.1071929332473442	2021-06-23 05:10:20	2	7	1	32
158	45.24494458992142	-2.1734243009983922	2021-01-11 02:14:34	2	6	4	40
159	43.90601716641079	-2.158705619857864	2021-08-01 15:53:10	1	3	5	5
160	45.59504169156833	-1.5926005623890889	2021-09-29 01:03:10	2	4	2	5
161	43.806047390275054	-1.832466017064363	2021-02-12 17:59:29	1	7	2	57
162	44.245457994912876	-1.60479023088878	2021-10-27 03:27:31	2	1	5	52
163	44.617823082803625	-1.9112449186755829	2021-11-08 10:23:33	1	5	2	32
164	45.30398441380398	-1.877544190350265	2021-10-01 20:48:58	1	7	1	34
165	45.90360965566186	-2.170429047133859	2021-03-05 19:43:17	2	7	3	50
166	44.32704403525704	-1.9512739729942987	2021-08-07 20:20:34	2	6	2	9
167	45.542557372701886	-2.1589871655061654	2021-10-18 21:34:38	1	7	2	57
168	44.650013362190215	-1.7406709136191099	2021-12-11 16:12:58	1	5	5	23
169	45.86627170861542	-1.717415363321133	2021-06-27 01:24:55	2	4	3	1
170	44.62605608260351	-1.8601311553179933	2021-08-26 18:13:26	1	6	6	41
171	44.79677676904235	-1.5351963939374138	2021-01-23 01:57:17	1	2	2	42
172	45.81003405899847	-1.7980041498325696	2021-04-05 22:18:57	2	4	3	5
173	45.695971811375905	-1.564705840413931	2021-12-21 04:36:27	2	2	2	39
174	43.9231182852956	-1.7110903720952937	2021-09-27 02:28:28	2	4	2	53
175	45.518802884196596	-1.9389712416707428	2021-03-12 23:48:39	1	6	5	56
176	45.879280621887474	-2.209377700827146	2021-04-02 08:38:14	2	4	3	14
177	45.35891133952	-2.11363411941599	2021-02-04 04:04:04	2	5	2	62
178	45.8945142537507	-2.1449858438385787	2021-02-02 12:09:05	2	3	6	7
179	43.95072444301716	-1.5805348342071173	2021-10-29 16:30:45	2	2	4	36
180	44.3822851612456	-2.0225138102283546	2021-02-17 00:13:59	1	5	6	18
181	45.04164215793045	-2.137641475801463	2021-09-16 19:38:28	2	6	2	59
182	44.515299196843806	-1.5975109480350753	2021-05-12 01:33:05	2	3	1	23
183	45.991880968271836	-1.8225313624693347	2021-03-31 07:52:11	1	6	6	14
184	43.796413592256265	-1.6431195255832247	2021-08-29 20:12:21	1	4	3	50
185	45.48352485269391	-1.7435649007081302	2021-07-28 13:31:12	1	2	6	34
186	45.70355970666603	-1.8410346843873588	2021-08-27 17:47:21	2	5	1	30
187	44.32380726931691	-2.2028669820344056	2021-11-27 21:23:49	1	4	3	16
188	44.711950171569846	-2.0804966920035444	2021-11-08 05:22:19	2	1	2	49
189	44.11063115343318	-1.741726500294055	2021-03-24 02:10:32	1	2	5	45
190	44.24323370042332	-1.802852138837527	2021-04-23 14:07:06	2	7	6	57
191	43.85640343951545	-1.6484236803932915	2021-05-31 12:08:36	2	3	6	6
192	45.13800975928777	-1.6851538039951333	2021-03-18 16:09:16	1	6	3	18
193	44.775331447499916	-2.2440933413895277	2021-03-13 19:39:30	2	6	6	29
194	43.99824483932542	-1.5748696373733715	2021-03-11 15:01:28	2	2	4	15
195	45.038614253642635	-1.6626464392309976	2021-01-11 21:00:25	2	5	6	52
196	45.59557835709552	-2.166798049210037	2021-11-08 22:02:43	2	7	1	60
197	44.61167759304711	-2.0964289657349937	2021-03-30 14:43:30	2	5	6	28
198	43.922612877294945	-2.0329815069319586	2021-11-21 15:38:15	1	7	5	15
199	45.06818050982849	-2.1917220746543964	2021-07-28 01:44:44	1	3	6	24
200	44.07989724053479	-1.9088826069852078	2021-01-02 00:48:23	2	7	3	23
\.

COPY anomaly.involvement (vessel_id, anomaly_id) FROM stdin;
51	1
353	2
138	3
199	4
109	5
238	6
188	7
172	8
328	9
38	10
329	11
309	12
280	13
32	14
283	15
255	16
73	17
212	18
383	19
247	20
217	21
284	22
303	23
214	24
356	25
393	26
239	27
181	28
130	29
301	30
101	31
401	32
88	33
48	34
238	35
47	36
212	37
266	38
212	39
184	40
343	41
39	42
23	43
335	44
34	45
296	46
69	47
311	48
191	49
83	50
86	51
206	52
56	53
299	54
396	55
110	56
148	57
243	58
364	59
285	60
2	61
303	62
363	63
65	64
165	65
136	66
1	67
236	68
313	69
188	70
174	71
148	72
200	73
172	74
378	75
313	76
265	77
25	78
22	79
327	80
130	81
323	82
362	83
162	84
270	85
232	86
376	87
406	88
309	89
278	90
231	91
9	92
349	93
405	94
280	95
131	96
60	97
119	98
217	99
360	100
213	101
184	102
267	103
191	104
384	105
118	106
207	107
28	108
54	109
301	110
107	111
85	112
320	113
274	114
164	115
51	116
207	117
337	118
320	119
293	120
341	121
254	122
331	123
289	124
378	125
211	126
364	127
174	128
50	129
267	130
88	131
358	132
385	133
285	134
18	135
405	136
272	137
99	138
323	139
38	140
125	141
134	142
35	143
145	144
356	145
297	146
50	147
133	148
321	149
396	150
140	151
172	152
86	153
301	154
397	155
153	156
370	157
66	158
265	159
45	160
145	161
99	162
211	163
366	164
332	165
301	166
156	167
92	168
147	169
27	170
303	171
279	172
85	173
354	174
101	175
277	176
131	177
223	178
25	179
53	180
225	181
356	182
52	183
168	184
47	185
169	186
267	187
172	188
58	189
387	190
81	191
61	192
399	193
8	194
384	195
191	196
126	197
273	198
27	199
398	200
\.
