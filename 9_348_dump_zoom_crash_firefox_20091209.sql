--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: advanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advanceassignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    reportglobaladvance boolean,
    advance_type_id bigint
);


ALTER TABLE public.advanceassignment OWNER TO naval;

--
-- Name: advancemeasurement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancemeasurement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    advance_assignment_id bigint
);


ALTER TABLE public.advancemeasurement OWNER TO naval;

--
-- Name: advancetype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancetype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    unitname character varying(255),
    defaultmaxvalue numeric(19,4),
    updatable boolean,
    unitprecision numeric(19,4),
    active boolean,
    percentage boolean
);


ALTER TABLE public.advancetype OWNER TO naval;

--
-- Name: all_criterions; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE all_criterions (
    generic_resource_allocation_id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.all_criterions OWNER TO naval;

--
-- Name: assignment_function; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE assignment_function (
    id bigint NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE public.assignment_function OWNER TO naval;

--
-- Name: basecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE basecalendar (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.basecalendar OWNER TO naval;

--
-- Name: calendaravailability; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendaravailability (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate date,
    enddate date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendaravailability OWNER TO naval;

--
-- Name: calendardata; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendardata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    parent bigint,
    expiringdate date,
    base_calendar_id bigint,
    position_in_calendar integer
);


ALTER TABLE public.calendardata OWNER TO naval;

--
-- Name: calendarexception; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexception (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    hours integer,
    calendar_exception_id bigint,
    base_calendar_id bigint
);


ALTER TABLE public.calendarexception OWNER TO naval;

--
-- Name: calendarexceptiontype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE calendarexceptiontype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    color character varying(255),
    notassignable boolean
);


ALTER TABLE public.calendarexceptiontype OWNER TO naval;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE configuration (
    id bigint NOT NULL,
    version bigint NOT NULL,
    configuration_id bigint
);


ALTER TABLE public.configuration OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    enabled boolean
);


ALTER TABLE public.cost_category OWNER TO naval;

--
-- Name: criterion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    active boolean,
    id_criterion_type bigint NOT NULL,
    parent bigint
);


ALTER TABLE public.criterion OWNER TO naval;

--
-- Name: criterionrequirement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionrequirement (
    id bigint NOT NULL,
    criterion_requirement_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    hours_group_id bigint,
    order_element_id bigint,
    criterion_id bigint,
    parent bigint,
    isvalid boolean
);


ALTER TABLE public.criterionrequirement OWNER TO naval;

--
-- Name: criterionsatisfaction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionsatisfaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate timestamp without time zone NOT NULL,
    finishdate timestamp without time zone,
    isdeleted boolean,
    criterion bigint NOT NULL,
    resource bigint NOT NULL
);


ALTER TABLE public.criterionsatisfaction OWNER TO naval;

--
-- Name: criteriontype; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criteriontype (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    allowsimultaneouscriterionsperresource boolean,
    allowhierarchy boolean,
    enabled boolean,
    resource integer
);


ALTER TABLE public.criteriontype OWNER TO naval;

--
-- Name: day_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE day_assignment (
    id bigint NOT NULL,
    day_assignment_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    hours integer NOT NULL,
    day date NOT NULL,
    resource_id bigint NOT NULL,
    specific_resource_allocation_id bigint,
    generic_resource_allocation_id bigint
);


ALTER TABLE public.day_assignment OWNER TO naval;

--
-- Name: dependency; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE dependency (
    id bigint NOT NULL,
    version bigint NOT NULL,
    origin bigint,
    destination bigint,
    type integer
);


ALTER TABLE public.dependency OWNER TO naval;

--
-- Name: description_values; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE description_values (
    description_value_id bigint NOT NULL,
    fieldname character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values OWNER TO naval;

--
-- Name: description_values_in_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE description_values_in_line (
    description_value_id bigint NOT NULL,
    fieldname character varying(255),
    value character varying(255)
);


ALTER TABLE public.description_values_in_line OWNER TO naval;

--
-- Name: directadvanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE directadvanceassignment (
    advance_assignment_id bigint NOT NULL,
    direct_order_element_id bigint,
    maxvalue numeric(19,2)
);


ALTER TABLE public.directadvanceassignment OWNER TO naval;

--
-- Name: generic_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE generic_resource_allocation (
    resource_allocation_id bigint NOT NULL
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: heading_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE heading_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    index integer
);


ALTER TABLE public.heading_field OWNER TO naval;

--
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hibernate_unique_key (
    next_hi integer
);


ALTER TABLE public.hibernate_unique_key OWNER TO naval;

--
-- Name: hour_cost; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hour_cost (
    id bigint NOT NULL,
    version bigint NOT NULL,
    pricecost numeric(19,2),
    initdate date,
    enddate date,
    type_of_work_hours_id bigint,
    cost_category_id bigint
);


ALTER TABLE public.hour_cost OWNER TO naval;

--
-- Name: hoursgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hoursgroup (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    resourcetype bytea,
    workinghours integer,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint NOT NULL
);


ALTER TABLE public.hoursgroup OWNER TO naval;

--
-- Name: hoursperday; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE hoursperday (
    base_calendar_id bigint NOT NULL,
    hours integer,
    day_id integer NOT NULL
);


ALTER TABLE public.hoursperday OWNER TO naval;

--
-- Name: indirectadvanceassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE indirectadvanceassignment (
    advance_assignment_id bigint NOT NULL,
    indirect_order_element_id bigint
);


ALTER TABLE public.indirectadvanceassignment OWNER TO naval;

--
-- Name: label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE label (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    label_type_id bigint
);


ALTER TABLE public.label OWNER TO naval;

--
-- Name: label_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE label_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.label_type OWNER TO naval;

--
-- Name: line_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE line_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    index integer
);


ALTER TABLE public.line_field OWNER TO naval;

--
-- Name: machine; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine (
    machine_id bigint NOT NULL,
    code character varying(255),
    name character varying(255),
    description character varying(255)
);


ALTER TABLE public.machine OWNER TO naval;

--
-- Name: machine_configuration_unit_required_criterions; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine_configuration_unit_required_criterions (
    id bigint NOT NULL,
    criterion_id bigint NOT NULL
);


ALTER TABLE public.machine_configuration_unit_required_criterions OWNER TO naval;

--
-- Name: machineworkerassignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machineworkerassignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    startdate timestamp without time zone,
    finishdate timestamp without time zone,
    configuration_id bigint NOT NULL,
    worker_id bigint
);


ALTER TABLE public.machineworkerassignment OWNER TO naval;

--
-- Name: machineworkersconfigurationunit; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machineworkersconfigurationunit (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    alpha numeric(19,2) NOT NULL,
    machine bigint NOT NULL
);


ALTER TABLE public.machineworkersconfigurationunit OWNER TO naval;

--
-- Name: material; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    default_unit_price numeric(19,2),
    unit_type integer,
    disabled boolean,
    category_id bigint
);


ALTER TABLE public.material OWNER TO naval;

--
-- Name: material_assigment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units double precision,
    unit_price numeric(19,2),
    estimated_availability timestamp without time zone,
    status integer,
    order_element_id bigint,
    material_id bigint
);


ALTER TABLE public.material_assigment OWNER TO naval;

--
-- Name: material_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    parent_id bigint
);


ALTER TABLE public.material_category OWNER TO naval;

--
-- Name: naval_user; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE naval_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    loginname character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.naval_user OWNER TO naval;

--
-- Name: order_element_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_label (
    order_element_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_label OWNER TO naval;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_table (
    orderelementid bigint NOT NULL,
    responsible character varying(255),
    customer character varying(255),
    dependenciesconstraintshavepriority boolean,
    base_calendar_id bigint
);


ALTER TABLE public.order_table OWNER TO naval;

--
-- Name: orderelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    initdate timestamp without time zone,
    deadline timestamp without time zone,
    mandatoryinit boolean,
    mandatoryend boolean,
    description character varying(255),
    code character varying(255),
    schedulingstatetype integer,
    parent bigint,
    positionincontainer integer
);


ALTER TABLE public.orderelement OWNER TO naval;

--
-- Name: orderline; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderline (
    orderelementid bigint NOT NULL
);


ALTER TABLE public.orderline OWNER TO naval;

--
-- Name: orderlinegroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinegroup (
    orderelementid bigint NOT NULL
);


ALTER TABLE public.orderlinegroup OWNER TO naval;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    calendar bigint
);


ALTER TABLE public.resource OWNER TO naval;

--
-- Name: resourceallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourceallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resourcesperday numeric(19,2),
    task bigint,
    assignment_function bigint
);


ALTER TABLE public.resourceallocation OWNER TO naval;

--
-- Name: resourcecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourcecalendar (
    base_calendar_id bigint NOT NULL
);


ALTER TABLE public.resourcecalendar OWNER TO naval;

--
-- Name: resources_cost_category_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resources_cost_category_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    initdate date,
    enddate date,
    cost_category_id bigint,
    resource_id bigint
);


ALTER TABLE public.resources_cost_category_assignment OWNER TO naval;

--
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO naval;

--
-- Name: stretches; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE stretches (
    assignment_function_id bigint NOT NULL,
    date date NOT NULL,
    lengthpercentage numeric(19,2) NOT NULL,
    amountworkpercentage numeric(19,2) NOT NULL,
    stretch_position integer NOT NULL
);


ALTER TABLE public.stretches OWNER TO naval;

--
-- Name: stretchesfunction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE stretchesfunction (
    assignment_function_id bigint NOT NULL
);


ALTER TABLE public.stretchesfunction OWNER TO naval;

--
-- Name: task; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    calculatedvalue integer,
    startconstrainttype integer,
    constraintdate timestamp without time zone
);


ALTER TABLE public.task OWNER TO naval;

--
-- Name: task_source_hours_groups; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_source_hours_groups (
    task_source_id bigint NOT NULL,
    hours_group_id bigint NOT NULL
);


ALTER TABLE public.task_source_hours_groups OWNER TO naval;

--
-- Name: taskelement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskelement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    notes character varying(255),
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    deadline date,
    parent bigint,
    base_calendar_id bigint,
    positioninparent integer
);


ALTER TABLE public.taskelement OWNER TO naval;

--
-- Name: taskgroup; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskgroup (
    task_element_id bigint NOT NULL
);


ALTER TABLE public.taskgroup OWNER TO naval;

--
-- Name: taskmilestone; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE taskmilestone (
    task_element_id bigint NOT NULL
);


ALTER TABLE public.taskmilestone OWNER TO naval;

--
-- Name: tasksource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE tasksource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    orderelement bigint
);


ALTER TABLE public.tasksource OWNER TO naval;

--
-- Name: type_of_work_hours; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE type_of_work_hours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    defaultprice numeric(19,2),
    enabled boolean
);


ALTER TABLE public.type_of_work_hours OWNER TO naval;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE user_roles (
    userid bigint NOT NULL,
    elt character varying(255)
);


ALTER TABLE public.user_roles OWNER TO naval;

--
-- Name: work_report; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date timestamp without time zone,
    work_report_type_id bigint NOT NULL,
    resource_id bigint,
    order_element_id bigint
);


ALTER TABLE public.work_report OWNER TO naval;

--
-- Name: work_report_label_type_assigment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_label_type_assigment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    labelssharedbylines boolean,
    index integer,
    label_type_id bigint,
    label_id bigint,
    work_report_type_id bigint
);


ALTER TABLE public.work_report_label_type_assigment OWNER TO naval;

--
-- Name: work_report_line; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_line (
    id bigint NOT NULL,
    version bigint NOT NULL,
    numhours integer,
    date timestamp without time zone,
    clockstart timestamp without time zone,
    clockfinish timestamp without time zone,
    work_report_id bigint,
    resource_id bigint NOT NULL,
    order_element_id bigint NOT NULL,
    type_work_hours_id bigint NOT NULL
);


ALTER TABLE public.work_report_line OWNER TO naval;

--
-- Name: work_report_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    code character varying(255),
    dateissharedbylines boolean,
    resourceissharedinlines boolean,
    orderelementissharedinlines boolean,
    hoursmanagement integer
);


ALTER TABLE public.work_report_type OWNER TO naval;

--
-- Name: worker; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE worker (
    worker_id bigint NOT NULL,
    firstname character varying(255),
    surname character varying(255),
    nif character varying(255)
);


ALTER TABLE public.worker OWNER TO naval;

--
-- Name: workreports_labels; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE workreports_labels (
    work_report_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreports_labels OWNER TO naval;

--
-- Name: workreportslines_labels; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE workreportslines_labels (
    work_report_line_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.workreportslines_labels OWNER TO naval;

--
-- Data for Name: advanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignment (id, version, reportglobaladvance, advance_type_id) FROM stdin;
1224	2	t	101
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id) FROM stdin;
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage) FROM stdin;
101	3	children	100.0000	f	0.0100	t	t
102	2	percentage	100.0000	f	0.0100	t	t
103	1	units	2147483647.0000	f	1.0000	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
404	1	Default
405	1	Spain
406	1	\N
407	1	\N
408	1	\N
409	1	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1010	1	2009-12-09	\N	406	0
1011	1	2009-12-09	\N	407	0
1012	1	2009-12-09	\N	408	0
1013	1	2009-12-09	\N	409	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
505	1	\N	\N	404	0
506	1	404	\N	405	0
507	1	405	\N	406	0
508	1	404	\N	407	0
509	1	405	\N	408	0
510	1	405	\N	409	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
808	1	2009-12-25	0	5	405
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable) FROM stdin;
1	6	HOLIDAY	red	t
2	5	SICK_LEAVE	red	t
3	4	LEAVE	red	t
4	3	STRIKE	red	t
5	2	BANK_HOLIDAY	red	t
6	1	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id) FROM stdin;
606	1	404
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, name, active, id_criterion_type, parent) FROM stdin;
303	14	medicalLeave	t	65536	\N
304	13	paternityLeave	t	65536	\N
305	4	hiredResourceWorkingRelationship	t	65540	\N
306	3	firedResourceWorkingRelationship	t	65540	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid) FROM stdin;
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
65536	15	LEAVE	Leave	f	f	t	1
65537	11	CATEGORY	Professional category	t	t	t	1
65538	9	TRAINING	Training courses and labor training	t	t	t	1
65539	7	JOB	Job	t	t	t	1
65540	5	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
65541	1	LOCATION_GROUP	Location where the resource work	t	f	t	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id) FROM stdin;
6616	GENERIC_DAY	0	2	2010-07-04	914	\N	1516
6617	GENERIC_DAY	0	2	2010-09-19	916	\N	1516
6618	GENERIC_DAY	0	2	2012-10-16	910	\N	1516
6619	GENERIC_DAY	0	2	2013-02-12	914	\N	1516
6620	GENERIC_DAY	0	2	2010-11-20	914	\N	1516
6621	GENERIC_DAY	0	2	2011-12-10	914	\N	1516
6622	GENERIC_DAY	0	2	2010-12-17	910	\N	1516
6623	GENERIC_DAY	0	2	2010-10-26	916	\N	1516
6624	GENERIC_DAY	0	2	2012-02-03	914	\N	1516
6625	GENERIC_DAY	0	2	2012-12-21	912	\N	1516
6626	GENERIC_DAY	0	2	2013-04-03	912	\N	1516
6627	GENERIC_DAY	0	2	2012-03-22	916	\N	1516
6628	GENERIC_DAY	0	2	2012-02-28	916	\N	1516
6629	GENERIC_DAY	0	2	2012-04-14	912	\N	1516
6630	GENERIC_DAY	0	2	2010-10-27	912	\N	1516
6631	GENERIC_DAY	0	2	2011-09-07	912	\N	1516
6632	GENERIC_DAY	0	2	2010-05-18	916	\N	1516
6633	GENERIC_DAY	0	2	2012-12-03	916	\N	1516
6634	GENERIC_DAY	0	2	2012-12-19	916	\N	1516
6635	GENERIC_DAY	0	2	2013-03-23	910	\N	1516
6636	GENERIC_DAY	0	2	2010-08-10	912	\N	1516
6637	GENERIC_DAY	0	2	2010-06-08	916	\N	1516
6638	GENERIC_DAY	0	2	2012-10-05	912	\N	1516
6639	GENERIC_DAY	0	2	2012-09-30	916	\N	1516
6640	GENERIC_DAY	0	2	2012-06-04	910	\N	1516
6641	GENERIC_DAY	0	2	2011-09-10	910	\N	1516
6642	GENERIC_DAY	0	2	2012-11-25	914	\N	1516
6643	GENERIC_DAY	0	2	2012-11-07	914	\N	1516
6644	GENERIC_DAY	0	2	2011-04-24	912	\N	1516
6645	GENERIC_DAY	0	2	2011-11-17	910	\N	1516
6646	GENERIC_DAY	0	2	2010-04-15	914	\N	1516
6647	GENERIC_DAY	0	2	2011-07-02	916	\N	1516
6648	GENERIC_DAY	0	2	2010-08-06	910	\N	1516
6649	GENERIC_DAY	0	2	2012-02-22	914	\N	1516
6650	GENERIC_DAY	0	2	2009-12-16	910	\N	1516
6651	GENERIC_DAY	0	2	2009-12-20	916	\N	1516
6652	GENERIC_DAY	0	2	2013-01-11	914	\N	1516
6653	GENERIC_DAY	0	2	2011-03-19	910	\N	1516
6654	GENERIC_DAY	0	2	2012-07-03	910	\N	1516
6655	GENERIC_DAY	0	2	2011-12-09	910	\N	1516
6656	GENERIC_DAY	0	2	2012-03-17	910	\N	1516
6657	GENERIC_DAY	0	2	2011-04-29	914	\N	1516
6658	GENERIC_DAY	0	2	2012-02-05	914	\N	1516
6659	GENERIC_DAY	0	2	2012-07-15	910	\N	1516
6660	GENERIC_DAY	0	2	2012-10-12	916	\N	1516
6661	GENERIC_DAY	0	2	2010-09-24	910	\N	1516
6662	GENERIC_DAY	0	2	2012-06-11	910	\N	1516
6663	GENERIC_DAY	0	2	2012-01-15	914	\N	1516
6664	GENERIC_DAY	0	2	2011-10-21	916	\N	1516
6665	GENERIC_DAY	0	2	2012-03-04	916	\N	1516
6666	GENERIC_DAY	0	2	2013-03-21	912	\N	1516
6667	GENERIC_DAY	0	2	2012-10-20	916	\N	1516
6668	GENERIC_DAY	0	2	2010-12-03	910	\N	1516
6669	GENERIC_DAY	0	2	2011-06-17	916	\N	1516
6670	GENERIC_DAY	0	2	2011-04-13	914	\N	1516
6671	GENERIC_DAY	0	2	2010-12-18	912	\N	1516
6672	GENERIC_DAY	0	2	2011-01-13	914	\N	1516
6673	GENERIC_DAY	0	2	2010-03-11	916	\N	1516
6674	GENERIC_DAY	0	2	2011-01-22	914	\N	1516
6675	GENERIC_DAY	0	2	2012-09-15	914	\N	1516
6676	GENERIC_DAY	0	2	2012-07-04	910	\N	1516
6677	GENERIC_DAY	0	2	2010-09-09	916	\N	1516
6678	GENERIC_DAY	0	2	2011-07-01	912	\N	1516
6679	GENERIC_DAY	0	2	2012-11-10	914	\N	1516
6680	GENERIC_DAY	0	2	2011-05-07	912	\N	1516
6681	GENERIC_DAY	0	2	2010-05-14	912	\N	1516
6682	GENERIC_DAY	0	2	2012-06-27	916	\N	1516
6683	GENERIC_DAY	0	2	2009-12-28	910	\N	1516
6684	GENERIC_DAY	0	2	2013-04-25	910	\N	1516
6685	GENERIC_DAY	0	2	2013-04-05	912	\N	1516
6686	GENERIC_DAY	0	2	2012-10-17	910	\N	1516
6687	GENERIC_DAY	0	2	2010-03-02	914	\N	1516
6688	GENERIC_DAY	0	2	2012-09-23	916	\N	1516
6689	GENERIC_DAY	0	2	2010-09-12	916	\N	1516
6690	GENERIC_DAY	0	2	2010-02-01	910	\N	1516
6691	GENERIC_DAY	0	2	2012-09-15	916	\N	1516
6692	GENERIC_DAY	0	2	2010-01-25	912	\N	1516
6693	GENERIC_DAY	0	2	2012-01-09	914	\N	1516
6694	GENERIC_DAY	0	2	2013-04-11	916	\N	1516
6695	GENERIC_DAY	0	2	2010-11-10	916	\N	1516
6696	GENERIC_DAY	0	2	2010-06-17	914	\N	1516
6697	GENERIC_DAY	0	2	2012-11-16	916	\N	1516
6698	GENERIC_DAY	0	2	2011-07-25	916	\N	1516
6699	GENERIC_DAY	0	2	2012-07-10	910	\N	1516
6700	GENERIC_DAY	0	2	2011-06-22	914	\N	1516
6701	GENERIC_DAY	0	2	2011-05-10	916	\N	1516
6702	GENERIC_DAY	0	2	2012-12-16	910	\N	1516
6703	GENERIC_DAY	0	2	2012-01-20	916	\N	1516
6704	GENERIC_DAY	0	2	2011-10-21	914	\N	1516
6705	GENERIC_DAY	0	2	2011-12-15	910	\N	1516
6706	GENERIC_DAY	0	2	2010-06-12	912	\N	1516
6707	GENERIC_DAY	0	2	2012-07-12	914	\N	1516
6708	GENERIC_DAY	0	2	2011-08-15	914	\N	1516
6709	GENERIC_DAY	0	2	2010-03-22	914	\N	1516
6710	GENERIC_DAY	0	2	2011-07-11	914	\N	1516
6711	GENERIC_DAY	0	2	2011-09-13	914	\N	1516
6712	GENERIC_DAY	0	2	2011-07-12	916	\N	1516
6713	GENERIC_DAY	0	2	2011-12-08	910	\N	1516
6714	GENERIC_DAY	0	2	2013-03-07	910	\N	1516
6715	GENERIC_DAY	0	2	2010-11-01	912	\N	1516
6716	GENERIC_DAY	0	2	2011-09-21	910	\N	1516
6717	GENERIC_DAY	0	2	2011-02-08	916	\N	1516
6718	GENERIC_DAY	0	2	2011-08-11	912	\N	1516
6719	GENERIC_DAY	0	2	2013-01-20	912	\N	1516
6720	GENERIC_DAY	0	2	2012-06-20	912	\N	1516
6721	GENERIC_DAY	0	2	2011-02-01	916	\N	1516
6722	GENERIC_DAY	0	2	2011-01-07	910	\N	1516
6723	GENERIC_DAY	0	2	2011-06-27	916	\N	1516
6724	GENERIC_DAY	0	2	2013-02-28	916	\N	1516
6725	GENERIC_DAY	0	2	2011-11-16	914	\N	1516
6726	GENERIC_DAY	0	2	2010-06-09	910	\N	1516
6727	GENERIC_DAY	0	2	2013-04-20	910	\N	1516
6728	GENERIC_DAY	0	2	2012-08-24	910	\N	1516
6729	GENERIC_DAY	0	2	2012-08-27	910	\N	1516
6730	GENERIC_DAY	0	2	2013-03-27	912	\N	1516
6731	GENERIC_DAY	0	2	2010-06-14	912	\N	1516
6732	GENERIC_DAY	0	2	2010-01-09	916	\N	1516
6733	GENERIC_DAY	0	2	2012-01-04	914	\N	1516
6734	GENERIC_DAY	0	2	2012-05-26	914	\N	1516
6735	GENERIC_DAY	0	2	2011-11-14	916	\N	1516
6736	GENERIC_DAY	0	2	2010-05-16	910	\N	1516
6737	GENERIC_DAY	0	2	2013-02-10	916	\N	1516
6738	GENERIC_DAY	0	2	2012-02-05	916	\N	1516
6739	GENERIC_DAY	0	2	2010-02-25	916	\N	1516
6740	GENERIC_DAY	0	2	2010-12-14	912	\N	1516
6741	GENERIC_DAY	0	2	2011-08-24	912	\N	1516
6742	GENERIC_DAY	0	2	2011-07-24	914	\N	1516
6743	GENERIC_DAY	0	2	2012-07-02	912	\N	1516
6744	GENERIC_DAY	0	2	2010-01-23	916	\N	1516
6745	GENERIC_DAY	0	2	2012-03-21	916	\N	1516
6746	GENERIC_DAY	0	2	2011-06-26	910	\N	1516
6747	GENERIC_DAY	0	2	2012-07-01	912	\N	1516
6748	GENERIC_DAY	0	2	2010-11-27	914	\N	1516
6749	GENERIC_DAY	0	2	2010-05-28	914	\N	1516
6750	GENERIC_DAY	0	2	2011-02-02	910	\N	1516
6751	GENERIC_DAY	0	2	2011-06-27	914	\N	1516
6752	GENERIC_DAY	0	2	2011-09-30	910	\N	1516
6753	GENERIC_DAY	0	2	2011-10-15	910	\N	1516
6754	GENERIC_DAY	0	2	2010-06-22	910	\N	1516
6755	GENERIC_DAY	0	2	2013-02-20	916	\N	1516
6756	GENERIC_DAY	0	2	2010-10-23	914	\N	1516
6757	GENERIC_DAY	0	2	2012-03-30	912	\N	1516
6758	GENERIC_DAY	0	2	2012-11-05	910	\N	1516
6759	GENERIC_DAY	0	2	2012-06-19	912	\N	1516
6760	GENERIC_DAY	0	2	2011-10-03	914	\N	1516
6761	GENERIC_DAY	0	2	2012-12-16	914	\N	1516
6762	GENERIC_DAY	0	2	2010-02-15	916	\N	1516
6763	GENERIC_DAY	0	2	2012-07-17	912	\N	1516
6764	GENERIC_DAY	0	2	2013-01-27	912	\N	1516
6765	GENERIC_DAY	0	2	2012-04-07	916	\N	1516
6766	GENERIC_DAY	0	2	2012-07-11	910	\N	1516
6767	GENERIC_DAY	0	2	2010-09-29	916	\N	1516
6768	GENERIC_DAY	0	2	2013-02-18	910	\N	1516
6769	GENERIC_DAY	0	2	2012-09-30	912	\N	1516
6770	GENERIC_DAY	0	2	2012-11-13	914	\N	1516
6771	GENERIC_DAY	0	2	2012-03-16	912	\N	1516
6772	GENERIC_DAY	0	2	2012-11-30	912	\N	1516
6773	GENERIC_DAY	0	2	2011-07-15	914	\N	1516
6774	GENERIC_DAY	0	2	2012-02-10	916	\N	1516
6775	GENERIC_DAY	0	2	2011-01-22	916	\N	1516
6776	GENERIC_DAY	0	2	2013-04-21	914	\N	1516
6777	GENERIC_DAY	0	2	2010-05-06	910	\N	1516
6778	GENERIC_DAY	0	2	2010-10-06	912	\N	1516
6779	GENERIC_DAY	0	2	2011-08-31	912	\N	1516
6780	GENERIC_DAY	0	2	2012-09-28	916	\N	1516
6781	GENERIC_DAY	0	2	2012-03-06	916	\N	1516
6782	GENERIC_DAY	0	2	2012-04-30	912	\N	1516
6783	GENERIC_DAY	0	2	2012-02-06	912	\N	1516
6784	GENERIC_DAY	0	2	2011-04-15	916	\N	1516
6785	GENERIC_DAY	0	2	2012-03-19	910	\N	1516
6786	GENERIC_DAY	0	2	2011-05-14	914	\N	1516
6787	GENERIC_DAY	0	2	2010-03-17	912	\N	1516
6788	GENERIC_DAY	0	2	2011-02-24	910	\N	1516
6789	GENERIC_DAY	0	2	2010-07-04	916	\N	1516
6790	GENERIC_DAY	0	2	2012-12-26	914	\N	1516
6791	GENERIC_DAY	0	2	2012-05-22	914	\N	1516
6792	GENERIC_DAY	0	2	2012-11-30	910	\N	1516
6793	GENERIC_DAY	0	2	2012-06-15	914	\N	1516
6794	GENERIC_DAY	0	2	2010-01-01	914	\N	1516
6795	GENERIC_DAY	0	2	2012-01-11	912	\N	1516
6796	GENERIC_DAY	0	2	2010-12-30	910	\N	1516
6797	GENERIC_DAY	0	2	2013-01-30	914	\N	1516
6798	GENERIC_DAY	0	2	2012-08-18	910	\N	1516
6799	GENERIC_DAY	0	2	2010-09-28	912	\N	1516
6800	GENERIC_DAY	0	2	2010-02-15	914	\N	1516
6801	GENERIC_DAY	0	2	2009-12-12	916	\N	1516
6802	GENERIC_DAY	0	2	2011-08-14	914	\N	1516
6803	GENERIC_DAY	0	2	2012-06-23	914	\N	1516
6804	GENERIC_DAY	0	2	2010-08-11	912	\N	1516
6805	GENERIC_DAY	0	2	2011-11-19	910	\N	1516
6806	GENERIC_DAY	0	2	2010-06-01	910	\N	1516
6807	GENERIC_DAY	0	2	2011-04-30	914	\N	1516
6808	GENERIC_DAY	0	2	2009-12-19	912	\N	1516
6809	GENERIC_DAY	0	2	2010-10-06	914	\N	1516
6810	GENERIC_DAY	0	2	2010-09-16	912	\N	1516
6811	GENERIC_DAY	0	2	2011-07-05	914	\N	1516
6812	GENERIC_DAY	0	2	2011-10-24	910	\N	1516
6813	GENERIC_DAY	0	2	2010-07-18	910	\N	1516
6814	GENERIC_DAY	0	2	2010-04-16	912	\N	1516
6815	GENERIC_DAY	0	2	2011-10-14	910	\N	1516
6816	GENERIC_DAY	0	2	2012-07-03	916	\N	1516
6817	GENERIC_DAY	0	2	2011-11-03	910	\N	1516
6818	GENERIC_DAY	0	2	2010-11-20	912	\N	1516
6819	GENERIC_DAY	0	2	2011-02-24	914	\N	1516
6820	GENERIC_DAY	0	2	2011-11-24	914	\N	1516
6821	GENERIC_DAY	0	2	2012-04-05	916	\N	1516
6822	GENERIC_DAY	0	2	2012-07-30	910	\N	1516
6823	GENERIC_DAY	0	2	2013-03-23	914	\N	1516
6824	GENERIC_DAY	0	2	2010-04-11	912	\N	1516
6825	GENERIC_DAY	0	2	2011-04-16	912	\N	1516
6826	GENERIC_DAY	0	2	2013-04-22	916	\N	1516
6827	GENERIC_DAY	0	2	2012-01-27	912	\N	1516
6828	GENERIC_DAY	0	2	2010-03-12	914	\N	1516
6829	GENERIC_DAY	0	2	2011-06-12	912	\N	1516
6830	GENERIC_DAY	0	2	2012-10-09	914	\N	1516
6831	GENERIC_DAY	0	2	2013-05-01	912	\N	1516
6832	GENERIC_DAY	0	2	2010-04-12	914	\N	1516
6833	GENERIC_DAY	0	2	2011-06-22	912	\N	1516
6834	GENERIC_DAY	0	2	2012-03-01	914	\N	1516
6835	GENERIC_DAY	0	2	2012-02-01	916	\N	1516
6836	GENERIC_DAY	0	2	2012-01-22	910	\N	1516
6837	GENERIC_DAY	0	2	2010-06-28	914	\N	1516
6838	GENERIC_DAY	0	2	2012-06-24	910	\N	1516
6839	GENERIC_DAY	0	2	2010-08-13	912	\N	1516
6840	GENERIC_DAY	0	2	2010-05-01	910	\N	1516
6841	GENERIC_DAY	0	2	2012-07-28	916	\N	1516
6842	GENERIC_DAY	0	2	2010-10-15	916	\N	1516
6843	GENERIC_DAY	0	2	2010-12-18	916	\N	1516
6844	GENERIC_DAY	0	2	2011-10-12	914	\N	1516
6845	GENERIC_DAY	0	2	2010-11-05	916	\N	1516
6846	GENERIC_DAY	0	2	2011-01-15	910	\N	1516
6847	GENERIC_DAY	0	2	2010-08-17	916	\N	1516
6848	GENERIC_DAY	0	2	2011-09-08	916	\N	1516
6849	GENERIC_DAY	0	2	2012-07-07	916	\N	1516
6850	GENERIC_DAY	0	2	2010-07-10	910	\N	1516
6851	GENERIC_DAY	0	2	2012-01-08	916	\N	1516
6852	GENERIC_DAY	0	2	2010-06-16	912	\N	1516
6853	GENERIC_DAY	0	2	2013-03-31	916	\N	1516
6854	GENERIC_DAY	0	2	2010-05-23	912	\N	1516
6855	GENERIC_DAY	0	2	2010-04-15	916	\N	1516
6856	GENERIC_DAY	0	2	2010-09-08	912	\N	1516
6857	GENERIC_DAY	0	2	2011-10-11	912	\N	1516
6858	GENERIC_DAY	0	2	2012-07-25	914	\N	1516
6859	GENERIC_DAY	0	2	2012-02-09	910	\N	1516
6860	GENERIC_DAY	0	2	2012-04-08	914	\N	1516
6861	GENERIC_DAY	0	2	2012-07-17	914	\N	1516
6862	GENERIC_DAY	0	2	2011-12-06	916	\N	1516
6863	GENERIC_DAY	0	2	2011-06-01	910	\N	1516
6864	GENERIC_DAY	0	2	2012-03-21	910	\N	1516
6865	GENERIC_DAY	0	2	2011-04-10	910	\N	1516
6866	GENERIC_DAY	0	2	2009-12-16	914	\N	1516
6867	GENERIC_DAY	0	2	2010-07-09	916	\N	1516
6868	GENERIC_DAY	0	2	2010-03-08	914	\N	1516
6869	GENERIC_DAY	0	2	2011-09-06	914	\N	1516
6870	GENERIC_DAY	0	2	2011-08-01	916	\N	1516
6871	GENERIC_DAY	0	2	2012-12-15	916	\N	1516
6872	GENERIC_DAY	0	2	2010-09-02	914	\N	1516
6873	GENERIC_DAY	0	2	2012-03-23	910	\N	1516
6874	GENERIC_DAY	0	2	2013-01-15	914	\N	1516
6875	GENERIC_DAY	0	2	2013-05-08	914	\N	1516
6876	GENERIC_DAY	0	2	2013-04-28	916	\N	1516
6877	GENERIC_DAY	0	2	2011-10-21	912	\N	1516
6878	GENERIC_DAY	0	2	2011-11-11	910	\N	1516
6879	GENERIC_DAY	0	2	2013-04-13	910	\N	1516
6880	GENERIC_DAY	0	2	2011-05-23	912	\N	1516
6881	GENERIC_DAY	0	2	2012-01-19	912	\N	1516
6882	GENERIC_DAY	0	2	2011-05-07	914	\N	1516
6883	GENERIC_DAY	0	2	2010-12-28	916	\N	1516
6884	GENERIC_DAY	0	2	2012-12-01	912	\N	1516
6885	GENERIC_DAY	0	2	2010-02-28	914	\N	1516
6886	GENERIC_DAY	0	2	2010-12-03	914	\N	1516
6887	GENERIC_DAY	0	2	2012-06-01	912	\N	1516
6888	GENERIC_DAY	0	2	2012-09-23	912	\N	1516
6889	GENERIC_DAY	0	2	2010-04-26	910	\N	1516
6890	GENERIC_DAY	0	2	2010-03-11	912	\N	1516
6891	GENERIC_DAY	0	2	2013-02-06	910	\N	1516
6892	GENERIC_DAY	0	2	2012-10-19	914	\N	1516
6893	GENERIC_DAY	0	2	2012-04-28	912	\N	1516
6894	GENERIC_DAY	0	2	2013-04-15	910	\N	1516
6895	GENERIC_DAY	0	2	2010-10-29	912	\N	1516
6896	GENERIC_DAY	0	2	2010-08-24	912	\N	1516
6897	GENERIC_DAY	0	2	2011-08-01	910	\N	1516
6898	GENERIC_DAY	0	2	2013-05-11	912	\N	1516
6899	GENERIC_DAY	0	2	2013-01-28	910	\N	1516
6900	GENERIC_DAY	0	2	2010-08-20	914	\N	1516
6901	GENERIC_DAY	0	2	2012-08-23	910	\N	1516
6902	GENERIC_DAY	0	2	2012-07-12	912	\N	1516
6903	GENERIC_DAY	0	2	2011-09-25	914	\N	1516
6904	GENERIC_DAY	0	2	2013-02-17	910	\N	1516
6905	GENERIC_DAY	0	2	2012-06-06	916	\N	1516
6906	GENERIC_DAY	0	2	2011-01-10	914	\N	1516
6907	GENERIC_DAY	0	2	2012-05-06	914	\N	1516
6908	GENERIC_DAY	0	2	2011-03-04	912	\N	1516
6909	GENERIC_DAY	0	2	2012-06-12	910	\N	1516
6910	GENERIC_DAY	0	2	2011-12-16	914	\N	1516
6911	GENERIC_DAY	0	2	2013-03-11	910	\N	1516
6912	GENERIC_DAY	0	2	2012-10-25	914	\N	1516
6913	GENERIC_DAY	0	2	2012-08-13	916	\N	1516
6914	GENERIC_DAY	0	2	2011-08-29	912	\N	1516
6915	GENERIC_DAY	0	2	2013-04-15	916	\N	1516
6916	GENERIC_DAY	0	2	2012-07-16	914	\N	1516
6917	GENERIC_DAY	0	2	2011-05-15	910	\N	1516
6918	GENERIC_DAY	0	2	2011-09-11	914	\N	1516
6919	GENERIC_DAY	0	2	2012-12-04	910	\N	1516
6920	GENERIC_DAY	0	2	2012-11-14	916	\N	1516
6921	GENERIC_DAY	0	2	2012-01-01	912	\N	1516
6922	GENERIC_DAY	0	2	2013-04-06	914	\N	1516
6923	GENERIC_DAY	0	2	2011-04-20	914	\N	1516
6924	GENERIC_DAY	0	2	2013-03-13	916	\N	1516
6925	GENERIC_DAY	0	2	2012-03-04	912	\N	1516
6926	GENERIC_DAY	0	2	2010-09-15	912	\N	1516
6927	GENERIC_DAY	0	2	2010-07-05	916	\N	1516
6928	GENERIC_DAY	0	2	2011-11-17	916	\N	1516
6929	GENERIC_DAY	0	2	2011-01-18	910	\N	1516
6930	GENERIC_DAY	0	2	2012-10-03	912	\N	1516
6931	GENERIC_DAY	0	2	2012-12-07	914	\N	1516
6932	GENERIC_DAY	0	2	2013-01-17	916	\N	1516
6933	GENERIC_DAY	0	2	2012-09-14	910	\N	1516
6934	GENERIC_DAY	0	2	2012-05-28	910	\N	1516
6935	GENERIC_DAY	0	2	2010-09-04	910	\N	1516
6936	GENERIC_DAY	0	2	2010-06-17	916	\N	1516
6937	GENERIC_DAY	0	2	2012-06-16	910	\N	1516
6938	GENERIC_DAY	0	2	2011-09-17	914	\N	1516
6939	GENERIC_DAY	0	2	2011-10-01	914	\N	1516
6940	GENERIC_DAY	0	2	2012-03-28	916	\N	1516
6941	GENERIC_DAY	0	2	2012-10-13	910	\N	1516
6942	GENERIC_DAY	0	2	2012-06-12	914	\N	1516
6943	GENERIC_DAY	0	2	2010-08-15	912	\N	1516
6944	GENERIC_DAY	0	2	2011-12-21	910	\N	1516
6945	GENERIC_DAY	0	2	2013-01-23	912	\N	1516
6946	GENERIC_DAY	0	2	2011-08-03	914	\N	1516
6947	GENERIC_DAY	0	2	2012-07-08	914	\N	1516
6948	GENERIC_DAY	0	2	2010-05-05	916	\N	1516
6949	GENERIC_DAY	0	2	2012-09-18	910	\N	1516
6950	GENERIC_DAY	0	2	2012-01-27	914	\N	1516
6951	GENERIC_DAY	0	2	2012-04-26	910	\N	1516
6952	GENERIC_DAY	0	2	2013-02-01	912	\N	1516
6953	GENERIC_DAY	0	2	2013-04-04	914	\N	1516
6954	GENERIC_DAY	0	2	2011-04-05	914	\N	1516
6955	GENERIC_DAY	0	2	2013-03-22	910	\N	1516
6956	GENERIC_DAY	0	2	2012-12-11	910	\N	1516
6957	GENERIC_DAY	0	2	2010-05-18	910	\N	1516
6958	GENERIC_DAY	0	2	2011-01-03	910	\N	1516
6959	GENERIC_DAY	0	2	2011-11-26	914	\N	1516
6960	GENERIC_DAY	0	2	2012-09-06	914	\N	1516
6961	GENERIC_DAY	0	2	2010-10-31	916	\N	1516
6962	GENERIC_DAY	0	2	2010-03-19	916	\N	1516
6963	GENERIC_DAY	0	2	2010-11-11	910	\N	1516
6964	GENERIC_DAY	0	2	2010-09-05	914	\N	1516
6965	GENERIC_DAY	0	2	2010-08-19	910	\N	1516
6966	GENERIC_DAY	0	2	2012-08-21	910	\N	1516
6967	GENERIC_DAY	0	2	2010-07-04	912	\N	1516
6968	GENERIC_DAY	0	2	2012-05-08	910	\N	1516
6969	GENERIC_DAY	0	2	2011-03-25	912	\N	1516
6970	GENERIC_DAY	0	2	2011-10-11	910	\N	1516
6971	GENERIC_DAY	0	2	2010-06-18	914	\N	1516
6972	GENERIC_DAY	0	2	2011-04-09	916	\N	1516
6973	GENERIC_DAY	0	2	2011-05-14	910	\N	1516
6974	GENERIC_DAY	0	2	2012-10-17	912	\N	1516
6975	GENERIC_DAY	0	2	2012-04-21	910	\N	1516
6976	GENERIC_DAY	0	2	2011-01-30	914	\N	1516
6977	GENERIC_DAY	0	2	2011-03-07	914	\N	1516
6978	GENERIC_DAY	0	2	2012-03-18	914	\N	1516
6979	GENERIC_DAY	0	2	2011-02-10	910	\N	1516
6980	GENERIC_DAY	0	2	2012-11-29	916	\N	1516
6981	GENERIC_DAY	0	2	2012-01-29	916	\N	1516
6982	GENERIC_DAY	0	2	2011-08-03	916	\N	1516
6983	GENERIC_DAY	0	2	2009-12-24	910	\N	1516
6984	GENERIC_DAY	0	2	2011-01-02	916	\N	1516
6985	GENERIC_DAY	0	2	2012-07-06	916	\N	1516
6986	GENERIC_DAY	0	2	2012-01-16	914	\N	1516
6987	GENERIC_DAY	0	2	2012-02-09	916	\N	1516
6988	GENERIC_DAY	0	2	2012-03-11	914	\N	1516
6989	GENERIC_DAY	0	2	2010-04-22	912	\N	1516
6990	GENERIC_DAY	0	2	2011-01-23	914	\N	1516
6991	GENERIC_DAY	0	2	2011-06-12	910	\N	1516
6992	GENERIC_DAY	0	2	2010-03-19	910	\N	1516
6993	GENERIC_DAY	0	2	2012-12-09	914	\N	1516
6994	GENERIC_DAY	0	2	2012-08-06	916	\N	1516
6995	GENERIC_DAY	0	2	2011-01-06	916	\N	1516
6996	GENERIC_DAY	0	2	2013-02-13	916	\N	1516
6997	GENERIC_DAY	0	2	2009-12-15	912	\N	1516
6998	GENERIC_DAY	0	2	2010-01-20	910	\N	1516
6999	GENERIC_DAY	0	2	2010-02-15	912	\N	1516
7000	GENERIC_DAY	0	2	2012-02-28	910	\N	1516
7001	GENERIC_DAY	0	2	2011-06-05	916	\N	1516
7002	GENERIC_DAY	0	2	2011-06-08	910	\N	1516
7003	GENERIC_DAY	0	2	2012-12-27	912	\N	1516
7004	GENERIC_DAY	0	2	2011-07-26	914	\N	1516
7005	GENERIC_DAY	0	2	2011-01-18	912	\N	1516
7006	GENERIC_DAY	0	2	2011-12-26	914	\N	1516
7007	GENERIC_DAY	0	2	2011-03-06	916	\N	1516
7008	GENERIC_DAY	0	2	2013-01-29	914	\N	1516
7009	GENERIC_DAY	0	2	2010-03-10	912	\N	1516
7010	GENERIC_DAY	0	2	2013-02-22	916	\N	1516
7011	GENERIC_DAY	0	2	2012-02-03	912	\N	1516
7012	GENERIC_DAY	0	2	2012-03-29	910	\N	1516
7013	GENERIC_DAY	0	2	2010-07-04	910	\N	1516
7014	GENERIC_DAY	0	2	2013-01-30	910	\N	1516
7015	GENERIC_DAY	0	2	2011-07-12	914	\N	1516
7016	GENERIC_DAY	0	2	2010-01-24	914	\N	1516
7017	GENERIC_DAY	0	2	2010-03-20	914	\N	1516
7018	GENERIC_DAY	0	2	2013-01-21	914	\N	1516
7019	GENERIC_DAY	0	2	2010-09-17	910	\N	1516
7020	GENERIC_DAY	0	2	2013-03-29	916	\N	1516
7021	GENERIC_DAY	0	2	2013-05-04	914	\N	1516
7022	GENERIC_DAY	0	2	2010-02-23	916	\N	1516
7023	GENERIC_DAY	0	2	2011-10-06	914	\N	1516
7024	GENERIC_DAY	0	2	2012-02-08	914	\N	1516
7025	GENERIC_DAY	0	2	2011-06-22	910	\N	1516
7026	GENERIC_DAY	0	2	2009-12-13	916	\N	1516
7027	GENERIC_DAY	0	2	2011-11-24	912	\N	1516
7028	GENERIC_DAY	0	2	2010-01-05	916	\N	1516
7029	GENERIC_DAY	0	2	2012-05-20	910	\N	1516
7030	GENERIC_DAY	0	2	2011-07-07	912	\N	1516
7031	GENERIC_DAY	0	2	2011-09-22	916	\N	1516
7032	GENERIC_DAY	0	2	2010-08-11	916	\N	1516
7033	GENERIC_DAY	0	2	2012-04-10	910	\N	1516
7034	GENERIC_DAY	0	2	2011-07-19	916	\N	1516
7035	GENERIC_DAY	0	2	2010-10-14	916	\N	1516
7036	GENERIC_DAY	0	2	2012-01-27	916	\N	1516
7037	GENERIC_DAY	0	2	2012-01-13	912	\N	1516
7038	GENERIC_DAY	0	2	2010-09-06	916	\N	1516
7039	GENERIC_DAY	0	2	2010-01-12	912	\N	1516
7040	GENERIC_DAY	0	2	2012-06-08	912	\N	1516
7041	GENERIC_DAY	0	2	2012-05-01	910	\N	1516
7042	GENERIC_DAY	0	2	2011-06-20	910	\N	1516
7043	GENERIC_DAY	0	2	2013-01-09	914	\N	1516
7044	GENERIC_DAY	0	2	2011-01-14	910	\N	1516
7045	GENERIC_DAY	0	2	2012-11-28	910	\N	1516
7046	GENERIC_DAY	0	2	2011-04-24	914	\N	1516
7047	GENERIC_DAY	0	2	2012-07-15	916	\N	1516
7048	GENERIC_DAY	0	2	2010-01-01	910	\N	1516
7049	GENERIC_DAY	0	2	2012-02-21	912	\N	1516
7050	GENERIC_DAY	0	2	2012-08-02	912	\N	1516
7051	GENERIC_DAY	0	2	2010-06-20	916	\N	1516
7052	GENERIC_DAY	0	2	2013-04-25	914	\N	1516
7053	GENERIC_DAY	0	2	2012-03-06	910	\N	1516
7054	GENERIC_DAY	0	2	2012-04-09	916	\N	1516
7055	GENERIC_DAY	0	2	2011-02-10	916	\N	1516
7056	GENERIC_DAY	0	2	2010-05-29	916	\N	1516
7057	GENERIC_DAY	0	2	2012-03-28	912	\N	1516
7058	GENERIC_DAY	0	2	2010-02-26	910	\N	1516
7059	GENERIC_DAY	0	2	2012-09-26	912	\N	1516
7060	GENERIC_DAY	0	2	2011-07-06	914	\N	1516
7061	GENERIC_DAY	0	2	2010-05-30	916	\N	1516
7062	GENERIC_DAY	0	2	2011-03-30	914	\N	1516
7063	GENERIC_DAY	0	2	2011-12-06	914	\N	1516
7064	GENERIC_DAY	0	2	2012-11-18	916	\N	1516
7065	GENERIC_DAY	0	2	2011-02-20	912	\N	1516
7066	GENERIC_DAY	0	2	2010-03-14	916	\N	1516
7067	GENERIC_DAY	0	2	2010-03-13	910	\N	1516
7068	GENERIC_DAY	0	2	2009-12-31	912	\N	1516
7069	GENERIC_DAY	0	2	2010-11-02	914	\N	1516
7070	GENERIC_DAY	0	2	2012-04-14	916	\N	1516
7071	GENERIC_DAY	0	2	2013-01-18	910	\N	1516
7072	GENERIC_DAY	0	2	2010-01-07	916	\N	1516
7073	GENERIC_DAY	0	2	2012-10-18	912	\N	1516
7074	GENERIC_DAY	0	2	2012-04-06	912	\N	1516
7075	GENERIC_DAY	0	2	2010-03-31	914	\N	1516
7076	GENERIC_DAY	0	2	2013-04-20	916	\N	1516
7077	GENERIC_DAY	0	2	2010-06-25	916	\N	1516
7078	GENERIC_DAY	0	2	2011-09-16	916	\N	1516
7079	GENERIC_DAY	0	2	2010-01-09	912	\N	1516
7080	GENERIC_DAY	0	2	2010-04-04	910	\N	1516
7081	GENERIC_DAY	0	2	2012-08-01	916	\N	1516
7082	GENERIC_DAY	0	2	2011-06-09	916	\N	1516
7083	GENERIC_DAY	0	2	2010-01-27	914	\N	1516
7084	GENERIC_DAY	0	2	2011-03-24	912	\N	1516
7085	GENERIC_DAY	0	2	2011-11-20	910	\N	1516
7086	GENERIC_DAY	0	2	2011-05-19	914	\N	1516
7087	GENERIC_DAY	0	2	2012-06-09	914	\N	1516
7088	GENERIC_DAY	0	2	2010-01-11	916	\N	1516
7089	GENERIC_DAY	0	2	2011-02-23	912	\N	1516
7090	GENERIC_DAY	0	2	2011-04-02	910	\N	1516
7091	GENERIC_DAY	0	2	2011-05-28	912	\N	1516
7092	GENERIC_DAY	0	2	2012-01-26	910	\N	1516
7093	GENERIC_DAY	0	2	2010-01-21	912	\N	1516
7094	GENERIC_DAY	0	2	2011-12-04	910	\N	1516
7095	GENERIC_DAY	0	2	2012-02-15	912	\N	1516
7096	GENERIC_DAY	0	2	2012-12-08	912	\N	1516
7097	GENERIC_DAY	0	2	2010-02-14	910	\N	1516
7098	GENERIC_DAY	0	2	2011-12-28	916	\N	1516
7099	GENERIC_DAY	0	2	2011-05-04	914	\N	1516
7100	GENERIC_DAY	0	2	2010-10-11	916	\N	1516
7101	GENERIC_DAY	0	2	2011-03-19	916	\N	1516
7102	GENERIC_DAY	0	2	2011-11-03	916	\N	1516
7103	GENERIC_DAY	0	2	2012-03-05	914	\N	1516
7104	GENERIC_DAY	0	2	2011-01-21	916	\N	1516
7105	GENERIC_DAY	0	2	2012-10-23	916	\N	1516
7106	GENERIC_DAY	0	2	2010-06-24	910	\N	1516
7107	GENERIC_DAY	0	2	2011-03-24	916	\N	1516
7108	GENERIC_DAY	0	2	2010-10-20	914	\N	1516
7109	GENERIC_DAY	0	2	2011-12-03	912	\N	1516
7110	GENERIC_DAY	0	2	2011-12-06	910	\N	1516
7111	GENERIC_DAY	0	2	2011-04-05	910	\N	1516
7112	GENERIC_DAY	0	2	2011-10-29	916	\N	1516
7113	GENERIC_DAY	0	2	2010-08-19	914	\N	1516
7114	GENERIC_DAY	0	2	2010-10-22	914	\N	1516
7115	GENERIC_DAY	0	2	2012-11-03	910	\N	1516
7116	GENERIC_DAY	0	2	2012-06-13	912	\N	1516
7117	GENERIC_DAY	0	2	2010-11-28	916	\N	1516
7118	GENERIC_DAY	0	2	2013-03-19	912	\N	1516
7119	GENERIC_DAY	0	2	2011-10-31	914	\N	1516
7120	GENERIC_DAY	0	2	2012-01-22	912	\N	1516
7121	GENERIC_DAY	0	2	2011-12-07	910	\N	1516
7122	GENERIC_DAY	0	2	2010-05-20	910	\N	1516
7123	GENERIC_DAY	0	2	2012-06-25	910	\N	1516
7124	GENERIC_DAY	0	2	2010-04-07	910	\N	1516
7125	GENERIC_DAY	0	2	2010-02-19	912	\N	1516
7126	GENERIC_DAY	0	2	2011-12-20	912	\N	1516
7127	GENERIC_DAY	0	2	2013-01-30	916	\N	1516
7128	GENERIC_DAY	0	2	2012-07-01	916	\N	1516
7129	GENERIC_DAY	0	2	2011-01-15	914	\N	1516
7130	GENERIC_DAY	0	2	2009-12-17	912	\N	1516
7131	GENERIC_DAY	0	2	2010-11-13	914	\N	1516
7132	GENERIC_DAY	0	2	2011-03-18	910	\N	1516
7133	GENERIC_DAY	0	2	2012-05-03	916	\N	1516
7134	GENERIC_DAY	0	2	2011-04-11	910	\N	1516
7135	GENERIC_DAY	0	2	2010-03-13	914	\N	1516
7136	GENERIC_DAY	0	2	2011-04-27	914	\N	1516
7137	GENERIC_DAY	0	2	2012-08-13	910	\N	1516
7138	GENERIC_DAY	0	2	2011-08-21	910	\N	1516
7139	GENERIC_DAY	0	2	2012-06-13	916	\N	1516
7140	GENERIC_DAY	0	2	2010-04-18	910	\N	1516
7141	GENERIC_DAY	0	2	2012-01-03	910	\N	1516
7142	GENERIC_DAY	0	2	2011-01-11	910	\N	1516
7143	GENERIC_DAY	0	2	2010-07-03	914	\N	1516
7144	GENERIC_DAY	0	2	2010-08-28	910	\N	1516
7145	GENERIC_DAY	0	2	2010-05-23	916	\N	1516
7146	GENERIC_DAY	0	2	2011-05-13	914	\N	1516
7147	GENERIC_DAY	0	2	2011-09-26	916	\N	1516
7148	GENERIC_DAY	0	2	2011-08-14	912	\N	1516
7149	GENERIC_DAY	0	2	2011-09-05	916	\N	1516
7150	GENERIC_DAY	0	2	2010-05-03	912	\N	1516
7151	GENERIC_DAY	0	2	2010-01-14	916	\N	1516
7152	GENERIC_DAY	0	2	2012-10-03	910	\N	1516
7153	GENERIC_DAY	0	2	2010-06-01	912	\N	1516
7154	GENERIC_DAY	0	2	2012-04-18	910	\N	1516
7155	GENERIC_DAY	0	2	2010-01-21	916	\N	1516
7156	GENERIC_DAY	0	2	2012-07-27	914	\N	1516
7157	GENERIC_DAY	0	2	2010-08-15	916	\N	1516
7158	GENERIC_DAY	0	2	2009-12-14	910	\N	1516
7159	GENERIC_DAY	0	2	2011-04-15	912	\N	1516
7160	GENERIC_DAY	0	2	2013-04-21	912	\N	1516
7161	GENERIC_DAY	0	2	2011-02-12	910	\N	1516
7162	GENERIC_DAY	0	2	2013-02-24	910	\N	1516
7163	GENERIC_DAY	0	2	2010-09-04	916	\N	1516
7164	GENERIC_DAY	0	2	2011-10-07	916	\N	1516
7165	GENERIC_DAY	0	2	2012-03-23	912	\N	1516
7166	GENERIC_DAY	0	2	2010-09-30	916	\N	1516
7167	GENERIC_DAY	0	2	2011-08-12	912	\N	1516
7168	GENERIC_DAY	0	2	2010-07-20	914	\N	1516
7169	GENERIC_DAY	0	2	2011-02-24	912	\N	1516
7170	GENERIC_DAY	0	2	2010-02-09	916	\N	1516
7171	GENERIC_DAY	0	2	2013-01-14	910	\N	1516
7172	GENERIC_DAY	0	2	2012-11-02	912	\N	1516
7173	GENERIC_DAY	0	2	2010-10-31	910	\N	1516
7174	GENERIC_DAY	0	2	2012-02-27	910	\N	1516
7175	GENERIC_DAY	0	2	2011-09-28	912	\N	1516
7176	GENERIC_DAY	0	2	2011-07-13	910	\N	1516
7177	GENERIC_DAY	0	2	2012-03-02	912	\N	1516
7178	GENERIC_DAY	0	2	2011-05-04	912	\N	1516
7179	GENERIC_DAY	0	2	2012-01-15	910	\N	1516
7180	GENERIC_DAY	0	2	2013-01-23	916	\N	1516
7181	GENERIC_DAY	0	2	2012-10-02	912	\N	1516
7182	GENERIC_DAY	0	2	2013-05-05	914	\N	1516
7183	GENERIC_DAY	0	2	2011-08-10	912	\N	1516
7184	GENERIC_DAY	0	2	2012-04-19	912	\N	1516
7185	GENERIC_DAY	0	2	2010-10-01	914	\N	1516
7186	GENERIC_DAY	0	2	2012-11-02	914	\N	1516
7187	GENERIC_DAY	0	2	2010-01-11	912	\N	1516
7188	GENERIC_DAY	0	2	2012-02-16	916	\N	1516
7189	GENERIC_DAY	0	2	2011-01-04	914	\N	1516
7190	GENERIC_DAY	0	2	2012-08-11	912	\N	1516
7191	GENERIC_DAY	0	2	2010-12-21	916	\N	1516
7192	GENERIC_DAY	0	2	2012-10-24	914	\N	1516
7193	GENERIC_DAY	0	2	2010-12-11	912	\N	1516
7194	GENERIC_DAY	0	2	2010-02-17	910	\N	1516
7195	GENERIC_DAY	0	2	2012-01-10	916	\N	1516
7196	GENERIC_DAY	0	2	2011-08-29	916	\N	1516
7197	GENERIC_DAY	0	2	2013-01-24	912	\N	1516
7198	GENERIC_DAY	0	2	2012-06-04	916	\N	1516
7199	GENERIC_DAY	0	2	2012-01-20	912	\N	1516
7200	GENERIC_DAY	0	2	2012-11-09	916	\N	1516
7201	GENERIC_DAY	0	2	2011-04-10	914	\N	1516
7202	GENERIC_DAY	0	2	2011-03-20	912	\N	1516
7203	GENERIC_DAY	0	2	2010-10-19	916	\N	1516
7204	GENERIC_DAY	0	2	2011-10-25	916	\N	1516
7205	GENERIC_DAY	0	2	2010-05-03	916	\N	1516
7206	GENERIC_DAY	0	2	2013-04-02	914	\N	1516
7207	GENERIC_DAY	0	2	2013-04-05	910	\N	1516
7208	GENERIC_DAY	0	2	2011-03-24	914	\N	1516
7209	GENERIC_DAY	0	2	2010-09-24	914	\N	1516
7210	GENERIC_DAY	0	2	2010-04-29	910	\N	1516
7211	GENERIC_DAY	0	2	2011-05-20	910	\N	1516
7212	GENERIC_DAY	0	2	2011-01-21	914	\N	1516
7213	GENERIC_DAY	0	2	2011-07-28	916	\N	1516
7214	GENERIC_DAY	0	2	2012-12-14	916	\N	1516
7215	GENERIC_DAY	0	2	2012-09-20	910	\N	1516
7216	GENERIC_DAY	0	2	2010-11-29	912	\N	1516
7217	GENERIC_DAY	0	2	2011-03-13	916	\N	1516
7218	GENERIC_DAY	0	2	2011-12-07	912	\N	1516
7219	GENERIC_DAY	0	2	2011-01-29	912	\N	1516
7220	GENERIC_DAY	0	2	2010-01-24	910	\N	1516
7221	GENERIC_DAY	0	2	2010-11-16	910	\N	1516
7222	GENERIC_DAY	0	2	2010-04-10	914	\N	1516
7223	GENERIC_DAY	0	2	2013-04-13	914	\N	1516
7224	GENERIC_DAY	0	2	2011-03-12	910	\N	1516
7225	GENERIC_DAY	0	2	2011-07-27	916	\N	1516
7226	GENERIC_DAY	0	2	2013-04-22	914	\N	1516
7227	GENERIC_DAY	0	2	2013-02-20	910	\N	1516
7228	GENERIC_DAY	0	2	2012-12-15	910	\N	1516
7229	GENERIC_DAY	0	2	2012-06-14	912	\N	1516
7230	GENERIC_DAY	0	2	2011-04-08	912	\N	1516
7231	GENERIC_DAY	0	2	2012-05-02	910	\N	1516
7232	GENERIC_DAY	0	2	2013-03-22	912	\N	1516
7233	GENERIC_DAY	0	2	2011-04-02	912	\N	1516
7234	GENERIC_DAY	0	2	2009-12-28	914	\N	1516
7235	GENERIC_DAY	0	2	2010-03-19	912	\N	1516
7236	GENERIC_DAY	0	2	2012-09-04	916	\N	1516
7237	GENERIC_DAY	0	2	2013-01-12	912	\N	1516
7238	GENERIC_DAY	0	2	2012-01-18	914	\N	1516
7239	GENERIC_DAY	0	2	2010-01-31	916	\N	1516
7240	GENERIC_DAY	0	2	2010-05-13	916	\N	1516
7241	GENERIC_DAY	0	2	2011-07-05	912	\N	1516
7242	GENERIC_DAY	0	2	2011-09-09	912	\N	1516
7243	GENERIC_DAY	0	2	2013-03-26	912	\N	1516
7244	GENERIC_DAY	0	2	2012-06-28	914	\N	1516
7245	GENERIC_DAY	0	2	2010-04-15	910	\N	1516
7246	GENERIC_DAY	0	2	2013-02-06	914	\N	1516
7247	GENERIC_DAY	0	2	2013-04-18	916	\N	1516
7248	GENERIC_DAY	0	2	2013-01-25	916	\N	1516
7249	GENERIC_DAY	0	2	2010-12-20	912	\N	1516
7250	GENERIC_DAY	0	2	2010-10-30	910	\N	1516
7251	GENERIC_DAY	0	2	2013-03-31	910	\N	1516
7252	GENERIC_DAY	0	2	2013-04-30	910	\N	1516
7253	GENERIC_DAY	0	2	2013-02-05	910	\N	1516
7254	GENERIC_DAY	0	2	2013-03-17	916	\N	1516
7255	GENERIC_DAY	0	2	2012-07-10	912	\N	1516
7256	GENERIC_DAY	0	2	2010-11-12	914	\N	1516
7257	GENERIC_DAY	0	2	2011-01-26	912	\N	1516
7258	GENERIC_DAY	0	2	2011-05-14	912	\N	1516
7259	GENERIC_DAY	0	2	2009-12-23	910	\N	1516
7260	GENERIC_DAY	0	2	2012-12-24	916	\N	1516
7261	GENERIC_DAY	0	2	2012-05-01	912	\N	1516
7262	GENERIC_DAY	0	2	2010-04-04	912	\N	1516
7263	GENERIC_DAY	0	2	2013-02-08	916	\N	1516
7264	GENERIC_DAY	0	2	2012-05-20	916	\N	1516
7265	GENERIC_DAY	0	2	2010-04-09	916	\N	1516
7266	GENERIC_DAY	0	2	2013-03-08	912	\N	1516
7267	GENERIC_DAY	0	2	2012-10-21	916	\N	1516
7268	GENERIC_DAY	0	2	2012-06-14	910	\N	1516
7269	GENERIC_DAY	0	2	2012-12-08	916	\N	1516
7270	GENERIC_DAY	0	2	2012-05-04	916	\N	1516
7271	GENERIC_DAY	0	2	2013-03-09	910	\N	1516
7272	GENERIC_DAY	0	2	2010-11-07	910	\N	1516
7273	GENERIC_DAY	0	2	2012-03-29	912	\N	1516
7274	GENERIC_DAY	0	2	2011-03-18	916	\N	1516
7275	GENERIC_DAY	0	2	2013-01-16	912	\N	1516
7276	GENERIC_DAY	0	2	2012-02-23	910	\N	1516
7277	GENERIC_DAY	0	2	2012-10-27	916	\N	1516
7278	GENERIC_DAY	0	2	2013-04-30	912	\N	1516
7279	GENERIC_DAY	0	2	2011-02-23	916	\N	1516
7280	GENERIC_DAY	0	2	2011-12-22	910	\N	1516
7281	GENERIC_DAY	0	2	2012-05-07	914	\N	1516
7282	GENERIC_DAY	0	2	2010-09-16	916	\N	1516
7283	GENERIC_DAY	0	2	2011-03-27	916	\N	1516
7284	GENERIC_DAY	0	2	2010-01-14	910	\N	1516
7285	GENERIC_DAY	0	2	2012-03-15	914	\N	1516
7286	GENERIC_DAY	0	2	2012-05-27	916	\N	1516
7287	GENERIC_DAY	0	2	2010-09-09	910	\N	1516
7288	GENERIC_DAY	0	2	2011-03-15	910	\N	1516
7289	GENERIC_DAY	0	2	2010-06-10	910	\N	1516
7290	GENERIC_DAY	0	2	2010-08-08	912	\N	1516
7291	GENERIC_DAY	0	2	2011-01-20	912	\N	1516
7292	GENERIC_DAY	0	2	2010-04-08	910	\N	1516
7293	GENERIC_DAY	0	2	2013-03-24	914	\N	1516
7294	GENERIC_DAY	0	2	2011-06-17	910	\N	1516
7295	GENERIC_DAY	0	2	2013-02-13	910	\N	1516
7296	GENERIC_DAY	0	2	2010-08-26	910	\N	1516
7297	GENERIC_DAY	0	2	2009-12-30	912	\N	1516
7298	GENERIC_DAY	0	2	2010-01-02	916	\N	1516
7299	GENERIC_DAY	0	2	2012-03-16	916	\N	1516
7300	GENERIC_DAY	0	2	2011-12-03	914	\N	1516
7301	GENERIC_DAY	0	2	2010-08-02	916	\N	1516
7302	GENERIC_DAY	0	2	2011-10-20	914	\N	1516
7303	GENERIC_DAY	0	2	2012-01-26	916	\N	1516
7304	GENERIC_DAY	0	2	2010-09-26	912	\N	1516
7305	GENERIC_DAY	0	2	2010-08-25	916	\N	1516
7306	GENERIC_DAY	0	2	2012-09-06	912	\N	1516
7307	GENERIC_DAY	0	2	2012-03-20	916	\N	1516
7308	GENERIC_DAY	0	2	2011-07-20	914	\N	1516
7309	GENERIC_DAY	0	2	2012-10-28	916	\N	1516
7310	GENERIC_DAY	0	2	2011-03-05	912	\N	1516
7311	GENERIC_DAY	0	2	2012-11-12	916	\N	1516
7312	GENERIC_DAY	0	2	2010-01-11	910	\N	1516
7313	GENERIC_DAY	0	2	2012-01-30	912	\N	1516
7314	GENERIC_DAY	0	2	2011-07-23	910	\N	1516
7315	GENERIC_DAY	0	2	2012-02-25	914	\N	1516
7316	GENERIC_DAY	0	2	2010-08-01	910	\N	1516
7317	GENERIC_DAY	0	2	2011-03-26	912	\N	1516
7318	GENERIC_DAY	0	2	2011-05-13	916	\N	1516
7319	GENERIC_DAY	0	2	2010-02-16	916	\N	1516
7320	GENERIC_DAY	0	2	2010-01-04	910	\N	1516
7321	GENERIC_DAY	0	2	2013-03-18	912	\N	1516
7322	GENERIC_DAY	0	2	2012-06-12	916	\N	1516
7323	GENERIC_DAY	0	2	2012-07-27	912	\N	1516
7324	GENERIC_DAY	0	2	2010-05-15	914	\N	1516
7325	GENERIC_DAY	0	2	2011-05-24	910	\N	1516
7326	GENERIC_DAY	0	2	2013-01-23	910	\N	1516
7327	GENERIC_DAY	0	2	2012-11-20	914	\N	1516
7328	GENERIC_DAY	0	2	2012-09-27	914	\N	1516
7329	GENERIC_DAY	0	2	2013-03-21	914	\N	1516
7330	GENERIC_DAY	0	2	2010-12-04	916	\N	1516
7331	GENERIC_DAY	0	2	2010-03-15	910	\N	1516
7332	GENERIC_DAY	0	2	2009-12-09	916	\N	1516
7333	GENERIC_DAY	0	2	2012-08-28	916	\N	1516
7334	GENERIC_DAY	0	2	2011-02-07	914	\N	1516
7335	GENERIC_DAY	0	2	2011-12-01	916	\N	1516
7336	GENERIC_DAY	0	2	2011-01-03	916	\N	1516
7337	GENERIC_DAY	0	2	2011-03-06	912	\N	1516
7338	GENERIC_DAY	0	2	2010-11-19	914	\N	1516
7339	GENERIC_DAY	0	2	2012-12-27	914	\N	1516
7340	GENERIC_DAY	0	2	2011-05-25	912	\N	1516
7341	GENERIC_DAY	0	2	2012-07-24	916	\N	1516
7342	GENERIC_DAY	0	2	2010-02-26	916	\N	1516
7343	GENERIC_DAY	0	2	2013-04-08	916	\N	1516
7344	GENERIC_DAY	0	2	2010-05-01	916	\N	1516
7345	GENERIC_DAY	0	2	2012-03-03	910	\N	1516
7346	GENERIC_DAY	0	2	2011-05-22	916	\N	1516
7347	GENERIC_DAY	0	2	2011-11-30	912	\N	1516
7348	GENERIC_DAY	0	2	2013-03-21	916	\N	1516
7349	GENERIC_DAY	0	2	2011-11-15	910	\N	1516
7350	GENERIC_DAY	0	2	2012-01-31	910	\N	1516
7351	GENERIC_DAY	0	2	2012-05-09	916	\N	1516
7352	GENERIC_DAY	0	2	2012-08-27	912	\N	1516
7353	GENERIC_DAY	0	2	2011-01-05	912	\N	1516
7354	GENERIC_DAY	0	2	2012-05-19	912	\N	1516
7355	GENERIC_DAY	0	2	2012-08-15	916	\N	1516
7356	GENERIC_DAY	0	2	2012-01-09	910	\N	1516
7357	GENERIC_DAY	0	2	2013-03-24	916	\N	1516
7358	GENERIC_DAY	0	2	2011-05-18	914	\N	1516
7359	GENERIC_DAY	0	2	2011-06-02	910	\N	1516
7360	GENERIC_DAY	0	2	2011-12-04	916	\N	1516
7361	GENERIC_DAY	0	2	2012-10-22	914	\N	1516
7362	GENERIC_DAY	0	2	2011-12-12	912	\N	1516
7363	GENERIC_DAY	0	2	2012-08-19	912	\N	1516
7364	GENERIC_DAY	0	2	2012-05-20	914	\N	1516
7365	GENERIC_DAY	0	2	2011-08-09	914	\N	1516
7366	GENERIC_DAY	0	2	2010-01-26	910	\N	1516
7367	GENERIC_DAY	0	2	2011-09-30	914	\N	1516
7368	GENERIC_DAY	0	2	2011-10-14	916	\N	1516
7369	GENERIC_DAY	0	2	2013-01-16	914	\N	1516
7370	GENERIC_DAY	0	2	2011-03-13	912	\N	1516
7371	GENERIC_DAY	0	2	2011-06-15	916	\N	1516
7372	GENERIC_DAY	0	2	2012-11-18	912	\N	1516
7373	GENERIC_DAY	0	2	2011-03-28	916	\N	1516
7374	GENERIC_DAY	0	2	2012-08-27	916	\N	1516
7375	GENERIC_DAY	0	2	2012-09-10	916	\N	1516
7376	GENERIC_DAY	0	2	2010-08-13	916	\N	1516
7377	GENERIC_DAY	0	2	2013-05-10	910	\N	1516
7378	GENERIC_DAY	0	2	2013-03-31	914	\N	1516
7379	GENERIC_DAY	0	2	2012-02-24	916	\N	1516
7380	GENERIC_DAY	0	2	2010-03-05	912	\N	1516
7381	GENERIC_DAY	0	2	2011-04-19	912	\N	1516
7382	GENERIC_DAY	0	2	2012-06-24	914	\N	1516
7383	GENERIC_DAY	0	2	2010-01-11	914	\N	1516
7384	GENERIC_DAY	0	2	2012-05-25	916	\N	1516
7385	GENERIC_DAY	0	2	2012-03-08	916	\N	1516
7386	GENERIC_DAY	0	2	2011-08-22	910	\N	1516
7387	GENERIC_DAY	0	2	2012-09-03	912	\N	1516
7388	GENERIC_DAY	0	2	2012-03-04	914	\N	1516
7389	GENERIC_DAY	0	2	2012-04-02	916	\N	1516
7390	GENERIC_DAY	0	2	2011-12-25	916	\N	1516
7391	GENERIC_DAY	0	2	2012-12-10	910	\N	1516
7392	GENERIC_DAY	0	2	2011-01-13	910	\N	1516
7393	GENERIC_DAY	0	2	2013-04-23	912	\N	1516
7394	GENERIC_DAY	0	2	2010-11-23	910	\N	1516
7395	GENERIC_DAY	0	2	2012-04-04	912	\N	1516
7396	GENERIC_DAY	0	2	2012-11-23	916	\N	1516
7397	GENERIC_DAY	0	2	2011-07-26	912	\N	1516
7398	GENERIC_DAY	0	2	2012-09-17	912	\N	1516
7399	GENERIC_DAY	0	2	2010-09-19	910	\N	1516
7400	GENERIC_DAY	0	2	2011-01-08	916	\N	1516
7401	GENERIC_DAY	0	2	2012-05-31	916	\N	1516
7402	GENERIC_DAY	0	2	2013-02-13	914	\N	1516
7403	GENERIC_DAY	0	2	2010-11-17	910	\N	1516
7404	GENERIC_DAY	0	2	2012-07-29	916	\N	1516
7405	GENERIC_DAY	0	2	2010-09-30	914	\N	1516
7406	GENERIC_DAY	0	2	2011-01-02	914	\N	1516
7407	GENERIC_DAY	0	2	2013-02-19	912	\N	1516
7408	GENERIC_DAY	0	2	2012-07-22	914	\N	1516
7409	GENERIC_DAY	0	2	2011-08-23	912	\N	1516
7410	GENERIC_DAY	0	2	2012-07-26	914	\N	1516
7411	GENERIC_DAY	0	2	2011-01-16	914	\N	1516
7412	GENERIC_DAY	0	2	2011-10-22	912	\N	1516
7413	GENERIC_DAY	0	2	2012-06-11	912	\N	1516
7414	GENERIC_DAY	0	2	2011-05-12	914	\N	1516
7415	GENERIC_DAY	0	2	2012-10-06	912	\N	1516
7416	GENERIC_DAY	0	2	2010-06-06	914	\N	1516
7417	GENERIC_DAY	0	2	2011-09-15	912	\N	1516
7418	GENERIC_DAY	0	2	2012-05-25	910	\N	1516
7419	GENERIC_DAY	0	2	2013-04-29	916	\N	1516
7420	GENERIC_DAY	0	2	2010-04-30	914	\N	1516
7421	GENERIC_DAY	0	2	2010-09-14	912	\N	1516
7422	GENERIC_DAY	0	2	2011-02-12	914	\N	1516
7423	GENERIC_DAY	0	2	2012-12-28	914	\N	1516
7424	GENERIC_DAY	0	2	2011-05-07	910	\N	1516
7425	GENERIC_DAY	0	2	2011-07-12	912	\N	1516
7426	GENERIC_DAY	0	2	2012-09-14	914	\N	1516
7427	GENERIC_DAY	0	2	2010-06-22	914	\N	1516
7428	GENERIC_DAY	0	2	2012-11-14	910	\N	1516
7429	GENERIC_DAY	0	2	2012-03-27	916	\N	1516
7430	GENERIC_DAY	0	2	2011-11-28	916	\N	1516
7431	GENERIC_DAY	0	2	2011-04-07	916	\N	1516
7432	GENERIC_DAY	0	2	2012-11-28	912	\N	1516
7433	GENERIC_DAY	0	2	2013-03-23	912	\N	1516
7434	GENERIC_DAY	0	2	2010-09-23	916	\N	1516
7435	GENERIC_DAY	0	2	2011-12-13	916	\N	1516
7436	GENERIC_DAY	0	2	2011-12-14	912	\N	1516
7437	GENERIC_DAY	0	2	2010-11-24	916	\N	1516
7438	GENERIC_DAY	0	2	2012-07-11	912	\N	1516
7439	GENERIC_DAY	0	2	2010-04-04	914	\N	1516
7440	GENERIC_DAY	0	2	2012-01-21	916	\N	1516
7441	GENERIC_DAY	0	2	2009-12-10	916	\N	1516
7442	GENERIC_DAY	0	2	2012-05-05	916	\N	1516
7443	GENERIC_DAY	0	2	2012-05-24	910	\N	1516
7444	GENERIC_DAY	0	2	2011-05-06	912	\N	1516
7445	GENERIC_DAY	0	2	2010-11-05	912	\N	1516
7446	GENERIC_DAY	0	2	2012-11-06	914	\N	1516
7447	GENERIC_DAY	0	2	2010-02-27	910	\N	1516
7448	GENERIC_DAY	0	2	2013-05-04	916	\N	1516
7449	GENERIC_DAY	0	2	2012-08-12	912	\N	1516
7450	GENERIC_DAY	0	2	2011-03-08	912	\N	1516
7451	GENERIC_DAY	0	2	2011-09-20	910	\N	1516
7452	GENERIC_DAY	0	2	2013-03-29	914	\N	1516
7453	GENERIC_DAY	0	2	2012-11-27	916	\N	1516
7454	GENERIC_DAY	0	2	2010-03-08	910	\N	1516
7455	GENERIC_DAY	0	2	2011-01-04	910	\N	1516
7456	GENERIC_DAY	0	2	2010-03-18	912	\N	1516
7457	GENERIC_DAY	0	2	2012-07-19	916	\N	1516
7458	GENERIC_DAY	0	2	2012-05-01	914	\N	1516
7459	GENERIC_DAY	0	2	2011-04-07	914	\N	1516
7460	GENERIC_DAY	0	2	2011-04-10	916	\N	1516
7461	GENERIC_DAY	0	2	2013-04-12	914	\N	1516
7462	GENERIC_DAY	0	2	2013-02-26	912	\N	1516
7463	GENERIC_DAY	0	2	2010-08-02	912	\N	1516
7464	GENERIC_DAY	0	2	2010-03-05	910	\N	1516
7465	GENERIC_DAY	0	2	2012-11-26	910	\N	1516
7466	GENERIC_DAY	0	2	2010-08-20	912	\N	1516
7467	GENERIC_DAY	0	2	2011-01-17	916	\N	1516
7468	GENERIC_DAY	0	2	2010-12-26	912	\N	1516
7469	GENERIC_DAY	0	2	2011-01-04	916	\N	1516
7470	GENERIC_DAY	0	2	2010-02-10	914	\N	1516
7471	GENERIC_DAY	0	2	2010-04-21	914	\N	1516
7472	GENERIC_DAY	0	2	2010-09-20	910	\N	1516
7473	GENERIC_DAY	0	2	2011-05-11	916	\N	1516
7474	GENERIC_DAY	0	2	2012-12-21	916	\N	1516
7475	GENERIC_DAY	0	2	2010-09-13	914	\N	1516
7476	GENERIC_DAY	0	2	2010-08-18	912	\N	1516
7477	GENERIC_DAY	0	2	2011-01-17	912	\N	1516
7478	GENERIC_DAY	0	2	2012-04-12	912	\N	1516
7479	GENERIC_DAY	0	2	2012-09-28	910	\N	1516
7480	GENERIC_DAY	0	2	2010-11-11	912	\N	1516
7481	GENERIC_DAY	0	2	2010-09-02	912	\N	1516
7482	GENERIC_DAY	0	2	2012-07-08	910	\N	1516
7483	GENERIC_DAY	0	2	2012-03-15	916	\N	1516
7484	GENERIC_DAY	0	2	2010-06-23	912	\N	1516
7485	GENERIC_DAY	0	2	2011-05-26	914	\N	1516
7486	GENERIC_DAY	0	2	2011-07-21	916	\N	1516
7487	GENERIC_DAY	0	2	2012-08-15	914	\N	1516
7488	GENERIC_DAY	0	2	2012-12-13	916	\N	1516
7489	GENERIC_DAY	0	2	2012-07-31	916	\N	1516
7490	GENERIC_DAY	0	2	2011-04-05	916	\N	1516
7491	GENERIC_DAY	0	2	2011-09-17	912	\N	1516
7492	GENERIC_DAY	0	2	2012-10-31	910	\N	1516
7493	GENERIC_DAY	0	2	2011-04-23	914	\N	1516
7494	GENERIC_DAY	0	2	2011-06-17	912	\N	1516
7495	GENERIC_DAY	0	2	2011-04-01	910	\N	1516
7496	GENERIC_DAY	0	2	2010-06-24	912	\N	1516
7497	GENERIC_DAY	0	2	2010-01-09	910	\N	1516
7498	GENERIC_DAY	0	2	2010-02-24	916	\N	1516
7499	GENERIC_DAY	0	2	2011-08-07	910	\N	1516
7500	GENERIC_DAY	0	2	2011-11-30	916	\N	1516
7501	GENERIC_DAY	0	2	2009-12-29	914	\N	1516
7502	GENERIC_DAY	0	2	2011-11-19	912	\N	1516
7503	GENERIC_DAY	0	2	2010-09-07	912	\N	1516
7504	GENERIC_DAY	0	2	2010-05-07	914	\N	1516
7505	GENERIC_DAY	0	2	2012-02-03	916	\N	1516
7506	GENERIC_DAY	0	2	2011-10-14	912	\N	1516
7507	GENERIC_DAY	0	2	2010-10-14	914	\N	1516
7508	GENERIC_DAY	0	2	2010-03-30	916	\N	1516
7509	GENERIC_DAY	0	2	2010-07-06	916	\N	1516
7510	GENERIC_DAY	0	2	2011-09-05	914	\N	1516
7511	GENERIC_DAY	0	2	2010-03-28	910	\N	1516
7512	GENERIC_DAY	0	2	2010-08-18	914	\N	1516
7513	GENERIC_DAY	0	2	2010-05-21	914	\N	1516
7514	GENERIC_DAY	0	2	2011-08-23	910	\N	1516
7515	GENERIC_DAY	0	2	2012-04-05	914	\N	1516
7516	GENERIC_DAY	0	2	2011-01-10	916	\N	1516
7517	GENERIC_DAY	0	2	2013-01-12	910	\N	1516
7518	GENERIC_DAY	0	2	2011-05-01	914	\N	1516
7519	GENERIC_DAY	0	2	2012-11-12	910	\N	1516
7520	GENERIC_DAY	0	2	2011-02-03	910	\N	1516
7521	GENERIC_DAY	0	2	2012-03-13	910	\N	1516
7522	GENERIC_DAY	0	2	2012-11-20	916	\N	1516
7523	GENERIC_DAY	0	2	2010-09-21	916	\N	1516
7524	GENERIC_DAY	0	2	2013-04-19	914	\N	1516
7525	GENERIC_DAY	0	2	2010-11-26	912	\N	1516
7526	GENERIC_DAY	0	2	2011-02-08	910	\N	1516
7527	GENERIC_DAY	0	2	2012-09-04	910	\N	1516
7528	GENERIC_DAY	0	2	2010-09-01	910	\N	1516
7529	GENERIC_DAY	0	2	2012-03-04	910	\N	1516
7530	GENERIC_DAY	0	2	2012-12-28	916	\N	1516
7531	GENERIC_DAY	0	2	2012-12-24	912	\N	1516
7532	GENERIC_DAY	0	2	2012-04-25	914	\N	1516
7533	GENERIC_DAY	0	2	2012-03-11	910	\N	1516
7534	GENERIC_DAY	0	2	2010-05-24	912	\N	1516
7535	GENERIC_DAY	0	2	2012-01-14	912	\N	1516
7536	GENERIC_DAY	0	2	2010-07-21	910	\N	1516
7537	GENERIC_DAY	0	2	2012-10-24	910	\N	1516
7538	GENERIC_DAY	0	2	2012-05-16	914	\N	1516
7539	GENERIC_DAY	0	2	2012-03-11	912	\N	1516
7540	GENERIC_DAY	0	2	2010-06-30	914	\N	1516
7541	GENERIC_DAY	0	2	2010-09-05	910	\N	1516
7542	GENERIC_DAY	0	2	2010-06-21	916	\N	1516
7543	GENERIC_DAY	0	2	2012-02-04	912	\N	1516
7544	GENERIC_DAY	0	2	2011-12-18	910	\N	1516
7545	GENERIC_DAY	0	2	2011-07-04	912	\N	1516
7546	GENERIC_DAY	0	2	2010-11-19	910	\N	1516
7547	GENERIC_DAY	0	2	2010-06-28	910	\N	1516
7548	GENERIC_DAY	0	2	2012-10-13	916	\N	1516
7549	GENERIC_DAY	0	2	2012-01-09	916	\N	1516
7550	GENERIC_DAY	0	2	2010-09-17	916	\N	1516
7551	GENERIC_DAY	0	2	2010-06-19	912	\N	1516
7552	GENERIC_DAY	0	2	2012-06-16	916	\N	1516
7553	GENERIC_DAY	0	2	2010-12-06	910	\N	1516
7554	GENERIC_DAY	0	2	2011-03-03	914	\N	1516
7555	GENERIC_DAY	0	2	2013-02-04	914	\N	1516
7556	GENERIC_DAY	0	2	2012-09-24	912	\N	1516
7557	GENERIC_DAY	0	2	2010-09-18	916	\N	1516
7558	GENERIC_DAY	0	2	2010-06-10	912	\N	1516
7559	GENERIC_DAY	0	2	2010-01-12	916	\N	1516
7560	GENERIC_DAY	0	2	2012-08-03	914	\N	1516
7561	GENERIC_DAY	0	2	2012-04-10	916	\N	1516
7562	GENERIC_DAY	0	2	2013-03-03	910	\N	1516
7563	GENERIC_DAY	0	2	2012-01-24	916	\N	1516
7564	GENERIC_DAY	0	2	2010-06-13	910	\N	1516
7565	GENERIC_DAY	0	2	2011-09-10	916	\N	1516
7566	GENERIC_DAY	0	2	2012-07-30	914	\N	1516
7567	GENERIC_DAY	0	2	2009-12-10	910	\N	1516
7568	GENERIC_DAY	0	2	2012-05-12	916	\N	1516
7569	GENERIC_DAY	0	2	2010-07-29	914	\N	1516
7570	GENERIC_DAY	0	2	2012-11-09	912	\N	1516
7571	GENERIC_DAY	0	2	2011-11-23	912	\N	1516
7572	GENERIC_DAY	0	2	2011-08-30	910	\N	1516
7573	GENERIC_DAY	0	2	2012-05-02	914	\N	1516
7574	GENERIC_DAY	0	2	2010-10-05	914	\N	1516
7575	GENERIC_DAY	0	2	2010-01-22	914	\N	1516
7576	GENERIC_DAY	0	2	2012-07-30	916	\N	1516
7577	GENERIC_DAY	0	2	2010-09-26	910	\N	1516
7578	GENERIC_DAY	0	2	2010-03-04	916	\N	1516
7579	GENERIC_DAY	0	2	2010-10-15	912	\N	1516
7580	GENERIC_DAY	0	2	2012-08-22	912	\N	1516
7581	GENERIC_DAY	0	2	2012-04-27	910	\N	1516
7582	GENERIC_DAY	0	2	2012-11-19	914	\N	1516
7583	GENERIC_DAY	0	2	2010-05-16	912	\N	1516
7584	GENERIC_DAY	0	2	2011-11-17	914	\N	1516
7585	GENERIC_DAY	0	2	2012-10-24	912	\N	1516
7586	GENERIC_DAY	0	2	2012-04-21	912	\N	1516
7587	GENERIC_DAY	0	2	2013-03-30	914	\N	1516
7588	GENERIC_DAY	0	2	2011-01-31	912	\N	1516
7589	GENERIC_DAY	0	2	2011-08-22	912	\N	1516
7590	GENERIC_DAY	0	2	2013-03-22	914	\N	1516
7591	GENERIC_DAY	0	2	2010-10-24	914	\N	1516
7592	GENERIC_DAY	0	2	2010-12-06	912	\N	1516
7593	GENERIC_DAY	0	2	2012-03-10	914	\N	1516
7594	GENERIC_DAY	0	2	2010-03-09	914	\N	1516
7595	GENERIC_DAY	0	2	2010-02-05	914	\N	1516
7596	GENERIC_DAY	0	2	2010-04-02	914	\N	1516
7597	GENERIC_DAY	0	2	2011-10-15	912	\N	1516
7598	GENERIC_DAY	0	2	2013-01-19	912	\N	1516
7599	GENERIC_DAY	0	2	2010-12-20	916	\N	1516
7600	GENERIC_DAY	0	2	2012-12-11	912	\N	1516
7601	GENERIC_DAY	0	2	2012-12-23	916	\N	1516
7602	GENERIC_DAY	0	2	2011-07-01	914	\N	1516
7603	GENERIC_DAY	0	2	2012-06-21	910	\N	1516
7604	GENERIC_DAY	0	2	2010-06-20	910	\N	1516
7605	GENERIC_DAY	0	2	2011-12-11	914	\N	1516
7606	GENERIC_DAY	0	2	2011-08-21	916	\N	1516
7607	GENERIC_DAY	0	2	2013-01-06	910	\N	1516
7608	GENERIC_DAY	0	2	2011-10-17	910	\N	1516
7609	GENERIC_DAY	0	2	2010-12-03	912	\N	1516
7610	GENERIC_DAY	0	2	2012-11-17	916	\N	1516
7611	GENERIC_DAY	0	2	2012-11-11	912	\N	1516
7612	GENERIC_DAY	0	2	2010-05-31	914	\N	1516
7613	GENERIC_DAY	0	2	2013-01-06	914	\N	1516
7614	GENERIC_DAY	0	2	2011-04-09	914	\N	1516
7615	GENERIC_DAY	0	2	2013-04-26	910	\N	1516
7616	GENERIC_DAY	0	2	2010-05-05	914	\N	1516
7617	GENERIC_DAY	0	2	2011-12-24	910	\N	1516
7618	GENERIC_DAY	0	2	2012-01-18	912	\N	1516
7619	GENERIC_DAY	0	2	2009-12-29	912	\N	1516
7620	GENERIC_DAY	0	2	2013-03-30	916	\N	1516
7621	GENERIC_DAY	0	2	2013-01-15	912	\N	1516
7622	GENERIC_DAY	0	2	2010-09-03	914	\N	1516
7623	GENERIC_DAY	0	2	2013-03-15	914	\N	1516
7624	GENERIC_DAY	0	2	2010-09-22	914	\N	1516
7625	GENERIC_DAY	0	2	2012-11-27	914	\N	1516
7626	GENERIC_DAY	0	2	2011-02-07	910	\N	1516
7627	GENERIC_DAY	0	2	2010-05-14	914	\N	1516
7628	GENERIC_DAY	0	2	2011-06-06	910	\N	1516
7629	GENERIC_DAY	0	2	2012-04-03	914	\N	1516
7630	GENERIC_DAY	0	2	2011-01-01	916	\N	1516
7631	GENERIC_DAY	0	2	2011-07-08	916	\N	1516
7632	GENERIC_DAY	0	2	2011-09-07	910	\N	1516
7633	GENERIC_DAY	0	2	2010-02-23	912	\N	1516
7634	GENERIC_DAY	0	2	2013-03-29	912	\N	1516
7635	GENERIC_DAY	0	2	2011-06-16	916	\N	1516
7636	GENERIC_DAY	0	2	2012-08-18	914	\N	1516
7637	GENERIC_DAY	0	2	2012-11-24	914	\N	1516
7638	GENERIC_DAY	0	2	2013-02-24	914	\N	1516
7639	GENERIC_DAY	0	2	2011-12-05	912	\N	1516
7640	GENERIC_DAY	0	2	2011-03-17	916	\N	1516
7641	GENERIC_DAY	0	2	2012-10-14	912	\N	1516
7642	GENERIC_DAY	0	2	2010-03-21	916	\N	1516
7643	GENERIC_DAY	0	2	2012-09-19	914	\N	1516
7644	GENERIC_DAY	0	2	2012-07-11	914	\N	1516
7645	GENERIC_DAY	0	2	2012-01-26	914	\N	1516
7646	GENERIC_DAY	0	2	2013-04-20	914	\N	1516
7647	GENERIC_DAY	0	2	2012-05-04	912	\N	1516
7648	GENERIC_DAY	0	2	2009-12-27	914	\N	1516
7649	GENERIC_DAY	0	2	2013-01-07	912	\N	1516
7650	GENERIC_DAY	0	2	2010-07-22	916	\N	1516
7651	GENERIC_DAY	0	2	2010-01-13	910	\N	1516
7652	GENERIC_DAY	0	2	2010-03-27	916	\N	1516
7653	GENERIC_DAY	0	2	2012-11-27	912	\N	1516
7654	GENERIC_DAY	0	2	2012-01-17	916	\N	1516
7655	GENERIC_DAY	0	2	2012-02-05	912	\N	1516
7656	GENERIC_DAY	0	2	2009-12-26	910	\N	1516
7657	GENERIC_DAY	0	2	2012-12-30	914	\N	1516
7658	GENERIC_DAY	0	2	2012-06-02	912	\N	1516
7659	GENERIC_DAY	0	2	2010-12-29	916	\N	1516
7660	GENERIC_DAY	0	2	2011-01-08	910	\N	1516
7661	GENERIC_DAY	0	2	2012-09-28	912	\N	1516
7662	GENERIC_DAY	0	2	2010-05-29	912	\N	1516
7663	GENERIC_DAY	0	2	2012-02-09	914	\N	1516
7664	GENERIC_DAY	0	2	2010-04-05	916	\N	1516
7665	GENERIC_DAY	0	2	2011-04-30	912	\N	1516
7666	GENERIC_DAY	0	2	2012-02-13	910	\N	1516
7667	GENERIC_DAY	0	2	2011-05-28	910	\N	1516
7668	GENERIC_DAY	0	2	2010-10-04	914	\N	1516
7669	GENERIC_DAY	0	2	2010-07-25	910	\N	1516
7670	GENERIC_DAY	0	2	2010-03-01	916	\N	1516
7671	GENERIC_DAY	0	2	2011-01-30	912	\N	1516
7672	GENERIC_DAY	0	2	2013-01-19	910	\N	1516
7673	GENERIC_DAY	0	2	2012-06-12	912	\N	1516
7674	GENERIC_DAY	0	2	2012-10-30	912	\N	1516
7675	GENERIC_DAY	0	2	2012-08-16	912	\N	1516
7676	GENERIC_DAY	0	2	2012-02-27	916	\N	1516
7677	GENERIC_DAY	0	2	2010-02-17	914	\N	1516
7678	GENERIC_DAY	0	2	2011-09-30	916	\N	1516
7679	GENERIC_DAY	0	2	2011-03-16	910	\N	1516
7680	GENERIC_DAY	0	2	2012-12-18	910	\N	1516
7681	GENERIC_DAY	0	2	2011-12-02	914	\N	1516
7682	GENERIC_DAY	0	2	2012-10-01	914	\N	1516
7683	GENERIC_DAY	0	2	2010-11-15	916	\N	1516
7684	GENERIC_DAY	0	2	2010-06-25	914	\N	1516
7685	GENERIC_DAY	0	2	2010-06-20	912	\N	1516
7686	GENERIC_DAY	0	2	2011-06-23	916	\N	1516
7687	GENERIC_DAY	0	2	2010-02-27	914	\N	1516
7688	GENERIC_DAY	0	2	2009-12-19	914	\N	1516
7689	GENERIC_DAY	0	2	2011-02-27	914	\N	1516
7690	GENERIC_DAY	0	2	2013-02-24	916	\N	1516
7691	GENERIC_DAY	0	2	2012-06-06	912	\N	1516
7692	GENERIC_DAY	0	2	2011-07-19	910	\N	1516
7693	GENERIC_DAY	0	2	2011-08-18	914	\N	1516
7694	GENERIC_DAY	0	2	2010-09-12	914	\N	1516
7695	GENERIC_DAY	0	2	2010-01-19	912	\N	1516
7696	GENERIC_DAY	0	2	2012-08-22	916	\N	1516
7697	GENERIC_DAY	0	2	2010-03-25	914	\N	1516
7698	GENERIC_DAY	0	2	2011-07-16	912	\N	1516
7699	GENERIC_DAY	0	2	2012-09-07	910	\N	1516
7700	GENERIC_DAY	0	2	2013-04-16	916	\N	1516
7701	GENERIC_DAY	0	2	2010-04-19	910	\N	1516
7702	GENERIC_DAY	0	2	2010-07-06	910	\N	1516
7703	GENERIC_DAY	0	2	2011-05-19	912	\N	1516
7704	GENERIC_DAY	0	2	2013-01-24	914	\N	1516
7705	GENERIC_DAY	0	2	2010-05-21	916	\N	1516
7706	GENERIC_DAY	0	2	2010-07-14	914	\N	1516
7707	GENERIC_DAY	0	2	2013-01-22	910	\N	1516
7708	GENERIC_DAY	0	2	2012-10-27	910	\N	1516
7709	GENERIC_DAY	0	2	2011-01-28	914	\N	1516
7710	GENERIC_DAY	0	2	2010-09-11	916	\N	1516
7711	GENERIC_DAY	0	2	2010-07-06	914	\N	1516
7712	GENERIC_DAY	0	2	2011-11-02	912	\N	1516
7713	GENERIC_DAY	0	2	2012-04-01	914	\N	1516
7714	GENERIC_DAY	0	2	2011-06-13	910	\N	1516
7715	GENERIC_DAY	0	2	2010-04-07	914	\N	1516
7716	GENERIC_DAY	0	2	2011-05-25	910	\N	1516
7717	GENERIC_DAY	0	2	2010-11-16	912	\N	1516
7718	GENERIC_DAY	0	2	2011-01-04	912	\N	1516
7719	GENERIC_DAY	0	2	2010-07-28	916	\N	1516
7720	GENERIC_DAY	0	2	2012-08-19	914	\N	1516
7721	GENERIC_DAY	0	2	2010-12-13	914	\N	1516
7722	GENERIC_DAY	0	2	2011-09-06	910	\N	1516
7723	GENERIC_DAY	0	2	2011-12-24	912	\N	1516
7724	GENERIC_DAY	0	2	2011-04-02	916	\N	1516
7725	GENERIC_DAY	0	2	2012-11-16	914	\N	1516
7726	GENERIC_DAY	0	2	2010-01-02	912	\N	1516
7727	GENERIC_DAY	0	2	2011-11-05	916	\N	1516
7728	GENERIC_DAY	0	2	2010-12-29	910	\N	1516
7729	GENERIC_DAY	0	2	2010-08-31	912	\N	1516
7730	GENERIC_DAY	0	2	2012-11-14	912	\N	1516
7731	GENERIC_DAY	0	2	2010-08-16	916	\N	1516
7732	GENERIC_DAY	0	2	2012-01-10	910	\N	1516
7733	GENERIC_DAY	0	2	2012-01-14	916	\N	1516
7734	GENERIC_DAY	0	2	2012-09-18	916	\N	1516
7735	GENERIC_DAY	0	2	2011-04-28	914	\N	1516
7736	GENERIC_DAY	0	2	2013-04-02	916	\N	1516
7737	GENERIC_DAY	0	2	2010-08-12	910	\N	1516
7738	GENERIC_DAY	0	2	2011-02-23	914	\N	1516
7739	GENERIC_DAY	0	2	2010-09-01	912	\N	1516
7740	GENERIC_DAY	0	2	2010-01-18	910	\N	1516
7741	GENERIC_DAY	0	2	2010-09-27	912	\N	1516
7742	GENERIC_DAY	0	2	2009-12-10	914	\N	1516
7743	GENERIC_DAY	0	2	2013-04-08	914	\N	1516
7744	GENERIC_DAY	0	2	2012-08-25	914	\N	1516
7745	GENERIC_DAY	0	2	2013-02-18	912	\N	1516
7746	GENERIC_DAY	0	2	2010-03-26	912	\N	1516
7747	GENERIC_DAY	0	2	2011-06-02	912	\N	1516
7748	GENERIC_DAY	0	2	2011-08-15	910	\N	1516
7749	GENERIC_DAY	0	2	2010-08-07	914	\N	1516
7750	GENERIC_DAY	0	2	2010-10-12	912	\N	1516
7751	GENERIC_DAY	0	2	2010-01-22	910	\N	1516
7752	GENERIC_DAY	0	2	2012-11-04	910	\N	1516
7753	GENERIC_DAY	0	2	2010-07-28	912	\N	1516
7754	GENERIC_DAY	0	2	2012-08-29	910	\N	1516
7755	GENERIC_DAY	0	2	2010-05-26	914	\N	1516
7756	GENERIC_DAY	0	2	2010-10-30	916	\N	1516
7757	GENERIC_DAY	0	2	2011-06-20	916	\N	1516
7758	GENERIC_DAY	0	2	2012-06-17	914	\N	1516
7759	GENERIC_DAY	0	2	2012-10-15	916	\N	1516
7760	GENERIC_DAY	0	2	2011-02-21	910	\N	1516
7761	GENERIC_DAY	0	2	2012-04-14	910	\N	1516
7762	GENERIC_DAY	0	2	2010-06-28	912	\N	1516
7763	GENERIC_DAY	0	2	2010-05-20	916	\N	1516
7764	GENERIC_DAY	0	2	2012-04-11	912	\N	1516
7765	GENERIC_DAY	0	2	2012-02-02	912	\N	1516
7766	GENERIC_DAY	0	2	2010-05-30	914	\N	1516
7767	GENERIC_DAY	0	2	2011-11-20	914	\N	1516
7768	GENERIC_DAY	0	2	2011-07-31	914	\N	1516
7769	GENERIC_DAY	0	2	2012-10-24	916	\N	1516
7770	GENERIC_DAY	0	2	2010-07-11	916	\N	1516
7771	GENERIC_DAY	0	2	2010-09-24	916	\N	1516
7772	GENERIC_DAY	0	2	2011-08-24	910	\N	1516
7773	GENERIC_DAY	0	2	2010-02-07	916	\N	1516
7774	GENERIC_DAY	0	2	2011-04-19	910	\N	1516
7775	GENERIC_DAY	0	2	2010-08-08	916	\N	1516
7776	GENERIC_DAY	0	2	2011-06-05	910	\N	1516
7777	GENERIC_DAY	0	2	2010-04-06	910	\N	1516
7778	GENERIC_DAY	0	2	2012-01-31	914	\N	1516
7779	GENERIC_DAY	0	2	2011-09-21	916	\N	1516
7780	GENERIC_DAY	0	2	2012-08-01	910	\N	1516
7781	GENERIC_DAY	0	2	2013-04-01	910	\N	1516
7782	GENERIC_DAY	0	2	2012-01-12	914	\N	1516
7783	GENERIC_DAY	0	2	2010-12-16	914	\N	1516
7784	GENERIC_DAY	0	2	2010-08-05	910	\N	1516
7785	GENERIC_DAY	0	2	2010-11-27	910	\N	1516
7786	GENERIC_DAY	0	2	2011-01-12	916	\N	1516
7787	GENERIC_DAY	0	2	2011-01-31	916	\N	1516
7788	GENERIC_DAY	0	2	2012-08-21	916	\N	1516
7789	GENERIC_DAY	0	2	2010-06-29	914	\N	1516
7790	GENERIC_DAY	0	2	2010-06-21	914	\N	1516
7791	GENERIC_DAY	0	2	2012-08-01	912	\N	1516
7792	GENERIC_DAY	0	2	2011-08-16	912	\N	1516
7793	GENERIC_DAY	0	2	2011-09-18	916	\N	1516
7794	GENERIC_DAY	0	2	2011-01-13	916	\N	1516
7795	GENERIC_DAY	0	2	2010-02-20	914	\N	1516
7796	GENERIC_DAY	0	2	2011-10-27	912	\N	1516
7797	GENERIC_DAY	0	2	2011-12-20	916	\N	1516
7798	GENERIC_DAY	0	2	2010-06-23	910	\N	1516
7799	GENERIC_DAY	0	2	2013-04-28	910	\N	1516
7800	GENERIC_DAY	0	2	2010-02-02	912	\N	1516
7801	GENERIC_DAY	0	2	2011-04-20	916	\N	1516
7802	GENERIC_DAY	0	2	2012-01-14	914	\N	1516
7803	GENERIC_DAY	0	2	2011-01-07	916	\N	1516
7804	GENERIC_DAY	0	2	2011-01-19	912	\N	1516
7805	GENERIC_DAY	0	2	2011-06-09	912	\N	1516
7806	GENERIC_DAY	0	2	2009-12-17	910	\N	1516
7807	GENERIC_DAY	0	2	2011-11-08	916	\N	1516
7808	GENERIC_DAY	0	2	2012-04-20	912	\N	1516
7809	GENERIC_DAY	0	2	2010-07-13	914	\N	1516
7810	GENERIC_DAY	0	2	2011-08-21	912	\N	1516
7811	GENERIC_DAY	0	2	2010-04-20	912	\N	1516
7812	GENERIC_DAY	0	2	2013-01-19	914	\N	1516
7813	GENERIC_DAY	0	2	2012-05-02	912	\N	1516
7814	GENERIC_DAY	0	2	2013-03-10	914	\N	1516
7815	GENERIC_DAY	0	2	2010-12-08	914	\N	1516
7816	GENERIC_DAY	0	2	2012-04-17	914	\N	1516
7817	GENERIC_DAY	0	2	2011-02-06	912	\N	1516
7818	GENERIC_DAY	0	2	2011-04-21	914	\N	1516
7819	GENERIC_DAY	0	2	2012-02-17	914	\N	1516
7820	GENERIC_DAY	0	2	2010-03-07	916	\N	1516
7821	GENERIC_DAY	0	2	2010-02-21	914	\N	1516
7822	GENERIC_DAY	0	2	2012-03-24	914	\N	1516
7823	GENERIC_DAY	0	2	2010-05-27	910	\N	1516
7824	GENERIC_DAY	0	2	2012-08-12	916	\N	1516
7825	GENERIC_DAY	0	2	2010-11-06	916	\N	1516
7826	GENERIC_DAY	0	2	2010-10-19	914	\N	1516
7827	GENERIC_DAY	0	2	2012-09-30	914	\N	1516
7828	GENERIC_DAY	0	2	2010-11-04	916	\N	1516
7829	GENERIC_DAY	0	2	2012-03-08	914	\N	1516
7830	GENERIC_DAY	0	2	2012-11-30	916	\N	1516
7831	GENERIC_DAY	0	2	2012-02-26	916	\N	1516
7832	GENERIC_DAY	0	2	2011-10-28	916	\N	1516
7833	GENERIC_DAY	0	2	2012-01-24	910	\N	1516
7834	GENERIC_DAY	0	2	2012-08-06	912	\N	1516
7835	GENERIC_DAY	0	2	2012-01-10	914	\N	1516
7836	GENERIC_DAY	0	2	2010-10-09	910	\N	1516
7837	GENERIC_DAY	0	2	2010-12-18	914	\N	1516
7838	GENERIC_DAY	0	2	2011-03-04	916	\N	1516
7839	GENERIC_DAY	0	2	2011-03-05	910	\N	1516
7840	GENERIC_DAY	0	2	2011-08-22	914	\N	1516
7841	GENERIC_DAY	0	2	2013-03-31	912	\N	1516
7842	GENERIC_DAY	0	2	2012-03-26	914	\N	1516
7843	GENERIC_DAY	0	2	2010-12-02	914	\N	1516
7844	GENERIC_DAY	0	2	2010-05-01	914	\N	1516
7845	GENERIC_DAY	0	2	2011-07-14	916	\N	1516
7846	GENERIC_DAY	0	2	2011-12-13	910	\N	1516
7847	GENERIC_DAY	0	2	2010-09-26	914	\N	1516
7848	GENERIC_DAY	0	2	2011-09-23	910	\N	1516
7849	GENERIC_DAY	0	2	2012-10-31	914	\N	1516
7850	GENERIC_DAY	0	2	2011-04-22	914	\N	1516
7851	GENERIC_DAY	0	2	2011-01-29	916	\N	1516
7852	GENERIC_DAY	0	2	2010-10-17	910	\N	1516
7853	GENERIC_DAY	0	2	2010-01-27	910	\N	1516
7854	GENERIC_DAY	0	2	2012-06-30	914	\N	1516
7855	GENERIC_DAY	0	2	2011-05-12	912	\N	1516
7856	GENERIC_DAY	0	2	2010-06-02	912	\N	1516
7857	GENERIC_DAY	0	2	2012-12-14	914	\N	1516
7858	GENERIC_DAY	0	2	2010-11-23	914	\N	1516
7859	GENERIC_DAY	0	2	2012-06-15	916	\N	1516
7860	GENERIC_DAY	0	2	2012-12-25	914	\N	1516
7861	GENERIC_DAY	0	2	2011-05-18	912	\N	1516
7862	GENERIC_DAY	0	2	2010-02-20	916	\N	1516
7863	GENERIC_DAY	0	2	2010-01-07	912	\N	1516
7864	GENERIC_DAY	0	2	2012-01-02	910	\N	1516
7865	GENERIC_DAY	0	2	2013-03-22	916	\N	1516
7866	GENERIC_DAY	0	2	2013-03-16	912	\N	1516
7867	GENERIC_DAY	0	2	2011-01-24	912	\N	1516
7868	GENERIC_DAY	0	2	2011-04-22	910	\N	1516
7869	GENERIC_DAY	0	2	2012-02-28	914	\N	1516
7870	GENERIC_DAY	0	2	2012-03-21	914	\N	1516
7871	GENERIC_DAY	0	2	2012-03-12	916	\N	1516
7872	GENERIC_DAY	0	2	2010-12-23	912	\N	1516
7873	GENERIC_DAY	0	2	2010-02-19	914	\N	1516
7874	GENERIC_DAY	0	2	2010-11-14	912	\N	1516
7875	GENERIC_DAY	0	2	2010-05-02	910	\N	1516
7876	GENERIC_DAY	0	2	2012-12-09	912	\N	1516
7877	GENERIC_DAY	0	2	2010-10-17	914	\N	1516
7878	GENERIC_DAY	0	2	2010-01-27	916	\N	1516
7879	GENERIC_DAY	0	2	2010-05-06	914	\N	1516
7880	GENERIC_DAY	0	2	2010-07-07	910	\N	1516
7881	GENERIC_DAY	0	2	2011-05-03	914	\N	1516
7882	GENERIC_DAY	0	2	2012-01-06	914	\N	1516
7883	GENERIC_DAY	0	2	2011-08-07	912	\N	1516
7884	GENERIC_DAY	0	2	2011-11-18	916	\N	1516
7885	GENERIC_DAY	0	2	2012-03-01	910	\N	1516
7886	GENERIC_DAY	0	2	2010-05-14	916	\N	1516
7887	GENERIC_DAY	0	2	2013-04-09	910	\N	1516
7888	GENERIC_DAY	0	2	2012-10-01	910	\N	1516
7889	GENERIC_DAY	0	2	2012-10-12	914	\N	1516
7890	GENERIC_DAY	0	2	2013-05-11	916	\N	1516
7891	GENERIC_DAY	0	2	2010-09-09	912	\N	1516
7892	GENERIC_DAY	0	2	2010-08-22	916	\N	1516
7893	GENERIC_DAY	0	2	2012-08-28	914	\N	1516
7894	GENERIC_DAY	0	2	2011-11-01	910	\N	1516
7895	GENERIC_DAY	0	2	2010-09-21	912	\N	1516
7896	GENERIC_DAY	0	2	2012-05-19	916	\N	1516
7897	GENERIC_DAY	0	2	2012-08-06	914	\N	1516
7898	GENERIC_DAY	0	2	2012-02-14	912	\N	1516
7899	GENERIC_DAY	0	2	2011-01-03	914	\N	1516
7900	GENERIC_DAY	0	2	2011-05-24	914	\N	1516
7901	GENERIC_DAY	0	2	2010-06-18	910	\N	1516
7902	GENERIC_DAY	0	2	2010-07-17	914	\N	1516
7903	GENERIC_DAY	0	2	2010-10-23	912	\N	1516
7904	GENERIC_DAY	0	2	2010-12-05	914	\N	1516
7905	GENERIC_DAY	0	2	2012-03-06	912	\N	1516
7906	GENERIC_DAY	0	2	2011-04-22	912	\N	1516
7907	GENERIC_DAY	0	2	2010-05-09	914	\N	1516
7908	GENERIC_DAY	0	2	2010-07-08	912	\N	1516
7909	GENERIC_DAY	0	2	2010-01-13	912	\N	1516
7910	GENERIC_DAY	0	2	2010-04-03	916	\N	1516
7911	GENERIC_DAY	0	2	2011-10-19	910	\N	1516
7912	GENERIC_DAY	0	2	2011-12-05	910	\N	1516
7913	GENERIC_DAY	0	2	2010-05-15	916	\N	1516
7914	GENERIC_DAY	0	2	2013-01-28	912	\N	1516
7915	GENERIC_DAY	0	2	2013-01-16	910	\N	1516
7916	GENERIC_DAY	0	2	2010-08-01	916	\N	1516
7917	GENERIC_DAY	0	2	2010-09-27	910	\N	1516
7918	GENERIC_DAY	0	2	2012-07-07	910	\N	1516
7919	GENERIC_DAY	0	2	2010-04-17	914	\N	1516
7920	GENERIC_DAY	0	2	2011-02-07	916	\N	1516
7921	GENERIC_DAY	0	2	2012-04-29	914	\N	1516
7922	GENERIC_DAY	0	2	2012-05-03	910	\N	1516
7923	GENERIC_DAY	0	2	2013-01-19	916	\N	1516
7924	GENERIC_DAY	0	2	2010-12-24	912	\N	1516
7925	GENERIC_DAY	0	2	2013-01-12	914	\N	1516
7926	GENERIC_DAY	0	2	2011-06-24	914	\N	1516
7927	GENERIC_DAY	0	2	2010-01-22	916	\N	1516
7928	GENERIC_DAY	0	2	2010-04-19	912	\N	1516
7929	GENERIC_DAY	0	2	2012-02-01	914	\N	1516
7930	GENERIC_DAY	0	2	2010-09-25	914	\N	1516
7931	GENERIC_DAY	0	2	2010-03-26	910	\N	1516
7932	GENERIC_DAY	0	2	2011-07-10	912	\N	1516
7933	GENERIC_DAY	0	2	2012-09-10	912	\N	1516
7934	GENERIC_DAY	0	2	2012-05-23	912	\N	1516
7935	GENERIC_DAY	0	2	2012-02-19	914	\N	1516
7936	GENERIC_DAY	0	2	2013-03-07	916	\N	1516
7937	GENERIC_DAY	0	2	2012-11-04	914	\N	1516
7938	GENERIC_DAY	0	2	2011-01-11	916	\N	1516
7939	GENERIC_DAY	0	2	2013-04-10	914	\N	1516
7940	GENERIC_DAY	0	2	2012-09-24	910	\N	1516
7941	GENERIC_DAY	0	2	2012-06-14	916	\N	1516
7942	GENERIC_DAY	0	2	2010-04-17	916	\N	1516
7943	GENERIC_DAY	0	2	2011-11-05	912	\N	1516
7944	GENERIC_DAY	0	2	2010-06-26	912	\N	1516
7945	GENERIC_DAY	0	2	2011-08-10	916	\N	1516
7946	GENERIC_DAY	0	2	2010-01-16	912	\N	1516
7947	GENERIC_DAY	0	2	2010-10-08	914	\N	1516
7948	GENERIC_DAY	0	2	2011-11-18	914	\N	1516
7949	GENERIC_DAY	0	2	2012-02-27	912	\N	1516
7950	GENERIC_DAY	0	2	2012-04-11	916	\N	1516
7951	GENERIC_DAY	0	2	2012-02-22	912	\N	1516
7952	GENERIC_DAY	0	2	2011-08-08	912	\N	1516
7953	GENERIC_DAY	0	2	2010-02-28	916	\N	1516
7954	GENERIC_DAY	0	2	2010-04-03	910	\N	1516
7955	GENERIC_DAY	0	2	2012-11-29	912	\N	1516
7956	GENERIC_DAY	0	2	2012-05-16	916	\N	1516
7957	GENERIC_DAY	0	2	2011-06-27	910	\N	1516
7958	GENERIC_DAY	0	2	2011-09-08	912	\N	1516
7959	GENERIC_DAY	0	2	2011-04-15	910	\N	1516
7960	GENERIC_DAY	0	2	2010-06-21	912	\N	1516
7961	GENERIC_DAY	0	2	2013-05-03	910	\N	1516
7962	GENERIC_DAY	0	2	2012-07-18	910	\N	1516
7963	GENERIC_DAY	0	2	2010-07-08	910	\N	1516
7964	GENERIC_DAY	0	2	2010-09-28	910	\N	1516
7965	GENERIC_DAY	0	2	2013-04-03	916	\N	1516
7966	GENERIC_DAY	0	2	2012-03-02	916	\N	1516
7967	GENERIC_DAY	0	2	2010-11-11	916	\N	1516
7968	GENERIC_DAY	0	2	2012-10-19	912	\N	1516
7969	GENERIC_DAY	0	2	2011-01-29	914	\N	1516
7970	GENERIC_DAY	0	2	2013-02-16	912	\N	1516
7971	GENERIC_DAY	0	2	2012-09-11	910	\N	1516
7972	GENERIC_DAY	0	2	2010-02-14	912	\N	1516
7973	GENERIC_DAY	0	2	2011-07-21	910	\N	1516
7974	GENERIC_DAY	0	2	2011-06-30	910	\N	1516
7975	GENERIC_DAY	0	2	2012-09-26	910	\N	1516
7976	GENERIC_DAY	0	2	2010-04-11	910	\N	1516
7977	GENERIC_DAY	0	2	2012-07-02	916	\N	1516
7978	GENERIC_DAY	0	2	2010-05-13	914	\N	1516
7979	GENERIC_DAY	0	2	2012-10-14	914	\N	1516
7980	GENERIC_DAY	0	2	2011-08-25	914	\N	1516
7981	GENERIC_DAY	0	2	2012-03-29	914	\N	1516
7982	GENERIC_DAY	0	2	2012-11-24	916	\N	1516
7983	GENERIC_DAY	0	2	2010-06-29	916	\N	1516
7984	GENERIC_DAY	0	2	2013-01-26	912	\N	1516
7985	GENERIC_DAY	0	2	2010-10-21	910	\N	1516
7986	GENERIC_DAY	0	2	2010-03-07	914	\N	1516
7987	GENERIC_DAY	0	2	2011-03-27	914	\N	1516
7988	GENERIC_DAY	0	2	2012-06-22	910	\N	1516
7989	GENERIC_DAY	0	2	2012-06-18	910	\N	1516
7990	GENERIC_DAY	0	2	2010-08-30	914	\N	1516
7991	GENERIC_DAY	0	2	2012-08-05	916	\N	1516
7992	GENERIC_DAY	0	2	2010-11-26	910	\N	1516
7993	GENERIC_DAY	0	2	2011-12-08	912	\N	1516
7994	GENERIC_DAY	0	2	2012-04-06	914	\N	1516
7995	GENERIC_DAY	0	2	2012-06-27	914	\N	1516
7996	GENERIC_DAY	0	2	2013-02-04	916	\N	1516
7997	GENERIC_DAY	0	2	2011-08-12	910	\N	1516
7998	GENERIC_DAY	0	2	2013-02-22	914	\N	1516
7999	GENERIC_DAY	0	2	2010-08-06	912	\N	1516
8000	GENERIC_DAY	0	2	2010-07-14	910	\N	1516
8001	GENERIC_DAY	0	2	2011-12-16	910	\N	1516
8002	GENERIC_DAY	0	2	2010-05-02	912	\N	1516
8003	GENERIC_DAY	0	2	2013-02-15	912	\N	1516
8004	GENERIC_DAY	0	2	2011-09-17	910	\N	1516
8005	GENERIC_DAY	0	2	2012-12-08	910	\N	1516
8006	GENERIC_DAY	0	2	2010-04-05	914	\N	1516
8007	GENERIC_DAY	0	2	2011-10-31	910	\N	1516
8008	GENERIC_DAY	0	2	2013-03-07	912	\N	1516
8009	GENERIC_DAY	0	2	2013-02-15	916	\N	1516
8010	GENERIC_DAY	0	2	2011-11-04	916	\N	1516
8011	GENERIC_DAY	0	2	2013-01-10	910	\N	1516
8012	GENERIC_DAY	0	2	2013-03-13	912	\N	1516
8013	GENERIC_DAY	0	2	2010-08-11	910	\N	1516
8014	GENERIC_DAY	0	2	2011-09-04	916	\N	1516
8015	GENERIC_DAY	0	2	2013-01-31	914	\N	1516
8016	GENERIC_DAY	0	2	2011-09-14	916	\N	1516
8017	GENERIC_DAY	0	2	2011-02-01	914	\N	1516
8018	GENERIC_DAY	0	2	2013-01-14	916	\N	1516
8019	GENERIC_DAY	0	2	2011-10-27	914	\N	1516
8020	GENERIC_DAY	0	2	2012-07-31	910	\N	1516
8021	GENERIC_DAY	0	2	2013-01-13	910	\N	1516
8022	GENERIC_DAY	0	2	2012-08-09	916	\N	1516
8023	GENERIC_DAY	0	2	2012-12-23	914	\N	1516
8024	GENERIC_DAY	0	2	2010-11-25	914	\N	1516
8025	GENERIC_DAY	0	2	2013-01-22	912	\N	1516
8026	GENERIC_DAY	0	2	2012-12-16	916	\N	1516
8027	GENERIC_DAY	0	2	2012-11-22	912	\N	1516
8028	GENERIC_DAY	0	2	2011-11-19	916	\N	1516
8029	GENERIC_DAY	0	2	2012-09-12	912	\N	1516
8030	GENERIC_DAY	0	2	2011-07-13	916	\N	1516
8031	GENERIC_DAY	0	2	2012-02-15	914	\N	1516
8032	GENERIC_DAY	0	2	2012-06-26	916	\N	1516
8033	GENERIC_DAY	0	2	2011-02-11	910	\N	1516
8034	GENERIC_DAY	0	2	2010-01-29	910	\N	1516
8035	GENERIC_DAY	0	2	2011-01-15	912	\N	1516
8036	GENERIC_DAY	0	2	2011-10-26	916	\N	1516
8037	GENERIC_DAY	0	2	2012-09-28	914	\N	1516
8038	GENERIC_DAY	0	2	2010-04-24	914	\N	1516
8039	GENERIC_DAY	0	2	2010-10-27	916	\N	1516
8040	GENERIC_DAY	0	2	2009-12-16	916	\N	1516
8041	GENERIC_DAY	0	2	2010-10-03	914	\N	1516
8042	GENERIC_DAY	0	2	2010-11-02	910	\N	1516
8043	GENERIC_DAY	0	2	2010-12-14	910	\N	1516
8044	GENERIC_DAY	0	2	2013-02-19	916	\N	1516
8045	GENERIC_DAY	0	2	2012-05-07	910	\N	1516
8046	GENERIC_DAY	0	2	2012-01-28	914	\N	1516
8047	GENERIC_DAY	0	2	2010-10-13	916	\N	1516
8048	GENERIC_DAY	0	2	2013-04-15	912	\N	1516
8049	GENERIC_DAY	0	2	2012-03-17	914	\N	1516
8050	GENERIC_DAY	0	2	2011-02-18	916	\N	1516
8051	GENERIC_DAY	0	2	2011-11-09	910	\N	1516
8052	GENERIC_DAY	0	2	2012-10-26	916	\N	1516
8053	GENERIC_DAY	0	2	2012-01-17	910	\N	1516
8054	GENERIC_DAY	0	2	2011-05-31	910	\N	1516
8055	GENERIC_DAY	0	2	2011-06-05	912	\N	1516
8056	GENERIC_DAY	0	2	2012-10-08	910	\N	1516
8057	GENERIC_DAY	0	2	2010-02-14	916	\N	1516
8058	GENERIC_DAY	0	2	2012-08-24	912	\N	1516
8059	GENERIC_DAY	0	2	2013-05-02	912	\N	1516
8060	GENERIC_DAY	0	2	2012-07-19	912	\N	1516
8061	GENERIC_DAY	0	2	2011-06-19	914	\N	1516
8062	GENERIC_DAY	0	2	2012-07-13	916	\N	1516
8063	GENERIC_DAY	0	2	2011-08-12	914	\N	1516
8064	GENERIC_DAY	0	2	2010-10-25	910	\N	1516
8065	GENERIC_DAY	0	2	2010-10-10	914	\N	1516
8066	GENERIC_DAY	0	2	2011-06-11	910	\N	1516
8067	GENERIC_DAY	0	2	2010-02-01	916	\N	1516
8068	GENERIC_DAY	0	2	2012-12-10	912	\N	1516
8069	GENERIC_DAY	0	2	2010-08-19	916	\N	1516
8070	GENERIC_DAY	0	2	2011-06-06	916	\N	1516
8071	GENERIC_DAY	0	2	2012-01-19	910	\N	1516
8072	GENERIC_DAY	0	2	2011-10-03	916	\N	1516
8073	GENERIC_DAY	0	2	2010-08-23	912	\N	1516
8074	GENERIC_DAY	0	2	2011-06-18	912	\N	1516
8075	GENERIC_DAY	0	2	2010-11-21	916	\N	1516
8076	GENERIC_DAY	0	2	2010-01-07	910	\N	1516
8077	GENERIC_DAY	0	2	2013-03-29	910	\N	1516
8078	GENERIC_DAY	0	2	2010-10-18	916	\N	1516
8079	GENERIC_DAY	0	2	2011-11-07	910	\N	1516
8080	GENERIC_DAY	0	2	2011-10-24	912	\N	1516
8081	GENERIC_DAY	0	2	2012-12-11	916	\N	1516
8082	GENERIC_DAY	0	2	2011-09-09	910	\N	1516
8083	GENERIC_DAY	0	2	2011-02-05	912	\N	1516
8084	GENERIC_DAY	0	2	2010-06-23	916	\N	1516
8085	GENERIC_DAY	0	2	2012-07-08	916	\N	1516
8086	GENERIC_DAY	0	2	2013-01-15	910	\N	1516
8087	GENERIC_DAY	0	2	2011-09-24	914	\N	1516
8088	GENERIC_DAY	0	0	2009-12-25	910	\N	1516
8089	GENERIC_DAY	0	2	2013-05-01	910	\N	1516
8090	GENERIC_DAY	0	2	2011-01-09	914	\N	1516
8091	GENERIC_DAY	0	2	2011-09-19	910	\N	1516
8092	GENERIC_DAY	0	2	2013-01-11	912	\N	1516
8093	GENERIC_DAY	0	2	2010-03-02	916	\N	1516
8094	GENERIC_DAY	0	2	2012-05-23	914	\N	1516
8095	GENERIC_DAY	0	2	2011-09-23	912	\N	1516
8096	GENERIC_DAY	0	2	2010-03-04	912	\N	1516
8097	GENERIC_DAY	0	2	2010-09-11	914	\N	1516
8098	GENERIC_DAY	0	2	2011-11-15	912	\N	1516
8099	GENERIC_DAY	0	2	2010-08-04	914	\N	1516
8100	GENERIC_DAY	0	2	2011-06-18	916	\N	1516
8101	GENERIC_DAY	0	2	2012-05-26	916	\N	1516
8102	GENERIC_DAY	0	2	2010-06-12	914	\N	1516
8103	GENERIC_DAY	0	2	2011-06-09	910	\N	1516
8104	GENERIC_DAY	0	2	2012-11-30	914	\N	1516
8105	GENERIC_DAY	0	2	2012-01-15	912	\N	1516
8106	GENERIC_DAY	0	2	2011-02-20	914	\N	1516
8107	GENERIC_DAY	0	2	2010-07-19	916	\N	1516
8108	GENERIC_DAY	0	2	2010-02-18	914	\N	1516
8109	GENERIC_DAY	0	2	2009-12-14	912	\N	1516
8110	GENERIC_DAY	0	2	2010-12-16	916	\N	1516
8111	GENERIC_DAY	0	2	2010-12-27	916	\N	1516
8112	GENERIC_DAY	0	2	2012-12-19	914	\N	1516
8113	GENERIC_DAY	0	2	2012-02-12	914	\N	1516
8114	GENERIC_DAY	0	2	2011-11-12	914	\N	1516
8115	GENERIC_DAY	0	2	2012-03-13	914	\N	1516
8116	GENERIC_DAY	0	2	2011-06-23	910	\N	1516
8117	GENERIC_DAY	0	2	2011-12-25	910	\N	1516
8118	GENERIC_DAY	0	2	2011-08-25	912	\N	1516
8119	GENERIC_DAY	0	2	2012-02-07	912	\N	1516
8120	GENERIC_DAY	0	2	2012-09-25	914	\N	1516
8121	GENERIC_DAY	0	2	2011-12-12	914	\N	1516
8122	GENERIC_DAY	0	2	2012-02-12	916	\N	1516
8123	GENERIC_DAY	0	2	2010-07-27	912	\N	1516
8124	GENERIC_DAY	0	2	2012-03-15	912	\N	1516
8125	GENERIC_DAY	0	2	2010-12-21	912	\N	1516
8126	GENERIC_DAY	0	2	2012-03-11	916	\N	1516
8127	GENERIC_DAY	0	2	2010-06-15	914	\N	1516
8128	GENERIC_DAY	0	2	2012-08-20	910	\N	1516
8129	GENERIC_DAY	0	2	2010-09-03	910	\N	1516
8130	GENERIC_DAY	0	2	2011-08-11	916	\N	1516
8131	GENERIC_DAY	0	2	2011-12-23	910	\N	1516
8132	GENERIC_DAY	0	2	2012-10-29	910	\N	1516
8133	GENERIC_DAY	0	2	2011-08-02	916	\N	1516
8134	GENERIC_DAY	0	2	2010-01-08	916	\N	1516
8135	GENERIC_DAY	0	2	2010-07-14	916	\N	1516
8136	GENERIC_DAY	0	2	2009-12-22	910	\N	1516
8137	GENERIC_DAY	0	2	2012-09-16	916	\N	1516
8138	GENERIC_DAY	0	2	2012-03-30	910	\N	1516
8139	GENERIC_DAY	0	2	2012-02-09	912	\N	1516
8140	GENERIC_DAY	0	2	2011-10-22	916	\N	1516
8141	GENERIC_DAY	0	2	2013-04-05	916	\N	1516
8142	GENERIC_DAY	0	2	2012-08-09	910	\N	1516
8143	GENERIC_DAY	0	2	2010-01-01	916	\N	1516
8144	GENERIC_DAY	0	2	2011-04-22	916	\N	1516
8145	GENERIC_DAY	0	2	2010-10-05	916	\N	1516
8146	GENERIC_DAY	0	2	2010-01-08	914	\N	1516
8147	GENERIC_DAY	0	2	2010-12-10	914	\N	1516
8148	GENERIC_DAY	0	2	2010-02-05	912	\N	1516
8149	GENERIC_DAY	0	2	2012-10-04	910	\N	1516
8150	GENERIC_DAY	0	2	2013-03-26	916	\N	1516
8151	GENERIC_DAY	0	2	2013-02-06	916	\N	1516
8152	GENERIC_DAY	0	2	2012-08-26	912	\N	1516
8153	GENERIC_DAY	0	2	2012-06-23	910	\N	1516
8154	GENERIC_DAY	0	2	2010-03-27	910	\N	1516
8155	GENERIC_DAY	0	2	2012-06-05	914	\N	1516
8156	GENERIC_DAY	0	2	2013-04-18	914	\N	1516
8157	GENERIC_DAY	0	2	2012-06-29	914	\N	1516
8158	GENERIC_DAY	0	2	2011-05-05	912	\N	1516
8159	GENERIC_DAY	0	2	2010-08-22	912	\N	1516
8160	GENERIC_DAY	0	2	2012-08-03	912	\N	1516
8161	GENERIC_DAY	0	2	2011-01-26	910	\N	1516
8162	GENERIC_DAY	0	2	2012-06-11	914	\N	1516
8163	GENERIC_DAY	0	2	2012-11-13	912	\N	1516
8164	GENERIC_DAY	0	2	2012-06-04	914	\N	1516
8165	GENERIC_DAY	0	2	2010-03-27	912	\N	1516
8166	GENERIC_DAY	0	2	2012-08-06	910	\N	1516
8167	GENERIC_DAY	0	2	2010-12-25	914	\N	1516
8168	GENERIC_DAY	0	2	2012-07-15	912	\N	1516
8169	GENERIC_DAY	0	2	2010-10-21	914	\N	1516
8170	GENERIC_DAY	0	2	2011-05-21	912	\N	1516
8171	GENERIC_DAY	0	2	2012-11-24	910	\N	1516
8172	GENERIC_DAY	0	2	2012-05-21	914	\N	1516
8173	GENERIC_DAY	0	2	2012-01-13	916	\N	1516
8174	GENERIC_DAY	0	2	2010-10-09	914	\N	1516
8175	GENERIC_DAY	0	2	2012-05-04	910	\N	1516
8176	GENERIC_DAY	0	2	2010-11-25	912	\N	1516
8177	GENERIC_DAY	0	2	2010-02-04	916	\N	1516
8178	GENERIC_DAY	0	2	2012-05-18	916	\N	1516
8179	GENERIC_DAY	0	2	2013-03-10	916	\N	1516
8180	GENERIC_DAY	0	2	2012-05-22	912	\N	1516
8181	GENERIC_DAY	0	2	2010-09-03	912	\N	1516
8182	GENERIC_DAY	0	2	2011-11-21	916	\N	1516
8183	GENERIC_DAY	0	2	2011-03-21	914	\N	1516
8184	GENERIC_DAY	0	2	2011-03-23	912	\N	1516
8185	GENERIC_DAY	0	2	2010-06-26	914	\N	1516
8186	GENERIC_DAY	0	2	2012-09-17	916	\N	1516
8187	GENERIC_DAY	0	2	2013-03-05	912	\N	1516
8188	GENERIC_DAY	0	2	2010-08-18	916	\N	1516
8189	GENERIC_DAY	0	2	2011-02-01	910	\N	1516
8190	GENERIC_DAY	0	2	2012-02-23	914	\N	1516
8191	GENERIC_DAY	0	2	2012-08-22	914	\N	1516
8192	GENERIC_DAY	0	2	2012-03-14	910	\N	1516
8193	GENERIC_DAY	0	2	2011-11-02	916	\N	1516
8194	GENERIC_DAY	0	2	2012-08-15	910	\N	1516
8195	GENERIC_DAY	0	2	2010-03-23	912	\N	1516
8196	GENERIC_DAY	0	2	2013-02-28	910	\N	1516
8197	GENERIC_DAY	0	2	2013-04-19	912	\N	1516
8198	GENERIC_DAY	0	2	2012-04-07	912	\N	1516
8199	GENERIC_DAY	0	2	2010-02-04	910	\N	1516
8200	GENERIC_DAY	0	2	2011-08-13	916	\N	1516
8201	GENERIC_DAY	0	2	2011-03-31	912	\N	1516
8202	GENERIC_DAY	0	2	2011-05-10	914	\N	1516
8203	GENERIC_DAY	0	2	2012-01-17	912	\N	1516
8204	GENERIC_DAY	0	2	2010-09-18	910	\N	1516
8205	GENERIC_DAY	0	2	2009-12-11	914	\N	1516
8206	GENERIC_DAY	0	2	2010-01-04	912	\N	1516
8207	GENERIC_DAY	0	2	2010-01-17	910	\N	1516
8208	GENERIC_DAY	0	2	2010-03-17	910	\N	1516
8209	GENERIC_DAY	0	2	2011-09-05	912	\N	1516
8210	GENERIC_DAY	0	2	2012-11-04	916	\N	1516
8211	GENERIC_DAY	0	2	2010-08-08	914	\N	1516
8212	GENERIC_DAY	0	2	2011-12-04	912	\N	1516
8213	GENERIC_DAY	0	2	2010-01-23	912	\N	1516
8214	GENERIC_DAY	0	2	2013-02-03	916	\N	1516
8215	GENERIC_DAY	0	2	2010-09-13	910	\N	1516
8216	GENERIC_DAY	0	2	2010-06-11	916	\N	1516
8217	GENERIC_DAY	0	2	2013-04-27	914	\N	1516
8218	GENERIC_DAY	0	2	2011-09-04	912	\N	1516
8219	GENERIC_DAY	0	2	2010-02-21	916	\N	1516
8220	GENERIC_DAY	0	2	2012-04-22	912	\N	1516
8221	GENERIC_DAY	0	2	2011-06-30	916	\N	1516
8222	GENERIC_DAY	0	2	2010-05-01	912	\N	1516
8223	GENERIC_DAY	0	2	2012-03-28	910	\N	1516
8224	GENERIC_DAY	0	2	2011-04-20	910	\N	1516
8225	GENERIC_DAY	0	2	2010-11-13	910	\N	1516
8226	GENERIC_DAY	0	2	2010-08-01	914	\N	1516
8227	GENERIC_DAY	0	2	2009-12-21	912	\N	1516
8228	GENERIC_DAY	0	2	2011-05-08	912	\N	1516
8229	GENERIC_DAY	0	2	2011-12-26	912	\N	1516
8230	GENERIC_DAY	0	2	2011-06-18	910	\N	1516
8231	GENERIC_DAY	0	2	2012-03-31	916	\N	1516
8232	GENERIC_DAY	0	2	2011-06-16	914	\N	1516
8233	GENERIC_DAY	0	2	2012-10-14	916	\N	1516
8234	GENERIC_DAY	0	2	2012-01-05	916	\N	1516
8235	GENERIC_DAY	0	2	2011-01-07	914	\N	1516
8236	GENERIC_DAY	0	2	2009-12-30	914	\N	1516
8237	GENERIC_DAY	0	2	2011-12-29	912	\N	1516
8238	GENERIC_DAY	0	2	2011-03-07	916	\N	1516
8239	GENERIC_DAY	0	2	2011-12-14	916	\N	1516
8240	GENERIC_DAY	0	2	2012-08-12	914	\N	1516
8241	GENERIC_DAY	0	2	2010-05-13	910	\N	1516
8242	GENERIC_DAY	0	2	2011-01-09	916	\N	1516
8243	GENERIC_DAY	0	2	2011-10-08	910	\N	1516
8244	GENERIC_DAY	0	2	2013-03-04	916	\N	1516
8245	GENERIC_DAY	0	2	2010-02-14	914	\N	1516
8246	GENERIC_DAY	0	2	2010-02-26	914	\N	1516
8247	GENERIC_DAY	0	2	2013-04-18	912	\N	1516
8248	GENERIC_DAY	0	2	2010-03-01	912	\N	1516
8249	GENERIC_DAY	0	2	2011-10-03	910	\N	1516
8250	GENERIC_DAY	0	2	2012-04-13	914	\N	1516
8251	GENERIC_DAY	0	2	2012-04-11	914	\N	1516
8252	GENERIC_DAY	0	2	2010-11-18	916	\N	1516
8253	GENERIC_DAY	0	2	2011-12-26	916	\N	1516
8254	GENERIC_DAY	0	2	2011-03-06	910	\N	1516
8255	GENERIC_DAY	0	2	2010-10-13	912	\N	1516
8256	GENERIC_DAY	0	2	2010-08-12	914	\N	1516
8257	GENERIC_DAY	0	2	2012-08-23	912	\N	1516
8258	GENERIC_DAY	0	2	2012-05-10	914	\N	1516
8259	GENERIC_DAY	0	2	2010-10-07	910	\N	1516
8260	GENERIC_DAY	0	2	2011-04-11	912	\N	1516
8261	GENERIC_DAY	0	2	2010-04-15	912	\N	1516
8262	GENERIC_DAY	0	2	2013-02-09	916	\N	1516
8263	GENERIC_DAY	0	2	2010-07-09	914	\N	1516
8264	GENERIC_DAY	0	2	2012-06-05	910	\N	1516
8265	GENERIC_DAY	0	2	2011-05-23	916	\N	1516
8266	GENERIC_DAY	0	2	2013-02-25	914	\N	1516
8267	GENERIC_DAY	0	2	2010-12-03	916	\N	1516
8268	GENERIC_DAY	0	2	2011-11-24	916	\N	1516
8269	GENERIC_DAY	0	2	2012-12-31	910	\N	1516
8270	GENERIC_DAY	0	2	2012-06-16	912	\N	1516
8271	GENERIC_DAY	0	2	2011-10-24	914	\N	1516
8272	GENERIC_DAY	0	2	2011-06-14	914	\N	1516
8273	GENERIC_DAY	0	2	2012-09-15	912	\N	1516
8274	GENERIC_DAY	0	2	2012-10-08	914	\N	1516
8275	GENERIC_DAY	0	2	2011-08-14	910	\N	1516
8276	GENERIC_DAY	0	2	2011-12-22	914	\N	1516
8277	GENERIC_DAY	0	2	2011-04-05	912	\N	1516
8278	GENERIC_DAY	0	2	2013-02-17	914	\N	1516
8279	GENERIC_DAY	0	2	2010-06-27	910	\N	1516
8280	GENERIC_DAY	0	2	2012-10-14	910	\N	1516
8281	GENERIC_DAY	0	2	2012-03-19	914	\N	1516
8282	GENERIC_DAY	0	2	2010-05-06	912	\N	1516
8283	GENERIC_DAY	0	2	2012-02-25	912	\N	1516
8284	GENERIC_DAY	0	2	2012-09-25	912	\N	1516
8285	GENERIC_DAY	0	2	2013-02-14	910	\N	1516
8286	GENERIC_DAY	0	2	2011-09-07	916	\N	1516
8287	GENERIC_DAY	0	2	2010-03-03	914	\N	1516
8288	GENERIC_DAY	0	2	2012-08-11	914	\N	1516
8289	GENERIC_DAY	0	2	2012-09-09	916	\N	1516
8290	GENERIC_DAY	0	2	2011-01-24	916	\N	1516
8291	GENERIC_DAY	0	2	2012-08-11	916	\N	1516
8292	GENERIC_DAY	0	2	2012-09-06	910	\N	1516
8293	GENERIC_DAY	0	2	2012-11-21	912	\N	1516
8294	GENERIC_DAY	0	2	2012-04-07	910	\N	1516
8295	GENERIC_DAY	0	2	2012-07-19	910	\N	1516
8296	GENERIC_DAY	0	2	2010-10-18	910	\N	1516
8297	GENERIC_DAY	0	2	2011-11-06	910	\N	1516
8298	GENERIC_DAY	0	2	2013-05-04	910	\N	1516
8299	GENERIC_DAY	0	2	2010-08-29	916	\N	1516
8300	GENERIC_DAY	0	2	2011-08-20	914	\N	1516
8301	GENERIC_DAY	0	2	2012-05-24	914	\N	1516
8302	GENERIC_DAY	0	2	2012-03-17	912	\N	1516
8303	GENERIC_DAY	0	2	2011-07-13	914	\N	1516
8304	GENERIC_DAY	0	2	2011-03-27	910	\N	1516
8305	GENERIC_DAY	0	2	2010-05-20	914	\N	1516
8306	GENERIC_DAY	0	2	2013-01-03	910	\N	1516
8307	GENERIC_DAY	0	2	2010-09-14	914	\N	1516
8308	GENERIC_DAY	0	2	2011-07-10	916	\N	1516
8309	GENERIC_DAY	0	2	2012-05-16	910	\N	1516
8310	GENERIC_DAY	0	2	2013-01-26	916	\N	1516
8311	GENERIC_DAY	0	2	2010-08-31	910	\N	1516
8312	GENERIC_DAY	0	2	2012-06-20	910	\N	1516
8313	GENERIC_DAY	0	2	2013-03-15	912	\N	1516
8314	GENERIC_DAY	0	2	2012-06-07	916	\N	1516
8315	GENERIC_DAY	0	2	2012-07-20	910	\N	1516
8316	GENERIC_DAY	0	2	2012-11-04	912	\N	1516
8317	GENERIC_DAY	0	2	2012-08-29	914	\N	1516
8318	GENERIC_DAY	0	2	2011-02-09	910	\N	1516
8319	GENERIC_DAY	0	2	2013-03-14	916	\N	1516
8320	GENERIC_DAY	0	2	2012-12-04	916	\N	1516
8321	GENERIC_DAY	0	2	2010-02-22	910	\N	1516
8322	GENERIC_DAY	0	2	2010-05-10	916	\N	1516
8323	GENERIC_DAY	0	2	2011-10-15	914	\N	1516
8324	GENERIC_DAY	0	2	2012-01-04	912	\N	1516
8325	GENERIC_DAY	0	2	2010-07-05	914	\N	1516
8326	GENERIC_DAY	0	2	2010-04-28	916	\N	1516
8327	GENERIC_DAY	0	2	2010-10-03	916	\N	1516
8328	GENERIC_DAY	0	2	2012-12-22	914	\N	1516
8329	GENERIC_DAY	0	2	2012-02-24	914	\N	1516
8330	GENERIC_DAY	0	2	2009-12-10	912	\N	1516
8331	GENERIC_DAY	0	2	2010-12-24	916	\N	1516
8332	GENERIC_DAY	0	2	2011-10-26	914	\N	1516
8333	GENERIC_DAY	0	2	2012-06-20	916	\N	1516
8334	GENERIC_DAY	0	2	2010-11-14	916	\N	1516
8335	GENERIC_DAY	0	2	2011-02-14	916	\N	1516
8336	GENERIC_DAY	0	2	2013-01-18	912	\N	1516
8337	GENERIC_DAY	0	2	2011-01-02	912	\N	1516
8338	GENERIC_DAY	0	2	2012-08-05	914	\N	1516
8339	GENERIC_DAY	0	2	2011-06-25	910	\N	1516
8340	GENERIC_DAY	0	2	2011-02-28	910	\N	1516
8341	GENERIC_DAY	0	2	2011-07-04	914	\N	1516
8342	GENERIC_DAY	0	2	2012-01-07	916	\N	1516
8343	GENERIC_DAY	0	2	2011-07-31	912	\N	1516
8344	GENERIC_DAY	0	2	2012-12-05	912	\N	1516
8345	GENERIC_DAY	0	2	2010-01-05	914	\N	1516
8346	GENERIC_DAY	0	2	2012-11-01	910	\N	1516
8347	GENERIC_DAY	0	2	2013-01-29	912	\N	1516
8348	GENERIC_DAY	0	2	2010-11-28	910	\N	1516
8349	GENERIC_DAY	0	2	2012-12-20	916	\N	1516
8350	GENERIC_DAY	0	2	2012-12-28	912	\N	1516
8351	GENERIC_DAY	0	2	2011-07-05	916	\N	1516
8352	GENERIC_DAY	0	2	2011-10-06	912	\N	1516
8353	GENERIC_DAY	0	2	2011-10-02	916	\N	1516
8354	GENERIC_DAY	0	2	2010-01-04	914	\N	1516
8355	GENERIC_DAY	0	2	2011-03-06	914	\N	1516
8356	GENERIC_DAY	0	2	2011-03-01	914	\N	1516
8357	GENERIC_DAY	0	2	2012-08-14	910	\N	1516
8358	GENERIC_DAY	0	2	2012-10-11	916	\N	1516
8359	GENERIC_DAY	0	2	2013-04-16	912	\N	1516
8360	GENERIC_DAY	0	2	2011-04-20	912	\N	1516
8361	GENERIC_DAY	0	2	2010-12-27	912	\N	1516
8362	GENERIC_DAY	0	2	2010-04-30	912	\N	1516
8363	GENERIC_DAY	0	2	2012-09-07	914	\N	1516
8364	GENERIC_DAY	0	2	2013-03-16	914	\N	1516
8365	GENERIC_DAY	0	2	2013-03-01	912	\N	1516
8366	GENERIC_DAY	0	2	2012-11-05	916	\N	1516
8367	GENERIC_DAY	0	2	2012-11-24	912	\N	1516
8368	GENERIC_DAY	0	2	2010-09-12	910	\N	1516
8369	GENERIC_DAY	0	2	2010-01-16	910	\N	1516
8370	GENERIC_DAY	0	2	2011-12-29	914	\N	1516
8371	GENERIC_DAY	0	2	2012-09-21	912	\N	1516
8372	GENERIC_DAY	0	2	2010-04-23	912	\N	1516
8373	GENERIC_DAY	0	2	2011-06-07	914	\N	1516
8374	GENERIC_DAY	0	2	2011-08-08	914	\N	1516
8375	GENERIC_DAY	0	2	2010-11-12	916	\N	1516
8376	GENERIC_DAY	0	2	2011-05-15	916	\N	1516
8377	GENERIC_DAY	0	2	2012-05-26	910	\N	1516
8378	GENERIC_DAY	0	2	2012-04-03	910	\N	1516
8379	GENERIC_DAY	0	2	2012-01-10	912	\N	1516
8380	GENERIC_DAY	0	2	2010-07-18	916	\N	1516
8381	GENERIC_DAY	0	2	2010-01-13	914	\N	1516
8382	GENERIC_DAY	0	2	2010-06-10	914	\N	1516
8383	GENERIC_DAY	0	2	2012-05-07	912	\N	1516
8384	GENERIC_DAY	0	2	2010-10-23	916	\N	1516
8385	GENERIC_DAY	0	2	2010-08-19	912	\N	1516
8386	GENERIC_DAY	0	2	2013-02-28	914	\N	1516
8387	GENERIC_DAY	0	2	2011-11-16	916	\N	1516
8388	GENERIC_DAY	0	2	2011-08-07	914	\N	1516
8389	GENERIC_DAY	0	2	2011-08-19	912	\N	1516
8390	GENERIC_DAY	0	2	2012-02-14	916	\N	1516
8391	GENERIC_DAY	0	2	2011-08-11	914	\N	1516
8392	GENERIC_DAY	0	2	2010-01-10	912	\N	1516
8393	GENERIC_DAY	0	2	2012-02-07	914	\N	1516
8394	GENERIC_DAY	0	2	2011-08-23	914	\N	1516
8395	GENERIC_DAY	0	2	2011-12-23	916	\N	1516
8396	GENERIC_DAY	0	2	2010-11-06	914	\N	1516
8397	GENERIC_DAY	0	2	2011-02-13	910	\N	1516
8398	GENERIC_DAY	0	2	2013-02-05	912	\N	1516
8399	GENERIC_DAY	0	2	2012-02-05	910	\N	1516
8400	GENERIC_DAY	0	2	2011-09-14	910	\N	1516
8401	GENERIC_DAY	0	2	2010-10-07	914	\N	1516
8402	GENERIC_DAY	0	2	2011-10-04	910	\N	1516
8403	GENERIC_DAY	0	2	2012-06-18	916	\N	1516
8404	GENERIC_DAY	0	2	2013-01-11	916	\N	1516
8405	GENERIC_DAY	0	2	2010-07-24	914	\N	1516
8406	GENERIC_DAY	0	2	2010-03-16	910	\N	1516
8407	GENERIC_DAY	0	2	2011-09-28	910	\N	1516
8408	GENERIC_DAY	0	2	2012-08-30	914	\N	1516
8409	GENERIC_DAY	0	2	2011-09-18	910	\N	1516
8410	GENERIC_DAY	0	2	2013-01-21	916	\N	1516
8411	GENERIC_DAY	0	2	2012-10-09	912	\N	1516
8412	GENERIC_DAY	0	2	2012-05-25	912	\N	1516
8413	GENERIC_DAY	0	2	2011-05-16	910	\N	1516
8414	GENERIC_DAY	0	2	2013-02-23	912	\N	1516
8415	GENERIC_DAY	0	2	2012-08-09	914	\N	1516
8416	GENERIC_DAY	0	2	2010-02-24	914	\N	1516
8417	GENERIC_DAY	0	2	2010-01-21	910	\N	1516
8418	GENERIC_DAY	0	2	2012-12-31	914	\N	1516
8419	GENERIC_DAY	0	2	2010-12-31	912	\N	1516
8420	GENERIC_DAY	0	2	2010-02-23	910	\N	1516
8421	GENERIC_DAY	0	2	2011-06-27	912	\N	1516
8422	GENERIC_DAY	0	2	2011-10-30	914	\N	1516
8423	GENERIC_DAY	0	2	2011-07-11	916	\N	1516
8424	GENERIC_DAY	0	2	2013-02-19	910	\N	1516
8425	GENERIC_DAY	0	2	2012-12-14	912	\N	1516
8426	GENERIC_DAY	0	2	2010-12-06	914	\N	1516
8427	GENERIC_DAY	0	2	2010-11-22	914	\N	1516
8428	GENERIC_DAY	0	2	2011-06-19	916	\N	1516
8429	GENERIC_DAY	0	2	2013-01-10	916	\N	1516
8430	GENERIC_DAY	0	2	2013-02-26	914	\N	1516
8431	GENERIC_DAY	0	2	2012-12-25	910	\N	1516
8432	GENERIC_DAY	0	2	2013-04-24	914	\N	1516
8433	GENERIC_DAY	0	2	2012-01-23	910	\N	1516
8434	GENERIC_DAY	0	2	2011-05-10	912	\N	1516
8435	GENERIC_DAY	0	2	2010-02-07	910	\N	1516
8436	GENERIC_DAY	0	2	2010-06-09	914	\N	1516
8437	GENERIC_DAY	0	2	2013-02-17	916	\N	1516
8438	GENERIC_DAY	0	2	2012-12-12	910	\N	1516
8439	GENERIC_DAY	0	2	2010-05-28	910	\N	1516
8440	GENERIC_DAY	0	2	2012-09-13	916	\N	1516
8441	GENERIC_DAY	0	2	2011-12-14	914	\N	1516
8442	GENERIC_DAY	0	2	2012-11-06	912	\N	1516
8443	GENERIC_DAY	0	2	2011-11-06	912	\N	1516
8444	GENERIC_DAY	0	2	2012-03-18	912	\N	1516
8445	GENERIC_DAY	0	2	2010-11-29	916	\N	1516
8446	GENERIC_DAY	0	2	2013-01-24	916	\N	1516
8447	GENERIC_DAY	0	2	2011-08-29	910	\N	1516
8448	GENERIC_DAY	0	2	2011-12-28	912	\N	1516
8449	GENERIC_DAY	0	2	2012-01-12	910	\N	1516
8450	GENERIC_DAY	0	2	2010-05-04	910	\N	1516
8451	GENERIC_DAY	0	2	2011-07-20	916	\N	1516
8452	GENERIC_DAY	0	2	2010-06-08	912	\N	1516
8453	GENERIC_DAY	0	2	2013-03-14	914	\N	1516
8454	GENERIC_DAY	0	2	2010-12-09	914	\N	1516
8455	GENERIC_DAY	0	2	2010-12-20	910	\N	1516
8456	GENERIC_DAY	0	2	2013-01-05	910	\N	1516
8457	GENERIC_DAY	0	2	2013-03-06	912	\N	1516
8458	GENERIC_DAY	0	2	2011-08-01	914	\N	1516
8459	GENERIC_DAY	0	2	2012-12-05	914	\N	1516
8460	GENERIC_DAY	0	2	2011-07-11	910	\N	1516
8461	GENERIC_DAY	0	2	2013-04-02	910	\N	1516
8462	GENERIC_DAY	0	2	2010-09-06	912	\N	1516
8463	GENERIC_DAY	0	2	2013-02-07	916	\N	1516
8464	GENERIC_DAY	0	2	2011-08-22	916	\N	1516
8465	GENERIC_DAY	0	2	2012-06-23	912	\N	1516
8466	GENERIC_DAY	0	2	2012-04-12	916	\N	1516
8467	GENERIC_DAY	0	2	2010-01-03	912	\N	1516
8468	GENERIC_DAY	0	2	2011-04-11	916	\N	1516
8469	GENERIC_DAY	0	2	2011-05-16	914	\N	1516
8470	GENERIC_DAY	0	2	2012-04-08	916	\N	1516
8471	GENERIC_DAY	0	2	2009-12-21	914	\N	1516
8472	GENERIC_DAY	0	2	2012-08-17	912	\N	1516
8473	GENERIC_DAY	0	2	2012-03-14	916	\N	1516
8474	GENERIC_DAY	0	2	2011-11-28	912	\N	1516
8475	GENERIC_DAY	0	2	2013-03-28	910	\N	1516
8476	GENERIC_DAY	0	2	2012-01-21	912	\N	1516
8477	GENERIC_DAY	0	2	2012-09-03	916	\N	1516
8478	GENERIC_DAY	0	2	2010-03-18	914	\N	1516
8479	GENERIC_DAY	0	2	2011-01-27	910	\N	1516
8480	GENERIC_DAY	0	2	2011-11-25	912	\N	1516
8481	GENERIC_DAY	0	2	2010-05-29	914	\N	1516
8482	GENERIC_DAY	0	2	2011-07-24	910	\N	1516
8483	GENERIC_DAY	0	2	2012-07-31	912	\N	1516
8484	GENERIC_DAY	0	2	2010-05-12	910	\N	1516
8485	GENERIC_DAY	0	2	2012-01-16	916	\N	1516
8486	GENERIC_DAY	0	0	2009-12-25	914	\N	1516
8487	GENERIC_DAY	0	2	2011-04-12	914	\N	1516
8488	GENERIC_DAY	0	2	2011-04-03	912	\N	1516
8489	GENERIC_DAY	0	2	2012-06-06	914	\N	1516
8490	GENERIC_DAY	0	2	2010-06-06	912	\N	1516
8491	GENERIC_DAY	0	2	2012-10-31	916	\N	1516
8492	GENERIC_DAY	0	2	2011-05-17	910	\N	1516
8493	GENERIC_DAY	0	2	2011-06-10	916	\N	1516
8494	GENERIC_DAY	0	2	2011-08-17	916	\N	1516
8495	GENERIC_DAY	0	2	2011-02-25	914	\N	1516
8496	GENERIC_DAY	0	2	2012-12-03	914	\N	1516
8497	GENERIC_DAY	0	2	2010-07-02	916	\N	1516
8498	GENERIC_DAY	0	2	2009-12-13	912	\N	1516
8499	GENERIC_DAY	0	2	2011-03-14	912	\N	1516
8500	GENERIC_DAY	0	2	2012-11-01	912	\N	1516
8501	GENERIC_DAY	0	2	2011-12-17	910	\N	1516
8502	GENERIC_DAY	0	2	2010-03-21	910	\N	1516
8503	GENERIC_DAY	0	2	2010-06-20	914	\N	1516
8504	GENERIC_DAY	0	2	2010-02-18	916	\N	1516
8505	GENERIC_DAY	0	2	2011-04-04	910	\N	1516
8506	GENERIC_DAY	0	2	2012-01-06	912	\N	1516
8507	GENERIC_DAY	0	2	2010-03-09	912	\N	1516
8508	GENERIC_DAY	0	2	2011-11-04	910	\N	1516
8509	GENERIC_DAY	0	2	2011-09-27	912	\N	1516
8510	GENERIC_DAY	0	2	2012-08-14	916	\N	1516
8511	GENERIC_DAY	0	2	2010-02-10	910	\N	1516
8512	GENERIC_DAY	0	2	2011-03-10	912	\N	1516
8513	GENERIC_DAY	0	2	2011-12-19	916	\N	1516
8514	GENERIC_DAY	0	2	2013-03-01	914	\N	1516
8515	GENERIC_DAY	0	2	2010-04-12	912	\N	1516
8516	GENERIC_DAY	0	2	2012-10-18	910	\N	1516
8517	GENERIC_DAY	0	2	2012-06-29	910	\N	1516
8518	GENERIC_DAY	0	2	2011-10-08	916	\N	1516
8519	GENERIC_DAY	0	2	2010-07-09	912	\N	1516
8520	GENERIC_DAY	0	2	2009-12-19	916	\N	1516
8521	GENERIC_DAY	0	2	2011-05-08	910	\N	1516
8522	GENERIC_DAY	0	2	2010-12-17	912	\N	1516
8523	GENERIC_DAY	0	2	2012-07-23	910	\N	1516
8524	GENERIC_DAY	0	2	2010-07-27	916	\N	1516
8525	GENERIC_DAY	0	2	2010-03-10	910	\N	1516
8526	GENERIC_DAY	0	2	2012-04-10	914	\N	1516
8527	GENERIC_DAY	0	2	2010-10-02	914	\N	1516
8528	GENERIC_DAY	0	2	2011-12-09	914	\N	1516
8529	GENERIC_DAY	0	2	2010-04-17	912	\N	1516
8530	GENERIC_DAY	0	2	2011-08-26	912	\N	1516
8531	GENERIC_DAY	0	2	2010-02-16	910	\N	1516
8532	GENERIC_DAY	0	2	2011-07-07	914	\N	1516
8533	GENERIC_DAY	0	2	2011-03-19	914	\N	1516
8534	GENERIC_DAY	0	2	2013-04-09	914	\N	1516
8535	GENERIC_DAY	0	2	2011-01-05	914	\N	1516
8536	GENERIC_DAY	0	2	2011-06-08	914	\N	1516
8537	GENERIC_DAY	0	2	2013-01-17	912	\N	1516
8538	GENERIC_DAY	0	2	2010-07-02	912	\N	1516
8539	GENERIC_DAY	0	2	2010-10-18	912	\N	1516
8540	GENERIC_DAY	0	2	2013-04-06	916	\N	1516
8541	GENERIC_DAY	0	2	2010-03-06	912	\N	1516
8542	GENERIC_DAY	0	2	2011-07-23	916	\N	1516
8543	GENERIC_DAY	0	2	2010-03-03	916	\N	1516
8544	GENERIC_DAY	0	2	2012-05-29	914	\N	1516
8545	GENERIC_DAY	0	2	2011-11-27	912	\N	1516
8546	GENERIC_DAY	0	2	2011-09-01	914	\N	1516
8547	GENERIC_DAY	0	2	2011-01-17	914	\N	1516
8548	GENERIC_DAY	0	2	2012-12-20	910	\N	1516
8549	GENERIC_DAY	0	2	2010-05-22	912	\N	1516
8550	GENERIC_DAY	0	2	2012-06-11	916	\N	1516
8551	GENERIC_DAY	0	2	2011-10-01	916	\N	1516
8552	GENERIC_DAY	0	2	2011-12-28	914	\N	1516
8553	GENERIC_DAY	0	2	2012-11-07	916	\N	1516
8554	GENERIC_DAY	0	2	2010-11-05	910	\N	1516
8555	GENERIC_DAY	0	2	2010-11-02	916	\N	1516
8556	GENERIC_DAY	0	2	2011-06-03	910	\N	1516
8557	GENERIC_DAY	0	2	2010-11-08	912	\N	1516
8558	GENERIC_DAY	0	2	2010-03-06	914	\N	1516
8559	GENERIC_DAY	0	2	2011-10-17	914	\N	1516
8560	GENERIC_DAY	0	2	2010-12-08	910	\N	1516
8561	GENERIC_DAY	0	2	2012-11-21	910	\N	1516
8562	GENERIC_DAY	0	2	2012-01-02	916	\N	1516
8563	GENERIC_DAY	0	2	2010-04-24	916	\N	1516
8564	GENERIC_DAY	0	2	2013-01-02	914	\N	1516
8565	GENERIC_DAY	0	2	2011-04-23	910	\N	1516
8566	GENERIC_DAY	0	2	2012-12-22	916	\N	1516
8567	GENERIC_DAY	0	2	2011-09-27	916	\N	1516
8568	GENERIC_DAY	0	2	2011-03-17	914	\N	1516
8569	GENERIC_DAY	0	2	2011-04-04	912	\N	1516
8570	GENERIC_DAY	0	2	2013-04-25	912	\N	1516
8571	GENERIC_DAY	0	2	2010-07-27	914	\N	1516
8572	GENERIC_DAY	0	2	2010-01-26	914	\N	1516
8573	GENERIC_DAY	0	2	2011-09-27	910	\N	1516
8574	GENERIC_DAY	0	2	2012-12-16	912	\N	1516
8575	GENERIC_DAY	0	2	2010-03-24	912	\N	1516
8576	GENERIC_DAY	0	2	2012-06-03	912	\N	1516
8577	GENERIC_DAY	0	2	2010-12-05	910	\N	1516
8578	GENERIC_DAY	0	2	2013-02-04	912	\N	1516
8579	GENERIC_DAY	0	2	2011-11-11	912	\N	1516
8580	GENERIC_DAY	0	2	2013-03-25	914	\N	1516
8581	GENERIC_DAY	0	2	2010-01-16	916	\N	1516
8582	GENERIC_DAY	0	2	2012-11-08	914	\N	1516
8583	GENERIC_DAY	0	2	2011-05-02	910	\N	1516
8584	GENERIC_DAY	0	2	2010-11-24	914	\N	1516
8585	GENERIC_DAY	0	2	2011-08-05	910	\N	1516
8586	GENERIC_DAY	0	2	2012-11-18	914	\N	1516
8587	GENERIC_DAY	0	2	2010-09-24	912	\N	1516
8588	GENERIC_DAY	0	2	2012-10-30	916	\N	1516
8589	GENERIC_DAY	0	2	2011-01-28	912	\N	1516
8590	GENERIC_DAY	0	2	2012-12-12	916	\N	1516
8591	GENERIC_DAY	0	2	2010-02-10	912	\N	1516
8592	GENERIC_DAY	0	2	2010-05-14	910	\N	1516
8593	GENERIC_DAY	0	2	2011-11-29	914	\N	1516
8594	GENERIC_DAY	0	2	2010-05-07	910	\N	1516
8595	GENERIC_DAY	0	2	2012-06-14	914	\N	1516
8596	GENERIC_DAY	0	2	2012-05-19	910	\N	1516
8597	GENERIC_DAY	0	2	2010-06-03	912	\N	1516
8598	GENERIC_DAY	0	2	2010-06-11	910	\N	1516
8599	GENERIC_DAY	0	2	2011-08-21	914	\N	1516
8600	GENERIC_DAY	0	2	2012-08-08	910	\N	1516
8601	GENERIC_DAY	0	2	2012-10-31	912	\N	1516
8602	GENERIC_DAY	0	2	2012-01-27	910	\N	1516
8603	GENERIC_DAY	0	2	2010-12-02	910	\N	1516
8604	GENERIC_DAY	0	2	2010-07-20	912	\N	1516
8605	GENERIC_DAY	0	2	2013-03-30	912	\N	1516
8606	GENERIC_DAY	0	2	2011-01-24	910	\N	1516
8607	GENERIC_DAY	0	2	2012-03-13	912	\N	1516
8608	GENERIC_DAY	0	2	2011-05-06	910	\N	1516
8609	GENERIC_DAY	0	2	2013-03-11	912	\N	1516
8610	GENERIC_DAY	0	2	2012-06-17	912	\N	1516
8611	GENERIC_DAY	0	2	2011-03-01	912	\N	1516
8612	GENERIC_DAY	0	2	2010-08-25	910	\N	1516
8613	GENERIC_DAY	0	2	2010-12-26	914	\N	1516
8614	GENERIC_DAY	0	2	2011-07-03	914	\N	1516
8615	GENERIC_DAY	0	2	2010-04-23	914	\N	1516
8616	GENERIC_DAY	0	2	2012-07-21	914	\N	1516
8617	GENERIC_DAY	0	2	2011-08-05	912	\N	1516
8618	GENERIC_DAY	0	2	2011-10-18	914	\N	1516
8619	GENERIC_DAY	0	2	2012-03-21	912	\N	1516
8620	GENERIC_DAY	0	2	2011-09-02	912	\N	1516
8621	GENERIC_DAY	0	2	2011-12-17	914	\N	1516
8622	GENERIC_DAY	0	2	2009-12-18	910	\N	1516
8623	GENERIC_DAY	0	2	2011-11-25	916	\N	1516
8624	GENERIC_DAY	0	2	2010-12-21	914	\N	1516
8625	GENERIC_DAY	0	2	2010-01-30	916	\N	1516
8626	GENERIC_DAY	0	2	2010-05-22	910	\N	1516
8627	GENERIC_DAY	0	2	2011-09-02	916	\N	1516
8628	GENERIC_DAY	0	2	2012-07-13	912	\N	1516
8629	GENERIC_DAY	0	2	2010-02-11	912	\N	1516
8630	GENERIC_DAY	0	2	2011-04-17	914	\N	1516
8631	GENERIC_DAY	0	2	2011-07-13	912	\N	1516
8632	GENERIC_DAY	0	2	2010-05-11	912	\N	1516
8633	GENERIC_DAY	0	2	2011-06-29	912	\N	1516
8634	GENERIC_DAY	0	2	2010-04-13	914	\N	1516
8635	GENERIC_DAY	0	2	2010-10-21	916	\N	1516
8636	GENERIC_DAY	0	2	2011-07-12	910	\N	1516
8637	GENERIC_DAY	0	2	2011-09-09	916	\N	1516
8638	GENERIC_DAY	0	2	2010-03-06	910	\N	1516
8639	GENERIC_DAY	0	2	2011-10-10	910	\N	1516
8640	GENERIC_DAY	0	2	2013-02-27	916	\N	1516
8641	GENERIC_DAY	0	2	2012-11-15	910	\N	1516
8642	GENERIC_DAY	0	2	2012-02-26	910	\N	1516
8643	GENERIC_DAY	0	2	2010-09-15	910	\N	1516
8644	GENERIC_DAY	0	2	2010-05-10	912	\N	1516
8645	GENERIC_DAY	0	2	2012-05-11	914	\N	1516
8646	GENERIC_DAY	0	2	2011-02-06	914	\N	1516
8647	GENERIC_DAY	0	2	2010-06-15	910	\N	1516
8648	GENERIC_DAY	0	2	2011-03-11	912	\N	1516
8649	GENERIC_DAY	0	2	2011-12-12	910	\N	1516
8650	GENERIC_DAY	0	2	2011-07-09	912	\N	1516
8651	GENERIC_DAY	0	2	2010-07-26	914	\N	1516
8652	GENERIC_DAY	0	2	2012-05-20	912	\N	1516
8653	GENERIC_DAY	0	2	2013-01-04	912	\N	1516
8654	GENERIC_DAY	0	2	2012-11-11	910	\N	1516
8655	GENERIC_DAY	0	2	2011-04-29	910	\N	1516
8656	GENERIC_DAY	0	2	2011-11-23	916	\N	1516
8657	GENERIC_DAY	0	2	2010-07-12	916	\N	1516
8658	GENERIC_DAY	0	2	2011-09-25	912	\N	1516
8659	GENERIC_DAY	0	2	2013-03-28	916	\N	1516
8660	GENERIC_DAY	0	2	2011-05-15	912	\N	1516
8661	GENERIC_DAY	0	2	2012-09-08	912	\N	1516
8662	GENERIC_DAY	0	2	2010-05-18	914	\N	1516
8663	GENERIC_DAY	0	2	2011-05-24	916	\N	1516
8664	GENERIC_DAY	0	2	2011-06-24	912	\N	1516
8665	GENERIC_DAY	0	2	2010-06-07	912	\N	1516
8666	GENERIC_DAY	0	2	2011-03-13	914	\N	1516
8667	GENERIC_DAY	0	2	2013-04-30	916	\N	1516
8668	GENERIC_DAY	0	2	2010-10-02	916	\N	1516
8669	GENERIC_DAY	0	2	2010-02-07	914	\N	1516
8670	GENERIC_DAY	0	2	2013-05-09	910	\N	1516
8671	GENERIC_DAY	0	2	2012-05-26	912	\N	1516
8672	GENERIC_DAY	0	2	2010-02-04	912	\N	1516
8673	GENERIC_DAY	0	2	2012-12-31	916	\N	1516
8674	GENERIC_DAY	0	2	2012-12-31	912	\N	1516
8675	GENERIC_DAY	0	2	2011-06-29	916	\N	1516
8676	GENERIC_DAY	0	2	2010-05-30	912	\N	1516
8677	GENERIC_DAY	0	2	2012-11-22	914	\N	1516
8678	GENERIC_DAY	0	2	2010-11-18	910	\N	1516
8679	GENERIC_DAY	0	2	2010-05-08	916	\N	1516
8680	GENERIC_DAY	0	2	2011-06-11	912	\N	1516
8681	GENERIC_DAY	0	2	2012-09-09	910	\N	1516
8682	GENERIC_DAY	0	2	2012-07-16	916	\N	1516
8683	GENERIC_DAY	0	2	2010-04-04	916	\N	1516
8684	GENERIC_DAY	0	2	2013-04-01	912	\N	1516
8685	GENERIC_DAY	0	2	2011-11-22	912	\N	1516
8686	GENERIC_DAY	0	2	2011-04-18	914	\N	1516
8687	GENERIC_DAY	0	2	2010-12-08	912	\N	1516
8688	GENERIC_DAY	0	2	2013-01-21	910	\N	1516
8689	GENERIC_DAY	0	2	2010-10-08	916	\N	1516
8690	GENERIC_DAY	0	2	2010-04-10	910	\N	1516
8691	GENERIC_DAY	0	2	2010-11-24	912	\N	1516
8692	GENERIC_DAY	0	2	2012-02-23	912	\N	1516
8693	GENERIC_DAY	0	2	2010-10-12	910	\N	1516
8694	GENERIC_DAY	0	2	2010-09-18	914	\N	1516
8695	GENERIC_DAY	0	2	2011-07-24	912	\N	1516
8696	GENERIC_DAY	0	2	2009-12-15	916	\N	1516
8697	GENERIC_DAY	0	2	2011-03-01	916	\N	1516
8698	GENERIC_DAY	0	2	2013-01-06	912	\N	1516
8699	GENERIC_DAY	0	2	2012-07-26	916	\N	1516
8700	GENERIC_DAY	0	2	2010-08-27	910	\N	1516
8701	GENERIC_DAY	0	2	2012-06-09	910	\N	1516
8702	GENERIC_DAY	0	2	2010-06-04	914	\N	1516
8703	GENERIC_DAY	0	2	2011-03-20	914	\N	1516
8704	GENERIC_DAY	0	2	2012-01-23	912	\N	1516
8705	GENERIC_DAY	0	2	2011-07-06	916	\N	1516
8706	GENERIC_DAY	0	2	2011-11-30	910	\N	1516
8707	GENERIC_DAY	0	2	2012-12-24	910	\N	1516
8708	GENERIC_DAY	0	2	2012-05-13	914	\N	1516
8709	GENERIC_DAY	0	2	2012-04-04	910	\N	1516
8710	GENERIC_DAY	0	2	2012-10-27	912	\N	1516
8711	GENERIC_DAY	0	2	2012-02-25	916	\N	1516
8712	GENERIC_DAY	0	2	2010-01-02	910	\N	1516
8713	GENERIC_DAY	0	2	2011-07-17	916	\N	1516
8714	GENERIC_DAY	0	2	2013-05-06	912	\N	1516
8715	GENERIC_DAY	0	2	2010-03-22	910	\N	1516
8716	GENERIC_DAY	0	2	2010-03-24	914	\N	1516
8717	GENERIC_DAY	0	2	2010-04-27	912	\N	1516
8718	GENERIC_DAY	0	2	2011-07-04	916	\N	1516
8719	GENERIC_DAY	0	2	2010-03-23	916	\N	1516
8720	GENERIC_DAY	0	2	2011-01-27	916	\N	1516
8721	GENERIC_DAY	0	2	2010-10-25	916	\N	1516
8722	GENERIC_DAY	0	2	2012-04-02	914	\N	1516
8723	GENERIC_DAY	0	2	2012-02-27	914	\N	1516
8724	GENERIC_DAY	0	2	2010-01-23	914	\N	1516
8725	GENERIC_DAY	0	2	2012-01-08	910	\N	1516
8726	GENERIC_DAY	0	2	2009-12-13	910	\N	1516
8727	GENERIC_DAY	0	2	2011-05-21	910	\N	1516
8728	GENERIC_DAY	0	2	2009-12-26	914	\N	1516
8729	GENERIC_DAY	0	2	2011-05-09	912	\N	1516
8730	GENERIC_DAY	0	2	2012-08-28	912	\N	1516
8731	GENERIC_DAY	0	2	2011-08-30	914	\N	1516
8732	GENERIC_DAY	0	2	2011-07-25	914	\N	1516
8733	GENERIC_DAY	0	2	2012-02-08	912	\N	1516
8734	GENERIC_DAY	0	2	2010-03-31	912	\N	1516
8735	GENERIC_DAY	0	2	2013-02-20	912	\N	1516
8736	GENERIC_DAY	0	2	2011-09-26	912	\N	1516
8737	GENERIC_DAY	0	2	2010-11-03	910	\N	1516
8738	GENERIC_DAY	0	2	2012-04-30	916	\N	1516
8739	GENERIC_DAY	0	2	2010-05-20	912	\N	1516
8740	GENERIC_DAY	0	2	2011-06-15	910	\N	1516
8741	GENERIC_DAY	0	2	2011-03-10	916	\N	1516
8742	GENERIC_DAY	0	2	2010-03-29	914	\N	1516
8743	GENERIC_DAY	0	2	2011-07-15	912	\N	1516
8744	GENERIC_DAY	0	2	2011-09-13	910	\N	1516
8745	GENERIC_DAY	0	2	2010-04-20	916	\N	1516
8746	GENERIC_DAY	0	2	2011-06-30	914	\N	1516
8747	GENERIC_DAY	0	2	2011-06-26	912	\N	1516
8748	GENERIC_DAY	0	2	2011-03-18	914	\N	1516
8749	GENERIC_DAY	0	2	2011-07-09	910	\N	1516
8750	GENERIC_DAY	0	2	2012-01-26	912	\N	1516
8751	GENERIC_DAY	0	2	2010-08-20	916	\N	1516
8752	GENERIC_DAY	0	2	2011-03-10	910	\N	1516
8753	GENERIC_DAY	0	2	2010-01-03	916	\N	1516
8754	GENERIC_DAY	0	2	2011-08-18	916	\N	1516
8755	GENERIC_DAY	0	2	2010-05-21	910	\N	1516
8756	GENERIC_DAY	0	2	2012-10-15	910	\N	1516
8757	GENERIC_DAY	0	2	2012-09-19	912	\N	1516
8758	GENERIC_DAY	0	2	2010-10-26	912	\N	1516
8759	GENERIC_DAY	0	2	2012-12-09	916	\N	1516
8760	GENERIC_DAY	0	2	2010-01-06	916	\N	1516
8761	GENERIC_DAY	0	2	2011-05-30	916	\N	1516
8762	GENERIC_DAY	0	2	2012-07-28	914	\N	1516
8763	GENERIC_DAY	0	2	2012-01-11	916	\N	1516
8764	GENERIC_DAY	0	2	2011-04-21	916	\N	1516
8765	GENERIC_DAY	0	2	2011-04-30	910	\N	1516
8766	GENERIC_DAY	0	2	2011-04-01	914	\N	1516
8767	GENERIC_DAY	0	2	2011-04-09	910	\N	1516
8768	GENERIC_DAY	0	2	2013-04-14	916	\N	1516
8769	GENERIC_DAY	0	2	2012-07-25	910	\N	1516
8770	GENERIC_DAY	0	2	2012-08-11	910	\N	1516
8771	GENERIC_DAY	0	2	2010-12-23	916	\N	1516
8772	GENERIC_DAY	0	2	2011-01-09	910	\N	1516
8773	GENERIC_DAY	0	2	2011-05-17	914	\N	1516
8774	GENERIC_DAY	0	2	2011-12-25	914	\N	1516
8775	GENERIC_DAY	0	2	2011-03-26	914	\N	1516
8776	GENERIC_DAY	0	2	2012-04-23	914	\N	1516
8777	GENERIC_DAY	0	2	2011-11-27	916	\N	1516
8778	GENERIC_DAY	0	2	2013-01-01	916	\N	1516
8779	GENERIC_DAY	0	2	2010-07-19	912	\N	1516
8780	GENERIC_DAY	0	2	2011-11-27	914	\N	1516
8781	GENERIC_DAY	0	2	2010-05-31	912	\N	1516
8782	GENERIC_DAY	0	2	2012-04-27	916	\N	1516
8783	GENERIC_DAY	0	2	2010-04-18	912	\N	1516
8784	GENERIC_DAY	0	2	2011-11-22	910	\N	1516
8785	GENERIC_DAY	0	2	2011-03-20	916	\N	1516
8786	GENERIC_DAY	0	2	2011-12-09	916	\N	1516
8787	GENERIC_DAY	0	2	2012-10-06	916	\N	1516
8788	GENERIC_DAY	0	2	2010-03-09	916	\N	1516
8789	GENERIC_DAY	0	2	2010-02-16	912	\N	1516
8790	GENERIC_DAY	0	2	2010-06-21	910	\N	1516
8791	GENERIC_DAY	0	2	2011-04-26	910	\N	1516
8792	GENERIC_DAY	0	2	2012-11-21	914	\N	1516
8793	GENERIC_DAY	0	2	2011-11-10	910	\N	1516
8794	GENERIC_DAY	0	2	2012-04-04	916	\N	1516
8795	GENERIC_DAY	0	2	2010-08-29	910	\N	1516
8796	GENERIC_DAY	0	2	2010-07-30	914	\N	1516
8797	GENERIC_DAY	0	2	2013-04-03	914	\N	1516
8798	GENERIC_DAY	0	2	2010-09-07	914	\N	1516
8799	GENERIC_DAY	0	2	2013-04-04	912	\N	1516
8800	GENERIC_DAY	0	2	2011-08-27	914	\N	1516
8801	GENERIC_DAY	0	2	2010-01-15	912	\N	1516
8802	GENERIC_DAY	0	2	2011-06-15	912	\N	1516
8803	GENERIC_DAY	0	2	2011-07-15	916	\N	1516
8804	GENERIC_DAY	0	2	2013-03-12	914	\N	1516
8805	GENERIC_DAY	0	2	2011-12-26	910	\N	1516
8806	GENERIC_DAY	0	2	2012-05-04	914	\N	1516
8807	GENERIC_DAY	0	2	2012-05-31	914	\N	1516
8808	GENERIC_DAY	0	2	2012-08-05	912	\N	1516
8809	GENERIC_DAY	0	2	2012-06-19	914	\N	1516
8810	GENERIC_DAY	0	2	2010-01-19	910	\N	1516
8811	GENERIC_DAY	0	2	2011-11-23	910	\N	1516
8812	GENERIC_DAY	0	2	2010-11-21	912	\N	1516
8813	GENERIC_DAY	0	2	2013-01-14	914	\N	1516
8814	GENERIC_DAY	0	2	2012-11-25	910	\N	1516
8815	GENERIC_DAY	0	2	2012-12-25	916	\N	1516
8816	GENERIC_DAY	0	2	2012-10-04	916	\N	1516
8817	GENERIC_DAY	0	2	2012-07-18	914	\N	1516
8818	GENERIC_DAY	0	2	2010-10-02	910	\N	1516
8819	GENERIC_DAY	0	2	2011-07-09	916	\N	1516
8820	GENERIC_DAY	0	2	2011-07-14	912	\N	1516
8821	GENERIC_DAY	0	2	2010-04-24	912	\N	1516
8822	GENERIC_DAY	0	2	2010-12-07	914	\N	1516
8823	GENERIC_DAY	0	2	2010-07-18	912	\N	1516
8824	GENERIC_DAY	0	2	2013-05-09	912	\N	1516
8825	GENERIC_DAY	0	2	2012-08-17	914	\N	1516
8826	GENERIC_DAY	0	2	2013-03-11	914	\N	1516
8827	GENERIC_DAY	0	2	2013-01-09	910	\N	1516
8828	GENERIC_DAY	0	2	2011-01-18	914	\N	1516
8829	GENERIC_DAY	0	2	2012-08-09	912	\N	1516
8830	GENERIC_DAY	0	2	2012-04-07	914	\N	1516
8831	GENERIC_DAY	0	2	2012-02-03	910	\N	1516
8832	GENERIC_DAY	0	2	2012-03-25	910	\N	1516
8833	GENERIC_DAY	0	2	2011-08-17	910	\N	1516
8834	GENERIC_DAY	0	2	2011-01-05	910	\N	1516
8835	GENERIC_DAY	0	2	2012-08-31	916	\N	1516
8836	GENERIC_DAY	0	2	2011-01-25	912	\N	1516
8837	GENERIC_DAY	0	2	2011-01-25	914	\N	1516
8838	GENERIC_DAY	0	2	2012-01-18	916	\N	1516
8839	GENERIC_DAY	0	2	2010-12-14	914	\N	1516
8840	GENERIC_DAY	0	2	2012-09-27	912	\N	1516
8841	GENERIC_DAY	0	2	2012-02-26	912	\N	1516
8842	GENERIC_DAY	0	2	2010-02-27	916	\N	1516
8843	GENERIC_DAY	0	2	2013-04-06	912	\N	1516
8844	GENERIC_DAY	0	2	2012-11-13	910	\N	1516
8845	GENERIC_DAY	0	2	2011-05-27	910	\N	1516
8846	GENERIC_DAY	0	2	2010-01-19	916	\N	1516
8847	GENERIC_DAY	0	2	2010-02-03	914	\N	1516
8848	GENERIC_DAY	0	2	2011-05-27	912	\N	1516
8849	GENERIC_DAY	0	2	2013-01-13	914	\N	1516
8850	GENERIC_DAY	0	2	2010-09-22	910	\N	1516
8851	GENERIC_DAY	0	2	2010-07-17	912	\N	1516
8852	GENERIC_DAY	0	2	2009-12-16	912	\N	1516
8853	GENERIC_DAY	0	2	2012-02-13	912	\N	1516
8854	GENERIC_DAY	0	2	2011-02-10	912	\N	1516
8855	GENERIC_DAY	0	2	2013-04-11	910	\N	1516
8856	GENERIC_DAY	0	2	2010-06-08	910	\N	1516
8857	GENERIC_DAY	0	2	2013-02-23	910	\N	1516
8858	GENERIC_DAY	0	2	2013-03-11	916	\N	1516
8859	GENERIC_DAY	0	2	2013-01-02	912	\N	1516
8860	GENERIC_DAY	0	2	2010-02-03	910	\N	1516
8861	GENERIC_DAY	0	2	2013-04-17	910	\N	1516
8862	GENERIC_DAY	0	2	2012-04-22	910	\N	1516
8863	GENERIC_DAY	0	2	2013-04-21	910	\N	1516
8864	GENERIC_DAY	0	2	2011-01-05	916	\N	1516
8865	GENERIC_DAY	0	2	2010-01-01	912	\N	1516
8866	GENERIC_DAY	0	2	2012-07-03	914	\N	1516
8867	GENERIC_DAY	0	2	2012-08-29	916	\N	1516
8868	GENERIC_DAY	0	2	2011-05-16	916	\N	1516
8869	GENERIC_DAY	0	2	2011-04-19	914	\N	1516
8870	GENERIC_DAY	0	2	2011-12-31	912	\N	1516
8871	GENERIC_DAY	0	2	2013-02-10	910	\N	1516
8872	GENERIC_DAY	0	2	2011-05-18	910	\N	1516
8873	GENERIC_DAY	0	2	2010-08-10	914	\N	1516
8874	GENERIC_DAY	0	2	2010-04-22	916	\N	1516
8875	GENERIC_DAY	0	2	2010-03-30	910	\N	1516
8876	GENERIC_DAY	0	2	2010-04-21	910	\N	1516
8877	GENERIC_DAY	0	2	2011-07-23	914	\N	1516
8878	GENERIC_DAY	0	2	2010-04-28	910	\N	1516
8879	GENERIC_DAY	0	2	2011-04-14	910	\N	1516
8880	GENERIC_DAY	0	2	2012-10-10	912	\N	1516
8881	GENERIC_DAY	0	2	2010-11-22	916	\N	1516
8882	GENERIC_DAY	0	2	2012-10-16	914	\N	1516
8883	GENERIC_DAY	0	2	2013-04-16	914	\N	1516
8884	GENERIC_DAY	0	2	2012-07-13	910	\N	1516
8885	GENERIC_DAY	0	2	2013-02-21	914	\N	1516
8886	GENERIC_DAY	0	2	2011-02-08	914	\N	1516
8887	GENERIC_DAY	0	2	2012-09-13	910	\N	1516
8888	GENERIC_DAY	0	2	2011-09-02	910	\N	1516
8889	GENERIC_DAY	0	2	2011-12-27	916	\N	1516
8890	GENERIC_DAY	0	2	2012-07-11	916	\N	1516
8891	GENERIC_DAY	0	2	2011-02-12	912	\N	1516
8892	GENERIC_DAY	0	2	2012-12-06	910	\N	1516
8893	GENERIC_DAY	0	2	2010-08-26	916	\N	1516
8894	GENERIC_DAY	0	2	2010-06-16	916	\N	1516
8895	GENERIC_DAY	0	2	2011-03-31	916	\N	1516
8896	GENERIC_DAY	0	2	2010-02-03	916	\N	1516
8897	GENERIC_DAY	0	2	2009-12-19	910	\N	1516
8898	GENERIC_DAY	0	2	2012-10-28	910	\N	1516
8899	GENERIC_DAY	0	2	2012-09-08	916	\N	1516
8900	GENERIC_DAY	0	2	2010-09-19	912	\N	1516
8901	GENERIC_DAY	0	2	2011-11-04	914	\N	1516
8902	GENERIC_DAY	0	2	2010-05-22	916	\N	1516
8903	GENERIC_DAY	0	2	2010-12-19	912	\N	1516
8904	GENERIC_DAY	0	2	2011-06-21	910	\N	1516
8905	GENERIC_DAY	0	2	2011-12-31	910	\N	1516
8906	GENERIC_DAY	0	2	2010-01-16	914	\N	1516
8907	GENERIC_DAY	0	2	2010-05-21	912	\N	1516
8908	GENERIC_DAY	0	2	2012-11-06	916	\N	1516
8909	GENERIC_DAY	0	2	2010-02-28	910	\N	1516
8910	GENERIC_DAY	0	2	2013-03-03	912	\N	1516
8911	GENERIC_DAY	0	2	2011-03-28	912	\N	1516
8912	GENERIC_DAY	0	2	2011-10-30	910	\N	1516
8913	GENERIC_DAY	0	2	2012-08-16	914	\N	1516
8914	GENERIC_DAY	0	2	2010-11-07	914	\N	1516
8915	GENERIC_DAY	0	2	2012-11-02	916	\N	1516
8916	GENERIC_DAY	0	2	2010-10-01	910	\N	1516
8917	GENERIC_DAY	0	2	2010-02-21	910	\N	1516
8918	GENERIC_DAY	0	2	2013-01-23	914	\N	1516
8919	GENERIC_DAY	0	2	2012-05-29	910	\N	1516
8920	GENERIC_DAY	0	2	2013-04-22	910	\N	1516
8921	GENERIC_DAY	0	2	2010-08-16	910	\N	1516
8922	GENERIC_DAY	0	2	2012-03-23	914	\N	1516
8923	GENERIC_DAY	0	2	2012-10-02	910	\N	1516
8924	GENERIC_DAY	0	2	2010-01-18	916	\N	1516
8925	GENERIC_DAY	0	2	2013-05-07	916	\N	1516
8926	GENERIC_DAY	0	2	2011-05-25	914	\N	1516
8927	GENERIC_DAY	0	2	2011-08-08	916	\N	1516
8928	GENERIC_DAY	0	2	2010-06-05	914	\N	1516
8929	GENERIC_DAY	0	2	2011-07-01	916	\N	1516
8930	GENERIC_DAY	0	2	2011-04-17	910	\N	1516
8931	GENERIC_DAY	0	2	2012-03-22	912	\N	1516
8932	GENERIC_DAY	0	2	2013-03-09	914	\N	1516
8933	GENERIC_DAY	0	2	2012-02-11	916	\N	1516
8934	GENERIC_DAY	0	2	2011-08-02	912	\N	1516
8935	GENERIC_DAY	0	2	2013-05-05	916	\N	1516
8936	GENERIC_DAY	0	2	2011-11-08	912	\N	1516
8937	GENERIC_DAY	0	2	2011-08-12	916	\N	1516
8938	GENERIC_DAY	0	2	2010-10-18	914	\N	1516
8939	GENERIC_DAY	0	2	2011-06-29	910	\N	1516
8940	GENERIC_DAY	0	2	2009-12-09	910	\N	1516
8941	GENERIC_DAY	0	2	2011-09-21	912	\N	1516
8942	GENERIC_DAY	0	2	2011-03-26	910	\N	1516
8943	GENERIC_DAY	0	2	2012-10-23	912	\N	1516
8944	GENERIC_DAY	0	2	2012-08-08	916	\N	1516
8945	GENERIC_DAY	0	2	2012-07-29	912	\N	1516
8946	GENERIC_DAY	0	2	2010-08-12	916	\N	1516
8947	GENERIC_DAY	0	2	2011-11-03	912	\N	1516
8948	GENERIC_DAY	0	2	2012-06-10	916	\N	1516
8949	GENERIC_DAY	0	2	2011-08-26	910	\N	1516
8950	GENERIC_DAY	0	2	2010-08-25	914	\N	1516
8951	GENERIC_DAY	0	2	2010-04-03	912	\N	1516
8952	GENERIC_DAY	0	2	2011-06-02	916	\N	1516
8953	GENERIC_DAY	0	2	2010-10-03	910	\N	1516
8954	GENERIC_DAY	0	2	2010-12-31	916	\N	1516
8955	GENERIC_DAY	0	2	2011-12-22	916	\N	1516
8956	GENERIC_DAY	0	2	2012-08-07	910	\N	1516
8957	GENERIC_DAY	0	2	2010-07-23	912	\N	1516
8958	GENERIC_DAY	0	2	2011-04-08	910	\N	1516
8959	GENERIC_DAY	0	2	2013-02-25	910	\N	1516
8960	GENERIC_DAY	0	2	2013-01-08	916	\N	1516
8961	GENERIC_DAY	0	2	2010-09-01	914	\N	1516
8962	GENERIC_DAY	0	2	2009-12-24	912	\N	1516
8963	GENERIC_DAY	0	2	2010-05-12	916	\N	1516
8964	GENERIC_DAY	0	2	2010-07-27	910	\N	1516
8965	GENERIC_DAY	0	2	2010-03-09	910	\N	1516
8966	GENERIC_DAY	0	2	2012-05-10	916	\N	1516
8967	GENERIC_DAY	0	2	2010-05-25	914	\N	1516
8968	GENERIC_DAY	0	2	2011-03-22	910	\N	1516
8969	GENERIC_DAY	0	2	2012-02-13	916	\N	1516
8970	GENERIC_DAY	0	2	2010-01-31	910	\N	1516
8971	GENERIC_DAY	0	2	2011-02-05	916	\N	1516
8972	GENERIC_DAY	0	2	2010-09-10	914	\N	1516
8973	GENERIC_DAY	0	2	2011-09-28	914	\N	1516
8974	GENERIC_DAY	0	2	2012-06-29	912	\N	1516
8975	GENERIC_DAY	0	2	2011-09-21	914	\N	1516
8976	GENERIC_DAY	0	2	2010-12-16	910	\N	1516
8977	GENERIC_DAY	0	2	2010-06-08	914	\N	1516
8978	GENERIC_DAY	0	2	2013-03-25	912	\N	1516
8979	GENERIC_DAY	0	2	2009-12-18	916	\N	1516
8980	GENERIC_DAY	0	2	2011-03-03	910	\N	1516
8981	GENERIC_DAY	0	2	2011-02-13	916	\N	1516
8982	GENERIC_DAY	0	2	2011-06-11	914	\N	1516
8983	GENERIC_DAY	0	2	2011-11-01	916	\N	1516
8984	GENERIC_DAY	0	2	2010-10-10	910	\N	1516
8985	GENERIC_DAY	0	2	2010-01-21	914	\N	1516
8986	GENERIC_DAY	0	2	2010-10-11	912	\N	1516
8987	GENERIC_DAY	0	2	2010-12-19	910	\N	1516
8988	GENERIC_DAY	0	2	2010-12-12	914	\N	1516
8989	GENERIC_DAY	0	2	2011-06-22	916	\N	1516
8990	GENERIC_DAY	0	2	2011-10-04	916	\N	1516
8991	GENERIC_DAY	0	2	2011-05-03	910	\N	1516
8992	GENERIC_DAY	0	2	2010-09-20	912	\N	1516
8993	GENERIC_DAY	0	2	2010-06-19	914	\N	1516
8994	GENERIC_DAY	0	2	2013-05-01	916	\N	1516
8995	GENERIC_DAY	0	2	2010-08-30	916	\N	1516
8996	GENERIC_DAY	0	2	2011-03-25	916	\N	1516
8997	GENERIC_DAY	0	2	2011-11-06	914	\N	1516
8998	GENERIC_DAY	0	2	2010-09-11	912	\N	1516
8999	GENERIC_DAY	0	2	2012-04-18	914	\N	1516
9000	GENERIC_DAY	0	2	2012-11-16	912	\N	1516
9001	GENERIC_DAY	0	2	2011-03-15	916	\N	1516
9002	GENERIC_DAY	0	2	2013-03-20	910	\N	1516
9003	GENERIC_DAY	0	2	2012-08-08	914	\N	1516
9004	GENERIC_DAY	0	2	2011-09-05	910	\N	1516
9005	GENERIC_DAY	0	2	2011-03-09	910	\N	1516
9006	GENERIC_DAY	0	2	2012-12-26	910	\N	1516
9007	GENERIC_DAY	0	2	2012-06-25	912	\N	1516
9008	GENERIC_DAY	0	2	2012-04-30	910	\N	1516
9009	GENERIC_DAY	0	2	2011-05-11	914	\N	1516
9010	GENERIC_DAY	0	2	2012-08-25	916	\N	1516
9011	GENERIC_DAY	0	2	2011-01-24	914	\N	1516
9012	GENERIC_DAY	0	2	2011-02-12	916	\N	1516
9013	GENERIC_DAY	0	2	2011-06-21	912	\N	1516
9014	GENERIC_DAY	0	2	2012-04-17	912	\N	1516
9015	GENERIC_DAY	0	2	2010-07-03	916	\N	1516
9016	GENERIC_DAY	0	2	2011-01-10	910	\N	1516
9017	GENERIC_DAY	0	2	2010-03-02	910	\N	1516
9018	GENERIC_DAY	0	2	2011-03-26	916	\N	1516
9019	GENERIC_DAY	0	2	2012-05-09	914	\N	1516
9020	GENERIC_DAY	0	2	2012-11-07	910	\N	1516
9021	GENERIC_DAY	0	2	2010-03-22	916	\N	1516
9022	GENERIC_DAY	0	2	2012-08-17	910	\N	1516
9023	GENERIC_DAY	0	2	2012-02-21	910	\N	1516
9024	GENERIC_DAY	0	2	2010-07-08	916	\N	1516
9025	GENERIC_DAY	0	2	2012-08-05	910	\N	1516
9026	GENERIC_DAY	0	2	2012-06-23	916	\N	1516
9027	GENERIC_DAY	0	2	2011-12-29	916	\N	1516
9028	GENERIC_DAY	0	2	2012-12-07	916	\N	1516
9029	GENERIC_DAY	0	2	2011-10-20	910	\N	1516
9030	GENERIC_DAY	0	2	2012-08-30	916	\N	1516
9031	GENERIC_DAY	0	2	2010-05-10	914	\N	1516
9032	GENERIC_DAY	0	2	2012-12-20	914	\N	1516
9033	GENERIC_DAY	0	2	2012-01-30	914	\N	1516
9034	GENERIC_DAY	0	2	2010-10-21	912	\N	1516
9035	GENERIC_DAY	0	2	2011-06-12	914	\N	1516
9036	GENERIC_DAY	0	2	2010-01-29	914	\N	1516
9037	GENERIC_DAY	0	2	2012-11-10	910	\N	1516
9038	GENERIC_DAY	0	2	2012-04-22	916	\N	1516
9039	GENERIC_DAY	0	2	2012-11-08	916	\N	1516
9040	GENERIC_DAY	0	2	2010-11-01	914	\N	1516
9041	GENERIC_DAY	0	2	2012-07-04	912	\N	1516
9042	GENERIC_DAY	0	2	2011-11-21	914	\N	1516
9043	GENERIC_DAY	0	2	2009-12-12	910	\N	1516
9044	GENERIC_DAY	0	2	2010-01-29	916	\N	1516
9045	GENERIC_DAY	0	2	2012-05-25	914	\N	1516
9046	GENERIC_DAY	0	2	2010-02-20	910	\N	1516
9047	GENERIC_DAY	0	2	2011-10-31	916	\N	1516
9048	GENERIC_DAY	0	2	2009-12-27	916	\N	1516
9049	GENERIC_DAY	0	2	2011-01-27	912	\N	1516
9050	GENERIC_DAY	0	2	2011-04-04	914	\N	1516
9051	GENERIC_DAY	0	2	2013-01-31	912	\N	1516
9052	GENERIC_DAY	0	2	2013-03-02	912	\N	1516
9053	GENERIC_DAY	0	2	2011-06-19	910	\N	1516
9054	GENERIC_DAY	0	2	2012-09-24	914	\N	1516
9055	GENERIC_DAY	0	2	2010-09-28	914	\N	1516
9056	GENERIC_DAY	0	2	2012-04-23	910	\N	1516
9057	GENERIC_DAY	0	2	2010-08-03	916	\N	1516
9058	GENERIC_DAY	0	2	2012-11-09	910	\N	1516
9059	GENERIC_DAY	0	2	2012-07-16	910	\N	1516
9060	GENERIC_DAY	0	2	2010-02-22	912	\N	1516
9061	GENERIC_DAY	0	2	2011-12-11	916	\N	1516
9062	GENERIC_DAY	0	2	2011-12-01	914	\N	1516
9063	GENERIC_DAY	0	2	2009-12-22	916	\N	1516
9064	GENERIC_DAY	0	2	2011-01-22	912	\N	1516
9065	GENERIC_DAY	0	2	2011-09-24	912	\N	1516
9066	GENERIC_DAY	0	2	2010-03-20	910	\N	1516
9067	GENERIC_DAY	0	2	2013-04-07	916	\N	1516
9068	GENERIC_DAY	0	2	2010-08-06	916	\N	1516
9069	GENERIC_DAY	0	2	2010-11-15	914	\N	1516
9070	GENERIC_DAY	0	2	2013-04-05	914	\N	1516
9071	GENERIC_DAY	0	2	2013-04-18	910	\N	1516
9072	GENERIC_DAY	0	2	2011-10-28	910	\N	1516
9073	GENERIC_DAY	0	2	2012-01-16	912	\N	1516
9074	GENERIC_DAY	0	2	2010-07-11	912	\N	1516
9075	GENERIC_DAY	0	2	2012-01-21	914	\N	1516
9076	GENERIC_DAY	0	2	2010-08-07	910	\N	1516
9077	GENERIC_DAY	0	2	2013-01-01	910	\N	1516
9078	GENERIC_DAY	0	2	2012-06-09	916	\N	1516
9079	GENERIC_DAY	0	2	2010-08-17	914	\N	1516
9080	GENERIC_DAY	0	2	2011-08-24	916	\N	1516
9081	GENERIC_DAY	0	2	2011-03-03	912	\N	1516
9082	GENERIC_DAY	0	2	2011-06-21	916	\N	1516
9083	GENERIC_DAY	0	2	2010-05-31	916	\N	1516
9084	GENERIC_DAY	0	2	2011-11-27	910	\N	1516
9085	GENERIC_DAY	0	2	2010-07-07	916	\N	1516
9086	GENERIC_DAY	0	2	2012-05-08	912	\N	1516
9087	GENERIC_DAY	0	2	2012-01-29	912	\N	1516
9088	GENERIC_DAY	0	2	2013-05-02	916	\N	1516
9089	GENERIC_DAY	0	2	2010-11-30	916	\N	1516
9090	GENERIC_DAY	0	2	2010-06-05	910	\N	1516
9091	GENERIC_DAY	0	2	2012-05-15	916	\N	1516
9092	GENERIC_DAY	0	2	2011-10-10	912	\N	1516
9093	GENERIC_DAY	0	2	2012-01-31	912	\N	1516
9094	GENERIC_DAY	0	2	2012-11-26	912	\N	1516
9095	GENERIC_DAY	0	2	2013-05-08	916	\N	1516
9096	GENERIC_DAY	0	2	2012-12-15	914	\N	1516
9097	GENERIC_DAY	0	2	2009-12-28	912	\N	1516
9098	GENERIC_DAY	0	2	2013-05-07	910	\N	1516
9099	GENERIC_DAY	0	2	2012-06-30	910	\N	1516
9100	GENERIC_DAY	0	2	2011-04-13	912	\N	1516
9101	GENERIC_DAY	0	2	2012-03-03	916	\N	1516
9102	GENERIC_DAY	0	2	2010-04-28	914	\N	1516
9103	GENERIC_DAY	0	2	2013-04-12	912	\N	1516
9104	GENERIC_DAY	0	2	2011-06-06	912	\N	1516
9105	GENERIC_DAY	0	2	2012-11-06	910	\N	1516
9106	GENERIC_DAY	0	2	2012-07-02	914	\N	1516
9107	GENERIC_DAY	0	2	2010-04-08	912	\N	1516
9108	GENERIC_DAY	0	2	2010-05-03	914	\N	1516
9109	GENERIC_DAY	0	2	2011-12-25	912	\N	1516
9110	GENERIC_DAY	0	2	2010-09-08	910	\N	1516
9111	GENERIC_DAY	0	2	2012-09-30	910	\N	1516
9112	GENERIC_DAY	0	2	2010-06-13	916	\N	1516
9113	GENERIC_DAY	0	2	2011-09-19	914	\N	1516
9114	GENERIC_DAY	0	2	2012-04-05	912	\N	1516
9115	GENERIC_DAY	0	2	2010-01-24	912	\N	1516
9116	GENERIC_DAY	0	2	2011-05-15	914	\N	1516
9117	GENERIC_DAY	0	2	2013-05-10	916	\N	1516
9118	GENERIC_DAY	0	2	2012-07-24	914	\N	1516
9119	GENERIC_DAY	0	2	2012-07-04	914	\N	1516
9120	GENERIC_DAY	0	2	2010-07-15	912	\N	1516
9121	GENERIC_DAY	0	2	2012-05-05	910	\N	1516
9122	GENERIC_DAY	0	2	2011-04-21	910	\N	1516
9123	GENERIC_DAY	0	2	2013-02-06	912	\N	1516
9124	GENERIC_DAY	0	2	2010-08-15	914	\N	1516
9125	GENERIC_DAY	0	2	2010-12-27	914	\N	1516
9126	GENERIC_DAY	0	2	2011-10-05	910	\N	1516
9127	GENERIC_DAY	0	2	2012-07-20	914	\N	1516
9128	GENERIC_DAY	0	2	2011-03-15	912	\N	1516
9129	GENERIC_DAY	0	2	2012-02-29	910	\N	1516
9130	GENERIC_DAY	0	2	2012-01-31	916	\N	1516
9131	GENERIC_DAY	0	2	2011-04-23	916	\N	1516
9132	GENERIC_DAY	0	2	2011-10-26	910	\N	1516
9133	GENERIC_DAY	0	2	2011-10-27	916	\N	1516
9134	GENERIC_DAY	0	2	2011-03-16	912	\N	1516
9135	GENERIC_DAY	0	2	2011-09-10	914	\N	1516
9136	GENERIC_DAY	0	2	2011-01-25	916	\N	1516
9137	GENERIC_DAY	0	2	2013-01-01	914	\N	1516
9138	GENERIC_DAY	0	2	2011-11-13	914	\N	1516
9139	GENERIC_DAY	0	2	2012-02-23	916	\N	1516
9140	GENERIC_DAY	0	2	2010-10-28	914	\N	1516
9141	GENERIC_DAY	0	2	2013-05-08	912	\N	1516
9142	GENERIC_DAY	0	2	2013-04-14	914	\N	1516
9143	GENERIC_DAY	0	2	2013-03-05	910	\N	1516
9144	GENERIC_DAY	0	2	2010-05-24	910	\N	1516
9145	GENERIC_DAY	0	2	2011-06-13	912	\N	1516
9146	GENERIC_DAY	0	2	2012-07-25	916	\N	1516
9147	GENERIC_DAY	0	2	2010-02-01	912	\N	1516
9148	GENERIC_DAY	0	2	2010-12-09	910	\N	1516
9149	GENERIC_DAY	0	2	2012-03-03	912	\N	1516
9150	GENERIC_DAY	0	2	2010-03-12	910	\N	1516
9151	GENERIC_DAY	0	2	2012-01-24	914	\N	1516
9152	GENERIC_DAY	0	2	2012-03-14	912	\N	1516
9153	GENERIC_DAY	0	2	2010-06-03	914	\N	1516
9154	GENERIC_DAY	0	2	2012-09-17	914	\N	1516
9155	GENERIC_DAY	0	2	2011-12-17	916	\N	1516
9156	GENERIC_DAY	0	2	2011-11-05	910	\N	1516
9157	GENERIC_DAY	0	2	2010-07-18	914	\N	1516
9158	GENERIC_DAY	0	2	2011-10-25	912	\N	1516
9159	GENERIC_DAY	0	2	2011-10-30	912	\N	1516
9160	GENERIC_DAY	0	2	2011-12-10	912	\N	1516
9161	GENERIC_DAY	0	2	2010-01-09	914	\N	1516
9162	GENERIC_DAY	0	2	2011-10-13	912	\N	1516
9163	GENERIC_DAY	0	2	2011-06-04	916	\N	1516
9164	GENERIC_DAY	0	2	2012-08-17	916	\N	1516
9165	GENERIC_DAY	0	2	2010-01-12	910	\N	1516
9166	GENERIC_DAY	0	2	2011-04-15	914	\N	1516
9167	GENERIC_DAY	0	2	2011-05-06	916	\N	1516
9168	GENERIC_DAY	0	2	2010-06-25	912	\N	1516
9169	GENERIC_DAY	0	2	2013-03-04	912	\N	1516
9170	GENERIC_DAY	0	2	2009-12-12	912	\N	1516
9171	GENERIC_DAY	0	2	2013-03-15	910	\N	1516
9172	GENERIC_DAY	0	2	2011-04-23	912	\N	1516
9173	GENERIC_DAY	0	2	2012-12-12	912	\N	1516
9174	GENERIC_DAY	0	2	2012-04-24	914	\N	1516
9175	GENERIC_DAY	0	2	2011-08-06	916	\N	1516
9176	GENERIC_DAY	0	2	2012-03-25	914	\N	1516
9177	GENERIC_DAY	0	2	2011-03-05	914	\N	1516
9178	GENERIC_DAY	0	2	2012-11-23	912	\N	1516
9179	GENERIC_DAY	0	2	2010-07-07	914	\N	1516
9180	GENERIC_DAY	0	2	2012-01-17	914	\N	1516
9181	GENERIC_DAY	0	2	2010-05-25	912	\N	1516
9182	GENERIC_DAY	0	2	2012-10-13	912	\N	1516
9183	GENERIC_DAY	0	2	2010-08-29	914	\N	1516
9184	GENERIC_DAY	0	2	2011-07-28	914	\N	1516
9185	GENERIC_DAY	0	2	2010-12-11	910	\N	1516
9186	GENERIC_DAY	0	2	2011-02-14	910	\N	1516
9187	GENERIC_DAY	0	2	2011-10-09	912	\N	1516
9188	GENERIC_DAY	0	2	2010-10-16	912	\N	1516
9189	GENERIC_DAY	0	2	2013-02-28	912	\N	1516
9190	GENERIC_DAY	0	2	2012-10-16	912	\N	1516
9191	GENERIC_DAY	0	2	2011-03-29	912	\N	1516
9192	GENERIC_DAY	0	2	2012-10-12	912	\N	1516
9193	GENERIC_DAY	0	2	2012-01-19	916	\N	1516
9194	GENERIC_DAY	0	2	2012-06-10	912	\N	1516
9195	GENERIC_DAY	0	2	2010-07-21	914	\N	1516
9196	GENERIC_DAY	0	2	2010-12-15	916	\N	1516
9197	GENERIC_DAY	0	2	2011-03-08	910	\N	1516
9198	GENERIC_DAY	0	2	2012-12-27	916	\N	1516
9199	GENERIC_DAY	0	2	2012-07-13	914	\N	1516
9200	GENERIC_DAY	0	2	2011-02-23	910	\N	1516
9201	GENERIC_DAY	0	2	2012-03-30	914	\N	1516
9202	GENERIC_DAY	0	2	2011-12-14	910	\N	1516
9203	GENERIC_DAY	0	2	2011-02-08	912	\N	1516
9204	GENERIC_DAY	0	2	2011-05-12	916	\N	1516
9205	GENERIC_DAY	0	2	2011-09-12	916	\N	1516
9206	GENERIC_DAY	0	2	2013-02-14	914	\N	1516
9207	GENERIC_DAY	0	2	2011-09-13	912	\N	1516
9208	GENERIC_DAY	0	2	2010-03-06	916	\N	1516
9209	GENERIC_DAY	0	2	2010-01-25	910	\N	1516
9210	GENERIC_DAY	0	2	2009-12-09	912	\N	1516
9211	GENERIC_DAY	0	2	2012-02-11	910	\N	1516
9212	GENERIC_DAY	0	2	2011-01-22	910	\N	1516
9213	GENERIC_DAY	0	2	2010-04-10	916	\N	1516
9214	GENERIC_DAY	0	2	2010-03-16	914	\N	1516
9215	GENERIC_DAY	0	2	2011-03-14	910	\N	1516
9216	GENERIC_DAY	0	2	2012-03-10	916	\N	1516
9217	GENERIC_DAY	0	2	2012-02-17	912	\N	1516
9218	GENERIC_DAY	0	2	2010-12-19	916	\N	1516
9219	GENERIC_DAY	0	2	2011-05-10	910	\N	1516
9220	GENERIC_DAY	0	2	2010-05-13	912	\N	1516
9221	GENERIC_DAY	0	2	2013-01-31	916	\N	1516
9222	GENERIC_DAY	0	2	2009-12-18	912	\N	1516
9223	GENERIC_DAY	0	2	2010-04-14	916	\N	1516
9224	GENERIC_DAY	0	2	2012-07-03	912	\N	1516
9225	GENERIC_DAY	0	2	2011-11-11	916	\N	1516
9226	GENERIC_DAY	0	2	2012-05-27	914	\N	1516
9227	GENERIC_DAY	0	2	2012-06-21	914	\N	1516
9228	GENERIC_DAY	0	2	2011-03-04	910	\N	1516
9229	GENERIC_DAY	0	2	2011-03-12	914	\N	1516
9230	GENERIC_DAY	0	2	2011-06-14	910	\N	1516
9231	GENERIC_DAY	0	8	2009-12-25	912	\N	1516
9232	GENERIC_DAY	0	2	2011-05-28	914	\N	1516
9233	GENERIC_DAY	0	2	2013-04-06	910	\N	1516
9234	GENERIC_DAY	0	2	2012-03-09	916	\N	1516
9235	GENERIC_DAY	0	2	2011-08-15	916	\N	1516
9236	GENERIC_DAY	0	2	2012-03-05	912	\N	1516
9237	GENERIC_DAY	0	2	2010-06-05	912	\N	1516
9238	GENERIC_DAY	0	2	2011-10-08	912	\N	1516
9239	GENERIC_DAY	0	2	2011-11-05	914	\N	1516
9240	GENERIC_DAY	0	2	2013-01-13	916	\N	1516
9241	GENERIC_DAY	0	2	2011-03-02	914	\N	1516
9242	GENERIC_DAY	0	2	2011-09-28	916	\N	1516
9243	GENERIC_DAY	0	2	2013-02-11	914	\N	1516
9244	GENERIC_DAY	0	2	2010-02-19	910	\N	1516
9245	GENERIC_DAY	0	2	2009-12-31	914	\N	1516
9246	GENERIC_DAY	0	2	2009-12-30	910	\N	1516
9247	GENERIC_DAY	0	2	2011-10-12	910	\N	1516
9248	GENERIC_DAY	0	2	2012-09-25	916	\N	1516
9249	GENERIC_DAY	0	2	2011-02-21	914	\N	1516
9250	GENERIC_DAY	0	2	2012-01-12	916	\N	1516
9251	GENERIC_DAY	0	2	2011-05-29	916	\N	1516
9252	GENERIC_DAY	0	2	2013-05-10	912	\N	1516
9253	GENERIC_DAY	0	2	2012-08-30	912	\N	1516
9254	GENERIC_DAY	0	2	2012-10-26	912	\N	1516
9255	GENERIC_DAY	0	2	2009-12-23	912	\N	1516
9256	GENERIC_DAY	0	2	2011-10-04	914	\N	1516
9257	GENERIC_DAY	0	2	2010-06-23	914	\N	1516
9258	GENERIC_DAY	0	2	2010-08-17	912	\N	1516
9259	GENERIC_DAY	0	2	2011-11-09	912	\N	1516
9260	GENERIC_DAY	0	2	2010-09-08	914	\N	1516
9261	GENERIC_DAY	0	2	2012-05-05	914	\N	1516
9262	GENERIC_DAY	0	2	2011-06-11	916	\N	1516
9263	GENERIC_DAY	0	2	2010-08-13	914	\N	1516
9264	GENERIC_DAY	0	2	2012-12-11	914	\N	1516
9265	GENERIC_DAY	0	2	2012-04-17	910	\N	1516
9266	GENERIC_DAY	0	2	2011-10-01	910	\N	1516
9267	GENERIC_DAY	0	2	2010-11-26	916	\N	1516
9268	GENERIC_DAY	0	2	2011-08-25	910	\N	1516
9269	GENERIC_DAY	0	2	2010-04-29	914	\N	1516
9270	GENERIC_DAY	0	2	2011-04-03	914	\N	1516
9271	GENERIC_DAY	0	2	2012-03-12	912	\N	1516
9272	GENERIC_DAY	0	2	2010-07-23	914	\N	1516
9273	GENERIC_DAY	0	2	2011-03-16	914	\N	1516
9274	GENERIC_DAY	0	2	2013-01-03	914	\N	1516
9275	GENERIC_DAY	0	2	2011-11-09	916	\N	1516
9276	GENERIC_DAY	0	2	2012-10-10	914	\N	1516
9277	GENERIC_DAY	0	2	2010-01-07	914	\N	1516
9278	GENERIC_DAY	0	2	2012-11-13	916	\N	1516
9279	GENERIC_DAY	0	2	2011-04-04	916	\N	1516
9280	GENERIC_DAY	0	2	2012-01-25	912	\N	1516
9281	GENERIC_DAY	0	2	2012-03-25	912	\N	1516
9282	GENERIC_DAY	0	2	2010-08-12	912	\N	1516
9283	GENERIC_DAY	0	2	2011-05-20	912	\N	1516
9284	GENERIC_DAY	0	2	2012-12-06	916	\N	1516
9285	GENERIC_DAY	0	2	2010-03-03	912	\N	1516
9286	GENERIC_DAY	0	2	2012-05-02	916	\N	1516
9287	GENERIC_DAY	0	2	2013-02-01	910	\N	1516
9288	GENERIC_DAY	0	2	2010-10-23	910	\N	1516
9289	GENERIC_DAY	0	2	2012-11-19	910	\N	1516
9290	GENERIC_DAY	0	2	2012-10-09	910	\N	1516
9291	GENERIC_DAY	0	2	2012-07-08	912	\N	1516
9292	GENERIC_DAY	0	2	2010-12-01	914	\N	1516
9293	GENERIC_DAY	0	2	2011-07-26	910	\N	1516
9294	GENERIC_DAY	0	2	2012-10-05	914	\N	1516
9295	GENERIC_DAY	0	2	2011-05-09	914	\N	1516
9296	GENERIC_DAY	0	2	2012-12-21	910	\N	1516
9297	GENERIC_DAY	0	2	2013-02-12	916	\N	1516
9298	GENERIC_DAY	0	2	2010-04-17	910	\N	1516
9299	GENERIC_DAY	0	2	2010-06-06	916	\N	1516
9300	GENERIC_DAY	0	2	2010-01-25	914	\N	1516
9301	GENERIC_DAY	0	2	2012-07-14	912	\N	1516
9302	GENERIC_DAY	0	2	2011-05-26	910	\N	1516
9303	GENERIC_DAY	0	2	2012-10-03	914	\N	1516
9304	GENERIC_DAY	0	2	2012-04-09	910	\N	1516
9305	GENERIC_DAY	0	2	2010-10-16	916	\N	1516
9306	GENERIC_DAY	0	2	2011-09-18	912	\N	1516
9307	GENERIC_DAY	0	2	2010-06-07	914	\N	1516
9308	GENERIC_DAY	0	2	2011-09-04	914	\N	1516
9309	GENERIC_DAY	0	2	2011-04-07	910	\N	1516
9310	GENERIC_DAY	0	2	2010-03-14	910	\N	1516
9311	GENERIC_DAY	0	2	2011-10-09	916	\N	1516
9312	GENERIC_DAY	0	2	2011-10-15	916	\N	1516
9313	GENERIC_DAY	0	2	2013-02-03	912	\N	1516
9314	GENERIC_DAY	0	2	2012-11-18	910	\N	1516
9315	GENERIC_DAY	0	2	2011-08-19	914	\N	1516
9316	GENERIC_DAY	0	2	2012-01-05	910	\N	1516
9317	GENERIC_DAY	0	2	2011-02-19	916	\N	1516
9318	GENERIC_DAY	0	2	2011-08-31	910	\N	1516
9319	GENERIC_DAY	0	2	2011-11-08	910	\N	1516
9320	GENERIC_DAY	0	2	2011-12-19	912	\N	1516
9321	GENERIC_DAY	0	2	2010-08-05	912	\N	1516
9322	GENERIC_DAY	0	2	2012-02-14	914	\N	1516
9323	GENERIC_DAY	0	2	2013-03-05	916	\N	1516
9324	GENERIC_DAY	0	2	2011-03-16	916	\N	1516
9325	GENERIC_DAY	0	2	2013-03-15	916	\N	1516
9326	GENERIC_DAY	0	2	2013-02-27	914	\N	1516
9327	GENERIC_DAY	0	2	2012-09-20	916	\N	1516
9328	GENERIC_DAY	0	2	2013-04-30	914	\N	1516
9329	GENERIC_DAY	0	2	2013-02-02	914	\N	1516
9330	GENERIC_DAY	0	2	2010-01-06	914	\N	1516
9331	GENERIC_DAY	0	2	2011-02-22	914	\N	1516
9332	GENERIC_DAY	0	2	2010-09-02	910	\N	1516
9333	GENERIC_DAY	0	2	2013-05-01	914	\N	1516
9334	GENERIC_DAY	0	2	2011-08-13	910	\N	1516
9335	GENERIC_DAY	0	2	2010-11-30	910	\N	1516
9336	GENERIC_DAY	0	2	2012-10-22	910	\N	1516
9337	GENERIC_DAY	0	2	2010-07-10	916	\N	1516
9338	GENERIC_DAY	0	2	2011-01-23	916	\N	1516
9339	GENERIC_DAY	0	2	2012-12-02	910	\N	1516
9340	GENERIC_DAY	0	2	2013-01-07	914	\N	1516
9341	GENERIC_DAY	0	2	2012-07-22	916	\N	1516
9342	GENERIC_DAY	0	2	2010-09-07	916	\N	1516
9343	GENERIC_DAY	0	2	2010-08-21	914	\N	1516
9344	GENERIC_DAY	0	2	2011-04-12	910	\N	1516
9345	GENERIC_DAY	0	2	2011-01-16	916	\N	1516
9346	GENERIC_DAY	0	2	2012-04-27	914	\N	1516
9347	GENERIC_DAY	0	2	2011-08-10	910	\N	1516
9348	GENERIC_DAY	0	2	2011-04-17	916	\N	1516
9349	GENERIC_DAY	0	2	2013-04-24	916	\N	1516
9350	GENERIC_DAY	0	2	2012-09-11	916	\N	1516
9351	GENERIC_DAY	0	2	2011-01-21	910	\N	1516
9352	GENERIC_DAY	0	2	2011-03-22	914	\N	1516
9353	GENERIC_DAY	0	2	2011-05-27	914	\N	1516
9354	GENERIC_DAY	0	2	2011-05-24	912	\N	1516
9355	GENERIC_DAY	0	2	2010-03-31	910	\N	1516
9356	GENERIC_DAY	0	2	2010-10-07	916	\N	1516
9357	GENERIC_DAY	0	2	2011-12-22	912	\N	1516
9358	GENERIC_DAY	0	2	2010-12-13	916	\N	1516
9359	GENERIC_DAY	0	2	2011-02-24	916	\N	1516
9360	GENERIC_DAY	0	2	2012-11-12	914	\N	1516
9361	GENERIC_DAY	0	2	2012-04-03	912	\N	1516
9362	GENERIC_DAY	0	2	2011-12-08	916	\N	1516
9363	GENERIC_DAY	0	2	2010-04-16	916	\N	1516
9364	GENERIC_DAY	0	2	2011-04-14	916	\N	1516
9365	GENERIC_DAY	0	2	2012-02-04	910	\N	1516
9366	GENERIC_DAY	0	2	2013-03-28	912	\N	1516
9367	GENERIC_DAY	0	2	2013-02-07	910	\N	1516
9368	GENERIC_DAY	0	2	2013-04-12	916	\N	1516
9369	GENERIC_DAY	0	2	2011-07-29	914	\N	1516
9370	GENERIC_DAY	0	2	2011-01-12	912	\N	1516
9371	GENERIC_DAY	0	2	2010-05-26	916	\N	1516
9372	GENERIC_DAY	0	2	2011-03-30	910	\N	1516
9373	GENERIC_DAY	0	2	2011-02-04	916	\N	1516
9374	GENERIC_DAY	0	2	2012-03-24	916	\N	1516
9375	GENERIC_DAY	0	2	2012-04-19	910	\N	1516
9376	GENERIC_DAY	0	2	2013-03-20	914	\N	1516
9377	GENERIC_DAY	0	2	2010-05-17	914	\N	1516
9378	GENERIC_DAY	0	2	2011-07-21	914	\N	1516
9379	GENERIC_DAY	0	2	2012-05-06	910	\N	1516
9380	GENERIC_DAY	0	2	2010-01-12	914	\N	1516
9381	GENERIC_DAY	0	2	2010-05-12	912	\N	1516
9382	GENERIC_DAY	0	2	2012-11-22	910	\N	1516
9383	GENERIC_DAY	0	2	2012-10-10	910	\N	1516
9384	GENERIC_DAY	0	2	2009-12-12	914	\N	1516
9385	GENERIC_DAY	0	2	2012-12-19	910	\N	1516
9386	GENERIC_DAY	0	2	2011-03-29	914	\N	1516
9387	GENERIC_DAY	0	2	2010-10-06	910	\N	1516
9388	GENERIC_DAY	0	2	2010-09-08	916	\N	1516
9389	GENERIC_DAY	0	2	2010-12-24	914	\N	1516
9390	GENERIC_DAY	0	2	2012-07-09	910	\N	1516
9391	GENERIC_DAY	0	2	2012-10-30	914	\N	1516
9392	GENERIC_DAY	0	2	2012-09-20	912	\N	1516
9393	GENERIC_DAY	0	2	2010-03-26	916	\N	1516
9394	GENERIC_DAY	0	2	2011-08-23	916	\N	1516
9395	GENERIC_DAY	0	2	2012-04-16	910	\N	1516
9396	GENERIC_DAY	0	2	2010-08-03	910	\N	1516
9397	GENERIC_DAY	0	2	2011-01-30	910	\N	1516
9398	GENERIC_DAY	0	2	2012-09-18	914	\N	1516
9399	GENERIC_DAY	0	2	2012-05-14	912	\N	1516
9400	GENERIC_DAY	0	2	2010-03-15	912	\N	1516
9401	GENERIC_DAY	0	2	2010-12-28	914	\N	1516
9402	GENERIC_DAY	0	2	2013-04-15	914	\N	1516
9403	GENERIC_DAY	0	2	2012-11-25	916	\N	1516
9404	GENERIC_DAY	0	2	2012-05-15	912	\N	1516
9405	GENERIC_DAY	0	2	2011-07-07	910	\N	1516
9406	GENERIC_DAY	0	2	2012-10-10	916	\N	1516
9407	GENERIC_DAY	0	2	2012-08-27	914	\N	1516
9408	GENERIC_DAY	0	2	2013-05-03	916	\N	1516
9409	GENERIC_DAY	0	2	2012-10-25	910	\N	1516
9410	GENERIC_DAY	0	2	2011-03-28	910	\N	1516
9411	GENERIC_DAY	0	2	2011-12-07	914	\N	1516
9412	GENERIC_DAY	0	2	2012-01-02	914	\N	1516
9413	GENERIC_DAY	0	2	2010-06-06	910	\N	1516
9414	GENERIC_DAY	0	2	2010-08-28	916	\N	1516
9415	GENERIC_DAY	0	2	2010-04-23	910	\N	1516
9416	GENERIC_DAY	0	2	2012-03-18	910	\N	1516
9417	GENERIC_DAY	0	2	2013-04-12	910	\N	1516
9418	GENERIC_DAY	0	2	2011-10-29	912	\N	1516
9419	GENERIC_DAY	0	2	2011-03-11	910	\N	1516
9420	GENERIC_DAY	0	2	2012-05-13	910	\N	1516
9421	GENERIC_DAY	0	2	2010-11-02	912	\N	1516
9422	GENERIC_DAY	0	2	2011-08-04	916	\N	1516
9423	GENERIC_DAY	0	2	2013-04-24	912	\N	1516
9424	GENERIC_DAY	0	2	2011-01-20	910	\N	1516
9425	GENERIC_DAY	0	2	2010-05-17	916	\N	1516
9426	GENERIC_DAY	0	2	2010-09-17	914	\N	1516
9427	GENERIC_DAY	0	2	2011-10-13	910	\N	1516
9428	GENERIC_DAY	0	2	2011-04-28	910	\N	1516
9429	GENERIC_DAY	0	2	2012-12-02	912	\N	1516
9430	GENERIC_DAY	0	2	2011-03-21	912	\N	1516
9431	GENERIC_DAY	0	2	2010-02-19	916	\N	1516
9432	GENERIC_DAY	0	2	2011-12-18	912	\N	1516
9433	GENERIC_DAY	0	2	2012-09-16	910	\N	1516
9434	GENERIC_DAY	0	2	2012-04-20	916	\N	1516
9435	GENERIC_DAY	0	2	2012-08-10	910	\N	1516
9436	GENERIC_DAY	0	2	2011-05-22	912	\N	1516
9437	GENERIC_DAY	0	2	2010-08-24	910	\N	1516
9438	GENERIC_DAY	0	2	2011-07-18	914	\N	1516
9439	GENERIC_DAY	0	2	2013-01-10	914	\N	1516
9440	GENERIC_DAY	0	2	2010-04-08	916	\N	1516
9441	GENERIC_DAY	0	2	2012-06-18	912	\N	1516
9442	GENERIC_DAY	0	2	2011-10-20	912	\N	1516
9443	GENERIC_DAY	0	2	2011-12-23	914	\N	1516
9444	GENERIC_DAY	0	2	2011-05-11	912	\N	1516
9445	GENERIC_DAY	0	2	2012-12-22	912	\N	1516
9446	GENERIC_DAY	0	2	2010-02-04	914	\N	1516
9447	GENERIC_DAY	0	2	2010-07-16	916	\N	1516
9448	GENERIC_DAY	0	2	2012-12-17	916	\N	1516
9449	GENERIC_DAY	0	2	2010-10-01	912	\N	1516
9450	GENERIC_DAY	0	2	2011-01-23	912	\N	1516
9451	GENERIC_DAY	0	2	2010-10-22	912	\N	1516
9452	GENERIC_DAY	0	2	2011-03-31	910	\N	1516
9453	GENERIC_DAY	0	2	2010-04-25	914	\N	1516
9454	GENERIC_DAY	0	2	2013-04-14	910	\N	1516
9455	GENERIC_DAY	0	2	2010-03-28	912	\N	1516
9456	GENERIC_DAY	0	2	2013-02-23	914	\N	1516
9457	GENERIC_DAY	0	2	2012-04-21	916	\N	1516
9458	GENERIC_DAY	0	2	2011-11-18	912	\N	1516
9459	GENERIC_DAY	0	2	2009-12-23	914	\N	1516
9460	GENERIC_DAY	0	2	2011-02-25	910	\N	1516
9461	GENERIC_DAY	0	2	2012-10-26	914	\N	1516
9462	GENERIC_DAY	0	2	2010-12-15	912	\N	1516
9463	GENERIC_DAY	0	2	2012-08-07	912	\N	1516
9464	GENERIC_DAY	0	2	2012-09-05	910	\N	1516
9465	GENERIC_DAY	0	2	2011-07-03	916	\N	1516
9466	GENERIC_DAY	0	2	2011-08-17	914	\N	1516
9467	GENERIC_DAY	0	2	2013-01-29	916	\N	1516
9468	GENERIC_DAY	0	2	2011-10-21	910	\N	1516
9469	GENERIC_DAY	0	2	2012-04-15	910	\N	1516
9470	GENERIC_DAY	0	2	2010-02-13	916	\N	1516
9471	GENERIC_DAY	0	2	2011-09-22	912	\N	1516
9472	GENERIC_DAY	0	2	2011-12-01	910	\N	1516
9473	GENERIC_DAY	0	2	2013-03-07	914	\N	1516
9474	GENERIC_DAY	0	2	2010-08-28	912	\N	1516
9475	GENERIC_DAY	0	2	2011-11-28	914	\N	1516
9476	GENERIC_DAY	0	2	2010-04-28	912	\N	1516
9477	GENERIC_DAY	0	2	2010-01-28	914	\N	1516
9478	GENERIC_DAY	0	2	2011-07-15	910	\N	1516
9479	GENERIC_DAY	0	2	2012-12-22	910	\N	1516
9480	GENERIC_DAY	0	2	2012-06-28	910	\N	1516
9481	GENERIC_DAY	0	2	2010-05-05	910	\N	1516
9482	GENERIC_DAY	0	2	2010-10-04	910	\N	1516
9483	GENERIC_DAY	0	2	2010-04-06	914	\N	1516
9484	GENERIC_DAY	0	2	2012-10-07	912	\N	1516
9485	GENERIC_DAY	0	2	2012-07-06	910	\N	1516
9486	GENERIC_DAY	0	2	2013-02-14	912	\N	1516
9487	GENERIC_DAY	0	2	2010-04-26	916	\N	1516
9488	GENERIC_DAY	0	2	2012-10-08	912	\N	1516
9489	GENERIC_DAY	0	2	2011-07-06	910	\N	1516
9490	GENERIC_DAY	0	2	2010-06-26	910	\N	1516
9491	GENERIC_DAY	0	2	2010-04-13	916	\N	1516
9492	GENERIC_DAY	0	2	2010-06-10	916	\N	1516
9493	GENERIC_DAY	0	2	2011-02-16	910	\N	1516
9494	GENERIC_DAY	0	2	2010-04-11	914	\N	1516
9495	GENERIC_DAY	0	2	2010-04-20	914	\N	1516
9496	GENERIC_DAY	0	2	2011-05-08	914	\N	1516
9497	GENERIC_DAY	0	2	2011-10-23	914	\N	1516
9498	GENERIC_DAY	0	2	2011-12-18	914	\N	1516
9499	GENERIC_DAY	0	2	2010-07-24	910	\N	1516
9500	GENERIC_DAY	0	2	2011-05-01	916	\N	1516
9501	GENERIC_DAY	0	2	2011-09-03	916	\N	1516
9502	GENERIC_DAY	0	2	2010-11-04	912	\N	1516
9503	GENERIC_DAY	0	2	2010-03-19	914	\N	1516
9504	GENERIC_DAY	0	2	2011-09-01	916	\N	1516
9505	GENERIC_DAY	0	2	2012-05-11	916	\N	1516
9506	GENERIC_DAY	0	2	2012-03-27	914	\N	1516
9507	GENERIC_DAY	0	2	2012-02-14	910	\N	1516
9508	GENERIC_DAY	0	2	2012-07-14	914	\N	1516
9509	GENERIC_DAY	0	2	2010-07-31	912	\N	1516
9510	GENERIC_DAY	0	2	2010-10-26	910	\N	1516
9511	GENERIC_DAY	0	2	2010-07-23	916	\N	1516
9512	GENERIC_DAY	0	2	2012-05-03	914	\N	1516
9513	GENERIC_DAY	0	2	2013-03-17	910	\N	1516
9514	GENERIC_DAY	0	2	2013-01-27	916	\N	1516
9515	GENERIC_DAY	0	2	2010-03-04	914	\N	1516
9516	GENERIC_DAY	0	2	2011-07-21	912	\N	1516
9517	GENERIC_DAY	0	2	2010-06-14	914	\N	1516
9518	GENERIC_DAY	0	2	2012-08-13	914	\N	1516
9519	GENERIC_DAY	0	2	2010-03-21	912	\N	1516
9520	GENERIC_DAY	0	2	2011-07-31	916	\N	1516
9521	GENERIC_DAY	0	2	2012-01-09	912	\N	1516
9522	GENERIC_DAY	0	2	2012-01-23	916	\N	1516
9523	GENERIC_DAY	0	2	2012-10-01	912	\N	1516
9524	GENERIC_DAY	0	2	2011-01-25	910	\N	1516
9525	GENERIC_DAY	0	2	2011-05-04	916	\N	1516
9526	GENERIC_DAY	0	2	2010-12-25	916	\N	1516
9527	GENERIC_DAY	0	2	2011-10-08	914	\N	1516
9528	GENERIC_DAY	0	2	2012-01-07	914	\N	1516
9529	GENERIC_DAY	0	2	2010-09-05	912	\N	1516
9530	GENERIC_DAY	0	2	2010-03-23	914	\N	1516
9531	GENERIC_DAY	0	2	2012-06-22	914	\N	1516
9532	GENERIC_DAY	0	2	2010-09-26	916	\N	1516
9533	GENERIC_DAY	0	2	2011-06-14	912	\N	1516
9534	GENERIC_DAY	0	2	2011-06-10	912	\N	1516
9535	GENERIC_DAY	0	2	2013-03-08	910	\N	1516
9536	GENERIC_DAY	0	2	2011-09-20	912	\N	1516
9537	GENERIC_DAY	0	2	2010-02-08	912	\N	1516
9538	GENERIC_DAY	0	2	2010-03-29	916	\N	1516
9539	GENERIC_DAY	0	2	2012-11-28	914	\N	1516
9540	GENERIC_DAY	0	2	2011-12-07	916	\N	1516
9541	GENERIC_DAY	0	2	2010-08-31	914	\N	1516
9542	GENERIC_DAY	0	2	2012-01-01	914	\N	1516
9543	GENERIC_DAY	0	2	2012-10-28	912	\N	1516
9544	GENERIC_DAY	0	2	2011-10-06	916	\N	1516
9545	GENERIC_DAY	0	2	2012-04-06	910	\N	1516
9546	GENERIC_DAY	0	2	2011-02-06	916	\N	1516
9547	GENERIC_DAY	0	2	2012-02-02	914	\N	1516
9548	GENERIC_DAY	0	2	2010-07-26	910	\N	1516
9549	GENERIC_DAY	0	2	2012-04-24	912	\N	1516
9550	GENERIC_DAY	0	2	2010-09-07	910	\N	1516
9551	GENERIC_DAY	0	2	2010-09-11	910	\N	1516
9552	GENERIC_DAY	0	2	2011-07-01	910	\N	1516
9553	GENERIC_DAY	0	2	2011-03-08	916	\N	1516
9554	GENERIC_DAY	0	2	2011-07-04	910	\N	1516
9555	GENERIC_DAY	0	2	2010-12-14	916	\N	1516
9556	GENERIC_DAY	0	2	2010-05-23	914	\N	1516
9557	GENERIC_DAY	0	2	2010-12-01	912	\N	1516
9558	GENERIC_DAY	0	2	2010-06-04	912	\N	1516
9559	GENERIC_DAY	0	2	2011-11-14	914	\N	1516
9560	GENERIC_DAY	0	2	2012-07-26	912	\N	1516
9561	GENERIC_DAY	0	2	2012-04-13	912	\N	1516
9562	GENERIC_DAY	0	2	2011-01-13	912	\N	1516
9563	GENERIC_DAY	0	2	2011-10-12	912	\N	1516
9564	GENERIC_DAY	0	2	2011-12-05	914	\N	1516
9565	GENERIC_DAY	0	2	2012-04-26	916	\N	1516
9566	GENERIC_DAY	0	2	2012-05-14	910	\N	1516
9567	GENERIC_DAY	0	2	2012-11-15	916	\N	1516
9568	GENERIC_DAY	0	2	2010-08-23	914	\N	1516
9569	GENERIC_DAY	0	2	2011-06-13	914	\N	1516
9570	GENERIC_DAY	0	2	2012-12-29	910	\N	1516
9571	GENERIC_DAY	0	2	2011-05-30	914	\N	1516
9572	GENERIC_DAY	0	2	2011-03-01	910	\N	1516
9573	GENERIC_DAY	0	2	2013-01-02	910	\N	1516
9574	GENERIC_DAY	0	2	2013-01-06	916	\N	1516
9575	GENERIC_DAY	0	2	2012-07-23	914	\N	1516
9576	GENERIC_DAY	0	2	2011-07-18	916	\N	1516
9577	GENERIC_DAY	0	2	2013-04-13	916	\N	1516
9578	GENERIC_DAY	0	2	2012-12-10	914	\N	1516
9579	GENERIC_DAY	0	2	2010-03-07	910	\N	1516
9580	GENERIC_DAY	0	2	2010-11-10	914	\N	1516
9581	GENERIC_DAY	0	2	2010-03-04	910	\N	1516
9582	GENERIC_DAY	0	2	2011-02-05	910	\N	1516
9583	GENERIC_DAY	0	2	2010-07-02	914	\N	1516
9584	GENERIC_DAY	0	2	2012-08-31	912	\N	1516
9585	GENERIC_DAY	0	2	2011-11-29	916	\N	1516
9586	GENERIC_DAY	0	2	2012-07-04	916	\N	1516
9587	GENERIC_DAY	0	2	2011-09-12	912	\N	1516
9588	GENERIC_DAY	0	2	2013-01-25	912	\N	1516
9589	GENERIC_DAY	0	2	2012-09-07	916	\N	1516
9590	GENERIC_DAY	0	2	2010-03-30	914	\N	1516
9591	GENERIC_DAY	0	2	2011-05-07	916	\N	1516
9592	GENERIC_DAY	0	2	2012-07-06	912	\N	1516
9593	GENERIC_DAY	0	2	2010-01-24	916	\N	1516
9594	GENERIC_DAY	0	2	2012-06-19	916	\N	1516
9595	GENERIC_DAY	0	2	2010-12-21	910	\N	1516
9596	GENERIC_DAY	0	2	2010-07-15	914	\N	1516
9597	GENERIC_DAY	0	2	2010-05-28	916	\N	1516
9598	GENERIC_DAY	0	2	2012-09-02	916	\N	1516
9599	GENERIC_DAY	0	2	2010-02-17	916	\N	1516
9600	GENERIC_DAY	0	2	2013-04-10	916	\N	1516
9601	GENERIC_DAY	0	2	2010-11-06	912	\N	1516
9602	GENERIC_DAY	0	2	2010-12-22	914	\N	1516
9603	GENERIC_DAY	0	2	2010-09-23	912	\N	1516
9604	GENERIC_DAY	0	2	2013-03-06	910	\N	1516
9605	GENERIC_DAY	0	2	2010-10-15	910	\N	1516
9606	GENERIC_DAY	0	2	2010-09-21	914	\N	1516
9607	GENERIC_DAY	0	2	2012-11-11	916	\N	1516
9608	GENERIC_DAY	0	2	2011-11-25	910	\N	1516
9609	GENERIC_DAY	0	2	2012-04-29	912	\N	1516
9610	GENERIC_DAY	0	2	2010-12-10	910	\N	1516
9611	GENERIC_DAY	0	2	2011-10-04	912	\N	1516
9612	GENERIC_DAY	0	2	2010-08-09	914	\N	1516
9613	GENERIC_DAY	0	2	2011-01-02	910	\N	1516
9614	GENERIC_DAY	0	2	2012-06-07	914	\N	1516
9615	GENERIC_DAY	0	2	2011-09-12	910	\N	1516
9616	GENERIC_DAY	0	2	2013-02-25	912	\N	1516
9617	GENERIC_DAY	0	2	2011-11-13	910	\N	1516
9618	GENERIC_DAY	0	2	2012-12-24	914	\N	1516
9619	GENERIC_DAY	0	2	2010-10-24	916	\N	1516
9620	GENERIC_DAY	0	2	2011-12-19	910	\N	1516
9621	GENERIC_DAY	0	2	2011-07-20	912	\N	1516
9622	GENERIC_DAY	0	2	2012-07-29	910	\N	1516
9623	GENERIC_DAY	0	2	2012-08-20	916	\N	1516
9624	GENERIC_DAY	0	2	2013-05-08	910	\N	1516
9625	GENERIC_DAY	0	2	2011-09-12	914	\N	1516
9626	GENERIC_DAY	0	2	2012-02-29	912	\N	1516
9627	GENERIC_DAY	0	2	2010-11-09	914	\N	1516
9628	GENERIC_DAY	0	2	2010-08-30	912	\N	1516
9629	GENERIC_DAY	0	2	2010-12-27	910	\N	1516
9630	GENERIC_DAY	0	2	2010-02-12	914	\N	1516
9631	GENERIC_DAY	0	2	2012-03-05	916	\N	1516
9632	GENERIC_DAY	0	2	2010-11-07	912	\N	1516
9633	GENERIC_DAY	0	2	2011-09-13	916	\N	1516
9634	GENERIC_DAY	0	2	2010-02-08	910	\N	1516
9635	GENERIC_DAY	0	2	2011-07-17	912	\N	1516
9636	GENERIC_DAY	0	2	2012-11-03	916	\N	1516
9637	GENERIC_DAY	0	2	2010-07-15	916	\N	1516
9638	GENERIC_DAY	0	2	2010-01-05	910	\N	1516
9639	GENERIC_DAY	0	2	2012-09-25	910	\N	1516
9640	GENERIC_DAY	0	2	2011-10-19	916	\N	1516
9641	GENERIC_DAY	0	2	2012-05-15	910	\N	1516
9642	GENERIC_DAY	0	2	2012-04-30	914	\N	1516
9643	GENERIC_DAY	0	2	2010-04-02	912	\N	1516
9644	GENERIC_DAY	0	2	2012-08-07	916	\N	1516
9645	GENERIC_DAY	0	2	2012-04-09	914	\N	1516
9646	GENERIC_DAY	0	2	2012-09-05	916	\N	1516
9647	GENERIC_DAY	0	2	2010-03-22	912	\N	1516
9648	GENERIC_DAY	0	2	2011-10-05	914	\N	1516
9649	GENERIC_DAY	0	2	2010-01-30	910	\N	1516
9650	GENERIC_DAY	0	2	2011-05-05	914	\N	1516
9651	GENERIC_DAY	0	2	2013-01-10	912	\N	1516
9652	GENERIC_DAY	0	2	2010-11-04	910	\N	1516
9653	GENERIC_DAY	0	2	2012-07-17	910	\N	1516
9654	GENERIC_DAY	0	2	2010-02-12	910	\N	1516
9655	GENERIC_DAY	0	2	2010-12-22	912	\N	1516
9656	GENERIC_DAY	0	2	2010-08-14	912	\N	1516
9657	GENERIC_DAY	0	2	2010-12-02	912	\N	1516
9658	GENERIC_DAY	0	2	2010-10-28	910	\N	1516
9659	GENERIC_DAY	0	2	2011-10-06	910	\N	1516
9660	GENERIC_DAY	0	2	2011-07-27	910	\N	1516
9661	GENERIC_DAY	0	2	2010-10-17	912	\N	1516
9662	GENERIC_DAY	0	2	2010-07-21	912	\N	1516
9663	GENERIC_DAY	0	2	2013-04-19	916	\N	1516
9664	GENERIC_DAY	0	2	2010-04-14	910	\N	1516
9665	GENERIC_DAY	0	2	2013-04-09	916	\N	1516
9666	GENERIC_DAY	0	2	2013-02-16	910	\N	1516
9667	GENERIC_DAY	0	2	2012-07-10	916	\N	1516
9668	GENERIC_DAY	0	2	2012-11-22	916	\N	1516
9669	GENERIC_DAY	0	2	2010-08-21	910	\N	1516
9670	GENERIC_DAY	0	2	2010-03-28	916	\N	1516
9671	GENERIC_DAY	0	2	2010-05-12	914	\N	1516
9672	GENERIC_DAY	0	2	2010-11-05	914	\N	1516
9673	GENERIC_DAY	0	2	2011-11-07	912	\N	1516
9674	GENERIC_DAY	0	2	2010-04-19	914	\N	1516
9675	GENERIC_DAY	0	2	2010-03-12	912	\N	1516
9676	GENERIC_DAY	0	2	2013-01-03	916	\N	1516
9677	GENERIC_DAY	0	2	2012-06-15	910	\N	1516
9678	GENERIC_DAY	0	2	2010-02-25	910	\N	1516
9679	GENERIC_DAY	0	2	2011-02-01	912	\N	1516
9680	GENERIC_DAY	0	2	2012-07-30	912	\N	1516
9681	GENERIC_DAY	0	2	2011-10-26	912	\N	1516
9682	GENERIC_DAY	0	2	2010-08-14	910	\N	1516
9683	GENERIC_DAY	0	2	2011-05-26	916	\N	1516
9684	GENERIC_DAY	0	2	2010-02-15	910	\N	1516
9685	GENERIC_DAY	0	2	2012-07-18	916	\N	1516
9686	GENERIC_DAY	0	2	2013-03-14	910	\N	1516
9687	GENERIC_DAY	0	2	2010-10-12	914	\N	1516
9688	GENERIC_DAY	0	2	2013-01-21	912	\N	1516
9689	GENERIC_DAY	0	2	2009-12-20	914	\N	1516
9690	GENERIC_DAY	0	2	2011-11-12	912	\N	1516
9691	GENERIC_DAY	0	2	2011-01-27	914	\N	1516
9692	GENERIC_DAY	0	2	2012-01-03	914	\N	1516
9693	GENERIC_DAY	0	2	2010-12-22	910	\N	1516
9694	GENERIC_DAY	0	2	2013-04-09	912	\N	1516
9695	GENERIC_DAY	0	2	2012-04-13	916	\N	1516
9696	GENERIC_DAY	0	2	2011-01-01	914	\N	1516
9697	GENERIC_DAY	0	2	2010-08-03	912	\N	1516
9698	GENERIC_DAY	0	2	2011-07-22	914	\N	1516
9699	GENERIC_DAY	0	2	2012-07-01	914	\N	1516
9700	GENERIC_DAY	0	2	2011-08-25	916	\N	1516
9701	GENERIC_DAY	0	2	2013-04-29	910	\N	1516
9702	GENERIC_DAY	0	2	2012-06-07	912	\N	1516
9703	GENERIC_DAY	0	2	2011-02-09	916	\N	1516
9704	GENERIC_DAY	0	2	2011-11-09	914	\N	1516
9705	GENERIC_DAY	0	2	2012-11-16	910	\N	1516
9706	GENERIC_DAY	0	2	2011-01-20	916	\N	1516
9707	GENERIC_DAY	0	2	2011-03-13	910	\N	1516
9708	GENERIC_DAY	0	2	2012-05-10	912	\N	1516
9709	GENERIC_DAY	0	2	2010-11-03	914	\N	1516
9710	GENERIC_DAY	0	2	2012-01-05	914	\N	1516
9711	GENERIC_DAY	0	2	2012-08-15	912	\N	1516
9712	GENERIC_DAY	0	2	2010-06-03	910	\N	1516
9713	GENERIC_DAY	0	2	2012-08-07	914	\N	1516
9714	GENERIC_DAY	0	2	2011-08-20	912	\N	1516
9715	GENERIC_DAY	0	2	2011-10-25	910	\N	1516
9716	GENERIC_DAY	0	2	2010-09-22	916	\N	1516
9717	GENERIC_DAY	0	2	2010-05-04	912	\N	1516
9718	GENERIC_DAY	0	2	2013-01-09	916	\N	1516
9719	GENERIC_DAY	0	2	2011-12-31	914	\N	1516
9720	GENERIC_DAY	0	2	2011-12-04	914	\N	1516
9721	GENERIC_DAY	0	2	2012-09-01	914	\N	1516
9722	GENERIC_DAY	0	2	2011-05-29	912	\N	1516
9723	GENERIC_DAY	0	2	2012-05-18	912	\N	1516
9724	GENERIC_DAY	0	2	2012-02-11	914	\N	1516
9725	GENERIC_DAY	0	2	2013-04-13	912	\N	1516
9726	GENERIC_DAY	0	2	2012-08-10	916	\N	1516
9727	GENERIC_DAY	0	2	2011-09-27	914	\N	1516
9728	GENERIC_DAY	0	2	2011-01-06	914	\N	1516
9729	GENERIC_DAY	0	2	2011-08-02	910	\N	1516
9730	GENERIC_DAY	0	2	2013-03-20	912	\N	1516
9731	GENERIC_DAY	0	2	2010-11-09	916	\N	1516
9732	GENERIC_DAY	0	2	2011-04-26	916	\N	1516
9733	GENERIC_DAY	0	2	2011-12-17	912	\N	1516
9734	GENERIC_DAY	0	2	2011-05-03	912	\N	1516
9735	GENERIC_DAY	0	2	2010-02-27	912	\N	1516
9736	GENERIC_DAY	0	2	2011-10-05	916	\N	1516
9737	GENERIC_DAY	0	2	2012-03-27	912	\N	1516
9738	GENERIC_DAY	0	2	2011-03-02	912	\N	1516
9739	GENERIC_DAY	0	2	2012-12-02	916	\N	1516
9740	GENERIC_DAY	0	2	2010-06-30	910	\N	1516
9741	GENERIC_DAY	0	2	2013-03-18	916	\N	1516
9742	GENERIC_DAY	0	2	2010-09-29	914	\N	1516
9743	GENERIC_DAY	0	2	2012-05-21	916	\N	1516
9744	GENERIC_DAY	0	2	2010-05-18	912	\N	1516
9745	GENERIC_DAY	0	2	2013-05-03	914	\N	1516
9746	GENERIC_DAY	0	2	2010-09-06	914	\N	1516
9747	GENERIC_DAY	0	2	2012-03-20	910	\N	1516
9748	GENERIC_DAY	0	2	2010-05-16	916	\N	1516
9749	GENERIC_DAY	0	2	2012-09-19	916	\N	1516
9750	GENERIC_DAY	0	2	2013-04-25	916	\N	1516
9751	GENERIC_DAY	0	2	2012-05-27	910	\N	1516
9752	GENERIC_DAY	0	2	2010-10-08	910	\N	1516
9753	GENERIC_DAY	0	2	2011-02-22	916	\N	1516
9754	GENERIC_DAY	0	2	2013-01-25	910	\N	1516
9755	GENERIC_DAY	0	2	2012-11-07	912	\N	1516
9756	GENERIC_DAY	0	2	2011-05-05	916	\N	1516
9757	GENERIC_DAY	0	2	2012-10-11	914	\N	1516
9758	GENERIC_DAY	0	2	2011-01-16	910	\N	1516
9759	GENERIC_DAY	0	2	2012-06-13	910	\N	1516
9760	GENERIC_DAY	0	2	2010-07-03	910	\N	1516
9761	GENERIC_DAY	0	2	2013-05-09	916	\N	1516
9762	GENERIC_DAY	0	2	2012-07-17	916	\N	1516
9763	GENERIC_DAY	0	2	2012-11-20	912	\N	1516
9764	GENERIC_DAY	0	2	2012-01-22	916	\N	1516
9765	GENERIC_DAY	0	2	2013-05-09	914	\N	1516
9766	GENERIC_DAY	0	2	2012-07-23	912	\N	1516
9767	GENERIC_DAY	0	2	2010-06-22	916	\N	1516
9768	GENERIC_DAY	0	2	2011-07-22	910	\N	1516
9769	GENERIC_DAY	0	2	2011-03-24	910	\N	1516
9770	GENERIC_DAY	0	2	2011-12-03	910	\N	1516
9771	GENERIC_DAY	0	2	2009-12-22	912	\N	1516
9772	GENERIC_DAY	0	2	2010-09-30	912	\N	1516
9773	GENERIC_DAY	0	2	2011-10-28	912	\N	1516
9774	GENERIC_DAY	0	2	2010-05-17	910	\N	1516
9775	GENERIC_DAY	0	2	2013-01-12	916	\N	1516
9776	GENERIC_DAY	0	2	2012-12-14	910	\N	1516
9777	GENERIC_DAY	0	2	2010-04-02	910	\N	1516
9778	GENERIC_DAY	0	2	2012-11-23	910	\N	1516
9779	GENERIC_DAY	0	2	2011-06-14	916	\N	1516
9780	GENERIC_DAY	0	2	2011-10-13	916	\N	1516
9781	GENERIC_DAY	0	2	2013-03-12	916	\N	1516
9782	GENERIC_DAY	0	2	2011-12-06	912	\N	1516
9783	GENERIC_DAY	0	2	2013-02-26	916	\N	1516
9784	GENERIC_DAY	0	2	2011-03-08	914	\N	1516
9785	GENERIC_DAY	0	2	2011-05-02	912	\N	1516
9786	GENERIC_DAY	0	2	2013-01-11	910	\N	1516
9787	GENERIC_DAY	0	2	2011-10-01	912	\N	1516
9788	GENERIC_DAY	0	2	2010-12-15	914	\N	1516
9789	GENERIC_DAY	0	2	2011-07-22	912	\N	1516
9790	GENERIC_DAY	0	2	2013-01-01	912	\N	1516
9791	GENERIC_DAY	0	2	2011-04-13	910	\N	1516
9792	GENERIC_DAY	0	2	2010-09-04	914	\N	1516
9793	GENERIC_DAY	0	2	2010-09-17	912	\N	1516
9794	GENERIC_DAY	0	2	2013-04-23	910	\N	1516
9795	GENERIC_DAY	0	2	2011-12-02	916	\N	1516
9796	GENERIC_DAY	0	2	2012-07-19	914	\N	1516
9797	GENERIC_DAY	0	2	2012-05-21	912	\N	1516
9798	GENERIC_DAY	0	2	2012-01-08	912	\N	1516
9799	GENERIC_DAY	0	2	2011-03-18	912	\N	1516
9800	GENERIC_DAY	0	2	2012-06-07	910	\N	1516
9801	GENERIC_DAY	0	2	2012-10-19	910	\N	1516
9802	GENERIC_DAY	0	2	2011-05-14	916	\N	1516
9803	GENERIC_DAY	0	2	2011-08-02	914	\N	1516
9804	GENERIC_DAY	0	2	2010-08-02	914	\N	1516
9805	GENERIC_DAY	0	2	2011-11-28	910	\N	1516
9806	GENERIC_DAY	0	2	2012-03-25	916	\N	1516
9807	GENERIC_DAY	0	2	2011-08-08	910	\N	1516
9808	GENERIC_DAY	0	2	2010-03-05	914	\N	1516
9809	GENERIC_DAY	0	2	2010-05-07	916	\N	1516
9810	GENERIC_DAY	0	2	2011-04-29	916	\N	1516
9811	GENERIC_DAY	0	2	2011-09-23	914	\N	1516
9812	GENERIC_DAY	0	2	2012-12-06	912	\N	1516
9813	GENERIC_DAY	0	2	2011-04-19	916	\N	1516
9814	GENERIC_DAY	0	2	2012-09-08	910	\N	1516
9815	GENERIC_DAY	0	2	2009-12-20	912	\N	1516
9816	GENERIC_DAY	0	2	2010-07-30	912	\N	1516
9817	GENERIC_DAY	0	2	2011-07-09	914	\N	1516
9818	GENERIC_DAY	0	2	2012-03-08	912	\N	1516
9819	GENERIC_DAY	0	2	2010-07-13	910	\N	1516
9820	GENERIC_DAY	0	2	2010-06-28	916	\N	1516
9821	GENERIC_DAY	0	2	2012-02-10	912	\N	1516
9822	GENERIC_DAY	0	2	2010-01-15	914	\N	1516
9823	GENERIC_DAY	0	2	2012-10-03	916	\N	1516
9824	GENERIC_DAY	0	2	2012-08-18	916	\N	1516
9825	GENERIC_DAY	0	2	2012-04-16	914	\N	1516
9826	GENERIC_DAY	0	2	2013-01-22	916	\N	1516
9827	GENERIC_DAY	0	2	2012-06-28	916	\N	1516
9828	GENERIC_DAY	0	2	2010-01-28	916	\N	1516
9829	GENERIC_DAY	0	2	2012-12-25	912	\N	1516
9830	GENERIC_DAY	0	2	2012-01-25	910	\N	1516
9831	GENERIC_DAY	0	2	2010-10-06	916	\N	1516
9832	GENERIC_DAY	0	2	2011-04-16	910	\N	1516
9833	GENERIC_DAY	0	2	2013-04-07	910	\N	1516
9834	GENERIC_DAY	0	2	2010-08-24	914	\N	1516
9835	GENERIC_DAY	0	2	2011-02-15	912	\N	1516
9836	GENERIC_DAY	0	2	2011-09-02	914	\N	1516
9837	GENERIC_DAY	0	2	2010-07-16	910	\N	1516
9838	GENERIC_DAY	0	2	2010-09-16	914	\N	1516
9839	GENERIC_DAY	0	2	2012-11-10	916	\N	1516
9840	GENERIC_DAY	0	2	2010-03-03	910	\N	1516
9841	GENERIC_DAY	0	2	2011-03-30	916	\N	1516
9842	GENERIC_DAY	0	2	2011-11-13	912	\N	1516
9843	GENERIC_DAY	0	2	2010-02-20	912	\N	1516
9844	GENERIC_DAY	0	2	2012-07-07	914	\N	1516
9845	GENERIC_DAY	0	2	2010-01-10	914	\N	1516
9846	GENERIC_DAY	0	2	2012-12-13	912	\N	1516
9847	GENERIC_DAY	0	2	2011-01-26	914	\N	1516
9848	GENERIC_DAY	0	2	2012-05-28	916	\N	1516
9849	GENERIC_DAY	0	2	2011-06-04	910	\N	1516
9850	GENERIC_DAY	0	2	2010-10-29	916	\N	1516
9851	GENERIC_DAY	0	2	2012-08-21	912	\N	1516
9852	GENERIC_DAY	0	2	2011-07-10	910	\N	1516
9853	GENERIC_DAY	0	2	2013-03-24	910	\N	1516
9854	GENERIC_DAY	0	2	2010-12-24	910	\N	1516
9855	GENERIC_DAY	0	2	2012-03-22	914	\N	1516
9856	GENERIC_DAY	0	2	2011-07-29	916	\N	1516
9857	GENERIC_DAY	0	2	2013-04-27	912	\N	1516
9858	GENERIC_DAY	0	2	2010-11-21	914	\N	1516
9859	GENERIC_DAY	0	2	2011-01-03	912	\N	1516
9860	GENERIC_DAY	0	2	2013-05-03	912	\N	1516
9861	GENERIC_DAY	0	2	2011-11-07	914	\N	1516
9862	GENERIC_DAY	0	2	2013-03-04	914	\N	1516
9863	GENERIC_DAY	0	2	2012-02-07	910	\N	1516
9864	GENERIC_DAY	0	2	2013-02-21	916	\N	1516
9865	GENERIC_DAY	0	2	2010-10-28	912	\N	1516
9866	GENERIC_DAY	0	2	2010-01-15	916	\N	1516
9867	GENERIC_DAY	0	2	2011-03-12	912	\N	1516
9868	GENERIC_DAY	0	2	2012-01-20	910	\N	1516
9869	GENERIC_DAY	0	2	2010-10-11	910	\N	1516
9870	GENERIC_DAY	0	2	2010-05-09	916	\N	1516
9871	GENERIC_DAY	0	2	2012-09-04	912	\N	1516
9872	GENERIC_DAY	0	2	2012-07-20	912	\N	1516
9873	GENERIC_DAY	0	2	2010-12-31	914	\N	1516
9874	GENERIC_DAY	0	2	2010-10-25	912	\N	1516
9875	GENERIC_DAY	0	2	2013-04-22	912	\N	1516
9876	GENERIC_DAY	0	2	2012-10-04	914	\N	1516
9877	GENERIC_DAY	0	2	2013-03-23	916	\N	1516
9878	GENERIC_DAY	0	2	2010-10-16	910	\N	1516
9879	GENERIC_DAY	0	2	2011-06-10	914	\N	1516
9880	GENERIC_DAY	0	2	2013-03-09	912	\N	1516
9881	GENERIC_DAY	0	2	2012-10-26	910	\N	1516
9882	GENERIC_DAY	0	2	2011-11-04	912	\N	1516
9883	GENERIC_DAY	0	2	2012-02-04	916	\N	1516
9884	GENERIC_DAY	0	2	2010-12-19	914	\N	1516
9885	GENERIC_DAY	0	2	2011-07-30	916	\N	1516
9886	GENERIC_DAY	0	2	2011-04-06	912	\N	1516
9887	GENERIC_DAY	0	2	2010-08-10	916	\N	1516
9888	GENERIC_DAY	0	2	2010-09-23	914	\N	1516
9889	GENERIC_DAY	0	2	2010-11-23	916	\N	1516
9890	GENERIC_DAY	0	2	2012-08-26	910	\N	1516
9891	GENERIC_DAY	0	2	2010-04-02	916	\N	1516
9892	GENERIC_DAY	0	2	2011-02-27	910	\N	1516
9893	GENERIC_DAY	0	2	2010-08-26	912	\N	1516
9894	GENERIC_DAY	0	2	2010-02-22	914	\N	1516
9895	GENERIC_DAY	0	2	2012-08-26	914	\N	1516
9896	GENERIC_DAY	0	2	2010-09-25	912	\N	1516
9897	GENERIC_DAY	0	2	2011-10-22	910	\N	1516
9898	GENERIC_DAY	0	2	2010-05-29	910	\N	1516
9899	GENERIC_DAY	0	2	2010-03-01	914	\N	1516
9900	GENERIC_DAY	0	2	2011-11-24	910	\N	1516
9901	GENERIC_DAY	0	2	2011-06-12	916	\N	1516
9902	GENERIC_DAY	0	2	2012-12-23	912	\N	1516
9903	GENERIC_DAY	0	2	2011-05-30	910	\N	1516
9904	GENERIC_DAY	0	2	2010-12-31	910	\N	1516
9905	GENERIC_DAY	0	2	2010-07-21	916	\N	1516
9906	GENERIC_DAY	0	2	2012-08-08	912	\N	1516
9907	GENERIC_DAY	0	2	2009-12-28	916	\N	1516
9908	GENERIC_DAY	0	2	2011-03-09	912	\N	1516
9909	GENERIC_DAY	0	2	2010-01-31	912	\N	1516
9910	GENERIC_DAY	0	2	2011-10-30	916	\N	1516
9911	GENERIC_DAY	0	2	2013-02-24	912	\N	1516
9912	GENERIC_DAY	0	2	2010-01-28	912	\N	1516
9913	GENERIC_DAY	0	2	2011-03-10	914	\N	1516
9914	GENERIC_DAY	0	2	2011-03-25	910	\N	1516
9915	GENERIC_DAY	0	2	2012-11-15	914	\N	1516
9916	GENERIC_DAY	0	2	2009-12-31	910	\N	1516
9917	GENERIC_DAY	0	2	2011-09-19	916	\N	1516
9918	GENERIC_DAY	0	2	2010-05-04	914	\N	1516
9919	GENERIC_DAY	0	2	2011-04-09	912	\N	1516
9920	GENERIC_DAY	0	2	2010-10-04	916	\N	1516
9921	GENERIC_DAY	0	2	2010-10-27	914	\N	1516
9922	GENERIC_DAY	0	2	2011-09-24	910	\N	1516
9923	GENERIC_DAY	0	2	2011-07-29	912	\N	1516
9924	GENERIC_DAY	0	2	2011-03-12	916	\N	1516
9925	GENERIC_DAY	0	2	2010-09-06	910	\N	1516
9926	GENERIC_DAY	0	2	2010-05-27	914	\N	1516
9927	GENERIC_DAY	0	2	2011-04-14	912	\N	1516
9928	GENERIC_DAY	0	2	2011-09-17	916	\N	1516
9929	GENERIC_DAY	0	2	2011-07-02	910	\N	1516
9930	GENERIC_DAY	0	2	2012-07-24	912	\N	1516
9931	GENERIC_DAY	0	2	2011-02-20	910	\N	1516
9932	GENERIC_DAY	0	2	2013-03-01	910	\N	1516
9933	GENERIC_DAY	0	2	2012-06-03	914	\N	1516
9934	GENERIC_DAY	0	2	2010-06-25	910	\N	1516
9935	GENERIC_DAY	0	2	2013-01-05	912	\N	1516
9936	GENERIC_DAY	0	2	2011-07-16	916	\N	1516
9937	GENERIC_DAY	0	2	2010-12-26	916	\N	1516
9938	GENERIC_DAY	0	2	2012-09-22	914	\N	1516
9939	GENERIC_DAY	0	2	2013-04-17	916	\N	1516
9940	GENERIC_DAY	0	2	2012-03-31	914	\N	1516
9941	GENERIC_DAY	0	2	2010-09-14	916	\N	1516
9942	GENERIC_DAY	0	2	2010-01-15	910	\N	1516
9943	GENERIC_DAY	0	2	2012-04-19	914	\N	1516
9944	GENERIC_DAY	0	2	2010-05-16	914	\N	1516
9945	GENERIC_DAY	0	2	2012-09-19	910	\N	1516
9946	GENERIC_DAY	0	2	2011-08-20	916	\N	1516
9947	GENERIC_DAY	0	2	2011-09-18	914	\N	1516
9948	GENERIC_DAY	0	2	2013-03-25	916	\N	1516
9949	GENERIC_DAY	0	2	2010-07-15	910	\N	1516
9950	GENERIC_DAY	0	2	2010-09-25	910	\N	1516
9951	GENERIC_DAY	0	2	2010-11-25	910	\N	1516
9952	GENERIC_DAY	0	2	2011-05-04	910	\N	1516
9953	GENERIC_DAY	0	2	2012-09-27	910	\N	1516
9954	GENERIC_DAY	0	2	2012-05-18	910	\N	1516
9955	GENERIC_DAY	0	2	2011-06-01	914	\N	1516
9956	GENERIC_DAY	0	2	2010-06-12	916	\N	1516
9957	GENERIC_DAY	0	2	2012-03-31	912	\N	1516
9958	GENERIC_DAY	0	2	2011-05-20	914	\N	1516
9959	GENERIC_DAY	0	2	2012-12-18	916	\N	1516
9960	GENERIC_DAY	0	2	2011-11-10	914	\N	1516
9961	GENERIC_DAY	0	2	2010-09-29	910	\N	1516
9962	GENERIC_DAY	0	2	2012-04-01	910	\N	1516
9963	GENERIC_DAY	0	2	2012-10-28	914	\N	1516
9964	GENERIC_DAY	0	2	2010-04-20	910	\N	1516
9965	GENERIC_DAY	0	2	2011-03-29	910	\N	1516
9966	GENERIC_DAY	0	2	2011-04-16	916	\N	1516
9967	GENERIC_DAY	0	2	2012-02-22	916	\N	1516
9968	GENERIC_DAY	0	2	2010-02-05	910	\N	1516
9969	GENERIC_DAY	0	2	2011-09-22	910	\N	1516
9970	GENERIC_DAY	0	2	2012-09-01	910	\N	1516
9971	GENERIC_DAY	0	2	2012-07-21	912	\N	1516
9972	GENERIC_DAY	0	2	2010-09-04	912	\N	1516
9973	GENERIC_DAY	0	2	2012-07-10	914	\N	1516
9974	GENERIC_DAY	0	2	2012-01-11	914	\N	1516
9975	GENERIC_DAY	0	2	2013-03-02	910	\N	1516
9976	GENERIC_DAY	0	2	2010-04-23	916	\N	1516
9977	GENERIC_DAY	0	2	2011-07-28	912	\N	1516
9978	GENERIC_DAY	0	2	2012-08-04	914	\N	1516
9979	GENERIC_DAY	0	2	2011-07-31	910	\N	1516
9980	GENERIC_DAY	0	2	2012-10-19	916	\N	1516
9981	GENERIC_DAY	0	2	2010-11-12	912	\N	1516
9982	GENERIC_DAY	0	2	2011-07-25	910	\N	1516
9983	GENERIC_DAY	0	2	2011-07-08	912	\N	1516
9984	GENERIC_DAY	0	2	2012-05-30	910	\N	1516
9985	GENERIC_DAY	0	2	2011-12-30	916	\N	1516
9986	GENERIC_DAY	0	2	2010-01-13	916	\N	1516
9987	GENERIC_DAY	0	2	2012-09-12	916	\N	1516
9988	GENERIC_DAY	0	2	2010-07-28	914	\N	1516
9989	GENERIC_DAY	0	2	2010-04-29	912	\N	1516
9990	GENERIC_DAY	0	2	2012-08-23	916	\N	1516
9991	GENERIC_DAY	0	2	2012-11-08	910	\N	1516
9992	GENERIC_DAY	0	2	2012-05-13	912	\N	1516
9993	GENERIC_DAY	0	2	2013-03-08	914	\N	1516
9994	GENERIC_DAY	0	2	2011-05-25	916	\N	1516
9995	GENERIC_DAY	0	2	2011-03-07	912	\N	1516
9996	GENERIC_DAY	0	2	2011-03-31	914	\N	1516
9997	GENERIC_DAY	0	2	2011-04-18	910	\N	1516
9998	GENERIC_DAY	0	2	2011-09-10	912	\N	1516
9999	GENERIC_DAY	0	2	2011-11-10	912	\N	1516
10000	GENERIC_DAY	0	2	2013-02-01	914	\N	1516
10001	GENERIC_DAY	0	2	2010-09-05	916	\N	1516
10002	GENERIC_DAY	0	2	2010-07-23	910	\N	1516
10003	GENERIC_DAY	0	2	2012-06-26	910	\N	1516
10004	GENERIC_DAY	0	2	2011-08-04	912	\N	1516
10005	GENERIC_DAY	0	2	2010-12-02	916	\N	1516
10006	GENERIC_DAY	0	2	2010-04-13	912	\N	1516
10007	GENERIC_DAY	0	2	2011-02-16	914	\N	1516
10008	GENERIC_DAY	0	2	2012-12-09	910	\N	1516
10009	GENERIC_DAY	0	2	2010-07-17	916	\N	1516
10010	GENERIC_DAY	0	2	2010-03-16	916	\N	1516
10011	GENERIC_DAY	0	2	2010-10-22	916	\N	1516
10012	GENERIC_DAY	0	2	2012-10-18	916	\N	1516
10013	GENERIC_DAY	0	2	2013-04-17	914	\N	1516
10014	GENERIC_DAY	0	2	2010-01-26	916	\N	1516
10015	GENERIC_DAY	0	2	2010-08-07	912	\N	1516
10016	GENERIC_DAY	0	2	2010-07-01	914	\N	1516
10017	GENERIC_DAY	0	2	2011-01-31	910	\N	1516
10018	GENERIC_DAY	0	2	2010-04-16	910	\N	1516
10019	GENERIC_DAY	0	2	2011-02-11	914	\N	1516
10020	GENERIC_DAY	0	2	2011-08-06	912	\N	1516
10021	GENERIC_DAY	0	2	2010-12-04	910	\N	1516
10022	GENERIC_DAY	0	2	2010-08-20	910	\N	1516
10023	GENERIC_DAY	0	2	2012-03-02	910	\N	1516
10024	GENERIC_DAY	0	2	2012-09-10	914	\N	1516
10025	GENERIC_DAY	0	2	2010-12-11	914	\N	1516
10026	GENERIC_DAY	0	2	2011-10-18	910	\N	1516
10027	GENERIC_DAY	0	2	2012-06-16	914	\N	1516
10028	GENERIC_DAY	0	2	2010-09-27	916	\N	1516
10029	GENERIC_DAY	0	2	2010-04-01	916	\N	1516
10030	GENERIC_DAY	0	2	2010-10-19	912	\N	1516
10031	GENERIC_DAY	0	2	2011-02-26	914	\N	1516
10032	GENERIC_DAY	0	2	2011-08-26	914	\N	1516
10033	GENERIC_DAY	0	2	2011-04-11	914	\N	1516
10034	GENERIC_DAY	0	2	2011-04-12	912	\N	1516
10035	GENERIC_DAY	0	2	2011-05-19	916	\N	1516
10036	GENERIC_DAY	0	2	2012-06-22	916	\N	1516
10037	GENERIC_DAY	0	2	2012-11-02	910	\N	1516
10038	GENERIC_DAY	0	2	2010-12-29	912	\N	1516
10039	GENERIC_DAY	0	2	2012-01-18	910	\N	1516
10040	GENERIC_DAY	0	2	2010-04-14	912	\N	1516
10041	GENERIC_DAY	0	2	2012-03-05	910	\N	1516
10042	GENERIC_DAY	0	2	2010-07-31	916	\N	1516
10043	GENERIC_DAY	0	2	2011-06-03	916	\N	1516
10044	GENERIC_DAY	0	2	2010-08-11	914	\N	1516
10045	GENERIC_DAY	0	2	2011-11-26	916	\N	1516
10046	GENERIC_DAY	0	2	2012-08-10	914	\N	1516
10047	GENERIC_DAY	0	2	2010-10-09	912	\N	1516
10048	GENERIC_DAY	0	2	2013-04-11	914	\N	1516
10049	GENERIC_DAY	0	2	2010-07-22	914	\N	1516
10050	GENERIC_DAY	0	2	2010-05-19	916	\N	1516
10051	GENERIC_DAY	0	2	2012-07-05	914	\N	1516
10052	GENERIC_DAY	0	2	2010-04-25	916	\N	1516
10053	GENERIC_DAY	0	2	2010-06-17	912	\N	1516
10054	GENERIC_DAY	0	2	2012-05-16	912	\N	1516
10055	GENERIC_DAY	0	2	2010-12-07	912	\N	1516
10056	GENERIC_DAY	0	2	2013-03-14	912	\N	1516
10057	GENERIC_DAY	0	2	2012-12-26	912	\N	1516
10058	GENERIC_DAY	0	2	2011-11-16	912	\N	1516
10059	GENERIC_DAY	0	2	2011-05-01	912	\N	1516
10060	GENERIC_DAY	0	2	2011-03-17	910	\N	1516
10061	GENERIC_DAY	0	2	2010-06-27	912	\N	1516
10062	GENERIC_DAY	0	2	2012-10-18	914	\N	1516
10063	GENERIC_DAY	0	2	2011-02-15	910	\N	1516
10064	GENERIC_DAY	0	2	2010-09-09	914	\N	1516
10065	GENERIC_DAY	0	2	2012-02-06	914	\N	1516
10066	GENERIC_DAY	0	2	2010-05-07	912	\N	1516
10067	GENERIC_DAY	0	2	2013-05-05	910	\N	1516
10068	GENERIC_DAY	0	2	2012-06-21	916	\N	1516
10069	GENERIC_DAY	0	2	2012-04-28	916	\N	1516
10070	GENERIC_DAY	0	2	2012-12-05	916	\N	1516
10071	GENERIC_DAY	0	2	2011-10-10	914	\N	1516
10072	GENERIC_DAY	0	2	2011-07-29	910	\N	1516
10073	GENERIC_DAY	0	2	2012-10-16	916	\N	1516
10074	GENERIC_DAY	0	2	2010-02-11	916	\N	1516
10075	GENERIC_DAY	0	2	2011-08-05	914	\N	1516
10076	GENERIC_DAY	0	2	2011-06-28	910	\N	1516
10077	GENERIC_DAY	0	2	2011-12-21	914	\N	1516
10078	GENERIC_DAY	0	2	2012-02-10	914	\N	1516
10079	GENERIC_DAY	0	2	2012-05-23	910	\N	1516
10080	GENERIC_DAY	0	2	2010-07-13	912	\N	1516
10081	GENERIC_DAY	0	2	2011-06-01	912	\N	1516
10082	GENERIC_DAY	0	2	2011-08-28	912	\N	1516
10083	GENERIC_DAY	0	2	2012-11-23	914	\N	1516
10084	GENERIC_DAY	0	2	2012-03-07	914	\N	1516
10085	GENERIC_DAY	0	2	2011-02-19	910	\N	1516
10086	GENERIC_DAY	0	2	2011-12-19	914	\N	1516
10087	GENERIC_DAY	0	2	2010-03-17	916	\N	1516
10088	GENERIC_DAY	0	2	2012-09-07	912	\N	1516
10089	GENERIC_DAY	0	2	2012-08-18	912	\N	1516
10090	GENERIC_DAY	0	2	2012-05-13	916	\N	1516
10091	GENERIC_DAY	0	2	2012-03-26	916	\N	1516
10092	GENERIC_DAY	0	2	2013-01-18	916	\N	1516
10093	GENERIC_DAY	0	2	2010-04-27	914	\N	1516
10094	GENERIC_DAY	0	2	2011-07-20	910	\N	1516
10095	GENERIC_DAY	0	2	2013-01-30	912	\N	1516
10096	GENERIC_DAY	0	2	2012-03-07	912	\N	1516
10097	GENERIC_DAY	0	2	2010-03-13	916	\N	1516
10098	GENERIC_DAY	0	2	2012-11-28	916	\N	1516
10099	GENERIC_DAY	0	2	2011-10-19	914	\N	1516
10100	GENERIC_DAY	0	2	2010-12-30	912	\N	1516
10101	GENERIC_DAY	0	2	2011-08-31	916	\N	1516
10102	GENERIC_DAY	0	2	2010-11-03	916	\N	1516
10103	GENERIC_DAY	0	2	2010-12-30	916	\N	1516
10104	GENERIC_DAY	0	2	2011-02-13	912	\N	1516
10105	GENERIC_DAY	0	2	2010-03-26	914	\N	1516
10106	GENERIC_DAY	0	2	2011-01-15	916	\N	1516
10107	GENERIC_DAY	0	2	2012-12-10	916	\N	1516
10108	GENERIC_DAY	0	2	2013-03-26	910	\N	1516
10109	GENERIC_DAY	0	2	2011-09-14	914	\N	1516
10110	GENERIC_DAY	0	2	2013-01-28	916	\N	1516
10111	GENERIC_DAY	0	2	2011-05-23	910	\N	1516
10112	GENERIC_DAY	0	2	2011-10-25	914	\N	1516
10113	GENERIC_DAY	0	2	2010-11-17	912	\N	1516
10114	GENERIC_DAY	0	2	2012-04-12	910	\N	1516
10115	GENERIC_DAY	0	2	2012-12-01	916	\N	1516
10116	GENERIC_DAY	0	2	2010-05-04	916	\N	1516
10117	GENERIC_DAY	0	2	2012-11-17	912	\N	1516
10118	GENERIC_DAY	0	2	2012-02-06	910	\N	1516
10119	GENERIC_DAY	0	2	2012-03-08	910	\N	1516
10120	GENERIC_DAY	0	2	2010-04-14	914	\N	1516
10121	GENERIC_DAY	0	2	2013-01-20	914	\N	1516
10122	GENERIC_DAY	0	2	2010-04-21	916	\N	1516
10123	GENERIC_DAY	0	2	2012-06-19	910	\N	1516
10124	GENERIC_DAY	0	2	2011-10-18	912	\N	1516
10125	GENERIC_DAY	0	2	2013-04-08	912	\N	1516
10126	GENERIC_DAY	0	2	2010-05-27	916	\N	1516
10127	GENERIC_DAY	0	2	2011-06-20	914	\N	1516
10128	GENERIC_DAY	0	2	2010-08-05	916	\N	1516
10129	GENERIC_DAY	0	2	2010-04-05	910	\N	1516
10130	GENERIC_DAY	0	2	2011-08-28	910	\N	1516
10131	GENERIC_DAY	0	2	2011-10-16	910	\N	1516
10132	GENERIC_DAY	0	2	2012-05-18	914	\N	1516
10133	GENERIC_DAY	0	2	2010-03-15	914	\N	1516
10134	GENERIC_DAY	0	2	2011-03-03	916	\N	1516
10135	GENERIC_DAY	0	2	2011-03-20	910	\N	1516
10136	GENERIC_DAY	0	2	2012-03-16	910	\N	1516
10137	GENERIC_DAY	0	2	2010-05-11	914	\N	1516
10138	GENERIC_DAY	0	2	2012-01-04	910	\N	1516
10139	GENERIC_DAY	0	2	2011-07-06	912	\N	1516
10140	GENERIC_DAY	0	2	2011-12-27	914	\N	1516
10141	GENERIC_DAY	0	2	2012-06-18	914	\N	1516
10142	GENERIC_DAY	0	2	2010-02-13	912	\N	1516
10143	GENERIC_DAY	0	2	2012-08-30	910	\N	1516
10144	GENERIC_DAY	0	2	2012-02-10	910	\N	1516
10145	GENERIC_DAY	0	2	2012-06-20	914	\N	1516
10146	GENERIC_DAY	0	2	2010-05-17	912	\N	1516
10147	GENERIC_DAY	0	2	2013-01-04	910	\N	1516
10148	GENERIC_DAY	0	2	2010-09-14	910	\N	1516
10149	GENERIC_DAY	0	2	2011-10-02	914	\N	1516
10150	GENERIC_DAY	0	2	2013-02-12	912	\N	1516
10151	GENERIC_DAY	0	2	2010-12-13	910	\N	1516
10152	GENERIC_DAY	0	2	2010-08-31	916	\N	1516
10153	GENERIC_DAY	0	2	2012-02-02	910	\N	1516
10154	GENERIC_DAY	0	2	2010-12-09	916	\N	1516
10155	GENERIC_DAY	0	2	2011-04-03	910	\N	1516
10156	GENERIC_DAY	0	2	2012-12-30	916	\N	1516
10157	GENERIC_DAY	0	2	2011-12-15	914	\N	1516
10158	GENERIC_DAY	0	2	2011-07-30	914	\N	1516
10159	GENERIC_DAY	0	2	2012-01-01	916	\N	1516
10160	GENERIC_DAY	0	2	2011-02-02	914	\N	1516
10161	GENERIC_DAY	0	2	2013-01-15	916	\N	1516
10162	GENERIC_DAY	0	2	2010-02-06	912	\N	1516
10163	GENERIC_DAY	0	2	2012-04-16	912	\N	1516
10164	GENERIC_DAY	0	2	2011-05-23	914	\N	1516
10165	GENERIC_DAY	0	2	2010-06-04	916	\N	1516
10166	GENERIC_DAY	0	2	2012-10-13	914	\N	1516
10167	GENERIC_DAY	0	2	2012-07-02	910	\N	1516
10168	GENERIC_DAY	0	0	2009-12-25	916	\N	1516
10169	GENERIC_DAY	0	2	2011-11-25	914	\N	1516
10170	GENERIC_DAY	0	2	2012-09-10	910	\N	1516
10171	GENERIC_DAY	0	2	2009-12-11	910	\N	1516
10172	GENERIC_DAY	0	2	2012-01-12	912	\N	1516
10173	GENERIC_DAY	0	2	2011-02-13	914	\N	1516
10174	GENERIC_DAY	0	2	2011-08-29	914	\N	1516
10175	GENERIC_DAY	0	2	2011-08-19	910	\N	1516
10176	GENERIC_DAY	0	2	2010-11-20	916	\N	1516
10177	GENERIC_DAY	0	2	2011-10-02	910	\N	1516
10178	GENERIC_DAY	0	2	2011-07-27	914	\N	1516
10179	GENERIC_DAY	0	2	2012-06-22	912	\N	1516
10180	GENERIC_DAY	0	2	2010-06-30	912	\N	1516
10181	GENERIC_DAY	0	2	2011-10-16	916	\N	1516
10182	GENERIC_DAY	0	2	2012-04-01	912	\N	1516
10183	GENERIC_DAY	0	2	2013-03-12	910	\N	1516
10184	GENERIC_DAY	0	2	2012-12-02	914	\N	1516
10185	GENERIC_DAY	0	2	2010-01-18	914	\N	1516
10186	GENERIC_DAY	0	2	2010-03-08	912	\N	1516
10187	GENERIC_DAY	0	2	2010-06-15	916	\N	1516
10188	GENERIC_DAY	0	2	2010-09-23	910	\N	1516
10189	GENERIC_DAY	0	2	2010-09-20	916	\N	1516
10190	GENERIC_DAY	0	2	2013-02-18	914	\N	1516
10191	GENERIC_DAY	0	2	2010-04-26	912	\N	1516
10192	GENERIC_DAY	0	2	2010-03-11	914	\N	1516
10193	GENERIC_DAY	0	2	2011-10-18	916	\N	1516
10194	GENERIC_DAY	0	2	2012-05-09	912	\N	1516
10195	GENERIC_DAY	0	2	2012-10-21	910	\N	1516
10196	GENERIC_DAY	0	2	2012-07-27	916	\N	1516
10197	GENERIC_DAY	0	2	2010-05-11	910	\N	1516
10198	GENERIC_DAY	0	2	2012-07-09	914	\N	1516
10199	GENERIC_DAY	0	2	2010-07-12	912	\N	1516
10200	GENERIC_DAY	0	2	2012-02-19	910	\N	1516
10201	GENERIC_DAY	0	2	2013-03-17	912	\N	1516
10202	GENERIC_DAY	0	2	2012-06-30	912	\N	1516
10203	GENERIC_DAY	0	2	2010-03-10	916	\N	1516
10204	GENERIC_DAY	0	2	2012-03-10	910	\N	1516
10205	GENERIC_DAY	0	2	2011-05-02	914	\N	1516
10206	GENERIC_DAY	0	2	2011-02-26	910	\N	1516
10207	GENERIC_DAY	0	2	2010-05-25	916	\N	1516
10208	GENERIC_DAY	0	2	2012-01-29	914	\N	1516
10209	GENERIC_DAY	0	2	2010-06-22	912	\N	1516
10210	GENERIC_DAY	0	2	2013-02-02	912	\N	1516
10211	GENERIC_DAY	0	2	2012-09-02	910	\N	1516
10212	GENERIC_DAY	0	2	2012-11-26	914	\N	1516
10213	GENERIC_DAY	0	2	2012-10-22	912	\N	1516
10214	GENERIC_DAY	0	2	2012-08-20	914	\N	1516
10215	GENERIC_DAY	0	2	2012-04-15	916	\N	1516
10216	GENERIC_DAY	0	2	2012-04-03	916	\N	1516
10217	GENERIC_DAY	0	2	2010-05-27	912	\N	1516
10218	GENERIC_DAY	0	2	2011-07-11	912	\N	1516
10219	GENERIC_DAY	0	2	2012-08-24	914	\N	1516
10220	GENERIC_DAY	0	2	2010-03-25	916	\N	1516
10221	GENERIC_DAY	0	2	2009-12-24	916	\N	1516
10222	GENERIC_DAY	0	2	2011-09-06	916	\N	1516
10223	GENERIC_DAY	0	2	2012-10-15	914	\N	1516
10224	GENERIC_DAY	0	2	2010-01-18	912	\N	1516
10225	GENERIC_DAY	0	2	2013-01-02	916	\N	1516
10226	GENERIC_DAY	0	2	2011-02-17	916	\N	1516
10227	GENERIC_DAY	0	2	2010-08-22	914	\N	1516
10228	GENERIC_DAY	0	2	2011-01-01	910	\N	1516
10229	GENERIC_DAY	0	2	2012-03-07	916	\N	1516
10230	GENERIC_DAY	0	2	2011-08-09	910	\N	1516
10231	GENERIC_DAY	0	2	2010-11-22	910	\N	1516
10232	GENERIC_DAY	0	2	2013-02-14	916	\N	1516
10233	GENERIC_DAY	0	2	2011-02-03	914	\N	1516
10234	GENERIC_DAY	0	2	2011-11-29	910	\N	1516
10235	GENERIC_DAY	0	2	2012-07-15	914	\N	1516
10236	GENERIC_DAY	0	2	2012-05-03	912	\N	1516
10237	GENERIC_DAY	0	2	2011-03-22	916	\N	1516
10238	GENERIC_DAY	0	2	2011-09-08	914	\N	1516
10239	GENERIC_DAY	0	2	2012-02-04	914	\N	1516
10240	GENERIC_DAY	0	2	2011-09-15	914	\N	1516
10241	GENERIC_DAY	0	2	2010-05-08	914	\N	1516
10242	GENERIC_DAY	0	2	2010-06-01	916	\N	1516
10243	GENERIC_DAY	0	2	2009-12-21	910	\N	1516
10244	GENERIC_DAY	0	2	2012-07-16	912	\N	1516
10245	GENERIC_DAY	0	2	2011-06-20	912	\N	1516
10246	GENERIC_DAY	0	2	2013-02-09	910	\N	1516
10247	GENERIC_DAY	0	2	2012-06-05	916	\N	1516
10248	GENERIC_DAY	0	2	2010-11-14	914	\N	1516
10249	GENERIC_DAY	0	2	2011-01-14	916	\N	1516
10250	GENERIC_DAY	0	2	2013-01-09	912	\N	1516
10251	GENERIC_DAY	0	2	2010-06-26	916	\N	1516
10252	GENERIC_DAY	0	2	2011-10-07	914	\N	1516
10253	GENERIC_DAY	0	2	2013-01-08	910	\N	1516
10254	GENERIC_DAY	0	2	2010-05-23	910	\N	1516
10255	GENERIC_DAY	0	2	2012-03-20	912	\N	1516
10256	GENERIC_DAY	0	2	2011-09-16	910	\N	1516
10257	GENERIC_DAY	0	2	2012-01-05	912	\N	1516
10258	GENERIC_DAY	0	2	2012-09-08	914	\N	1516
10259	GENERIC_DAY	0	2	2011-01-28	910	\N	1516
10260	GENERIC_DAY	0	2	2013-04-07	912	\N	1516
10261	GENERIC_DAY	0	2	2013-03-08	916	\N	1516
10262	GENERIC_DAY	0	2	2011-11-08	914	\N	1516
10263	GENERIC_DAY	0	2	2010-11-18	912	\N	1516
10264	GENERIC_DAY	0	2	2010-07-05	912	\N	1516
10265	GENERIC_DAY	0	2	2013-04-10	912	\N	1516
10266	GENERIC_DAY	0	2	2010-04-01	912	\N	1516
10267	GENERIC_DAY	0	2	2010-08-27	916	\N	1516
10268	GENERIC_DAY	0	2	2010-03-24	910	\N	1516
10269	GENERIC_DAY	0	2	2010-12-07	910	\N	1516
10270	GENERIC_DAY	0	2	2011-03-28	914	\N	1516
10271	GENERIC_DAY	0	2	2011-05-09	910	\N	1516
10272	GENERIC_DAY	0	2	2010-11-08	914	\N	1516
10273	GENERIC_DAY	0	2	2013-04-21	916	\N	1516
10274	GENERIC_DAY	0	2	2013-03-30	910	\N	1516
10275	GENERIC_DAY	0	2	2010-06-11	914	\N	1516
10276	GENERIC_DAY	0	2	2012-02-20	912	\N	1516
10277	GENERIC_DAY	0	2	2012-01-08	914	\N	1516
10278	GENERIC_DAY	0	2	2010-11-12	910	\N	1516
10279	GENERIC_DAY	0	2	2011-02-17	914	\N	1516
10280	GENERIC_DAY	0	2	2010-10-16	914	\N	1516
10281	GENERIC_DAY	0	2	2013-01-04	916	\N	1516
10282	GENERIC_DAY	0	2	2011-09-03	914	\N	1516
10283	GENERIC_DAY	0	2	2012-09-22	916	\N	1516
10284	GENERIC_DAY	0	2	2012-09-03	914	\N	1516
10285	GENERIC_DAY	0	2	2009-12-24	914	\N	1516
10286	GENERIC_DAY	0	2	2011-07-18	910	\N	1516
10287	GENERIC_DAY	0	2	2013-03-13	910	\N	1516
10288	GENERIC_DAY	0	2	2012-02-24	912	\N	1516
10289	GENERIC_DAY	0	2	2011-02-18	914	\N	1516
10290	GENERIC_DAY	0	2	2012-09-11	912	\N	1516
10291	GENERIC_DAY	0	2	2011-12-03	916	\N	1516
10292	GENERIC_DAY	0	2	2011-12-18	916	\N	1516
10293	GENERIC_DAY	0	2	2013-02-17	912	\N	1516
10294	GENERIC_DAY	0	2	2010-01-27	912	\N	1516
10295	GENERIC_DAY	0	2	2011-06-07	916	\N	1516
10296	GENERIC_DAY	0	2	2011-12-30	910	\N	1516
10297	GENERIC_DAY	0	2	2011-02-27	912	\N	1516
10298	GENERIC_DAY	0	2	2011-07-03	910	\N	1516
10299	GENERIC_DAY	0	2	2010-04-09	914	\N	1516
10300	GENERIC_DAY	0	2	2013-02-05	916	\N	1516
10301	GENERIC_DAY	0	2	2011-11-03	914	\N	1516
10302	GENERIC_DAY	0	2	2010-01-31	914	\N	1516
10303	GENERIC_DAY	0	2	2012-09-29	914	\N	1516
10304	GENERIC_DAY	0	2	2010-11-25	916	\N	1516
10305	GENERIC_DAY	0	2	2013-01-07	910	\N	1516
10306	GENERIC_DAY	0	2	2010-11-09	912	\N	1516
10307	GENERIC_DAY	0	2	2012-11-08	912	\N	1516
10308	GENERIC_DAY	0	2	2012-09-21	916	\N	1516
10309	GENERIC_DAY	0	2	2013-04-29	912	\N	1516
10310	GENERIC_DAY	0	2	2013-04-14	912	\N	1516
10311	GENERIC_DAY	0	2	2011-08-05	916	\N	1516
10312	GENERIC_DAY	0	2	2009-12-17	914	\N	1516
10313	GENERIC_DAY	0	2	2011-11-19	914	\N	1516
10314	GENERIC_DAY	0	2	2012-10-20	912	\N	1516
10315	GENERIC_DAY	0	2	2013-01-04	914	\N	1516
10316	GENERIC_DAY	0	2	2011-02-22	912	\N	1516
10317	GENERIC_DAY	0	2	2013-03-10	910	\N	1516
10318	GENERIC_DAY	0	2	2011-08-28	914	\N	1516
10319	GENERIC_DAY	0	2	2012-07-22	910	\N	1516
10320	GENERIC_DAY	0	2	2011-11-23	914	\N	1516
10321	GENERIC_DAY	0	2	2010-10-11	914	\N	1516
10322	GENERIC_DAY	0	2	2011-05-29	910	\N	1516
10323	GENERIC_DAY	0	2	2011-03-11	916	\N	1516
10324	GENERIC_DAY	0	2	2012-04-08	910	\N	1516
10325	GENERIC_DAY	0	2	2010-05-26	912	\N	1516
10326	GENERIC_DAY	0	2	2011-06-03	914	\N	1516
10327	GENERIC_DAY	0	2	2010-04-29	916	\N	1516
10328	GENERIC_DAY	0	2	2011-09-29	914	\N	1516
10329	GENERIC_DAY	0	2	2011-10-10	916	\N	1516
10330	GENERIC_DAY	0	2	2013-05-02	914	\N	1516
10331	GENERIC_DAY	0	2	2011-06-08	916	\N	1516
10332	GENERIC_DAY	0	2	2011-01-06	912	\N	1516
10333	GENERIC_DAY	0	2	2013-02-26	910	\N	1516
10334	GENERIC_DAY	0	2	2010-04-11	916	\N	1516
10335	GENERIC_DAY	0	2	2011-02-25	912	\N	1516
10336	GENERIC_DAY	0	2	2012-01-28	910	\N	1516
10337	GENERIC_DAY	0	2	2012-08-14	914	\N	1516
10338	GENERIC_DAY	0	2	2011-07-18	912	\N	1516
10339	GENERIC_DAY	0	2	2011-05-03	916	\N	1516
10340	GENERIC_DAY	0	2	2012-05-29	912	\N	1516
10341	GENERIC_DAY	0	2	2011-09-19	912	\N	1516
10342	GENERIC_DAY	0	2	2012-12-13	914	\N	1516
10343	GENERIC_DAY	0	2	2012-05-14	916	\N	1516
10344	GENERIC_DAY	0	2	2011-11-20	916	\N	1516
10345	GENERIC_DAY	0	2	2013-01-26	910	\N	1516
10346	GENERIC_DAY	0	2	2010-02-13	910	\N	1516
10347	GENERIC_DAY	0	2	2013-02-04	910	\N	1516
10348	GENERIC_DAY	0	2	2012-09-09	914	\N	1516
10349	GENERIC_DAY	0	2	2010-11-01	910	\N	1516
10350	GENERIC_DAY	0	2	2011-01-07	912	\N	1516
10351	GENERIC_DAY	0	2	2012-03-24	912	\N	1516
10352	GENERIC_DAY	0	2	2011-02-21	912	\N	1516
10353	GENERIC_DAY	0	2	2013-03-24	912	\N	1516
10354	GENERIC_DAY	0	2	2010-06-12	910	\N	1516
10355	GENERIC_DAY	0	2	2010-08-21	916	\N	1516
10356	GENERIC_DAY	0	2	2012-01-07	912	\N	1516
10357	GENERIC_DAY	0	2	2010-04-25	910	\N	1516
10358	GENERIC_DAY	0	2	2010-12-10	912	\N	1516
10359	GENERIC_DAY	0	2	2011-04-01	916	\N	1516
10360	GENERIC_DAY	0	2	2012-04-06	916	\N	1516
10361	GENERIC_DAY	0	2	2010-05-24	914	\N	1516
10362	GENERIC_DAY	0	2	2011-08-26	916	\N	1516
10363	GENERIC_DAY	0	2	2010-01-08	912	\N	1516
10364	GENERIC_DAY	0	2	2012-02-17	916	\N	1516
10365	GENERIC_DAY	0	2	2011-09-22	914	\N	1516
10366	GENERIC_DAY	0	2	2010-04-19	916	\N	1516
10367	GENERIC_DAY	0	2	2010-12-17	916	\N	1516
10368	GENERIC_DAY	0	2	2012-03-26	910	\N	1516
10369	GENERIC_DAY	0	2	2010-07-19	914	\N	1516
10370	GENERIC_DAY	0	2	2012-12-06	914	\N	1516
10371	GENERIC_DAY	0	2	2011-12-30	912	\N	1516
10372	GENERIC_DAY	0	2	2012-06-26	914	\N	1516
10373	GENERIC_DAY	0	2	2012-08-28	910	\N	1516
10374	GENERIC_DAY	0	2	2010-08-22	910	\N	1516
10375	GENERIC_DAY	0	2	2012-04-27	912	\N	1516
10376	GENERIC_DAY	0	2	2010-05-24	916	\N	1516
10377	GENERIC_DAY	0	2	2012-05-28	914	\N	1516
10378	GENERIC_DAY	0	2	2010-11-13	916	\N	1516
10379	GENERIC_DAY	0	2	2013-04-02	912	\N	1516
10380	GENERIC_DAY	0	2	2012-09-27	916	\N	1516
10381	GENERIC_DAY	0	2	2011-06-17	914	\N	1516
10382	GENERIC_DAY	0	2	2010-12-11	916	\N	1516
10383	GENERIC_DAY	0	2	2013-02-20	914	\N	1516
10384	GENERIC_DAY	0	2	2012-03-01	916	\N	1516
10385	GENERIC_DAY	0	2	2012-12-01	910	\N	1516
10386	GENERIC_DAY	0	2	2011-04-21	912	\N	1516
10387	GENERIC_DAY	0	2	2012-01-06	910	\N	1516
10388	GENERIC_DAY	0	2	2011-06-09	914	\N	1516
10389	GENERIC_DAY	0	2	2011-08-01	912	\N	1516
10390	GENERIC_DAY	0	2	2011-12-27	912	\N	1516
10391	GENERIC_DAY	0	2	2012-12-04	914	\N	1516
10392	GENERIC_DAY	0	2	2011-04-28	912	\N	1516
10393	GENERIC_DAY	0	2	2011-07-10	914	\N	1516
10394	GENERIC_DAY	0	2	2011-08-03	912	\N	1516
10395	GENERIC_DAY	0	2	2011-07-05	910	\N	1516
10396	GENERIC_DAY	0	2	2010-08-04	916	\N	1516
10397	GENERIC_DAY	0	2	2010-12-08	916	\N	1516
10398	GENERIC_DAY	0	2	2013-05-07	912	\N	1516
10399	GENERIC_DAY	0	2	2012-08-10	912	\N	1516
10400	GENERIC_DAY	0	2	2010-08-15	910	\N	1516
10401	GENERIC_DAY	0	2	2010-07-10	914	\N	1516
10402	GENERIC_DAY	0	2	2010-10-31	912	\N	1516
10403	GENERIC_DAY	0	2	2011-11-13	916	\N	1516
10404	GENERIC_DAY	0	2	2013-01-17	914	\N	1516
10405	GENERIC_DAY	0	2	2013-02-08	914	\N	1516
10406	GENERIC_DAY	0	2	2011-02-19	914	\N	1516
10407	GENERIC_DAY	0	2	2011-02-16	916	\N	1516
10408	GENERIC_DAY	0	2	2013-03-28	914	\N	1516
10409	GENERIC_DAY	0	2	2012-01-30	916	\N	1516
10410	GENERIC_DAY	0	2	2010-07-11	910	\N	1516
10411	GENERIC_DAY	0	2	2013-04-01	914	\N	1516
10412	GENERIC_DAY	0	2	2011-01-01	912	\N	1516
10413	GENERIC_DAY	0	2	2010-07-13	916	\N	1516
10414	GENERIC_DAY	0	2	2011-09-26	914	\N	1516
10415	GENERIC_DAY	0	2	2010-04-01	914	\N	1516
10416	GENERIC_DAY	0	2	2010-12-07	916	\N	1516
10417	GENERIC_DAY	0	2	2010-04-01	910	\N	1516
10418	GENERIC_DAY	0	2	2012-11-25	912	\N	1516
10419	GENERIC_DAY	0	2	2012-08-22	910	\N	1516
10420	GENERIC_DAY	0	2	2010-04-18	916	\N	1516
10421	GENERIC_DAY	0	2	2010-12-12	912	\N	1516
10422	GENERIC_DAY	0	2	2010-09-29	912	\N	1516
10423	GENERIC_DAY	0	2	2009-12-11	916	\N	1516
10424	GENERIC_DAY	0	2	2012-07-27	910	\N	1516
10425	GENERIC_DAY	0	2	2010-12-05	916	\N	1516
10426	GENERIC_DAY	0	2	2011-07-08	910	\N	1516
10427	GENERIC_DAY	0	2	2010-12-28	912	\N	1516
10428	GENERIC_DAY	0	2	2009-12-13	914	\N	1516
10429	GENERIC_DAY	0	2	2012-10-29	916	\N	1516
10430	GENERIC_DAY	0	2	2012-09-17	910	\N	1516
10431	GENERIC_DAY	0	2	2012-02-21	916	\N	1516
10432	GENERIC_DAY	0	2	2011-02-16	912	\N	1516
10433	GENERIC_DAY	0	2	2012-12-18	914	\N	1516
10434	GENERIC_DAY	0	2	2012-06-27	912	\N	1516
10435	GENERIC_DAY	0	2	2011-06-30	912	\N	1516
10436	GENERIC_DAY	0	2	2012-03-28	914	\N	1516
10437	GENERIC_DAY	0	2	2010-10-19	910	\N	1516
10438	GENERIC_DAY	0	2	2012-04-02	910	\N	1516
10439	GENERIC_DAY	0	2	2010-08-24	916	\N	1516
10440	GENERIC_DAY	0	2	2012-03-02	914	\N	1516
10441	GENERIC_DAY	0	2	2012-02-19	912	\N	1516
10442	GENERIC_DAY	0	2	2010-04-26	914	\N	1516
10443	GENERIC_DAY	0	2	2010-06-09	912	\N	1516
10444	GENERIC_DAY	0	2	2012-01-01	910	\N	1516
10445	GENERIC_DAY	0	2	2012-03-01	912	\N	1516
10446	GENERIC_DAY	0	2	2010-06-16	910	\N	1516
10447	GENERIC_DAY	0	2	2011-01-10	912	\N	1516
10448	GENERIC_DAY	0	2	2011-11-26	912	\N	1516
10449	GENERIC_DAY	0	2	2012-12-07	910	\N	1516
10450	GENERIC_DAY	0	2	2010-12-22	916	\N	1516
10451	GENERIC_DAY	0	2	2011-04-03	916	\N	1516
10452	GENERIC_DAY	0	2	2013-02-08	912	\N	1516
10453	GENERIC_DAY	0	2	2011-07-14	914	\N	1516
10454	GENERIC_DAY	0	2	2012-06-21	912	\N	1516
10455	GENERIC_DAY	0	2	2010-10-08	912	\N	1516
10456	GENERIC_DAY	0	2	2010-05-03	910	\N	1516
10457	GENERIC_DAY	0	2	2013-01-25	914	\N	1516
10458	GENERIC_DAY	0	2	2011-04-27	916	\N	1516
10459	GENERIC_DAY	0	2	2012-04-24	910	\N	1516
10460	GENERIC_DAY	0	2	2012-02-21	914	\N	1516
10461	GENERIC_DAY	0	2	2012-10-02	916	\N	1516
10462	GENERIC_DAY	0	2	2012-11-05	912	\N	1516
10463	GENERIC_DAY	0	2	2012-09-16	912	\N	1516
10464	GENERIC_DAY	0	2	2012-07-21	916	\N	1516
10465	GENERIC_DAY	0	2	2012-05-17	910	\N	1516
10466	GENERIC_DAY	0	2	2012-09-13	912	\N	1516
10467	GENERIC_DAY	0	2	2010-02-03	912	\N	1516
10468	GENERIC_DAY	0	2	2011-08-09	916	\N	1516
10469	GENERIC_DAY	0	2	2011-12-31	916	\N	1516
10470	GENERIC_DAY	0	2	2011-01-19	916	\N	1516
10471	GENERIC_DAY	0	2	2012-10-06	910	\N	1516
10472	GENERIC_DAY	0	2	2012-03-12	910	\N	1516
10473	GENERIC_DAY	0	2	2013-01-27	910	\N	1516
10474	GENERIC_DAY	0	2	2012-12-08	914	\N	1516
10475	GENERIC_DAY	0	2	2012-05-21	910	\N	1516
10476	GENERIC_DAY	0	2	2012-10-23	910	\N	1516
10477	GENERIC_DAY	0	2	2011-10-03	912	\N	1516
10478	GENERIC_DAY	0	2	2010-10-29	914	\N	1516
10479	GENERIC_DAY	0	2	2010-08-10	910	\N	1516
10480	GENERIC_DAY	0	2	2010-10-31	914	\N	1516
10481	GENERIC_DAY	0	2	2012-10-02	914	\N	1516
10482	GENERIC_DAY	0	2	2009-12-17	916	\N	1516
10483	GENERIC_DAY	0	2	2012-11-20	910	\N	1516
10484	GENERIC_DAY	0	2	2012-05-07	916	\N	1516
10485	GENERIC_DAY	0	2	2011-09-11	912	\N	1516
10486	GENERIC_DAY	0	2	2010-12-15	910	\N	1516
10487	GENERIC_DAY	0	2	2011-10-11	916	\N	1516
10488	GENERIC_DAY	0	2	2011-03-21	916	\N	1516
10489	GENERIC_DAY	0	2	2011-12-20	910	\N	1516
10490	GENERIC_DAY	0	2	2012-10-09	916	\N	1516
10491	GENERIC_DAY	0	2	2011-06-23	912	\N	1516
10492	GENERIC_DAY	0	2	2011-07-17	914	\N	1516
10493	GENERIC_DAY	0	2	2010-08-26	914	\N	1516
10494	GENERIC_DAY	0	2	2010-07-19	910	\N	1516
10495	GENERIC_DAY	0	2	2009-12-20	910	\N	1516
10496	GENERIC_DAY	0	2	2012-03-07	910	\N	1516
10497	GENERIC_DAY	0	2	2010-08-03	914	\N	1516
10498	GENERIC_DAY	0	2	2010-12-26	910	\N	1516
10499	GENERIC_DAY	0	2	2010-06-27	914	\N	1516
10500	GENERIC_DAY	0	2	2010-05-25	910	\N	1516
10501	GENERIC_DAY	0	2	2010-12-13	912	\N	1516
10502	GENERIC_DAY	0	2	2010-09-28	916	\N	1516
10503	GENERIC_DAY	0	2	2011-04-26	912	\N	1516
10504	GENERIC_DAY	0	2	2011-08-27	910	\N	1516
10505	GENERIC_DAY	0	2	2013-04-10	910	\N	1516
10506	GENERIC_DAY	0	2	2012-11-17	910	\N	1516
10507	GENERIC_DAY	0	2	2010-06-07	910	\N	1516
10508	GENERIC_DAY	0	2	2011-12-30	914	\N	1516
10509	GENERIC_DAY	0	2	2010-01-02	914	\N	1516
10510	GENERIC_DAY	0	2	2012-08-19	910	\N	1516
10511	GENERIC_DAY	0	2	2010-09-20	914	\N	1516
10512	GENERIC_DAY	0	2	2012-09-23	910	\N	1516
10513	GENERIC_DAY	0	2	2012-09-04	914	\N	1516
10514	GENERIC_DAY	0	2	2010-12-12	910	\N	1516
10515	GENERIC_DAY	0	2	2011-05-16	912	\N	1516
10516	GENERIC_DAY	0	2	2010-02-09	910	\N	1516
10517	GENERIC_DAY	0	2	2010-03-27	914	\N	1516
10518	GENERIC_DAY	0	2	2012-06-06	910	\N	1516
10519	GENERIC_DAY	0	2	2011-02-28	914	\N	1516
10520	GENERIC_DAY	0	2	2012-07-07	912	\N	1516
10521	GENERIC_DAY	0	2	2010-10-05	910	\N	1516
10522	GENERIC_DAY	0	2	2011-03-02	916	\N	1516
10523	GENERIC_DAY	0	2	2011-01-12	910	\N	1516
10524	GENERIC_DAY	0	2	2011-12-27	910	\N	1516
10525	GENERIC_DAY	0	2	2010-12-16	912	\N	1516
10526	GENERIC_DAY	0	2	2013-05-06	916	\N	1516
10527	GENERIC_DAY	0	2	2012-08-19	916	\N	1516
10528	GENERIC_DAY	0	2	2012-03-19	912	\N	1516
10529	GENERIC_DAY	0	2	2009-12-29	910	\N	1516
10530	GENERIC_DAY	0	2	2013-04-04	910	\N	1516
10531	GENERIC_DAY	0	2	2011-12-02	912	\N	1516
10532	GENERIC_DAY	0	2	2013-04-24	910	\N	1516
10533	GENERIC_DAY	0	2	2011-08-31	914	\N	1516
10534	GENERIC_DAY	0	2	2011-09-30	912	\N	1516
10535	GENERIC_DAY	0	2	2010-09-16	910	\N	1516
10536	GENERIC_DAY	0	2	2013-04-23	916	\N	1516
10537	GENERIC_DAY	0	2	2013-03-06	916	\N	1516
10538	GENERIC_DAY	0	2	2009-12-23	916	\N	1516
10539	GENERIC_DAY	0	2	2012-08-04	916	\N	1516
10540	GENERIC_DAY	0	2	2011-12-02	910	\N	1516
10541	GENERIC_DAY	0	2	2011-03-15	914	\N	1516
10542	GENERIC_DAY	0	2	2010-08-16	914	\N	1516
10543	GENERIC_DAY	0	2	2012-07-25	912	\N	1516
10544	GENERIC_DAY	0	2	2011-10-02	912	\N	1516
10545	GENERIC_DAY	0	2	2012-01-16	910	\N	1516
10546	GENERIC_DAY	0	2	2012-09-12	910	\N	1516
10547	GENERIC_DAY	0	2	2012-04-19	916	\N	1516
10548	GENERIC_DAY	0	2	2010-07-02	910	\N	1516
10549	GENERIC_DAY	0	2	2009-12-14	914	\N	1516
10550	GENERIC_DAY	0	2	2012-06-02	916	\N	1516
10551	GENERIC_DAY	0	2	2011-06-28	914	\N	1516
10552	GENERIC_DAY	0	2	2012-06-01	910	\N	1516
10553	GENERIC_DAY	0	2	2011-05-13	912	\N	1516
10554	GENERIC_DAY	0	2	2012-04-29	916	\N	1516
10555	GENERIC_DAY	0	2	2012-03-14	914	\N	1516
10556	GENERIC_DAY	0	2	2010-12-23	910	\N	1516
10557	GENERIC_DAY	0	2	2013-01-27	914	\N	1516
10558	GENERIC_DAY	0	2	2012-10-25	916	\N	1516
10559	GENERIC_DAY	0	2	2012-09-13	914	\N	1516
10560	GENERIC_DAY	0	2	2012-09-26	916	\N	1516
10561	GENERIC_DAY	0	2	2011-05-06	914	\N	1516
10562	GENERIC_DAY	0	2	2011-11-18	910	\N	1516
10563	GENERIC_DAY	0	2	2012-05-29	916	\N	1516
10564	GENERIC_DAY	0	2	2011-04-25	914	\N	1516
10565	GENERIC_DAY	0	2	2011-02-04	912	\N	1516
10566	GENERIC_DAY	0	2	2012-07-05	916	\N	1516
10567	GENERIC_DAY	0	2	2011-08-19	916	\N	1516
10568	GENERIC_DAY	0	2	2012-07-05	910	\N	1516
10569	GENERIC_DAY	0	2	2010-07-01	910	\N	1516
10570	GENERIC_DAY	0	2	2010-10-27	910	\N	1516
10571	GENERIC_DAY	0	2	2011-02-28	912	\N	1516
10572	GENERIC_DAY	0	2	2011-10-14	914	\N	1516
10573	GENERIC_DAY	0	2	2012-10-17	916	\N	1516
10574	GENERIC_DAY	0	2	2012-02-24	910	\N	1516
10575	GENERIC_DAY	0	2	2011-02-06	910	\N	1516
10576	GENERIC_DAY	0	2	2010-07-24	916	\N	1516
10577	GENERIC_DAY	0	2	2012-02-08	910	\N	1516
10578	GENERIC_DAY	0	2	2012-06-30	916	\N	1516
10579	GENERIC_DAY	0	2	2012-04-18	916	\N	1516
10580	GENERIC_DAY	0	2	2011-03-09	916	\N	1516
10581	GENERIC_DAY	0	2	2012-03-10	912	\N	1516
10582	GENERIC_DAY	0	2	2011-12-21	912	\N	1516
10583	GENERIC_DAY	0	2	2011-05-30	912	\N	1516
10584	GENERIC_DAY	0	2	2011-10-27	910	\N	1516
10585	GENERIC_DAY	0	2	2013-05-11	910	\N	1516
10586	GENERIC_DAY	0	2	2012-02-11	912	\N	1516
10587	GENERIC_DAY	0	2	2012-05-31	910	\N	1516
10588	GENERIC_DAY	0	2	2010-05-10	910	\N	1516
10589	GENERIC_DAY	0	2	2011-09-24	916	\N	1516
10590	GENERIC_DAY	0	2	2012-03-17	916	\N	1516
10591	GENERIC_DAY	0	2	2013-03-13	914	\N	1516
10592	GENERIC_DAY	0	2	2010-02-02	916	\N	1516
10593	GENERIC_DAY	0	2	2012-10-06	914	\N	1516
10594	GENERIC_DAY	0	2	2011-12-20	914	\N	1516
10595	GENERIC_DAY	0	2	2012-10-01	916	\N	1516
10596	GENERIC_DAY	0	2	2010-01-17	914	\N	1516
10597	GENERIC_DAY	0	2	2011-04-26	914	\N	1516
10598	GENERIC_DAY	0	2	2013-04-27	916	\N	1516
10599	GENERIC_DAY	0	2	2012-10-20	914	\N	1516
10600	GENERIC_DAY	0	2	2013-02-08	910	\N	1516
10601	GENERIC_DAY	0	2	2011-04-06	916	\N	1516
10602	GENERIC_DAY	0	2	2012-11-10	912	\N	1516
10603	GENERIC_DAY	0	2	2011-12-01	912	\N	1516
10604	GENERIC_DAY	0	2	2011-10-23	916	\N	1516
10605	GENERIC_DAY	0	2	2010-10-28	916	\N	1516
10606	GENERIC_DAY	0	2	2010-11-10	910	\N	1516
10607	GENERIC_DAY	0	2	2011-01-21	912	\N	1516
10608	GENERIC_DAY	0	2	2013-02-05	914	\N	1516
10609	GENERIC_DAY	0	2	2011-06-01	916	\N	1516
10610	GENERIC_DAY	0	2	2013-03-09	916	\N	1516
10611	GENERIC_DAY	0	2	2011-11-07	916	\N	1516
10612	GENERIC_DAY	0	2	2012-04-28	914	\N	1516
10613	GENERIC_DAY	0	2	2010-08-04	912	\N	1516
10614	GENERIC_DAY	0	2	2010-01-06	912	\N	1516
10615	GENERIC_DAY	0	2	2011-05-27	916	\N	1516
10616	GENERIC_DAY	0	2	2012-10-29	912	\N	1516
10617	GENERIC_DAY	0	2	2013-02-11	916	\N	1516
10618	GENERIC_DAY	0	2	2010-03-23	910	\N	1516
10619	GENERIC_DAY	0	2	2012-06-10	914	\N	1516
10620	GENERIC_DAY	0	2	2010-07-12	910	\N	1516
10621	GENERIC_DAY	0	2	2011-04-13	916	\N	1516
10622	GENERIC_DAY	0	2	2010-03-02	912	\N	1516
10623	GENERIC_DAY	0	2	2011-03-14	914	\N	1516
10624	GENERIC_DAY	0	2	2013-03-20	916	\N	1516
10625	GENERIC_DAY	0	2	2010-06-01	914	\N	1516
10626	GENERIC_DAY	0	2	2010-01-19	914	\N	1516
10627	GENERIC_DAY	0	2	2010-08-04	910	\N	1516
10628	GENERIC_DAY	0	2	2011-02-18	910	\N	1516
10629	GENERIC_DAY	0	2	2010-08-08	910	\N	1516
10630	GENERIC_DAY	0	2	2011-08-17	912	\N	1516
10631	GENERIC_DAY	0	2	2013-03-25	910	\N	1516
10632	GENERIC_DAY	0	2	2012-09-18	912	\N	1516
10633	GENERIC_DAY	0	2	2011-06-05	914	\N	1516
10634	GENERIC_DAY	0	2	2013-02-18	916	\N	1516
10635	GENERIC_DAY	0	2	2010-07-31	910	\N	1516
10636	GENERIC_DAY	0	2	2009-12-26	916	\N	1516
10637	GENERIC_DAY	0	2	2010-11-29	914	\N	1516
10638	GENERIC_DAY	0	2	2011-08-06	910	\N	1516
10639	GENERIC_DAY	0	2	2011-12-24	916	\N	1516
10640	GENERIC_DAY	0	2	2010-02-07	912	\N	1516
10641	GENERIC_DAY	0	2	2013-05-02	910	\N	1516
10642	GENERIC_DAY	0	2	2013-04-20	912	\N	1516
10643	GENERIC_DAY	0	2	2012-08-04	912	\N	1516
10644	GENERIC_DAY	0	2	2010-10-12	916	\N	1516
10645	GENERIC_DAY	0	2	2011-07-16	914	\N	1516
10646	GENERIC_DAY	0	2	2011-10-19	912	\N	1516
10647	GENERIC_DAY	0	2	2010-04-21	912	\N	1516
10648	GENERIC_DAY	0	2	2011-12-13	914	\N	1516
10649	GENERIC_DAY	0	2	2012-11-03	914	\N	1516
10650	GENERIC_DAY	0	2	2012-07-24	910	\N	1516
10651	GENERIC_DAY	0	2	2011-09-01	912	\N	1516
10652	GENERIC_DAY	0	2	2012-04-25	912	\N	1516
10653	GENERIC_DAY	0	2	2012-01-19	914	\N	1516
10654	GENERIC_DAY	0	2	2012-09-23	914	\N	1516
10655	GENERIC_DAY	0	2	2010-07-29	916	\N	1516
10656	GENERIC_DAY	0	2	2011-12-29	910	\N	1516
10657	GENERIC_DAY	0	2	2012-07-31	914	\N	1516
10658	GENERIC_DAY	0	2	2011-02-22	910	\N	1516
10659	GENERIC_DAY	0	2	2012-11-09	914	\N	1516
10660	GENERIC_DAY	0	2	2010-07-26	916	\N	1516
10661	GENERIC_DAY	0	2	2013-01-13	912	\N	1516
10662	GENERIC_DAY	0	2	2013-03-02	916	\N	1516
10663	GENERIC_DAY	0	2	2010-11-17	914	\N	1516
10664	GENERIC_DAY	0	2	2011-11-30	914	\N	1516
10665	GENERIC_DAY	0	2	2010-03-20	916	\N	1516
10666	GENERIC_DAY	0	2	2011-11-21	912	\N	1516
10667	GENERIC_DAY	0	2	2011-02-17	910	\N	1516
10668	GENERIC_DAY	0	2	2013-03-18	914	\N	1516
10669	GENERIC_DAY	0	2	2010-11-13	912	\N	1516
10670	GENERIC_DAY	0	2	2012-10-08	916	\N	1516
10671	GENERIC_DAY	0	2	2010-05-02	916	\N	1516
10672	GENERIC_DAY	0	2	2010-07-25	912	\N	1516
10673	GENERIC_DAY	0	2	2013-02-23	916	\N	1516
10674	GENERIC_DAY	0	2	2012-02-18	910	\N	1516
10675	GENERIC_DAY	0	2	2010-03-18	916	\N	1516
10676	GENERIC_DAY	0	2	2012-05-10	910	\N	1516
10677	GENERIC_DAY	0	2	2010-06-19	916	\N	1516
10678	GENERIC_DAY	0	2	2012-06-08	914	\N	1516
10679	GENERIC_DAY	0	2	2011-01-14	914	\N	1516
10680	GENERIC_DAY	0	2	2012-06-25	916	\N	1516
10681	GENERIC_DAY	0	2	2010-05-08	912	\N	1516
10682	GENERIC_DAY	0	2	2012-04-12	914	\N	1516
10683	GENERIC_DAY	0	2	2010-11-28	912	\N	1516
10684	GENERIC_DAY	0	2	2011-04-10	912	\N	1516
10685	GENERIC_DAY	0	2	2011-08-18	912	\N	1516
10686	GENERIC_DAY	0	2	2011-08-27	916	\N	1516
10687	GENERIC_DAY	0	2	2011-03-11	914	\N	1516
10688	GENERIC_DAY	0	2	2011-05-21	914	\N	1516
10689	GENERIC_DAY	0	2	2011-08-03	910	\N	1516
10690	GENERIC_DAY	0	2	2012-04-14	914	\N	1516
10691	GENERIC_DAY	0	2	2012-01-25	914	\N	1516
10692	GENERIC_DAY	0	2	2013-03-01	916	\N	1516
10693	GENERIC_DAY	0	2	2012-05-15	914	\N	1516
10694	GENERIC_DAY	0	2	2012-03-12	914	\N	1516
10695	GENERIC_DAY	0	2	2013-04-28	914	\N	1516
10696	GENERIC_DAY	0	2	2012-05-28	912	\N	1516
10697	GENERIC_DAY	0	2	2010-02-06	914	\N	1516
10698	GENERIC_DAY	0	2	2011-09-15	910	\N	1516
10699	GENERIC_DAY	0	2	2012-05-11	912	\N	1516
10700	GENERIC_DAY	0	2	2011-01-16	912	\N	1516
10701	GENERIC_DAY	0	2	2012-11-12	912	\N	1516
10702	GENERIC_DAY	0	2	2011-02-04	910	\N	1516
10703	GENERIC_DAY	0	2	2011-09-25	910	\N	1516
10704	GENERIC_DAY	0	2	2010-07-16	912	\N	1516
10705	GENERIC_DAY	0	2	2010-04-27	910	\N	1516
10706	GENERIC_DAY	0	2	2010-09-01	916	\N	1516
10707	GENERIC_DAY	0	2	2010-12-12	916	\N	1516
10708	GENERIC_DAY	0	2	2011-01-06	910	\N	1516
10709	GENERIC_DAY	0	2	2010-08-23	916	\N	1516
10710	GENERIC_DAY	0	2	2012-11-29	910	\N	1516
10711	GENERIC_DAY	0	2	2011-06-23	914	\N	1516
10712	GENERIC_DAY	0	2	2013-04-26	914	\N	1516
10713	GENERIC_DAY	0	2	2011-10-17	912	\N	1516
10714	GENERIC_DAY	0	2	2012-07-12	916	\N	1516
10715	GENERIC_DAY	0	2	2013-01-14	912	\N	1516
10716	GENERIC_DAY	0	2	2012-04-01	916	\N	1516
10717	GENERIC_DAY	0	2	2011-09-11	910	\N	1516
10718	GENERIC_DAY	0	2	2011-05-21	916	\N	1516
10719	GENERIC_DAY	0	2	2010-08-14	914	\N	1516
10720	GENERIC_DAY	0	2	2010-07-31	914	\N	1516
10721	GENERIC_DAY	0	2	2011-10-24	916	\N	1516
10722	GENERIC_DAY	0	2	2012-12-29	912	\N	1516
10723	GENERIC_DAY	0	2	2011-04-08	916	\N	1516
10724	GENERIC_DAY	0	2	2012-12-30	912	\N	1516
10725	GENERIC_DAY	0	2	2011-08-16	914	\N	1516
10726	GENERIC_DAY	0	2	2010-11-08	916	\N	1516
10727	GENERIC_DAY	0	2	2010-11-29	910	\N	1516
10728	GENERIC_DAY	0	2	2010-11-14	910	\N	1516
10729	GENERIC_DAY	0	2	2010-06-18	916	\N	1516
10730	GENERIC_DAY	0	2	2010-03-30	912	\N	1516
10731	GENERIC_DAY	0	2	2012-01-13	914	\N	1516
10732	GENERIC_DAY	0	2	2011-06-04	912	\N	1516
10733	GENERIC_DAY	0	2	2012-08-14	912	\N	1516
10734	GENERIC_DAY	0	2	2012-02-18	912	\N	1516
10735	GENERIC_DAY	0	2	2012-02-16	914	\N	1516
10736	GENERIC_DAY	0	2	2013-04-17	912	\N	1516
10737	GENERIC_DAY	0	2	2012-01-30	910	\N	1516
10738	GENERIC_DAY	0	2	2010-04-06	916	\N	1516
10739	GENERIC_DAY	0	2	2010-12-05	912	\N	1516
10740	GENERIC_DAY	0	2	2010-04-09	910	\N	1516
10741	GENERIC_DAY	0	2	2012-06-29	916	\N	1516
10742	GENERIC_DAY	0	2	2013-04-01	916	\N	1516
10743	GENERIC_DAY	0	2	2011-04-01	912	\N	1516
10744	GENERIC_DAY	0	2	2012-12-29	916	\N	1516
10745	GENERIC_DAY	0	2	2010-06-03	916	\N	1516
10746	GENERIC_DAY	0	2	2011-05-22	914	\N	1516
10747	GENERIC_DAY	0	2	2012-05-01	916	\N	1516
10748	GENERIC_DAY	0	2	2012-05-31	912	\N	1516
10749	GENERIC_DAY	0	2	2011-11-15	916	\N	1516
10750	GENERIC_DAY	0	2	2011-12-05	916	\N	1516
10751	GENERIC_DAY	0	2	2010-08-01	912	\N	1516
10752	GENERIC_DAY	0	2	2012-09-15	910	\N	1516
10753	GENERIC_DAY	0	2	2012-07-20	916	\N	1516
10754	GENERIC_DAY	0	2	2011-02-26	916	\N	1516
10755	GENERIC_DAY	0	2	2012-05-05	912	\N	1516
10756	GENERIC_DAY	0	2	2012-08-02	916	\N	1516
10757	GENERIC_DAY	0	2	2011-03-04	914	\N	1516
10758	GENERIC_DAY	0	2	2012-03-27	910	\N	1516
10759	GENERIC_DAY	0	2	2011-01-08	914	\N	1516
10760	GENERIC_DAY	0	2	2013-05-11	914	\N	1516
10761	GENERIC_DAY	0	2	2012-02-26	914	\N	1516
10762	GENERIC_DAY	0	2	2010-06-16	914	\N	1516
10763	GENERIC_DAY	0	2	2010-07-10	912	\N	1516
10764	GENERIC_DAY	0	2	2010-03-14	914	\N	1516
10765	GENERIC_DAY	0	2	2012-02-25	910	\N	1516
10766	GENERIC_DAY	0	2	2011-10-07	910	\N	1516
10767	GENERIC_DAY	0	2	2011-02-15	914	\N	1516
10768	GENERIC_DAY	0	2	2013-04-26	912	\N	1516
10769	GENERIC_DAY	0	2	2010-11-01	916	\N	1516
10770	GENERIC_DAY	0	2	2010-01-08	910	\N	1516
10771	GENERIC_DAY	0	2	2010-06-29	912	\N	1516
10772	GENERIC_DAY	0	2	2010-03-18	910	\N	1516
10773	GENERIC_DAY	0	2	2013-01-03	912	\N	1516
10774	GENERIC_DAY	0	2	2010-05-02	914	\N	1516
10775	GENERIC_DAY	0	2	2011-06-28	912	\N	1516
10776	GENERIC_DAY	0	2	2012-11-01	914	\N	1516
10777	GENERIC_DAY	0	2	2013-02-27	910	\N	1516
10778	GENERIC_DAY	0	2	2010-08-23	910	\N	1516
10779	GENERIC_DAY	0	2	2011-10-16	912	\N	1516
10780	GENERIC_DAY	0	2	2012-03-13	916	\N	1516
10781	GENERIC_DAY	0	2	2012-01-03	916	\N	1516
10782	GENERIC_DAY	0	2	2011-02-05	914	\N	1516
10783	GENERIC_DAY	0	2	2012-12-20	912	\N	1516
10784	GENERIC_DAY	0	2	2010-10-17	916	\N	1516
10785	GENERIC_DAY	0	2	2012-03-06	914	\N	1516
10786	GENERIC_DAY	0	2	2012-01-02	912	\N	1516
10787	GENERIC_DAY	0	2	2010-05-31	910	\N	1516
10788	GENERIC_DAY	0	2	2012-08-24	916	\N	1516
10789	GENERIC_DAY	0	2	2011-12-12	916	\N	1516
10790	GENERIC_DAY	0	2	2012-10-07	910	\N	1516
10791	GENERIC_DAY	0	2	2012-04-09	912	\N	1516
10792	GENERIC_DAY	0	2	2012-03-15	910	\N	1516
10793	GENERIC_DAY	0	2	2011-08-10	914	\N	1516
10794	GENERIC_DAY	0	2	2011-08-14	916	\N	1516
10795	GENERIC_DAY	0	2	2011-02-25	916	\N	1516
10796	GENERIC_DAY	0	2	2012-04-20	914	\N	1516
10797	GENERIC_DAY	0	2	2012-03-03	914	\N	1516
10798	GENERIC_DAY	0	2	2013-03-19	916	\N	1516
10799	GENERIC_DAY	0	2	2010-01-03	910	\N	1516
10800	GENERIC_DAY	0	2	2011-04-06	910	\N	1516
10801	GENERIC_DAY	0	2	2010-12-17	914	\N	1516
10802	GENERIC_DAY	0	2	2013-04-11	912	\N	1516
10803	GENERIC_DAY	0	2	2013-02-09	914	\N	1516
10804	GENERIC_DAY	0	2	2010-07-07	912	\N	1516
10805	GENERIC_DAY	0	2	2011-06-16	912	\N	1516
10806	GENERIC_DAY	0	2	2011-12-15	916	\N	1516
10807	GENERIC_DAY	0	2	2011-02-02	916	\N	1516
10808	GENERIC_DAY	0	2	2010-08-14	916	\N	1516
10809	GENERIC_DAY	0	2	2010-09-15	914	\N	1516
10810	GENERIC_DAY	0	2	2010-06-17	910	\N	1516
10811	GENERIC_DAY	0	2	2013-02-11	912	\N	1516
10812	GENERIC_DAY	0	2	2010-01-14	914	\N	1516
10813	GENERIC_DAY	0	2	2009-12-18	914	\N	1516
10814	GENERIC_DAY	0	2	2010-11-11	914	\N	1516
10815	GENERIC_DAY	0	2	2011-05-28	916	\N	1516
10816	GENERIC_DAY	0	2	2012-08-25	912	\N	1516
10817	GENERIC_DAY	0	2	2010-08-21	912	\N	1516
10818	GENERIC_DAY	0	2	2011-08-13	912	\N	1516
10819	GENERIC_DAY	0	2	2010-07-06	912	\N	1516
10820	GENERIC_DAY	0	2	2011-05-17	912	\N	1516
10821	GENERIC_DAY	0	2	2009-12-11	912	\N	1516
10822	GENERIC_DAY	0	2	2011-02-03	912	\N	1516
10823	GENERIC_DAY	0	2	2011-08-11	910	\N	1516
10824	GENERIC_DAY	0	2	2012-05-06	912	\N	1516
10825	GENERIC_DAY	0	2	2012-04-18	912	\N	1516
10826	GENERIC_DAY	0	2	2011-06-24	910	\N	1516
10827	GENERIC_DAY	0	2	2012-03-24	910	\N	1516
10828	GENERIC_DAY	0	2	2011-06-25	916	\N	1516
10829	GENERIC_DAY	0	2	2013-04-03	910	\N	1516
10830	GENERIC_DAY	0	2	2011-09-01	910	\N	1516
10831	GENERIC_DAY	0	2	2012-09-02	914	\N	1516
10832	GENERIC_DAY	0	2	2012-02-16	912	\N	1516
10833	GENERIC_DAY	0	2	2011-01-12	914	\N	1516
10834	GENERIC_DAY	0	2	2010-06-04	910	\N	1516
10835	GENERIC_DAY	0	2	2011-05-18	916	\N	1516
10836	GENERIC_DAY	0	2	2012-06-17	910	\N	1516
10837	GENERIC_DAY	0	2	2013-01-28	914	\N	1516
10838	GENERIC_DAY	0	2	2013-01-05	914	\N	1516
10839	GENERIC_DAY	0	2	2010-01-17	912	\N	1516
10840	GENERIC_DAY	0	2	2010-03-21	914	\N	1516
10841	GENERIC_DAY	0	2	2011-04-02	914	\N	1516
10842	GENERIC_DAY	0	2	2010-10-15	914	\N	1516
10843	GENERIC_DAY	0	2	2010-11-04	914	\N	1516
10844	GENERIC_DAY	0	2	2010-01-14	912	\N	1516
10845	GENERIC_DAY	0	2	2010-12-29	914	\N	1516
10846	GENERIC_DAY	0	2	2012-03-09	912	\N	1516
10847	GENERIC_DAY	0	2	2010-04-25	912	\N	1516
10848	GENERIC_DAY	0	2	2012-06-02	910	\N	1516
10849	GENERIC_DAY	0	2	2010-02-23	914	\N	1516
10850	GENERIC_DAY	0	2	2011-04-07	912	\N	1516
10851	GENERIC_DAY	0	2	2011-08-18	910	\N	1516
10852	GENERIC_DAY	0	2	2011-09-29	916	\N	1516
10853	GENERIC_DAY	0	2	2012-07-09	916	\N	1516
10854	GENERIC_DAY	0	2	2010-10-10	912	\N	1516
10855	GENERIC_DAY	0	2	2010-12-09	912	\N	1516
10856	GENERIC_DAY	0	2	2012-09-09	912	\N	1516
10857	GENERIC_DAY	0	2	2010-11-19	916	\N	1516
10858	GENERIC_DAY	0	2	2013-01-17	910	\N	1516
10859	GENERIC_DAY	0	2	2012-11-01	916	\N	1516
10860	GENERIC_DAY	0	2	2011-08-28	916	\N	1516
10861	GENERIC_DAY	0	2	2011-09-29	910	\N	1516
10862	GENERIC_DAY	0	2	2012-09-03	910	\N	1516
10863	GENERIC_DAY	0	2	2012-05-30	914	\N	1516
10864	GENERIC_DAY	0	2	2012-05-30	912	\N	1516
10865	GENERIC_DAY	0	2	2012-12-23	910	\N	1516
10866	GENERIC_DAY	0	2	2011-05-22	910	\N	1516
10867	GENERIC_DAY	0	2	2010-02-24	912	\N	1516
10868	GENERIC_DAY	0	2	2011-11-02	914	\N	1516
10869	GENERIC_DAY	0	2	2010-11-07	916	\N	1516
10870	GENERIC_DAY	0	2	2010-10-13	910	\N	1516
10871	GENERIC_DAY	0	2	2010-02-18	910	\N	1516
10872	GENERIC_DAY	0	2	2011-07-28	910	\N	1516
10873	GENERIC_DAY	0	2	2012-03-09	910	\N	1516
10874	GENERIC_DAY	0	2	2010-04-06	912	\N	1516
10875	GENERIC_DAY	0	2	2011-12-15	912	\N	1516
10876	GENERIC_DAY	0	2	2011-06-25	914	\N	1516
10877	GENERIC_DAY	0	2	2012-08-16	916	\N	1516
10878	GENERIC_DAY	0	2	2010-06-18	912	\N	1516
10879	GENERIC_DAY	0	2	2011-12-10	910	\N	1516
10880	GENERIC_DAY	0	2	2011-11-16	910	\N	1516
10881	GENERIC_DAY	0	2	2011-07-07	916	\N	1516
10882	GENERIC_DAY	0	2	2010-06-13	912	\N	1516
10883	GENERIC_DAY	0	2	2010-02-22	916	\N	1516
10884	GENERIC_DAY	0	2	2011-03-05	916	\N	1516
10885	GENERIC_DAY	0	2	2011-09-20	916	\N	1516
10886	GENERIC_DAY	0	2	2013-02-02	916	\N	1516
10887	GENERIC_DAY	0	2	2012-10-27	914	\N	1516
10888	GENERIC_DAY	0	2	2012-10-23	914	\N	1516
10889	GENERIC_DAY	0	2	2012-09-21	910	\N	1516
10890	GENERIC_DAY	0	2	2010-11-28	914	\N	1516
10891	GENERIC_DAY	0	2	2010-06-27	916	\N	1516
10892	GENERIC_DAY	0	2	2012-06-28	912	\N	1516
10893	GENERIC_DAY	0	2	2010-06-19	910	\N	1516
10894	GENERIC_DAY	0	2	2011-05-26	912	\N	1516
10895	GENERIC_DAY	0	2	2010-10-13	914	\N	1516
10896	GENERIC_DAY	0	2	2010-10-24	912	\N	1516
10897	GENERIC_DAY	0	2	2012-12-29	914	\N	1516
10898	GENERIC_DAY	0	2	2010-10-22	910	\N	1516
10899	GENERIC_DAY	0	2	2010-07-16	914	\N	1516
10900	GENERIC_DAY	0	2	2013-02-15	910	\N	1516
10901	GENERIC_DAY	0	2	2010-09-12	912	\N	1516
10902	GENERIC_DAY	0	2	2010-08-28	914	\N	1516
10903	GENERIC_DAY	0	2	2010-05-15	910	\N	1516
10904	GENERIC_DAY	0	2	2011-02-15	916	\N	1516
10905	GENERIC_DAY	0	2	2012-03-20	914	\N	1516
10906	GENERIC_DAY	0	2	2011-09-23	916	\N	1516
10907	GENERIC_DAY	0	2	2013-02-25	916	\N	1516
10908	GENERIC_DAY	0	2	2010-10-03	912	\N	1516
10909	GENERIC_DAY	0	2	2012-08-12	910	\N	1516
10910	GENERIC_DAY	0	2	2011-11-15	914	\N	1516
10911	GENERIC_DAY	0	2	2010-05-19	912	\N	1516
10912	GENERIC_DAY	0	2	2013-03-03	914	\N	1516
10913	GENERIC_DAY	0	2	2012-10-22	916	\N	1516
10914	GENERIC_DAY	0	2	2012-04-21	914	\N	1516
10915	GENERIC_DAY	0	2	2010-01-28	910	\N	1516
10916	GENERIC_DAY	0	2	2010-06-02	916	\N	1516
10917	GENERIC_DAY	0	2	2011-03-07	910	\N	1516
10918	GENERIC_DAY	0	2	2010-08-05	914	\N	1516
10919	GENERIC_DAY	0	2	2010-09-30	910	\N	1516
10920	GENERIC_DAY	0	2	2012-06-08	916	\N	1516
10921	GENERIC_DAY	0	2	2012-12-01	914	\N	1516
10922	GENERIC_DAY	0	2	2010-07-26	912	\N	1516
10923	GENERIC_DAY	0	2	2012-08-04	910	\N	1516
10924	GENERIC_DAY	0	2	2012-07-29	914	\N	1516
10925	GENERIC_DAY	0	2	2010-05-15	912	\N	1516
10926	GENERIC_DAY	0	2	2012-04-23	912	\N	1516
10927	GENERIC_DAY	0	2	2012-08-01	914	\N	1516
10928	GENERIC_DAY	0	2	2012-06-27	910	\N	1516
10929	GENERIC_DAY	0	2	2010-03-16	912	\N	1516
10930	GENERIC_DAY	0	2	2010-04-07	912	\N	1516
10931	GENERIC_DAY	0	2	2010-03-11	910	\N	1516
10932	GENERIC_DAY	0	2	2012-12-19	912	\N	1516
10933	GENERIC_DAY	0	2	2012-04-05	910	\N	1516
10934	GENERIC_DAY	0	2	2013-01-29	910	\N	1516
10935	GENERIC_DAY	0	2	2012-06-24	912	\N	1516
10936	GENERIC_DAY	0	2	2011-10-29	914	\N	1516
10937	GENERIC_DAY	0	2	2012-03-22	910	\N	1516
10938	GENERIC_DAY	0	2	2010-01-06	910	\N	1516
10939	GENERIC_DAY	0	2	2012-09-29	912	\N	1516
10940	GENERIC_DAY	0	2	2012-11-19	912	\N	1516
10941	GENERIC_DAY	0	2	2010-07-17	910	\N	1516
10942	GENERIC_DAY	0	2	2013-02-15	914	\N	1516
10943	GENERIC_DAY	0	2	2010-02-25	914	\N	1516
10944	GENERIC_DAY	0	2	2012-12-13	910	\N	1516
10945	GENERIC_DAY	0	2	2012-05-09	910	\N	1516
10946	GENERIC_DAY	0	2	2010-05-30	910	\N	1516
10947	GENERIC_DAY	0	2	2012-05-11	910	\N	1516
10948	GENERIC_DAY	0	2	2012-09-22	910	\N	1516
10949	GENERIC_DAY	0	2	2010-12-04	914	\N	1516
10950	GENERIC_DAY	0	2	2010-01-29	912	\N	1516
10951	GENERIC_DAY	0	2	2012-10-12	910	\N	1516
10952	GENERIC_DAY	0	2	2010-10-14	910	\N	1516
10953	GENERIC_DAY	0	2	2010-08-09	916	\N	1516
10954	GENERIC_DAY	0	2	2010-02-10	916	\N	1516
10955	GENERIC_DAY	0	2	2012-01-28	916	\N	1516
10956	GENERIC_DAY	0	2	2012-10-30	910	\N	1516
10957	GENERIC_DAY	0	2	2012-02-02	916	\N	1516
10958	GENERIC_DAY	0	2	2012-05-12	914	\N	1516
10959	GENERIC_DAY	0	2	2011-10-28	914	\N	1516
10960	GENERIC_DAY	0	2	2011-03-23	910	\N	1516
10961	GENERIC_DAY	0	2	2011-11-14	910	\N	1516
10962	GENERIC_DAY	0	2	2011-05-02	916	\N	1516
10963	GENERIC_DAY	0	2	2010-05-19	914	\N	1516
10964	GENERIC_DAY	0	2	2010-02-17	912	\N	1516
10965	GENERIC_DAY	0	2	2011-11-14	912	\N	1516
10966	GENERIC_DAY	0	2	2012-12-27	910	\N	1516
10967	GENERIC_DAY	0	2	2012-10-21	914	\N	1516
10968	GENERIC_DAY	0	2	2010-02-09	912	\N	1516
10969	GENERIC_DAY	0	2	2011-02-20	916	\N	1516
10970	GENERIC_DAY	0	2	2010-04-09	912	\N	1516
10971	GENERIC_DAY	0	2	2012-04-15	912	\N	1516
10972	GENERIC_DAY	0	2	2010-08-30	910	\N	1516
10973	GENERIC_DAY	0	2	2012-11-17	914	\N	1516
10974	GENERIC_DAY	0	2	2012-09-06	916	\N	1516
10975	GENERIC_DAY	0	2	2011-02-28	916	\N	1516
10976	GENERIC_DAY	0	2	2010-09-02	916	\N	1516
10977	GENERIC_DAY	0	2	2012-06-13	914	\N	1516
10978	GENERIC_DAY	0	2	2010-01-10	910	\N	1516
10979	GENERIC_DAY	0	2	2013-03-17	914	\N	1516
10980	GENERIC_DAY	0	2	2010-11-19	912	\N	1516
10981	GENERIC_DAY	0	2	2013-03-16	916	\N	1516
10982	GENERIC_DAY	0	2	2009-12-14	916	\N	1516
10983	GENERIC_DAY	0	2	2012-07-14	910	\N	1516
10984	GENERIC_DAY	0	2	2012-07-28	910	\N	1516
10985	GENERIC_DAY	0	2	2011-10-22	914	\N	1516
10986	GENERIC_DAY	0	2	2012-06-01	916	\N	1516
10987	GENERIC_DAY	0	2	2011-09-20	914	\N	1516
10988	GENERIC_DAY	0	2	2012-11-29	914	\N	1516
10989	GENERIC_DAY	0	2	2011-02-10	914	\N	1516
10990	GENERIC_DAY	0	2	2011-08-24	914	\N	1516
10991	GENERIC_DAY	0	2	2010-12-25	910	\N	1516
10992	GENERIC_DAY	0	2	2010-09-21	910	\N	1516
10993	GENERIC_DAY	0	2	2011-01-14	912	\N	1516
10994	GENERIC_DAY	0	2	2010-01-30	914	\N	1516
10995	GENERIC_DAY	0	2	2011-01-18	916	\N	1516
10996	GENERIC_DAY	0	2	2012-12-17	910	\N	1516
10997	GENERIC_DAY	0	2	2010-06-14	910	\N	1516
10998	GENERIC_DAY	0	2	2010-11-24	910	\N	1516
10999	GENERIC_DAY	0	2	2011-04-14	914	\N	1516
11000	GENERIC_DAY	0	2	2011-10-12	916	\N	1516
11001	GENERIC_DAY	0	2	2010-07-25	914	\N	1516
11002	GENERIC_DAY	0	2	2010-10-20	912	\N	1516
11003	GENERIC_DAY	0	2	2012-06-24	916	\N	1516
11004	GENERIC_DAY	0	2	2010-07-29	912	\N	1516
11005	GENERIC_DAY	0	2	2010-11-21	910	\N	1516
11006	GENERIC_DAY	0	2	2010-04-12	916	\N	1516
11007	GENERIC_DAY	0	2	2009-12-15	914	\N	1516
11008	GENERIC_DAY	0	2	2013-05-04	912	\N	1516
11009	GENERIC_DAY	0	2	2011-11-26	910	\N	1516
11010	GENERIC_DAY	0	2	2010-06-30	916	\N	1516
11011	GENERIC_DAY	0	2	2012-07-06	914	\N	1516
11012	GENERIC_DAY	0	2	2010-06-02	910	\N	1516
11013	GENERIC_DAY	0	2	2011-02-11	912	\N	1516
11014	GENERIC_DAY	0	2	2013-02-07	912	\N	1516
11015	GENERIC_DAY	0	2	2012-08-23	914	\N	1516
11016	GENERIC_DAY	0	2	2012-05-27	912	\N	1516
11017	GENERIC_DAY	0	2	2011-05-17	916	\N	1516
11018	GENERIC_DAY	0	2	2012-11-14	914	\N	1516
11019	GENERIC_DAY	0	2	2012-05-17	914	\N	1516
11020	GENERIC_DAY	0	2	2011-06-26	914	\N	1516
11021	GENERIC_DAY	0	2	2011-08-27	912	\N	1516
11022	GENERIC_DAY	0	2	2011-07-24	916	\N	1516
11023	GENERIC_DAY	0	2	2010-11-16	916	\N	1516
11024	GENERIC_DAY	0	2	2010-04-27	916	\N	1516
11025	GENERIC_DAY	0	2	2012-04-29	910	\N	1516
11026	GENERIC_DAY	0	2	2013-04-07	914	\N	1516
11027	GENERIC_DAY	0	2	2012-04-26	912	\N	1516
11028	GENERIC_DAY	0	2	2012-02-22	910	\N	1516
11029	GENERIC_DAY	0	2	2012-09-29	910	\N	1516
11030	GENERIC_DAY	0	2	2010-08-16	912	\N	1516
11031	GENERIC_DAY	0	2	2012-04-25	910	\N	1516
11032	GENERIC_DAY	0	2	2012-04-08	912	\N	1516
11033	GENERIC_DAY	0	2	2011-08-04	914	\N	1516
11034	GENERIC_DAY	0	2	2010-12-18	910	\N	1516
11035	GENERIC_DAY	0	2	2011-03-14	916	\N	1516
11036	GENERIC_DAY	0	2	2011-04-24	910	\N	1516
11037	GENERIC_DAY	0	2	2011-11-29	912	\N	1516
11038	GENERIC_DAY	0	2	2011-10-23	912	\N	1516
11039	GENERIC_DAY	0	2	2012-10-05	916	\N	1516
11040	GENERIC_DAY	0	2	2012-04-13	910	\N	1516
11041	GENERIC_DAY	0	2	2010-04-08	914	\N	1516
11042	GENERIC_DAY	0	2	2011-08-16	910	\N	1516
11043	GENERIC_DAY	0	2	2012-11-15	912	\N	1516
11044	GENERIC_DAY	0	2	2009-12-27	910	\N	1516
11045	GENERIC_DAY	0	2	2011-03-23	916	\N	1516
11046	GENERIC_DAY	0	2	2012-08-29	912	\N	1516
11047	GENERIC_DAY	0	2	2010-05-11	916	\N	1516
11048	GENERIC_DAY	0	2	2013-01-20	910	\N	1516
11049	GENERIC_DAY	0	2	2010-10-25	914	\N	1516
11050	GENERIC_DAY	0	2	2013-01-07	916	\N	1516
11051	GENERIC_DAY	0	2	2012-04-20	910	\N	1516
11052	GENERIC_DAY	0	2	2012-07-23	916	\N	1516
11053	GENERIC_DAY	0	2	2010-09-13	916	\N	1516
11054	GENERIC_DAY	0	2	2010-04-22	910	\N	1516
11055	GENERIC_DAY	0	2	2010-03-25	910	\N	1516
11056	GENERIC_DAY	0	2	2012-01-21	910	\N	1516
11057	GENERIC_DAY	0	2	2010-06-24	914	\N	1516
11058	GENERIC_DAY	0	2	2011-06-15	914	\N	1516
11059	GENERIC_DAY	0	2	2011-08-16	916	\N	1516
11060	GENERIC_DAY	0	2	2010-11-30	914	\N	1516
11061	GENERIC_DAY	0	2	2011-03-21	910	\N	1516
11062	GENERIC_DAY	0	2	2011-01-11	914	\N	1516
11063	GENERIC_DAY	0	2	2011-02-18	912	\N	1516
11064	GENERIC_DAY	0	2	2012-01-11	910	\N	1516
11065	GENERIC_DAY	0	2	2010-02-28	912	\N	1516
11066	GENERIC_DAY	0	2	2012-08-16	910	\N	1516
11067	GENERIC_DAY	0	2	2012-08-21	914	\N	1516
11068	GENERIC_DAY	0	2	2012-07-05	912	\N	1516
11069	GENERIC_DAY	0	2	2010-04-12	910	\N	1516
11070	GENERIC_DAY	0	2	2013-03-06	914	\N	1516
11071	GENERIC_DAY	0	2	2010-07-28	910	\N	1516
11072	GENERIC_DAY	0	2	2012-08-03	916	\N	1516
11073	GENERIC_DAY	0	2	2010-11-18	914	\N	1516
11074	GENERIC_DAY	0	2	2012-07-26	910	\N	1516
11075	GENERIC_DAY	0	2	2012-01-06	916	\N	1516
11076	GENERIC_DAY	0	2	2011-06-18	914	\N	1516
11077	GENERIC_DAY	0	2	2011-10-05	912	\N	1516
11078	GENERIC_DAY	0	2	2012-01-22	914	\N	1516
11079	GENERIC_DAY	0	2	2011-01-28	916	\N	1516
11080	GENERIC_DAY	0	2	2013-04-23	914	\N	1516
11081	GENERIC_DAY	0	2	2012-07-09	912	\N	1516
11082	GENERIC_DAY	0	2	2012-06-08	910	\N	1516
11083	GENERIC_DAY	0	2	2011-09-16	914	\N	1516
11084	GENERIC_DAY	0	2	2011-11-06	916	\N	1516
11085	GENERIC_DAY	0	2	2011-02-07	912	\N	1516
11086	GENERIC_DAY	0	2	2010-04-30	910	\N	1516
11087	GENERIC_DAY	0	2	2010-04-16	914	\N	1516
11088	GENERIC_DAY	0	2	2013-04-26	916	\N	1516
11089	GENERIC_DAY	0	2	2013-02-22	910	\N	1516
11090	GENERIC_DAY	0	2	2013-03-05	914	\N	1516
11091	GENERIC_DAY	0	2	2013-01-16	916	\N	1516
11092	GENERIC_DAY	0	2	2011-02-21	916	\N	1516
11093	GENERIC_DAY	0	2	2010-09-25	916	\N	1516
11094	GENERIC_DAY	0	2	2012-09-01	916	\N	1516
11095	GENERIC_DAY	0	2	2012-08-03	910	\N	1516
11096	GENERIC_DAY	0	2	2013-02-16	914	\N	1516
11097	GENERIC_DAY	0	2	2011-04-27	910	\N	1516
11098	GENERIC_DAY	0	2	2013-02-27	912	\N	1516
11099	GENERIC_DAY	0	2	2011-12-24	914	\N	1516
11100	GENERIC_DAY	0	2	2013-05-06	910	\N	1516
11101	GENERIC_DAY	0	2	2010-02-11	914	\N	1516
11102	GENERIC_DAY	0	2	2010-05-28	912	\N	1516
11103	GENERIC_DAY	0	2	2011-11-02	910	\N	1516
11104	GENERIC_DAY	0	2	2011-05-12	910	\N	1516
11105	GENERIC_DAY	0	2	2010-04-24	910	\N	1516
11106	GENERIC_DAY	0	2	2010-02-08	914	\N	1516
11107	GENERIC_DAY	0	2	2012-08-25	910	\N	1516
11108	GENERIC_DAY	0	2	2013-03-18	910	\N	1516
11109	GENERIC_DAY	0	2	2012-01-15	916	\N	1516
11110	GENERIC_DAY	0	2	2012-01-25	916	\N	1516
11111	GENERIC_DAY	0	2	2010-10-10	916	\N	1516
11112	GENERIC_DAY	0	2	2010-04-13	910	\N	1516
11113	GENERIC_DAY	0	2	2010-06-02	914	\N	1516
11114	GENERIC_DAY	0	2	2011-07-27	912	\N	1516
11115	GENERIC_DAY	0	2	2012-02-19	916	\N	1516
11116	GENERIC_DAY	0	2	2011-09-03	910	\N	1516
11117	GENERIC_DAY	0	2	2011-12-16	916	\N	1516
11118	GENERIC_DAY	0	2	2012-02-12	912	\N	1516
11119	GENERIC_DAY	0	2	2012-12-05	910	\N	1516
11120	GENERIC_DAY	0	2	2010-11-27	916	\N	1516
11121	GENERIC_DAY	0	2	2010-01-20	914	\N	1516
11122	GENERIC_DAY	0	2	2012-06-25	914	\N	1516
11123	GENERIC_DAY	0	2	2009-12-15	910	\N	1516
11124	GENERIC_DAY	0	2	2011-08-20	910	\N	1516
11125	GENERIC_DAY	0	2	2011-12-28	910	\N	1516
11126	GENERIC_DAY	0	2	2013-02-12	910	\N	1516
11127	GENERIC_DAY	0	2	2009-12-21	916	\N	1516
11128	GENERIC_DAY	0	2	2012-10-07	916	\N	1516
11129	GENERIC_DAY	0	2	2012-01-23	914	\N	1516
11130	GENERIC_DAY	0	2	2012-12-26	916	\N	1516
11131	GENERIC_DAY	0	2	2010-03-15	916	\N	1516
11132	GENERIC_DAY	0	2	2012-10-17	914	\N	1516
11133	GENERIC_DAY	0	2	2012-09-11	914	\N	1516
11134	GENERIC_DAY	0	2	2013-04-08	910	\N	1516
11135	GENERIC_DAY	0	2	2010-03-08	916	\N	1516
11136	GENERIC_DAY	0	2	2011-03-30	912	\N	1516
11137	GENERIC_DAY	0	2	2011-09-08	910	\N	1516
11138	GENERIC_DAY	0	2	2010-02-12	912	\N	1516
11139	GENERIC_DAY	0	2	2010-07-11	914	\N	1516
11140	GENERIC_DAY	0	2	2013-02-13	912	\N	1516
11141	GENERIC_DAY	0	2	2010-10-20	916	\N	1516
11142	GENERIC_DAY	0	2	2010-07-12	914	\N	1516
11143	GENERIC_DAY	0	2	2010-01-17	916	\N	1516
11144	GENERIC_DAY	0	2	2011-07-14	910	\N	1516
11145	GENERIC_DAY	0	2	2013-02-21	910	\N	1516
11146	GENERIC_DAY	0	2	2011-06-10	910	\N	1516
11147	GENERIC_DAY	0	2	2011-07-02	912	\N	1516
11148	GENERIC_DAY	0	2	2011-05-05	910	\N	1516
11149	GENERIC_DAY	0	2	2013-03-19	914	\N	1516
11150	GENERIC_DAY	0	2	2010-01-25	916	\N	1516
11151	GENERIC_DAY	0	2	2010-11-23	912	\N	1516
11152	GENERIC_DAY	0	2	2011-10-16	914	\N	1516
11153	GENERIC_DAY	0	2	2010-07-05	910	\N	1516
11154	GENERIC_DAY	0	2	2011-04-17	912	\N	1516
11155	GENERIC_DAY	0	2	2012-05-23	916	\N	1516
11156	GENERIC_DAY	0	2	2013-01-18	914	\N	1516
11157	GENERIC_DAY	0	2	2012-07-22	912	\N	1516
11158	GENERIC_DAY	0	2	2012-02-17	910	\N	1516
11159	GENERIC_DAY	0	2	2011-03-17	912	\N	1516
11160	GENERIC_DAY	0	2	2012-04-04	914	\N	1516
11161	GENERIC_DAY	0	2	2010-02-12	916	\N	1516
11162	GENERIC_DAY	0	2	2011-11-11	914	\N	1516
11163	GENERIC_DAY	0	2	2011-02-03	916	\N	1516
11164	GENERIC_DAY	0	2	2010-10-20	910	\N	1516
11165	GENERIC_DAY	0	2	2012-07-14	916	\N	1516
11166	GENERIC_DAY	0	2	2010-12-06	916	\N	1516
11167	GENERIC_DAY	0	2	2011-10-31	912	\N	1516
11168	GENERIC_DAY	0	2	2011-05-31	916	\N	1516
11169	GENERIC_DAY	0	2	2011-07-19	914	\N	1516
11170	GENERIC_DAY	0	2	2012-10-20	910	\N	1516
11171	GENERIC_DAY	0	2	2012-06-03	910	\N	1516
11172	GENERIC_DAY	0	2	2012-05-17	912	\N	1516
11173	GENERIC_DAY	0	2	2010-03-14	912	\N	1516
11174	GENERIC_DAY	0	2	2011-06-06	914	\N	1516
11175	GENERIC_DAY	0	2	2011-01-17	910	\N	1516
11176	GENERIC_DAY	0	2	2012-12-03	910	\N	1516
11177	GENERIC_DAY	0	2	2010-05-09	912	\N	1516
11178	GENERIC_DAY	0	2	2010-01-10	916	\N	1516
11179	GENERIC_DAY	0	2	2012-03-29	916	\N	1516
11180	GENERIC_DAY	0	2	2012-04-22	914	\N	1516
11181	GENERIC_DAY	0	2	2010-11-10	912	\N	1516
11182	GENERIC_DAY	0	2	2011-06-25	912	\N	1516
11183	GENERIC_DAY	0	2	2010-03-25	912	\N	1516
11184	GENERIC_DAY	0	2	2010-05-08	910	\N	1516
11185	GENERIC_DAY	0	2	2011-01-19	910	\N	1516
11186	GENERIC_DAY	0	2	2011-07-22	916	\N	1516
11187	GENERIC_DAY	0	2	2011-06-02	914	\N	1516
11188	GENERIC_DAY	0	2	2011-04-16	914	\N	1516
11189	GENERIC_DAY	0	2	2012-08-13	912	\N	1516
11190	GENERIC_DAY	0	2	2011-02-17	912	\N	1516
11191	GENERIC_DAY	0	2	2013-02-07	914	\N	1516
11192	GENERIC_DAY	0	2	2012-03-09	914	\N	1516
11193	GENERIC_DAY	0	2	2012-10-04	912	\N	1516
11194	GENERIC_DAY	0	2	2010-11-03	912	\N	1516
11195	GENERIC_DAY	0	2	2010-02-01	914	\N	1516
11196	GENERIC_DAY	0	2	2011-09-16	912	\N	1516
11197	GENERIC_DAY	0	2	2012-04-15	914	\N	1516
11198	GENERIC_DAY	0	2	2010-01-20	912	\N	1516
11199	GENERIC_DAY	0	2	2012-06-15	912	\N	1516
11200	GENERIC_DAY	0	2	2011-12-08	914	\N	1516
11201	GENERIC_DAY	0	2	2010-12-28	910	\N	1516
11202	GENERIC_DAY	0	2	2012-01-13	910	\N	1516
11203	GENERIC_DAY	0	2	2012-05-22	916	\N	1516
11204	GENERIC_DAY	0	2	2011-08-06	914	\N	1516
11205	GENERIC_DAY	0	2	2012-02-18	914	\N	1516
11206	GENERIC_DAY	0	2	2011-08-07	916	\N	1516
11207	GENERIC_DAY	0	2	2013-02-19	914	\N	1516
11208	GENERIC_DAY	0	2	2012-12-30	910	\N	1516
11209	GENERIC_DAY	0	2	2011-04-24	916	\N	1516
11210	GENERIC_DAY	0	2	2011-04-12	916	\N	1516
11211	GENERIC_DAY	0	2	2012-10-29	914	\N	1516
11212	GENERIC_DAY	0	2	2011-10-17	916	\N	1516
11213	GENERIC_DAY	0	2	2011-05-20	916	\N	1516
11214	GENERIC_DAY	0	2	2012-05-12	912	\N	1516
11215	GENERIC_DAY	0	2	2010-07-20	916	\N	1516
11216	GENERIC_DAY	0	2	2010-04-30	916	\N	1516
11217	GENERIC_DAY	0	2	2010-05-05	912	\N	1516
11218	GENERIC_DAY	0	2	2012-07-28	912	\N	1516
11219	GENERIC_DAY	0	2	2010-06-29	910	\N	1516
11220	GENERIC_DAY	0	2	2010-09-18	912	\N	1516
11221	GENERIC_DAY	0	2	2012-05-17	916	\N	1516
11222	GENERIC_DAY	0	2	2012-02-07	916	\N	1516
11223	GENERIC_DAY	0	2	2011-04-08	914	\N	1516
11224	GENERIC_DAY	0	2	2010-11-08	910	\N	1516
11225	GENERIC_DAY	0	2	2010-11-27	912	\N	1516
11226	GENERIC_DAY	0	2	2013-02-22	912	\N	1516
11227	GENERIC_DAY	0	2	2010-06-07	916	\N	1516
11228	GENERIC_DAY	0	2	2012-10-07	914	\N	1516
11229	GENERIC_DAY	0	2	2012-02-18	916	\N	1516
11230	GENERIC_DAY	0	2	2012-12-28	910	\N	1516
11231	GENERIC_DAY	0	2	2010-06-15	912	\N	1516
11232	GENERIC_DAY	0	2	2010-12-01	910	\N	1516
11233	GENERIC_DAY	0	2	2012-06-05	912	\N	1516
11234	GENERIC_DAY	0	2	2012-04-25	916	\N	1516
11235	GENERIC_DAY	0	2	2012-05-24	916	\N	1516
11236	GENERIC_DAY	0	2	2011-01-19	914	\N	1516
11237	GENERIC_DAY	0	2	2010-02-24	910	\N	1516
11238	GENERIC_DAY	0	2	2012-11-03	912	\N	1516
11239	GENERIC_DAY	0	2	2011-07-08	914	\N	1516
11240	GENERIC_DAY	0	2	2011-09-03	912	\N	1516
11241	GENERIC_DAY	0	2	2010-04-10	912	\N	1516
11242	GENERIC_DAY	0	2	2011-01-29	910	\N	1516
11243	GENERIC_DAY	0	2	2011-05-08	916	\N	1516
11244	GENERIC_DAY	0	2	2011-12-13	912	\N	1516
11245	GENERIC_DAY	0	2	2010-10-29	910	\N	1516
11246	GENERIC_DAY	0	2	2009-12-31	916	\N	1516
11247	GENERIC_DAY	0	2	2013-03-27	910	\N	1516
11248	GENERIC_DAY	0	2	2009-12-30	916	\N	1516
11249	GENERIC_DAY	0	2	2010-03-05	916	\N	1516
11250	GENERIC_DAY	0	2	2012-08-31	910	\N	1516
11251	GENERIC_DAY	0	2	2012-02-13	914	\N	1516
11252	GENERIC_DAY	0	2	2012-04-24	916	\N	1516
11253	GENERIC_DAY	0	2	2011-04-27	912	\N	1516
11254	GENERIC_DAY	0	2	2010-09-10	916	\N	1516
11255	GENERIC_DAY	0	2	2012-01-29	910	\N	1516
11256	GENERIC_DAY	0	2	2010-02-06	916	\N	1516
11257	GENERIC_DAY	0	2	2011-11-12	910	\N	1516
11258	GENERIC_DAY	0	2	2011-05-09	916	\N	1516
11259	GENERIC_DAY	0	2	2012-09-29	916	\N	1516
11260	GENERIC_DAY	0	2	2011-04-18	912	\N	1516
11261	GENERIC_DAY	0	2	2010-11-30	912	\N	1516
11262	GENERIC_DAY	0	2	2011-03-19	912	\N	1516
11263	GENERIC_DAY	0	2	2011-09-25	916	\N	1516
11264	GENERIC_DAY	0	2	2012-12-18	912	\N	1516
11265	GENERIC_DAY	0	2	2011-11-22	914	\N	1516
11266	GENERIC_DAY	0	2	2011-01-26	916	\N	1516
11267	GENERIC_DAY	0	2	2011-02-27	916	\N	1516
11268	GENERIC_DAY	0	2	2012-06-03	916	\N	1516
11269	GENERIC_DAY	0	2	2010-03-07	912	\N	1516
11270	GENERIC_DAY	0	2	2011-02-14	912	\N	1516
11271	GENERIC_DAY	0	2	2012-11-27	910	\N	1516
11272	GENERIC_DAY	0	2	2011-10-09	914	\N	1516
11273	GENERIC_DAY	0	2	2010-10-01	916	\N	1516
11274	GENERIC_DAY	0	2	2010-12-23	914	\N	1516
11275	GENERIC_DAY	0	2	2010-08-17	910	\N	1516
11276	GENERIC_DAY	0	2	2011-09-26	910	\N	1516
11277	GENERIC_DAY	0	2	2010-12-30	914	\N	1516
11278	GENERIC_DAY	0	2	2013-05-07	914	\N	1516
11279	GENERIC_DAY	0	2	2011-01-30	916	\N	1516
11280	GENERIC_DAY	0	2	2010-06-24	916	\N	1516
11281	GENERIC_DAY	0	2	2013-02-10	914	\N	1516
11282	GENERIC_DAY	0	2	2012-07-01	910	\N	1516
11283	GENERIC_DAY	0	2	2012-06-10	910	\N	1516
11284	GENERIC_DAY	0	2	2011-09-11	916	\N	1516
11285	GENERIC_DAY	0	2	2012-08-31	914	\N	1516
11286	GENERIC_DAY	0	2	2010-03-24	916	\N	1516
11287	GENERIC_DAY	0	2	2010-07-22	912	\N	1516
11288	GENERIC_DAY	0	2	2010-02-05	916	\N	1516
11289	GENERIC_DAY	0	2	2010-06-13	914	\N	1516
11290	GENERIC_DAY	0	2	2011-10-07	912	\N	1516
11291	GENERIC_DAY	0	2	2011-12-16	912	\N	1516
11292	GENERIC_DAY	0	2	2012-11-19	916	\N	1516
11293	GENERIC_DAY	0	2	2011-02-02	912	\N	1516
11294	GENERIC_DAY	0	2	2010-09-19	914	\N	1516
11295	GENERIC_DAY	0	2	2010-11-26	914	\N	1516
11296	GENERIC_DAY	0	2	2011-12-09	912	\N	1516
11297	GENERIC_DAY	0	2	2012-02-29	914	\N	1516
11298	GENERIC_DAY	0	2	2010-07-24	912	\N	1516
11299	GENERIC_DAY	0	2	2012-06-09	912	\N	1516
11300	GENERIC_DAY	0	2	2011-11-01	912	\N	1516
11301	GENERIC_DAY	0	2	2013-04-27	910	\N	1516
11302	GENERIC_DAY	0	2	2013-03-27	914	\N	1516
11303	GENERIC_DAY	0	2	2010-10-07	912	\N	1516
11304	GENERIC_DAY	0	2	2012-05-19	914	\N	1516
11305	GENERIC_DAY	0	2	2011-09-07	914	\N	1516
11306	GENERIC_DAY	0	2	2010-04-05	912	\N	1516
11307	GENERIC_DAY	0	2	2013-01-31	910	\N	1516
11308	GENERIC_DAY	0	2	2010-10-30	914	\N	1516
11309	GENERIC_DAY	0	2	2010-03-28	914	\N	1516
11310	GENERIC_DAY	0	2	2011-01-23	910	\N	1516
11311	GENERIC_DAY	0	2	2010-07-01	916	\N	1516
11312	GENERIC_DAY	0	2	2012-02-01	910	\N	1516
11313	GENERIC_DAY	0	2	2013-03-21	910	\N	1516
11314	GENERIC_DAY	0	2	2011-01-20	914	\N	1516
11315	GENERIC_DAY	0	2	2012-08-26	916	\N	1516
11316	GENERIC_DAY	0	2	2011-07-16	910	\N	1516
11317	GENERIC_DAY	0	2	2011-10-09	910	\N	1516
11318	GENERIC_DAY	0	2	2013-05-05	912	\N	1516
11319	GENERIC_DAY	0	2	2011-05-01	910	\N	1516
11320	GENERIC_DAY	0	2	2011-11-20	912	\N	1516
11321	GENERIC_DAY	0	2	2012-09-20	914	\N	1516
11322	GENERIC_DAY	0	2	2010-02-08	916	\N	1516
11323	GENERIC_DAY	0	2	2011-01-11	912	\N	1516
11324	GENERIC_DAY	0	2	2011-11-01	914	\N	1516
11325	GENERIC_DAY	0	2	2010-09-10	912	\N	1516
11326	GENERIC_DAY	0	2	2012-11-26	916	\N	1516
11327	GENERIC_DAY	0	2	2012-05-08	916	\N	1516
11328	GENERIC_DAY	0	2	2010-12-20	914	\N	1516
11329	GENERIC_DAY	0	2	2011-02-26	912	\N	1516
11330	GENERIC_DAY	0	2	2011-08-30	916	\N	1516
11331	GENERIC_DAY	0	2	2013-04-29	914	\N	1516
11332	GENERIC_DAY	0	2	2010-09-27	914	\N	1516
11333	GENERIC_DAY	0	2	2012-07-12	910	\N	1516
11334	GENERIC_DAY	0	2	2010-03-17	914	\N	1516
11335	GENERIC_DAY	0	2	2011-07-03	912	\N	1516
11336	GENERIC_DAY	0	2	2011-03-25	914	\N	1516
11337	GENERIC_DAY	0	2	2012-04-23	916	\N	1516
11338	GENERIC_DAY	0	2	2012-11-11	914	\N	1516
11339	GENERIC_DAY	0	2	2013-02-01	916	\N	1516
11340	GENERIC_DAY	0	2	2010-11-06	910	\N	1516
11341	GENERIC_DAY	0	2	2011-06-24	916	\N	1516
11342	GENERIC_DAY	0	2	2012-09-26	914	\N	1516
11343	GENERIC_DAY	0	2	2011-02-09	914	\N	1516
11344	GENERIC_DAY	0	2	2012-02-01	912	\N	1516
11345	GENERIC_DAY	0	2	2012-02-12	910	\N	1516
11346	GENERIC_DAY	0	2	2013-04-16	910	\N	1516
11347	GENERIC_DAY	0	2	2010-08-25	912	\N	1516
11348	GENERIC_DAY	0	2	2011-03-02	910	\N	1516
11349	GENERIC_DAY	0	2	2010-09-10	910	\N	1516
11350	GENERIC_DAY	0	2	2012-03-23	916	\N	1516
11351	GENERIC_DAY	0	2	2012-01-04	916	\N	1516
11352	GENERIC_DAY	0	2	2012-10-25	912	\N	1516
11353	GENERIC_DAY	0	2	2013-02-09	912	\N	1516
11354	GENERIC_DAY	0	2	2011-07-30	912	\N	1516
11355	GENERIC_DAY	0	2	2012-04-26	914	\N	1516
11356	GENERIC_DAY	0	2	2010-03-12	916	\N	1516
11357	GENERIC_DAY	0	2	2010-02-18	912	\N	1516
11358	GENERIC_DAY	0	2	2010-08-29	912	\N	1516
11359	GENERIC_DAY	0	2	2012-01-28	912	\N	1516
11360	GENERIC_DAY	0	2	2012-07-18	912	\N	1516
11361	GENERIC_DAY	0	2	2011-07-26	916	\N	1516
11362	GENERIC_DAY	0	2	2012-06-26	912	\N	1516
11363	GENERIC_DAY	0	2	2012-04-28	910	\N	1516
11364	GENERIC_DAY	0	2	2010-08-27	912	\N	1516
11365	GENERIC_DAY	0	2	2010-07-03	912	\N	1516
11366	GENERIC_DAY	0	2	2012-12-15	912	\N	1516
11367	GENERIC_DAY	0	2	2010-07-14	912	\N	1516
11368	GENERIC_DAY	0	2	2011-03-22	912	\N	1516
11369	GENERIC_DAY	0	2	2011-10-11	914	\N	1516
11370	GENERIC_DAY	0	2	2012-08-02	910	\N	1516
11371	GENERIC_DAY	0	2	2012-12-04	912	\N	1516
11372	GENERIC_DAY	0	2	2012-03-26	912	\N	1516
11373	GENERIC_DAY	0	2	2010-01-05	912	\N	1516
11374	GENERIC_DAY	0	2	2011-08-15	912	\N	1516
11375	GENERIC_DAY	0	2	2011-09-15	916	\N	1516
11376	GENERIC_DAY	0	2	2011-11-17	912	\N	1516
11377	GENERIC_DAY	0	2	2012-06-02	914	\N	1516
11378	GENERIC_DAY	0	2	2010-02-16	914	\N	1516
11379	GENERIC_DAY	0	2	2009-12-22	914	\N	1516
11380	GENERIC_DAY	0	2	2010-03-29	912	\N	1516
11381	GENERIC_DAY	0	2	2011-05-31	914	\N	1516
11382	GENERIC_DAY	0	2	2011-08-30	912	\N	1516
11383	GENERIC_DAY	0	2	2012-02-28	912	\N	1516
11384	GENERIC_DAY	0	2	2011-06-19	912	\N	1516
11385	GENERIC_DAY	0	2	2010-02-06	910	\N	1516
11386	GENERIC_DAY	0	2	2013-01-08	912	\N	1516
11387	GENERIC_DAY	0	2	2010-12-04	912	\N	1516
11388	GENERIC_DAY	0	2	2012-09-12	914	\N	1516
11389	GENERIC_DAY	0	2	2010-03-20	912	\N	1516
11390	GENERIC_DAY	0	2	2011-07-17	910	\N	1516
11391	GENERIC_DAY	0	2	2012-09-05	912	\N	1516
11392	GENERIC_DAY	0	2	2010-09-13	912	\N	1516
11393	GENERIC_DAY	0	2	2010-07-09	910	\N	1516
11394	GENERIC_DAY	0	2	2010-04-22	914	\N	1516
11395	GENERIC_DAY	0	2	2011-04-28	916	\N	1516
11396	GENERIC_DAY	0	2	2012-10-21	912	\N	1516
11397	GENERIC_DAY	0	2	2012-01-07	910	\N	1516
11398	GENERIC_DAY	0	2	2012-08-20	912	\N	1516
11399	GENERIC_DAY	0	2	2012-05-24	912	\N	1516
11400	GENERIC_DAY	0	2	2011-12-11	912	\N	1516
11401	GENERIC_DAY	0	2	2013-03-03	916	\N	1516
11402	GENERIC_DAY	0	2	2013-02-16	916	\N	1516
11403	GENERIC_DAY	0	2	2010-12-10	916	\N	1516
11404	GENERIC_DAY	0	2	2012-01-20	914	\N	1516
11405	GENERIC_DAY	0	2	2010-07-30	910	\N	1516
11406	GENERIC_DAY	0	2	2009-12-29	916	\N	1516
11407	GENERIC_DAY	0	2	2011-09-06	912	\N	1516
11408	GENERIC_DAY	0	2	2012-12-03	912	\N	1516
11409	GENERIC_DAY	0	2	2011-06-07	912	\N	1516
11410	GENERIC_DAY	0	2	2010-08-13	910	\N	1516
11411	GENERIC_DAY	0	2	2009-12-27	912	\N	1516
11412	GENERIC_DAY	0	2	2012-12-17	912	\N	1516
11413	GENERIC_DAY	0	2	2010-11-15	912	\N	1516
11414	GENERIC_DAY	0	2	2011-12-21	916	\N	1516
11415	GENERIC_DAY	0	2	2012-12-21	914	\N	1516
11416	GENERIC_DAY	0	2	2010-02-21	912	\N	1516
11417	GENERIC_DAY	0	2	2012-05-12	910	\N	1516
11418	GENERIC_DAY	0	2	2011-07-02	914	\N	1516
11419	GENERIC_DAY	0	2	2012-10-11	910	\N	1516
11420	GENERIC_DAY	0	2	2012-05-22	910	\N	1516
11421	GENERIC_DAY	0	2	2010-10-04	912	\N	1516
11422	GENERIC_DAY	0	2	2012-04-16	916	\N	1516
11423	GENERIC_DAY	0	2	2012-09-02	912	\N	1516
11424	GENERIC_DAY	0	2	2012-02-15	910	\N	1516
11425	GENERIC_DAY	0	2	2009-12-26	912	\N	1516
11426	GENERIC_DAY	0	2	2011-05-13	910	\N	1516
11427	GENERIC_DAY	0	2	2011-07-19	912	\N	1516
11428	GENERIC_DAY	0	2	2011-04-25	910	\N	1516
11429	GENERIC_DAY	0	2	2010-03-31	916	\N	1516
11430	GENERIC_DAY	0	2	2012-05-08	914	\N	1516
11431	GENERIC_DAY	0	2	2012-02-06	916	\N	1516
11432	GENERIC_DAY	0	2	2011-12-11	910	\N	1516
11433	GENERIC_DAY	0	2	2011-06-07	910	\N	1516
11434	GENERIC_DAY	0	2	2013-02-02	910	\N	1516
11435	GENERIC_DAY	0	2	2010-04-18	914	\N	1516
11436	GENERIC_DAY	0	2	2010-01-03	914	\N	1516
11437	GENERIC_DAY	0	2	2013-01-26	914	\N	1516
11438	GENERIC_DAY	0	2	2013-04-19	910	\N	1516
11439	GENERIC_DAY	0	2	2011-03-27	912	\N	1516
11440	GENERIC_DAY	0	2	2011-07-30	910	\N	1516
11441	GENERIC_DAY	0	2	2010-07-08	914	\N	1516
11442	GENERIC_DAY	0	2	2012-10-15	912	\N	1516
11443	GENERIC_DAY	0	2	2010-10-05	912	\N	1516
11444	GENERIC_DAY	0	2	2012-03-19	916	\N	1516
11445	GENERIC_DAY	0	2	2010-08-18	910	\N	1516
11446	GENERIC_DAY	0	2	2012-09-05	914	\N	1516
11447	GENERIC_DAY	0	2	2011-05-29	914	\N	1516
11448	GENERIC_DAY	0	2	2011-06-08	912	\N	1516
11449	GENERIC_DAY	0	2	2011-10-23	910	\N	1516
11450	GENERIC_DAY	0	2	2010-11-22	912	\N	1516
11451	GENERIC_DAY	0	2	2012-09-24	916	\N	1516
11452	GENERIC_DAY	0	2	2010-07-29	910	\N	1516
11453	GENERIC_DAY	0	2	2011-05-31	912	\N	1516
11454	GENERIC_DAY	0	2	2013-04-04	916	\N	1516
11455	GENERIC_DAY	0	2	2013-02-03	910	\N	1516
11456	GENERIC_DAY	0	2	2012-04-02	912	\N	1516
11457	GENERIC_DAY	0	2	2010-07-20	910	\N	1516
11458	GENERIC_DAY	0	2	2011-12-10	916	\N	1516
11459	GENERIC_DAY	0	2	2011-08-04	910	\N	1516
11460	GENERIC_DAY	0	2	2010-09-03	916	\N	1516
11461	GENERIC_DAY	0	2	2010-05-22	914	\N	1516
11462	GENERIC_DAY	0	2	2012-06-04	912	\N	1516
11463	GENERIC_DAY	0	2	2013-03-02	914	\N	1516
11464	GENERIC_DAY	0	2	2011-05-11	910	\N	1516
11465	GENERIC_DAY	0	2	2011-07-25	912	\N	1516
11466	GENERIC_DAY	0	2	2012-07-21	910	\N	1516
11467	GENERIC_DAY	0	2	2011-06-03	912	\N	1516
11468	GENERIC_DAY	0	2	2010-01-30	912	\N	1516
11469	GENERIC_DAY	0	2	2013-03-26	914	\N	1516
11470	GENERIC_DAY	0	2	2012-06-01	914	\N	1516
11471	GENERIC_DAY	0	2	2013-03-27	916	\N	1516
11472	GENERIC_DAY	0	2	2010-10-09	916	\N	1516
11473	GENERIC_DAY	0	2	2011-08-13	914	\N	1516
11474	GENERIC_DAY	0	2	2011-04-18	916	\N	1516
11475	GENERIC_DAY	0	2	2013-02-11	910	\N	1516
11476	GENERIC_DAY	0	2	2011-06-29	914	\N	1516
11477	GENERIC_DAY	0	2	2010-01-23	910	\N	1516
11478	GENERIC_DAY	0	2	2011-01-09	912	\N	1516
11479	GENERIC_DAY	0	2	2013-03-19	910	\N	1516
11480	GENERIC_DAY	0	2	2012-11-05	914	\N	1516
11481	GENERIC_DAY	0	2	2012-11-21	916	\N	1516
11482	GENERIC_DAY	0	2	2012-09-21	914	\N	1516
11483	GENERIC_DAY	0	2	2013-03-16	910	\N	1516
11484	GENERIC_DAY	0	2	2013-03-12	912	\N	1516
11485	GENERIC_DAY	0	2	2012-04-11	910	\N	1516
11486	GENERIC_DAY	0	2	2010-02-26	912	\N	1516
11487	GENERIC_DAY	0	2	2010-02-02	914	\N	1516
11488	GENERIC_DAY	0	2	2011-09-09	914	\N	1516
11489	GENERIC_DAY	0	2	2012-05-30	916	\N	1516
11490	GENERIC_DAY	0	2	2011-03-09	914	\N	1516
11491	GENERIC_DAY	0	2	2010-03-01	910	\N	1516
11492	GENERIC_DAY	0	2	2010-03-13	912	\N	1516
11493	GENERIC_DAY	0	2	2010-11-09	910	\N	1516
11494	GENERIC_DAY	0	2	2010-05-26	910	\N	1516
11495	GENERIC_DAY	0	2	2012-03-16	914	\N	1516
11496	GENERIC_DAY	0	2	2010-10-24	910	\N	1516
11497	GENERIC_DAY	0	2	2010-10-14	912	\N	1516
11498	GENERIC_DAY	0	2	2010-03-29	910	\N	1516
11499	GENERIC_DAY	0	2	2011-06-28	916	\N	1516
11500	GENERIC_DAY	0	2	2012-02-20	916	\N	1516
11501	GENERIC_DAY	0	2	2011-04-30	916	\N	1516
11502	GENERIC_DAY	0	2	2011-09-04	910	\N	1516
11503	GENERIC_DAY	0	2	2011-06-04	914	\N	1516
11504	GENERIC_DAY	0	2	2010-08-02	910	\N	1516
11505	GENERIC_DAY	0	2	2010-10-30	912	\N	1516
11506	GENERIC_DAY	0	2	2013-05-10	914	\N	1516
11507	GENERIC_DAY	0	2	2012-12-12	914	\N	1516
11508	GENERIC_DAY	0	2	2011-10-20	916	\N	1516
11509	GENERIC_DAY	0	2	2012-04-17	916	\N	1516
11510	GENERIC_DAY	0	2	2011-12-23	912	\N	1516
11511	GENERIC_DAY	0	2	2010-09-15	916	\N	1516
11512	GENERIC_DAY	0	2	2012-05-06	916	\N	1516
11513	GENERIC_DAY	0	2	2011-09-29	912	\N	1516
11514	GENERIC_DAY	0	2	2010-08-27	914	\N	1516
11515	GENERIC_DAY	0	2	2011-02-04	914	\N	1516
11516	GENERIC_DAY	0	2	2012-03-18	916	\N	1516
11517	GENERIC_DAY	0	2	2010-01-04	916	\N	1516
11518	GENERIC_DAY	0	2	2010-03-10	914	\N	1516
11519	GENERIC_DAY	0	2	2010-02-11	910	\N	1516
11520	GENERIC_DAY	0	2	2013-01-08	914	\N	1516
11521	GENERIC_DAY	0	2	2012-03-30	916	\N	1516
11522	GENERIC_DAY	0	2	2011-03-23	914	\N	1516
11523	GENERIC_DAY	0	2	2011-10-13	914	\N	1516
11524	GENERIC_DAY	0	2	2012-02-15	916	\N	1516
11525	GENERIC_DAY	0	2	2010-07-25	916	\N	1516
11526	GENERIC_DAY	0	2	2013-02-21	912	\N	1516
11527	GENERIC_DAY	0	2	2010-11-20	910	\N	1516
11528	GENERIC_DAY	0	2	2010-05-09	910	\N	1516
11529	GENERIC_DAY	0	2	2011-03-29	916	\N	1516
11530	GENERIC_DAY	0	2	2012-09-14	912	\N	1516
11531	GENERIC_DAY	0	2	2013-03-10	912	\N	1516
11532	GENERIC_DAY	0	2	2012-02-20	914	\N	1516
11533	GENERIC_DAY	0	2	2010-07-01	912	\N	1516
11534	GENERIC_DAY	0	2	2012-05-14	914	\N	1516
11535	GENERIC_DAY	0	2	2010-10-02	912	\N	1516
11536	GENERIC_DAY	0	2	2012-10-05	910	\N	1516
11537	GENERIC_DAY	0	2	2010-11-15	910	\N	1516
11538	GENERIC_DAY	0	2	2010-06-14	916	\N	1516
11539	GENERIC_DAY	0	2	2012-09-01	912	\N	1516
11540	GENERIC_DAY	0	2	2010-07-22	910	\N	1516
11541	GENERIC_DAY	0	2	2012-09-14	916	\N	1516
11542	GENERIC_DAY	0	2	2010-06-11	912	\N	1516
11543	GENERIC_DAY	0	2	2012-01-24	912	\N	1516
11544	GENERIC_DAY	0	2	2012-04-10	912	\N	1516
11545	GENERIC_DAY	0	2	2010-04-07	916	\N	1516
11546	GENERIC_DAY	0	2	2011-06-13	916	\N	1516
11547	GENERIC_DAY	0	2	2013-04-28	912	\N	1516
11548	GENERIC_DAY	0	2	2012-03-31	910	\N	1516
11549	GENERIC_DAY	0	2	2011-01-31	914	\N	1516
11550	GENERIC_DAY	0	2	2010-10-26	914	\N	1516
11551	GENERIC_DAY	0	2	2011-06-21	914	\N	1516
11552	GENERIC_DAY	0	2	2010-11-16	914	\N	1516
11553	GENERIC_DAY	0	2	2011-11-12	916	\N	1516
11554	GENERIC_DAY	0	2	2010-04-03	914	\N	1516
11555	GENERIC_DAY	0	2	2013-03-04	910	\N	1516
11556	GENERIC_DAY	0	2	2010-12-25	912	\N	1516
11557	GENERIC_DAY	0	2	2010-12-01	916	\N	1516
11558	GENERIC_DAY	0	2	2010-08-07	916	\N	1516
11559	GENERIC_DAY	0	2	2010-07-30	916	\N	1516
11560	GENERIC_DAY	0	2	2011-02-19	912	\N	1516
11561	GENERIC_DAY	0	2	2012-12-07	912	\N	1516
11562	GENERIC_DAY	0	2	2013-01-22	914	\N	1516
11563	GENERIC_DAY	0	2	2012-01-14	910	\N	1516
11564	GENERIC_DAY	0	2	2011-06-16	910	\N	1516
11565	GENERIC_DAY	0	2	2011-06-26	916	\N	1516
11566	GENERIC_DAY	0	2	2010-08-06	914	\N	1516
11567	GENERIC_DAY	0	2	2010-06-05	916	\N	1516
11568	GENERIC_DAY	0	2	2012-12-17	914	\N	1516
11569	GENERIC_DAY	0	2	2012-10-11	912	\N	1516
11570	GENERIC_DAY	0	2	2010-02-02	910	\N	1516
11571	GENERIC_DAY	0	2	2011-07-23	912	\N	1516
11572	GENERIC_DAY	0	2	2011-04-06	914	\N	1516
11573	GENERIC_DAY	0	2	2011-08-09	912	\N	1516
11574	GENERIC_DAY	0	2	2013-02-10	912	\N	1516
11575	GENERIC_DAY	0	2	2012-08-02	914	\N	1516
11576	GENERIC_DAY	0	2	2010-08-09	910	\N	1516
11577	GENERIC_DAY	0	2	2011-10-29	910	\N	1516
11578	GENERIC_DAY	0	2	2010-09-22	912	\N	1516
11579	GENERIC_DAY	0	2	2012-01-03	912	\N	1516
11580	GENERIC_DAY	0	2	2011-05-19	910	\N	1516
11581	GENERIC_DAY	0	2	2012-06-17	916	\N	1516
11582	GENERIC_DAY	0	2	2013-01-20	916	\N	1516
11583	GENERIC_DAY	0	2	2012-09-22	912	\N	1516
11584	GENERIC_DAY	0	2	2010-01-22	912	\N	1516
11585	GENERIC_DAY	0	2	2011-11-22	916	\N	1516
11586	GENERIC_DAY	0	2	2010-08-09	912	\N	1516
11587	GENERIC_DAY	0	2	2010-01-20	916	\N	1516
11588	GENERIC_DAY	0	2	2010-01-26	912	\N	1516
11589	GENERIC_DAY	0	2	2010-05-19	910	\N	1516
11590	GENERIC_DAY	0	2	2013-01-05	916	\N	1516
11591	GENERIC_DAY	0	2	2010-02-25	912	\N	1516
11592	GENERIC_DAY	0	2	2011-02-11	916	\N	1516
11593	GENERIC_DAY	0	2	2011-11-10	916	\N	1516
11594	GENERIC_DAY	0	2	2011-02-09	912	\N	1516
11595	GENERIC_DAY	0	2	2012-02-08	916	\N	1516
11596	GENERIC_DAY	0	2	2012-02-29	916	\N	1516
11597	GENERIC_DAY	0	2	2013-02-03	914	\N	1516
11598	GENERIC_DAY	0	2	2012-02-20	910	\N	1516
11599	GENERIC_DAY	0	2	2010-02-09	914	\N	1516
11600	GENERIC_DAY	0	2	2013-01-24	910	\N	1516
11601	GENERIC_DAY	0	2	2010-06-09	916	\N	1516
11602	GENERIC_DAY	0	2	2012-09-16	914	\N	1516
11603	GENERIC_DAY	0	2	2011-04-25	912	\N	1516
11604	GENERIC_DAY	0	2	2011-09-14	912	\N	1516
11605	GENERIC_DAY	0	2	2010-05-06	916	\N	1516
11606	GENERIC_DAY	0	2	2010-02-13	914	\N	1516
11607	GENERIC_DAY	0	2	2013-05-06	914	\N	1516
11608	GENERIC_DAY	0	2	2011-01-08	912	\N	1516
11609	GENERIC_DAY	0	2	2009-12-09	914	\N	1516
11610	GENERIC_DAY	0	2	2011-11-21	910	\N	1516
11611	GENERIC_DAY	0	2	2012-02-16	910	\N	1516
11612	GENERIC_DAY	0	2	2010-11-17	916	\N	1516
11613	GENERIC_DAY	0	2	2011-04-29	912	\N	1516
11614	GENERIC_DAY	0	2	2011-04-25	916	\N	1516
11615	GENERIC_DAY	0	2	2011-02-14	914	\N	1516
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
\.


--
-- Data for Name: description_values; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values (description_value_id, fieldname, value) FROM stdin;
\.


--
-- Data for Name: description_values_in_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values_in_line (description_value_id, fieldname, value) FROM stdin;
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
1516
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, index) FROM stdin;
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
116
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, name, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
1316	2	New hours group 0	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	10000	1.00	f	1127
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
505	8	0
505	8	1
505	8	2
505	8	3
505	8	4
505	0	5
505	0	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
1224	1126
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, name, label_type_id) FROM stdin;
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, name) FROM stdin;
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, index) FROM stdin;
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
\.


--
-- Data for Name: machine_configuration_unit_required_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine_configuration_unit_required_criterions (id, criterion_id) FROM stdin;
\.


--
-- Data for Name: machineworkerassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkerassignment (id, version, startdate, finishdate, configuration_id, worker_id) FROM stdin;
\.


--
-- Data for Name: machineworkersconfigurationunit; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkersconfigurationunit (id, version, name, alpha, machine) FROM stdin;
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material (id, version, code, description, default_unit_price, unit_type, disabled, category_id) FROM stdin;
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, estimated_availability, status, order_element_id, material_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_category (id, version, name, parent_id) FROM stdin;
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password) FROM stdin;
707	2	user	user
708	1	admin	admin
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, customer, dependenciesconstraintshavepriority, base_calendar_id) FROM stdin;
1126	\N	\N	\N	404
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, initdate, deadline, mandatoryinit, mandatoryend, description, code, schedulingstatetype, parent, positionincontainer) FROM stdin;
1126	2	o1	2009-12-09 10:17:38.987	\N	f	f	\N	o1	3	\N	\N
1127	2	oe1	\N	\N	f	f	\N	oe1	0	1126	0
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid) FROM stdin;
1127
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1126
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, calendar) FROM stdin;
910	1	406
912	1	407
914	1	408
916	1	409
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
1516	0	1.00	1414	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id) FROM stdin;
406
407
408
409
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, initdate, enddate, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id) FROM stdin;
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate) FROM stdin;
1414	1	0	\N
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
1414	1316
1415	1316
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
1414	3	oe1	\N	2009-12-09 10:17:38.987	2013-05-12 10:17:38.987	\N	1415	\N	0
1415	3	\N	\N	2009-12-09 10:17:38.987	2013-05-12 10:17:38.987	\N	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
1415
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
1414	2	1127
1415	2	1126
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
707	ROLE_BASIC_USER
708	ROLE_BASIC_USER
708	ROLE_ADMINISTRATION
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, date, work_report_type_id, resource_id, order_element_id) FROM stdin;
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, index, label_type_id, label_id, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
910	a	a	1
912	b	b	2
914	c	c	3
916	d	d	4
\.


--
-- Data for Name: workreports_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreports_labels (work_report_id, label_id) FROM stdin;
\.


--
-- Data for Name: workreportslines_labels; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY workreportslines_labels (work_report_line_id, label_id) FROM stdin;
\.


--
-- Name: advanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advanceassignment
    ADD CONSTRAINT advanceassignment_pkey PRIMARY KEY (id);


--
-- Name: advancemeasurement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT advancemeasurement_pkey PRIMARY KEY (id);


--
-- Name: advancetype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancetype
    ADD CONSTRAINT advancetype_pkey PRIMARY KEY (id);


--
-- Name: advancetype_unitname_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advancetype
    ADD CONSTRAINT advancetype_unitname_key UNIQUE (unitname);


--
-- Name: all_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT all_criterions_pkey PRIMARY KEY (generic_resource_allocation_id, criterion_id);


--
-- Name: assignment_function_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY assignment_function
    ADD CONSTRAINT assignment_function_pkey PRIMARY KEY (id);


--
-- Name: basecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY basecalendar
    ADD CONSTRAINT basecalendar_pkey PRIMARY KEY (id);


--
-- Name: calendaravailability_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendaravailability
    ADD CONSTRAINT calendaravailability_pkey PRIMARY KEY (id);


--
-- Name: calendardata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_pkey PRIMARY KEY (id);


--
-- Name: calendarexception_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_pkey PRIMARY KEY (id);


--
-- Name: calendarexceptiontype_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_name_key UNIQUE (name);


--
-- Name: calendarexceptiontype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_pkey PRIMARY KEY (id);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (id);


--
-- Name: cost_category_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_name_key UNIQUE (name);


--
-- Name: cost_category_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_pkey PRIMARY KEY (id);


--
-- Name: criterion_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_name_key UNIQUE (name, id_criterion_type);


--
-- Name: criterion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_pkey PRIMARY KEY (id);


--
-- Name: criterionrequirement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT criterionrequirement_pkey PRIMARY KEY (id);


--
-- Name: criterionsatisfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_pkey PRIMARY KEY (id);


--
-- Name: criteriontype_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_name_key UNIQUE (name);


--
-- Name: criteriontype_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_pkey PRIMARY KEY (id);


--
-- Name: day_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT day_assignment_pkey PRIMARY KEY (id);


--
-- Name: dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (id);


--
-- Name: directadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT directadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: generic_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT generic_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: hour_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_pkey PRIMARY KEY (id);


--
-- Name: hoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_pkey PRIMARY KEY (id);


--
-- Name: hoursperday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursperday
    ADD CONSTRAINT hoursperday_pkey PRIMARY KEY (base_calendar_id, day_id);


--
-- Name: indirectadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT indirectadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: label_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_name_key UNIQUE (name, label_type_id);


--
-- Name: label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: label_type_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_name_key UNIQUE (name);


--
-- Name: label_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_pkey PRIMARY KEY (id);


--
-- Name: machine_configuration_unit_required_criterions_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT machine_configuration_unit_required_criterions_pkey PRIMARY KEY (id, criterion_id);


--
-- Name: machine_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (machine_id);


--
-- Name: machineworkerassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT machineworkerassignment_pkey PRIMARY KEY (id);


--
-- Name: machineworkersconfigurationunit_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY machineworkersconfigurationunit
    ADD CONSTRAINT machineworkersconfigurationunit_pkey PRIMARY KEY (id);


--
-- Name: material_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT material_assigment_pkey PRIMARY KEY (id);


--
-- Name: material_category_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_pkey PRIMARY KEY (id);


--
-- Name: material_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_code_key UNIQUE (code);


--
-- Name: material_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- Name: naval_user_loginname_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT naval_user_loginname_key UNIQUE (loginname);


--
-- Name: naval_user_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT naval_user_pkey PRIMARY KEY (id);


--
-- Name: order_element_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT order_element_label_pkey PRIMARY KEY (order_element_id, label_id);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_pkey PRIMARY KEY (id);


--
-- Name: orderline_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT orderline_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderlinegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinegroup
    ADD CONSTRAINT orderlinegroup_pkey PRIMARY KEY (orderelementid);


--
-- Name: resource_calendar_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_calendar_key UNIQUE (calendar);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resourceallocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT resourceallocation_pkey PRIMARY KEY (id);


--
-- Name: resourcecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resourcecalendar
    ADD CONSTRAINT resourcecalendar_pkey PRIMARY KEY (base_calendar_id);


--
-- Name: resources_cost_category_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_pkey PRIMARY KEY (id);


--
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: stretches_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT stretches_pkey PRIMARY KEY (assignment_function_id, stretch_position);


--
-- Name: stretchesfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY stretchesfunction
    ADD CONSTRAINT stretchesfunction_pkey PRIMARY KEY (assignment_function_id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_source_hours_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT task_source_hours_groups_pkey PRIMARY KEY (task_source_id, hours_group_id);


--
-- Name: taskelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT taskelement_pkey PRIMARY KEY (id);


--
-- Name: taskgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskgroup
    ADD CONSTRAINT taskgroup_pkey PRIMARY KEY (task_element_id);


--
-- Name: taskmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskmilestone
    ADD CONSTRAINT taskmilestone_pkey PRIMARY KEY (task_element_id);


--
-- Name: tasksource_orderelement_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_orderelement_key UNIQUE (orderelement);


--
-- Name: tasksource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_pkey PRIMARY KEY (id);


--
-- Name: type_of_work_hours_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_code_key UNIQUE (code);


--
-- Name: type_of_work_hours_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_name_key UNIQUE (name);


--
-- Name: type_of_work_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY type_of_work_hours
    ADD CONSTRAINT type_of_work_hours_pkey PRIMARY KEY (id);


--
-- Name: work_report_label_type_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT work_report_label_type_assigment_pkey PRIMARY KEY (id);


--
-- Name: work_report_line_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_pkey PRIMARY KEY (id);


--
-- Name: work_report_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_pkey PRIMARY KEY (id);


--
-- Name: work_report_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_code_key UNIQUE (code);


--
-- Name: work_report_type_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_name_key UNIQUE (name);


--
-- Name: work_report_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_type
    ADD CONSTRAINT work_report_type_pkey PRIMARY KEY (id);


--
-- Name: worker_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (worker_id);


--
-- Name: workreports_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT workreports_labels_pkey PRIMARY KEY (work_report_id, label_id);


--
-- Name: workreportslines_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT workreportslines_labels_pkey PRIMARY KEY (work_report_line_id, label_id);


--
-- Name: fk1961a43d415884f6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY heading_field
    ADD CONSTRAINT fk1961a43d415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


--
-- Name: fk1a95a222131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a222131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fk1a95a22248d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a22248d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk1a95a222efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT fk1a95a222efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk1a9afa91a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT fk1a9afa91a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk1a9afa91adad7e51; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT fk1a9afa91adad7e51 FOREIGN KEY (calendar_exception_id) REFERENCES calendarexceptiontype(id);


--
-- Name: fk27a9a54936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a54936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk3a79eb0261f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb0261f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk3a79eb02e036cfed; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02e036cfed FOREIGN KEY (hours_group_id) REFERENCES hoursgroup(id);


--
-- Name: fk3a79eb02efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fk3a79eb02f41d57f2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb02f41d57f2 FOREIGN KEY (parent) REFERENCES criterionrequirement(id);


--
-- Name: fk3d1ffd21218d7620; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd21218d7620 FOREIGN KEY (indirect_order_element_id) REFERENCES orderelement(id);


--
-- Name: fk3d1ffd212f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd212f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fk3d1ffd218202350f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY indirectadvanceassignment
    ADD CONSTRAINT fk3d1ffd218202350f FOREIGN KEY (indirect_order_element_id) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fk3f30d9ad8c4c676c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT fk3f30d9ad8c4c676c FOREIGN KEY (criterion) REFERENCES criterion(id);


--
-- Name: fk3f30d9adeae850b2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT fk3f30d9adeae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fk401dc6acffeb5538; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkersconfigurationunit
    ADD CONSTRAINT fk401dc6acffeb5538 FOREIGN KEY (machine) REFERENCES machine(machine_id);


--
-- Name: fk407955279578651e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk407955279578651e FOREIGN KEY (category_id) REFERENCES material_category(id);


--
-- Name: fk41e073ae15671e92; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT fk41e073ae15671e92 FOREIGN KEY (assignment_function) REFERENCES assignment_function(id);


--
-- Name: fk41e073aeff61540d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourceallocation
    ADD CONSTRAINT fk41e073aeff61540d FOREIGN KEY (task) REFERENCES task(task_element_id);


--
-- Name: fk44d86d4707cd777; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY label
    ADD CONSTRAINT fk44d86d4707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fk5863798ca44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resourcecalendar
    ADD CONSTRAINT fk5863798ca44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk593d3b4b1a5e11f8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY stretchesfunction
    ADD CONSTRAINT fk593d3b4b1a5e11f8 FOREIGN KEY (assignment_function_id) REFERENCES assignment_function(id);


--
-- Name: fk5c13eccf415884f6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY line_field
    ADD CONSTRAINT fk5c13eccf415884f6 FOREIGN KEY (heading_id) REFERENCES work_report_type(id);


--
-- Name: fk6017744297b1c209; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderline
    ADD CONSTRAINT fk6017744297b1c209 FOREIGN KEY (orderelementid) REFERENCES orderelement(id);


--
-- Name: fk62b2994b4936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskmilestone
    ADD CONSTRAINT fk62b2994b4936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk70d5d997a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT fk70d5d997a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk70d5d997a5f3c581; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT fk70d5d997a5f3c581 FOREIGN KEY (parent) REFERENCES taskgroup(task_element_id);


--
-- Name: fk7540af6b1545e7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b1545e7a FOREIGN KEY (origin) REFERENCES taskelement(id);


--
-- Name: fk7540af6be838f362; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6be838f362 FOREIGN KEY (destination) REFERENCES taskelement(id);


--
-- Name: fk75a2f39da44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39da44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk75a2f39df82680f8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39df82680f8 FOREIGN KEY (orderelementid) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fk7980035061f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk7980035061f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk79800350b1524a73; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY all_criterions
    ADD CONSTRAINT fk79800350b1524a73 FOREIGN KEY (generic_resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fk7d2eeb5d97b1c209; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegroup
    ADD CONSTRAINT fk7d2eeb5d97b1c209 FOREIGN KEY (orderelementid) REFERENCES orderelement(id);


--
-- Name: fk7daad5cd5078e161; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fk7daad5cd5078e161 FOREIGN KEY (work_report_line_id) REFERENCES work_report_line(id);


--
-- Name: fk7daad5cdc1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreportslines_labels
    ADD CONSTRAINT fk7daad5cdc1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fk808010cfb216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignment
    ADD CONSTRAINT fk808010cfb216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


--
-- Name: fk80e79bda4936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY taskgroup
    ADD CONSTRAINT fk80e79bda4936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk82ca26e5fec79eb0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY description_values
    ADD CONSTRAINT fk82ca26e5fec79eb0 FOREIGN KEY (description_value_id) REFERENCES work_report(id);


--
-- Name: fk8746516b53669f2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT fk8746516b53669f2 FOREIGN KEY (parent_id) REFERENCES material_category(id);


--
-- Name: fk8ca5223648d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk8ca5223648d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fk8ca52236c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT fk8ca52236c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


--
-- Name: fk8e542e8114a5c61; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk8e542e8114a5c61 FOREIGN KEY (id_criterion_type) REFERENCES criteriontype(id);


--
-- Name: fk8e542e813a156175; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT fk8e542e813a156175 FOREIGN KEY (parent) REFERENCES criterion(id);


--
-- Name: fk9469dc27937680b7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine
    ADD CONSTRAINT fk9469dc27937680b7 FOREIGN KEY (machine_id) REFERENCES resource(id);


--
-- Name: fk95548d7861f02c44; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7861f02c44 FOREIGN KEY (criterion_id) REFERENCES criterion(id);


--
-- Name: fk95548d7875999a91; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machine_configuration_unit_required_criterions
    ADD CONSTRAINT fk95548d7875999a91 FOREIGN KEY (id) REFERENCES machineworkersconfigurationunit(id);


--
-- Name: fk9ac73f9e40901220; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT fk9ac73f9e40901220 FOREIGN KEY (worker_id) REFERENCES resource(id);


--
-- Name: fka01aabd9a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendaravailability
    ADD CONSTRAINT fka01aabd9a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fka01fe4ee8c80ccb7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4ee8c80ccb7 FOREIGN KEY (task_source_id) REFERENCES tasksource(id);


--
-- Name: fka01fe4eee036cfed; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT fka01fe4eee036cfed FOREIGN KEY (hours_group_id) REFERENCES hoursgroup(id);


--
-- Name: fka2d2a4d6cc119699; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fka2d2a4d6cc119699 FOREIGN KEY (configuration_id) REFERENCES basecalendar(id);


--
-- Name: fkb05e6e203d72bc6f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e203d72bc6f FOREIGN KEY (id) REFERENCES taskelement(id);


--
-- Name: fkb05e6e2067faf86e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e2067faf86e FOREIGN KEY (orderelement) REFERENCES orderelement(id);


--
-- Name: fkbb2f91fa2f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT fkbb2f91fa2f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fkbb2f91faa9e53843; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advancemeasurement
    ADD CONSTRAINT fkbb2f91faa9e53843 FOREIGN KEY (advance_assignment_id) REFERENCES directadvanceassignment(advance_assignment_id);


--
-- Name: fkbb493f5048d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5048d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbb493f506394139; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f506394139 FOREIGN KEY (specific_resource_allocation_id) REFERENCES specific_resource_allocation(resource_allocation_id);


--
-- Name: fkbb493f50b1524a73; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50b1524a73 FOREIGN KEY (generic_resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fkc001d52efd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursperday
    ADD CONSTRAINT fkc001d52efd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


--
-- Name: fkc6c799292c57f12a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fkc6c799292c57f12a FOREIGN KEY (userid) REFERENCES naval_user(id);


--
-- Name: fkcf1f2cd01ed629ea; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT fkcf1f2cd01ed629ea FOREIGN KEY (parent_order_line) REFERENCES orderline(orderelementid);


--
-- Name: fkd7d7eb1286b2de7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT fkd7d7eb1286b2de7a FOREIGN KEY (configuration_id) REFERENCES machineworkersconfigurationunit(id);


--
-- Name: fkd7d7eb129bebcf10; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY machineworkerassignment
    ADD CONSTRAINT fkd7d7eb129bebcf10 FOREIGN KEY (worker_id) REFERENCES worker(worker_id);


--
-- Name: fkd9f8f120131853a1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120131853a1 FOREIGN KEY (work_report_type_id) REFERENCES work_report_type(id);


--
-- Name: fkd9f8f120707cd777; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120707cd777 FOREIGN KEY (label_type_id) REFERENCES label_type(id);


--
-- Name: fkd9f8f120c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT fkd9f8f120c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkdbbb4fee1e635c19; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4fee1e635c19 FOREIGN KEY (parent) REFERENCES orderlinegroup(orderelementid);


--
-- Name: fke203860c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke203860c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fke203860efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT fke203860efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fke3758148c29ad8eb; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fke3758148c29ad8eb FOREIGN KEY (cost_category_id) REFERENCES cost_category(id);


--
-- Name: fke3758148d5b6184d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT fke3758148d5b6184d FOREIGN KEY (type_of_work_hours_id) REFERENCES type_of_work_hours(id);


--
-- Name: fkeb02c3f148d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f148d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkeb02c3f1e7e1020b; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1e7e1020b FOREIGN KEY (type_work_hours_id) REFERENCES type_of_work_hours(id);


--
-- Name: fkeb02c3f1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fkeb02c3f1f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT fkeb02c3f1f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fkee374673ae0677b8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT fkee374673ae0677b8 FOREIGN KEY (assignment_function_id) REFERENCES stretchesfunction(assignment_function_id);


--
-- Name: fkef86282ee893ce10; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkef86282ee893ce10 FOREIGN KEY (calendar) REFERENCES resourcecalendar(base_calendar_id);


--
-- Name: fkf0e8572475ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e8572475ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fkf0e85724eae850b2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT fkf0e85724eae850b2 FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fkf2a5f7475c390c4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY description_values_in_line
    ADD CONSTRAINT fkf2a5f7475c390c4 FOREIGN KEY (description_value_id) REFERENCES work_report_line(id);


--
-- Name: fkf4bee4287fa34e3f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT fkf4bee4287fa34e3f FOREIGN KEY (parent) REFERENCES basecalendar(id);


--
-- Name: fkf4bee428a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT fkf4bee428a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fkf788b34975ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT fkf788b34975ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fkfc7b7be62f2d3aec; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT fkfc7b7be62f2d3aec FOREIGN KEY (advance_assignment_id) REFERENCES advanceassignment(id);


--
-- Name: fkfc7b7be6a1127ce5; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT fkfc7b7be6a1127ce5 FOREIGN KEY (direct_order_element_id) REFERENCES orderelement(id);


--
-- Name: fkfd423ff0c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkfd423ff0c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkfd423ff0f1a3177c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY workreports_labels
    ADD CONSTRAINT fkfd423ff0f1a3177c FOREIGN KEY (work_report_id) REFERENCES work_report(id);


--
-- Name: fkfd509405b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkfd509405b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fkfd509405efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment
    ADD CONSTRAINT fkfd509405efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

