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
    id SERIAL PRIMARY KEY,
    lat integer NOT NULL,
    lon integer NOT NULL,
    timestamp timestamp NOT NULL,
    CONSTRAINT fk_cs
        FOREIGN KEY(confirmation_status) 
        REFERENCES anomaly.confirmation_status(id),
    CONSTRAINT fk_conf
        FOREIGN KEY(confidence) 
        REFERENCES anomaly.confidence(id),
    CONSTRAINT fk_priority
        FOREIGN KEY(priority)  
        REFERENCES anomaly.priority(id)
);

ALTER TABLE anomaly.anomalies OWNER TO postgres;

--
-- Name: involvement; Type: TABLE; Schema: anomaly; Owner: postgres
--

CREATE TABLE anomaly.involvement (
    vessel_id INTEGER NOT NULL references anomaly.vessel ON UPDATE CASCADE,
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
IncongrousVesselBehavior	'The behavior pattern of a vessel is not coherent respect to the declared type' coming from AIS flow
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
