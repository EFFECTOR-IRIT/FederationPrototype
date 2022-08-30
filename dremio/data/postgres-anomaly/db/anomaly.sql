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
