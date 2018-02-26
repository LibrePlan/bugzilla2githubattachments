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
-- Name: advanceassignmenttemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advanceassignmenttemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    advance_type_id bigint,
    order_element_template_id bigint,
    reportglobaladvance boolean,
    maxvalue numeric(19,2)
);


ALTER TABLE public.advanceassignmenttemplate OWNER TO naval;

--
-- Name: advancemeasurement; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE advancemeasurement (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    advance_assignment_id bigint,
    communicationdate timestamp without time zone
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
    percentage boolean,
    qualityform boolean
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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
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
    configuration_id bigint,
    companycode character varying(255),
    generatecodeforcriterion boolean NOT NULL,
    generatecodeforlabel boolean NOT NULL,
    generatecodeforworkreport boolean NOT NULL,
    generatecodeforresources boolean NOT NULL,
    generatecodefortypesofworkhours boolean NOT NULL,
    generatecodeformaterialcategories boolean NOT NULL,
    generatecodeforunittypes boolean NOT NULL,
    expandcompanyplanningviewcharts boolean NOT NULL,
    expandorderplanningviewcharts boolean NOT NULL,
    expandresourceloadviewcharts boolean NOT NULL
);


ALTER TABLE public.configuration OWNER TO naval;

--
-- Name: consolidatedvalue; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE consolidatedvalue (
    id bigint NOT NULL,
    consolidated_value_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    date date,
    value numeric(19,2),
    taskenddate date,
    consolidation_id bigint,
    advance_measurement_id bigint
);


ALTER TABLE public.consolidatedvalue OWNER TO naval;

--
-- Name: consolidation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE consolidation (
    id bigint NOT NULL,
    consolidation_type character varying(255) NOT NULL,
    version bigint NOT NULL,
    dir_advance_assignment_id bigint,
    ind_advance_assignment_id bigint
);


ALTER TABLE public.consolidation OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
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
    order_element_template_id bigint,
    criterion_id bigint,
    parent bigint,
    valid boolean
);


ALTER TABLE public.criterionrequirement OWNER TO naval;

--
-- Name: criterionsatisfaction; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE criterionsatisfaction (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
    name character varying(255),
    description character varying(255),
    allowsimultaneouscriterionsperresource boolean,
    allowhierarchy boolean,
    enabled boolean,
    generatecode boolean NOT NULL,
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
    consolidated boolean,
    day date NOT NULL,
    resource_id bigint NOT NULL,
    specific_container_id bigint,
    generic_container_id bigint,
    derived_container_id bigint
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
    queue_dependency bigint,
    type integer
);


ALTER TABLE public.dependency OWNER TO naval;

--
-- Name: derivedallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE derivedallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    configurationunit bigint NOT NULL
);


ALTER TABLE public.derivedallocation OWNER TO naval;

--
-- Name: deriveddayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE deriveddayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    derived_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.deriveddayassignmentscontainer OWNER TO naval;

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
-- Name: external_company; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE external_company (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    nif character varying(255),
    client boolean,
    subcontractor boolean,
    interactswithapplications boolean,
    appuri character varying(255),
    ourcompanylogin character varying(255),
    ourcompanypassword character varying(255),
    companyuser bigint
);


ALTER TABLE public.external_company OWNER TO naval;

--
-- Name: generic_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE generic_resource_allocation (
    resource_allocation_id bigint NOT NULL
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: genericdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE genericdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.genericdayassignmentscontainer OWNER TO naval;

--
-- Name: heading_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE heading_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.heading_field OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: naval
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO naval;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: naval
--

SELECT pg_catalog.setval('hibernate_sequence', 1264, true);


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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
    resourcetype character varying(255),
    workinghours integer NOT NULL,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint,
    order_line_template bigint
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
    code character varying(255) NOT NULL,
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
    code character varying(255) NOT NULL,
    name character varying(255),
    generatecode boolean NOT NULL
);


ALTER TABLE public.label_type OWNER TO naval;

--
-- Name: limiting_resource_queue; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_id bigint
);


ALTER TABLE public.limiting_resource_queue OWNER TO naval;

--
-- Name: limiting_resource_queue_dependency; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue_dependency (
    id bigint NOT NULL,
    type integer,
    origin_queue_element_id bigint,
    destiny_queue_element_id bigint
);


ALTER TABLE public.limiting_resource_queue_dependency OWNER TO naval;

--
-- Name: limiting_resource_queue_element; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE limiting_resource_queue_element (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    limiting_resource_queue_id bigint,
    earlier_start_date_because_of_gantt timestamp without time zone,
    earliest_end_date_because_of_gantt timestamp without time zone,
    creation_timestamp bigint,
    start_date date,
    start_hour integer,
    end_date date,
    end_hour integer
);


ALTER TABLE public.limiting_resource_queue_element OWNER TO naval;

--
-- Name: line_field; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE line_field (
    heading_id bigint NOT NULL,
    fieldname character varying(255),
    length integer,
    positionnumber integer
);


ALTER TABLE public.line_field OWNER TO naval;

--
-- Name: machine; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE machine (
    machine_id bigint NOT NULL,
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
    unit_type bigint,
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
    material_id bigint,
    estimated_availability timestamp without time zone,
    status integer,
    order_element_id bigint
);


ALTER TABLE public.material_assigment OWNER TO naval;

--
-- Name: material_assigment_template; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_assigment_template (
    id bigint NOT NULL,
    version bigint NOT NULL,
    units double precision,
    unit_price numeric(19,2),
    material_id bigint,
    order_element_template_id bigint
);


ALTER TABLE public.material_assigment_template OWNER TO naval;

--
-- Name: material_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE material_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    generatecode boolean NOT NULL,
    parent_id bigint
);


ALTER TABLE public.material_category OWNER TO naval;

--
-- Name: naval_profile; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE naval_profile (
    id bigint NOT NULL,
    version bigint NOT NULL,
    profilename character varying(255) NOT NULL
);


ALTER TABLE public.naval_profile OWNER TO naval;

--
-- Name: naval_user; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE naval_user (
    id bigint NOT NULL,
    version bigint NOT NULL,
    loginname character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    disabled boolean,
    lastconnectedscenario bigint
);


ALTER TABLE public.naval_user OWNER TO naval;

--
-- Name: order_authorization; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_authorization (
    id bigint NOT NULL,
    order_authorization_subclass character varying(255) NOT NULL,
    version bigint NOT NULL,
    authorizationtype character varying(255) NOT NULL,
    order_id bigint,
    user_id bigint,
    profile_id bigint
);


ALTER TABLE public.order_authorization OWNER TO naval;

--
-- Name: order_element_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_label (
    order_element_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_label OWNER TO naval;

--
-- Name: order_element_template_label; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_template_label (
    order_element_template_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_label OWNER TO naval;

--
-- Name: order_element_template_quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_element_template_quality_form (
    order_element_template_id bigint NOT NULL,
    quality_form_id bigint NOT NULL
);


ALTER TABLE public.order_element_template_quality_form OWNER TO naval;

--
-- Name: order_table; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE order_table (
    orderelementid bigint NOT NULL,
    responsible character varying(255),
    dependenciesconstraintshavepriority boolean,
    codeautogenerated boolean,
    lastorderelementsequencecode integer,
    workbudget numeric(19,2),
    materialsbudget numeric(19,2),
    totalhours integer,
    customerreference character varying(255),
    externalcode character varying(255),
    state integer,
    customer bigint,
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
    description character varying(255),
    code character varying(255),
    initdate timestamp without time zone,
    deadline timestamp without time zone,
    lastadvancemeausurementforspreading numeric(19,2),
    dirtylastadvancemeasurementforspreading boolean,
    parent bigint,
    template bigint,
    externalcode character varying(255),
    positionincontainer integer
);


ALTER TABLE public.orderelement OWNER TO naval;

--
-- Name: orderelementtemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderelementtemplate (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    code character varying(255),
    startasdaysfrombeginning integer,
    deadlineasdaysfrombeginning integer,
    schedulingstatetype integer,
    parent bigint,
    positionincontainer integer
);


ALTER TABLE public.orderelementtemplate OWNER TO naval;

--
-- Name: orderline; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderline (
    orderelementid bigint NOT NULL,
    lasthoursgroupsequencecode integer
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
-- Name: orderlinegrouptemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinegrouptemplate (
    group_template_id bigint NOT NULL
);


ALTER TABLE public.orderlinegrouptemplate OWNER TO naval;

--
-- Name: orderlinetemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderlinetemplate (
    order_line_template_id bigint NOT NULL,
    lasthoursgroupsequencecode integer
);


ALTER TABLE public.orderlinetemplate OWNER TO naval;

--
-- Name: ordersequence; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE ordersequence (
    id bigint NOT NULL,
    version bigint NOT NULL,
    prefix character varying(255),
    lastvalue integer,
    numberofdigits integer,
    active boolean
);


ALTER TABLE public.ordersequence OWNER TO naval;

--
-- Name: ordertemplate; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE ordertemplate (
    order_template_id bigint NOT NULL,
    base_calendar_id bigint
);


ALTER TABLE public.ordertemplate OWNER TO naval;

--
-- Name: orderversion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE orderversion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    modificationbyownertimestamp timestamp without time zone,
    ownerscenario bigint
);


ALTER TABLE public.orderversion OWNER TO naval;

--
-- Name: profile_roles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE profile_roles (
    profileid bigint NOT NULL,
    elt character varying(255)
);


ALTER TABLE public.profile_roles OWNER TO naval;

--
-- Name: quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    qualityformtype integer,
    reportadvance boolean,
    advance_type_id bigint
);


ALTER TABLE public.quality_form OWNER TO naval;

--
-- Name: quality_form_items; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE quality_form_items (
    quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    idx integer NOT NULL
);


ALTER TABLE public.quality_form_items OWNER TO naval;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    generatecode boolean NOT NULL,
    limited_resource boolean NOT NULL,
    base_calendar_id bigint
);


ALTER TABLE public.resource OWNER TO naval;

--
-- Name: resourceallocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourceallocation (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resourcesperday numeric(19,2),
    intended_total_hours integer,
    originaltotalassignment integer,
    task bigint,
    assignment_function bigint
);


ALTER TABLE public.resourceallocation OWNER TO naval;

--
-- Name: resourcecalendar; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resourcecalendar (
    base_calendar_id bigint NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.resourcecalendar OWNER TO naval;

--
-- Name: resources_cost_category_assignment; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE resources_cost_category_assignment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    initdate date,
    enddate date,
    cost_category_id bigint,
    resource_id bigint
);


ALTER TABLE public.resources_cost_category_assignment OWNER TO naval;

--
-- Name: scenario; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scenario (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    description character varying(255),
    lastnotownedreassignationstimestamp timestamp without time zone,
    predecessor bigint
);


ALTER TABLE public.scenario OWNER TO naval;

--
-- Name: scenario_orders; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scenario_orders (
    order_id bigint NOT NULL,
    order_version_id bigint NOT NULL,
    scenario_id bigint NOT NULL
);


ALTER TABLE public.scenario_orders OWNER TO naval;

--
-- Name: scheduling_states_by_order_version; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE scheduling_states_by_order_version (
    order_element_id bigint NOT NULL,
    scheduling_state_for_version_id bigint NOT NULL,
    order_version_id bigint NOT NULL
);


ALTER TABLE public.scheduling_states_by_order_version OWNER TO naval;

--
-- Name: schedulingdataforversion; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE schedulingdataforversion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    schedulingstatetype integer,
    order_element_id bigint
);


ALTER TABLE public.schedulingdataforversion OWNER TO naval;

--
-- Name: specific_resource_allocation; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specific_resource_allocation (
    resource_allocation_id bigint NOT NULL,
    resource bigint
);


ALTER TABLE public.specific_resource_allocation OWNER TO naval;

--
-- Name: specificdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE specificdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint
);


ALTER TABLE public.specificdayassignmentscontainer OWNER TO naval;

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
    assignment_function_id bigint NOT NULL,
    type integer
);


ALTER TABLE public.stretchesfunction OWNER TO naval;

--
-- Name: subcontractedtaskdata; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE subcontractedtaskdata (
    id bigint NOT NULL,
    version bigint NOT NULL,
    externalcompany bigint,
    subcontratationdate timestamp without time zone,
    subcontractcommunicationdate timestamp without time zone,
    workdescription character varying(255),
    subcontractprice numeric(19,2),
    subcontractedcode character varying(255),
    nodewithoutchildrenexported boolean,
    labelsexported boolean,
    materialassignmentsexported boolean,
    hoursgroupsexported boolean,
    state integer
);


ALTER TABLE public.subcontractedtaskdata OWNER TO naval;

--
-- Name: task; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    calculatedvalue integer,
    startconstrainttype integer,
    constraintdate timestamp without time zone,
    subcontrated_task_data_id bigint,
    priority integer
);


ALTER TABLE public.task OWNER TO naval;

--
-- Name: task_quality_form; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_quality_form (
    id bigint NOT NULL,
    version bigint NOT NULL,
    quality_form_id bigint,
    order_element_id bigint,
    reportadvance boolean
);


ALTER TABLE public.task_quality_form OWNER TO naval;

--
-- Name: task_quality_form_items; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task_quality_form_items (
    task_quality_form_id bigint NOT NULL,
    name character varying(255),
    percentage numeric(19,2),
    "position" integer,
    passed boolean,
    date timestamp without time zone,
    idx integer NOT NULL
);


ALTER TABLE public.task_quality_form_items OWNER TO naval;

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
    startdate timestamp without time zone NOT NULL,
    enddate timestamp without time zone NOT NULL,
    deadline date,
    advance_percentage numeric(19,2),
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
    schedulingdata bigint
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
    enabled boolean,
    generatecode boolean NOT NULL
);


ALTER TABLE public.type_of_work_hours OWNER TO naval;

--
-- Name: unit_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE unit_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    measure character varying(255),
    generatecode boolean NOT NULL
);


ALTER TABLE public.unit_type OWNER TO naval;

--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE user_profiles (
    user_id bigint NOT NULL,
    profile_id bigint NOT NULL
);


ALTER TABLE public.user_profiles OWNER TO naval;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE user_roles (
    userid bigint NOT NULL,
    elt character varying(255)
);


ALTER TABLE public.user_roles OWNER TO naval;

--
-- Name: virtualworker; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE virtualworker (
    virtualworker_id bigint NOT NULL,
    observations character varying(255)
);


ALTER TABLE public.virtualworker OWNER TO naval;

--
-- Name: work_report; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE work_report (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    date timestamp without time zone,
    generatecode boolean NOT NULL,
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
    positionnumber integer,
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
    code character varying(255) NOT NULL,
    numhours integer,
    date timestamp without time zone,
    clockstart integer,
    clockfinish integer,
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
51207	10	t	809
7474	37	t	809
7475	37	t	809
13938	30	t	809
41114	7	f	811
40814	10	t	808
41022	8	f	809
20099	21	t	809
41115	7	f	811
40310	13	f	809
40309	13	t	808
54338	2	t	809
47167	12	t	809
54944	4	t	809
7477	22	f	809
7476	22	t	808
40308	17	t	809
41113	11	t	811
40812	14	f	809
47773	10	t	809
47790	2	f	808
47791	2	t	811
47789	3	t	811
5656	22	t	809
2020	46	t	809
2021	45	t	809
2023	25	t	808
2022	25	f	809
2024	45	t	809
2025	45	t	809
2026	25	t	808
2027	25	f	809
2030	44	t	809
6464	11	t	809
2029	25	f	809
2028	25	t	808
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
40403	17	2010-06-14	10.00	40308	\N
41210	11	2010-06-14	30.00	41113	\N
6089	19	2010-06-13	20.00	2020	\N
6090	18	2010-06-13	50.00	2021	\N
37078	3	2010-06-14	20.00	2024	\N
55869	0	2010-10-15	20.00	54944	\N
51634	6	2010-07-01	10.00	51207	\N
9921	32	2010-07-01	10.00	7474	\N
45667	13	2010-08-25	40.00	7475	\N
21869	16	2010-08-14	10.00	7475	\N
16923	22	2010-07-01	10.00	13938	\N
37593	14	2010-07-14	20.00	20099	\N
48583	3	2010-06-14	30.00	47789	2010-06-14 22:27:24.246
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
808	4	children	100.0000	f	0.0100	t	t	f
809	3	percentage	100.0000	f	0.0100	t	t	f
810	2	units	2147483647.0000	f	1.0000	t	f	f
811	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
29306	510
29307	510
29308	510
47369	510
55348	510
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, code, name) FROM stdin;
1	1	5d393609-e203-42eb-ac95-0a352e90aa98	Default
2	1	b239c933-2a54-493d-81ac-87e587db0bdb	\N
3	3	56404054-9105-4bcd-9775-174952902c25	\N
5	2	8f5ff702-2dbd-4209-928a-54c702dd7673	\N
6767	1	63e291c0-8368-4c0d-a827-5b48044e123b	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-06-13	\N	2	0
1314	3	2010-06-13	\N	3	0
1316	2	2010-06-13	\N	5	0
6969	1	2010-06-13	\N	6767	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
101	1	d0f2f4ae-8926-4ef0-a24c-7f7f1feee225	\N	\N	1	0
102	1	5dcd06a8-5bf7-4f0a-b22f-e96c1dd97124	1	\N	2	0
103	3	a6600c81-6dd8-4603-a436-ae3ab3a85b65	1	\N	3	0
105	2	92bf9dec-53b9-4d28-88fc-52241fd90430	1	\N	5	0
6868	1	21e441c0-f3a8-44a4-830b-3cb8df441f71	1	\N	6767	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable) FROM stdin;
606	6	HOLIDAY	HOLIDAY	red	t
607	5	SICK_LEAVE	SICK_LEAVE	red	t
608	4	LEAVE	LEAVE	red	t
609	3	STRIKE	STRIKE	red	t
610	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t
611	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts) FROM stdin;
202	3	1	1A	t	t	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, taskenddate, consolidation_id, advance_measurement_id) FROM stdin;
52225	NonCalculated	2	2010-07-01	10.00	2010-07-17	49698	51634
17077	NonCalculated	15	2010-07-01	10.00	2010-07-01	14039	16923
37774	NonCalculated	10	2010-07-14	20.00	2010-08-05	20200	37593
42126	NonCalculated	8	2010-08-14	10.00	2010-09-09	7576	21869
11016	NonCalculated	24	2010-07-01	10.00	2010-07-17	7575	9921
50500	NonCalculated	0	2010-08-25	40.00	2010-09-17	44951	45667
42132	NonCalculated	1	2010-08-14	10.00	2010-09-09	44951	21869
42134	NonCalculated	1	2010-07-14	20.00	2010-08-05	44953	37593
42131	NonCalculated	1	2010-07-01	10.00	2010-07-17	44950	9921
42133	NonCalculated	1	2010-07-01	10.00	2010-07-01	44952	16923
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
29193	NonCalculated	3	\N	\N
49698	NonCalculated	6	51207	\N
14039	NonCalculated	20	13938	\N
20200	NonCalculated	13	20099	\N
7576	NonCalculated	15	7475	\N
7575	NonCalculated	30	7474	\N
44951	NonCalculated	2	7475	\N
44953	NonCalculated	2	20099	\N
44950	NonCalculated	2	7474	\N
44952	NonCalculated	2	13938	\N
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, code, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
505	14	88922432-9273-4424-8a2b-8f12feb2a52c	medicalLeave	t	131072	\N
506	13	0950fe65-93d7-4be8-a409-be71a15b6a6d	paternityLeave	t	131072	\N
507	4	8a7d32d6-05b5-4564-86af-b9c83129f31c	hiredResourceWorkingRelationship	t	131076	\N
508	3	8b24931b-c856-44b4-8e9b-cee668109b8f	firedResourceWorkingRelationship	t	131076	\N
509	1	60a0aa3a-7d89-4da7-b969-cea4d3debdcb	Serras	t	131078	\N
510	1	8dba1e21-572d-4c51-835b-3d5a9af7011d	Tornos	t	131078	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2626	2	c0c879d6-1d67-4262-bccd-698d8a6cc04c	2010-06-13 00:00:00	\N	f	510	1216
2627	1	df020c7d-8a9b-407d-8cd0-e2dd81da7463	2010-06-13 12:42:41.932	\N	f	510	1220
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
131072	15	3d1358b7-eb8e-40bc-8c3b-f6cca7f89b68	LEAVE	Leave	f	f	t	f	1
131073	11	ce41a9f3-76fd-4b87-a042-77615da665a5	CATEGORY	Professional category	t	t	t	f	1
131074	9	2b1d47d1-5b13-4e5b-8ccf-874309111813	TRAINING	Training courses and labor training	t	t	t	f	1
131075	7	0a2fd812-e7d8-4774-9030-224bf0462ee5	JOB	Job	t	t	t	f	1
131076	5	2bb2ac50-d133-4a65-94b6-781aaea01195	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
131077	1	a25159a6-5ec3-43b8-a423-f7aa6723e237	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
131078	1	9c3603cb-62fb-469c-a2c9-8c856e923a9a	Tipo de maquina	Este criterio faise para clasificar os distintos tipos de maquinas	t	f	t	t	2
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
16784	GENERIC_DAY	17	0	t	2010-06-18	1216	\N	14248	\N
17933	GENERIC_DAY	15	0	f	2010-07-15	1216	\N	14248	\N
17951	GENERIC_DAY	15	0	f	2010-07-06	1216	\N	14248	\N
16778	GENERIC_DAY	17	3	t	2010-06-25	6667	\N	14248	\N
17984	GENERIC_DAY	15	3	f	2010-07-07	1220	\N	14248	\N
16810	GENERIC_DAY	17	2	t	2010-06-28	1220	\N	14248	\N
17964	GENERIC_DAY	15	3	f	2010-07-09	6667	\N	14248	\N
16803	GENERIC_DAY	17	0	t	2010-06-27	1214	\N	14248	\N
17993	GENERIC_DAY	15	0	f	2010-07-17	1220	\N	14248	\N
16785	GENERIC_DAY	17	0	t	2010-06-14	1216	\N	14248	\N
17946	GENERIC_DAY	15	0	f	2010-07-04	1216	\N	14248	\N
17976	GENERIC_DAY	15	2	f	2010-07-02	1220	\N	14248	\N
16817	GENERIC_DAY	17	3	t	2010-06-21	1214	\N	14248	\N
16795	GENERIC_DAY	17	0	t	2010-06-23	1216	\N	14248	\N
17947	GENERIC_DAY	15	3	f	2010-07-07	6667	\N	14248	\N
16779	GENERIC_DAY	17	0	t	2010-06-15	1216	\N	14248	\N
17941	GENERIC_DAY	15	0	f	2010-07-03	1214	\N	14248	\N
16809	GENERIC_DAY	17	3	t	2010-06-18	6667	\N	14248	\N
17960	GENERIC_DAY	15	0	f	2010-07-18	1220	\N	14248	\N
17957	GENERIC_DAY	15	3	f	2010-07-06	6667	\N	14248	\N
17997	GENERIC_DAY	15	3	f	2010-07-08	1220	\N	14248	\N
16816	GENERIC_DAY	17	0	t	2010-06-20	1220	\N	14248	\N
16790	GENERIC_DAY	17	0	t	2010-06-13	6667	\N	14248	\N
17935	GENERIC_DAY	15	3	f	2010-07-15	6667	\N	14248	\N
17955	GENERIC_DAY	15	0	f	2010-07-03	1216	\N	14248	\N
16780	GENERIC_DAY	17	0	t	2010-06-19	1220	\N	14248	\N
16788	GENERIC_DAY	17	3	t	2010-06-16	6667	\N	14248	\N
16797	GENERIC_DAY	17	0	t	2010-06-17	1216	\N	14248	\N
17973	GENERIC_DAY	15	0	f	2010-07-19	1214	\N	14248	\N
16808	GENERIC_DAY	17	1	t	2010-06-30	1220	\N	14248	\N
17975	GENERIC_DAY	15	2	f	2010-07-07	1214	\N	14248	\N
16818	GENERIC_DAY	17	0	t	2010-06-13	1220	\N	14248	\N
16775	GENERIC_DAY	17	3	t	2010-06-16	1214	\N	14248	\N
16798	GENERIC_DAY	17	0	t	2010-06-29	1216	\N	14248	\N
17942	GENERIC_DAY	15	0	f	2010-07-18	1216	\N	14248	\N
31830	GENERIC_DAY	7	4	f	2010-06-30	1216	\N	28082	\N
31826	GENERIC_DAY	7	8	f	2010-07-16	1216	\N	28082	\N
31829	GENERIC_DAY	7	0	f	2010-07-10	1216	\N	28082	\N
31823	GENERIC_DAY	7	8	f	2010-07-05	1216	\N	28082	\N
31833	GENERIC_DAY	7	8	f	2010-07-14	1216	\N	28082	\N
31835	GENERIC_DAY	7	0	f	2010-07-11	1216	\N	28082	\N
31827	GENERIC_DAY	7	8	f	2010-07-12	1216	\N	28082	\N
31831	GENERIC_DAY	7	8	f	2010-07-06	1216	\N	28082	\N
31822	GENERIC_DAY	7	0	f	2010-07-03	1216	\N	28082	\N
31821	GENERIC_DAY	7	8	f	2010-07-02	1216	\N	28082	\N
31836	GENERIC_DAY	7	0	f	2010-07-04	1216	\N	28082	\N
31825	GENERIC_DAY	7	8	f	2010-07-15	1216	\N	28082	\N
31828	GENERIC_DAY	7	8	f	2010-07-08	1216	\N	28082	\N
31820	GENERIC_DAY	7	8	f	2010-07-13	1216	\N	28082	\N
31834	GENERIC_DAY	7	8	f	2010-07-09	1216	\N	28082	\N
31824	GENERIC_DAY	7	8	f	2010-07-07	1216	\N	28082	\N
31832	GENERIC_DAY	7	8	f	2010-07-01	1216	\N	28082	\N
31817	GENERIC_DAY	7	8	f	2010-07-29	1220	\N	28081	\N
31599	GENERIC_DAY	7	8	f	2010-08-03	1220	\N	28081	\N
31598	GENERIC_DAY	7	0	f	2010-07-31	1220	\N	28081	\N
31607	GENERIC_DAY	7	8	f	2010-07-20	1220	\N	28081	\N
31818	GENERIC_DAY	7	8	f	2010-07-28	1220	\N	28081	\N
31601	GENERIC_DAY	7	8	f	2010-07-27	1220	\N	28081	\N
31610	GENERIC_DAY	7	0	f	2010-07-18	1220	\N	28081	\N
31816	GENERIC_DAY	7	0	f	2010-07-25	1220	\N	28081	\N
31612	GENERIC_DAY	7	8	f	2010-07-26	1220	\N	28081	\N
31602	GENERIC_DAY	7	8	f	2010-07-30	1220	\N	28081	\N
31611	GENERIC_DAY	7	0	f	2010-07-16	1220	\N	28081	\N
31815	GENERIC_DAY	7	8	f	2010-07-21	1220	\N	28081	\N
31605	GENERIC_DAY	7	0	f	2010-07-17	1220	\N	28081	\N
31603	GENERIC_DAY	7	8	f	2010-07-23	1220	\N	28081	\N
31609	GENERIC_DAY	7	0	f	2010-07-24	1220	\N	28081	\N
31608	GENERIC_DAY	7	8	f	2010-07-22	1220	\N	28081	\N
17983	GENERIC_DAY	15	0	f	2010-07-10	1216	\N	14248	\N
16773	GENERIC_DAY	17	0	t	2010-06-21	1216	\N	14248	\N
17939	GENERIC_DAY	15	0	f	2010-07-14	1216	\N	14248	\N
17953	GENERIC_DAY	15	2	f	2010-07-12	1214	\N	14248	\N
16792	GENERIC_DAY	17	2	t	2010-06-15	1220	\N	14248	\N
17952	GENERIC_DAY	15	3	f	2010-07-05	6667	\N	14248	\N
16789	GENERIC_DAY	17	3	t	2010-06-21	6667	\N	14248	\N
16806	GENERIC_DAY	17	2	t	2010-06-25	1220	\N	14248	\N
31847	GENERIC_DAY	7	8	f	2010-08-12	1216	\N	28083	\N
31843	GENERIC_DAY	7	8	f	2010-08-20	1216	\N	28083	\N
31848	GENERIC_DAY	7	8	f	2010-08-16	1216	\N	28083	\N
31851	GENERIC_DAY	7	8	f	2010-08-09	1216	\N	28083	\N
31844	GENERIC_DAY	7	8	f	2010-08-18	1216	\N	28083	\N
31850	GENERIC_DAY	7	8	f	2010-08-10	1216	\N	28083	\N
31852	GENERIC_DAY	7	0	f	2010-08-14	1216	\N	28083	\N
31849	GENERIC_DAY	7	8	f	2010-08-06	1216	\N	28083	\N
31853	GENERIC_DAY	7	8	f	2010-08-19	1216	\N	28083	\N
31846	GENERIC_DAY	7	0	f	2010-08-15	1216	\N	28083	\N
31845	GENERIC_DAY	7	8	f	2010-08-17	1216	\N	28083	\N
17986	GENERIC_DAY	15	0	f	2010-07-13	1216	\N	14248	\N
16764	GENERIC_DAY	17	3	t	2010-06-29	1214	\N	14248	\N
46395	GENERIC_DAY	1	3	t	2010-08-12	1214	\N	45253	\N
46403	GENERIC_DAY	1	1	t	2010-08-08	1216	\N	45253	\N
46466	GENERIC_DAY	1	1	t	2010-08-08	1214	\N	45253	\N
46469	GENERIC_DAY	1	1	t	2010-08-07	1214	\N	45253	\N
46434	GENERIC_DAY	1	1	t	2010-08-14	6667	\N	45253	\N
46480	GENERIC_DAY	1	4	t	2010-08-06	1214	\N	45253	\N
46441	GENERIC_DAY	1	1	t	2010-08-07	1220	\N	45253	\N
46358	GENERIC_DAY	1	4	t	2010-08-10	1214	\N	45253	\N
46438	GENERIC_DAY	1	4	t	2010-08-12	1220	\N	45253	\N
46508	GENERIC_DAY	1	4	t	2010-08-12	6667	\N	45253	\N
46478	GENERIC_DAY	1	4	t	2010-08-11	1214	\N	45253	\N
46423	GENERIC_DAY	1	4	t	2010-08-09	6667	\N	45253	\N
46494	GENERIC_DAY	1	4	t	2010-08-09	1220	\N	45253	\N
46382	GENERIC_DAY	1	1	t	2010-08-08	6667	\N	45253	\N
46364	GENERIC_DAY	1	3	t	2010-08-13	1214	\N	45253	\N
46437	GENERIC_DAY	1	4	t	2010-08-10	6667	\N	45253	\N
46412	GENERIC_DAY	1	1	t	2010-08-08	1220	\N	45253	\N
46444	GENERIC_DAY	1	1	t	2010-08-07	1216	\N	45253	\N
46399	GENERIC_DAY	1	4	t	2010-08-13	1220	\N	45253	\N
46425	GENERIC_DAY	1	4	t	2010-08-10	1220	\N	45253	\N
46485	GENERIC_DAY	1	1	t	2010-08-07	6667	\N	45253	\N
46394	GENERIC_DAY	1	4	t	2010-08-06	1220	\N	45253	\N
46362	GENERIC_DAY	1	4	t	2010-08-11	6667	\N	45253	\N
46357	GENERIC_DAY	1	1	t	2010-08-14	1214	\N	45253	\N
46464	GENERIC_DAY	1	4	t	2010-08-13	6667	\N	45253	\N
46376	GENERIC_DAY	1	4	t	2010-08-11	1220	\N	45253	\N
46428	GENERIC_DAY	1	4	t	2010-08-09	1214	\N	45253	\N
46490	GENERIC_DAY	1	1	t	2010-08-14	1220	\N	45253	\N
46356	GENERIC_DAY	1	4	t	2010-08-06	6667	\N	45253	\N
46722	GENERIC_DAY	1	0	f	2010-08-01	1214	\N	45255	\N
46766	GENERIC_DAY	1	0	f	2010-07-22	1220	\N	45255	\N
46774	GENERIC_DAY	1	0	f	2010-07-31	1220	\N	45255	\N
46776	GENERIC_DAY	1	2	f	2010-07-22	1216	\N	45255	\N
46781	GENERIC_DAY	1	0	f	2010-08-03	1220	\N	45255	\N
46725	GENERIC_DAY	1	0	f	2010-07-21	1220	\N	45255	\N
46729	GENERIC_DAY	1	0	f	2010-07-25	1220	\N	45255	\N
46736	GENERIC_DAY	1	2	f	2010-07-21	6667	\N	45255	\N
46778	GENERIC_DAY	1	2	f	2010-07-29	6667	\N	45255	\N
46757	GENERIC_DAY	1	2	f	2010-08-03	1214	\N	45255	\N
46739	GENERIC_DAY	1	2	f	2010-07-19	1214	\N	45255	\N
46743	GENERIC_DAY	1	0	f	2010-07-27	1220	\N	45255	\N
46724	GENERIC_DAY	1	0	f	2010-07-25	6667	\N	45255	\N
46728	GENERIC_DAY	1	2	f	2010-07-30	6667	\N	45255	\N
46752	GENERIC_DAY	1	2	f	2010-08-02	1214	\N	45255	\N
46735	GENERIC_DAY	1	0	f	2010-07-25	1214	\N	45255	\N
46782	GENERIC_DAY	1	0	f	2010-08-01	1220	\N	45255	\N
46762	GENERIC_DAY	1	0	f	2010-08-04	1216	\N	45255	\N
46761	GENERIC_DAY	1	0	f	2010-07-30	1220	\N	45255	\N
46759	GENERIC_DAY	1	2	f	2010-08-03	6667	\N	45255	\N
46779	GENERIC_DAY	1	2	f	2010-07-20	6667	\N	45255	\N
46741	GENERIC_DAY	1	0	f	2010-08-02	1220	\N	45255	\N
46734	GENERIC_DAY	1	0	f	2010-08-05	1214	\N	45255	\N
31600	GENERIC_DAY	7	4	f	2010-08-04	1220	\N	28081	\N
31819	GENERIC_DAY	7	8	f	2010-07-19	1220	\N	28081	\N
46786	GENERIC_DAY	1	2	f	2010-07-20	1214	\N	45255	\N
46768	GENERIC_DAY	1	2	f	2010-07-27	1216	\N	45255	\N
46767	GENERIC_DAY	1	3	f	2010-08-04	6667	\N	45255	\N
46745	GENERIC_DAY	1	0	f	2010-07-20	1220	\N	45255	\N
46783	GENERIC_DAY	1	2	f	2010-07-30	1214	\N	45255	\N
46731	GENERIC_DAY	1	2	f	2010-07-28	1216	\N	45255	\N
31604	GENERIC_DAY	7	0	f	2010-08-01	1220	\N	28081	\N
46742	GENERIC_DAY	1	2	f	2010-07-19	1216	\N	45255	\N
46771	GENERIC_DAY	1	0	f	2010-08-01	1216	\N	45255	\N
46755	GENERIC_DAY	1	2	f	2010-07-26	6667	\N	45255	\N
46738	GENERIC_DAY	1	1	f	2010-08-05	6667	\N	45255	\N
46723	GENERIC_DAY	1	0	f	2010-07-24	1216	\N	45255	\N
46733	GENERIC_DAY	1	2	f	2010-07-26	1216	\N	45255	\N
46751	GENERIC_DAY	1	0	f	2010-08-05	1216	\N	45255	\N
31606	GENERIC_DAY	7	8	f	2010-08-02	1220	\N	28081	\N
31842	GENERIC_DAY	7	8	f	2010-08-13	1216	\N	28083	\N
31840	GENERIC_DAY	7	4	f	2010-08-04	1216	\N	28083	\N
31841	GENERIC_DAY	7	8	f	2010-08-11	1216	\N	28083	\N
46753	GENERIC_DAY	1	2	f	2010-07-26	1214	\N	45255	\N
46765	GENERIC_DAY	1	2	f	2010-07-19	6667	\N	45255	\N
46744	GENERIC_DAY	1	2	f	2010-07-23	6667	\N	45255	\N
46770	GENERIC_DAY	1	2	f	2010-07-28	6667	\N	45255	\N
46773	GENERIC_DAY	1	0	f	2010-07-24	1220	\N	45255	\N
46769	GENERIC_DAY	1	0	f	2010-07-25	1216	\N	45255	\N
46758	GENERIC_DAY	1	0	f	2010-08-01	6667	\N	45255	\N
46746	GENERIC_DAY	1	0	f	2010-08-04	1220	\N	45255	\N
46754	GENERIC_DAY	1	2	f	2010-07-21	1214	\N	45255	\N
46750	GENERIC_DAY	1	2	f	2010-07-23	1216	\N	45255	\N
46763	GENERIC_DAY	1	2	f	2010-07-20	1216	\N	45255	\N
46726	GENERIC_DAY	1	2	f	2010-07-30	1216	\N	45255	\N
46748	GENERIC_DAY	1	0	f	2010-07-24	1214	\N	45255	\N
46788	GENERIC_DAY	1	2	f	2010-07-22	6667	\N	45255	\N
46727	GENERIC_DAY	1	0	f	2010-07-29	1220	\N	45255	\N
46760	GENERIC_DAY	1	0	f	2010-07-28	1220	\N	45255	\N
46777	GENERIC_DAY	1	2	f	2010-08-02	1216	\N	45255	\N
46749	GENERIC_DAY	1	0	f	2010-07-31	1214	\N	45255	\N
46772	GENERIC_DAY	1	2	f	2010-07-28	1214	\N	45255	\N
46775	GENERIC_DAY	1	2	f	2010-08-03	1216	\N	45255	\N
46780	GENERIC_DAY	1	2	f	2010-07-29	1214	\N	45255	\N
46740	GENERIC_DAY	1	0	f	2010-07-31	6667	\N	45255	\N
46764	GENERIC_DAY	1	2	f	2010-07-23	1214	\N	45255	\N
46784	GENERIC_DAY	1	0	f	2010-07-26	1220	\N	45255	\N
46785	GENERIC_DAY	1	0	f	2010-07-19	1220	\N	45255	\N
46756	GENERIC_DAY	1	2	f	2010-07-29	1216	\N	45255	\N
46732	GENERIC_DAY	1	2	f	2010-07-21	1216	\N	45255	\N
46737	GENERIC_DAY	1	3	f	2010-08-04	1214	\N	45255	\N
46730	GENERIC_DAY	1	1	f	2010-08-05	1220	\N	45255	\N
46747	GENERIC_DAY	1	0	f	2010-07-23	1220	\N	45255	\N
46787	GENERIC_DAY	1	0	f	2010-07-24	6667	\N	45255	\N
46304	GENERIC_DAY	1	0	f	2010-07-03	1214	\N	45252	\N
46307	GENERIC_DAY	1	0	t	2010-06-30	1216	\N	45252	\N
46287	GENERIC_DAY	1	3	t	2010-06-30	1220	\N	45252	\N
46227	GENERIC_DAY	1	3	t	2010-06-16	1220	\N	45252	\N
46173	GENERIC_DAY	1	4	f	2010-07-15	1214	\N	45252	\N
46196	GENERIC_DAY	1	0	f	2010-08-03	1220	\N	45252	\N
46266	GENERIC_DAY	1	0	t	2010-06-20	1214	\N	45252	\N
46183	GENERIC_DAY	1	1	f	2010-08-05	1214	\N	45252	\N
46260	GENERIC_DAY	1	0	f	2010-07-11	1216	\N	45252	\N
46187	GENERIC_DAY	1	4	f	2010-07-29	1216	\N	45252	\N
46312	GENERIC_DAY	1	4	f	2010-07-28	1216	\N	45252	\N
46168	GENERIC_DAY	1	5	f	2010-07-02	1220	\N	45252	\N
46154	GENERIC_DAY	1	2	t	2010-06-28	6667	\N	45252	\N
46250	GENERIC_DAY	1	0	f	2010-07-11	6667	\N	45252	\N
46345	GENERIC_DAY	1	3	f	2010-08-04	1220	\N	45252	\N
46319	GENERIC_DAY	1	4	f	2010-07-21	1214	\N	45252	\N
46301	GENERIC_DAY	1	3	f	2010-08-04	6667	\N	45252	\N
46298	GENERIC_DAY	1	4	f	2010-07-09	6667	\N	45252	\N
46309	GENERIC_DAY	1	0	f	2010-08-01	1220	\N	45252	\N
46249	GENERIC_DAY	1	4	f	2010-07-09	1214	\N	45252	\N
46193	GENERIC_DAY	1	2	t	2010-06-25	6667	\N	45252	\N
46257	GENERIC_DAY	1	4	f	2010-07-06	1214	\N	45252	\N
46222	GENERIC_DAY	1	4	f	2010-07-08	6667	\N	45252	\N
46339	GENERIC_DAY	1	0	f	2010-08-01	1214	\N	45252	\N
46269	GENERIC_DAY	1	0	t	2010-06-27	1216	\N	45252	\N
46300	GENERIC_DAY	1	0	t	2010-06-22	1216	\N	45252	\N
46338	GENERIC_DAY	1	0	f	2010-07-18	1216	\N	45252	\N
46188	GENERIC_DAY	1	0	t	2010-06-18	1216	\N	45252	\N
46182	GENERIC_DAY	1	3	t	2010-06-25	1214	\N	45252	\N
46333	GENERIC_DAY	1	4	f	2010-07-21	1216	\N	45252	\N
46289	GENERIC_DAY	1	0	f	2010-07-16	1216	\N	45252	\N
46232	GENERIC_DAY	1	4	f	2010-07-29	1214	\N	45252	\N
46256	GENERIC_DAY	1	4	f	2010-07-08	1220	\N	45252	\N
46263	GENERIC_DAY	1	3	t	2010-06-21	1214	\N	45252	\N
46175	GENERIC_DAY	1	2	t	2010-06-30	6667	\N	45252	\N
46342	GENERIC_DAY	1	4	f	2010-07-12	6667	\N	45252	\N
46150	GENERIC_DAY	1	0	f	2010-07-21	1220	\N	45252	\N
46311	GENERIC_DAY	1	4	f	2010-07-23	1216	\N	45252	\N
46195	GENERIC_DAY	1	0	f	2010-07-31	6667	\N	45252	\N
46156	GENERIC_DAY	1	4	f	2010-07-30	1216	\N	45252	\N
46151	GENERIC_DAY	1	4	f	2010-07-19	1216	\N	45252	\N
46199	GENERIC_DAY	1	0	f	2010-07-10	1214	\N	45252	\N
46267	GENERIC_DAY	1	4	f	2010-07-16	1214	\N	45252	\N
46207	GENERIC_DAY	1	0	t	2010-06-25	1216	\N	45252	\N
46288	GENERIC_DAY	1	4	f	2010-07-07	6667	\N	45252	\N
46229	GENERIC_DAY	1	0	f	2010-07-13	1216	\N	45252	\N
46242	GENERIC_DAY	1	0	f	2010-07-03	1220	\N	45252	\N
46174	GENERIC_DAY	1	0	f	2010-07-12	1216	\N	45252	\N
46181	GENERIC_DAY	1	0	f	2010-07-14	1216	\N	45252	\N
46281	GENERIC_DAY	1	0	t	2010-06-13	1216	\N	45252	\N
46147	GENERIC_DAY	1	0	f	2010-07-07	1216	\N	45252	\N
46251	GENERIC_DAY	1	4	f	2010-07-15	6667	\N	45252	\N
46252	GENERIC_DAY	1	4	f	2010-07-07	1214	\N	45252	\N
46274	GENERIC_DAY	1	0	f	2010-07-09	1216	\N	45252	\N
46296	GENERIC_DAY	1	0	t	2010-06-29	1216	\N	45252	\N
46272	GENERIC_DAY	1	0	f	2010-07-20	1220	\N	45252	\N
46329	GENERIC_DAY	1	4	f	2010-07-22	6667	\N	45252	\N
46165	GENERIC_DAY	1	0	t	2010-06-21	1216	\N	45252	\N
46349	GENERIC_DAY	1	0	f	2010-07-29	1220	\N	45252	\N
46191	GENERIC_DAY	1	4	f	2010-07-22	1216	\N	45252	\N
46172	GENERIC_DAY	1	0	f	2010-07-24	1216	\N	45252	\N
46315	GENERIC_DAY	1	3	t	2010-06-21	1220	\N	45252	\N
46153	GENERIC_DAY	1	4	f	2010-07-14	1220	\N	45252	\N
46262	GENERIC_DAY	1	2	t	2010-06-22	6667	\N	45252	\N
46323	GENERIC_DAY	1	4	f	2010-07-23	6667	\N	45252	\N
46255	GENERIC_DAY	1	4	f	2010-07-13	1214	\N	45252	\N
46305	GENERIC_DAY	1	0	t	2010-06-26	1216	\N	45252	\N
46221	GENERIC_DAY	1	4	f	2010-08-02	1216	\N	45252	\N
46219	GENERIC_DAY	1	4	f	2010-07-28	1214	\N	45252	\N
46170	GENERIC_DAY	1	4	f	2010-07-15	1220	\N	45252	\N
46326	GENERIC_DAY	1	4	f	2010-07-07	1220	\N	45252	\N
46166	GENERIC_DAY	1	3	t	2010-06-22	1220	\N	45252	\N
46201	GENERIC_DAY	1	0	f	2010-07-28	1220	\N	45252	\N
46162	GENERIC_DAY	1	4	f	2010-07-09	1220	\N	45252	\N
46197	GENERIC_DAY	1	4	f	2010-07-19	1214	\N	45252	\N
46240	GENERIC_DAY	1	0	f	2010-07-18	1214	\N	45252	\N
46194	GENERIC_DAY	1	0	f	2010-07-17	1220	\N	45252	\N
46290	GENERIC_DAY	1	4	f	2010-07-28	6667	\N	45252	\N
46149	GENERIC_DAY	1	0	t	2010-06-20	1220	\N	45252	\N
46203	GENERIC_DAY	1	0	t	2010-06-13	1214	\N	45252	\N
46226	GENERIC_DAY	1	0	f	2010-07-27	1220	\N	45252	\N
46234	GENERIC_DAY	1	2	t	2010-06-14	6667	\N	45252	\N
46205	GENERIC_DAY	1	4	f	2010-07-26	1214	\N	45252	\N
46228	GENERIC_DAY	1	0	f	2010-07-03	1216	\N	45252	\N
46246	GENERIC_DAY	1	0	t	2010-06-20	1216	\N	45252	\N
46158	GENERIC_DAY	1	4	f	2010-07-30	1214	\N	45252	\N
46217	GENERIC_DAY	1	0	t	2010-07-01	1216	\N	45252	\N
46276	GENERIC_DAY	1	0	t	2010-06-26	1220	\N	45252	\N
46230	GENERIC_DAY	1	0	t	2010-06-15	1216	\N	45252	\N
46213	GENERIC_DAY	1	4	f	2010-07-14	1214	\N	45252	\N
46347	GENERIC_DAY	1	4	f	2010-07-23	1214	\N	45252	\N
46297	GENERIC_DAY	1	2	t	2010-06-23	6667	\N	45252	\N
46327	GENERIC_DAY	1	2	t	2010-07-01	6667	\N	45252	\N
46283	GENERIC_DAY	1	4	f	2010-07-30	6667	\N	45252	\N
46144	GENERIC_DAY	1	4	f	2010-07-14	6667	\N	45252	\N
46253	GENERIC_DAY	1	4	f	2010-08-02	1214	\N	45252	\N
46310	GENERIC_DAY	1	4	f	2010-07-20	1214	\N	45252	\N
46202	GENERIC_DAY	1	3	t	2010-07-01	1220	\N	45252	\N
46341	GENERIC_DAY	1	0	f	2010-07-25	1214	\N	45252	\N
46212	GENERIC_DAY	1	0	f	2010-07-24	6667	\N	45252	\N
46184	GENERIC_DAY	1	0	f	2010-07-25	6667	\N	45252	\N
46282	GENERIC_DAY	1	3	t	2010-07-01	1214	\N	45252	\N
46241	GENERIC_DAY	1	4	f	2010-07-27	6667	\N	45252	\N
46161	GENERIC_DAY	1	0	t	2010-06-13	1220	\N	45252	\N
46245	GENERIC_DAY	1	2	f	2010-08-05	1220	\N	45252	\N
46206	GENERIC_DAY	1	2	t	2010-06-18	6667	\N	45252	\N
46155	GENERIC_DAY	1	3	t	2010-06-24	1220	\N	45252	\N
46224	GENERIC_DAY	1	4	f	2010-07-27	1216	\N	45252	\N
46295	GENERIC_DAY	1	0	f	2010-07-25	1216	\N	45252	\N
46324	GENERIC_DAY	1	0	t	2010-06-27	1214	\N	45252	\N
46235	GENERIC_DAY	1	0	f	2010-07-02	1216	\N	45252	\N
46285	GENERIC_DAY	1	3	t	2010-06-14	1214	\N	45252	\N
46336	GENERIC_DAY	1	3	t	2010-06-16	1214	\N	45252	\N
46223	GENERIC_DAY	1	0	f	2010-08-02	1220	\N	45252	\N
46190	GENERIC_DAY	1	0	f	2010-07-19	1220	\N	45252	\N
46220	GENERIC_DAY	1	3	t	2010-06-25	1220	\N	45252	\N
46152	GENERIC_DAY	1	2	t	2010-06-21	6667	\N	45252	\N
46314	GENERIC_DAY	1	2	t	2010-06-24	6667	\N	45252	\N
46302	GENERIC_DAY	1	0	f	2010-07-26	1220	\N	45252	\N
46159	GENERIC_DAY	1	0	f	2010-07-11	1214	\N	45252	\N
46148	GENERIC_DAY	1	0	f	2010-07-23	1220	\N	45252	\N
46264	GENERIC_DAY	1	0	t	2010-06-19	1220	\N	45252	\N
46157	GENERIC_DAY	1	3	t	2010-06-23	1214	\N	45252	\N
46179	GENERIC_DAY	1	0	t	2010-06-14	1216	\N	45252	\N
46337	GENERIC_DAY	1	0	f	2010-07-15	1216	\N	45252	\N
46243	GENERIC_DAY	1	4	f	2010-07-16	6667	\N	45252	\N
46317	GENERIC_DAY	1	0	f	2010-07-17	1216	\N	45252	\N
46163	GENERIC_DAY	1	0	t	2010-06-19	1216	\N	45252	\N
46259	GENERIC_DAY	1	0	f	2010-07-08	1216	\N	45252	\N
46284	GENERIC_DAY	1	3	t	2010-06-14	1220	\N	45252	\N
46261	GENERIC_DAY	1	4	f	2010-07-20	1216	\N	45252	\N
46325	GENERIC_DAY	1	0	f	2010-07-10	1216	\N	45252	\N
46238	GENERIC_DAY	1	0	f	2010-07-04	1220	\N	45252	\N
46143	GENERIC_DAY	1	3	f	2010-07-02	1214	\N	45252	\N
46236	GENERIC_DAY	1	0	f	2010-07-17	1214	\N	45252	\N
46291	GENERIC_DAY	1	1	f	2010-08-05	6667	\N	45252	\N
46335	GENERIC_DAY	1	0	t	2010-06-27	1220	\N	45252	\N
46308	GENERIC_DAY	1	0	f	2010-07-11	1220	\N	45252	\N
46321	GENERIC_DAY	1	4	f	2010-07-20	6667	\N	45252	\N
46167	GENERIC_DAY	1	0	t	2010-06-23	1216	\N	45252	\N
46279	GENERIC_DAY	1	0	f	2010-07-04	6667	\N	45252	\N
46211	GENERIC_DAY	1	4	f	2010-07-08	1214	\N	45252	\N
46328	GENERIC_DAY	1	4	f	2010-07-13	1220	\N	45252	\N
46233	GENERIC_DAY	1	0	f	2010-07-10	1220	\N	45252	\N
46306	GENERIC_DAY	1	0	f	2010-07-05	1216	\N	45252	\N
46237	GENERIC_DAY	1	4	f	2010-07-13	6667	\N	45252	\N
46331	GENERIC_DAY	1	0	f	2010-07-31	1220	\N	45252	\N
46286	GENERIC_DAY	1	4	f	2010-07-05	1220	\N	45252	\N
46278	GENERIC_DAY	1	2	t	2010-06-16	6667	\N	45252	\N
46318	GENERIC_DAY	1	3	t	2010-06-23	1220	\N	45252	\N
46350	GENERIC_DAY	1	3	t	2010-06-30	1214	\N	45252	\N
46178	GENERIC_DAY	1	3	t	2010-06-28	1220	\N	45252	\N
46218	GENERIC_DAY	1	4	f	2010-07-05	1214	\N	45252	\N
46340	GENERIC_DAY	1	0	f	2010-07-03	6667	\N	45252	\N
46322	GENERIC_DAY	1	0	t	2010-06-27	6667	\N	45252	\N
46352	GENERIC_DAY	1	4	f	2010-07-12	1214	\N	45252	\N
46171	GENERIC_DAY	1	4	f	2010-07-06	6667	\N	45252	\N
46254	GENERIC_DAY	1	3	t	2010-06-29	1214	\N	45252	\N
46231	GENERIC_DAY	1	4	f	2010-07-06	1220	\N	45252	\N
46244	GENERIC_DAY	1	0	f	2010-07-06	1216	\N	45252	\N
46343	GENERIC_DAY	1	3	t	2010-06-15	1214	\N	45252	\N
46294	GENERIC_DAY	1	4	f	2010-08-03	1216	\N	45252	\N
46346	GENERIC_DAY	1	2	t	2010-06-15	6667	\N	45252	\N
46214	GENERIC_DAY	1	0	f	2010-07-22	1220	\N	45252	\N
46247	GENERIC_DAY	1	0	t	2010-06-26	6667	\N	45252	\N
46270	GENERIC_DAY	1	0	t	2010-06-17	1216	\N	45252	\N
46186	GENERIC_DAY	1	4	f	2010-07-21	6667	\N	45252	\N
46208	GENERIC_DAY	1	0	f	2010-07-31	1216	\N	45252	\N
46176	GENERIC_DAY	1	0	t	2010-06-28	1216	\N	45252	\N
46225	GENERIC_DAY	1	4	f	2010-07-16	1220	\N	45252	\N
46164	GENERIC_DAY	1	3	t	2010-06-22	1214	\N	45252	\N
46332	GENERIC_DAY	1	0	f	2010-07-31	1214	\N	45252	\N
46280	GENERIC_DAY	1	4	f	2010-07-22	1214	\N	45252	\N
46277	GENERIC_DAY	1	0	t	2010-06-24	1216	\N	45252	\N
46145	GENERIC_DAY	1	0	t	2010-06-20	6667	\N	45252	\N
46177	GENERIC_DAY	1	4	f	2010-07-27	1214	\N	45252	\N
46334	GENERIC_DAY	1	0	t	2010-06-19	1214	\N	45252	\N
46313	GENERIC_DAY	1	0	t	2010-06-13	6667	\N	45252	\N
46192	GENERIC_DAY	1	0	f	2010-07-24	1220	\N	45252	\N
46268	GENERIC_DAY	1	3	t	2010-06-15	1220	\N	45252	\N
46216	GENERIC_DAY	1	0	t	2010-06-19	6667	\N	45252	\N
46215	GENERIC_DAY	1	0	f	2010-07-17	6667	\N	45252	\N
46210	GENERIC_DAY	1	4	f	2010-08-03	6667	\N	45252	\N
46204	GENERIC_DAY	1	4	f	2010-07-05	6667	\N	45252	\N
46303	GENERIC_DAY	1	3	f	2010-08-04	1214	\N	45252	\N
46198	GENERIC_DAY	1	4	f	2010-08-02	6667	\N	45252	\N
46185	GENERIC_DAY	1	0	f	2010-07-24	1214	\N	45252	\N
46239	GENERIC_DAY	1	0	f	2010-07-04	1216	\N	45252	\N
46265	GENERIC_DAY	1	0	f	2010-08-05	1216	\N	45252	\N
46348	GENERIC_DAY	1	4	f	2010-07-26	6667	\N	45252	\N
46351	GENERIC_DAY	1	3	t	2010-06-29	1220	\N	45252	\N
46330	GENERIC_DAY	1	2	t	2010-06-17	6667	\N	45252	\N
46292	GENERIC_DAY	1	0	f	2010-08-01	1216	\N	45252	\N
46169	GENERIC_DAY	1	4	f	2010-07-29	6667	\N	45252	\N
46189	GENERIC_DAY	1	0	t	2010-06-26	1214	\N	45252	\N
46316	GENERIC_DAY	1	4	f	2010-07-12	1220	\N	45252	\N
46320	GENERIC_DAY	1	4	f	2010-07-02	6667	\N	45252	\N
46299	GENERIC_DAY	1	0	f	2010-08-01	6667	\N	45252	\N
46146	GENERIC_DAY	1	3	t	2010-06-18	1220	\N	45252	\N
46344	GENERIC_DAY	1	3	t	2010-06-28	1214	\N	45252	\N
46209	GENERIC_DAY	1	3	t	2010-06-18	1214	\N	45252	\N
46180	GENERIC_DAY	1	4	f	2010-08-03	1214	\N	45252	\N
46275	GENERIC_DAY	1	0	f	2010-07-30	1220	\N	45252	\N
46293	GENERIC_DAY	1	0	t	2010-06-16	1216	\N	45252	\N
46273	GENERIC_DAY	1	3	t	2010-06-17	1220	\N	45252	\N
46258	GENERIC_DAY	1	0	f	2010-07-25	1220	\N	45252	\N
46160	GENERIC_DAY	1	0	f	2010-07-10	6667	\N	45252	\N
46248	GENERIC_DAY	1	0	f	2010-07-18	1220	\N	45252	\N
46200	GENERIC_DAY	1	3	f	2010-08-04	1216	\N	45252	\N
46271	GENERIC_DAY	1	4	f	2010-07-19	6667	\N	45252	\N
46518	GENERIC_DAY	1	2	f	2010-07-08	6667	\N	45254	\N
46525	GENERIC_DAY	1	3	f	2010-07-22	1216	\N	45254	\N
46584	GENERIC_DAY	1	0	t	2010-06-21	1216	\N	45254	\N
46523	GENERIC_DAY	1	0	f	2010-07-25	6667	\N	45254	\N
46541	GENERIC_DAY	1	3	f	2010-08-02	1216	\N	45254	\N
46531	GENERIC_DAY	1	3	f	2010-07-29	6667	\N	45254	\N
46655	GENERIC_DAY	1	3	t	2010-06-18	6667	\N	45254	\N
46666	GENERIC_DAY	1	3	f	2010-07-02	6667	\N	45254	\N
46594	GENERIC_DAY	1	3	f	2010-07-22	6667	\N	45254	\N
46668	GENERIC_DAY	1	2	f	2010-07-16	6667	\N	45254	\N
46534	GENERIC_DAY	1	0	t	2010-06-29	1216	\N	45254	\N
46557	GENERIC_DAY	1	2	f	2010-07-29	1214	\N	45254	\N
46680	GENERIC_DAY	1	0	t	2010-06-13	6667	\N	45254	\N
46709	GENERIC_DAY	1	0	f	2010-07-25	1214	\N	45254	\N
46620	GENERIC_DAY	1	2	t	2010-06-21	1220	\N	45254	\N
46542	GENERIC_DAY	1	0	f	2010-07-29	1220	\N	45254	\N
46650	GENERIC_DAY	1	2	t	2010-06-16	1220	\N	45254	\N
46687	GENERIC_DAY	1	3	t	2010-06-17	1214	\N	45254	\N
46627	GENERIC_DAY	1	0	f	2010-07-04	1214	\N	45254	\N
46686	GENERIC_DAY	1	2	f	2010-07-06	6667	\N	45254	\N
43505	GENERIC_DAY	8	0	f	2010-08-29	1216	\N	8285	\N
43518	GENERIC_DAY	8	4	f	2010-09-01	1216	\N	8285	\N
43519	GENERIC_DAY	8	4	f	2010-09-01	1214	\N	8285	\N
43515	GENERIC_DAY	8	0	f	2010-08-21	1220	\N	8285	\N
43514	GENERIC_DAY	8	0	f	2010-08-28	1216	\N	8285	\N
43496	GENERIC_DAY	8	4	f	2010-09-02	1214	\N	8285	\N
46142	GENERIC_DAY	1	3	t	2010-06-24	1214	\N	45252	\N
46138	GENERIC_DAY	1	2	t	2010-06-29	6667	\N	45252	\N
46139	GENERIC_DAY	1	0	f	2010-07-18	6667	\N	45252	\N
46141	GENERIC_DAY	1	3	t	2010-06-17	1214	\N	45252	\N
46137	GENERIC_DAY	1	0	f	2010-07-04	1214	\N	45252	\N
46140	GENERIC_DAY	1	4	f	2010-07-26	1216	\N	45252	\N
46692	GENERIC_DAY	1	3	f	2010-07-27	6667	\N	45254	\N
46524	GENERIC_DAY	1	0	f	2010-07-30	1220	\N	45254	\N
46678	GENERIC_DAY	1	0	f	2010-07-13	1216	\N	45254	\N
46618	GENERIC_DAY	1	0	f	2010-07-17	1220	\N	45254	\N
46641	GENERIC_DAY	1	0	f	2010-07-24	1214	\N	45254	\N
46649	GENERIC_DAY	1	3	f	2010-07-26	6667	\N	45254	\N
46631	GENERIC_DAY	1	3	t	2010-06-23	6667	\N	45254	\N
46636	GENERIC_DAY	1	2	f	2010-07-09	1214	\N	45254	\N
46674	GENERIC_DAY	1	0	f	2010-07-20	1220	\N	45254	\N
46583	GENERIC_DAY	1	0	f	2010-07-03	6667	\N	45254	\N
46718	GENERIC_DAY	1	2	f	2010-07-09	6667	\N	45254	\N
46642	GENERIC_DAY	1	3	f	2010-07-19	6667	\N	45254	\N
46607	GENERIC_DAY	1	2	f	2010-07-21	1214	\N	45254	\N
46605	GENERIC_DAY	1	0	f	2010-07-19	1220	\N	45254	\N
46597	GENERIC_DAY	1	2	f	2010-07-06	1214	\N	45254	\N
46693	GENERIC_DAY	1	0	f	2010-07-11	1220	\N	45254	\N
46551	GENERIC_DAY	1	0	t	2010-06-30	1216	\N	45254	\N
46665	GENERIC_DAY	1	3	f	2010-07-26	1216	\N	45254	\N
46519	GENERIC_DAY	1	3	t	2010-06-15	6667	\N	45254	\N
46530	GENERIC_DAY	1	0	f	2010-07-22	1220	\N	45254	\N
46532	GENERIC_DAY	1	0	f	2010-07-26	1220	\N	45254	\N
46529	GENERIC_DAY	1	2	t	2010-06-23	1220	\N	45254	\N
46548	GENERIC_DAY	1	4	f	2010-07-13	1220	\N	45254	\N
46586	GENERIC_DAY	1	3	t	2010-06-15	1214	\N	45254	\N
46580	GENERIC_DAY	1	2	t	2010-06-14	1220	\N	45254	\N
46710	GENERIC_DAY	1	0	f	2010-07-24	6667	\N	45254	\N
46589	GENERIC_DAY	1	3	f	2010-07-20	6667	\N	45254	\N
46609	GENERIC_DAY	1	0	f	2010-08-03	1220	\N	45254	\N
46588	GENERIC_DAY	1	3	t	2010-06-17	6667	\N	45254	\N
46614	GENERIC_DAY	1	0	f	2010-07-08	1216	\N	45254	\N
46561	GENERIC_DAY	1	0	t	2010-06-15	1216	\N	45254	\N
46612	GENERIC_DAY	1	0	t	2010-06-16	1216	\N	45254	\N
46587	GENERIC_DAY	1	0	t	2010-06-24	1216	\N	45254	\N
46697	GENERIC_DAY	1	0	t	2010-06-13	1220	\N	45254	\N
46616	GENERIC_DAY	1	3	t	2010-06-14	1214	\N	45254	\N
46539	GENERIC_DAY	1	0	f	2010-07-04	1220	\N	45254	\N
46536	GENERIC_DAY	1	0	t	2010-06-27	1216	\N	45254	\N
46632	GENERIC_DAY	1	3	f	2010-07-27	1216	\N	45254	\N
46708	GENERIC_DAY	1	2	f	2010-07-28	1214	\N	45254	\N
46601	GENERIC_DAY	1	0	t	2010-06-19	1214	\N	45254	\N
46793	GENERIC_DAY	1	0	f	2010-07-31	1216	\N	45255	\N
46792	GENERIC_DAY	1	2	f	2010-07-22	1214	\N	45255	\N
46791	GENERIC_DAY	1	2	f	2010-08-02	6667	\N	45255	\N
46789	GENERIC_DAY	1	2	f	2010-07-27	6667	\N	45255	\N
46790	GENERIC_DAY	1	2	f	2010-07-27	1214	\N	45255	\N
46556	GENERIC_DAY	1	0	t	2010-06-19	6667	\N	45254	\N
46715	GENERIC_DAY	1	2	t	2010-06-29	1220	\N	45254	\N
46648	GENERIC_DAY	1	2	f	2010-08-02	1214	\N	45254	\N
46637	GENERIC_DAY	1	2	f	2010-07-22	1214	\N	45254	\N
46719	GENERIC_DAY	1	0	t	2010-06-26	1216	\N	45254	\N
46544	GENERIC_DAY	1	0	f	2010-08-01	1220	\N	45254	\N
46683	GENERIC_DAY	1	0	f	2010-07-27	1220	\N	45254	\N
46568	GENERIC_DAY	1	3	f	2010-07-29	1216	\N	45254	\N
46711	GENERIC_DAY	1	0	f	2010-07-18	1214	\N	45254	\N
46540	GENERIC_DAY	1	0	f	2010-07-11	6667	\N	45254	\N
46582	GENERIC_DAY	1	0	f	2010-07-03	1214	\N	45254	\N
46516	GENERIC_DAY	1	2	t	2010-06-18	1220	\N	45254	\N
46521	GENERIC_DAY	1	2	f	2010-07-30	1214	\N	45254	\N
46515	GENERIC_DAY	1	2	f	2010-07-15	6667	\N	45254	\N
46660	GENERIC_DAY	1	0	t	2010-06-20	1216	\N	45254	\N
46676	GENERIC_DAY	1	0	f	2010-07-31	6667	\N	45254	\N
46598	GENERIC_DAY	1	3	t	2010-06-25	1214	\N	45254	\N
46514	GENERIC_DAY	1	2	f	2010-07-07	1214	\N	45254	\N
46560	GENERIC_DAY	1	3	f	2010-07-19	1216	\N	45254	\N
46695	GENERIC_DAY	1	2	f	2010-07-12	6667	\N	45254	\N
46707	GENERIC_DAY	1	2	f	2010-07-13	6667	\N	45254	\N
46717	GENERIC_DAY	1	3	t	2010-06-14	6667	\N	45254	\N
46681	GENERIC_DAY	1	0	f	2010-07-31	1214	\N	45254	\N
46625	GENERIC_DAY	1	0	t	2010-06-19	1216	\N	45254	\N
46567	GENERIC_DAY	1	1	t	2010-06-30	1220	\N	45254	\N
46571	GENERIC_DAY	1	0	f	2010-07-17	1214	\N	45254	\N
46563	GENERIC_DAY	1	3	t	2010-06-21	1214	\N	45254	\N
46538	GENERIC_DAY	1	1	f	2010-08-04	1220	\N	45254	\N
46700	GENERIC_DAY	1	2	f	2010-07-20	1216	\N	45254	\N
46608	GENERIC_DAY	1	0	t	2010-06-25	1216	\N	45254	\N
46527	GENERIC_DAY	1	0	f	2010-07-10	6667	\N	45254	\N
46520	GENERIC_DAY	1	0	f	2010-07-28	1220	\N	45254	\N
46562	GENERIC_DAY	1	3	f	2010-08-03	1216	\N	45254	\N
46714	GENERIC_DAY	1	0	f	2010-07-03	1220	\N	45254	\N
46669	GENERIC_DAY	1	2	f	2010-07-08	1214	\N	45254	\N
46657	GENERIC_DAY	1	2	f	2010-07-23	1214	\N	45254	\N
46677	GENERIC_DAY	1	3	t	2010-06-16	6667	\N	45254	\N
46651	GENERIC_DAY	1	3	f	2010-07-21	1216	\N	45254	\N
46721	GENERIC_DAY	1	0	f	2010-07-18	6667	\N	45254	\N
46688	GENERIC_DAY	1	0	f	2010-07-17	6667	\N	45254	\N
46573	GENERIC_DAY	1	0	f	2010-08-01	1214	\N	45254	\N
46610	GENERIC_DAY	1	3	f	2010-08-02	6667	\N	45254	\N
46572	GENERIC_DAY	1	3	t	2010-06-29	1214	\N	45254	\N
46550	GENERIC_DAY	1	0	f	2010-07-07	1216	\N	45254	\N
46706	GENERIC_DAY	1	3	t	2010-06-24	1214	\N	45254	\N
46634	GENERIC_DAY	1	0	t	2010-06-13	1214	\N	45254	\N
46526	GENERIC_DAY	1	0	t	2010-06-20	6667	\N	45254	\N
46574	GENERIC_DAY	1	2	f	2010-07-15	1214	\N	45254	\N
46635	GENERIC_DAY	1	3	t	2010-06-29	6667	\N	45254	\N
46599	GENERIC_DAY	1	2	f	2010-07-19	1214	\N	45254	\N
46639	GENERIC_DAY	1	0	f	2010-07-18	1220	\N	45254	\N
46558	GENERIC_DAY	1	0	f	2010-07-04	6667	\N	45254	\N
46675	GENERIC_DAY	1	0	t	2010-06-26	1220	\N	45254	\N
46645	GENERIC_DAY	1	4	f	2010-07-15	1220	\N	45254	\N
46554	GENERIC_DAY	1	2	f	2010-07-27	1214	\N	45254	\N
46663	GENERIC_DAY	1	0	f	2010-07-04	1216	\N	45254	\N
46590	GENERIC_DAY	1	2	t	2010-06-17	1220	\N	45254	\N
46703	GENERIC_DAY	1	0	f	2010-07-06	1216	\N	45254	\N
46640	GENERIC_DAY	1	3	t	2010-06-22	6667	\N	45254	\N
46570	GENERIC_DAY	1	2	f	2010-08-04	6667	\N	45254	\N
46604	GENERIC_DAY	1	3	f	2010-07-23	1216	\N	45254	\N
46613	GENERIC_DAY	1	0	f	2010-07-25	1220	\N	45254	\N
46617	GENERIC_DAY	1	0	f	2010-07-10	1216	\N	45254	\N
46585	GENERIC_DAY	1	0	f	2010-07-23	1220	\N	45254	\N
46704	GENERIC_DAY	1	2	f	2010-07-12	1214	\N	45254	\N
46555	GENERIC_DAY	1	4	f	2010-07-14	1220	\N	45254	\N
46535	GENERIC_DAY	1	0	f	2010-07-17	1216	\N	45254	\N
46671	GENERIC_DAY	1	0	f	2010-07-12	1216	\N	45254	\N
46672	GENERIC_DAY	1	0	f	2010-07-03	1216	\N	45254	\N
46549	GENERIC_DAY	1	3	f	2010-07-28	1216	\N	45254	\N
46682	GENERIC_DAY	1	4	f	2010-07-08	1220	\N	45254	\N
46537	GENERIC_DAY	1	0	f	2010-07-24	1220	\N	45254	\N
46603	GENERIC_DAY	1	0	f	2010-07-09	1216	\N	45254	\N
46696	GENERIC_DAY	1	0	t	2010-06-28	1216	\N	45254	\N
46615	GENERIC_DAY	1	0	f	2010-07-21	1220	\N	45254	\N
46701	GENERIC_DAY	1	3	t	2010-06-18	1214	\N	45254	\N
46670	GENERIC_DAY	1	0	t	2010-06-13	1216	\N	45254	\N
46553	GENERIC_DAY	1	2	f	2010-07-14	1214	\N	45254	\N
46658	GENERIC_DAY	1	0	f	2010-07-10	1214	\N	45254	\N
46685	GENERIC_DAY	1	2	t	2010-06-25	1220	\N	45254	\N
46602	GENERIC_DAY	1	3	f	2010-07-20	1214	\N	45254	\N
46629	GENERIC_DAY	1	3	t	2010-06-21	6667	\N	45254	\N
46644	GENERIC_DAY	1	2	f	2010-07-14	6667	\N	45254	\N
46647	GENERIC_DAY	1	3	t	2010-06-24	6667	\N	45254	\N
46630	GENERIC_DAY	1	0	t	2010-06-27	1214	\N	45254	\N
46545	GENERIC_DAY	1	4	f	2010-07-05	1220	\N	45254	\N
46712	GENERIC_DAY	1	0	t	2010-06-23	1216	\N	45254	\N
46543	GENERIC_DAY	1	0	t	2010-06-27	1220	\N	45254	\N
46606	GENERIC_DAY	1	3	f	2010-07-02	1220	\N	45254	\N
46659	GENERIC_DAY	1	2	f	2010-07-26	1214	\N	45254	\N
46600	GENERIC_DAY	1	0	f	2010-07-16	1216	\N	45254	\N
46673	GENERIC_DAY	1	0	f	2010-07-24	1216	\N	45254	\N
46595	GENERIC_DAY	1	0	t	2010-06-18	1216	\N	45254	\N
46576	GENERIC_DAY	1	0	f	2010-07-15	1216	\N	45254	\N
46569	GENERIC_DAY	1	0	t	2010-06-17	1216	\N	45254	\N
46565	GENERIC_DAY	1	2	f	2010-08-04	1214	\N	45254	\N
46547	GENERIC_DAY	1	2	f	2010-08-03	1214	\N	45254	\N
46653	GENERIC_DAY	1	0	t	2010-06-20	1220	\N	45254	\N
46698	GENERIC_DAY	1	0	t	2010-06-14	1216	\N	45254	\N
46533	GENERIC_DAY	1	0	f	2010-07-11	1216	\N	45254	\N
46684	GENERIC_DAY	1	0	f	2010-07-31	1220	\N	45254	\N
46638	GENERIC_DAY	1	0	f	2010-07-18	1216	\N	45254	\N
46577	GENERIC_DAY	1	1	f	2010-08-04	1216	\N	45254	\N
46691	GENERIC_DAY	1	0	f	2010-08-01	6667	\N	45254	\N
46656	GENERIC_DAY	1	3	f	2010-07-28	6667	\N	45254	\N
46592	GENERIC_DAY	1	2	t	2010-06-22	1220	\N	45254	\N
46578	GENERIC_DAY	1	2	f	2010-07-02	1214	\N	45254	\N
46643	GENERIC_DAY	1	4	f	2010-07-09	1220	\N	45254	\N
46517	GENERIC_DAY	1	4	f	2010-07-07	1220	\N	45254	\N
46662	GENERIC_DAY	1	0	t	2010-06-20	1214	\N	45254	\N
46611	GENERIC_DAY	1	4	f	2010-07-16	1220	\N	45254	\N
46579	GENERIC_DAY	1	1	t	2010-06-30	1214	\N	45254	\N
46689	GENERIC_DAY	1	2	f	2010-07-05	6667	\N	45254	\N
46664	GENERIC_DAY	1	2	f	2010-07-13	1214	\N	45254	\N
46690	GENERIC_DAY	1	0	f	2010-07-10	1220	\N	45254	\N
46716	GENERIC_DAY	1	2	t	2010-06-28	1220	\N	45254	\N
46575	GENERIC_DAY	1	3	f	2010-07-21	6667	\N	45254	\N
46679	GENERIC_DAY	1	0	f	2010-07-02	1216	\N	45254	\N
46713	GENERIC_DAY	1	3	t	2010-06-22	1214	\N	45254	\N
46633	GENERIC_DAY	1	3	f	2010-07-23	6667	\N	45254	\N
46667	GENERIC_DAY	1	0	t	2010-06-19	1220	\N	45254	\N
46654	GENERIC_DAY	1	0	t	2010-06-26	6667	\N	45254	\N
46720	GENERIC_DAY	1	3	t	2010-06-25	6667	\N	45254	\N
46593	GENERIC_DAY	1	3	f	2010-07-30	1216	\N	45254	\N
46552	GENERIC_DAY	1	0	f	2010-07-31	1216	\N	45254	\N
46559	GENERIC_DAY	1	3	f	2010-07-30	6667	\N	45254	\N
46622	GENERIC_DAY	1	2	f	2010-07-07	6667	\N	45254	\N
46619	GENERIC_DAY	1	3	t	2010-06-28	6667	\N	45254	\N
46522	GENERIC_DAY	1	2	f	2010-07-05	1214	\N	45254	\N
46621	GENERIC_DAY	1	0	f	2010-07-11	1214	\N	45254	\N
46699	GENERIC_DAY	1	0	t	2010-06-26	1214	\N	45254	\N
46661	GENERIC_DAY	1	3	f	2010-08-03	6667	\N	45254	\N
46646	GENERIC_DAY	1	0	f	2010-08-01	1216	\N	45254	\N
46596	GENERIC_DAY	1	0	t	2010-06-22	1216	\N	45254	\N
46652	GENERIC_DAY	1	0	f	2010-07-05	1216	\N	45254	\N
46702	GENERIC_DAY	1	0	f	2010-07-14	1216	\N	45254	\N
46624	GENERIC_DAY	1	0	f	2010-07-25	1216	\N	45254	\N
46626	GENERIC_DAY	1	4	f	2010-07-12	1220	\N	45254	\N
46581	GENERIC_DAY	1	3	t	2010-06-16	1214	\N	45254	\N
46623	GENERIC_DAY	1	2	t	2010-06-30	6667	\N	45254	\N
46628	GENERIC_DAY	1	0	f	2010-08-02	1220	\N	45254	\N
46528	GENERIC_DAY	1	2	t	2010-06-15	1220	\N	45254	\N
46546	GENERIC_DAY	1	2	f	2010-07-16	1214	\N	45254	\N
46694	GENERIC_DAY	1	3	t	2010-06-23	1214	\N	45254	\N
46591	GENERIC_DAY	1	2	t	2010-06-24	1220	\N	45254	\N
46564	GENERIC_DAY	1	0	t	2010-06-27	6667	\N	45254	\N
46705	GENERIC_DAY	1	4	f	2010-07-06	1220	\N	45254	\N
46566	GENERIC_DAY	1	3	t	2010-06-28	1214	\N	45254	\N
43460	GENERIC_DAY	8	3	f	2010-08-27	6667	\N	8285	\N
43475	GENERIC_DAY	8	3	f	2010-09-08	6667	\N	8285	\N
43448	GENERIC_DAY	8	3	t	2010-08-12	1214	\N	8285	\N
50422	GENERIC_DAY	0	3	f	2010-08-26	6667	\N	45253	\N
50423	GENERIC_DAY	0	1	f	2010-09-04	6667	\N	45253	\N
50424	GENERIC_DAY	0	3	f	2010-09-14	1220	\N	45253	\N
50425	GENERIC_DAY	0	4	f	2010-09-02	1214	\N	45253	\N
50426	GENERIC_DAY	0	1	f	2010-08-29	6667	\N	45253	\N
50427	GENERIC_DAY	0	3	f	2010-08-30	1216	\N	45253	\N
50428	GENERIC_DAY	0	3	f	2010-09-06	1220	\N	45253	\N
50429	GENERIC_DAY	0	2	t	2010-08-21	1214	\N	45253	\N
50430	GENERIC_DAY	0	2	f	2010-09-04	1214	\N	45253	\N
50431	GENERIC_DAY	0	4	f	2010-09-10	1214	\N	45253	\N
50432	GENERIC_DAY	0	1	f	2010-08-29	1216	\N	45253	\N
50433	GENERIC_DAY	0	3	t	2010-08-25	1216	\N	45253	\N
50434	GENERIC_DAY	0	3	f	2010-08-30	6667	\N	45253	\N
50435	GENERIC_DAY	0	3	f	2010-08-31	1220	\N	45253	\N
50436	GENERIC_DAY	0	1	t	2010-08-15	6667	\N	45253	\N
50437	GENERIC_DAY	0	1	t	2010-08-22	1216	\N	45253	\N
50438	GENERIC_DAY	0	3	f	2010-08-26	1216	\N	45253	\N
50439	GENERIC_DAY	0	2	f	2010-09-12	1214	\N	45253	\N
50440	GENERIC_DAY	0	3	f	2010-09-01	1220	\N	45253	\N
50441	GENERIC_DAY	0	4	f	2010-09-08	1214	\N	45253	\N
50442	GENERIC_DAY	0	3	f	2010-08-30	1220	\N	45253	\N
50443	GENERIC_DAY	0	3	f	2010-08-26	1220	\N	45253	\N
50444	GENERIC_DAY	0	3	f	2010-08-31	1216	\N	45253	\N
50445	GENERIC_DAY	0	4	f	2010-09-09	1214	\N	45253	\N
50446	GENERIC_DAY	0	1	f	2010-09-12	1220	\N	45253	\N
50447	GENERIC_DAY	0	3	f	2010-09-03	1220	\N	45253	\N
50448	GENERIC_DAY	0	3	f	2010-09-07	1220	\N	45253	\N
50449	GENERIC_DAY	0	3	f	2010-09-14	1216	\N	45253	\N
50450	GENERIC_DAY	0	4	t	2010-08-20	1220	\N	45253	\N
50451	GENERIC_DAY	0	1	t	2010-08-22	6667	\N	45253	\N
50452	GENERIC_DAY	0	3	f	2010-09-07	1216	\N	45253	\N
50453	GENERIC_DAY	0	5	t	2010-08-18	1214	\N	45253	\N
50454	GENERIC_DAY	0	5	t	2010-08-19	1214	\N	45253	\N
50455	GENERIC_DAY	0	3	t	2010-08-23	6667	\N	45253	\N
50456	GENERIC_DAY	0	4	t	2010-08-24	1214	\N	45253	\N
50457	GENERIC_DAY	0	3	f	2010-09-03	6667	\N	45253	\N
50458	GENERIC_DAY	0	3	f	2010-09-09	1220	\N	45253	\N
50459	GENERIC_DAY	0	3	f	2010-08-31	6667	\N	45253	\N
50460	GENERIC_DAY	0	1	f	2010-09-11	1216	\N	45253	\N
50461	GENERIC_DAY	0	3	f	2010-09-06	1216	\N	45253	\N
50462	GENERIC_DAY	0	1	f	2010-09-12	1216	\N	45253	\N
50463	GENERIC_DAY	0	3	f	2010-09-14	6667	\N	45253	\N
50464	GENERIC_DAY	0	1	f	2010-09-05	6667	\N	45253	\N
50465	GENERIC_DAY	0	3	f	2010-09-06	6667	\N	45253	\N
50466	GENERIC_DAY	0	3	f	2010-09-08	1220	\N	45253	\N
50467	GENERIC_DAY	0	3	f	2010-09-16	1220	\N	45253	\N
50468	GENERIC_DAY	0	4	t	2010-08-16	1220	\N	45253	\N
50469	GENERIC_DAY	0	1	t	2010-08-22	1220	\N	45253	\N
50470	GENERIC_DAY	0	3	t	2010-08-24	6667	\N	45253	\N
50471	GENERIC_DAY	0	3	f	2010-09-09	6667	\N	45253	\N
50472	GENERIC_DAY	0	3	f	2010-08-27	1216	\N	45253	\N
50473	GENERIC_DAY	0	3	f	2010-08-27	6667	\N	45253	\N
50474	GENERIC_DAY	0	3	f	2010-09-08	1216	\N	45253	\N
50475	GENERIC_DAY	0	4	t	2010-08-17	6667	\N	45253	\N
50476	GENERIC_DAY	0	1	f	2010-09-12	6667	\N	45253	\N
50477	GENERIC_DAY	0	4	f	2010-09-03	1214	\N	45253	\N
50478	GENERIC_DAY	0	3	f	2010-09-15	6667	\N	45253	\N
50479	GENERIC_DAY	0	4	t	2010-08-18	6667	\N	45253	\N
50480	GENERIC_DAY	0	3	f	2010-09-08	6667	\N	45253	\N
50481	GENERIC_DAY	0	2	t	2010-08-15	1214	\N	45253	\N
50482	GENERIC_DAY	0	4	t	2010-08-18	1220	\N	45253	\N
50483	GENERIC_DAY	0	3	t	2010-08-24	1216	\N	45253	\N
50484	GENERIC_DAY	0	3	f	2010-09-02	1216	\N	45253	\N
50485	GENERIC_DAY	0	4	f	2010-09-01	1214	\N	45253	\N
50486	GENERIC_DAY	0	3	f	2010-09-10	1220	\N	45253	\N
50487	GENERIC_DAY	0	1	t	2010-08-15	1220	\N	45253	\N
50488	GENERIC_DAY	0	3	f	2010-09-03	1216	\N	45253	\N
50489	GENERIC_DAY	0	3	f	2010-09-14	1214	\N	45253	\N
50490	GENERIC_DAY	0	3	f	2010-09-15	1216	\N	45253	\N
50491	GENERIC_DAY	0	3	f	2010-09-16	6667	\N	45253	\N
50492	GENERIC_DAY	0	3	f	2010-09-01	1216	\N	45253	\N
50493	GENERIC_DAY	0	1	f	2010-08-29	1220	\N	45253	\N
50494	GENERIC_DAY	0	3	t	2010-08-23	1220	\N	45253	\N
50495	GENERIC_DAY	0	1	f	2010-09-04	1216	\N	45253	\N
50496	GENERIC_DAY	0	3	f	2010-09-10	1216	\N	45253	\N
50497	GENERIC_DAY	0	4	f	2010-09-06	1214	\N	45253	\N
50498	GENERIC_DAY	0	3	f	2010-09-07	6667	\N	45253	\N
50499	GENERIC_DAY	0	4	f	2010-08-31	1214	\N	45253	\N
50601	GENERIC_DAY	0	3	f	2010-09-02	6667	\N	45253	\N
50602	GENERIC_DAY	0	3	f	2010-09-09	1216	\N	45253	\N
50603	GENERIC_DAY	0	1	f	2010-08-28	1220	\N	45253	\N
50604	GENERIC_DAY	0	1	t	2010-08-21	1216	\N	45253	\N
50605	GENERIC_DAY	0	1	t	2010-08-21	1220	\N	45253	\N
50606	GENERIC_DAY	0	3	f	2010-09-10	6667	\N	45253	\N
50607	GENERIC_DAY	0	3	t	2010-08-24	1220	\N	45253	\N
50608	GENERIC_DAY	0	4	t	2010-08-19	1220	\N	45253	\N
50609	GENERIC_DAY	0	4	t	2010-08-25	1214	\N	45253	\N
50610	GENERIC_DAY	0	2	f	2010-08-28	1214	\N	45253	\N
50611	GENERIC_DAY	0	3	f	2010-09-15	1214	\N	45253	\N
50612	GENERIC_DAY	0	4	t	2010-08-17	1220	\N	45253	\N
50613	GENERIC_DAY	0	1	f	2010-08-28	6667	\N	45253	\N
50614	GENERIC_DAY	0	1	f	2010-08-28	1216	\N	45253	\N
50615	GENERIC_DAY	0	3	f	2010-09-13	1220	\N	45253	\N
50616	GENERIC_DAY	0	4	f	2010-08-26	1214	\N	45253	\N
50617	GENERIC_DAY	0	4	t	2010-08-20	6667	\N	45253	\N
50618	GENERIC_DAY	0	3	f	2010-09-16	1216	\N	45253	\N
50619	GENERIC_DAY	0	1	f	2010-09-11	6667	\N	45253	\N
50620	GENERIC_DAY	0	5	t	2010-08-20	1214	\N	45253	\N
50621	GENERIC_DAY	0	1	f	2010-09-11	1220	\N	45253	\N
50622	GENERIC_DAY	0	5	t	2010-08-16	1214	\N	45253	\N
50623	GENERIC_DAY	0	1	f	2010-09-04	1220	\N	45253	\N
50624	GENERIC_DAY	0	5	t	2010-08-17	1214	\N	45253	\N
50625	GENERIC_DAY	0	3	f	2010-09-13	1216	\N	45253	\N
50626	GENERIC_DAY	0	4	f	2010-09-07	1214	\N	45253	\N
50627	GENERIC_DAY	0	4	f	2010-08-27	1214	\N	45253	\N
50628	GENERIC_DAY	0	2	f	2010-09-05	1214	\N	45253	\N
50629	GENERIC_DAY	0	2	f	2010-09-11	1214	\N	45253	\N
50630	GENERIC_DAY	0	3	f	2010-09-01	6667	\N	45253	\N
50631	GENERIC_DAY	0	1	f	2010-09-05	1216	\N	45253	\N
50632	GENERIC_DAY	0	1	t	2010-08-15	1216	\N	45253	\N
50633	GENERIC_DAY	0	3	f	2010-09-02	1220	\N	45253	\N
50634	GENERIC_DAY	0	4	f	2010-08-30	1214	\N	45253	\N
50635	GENERIC_DAY	0	1	f	2010-09-05	1220	\N	45253	\N
50636	GENERIC_DAY	0	3	f	2010-09-13	6667	\N	45253	\N
50637	GENERIC_DAY	0	3	t	2010-08-23	1216	\N	45253	\N
50638	GENERIC_DAY	0	4	t	2010-08-23	1214	\N	45253	\N
50639	GENERIC_DAY	0	4	t	2010-08-19	6667	\N	45253	\N
50640	GENERIC_DAY	0	2	f	2010-08-29	1214	\N	45253	\N
50641	GENERIC_DAY	0	3	f	2010-09-15	1220	\N	45253	\N
50642	GENERIC_DAY	0	2	t	2010-08-22	1214	\N	45253	\N
50643	GENERIC_DAY	0	3	f	2010-09-13	1214	\N	45253	\N
50644	GENERIC_DAY	0	3	t	2010-08-25	1220	\N	45253	\N
50645	GENERIC_DAY	0	3	f	2010-08-27	1220	\N	45253	\N
50646	GENERIC_DAY	0	3	f	2010-09-16	1214	\N	45253	\N
50647	GENERIC_DAY	0	3	t	2010-08-25	6667	\N	45253	\N
50648	GENERIC_DAY	0	1	t	2010-08-21	6667	\N	45253	\N
50649	GENERIC_DAY	0	4	t	2010-08-16	6667	\N	45253	\N
43465	GENERIC_DAY	8	4	t	2010-08-13	1220	\N	8285	\N
43473	GENERIC_DAY	8	3	f	2010-09-01	6667	\N	8285	\N
43480	GENERIC_DAY	8	1	t	2010-08-08	1220	\N	8285	\N
43485	GENERIC_DAY	8	4	f	2010-08-30	1220	\N	8285	\N
43489	GENERIC_DAY	8	5	f	2010-08-16	1214	\N	8285	\N
43478	GENERIC_DAY	8	4	f	2010-08-26	1220	\N	8285	\N
43417	GENERIC_DAY	8	0	f	2010-08-21	1216	\N	8285	\N
43492	GENERIC_DAY	8	4	t	2010-08-11	1214	\N	8285	\N
43402	GENERIC_DAY	8	4	t	2010-08-11	6667	\N	8285	\N
43429	GENERIC_DAY	8	4	f	2010-09-08	1214	\N	8285	\N
43488	GENERIC_DAY	8	5	f	2010-08-20	1214	\N	8285	\N
43500	GENERIC_DAY	8	1	t	2010-08-14	1220	\N	8285	\N
43491	GENERIC_DAY	8	0	f	2010-08-15	6667	\N	8285	\N
43412	GENERIC_DAY	8	3	f	2010-08-24	6667	\N	8285	\N
43483	GENERIC_DAY	8	5	f	2010-08-16	6667	\N	8285	\N
18002	GENERIC_DAY	15	3	f	2010-07-02	1214	\N	14248	\N
16762	GENERIC_DAY	17	0	t	2010-06-25	1216	\N	14248	\N
17971	GENERIC_DAY	15	2	f	2010-07-08	1214	\N	14248	\N
16770	GENERIC_DAY	17	0	t	2010-06-20	1216	\N	14248	\N
17987	GENERIC_DAY	15	0	f	2010-07-04	1220	\N	14248	\N
16821	GENERIC_DAY	17	2	t	2010-06-30	6667	\N	14248	\N
16754	GENERIC_DAY	17	3	t	2010-06-14	1214	\N	14248	\N
17994	GENERIC_DAY	15	0	f	2010-07-11	1220	\N	14248	\N
17989	GENERIC_DAY	15	0	f	2010-07-05	1216	\N	14248	\N
17937	GENERIC_DAY	15	0	f	2010-07-07	1216	\N	14248	\N
16815	GENERIC_DAY	17	3	t	2010-06-22	1214	\N	14248	\N
16772	GENERIC_DAY	17	3	t	2010-06-23	6667	\N	14248	\N
16758	GENERIC_DAY	17	0	t	2010-06-30	1216	\N	14248	\N
16765	GENERIC_DAY	17	2	t	2010-06-29	1220	\N	14248	\N
17981	GENERIC_DAY	15	0	f	2010-07-17	6667	\N	14248	\N
17943	GENERIC_DAY	15	0	f	2010-07-04	6667	\N	14248	\N
17956	GENERIC_DAY	15	0	f	2010-07-10	1220	\N	14248	\N
16819	GENERIC_DAY	17	2	t	2010-06-17	1220	\N	14248	\N
16783	GENERIC_DAY	17	3	t	2010-06-14	6667	\N	14248	\N
16812	GENERIC_DAY	17	0	t	2010-06-26	1220	\N	14248	\N
16805	GENERIC_DAY	17	2	t	2010-06-14	1220	\N	14248	\N
17965	GENERIC_DAY	15	0	f	2010-07-10	1214	\N	14248	\N
17961	GENERIC_DAY	15	0	f	2010-07-18	6667	\N	14248	\N
16787	GENERIC_DAY	17	0	t	2010-06-13	1216	\N	14248	\N
16813	GENERIC_DAY	17	0	t	2010-06-27	1220	\N	14248	\N
17944	GENERIC_DAY	15	3	f	2010-07-02	6667	\N	14248	\N
16777	GENERIC_DAY	17	3	t	2010-06-17	6667	\N	14248	\N
17968	GENERIC_DAY	15	0	f	2010-07-19	1220	\N	14248	\N
16801	GENERIC_DAY	17	0	t	2010-06-19	6667	\N	14248	\N
16811	GENERIC_DAY	17	3	t	2010-06-18	1214	\N	14248	\N
16771	GENERIC_DAY	17	0	t	2010-06-22	1216	\N	14248	\N
17962	GENERIC_DAY	15	3	f	2010-07-05	1220	\N	14248	\N
17963	GENERIC_DAY	15	2	f	2010-07-13	1214	\N	14248	\N
18004	GENERIC_DAY	15	0	f	2010-07-11	6667	\N	14248	\N
16774	GENERIC_DAY	17	3	t	2010-06-24	1214	\N	14248	\N
16755	GENERIC_DAY	17	0	t	2010-06-19	1216	\N	14248	\N
17967	GENERIC_DAY	15	0	f	2010-07-12	1216	\N	14248	\N
16800	GENERIC_DAY	17	2	t	2010-06-22	1220	\N	14248	\N
11905	GENERIC_DAY	24	2	f	2010-07-04	6667	\N	8283	\N
11891	GENERIC_DAY	24	0	t	2010-06-20	1216	\N	8283	\N
11951	GENERIC_DAY	24	3	t	2010-06-15	1214	\N	8283	\N
11922	GENERIC_DAY	24	5	f	2010-07-06	1214	\N	8283	\N
11898	GENERIC_DAY	24	0	t	2010-06-28	1216	\N	8283	\N
11899	GENERIC_DAY	24	0	t	2010-06-13	1214	\N	8283	\N
11966	GENERIC_DAY	24	5	f	2010-07-16	1214	\N	8283	\N
11910	GENERIC_DAY	24	0	t	2010-06-27	1216	\N	8283	\N
11988	GENERIC_DAY	24	0	t	2010-06-27	1220	\N	8283	\N
11969	GENERIC_DAY	24	4	f	2010-07-08	1220	\N	8283	\N
11914	GENERIC_DAY	24	1	f	2010-07-11	1220	\N	8283	\N
11955	GENERIC_DAY	24	5	f	2010-07-09	1214	\N	8283	\N
11983	GENERIC_DAY	24	0	t	2010-06-20	6667	\N	8283	\N
12002	GENERIC_DAY	24	4	f	2010-07-09	1220	\N	8283	\N
11998	GENERIC_DAY	24	3	t	2010-06-18	1220	\N	8283	\N
11954	GENERIC_DAY	24	5	f	2010-07-07	6667	\N	8283	\N
11961	GENERIC_DAY	24	4	f	2010-07-14	1220	\N	8283	\N
11977	GENERIC_DAY	24	5	f	2010-07-15	1214	\N	8283	\N
11887	GENERIC_DAY	24	3	t	2010-06-16	1214	\N	8283	\N
11937	GENERIC_DAY	24	3	t	2010-06-25	1220	\N	8283	\N
11949	GENERIC_DAY	24	3	t	2010-06-21	1214	\N	8283	\N
11994	GENERIC_DAY	24	0	t	2010-06-19	1214	\N	8283	\N
43393	GENERIC_DAY	8	4	f	2010-08-31	1214	\N	8285	\N
43451	GENERIC_DAY	8	3	t	2010-08-13	1214	\N	8285	\N
43477	GENERIC_DAY	8	4	t	2010-08-13	6667	\N	8285	\N
43441	GENERIC_DAY	8	0	f	2010-09-04	1216	\N	8285	\N
43422	GENERIC_DAY	8	4	f	2010-09-07	1216	\N	8285	\N
43484	GENERIC_DAY	8	4	t	2010-08-10	1220	\N	8285	\N
43395	GENERIC_DAY	8	0	f	2010-08-15	1214	\N	8285	\N
43456	GENERIC_DAY	8	0	f	2010-08-17	1216	\N	8285	\N
43452	GENERIC_DAY	8	0	f	2010-09-05	6667	\N	8285	\N
43490	GENERIC_DAY	8	5	f	2010-08-17	1214	\N	8285	\N
43495	GENERIC_DAY	8	4	f	2010-08-25	1220	\N	8285	\N
43407	GENERIC_DAY	8	5	f	2010-08-18	6667	\N	8285	\N
43437	GENERIC_DAY	8	0	f	2010-08-22	1220	\N	8285	\N
43418	GENERIC_DAY	8	4	t	2010-08-11	1220	\N	8285	\N
43499	GENERIC_DAY	8	0	f	2010-08-19	1216	\N	8285	\N
43509	GENERIC_DAY	8	1	t	2010-08-08	1216	\N	8285	\N
43408	GENERIC_DAY	8	4	t	2010-08-09	6667	\N	8285	\N
43497	GENERIC_DAY	8	4	f	2010-08-27	1214	\N	8285	\N
43469	GENERIC_DAY	8	4	f	2010-08-31	1220	\N	8285	\N
43455	GENERIC_DAY	8	1	t	2010-08-08	6667	\N	8285	\N
43487	GENERIC_DAY	8	4	f	2010-09-01	1220	\N	8285	\N
43517	GENERIC_DAY	8	0	f	2010-09-04	1214	\N	8285	\N
43442	GENERIC_DAY	8	4	f	2010-08-24	1220	\N	8285	\N
43463	GENERIC_DAY	8	4	f	2010-08-23	1220	\N	8285	\N
43396	GENERIC_DAY	8	4	f	2010-09-02	1220	\N	8285	\N
43502	GENERIC_DAY	8	4	t	2010-08-09	1214	\N	8285	\N
43457	GENERIC_DAY	8	3	f	2010-09-03	6667	\N	8285	\N
43401	GENERIC_DAY	8	3	f	2010-08-30	6667	\N	8285	\N
43472	GENERIC_DAY	8	5	f	2010-08-16	1220	\N	8285	\N
43507	GENERIC_DAY	8	4	f	2010-09-03	1216	\N	8285	\N
48771	SPECIFIC_DAY	0	8	f	2010-06-16	6667	48885	\N	\N
48772	SPECIFIC_DAY	0	8	f	2010-06-25	6667	48885	\N	\N
48773	SPECIFIC_DAY	0	8	f	2010-06-29	6667	48885	\N	\N
48774	SPECIFIC_DAY	0	8	f	2010-06-14	6667	48885	\N	\N
48775	SPECIFIC_DAY	0	8	f	2010-06-28	6667	48885	\N	\N
48776	SPECIFIC_DAY	0	0	f	2010-06-26	6667	48885	\N	\N
48777	SPECIFIC_DAY	0	8	f	2010-06-17	6667	48885	\N	\N
48778	SPECIFIC_DAY	0	0	f	2010-06-27	6667	48885	\N	\N
48779	SPECIFIC_DAY	0	4	f	2010-06-30	6667	48885	\N	\N
48780	SPECIFIC_DAY	0	0	f	2010-06-20	6667	48885	\N	\N
48781	SPECIFIC_DAY	0	8	f	2010-06-18	6667	48885	\N	\N
48782	SPECIFIC_DAY	0	8	f	2010-06-22	6667	48885	\N	\N
48985	SPECIFIC_DAY	0	8	f	2010-06-21	6667	48885	\N	\N
48986	SPECIFIC_DAY	0	8	f	2010-06-24	6667	48885	\N	\N
48987	SPECIFIC_DAY	0	0	f	2010-06-19	6667	48885	\N	\N
48988	SPECIFIC_DAY	0	8	f	2010-06-15	6667	48885	\N	\N
48989	SPECIFIC_DAY	0	8	f	2010-06-23	6667	48885	\N	\N
37746	GENERIC_DAY	9	3	f	2010-07-19	1214	\N	37273	\N
37761	GENERIC_DAY	9	2	f	2010-07-29	1216	\N	37273	\N
37757	GENERIC_DAY	9	2	f	2010-07-28	6667	\N	37273	\N
37744	GENERIC_DAY	9	2	f	2010-07-23	1216	\N	37273	\N
37764	GENERIC_DAY	9	2	f	2010-07-22	1216	\N	37273	\N
37750	GENERIC_DAY	9	2	f	2010-07-23	6667	\N	37273	\N
37752	GENERIC_DAY	9	2	f	2010-07-26	1214	\N	37273	\N
16757	GENERIC_DAY	17	0	t	2010-06-24	1216	\N	14248	\N
17966	GENERIC_DAY	15	3	f	2010-07-08	6667	\N	14248	\N
17950	GENERIC_DAY	15	2	f	2010-07-06	1214	\N	14248	\N
17958	GENERIC_DAY	15	2	f	2010-07-14	1214	\N	14248	\N
16807	GENERIC_DAY	17	3	t	2010-06-29	6667	\N	14248	\N
16752	GENERIC_DAY	17	0	t	2010-06-20	1214	\N	14248	\N
17938	GENERIC_DAY	15	2	f	2010-07-09	1214	\N	14248	\N
16761	GENERIC_DAY	17	2	t	2010-06-16	1220	\N	14248	\N
17991	GENERIC_DAY	15	0	f	2010-07-11	1216	\N	14248	\N
16767	GENERIC_DAY	17	0	t	2010-06-20	6667	\N	14248	\N
16776	GENERIC_DAY	17	0	t	2010-06-26	1214	\N	14248	\N
16820	GENERIC_DAY	17	3	t	2010-06-28	1214	\N	14248	\N
17949	GENERIC_DAY	15	0	f	2010-07-09	1216	\N	14248	\N
16769	GENERIC_DAY	17	3	t	2010-06-24	6667	\N	14248	\N
17936	GENERIC_DAY	15	3	f	2010-07-15	1220	\N	14248	\N
17992	GENERIC_DAY	15	3	f	2010-07-16	6667	\N	14248	\N
17945	GENERIC_DAY	15	0	f	2010-07-16	1216	\N	14248	\N
16760	GENERIC_DAY	17	3	t	2010-06-25	1214	\N	14248	\N
17996	GENERIC_DAY	15	3	f	2010-07-16	1220	\N	14248	\N
16786	GENERIC_DAY	17	0	t	2010-06-27	6667	\N	14248	\N
16751	GENERIC_DAY	17	2	t	2010-06-24	1220	\N	14248	\N
17970	GENERIC_DAY	15	2	f	2010-07-15	1214	\N	14248	\N
16750	GENERIC_DAY	17	3	t	2010-06-17	1214	\N	14248	\N
16759	GENERIC_DAY	17	0	t	2010-06-13	1214	\N	14248	\N
16781	GENERIC_DAY	17	0	t	2010-06-28	1216	\N	14248	\N
16814	GENERIC_DAY	17	3	t	2010-06-22	6667	\N	14248	\N
17959	GENERIC_DAY	15	0	f	2010-07-17	1216	\N	14248	\N
16782	GENERIC_DAY	17	2	t	2010-06-23	1220	\N	14248	\N
17948	GENERIC_DAY	15	0	f	2010-07-11	1214	\N	14248	\N
16804	GENERIC_DAY	17	0	t	2010-06-26	1216	\N	14248	\N
17995	GENERIC_DAY	15	3	f	2010-07-06	1220	\N	14248	\N
16791	GENERIC_DAY	17	2	t	2010-06-18	1220	\N	14248	\N
18001	GENERIC_DAY	15	0	f	2010-07-17	1214	\N	14248	\N
17990	GENERIC_DAY	15	0	f	2010-07-02	1216	\N	14248	\N
11911	GENERIC_DAY	24	2	f	2010-07-10	1216	\N	8283	\N
11944	GENERIC_DAY	24	2	t	2010-06-25	6667	\N	8283	\N
11917	GENERIC_DAY	24	2	f	2010-07-04	1216	\N	8283	\N
11971	GENERIC_DAY	24	2	t	2010-06-14	6667	\N	8283	\N
11979	GENERIC_DAY	24	0	t	2010-06-13	1216	\N	8283	\N
11895	GENERIC_DAY	24	3	t	2010-06-18	1214	\N	8283	\N
11980	GENERIC_DAY	24	5	f	2010-07-08	1214	\N	8283	\N
11918	GENERIC_DAY	24	0	t	2010-06-26	1220	\N	8283	\N
11892	GENERIC_DAY	24	0	t	2010-06-21	1216	\N	8283	\N
11896	GENERIC_DAY	24	1	f	2010-07-04	1220	\N	8283	\N
11932	GENERIC_DAY	24	5	f	2010-07-07	1214	\N	8283	\N
11902	GENERIC_DAY	24	0	t	2010-06-19	1220	\N	8283	\N
11947	GENERIC_DAY	24	0	t	2010-06-16	1216	\N	8283	\N
11929	GENERIC_DAY	24	3	t	2010-07-01	1220	\N	8283	\N
11913	GENERIC_DAY	24	5	f	2010-07-12	6667	\N	8283	\N
11982	GENERIC_DAY	24	3	t	2010-06-15	1220	\N	8283	\N
11930	GENERIC_DAY	24	0	t	2010-06-15	1216	\N	8283	\N
11973	GENERIC_DAY	24	3	t	2010-06-24	1220	\N	8283	\N
11925	GENERIC_DAY	24	3	t	2010-06-21	1220	\N	8283	\N
11959	GENERIC_DAY	24	2	t	2010-06-29	6667	\N	8283	\N
11923	GENERIC_DAY	24	0	t	2010-06-29	1216	\N	8283	\N
11958	GENERIC_DAY	24	5	f	2010-07-09	6667	\N	8283	\N
11984	GENERIC_DAY	24	5	f	2010-07-06	6667	\N	8283	\N
11999	GENERIC_DAY	24	3	t	2010-06-29	1214	\N	8283	\N
11909	GENERIC_DAY	24	0	t	2010-06-13	6667	\N	8283	\N
12005	GENERIC_DAY	24	3	t	2010-06-14	1220	\N	8283	\N
11940	GENERIC_DAY	24	1	f	2010-07-03	1220	\N	8283	\N
11989	GENERIC_DAY	24	0	t	2010-06-19	1216	\N	8283	\N
11890	GENERIC_DAY	24	3	t	2010-07-01	1214	\N	8283	\N
11935	GENERIC_DAY	24	3	t	2010-06-16	1220	\N	8283	\N
12000	GENERIC_DAY	24	2	t	2010-06-28	6667	\N	8283	\N
52807	SPECIFIC_DAY	2	8	f	2010-07-08	1214	51410	\N	\N
52803	SPECIFIC_DAY	2	0	t	2010-06-27	1214	51410	\N	\N
52795	SPECIFIC_DAY	2	4	t	2010-06-14	1214	51410	\N	\N
52796	SPECIFIC_DAY	2	0	t	2010-06-20	1214	51410	\N	\N
52810	SPECIFIC_DAY	2	8	f	2010-07-09	1214	51410	\N	\N
52811	SPECIFIC_DAY	2	4	t	2010-06-29	1214	51410	\N	\N
52820	SPECIFIC_DAY	2	9	f	2010-07-02	1214	51410	\N	\N
52794	SPECIFIC_DAY	2	4	t	2010-06-18	1214	51410	\N	\N
52809	SPECIFIC_DAY	2	4	t	2010-06-23	1214	51410	\N	\N
52801	SPECIFIC_DAY	2	4	t	2010-06-30	1214	51410	\N	\N
52824	SPECIFIC_DAY	2	0	t	2010-06-26	1214	51410	\N	\N
52802	SPECIFIC_DAY	2	8	f	2010-07-15	1214	51410	\N	\N
52791	SPECIFIC_DAY	2	8	f	2010-07-07	1214	51410	\N	\N
52812	SPECIFIC_DAY	2	4	t	2010-06-16	1214	51410	\N	\N
52805	SPECIFIC_DAY	2	0	t	2010-06-13	1214	51410	\N	\N
52817	SPECIFIC_DAY	2	4	t	2010-06-24	1214	51410	\N	\N
52815	SPECIFIC_DAY	2	0	f	2010-07-11	1214	51410	\N	\N
52792	SPECIFIC_DAY	2	0	t	2010-06-19	1214	51410	\N	\N
52819	SPECIFIC_DAY	2	4	t	2010-06-15	1214	51410	\N	\N
52806	SPECIFIC_DAY	2	4	t	2010-06-22	1214	51410	\N	\N
52800	SPECIFIC_DAY	2	4	t	2010-07-01	1214	51410	\N	\N
52797	SPECIFIC_DAY	2	4	t	2010-06-25	1214	51410	\N	\N
52813	SPECIFIC_DAY	2	4	t	2010-06-17	1214	51410	\N	\N
52816	SPECIFIC_DAY	2	8	f	2010-07-12	1214	51410	\N	\N
52823	SPECIFIC_DAY	2	8	f	2010-07-13	1214	51410	\N	\N
52814	SPECIFIC_DAY	2	0	f	2010-07-04	1214	51410	\N	\N
52822	SPECIFIC_DAY	2	8	f	2010-07-14	1214	51410	\N	\N
52799	SPECIFIC_DAY	2	0	f	2010-07-03	1214	51410	\N	\N
52798	SPECIFIC_DAY	2	0	f	2010-07-10	1214	51410	\N	\N
52804	SPECIFIC_DAY	2	8	f	2010-07-16	1214	51410	\N	\N
52818	SPECIFIC_DAY	2	4	t	2010-06-28	1214	51410	\N	\N
52793	SPECIFIC_DAY	2	9	f	2010-07-05	1214	51410	\N	\N
52808	SPECIFIC_DAY	2	8	f	2010-07-06	1214	51410	\N	\N
52821	SPECIFIC_DAY	2	4	t	2010-06-21	1214	51410	\N	\N
53966	SPECIFIC_DAY	3	8	f	2010-06-15	1220	29493	\N	\N
53959	SPECIFIC_DAY	3	8	f	2010-06-18	1220	29493	\N	\N
53951	SPECIFIC_DAY	3	8	f	2010-06-21	1220	29493	\N	\N
53952	SPECIFIC_DAY	3	0	f	2010-06-19	1220	29493	\N	\N
53955	SPECIFIC_DAY	3	8	f	2010-06-17	1220	29493	\N	\N
53964	SPECIFIC_DAY	3	8	f	2010-06-22	1220	29493	\N	\N
53968	SPECIFIC_DAY	3	0	f	2010-06-26	1220	29493	\N	\N
53956	SPECIFIC_DAY	3	0	f	2010-06-13	1220	29493	\N	\N
53963	SPECIFIC_DAY	3	8	f	2010-06-29	1220	29493	\N	\N
53957	SPECIFIC_DAY	3	8	f	2010-06-25	1220	29493	\N	\N
53953	SPECIFIC_DAY	3	8	f	2010-06-16	1220	29493	\N	\N
53954	SPECIFIC_DAY	3	8	f	2010-06-28	1220	29493	\N	\N
53962	SPECIFIC_DAY	3	0	f	2010-06-27	1220	29493	\N	\N
53965	SPECIFIC_DAY	3	8	f	2010-06-23	1220	29493	\N	\N
53958	SPECIFIC_DAY	3	8	f	2010-06-24	1220	29493	\N	\N
53961	SPECIFIC_DAY	3	8	f	2010-06-14	1220	29493	\N	\N
53967	SPECIFIC_DAY	3	4	f	2010-06-30	1220	29493	\N	\N
53960	SPECIFIC_DAY	3	0	f	2010-06-20	1220	29493	\N	\N
53969	GENERIC_DAY	1	8	f	2010-07-09	1216	\N	28084	\N
53970	GENERIC_DAY	1	8	f	2010-07-15	1216	\N	28084	\N
53971	GENERIC_DAY	1	8	f	2010-07-06	1216	\N	28084	\N
53972	GENERIC_DAY	1	8	f	2010-07-02	1216	\N	28084	\N
53973	GENERIC_DAY	1	8	f	2010-07-16	1216	\N	28084	\N
53974	GENERIC_DAY	1	8	f	2010-07-07	1216	\N	28084	\N
53975	GENERIC_DAY	1	8	f	2010-07-08	1216	\N	28084	\N
53976	GENERIC_DAY	1	0	f	2010-07-10	1216	\N	28084	\N
53977	GENERIC_DAY	1	8	f	2010-07-12	1216	\N	28084	\N
53978	GENERIC_DAY	1	8	f	2010-07-14	1216	\N	28084	\N
53979	GENERIC_DAY	1	8	f	2010-07-01	1216	\N	28084	\N
53980	GENERIC_DAY	1	4	f	2010-06-30	1216	\N	28084	\N
53981	GENERIC_DAY	1	8	f	2010-07-13	1216	\N	28084	\N
53982	GENERIC_DAY	1	0	f	2010-07-03	1216	\N	28084	\N
53983	GENERIC_DAY	1	8	f	2010-07-05	1216	\N	28084	\N
53984	GENERIC_DAY	1	0	f	2010-07-04	1216	\N	28084	\N
53985	GENERIC_DAY	1	0	f	2010-07-11	1216	\N	28084	\N
53986	GENERIC_DAY	1	8	f	2010-07-30	1220	\N	28085	\N
53987	GENERIC_DAY	1	8	f	2010-07-20	1220	\N	28085	\N
53988	GENERIC_DAY	1	0	f	2010-07-18	1220	\N	28085	\N
53989	GENERIC_DAY	1	8	f	2010-07-26	1220	\N	28085	\N
53990	GENERIC_DAY	1	8	f	2010-08-03	1220	\N	28085	\N
53991	GENERIC_DAY	1	0	f	2010-08-01	1220	\N	28085	\N
53992	GENERIC_DAY	1	0	f	2010-07-31	1220	\N	28085	\N
53993	GENERIC_DAY	1	0	f	2010-07-24	1220	\N	28085	\N
53994	GENERIC_DAY	1	0	f	2010-07-16	1220	\N	28085	\N
53995	GENERIC_DAY	1	8	f	2010-07-29	1220	\N	28085	\N
53996	GENERIC_DAY	1	0	f	2010-07-17	1220	\N	28085	\N
53997	GENERIC_DAY	1	8	f	2010-07-22	1220	\N	28085	\N
53998	GENERIC_DAY	1	8	f	2010-08-02	1220	\N	28085	\N
53999	GENERIC_DAY	1	8	f	2010-07-28	1220	\N	28085	\N
54000	GENERIC_DAY	1	0	f	2010-07-25	1220	\N	28085	\N
54001	GENERIC_DAY	1	8	f	2010-07-23	1220	\N	28085	\N
54002	GENERIC_DAY	1	8	f	2010-07-19	1220	\N	28085	\N
54003	GENERIC_DAY	1	4	f	2010-08-04	1220	\N	28085	\N
54004	GENERIC_DAY	1	8	f	2010-07-27	1220	\N	28085	\N
54005	GENERIC_DAY	1	8	f	2010-07-21	1220	\N	28085	\N
54006	GENERIC_DAY	1	8	f	2010-08-10	1216	\N	28086	\N
54007	GENERIC_DAY	1	8	f	2010-08-09	1216	\N	28086	\N
54008	GENERIC_DAY	1	8	f	2010-08-05	1216	\N	28086	\N
54009	GENERIC_DAY	1	8	f	2010-08-11	1216	\N	28086	\N
54010	GENERIC_DAY	1	8	f	2010-08-12	1216	\N	28086	\N
54011	GENERIC_DAY	1	0	f	2010-08-15	1216	\N	28086	\N
54012	GENERIC_DAY	1	8	f	2010-08-18	1216	\N	28086	\N
54013	GENERIC_DAY	1	8	f	2010-08-19	1216	\N	28086	\N
54014	GENERIC_DAY	1	8	f	2010-08-17	1216	\N	28086	\N
54015	GENERIC_DAY	1	0	f	2010-08-08	1216	\N	28086	\N
54016	GENERIC_DAY	1	0	f	2010-08-07	1216	\N	28086	\N
54017	GENERIC_DAY	1	0	f	2010-08-14	1216	\N	28086	\N
54018	GENERIC_DAY	1	8	f	2010-08-16	1216	\N	28086	\N
54019	GENERIC_DAY	1	8	f	2010-08-06	1216	\N	28086	\N
54020	GENERIC_DAY	1	4	f	2010-08-04	1216	\N	28086	\N
54021	GENERIC_DAY	1	8	f	2010-08-20	1216	\N	28086	\N
54022	GENERIC_DAY	1	8	f	2010-08-13	1216	\N	28086	\N
16768	GENERIC_DAY	17	0	t	2010-06-19	1214	\N	14248	\N
17934	GENERIC_DAY	15	3	f	2010-07-13	1220	\N	14248	\N
17979	GENERIC_DAY	15	0	f	2010-07-10	6667	\N	14248	\N
17982	GENERIC_DAY	15	1	f	2010-07-19	6667	\N	14248	\N
17985	GENERIC_DAY	15	2	f	2010-07-16	1214	\N	14248	\N
16802	GENERIC_DAY	17	3	t	2010-06-15	1214	\N	14248	\N
16794	GENERIC_DAY	17	1	t	2010-06-30	1214	\N	14248	\N
17998	GENERIC_DAY	15	0	f	2010-07-18	1214	\N	14248	\N
17972	GENERIC_DAY	15	0	f	2010-07-03	6667	\N	14248	\N
17980	GENERIC_DAY	15	3	f	2010-07-09	1220	\N	14248	\N
16793	GENERIC_DAY	17	3	t	2010-06-15	6667	\N	14248	\N
16756	GENERIC_DAY	17	3	t	2010-06-28	6667	\N	14248	\N
17978	GENERIC_DAY	15	3	f	2010-07-12	1220	\N	14248	\N
18000	GENERIC_DAY	15	3	f	2010-07-13	6667	\N	14248	\N
17988	GENERIC_DAY	15	0	f	2010-07-08	1216	\N	14248	\N
16753	GENERIC_DAY	17	0	t	2010-06-16	1216	\N	14248	\N
37771	GENERIC_DAY	9	2	f	2010-07-26	6667	\N	37273	\N
37768	GENERIC_DAY	9	2	f	2010-08-03	1214	\N	37273	\N
37881	GENERIC_DAY	9	2	f	2010-07-21	1216	\N	37273	\N
37770	GENERIC_DAY	9	2	f	2010-07-27	1214	\N	37273	\N
37875	GENERIC_DAY	9	2	f	2010-07-21	1214	\N	37273	\N
37751	GENERIC_DAY	9	2	f	2010-08-02	6667	\N	37273	\N
37772	GENERIC_DAY	9	2	f	2010-07-29	6667	\N	37273	\N
37762	GENERIC_DAY	9	2	f	2010-07-20	6667	\N	37273	\N
37749	GENERIC_DAY	9	2	f	2010-07-22	6667	\N	37273	\N
37763	GENERIC_DAY	9	3	f	2010-08-04	6667	\N	37273	\N
37773	GENERIC_DAY	9	2	f	2010-07-29	1214	\N	37273	\N
37755	GENERIC_DAY	9	2	f	2010-07-30	6667	\N	37273	\N
37753	GENERIC_DAY	9	2	f	2010-07-22	1214	\N	37273	\N
37760	GENERIC_DAY	9	2	f	2010-07-27	6667	\N	37273	\N
37876	GENERIC_DAY	9	2	f	2010-07-30	1214	\N	37273	\N
37766	GENERIC_DAY	9	2	f	2010-07-19	6667	\N	37273	\N
55703	SPECIFIC_DAY	1	8	f	2010-09-16	1220	53833	\N	\N
55704	SPECIFIC_DAY	1	8	f	2010-09-10	1220	53833	\N	\N
55705	SPECIFIC_DAY	1	8	f	2010-09-24	1220	53833	\N	\N
55706	SPECIFIC_DAY	1	8	f	2010-09-13	1220	53833	\N	\N
55707	SPECIFIC_DAY	1	8	f	2010-09-23	1220	53833	\N	\N
55708	SPECIFIC_DAY	1	4	f	2010-09-09	1220	53833	\N	\N
55709	SPECIFIC_DAY	1	8	f	2010-09-22	1220	53833	\N	\N
55710	SPECIFIC_DAY	1	8	f	2010-09-20	1220	53833	\N	\N
55711	SPECIFIC_DAY	1	8	f	2010-09-21	1220	53833	\N	\N
55712	SPECIFIC_DAY	1	8	f	2010-09-17	1220	53833	\N	\N
55713	SPECIFIC_DAY	1	8	f	2010-09-27	1220	53833	\N	\N
55714	SPECIFIC_DAY	1	8	f	2010-09-14	1220	53833	\N	\N
55715	SPECIFIC_DAY	1	8	f	2010-09-15	1220	53833	\N	\N
55807	GENERIC_DAY	1	8	f	2010-09-01	1216	\N	55550	\N
55808	GENERIC_DAY	1	8	f	2010-08-26	1216	\N	55550	\N
55809	GENERIC_DAY	1	4	f	2010-08-23	1216	\N	55550	\N
55810	GENERIC_DAY	1	8	f	2010-09-07	1216	\N	55550	\N
55811	GENERIC_DAY	1	8	f	2010-08-24	1216	\N	55550	\N
55812	GENERIC_DAY	1	8	f	2010-08-31	1216	\N	55550	\N
55813	GENERIC_DAY	1	8	f	2010-08-30	1216	\N	55550	\N
55814	GENERIC_DAY	1	8	f	2010-08-27	1216	\N	55550	\N
55815	GENERIC_DAY	1	8	f	2010-09-06	1216	\N	55550	\N
55816	GENERIC_DAY	1	8	f	2010-09-08	1216	\N	55550	\N
55817	GENERIC_DAY	1	8	f	2010-09-03	1216	\N	55550	\N
55818	GENERIC_DAY	1	8	f	2010-09-02	1216	\N	55550	\N
55819	GENERIC_DAY	1	8	f	2010-08-25	1216	\N	55550	\N
31838	GENERIC_DAY	7	8	f	2010-08-05	1216	\N	28083	\N
31837	GENERIC_DAY	7	0	f	2010-08-08	1216	\N	28083	\N
31839	GENERIC_DAY	7	0	f	2010-08-07	1216	\N	28083	\N
47688	GENERIC_DAY	7	8	f	2010-06-24	1216	\N	47571	\N
47681	GENERIC_DAY	7	0	f	2010-06-20	1216	\N	47571	\N
47680	GENERIC_DAY	7	8	f	2010-06-15	1216	\N	47571	\N
47682	GENERIC_DAY	7	8	f	2010-06-18	1216	\N	47571	\N
47685	GENERIC_DAY	7	0	f	2010-06-19	1216	\N	47571	\N
47676	GENERIC_DAY	7	8	f	2010-06-14	1216	\N	47571	\N
47687	GENERIC_DAY	7	0	f	2010-06-27	1216	\N	47571	\N
47677	GENERIC_DAY	7	8	f	2010-06-23	1216	\N	47571	\N
47689	GENERIC_DAY	7	0	f	2010-06-13	1216	\N	47571	\N
47684	GENERIC_DAY	7	4	f	2010-06-30	1216	\N	47571	\N
47675	GENERIC_DAY	7	8	f	2010-06-29	1216	\N	47571	\N
47679	GENERIC_DAY	7	8	f	2010-06-21	1216	\N	47571	\N
47683	GENERIC_DAY	7	8	f	2010-06-16	1216	\N	47571	\N
47673	GENERIC_DAY	7	8	f	2010-06-17	1216	\N	47571	\N
47686	GENERIC_DAY	7	8	f	2010-06-22	1216	\N	47571	\N
47672	GENERIC_DAY	7	8	f	2010-06-28	1216	\N	47571	\N
47674	GENERIC_DAY	7	0	f	2010-06-26	1216	\N	47571	\N
47678	GENERIC_DAY	7	8	f	2010-06-25	1216	\N	47571	\N
16763	GENERIC_DAY	17	0	t	2010-06-27	1216	\N	14248	\N
16766	GENERIC_DAY	17	2	t	2010-06-21	1220	\N	14248	\N
17969	GENERIC_DAY	15	3	f	2010-07-14	6667	\N	14248	\N
17954	GENERIC_DAY	15	0	f	2010-07-04	1214	\N	14248	\N
17974	GENERIC_DAY	15	0	f	2010-07-03	1220	\N	14248	\N
17977	GENERIC_DAY	15	2	f	2010-07-05	1214	\N	14248	\N
43464	GENERIC_DAY	8	4	t	2010-08-10	1214	\N	8285	\N
43471	GENERIC_DAY	8	5	f	2010-08-20	1220	\N	8285	\N
43468	GENERIC_DAY	8	4	t	2010-08-10	6667	\N	8285	\N
43516	GENERIC_DAY	8	0	f	2010-08-28	1214	\N	8285	\N
43461	GENERIC_DAY	8	3	f	2010-08-26	6667	\N	8285	\N
43476	GENERIC_DAY	8	4	f	2010-08-24	1214	\N	8285	\N
43394	GENERIC_DAY	8	4	f	2010-08-26	1216	\N	8285	\N
43420	GENERIC_DAY	8	3	f	2010-08-23	6667	\N	8285	\N
43510	GENERIC_DAY	8	4	t	2010-08-12	1220	\N	8285	\N
43447	GENERIC_DAY	8	0	f	2010-08-21	6667	\N	8285	\N
43434	GENERIC_DAY	8	4	f	2010-08-24	1216	\N	8285	\N
43406	GENERIC_DAY	8	5	f	2010-08-19	1214	\N	8285	\N
43427	GENERIC_DAY	8	4	t	2010-08-06	1214	\N	8285	\N
43397	GENERIC_DAY	8	4	f	2010-09-03	1220	\N	8285	\N
43409	GENERIC_DAY	8	4	f	2010-09-08	1216	\N	8285	\N
43425	GENERIC_DAY	8	0	f	2010-08-18	1216	\N	8285	\N
43435	GENERIC_DAY	8	0	f	2010-08-29	1220	\N	8285	\N
43503	GENERIC_DAY	8	5	f	2010-08-18	1220	\N	8285	\N
43410	GENERIC_DAY	8	0	f	2010-08-21	1214	\N	8285	\N
43454	GENERIC_DAY	8	4	f	2010-08-30	1214	\N	8285	\N
43439	GENERIC_DAY	8	5	f	2010-08-19	6667	\N	8285	\N
43481	GENERIC_DAY	8	4	f	2010-09-06	1216	\N	8285	\N
43453	GENERIC_DAY	8	0	f	2010-08-28	6667	\N	8285	\N
43459	GENERIC_DAY	8	4	t	2010-08-09	1220	\N	8285	\N
43423	GENERIC_DAY	8	0	f	2010-08-16	1216	\N	8285	\N
43414	GENERIC_DAY	8	4	f	2010-09-08	1220	\N	8285	\N
43428	GENERIC_DAY	8	5	f	2010-08-18	1214	\N	8285	\N
43443	GENERIC_DAY	8	5	f	2010-08-20	6667	\N	8285	\N
43431	GENERIC_DAY	8	5	f	2010-08-17	6667	\N	8285	\N
43440	GENERIC_DAY	8	1	t	2010-08-14	1214	\N	8285	\N
43405	GENERIC_DAY	8	4	f	2010-08-25	1214	\N	8285	\N
43501	GENERIC_DAY	8	0	f	2010-09-05	1216	\N	8285	\N
43493	GENERIC_DAY	8	4	f	2010-09-02	1216	\N	8285	\N
43433	GENERIC_DAY	8	0	f	2010-08-22	1216	\N	8285	\N
43392	GENERIC_DAY	8	3	f	2010-09-06	6667	\N	8285	\N
43470	GENERIC_DAY	8	0	f	2010-08-28	1220	\N	8285	\N
43413	GENERIC_DAY	8	4	f	2010-08-26	1214	\N	8285	\N
43449	GENERIC_DAY	8	4	f	2010-09-06	1214	\N	8285	\N
43398	GENERIC_DAY	8	4	t	2010-08-06	6667	\N	8285	\N
43403	GENERIC_DAY	8	1	t	2010-08-07	6667	\N	8285	\N
43400	GENERIC_DAY	8	4	t	2010-08-06	1220	\N	8285	\N
43430	GENERIC_DAY	8	1	t	2010-08-07	1214	\N	8285	\N
43411	GENERIC_DAY	8	3	f	2010-08-31	6667	\N	8285	\N
43432	GENERIC_DAY	8	0	f	2010-08-29	6667	\N	8285	\N
43450	GENERIC_DAY	8	5	f	2010-08-19	1220	\N	8285	\N
43462	GENERIC_DAY	8	1	t	2010-08-07	1216	\N	8285	\N
43498	GENERIC_DAY	8	4	f	2010-09-06	1220	\N	8285	\N
43419	GENERIC_DAY	8	4	f	2010-09-07	1220	\N	8285	\N
43415	GENERIC_DAY	8	4	f	2010-08-23	1214	\N	8285	\N
43511	GENERIC_DAY	8	0	f	2010-09-04	6667	\N	8285	\N
43466	GENERIC_DAY	8	4	t	2010-08-12	6667	\N	8285	\N
43467	GENERIC_DAY	8	3	f	2010-09-07	6667	\N	8285	\N
43436	GENERIC_DAY	8	4	f	2010-08-27	1216	\N	8285	\N
43506	GENERIC_DAY	8	4	f	2010-08-27	1220	\N	8285	\N
43458	GENERIC_DAY	8	0	f	2010-09-05	1220	\N	8285	\N
43486	GENERIC_DAY	8	1	t	2010-08-08	1214	\N	8285	\N
43426	GENERIC_DAY	8	4	f	2010-08-23	1216	\N	8285	\N
43446	GENERIC_DAY	8	0	f	2010-08-22	6667	\N	8285	\N
43512	GENERIC_DAY	8	4	f	2010-08-30	1216	\N	8285	\N
43474	GENERIC_DAY	8	4	f	2010-08-31	1216	\N	8285	\N
43424	GENERIC_DAY	8	0	f	2010-08-15	1220	\N	8285	\N
43508	GENERIC_DAY	8	4	f	2010-09-07	1214	\N	8285	\N
43391	GENERIC_DAY	8	0	f	2010-09-05	1214	\N	8285	\N
43482	GENERIC_DAY	8	3	f	2010-08-25	6667	\N	8285	\N
43416	GENERIC_DAY	8	0	f	2010-08-29	1214	\N	8285	\N
43438	GENERIC_DAY	8	4	f	2010-09-03	1214	\N	8285	\N
43504	GENERIC_DAY	8	1	t	2010-08-14	6667	\N	8285	\N
43421	GENERIC_DAY	8	0	f	2010-08-20	1216	\N	8285	\N
43513	GENERIC_DAY	8	4	f	2010-08-25	1216	\N	8285	\N
43404	GENERIC_DAY	8	5	f	2010-08-17	1220	\N	8285	\N
43445	GENERIC_DAY	8	0	f	2010-08-15	1216	\N	8285	\N
43444	GENERIC_DAY	8	0	f	2010-08-22	1214	\N	8285	\N
43494	GENERIC_DAY	8	3	f	2010-09-02	6667	\N	8285	\N
43399	GENERIC_DAY	8	0	f	2010-09-04	1220	\N	8285	\N
43479	GENERIC_DAY	8	1	t	2010-08-07	1220	\N	8285	\N
11957	GENERIC_DAY	24	5	f	2010-07-02	1214	\N	8283	\N
11943	GENERIC_DAY	24	3	t	2010-06-24	1214	\N	8283	\N
11912	GENERIC_DAY	24	3	t	2010-06-28	1220	\N	8283	\N
12009	GENERIC_DAY	24	0	t	2010-06-27	6667	\N	8283	\N
11927	GENERIC_DAY	24	5	f	2010-07-02	1220	\N	8283	\N
11888	GENERIC_DAY	24	0	t	2010-06-14	1216	\N	8283	\N
11942	GENERIC_DAY	24	4	f	2010-07-05	1220	\N	8283	\N
11938	GENERIC_DAY	24	4	f	2010-07-13	1220	\N	8283	\N
11928	GENERIC_DAY	24	3	t	2010-06-17	1214	\N	8283	\N
11920	GENERIC_DAY	24	3	t	2010-06-17	1220	\N	8283	\N
12007	GENERIC_DAY	24	0	t	2010-06-24	1216	\N	8283	\N
11907	GENERIC_DAY	24	2	f	2010-07-11	6667	\N	8283	\N
12006	GENERIC_DAY	24	0	t	2010-06-19	6667	\N	8283	\N
11975	GENERIC_DAY	24	3	t	2010-06-14	1214	\N	8283	\N
11893	GENERIC_DAY	24	0	t	2010-06-25	1216	\N	8283	\N
12003	GENERIC_DAY	24	5	f	2010-07-08	6667	\N	8283	\N
11986	GENERIC_DAY	24	3	t	2010-06-23	1214	\N	8283	\N
11926	GENERIC_DAY	24	0	t	2010-07-01	1216	\N	8283	\N
11974	GENERIC_DAY	24	1	f	2010-07-10	1220	\N	8283	\N
11946	GENERIC_DAY	24	2	t	2010-06-18	6667	\N	8283	\N
11901	GENERIC_DAY	24	3	t	2010-06-23	1220	\N	8283	\N
11970	GENERIC_DAY	24	4	f	2010-07-12	1220	\N	8283	\N
11978	GENERIC_DAY	24	2	t	2010-06-30	6667	\N	8283	\N
11981	GENERIC_DAY	24	0	t	2010-06-20	1220	\N	8283	\N
11921	GENERIC_DAY	24	3	t	2010-06-22	1220	\N	8283	\N
11993	GENERIC_DAY	24	5	f	2010-07-05	6667	\N	8283	\N
11964	GENERIC_DAY	24	1	f	2010-07-04	1214	\N	8283	\N
11992	GENERIC_DAY	24	2	t	2010-06-24	6667	\N	8283	\N
11934	GENERIC_DAY	24	3	t	2010-06-28	1214	\N	8283	\N
11889	GENERIC_DAY	24	2	t	2010-06-17	6667	\N	8283	\N
11908	GENERIC_DAY	24	0	t	2010-06-23	1216	\N	8283	\N
11945	GENERIC_DAY	24	2	f	2010-07-11	1216	\N	8283	\N
11919	GENERIC_DAY	24	4	f	2010-07-16	1220	\N	8283	\N
11953	GENERIC_DAY	24	2	t	2010-06-22	6667	\N	8283	\N
11965	GENERIC_DAY	24	5	f	2010-07-12	1214	\N	8283	\N
11995	GENERIC_DAY	24	2	f	2010-07-03	1216	\N	8283	\N
11956	GENERIC_DAY	24	2	t	2010-06-16	6667	\N	8283	\N
11990	GENERIC_DAY	24	5	f	2010-07-13	6667	\N	8283	\N
11996	GENERIC_DAY	24	5	f	2010-07-13	1214	\N	8283	\N
11948	GENERIC_DAY	24	2	t	2010-06-21	6667	\N	8283	\N
11924	GENERIC_DAY	24	0	t	2010-06-26	1214	\N	8283	\N
11968	GENERIC_DAY	24	4	f	2010-07-06	1220	\N	8283	\N
11941	GENERIC_DAY	24	0	t	2010-06-13	1220	\N	8283	\N
11950	GENERIC_DAY	24	2	f	2010-07-03	6667	\N	8283	\N
11904	GENERIC_DAY	24	1	f	2010-07-10	1214	\N	8283	\N
11916	GENERIC_DAY	24	0	t	2010-06-26	6667	\N	8283	\N
11931	GENERIC_DAY	24	0	t	2010-06-20	1214	\N	8283	\N
11897	GENERIC_DAY	24	5	f	2010-07-02	6667	\N	8283	\N
11963	GENERIC_DAY	24	0	t	2010-06-17	1216	\N	8283	\N
11903	GENERIC_DAY	24	3	t	2010-06-22	1214	\N	8283	\N
11894	GENERIC_DAY	24	2	t	2010-06-23	6667	\N	8283	\N
11936	GENERIC_DAY	24	5	f	2010-07-05	1214	\N	8283	\N
11900	GENERIC_DAY	24	0	t	2010-06-22	1216	\N	8283	\N
12008	GENERIC_DAY	24	1	f	2010-07-11	1214	\N	8283	\N
11967	GENERIC_DAY	24	5	f	2010-07-16	6667	\N	8283	\N
11960	GENERIC_DAY	24	0	t	2010-06-27	1214	\N	8283	\N
11972	GENERIC_DAY	24	2	t	2010-07-01	6667	\N	8283	\N
12010	GENERIC_DAY	24	2	t	2010-06-15	6667	\N	8283	\N
11906	GENERIC_DAY	24	4	f	2010-07-07	1220	\N	8283	\N
12001	GENERIC_DAY	24	4	f	2010-07-15	1220	\N	8283	\N
11886	GENERIC_DAY	24	3	t	2010-06-25	1214	\N	8283	\N
12004	GENERIC_DAY	24	2	f	2010-07-10	6667	\N	8283	\N
11987	GENERIC_DAY	24	0	t	2010-06-26	1216	\N	8283	\N
30579	SPECIFIC_DAY	8	0	f	2010-06-19	1220	29492	\N	\N
30581	SPECIFIC_DAY	8	8	f	2010-06-18	1220	29492	\N	\N
30575	SPECIFIC_DAY	8	8	f	2010-06-25	1220	29492	\N	\N
30571	SPECIFIC_DAY	8	8	f	2010-06-15	1220	29492	\N	\N
30569	SPECIFIC_DAY	8	8	f	2010-06-24	1220	29492	\N	\N
30580	SPECIFIC_DAY	8	8	f	2010-06-29	1220	29492	\N	\N
30572	SPECIFIC_DAY	8	0	f	2010-06-20	1220	29492	\N	\N
30574	SPECIFIC_DAY	8	0	f	2010-06-13	1220	29492	\N	\N
30577	SPECIFIC_DAY	8	8	f	2010-06-17	1220	29492	\N	\N
30570	SPECIFIC_DAY	8	8	f	2010-06-14	1220	29492	\N	\N
30576	SPECIFIC_DAY	8	0	f	2010-06-27	1220	29492	\N	\N
30573	SPECIFIC_DAY	8	8	f	2010-06-22	1220	29492	\N	\N
30578	SPECIFIC_DAY	8	8	f	2010-06-28	1220	29492	\N	\N
30586	SPECIFIC_DAY	8	4	f	2010-06-30	1220	29492	\N	\N
30582	SPECIFIC_DAY	8	0	f	2010-06-26	1220	29492	\N	\N
30584	SPECIFIC_DAY	8	8	f	2010-06-16	1220	29492	\N	\N
30583	SPECIFIC_DAY	8	8	f	2010-06-21	1220	29492	\N	\N
30585	SPECIFIC_DAY	8	8	f	2010-06-23	1220	29492	\N	\N
11915	GENERIC_DAY	24	0	t	2010-06-18	1216	\N	8283	\N
11962	GENERIC_DAY	24	3	t	2010-06-30	1220	\N	8283	\N
11991	GENERIC_DAY	24	5	f	2010-07-14	6667	\N	8283	\N
11985	GENERIC_DAY	24	5	f	2010-07-14	1214	\N	8283	\N
11939	GENERIC_DAY	24	5	f	2010-07-15	6667	\N	8283	\N
11976	GENERIC_DAY	24	2	f	2010-07-03	1214	\N	8283	\N
11997	GENERIC_DAY	24	3	t	2010-06-30	1214	\N	8283	\N
11933	GENERIC_DAY	24	0	t	2010-06-30	1216	\N	8283	\N
11952	GENERIC_DAY	24	3	t	2010-06-29	1220	\N	8283	\N
16799	GENERIC_DAY	17	0	t	2010-06-26	6667	\N	14248	\N
17940	GENERIC_DAY	15	1	f	2010-07-19	1216	\N	14248	\N
17999	GENERIC_DAY	15	3	f	2010-07-14	1220	\N	14248	\N
18003	GENERIC_DAY	15	3	f	2010-07-12	6667	\N	14248	\N
16796	GENERIC_DAY	17	3	t	2010-06-23	1214	\N	14248	\N
37880	GENERIC_DAY	9	2	f	2010-07-23	1214	\N	37273	\N
37879	GENERIC_DAY	9	2	f	2010-08-03	1216	\N	37273	\N
37878	GENERIC_DAY	9	3	f	2010-08-04	1214	\N	37273	\N
37765	GENERIC_DAY	9	2	f	2010-07-30	1216	\N	37273	\N
37759	GENERIC_DAY	9	2	f	2010-07-27	1216	\N	37273	\N
37877	GENERIC_DAY	9	2	f	2010-08-02	1214	\N	37273	\N
37754	GENERIC_DAY	9	2	f	2010-07-26	1216	\N	37273	\N
37745	GENERIC_DAY	9	2	f	2010-08-02	1216	\N	37273	\N
37767	GENERIC_DAY	9	2	f	2010-07-20	1214	\N	37273	\N
37758	GENERIC_DAY	9	3	f	2010-07-20	1216	\N	37273	\N
37756	GENERIC_DAY	9	2	f	2010-07-21	6667	\N	37273	\N
37769	GENERIC_DAY	9	2	f	2010-08-03	6667	\N	37273	\N
37748	GENERIC_DAY	9	2	f	2010-07-28	1216	\N	37273	\N
37743	GENERIC_DAY	9	2	f	2010-07-19	1216	\N	37273	\N
37747	GENERIC_DAY	9	2	f	2010-07-28	1214	\N	37273	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
15564807	2	47885	47886	\N	0
14614532	2	44950	44951	\N	0
15564803	11	47875	47876	\N	0
11599878	4	29189	29192	35856	0
11599877	4	29192	29193	35857	0
11599876	4	29193	29194	35855	0
17891328	1	55045	49698	\N	0
2818054	26	7575	7576	\N	0
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
\.


--
-- Data for Name: deriveddayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY deriveddayassignmentscontainer (id, version, derived_allocation_id, scenario) FROM stdin;
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
40308	39903	100.00
41113	39904	100.00
40812	39904	100.00
47773	40536	100.00
5656	5358	100.00
2020	1533	100.00
2021	1534	100.00
2024	1536	100.00
2025	1537	100.00
2030	1543	100.00
6464	6167	100.00
51207	51007	100.00
7474	7078	100.00
7475	7079	100.00
13938	13637	100.00
20099	19798	100.00
47167	46866	100.00
54944	54747	100.00
47789	48279	100.00
54338	54138	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1818	1	Igalia	1A	t	t	t	http://localhost:8080/navalplanner-webapp/	admin	admin	1112
1819	1	Navantia	2B	t	f	f	\N	\N	\N	1111
1820	1	Barreras	3C	t	f	f	\N	\N	\N	1111
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
8182
8184
14147
29306
29307
29308
37172
45151
45152
45153
45154
47369
55348
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
45253	2	45152	27977
45255	2	45154	27977
45252	2	45151	27977
45254	2	45153	27977
47571	7	47369	707
14248	21	14147	707
37273	9	37172	707
8285	26	8184	707
8283	27	8182	707
55550	6	55348	707
28082	7	29308	707
28084	18	29308	27977
28081	7	29306	707
28085	18	29306	27977
28083	7	29307	707
28086	18	29307	27977
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
554
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
1930	45	PREFIX-00002-00006-00001	WORKER	100	1.00	f	1537	\N
1936	44	PREFIX-00002-00007-00001	WORKER	300	1.00	f	1543	\N
6367	17	PREFIX-00002-00010-00001	WORKER	50	1.00	f	6168	\N
6368	17	PREFIX-00002-00011-00001	WORKER	50	1.00	f	6169	\N
54239	2	PREFIX-00005-00005-00001	WORKER	100	1.00	f	54138	\N
5560	22	PREFIX-00002-00008-00001	WORKER	200	1.00	f	5358	\N
7377	38	PREFIX-00003-00001-00001	WORKER	200	1.00	f	7078	\N
7378	38	PREFIX-00003-00002-00001	WORKER	300	1.00	f	7079	\N
13839	30	PREFIX-00003-00003-00001	WORKER	100	1.00	f	13637	\N
20000	21	PREFIX-00003-00004-00001	WORKER	100	1.00	f	19798	\N
47068	12	PREFIX-00003-00005-00001	WORKER	100	1.00	f	46866	\N
54848	4	PREFIX-00003-00007-00001	WORKER	100	1.00	f	54747	\N
51108	10	PREFIX-00003-00006-00001	WORKER	100	1.00	f	51007	\N
40203	18	PREFIX-00005-00002-00001	WORKER	100	1.00	f	39904	\N
40720	14	PREFIX-00005-00004-00001	WORKER	100	1.00	f	40536	\N
40202	18	PREFIX-00005-00001-00001	WORKER	100	1.00	f	39903	\N
48480	3	PREFIX-00006-00001-00001	WORKER	200	1.00	f	48279	\N
1927	46	PREFIX-00002-00003-00001	WORKER	100	1.00	f	1533	\N
1928	46	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1534	\N
1929	45	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1536	\N
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
101	8	0
101	8	1
101	8	2
101	8	3
101	8	4
101	0	5
101	0	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
7477	7077
7476	7077
47790	48278
47791	48278
41114	40535
40814	40535
41022	40535
41115	39902
40310	39902
40309	39902
2023	1532
2022	1532
2026	1535
2027	1535
2029	1531
2028	1531
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
1414	3	1216
1415	2	1220
\.


--
-- Data for Name: limiting_resource_queue_dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_dependency (id, type, origin_queue_element_id, destiny_queue_element_id) FROM stdin;
35856	1	29391	29409
35857	1	29409	29407
35855	1	29407	29408
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
47470	7	47369	1414	2010-06-13 23:21:38.831	2010-06-13 23:21:38.831	1276545598834	2010-06-13	0	2010-06-30	4
53732	4	53631	1415	2010-06-14 19:27:47.252	2010-06-14 19:27:47.252	1276595825483	2010-09-09	0	2010-09-27	8
55449	6	55348	1414	2010-06-27 07:27:47.252	2010-06-14 19:27:47.252	1276600726703	2010-08-23	0	2010-09-08	8
29391	8	29290	1415	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276523329275	2010-06-13	0	2010-06-30	4
29409	7	29308	1414	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276523762385	2010-06-30	4	2010-07-16	8
29407	7	29306	1415	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276523824280	2010-07-16	8	2010-08-04	4
29408	7	29307	1414	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276523855795	2010-08-04	4	2010-08-20	8
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
1216	Torno 1	Torno para realizar eixes de ata 10 metros.
1220	Torno 2	Torno para realizar eixes de ata 30 m
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

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
\.


--
-- Data for Name: material_assigment_template; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment_template (id, version, units, unit_price, material_id, order_element_template_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_category (id, version, code, name, generatecode, parent_id) FROM stdin;
909	1	37e9d60d-43c1-4a2e-93cc-01c505293d45	Imported materials without category	f	\N
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled, lastconnectedscenario) FROM stdin;
1111	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f	\N
1113	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f	\N
1114	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f	\N
1112	38	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	707
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
\.


--
-- Data for Name: order_element_template_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_quality_form (order_element_template_id, quality_form_id) FROM stdin;
\.


--
-- Data for Name: order_table; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_table (orderelementid, responsible, dependenciesconstraintshavepriority, codeautogenerated, lastorderelementsequencecode, workbudget, materialsbudget, totalhours, customerreference, externalcode, state, customer, base_calendar_id) FROM stdin;
48278	\N	\N	t	1	1000.00	0.00	200	ref-subcon-123	\N	5	1818	1
39902	Javier Moran	\N	t	5	0.00	0.00	400	ref1	\N	0	1819	1
1531	Javier Moran	\N	t	11	0.00	0.00	1000	ref 1	\N	0	1820	1
7077	Marina	\N	t	7	0.00	0.00	1000	ref 2	\N	0	1819	1
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer) FROM stdin;
1543	45	tarefa limitantes 5	\N	PREFIX-00002-00007	\N	\N	0.00	f	1531	\N	\N	2
6167	18	container 3	\N	PREFIX-00002-00009	\N	2010-07-22 00:00:00	0.00	f	1531	\N	\N	4
48278	4	prueba subcontratacion	\N	PREFIX-00006	2010-06-14 19:27:47.252	2010-06-27 07:27:47.252	0.30	f	\N	\N	\N	\N
48279	4	elem 2.0	\N	PREFIX-00006-00001	2010-06-14 19:27:47.252	2010-06-27 07:27:47.252	0.30	f	48278	\N	PREFIX-00005-00002	0
6168	18	subtask 2	\N	PREFIX-00002-00010	\N	\N	0.00	f	6167	\N	\N	0
6169	18	subtask 1	\N	PREFIX-00002-00011	\N	\N	0.00	f	6167	\N	\N	1
51007	10	elem 6	\N	PREFIX-00003-00006	\N	\N	0.10	f	7077	\N	\N	5
7077	45	Pedido proba de consolidacions	\N	PREFIX-00003	2010-06-13 23:21:38.831	\N	0.20	f	\N	\N	\N	\N
7078	39	elem 1	\N	PREFIX-00003-00001	\N	\N	0.10	f	7077	\N	\N	0
7079	39	elem 2	\N	PREFIX-00003-00002	\N	\N	0.40	f	7077	\N	\N	1
13637	30	elem 3	\N	PREFIX-00003-00003	\N	\N	0.10	f	7077	\N	\N	2
39903	19	elem 1	\N	PREFIX-00005-00001	\N	\N	0.10	f	39902	\N	\N	0
39902	28	Pedido prueba avances	\N	PREFIX-00005	2010-06-14 19:27:47.252	\N	0.10	f	\N	\N	\N	\N
19798	21	elem 4	\N	PREFIX-00003-00004	\N	\N	0.20	f	7077	\N	\N	3
46866	13	elem 5	\N	PREFIX-00003-00005	\N	\N	0.00	f	7077	\N	\N	4
54747	4	elem 7	\N	PREFIX-00003-00007	\N	\N	0.20	f	7077	\N	\N	6
40535	19	elem 2	\N	PREFIX-00005-00003	\N	\N	0.15	f	39902	\N	\N	1
5358	23	tarefa limitantes 6	\N	PREFIX-00002-00008	\N	\N	0.00	f	1531	\N	\N	3
1531	55	Pedido recursos limitantes	Pedido para proba con recursos limitantes	PREFIX-00002	2010-06-13 12:33:10.77	2010-09-15 00:00:00	0.09	f	\N	\N	\N	\N
1532	53	container 1	\N	PREFIX-00002-00001	\N	\N	0.35	f	1531	\N	\N	0
1533	46	tarefa limitantes 1	\N	PREFIX-00002-00003	\N	\N	0.20	f	1532	\N	\N	0
39904	22	elem 2.0	\N	PREFIX-00005-00002	\N	\N	0.30	f	40535	\N	\N	0
40536	15	elem 2.1	\N	PREFIX-00005-00004	\N	\N	0.00	f	40535	\N	\N	1
1534	46	tarefa limitantes 2	\N	PREFIX-00002-00004	\N	\N	0.50	f	1532	\N	\N	1
54138	3	elem 3	\N	PREFIX-00005-00005	\N	\N	0.00	f	39902	\N	\N	2
1535	47	container 2	\N	PREFIX-00002-00002	\N	\N	0.10	f	1531	\N	\N	1
1536	46	tarefa limitantes 3	\N	PREFIX-00002-00005	\N	\N	0.20	f	1535	\N	\N	0
1537	46	tarefa limitantes 4	\N	PREFIX-00002-00006	\N	\N	0.00	f	1535	\N	\N	1
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
51007	1
7078	1
7079	1
13637	1
19798	1
46866	1
54747	1
48279	1
39903	1
39904	1
40536	1
54138	1
5358	1
1533	1
1534	1
1536	1
1537	1
1543	1
6168	1
6169	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1531
1532
1535
6167
7077
39902
40535
48278
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	9	PREFIX	6	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
40101	2	2010-06-14 19:28:45.369	707
40100	27	2010-06-15 13:19:00.532	707
48191	7	2010-06-15 12:02:11.577	27977
1721	78	2010-06-15 14:03:18.703	707
7275	57	2010-06-15 14:13:30.77	707
44873	13	2010-06-15 11:04:12.16	27977
48177	3	2010-06-14 22:27:04.287	707
48193	2	2010-06-14 22:30:48.446	27977
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype, reportadvance, advance_type_id) FROM stdin;
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, code, generatecode, limited_resource, base_calendar_id) FROM stdin;
6667	39	cd0d3669-d6fb-46bf-b5bb-a618353c085e	t	f	6767
1214	39	5aef0e25-573b-442e-b321-ce6c3be6608b	t	f	2
1220	45	d692db0b-e344-467d-8cd5-c746c94ae8f4	t	t	5
1216	46	bb5d29ab-e802-4d90-841a-2cc87d937a6d	t	t	3
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
53631	4	1.00	100	100	47874	\N
55348	6	1.00	100	100	47876	\N
29290	9	1.00	100	100	29189	\N
29308	8	1.00	100	100	29192	\N
48784	0	1.00	\N	100	47883	\N
45152	2	1.81	\N	234	44951	\N
45154	2	0.77	\N	100	44953	\N
45151	2	1.46	\N	324	44950	\N
45153	2	0.96	\N	211	44952	\N
29306	8	1.00	100	100	29193	\N
29307	8	1.00	100	100	29194	\N
51309	5	0.73	\N	100	49698	\N
47369	7	1.00	100	100	47268	\N
14147	23	0.96	\N	211	14039	\N
37172	11	0.77	\N	100	20200	\N
8184	28	1.88	\N	390	7576	\N
8182	29	1.46	\N	324	7575	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
2	1
3	1
5	1
6767	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario (id, version, name, description, lastnotownedreassignationstimestamp, predecessor) FROM stdin;
707	0	master	\N	\N	\N
27977	3	Optimista	escenario para ver o mellor caso	\N	707
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
1531	1721	707
7077	7275	707
1531	1721	27977
39902	40100	707
7077	44873	27977
48278	48177	27977
48278	48177	707
39902	48191	27977
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
1531	1632	1721
1532	1633	1721
1533	1634	1721
1534	1635	1721
1535	1636	1721
1536	1637	1721
1537	1638	1721
1543	1644	1721
5358	5459	1721
6167	6268	1721
6168	6269	1721
6169	6270	1721
7077	7178	7275
7078	7179	7275
7079	7180	7275
13637	13738	7275
19798	19899	7275
39902	40003	40100
39903	40004	40100
39904	40005	40100
40535	40636	40100
40536	40637	40100
7077	45797	44873
7078	45798	44873
7079	45799	44873
13637	45800	44873
19798	45801	44873
46866	46967	7275
48278	48379	48177
48279	48380	48177
39902	48449	48191
39903	48450	48191
40535	48451	48191
39904	48452	48191
40536	48453	48191
46866	50183	44873
51007	50187	7275
54138	54040	48191
54747	54649	7275
54138	55263	40100
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
48449	6	3	39902
40003	19	3	39902
48451	6	3	40535
40636	15	3	40535
48452	6	0	39904
40005	19	0	39904
48453	6	0	40536
40637	15	0	40536
54040	3	0	54138
48450	6	0	39903
40004	19	0	39903
55263	2	4	54138
48379	2	4	48278
48380	2	4	48279
1632	56	3	1531
1633	53	3	1532
1634	48	0	1533
1635	52	0	1534
1636	48	3	1535
1637	48	0	1536
1638	48	0	1537
1644	49	0	1543
6268	21	3	6167
6269	21	0	6168
6270	21	0	6169
48459	2	3	39902
48460	2	0	39903
48461	2	3	40535
48462	2	0	39904
48463	2	0	40536
5459	25	0	5358
45797	13	3	7077
7178	39	3	7077
45798	13	0	7078
7179	39	0	7078
45799	13	0	7079
7180	39	0	7079
45800	13	0	13637
13738	30	0	13637
45801	13	0	19798
19899	21	0	19798
50183	10	4	46866
46967	13	0	46866
54649	4	0	54747
50187	10	0	51007
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
48784	6667
53631	1220
29290	1220
51309	1214
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
48885	0	48784	27977
53833	3	53631	707
29493	24	29290	27977
29492	12	29290	707
51410	5	51309	707
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
15597573	3	1818	2010-06-14 22:17:00.57	2010-06-14 22:25:30.189	prueba subcontratacion	1000.00	ref-subcon-123	\N	\N	\N	\N	2
15597574	3	1818	2010-06-14 22:31:41.168	\N	proba que deberia fallar	1000.00	cod-suv	t	\N	\N	t	0
15597569	10	1818	2010-06-14 22:17:00.57	2010-06-14 22:25:30.189	prueba subcontratacion	1000.00	ref-subcon-123	\N	\N	\N	\N	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
47883	1	0	\N	\N	\N
47885	1	2	2010-06-14 19:27:47.252	15597573	\N
47886	1	2	2010-06-27 07:27:47.252	15597574	\N
54439	1	0	\N	\N	\N
49698	1	0	\N	\N	\N
47268	1	1	2010-06-13 00:00:00	\N	5
14039	1	0	\N	\N	\N
55045	1	1	2010-06-22 01:33:00	\N	\N
20200	1	1	2010-07-19 00:00:00	\N	5
7576	1	0	\N	\N	\N
7575	1	0	\N	\N	\N
44951	1	0	\N	\N	\N
44953	1	1	2010-07-19 00:00:00	\N	5
44950	1	0	\N	\N	\N
44952	1	0	\N	\N	\N
47875	1	2	2010-06-14 19:27:47.252	15597569	\N
47874	1	1	2010-09-09 00:00:00	\N	5
47876	1	1	2010-08-23 00:00:00	\N	5
29197	1	0	\N	\N	\N
29198	1	0	\N	\N	\N
29199	1	0	\N	\N	\N
29189	1	1	2010-06-13 00:00:00	\N	5
29192	1	1	2010-06-30 00:00:00	\N	5
29193	1	1	2010-07-16 00:00:00	\N	5
29194	1	1	2010-08-04 00:00:00	\N	5
29196	1	0	\N	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
44953	20000
44950	7377
44952	13839
44951	7378
47874	40202
47875	40203
47876	40720
47883	40202
47885	40203
47886	40720
54439	54239
7575	7377
7576	7378
14039	13839
20200	20000
47268	47068
49698	51108
55045	54848
29189	1927
29192	1928
29193	1929
29194	1930
29196	1936
29197	5560
29198	6367
29199	6368
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent) FROM stdin;
7577	42	Pedido proba de consolidacions	\N	2010-06-13 00:00:00	2010-09-17 23:21:38.831	\N	0.20	\N	\N	\N
29197	9	tarefa limitantes 6	\N	2010-06-13 12:33:10.77	2010-07-08 12:33:10.77	\N	0.00	29191	\N	3
29200	10	container 3	\N	2010-06-13 12:33:10.77	2010-06-19 18:33:10.77	2010-07-22	0.00	29191	\N	4
47876	14	elem 2.1	\N	2010-08-23 00:00:00	2010-09-08 00:00:00	\N	0.00	47877	\N	1
29198	9	subtask 2	\N	2010-06-13 12:33:10.77	2010-06-19 18:33:10.77	\N	0.00	29200	\N	0
29199	9	subtask 1	\N	2010-06-13 12:33:10.77	2010-06-19 18:33:10.77	\N	0.00	29200	\N	1
29190	14	container 1	\N	2010-06-13 12:33:10.77	2010-07-16 00:00:00	\N	0.35	29191	\N	0
29189	12	tarefa limitantes 1	\N	2010-06-13 00:00:00	2010-06-30 00:00:00	2010-08-01	0.20	29190	\N	0
29192	10	tarefa limitantes 2	\N	2010-06-30 00:00:00	2010-07-16 00:00:00	\N	0.50	29190	\N	1
29195	10	container 2	\N	2010-07-16 00:00:00	2010-08-20 00:00:00	\N	0.10	29191	\N	1
29193	10	tarefa limitantes 3	\N	2010-07-16 00:00:00	2010-08-04 00:00:00	\N	0.20	29195	\N	0
29194	10	tarefa limitantes 4	\N	2010-08-04 00:00:00	2010-08-20 00:00:00	\N	0.00	29195	\N	1
29196	9	tarefa limitantes 5	\N	2010-06-13 12:33:10.77	2010-07-21 00:33:10.77	\N	0.00	29191	\N	2
29191	14	Pedido recursos limitantes	\N	2010-06-13 12:33:10.77	2010-08-20 00:00:00	2010-09-15	0.09	\N	\N	\N
49698	9	elem 6	\N	2010-06-13 23:21:38.831	2010-07-17 23:21:38.831	\N	0.10	7577	\N	5
47268	12	elem 5	\N	2010-06-13 00:00:00	2010-06-30 00:00:00	\N	0.00	7577	\N	4
14039	29	elem 3	\N	2010-06-13 23:21:38.831	2010-08-05 23:21:38.831	\N	0.10	7577	\N	2
55045	3	elem 7	\N	2010-06-22 01:33:00	2010-07-04 13:33:00	\N	0.20	7577	\N	6
47883	3	elem 1	\N	2010-06-14 19:27:47.252	2010-07-01 19:27:47.252	\N	0.10	47882	\N	0
47885	3	elem 2.0	\N	2010-06-14 19:27:47.252	2010-06-27 07:27:47.252	\N	0.30	47884	\N	0
47886	3	elem 2.1	\N	2010-06-27 07:27:47.252	2010-07-09 19:27:47.252	\N	0.00	47884	\N	1
47884	4	elem 2	\N	2010-06-14 19:27:47.252	2010-07-09 19:27:47.252	\N	0.15	47882	\N	1
47882	2	Pedido prueba avances	\N	2010-06-14 19:27:47.252	2010-07-09 19:27:47.252	\N	0.10	\N	\N	\N
54439	1	elem 3	\N	2010-06-14 19:27:47.252	2010-06-27 07:27:47.252	\N	0.00	47882	\N	2
20200	22	elem 4	\N	2010-07-19 00:00:00	2010-08-06 00:00:00	\N	0.20	7577	\N	3
7576	49	elem 2	\N	2010-08-06 23:21:38.831	2010-09-17 23:21:38.831	\N	0.40	7577	\N	1
47877	9	elem 2	\N	2010-06-14 19:27:47.252	2010-07-09 19:27:47.252	\N	0.15	47878	\N	1
47875	9	elem 2.0	\N	2010-06-14 19:27:47.252	2010-06-27 07:27:47.252	\N	0.30	47877	\N	0
47878	9	Pedido prueba avances	\N	2010-06-14 19:27:47.252	2010-07-16 00:00:00	\N	0.13	\N	\N	\N
44951	2	elem 2	\N	2010-08-06 23:21:38.831	2010-09-17 23:21:38.831	\N	0.40	44949	\N	1
44953	2	elem 4	\N	2010-07-19 00:00:00	2010-08-06 00:00:00	\N	0.20	44949	\N	3
44950	2	elem 1	\N	2010-06-13 23:21:38.831	2010-08-06 23:21:38.831	\N	0.10	44949	\N	0
44952	2	elem 3	\N	2010-06-13 23:21:38.831	2010-08-05 23:21:38.831	\N	0.10	44949	\N	2
44949	1	Pedido proba de consolidacions	\N	2010-06-13 23:21:38.831	2010-09-17 23:21:38.831	\N	0.24	\N	\N	\N
7575	36	elem 1	\N	2010-06-13 23:21:38.831	2010-08-06 23:21:38.831	\N	0.10	7577	\N	0
47874	10	elem 1	\N	2010-09-09 00:00:00	2010-09-27 00:00:00	\N	0.10	47878	\N	0
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
7577
29190
29191
29195
29200
44949
47877
47878
47882
47884
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
47884	1	48451
47882	1	48449
47883	2	48450
47885	2	48452
47886	2	48453
54439	1	54040
44949	0	45797
44953	0	45801
44950	0	45798
44952	0	45800
44951	0	45799
7577	7	7178
7575	13	7179
7576	13	7180
14039	11	13738
20200	9	19899
47877	2	40636
47878	2	40003
47874	3	40004
47875	3	40005
47876	3	40637
47268	7	46967
49698	5	50187
55045	1	54649
29190	3	1633
29195	2	1636
29200	2	6268
29191	3	1632
29189	5	1634
29192	3	1635
29193	3	1637
29194	3	1638
29196	3	1644
29197	3	5459
29198	3	6269
29199	3	6270
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
1010	1	6ebce9b1-edb0-4aa8-80ba-11110ab2d66d	units	f
1011	1	7f8ae0ce-c0db-4a86-a111-33f9f54f3b0d	kg	f
1012	1	602c5c22-0965-4ac1-a222-c573f7a2a808	km	f
1013	1	d4122110-85f4-414a-a0a5-a8200a1863c1	l	f
1014	1	214f0d77-aea5-4c54-8599-c522487249f9	m	f
1015	1	b2e7552f-bdee-4506-885e-076d0c9168ab	m2	f
1016	1	2a21466d-d5b7-47e5-8ca9-7f72917c937f	m3	f
1017	1	bf517748-e2f1-4710-b5c2-1bbd96f59f91	tn	f
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_profiles (user_id, profile_id) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
1112	ROLE_READ_ALL_ORDERS
1112	ROLE_CREATE_ORDER
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_ADMINISTRATION
1113	ROLE_WS_READER
1114	ROLE_WS_WRITER
1114	ROLE_WS_READER
1112	ROLE_WS_WRITER
1112	ROLE_WS_READER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, generatecode, work_report_type_id, resource_id, order_element_id) FROM stdin;
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
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
1214	Javier	Moran	78736622D
6667	Marina	Gonzalez	2345234L
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
-- Name: advanceassignmenttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT advanceassignmenttemplate_pkey PRIMARY KEY (id);


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
-- Name: basecalendar_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY basecalendar
    ADD CONSTRAINT basecalendar_code_key UNIQUE (code);


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
-- Name: calendardata_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_code_key UNIQUE (code);


--
-- Name: calendardata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendardata
    ADD CONSTRAINT calendardata_pkey PRIMARY KEY (id);


--
-- Name: calendarexception_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_code_key UNIQUE (code);


--
-- Name: calendarexception_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexception
    ADD CONSTRAINT calendarexception_pkey PRIMARY KEY (id);


--
-- Name: calendarexceptiontype_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY calendarexceptiontype
    ADD CONSTRAINT calendarexceptiontype_code_key UNIQUE (code);


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
-- Name: consolidatedvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT consolidatedvalue_pkey PRIMARY KEY (id);


--
-- Name: consolidation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT consolidation_pkey PRIMARY KEY (id);


--
-- Name: cost_category_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY cost_category
    ADD CONSTRAINT cost_category_code_key UNIQUE (code);


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
-- Name: criterion_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterion
    ADD CONSTRAINT criterion_code_key UNIQUE (code);


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
-- Name: criterionsatisfaction_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_code_key UNIQUE (code);


--
-- Name: criterionsatisfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criterionsatisfaction
    ADD CONSTRAINT criterionsatisfaction_pkey PRIMARY KEY (id);


--
-- Name: criteriontype_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY criteriontype
    ADD CONSTRAINT criteriontype_code_key UNIQUE (code);


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
-- Name: derivedallocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT derivedallocation_pkey PRIMARY KEY (id);


--
-- Name: deriveddayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT deriveddayassignmentscontainer_pkey PRIMARY KEY (id);


--
-- Name: directadvanceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY directadvanceassignment
    ADD CONSTRAINT directadvanceassignment_pkey PRIMARY KEY (advance_assignment_id);


--
-- Name: external_company_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_name_key UNIQUE (name);


--
-- Name: external_company_nif_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_nif_key UNIQUE (nif);


--
-- Name: external_company_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT external_company_pkey PRIMARY KEY (id);


--
-- Name: generic_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY generic_resource_allocation
    ADD CONSTRAINT generic_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: genericdayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT genericdayassignmentscontainer_pkey PRIMARY KEY (id);


--
-- Name: hour_cost_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hour_cost
    ADD CONSTRAINT hour_cost_code_key UNIQUE (code);


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
-- Name: label_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label
    ADD CONSTRAINT label_code_key UNIQUE (code);


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
-- Name: label_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY label_type
    ADD CONSTRAINT label_type_code_key UNIQUE (code);


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
-- Name: limiting_resource_queue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT limiting_resource_queue_dependency_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_element_resource_allocation_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT limiting_resource_queue_element_resource_allocation_id_key UNIQUE (resource_allocation_id);


--
-- Name: limiting_resource_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_pkey PRIMARY KEY (id);


--
-- Name: limiting_resource_queue_resource_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT limiting_resource_queue_resource_id_key UNIQUE (resource_id);


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
-- Name: material_assigment_template_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT material_assigment_template_pkey PRIMARY KEY (id);


--
-- Name: material_category_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY material_category
    ADD CONSTRAINT material_category_code_key UNIQUE (code);


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
-- Name: naval_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_profile
    ADD CONSTRAINT naval_profile_pkey PRIMARY KEY (id);


--
-- Name: naval_profile_profilename_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY naval_profile
    ADD CONSTRAINT naval_profile_profilename_key UNIQUE (profilename);


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
-- Name: order_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT order_authorization_pkey PRIMARY KEY (id);


--
-- Name: order_element_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_label
    ADD CONSTRAINT order_element_label_pkey PRIMARY KEY (order_element_id, label_id);


--
-- Name: order_element_template_label_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT order_element_template_label_pkey PRIMARY KEY (order_element_template_id, label_id);


--
-- Name: order_element_template_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT order_element_template_quality_form_pkey PRIMARY KEY (order_element_template_id, quality_form_id);


--
-- Name: order_table_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT order_table_pkey PRIMARY KEY (orderelementid);


--
-- Name: orderelement_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_code_key UNIQUE (code);


--
-- Name: orderelement_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_pkey PRIMARY KEY (id);


--
-- Name: orderelementtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelementtemplate
    ADD CONSTRAINT orderelementtemplate_pkey PRIMARY KEY (id);


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
-- Name: orderlinegrouptemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT orderlinegrouptemplate_pkey PRIMARY KEY (group_template_id);


--
-- Name: orderlinetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderlinetemplate
    ADD CONSTRAINT orderlinetemplate_pkey PRIMARY KEY (order_line_template_id);


--
-- Name: ordersequence_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY ordersequence
    ADD CONSTRAINT ordersequence_pkey PRIMARY KEY (id);


--
-- Name: ordertemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT ordertemplate_pkey PRIMARY KEY (order_template_id);


--
-- Name: orderversion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderversion
    ADD CONSTRAINT orderversion_pkey PRIMARY KEY (id);


--
-- Name: quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT quality_form_items_pkey PRIMARY KEY (quality_form_id, idx);


--
-- Name: quality_form_name_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_name_key UNIQUE (name);


--
-- Name: quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT quality_form_pkey PRIMARY KEY (id);


--
-- Name: resource_base_calendar_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_base_calendar_id_key UNIQUE (base_calendar_id);


--
-- Name: resource_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_code_key UNIQUE (code);


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
-- Name: resources_cost_category_assignment_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_code_key UNIQUE (code);


--
-- Name: resources_cost_category_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY resources_cost_category_assignment
    ADD CONSTRAINT resources_cost_category_assignment_pkey PRIMARY KEY (id);


--
-- Name: scenario_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT scenario_orders_pkey PRIMARY KEY (scenario_id, order_id);


--
-- Name: scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- Name: scheduling_states_by_order_version_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT scheduling_states_by_order_version_pkey PRIMARY KEY (order_element_id, order_version_id);


--
-- Name: schedulingdataforversion_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY schedulingdataforversion
    ADD CONSTRAINT schedulingdataforversion_pkey PRIMARY KEY (id);


--
-- Name: specific_resource_allocation_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specific_resource_allocation
    ADD CONSTRAINT specific_resource_allocation_pkey PRIMARY KEY (resource_allocation_id);


--
-- Name: specificdayassignmentscontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT specificdayassignmentscontainer_pkey PRIMARY KEY (id);


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
-- Name: subcontractedtaskdata_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT subcontractedtaskdata_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_element_id);


--
-- Name: task_quality_form_items_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT task_quality_form_items_pkey PRIMARY KEY (task_quality_form_id, idx);


--
-- Name: task_quality_form_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT task_quality_form_pkey PRIMARY KEY (id);


--
-- Name: task_source_hours_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task_source_hours_groups
    ADD CONSTRAINT task_source_hours_groups_pkey PRIMARY KEY (task_source_id, hours_group_id);


--
-- Name: task_subcontrated_task_data_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_subcontrated_task_data_id_key UNIQUE (subcontrated_task_data_id);


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
-- Name: tasksource_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_pkey PRIMARY KEY (id);


--
-- Name: tasksource_schedulingdata_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT tasksource_schedulingdata_key UNIQUE (schedulingdata);


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
-- Name: unit_type_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_code_key UNIQUE (code);


--
-- Name: unit_type_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY unit_type
    ADD CONSTRAINT unit_type_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id, profile_id);


--
-- Name: virtualworker_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY virtualworker
    ADD CONSTRAINT virtualworker_pkey PRIMARY KEY (virtualworker_id);


--
-- Name: work_report_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report
    ADD CONSTRAINT work_report_code_key UNIQUE (code);


--
-- Name: work_report_label_type_assigment_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_label_type_assigment
    ADD CONSTRAINT work_report_label_type_assigment_pkey PRIMARY KEY (id);


--
-- Name: work_report_line_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY work_report_line
    ADD CONSTRAINT work_report_line_code_key UNIQUE (code);


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
-- Name: fk109ac09e8b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk109ac09e8b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fk109ac09eefda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form
    ADD CONSTRAINT fk109ac09eefda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


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
-- Name: fk1ccb0f7419b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk1ccb0f7419b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk1ccb0f74b5c68337; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material_assigment_template
    ADD CONSTRAINT fk1ccb0f74b5c68337 FOREIGN KEY (material_id) REFERENCES material(id);


--
-- Name: fk1fc5f45575ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f45575ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fk1fc5f455bd2209e8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_element
    ADD CONSTRAINT fk1fc5f455bd2209e8 FOREIGN KEY (limiting_resource_queue_id) REFERENCES limiting_resource_queue(id);


--
-- Name: fk27a9a54936bb8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a54936bb8c FOREIGN KEY (task_element_id) REFERENCES taskelement(id);


--
-- Name: fk27a9a55b595a0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task
    ADD CONSTRAINT fk27a9a55b595a0 FOREIGN KEY (subcontrated_task_data_id) REFERENCES subcontractedtaskdata(id);


--
-- Name: fk2999e7e5421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT fk2999e7e5421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fk2999e7e57518838c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY specificdayassignmentscontainer
    ADD CONSTRAINT fk2999e7e57518838c FOREIGN KEY (resource_allocation_id) REFERENCES specific_resource_allocation(resource_allocation_id);


--
-- Name: fk29d0015519b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fk29d0015519b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk29d001558b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_quality_form
    ADD CONSTRAINT fk29d001558b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


--
-- Name: fk3a79eb0219b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY criterionrequirement
    ADD CONSTRAINT fk3a79eb0219b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


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
-- Name: fk3afdc2bd75ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT fk3afdc2bd75ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


--
-- Name: fk3afdc2bd87b470f0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY derivedallocation
    ADD CONSTRAINT fk3afdc2bd87b470f0 FOREIGN KEY (configurationunit) REFERENCES machineworkersconfigurationunit(id);


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
-- Name: fk40795527f11b2d0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY material
    ADD CONSTRAINT fk40795527f11b2d0 FOREIGN KEY (unit_type) REFERENCES unit_type(id);


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
-- Name: fk4a1d42dc9fb7fc18; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinetemplate
    ADD CONSTRAINT fk4a1d42dc9fb7fc18 FOREIGN KEY (order_line_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fk4d68b9c89a4a7d90; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT fk4d68b9c89a4a7d90 FOREIGN KEY (order_template_id) REFERENCES orderlinegrouptemplate(group_template_id);


--
-- Name: fk4d68b9c8a44abee3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY ordertemplate
    ADD CONSTRAINT fk4d68b9c8a44abee3 FOREIGN KEY (base_calendar_id) REFERENCES basecalendar(id);


--
-- Name: fk5280da49161d6c65; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY virtualworker
    ADD CONSTRAINT fk5280da49161d6c65 FOREIGN KEY (virtualworker_id) REFERENCES worker(worker_id);


--
-- Name: fk53cd4dcaa2380ca7; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderversion
    ADD CONSTRAINT fk53cd4dcaa2380ca7 FOREIGN KEY (ownerscenario) REFERENCES scenario(id);


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
-- Name: fk5948535228f2695; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk5948535228f2695 FOREIGN KEY (origin_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk59485352e42f8d29; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk59485352e42f8d29 FOREIGN KEY (destiny_queue_element_id) REFERENCES limiting_resource_queue_element(id);


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
-- Name: fk698876da1b8e7cf2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT fk698876da1b8e7cf2 FOREIGN KEY (derived_allocation_id) REFERENCES derivedallocation(id);


--
-- Name: fk698876da421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY deriveddayassignmentscontainer
    ADD CONSTRAINT fk698876da421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


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
-- Name: fk711ace7423b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace7423b85cf1 FOREIGN KEY (order_version_id) REFERENCES orderversion(id);


--
-- Name: fk711ace7487287288; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace7487287288 FOREIGN KEY (order_id) REFERENCES order_table(orderelementid);


--
-- Name: fk711ace74c0fb9d8e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario_orders
    ADD CONSTRAINT fk711ace74c0fb9d8e FOREIGN KEY (scenario_id) REFERENCES scenario(id);


--
-- Name: fk7540af6b1545e7a; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b1545e7a FOREIGN KEY (origin) REFERENCES taskelement(id);


--
-- Name: fk7540af6b9e788f90; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6b9e788f90 FOREIGN KEY (queue_dependency) REFERENCES limiting_resource_queue_dependency(id);


--
-- Name: fk7540af6be838f362; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6be838f362 FOREIGN KEY (destination) REFERENCES taskelement(id);


--
-- Name: fk75a2f39d4ec080cf; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_table
    ADD CONSTRAINT fk75a2f39d4ec080cf FOREIGN KEY (customer) REFERENCES external_company(id);


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
-- Name: fk7e57469848d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue
    ADD CONSTRAINT fk7e57469848d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


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
-- Name: fk8217a424b216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY quality_form
    ADD CONSTRAINT fk8217a424b216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


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
-- Name: fk991fdde5567ad13; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fk991fdde5567ad13 FOREIGN KEY (user_id) REFERENCES naval_user(id);


--
-- Name: fk991fddeedc4db41; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT fk991fddeedc4db41 FOREIGN KEY (profile_id) REFERENCES naval_profile(id);


--
-- Name: fk9ac73f9e40901220; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY worker
    ADD CONSTRAINT fk9ac73f9e40901220 FOREIGN KEY (worker_id) REFERENCES resource(id);


--
-- Name: fk9bb0b28841638aab; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelementtemplate
    ADD CONSTRAINT fk9bb0b28841638aab FOREIGN KEY (parent) REFERENCES orderlinegrouptemplate(group_template_id);


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
-- Name: fka04a45b123b85cf1; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b123b85cf1 FOREIGN KEY (order_version_id) REFERENCES orderversion(id);


--
-- Name: fka04a45b19bfe55d0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b19bfe55d0 FOREIGN KEY (scheduling_state_for_version_id) REFERENCES schedulingdataforversion(id);


--
-- Name: fka04a45b1efda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scheduling_states_by_order_version
    ADD CONSTRAINT fka04a45b1efda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fka2d2a4d6cc119699; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY configuration
    ADD CONSTRAINT fka2d2a4d6cc119699 FOREIGN KEY (configuration_id) REFERENCES basecalendar(id);


--
-- Name: fka87c31085567ad13; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c31085567ad13 FOREIGN KEY (user_id) REFERENCES naval_user(id);


--
-- Name: fka87c310887287288; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c310887287288 FOREIGN KEY (order_id) REFERENCES order_table(orderelementid);


--
-- Name: fka87c3108edc4db41; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_authorization
    ADD CONSTRAINT fka87c3108edc4db41 FOREIGN KEY (profile_id) REFERENCES naval_profile(id);


--
-- Name: fka9542ec319b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fka9542ec319b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fka9542ec3c1c2746e; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY order_element_template_label
    ADD CONSTRAINT fka9542ec3c1c2746e FOREIGN KEY (label_id) REFERENCES label(id);


--
-- Name: fkab89a5edefda874f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY schedulingdataforversion
    ADD CONSTRAINT fkab89a5edefda874f FOREIGN KEY (order_element_id) REFERENCES orderelement(id);


--
-- Name: fkadeba4bf87fa6b5d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY task_quality_form_items
    ADD CONSTRAINT fkadeba4bf87fa6b5d FOREIGN KEY (task_quality_form_id) REFERENCES task_quality_form(id);


--
-- Name: fkb05e6e203d72bc6f; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e203d72bc6f FOREIGN KEY (id) REFERENCES taskelement(id);


--
-- Name: fkb05e6e209a2c0abd; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY tasksource
    ADD CONSTRAINT fkb05e6e209a2c0abd FOREIGN KEY (schedulingdata) REFERENCES schedulingdataforversion(id);


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
-- Name: fkbb493f5019256004; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5019256004 FOREIGN KEY (generic_container_id) REFERENCES genericdayassignmentscontainer(id);


--
-- Name: fkbb493f5048d21790; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f5048d21790 FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbb493f50510e7a78; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50510e7a78 FOREIGN KEY (derived_container_id) REFERENCES deriveddayassignmentscontainer(id);


--
-- Name: fkbb493f50756348a8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f50756348a8 FOREIGN KEY (specific_container_id) REFERENCES specificdayassignmentscontainer(id);


--
-- Name: fkc001d52efd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursperday
    ADD CONSTRAINT fkc001d52efd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


--
-- Name: fkc5b10467f3909054; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY profile_roles
    ADD CONSTRAINT fkc5b10467f3909054 FOREIGN KEY (profileid) REFERENCES naval_profile(id);


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
-- Name: fkcf1f2cd08bdc6ac6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT fkcf1f2cd08bdc6ac6 FOREIGN KEY (order_line_template) REFERENCES orderlinetemplate(order_line_template_id);


--
-- Name: fkd06071e0421c7cf4; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT fkd06071e0421c7cf4 FOREIGN KEY (scenario) REFERENCES scenario(id);


--
-- Name: fkd06071e0ee970b; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY genericdayassignmentscontainer
    ADD CONSTRAINT fkd06071e0ee970b FOREIGN KEY (resource_allocation_id) REFERENCES generic_resource_allocation(resource_allocation_id);


--
-- Name: fkd3056ef7ddc82952; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT fkd3056ef7ddc82952 FOREIGN KEY (group_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fkd59fd7b0fd99606d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT fkd59fd7b0fd99606d FOREIGN KEY (predecessor) REFERENCES scenario(id);


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
-- Name: fkdbbb4feed97bcc8c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4feed97bcc8c FOREIGN KEY (template) REFERENCES orderelementtemplate(id);


--
-- Name: fkdfdb026919b9dfde; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT fkdfdb026919b9dfde FOREIGN KEY (order_element_template_id) REFERENCES orderelementtemplate(id);


--
-- Name: fkdfdb0269b216ed4c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY advanceassignmenttemplate
    ADD CONSTRAINT fkdfdb0269b216ed4c FOREIGN KEY (advance_type_id) REFERENCES advancetype(id);


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
-- Name: fke562c7e93fee60cc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY external_company
    ADD CONSTRAINT fke562c7e93fee60cc FOREIGN KEY (companyuser) REFERENCES naval_user(id);


--
-- Name: fke9754bc58b37665c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY quality_form_items
    ADD CONSTRAINT fke9754bc58b37665c FOREIGN KEY (quality_form_id) REFERENCES quality_form(id);


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
-- Name: fkecc6114019960f43; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT fkecc6114019960f43 FOREIGN KEY (externalcompany) REFERENCES external_company(id);


--
-- Name: fkee374673ae0677b8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY stretches
    ADD CONSTRAINT fkee374673ae0677b8 FOREIGN KEY (assignment_function_id) REFERENCES stretchesfunction(assignment_function_id);


--
-- Name: fkeeedb0fc4cd98327; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY naval_user
    ADD CONSTRAINT fkeeedb0fc4cd98327 FOREIGN KEY (lastconnectedscenario) REFERENCES scenario(id);


--
-- Name: fkef86282edc874c20; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkef86282edc874c20 FOREIGN KEY (base_calendar_id) REFERENCES resourcecalendar(base_calendar_id);


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
-- Name: fkf436a4163ae24ff8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a4163ae24ff8 FOREIGN KEY (consolidation_id) REFERENCES consolidation(id);


--
-- Name: fkf436a416b96bba28; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a416b96bba28 FOREIGN KEY (advance_measurement_id) REFERENCES advancemeasurement(id);


--
-- Name: fkf436a416cec54333; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidatedvalue
    ADD CONSTRAINT fkf436a416cec54333 FOREIGN KEY (consolidation_id) REFERENCES consolidation(id);


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
-- Name: fkf8df3e0c430ea1de; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0c430ea1de FOREIGN KEY (ind_advance_assignment_id) REFERENCES indirectadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0c9f1d6611; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0c9f1d6611 FOREIGN KEY (dir_advance_assignment_id) REFERENCES directadvanceassignment(advance_assignment_id);


--
-- Name: fkf8df3e0cff2b2ba3; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY consolidation
    ADD CONSTRAINT fkf8df3e0cff2b2ba3 FOREIGN KEY (id) REFERENCES task(task_element_id);


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

