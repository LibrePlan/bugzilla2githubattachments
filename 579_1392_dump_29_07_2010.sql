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
9196	8	f	809
9197	8	t	808
9195	8	f	809
9194	8	t	808
31579	6	f	809
31581	9	t	809
31578	6	t	808
31582	6	f	809
31583	6	t	808
31585	6	t	808
31586	6	f	809
31576	9	t	809
31577	9	t	809
31584	9	t	809
31580	9	t	809
43686	3	t	809
43679	3	t	809
43680	3	t	809
43681	3	t	809
43682	3	t	809
43683	3	t	809
43689	3	t	809
43684	2	f	809
43685	2	t	808
43687	2	t	808
43688	2	f	809
31530	5	f	809
31529	5	t	808
58212	3	t	808
58211	3	f	809
58215	3	f	809
58214	3	t	808
56995	5	t	809
56994	5	t	809
56996	5	t	809
56997	5	t	809
56998	5	t	809
5353	29	t	809
5354	29	t	809
5355	29	t	809
5356	29	t	809
5358	22	t	808
5357	22	f	809
5359	29	t	809
5360	29	t	809
5361	29	t	809
5362	29	t	809
31525	7	t	809
31526	7	t	809
31527	7	t	809
31528	7	t	809
31531	7	t	809
31532	7	t	809
31533	7	t	809
43635	12	t	808
43636	12	f	809
43641	12	f	809
43642	12	t	808
43645	12	f	809
43646	12	t	808
43648	12	f	809
43647	12	t	808
31536	5	t	808
31535	5	f	809
31540	5	f	809
31539	5	t	808
31542	5	f	809
31541	5	t	808
59195	2	f	809
59196	2	t	808
59197	2	t	808
59198	2	f	809
56999	4	f	809
57000	4	t	808
57002	4	f	809
57003	4	t	808
57001	5	t	809
5364	22	t	808
5363	22	f	809
57012	3	t	809
57013	3	t	809
57014	3	t	808
57015	3	f	809
5369	22	f	809
43227	15	t	809
43632	15	t	809
43633	15	t	809
43634	15	t	809
43637	15	t	809
43638	15	t	809
43639	15	t	809
43640	15	t	809
57018	9	t	809
43643	15	t	809
43644	15	t	809
9191	12	t	811
9192	12	t	811
9193	12	t	809
22725	19	t	809
22726	19	t	809
22727	19	t	809
22728	19	t	809
22729	19	t	809
22731	17	f	809
22730	17	t	808
22732	19	t	809
22733	17	f	809
22734	17	t	808
2020	19	t	809
2021	19	t	809
2023	11	t	808
2022	11	f	809
2024	19	t	809
2025	19	t	809
2026	11	t	808
2027	11	f	809
2030	18	t	809
2029	11	f	809
2028	11	t	808
5370	22	t	808
5365	29	t	809
5366	29	t	809
5367	22	t	808
5368	22	f	809
58206	5	t	809
58207	5	t	809
58208	5	t	809
58209	5	t	809
58210	5	t	809
58213	5	t	809
31537	7	t	809
31538	7	t	809
59193	3	t	809
59194	3	t	809
31534	7	t	809
26108	17	t	809
26109	17	t	809
26110	17	t	809
26115	17	t	809
59186	5	t	809
59187	5	t	809
59189	3	f	809
59188	3	t	808
59190	5	t	809
59191	3	t	808
59192	3	f	809
26116	12	t	808
26117	12	f	809
26111	17	t	809
26112	17	t	809
26114	12	t	808
26113	12	f	809
246945	3	t	809
276033	2	t	809
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
26677	1	809	26614	t	100.00
26678	1	809	26615	t	100.00
26679	1	809	26616	t	100.00
26680	1	809	26617	t	100.00
26681	1	809	26619	t	100.00
26682	1	809	26620	t	100.00
26683	1	809	26621	t	100.00
26684	1	809	26622	t	100.00
26685	1	809	26624	t	100.00
26686	1	809	26625	t	100.00
25619	2	809	25436	t	100.00
25620	2	809	25437	t	100.00
25621	2	809	25438	t	100.00
25622	2	809	25440	t	100.00
25623	2	809	25441	t	100.00
25624	2	809	25442	t	100.00
26702	1	809	26652	t	100.00
26703	1	809	26653	t	100.00
26704	1	809	26655	t	100.00
26705	1	809	26656	t	100.00
26706	1	809	26657	t	100.00
47589	1	809	47394	t	100.00
47590	1	809	47395	t	100.00
47591	1	809	47396	t	100.00
47592	1	809	47398	t	100.00
47593	1	809	47399	t	100.00
47594	1	809	47400	t	100.00
57576	1	809	57479	t	100.00
57577	1	809	57480	t	100.00
57581	1	809	57484	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
244976	2	2010-07-30	60.00	56995	\N
244977	2	2010-06-30	10.00	56995	\N
244987	1	2010-06-30	50.00	56994	\N
246064	0	2010-07-07	40.00	5354	\N
6383	24	2010-06-25	20.00	5353	\N
8915	18	2010-07-29	25.00	5355	\N
251701	0	2010-07-21	30.00	26109	\N
27799	12	2010-07-08	20.00	26108	\N
27851	5	2010-06-24	25.00	26110	\N
8932	6	2010-06-18	25.00	9191	\N
8956	1	2010-06-19	30.00	9192	\N
27830	2	2010-06-15	50.00	2020	\N
268467	1	2010-07-26	20.00	2021	\N
27831	2	2010-06-15	40.00	2030	\N
46477	8	2010-06-24	15.00	22727	\N
48905	5	2010-07-16	10.00	22728	\N
51116	3	2010-06-16	70.00	22729	\N
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
5861	4751
5863	4747
7904	4751
7908	4751
16672	4747
16673	4747
16699	4747
16701	4751
26970	4751
26972	4751
26973	4747
26974	4751
26989	4747
27040	4747
27041	4747
27042	4751
27043	4747
27044	4747
27045	4751
27046	4751
27047	4751
27048	4751
27049	4751
43936	4751
43941	4747
43943	4747
43944	4751
43945	4747
43946	510
45765	510
48283	4747
50705	4751
245027	4751
265553	4751
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
2	1	b239c933-2a54-493d-81ac-87e587db0bdb	\N
3	3	56404054-9105-4bcd-9775-174952902c25	\N
5	2	8f5ff702-2dbd-4209-928a-54c702dd7673	\N
4444	2	039aaa19-e957-4735-bcdd-258070156265	\N
4445	1	68bb41ad-9f63-4531-b3f3-3fba90b881f0	\N
4446	1	088f35bf-c773-4322-adb4-f0155c2ba870	\N
4447	1	62a7802c-77d6-4499-b79b-09de20279d26	\N
4448	2	52881e47-3ed1-47cd-9345-922398ea874d	\N
4449	1	697d2524-9acc-41f3-b55b-941b34d08eb8	\N
4450	1	9a6a699d-23b6-406c-8172-8c8e80832814	\N
21917	1	570a0ec3-32d5-4291-84f9-a6c8152b99a0	\N
52824	1	c5283fa6-2f91-4359-beae-cac4d08cbada	calendario españa
52823	5	5e035987-4bd8-4f33-87b1-a015e2f5e458	calendario - 3
1	2	5d393609-e203-42eb-ac95-0a352e90aa98	Default
240582	1	59fdf797-be06-4db4-b046-23ad3068813e	\N
240583	2	ae41670a-fec0-495f-a5d0-a7225a9edb8e	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-06-13	\N	2	0
1314	3	2010-06-13	\N	3	0
1316	2	2010-06-13	\N	5	0
4646	2	2010-06-14	\N	4444	0
4647	1	2010-06-14	\N	4445	0
4648	1	2010-06-14	\N	4446	0
4649	1	2010-06-14	\N	4447	0
4650	2	2010-06-14	\N	4448	0
4651	1	2010-06-14	\N	4449	0
4652	1	2010-06-14	\N	4450	0
22119	1	2010-06-14	\N	21917	0
240784	1	2010-06-29	\N	240582	0
240785	2	2010-06-29	\N	240583	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
102	1	5dcd06a8-5bf7-4f0a-b22f-e96c1dd97124	1	\N	2	0
103	3	a6600c81-6dd8-4603-a436-ae3ab3a85b65	1	\N	3	0
105	2	92bf9dec-53b9-4d28-88fc-52241fd90430	1	\N	5	0
4545	2	c6e69c26-8bba-4918-b49d-a8c0b9b1c442	1	\N	4444	0
4546	1	64d2247c-2066-4833-8941-1b5c0bd304e1	1	\N	4445	0
4547	1	29e5cb45-3cb3-4e1d-973c-f9f9110c0b7f	1	\N	4446	0
4548	1	4be9c076-9dec-49aa-8b8c-c49ea0cfa7e4	1	\N	4447	0
4549	2	7a0e6b57-50ac-49a3-a701-7ec79f2bc522	1	\N	4448	0
4550	1	3cce9429-94d2-4a84-b866-5ff33e2f64f5	1	\N	4449	0
4551	1	5e2f282b-8318-4c6f-b1aa-52df873e8f82	1	\N	4450	0
22018	1	12480924-24ef-4d7a-bff5-863f3e3321e0	1	\N	21917	0
52925	1	cdecfdb0-0bac-4eac-a188-eeaaaa78285b	\N	\N	52824	0
52924	5	26bd3e0c-0258-4690-bee1-5e7a72cd4940	52824	2010-06-24	52823	0
52926	4	4bd3e8c4-29a5-4b5b-905b-c6cd4387e23d	52824	\N	52823	1
101	2	d0f2f4ae-8926-4ef0-a24c-7f7f1feee225	\N	\N	1	0
240683	1	cf9e2c7b-c279-4cb4-a665-ffe67d227e0e	1	\N	240582	0
240684	2	271fce3e-337b-4115-a122-7e53b88a1058	1	\N	240583	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
56560	3	4957d01c-2016-4771-9788-fc028beb3b09	2010-06-24	8	607	52823
56561	2	37addcde-7f33-4b3a-b919-d198413b3f07	2010-06-21	8	608	52823
56661	1	66218319-7fe1-4552-9afc-b62f09f83395	2010-06-21	0	606	1
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
202	2	1	COMPANY_CODE	t	t	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, taskenddate, consolidation_id, advance_measurement_id) FROM stdin;
51423	NonCalculated	0	2010-06-16	70.00	2010-07-17	22830	51116
46561	NonCalculated	5	2010-06-24	15.00	2010-07-01	22828	46477
49187	NonCalculated	4	2010-07-16	10.00	2010-07-29	22829	48905
6565	NonCalculated	16	2010-06-25	20.00	2010-07-21	5454	6383
246137	NonCalculated	1	2010-07-07	40.00	2010-07-09	5455	246064
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
5455	NonCalculated	0	5354	\N
5454	NonCalculated	23	5353	\N
22828	NonCalculated	7	22727	\N
22829	NonCalculated	5	22728	\N
22830	NonCalculated	2	22729	\N
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
4753	1	b750558d-8406-431b-9627-8a5613136f62	Ciclo medio electricista	t	131074	\N
4754	1	dc894670-7e51-4aab-83a7-9f4a83665499	Ciclo medio soldadura	t	131074	\N
4755	1	86f7c98c-9cf2-4966-9e5d-b81081f6b006	Ciclo medio tecnologías de la información	t	131074	\N
4756	1	8c1a2c3a-bb12-47cb-aa69-fc98f0df2bcc	Ciclo superior soldadura	t	131074	\N
4757	1	c19886b3-9644-42ca-9625-de225877507a	Electricista	t	131075	\N
4750	2	19674a9d-7408-43e6-bffa-36b9d263f766	Revestidor	t	131075	\N
4758	1	c061322d-e3c2-46f0-880d-8aaac91364a8	Fontanero	t	131075	\N
4749	2	478bbf49-f2d6-4bd4-a1be-1b34e6073b64	Pulidor	t	131075	\N
4751	2	d4c3a0f2-1de4-4162-9475-d8b621a46dcb	Pintor	t	131075	\N
4747	2	2385e1b8-fe90-4a7e-a36e-a40bc7337320	Soldador	t	131075	\N
4748	2	dd23eea0-15ab-40e0-8ecf-68bb25672d85	Andamiero	t	131075	\N
4752	2	7dfba9b4-6e73-4ad2-a0bd-45f9e7401b37	Tornero	t	131075	\N
4759	1	6ab1550f-2fa6-40c9-ac13-d79d3df718dc	Carpintero	t	131075	\N
4760	1	3a270823-a27f-4e91-a897-6fe052be59de	Oficial 2º	t	131073	\N
4761	1	0e7e9b0b-491b-4f96-a161-3150e2e9a48f	Peón	t	131073	\N
4762	1	5ab495e9-714e-4818-a91f-01e4286b373c	Oficial 1º	t	131073	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
26774	DIRECT	1	\N	\N	26614	4751	\N	\N
26775	INDIRECT	1	26414	\N	\N	4751	26774	t
26776	DIRECT	1	\N	\N	26615	4747	\N	\N
26777	INDIRECT	1	26415	\N	\N	4747	26776	t
26779	DIRECT	1	\N	\N	26616	4747	\N	\N
25786	DIRECT	2	\N	\N	25436	4747	\N	\N
25787	INDIRECT	2	25720	\N	\N	4747	25786	t
25788	DIRECT	2	\N	\N	25437	4751	\N	\N
25789	INDIRECT	2	25721	\N	\N	4751	25788	t
25790	DIRECT	2	\N	\N	25438	510	\N	\N
25791	INDIRECT	2	25722	\N	\N	510	25790	t
25792	DIRECT	2	\N	\N	25440	4747	\N	\N
25793	INDIRECT	2	25723	\N	\N	4747	25792	t
25794	DIRECT	2	\N	\N	25441	4751	\N	\N
25795	INDIRECT	2	25724	\N	\N	4751	25794	t
25796	DIRECT	2	\N	\N	25442	4751	\N	\N
25797	INDIRECT	2	25725	\N	\N	4751	25796	t
26778	INDIRECT	1	26416	\N	\N	4747	26776	t
26780	INDIRECT	1	26417	\N	\N	4747	26779	t
26781	DIRECT	1	\N	\N	26617	4751	\N	\N
26782	INDIRECT	1	26418	\N	\N	4751	26781	t
26783	DIRECT	1	\N	\N	26618	4751	\N	\N
26784	INDIRECT	1	\N	\N	26619	4751	26783	t
26785	INDIRECT	1	26419	\N	\N	4751	26783	t
26786	INDIRECT	1	\N	\N	26620	4751	26783	t
26787	INDIRECT	1	26420	\N	\N	4751	26783	t
26788	INDIRECT	1	\N	\N	26621	4751	26783	t
26789	INDIRECT	1	26421	\N	\N	4751	26783	t
26790	INDIRECT	1	\N	\N	26622	4751	26783	t
26791	INDIRECT	1	26422	\N	\N	4751	26783	t
26792	DIRECT	1	\N	\N	26623	4747	\N	\N
26793	INDIRECT	1	\N	\N	26624	4747	26792	t
26794	INDIRECT	1	26423	\N	\N	4747	26792	t
26795	INDIRECT	1	\N	\N	26625	4747	26792	t
26796	INDIRECT	1	26424	\N	\N	4747	26792	t
5798	DIRECT	20	\N	4980	\N	4751	\N	\N
5799	INDIRECT	14	5272	\N	\N	4751	5798	t
5800	DIRECT	20	\N	4981	\N	4747	\N	\N
5801	INDIRECT	15	5273	\N	\N	4747	5800	t
5802	DIRECT	20	\N	4982	\N	4747	\N	\N
31613	DIRECT	5	\N	25948	\N	4751	\N	\N
31614	INDIRECT	5	26458	\N	\N	4751	31613	t
31615	DIRECT	5	\N	25949	\N	4747	\N	\N
31617	INDIRECT	5	26460	\N	\N	4747	31615	t
31616	INDIRECT	5	26459	\N	\N	4747	31615	t
31618	DIRECT	5	\N	25950	\N	4747	\N	\N
31619	INDIRECT	6	26461	\N	\N	4747	31618	t
31620	DIRECT	5	\N	25951	\N	4751	\N	\N
31621	INDIRECT	5	31714	\N	\N	4751	31620	t
31622	DIRECT	5	\N	25952	\N	4751	\N	\N
31623	INDIRECT	5	\N	25953	\N	4751	31622	t
31631	DIRECT	5	\N	31815	\N	4747	\N	\N
43774	DIRECT	2	\N	43501	\N	4747	\N	\N
43776	DIRECT	2	\N	43502	\N	4751	\N	\N
43777	INDIRECT	2	43397	\N	\N	4751	43776	t
43778	DIRECT	2	\N	43503	\N	510	\N	\N
43779	INDIRECT	2	43398	\N	\N	510	43778	t
43780	DIRECT	2	\N	43505	\N	4747	\N	\N
43781	INDIRECT	2	43399	\N	\N	4747	43780	t
43782	DIRECT	2	\N	43506	\N	4751	\N	\N
43783	INDIRECT	2	43400	\N	\N	4751	43782	t
43784	DIRECT	2	\N	43507	\N	4751	\N	\N
43785	INDIRECT	2	43401	\N	\N	4751	43784	t
43775	INDIRECT	3	43396	\N	\N	4747	43774	t
47513	INDIRECT	1	47693	\N	\N	4747	47512	t
47506	DIRECT	1	\N	\N	47394	4747	\N	\N
47507	INDIRECT	1	47690	\N	\N	4747	47506	t
47508	DIRECT	1	\N	\N	47395	4751	\N	\N
47509	INDIRECT	1	47691	\N	\N	4751	47508	t
47510	DIRECT	1	\N	\N	47396	510	\N	\N
47511	INDIRECT	1	47692	\N	\N	510	47510	t
47512	DIRECT	1	\N	\N	47398	4747	\N	\N
47514	DIRECT	1	\N	\N	47399	4751	\N	\N
47515	INDIRECT	1	47694	\N	\N	4751	47514	t
47516	DIRECT	1	\N	\N	47400	4751	\N	\N
47517	INDIRECT	1	47695	\N	\N	4751	47516	t
43312	INDIRECT	14	43367	\N	\N	4751	43311	t
57137	DIRECT	2	\N	56801	\N	4747	\N	\N
57138	INDIRECT	2	57202	\N	\N	4747	57137	t
57139	DIRECT	2	\N	56802	\N	4751	\N	\N
57140	INDIRECT	2	57203	\N	\N	4751	57139	t
57144	DIRECT	1	\N	\N	57484	4751	\N	\N
57101	DIRECT	2	\N	56787	\N	4747	\N	\N
57102	INDIRECT	2	57184	\N	\N	4747	57101	t
57103	DIRECT	2	\N	56788	\N	4751	\N	\N
57105	DIRECT	2	\N	56789	\N	510	\N	\N
57106	INDIRECT	2	57186	\N	\N	510	57105	t
57107	DIRECT	2	\N	56791	\N	4747	\N	\N
57108	INDIRECT	2	57187	\N	\N	4747	57107	t
57109	DIRECT	2	\N	56792	\N	4751	\N	\N
57110	INDIRECT	2	57188	\N	\N	4751	57109	t
57111	DIRECT	2	\N	56793	\N	4751	\N	\N
57125	DIRECT	1	\N	\N	57479	4747	\N	\N
57126	INDIRECT	1	57196	\N	\N	4747	57125	t
57127	DIRECT	1	\N	\N	57480	4751	\N	\N
57128	INDIRECT	1	57197	\N	\N	4751	57127	t
14960	INDIRECT	10	9106	\N	\N	4747	5800	t
5803	INDIRECT	15	5274	\N	\N	4747	5802	t
5804	DIRECT	20	\N	4983	\N	4751	\N	\N
5805	INDIRECT	12	5275	\N	\N	4751	5804	t
5806	DIRECT	20	\N	4984	\N	4751	\N	\N
5807	INDIRECT	20	\N	4985	\N	4751	5806	t
5808	INDIRECT	13	5276	\N	\N	4751	5806	t
5809	INDIRECT	20	\N	4986	\N	4751	5806	t
5810	INDIRECT	12	5277	\N	\N	4751	5806	t
5811	INDIRECT	20	\N	4987	\N	4751	5806	t
5812	INDIRECT	11	5278	\N	\N	4751	5806	t
5813	INDIRECT	20	\N	4988	\N	4751	5806	t
5814	INDIRECT	11	5279	\N	\N	4751	5806	t
5815	DIRECT	20	\N	4989	\N	4747	\N	\N
5816	INDIRECT	20	\N	4990	\N	4747	5815	t
5817	INDIRECT	16	5280	\N	\N	4747	5815	t
5818	INDIRECT	20	\N	4991	\N	4747	5815	t
5819	INDIRECT	16	5281	\N	\N	4747	5815	t
58313	DIRECT	3	\N	57999	\N	4747	\N	\N
58315	DIRECT	3	\N	58000	\N	4751	\N	\N
58317	DIRECT	3	\N	58001	\N	510	\N	\N
58318	INDIRECT	3	58398	\N	\N	510	58317	t
58319	DIRECT	3	\N	58003	\N	4747	\N	\N
58320	INDIRECT	3	58399	\N	\N	4747	58319	t
58321	DIRECT	3	\N	58004	\N	4751	\N	\N
58322	INDIRECT	3	58400	\N	\N	4751	58321	t
58323	DIRECT	3	\N	58005	\N	4751	\N	\N
58324	INDIRECT	3	58401	\N	\N	4751	58323	t
26262	DIRECT	11	\N	25897	\N	4747	\N	\N
26264	DIRECT	11	\N	25898	\N	4751	\N	\N
26265	INDIRECT	10	26363	\N	\N	4751	26264	t
26266	DIRECT	11	\N	25899	\N	510	\N	\N
26267	INDIRECT	10	26364	\N	\N	510	26266	t
26268	DIRECT	11	\N	25901	\N	4747	\N	\N
26269	INDIRECT	8	26365	\N	\N	4747	26268	t
26270	DIRECT	11	\N	25902	\N	4751	\N	\N
26271	INDIRECT	8	26366	\N	\N	4751	26270	t
26272	DIRECT	11	\N	25903	\N	4751	\N	\N
26273	INDIRECT	8	26367	\N	\N	4751	26272	t
31624	INDIRECT	5	31715	\N	\N	4751	31622	t
31625	INDIRECT	5	\N	25954	\N	4751	31622	t
31626	INDIRECT	5	31716	\N	\N	4751	31622	t
31627	INDIRECT	5	\N	25955	\N	4751	31622	t
31628	INDIRECT	5	31717	\N	\N	4751	31622	t
57104	INDIRECT	3	57185	\N	\N	4751	57103	t
57112	INDIRECT	3	57189	\N	\N	4751	57111	t
58314	INDIRECT	4	58396	\N	\N	4747	58313	t
31629	INDIRECT	5	\N	25956	\N	4751	31622	t
31630	INDIRECT	5	31718	\N	\N	4751	31622	t
31632	INDIRECT	5	\N	31816	\N	4747	31631	t
31633	INDIRECT	5	31719	\N	\N	4747	31631	t
31634	INDIRECT	5	\N	31817	\N	4747	31631	t
31635	INDIRECT	5	31720	\N	\N	4747	31631	t
58316	INDIRECT	4	58397	\N	\N	4751	58315	t
43311	DIRECT	13	\N	43464	\N	4751	\N	\N
43313	DIRECT	13	\N	43465	\N	4747	\N	\N
43315	INDIRECT	13	43369	\N	\N	4747	43313	t
43314	INDIRECT	13	43368	\N	\N	4747	43313	t
43316	DIRECT	13	\N	43466	\N	4747	\N	\N
43317	INDIRECT	11	43370	\N	\N	4747	43316	t
43318	DIRECT	13	\N	43467	\N	4751	\N	\N
43319	INDIRECT	11	43371	\N	\N	4751	43318	t
43320	DIRECT	13	\N	43468	\N	4751	\N	\N
43321	INDIRECT	13	\N	43469	\N	4751	43320	t
43323	INDIRECT	13	\N	43470	\N	4751	43320	t
43324	INDIRECT	11	43373	\N	\N	4751	43320	t
43325	INDIRECT	13	\N	43471	\N	4751	43320	t
43326	INDIRECT	11	43374	\N	\N	4751	43320	t
43327	INDIRECT	13	\N	43472	\N	4751	43320	t
43328	INDIRECT	11	43375	\N	\N	4751	43320	t
43322	INDIRECT	12	43372	\N	\N	4751	43320	t
23089	DIRECT	13	\N	22339	\N	4747	\N	\N
43733	DIRECT	13	\N	43473	\N	4747	\N	\N
43734	INDIRECT	13	\N	43474	\N	4747	43733	t
43735	INDIRECT	11	43376	\N	\N	4747	43733	t
43736	INDIRECT	13	\N	43475	\N	4747	43733	t
43737	INDIRECT	11	43377	\N	\N	4747	43733	t
57147	DIRECT	8	\N	56805	\N	4751	\N	\N
26263	INDIRECT	12	26362	\N	\N	4747	26262	t
23090	INDIRECT	10	22636	\N	\N	4747	23089	t
23091	DIRECT	13	\N	22340	\N	4751	\N	\N
23092	INDIRECT	9	22637	\N	\N	4751	23091	t
23107	DIRECT	10	\N	22341	\N	510	\N	\N
23114	INDIRECT	7	22638	\N	\N	510	23107	t
23095	DIRECT	13	\N	22343	\N	4747	\N	\N
23096	INDIRECT	9	22639	\N	\N	4747	23095	t
23097	DIRECT	13	\N	22344	\N	4751	\N	\N
23098	INDIRECT	9	22640	\N	\N	4751	23097	t
23099	DIRECT	13	\N	22345	\N	4751	\N	\N
23100	INDIRECT	7	22641	\N	\N	4751	23099	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2626	2	c0c879d6-1d67-4262-bccd-698d8a6cc04c	2010-06-13 00:00:00	\N	f	510	1216
2627	1	df020c7d-8a9b-407d-8cd0-e2dd81da7463	2010-06-13 12:42:41.932	\N	f	510	1220
4848	1	79097724-5c5c-449c-9402-65968bd4213f	2010-06-14 12:56:07.532	\N	f	4747	4344
4849	1	c64b2471-fe3a-4948-ae4e-4b007ba35c0b	2010-06-14 12:57:11.852	\N	f	4747	4348
4850	1	9f966399-4383-4e12-96f5-5fbaf1570188	2010-06-14 00:00:00	\N	f	4747	4350
4851	1	a387e54a-5903-4821-b768-03bb230cdb70	2010-06-14 12:57:53.247	\N	f	4751	4352
4852	2	3ce6d0f5-c10f-4c6f-8ae0-8544173599a5	2010-06-14 00:00:00	\N	f	4751	4354
4853	1	71712208-998e-42c0-8f9a-b08849f3ef9c	2010-06-14 00:00:00	\N	f	4747	4358
22220	1	2caf2d13-f23c-4f60-beaa-ee2e494d6044	2010-06-14 18:08:20.558	2010-07-14 00:00:00	f	4747	21817
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
131072	15	3d1358b7-eb8e-40bc-8c3b-f6cca7f89b68	LEAVE	Leave	f	f	t	f	1
131076	5	2bb2ac50-d133-4a65-94b6-781aaea01195	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
131077	1	a25159a6-5ec3-43b8-a423-f7aa6723e237	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
131078	1	9c3603cb-62fb-469c-a2c9-8c856e923a9a	Tipo de maquina	Este criterio faise para clasificar os distintos tipos de maquinas	t	f	t	t	2
131074	10	2b1d47d1-5b13-4e5b-8ccf-874309111813	Formación	Training courses and labor training	t	t	t	f	1
131075	9	0a2fd812-e7d8-4774-9030-224bf0462ee5	Tipo de trabajo	Job	t	t	t	f	1
131073	12	ce41a9f3-76fd-4b87-a042-77615da665a5	Categoría profesional	Professional category	t	t	t	f	1
2424832	13	5632c9cf-046f-4141-8d7e-47ffb792cc24	CATEGORY	Professional category	t	t	t	f	1
2424833	11	414260c8-691a-4a87-927c-4ccc85569626	TRAINING	Training courses and labor training	t	t	t	f	1
2424834	9	0282320c-65cd-467d-abec-be8a4c1ce3a8	JOB	Job	t	t	t	f	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
44037	GENERIC_DAY	1	8	f	2010-06-25	4354	\N	42525	\N
44038	GENERIC_DAY	1	0	f	2010-06-26	4352	\N	42525	\N
44039	GENERIC_DAY	1	0	f	2010-07-05	4354	\N	42525	\N
44040	GENERIC_DAY	1	4	f	2010-06-28	4354	\N	42525	\N
31478	SPECIFIC_DAY	1	0	f	2010-07-04	4352	31212	\N	\N
31482	SPECIFIC_DAY	1	8	f	2010-07-02	4352	31212	\N	\N
31472	SPECIFIC_DAY	1	0	f	2010-07-25	4352	31212	\N	\N
31467	SPECIFIC_DAY	1	0	f	2010-07-17	4352	31212	\N	\N
31449	SPECIFIC_DAY	1	0	f	2010-06-19	4352	31212	\N	\N
31493	SPECIFIC_DAY	1	8	f	2010-07-20	4352	31212	\N	\N
31498	SPECIFIC_DAY	1	0	f	2010-07-24	4352	31212	\N	\N
31470	SPECIFIC_DAY	1	0	f	2010-06-27	4352	31212	\N	\N
31460	SPECIFIC_DAY	1	8	f	2010-07-26	4352	31212	\N	\N
31452	SPECIFIC_DAY	1	8	f	2010-07-07	4352	31212	\N	\N
31496	SPECIFIC_DAY	1	8	f	2010-07-14	4352	31212	\N	\N
31471	SPECIFIC_DAY	1	0	f	2010-08-01	4352	31212	\N	\N
31486	SPECIFIC_DAY	1	0	f	2010-07-31	4352	31212	\N	\N
31461	SPECIFIC_DAY	1	8	f	2010-07-06	4352	31212	\N	\N
31479	SPECIFIC_DAY	1	0	f	2010-07-10	4352	31212	\N	\N
44041	GENERIC_DAY	1	0	f	2010-07-18	4354	\N	42525	\N
44042	GENERIC_DAY	1	7	f	2010-06-21	4354	\N	42525	\N
44043	GENERIC_DAY	1	8	f	2010-06-23	4354	\N	42525	\N
44044	GENERIC_DAY	1	4	f	2010-06-30	4352	\N	42525	\N
44045	GENERIC_DAY	1	0	f	2010-07-11	4352	\N	42525	\N
44046	GENERIC_DAY	1	0	f	2010-06-19	4354	\N	42525	\N
45574	GENERIC_DAY	1	0	f	2010-09-26	4354	\N	42595	\N
45561	GENERIC_DAY	1	0	f	2010-08-28	4352	\N	42595	\N
45565	GENERIC_DAY	1	4	f	2010-09-29	4354	\N	42595	\N
45575	GENERIC_DAY	1	4	f	2010-09-06	4354	\N	42595	\N
45622	GENERIC_DAY	1	4	f	2010-09-14	4354	\N	42595	\N
45605	GENERIC_DAY	1	4	f	2010-09-20	4352	\N	42595	\N
45569	GENERIC_DAY	1	4	f	2010-09-16	4352	\N	42595	\N
45570	GENERIC_DAY	1	4	f	2010-09-24	4354	\N	42595	\N
45562	GENERIC_DAY	1	4	f	2010-09-13	4352	\N	42595	\N
45596	GENERIC_DAY	1	0	f	2010-08-29	4352	\N	42595	\N
45619	GENERIC_DAY	1	4	f	2010-09-17	4354	\N	42595	\N
45630	GENERIC_DAY	1	4	f	2010-09-22	4352	\N	42595	\N
45599	GENERIC_DAY	1	4	f	2010-09-28	4354	\N	42595	\N
45581	GENERIC_DAY	1	0	f	2010-09-12	4352	\N	42595	\N
2881	SPECIFIC_DAY	8	0	f	2010-06-26	1216	2729	\N	\N
2886	SPECIFIC_DAY	8	8	f	2010-06-22	1216	2729	\N	\N
45577	GENERIC_DAY	1	4	f	2010-09-27	4352	\N	42595	\N
45631	GENERIC_DAY	1	4	f	2010-09-02	4354	\N	42595	\N
45582	GENERIC_DAY	1	4	f	2010-08-25	4354	\N	42595	\N
45620	GENERIC_DAY	1	0	f	2010-09-11	4352	\N	42595	\N
45564	GENERIC_DAY	1	4	f	2010-08-26	4352	\N	42595	\N
45566	GENERIC_DAY	1	0	f	2010-09-25	4354	\N	42595	\N
45634	GENERIC_DAY	1	4	f	2010-09-21	4352	\N	42595	\N
45608	GENERIC_DAY	1	4	f	2010-08-25	4352	\N	42595	\N
45632	GENERIC_DAY	1	4	f	2010-09-03	4352	\N	42595	\N
45593	GENERIC_DAY	1	0	f	2010-09-25	4352	\N	42595	\N
45621	GENERIC_DAY	1	0	f	2010-09-19	4354	\N	42595	\N
45616	GENERIC_DAY	1	4	f	2010-09-01	4352	\N	42595	\N
45578	GENERIC_DAY	1	0	f	2010-09-18	4354	\N	42595	\N
45567	GENERIC_DAY	1	0	f	2010-09-04	4352	\N	42595	\N
45568	GENERIC_DAY	1	4	f	2010-09-17	4352	\N	42595	\N
45590	GENERIC_DAY	1	4	f	2010-09-24	4352	\N	42595	\N
45609	GENERIC_DAY	1	4	f	2010-09-03	4354	\N	42595	\N
45611	GENERIC_DAY	1	4	f	2010-08-31	4352	\N	42595	\N
45629	GENERIC_DAY	1	0	f	2010-08-28	4354	\N	42595	\N
45589	GENERIC_DAY	1	4	f	2010-09-27	4354	\N	42595	\N
45624	GENERIC_DAY	1	4	f	2010-08-27	4352	\N	42595	\N
45627	GENERIC_DAY	1	4	f	2010-09-07	4354	\N	42595	\N
45586	GENERIC_DAY	1	4	f	2010-09-23	4352	\N	42595	\N
45602	GENERIC_DAY	1	4	f	2010-08-30	4354	\N	42595	\N
45584	GENERIC_DAY	1	4	f	2010-09-21	4354	\N	42595	\N
45580	GENERIC_DAY	1	4	f	2010-09-23	4354	\N	42595	\N
45598	GENERIC_DAY	1	4	f	2010-09-10	4354	\N	42595	\N
45610	GENERIC_DAY	1	0	f	2010-09-04	4354	\N	42595	\N
45623	GENERIC_DAY	1	4	f	2010-09-16	4354	\N	42595	\N
45585	GENERIC_DAY	1	4	f	2010-09-09	4354	\N	42595	\N
45583	GENERIC_DAY	1	4	f	2010-08-31	4354	\N	42595	\N
45571	GENERIC_DAY	1	4	f	2010-09-10	4352	\N	42595	\N
45579	GENERIC_DAY	1	1	f	2010-09-30	4354	\N	42595	\N
45591	GENERIC_DAY	1	0	f	2010-08-29	4354	\N	42595	\N
45604	GENERIC_DAY	1	4	f	2010-08-30	4352	\N	42595	\N
45573	GENERIC_DAY	1	4	f	2010-09-13	4354	\N	42595	\N
45572	GENERIC_DAY	1	4	f	2010-09-15	4352	\N	42595	\N
45612	GENERIC_DAY	1	0	f	2010-09-05	4354	\N	42595	\N
45594	GENERIC_DAY	1	0	f	2010-09-19	4352	\N	42595	\N
45613	GENERIC_DAY	1	4	f	2010-09-06	4352	\N	42595	\N
45576	GENERIC_DAY	1	4	f	2010-09-01	4354	\N	42595	\N
45607	GENERIC_DAY	1	4	f	2010-09-28	4352	\N	42595	\N
45633	GENERIC_DAY	1	4	f	2010-09-02	4352	\N	42595	\N
45603	GENERIC_DAY	1	4	f	2010-09-07	4352	\N	42595	\N
45563	GENERIC_DAY	1	4	f	2010-09-29	4352	\N	42595	\N
266583	GENERIC_DAY	0	4	f	2010-11-30	4354	\N	265654	\N
266584	GENERIC_DAY	0	4	f	2010-12-08	4352	\N	265654	\N
266585	GENERIC_DAY	0	4	f	2010-12-03	4352	\N	265654	\N
266586	GENERIC_DAY	0	4	f	2010-12-03	4354	\N	265654	\N
266587	GENERIC_DAY	0	4	f	2010-12-07	4354	\N	265654	\N
266588	GENERIC_DAY	0	4	f	2010-11-29	4352	\N	265654	\N
266589	GENERIC_DAY	0	2	f	2010-12-10	4354	\N	265654	\N
266590	GENERIC_DAY	0	0	f	2010-12-05	4354	\N	265654	\N
266591	GENERIC_DAY	0	0	f	2010-11-27	4352	\N	265654	\N
266592	GENERIC_DAY	0	4	f	2010-12-01	4354	\N	265654	\N
266593	GENERIC_DAY	0	2	f	2010-12-10	4352	\N	265654	\N
266594	GENERIC_DAY	0	4	f	2010-11-24	4354	\N	265654	\N
266595	GENERIC_DAY	0	4	f	2010-11-25	4352	\N	265654	\N
266596	GENERIC_DAY	0	4	f	2010-12-06	4352	\N	265654	\N
266597	GENERIC_DAY	0	4	f	2010-12-09	4354	\N	265654	\N
266598	GENERIC_DAY	0	4	f	2010-11-26	4352	\N	265654	\N
266599	GENERIC_DAY	0	0	f	2010-11-28	4354	\N	265654	\N
266600	GENERIC_DAY	0	4	f	2010-11-30	4352	\N	265654	\N
266601	GENERIC_DAY	0	0	f	2010-12-04	4354	\N	265654	\N
266602	GENERIC_DAY	0	0	f	2010-12-04	4352	\N	265654	\N
266603	GENERIC_DAY	0	4	f	2010-12-02	4352	\N	265654	\N
266604	GENERIC_DAY	0	4	f	2010-11-25	4354	\N	265654	\N
266605	GENERIC_DAY	0	4	f	2010-12-01	4352	\N	265654	\N
266606	GENERIC_DAY	0	4	f	2010-11-29	4354	\N	265654	\N
266607	GENERIC_DAY	0	4	f	2010-12-06	4354	\N	265654	\N
266608	GENERIC_DAY	0	4	f	2010-11-24	4352	\N	265654	\N
266609	GENERIC_DAY	0	4	f	2010-12-02	4354	\N	265654	\N
266610	GENERIC_DAY	0	4	f	2010-11-26	4354	\N	265654	\N
266611	GENERIC_DAY	0	0	f	2010-11-27	4354	\N	265654	\N
266612	GENERIC_DAY	0	0	f	2010-12-05	4352	\N	265654	\N
266613	GENERIC_DAY	0	4	f	2010-12-09	4352	\N	265654	\N
266614	GENERIC_DAY	0	0	f	2010-11-28	4352	\N	265654	\N
266615	GENERIC_DAY	0	4	f	2010-12-08	4354	\N	265654	\N
266616	GENERIC_DAY	0	4	f	2010-12-07	4352	\N	265654	\N
37286	GENERIC_DAY	1	4	f	2010-10-11	4352	\N	27139	\N
37290	GENERIC_DAY	1	4	f	2010-09-22	4354	\N	27139	\N
37288	GENERIC_DAY	1	0	f	2010-09-26	4352	\N	27139	\N
37289	GENERIC_DAY	1	4	f	2010-09-16	4354	\N	27139	\N
37285	GENERIC_DAY	1	4	f	2010-09-20	4352	\N	27139	\N
37287	GENERIC_DAY	1	4	f	2010-09-27	4354	\N	27139	\N
13248	SPECIFIC_DAY	2	8	f	2010-06-29	4350	8082	\N	\N
13241	SPECIFIC_DAY	2	0	f	2010-06-26	4350	8082	\N	\N
13243	SPECIFIC_DAY	2	8	f	2010-07-05	4350	8082	\N	\N
13251	SPECIFIC_DAY	2	0	f	2010-06-20	4350	8082	\N	\N
13236	SPECIFIC_DAY	2	8	f	2010-06-24	4350	8082	\N	\N
13246	SPECIFIC_DAY	2	6	f	2010-07-08	4350	8082	\N	\N
13250	SPECIFIC_DAY	2	8	f	2010-06-21	4350	8082	\N	\N
13233	SPECIFIC_DAY	2	8	f	2010-07-07	4350	8082	\N	\N
13242	SPECIFIC_DAY	2	8	f	2010-07-06	4350	8082	\N	\N
13232	SPECIFIC_DAY	2	8	f	2010-06-28	4350	8082	\N	\N
13247	SPECIFIC_DAY	2	0	f	2010-07-03	4350	8082	\N	\N
13244	SPECIFIC_DAY	2	0	f	2010-06-27	4350	8082	\N	\N
13249	SPECIFIC_DAY	2	8	f	2010-06-17	4350	8082	\N	\N
13239	SPECIFIC_DAY	2	8	f	2010-07-02	4350	8082	\N	\N
13234	SPECIFIC_DAY	2	8	f	2010-06-18	4350	8082	\N	\N
13245	SPECIFIC_DAY	2	8	f	2010-06-23	4350	8082	\N	\N
13252	SPECIFIC_DAY	2	8	f	2010-06-15	4350	8082	\N	\N
13238	SPECIFIC_DAY	2	8	f	2010-06-22	4350	8082	\N	\N
13237	SPECIFIC_DAY	2	8	f	2010-06-25	4350	8082	\N	\N
13235	SPECIFIC_DAY	2	0	f	2010-06-19	4350	8082	\N	\N
13240	SPECIFIC_DAY	2	8	f	2010-07-01	4350	8082	\N	\N
13229	SPECIFIC_DAY	2	8	f	2010-06-16	4350	8082	\N	\N
13230	SPECIFIC_DAY	2	0	f	2010-07-04	4350	8082	\N	\N
13231	SPECIFIC_DAY	2	8	f	2010-06-14	4350	8082	\N	\N
44047	GENERIC_DAY	1	0	f	2010-07-21	4354	\N	42525	\N
44048	GENERIC_DAY	1	0	f	2010-07-12	4354	\N	42525	\N
44049	GENERIC_DAY	1	0	f	2010-06-27	4352	\N	42525	\N
44050	GENERIC_DAY	1	8	f	2010-07-01	4352	\N	42525	\N
44051	GENERIC_DAY	1	0	f	2010-07-10	4352	\N	42525	\N
44052	GENERIC_DAY	1	4	f	2010-06-30	4354	\N	42525	\N
44053	GENERIC_DAY	1	0	f	2010-07-11	4354	\N	42525	\N
44054	GENERIC_DAY	1	0	f	2010-06-20	4354	\N	42525	\N
44055	GENERIC_DAY	1	1	f	2010-06-17	4352	\N	42525	\N
44056	GENERIC_DAY	1	0	f	2010-07-03	4354	\N	42525	\N
44057	GENERIC_DAY	1	7	f	2010-06-18	4354	\N	42525	\N
44058	GENERIC_DAY	1	1	f	2010-06-15	4352	\N	42525	\N
44059	GENERIC_DAY	1	0	f	2010-07-04	4354	\N	42525	\N
44060	GENERIC_DAY	1	0	f	2010-07-02	4354	\N	42525	\N
44061	GENERIC_DAY	1	8	f	2010-07-02	4352	\N	42525	\N
44062	GENERIC_DAY	1	0	f	2010-07-14	4354	\N	42525	\N
44063	GENERIC_DAY	1	7	f	2010-06-15	4354	\N	42525	\N
44064	GENERIC_DAY	1	8	f	2010-07-19	4352	\N	42525	\N
44065	GENERIC_DAY	1	0	f	2010-07-01	4354	\N	42525	\N
44066	GENERIC_DAY	1	8	f	2010-06-24	4354	\N	42525	\N
44067	GENERIC_DAY	1	0	f	2010-06-23	4352	\N	42525	\N
44068	GENERIC_DAY	1	8	f	2010-07-08	4352	\N	42525	\N
44069	GENERIC_DAY	1	7	f	2010-06-16	4354	\N	42525	\N
44070	GENERIC_DAY	1	0	f	2010-07-08	4354	\N	42525	\N
44071	GENERIC_DAY	1	8	f	2010-06-22	4354	\N	42525	\N
44072	GENERIC_DAY	1	8	f	2010-07-13	4352	\N	42525	\N
44073	GENERIC_DAY	1	8	f	2010-07-06	4352	\N	42525	\N
44074	GENERIC_DAY	1	8	f	2010-07-15	4352	\N	42525	\N
44075	GENERIC_DAY	1	8	f	2010-07-20	4352	\N	42525	\N
44076	GENERIC_DAY	1	0	f	2010-07-10	4354	\N	42525	\N
44077	GENERIC_DAY	1	0	f	2010-07-16	4354	\N	42525	\N
44078	GENERIC_DAY	1	8	f	2010-07-12	4352	\N	42525	\N
44079	GENERIC_DAY	1	8	f	2010-07-07	4352	\N	42525	\N
44080	GENERIC_DAY	1	0	f	2010-06-25	4352	\N	42525	\N
44081	GENERIC_DAY	1	0	f	2010-07-03	4352	\N	42525	\N
44082	GENERIC_DAY	1	1	f	2010-06-16	4352	\N	42525	\N
44083	GENERIC_DAY	1	1	f	2010-06-21	4352	\N	42525	\N
44084	GENERIC_DAY	1	0	f	2010-07-15	4354	\N	42525	\N
44085	GENERIC_DAY	1	4	f	2010-06-29	4352	\N	42525	\N
44086	GENERIC_DAY	1	0	f	2010-07-09	4354	\N	42525	\N
44087	GENERIC_DAY	1	4	f	2010-06-28	4352	\N	42525	\N
44088	GENERIC_DAY	1	0	f	2010-07-19	4354	\N	42525	\N
44089	GENERIC_DAY	1	0	f	2010-06-26	4354	\N	42525	\N
44090	GENERIC_DAY	1	0	f	2010-07-06	4354	\N	42525	\N
44091	GENERIC_DAY	1	0	f	2010-06-20	4352	\N	42525	\N
44092	GENERIC_DAY	1	0	f	2010-07-17	4354	\N	42525	\N
44093	GENERIC_DAY	1	0	f	2010-07-18	4352	\N	42525	\N
44094	GENERIC_DAY	1	0	f	2010-07-07	4354	\N	42525	\N
44095	GENERIC_DAY	1	1	f	2010-06-18	4352	\N	42525	\N
44096	GENERIC_DAY	1	8	f	2010-07-14	4352	\N	42525	\N
44097	GENERIC_DAY	1	0	f	2010-06-24	4352	\N	42525	\N
44098	GENERIC_DAY	1	0	f	2010-06-19	4352	\N	42525	\N
44099	GENERIC_DAY	1	8	f	2010-07-05	4352	\N	42525	\N
44100	GENERIC_DAY	1	7	f	2010-06-17	4354	\N	42525	\N
44101	GENERIC_DAY	1	0	f	2010-06-27	4354	\N	42525	\N
44102	GENERIC_DAY	1	8	f	2010-07-16	4352	\N	42525	\N
44103	GENERIC_DAY	1	4	f	2010-06-29	4354	\N	42525	\N
44104	GENERIC_DAY	1	0	f	2010-07-13	4354	\N	42525	\N
44105	GENERIC_DAY	1	0	f	2010-07-20	4354	\N	42525	\N
44106	GENERIC_DAY	1	8	f	2010-07-09	4352	\N	42525	\N
44107	GENERIC_DAY	1	2	f	2010-07-21	4352	\N	42525	\N
44108	GENERIC_DAY	1	0	f	2010-07-17	4352	\N	42525	\N
44109	GENERIC_DAY	1	0	f	2010-07-04	4352	\N	42525	\N
44110	GENERIC_DAY	1	0	f	2010-06-22	4352	\N	42525	\N
44435	GENERIC_DAY	0	2	f	2010-07-29	4350	\N	42529	\N
44436	GENERIC_DAY	0	0	f	2010-07-31	4358	\N	42529	\N
44437	GENERIC_DAY	0	0	f	2010-08-14	4350	\N	42529	\N
44438	GENERIC_DAY	0	2	f	2010-07-30	4358	\N	42529	\N
44439	GENERIC_DAY	0	2	f	2010-08-09	4350	\N	42529	\N
44440	GENERIC_DAY	0	0	f	2010-07-25	4350	\N	42529	\N
44441	GENERIC_DAY	0	2	f	2010-08-06	4344	\N	42529	\N
44442	GENERIC_DAY	0	0	f	2010-08-08	4350	\N	42529	\N
44443	GENERIC_DAY	0	2	f	2010-08-02	4344	\N	42529	\N
44444	GENERIC_DAY	0	0	f	2010-08-14	4348	\N	42529	\N
44445	GENERIC_DAY	0	0	f	2010-08-15	4350	\N	42529	\N
44446	GENERIC_DAY	0	2	f	2010-08-05	4350	\N	42529	\N
44447	GENERIC_DAY	0	2	f	2010-08-06	4348	\N	42529	\N
44448	GENERIC_DAY	0	2	f	2010-08-11	4358	\N	42529	\N
44449	GENERIC_DAY	0	0	f	2010-07-25	4344	\N	42529	\N
44450	GENERIC_DAY	0	0	f	2010-08-14	4358	\N	42529	\N
44451	GENERIC_DAY	0	0	f	2010-08-15	4348	\N	42529	\N
44452	GENERIC_DAY	0	2	f	2010-08-13	4348	\N	42529	\N
44453	GENERIC_DAY	0	2	f	2010-08-16	4348	\N	42529	\N
44454	GENERIC_DAY	0	2	f	2010-08-04	4344	\N	42529	\N
44455	GENERIC_DAY	0	2	f	2010-08-10	4344	\N	42529	\N
44456	GENERIC_DAY	0	2	f	2010-07-30	4344	\N	42529	\N
44457	GENERIC_DAY	0	0	f	2010-08-01	4348	\N	42529	\N
44458	GENERIC_DAY	0	2	f	2010-08-10	4348	\N	42529	\N
44459	GENERIC_DAY	0	2	f	2010-07-26	4358	\N	42529	\N
44460	GENERIC_DAY	0	0	f	2010-08-15	4344	\N	42529	\N
44461	GENERIC_DAY	0	2	f	2010-08-13	4344	\N	42529	\N
44462	GENERIC_DAY	0	0	f	2010-08-01	4344	\N	42529	\N
44463	GENERIC_DAY	0	1	f	2010-08-17	4358	\N	42529	\N
44464	GENERIC_DAY	0	2	f	2010-07-27	4350	\N	42529	\N
44465	GENERIC_DAY	0	2	f	2010-08-05	4344	\N	42529	\N
44466	GENERIC_DAY	0	0	f	2010-08-15	4358	\N	42529	\N
44467	GENERIC_DAY	0	0	f	2010-08-07	4348	\N	42529	\N
44468	GENERIC_DAY	0	2	f	2010-07-27	4344	\N	42529	\N
44469	GENERIC_DAY	0	0	f	2010-08-07	4344	\N	42529	\N
44470	GENERIC_DAY	0	2	f	2010-08-03	4358	\N	42529	\N
44471	GENERIC_DAY	0	2	f	2010-07-27	4358	\N	42529	\N
44472	GENERIC_DAY	0	2	f	2010-07-22	4358	\N	42529	\N
44473	GENERIC_DAY	0	2	f	2010-08-16	4350	\N	42529	\N
44474	GENERIC_DAY	0	0	f	2010-07-24	4358	\N	42529	\N
44475	GENERIC_DAY	0	2	f	2010-07-30	4348	\N	42529	\N
44476	GENERIC_DAY	0	2	f	2010-07-23	4348	\N	42529	\N
44477	GENERIC_DAY	0	0	f	2010-07-24	4348	\N	42529	\N
44478	GENERIC_DAY	0	0	f	2010-08-07	4358	\N	42529	\N
44479	GENERIC_DAY	0	2	f	2010-07-29	4358	\N	42529	\N
44480	GENERIC_DAY	0	2	f	2010-08-11	4344	\N	42529	\N
44481	GENERIC_DAY	0	2	f	2010-08-09	4358	\N	42529	\N
44482	GENERIC_DAY	0	2	f	2010-08-09	4348	\N	42529	\N
44483	GENERIC_DAY	0	2	f	2010-07-29	4348	\N	42529	\N
44484	GENERIC_DAY	0	2	f	2010-08-13	4350	\N	42529	\N
44485	GENERIC_DAY	0	3	f	2010-07-28	4344	\N	42529	\N
44486	GENERIC_DAY	0	0	f	2010-07-31	4350	\N	42529	\N
44487	GENERIC_DAY	0	2	f	2010-08-10	4358	\N	42529	\N
44488	GENERIC_DAY	0	2	f	2010-08-11	4348	\N	42529	\N
44489	GENERIC_DAY	0	2	f	2010-07-28	4350	\N	42529	\N
44490	GENERIC_DAY	0	2	f	2010-08-12	4358	\N	42529	\N
44491	GENERIC_DAY	0	2	f	2010-08-05	4348	\N	42529	\N
44492	GENERIC_DAY	0	0	f	2010-07-24	4350	\N	42529	\N
44493	GENERIC_DAY	0	2	f	2010-07-29	4344	\N	42529	\N
44494	GENERIC_DAY	0	0	f	2010-08-08	4344	\N	42529	\N
44495	GENERIC_DAY	0	2	f	2010-08-09	4344	\N	42529	\N
44496	GENERIC_DAY	0	2	f	2010-07-23	4344	\N	42529	\N
44497	GENERIC_DAY	0	0	f	2010-08-14	4344	\N	42529	\N
44498	GENERIC_DAY	0	2	f	2010-08-02	4350	\N	42529	\N
44499	GENERIC_DAY	0	2	f	2010-08-05	4358	\N	42529	\N
44500	GENERIC_DAY	0	2	f	2010-08-03	4344	\N	42529	\N
44501	GENERIC_DAY	0	2	f	2010-07-26	4350	\N	42529	\N
44502	GENERIC_DAY	0	2	f	2010-08-04	4348	\N	42529	\N
44503	GENERIC_DAY	0	2	f	2010-07-26	4348	\N	42529	\N
44504	GENERIC_DAY	0	2	f	2010-08-04	4350	\N	42529	\N
44505	GENERIC_DAY	0	0	f	2010-07-31	4348	\N	42529	\N
44506	GENERIC_DAY	0	2	f	2010-08-10	4350	\N	42529	\N
44507	GENERIC_DAY	0	2	f	2010-08-03	4350	\N	42529	\N
44508	GENERIC_DAY	0	1	f	2010-07-28	4358	\N	42529	\N
44509	GENERIC_DAY	0	0	f	2010-08-01	4358	\N	42529	\N
44510	GENERIC_DAY	0	2	f	2010-08-17	4348	\N	42529	\N
44511	GENERIC_DAY	0	0	f	2010-07-31	4344	\N	42529	\N
44512	GENERIC_DAY	0	2	f	2010-08-12	4348	\N	42529	\N
44513	GENERIC_DAY	0	2	f	2010-08-12	4350	\N	42529	\N
44514	GENERIC_DAY	0	2	f	2010-07-27	4348	\N	42529	\N
44515	GENERIC_DAY	0	0	f	2010-07-25	4358	\N	42529	\N
44516	GENERIC_DAY	0	2	f	2010-07-28	4348	\N	42529	\N
44517	GENERIC_DAY	0	2	f	2010-07-23	4358	\N	42529	\N
44518	GENERIC_DAY	0	2	f	2010-08-12	4344	\N	42529	\N
44519	GENERIC_DAY	0	0	f	2010-08-01	4350	\N	42529	\N
44520	GENERIC_DAY	0	2	f	2010-08-16	4344	\N	42529	\N
44521	GENERIC_DAY	0	2	f	2010-07-23	4350	\N	42529	\N
44522	GENERIC_DAY	0	2	f	2010-08-16	4358	\N	42529	\N
44523	GENERIC_DAY	0	2	f	2010-08-17	4344	\N	42529	\N
44524	GENERIC_DAY	0	2	f	2010-07-22	4344	\N	42529	\N
44525	GENERIC_DAY	0	2	f	2010-08-02	4348	\N	42529	\N
44526	GENERIC_DAY	0	0	f	2010-08-08	4348	\N	42529	\N
44527	GENERIC_DAY	0	2	f	2010-08-11	4350	\N	42529	\N
44528	GENERIC_DAY	0	2	f	2010-07-22	4348	\N	42529	\N
44529	GENERIC_DAY	0	0	f	2010-08-08	4358	\N	42529	\N
44530	GENERIC_DAY	0	2	f	2010-08-06	4358	\N	42529	\N
44531	GENERIC_DAY	0	2	f	2010-08-13	4358	\N	42529	\N
44532	GENERIC_DAY	0	2	f	2010-08-06	4350	\N	42529	\N
44533	GENERIC_DAY	0	1	f	2010-08-17	4350	\N	42529	\N
44534	GENERIC_DAY	0	0	f	2010-07-25	4348	\N	42529	\N
44535	GENERIC_DAY	0	0	f	2010-07-24	4344	\N	42529	\N
44536	GENERIC_DAY	0	2	f	2010-08-03	4348	\N	42529	\N
44537	GENERIC_DAY	0	2	f	2010-08-02	4358	\N	42529	\N
44538	GENERIC_DAY	0	2	f	2010-07-26	4344	\N	42529	\N
44539	GENERIC_DAY	0	2	f	2010-08-04	4358	\N	42529	\N
44540	GENERIC_DAY	0	2	f	2010-07-30	4350	\N	42529	\N
44541	GENERIC_DAY	0	0	f	2010-08-07	4350	\N	42529	\N
44542	GENERIC_DAY	0	2	f	2010-07-22	4350	\N	42529	\N
44628	GENERIC_DAY	0	2	f	2010-06-17	4350	\N	42531	\N
44629	GENERIC_DAY	0	0	f	2010-06-26	4348	\N	42531	\N
44630	GENERIC_DAY	0	1	f	2010-06-17	21817	\N	42531	\N
44631	GENERIC_DAY	0	0	f	2010-06-26	4358	\N	42531	\N
44632	GENERIC_DAY	0	0	f	2010-06-20	4350	\N	42531	\N
44633	GENERIC_DAY	0	0	f	2010-06-27	4358	\N	42531	\N
44634	GENERIC_DAY	0	0	f	2010-06-27	21817	\N	42531	\N
44635	GENERIC_DAY	0	0	f	2010-06-27	4348	\N	42531	\N
44636	GENERIC_DAY	0	0	f	2010-06-19	4348	\N	42531	\N
44637	GENERIC_DAY	0	1	f	2010-06-15	4358	\N	42531	\N
44638	GENERIC_DAY	0	0	f	2010-06-26	4344	\N	42531	\N
44639	GENERIC_DAY	0	2	f	2010-06-25	4348	\N	42531	\N
44640	GENERIC_DAY	0	0	f	2010-06-24	4344	\N	42531	\N
44641	GENERIC_DAY	0	0	f	2010-06-25	4350	\N	42531	\N
44642	GENERIC_DAY	0	0	f	2010-06-20	4348	\N	42531	\N
44643	GENERIC_DAY	0	0	f	2010-06-26	21817	\N	42531	\N
44644	GENERIC_DAY	0	1	f	2010-06-30	4350	\N	42531	\N
44645	GENERIC_DAY	0	1	f	2010-06-16	21817	\N	42531	\N
44646	GENERIC_DAY	0	4	f	2010-06-24	21817	\N	42531	\N
44647	GENERIC_DAY	0	2	f	2010-06-16	4348	\N	42531	\N
44648	GENERIC_DAY	0	4	f	2010-06-30	4348	\N	42531	\N
44649	GENERIC_DAY	0	2	f	2010-06-29	4350	\N	42531	\N
44650	GENERIC_DAY	0	3	f	2010-06-29	4358	\N	42531	\N
44651	GENERIC_DAY	0	2	f	2010-06-17	4344	\N	42531	\N
44652	GENERIC_DAY	0	2	f	2010-06-21	4344	\N	42531	\N
44653	GENERIC_DAY	0	1	f	2010-06-16	4358	\N	42531	\N
44654	GENERIC_DAY	0	2	f	2010-06-16	4344	\N	42531	\N
44655	GENERIC_DAY	0	0	f	2010-06-27	4344	\N	42531	\N
44656	GENERIC_DAY	0	0	f	2010-06-19	4358	\N	42531	\N
44657	GENERIC_DAY	0	2	f	2010-06-24	4358	\N	42531	\N
44658	GENERIC_DAY	0	2	f	2010-06-15	4348	\N	42531	\N
44659	GENERIC_DAY	0	2	f	2010-06-18	4350	\N	42531	\N
44660	GENERIC_DAY	0	1	f	2010-07-01	4358	\N	42531	\N
44661	GENERIC_DAY	0	4	f	2010-06-25	21817	\N	42531	\N
44662	GENERIC_DAY	0	0	f	2010-07-01	4350	\N	42531	\N
44663	GENERIC_DAY	0	1	f	2010-06-30	4358	\N	42531	\N
44664	GENERIC_DAY	0	2	f	2010-06-18	4344	\N	42531	\N
44665	GENERIC_DAY	0	1	f	2010-06-30	21817	\N	42531	\N
44666	GENERIC_DAY	0	0	f	2010-06-23	4350	\N	42531	\N
44667	GENERIC_DAY	0	0	f	2010-06-27	4350	\N	42531	\N
44668	GENERIC_DAY	0	1	f	2010-07-01	4348	\N	42531	\N
44669	GENERIC_DAY	0	3	f	2010-06-28	4358	\N	42531	\N
44670	GENERIC_DAY	0	2	f	2010-07-01	21817	\N	42531	\N
44671	GENERIC_DAY	0	1	f	2010-06-29	4348	\N	42531	\N
44672	GENERIC_DAY	0	0	f	2010-06-20	21817	\N	42531	\N
44673	GENERIC_DAY	0	2	f	2010-06-15	4344	\N	42531	\N
44674	GENERIC_DAY	0	2	f	2010-06-18	4348	\N	42531	\N
44675	GENERIC_DAY	0	0	f	2010-06-23	4344	\N	42531	\N
44676	GENERIC_DAY	0	1	f	2010-06-22	4350	\N	42531	\N
44677	GENERIC_DAY	0	0	f	2010-06-19	21817	\N	42531	\N
37082	GENERIC_DAY	1	0	f	2010-10-31	4348	\N	27137	\N
37066	GENERIC_DAY	1	2	f	2010-10-27	4358	\N	27137	\N
37093	GENERIC_DAY	1	0	f	2010-10-17	4344	\N	27137	\N
37086	GENERIC_DAY	1	2	f	2010-11-04	4348	\N	27137	\N
37075	GENERIC_DAY	1	2	f	2010-10-27	4348	\N	27137	\N
37070	GENERIC_DAY	1	2	f	2010-11-02	4358	\N	27137	\N
37063	GENERIC_DAY	1	2	f	2010-10-14	4348	\N	27137	\N
37080	GENERIC_DAY	1	2	f	2010-10-21	4348	\N	27137	\N
46723	GENERIC_DAY	4	6	t	2010-06-18	1220	\N	45866	\N
46726	GENERIC_DAY	4	6	f	2010-06-29	1216	\N	45866	\N
46733	GENERIC_DAY	4	10	f	2010-07-01	1220	\N	45866	\N
46719	GENERIC_DAY	4	2	t	2010-06-21	1216	\N	45866	\N
46707	GENERIC_DAY	4	0	f	2010-06-26	1220	\N	45866	\N
46720	GENERIC_DAY	4	2	t	2010-06-15	1216	\N	45866	\N
46712	GENERIC_DAY	4	6	t	2010-06-21	1220	\N	45866	\N
46711	GENERIC_DAY	4	8	t	2010-06-24	1220	\N	45866	\N
44678	GENERIC_DAY	0	0	f	2010-06-25	4344	\N	42531	\N
44679	GENERIC_DAY	0	0	f	2010-06-24	4350	\N	42531	\N
44680	GENERIC_DAY	0	0	f	2010-06-19	4350	\N	42531	\N
44681	GENERIC_DAY	0	0	f	2010-06-19	4344	\N	42531	\N
44682	GENERIC_DAY	0	2	f	2010-06-15	4350	\N	42531	\N
44683	GENERIC_DAY	0	2	f	2010-06-29	4344	\N	42531	\N
44684	GENERIC_DAY	0	2	f	2010-06-28	4350	\N	42531	\N
44685	GENERIC_DAY	0	1	f	2010-06-28	4348	\N	42531	\N
44686	GENERIC_DAY	0	2	f	2010-06-17	4348	\N	42531	\N
44687	GENERIC_DAY	0	1	f	2010-06-21	4358	\N	42531	\N
44688	GENERIC_DAY	0	4	f	2010-06-23	21817	\N	42531	\N
44689	GENERIC_DAY	0	2	f	2010-06-28	4344	\N	42531	\N
44690	GENERIC_DAY	0	2	f	2010-06-21	4348	\N	42531	\N
44691	GENERIC_DAY	0	0	f	2010-06-20	4344	\N	42531	\N
44692	GENERIC_DAY	0	2	f	2010-06-21	4350	\N	42531	\N
44693	GENERIC_DAY	0	2	f	2010-06-16	4350	\N	42531	\N
44694	GENERIC_DAY	0	0	f	2010-06-29	21817	\N	42531	\N
44695	GENERIC_DAY	0	2	f	2010-06-25	4358	\N	42531	\N
44696	GENERIC_DAY	0	1	f	2010-06-21	21817	\N	42531	\N
44697	GENERIC_DAY	0	1	f	2010-06-17	4358	\N	42531	\N
44698	GENERIC_DAY	0	2	f	2010-06-22	4358	\N	42531	\N
44699	GENERIC_DAY	0	0	f	2010-07-01	4344	\N	42531	\N
44700	GENERIC_DAY	0	1	f	2010-06-15	21817	\N	42531	\N
44701	GENERIC_DAY	0	1	f	2010-06-18	4358	\N	42531	\N
44702	GENERIC_DAY	0	1	f	2010-06-18	21817	\N	42531	\N
44703	GENERIC_DAY	0	0	f	2010-06-22	4348	\N	42531	\N
44704	GENERIC_DAY	0	0	f	2010-06-26	4350	\N	42531	\N
44705	GENERIC_DAY	0	1	f	2010-06-30	4344	\N	42531	\N
44706	GENERIC_DAY	0	2	f	2010-06-23	4348	\N	42531	\N
44707	GENERIC_DAY	0	1	f	2010-06-22	4344	\N	42531	\N
44708	GENERIC_DAY	0	2	f	2010-06-24	4348	\N	42531	\N
44709	GENERIC_DAY	0	0	f	2010-06-28	21817	\N	42531	\N
44710	GENERIC_DAY	0	2	f	2010-06-23	4358	\N	42531	\N
44711	GENERIC_DAY	0	0	f	2010-06-20	4358	\N	42531	\N
44712	GENERIC_DAY	0	4	f	2010-06-22	21817	\N	42531	\N
37479	GENERIC_DAY	1	2	f	2010-09-15	4344	\N	27141	\N
37484	GENERIC_DAY	1	2	f	2010-09-13	4344	\N	27141	\N
37483	GENERIC_DAY	1	2	f	2010-09-15	4358	\N	27141	\N
37499	GENERIC_DAY	1	0	f	2010-09-18	4344	\N	27141	\N
37492	GENERIC_DAY	1	2	f	2010-09-23	4358	\N	27141	\N
37482	GENERIC_DAY	1	0	f	2010-09-19	4344	\N	27141	\N
37477	GENERIC_DAY	1	2	f	2010-09-20	4344	\N	27141	\N
37498	GENERIC_DAY	1	2	f	2010-09-21	4350	\N	27141	\N
37487	GENERIC_DAY	1	0	f	2010-09-11	4344	\N	27141	\N
37506	GENERIC_DAY	1	2	f	2010-09-15	4350	\N	27141	\N
37486	GENERIC_DAY	1	0	f	2010-09-19	4358	\N	27141	\N
37480	GENERIC_DAY	1	2	f	2010-09-09	4348	\N	27141	\N
37493	GENERIC_DAY	1	0	f	2010-09-11	4350	\N	27141	\N
37489	GENERIC_DAY	1	2	f	2010-09-22	4350	\N	27141	\N
37494	GENERIC_DAY	1	2	f	2010-09-20	4350	\N	27141	\N
37490	GENERIC_DAY	1	2	f	2010-09-13	4350	\N	27141	\N
37497	GENERIC_DAY	1	0	f	2010-09-19	4348	\N	27141	\N
37496	GENERIC_DAY	1	2	f	2010-09-08	4350	\N	27141	\N
37505	GENERIC_DAY	1	2	f	2010-09-10	4348	\N	27141	\N
37501	GENERIC_DAY	1	1	f	2010-09-24	4358	\N	27141	\N
37485	GENERIC_DAY	1	2	f	2010-09-13	4358	\N	27141	\N
37504	GENERIC_DAY	1	2	f	2010-09-10	4350	\N	27141	\N
37478	GENERIC_DAY	1	2	f	2010-09-23	4344	\N	27141	\N
37500	GENERIC_DAY	1	0	f	2010-09-18	4350	\N	27141	\N
37502	GENERIC_DAY	1	2	f	2010-09-22	4348	\N	27141	\N
37495	GENERIC_DAY	1	2	f	2010-09-08	4348	\N	27141	\N
37488	GENERIC_DAY	1	2	f	2010-09-21	4348	\N	27141	\N
37503	GENERIC_DAY	1	2	f	2010-09-10	4358	\N	27141	\N
37491	GENERIC_DAY	1	2	f	2010-09-17	4344	\N	27141	\N
37481	GENERIC_DAY	1	0	f	2010-09-12	4344	\N	27141	\N
37508	GENERIC_DAY	1	4	f	2010-10-08	4354	\N	27142	\N
37515	GENERIC_DAY	1	4	f	2010-10-14	4354	\N	27142	\N
37516	GENERIC_DAY	1	0	f	2010-10-10	4352	\N	27142	\N
37519	GENERIC_DAY	1	4	f	2010-10-19	4354	\N	27142	\N
37517	GENERIC_DAY	1	4	f	2010-11-01	4354	\N	27142	\N
37512	GENERIC_DAY	1	4	f	2010-10-07	4352	\N	27142	\N
37510	GENERIC_DAY	1	4	f	2010-10-18	4354	\N	27142	\N
37577	GENERIC_DAY	1	0	f	2010-10-30	4352	\N	27143	\N
37582	GENERIC_DAY	1	4	f	2010-10-29	4352	\N	27143	\N
37583	GENERIC_DAY	1	4	f	2010-10-26	4354	\N	27143	\N
37584	GENERIC_DAY	1	4	f	2010-10-28	4354	\N	27143	\N
37581	GENERIC_DAY	1	0	f	2010-10-31	4352	\N	27143	\N
37580	GENERIC_DAY	1	4	f	2010-10-22	4354	\N	27143	\N
37579	GENERIC_DAY	1	2	f	2010-11-02	4352	\N	27143	\N
37578	GENERIC_DAY	1	0	f	2010-10-24	4352	\N	27143	\N
37541	GENERIC_DAY	1	0	f	2010-11-07	4352	\N	27142	\N
37566	GENERIC_DAY	1	4	f	2010-11-08	4354	\N	27142	\N
37543	GENERIC_DAY	1	4	f	2010-10-13	4352	\N	27142	\N
37558	GENERIC_DAY	1	4	f	2010-10-22	4352	\N	27142	\N
37538	GENERIC_DAY	1	4	f	2010-10-13	4354	\N	27142	\N
37576	GENERIC_DAY	1	0	f	2010-10-10	4354	\N	27142	\N
37557	GENERIC_DAY	1	4	f	2010-10-29	4352	\N	27142	\N
37550	GENERIC_DAY	1	0	f	2010-10-17	4352	\N	27142	\N
37606	GENERIC_DAY	1	0	f	2010-10-30	4354	\N	27143	\N
37614	GENERIC_DAY	1	4	f	2010-11-01	4352	\N	27143	\N
37603	GENERIC_DAY	1	4	f	2010-10-20	4352	\N	27143	\N
37588	GENERIC_DAY	1	0	f	2010-10-17	4354	\N	27143	\N
37610	GENERIC_DAY	1	0	f	2010-10-31	4354	\N	27143	\N
37607	GENERIC_DAY	1	4	f	2010-10-15	4354	\N	27143	\N
37601	GENERIC_DAY	1	4	f	2010-10-21	4352	\N	27143	\N
37587	GENERIC_DAY	1	4	f	2010-10-28	4352	\N	27143	\N
37604	GENERIC_DAY	1	4	f	2010-10-18	4354	\N	27143	\N
37608	GENERIC_DAY	1	4	f	2010-10-15	4352	\N	27143	\N
37598	GENERIC_DAY	1	0	f	2010-10-16	4352	\N	27143	\N
37585	GENERIC_DAY	1	4	f	2010-10-22	4352	\N	27143	\N
37594	GENERIC_DAY	1	4	f	2010-10-19	4354	\N	27143	\N
37593	GENERIC_DAY	1	4	f	2010-10-21	4354	\N	27143	\N
37611	GENERIC_DAY	1	4	f	2010-10-27	4352	\N	27143	\N
37605	GENERIC_DAY	1	2	f	2010-11-02	4354	\N	27143	\N
37602	GENERIC_DAY	1	0	f	2010-10-16	4354	\N	27143	\N
37642	GENERIC_DAY	1	4	f	2010-10-11	4352	\N	27144	\N
37644	GENERIC_DAY	1	0	f	2010-09-26	4354	\N	27144	\N
37648	GENERIC_DAY	1	4	f	2010-10-19	4352	\N	27144	\N
37668	GENERIC_DAY	1	4	f	2010-10-07	4352	\N	27144	\N
37671	GENERIC_DAY	1	4	f	2010-10-07	4354	\N	27144	\N
37643	GENERIC_DAY	1	4	f	2010-09-27	4352	\N	27144	\N
37674	GENERIC_DAY	1	4	f	2010-10-04	4352	\N	27144	\N
37670	GENERIC_DAY	1	4	f	2010-09-29	4352	\N	27144	\N
37669	GENERIC_DAY	1	4	f	2010-10-21	4352	\N	27144	\N
37660	GENERIC_DAY	1	4	f	2010-10-22	4352	\N	27144	\N
37657	GENERIC_DAY	1	0	f	2010-10-09	4352	\N	27144	\N
37672	GENERIC_DAY	1	4	f	2010-10-14	4352	\N	27144	\N
37650	GENERIC_DAY	1	4	f	2010-10-25	4354	\N	27144	\N
37678	GENERIC_DAY	1	4	f	2010-09-27	4354	\N	27144	\N
37664	GENERIC_DAY	1	4	f	2010-10-06	4352	\N	27144	\N
37737	GENERIC_DAY	1	4	f	2010-10-08	4352	\N	27145	\N
37827	GENERIC_DAY	1	0	f	2010-12-19	4354	\N	27146	\N
37847	GENERIC_DAY	1	4	f	2011-01-10	4352	\N	27146	\N
37836	GENERIC_DAY	1	4	f	2010-11-15	4354	\N	27146	\N
37840	GENERIC_DAY	1	0	f	2010-12-18	4352	\N	27146	\N
37792	GENERIC_DAY	1	4	f	2011-01-12	4352	\N	27146	\N
37811	GENERIC_DAY	1	0	f	2011-01-08	4354	\N	27146	\N
37816	GENERIC_DAY	1	4	f	2010-12-20	4352	\N	27146	\N
37815	GENERIC_DAY	1	4	f	2010-11-18	4354	\N	27146	\N
37801	GENERIC_DAY	1	4	f	2010-11-18	4352	\N	27146	\N
37834	GENERIC_DAY	1	4	f	2010-11-24	4352	\N	27146	\N
37828	GENERIC_DAY	1	4	f	2010-12-31	4354	\N	27146	\N
37818	GENERIC_DAY	1	4	f	2010-12-09	4354	\N	27146	\N
37822	GENERIC_DAY	1	4	f	2010-12-02	4354	\N	27146	\N
37819	GENERIC_DAY	1	0	f	2010-11-28	4354	\N	27146	\N
37797	GENERIC_DAY	1	4	f	2010-11-29	4352	\N	27146	\N
37793	GENERIC_DAY	1	4	f	2010-11-10	4352	\N	27146	\N
37824	GENERIC_DAY	1	4	f	2010-11-12	4354	\N	27146	\N
37794	GENERIC_DAY	1	4	f	2010-12-24	4352	\N	27146	\N
37796	GENERIC_DAY	1	4	f	2010-11-15	4352	\N	27146	\N
37809	GENERIC_DAY	1	4	f	2010-12-13	4352	\N	27146	\N
73414	GENERIC_DAY	2	0	f	2010-06-27	1220	\N	59633	\N
73555	GENERIC_DAY	2	0	f	2010-06-19	4354	\N	59633	\N
73476	GENERIC_DAY	2	0	f	2010-06-25	1220	\N	59633	\N
44713	GENERIC_DAY	1	8	f	2010-07-14	4352	\N	42532	\N
44714	GENERIC_DAY	1	4	f	2010-06-28	4354	\N	42532	\N
44715	GENERIC_DAY	1	8	f	2010-06-23	4354	\N	42532	\N
44716	GENERIC_DAY	1	0	f	2010-06-20	4352	\N	42532	\N
44717	GENERIC_DAY	1	0	f	2010-07-03	4352	\N	42532	\N
44718	GENERIC_DAY	1	0	f	2010-06-23	4352	\N	42532	\N
44719	GENERIC_DAY	1	0	f	2010-07-18	4352	\N	42532	\N
44720	GENERIC_DAY	1	0	f	2010-06-26	4352	\N	42532	\N
44721	GENERIC_DAY	1	2	f	2010-07-21	4352	\N	42532	\N
44722	GENERIC_DAY	1	0	f	2010-07-21	4354	\N	42532	\N
44723	GENERIC_DAY	1	8	f	2010-07-16	4352	\N	42532	\N
44724	GENERIC_DAY	1	0	f	2010-06-22	4352	\N	42532	\N
44725	GENERIC_DAY	1	8	f	2010-07-20	4352	\N	42532	\N
44726	GENERIC_DAY	1	0	f	2010-07-07	4354	\N	42532	\N
44727	GENERIC_DAY	1	8	f	2010-07-06	4352	\N	42532	\N
44728	GENERIC_DAY	1	8	f	2010-07-01	4352	\N	42532	\N
44729	GENERIC_DAY	1	0	f	2010-07-09	4354	\N	42532	\N
44730	GENERIC_DAY	1	0	f	2010-07-18	4354	\N	42532	\N
44731	GENERIC_DAY	1	0	f	2010-07-01	4354	\N	42532	\N
44732	GENERIC_DAY	1	8	f	2010-06-24	4354	\N	42532	\N
44733	GENERIC_DAY	1	0	f	2010-07-20	4354	\N	42532	\N
44734	GENERIC_DAY	1	0	f	2010-07-15	4354	\N	42532	\N
44735	GENERIC_DAY	1	0	f	2010-06-27	4352	\N	42532	\N
44736	GENERIC_DAY	1	0	f	2010-07-10	4354	\N	42532	\N
44737	GENERIC_DAY	1	1	f	2010-06-18	4352	\N	42532	\N
44738	GENERIC_DAY	1	8	f	2010-07-08	4352	\N	42532	\N
44739	GENERIC_DAY	1	0	f	2010-07-04	4354	\N	42532	\N
44740	GENERIC_DAY	1	4	f	2010-06-28	4352	\N	42532	\N
44741	GENERIC_DAY	1	0	f	2010-07-03	4354	\N	42532	\N
44742	GENERIC_DAY	1	0	f	2010-06-19	4352	\N	42532	\N
44743	GENERIC_DAY	1	0	f	2010-07-12	4354	\N	42532	\N
44744	GENERIC_DAY	1	0	f	2010-07-02	4354	\N	42532	\N
44745	GENERIC_DAY	1	7	f	2010-06-17	4354	\N	42532	\N
44746	GENERIC_DAY	1	7	f	2010-06-15	4354	\N	42532	\N
44747	GENERIC_DAY	1	0	f	2010-07-08	4354	\N	42532	\N
44748	GENERIC_DAY	1	8	f	2010-07-09	4352	\N	42532	\N
44749	GENERIC_DAY	1	8	f	2010-06-22	4354	\N	42532	\N
44750	GENERIC_DAY	1	0	f	2010-07-14	4354	\N	42532	\N
44751	GENERIC_DAY	1	8	f	2010-07-12	4352	\N	42532	\N
73549	GENERIC_DAY	2	0	f	2010-06-16	21817	\N	59633	\N
73422	GENERIC_DAY	2	0	f	2010-06-20	21817	\N	59633	\N
73451	GENERIC_DAY	2	0	f	2010-06-25	4352	\N	59633	\N
73514	GENERIC_DAY	2	0	f	2010-06-28	1216	\N	59633	\N
73492	GENERIC_DAY	2	0	f	2010-06-29	4358	\N	59633	\N
73583	GENERIC_DAY	2	0	f	2010-06-19	4350	\N	59633	\N
73474	GENERIC_DAY	2	5	f	2010-06-22	4356	\N	59633	\N
73536	GENERIC_DAY	2	0	f	2010-06-25	4350	\N	59633	\N
73500	GENERIC_DAY	2	0	f	2010-06-15	4352	\N	59633	\N
73435	GENERIC_DAY	2	0	f	2010-06-29	1216	\N	59633	\N
73425	GENERIC_DAY	2	0	f	2010-06-23	4350	\N	59633	\N
73428	GENERIC_DAY	2	0	f	2010-06-19	1220	\N	59633	\N
73406	GENERIC_DAY	2	4	f	2010-06-16	4356	\N	59633	\N
44752	GENERIC_DAY	1	7	f	2010-06-18	4354	\N	42532	\N
44753	GENERIC_DAY	1	0	f	2010-07-16	4354	\N	42532	\N
44754	GENERIC_DAY	1	7	f	2010-06-21	4354	\N	42532	\N
44755	GENERIC_DAY	1	1	f	2010-06-21	4352	\N	42532	\N
44756	GENERIC_DAY	1	0	f	2010-07-19	4354	\N	42532	\N
44757	GENERIC_DAY	1	0	f	2010-06-19	4354	\N	42532	\N
44758	GENERIC_DAY	1	0	f	2010-07-17	4352	\N	42532	\N
44759	GENERIC_DAY	1	4	f	2010-06-29	4352	\N	42532	\N
44760	GENERIC_DAY	1	8	f	2010-07-13	4352	\N	42532	\N
44761	GENERIC_DAY	1	0	f	2010-06-27	4354	\N	42532	\N
44762	GENERIC_DAY	1	0	f	2010-07-05	4354	\N	42532	\N
44763	GENERIC_DAY	1	8	f	2010-06-25	4354	\N	42532	\N
44764	GENERIC_DAY	1	4	f	2010-06-30	4352	\N	42532	\N
44765	GENERIC_DAY	1	0	f	2010-06-25	4352	\N	42532	\N
44766	GENERIC_DAY	1	1	f	2010-06-17	4352	\N	42532	\N
44767	GENERIC_DAY	1	0	f	2010-07-04	4352	\N	42532	\N
44768	GENERIC_DAY	1	0	f	2010-07-11	4354	\N	42532	\N
44769	GENERIC_DAY	1	8	f	2010-07-15	4352	\N	42532	\N
44770	GENERIC_DAY	1	0	f	2010-07-13	4354	\N	42532	\N
44771	GENERIC_DAY	1	0	f	2010-07-10	4352	\N	42532	\N
44772	GENERIC_DAY	1	0	f	2010-06-24	4352	\N	42532	\N
44773	GENERIC_DAY	1	8	f	2010-07-19	4352	\N	42532	\N
44774	GENERIC_DAY	1	0	f	2010-06-26	4354	\N	42532	\N
44775	GENERIC_DAY	1	1	f	2010-06-15	4352	\N	42532	\N
44776	GENERIC_DAY	1	0	f	2010-07-17	4354	\N	42532	\N
44777	GENERIC_DAY	1	0	f	2010-07-11	4352	\N	42532	\N
44778	GENERIC_DAY	1	4	f	2010-06-30	4354	\N	42532	\N
44779	GENERIC_DAY	1	0	f	2010-07-06	4354	\N	42532	\N
44780	GENERIC_DAY	1	8	f	2010-07-05	4352	\N	42532	\N
44781	GENERIC_DAY	1	7	f	2010-06-16	4354	\N	42532	\N
44782	GENERIC_DAY	1	1	f	2010-06-16	4352	\N	42532	\N
44783	GENERIC_DAY	1	8	f	2010-07-02	4352	\N	42532	\N
44784	GENERIC_DAY	1	8	f	2010-07-07	4352	\N	42532	\N
44785	GENERIC_DAY	1	0	f	2010-06-20	4354	\N	42532	\N
44786	GENERIC_DAY	1	4	f	2010-06-29	4354	\N	42532	\N
44787	GENERIC_DAY	1	0	f	2010-07-31	4350	\N	42533	\N
44788	GENERIC_DAY	1	0	f	2010-08-08	4350	\N	42533	\N
44789	GENERIC_DAY	1	0	f	2010-08-01	4358	\N	42533	\N
44790	GENERIC_DAY	1	2	f	2010-07-26	4358	\N	42533	\N
44791	GENERIC_DAY	1	0	f	2010-07-24	4358	\N	42533	\N
44792	GENERIC_DAY	1	0	f	2010-08-07	4344	\N	42533	\N
44793	GENERIC_DAY	1	2	f	2010-07-22	4348	\N	42533	\N
44794	GENERIC_DAY	1	0	f	2010-08-01	4348	\N	42533	\N
44795	GENERIC_DAY	1	2	f	2010-07-26	4344	\N	42533	\N
44796	GENERIC_DAY	1	2	f	2010-07-26	4350	\N	42533	\N
44797	GENERIC_DAY	1	2	f	2010-08-13	4344	\N	42533	\N
44798	GENERIC_DAY	1	0	f	2010-08-08	4344	\N	42533	\N
44799	GENERIC_DAY	1	0	f	2010-08-15	4344	\N	42533	\N
44800	GENERIC_DAY	1	2	f	2010-08-09	4358	\N	42533	\N
44801	GENERIC_DAY	1	2	f	2010-07-23	4358	\N	42533	\N
44802	GENERIC_DAY	1	2	f	2010-07-23	4350	\N	42533	\N
44803	GENERIC_DAY	1	3	f	2010-07-28	4344	\N	42533	\N
44804	GENERIC_DAY	1	0	f	2010-08-07	4348	\N	42533	\N
44805	GENERIC_DAY	1	2	f	2010-07-22	4344	\N	42533	\N
44806	GENERIC_DAY	1	0	f	2010-08-15	4348	\N	42533	\N
44807	GENERIC_DAY	1	2	f	2010-08-09	4350	\N	42533	\N
44808	GENERIC_DAY	1	2	f	2010-08-04	4348	\N	42533	\N
44809	GENERIC_DAY	1	2	f	2010-07-29	4358	\N	42533	\N
44810	GENERIC_DAY	1	2	f	2010-08-03	4344	\N	42533	\N
44811	GENERIC_DAY	1	2	f	2010-08-11	4350	\N	42533	\N
44812	GENERIC_DAY	1	2	f	2010-08-11	4344	\N	42533	\N
44813	GENERIC_DAY	1	2	f	2010-08-04	4344	\N	42533	\N
44814	GENERIC_DAY	1	2	f	2010-08-16	4350	\N	42533	\N
44815	GENERIC_DAY	1	2	f	2010-07-30	4348	\N	42533	\N
44816	GENERIC_DAY	1	0	f	2010-08-07	4350	\N	42533	\N
44817	GENERIC_DAY	1	2	f	2010-07-26	4348	\N	42533	\N
44818	GENERIC_DAY	1	2	f	2010-08-03	4358	\N	42533	\N
44819	GENERIC_DAY	1	2	f	2010-08-09	4344	\N	42533	\N
44820	GENERIC_DAY	1	2	f	2010-07-28	4350	\N	42533	\N
44821	GENERIC_DAY	1	2	f	2010-08-16	4344	\N	42533	\N
44822	GENERIC_DAY	1	2	f	2010-08-02	4358	\N	42533	\N
44823	GENERIC_DAY	1	2	f	2010-08-02	4348	\N	42533	\N
44824	GENERIC_DAY	1	2	f	2010-08-10	4350	\N	42533	\N
44825	GENERIC_DAY	1	2	f	2010-07-27	4358	\N	42533	\N
44826	GENERIC_DAY	1	2	f	2010-08-05	4344	\N	42533	\N
44827	GENERIC_DAY	1	2	f	2010-08-12	4348	\N	42533	\N
44828	GENERIC_DAY	1	2	f	2010-08-12	4344	\N	42533	\N
44829	GENERIC_DAY	1	0	f	2010-07-25	4358	\N	42533	\N
44830	GENERIC_DAY	1	2	f	2010-08-10	4344	\N	42533	\N
44831	GENERIC_DAY	1	2	f	2010-08-03	4350	\N	42533	\N
44832	GENERIC_DAY	1	0	f	2010-08-07	4358	\N	42533	\N
44833	GENERIC_DAY	1	0	f	2010-07-31	4344	\N	42533	\N
44834	GENERIC_DAY	1	2	f	2010-07-22	4358	\N	42533	\N
44835	GENERIC_DAY	1	2	f	2010-07-28	4348	\N	42533	\N
44836	GENERIC_DAY	1	1	f	2010-08-17	4358	\N	42533	\N
44837	GENERIC_DAY	1	0	f	2010-08-14	4348	\N	42533	\N
44838	GENERIC_DAY	1	1	f	2010-07-28	4358	\N	42533	\N
44839	GENERIC_DAY	1	2	f	2010-08-02	4350	\N	42533	\N
44840	GENERIC_DAY	1	0	f	2010-08-01	4344	\N	42533	\N
44841	GENERIC_DAY	1	0	f	2010-08-14	4358	\N	42533	\N
44842	GENERIC_DAY	1	2	f	2010-08-16	4358	\N	42533	\N
44843	GENERIC_DAY	1	0	f	2010-08-14	4350	\N	42533	\N
44844	GENERIC_DAY	1	0	f	2010-07-24	4348	\N	42533	\N
44845	GENERIC_DAY	1	2	f	2010-08-03	4348	\N	42533	\N
44846	GENERIC_DAY	1	2	f	2010-08-10	4358	\N	42533	\N
44847	GENERIC_DAY	1	2	f	2010-08-11	4358	\N	42533	\N
44848	GENERIC_DAY	1	2	f	2010-07-23	4344	\N	42533	\N
44849	GENERIC_DAY	1	2	f	2010-08-17	4344	\N	42533	\N
44850	GENERIC_DAY	1	2	f	2010-07-30	4358	\N	42533	\N
44851	GENERIC_DAY	1	2	f	2010-08-06	4350	\N	42533	\N
44852	GENERIC_DAY	1	0	f	2010-08-15	4358	\N	42533	\N
44853	GENERIC_DAY	1	2	f	2010-08-16	4348	\N	42533	\N
44854	GENERIC_DAY	1	2	f	2010-08-04	4358	\N	42533	\N
44855	GENERIC_DAY	1	0	f	2010-08-01	4350	\N	42533	\N
44856	GENERIC_DAY	1	2	f	2010-08-06	4348	\N	42533	\N
44857	GENERIC_DAY	1	2	f	2010-07-30	4350	\N	42533	\N
44858	GENERIC_DAY	1	2	f	2010-08-11	4348	\N	42533	\N
44859	GENERIC_DAY	1	2	f	2010-08-12	4358	\N	42533	\N
44860	GENERIC_DAY	1	2	f	2010-08-13	4350	\N	42533	\N
44861	GENERIC_DAY	1	2	f	2010-07-23	4348	\N	42533	\N
44862	GENERIC_DAY	1	2	f	2010-07-30	4344	\N	42533	\N
44863	GENERIC_DAY	1	2	f	2010-07-27	4348	\N	42533	\N
44864	GENERIC_DAY	1	2	f	2010-08-05	4348	\N	42533	\N
44865	GENERIC_DAY	1	2	f	2010-07-29	4350	\N	42533	\N
44866	GENERIC_DAY	1	0	f	2010-07-31	4358	\N	42533	\N
44867	GENERIC_DAY	1	0	f	2010-07-25	4344	\N	42533	\N
44868	GENERIC_DAY	1	2	f	2010-07-27	4344	\N	42533	\N
44869	GENERIC_DAY	1	2	f	2010-08-17	4348	\N	42533	\N
44870	GENERIC_DAY	1	2	f	2010-08-13	4348	\N	42533	\N
44871	GENERIC_DAY	1	2	f	2010-08-06	4358	\N	42533	\N
44872	GENERIC_DAY	1	2	f	2010-08-09	4348	\N	42533	\N
44873	GENERIC_DAY	1	2	f	2010-08-02	4344	\N	42533	\N
44874	GENERIC_DAY	1	2	f	2010-08-04	4350	\N	42533	\N
44875	GENERIC_DAY	1	0	f	2010-08-08	4358	\N	42533	\N
44876	GENERIC_DAY	1	1	f	2010-08-17	4350	\N	42533	\N
44877	GENERIC_DAY	1	0	f	2010-08-08	4348	\N	42533	\N
44878	GENERIC_DAY	1	2	f	2010-07-29	4348	\N	42533	\N
44879	GENERIC_DAY	1	2	f	2010-08-12	4350	\N	42533	\N
44880	GENERIC_DAY	1	2	f	2010-08-06	4344	\N	42533	\N
44881	GENERIC_DAY	1	0	f	2010-07-25	4350	\N	42533	\N
44882	GENERIC_DAY	1	2	f	2010-08-05	4358	\N	42533	\N
44883	GENERIC_DAY	1	0	f	2010-08-14	4344	\N	42533	\N
44884	GENERIC_DAY	1	0	f	2010-08-15	4350	\N	42533	\N
44885	GENERIC_DAY	1	0	f	2010-07-24	4350	\N	42533	\N
44886	GENERIC_DAY	1	2	f	2010-08-10	4348	\N	42533	\N
44887	GENERIC_DAY	1	0	f	2010-07-25	4348	\N	42533	\N
44888	GENERIC_DAY	1	2	f	2010-08-05	4350	\N	42533	\N
44889	GENERIC_DAY	1	0	f	2010-07-24	4344	\N	42533	\N
44890	GENERIC_DAY	1	2	f	2010-08-13	4358	\N	42533	\N
44891	GENERIC_DAY	1	2	f	2010-07-22	4350	\N	42533	\N
44892	GENERIC_DAY	1	2	f	2010-07-27	4350	\N	42533	\N
44893	GENERIC_DAY	1	2	f	2010-07-29	4344	\N	42533	\N
44894	GENERIC_DAY	1	0	f	2010-07-31	4348	\N	42533	\N
45600	GENERIC_DAY	1	4	f	2010-09-09	4352	\N	42595	\N
45606	GENERIC_DAY	1	0	f	2010-09-11	4354	\N	42595	\N
45592	GENERIC_DAY	1	4	f	2010-08-27	4354	\N	42595	\N
45597	GENERIC_DAY	1	1	f	2010-09-30	4352	\N	42595	\N
45615	GENERIC_DAY	1	0	f	2010-09-26	4352	\N	42595	\N
45626	GENERIC_DAY	1	4	f	2010-08-26	4354	\N	42595	\N
45587	GENERIC_DAY	1	4	f	2010-09-08	4354	\N	42595	\N
45595	GENERIC_DAY	1	4	f	2010-09-20	4354	\N	42595	\N
45618	GENERIC_DAY	1	0	f	2010-09-18	4352	\N	42595	\N
45625	GENERIC_DAY	1	4	f	2010-09-22	4354	\N	42595	\N
45588	GENERIC_DAY	1	4	f	2010-09-15	4354	\N	42595	\N
45628	GENERIC_DAY	1	0	f	2010-09-05	4352	\N	42595	\N
45614	GENERIC_DAY	1	4	f	2010-09-14	4352	\N	42595	\N
45617	GENERIC_DAY	1	4	f	2010-09-08	4352	\N	42595	\N
45601	GENERIC_DAY	1	0	f	2010-09-12	4354	\N	42595	\N
13228	SPECIFIC_DAY	2	8	f	2010-06-30	4350	8082	\N	\N
45635	GENERIC_DAY	1	0	f	2010-09-11	1220	\N	42597	\N
45636	GENERIC_DAY	1	8	f	2010-09-08	1220	\N	42597	\N
45637	GENERIC_DAY	1	8	f	2010-08-25	1220	\N	42597	\N
45638	GENERIC_DAY	1	8	f	2010-09-01	1220	\N	42597	\N
45639	GENERIC_DAY	1	8	f	2010-09-24	1220	\N	42597	\N
45640	GENERIC_DAY	1	8	f	2010-09-17	1220	\N	42597	\N
45641	GENERIC_DAY	1	0	f	2010-08-21	1220	\N	42597	\N
45642	GENERIC_DAY	1	8	f	2010-08-23	1220	\N	42597	\N
45643	GENERIC_DAY	1	4	f	2010-10-13	1220	\N	42597	\N
45644	GENERIC_DAY	1	8	f	2010-09-13	1220	\N	42597	\N
45645	GENERIC_DAY	1	0	f	2010-08-20	1220	\N	42597	\N
45646	GENERIC_DAY	1	0	f	2010-09-04	1220	\N	42597	\N
45647	GENERIC_DAY	1	8	f	2010-09-06	1220	\N	42597	\N
45648	GENERIC_DAY	1	0	f	2010-10-03	1220	\N	42597	\N
45649	GENERIC_DAY	1	8	f	2010-09-21	1220	\N	42597	\N
45650	GENERIC_DAY	1	8	f	2010-09-28	1220	\N	42597	\N
45651	GENERIC_DAY	1	8	f	2010-08-27	1220	\N	42597	\N
45652	GENERIC_DAY	1	8	f	2010-09-07	1220	\N	42597	\N
45653	GENERIC_DAY	1	8	f	2010-09-29	1220	\N	42597	\N
45654	GENERIC_DAY	1	0	f	2010-08-29	1220	\N	42597	\N
45655	GENERIC_DAY	1	8	f	2010-09-30	1220	\N	42597	\N
45656	GENERIC_DAY	1	8	f	2010-09-09	1220	\N	42597	\N
45657	GENERIC_DAY	1	8	f	2010-08-24	1220	\N	42597	\N
45658	GENERIC_DAY	1	0	f	2010-09-18	1220	\N	42597	\N
45659	GENERIC_DAY	1	0	f	2010-08-28	1220	\N	42597	\N
45660	GENERIC_DAY	1	0	f	2010-10-02	1220	\N	42597	\N
45661	GENERIC_DAY	1	0	f	2010-08-22	1220	\N	42597	\N
45662	GENERIC_DAY	1	8	f	2010-10-08	1220	\N	42597	\N
45663	GENERIC_DAY	1	8	f	2010-10-05	1220	\N	42597	\N
45664	GENERIC_DAY	1	8	f	2010-08-26	1220	\N	42597	\N
45665	GENERIC_DAY	1	8	f	2010-09-16	1220	\N	42597	\N
45666	GENERIC_DAY	1	8	f	2010-10-01	1220	\N	42597	\N
45667	GENERIC_DAY	1	8	f	2010-10-07	1220	\N	42597	\N
45668	GENERIC_DAY	1	8	f	2010-10-06	1220	\N	42597	\N
45669	GENERIC_DAY	1	0	f	2010-09-26	1220	\N	42597	\N
45670	GENERIC_DAY	1	8	f	2010-10-12	1220	\N	42597	\N
45671	GENERIC_DAY	1	0	f	2010-09-19	1220	\N	42597	\N
45672	GENERIC_DAY	1	8	f	2010-09-27	1220	\N	42597	\N
45673	GENERIC_DAY	1	0	f	2010-09-12	1220	\N	42597	\N
45674	GENERIC_DAY	1	8	f	2010-08-30	1220	\N	42597	\N
45675	GENERIC_DAY	1	0	f	2010-10-10	1220	\N	42597	\N
45676	GENERIC_DAY	1	8	f	2010-09-20	1220	\N	42597	\N
45677	GENERIC_DAY	1	8	f	2010-10-11	1220	\N	42597	\N
45678	GENERIC_DAY	1	0	f	2010-09-25	1220	\N	42597	\N
45679	GENERIC_DAY	1	8	f	2010-09-23	1220	\N	42597	\N
45680	GENERIC_DAY	1	8	f	2010-09-22	1220	\N	42597	\N
45681	GENERIC_DAY	1	8	f	2010-09-03	1220	\N	42597	\N
45682	GENERIC_DAY	1	8	f	2010-09-15	1220	\N	42597	\N
45683	GENERIC_DAY	1	8	f	2010-09-02	1220	\N	42597	\N
45684	GENERIC_DAY	1	0	f	2010-10-09	1220	\N	42597	\N
45685	GENERIC_DAY	1	8	f	2010-10-04	1220	\N	42597	\N
45686	GENERIC_DAY	1	8	f	2010-09-14	1220	\N	42597	\N
45687	GENERIC_DAY	1	8	f	2010-09-10	1220	\N	42597	\N
45688	GENERIC_DAY	1	8	f	2010-08-31	1220	\N	42597	\N
45689	GENERIC_DAY	1	0	f	2010-09-05	1220	\N	42597	\N
268250	SPECIFIC_DAY	0	8	f	2010-07-21	4344	8089	\N	\N
268251	SPECIFIC_DAY	0	8	f	2010-07-09	4344	8089	\N	\N
268252	SPECIFIC_DAY	0	8	f	2010-07-26	4344	8089	\N	\N
268253	SPECIFIC_DAY	0	0	f	2010-07-24	4344	8089	\N	\N
268254	SPECIFIC_DAY	0	8	f	2010-07-15	4344	8089	\N	\N
268255	SPECIFIC_DAY	0	8	f	2010-08-10	4344	8089	\N	\N
268256	SPECIFIC_DAY	0	8	f	2010-08-12	4344	8089	\N	\N
268257	SPECIFIC_DAY	0	0	f	2010-07-11	4344	8089	\N	\N
268258	SPECIFIC_DAY	0	8	f	2010-07-12	4344	8089	\N	\N
268259	SPECIFIC_DAY	0	8	f	2010-07-14	4344	8089	\N	\N
268260	SPECIFIC_DAY	0	0	f	2010-08-01	4344	8089	\N	\N
268261	SPECIFIC_DAY	0	8	f	2010-07-19	4344	8089	\N	\N
268262	SPECIFIC_DAY	0	0	f	2010-07-31	4344	8089	\N	\N
268263	SPECIFIC_DAY	0	0	f	2010-07-10	4344	8089	\N	\N
268264	SPECIFIC_DAY	0	0	f	2010-08-08	4344	8089	\N	\N
268265	SPECIFIC_DAY	0	8	f	2010-07-28	4344	8089	\N	\N
268266	SPECIFIC_DAY	0	8	f	2010-08-04	4344	8089	\N	\N
268267	SPECIFIC_DAY	0	0	f	2010-08-07	4344	8089	\N	\N
268268	SPECIFIC_DAY	0	8	f	2010-08-09	4344	8089	\N	\N
268269	SPECIFIC_DAY	0	8	f	2010-07-16	4344	8089	\N	\N
268270	SPECIFIC_DAY	0	8	f	2010-07-22	4344	8089	\N	\N
268271	SPECIFIC_DAY	0	8	f	2010-08-11	4344	8089	\N	\N
268272	SPECIFIC_DAY	0	8	f	2010-07-20	4344	8089	\N	\N
268273	SPECIFIC_DAY	0	8	f	2010-07-30	4344	8089	\N	\N
268274	SPECIFIC_DAY	0	0	f	2010-07-18	4344	8089	\N	\N
268275	SPECIFIC_DAY	0	0	f	2010-07-25	4344	8089	\N	\N
268276	SPECIFIC_DAY	0	8	f	2010-07-13	4344	8089	\N	\N
268277	SPECIFIC_DAY	0	8	f	2010-08-05	4344	8089	\N	\N
268278	SPECIFIC_DAY	0	8	f	2010-08-03	4344	8089	\N	\N
268279	SPECIFIC_DAY	0	8	f	2010-08-06	4344	8089	\N	\N
268280	SPECIFIC_DAY	0	8	f	2010-08-02	4344	8089	\N	\N
268281	SPECIFIC_DAY	0	8	f	2010-07-29	4344	8089	\N	\N
268282	SPECIFIC_DAY	0	0	f	2010-07-17	4344	8089	\N	\N
268283	SPECIFIC_DAY	0	8	f	2010-07-27	4344	8089	\N	\N
268284	SPECIFIC_DAY	0	8	f	2010-07-23	4344	8089	\N	\N
268285	SPECIFIC_DAY	0	8	f	2010-08-18	4348	8090	\N	\N
268286	SPECIFIC_DAY	0	8	f	2010-08-19	4348	8090	\N	\N
268287	SPECIFIC_DAY	0	0	f	2010-08-14	4348	8090	\N	\N
268288	SPECIFIC_DAY	0	3	f	2010-08-23	4348	8090	\N	\N
268289	SPECIFIC_DAY	0	8	f	2010-08-13	4348	8090	\N	\N
268290	SPECIFIC_DAY	0	8	f	2010-08-17	4348	8090	\N	\N
268291	SPECIFIC_DAY	0	8	f	2010-08-20	4348	8090	\N	\N
268292	SPECIFIC_DAY	0	0	f	2010-08-21	4348	8090	\N	\N
268293	SPECIFIC_DAY	0	8	f	2010-08-16	4348	8090	\N	\N
268294	SPECIFIC_DAY	0	0	f	2010-08-15	4348	8090	\N	\N
268295	SPECIFIC_DAY	0	0	f	2010-08-22	4348	8090	\N	\N
25090	GENERIC_DAY	9	0	f	2010-06-24	4350	\N	16800	\N
25147	GENERIC_DAY	9	0	f	2010-06-27	21817	\N	16800	\N
25129	GENERIC_DAY	9	4	f	2010-06-23	21817	\N	16800	\N
25150	GENERIC_DAY	9	0	f	2010-06-25	4350	\N	16800	\N
25091	GENERIC_DAY	9	0	f	2010-06-19	4350	\N	16800	\N
25156	GENERIC_DAY	9	0	f	2010-06-29	4344	\N	16800	\N
25126	GENERIC_DAY	9	0	f	2010-06-16	4348	\N	16800	\N
25137	GENERIC_DAY	9	0	f	2010-06-19	4348	\N	16800	\N
25159	GENERIC_DAY	9	0	f	2010-06-30	4344	\N	16800	\N
25158	GENERIC_DAY	9	0	f	2010-06-30	4350	\N	16800	\N
25093	GENERIC_DAY	9	0	f	2010-06-26	4344	\N	16800	\N
25122	GENERIC_DAY	9	0	f	2010-06-20	4348	\N	16800	\N
25163	GENERIC_DAY	9	0	f	2010-06-27	4348	\N	16800	\N
25125	GENERIC_DAY	9	0	f	2010-06-16	4350	\N	16800	\N
25124	GENERIC_DAY	9	5	f	2010-06-22	21817	\N	16800	\N
25123	GENERIC_DAY	9	0	f	2010-06-21	4350	\N	16800	\N
25130	GENERIC_DAY	9	0	f	2010-06-22	4348	\N	16800	\N
25084	GENERIC_DAY	9	3	f	2010-06-22	4358	\N	16800	\N
25149	GENERIC_DAY	9	0	f	2010-06-23	4344	\N	16800	\N
25095	GENERIC_DAY	9	0	f	2010-06-26	4358	\N	16800	\N
25103	GENERIC_DAY	9	8	f	2010-06-14	4358	\N	16800	\N
25138	GENERIC_DAY	9	0	f	2010-06-21	4348	\N	16800	\N
25144	GENERIC_DAY	9	3	f	2010-06-18	4358	\N	16800	\N
25108	GENERIC_DAY	9	2	f	2010-06-28	4348	\N	16800	\N
50573	GENERIC_DAY	2	2	t	2010-07-08	21817	\N	48384	\N
50589	GENERIC_DAY	2	4	f	2010-07-28	4358	\N	48384	\N
50565	GENERIC_DAY	2	0	t	2010-07-14	4344	\N	48384	\N
50561	GENERIC_DAY	2	0	f	2010-07-18	4350	\N	48384	\N
50590	GENERIC_DAY	2	0	t	2010-07-07	4350	\N	48384	\N
50557	GENERIC_DAY	2	4	f	2010-08-02	4350	\N	48384	\N
50580	GENERIC_DAY	2	4	f	2010-07-27	4348	\N	48384	\N
50559	GENERIC_DAY	2	0	t	2010-07-11	4344	\N	48384	\N
50560	GENERIC_DAY	2	3	t	2010-07-07	21817	\N	48384	\N
50585	GENERIC_DAY	2	4	f	2010-07-22	4350	\N	48384	\N
50582	GENERIC_DAY	2	4	f	2010-07-26	4348	\N	48384	\N
50577	GENERIC_DAY	2	0	f	2010-07-17	4350	\N	48384	\N
50584	GENERIC_DAY	2	0	f	2010-07-31	4358	\N	48384	\N
50572	GENERIC_DAY	2	2	t	2010-07-02	4358	\N	48384	\N
50570	GENERIC_DAY	2	5	f	2010-07-30	4344	\N	48384	\N
50558	GENERIC_DAY	2	2	t	2010-07-09	4350	\N	48384	\N
50555	GENERIC_DAY	2	4	f	2010-07-22	4348	\N	48384	\N
50564	GENERIC_DAY	2	0	t	2010-07-10	4344	\N	48384	\N
50566	GENERIC_DAY	2	5	f	2010-07-21	4344	\N	48384	\N
50578	GENERIC_DAY	2	3	t	2010-07-16	4348	\N	48384	\N
50579	GENERIC_DAY	2	0	t	2010-07-08	4344	\N	48384	\N
50568	GENERIC_DAY	2	0	t	2010-07-04	4344	\N	48384	\N
50554	GENERIC_DAY	2	0	t	2010-07-09	4344	\N	48384	\N
50574	GENERIC_DAY	2	5	f	2010-07-27	4344	\N	48384	\N
50575	GENERIC_DAY	2	0	f	2010-07-24	4348	\N	48384	\N
50576	GENERIC_DAY	2	2	t	2010-07-14	4358	\N	48384	\N
50586	GENERIC_DAY	2	0	t	2010-07-16	4344	\N	48384	\N
50562	GENERIC_DAY	2	2	t	2010-07-13	4350	\N	48384	\N
50556	GENERIC_DAY	2	3	t	2010-07-07	4348	\N	48384	\N
50567	GENERIC_DAY	2	4	f	2010-08-03	4344	\N	48384	\N
50587	GENERIC_DAY	2	4	f	2010-08-02	4358	\N	48384	\N
50588	GENERIC_DAY	2	5	f	2010-07-20	4344	\N	48384	\N
50583	GENERIC_DAY	2	4	f	2010-07-27	4358	\N	48384	\N
50563	GENERIC_DAY	2	2	t	2010-07-13	4348	\N	48384	\N
50569	GENERIC_DAY	2	3	t	2010-07-14	4348	\N	48384	\N
50581	GENERIC_DAY	2	0	f	2010-07-17	4348	\N	48384	\N
50571	GENERIC_DAY	2	4	f	2010-07-21	4348	\N	48384	\N
25110	GENERIC_DAY	9	3	f	2010-06-16	4358	\N	16800	\N
25128	GENERIC_DAY	9	0	f	2010-06-18	4350	\N	16800	\N
25113	GENERIC_DAY	9	2	f	2010-06-24	4348	\N	16800	\N
25119	GENERIC_DAY	9	0	f	2010-06-26	4350	\N	16800	\N
25083	GENERIC_DAY	9	0	f	2010-06-20	4358	\N	16800	\N
25094	GENERIC_DAY	9	0	f	2010-06-15	4348	\N	16800	\N
25092	GENERIC_DAY	9	0	f	2010-06-16	4344	\N	16800	\N
25107	GENERIC_DAY	9	0	f	2010-06-15	4350	\N	16800	\N
25151	GENERIC_DAY	9	1	f	2010-06-30	4348	\N	16800	\N
25115	GENERIC_DAY	9	0	f	2010-06-22	4344	\N	16800	\N
25146	GENERIC_DAY	9	0	f	2010-06-27	4350	\N	16800	\N
25139	GENERIC_DAY	9	0	f	2010-06-18	4348	\N	16800	\N
50691	GENERIC_DAY	2	4	f	2010-07-20	4348	\N	48384	\N
50651	GENERIC_DAY	2	4	f	2010-07-28	4350	\N	48384	\N
50671	GENERIC_DAY	2	0	t	2010-07-10	4358	\N	48384	\N
50676	GENERIC_DAY	2	5	f	2010-07-28	4348	\N	48384	\N
50665	GENERIC_DAY	2	3	t	2010-07-02	4348	\N	48384	\N
50692	GENERIC_DAY	2	0	t	2010-07-04	4348	\N	48384	\N
50662	GENERIC_DAY	2	3	f	2010-08-03	4358	\N	48384	\N
50693	GENERIC_DAY	2	3	t	2010-07-02	21817	\N	48384	\N
50661	GENERIC_DAY	2	0	t	2010-07-10	21817	\N	48384	\N
50687	GENERIC_DAY	2	2	t	2010-07-15	4350	\N	48384	\N
50667	GENERIC_DAY	2	4	f	2010-07-22	4358	\N	48384	\N
50673	GENERIC_DAY	2	0	t	2010-07-04	4358	\N	48384	\N
50685	GENERIC_DAY	2	3	t	2010-07-05	21817	\N	48384	\N
50683	GENERIC_DAY	2	3	t	2010-07-15	4348	\N	48384	\N
50670	GENERIC_DAY	2	0	f	2010-07-18	4358	\N	48384	\N
50668	GENERIC_DAY	2	0	t	2010-07-05	4344	\N	48384	\N
50669	GENERIC_DAY	2	4	f	2010-07-29	4348	\N	48384	\N
50678	GENERIC_DAY	2	0	f	2010-07-25	4350	\N	48384	\N
50652	GENERIC_DAY	2	4	f	2010-07-21	4358	\N	48384	\N
50657	GENERIC_DAY	2	5	f	2010-07-29	4344	\N	48384	\N
50609	GENERIC_DAY	2	0	f	2010-07-25	4344	\N	48384	\N
50612	GENERIC_DAY	2	3	t	2010-07-06	4348	\N	48384	\N
50696	GENERIC_DAY	2	0	t	2010-07-10	4350	\N	48384	\N
50629	GENERIC_DAY	2	0	f	2010-08-01	4344	\N	48384	\N
50634	GENERIC_DAY	2	0	f	2010-07-25	4358	\N	48384	\N
50690	GENERIC_DAY	2	4	f	2010-07-29	4350	\N	48384	\N
50659	GENERIC_DAY	2	0	f	2010-07-18	4348	\N	48384	\N
50658	GENERIC_DAY	2	4	f	2010-07-30	4348	\N	48384	\N
50680	GENERIC_DAY	2	0	t	2010-07-12	4344	\N	48384	\N
50605	GENERIC_DAY	2	0	t	2010-07-11	4348	\N	48384	\N
50664	GENERIC_DAY	2	5	f	2010-07-19	4344	\N	48384	\N
50649	GENERIC_DAY	2	0	f	2010-07-25	4348	\N	48384	\N
50619	GENERIC_DAY	2	0	t	2010-07-03	4344	\N	48384	\N
50684	GENERIC_DAY	2	3	t	2010-07-14	4350	\N	48384	\N
50591	GENERIC_DAY	2	2	t	2010-07-13	4358	\N	48384	\N
50599	GENERIC_DAY	2	5	f	2010-07-22	4344	\N	48384	\N
50677	GENERIC_DAY	2	2	t	2010-07-08	4348	\N	48384	\N
50641	GENERIC_DAY	2	0	t	2010-07-07	4344	\N	48384	\N
50603	GENERIC_DAY	2	5	f	2010-07-26	4344	\N	48384	\N
50660	GENERIC_DAY	2	2	t	2010-07-08	4358	\N	48384	\N
50648	GENERIC_DAY	2	0	t	2010-07-10	4348	\N	48384	\N
50697	GENERIC_DAY	2	0	f	2010-07-31	4344	\N	48384	\N
50666	GENERIC_DAY	2	4	f	2010-07-21	4350	\N	48384	\N
50616	GENERIC_DAY	2	0	t	2010-07-11	4350	\N	48384	\N
50640	GENERIC_DAY	2	0	t	2010-07-04	4350	\N	48384	\N
50650	GENERIC_DAY	2	2	t	2010-07-12	4348	\N	48384	\N
50646	GENERIC_DAY	2	5	f	2010-07-23	4344	\N	48384	\N
50647	GENERIC_DAY	2	0	f	2010-08-01	4350	\N	48384	\N
50633	GENERIC_DAY	2	3	t	2010-07-15	4358	\N	48384	\N
46727	GENERIC_DAY	4	2	t	2010-06-16	1216	\N	45866	\N
46708	GENERIC_DAY	4	0	t	2010-06-20	1220	\N	45866	\N
46732	GENERIC_DAY	4	0	f	2010-06-26	1216	\N	45866	\N
46714	GENERIC_DAY	4	2	t	2010-06-17	1216	\N	45866	\N
46742	GENERIC_DAY	4	0	f	2010-06-27	1220	\N	45866	\N
46729	GENERIC_DAY	4	0	t	2010-06-19	1220	\N	45866	\N
46716	GENERIC_DAY	4	10	f	2010-07-01	1216	\N	45866	\N
46741	GENERIC_DAY	4	8	f	2010-06-30	1216	\N	45866	\N
25152	GENERIC_DAY	9	0	f	2010-06-29	4350	\N	16800	\N
25088	GENERIC_DAY	9	4	f	2010-06-28	21817	\N	16800	\N
25136	GENERIC_DAY	9	0	f	2010-06-19	4358	\N	16800	\N
25097	GENERIC_DAY	9	0	f	2010-06-19	21817	\N	16800	\N
25101	GENERIC_DAY	9	0	f	2010-06-20	4344	\N	16800	\N
25114	GENERIC_DAY	9	2	f	2010-06-25	4358	\N	16800	\N
25160	GENERIC_DAY	9	4	f	2010-06-29	21817	\N	16800	\N
25102	GENERIC_DAY	9	2	f	2010-06-23	4358	\N	16800	\N
25120	GENERIC_DAY	9	0	f	2010-06-24	4344	\N	16800	\N
25121	GENERIC_DAY	9	0	f	2010-06-18	4344	\N	16800	\N
25148	GENERIC_DAY	9	0	f	2010-06-22	4350	\N	16800	\N
25098	GENERIC_DAY	9	5	f	2010-06-15	21817	\N	16800	\N
25133	GENERIC_DAY	9	5	f	2010-06-18	21817	\N	16800	\N
25104	GENERIC_DAY	9	0	f	2010-06-23	4350	\N	16800	\N
25296	GENERIC_DAY	7	5	f	2010-07-07	4352	\N	16802	\N
25278	GENERIC_DAY	7	4	f	2010-07-28	4352	\N	16802	\N
25239	GENERIC_DAY	7	3	f	2010-07-13	4354	\N	16802	\N
25248	GENERIC_DAY	7	0	f	2010-07-24	4352	\N	16802	\N
25269	GENERIC_DAY	7	4	f	2010-08-04	4352	\N	16802	\N
25164	GENERIC_DAY	9	0	f	2010-06-19	4344	\N	16800	\N
25135	GENERIC_DAY	9	0	f	2010-06-28	4350	\N	16800	\N
25086	GENERIC_DAY	9	0	f	2010-06-20	21817	\N	16800	\N
25162	GENERIC_DAY	9	0	f	2010-06-17	4348	\N	16800	\N
25096	GENERIC_DAY	9	0	f	2010-06-27	4344	\N	16800	\N
25141	GENERIC_DAY	9	5	f	2010-06-21	21817	\N	16800	\N
25087	GENERIC_DAY	9	0	f	2010-06-14	4350	\N	16800	\N
25140	GENERIC_DAY	9	2	f	2010-06-23	4348	\N	16800	\N
25085	GENERIC_DAY	9	0	f	2010-06-28	4344	\N	16800	\N
25157	GENERIC_DAY	9	2	f	2010-06-30	21817	\N	16800	\N
25109	GENERIC_DAY	9	3	f	2010-06-15	4358	\N	16800	\N
25111	GENERIC_DAY	9	5	f	2010-06-16	21817	\N	16800	\N
25100	GENERIC_DAY	9	0	f	2010-06-25	4344	\N	16800	\N
25127	GENERIC_DAY	9	3	f	2010-06-21	4358	\N	16800	\N
25145	GENERIC_DAY	9	0	f	2010-06-27	4358	\N	16800	\N
25132	GENERIC_DAY	9	0	f	2010-06-26	21817	\N	16800	\N
25143	GENERIC_DAY	9	2	f	2010-06-24	4358	\N	16800	\N
25134	GENERIC_DAY	9	2	f	2010-06-29	4348	\N	16800	\N
25161	GENERIC_DAY	9	4	f	2010-06-25	21817	\N	16800	\N
25131	GENERIC_DAY	9	0	f	2010-06-20	4350	\N	16800	\N
25117	GENERIC_DAY	9	2	f	2010-06-25	4348	\N	16800	\N
25099	GENERIC_DAY	9	2	f	2010-06-28	4358	\N	16800	\N
25155	GENERIC_DAY	9	0	f	2010-06-15	4344	\N	16800	\N
25116	GENERIC_DAY	9	2	f	2010-06-29	4358	\N	16800	\N
25142	GENERIC_DAY	9	0	f	2010-06-21	4344	\N	16800	\N
25154	GENERIC_DAY	9	5	f	2010-06-17	21817	\N	16800	\N
25118	GENERIC_DAY	9	0	f	2010-06-17	4350	\N	16800	\N
25112	GENERIC_DAY	9	4	f	2010-06-24	21817	\N	16800	\N
25106	GENERIC_DAY	9	3	f	2010-06-17	4358	\N	16800	\N
25153	GENERIC_DAY	9	0	f	2010-06-17	4344	\N	16800	\N
25105	GENERIC_DAY	9	0	f	2010-06-26	4348	\N	16800	\N
25089	GENERIC_DAY	9	1	f	2010-06-30	4358	\N	16800	\N
25265	GENERIC_DAY	7	3	f	2010-07-20	4354	\N	16802	\N
25257	GENERIC_DAY	7	4	f	2010-08-03	4354	\N	16802	\N
25284	GENERIC_DAY	7	0	f	2010-07-10	4352	\N	16802	\N
50592	GENERIC_DAY	2	3	f	2010-08-03	4350	\N	48384	\N
50655	GENERIC_DAY	2	3	t	2010-07-06	21817	\N	48384	\N
50682	GENERIC_DAY	2	0	f	2010-07-31	4348	\N	48384	\N
50672	GENERIC_DAY	2	0	t	2010-07-13	4344	\N	48384	\N
50663	GENERIC_DAY	2	0	t	2010-07-04	21817	\N	48384	\N
50653	GENERIC_DAY	2	4	f	2010-07-30	4358	\N	48384	\N
50695	GENERIC_DAY	2	3	f	2010-08-03	4348	\N	48384	\N
50625	GENERIC_DAY	2	4	f	2010-07-23	4348	\N	48384	\N
50620	GENERIC_DAY	2	0	f	2010-07-24	4350	\N	48384	\N
50630	GENERIC_DAY	2	2	t	2010-07-05	4358	\N	48384	\N
50645	GENERIC_DAY	2	0	f	2010-07-17	4358	\N	48384	\N
50688	GENERIC_DAY	2	4	f	2010-07-29	4358	\N	48384	\N
50656	GENERIC_DAY	2	2	t	2010-07-09	4358	\N	48384	\N
50694	GENERIC_DAY	2	3	t	2010-07-16	4358	\N	48384	\N
50639	GENERIC_DAY	2	0	t	2010-07-03	4358	\N	48384	\N
50686	GENERIC_DAY	2	0	t	2010-07-02	4350	\N	48384	\N
50607	GENERIC_DAY	2	2	t	2010-07-06	4358	\N	48384	\N
50679	GENERIC_DAY	2	0	f	2010-08-01	4358	\N	48384	\N
50674	GENERIC_DAY	2	0	f	2010-07-31	4350	\N	48384	\N
50681	GENERIC_DAY	2	4	f	2010-07-26	4358	\N	48384	\N
46722	GENERIC_DAY	4	6	t	2010-06-16	1220	\N	45866	\N
46736	GENERIC_DAY	4	0	f	2010-06-27	1216	\N	45866	\N
46731	GENERIC_DAY	4	0	t	2010-06-20	1216	\N	45866	\N
46735	GENERIC_DAY	4	0	t	2010-06-24	1216	\N	45866	\N
46730	GENERIC_DAY	4	12	f	2010-06-30	1220	\N	45866	\N
46728	GENERIC_DAY	4	8	t	2010-06-23	1220	\N	45866	\N
46715	GENERIC_DAY	4	14	f	2010-06-29	1220	\N	45866	\N
46739	GENERIC_DAY	4	8	t	2010-06-22	1220	\N	45866	\N
46734	GENERIC_DAY	4	6	t	2010-06-15	1220	\N	45866	\N
46738	GENERIC_DAY	4	0	t	2010-06-22	1216	\N	45866	\N
46737	GENERIC_DAY	4	0	t	2010-06-23	1216	\N	45866	\N
46724	GENERIC_DAY	4	14	f	2010-06-28	1220	\N	45866	\N
46717	GENERIC_DAY	4	6	f	2010-06-28	1216	\N	45866	\N
52639	GENERIC_DAY	0	0	f	2010-07-20	4352	\N	50806	\N
52640	GENERIC_DAY	0	2	f	2010-08-10	4352	\N	50806	\N
52641	GENERIC_DAY	0	1	f	2010-08-09	4354	\N	50806	\N
52642	GENERIC_DAY	0	3	f	2010-06-18	4354	\N	50806	\N
52643	GENERIC_DAY	0	3	f	2010-07-05	4354	\N	50806	\N
52644	GENERIC_DAY	0	3	f	2010-07-14	4354	\N	50806	\N
52645	GENERIC_DAY	0	3	f	2010-07-23	4354	\N	50806	\N
52646	GENERIC_DAY	0	3	f	2010-07-13	4354	\N	50806	\N
52647	GENERIC_DAY	0	0	f	2010-06-19	4354	\N	50806	\N
52648	GENERIC_DAY	0	3	f	2010-07-27	4354	\N	50806	\N
52649	GENERIC_DAY	0	0	f	2010-07-17	4354	\N	50806	\N
52650	GENERIC_DAY	0	0	f	2010-07-14	4352	\N	50806	\N
52651	GENERIC_DAY	0	1	f	2010-08-05	4354	\N	50806	\N
46725	GENERIC_DAY	4	6	t	2010-06-17	1220	\N	45866	\N
46721	GENERIC_DAY	4	0	t	2010-06-19	1216	\N	45866	\N
46713	GENERIC_DAY	4	14	f	2010-06-25	1220	\N	45866	\N
46709	GENERIC_DAY	4	1	t	2010-06-14	1216	\N	45866	\N
46710	GENERIC_DAY	4	6	f	2010-06-25	1216	\N	45866	\N
46718	GENERIC_DAY	4	2	t	2010-06-18	1216	\N	45866	\N
46740	GENERIC_DAY	4	7	t	2010-06-14	1220	\N	45866	\N
25262	GENERIC_DAY	7	0	f	2010-07-25	4354	\N	16802	\N
25279	GENERIC_DAY	7	0	f	2010-07-10	4354	\N	16802	\N
25272	GENERIC_DAY	7	3	f	2010-07-14	4354	\N	16802	\N
25275	GENERIC_DAY	7	0	f	2010-07-03	4354	\N	16802	\N
25243	GENERIC_DAY	7	4	f	2010-08-02	4352	\N	16802	\N
25304	GENERIC_DAY	7	4	f	2010-07-01	4352	\N	16802	\N
25285	GENERIC_DAY	7	4	f	2010-08-04	4354	\N	16802	\N
25299	GENERIC_DAY	7	0	f	2010-08-01	4352	\N	16802	\N
25297	GENERIC_DAY	7	4	f	2010-07-26	4352	\N	16802	\N
25255	GENERIC_DAY	7	3	f	2010-07-12	4354	\N	16802	\N
25259	GENERIC_DAY	7	3	f	2010-07-19	4354	\N	16802	\N
25273	GENERIC_DAY	7	3	f	2010-07-09	4354	\N	16802	\N
25258	GENERIC_DAY	7	5	f	2010-07-05	4352	\N	16802	\N
25247	GENERIC_DAY	7	4	f	2010-07-02	4354	\N	16802	\N
25295	GENERIC_DAY	7	3	f	2010-07-07	4354	\N	16802	\N
25291	GENERIC_DAY	7	5	f	2010-07-13	4352	\N	16802	\N
25286	GENERIC_DAY	7	0	f	2010-08-01	4354	\N	16802	\N
25280	GENERIC_DAY	7	5	f	2010-07-20	4352	\N	16802	\N
25241	GENERIC_DAY	7	4	f	2010-07-02	4352	\N	16802	\N
25252	GENERIC_DAY	7	4	f	2010-07-21	4352	\N	16802	\N
25289	GENERIC_DAY	7	4	f	2010-07-28	4354	\N	16802	\N
25301	GENERIC_DAY	7	5	f	2010-07-15	4352	\N	16802	\N
25264	GENERIC_DAY	7	4	f	2010-07-27	4354	\N	16802	\N
25242	GENERIC_DAY	7	0	f	2010-07-18	4354	\N	16802	\N
25235	GENERIC_DAY	7	4	f	2010-07-01	4354	\N	16802	\N
25287	GENERIC_DAY	7	5	f	2010-07-14	4352	\N	16802	\N
25253	GENERIC_DAY	7	0	f	2010-07-04	4354	\N	16802	\N
25246	GENERIC_DAY	7	4	f	2010-07-30	4352	\N	16802	\N
25256	GENERIC_DAY	7	4	f	2010-07-27	4352	\N	16802	\N
25249	GENERIC_DAY	7	4	f	2010-07-26	4354	\N	16802	\N
25302	GENERIC_DAY	7	0	f	2010-07-11	4352	\N	16802	\N
25267	GENERIC_DAY	7	0	f	2010-07-18	4352	\N	16802	\N
25281	GENERIC_DAY	7	3	f	2010-07-08	4354	\N	16802	\N
25277	GENERIC_DAY	7	5	f	2010-07-09	4352	\N	16802	\N
25288	GENERIC_DAY	7	4	f	2010-07-23	4354	\N	16802	\N
25240	GENERIC_DAY	7	4	f	2010-07-21	4354	\N	16802	\N
25270	GENERIC_DAY	7	4	f	2010-07-23	4352	\N	16802	\N
25236	GENERIC_DAY	7	4	f	2010-07-29	4354	\N	16802	\N
25293	GENERIC_DAY	7	0	f	2010-07-25	4352	\N	16802	\N
25260	GENERIC_DAY	7	0	f	2010-07-17	4354	\N	16802	\N
25298	GENERIC_DAY	7	0	f	2010-07-04	4352	\N	16802	\N
25303	GENERIC_DAY	7	3	f	2010-07-16	4354	\N	16802	\N
25268	GENERIC_DAY	7	5	f	2010-07-06	4352	\N	16802	\N
25274	GENERIC_DAY	7	5	f	2010-07-19	4352	\N	16802	\N
25290	GENERIC_DAY	7	5	f	2010-07-08	4352	\N	16802	\N
25282	GENERIC_DAY	7	4	f	2010-07-29	4352	\N	16802	\N
25244	GENERIC_DAY	7	0	f	2010-07-31	4352	\N	16802	\N
25271	GENERIC_DAY	7	5	f	2010-07-16	4352	\N	16802	\N
25245	GENERIC_DAY	7	4	f	2010-07-22	4354	\N	16802	\N
25283	GENERIC_DAY	7	3	f	2010-07-05	4354	\N	16802	\N
25251	GENERIC_DAY	7	3	f	2010-07-15	4354	\N	16802	\N
25294	GENERIC_DAY	7	0	f	2010-07-03	4352	\N	16802	\N
25238	GENERIC_DAY	7	0	f	2010-07-31	4354	\N	16802	\N
25254	GENERIC_DAY	7	3	f	2010-07-06	4354	\N	16802	\N
25266	GENERIC_DAY	7	4	f	2010-07-22	4352	\N	16802	\N
25261	GENERIC_DAY	7	4	f	2010-08-02	4354	\N	16802	\N
25292	GENERIC_DAY	7	4	f	2010-08-03	4352	\N	16802	\N
25300	GENERIC_DAY	7	5	f	2010-07-12	4352	\N	16802	\N
25250	GENERIC_DAY	7	4	f	2010-07-30	4354	\N	16802	\N
25263	GENERIC_DAY	7	0	f	2010-07-17	4352	\N	16802	\N
25237	GENERIC_DAY	7	0	f	2010-07-11	4354	\N	16802	\N
25276	GENERIC_DAY	7	0	f	2010-07-24	4354	\N	16802	\N
50611	GENERIC_DAY	2	4	f	2010-07-23	4358	\N	48384	\N
50600	GENERIC_DAY	2	4	f	2010-07-20	4350	\N	48384	\N
50643	GENERIC_DAY	2	0	t	2010-07-15	4344	\N	48384	\N
50613	GENERIC_DAY	2	2	t	2010-07-13	21817	\N	48384	\N
50614	GENERIC_DAY	2	4	f	2010-08-02	4348	\N	48384	\N
50618	GENERIC_DAY	2	0	t	2010-07-06	4344	\N	48384	\N
50631	GENERIC_DAY	2	2	t	2010-07-12	21817	\N	48384	\N
50624	GENERIC_DAY	2	0	t	2010-07-11	4358	\N	48384	\N
50594	GENERIC_DAY	2	2	t	2010-07-09	21817	\N	48384	\N
50608	GENERIC_DAY	2	5	f	2010-08-02	4344	\N	48384	\N
50626	GENERIC_DAY	2	4	f	2010-07-19	4348	\N	48384	\N
50593	GENERIC_DAY	2	2	t	2010-07-07	4358	\N	48384	\N
50622	GENERIC_DAY	2	4	f	2010-07-28	4344	\N	48384	\N
50638	GENERIC_DAY	2	0	t	2010-07-05	4350	\N	48384	\N
50644	GENERIC_DAY	2	0	f	2010-07-24	4344	\N	48384	\N
50604	GENERIC_DAY	2	0	t	2010-07-03	21817	\N	48384	\N
50632	GENERIC_DAY	2	0	t	2010-07-02	4344	\N	48384	\N
50621	GENERIC_DAY	2	4	f	2010-07-30	4350	\N	48384	\N
50628	GENERIC_DAY	2	2	t	2010-07-12	4358	\N	48384	\N
50610	GENERIC_DAY	2	0	f	2010-07-17	4344	\N	48384	\N
50601	GENERIC_DAY	2	0	t	2010-07-11	21817	\N	48384	\N
50602	GENERIC_DAY	2	4	f	2010-07-23	4350	\N	48384	\N
50617	GENERIC_DAY	2	2	t	2010-07-16	4350	\N	48384	\N
50637	GENERIC_DAY	2	0	t	2010-07-03	4348	\N	48384	\N
50615	GENERIC_DAY	2	0	t	2010-07-06	4350	\N	48384	\N
50598	GENERIC_DAY	2	4	f	2010-07-27	4350	\N	48384	\N
50623	GENERIC_DAY	2	2	t	2010-07-08	4350	\N	48384	\N
50606	GENERIC_DAY	2	4	f	2010-07-20	4358	\N	48384	\N
50636	GENERIC_DAY	2	4	f	2010-07-19	4350	\N	48384	\N
50596	GENERIC_DAY	2	2	t	2010-07-12	4350	\N	48384	\N
50642	GENERIC_DAY	2	0	t	2010-07-03	4350	\N	48384	\N
50635	GENERIC_DAY	2	2	t	2010-07-09	4348	\N	48384	\N
50689	GENERIC_DAY	2	0	f	2010-08-01	4348	\N	48384	\N
50595	GENERIC_DAY	2	4	f	2010-07-26	4350	\N	48384	\N
50675	GENERIC_DAY	2	3	t	2010-07-05	4348	\N	48384	\N
50654	GENERIC_DAY	2	0	f	2010-07-24	4358	\N	48384	\N
50597	GENERIC_DAY	2	4	f	2010-07-19	4358	\N	48384	\N
50627	GENERIC_DAY	2	0	f	2010-07-18	4344	\N	48384	\N
52652	GENERIC_DAY	0	0	f	2010-07-24	4354	\N	50806	\N
52653	GENERIC_DAY	0	3	f	2010-06-17	4354	\N	50806	\N
52654	GENERIC_DAY	0	0	f	2010-07-01	4352	\N	50806	\N
52655	GENERIC_DAY	0	2	f	2010-08-11	4352	\N	50806	\N
52656	GENERIC_DAY	0	3	f	2010-06-29	4354	\N	50806	\N
52657	GENERIC_DAY	0	0	f	2010-07-29	4352	\N	50806	\N
52658	GENERIC_DAY	0	0	f	2010-07-11	4352	\N	50806	\N
52659	GENERIC_DAY	0	3	f	2010-07-30	4354	\N	50806	\N
52660	GENERIC_DAY	0	3	f	2010-08-04	4354	\N	50806	\N
52661	GENERIC_DAY	0	0	f	2010-07-31	4354	\N	50806	\N
52662	GENERIC_DAY	0	0	f	2010-07-11	4354	\N	50806	\N
52663	GENERIC_DAY	0	3	f	2010-07-07	4354	\N	50806	\N
52664	GENERIC_DAY	0	0	f	2010-07-04	4352	\N	50806	\N
52665	GENERIC_DAY	0	0	t	2010-06-15	4352	\N	50806	\N
52666	GENERIC_DAY	0	0	t	2010-06-16	4352	\N	50806	\N
52667	GENERIC_DAY	0	0	f	2010-06-19	4352	\N	50806	\N
52668	GENERIC_DAY	0	8	t	2010-06-16	4354	\N	50806	\N
52669	GENERIC_DAY	0	0	f	2010-06-21	4352	\N	50806	\N
52670	GENERIC_DAY	0	0	f	2010-07-07	4352	\N	50806	\N
52671	GENERIC_DAY	0	0	f	2010-06-30	4352	\N	50806	\N
52672	GENERIC_DAY	0	3	f	2010-07-02	4354	\N	50806	\N
52673	GENERIC_DAY	0	0	f	2010-08-08	4352	\N	50806	\N
52674	GENERIC_DAY	0	0	f	2010-07-22	4352	\N	50806	\N
52675	GENERIC_DAY	0	3	f	2010-06-28	4354	\N	50806	\N
52676	GENERIC_DAY	0	0	f	2010-07-24	4352	\N	50806	\N
52677	GENERIC_DAY	0	2	f	2010-08-05	4352	\N	50806	\N
52678	GENERIC_DAY	0	0	f	2010-07-03	4354	\N	50806	\N
52679	GENERIC_DAY	0	3	f	2010-07-12	4354	\N	50806	\N
52680	GENERIC_DAY	0	0	f	2010-06-26	4354	\N	50806	\N
52681	GENERIC_DAY	0	3	f	2010-07-06	4354	\N	50806	\N
52682	GENERIC_DAY	0	3	f	2010-07-21	4354	\N	50806	\N
52683	GENERIC_DAY	0	3	f	2010-07-20	4354	\N	50806	\N
52684	GENERIC_DAY	0	0	f	2010-06-24	4352	\N	50806	\N
52685	GENERIC_DAY	0	0	f	2010-06-22	4352	\N	50806	\N
52686	GENERIC_DAY	0	0	f	2010-07-05	4352	\N	50806	\N
52687	GENERIC_DAY	0	0	f	2010-07-08	4352	\N	50806	\N
52688	GENERIC_DAY	0	0	f	2010-07-23	4352	\N	50806	\N
52689	GENERIC_DAY	0	0	f	2010-06-29	4352	\N	50806	\N
52690	GENERIC_DAY	0	0	f	2010-06-18	4352	\N	50806	\N
52691	GENERIC_DAY	0	0	f	2010-08-07	4354	\N	50806	\N
52692	GENERIC_DAY	0	2	f	2010-08-09	4352	\N	50806	\N
52693	GENERIC_DAY	0	3	f	2010-07-22	4354	\N	50806	\N
52694	GENERIC_DAY	0	3	f	2010-07-01	4354	\N	50806	\N
52695	GENERIC_DAY	0	0	f	2010-07-28	4352	\N	50806	\N
52696	GENERIC_DAY	0	0	f	2010-06-27	4352	\N	50806	\N
52697	GENERIC_DAY	0	0	f	2010-06-26	4352	\N	50806	\N
52698	GENERIC_DAY	0	3	f	2010-07-26	4354	\N	50806	\N
52699	GENERIC_DAY	0	0	f	2010-07-26	4352	\N	50806	\N
52700	GENERIC_DAY	0	0	f	2010-07-17	4352	\N	50806	\N
52701	GENERIC_DAY	0	0	f	2010-08-01	4354	\N	50806	\N
52702	GENERIC_DAY	0	0	f	2010-08-02	4352	\N	50806	\N
52703	GENERIC_DAY	0	0	f	2010-07-10	4354	\N	50806	\N
52704	GENERIC_DAY	0	0	f	2010-06-20	4354	\N	50806	\N
52705	GENERIC_DAY	0	3	f	2010-07-19	4354	\N	50806	\N
52706	GENERIC_DAY	0	0	f	2010-06-27	4354	\N	50806	\N
52707	GENERIC_DAY	0	0	f	2010-06-17	4352	\N	50806	\N
52708	GENERIC_DAY	0	3	f	2010-07-16	4354	\N	50806	\N
52709	GENERIC_DAY	0	0	f	2010-07-27	4352	\N	50806	\N
52710	GENERIC_DAY	0	1	f	2010-08-11	4354	\N	50806	\N
52711	GENERIC_DAY	0	3	f	2010-06-21	4354	\N	50806	\N
52712	GENERIC_DAY	0	0	f	2010-07-12	4352	\N	50806	\N
52713	GENERIC_DAY	0	0	f	2010-06-20	4352	\N	50806	\N
52714	GENERIC_DAY	0	0	f	2010-08-03	4352	\N	50806	\N
52715	GENERIC_DAY	0	0	f	2010-07-10	4352	\N	50806	\N
52716	GENERIC_DAY	0	0	f	2010-07-25	4354	\N	50806	\N
52717	GENERIC_DAY	0	0	f	2010-06-23	4352	\N	50806	\N
52718	GENERIC_DAY	0	3	f	2010-07-09	4354	\N	50806	\N
52719	GENERIC_DAY	0	8	t	2010-06-14	4354	\N	50806	\N
52720	GENERIC_DAY	0	0	f	2010-07-30	4352	\N	50806	\N
52721	GENERIC_DAY	0	3	f	2010-06-22	4354	\N	50806	\N
52722	GENERIC_DAY	0	0	f	2010-07-02	4352	\N	50806	\N
52723	GENERIC_DAY	0	3	f	2010-08-02	4354	\N	50806	\N
52724	GENERIC_DAY	0	3	f	2010-07-08	4354	\N	50806	\N
52725	GENERIC_DAY	0	0	f	2010-07-16	4352	\N	50806	\N
52726	GENERIC_DAY	0	0	f	2010-07-25	4352	\N	50806	\N
52727	GENERIC_DAY	0	0	f	2010-07-31	4352	\N	50806	\N
52728	GENERIC_DAY	0	0	f	2010-07-09	4352	\N	50806	\N
52729	GENERIC_DAY	0	3	f	2010-06-30	4354	\N	50806	\N
52730	GENERIC_DAY	0	0	f	2010-07-03	4352	\N	50806	\N
52731	GENERIC_DAY	0	3	f	2010-07-29	4354	\N	50806	\N
52732	GENERIC_DAY	0	0	f	2010-07-18	4354	\N	50806	\N
52733	GENERIC_DAY	0	3	f	2010-06-25	4354	\N	50806	\N
52734	GENERIC_DAY	0	0	f	2010-07-18	4352	\N	50806	\N
52735	GENERIC_DAY	0	0	f	2010-07-15	4352	\N	50806	\N
52736	GENERIC_DAY	0	0	f	2010-08-04	4352	\N	50806	\N
52737	GENERIC_DAY	0	0	f	2010-08-08	4354	\N	50806	\N
52738	GENERIC_DAY	0	0	f	2010-07-21	4352	\N	50806	\N
52739	GENERIC_DAY	0	0	f	2010-07-13	4352	\N	50806	\N
52740	GENERIC_DAY	0	3	f	2010-06-24	4354	\N	50806	\N
52741	GENERIC_DAY	0	1	f	2010-08-06	4354	\N	50806	\N
52742	GENERIC_DAY	0	0	f	2010-08-07	4352	\N	50806	\N
52743	GENERIC_DAY	0	0	f	2010-06-28	4352	\N	50806	\N
52744	GENERIC_DAY	0	0	f	2010-07-04	4354	\N	50806	\N
52745	GENERIC_DAY	0	0	f	2010-07-06	4352	\N	50806	\N
52746	GENERIC_DAY	0	0	f	2010-06-25	4352	\N	50806	\N
52747	GENERIC_DAY	0	0	f	2010-08-01	4352	\N	50806	\N
52748	GENERIC_DAY	0	1	f	2010-08-10	4354	\N	50806	\N
52749	GENERIC_DAY	0	3	f	2010-08-03	4354	\N	50806	\N
52750	GENERIC_DAY	0	8	t	2010-06-15	4354	\N	50806	\N
52751	GENERIC_DAY	0	3	f	2010-07-28	4354	\N	50806	\N
52752	GENERIC_DAY	0	3	f	2010-07-15	4354	\N	50806	\N
52753	GENERIC_DAY	0	0	f	2010-07-19	4352	\N	50806	\N
52754	GENERIC_DAY	0	3	f	2010-06-23	4354	\N	50806	\N
52755	GENERIC_DAY	0	2	f	2010-08-06	4352	\N	50806	\N
268296	GENERIC_DAY	0	0	f	2010-08-22	1216	\N	9406	\N
268297	GENERIC_DAY	0	0	f	2010-08-15	1220	\N	9406	\N
268298	GENERIC_DAY	0	0	f	2010-08-21	4356	\N	9406	\N
268299	GENERIC_DAY	0	0	f	2010-08-20	4348	\N	9406	\N
268300	GENERIC_DAY	0	0	f	2010-08-21	1214	\N	9406	\N
268301	GENERIC_DAY	0	4	f	2010-08-17	4356	\N	9406	\N
268302	GENERIC_DAY	0	0	f	2010-08-13	4354	\N	9406	\N
268303	GENERIC_DAY	0	0	f	2010-08-18	4344	\N	9406	\N
268304	GENERIC_DAY	0	0	f	2010-08-16	4358	\N	9406	\N
268305	GENERIC_DAY	0	0	f	2010-08-13	4348	\N	9406	\N
268306	GENERIC_DAY	0	0	f	2010-08-13	1220	\N	9406	\N
268307	GENERIC_DAY	0	4	f	2010-08-18	1214	\N	9406	\N
268308	GENERIC_DAY	0	0	f	2010-08-16	4344	\N	9406	\N
268309	GENERIC_DAY	0	0	f	2010-08-15	4350	\N	9406	\N
268310	GENERIC_DAY	0	0	f	2010-08-14	4344	\N	9406	\N
268311	GENERIC_DAY	0	0	f	2010-08-23	1214	\N	9406	\N
268312	GENERIC_DAY	0	0	f	2010-08-19	4344	\N	9406	\N
268313	GENERIC_DAY	0	0	f	2010-08-16	4354	\N	9406	\N
268314	GENERIC_DAY	0	0	f	2010-08-16	4352	\N	9406	\N
268315	GENERIC_DAY	0	0	f	2010-08-21	4348	\N	9406	\N
268316	GENERIC_DAY	0	0	f	2010-08-16	1216	\N	9406	\N
268317	GENERIC_DAY	0	0	f	2010-08-14	1214	\N	9406	\N
268318	GENERIC_DAY	0	0	f	2010-08-14	4348	\N	9406	\N
268319	GENERIC_DAY	0	0	f	2010-08-18	4352	\N	9406	\N
268320	GENERIC_DAY	0	0	f	2010-08-14	1216	\N	9406	\N
268321	GENERIC_DAY	0	0	f	2010-08-21	4358	\N	9406	\N
268322	GENERIC_DAY	0	0	f	2010-08-23	4354	\N	9406	\N
268323	GENERIC_DAY	0	0	f	2010-08-21	4344	\N	9406	\N
268324	GENERIC_DAY	0	0	f	2010-08-13	1216	\N	9406	\N
268325	GENERIC_DAY	0	0	f	2010-08-22	4344	\N	9406	\N
268326	GENERIC_DAY	0	0	f	2010-08-23	1220	\N	9406	\N
268327	GENERIC_DAY	0	0	f	2010-08-21	4352	\N	9406	\N
268328	GENERIC_DAY	0	4	f	2010-08-17	1214	\N	9406	\N
268329	GENERIC_DAY	0	0	f	2010-08-22	4350	\N	9406	\N
268330	GENERIC_DAY	0	0	f	2010-08-17	4350	\N	9406	\N
268331	GENERIC_DAY	0	0	f	2010-08-18	4354	\N	9406	\N
268332	GENERIC_DAY	0	0	f	2010-08-15	4344	\N	9406	\N
268333	GENERIC_DAY	0	0	f	2010-08-17	4344	\N	9406	\N
268334	GENERIC_DAY	0	0	f	2010-08-23	1216	\N	9406	\N
268335	GENERIC_DAY	0	4	f	2010-08-13	1214	\N	9406	\N
268336	GENERIC_DAY	0	0	f	2010-08-21	1220	\N	9406	\N
268337	GENERIC_DAY	0	0	f	2010-08-18	1216	\N	9406	\N
268338	GENERIC_DAY	0	0	f	2010-08-20	1220	\N	9406	\N
268339	GENERIC_DAY	0	0	f	2010-08-18	4348	\N	9406	\N
268340	GENERIC_DAY	0	0	f	2010-08-13	4352	\N	9406	\N
268341	GENERIC_DAY	0	0	f	2010-08-15	4358	\N	9406	\N
268342	GENERIC_DAY	0	0	f	2010-08-15	1216	\N	9406	\N
268343	GENERIC_DAY	0	0	f	2010-08-15	1214	\N	9406	\N
268344	GENERIC_DAY	0	0	f	2010-08-14	4358	\N	9406	\N
268345	GENERIC_DAY	0	0	f	2010-08-23	4348	\N	9406	\N
268346	GENERIC_DAY	0	0	f	2010-08-15	4352	\N	9406	\N
268347	GENERIC_DAY	0	0	f	2010-08-14	4356	\N	9406	\N
268348	GENERIC_DAY	0	0	f	2010-08-18	4350	\N	9406	\N
268349	GENERIC_DAY	0	4	f	2010-08-13	4356	\N	9406	\N
268350	GENERIC_DAY	0	0	f	2010-08-20	4352	\N	9406	\N
268351	GENERIC_DAY	0	4	f	2010-08-19	1214	\N	9406	\N
268352	GENERIC_DAY	0	0	f	2010-08-21	1216	\N	9406	\N
268353	GENERIC_DAY	0	0	f	2010-08-19	4350	\N	9406	\N
268354	GENERIC_DAY	0	0	f	2010-08-18	1220	\N	9406	\N
268355	GENERIC_DAY	0	0	f	2010-08-23	4350	\N	9406	\N
268356	GENERIC_DAY	0	0	f	2010-08-18	4358	\N	9406	\N
268357	GENERIC_DAY	0	0	f	2010-08-14	4352	\N	9406	\N
268358	GENERIC_DAY	0	0	f	2010-08-15	4354	\N	9406	\N
268359	GENERIC_DAY	0	4	f	2010-08-19	4356	\N	9406	\N
268360	GENERIC_DAY	0	0	f	2010-08-17	4358	\N	9406	\N
268361	GENERIC_DAY	0	0	f	2010-08-22	1214	\N	9406	\N
268362	GENERIC_DAY	0	0	f	2010-08-23	4352	\N	9406	\N
268363	GENERIC_DAY	0	0	f	2010-08-17	1220	\N	9406	\N
268364	GENERIC_DAY	0	0	f	2010-08-16	1220	\N	9406	\N
268365	GENERIC_DAY	0	1	f	2010-08-23	4356	\N	9406	\N
268366	GENERIC_DAY	0	0	f	2010-08-22	4354	\N	9406	\N
268367	GENERIC_DAY	0	0	f	2010-08-22	1220	\N	9406	\N
268368	GENERIC_DAY	0	4	f	2010-08-20	4356	\N	9406	\N
268369	GENERIC_DAY	0	0	f	2010-08-17	4352	\N	9406	\N
268370	GENERIC_DAY	0	0	f	2010-08-13	4358	\N	9406	\N
268371	GENERIC_DAY	0	0	f	2010-08-14	4354	\N	9406	\N
268372	GENERIC_DAY	0	0	f	2010-08-20	4358	\N	9406	\N
268373	GENERIC_DAY	0	0	f	2010-08-19	4348	\N	9406	\N
268374	GENERIC_DAY	0	0	f	2010-08-19	4358	\N	9406	\N
268375	GENERIC_DAY	0	0	f	2010-08-13	4344	\N	9406	\N
268376	GENERIC_DAY	0	0	f	2010-08-22	4358	\N	9406	\N
268377	GENERIC_DAY	0	0	f	2010-08-19	4354	\N	9406	\N
268378	GENERIC_DAY	0	4	f	2010-08-16	1214	\N	9406	\N
268379	GENERIC_DAY	0	0	f	2010-08-19	1216	\N	9406	\N
268380	GENERIC_DAY	0	0	f	2010-08-14	1220	\N	9406	\N
268381	GENERIC_DAY	0	4	f	2010-08-16	4356	\N	9406	\N
268382	GENERIC_DAY	0	4	f	2010-08-20	1214	\N	9406	\N
268383	GENERIC_DAY	0	0	f	2010-08-16	4350	\N	9406	\N
268384	GENERIC_DAY	0	0	f	2010-08-20	1216	\N	9406	\N
268385	GENERIC_DAY	0	0	f	2010-08-22	4352	\N	9406	\N
268386	GENERIC_DAY	0	0	f	2010-08-17	1216	\N	9406	\N
268387	GENERIC_DAY	0	0	f	2010-08-17	4348	\N	9406	\N
268388	GENERIC_DAY	0	0	f	2010-08-19	4352	\N	9406	\N
268389	GENERIC_DAY	0	0	f	2010-08-14	4350	\N	9406	\N
268390	GENERIC_DAY	0	4	f	2010-08-18	4356	\N	9406	\N
268391	GENERIC_DAY	0	0	f	2010-08-21	4350	\N	9406	\N
268392	GENERIC_DAY	0	0	f	2010-08-22	4348	\N	9406	\N
268393	GENERIC_DAY	0	0	f	2010-08-23	4344	\N	9406	\N
268394	GENERIC_DAY	0	0	f	2010-08-21	4354	\N	9406	\N
268395	GENERIC_DAY	0	0	f	2010-08-15	4348	\N	9406	\N
268396	GENERIC_DAY	0	0	f	2010-08-23	4358	\N	9406	\N
268397	GENERIC_DAY	0	0	f	2010-08-15	4356	\N	9406	\N
268398	GENERIC_DAY	0	0	f	2010-08-16	4348	\N	9406	\N
268399	GENERIC_DAY	0	0	f	2010-08-19	1220	\N	9406	\N
268400	GENERIC_DAY	0	0	f	2010-08-20	4350	\N	9406	\N
268401	GENERIC_DAY	0	0	f	2010-08-17	4354	\N	9406	\N
268402	GENERIC_DAY	0	0	f	2010-08-20	4344	\N	9406	\N
268403	GENERIC_DAY	0	0	f	2010-08-22	4356	\N	9406	\N
268404	GENERIC_DAY	0	0	f	2010-08-20	4354	\N	9406	\N
268405	GENERIC_DAY	0	0	f	2010-08-13	4350	\N	9406	\N
31464	SPECIFIC_DAY	1	8	f	2010-07-09	4352	31212	\N	\N
31499	SPECIFIC_DAY	1	8	f	2010-07-29	4352	31212	\N	\N
31451	SPECIFIC_DAY	1	8	f	2010-06-22	4352	31212	\N	\N
31487	SPECIFIC_DAY	1	8	f	2010-06-24	4352	31212	\N	\N
31483	SPECIFIC_DAY	1	8	f	2010-06-15	4352	31212	\N	\N
31458	SPECIFIC_DAY	1	0	f	2010-07-03	4352	31212	\N	\N
31474	SPECIFIC_DAY	1	8	f	2010-07-15	4352	31212	\N	\N
31492	SPECIFIC_DAY	1	0	f	2010-06-26	4352	31212	\N	\N
31477	SPECIFIC_DAY	1	4	f	2010-08-04	4352	31212	\N	\N
31484	SPECIFIC_DAY	1	0	f	2010-06-20	4352	31212	\N	\N
245262	GENERIC_DAY	0	2	f	2010-06-24	4352	\N	245128	\N
245263	GENERIC_DAY	0	6	f	2010-06-23	4354	\N	245128	\N
245264	GENERIC_DAY	0	2	f	2010-06-28	4352	\N	245128	\N
245265	GENERIC_DAY	0	0	f	2010-07-03	4352	\N	245128	\N
245266	GENERIC_DAY	0	2	f	2010-07-01	4352	\N	245128	\N
245267	GENERIC_DAY	0	2	f	2010-06-25	4352	\N	245128	\N
245268	GENERIC_DAY	0	1	f	2010-07-05	4352	\N	245128	\N
245269	GENERIC_DAY	0	0	f	2010-06-26	4352	\N	245128	\N
245270	GENERIC_DAY	0	2	f	2010-06-29	4352	\N	245128	\N
245271	GENERIC_DAY	0	0	f	2010-06-26	4354	\N	245128	\N
245272	GENERIC_DAY	0	6	f	2010-06-24	4354	\N	245128	\N
245273	GENERIC_DAY	0	2	f	2010-06-22	4352	\N	245128	\N
245274	GENERIC_DAY	0	6	f	2010-06-28	4354	\N	245128	\N
245275	GENERIC_DAY	0	6	f	2010-06-25	4354	\N	245128	\N
245276	GENERIC_DAY	0	6	f	2010-07-02	4354	\N	245128	\N
245277	GENERIC_DAY	0	0	f	2010-07-03	4354	\N	245128	\N
245278	GENERIC_DAY	0	1	f	2010-07-07	4352	\N	245128	\N
245279	GENERIC_DAY	0	6	f	2010-07-01	4354	\N	245128	\N
245280	GENERIC_DAY	0	2	f	2010-07-02	4352	\N	245128	\N
245281	GENERIC_DAY	0	2	f	2010-06-23	4352	\N	245128	\N
245282	GENERIC_DAY	0	7	f	2010-07-07	4354	\N	245128	\N
245283	GENERIC_DAY	0	7	f	2010-07-05	4354	\N	245128	\N
245284	GENERIC_DAY	0	0	f	2010-07-04	4354	\N	245128	\N
245285	GENERIC_DAY	0	6	f	2010-06-22	4354	\N	245128	\N
245286	GENERIC_DAY	0	0	f	2010-07-04	4352	\N	245128	\N
245287	GENERIC_DAY	0	0	f	2010-07-08	4352	\N	245128	\N
245288	GENERIC_DAY	0	0	f	2010-06-27	4352	\N	245128	\N
245289	GENERIC_DAY	0	6	f	2010-06-29	4354	\N	245128	\N
245290	GENERIC_DAY	0	2	f	2010-06-30	4352	\N	245128	\N
245291	GENERIC_DAY	0	4	f	2010-07-08	4354	\N	245128	\N
245292	GENERIC_DAY	0	1	f	2010-07-06	4352	\N	245128	\N
245293	GENERIC_DAY	0	0	f	2010-06-27	4354	\N	245128	\N
245294	GENERIC_DAY	0	7	f	2010-07-06	4354	\N	245128	\N
245295	GENERIC_DAY	0	6	f	2010-06-30	4354	\N	245128	\N
21503	GENERIC_DAY	4	3	f	2010-07-15	4350	\N	16773	\N
21504	GENERIC_DAY	4	0	f	2010-07-03	4350	\N	16773	\N
21488	GENERIC_DAY	4	0	f	2010-07-10	4350	\N	16773	\N
21544	GENERIC_DAY	4	4	f	2010-07-08	4348	\N	16773	\N
21562	GENERIC_DAY	4	0	f	2010-07-11	4350	\N	16773	\N
21510	GENERIC_DAY	4	0	f	2010-07-10	4344	\N	16773	\N
21481	GENERIC_DAY	4	0	f	2010-07-11	4344	\N	16773	\N
21532	GENERIC_DAY	4	0	f	2010-07-04	4348	\N	16773	\N
21571	GENERIC_DAY	4	0	f	2010-07-06	4344	\N	16773	\N
21547	GENERIC_DAY	4	0	f	2010-07-03	4358	\N	16773	\N
21527	GENERIC_DAY	4	4	f	2010-07-02	4348	\N	16773	\N
21525	GENERIC_DAY	4	0	f	2010-07-24	4348	\N	16773	\N
21473	GENERIC_DAY	4	1	f	2010-07-28	4348	\N	16773	\N
21567	GENERIC_DAY	4	4	f	2010-07-05	4348	\N	16773	\N
21526	GENERIC_DAY	4	0	f	2010-07-11	4348	\N	16773	\N
21550	GENERIC_DAY	4	0	f	2010-07-24	4344	\N	16773	\N
21578	GENERIC_DAY	4	0	f	2010-07-25	4344	\N	16773	\N
21509	GENERIC_DAY	4	0	f	2010-07-17	4344	\N	16773	\N
21515	GENERIC_DAY	4	2	f	2010-07-14	4358	\N	16773	\N
21559	GENERIC_DAY	4	0	f	2010-07-06	4350	\N	16773	\N
21575	GENERIC_DAY	4	0	f	2010-07-13	4344	\N	16773	\N
21556	GENERIC_DAY	4	0	f	2010-07-09	4344	\N	16773	\N
21521	GENERIC_DAY	4	4	f	2010-07-06	4358	\N	16773	\N
21511	GENERIC_DAY	4	2	f	2010-07-20	4348	\N	16773	\N
21495	GENERIC_DAY	4	0	f	2010-07-11	4358	\N	16773	\N
21539	GENERIC_DAY	4	0	f	2010-07-17	4350	\N	16773	\N
21534	GENERIC_DAY	4	2	f	2010-07-26	4350	\N	16773	\N
21522	GENERIC_DAY	4	3	f	2010-07-09	4350	\N	16773	\N
21538	GENERIC_DAY	4	0	f	2010-07-05	4344	\N	16773	\N
21543	GENERIC_DAY	4	4	f	2010-07-02	4358	\N	16773	\N
21533	GENERIC_DAY	4	0	f	2010-07-14	4344	\N	16773	\N
21500	GENERIC_DAY	4	3	f	2010-07-12	4348	\N	16773	\N
21541	GENERIC_DAY	4	3	f	2010-07-14	4348	\N	16773	\N
21487	GENERIC_DAY	4	2	f	2010-07-19	4358	\N	16773	\N
21518	GENERIC_DAY	4	2	f	2010-07-26	4348	\N	16773	\N
21554	GENERIC_DAY	4	0	f	2010-07-18	4358	\N	16773	\N
21564	GENERIC_DAY	4	0	f	2010-07-24	4350	\N	16773	\N
21472	GENERIC_DAY	4	0	f	2010-07-04	4350	\N	16773	\N
21484	GENERIC_DAY	4	0	f	2010-07-07	4350	\N	16773	\N
21485	GENERIC_DAY	4	0	f	2010-07-25	4350	\N	16773	\N
21561	GENERIC_DAY	4	3	f	2010-07-09	4348	\N	16773	\N
21560	GENERIC_DAY	4	0	f	2010-07-04	4358	\N	16773	\N
21492	GENERIC_DAY	4	2	f	2010-07-21	4358	\N	16773	\N
21577	GENERIC_DAY	4	2	f	2010-07-15	4358	\N	16773	\N
21474	GENERIC_DAY	4	4	f	2010-07-07	4348	\N	16773	\N
21528	GENERIC_DAY	4	0	f	2010-07-24	4358	\N	16773	\N
21480	GENERIC_DAY	4	0	f	2010-07-25	4348	\N	16773	\N
21537	GENERIC_DAY	4	0	f	2010-07-03	4344	\N	16773	\N
21552	GENERIC_DAY	4	2	f	2010-07-27	4358	\N	16773	\N
21520	GENERIC_DAY	4	3	f	2010-07-16	4350	\N	16773	\N
21579	GENERIC_DAY	4	3	f	2010-07-13	4350	\N	16773	\N
21565	GENERIC_DAY	4	0	f	2010-07-18	4348	\N	16773	\N
21529	GENERIC_DAY	4	2	f	2010-07-19	4344	\N	16773	\N
21542	GENERIC_DAY	4	0	f	2010-07-08	4344	\N	16773	\N
21512	GENERIC_DAY	4	2	f	2010-07-23	4358	\N	16773	\N
21549	GENERIC_DAY	4	0	f	2010-07-25	4358	\N	16773	\N
21548	GENERIC_DAY	4	2	f	2010-07-23	4348	\N	16773	\N
21576	GENERIC_DAY	4	2	f	2010-07-20	4350	\N	16773	\N
21516	GENERIC_DAY	4	2	f	2010-07-22	4358	\N	16773	\N
21531	GENERIC_DAY	4	2	f	2010-07-20	4344	\N	16773	\N
21551	GENERIC_DAY	4	0	f	2010-07-10	4358	\N	16773	\N
21566	GENERIC_DAY	4	2	f	2010-07-16	4358	\N	16773	\N
21570	GENERIC_DAY	4	2	f	2010-07-28	4344	\N	16773	\N
21486	GENERIC_DAY	4	2	f	2010-07-12	4358	\N	16773	\N
21569	GENERIC_DAY	4	2	f	2010-07-19	4350	\N	16773	\N
21555	GENERIC_DAY	4	2	f	2010-07-21	4348	\N	16773	\N
21514	GENERIC_DAY	4	2	f	2010-07-27	4350	\N	16773	\N
21501	GENERIC_DAY	4	0	f	2010-07-05	4350	\N	16773	\N
21477	GENERIC_DAY	4	0	f	2010-07-04	4344	\N	16773	\N
21535	GENERIC_DAY	4	2	f	2010-07-27	4344	\N	16773	\N
21573	GENERIC_DAY	4	0	f	2010-07-03	4348	\N	16773	\N
21479	GENERIC_DAY	4	0	f	2010-07-10	4348	\N	16773	\N
21508	GENERIC_DAY	4	2	f	2010-07-27	4348	\N	16773	\N
21523	GENERIC_DAY	4	3	f	2010-07-14	4350	\N	16773	\N
21507	GENERIC_DAY	4	0	f	2010-07-07	4344	\N	16773	\N
21476	GENERIC_DAY	4	0	f	2010-07-18	4350	\N	16773	\N
21494	GENERIC_DAY	4	2	f	2010-07-26	4358	\N	16773	\N
21557	GENERIC_DAY	4	2	f	2010-07-13	4358	\N	16773	\N
21513	GENERIC_DAY	4	0	f	2010-07-17	4348	\N	16773	\N
21574	GENERIC_DAY	4	0	f	2010-07-02	4344	\N	16773	\N
21478	GENERIC_DAY	4	2	f	2010-07-23	4350	\N	16773	\N
21475	GENERIC_DAY	4	2	f	2010-07-22	4348	\N	16773	\N
21489	GENERIC_DAY	4	4	f	2010-07-08	4358	\N	16773	\N
21482	GENERIC_DAY	4	2	f	2010-07-09	4358	\N	16773	\N
21553	GENERIC_DAY	4	3	f	2010-07-13	4348	\N	16773	\N
21496	GENERIC_DAY	4	2	f	2010-07-23	4344	\N	16773	\N
21545	GENERIC_DAY	4	4	f	2010-07-05	4358	\N	16773	\N
21563	GENERIC_DAY	4	0	f	2010-07-02	4350	\N	16773	\N
21497	GENERIC_DAY	4	0	f	2010-07-17	4358	\N	16773	\N
21530	GENERIC_DAY	4	2	f	2010-07-21	4344	\N	16773	\N
21505	GENERIC_DAY	4	2	f	2010-07-28	4350	\N	16773	\N
21490	GENERIC_DAY	4	2	f	2010-07-22	4344	\N	16773	\N
21491	GENERIC_DAY	4	0	f	2010-07-16	4344	\N	16773	\N
21546	GENERIC_DAY	4	0	f	2010-07-15	4344	\N	16773	\N
21502	GENERIC_DAY	4	3	f	2010-07-12	4350	\N	16773	\N
21483	GENERIC_DAY	4	2	f	2010-07-26	4344	\N	16773	\N
21493	GENERIC_DAY	4	1	f	2010-07-28	4358	\N	16773	\N
21499	GENERIC_DAY	4	3	f	2010-07-15	4348	\N	16773	\N
21558	GENERIC_DAY	4	4	f	2010-07-06	4348	\N	16773	\N
21536	GENERIC_DAY	4	2	f	2010-07-20	4358	\N	16773	\N
21506	GENERIC_DAY	4	0	f	2010-07-08	4350	\N	16773	\N
21540	GENERIC_DAY	4	2	f	2010-07-22	4350	\N	16773	\N
21519	GENERIC_DAY	4	0	f	2010-07-12	4344	\N	16773	\N
21517	GENERIC_DAY	4	2	f	2010-07-21	4350	\N	16773	\N
21524	GENERIC_DAY	4	4	f	2010-07-07	4358	\N	16773	\N
21572	GENERIC_DAY	4	2	f	2010-07-19	4348	\N	16773	\N
21498	GENERIC_DAY	4	0	f	2010-07-18	4344	\N	16773	\N
21568	GENERIC_DAY	4	3	f	2010-07-16	4348	\N	16773	\N
21590	GENERIC_DAY	4	0	f	2010-08-22	4350	\N	16774	\N
21620	GENERIC_DAY	4	2	f	2010-08-17	4344	\N	16774	\N
21667	GENERIC_DAY	4	2	f	2010-08-25	4344	\N	16774	\N
21695	GENERIC_DAY	4	2	f	2010-08-20	4350	\N	16774	\N
21632	GENERIC_DAY	4	0	f	2010-08-21	4344	\N	16774	\N
21716	GENERIC_DAY	4	2	f	2010-07-30	4348	\N	16774	\N
21582	GENERIC_DAY	4	2	f	2010-09-01	4350	\N	16774	\N
21684	GENERIC_DAY	4	0	f	2010-08-21	4348	\N	16774	\N
21714	GENERIC_DAY	4	2	f	2010-08-18	4358	\N	16774	\N
21704	GENERIC_DAY	4	2	f	2010-08-27	4350	\N	16774	\N
21625	GENERIC_DAY	4	2	f	2010-08-06	4348	\N	16774	\N
21697	GENERIC_DAY	4	2	f	2010-07-29	4350	\N	16774	\N
21606	GENERIC_DAY	4	0	f	2010-08-28	4348	\N	16774	\N
21683	GENERIC_DAY	4	2	f	2010-07-29	4358	\N	16774	\N
21687	GENERIC_DAY	4	2	f	2010-08-31	4348	\N	16774	\N
21581	GENERIC_DAY	4	2	f	2010-08-18	4348	\N	16774	\N
21593	GENERIC_DAY	4	2	f	2010-08-30	4344	\N	16774	\N
21689	GENERIC_DAY	4	0	f	2010-07-31	4350	\N	16774	\N
21692	GENERIC_DAY	4	2	f	2010-08-31	4358	\N	16774	\N
21600	GENERIC_DAY	4	2	f	2010-08-10	4344	\N	16774	\N
21644	GENERIC_DAY	4	2	f	2010-08-02	4350	\N	16774	\N
21688	GENERIC_DAY	4	0	f	2010-08-28	4344	\N	16774	\N
21703	GENERIC_DAY	4	2	f	2010-08-10	4358	\N	16774	\N
21583	GENERIC_DAY	4	2	f	2010-08-16	4344	\N	16774	\N
21657	GENERIC_DAY	4	2	f	2010-08-18	4350	\N	16774	\N
21636	GENERIC_DAY	4	2	f	2010-08-09	4358	\N	16774	\N
21696	GENERIC_DAY	4	2	f	2010-08-26	4350	\N	16774	\N
21647	GENERIC_DAY	4	0	f	2010-08-07	4344	\N	16774	\N
21702	GENERIC_DAY	4	0	f	2010-08-22	4358	\N	16774	\N
21710	GENERIC_DAY	4	2	f	2010-08-24	4344	\N	16774	\N
21630	GENERIC_DAY	4	0	f	2010-08-29	4350	\N	16774	\N
21619	GENERIC_DAY	4	0	f	2010-08-21	4358	\N	16774	\N
21594	GENERIC_DAY	4	2	f	2010-08-11	4350	\N	16774	\N
21698	GENERIC_DAY	4	0	f	2010-08-07	4348	\N	16774	\N
21650	GENERIC_DAY	4	0	f	2010-08-15	4350	\N	16774	\N
21712	GENERIC_DAY	4	0	f	2010-08-22	4344	\N	16774	\N
21604	GENERIC_DAY	4	2	f	2010-08-03	4358	\N	16774	\N
21616	GENERIC_DAY	4	2	f	2010-08-19	4344	\N	16774	\N
21639	GENERIC_DAY	4	2	f	2010-09-01	4348	\N	16774	\N
21633	GENERIC_DAY	4	2	f	2010-08-24	4350	\N	16774	\N
21671	GENERIC_DAY	4	2	f	2010-08-31	4344	\N	16774	\N
21705	GENERIC_DAY	4	0	f	2010-08-01	4350	\N	16774	\N
21664	GENERIC_DAY	4	2	f	2010-08-13	4358	\N	16774	\N
21668	GENERIC_DAY	4	2	f	2010-08-27	4348	\N	16774	\N
21673	GENERIC_DAY	4	0	f	2010-07-31	4358	\N	16774	\N
21623	GENERIC_DAY	4	2	f	2010-08-04	4344	\N	16774	\N
21676	GENERIC_DAY	4	0	f	2010-08-22	4348	\N	16774	\N
21670	GENERIC_DAY	4	2	f	2010-08-12	4344	\N	16774	\N
21713	GENERIC_DAY	4	0	f	2010-08-29	4358	\N	16774	\N
21611	GENERIC_DAY	4	2	f	2010-08-04	4358	\N	16774	\N
21596	GENERIC_DAY	4	0	f	2010-08-01	4358	\N	16774	\N
21591	GENERIC_DAY	4	2	f	2010-08-06	4344	\N	16774	\N
21624	GENERIC_DAY	4	0	f	2010-08-14	4344	\N	16774	\N
21599	GENERIC_DAY	4	2	f	2010-07-29	4344	\N	16774	\N
21651	GENERIC_DAY	4	2	f	2010-08-06	4358	\N	16774	\N
21679	GENERIC_DAY	4	2	f	2010-08-25	4358	\N	16774	\N
21675	GENERIC_DAY	4	2	f	2010-08-03	4344	\N	16774	\N
21613	GENERIC_DAY	4	2	f	2010-08-03	4348	\N	16774	\N
21649	GENERIC_DAY	4	2	f	2010-08-19	4348	\N	16774	\N
21700	GENERIC_DAY	4	0	f	2010-08-21	4350	\N	16774	\N
21641	GENERIC_DAY	4	0	f	2010-08-28	4358	\N	16774	\N
21715	GENERIC_DAY	4	0	f	2010-08-01	4344	\N	16774	\N
21686	GENERIC_DAY	4	2	f	2010-08-17	4350	\N	16774	\N
21597	GENERIC_DAY	4	2	f	2010-08-05	4350	\N	16774	\N
21707	GENERIC_DAY	4	2	f	2010-08-02	4358	\N	16774	\N
21587	GENERIC_DAY	4	2	f	2010-08-25	4348	\N	16774	\N
21585	GENERIC_DAY	4	2	f	2010-08-25	4350	\N	16774	\N
21706	GENERIC_DAY	4	2	f	2010-08-19	4350	\N	16774	\N
21617	GENERIC_DAY	4	0	f	2010-08-15	4344	\N	16774	\N
21658	GENERIC_DAY	4	2	f	2010-08-27	4358	\N	16774	\N
21694	GENERIC_DAY	4	0	f	2010-08-08	4358	\N	16774	\N
21709	GENERIC_DAY	4	2	f	2010-08-03	4350	\N	16774	\N
21621	GENERIC_DAY	4	2	f	2010-08-12	4348	\N	16774	\N
21618	GENERIC_DAY	4	0	f	2010-08-08	4348	\N	16774	\N
21665	GENERIC_DAY	4	2	f	2010-08-23	4350	\N	16774	\N
21674	GENERIC_DAY	4	2	f	2010-08-30	4358	\N	16774	\N
21638	GENERIC_DAY	4	2	f	2010-08-10	4348	\N	16774	\N
21627	GENERIC_DAY	4	2	f	2010-08-17	4348	\N	16774	\N
21622	GENERIC_DAY	4	2	f	2010-08-30	4348	\N	16774	\N
21601	GENERIC_DAY	4	0	f	2010-08-14	4358	\N	16774	\N
21637	GENERIC_DAY	4	0	f	2010-08-08	4344	\N	16774	\N
21580	GENERIC_DAY	4	2	f	2010-08-16	4348	\N	16774	\N
21662	GENERIC_DAY	4	2	f	2010-07-29	4348	\N	16774	\N
21661	GENERIC_DAY	4	0	f	2010-07-31	4344	\N	16774	\N
21643	GENERIC_DAY	4	2	f	2010-08-12	4358	\N	16774	\N
21605	GENERIC_DAY	4	2	f	2010-08-24	4348	\N	16774	\N
21603	GENERIC_DAY	4	2	f	2010-08-20	4358	\N	16774	\N
21685	GENERIC_DAY	4	2	f	2010-08-12	4350	\N	16774	\N
21645	GENERIC_DAY	4	2	f	2010-09-01	4344	\N	16774	\N
21635	GENERIC_DAY	4	0	f	2010-08-07	4350	\N	16774	\N
21653	GENERIC_DAY	4	2	f	2010-08-23	4344	\N	16774	\N
21610	GENERIC_DAY	4	2	f	2010-07-30	4350	\N	16774	\N
21631	GENERIC_DAY	4	2	f	2010-08-16	4358	\N	16774	\N
21592	GENERIC_DAY	4	0	f	2010-08-14	4348	\N	16774	\N
21588	GENERIC_DAY	4	2	f	2010-08-02	4344	\N	16774	\N
21718	GENERIC_DAY	4	2	f	2010-08-31	4350	\N	16774	\N
21719	GENERIC_DAY	4	2	f	2010-08-26	4348	\N	16774	\N
21699	GENERIC_DAY	4	2	f	2010-08-09	4344	\N	16774	\N
21642	GENERIC_DAY	4	0	f	2010-08-28	4350	\N	16774	\N
21615	GENERIC_DAY	4	2	f	2010-08-11	4358	\N	16774	\N
21602	GENERIC_DAY	4	0	f	2010-08-15	4348	\N	16774	\N
21660	GENERIC_DAY	4	2	f	2010-08-17	4358	\N	16774	\N
21693	GENERIC_DAY	4	2	f	2010-08-27	4344	\N	16774	\N
21690	GENERIC_DAY	4	2	f	2010-08-05	4344	\N	16774	\N
21634	GENERIC_DAY	4	2	f	2010-08-04	4350	\N	16774	\N
21595	GENERIC_DAY	4	0	f	2010-08-08	4350	\N	16774	\N
21663	GENERIC_DAY	4	2	f	2010-08-02	4348	\N	16774	\N
21598	GENERIC_DAY	4	2	f	2010-08-09	4348	\N	16774	\N
21626	GENERIC_DAY	4	0	f	2010-07-31	4348	\N	16774	\N
21652	GENERIC_DAY	4	2	f	2010-08-09	4350	\N	16774	\N
21708	GENERIC_DAY	4	2	f	2010-08-26	4358	\N	16774	\N
21656	GENERIC_DAY	4	0	f	2010-08-01	4348	\N	16774	\N
21614	GENERIC_DAY	4	2	f	2010-08-20	4348	\N	16774	\N
21628	GENERIC_DAY	4	2	f	2010-08-24	4358	\N	16774	\N
21608	GENERIC_DAY	4	0	f	2010-08-29	4344	\N	16774	\N
21680	GENERIC_DAY	4	2	f	2010-08-04	4348	\N	16774	\N
21682	GENERIC_DAY	4	2	f	2010-08-23	4358	\N	16774	\N
21609	GENERIC_DAY	4	2	f	2010-08-05	4348	\N	16774	\N
21646	GENERIC_DAY	4	2	f	2010-07-30	4344	\N	16774	\N
21607	GENERIC_DAY	4	2	f	2010-08-26	4344	\N	16774	\N
21654	GENERIC_DAY	4	2	f	2010-08-05	4358	\N	16774	\N
21677	GENERIC_DAY	4	2	f	2010-08-13	4348	\N	16774	\N
21589	GENERIC_DAY	4	0	f	2010-08-29	4348	\N	16774	\N
21691	GENERIC_DAY	4	2	f	2010-08-13	4350	\N	16774	\N
21701	GENERIC_DAY	4	2	f	2010-09-01	4358	\N	16774	\N
21584	GENERIC_DAY	4	2	f	2010-08-30	4350	\N	16774	\N
21612	GENERIC_DAY	4	0	f	2010-08-15	4358	\N	16774	\N
21629	GENERIC_DAY	4	2	f	2010-08-19	4358	\N	16774	\N
21672	GENERIC_DAY	4	2	f	2010-07-30	4358	\N	16774	\N
21659	GENERIC_DAY	4	0	f	2010-08-07	4358	\N	16774	\N
21717	GENERIC_DAY	4	2	f	2010-08-13	4344	\N	16774	\N
21678	GENERIC_DAY	4	2	f	2010-08-20	4344	\N	16774	\N
21666	GENERIC_DAY	4	2	f	2010-08-11	4348	\N	16774	\N
21655	GENERIC_DAY	4	2	f	2010-08-10	4350	\N	16774	\N
21586	GENERIC_DAY	4	2	f	2010-08-18	4344	\N	16774	\N
21681	GENERIC_DAY	4	2	f	2010-08-23	4348	\N	16774	\N
21669	GENERIC_DAY	4	0	f	2010-08-14	4350	\N	16774	\N
21648	GENERIC_DAY	4	2	f	2010-08-16	4350	\N	16774	\N
21711	GENERIC_DAY	4	2	f	2010-08-06	4350	\N	16774	\N
21640	GENERIC_DAY	4	2	f	2010-08-11	4344	\N	16774	\N
6505	GENERIC_DAY	16	5	f	2010-07-12	4354	\N	5962	\N
6346	GENERIC_DAY	18	4	t	2010-06-25	4354	\N	5962	\N
6328	GENERIC_DAY	18	0	t	2010-06-19	4354	\N	5962	\N
6281	GENERIC_DAY	18	0	t	2010-06-20	4354	\N	5962	\N
6524	GENERIC_DAY	16	5	f	2010-07-15	4354	\N	5962	\N
6299	GENERIC_DAY	18	4	t	2010-06-25	4352	\N	5962	\N
6310	GENERIC_DAY	18	4	t	2010-06-23	4354	\N	5962	\N
6508	GENERIC_DAY	16	5	f	2010-07-02	4352	\N	5962	\N
6291	GENERIC_DAY	18	4	t	2010-06-15	4354	\N	5962	\N
6500	GENERIC_DAY	16	5	f	2010-07-19	4354	\N	5962	\N
6531	GENERIC_DAY	16	5	f	2010-07-20	4354	\N	5962	\N
6528	GENERIC_DAY	16	4	f	2010-07-15	4352	\N	5962	\N
6529	GENERIC_DAY	16	1	f	2010-06-26	4352	\N	5962	\N
6512	GENERIC_DAY	16	1	f	2010-07-10	4354	\N	5962	\N
6513	GENERIC_DAY	16	4	f	2010-07-07	4352	\N	5962	\N
6295	GENERIC_DAY	18	4	t	2010-06-24	4354	\N	5962	\N
6510	GENERIC_DAY	16	1	f	2010-07-03	4354	\N	5962	\N
6501	GENERIC_DAY	16	5	f	2010-07-09	4354	\N	5962	\N
6497	GENERIC_DAY	16	5	f	2010-07-06	4354	\N	5962	\N
6511	GENERIC_DAY	16	5	f	2010-06-29	4354	\N	5962	\N
6522	GENERIC_DAY	16	1	f	2010-07-18	4354	\N	5962	\N
6344	GENERIC_DAY	18	0	t	2010-06-20	4352	\N	5962	\N
6336	GENERIC_DAY	18	4	t	2010-06-24	4352	\N	5962	\N
6526	GENERIC_DAY	16	1	f	2010-06-27	4352	\N	5962	\N
6527	GENERIC_DAY	16	1	f	2010-07-11	4354	\N	5962	\N
6504	GENERIC_DAY	16	4	f	2010-07-05	4352	\N	5962	\N
6521	GENERIC_DAY	16	5	f	2010-06-30	4352	\N	5962	\N
6502	GENERIC_DAY	16	5	f	2010-06-30	4354	\N	5962	\N
6319	GENERIC_DAY	18	4	t	2010-06-18	4354	\N	5962	\N
6537	GENERIC_DAY	16	1	f	2010-07-04	4354	\N	5962	\N
6534	GENERIC_DAY	16	5	f	2010-07-02	4354	\N	5962	\N
6309	GENERIC_DAY	18	4	t	2010-06-17	4354	\N	5962	\N
6285	GENERIC_DAY	18	4	t	2010-06-16	4352	\N	5962	\N
6503	GENERIC_DAY	16	5	f	2010-07-01	4352	\N	5962	\N
6324	GENERIC_DAY	18	4	t	2010-06-22	4354	\N	5962	\N
6533	GENERIC_DAY	16	5	f	2010-06-28	4352	\N	5962	\N
6538	GENERIC_DAY	16	4	f	2010-07-13	4352	\N	5962	\N
6506	GENERIC_DAY	16	4	f	2010-07-06	4352	\N	5962	\N
6535	GENERIC_DAY	16	1	f	2010-07-17	4354	\N	5962	\N
6509	GENERIC_DAY	16	5	f	2010-07-05	4354	\N	5962	\N
6514	GENERIC_DAY	16	5	f	2010-07-01	4354	\N	5962	\N
6523	GENERIC_DAY	16	4	f	2010-07-12	4352	\N	5962	\N
6327	GENERIC_DAY	18	0	t	2010-06-19	4352	\N	5962	\N
6499	GENERIC_DAY	16	5	f	2010-07-08	4354	\N	5962	\N
6530	GENERIC_DAY	16	4	f	2010-07-08	4352	\N	5962	\N
6507	GENERIC_DAY	16	4	f	2010-07-14	4352	\N	5962	\N
6536	GENERIC_DAY	16	1	f	2010-06-26	4354	\N	5962	\N
6339	GENERIC_DAY	18	4	t	2010-06-18	4352	\N	5962	\N
6303	GENERIC_DAY	18	4	t	2010-06-21	4352	\N	5962	\N
6306	GENERIC_DAY	18	4	t	2010-06-21	4354	\N	5962	\N
6519	GENERIC_DAY	16	1	f	2010-06-27	4354	\N	5962	\N
6516	GENERIC_DAY	16	4	f	2010-07-09	4352	\N	5962	\N
6515	GENERIC_DAY	16	5	f	2010-07-14	4354	\N	5962	\N
6518	GENERIC_DAY	16	5	f	2010-06-29	4352	\N	5962	\N
6498	GENERIC_DAY	16	5	f	2010-07-13	4354	\N	5962	\N
6300	GENERIC_DAY	18	4	t	2010-06-22	4352	\N	5962	\N
6532	GENERIC_DAY	16	5	f	2010-07-07	4354	\N	5962	\N
6340	GENERIC_DAY	18	4	t	2010-06-17	4352	\N	5962	\N
6539	GENERIC_DAY	16	4	f	2010-07-19	4352	\N	5962	\N
6325	GENERIC_DAY	18	8	t	2010-06-14	4354	\N	5962	\N
6525	GENERIC_DAY	16	5	f	2010-07-16	4354	\N	5962	\N
6540	GENERIC_DAY	16	4	f	2010-07-20	4352	\N	5962	\N
6298	GENERIC_DAY	18	4	t	2010-06-16	4354	\N	5962	\N
6520	GENERIC_DAY	16	5	f	2010-06-28	4354	\N	5962	\N
6343	GENERIC_DAY	18	4	t	2010-06-15	4352	\N	5962	\N
6288	GENERIC_DAY	18	4	t	2010-06-23	4352	\N	5962	\N
6517	GENERIC_DAY	16	4	f	2010-07-16	4352	\N	5962	\N
8805	GENERIC_DAY	12	2	t	2010-06-28	4344	\N	5964	\N
8863	GENERIC_DAY	12	2	t	2010-07-02	4358	\N	5964	\N
8801	GENERIC_DAY	12	2	t	2010-06-29	4350	\N	5964	\N
8838	GENERIC_DAY	12	2	t	2010-06-25	4358	\N	5964	\N
8800	GENERIC_DAY	12	0	t	2010-06-19	4358	\N	5964	\N
8839	GENERIC_DAY	12	2	t	2010-07-07	4348	\N	5964	\N
8884	GENERIC_DAY	12	2	t	2010-06-29	4358	\N	5964	\N
8797	GENERIC_DAY	12	2	t	2010-06-23	4348	\N	5964	\N
8828	GENERIC_DAY	12	2	t	2010-07-01	4350	\N	5964	\N
8793	GENERIC_DAY	12	2	t	2010-06-22	4358	\N	5964	\N
8823	GENERIC_DAY	12	2	t	2010-07-02	4350	\N	5964	\N
8847	GENERIC_DAY	12	0	t	2010-06-27	4348	\N	5964	\N
8862	GENERIC_DAY	12	2	t	2010-07-06	4358	\N	5964	\N
8844	GENERIC_DAY	12	2	t	2010-06-23	4344	\N	5964	\N
8803	GENERIC_DAY	12	2	t	2010-07-01	4358	\N	5964	\N
8872	GENERIC_DAY	12	2	t	2010-06-16	4348	\N	5964	\N
8809	GENERIC_DAY	12	2	t	2010-06-30	4358	\N	5964	\N
8816	GENERIC_DAY	12	2	t	2010-06-21	4344	\N	5964	\N
8820	GENERIC_DAY	12	2	t	2010-07-06	4344	\N	5964	\N
8792	GENERIC_DAY	12	2	t	2010-06-24	4358	\N	5964	\N
8822	GENERIC_DAY	12	0	t	2010-07-03	4348	\N	5964	\N
8819	GENERIC_DAY	12	2	t	2010-06-15	4358	\N	5964	\N
8830	GENERIC_DAY	12	0	t	2010-06-20	4350	\N	5964	\N
8842	GENERIC_DAY	12	2	t	2010-07-05	4350	\N	5964	\N
8804	GENERIC_DAY	12	2	t	2010-07-02	4348	\N	5964	\N
8824	GENERIC_DAY	12	2	t	2010-06-28	4348	\N	5964	\N
8861	GENERIC_DAY	12	2	t	2010-06-17	4350	\N	5964	\N
8798	GENERIC_DAY	12	2	t	2010-07-06	4348	\N	5964	\N
8835	GENERIC_DAY	12	2	t	2010-06-16	4344	\N	5964	\N
8806	GENERIC_DAY	12	2	t	2010-07-05	4344	\N	5964	\N
8854	GENERIC_DAY	12	0	t	2010-07-04	4344	\N	5964	\N
8794	GENERIC_DAY	12	2	t	2010-06-15	4350	\N	5964	\N
8870	GENERIC_DAY	12	2	t	2010-06-22	4348	\N	5964	\N
8876	GENERIC_DAY	12	2	t	2010-06-21	4350	\N	5964	\N
8845	GENERIC_DAY	12	2	t	2010-06-30	4344	\N	5964	\N
8881	GENERIC_DAY	12	2	t	2010-06-22	4350	\N	5964	\N
8852	GENERIC_DAY	12	2	t	2010-07-02	4344	\N	5964	\N
8848	GENERIC_DAY	12	2	t	2010-06-16	4358	\N	5964	\N
8843	GENERIC_DAY	12	0	t	2010-06-26	4344	\N	5964	\N
8834	GENERIC_DAY	12	0	t	2010-06-19	4344	\N	5964	\N
8864	GENERIC_DAY	12	2	t	2010-07-06	4350	\N	5964	\N
8867	GENERIC_DAY	12	0	t	2010-07-03	4350	\N	5964	\N
8837	GENERIC_DAY	12	2	t	2010-06-28	4358	\N	5964	\N
8873	GENERIC_DAY	12	2	t	2010-07-05	4348	\N	5964	\N
8810	GENERIC_DAY	12	2	t	2010-06-24	4344	\N	5964	\N
8855	GENERIC_DAY	12	2	t	2010-06-17	4358	\N	5964	\N
8865	GENERIC_DAY	12	0	t	2010-06-27	4350	\N	5964	\N
8814	GENERIC_DAY	12	0	t	2010-06-27	4358	\N	5964	\N
8813	GENERIC_DAY	12	2	t	2010-06-29	4344	\N	5964	\N
8812	GENERIC_DAY	12	2	t	2010-06-24	4350	\N	5964	\N
8878	GENERIC_DAY	12	0	t	2010-06-27	4344	\N	5964	\N
8875	GENERIC_DAY	12	2	t	2010-06-21	4348	\N	5964	\N
8829	GENERIC_DAY	12	0	t	2010-06-19	4350	\N	5964	\N
8885	GENERIC_DAY	12	0	t	2010-07-03	4344	\N	5964	\N
8836	GENERIC_DAY	12	2	t	2010-06-18	4358	\N	5964	\N
8860	GENERIC_DAY	12	2	t	2010-06-18	4344	\N	5964	\N
8790	GENERIC_DAY	12	2	t	2010-07-01	4348	\N	5964	\N
8791	GENERIC_DAY	12	0	t	2010-06-19	4348	\N	5964	\N
8879	GENERIC_DAY	12	2	t	2010-06-16	4350	\N	5964	\N
8886	GENERIC_DAY	12	4	t	2010-06-14	4358	\N	5964	\N
8833	GENERIC_DAY	12	2	t	2010-06-25	4344	\N	5964	\N
8877	GENERIC_DAY	12	0	t	2010-06-26	4350	\N	5964	\N
8841	GENERIC_DAY	12	0	t	2010-07-04	4350	\N	5964	\N
8868	GENERIC_DAY	12	2	t	2010-06-18	4348	\N	5964	\N
8851	GENERIC_DAY	12	2	t	2010-07-01	4344	\N	5964	\N
8826	GENERIC_DAY	12	2	t	2010-06-17	4344	\N	5964	\N
8811	GENERIC_DAY	12	2	t	2010-07-05	4358	\N	5964	\N
8799	GENERIC_DAY	12	2	t	2010-06-21	4358	\N	5964	\N
8840	GENERIC_DAY	12	2	t	2010-06-30	4350	\N	5964	\N
8857	GENERIC_DAY	12	2	t	2010-07-07	4350	\N	5964	\N
8850	GENERIC_DAY	12	0	t	2010-07-04	4348	\N	5964	\N
8858	GENERIC_DAY	12	2	t	2010-06-17	4348	\N	5964	\N
8869	GENERIC_DAY	12	0	t	2010-06-26	4348	\N	5964	\N
8817	GENERIC_DAY	12	0	t	2010-06-20	4348	\N	5964	\N
8832	GENERIC_DAY	12	2	t	2010-06-15	4344	\N	5964	\N
8807	GENERIC_DAY	12	2	t	2010-06-18	4350	\N	5964	\N
8815	GENERIC_DAY	12	2	t	2010-06-29	4348	\N	5964	\N
8831	GENERIC_DAY	12	0	t	2010-06-26	4358	\N	5964	\N
8849	GENERIC_DAY	12	0	t	2010-06-20	4344	\N	5964	\N
8882	GENERIC_DAY	12	2	t	2010-06-25	4350	\N	5964	\N
8802	GENERIC_DAY	12	2	t	2010-06-23	4358	\N	5964	\N
8789	GENERIC_DAY	12	0	t	2010-07-03	4358	\N	5964	\N
8808	GENERIC_DAY	12	2	t	2010-06-22	4344	\N	5964	\N
8883	GENERIC_DAY	12	2	t	2010-06-30	4348	\N	5964	\N
8874	GENERIC_DAY	12	2	t	2010-06-24	4348	\N	5964	\N
8825	GENERIC_DAY	12	2	t	2010-06-23	4350	\N	5964	\N
8846	GENERIC_DAY	12	2	t	2010-07-07	4344	\N	5964	\N
8871	GENERIC_DAY	12	0	t	2010-06-20	4358	\N	5964	\N
8856	GENERIC_DAY	12	2	t	2010-07-07	4358	\N	5964	\N
8827	GENERIC_DAY	12	2	t	2010-06-25	4348	\N	5964	\N
8866	GENERIC_DAY	12	4	t	2010-06-14	4350	\N	5964	\N
8880	GENERIC_DAY	12	2	t	2010-06-15	4348	\N	5964	\N
8795	GENERIC_DAY	12	2	t	2010-06-28	4350	\N	5964	\N
8796	GENERIC_DAY	12	0	t	2010-07-04	4358	\N	5964	\N
8197	SPECIFIC_DAY	14	8	f	2010-07-14	1216	8080	\N	\N
8188	SPECIFIC_DAY	14	0	f	2010-07-03	1216	8080	\N	\N
8200	SPECIFIC_DAY	14	0	f	2010-07-04	1216	8080	\N	\N
8186	SPECIFIC_DAY	14	0	f	2010-07-11	1216	8080	\N	\N
8198	SPECIFIC_DAY	14	8	f	2010-07-16	1216	8080	\N	\N
8187	SPECIFIC_DAY	14	8	f	2010-07-07	1216	8080	\N	\N
8195	SPECIFIC_DAY	14	0	f	2010-07-10	1216	8080	\N	\N
8183	SPECIFIC_DAY	14	0	f	2010-07-18	1216	8080	\N	\N
8199	SPECIFIC_DAY	14	8	f	2010-07-08	1216	8080	\N	\N
8185	SPECIFIC_DAY	14	8	f	2010-07-05	1216	8080	\N	\N
8189	SPECIFIC_DAY	14	8	f	2010-07-01	1216	8080	\N	\N
8184	SPECIFIC_DAY	14	8	f	2010-07-09	1216	8080	\N	\N
8190	SPECIFIC_DAY	14	8	f	2010-07-15	1216	8080	\N	\N
8191	SPECIFIC_DAY	14	0	f	2010-07-17	1216	8080	\N	\N
8182	SPECIFIC_DAY	14	8	f	2010-07-02	1216	8080	\N	\N
8193	SPECIFIC_DAY	14	8	f	2010-07-06	1216	8080	\N	\N
8194	SPECIFIC_DAY	14	8	f	2010-07-12	1216	8080	\N	\N
8181	SPECIFIC_DAY	14	8	f	2010-07-13	1216	8080	\N	\N
8192	SPECIFIC_DAY	14	1	f	2010-07-19	1216	8080	\N	\N
8196	SPECIFIC_DAY	14	4	f	2010-06-30	1216	8080	\N	\N
17698	GENERIC_DAY	7	4	f	2010-07-23	4352	\N	9408	\N
17719	GENERIC_DAY	7	4	f	2010-07-12	4354	\N	9408	\N
17691	GENERIC_DAY	7	4	f	2010-07-20	4352	\N	9408	\N
17688	GENERIC_DAY	7	4	f	2010-07-26	4352	\N	9408	\N
17686	GENERIC_DAY	7	4	f	2010-07-13	4354	\N	9408	\N
17717	GENERIC_DAY	7	0	f	2010-07-18	4352	\N	9408	\N
17718	GENERIC_DAY	7	4	f	2010-07-15	4352	\N	9408	\N
17687	GENERIC_DAY	7	0	f	2010-07-17	4354	\N	9408	\N
17703	GENERIC_DAY	7	4	f	2010-07-13	4352	\N	9408	\N
17704	GENERIC_DAY	7	0	f	2010-07-11	4352	\N	9408	\N
17713	GENERIC_DAY	7	0	f	2010-07-17	4352	\N	9408	\N
17697	GENERIC_DAY	7	4	f	2010-07-09	4352	\N	9408	\N
17693	GENERIC_DAY	7	4	f	2010-07-19	4354	\N	9408	\N
17708	GENERIC_DAY	7	4	f	2010-07-22	4352	\N	9408	\N
17690	GENERIC_DAY	7	0	f	2010-07-24	4352	\N	9408	\N
17689	GENERIC_DAY	7	4	f	2010-07-09	4354	\N	9408	\N
17710	GENERIC_DAY	7	4	f	2010-07-16	4354	\N	9408	\N
17714	GENERIC_DAY	7	4	f	2010-07-14	4352	\N	9408	\N
17692	GENERIC_DAY	7	4	f	2010-07-20	4354	\N	9408	\N
17707	GENERIC_DAY	7	4	f	2010-07-22	4354	\N	9408	\N
17701	GENERIC_DAY	7	4	f	2010-07-23	4354	\N	9408	\N
17702	GENERIC_DAY	7	0	f	2010-07-25	4354	\N	9408	\N
17722	GENERIC_DAY	7	4	f	2010-07-21	4352	\N	9408	\N
17721	GENERIC_DAY	7	4	f	2010-07-26	4354	\N	9408	\N
17705	GENERIC_DAY	7	4	f	2010-07-19	4352	\N	9408	\N
17711	GENERIC_DAY	7	0	f	2010-07-10	4354	\N	9408	\N
17699	GENERIC_DAY	7	4	f	2010-07-14	4354	\N	9408	\N
17720	GENERIC_DAY	7	0	f	2010-07-18	4354	\N	9408	\N
17715	GENERIC_DAY	7	4	f	2010-07-12	4352	\N	9408	\N
17712	GENERIC_DAY	7	2	f	2010-07-27	4352	\N	9408	\N
17694	GENERIC_DAY	7	4	f	2010-07-21	4354	\N	9408	\N
17706	GENERIC_DAY	7	0	f	2010-07-11	4354	\N	9408	\N
17696	GENERIC_DAY	7	0	f	2010-07-24	4354	\N	9408	\N
17716	GENERIC_DAY	7	0	f	2010-07-10	4352	\N	9408	\N
17695	GENERIC_DAY	7	0	f	2010-07-25	4352	\N	9408	\N
17723	GENERIC_DAY	7	4	f	2010-07-15	4354	\N	9408	\N
17700	GENERIC_DAY	7	4	f	2010-07-16	4352	\N	9408	\N
17709	GENERIC_DAY	7	2	f	2010-07-27	4354	\N	9408	\N
246013	GENERIC_DAY	0	22	f	2010-07-08	4350	\N	5964	\N
246014	GENERIC_DAY	0	22	f	2010-07-08	4344	\N	5964	\N
246015	GENERIC_DAY	0	23	f	2010-07-08	4358	\N	5964	\N
246016	GENERIC_DAY	0	23	f	2010-07-08	4348	\N	5964	\N
246017	GENERIC_DAY	0	4	f	2010-08-18	4352	\N	9412	\N
246018	GENERIC_DAY	0	5	f	2010-08-11	4354	\N	9412	\N
246019	GENERIC_DAY	0	4	f	2010-08-25	4352	\N	9412	\N
246020	GENERIC_DAY	0	1	f	2010-08-02	4352	\N	9412	\N
246021	GENERIC_DAY	0	0	f	2010-08-21	4354	\N	9412	\N
246022	GENERIC_DAY	0	1	f	2010-07-30	4352	\N	9412	\N
246023	GENERIC_DAY	0	0	f	2010-08-14	4352	\N	9412	\N
246024	GENERIC_DAY	0	0	f	2010-08-22	4354	\N	9412	\N
246025	GENERIC_DAY	0	3	f	2010-08-10	4352	\N	9412	\N
246026	GENERIC_DAY	0	4	f	2010-08-20	4352	\N	9412	\N
246027	GENERIC_DAY	0	3	f	2010-08-05	4352	\N	9412	\N
246028	GENERIC_DAY	0	4	f	2010-08-24	4354	\N	9412	\N
246029	GENERIC_DAY	0	7	f	2010-08-03	4354	\N	9412	\N
246030	GENERIC_DAY	0	1	f	2010-08-03	4352	\N	9412	\N
246031	GENERIC_DAY	0	4	f	2010-08-20	4354	\N	9412	\N
246032	GENERIC_DAY	0	5	f	2010-08-04	4354	\N	9412	\N
246033	GENERIC_DAY	0	7	f	2010-07-29	4354	\N	9412	\N
246034	GENERIC_DAY	0	4	f	2010-08-17	4354	\N	9412	\N
246035	GENERIC_DAY	0	4	f	2010-08-18	4354	\N	9412	\N
246238	GENERIC_DAY	0	0	f	2010-08-28	4352	\N	9412	\N
246239	GENERIC_DAY	0	4	f	2010-08-27	4354	\N	9412	\N
246240	GENERIC_DAY	0	7	f	2010-07-30	4354	\N	9412	\N
246241	GENERIC_DAY	0	7	f	2010-07-28	4354	\N	9412	\N
246242	GENERIC_DAY	0	3	f	2010-08-04	4352	\N	9412	\N
246243	GENERIC_DAY	0	4	f	2010-08-23	4354	\N	9412	\N
246244	GENERIC_DAY	0	4	f	2010-08-17	4352	\N	9412	\N
246245	GENERIC_DAY	0	4	f	2010-08-26	4354	\N	9412	\N
246246	GENERIC_DAY	0	0	f	2010-08-07	4352	\N	9412	\N
246247	GENERIC_DAY	0	0	f	2010-08-01	4354	\N	9412	\N
246248	GENERIC_DAY	0	4	f	2010-08-13	4352	\N	9412	\N
246249	GENERIC_DAY	0	4	f	2010-08-24	4352	\N	9412	\N
246250	GENERIC_DAY	0	4	f	2010-08-31	4352	\N	9412	\N
246251	GENERIC_DAY	0	4	f	2010-08-12	4352	\N	9412	\N
246252	GENERIC_DAY	0	7	f	2010-08-02	4354	\N	9412	\N
246253	GENERIC_DAY	0	0	f	2010-07-31	4354	\N	9412	\N
246254	GENERIC_DAY	0	4	f	2010-08-31	4354	\N	9412	\N
246255	GENERIC_DAY	0	3	f	2010-08-06	4352	\N	9412	\N
246256	GENERIC_DAY	0	4	f	2010-08-19	4352	\N	9412	\N
246257	GENERIC_DAY	0	0	f	2010-07-31	4352	\N	9412	\N
246258	GENERIC_DAY	0	0	f	2010-08-15	4354	\N	9412	\N
246259	GENERIC_DAY	0	0	f	2010-08-29	4352	\N	9412	\N
246260	GENERIC_DAY	0	4	f	2010-08-13	4354	\N	9412	\N
246261	GENERIC_DAY	0	4	f	2010-08-27	4352	\N	9412	\N
246262	GENERIC_DAY	0	0	f	2010-08-08	4354	\N	9412	\N
246263	GENERIC_DAY	0	3	f	2010-08-09	4352	\N	9412	\N
246264	GENERIC_DAY	0	0	f	2010-08-28	4354	\N	9412	\N
246265	GENERIC_DAY	0	0	f	2010-08-29	4354	\N	9412	\N
246266	GENERIC_DAY	0	0	f	2010-08-07	4354	\N	9412	\N
246267	GENERIC_DAY	0	1	f	2010-07-29	4352	\N	9412	\N
246268	GENERIC_DAY	0	0	f	2010-08-08	4352	\N	9412	\N
246269	GENERIC_DAY	0	4	f	2010-08-19	4354	\N	9412	\N
246270	GENERIC_DAY	0	4	f	2010-08-16	4352	\N	9412	\N
246271	GENERIC_DAY	0	0	f	2010-08-01	4352	\N	9412	\N
246272	GENERIC_DAY	0	0	f	2010-08-14	4354	\N	9412	\N
246273	GENERIC_DAY	0	4	f	2010-08-16	4354	\N	9412	\N
246274	GENERIC_DAY	0	0	f	2010-08-15	4352	\N	9412	\N
246275	GENERIC_DAY	0	5	f	2010-08-05	4354	\N	9412	\N
246276	GENERIC_DAY	0	5	f	2010-08-09	4354	\N	9412	\N
246277	GENERIC_DAY	0	4	f	2010-08-25	4354	\N	9412	\N
246278	GENERIC_DAY	0	0	f	2010-08-21	4352	\N	9412	\N
246279	GENERIC_DAY	0	4	f	2010-08-30	4354	\N	9412	\N
246280	GENERIC_DAY	0	1	f	2010-07-28	4352	\N	9412	\N
246281	GENERIC_DAY	0	0	f	2010-08-22	4352	\N	9412	\N
246282	GENERIC_DAY	0	4	f	2010-08-26	4352	\N	9412	\N
246283	GENERIC_DAY	0	5	f	2010-08-10	4354	\N	9412	\N
246284	GENERIC_DAY	0	4	f	2010-08-30	4352	\N	9412	\N
246285	GENERIC_DAY	0	4	f	2010-08-12	4354	\N	9412	\N
246286	GENERIC_DAY	0	3	f	2010-08-11	4352	\N	9412	\N
246287	GENERIC_DAY	0	5	f	2010-08-06	4354	\N	9412	\N
246288	GENERIC_DAY	0	4	f	2010-08-23	4352	\N	9412	\N
37600	GENERIC_DAY	1	0	f	2010-10-23	4354	\N	27143	\N
37592	GENERIC_DAY	1	4	f	2010-11-01	4354	\N	27143	\N
37586	GENERIC_DAY	1	0	f	2010-10-24	4354	\N	27143	\N
37596	GENERIC_DAY	1	0	f	2010-10-23	4352	\N	27143	\N
37609	GENERIC_DAY	1	4	f	2010-10-27	4354	\N	27143	\N
37613	GENERIC_DAY	1	4	f	2010-10-20	4354	\N	27143	\N
37590	GENERIC_DAY	1	0	f	2010-10-17	4352	\N	27143	\N
37595	GENERIC_DAY	1	4	f	2010-10-29	4354	\N	27143	\N
37591	GENERIC_DAY	1	4	f	2010-10-26	4352	\N	27143	\N
37589	GENERIC_DAY	1	4	f	2010-10-25	4354	\N	27143	\N
37612	GENERIC_DAY	1	4	f	2010-10-25	4352	\N	27143	\N
37597	GENERIC_DAY	1	4	f	2010-10-19	4352	\N	27143	\N
37599	GENERIC_DAY	1	4	f	2010-10-18	4352	\N	27143	\N
37616	GENERIC_DAY	1	0	f	2010-10-03	4354	\N	27144	\N
37618	GENERIC_DAY	1	4	f	2010-10-25	4352	\N	27144	\N
37627	GENERIC_DAY	1	0	f	2010-10-16	4354	\N	27144	\N
37637	GENERIC_DAY	1	0	f	2010-10-23	4354	\N	27144	\N
37641	GENERIC_DAY	1	4	f	2010-10-11	4354	\N	27144	\N
37635	GENERIC_DAY	1	4	f	2010-10-15	4352	\N	27144	\N
37617	GENERIC_DAY	1	4	f	2010-10-18	4354	\N	27144	\N
37663	GENERIC_DAY	1	4	f	2010-09-29	4354	\N	27144	\N
37621	GENERIC_DAY	1	0	f	2010-09-25	4354	\N	27144	\N
37634	GENERIC_DAY	1	4	f	2010-09-30	4352	\N	27144	\N
37615	GENERIC_DAY	1	4	f	2010-10-26	4354	\N	27144	\N
37640	GENERIC_DAY	1	4	f	2010-10-15	4354	\N	27144	\N
37629	GENERIC_DAY	1	4	f	2010-10-21	4354	\N	27144	\N
37647	GENERIC_DAY	1	4	f	2010-10-22	4354	\N	27144	\N
37645	GENERIC_DAY	1	0	f	2010-10-24	4354	\N	27144	\N
37662	GENERIC_DAY	1	4	f	2010-10-26	4352	\N	27144	\N
37626	GENERIC_DAY	1	0	f	2010-10-23	4352	\N	27144	\N
37677	GENERIC_DAY	1	4	f	2010-10-14	4354	\N	27144	\N
37638	GENERIC_DAY	1	4	f	2010-10-13	4352	\N	27144	\N
37624	GENERIC_DAY	1	0	f	2010-10-16	4352	\N	27144	\N
37658	GENERIC_DAY	1	4	f	2010-10-28	4354	\N	27144	\N
37673	GENERIC_DAY	1	0	f	2010-10-17	4352	\N	27144	\N
37661	GENERIC_DAY	1	0	f	2010-09-26	4352	\N	27144	\N
37636	GENERIC_DAY	1	0	f	2010-10-10	4354	\N	27144	\N
37628	GENERIC_DAY	1	4	f	2010-10-06	4354	\N	27144	\N
37682	GENERIC_DAY	1	0	f	2010-10-09	4354	\N	27144	\N
37675	GENERIC_DAY	1	0	f	2010-10-17	4354	\N	27144	\N
37622	GENERIC_DAY	1	4	f	2010-10-20	4354	\N	27144	\N
37667	GENERIC_DAY	1	4	f	2010-10-12	4354	\N	27144	\N
37652	GENERIC_DAY	1	4	f	2010-10-12	4352	\N	27144	\N
37619	GENERIC_DAY	1	4	f	2010-10-19	4354	\N	27144	\N
37651	GENERIC_DAY	1	4	f	2010-10-04	4354	\N	27144	\N
37649	GENERIC_DAY	1	4	f	2010-10-05	4354	\N	27144	\N
37639	GENERIC_DAY	1	0	f	2010-10-10	4352	\N	27144	\N
37623	GENERIC_DAY	1	0	f	2010-10-02	4354	\N	27144	\N
37681	GENERIC_DAY	1	4	f	2010-10-13	4354	\N	27144	\N
37630	GENERIC_DAY	1	0	f	2010-10-03	4352	\N	27144	\N
37646	GENERIC_DAY	1	4	f	2010-10-18	4352	\N	27144	\N
37676	GENERIC_DAY	1	4	f	2010-10-01	4352	\N	27144	\N
37656	GENERIC_DAY	1	4	f	2010-10-08	4354	\N	27144	\N
37620	GENERIC_DAY	1	4	f	2010-09-28	4352	\N	27144	\N
37679	GENERIC_DAY	1	4	f	2010-10-01	4354	\N	27144	\N
37654	GENERIC_DAY	1	4	f	2010-09-28	4354	\N	27144	\N
37684	GENERIC_DAY	1	4	f	2010-10-20	4352	\N	27144	\N
37665	GENERIC_DAY	1	4	f	2010-10-28	4352	\N	27144	\N
37632	GENERIC_DAY	1	4	f	2010-10-05	4352	\N	27144	\N
37683	GENERIC_DAY	1	4	f	2010-10-08	4352	\N	27144	\N
37659	GENERIC_DAY	1	4	f	2010-10-29	4354	\N	27144	\N
37666	GENERIC_DAY	1	0	f	2010-09-25	4352	\N	27144	\N
37631	GENERIC_DAY	1	0	f	2010-10-24	4352	\N	27144	\N
37653	GENERIC_DAY	1	4	f	2010-10-27	4354	\N	27144	\N
37633	GENERIC_DAY	1	4	f	2010-09-30	4354	\N	27144	\N
37625	GENERIC_DAY	1	4	f	2010-10-27	4352	\N	27144	\N
37680	GENERIC_DAY	1	0	f	2010-10-02	4352	\N	27144	\N
37655	GENERIC_DAY	1	4	f	2010-10-29	4352	\N	27144	\N
37688	GENERIC_DAY	1	4	f	2010-10-06	4352	\N	27145	\N
37718	GENERIC_DAY	1	4	f	2010-09-21	4352	\N	27145	\N
37685	GENERIC_DAY	1	4	f	2010-09-10	4352	\N	27145	\N
37701	GENERIC_DAY	1	4	f	2010-10-07	4352	\N	27145	\N
37716	GENERIC_DAY	1	0	f	2010-10-03	4352	\N	27145	\N
37732	GENERIC_DAY	1	0	f	2010-09-25	4352	\N	27145	\N
37713	GENERIC_DAY	1	0	f	2010-10-09	4352	\N	27145	\N
37686	GENERIC_DAY	1	4	f	2010-09-13	4354	\N	27145	\N
37707	GENERIC_DAY	1	4	f	2010-09-17	4354	\N	27145	\N
37706	GENERIC_DAY	1	4	f	2010-10-01	4354	\N	27145	\N
37751	GENERIC_DAY	1	0	f	2010-09-11	4354	\N	27145	\N
37748	GENERIC_DAY	1	4	f	2010-09-30	4354	\N	27145	\N
37744	GENERIC_DAY	1	4	f	2010-09-28	4352	\N	27145	\N
37702	GENERIC_DAY	1	0	f	2010-10-03	4354	\N	27145	\N
37740	GENERIC_DAY	1	4	f	2010-10-05	4352	\N	27145	\N
37689	GENERIC_DAY	1	0	f	2010-10-02	4354	\N	27145	\N
37754	GENERIC_DAY	1	0	f	2010-09-26	4354	\N	27145	\N
37697	GENERIC_DAY	1	0	f	2010-10-09	4354	\N	27145	\N
37723	GENERIC_DAY	1	4	f	2010-09-22	4354	\N	27145	\N
37743	GENERIC_DAY	1	4	f	2010-10-08	4354	\N	27145	\N
37738	GENERIC_DAY	1	4	f	2010-09-09	4354	\N	27145	\N
37747	GENERIC_DAY	1	0	f	2010-09-26	4352	\N	27145	\N
37727	GENERIC_DAY	1	4	f	2010-09-24	4352	\N	27145	\N
37752	GENERIC_DAY	1	4	f	2010-10-04	4354	\N	27145	\N
37694	GENERIC_DAY	1	4	f	2010-09-10	4354	\N	27145	\N
37712	GENERIC_DAY	1	0	f	2010-09-18	4352	\N	27145	\N
37726	GENERIC_DAY	1	4	f	2010-10-05	4354	\N	27145	\N
37720	GENERIC_DAY	1	4	f	2010-09-17	4352	\N	27145	\N
37687	GENERIC_DAY	1	4	f	2010-09-30	4352	\N	27145	\N
37733	GENERIC_DAY	1	4	f	2010-09-14	4352	\N	27145	\N
37728	GENERIC_DAY	1	4	f	2010-09-20	4352	\N	27145	\N
37717	GENERIC_DAY	1	0	f	2010-09-12	4352	\N	27145	\N
37746	GENERIC_DAY	1	0	f	2010-09-25	4354	\N	27145	\N
37703	GENERIC_DAY	1	4	f	2010-09-20	4354	\N	27145	\N
37693	GENERIC_DAY	1	4	f	2010-09-29	4354	\N	27145	\N
37709	GENERIC_DAY	1	4	f	2010-09-15	4352	\N	27145	\N
37711	GENERIC_DAY	1	0	f	2010-09-12	4354	\N	27145	\N
37753	GENERIC_DAY	1	4	f	2010-09-13	4352	\N	27145	\N
37700	GENERIC_DAY	1	4	f	2010-09-28	4354	\N	27145	\N
37721	GENERIC_DAY	1	4	f	2010-09-16	4354	\N	27145	\N
37710	GENERIC_DAY	1	4	f	2010-10-01	4352	\N	27145	\N
37724	GENERIC_DAY	1	4	f	2010-10-11	4352	\N	27145	\N
37735	GENERIC_DAY	1	0	f	2010-09-19	4352	\N	27145	\N
37691	GENERIC_DAY	1	4	f	2010-10-11	4354	\N	27145	\N
37715	GENERIC_DAY	1	4	f	2010-09-09	4352	\N	27145	\N
37692	GENERIC_DAY	1	4	f	2010-09-23	4354	\N	27145	\N
37722	GENERIC_DAY	1	4	f	2010-09-15	4354	\N	27145	\N
37741	GENERIC_DAY	1	4	f	2010-09-27	4354	\N	27145	\N
37708	GENERIC_DAY	1	4	f	2010-09-08	4352	\N	27145	\N
37699	GENERIC_DAY	1	4	f	2010-10-04	4352	\N	27145	\N
37719	GENERIC_DAY	1	4	f	2010-09-23	4352	\N	27145	\N
37736	GENERIC_DAY	1	0	f	2010-09-18	4354	\N	27145	\N
37734	GENERIC_DAY	1	4	f	2010-09-21	4354	\N	27145	\N
37742	GENERIC_DAY	1	4	f	2010-09-29	4352	\N	27145	\N
37739	GENERIC_DAY	1	4	f	2010-10-07	4354	\N	27145	\N
37729	GENERIC_DAY	1	0	f	2010-10-02	4352	\N	27145	\N
37705	GENERIC_DAY	1	4	f	2010-10-06	4354	\N	27145	\N
37704	GENERIC_DAY	1	4	f	2010-10-12	4354	\N	27145	\N
37690	GENERIC_DAY	1	4	f	2010-10-12	4352	\N	27145	\N
37695	GENERIC_DAY	1	0	f	2010-10-10	4352	\N	27145	\N
37714	GENERIC_DAY	1	4	f	2010-09-14	4354	\N	27145	\N
37698	GENERIC_DAY	1	4	f	2010-09-24	4354	\N	27145	\N
37730	GENERIC_DAY	1	4	f	2010-09-27	4352	\N	27145	\N
37731	GENERIC_DAY	1	0	f	2010-09-19	4354	\N	27145	\N
37749	GENERIC_DAY	1	4	f	2010-09-22	4352	\N	27145	\N
37750	GENERIC_DAY	1	0	f	2010-10-10	4354	\N	27145	\N
37696	GENERIC_DAY	1	0	f	2010-09-11	4352	\N	27145	\N
37725	GENERIC_DAY	1	4	f	2010-09-08	4354	\N	27145	\N
37745	GENERIC_DAY	1	4	f	2010-09-16	4352	\N	27145	\N
37787	GENERIC_DAY	1	4	f	2010-12-23	4354	\N	27146	\N
37863	GENERIC_DAY	1	4	f	2010-12-17	4354	\N	27146	\N
37755	GENERIC_DAY	1	0	f	2011-01-16	4354	\N	27146	\N
37779	GENERIC_DAY	1	0	f	2011-01-02	4354	\N	27146	\N
37869	GENERIC_DAY	1	0	f	2010-11-27	4352	\N	27146	\N
37854	GENERIC_DAY	1	4	f	2011-01-11	4352	\N	27146	\N
37761	GENERIC_DAY	1	4	f	2011-01-04	4354	\N	27146	\N
37867	GENERIC_DAY	1	4	f	2010-12-03	4354	\N	27146	\N
37765	GENERIC_DAY	1	4	f	2010-11-10	4354	\N	27146	\N
37861	GENERIC_DAY	1	4	f	2010-12-06	4354	\N	27146	\N
37756	GENERIC_DAY	1	4	f	2010-11-30	4352	\N	27146	\N
37759	GENERIC_DAY	1	4	f	2011-01-14	4352	\N	27146	\N
37776	GENERIC_DAY	1	4	f	2010-12-14	4354	\N	27146	\N
37888	GENERIC_DAY	1	0	f	2010-12-25	4352	\N	27146	\N
37872	GENERIC_DAY	1	0	f	2010-12-04	4354	\N	27146	\N
37786	GENERIC_DAY	1	4	f	2011-01-12	4354	\N	27146	\N
37782	GENERIC_DAY	1	4	f	2011-01-06	4354	\N	27146	\N
37767	GENERIC_DAY	1	0	f	2010-11-13	4352	\N	27146	\N
37762	GENERIC_DAY	1	4	f	2010-11-22	4352	\N	27146	\N
37883	GENERIC_DAY	1	0	f	2011-01-09	4354	\N	27146	\N
37804	GENERIC_DAY	1	0	f	2010-12-05	4354	\N	27146	\N
37873	GENERIC_DAY	1	4	f	2010-12-13	4354	\N	27146	\N
37798	GENERIC_DAY	1	4	f	2010-12-27	4352	\N	27146	\N
37766	GENERIC_DAY	1	4	f	2010-12-16	4352	\N	27146	\N
37868	GENERIC_DAY	1	4	f	2011-01-10	4354	\N	27146	\N
37775	GENERIC_DAY	1	0	f	2011-01-09	4352	\N	27146	\N
37832	GENERIC_DAY	1	0	f	2010-12-26	4354	\N	27146	\N
37760	GENERIC_DAY	1	4	f	2010-11-29	4354	\N	27146	\N
37808	GENERIC_DAY	1	4	f	2010-11-16	4352	\N	27146	\N
37862	GENERIC_DAY	1	4	f	2010-11-12	4352	\N	27146	\N
37857	GENERIC_DAY	1	4	f	2010-12-08	4354	\N	27146	\N
37839	GENERIC_DAY	1	4	f	2010-11-19	4352	\N	27146	\N
37844	GENERIC_DAY	1	4	f	2010-12-01	4352	\N	27146	\N
37835	GENERIC_DAY	1	4	f	2010-12-10	4354	\N	27146	\N
37855	GENERIC_DAY	1	4	f	2010-12-20	4354	\N	27146	\N
37783	GENERIC_DAY	1	0	f	2010-11-20	4352	\N	27146	\N
37814	GENERIC_DAY	1	4	f	2010-12-21	4354	\N	27146	\N
37826	GENERIC_DAY	1	4	f	2010-12-24	4354	\N	27146	\N
37893	GENERIC_DAY	1	0	f	2011-01-15	4352	\N	27146	\N
37886	GENERIC_DAY	1	4	f	2010-12-07	4354	\N	27146	\N
37842	GENERIC_DAY	1	4	f	2010-11-17	4354	\N	27146	\N
37777	GENERIC_DAY	1	4	f	2010-12-22	4354	\N	27146	\N
37830	GENERIC_DAY	1	4	f	2011-01-04	4352	\N	27146	\N
37810	GENERIC_DAY	1	4	f	2011-01-11	4354	\N	27146	\N
37788	GENERIC_DAY	1	0	f	2010-12-05	4352	\N	27146	\N
37846	GENERIC_DAY	1	4	f	2010-11-23	4354	\N	27146	\N
37852	GENERIC_DAY	1	0	f	2010-11-13	4354	\N	27146	\N
37889	GENERIC_DAY	1	4	f	2011-01-07	4354	\N	27146	\N
37833	GENERIC_DAY	1	0	f	2010-12-04	4352	\N	27146	\N
37781	GENERIC_DAY	1	4	f	2010-11-25	4352	\N	27146	\N
37877	GENERIC_DAY	1	4	f	2011-01-05	4352	\N	27146	\N
37800	GENERIC_DAY	1	0	f	2010-12-11	4352	\N	27146	\N
37817	GENERIC_DAY	1	0	f	2010-11-14	4354	\N	27146	\N
37785	GENERIC_DAY	1	4	f	2010-12-30	4354	\N	27146	\N
37870	GENERIC_DAY	1	0	f	2011-01-15	4354	\N	27146	\N
37894	GENERIC_DAY	1	4	f	2010-11-11	4354	\N	27146	\N
37764	GENERIC_DAY	1	4	f	2010-12-15	4352	\N	27146	\N
37866	GENERIC_DAY	1	4	f	2010-12-17	4352	\N	27146	\N
37780	GENERIC_DAY	1	4	f	2010-12-01	4354	\N	27146	\N
37884	GENERIC_DAY	1	4	f	2010-12-02	4352	\N	27146	\N
37806	GENERIC_DAY	1	0	f	2010-12-19	4352	\N	27146	\N
37774	GENERIC_DAY	1	4	f	2011-01-17	4354	\N	27146	\N
37763	GENERIC_DAY	1	4	f	2010-11-17	4352	\N	27146	\N
37864	GENERIC_DAY	1	4	f	2011-01-13	4352	\N	27146	\N
37880	GENERIC_DAY	1	4	f	2010-12-09	4352	\N	27146	\N
37865	GENERIC_DAY	1	4	f	2010-11-16	4354	\N	27146	\N
37825	GENERIC_DAY	1	0	f	2010-11-14	4352	\N	27146	\N
37838	GENERIC_DAY	1	4	f	2010-12-15	4354	\N	27146	\N
37859	GENERIC_DAY	1	4	f	2010-12-23	4352	\N	27146	\N
37768	GENERIC_DAY	1	4	f	2011-01-07	4352	\N	27146	\N
37882	GENERIC_DAY	1	4	f	2010-11-24	4354	\N	27146	\N
37802	GENERIC_DAY	1	0	f	2011-01-01	4352	\N	27146	\N
37849	GENERIC_DAY	1	4	f	2011-01-17	4352	\N	27146	\N
37821	GENERIC_DAY	1	4	f	2010-12-27	4354	\N	27146	\N
37860	GENERIC_DAY	1	4	f	2010-12-31	4352	\N	27146	\N
37820	GENERIC_DAY	1	0	f	2010-12-26	4352	\N	27146	\N
37890	GENERIC_DAY	1	0	f	2010-12-12	4352	\N	27146	\N
37851	GENERIC_DAY	1	4	f	2010-11-11	4352	\N	27146	\N
37878	GENERIC_DAY	1	4	f	2010-12-07	4352	\N	27146	\N
37829	GENERIC_DAY	1	4	f	2010-12-03	4352	\N	27146	\N
37823	GENERIC_DAY	1	0	f	2010-11-27	4354	\N	27146	\N
37805	GENERIC_DAY	1	0	f	2011-01-02	4352	\N	27146	\N
37813	GENERIC_DAY	1	0	f	2011-01-08	4352	\N	27146	\N
37772	GENERIC_DAY	1	4	f	2010-12-06	4352	\N	27146	\N
37853	GENERIC_DAY	1	4	f	2010-11-23	4352	\N	27146	\N
37871	GENERIC_DAY	1	4	f	2010-12-10	4352	\N	27146	\N
37831	GENERIC_DAY	1	4	f	2010-12-29	4352	\N	27146	\N
37771	GENERIC_DAY	1	4	f	2011-01-03	4352	\N	27146	\N
37845	GENERIC_DAY	1	4	f	2010-12-14	4352	\N	27146	\N
37778	GENERIC_DAY	1	4	f	2011-01-14	4354	\N	27146	\N
37879	GENERIC_DAY	1	4	f	2011-01-05	4354	\N	27146	\N
37812	GENERIC_DAY	1	0	f	2010-11-21	4352	\N	27146	\N
37769	GENERIC_DAY	1	4	f	2010-12-16	4354	\N	27146	\N
37856	GENERIC_DAY	1	4	f	2010-12-29	4354	\N	27146	\N
37843	GENERIC_DAY	1	0	f	2010-12-18	4354	\N	27146	\N
37885	GENERIC_DAY	1	4	f	2010-11-30	4354	\N	27146	\N
37858	GENERIC_DAY	1	4	f	2010-11-25	4354	\N	27146	\N
37837	GENERIC_DAY	1	4	f	2010-11-22	4354	\N	27146	\N
37773	GENERIC_DAY	1	4	f	2011-01-13	4354	\N	27146	\N
37807	GENERIC_DAY	1	4	f	2011-01-06	4352	\N	27146	\N
37876	GENERIC_DAY	1	4	f	2010-11-09	4352	\N	27146	\N
37891	GENERIC_DAY	1	4	f	2011-01-03	4354	\N	27146	\N
37803	GENERIC_DAY	1	0	f	2010-12-12	4354	\N	27146	\N
37770	GENERIC_DAY	1	4	f	2010-11-26	4352	\N	27146	\N
37784	GENERIC_DAY	1	4	f	2010-12-22	4352	\N	27146	\N
37892	GENERIC_DAY	1	4	f	2010-12-28	4354	\N	27146	\N
37875	GENERIC_DAY	1	0	f	2010-11-28	4352	\N	27146	\N
37791	GENERIC_DAY	1	4	f	2010-12-21	4352	\N	27146	\N
37789	GENERIC_DAY	1	0	f	2010-12-11	4354	\N	27146	\N
37757	GENERIC_DAY	1	0	f	2010-11-20	4354	\N	27146	\N
37841	GENERIC_DAY	1	0	f	2010-12-25	4354	\N	27146	\N
37790	GENERIC_DAY	1	4	f	2010-12-30	4352	\N	27146	\N
37850	GENERIC_DAY	1	4	f	2010-11-09	4354	\N	27146	\N
37799	GENERIC_DAY	1	0	f	2011-01-01	4354	\N	27146	\N
37881	GENERIC_DAY	1	4	f	2010-11-26	4354	\N	27146	\N
37848	GENERIC_DAY	1	4	f	2010-12-08	4352	\N	27146	\N
37795	GENERIC_DAY	1	0	f	2010-11-21	4354	\N	27146	\N
37758	GENERIC_DAY	1	4	f	2010-12-28	4352	\N	27146	\N
37874	GENERIC_DAY	1	4	f	2010-11-19	4354	\N	27146	\N
37887	GENERIC_DAY	1	0	f	2011-01-16	4352	\N	27146	\N
37318	GENERIC_DAY	1	4	f	2010-09-29	4352	\N	27139	\N
37277	GENERIC_DAY	1	0	f	2010-10-09	4354	\N	27139	\N
37259	GENERIC_DAY	1	4	f	2010-09-30	4354	\N	27139	\N
37260	GENERIC_DAY	1	4	f	2010-09-21	4354	\N	27139	\N
37315	GENERIC_DAY	1	0	f	2010-09-25	4354	\N	27139	\N
37267	GENERIC_DAY	1	4	f	2010-10-01	4352	\N	27139	\N
37324	GENERIC_DAY	1	4	f	2010-10-04	4354	\N	27139	\N
37270	GENERIC_DAY	1	4	f	2010-10-05	4354	\N	27139	\N
37317	GENERIC_DAY	1	4	f	2010-10-06	4352	\N	27139	\N
37316	GENERIC_DAY	1	4	f	2010-09-28	4354	\N	27139	\N
37261	GENERIC_DAY	1	0	f	2010-09-12	4352	\N	27139	\N
37326	GENERIC_DAY	1	4	f	2010-10-13	4354	\N	27139	\N
37319	GENERIC_DAY	1	4	f	2010-09-17	4354	\N	27139	\N
37258	GENERIC_DAY	1	4	f	2010-09-16	4352	\N	27139	\N
37311	GENERIC_DAY	1	0	f	2010-09-19	4352	\N	27139	\N
37257	GENERIC_DAY	1	4	f	2010-10-07	4354	\N	27139	\N
37310	GENERIC_DAY	1	0	f	2010-10-02	4352	\N	27139	\N
37283	GENERIC_DAY	1	0	f	2010-10-10	4352	\N	27139	\N
37325	GENERIC_DAY	1	4	f	2010-09-14	4352	\N	27139	\N
37328	GENERIC_DAY	1	4	f	2010-10-08	4352	\N	27139	\N
37307	GENERIC_DAY	1	0	f	2010-10-10	4354	\N	27139	\N
37298	GENERIC_DAY	1	0	f	2010-09-19	4354	\N	27139	\N
37266	GENERIC_DAY	1	4	f	2010-10-08	4354	\N	27139	\N
37262	GENERIC_DAY	1	4	f	2010-09-14	4354	\N	27139	\N
37312	GENERIC_DAY	1	0	f	2010-10-09	4352	\N	27139	\N
37299	GENERIC_DAY	1	1	f	2010-10-14	4352	\N	27139	\N
37302	GENERIC_DAY	1	4	f	2010-09-20	4354	\N	27139	\N
37313	GENERIC_DAY	1	4	f	2010-09-23	4354	\N	27139	\N
37321	GENERIC_DAY	1	4	f	2010-09-10	4354	\N	27139	\N
37275	GENERIC_DAY	1	4	f	2010-09-09	4354	\N	27139	\N
37296	GENERIC_DAY	1	4	f	2010-09-27	4352	\N	27139	\N
37263	GENERIC_DAY	1	4	f	2010-10-11	4354	\N	27139	\N
37308	GENERIC_DAY	1	4	f	2010-09-15	4354	\N	27139	\N
37276	GENERIC_DAY	1	0	f	2010-10-03	4354	\N	27139	\N
37304	GENERIC_DAY	1	0	f	2010-09-11	4352	\N	27139	\N
37329	GENERIC_DAY	1	4	f	2010-10-04	4352	\N	27139	\N
37320	GENERIC_DAY	1	4	f	2010-09-30	4352	\N	27139	\N
37323	GENERIC_DAY	1	0	f	2010-09-25	4352	\N	27139	\N
37306	GENERIC_DAY	1	4	f	2010-10-05	4352	\N	27139	\N
37264	GENERIC_DAY	1	4	f	2010-10-01	4354	\N	27139	\N
37279	GENERIC_DAY	1	0	f	2010-09-12	4354	\N	27139	\N
37314	GENERIC_DAY	1	1	f	2010-10-14	4354	\N	27139	\N
37280	GENERIC_DAY	1	4	f	2010-10-07	4352	\N	27139	\N
37330	GENERIC_DAY	1	4	f	2010-10-06	4354	\N	27139	\N
37291	GENERIC_DAY	1	4	f	2010-09-08	4352	\N	27139	\N
37274	GENERIC_DAY	1	4	f	2010-09-15	4352	\N	27139	\N
37272	GENERIC_DAY	1	4	f	2010-09-21	4352	\N	27139	\N
37269	GENERIC_DAY	1	4	f	2010-09-17	4352	\N	27139	\N
37278	GENERIC_DAY	1	4	f	2010-09-28	4352	\N	27139	\N
37327	GENERIC_DAY	1	0	f	2010-09-26	4354	\N	27139	\N
37297	GENERIC_DAY	1	4	f	2010-09-13	4352	\N	27139	\N
37301	GENERIC_DAY	1	4	f	2010-09-29	4354	\N	27139	\N
37305	GENERIC_DAY	1	4	f	2010-09-24	4354	\N	27139	\N
37284	GENERIC_DAY	1	4	f	2010-09-13	4354	\N	27139	\N
37322	GENERIC_DAY	1	0	f	2010-09-18	4354	\N	27139	\N
37265	GENERIC_DAY	1	4	f	2010-09-23	4352	\N	27139	\N
37309	GENERIC_DAY	1	4	f	2010-09-08	4354	\N	27139	\N
37282	GENERIC_DAY	1	0	f	2010-10-02	4354	\N	27139	\N
37292	GENERIC_DAY	1	4	f	2010-09-09	4352	\N	27139	\N
37293	GENERIC_DAY	1	4	f	2010-10-13	4352	\N	27139	\N
37273	GENERIC_DAY	1	4	f	2010-09-22	4352	\N	27139	\N
37300	GENERIC_DAY	1	4	f	2010-09-10	4352	\N	27139	\N
37294	GENERIC_DAY	1	0	f	2010-09-18	4352	\N	27139	\N
37303	GENERIC_DAY	1	4	f	2010-10-12	4352	\N	27139	\N
37295	GENERIC_DAY	1	4	f	2010-09-24	4352	\N	27139	\N
37281	GENERIC_DAY	1	0	f	2010-10-03	4352	\N	27139	\N
37271	GENERIC_DAY	1	0	f	2010-09-11	4354	\N	27139	\N
37268	GENERIC_DAY	1	4	f	2010-10-12	4354	\N	27139	\N
37371	GENERIC_DAY	1	2	f	2010-10-04	4344	\N	27140	\N
37372	GENERIC_DAY	1	2	f	2010-09-23	4348	\N	27140	\N
37356	GENERIC_DAY	1	2	f	2010-09-14	4348	\N	27140	\N
37333	GENERIC_DAY	1	0	f	2010-09-19	4344	\N	27140	\N
37426	GENERIC_DAY	1	2	f	2010-09-23	4350	\N	27140	\N
37378	GENERIC_DAY	1	2	f	2010-09-27	4358	\N	27140	\N
37349	GENERIC_DAY	1	2	f	2010-09-09	4344	\N	27140	\N
37400	GENERIC_DAY	1	2	f	2010-09-10	4350	\N	27140	\N
37406	GENERIC_DAY	1	0	f	2010-09-19	4348	\N	27140	\N
37429	GENERIC_DAY	1	2	f	2010-09-29	4358	\N	27140	\N
37395	GENERIC_DAY	1	2	f	2010-09-10	4358	\N	27140	\N
37393	GENERIC_DAY	1	2	f	2010-09-09	4358	\N	27140	\N
37335	GENERIC_DAY	1	2	f	2010-09-08	4358	\N	27140	\N
37341	GENERIC_DAY	1	2	f	2010-09-27	4348	\N	27140	\N
37402	GENERIC_DAY	1	2	f	2010-09-24	4348	\N	27140	\N
37394	GENERIC_DAY	1	0	f	2010-10-02	4350	\N	27140	\N
37432	GENERIC_DAY	1	0	f	2010-10-02	4358	\N	27140	\N
37413	GENERIC_DAY	1	2	f	2010-09-23	4358	\N	27140	\N
37377	GENERIC_DAY	1	0	f	2010-09-11	4358	\N	27140	\N
37383	GENERIC_DAY	1	0	f	2010-09-19	4350	\N	27140	\N
37410	GENERIC_DAY	1	0	f	2010-09-26	4348	\N	27140	\N
37438	GENERIC_DAY	1	2	f	2010-09-08	4350	\N	27140	\N
37389	GENERIC_DAY	1	2	f	2010-09-22	4358	\N	27140	\N
37379	GENERIC_DAY	1	2	f	2010-09-21	4344	\N	27140	\N
37363	GENERIC_DAY	1	2	f	2010-09-20	4344	\N	27140	\N
37421	GENERIC_DAY	1	2	f	2010-09-28	4350	\N	27140	\N
37416	GENERIC_DAY	1	2	f	2010-09-15	4348	\N	27140	\N
37390	GENERIC_DAY	1	2	f	2010-09-09	4350	\N	27140	\N
37420	GENERIC_DAY	1	2	f	2010-09-09	4348	\N	27140	\N
37425	GENERIC_DAY	1	2	f	2010-09-28	4344	\N	27140	\N
37415	GENERIC_DAY	1	2	f	2010-10-01	4350	\N	27140	\N
37368	GENERIC_DAY	1	2	f	2010-09-24	4358	\N	27140	\N
37423	GENERIC_DAY	1	2	f	2010-10-01	4358	\N	27140	\N
37355	GENERIC_DAY	1	2	f	2010-09-28	4358	\N	27140	\N
37436	GENERIC_DAY	1	2	f	2010-09-30	4348	\N	27140	\N
37386	GENERIC_DAY	1	2	f	2010-10-01	4344	\N	27140	\N
37340	GENERIC_DAY	1	2	f	2010-09-16	4348	\N	27140	\N
37352	GENERIC_DAY	1	2	f	2010-09-27	4350	\N	27140	\N
37339	GENERIC_DAY	1	2	f	2010-09-17	4348	\N	27140	\N
37353	GENERIC_DAY	1	2	f	2010-09-10	4344	\N	27140	\N
37360	GENERIC_DAY	1	2	f	2010-09-22	4348	\N	27140	\N
37412	GENERIC_DAY	1	0	f	2010-09-26	4344	\N	27140	\N
37342	GENERIC_DAY	1	2	f	2010-09-20	4348	\N	27140	\N
37396	GENERIC_DAY	1	0	f	2010-09-26	4358	\N	27140	\N
37348	GENERIC_DAY	1	2	f	2010-09-13	4348	\N	27140	\N
37419	GENERIC_DAY	1	0	f	2010-10-03	4348	\N	27140	\N
37434	GENERIC_DAY	1	2	f	2010-09-16	4350	\N	27140	\N
37388	GENERIC_DAY	1	0	f	2010-10-02	4344	\N	27140	\N
37414	GENERIC_DAY	1	2	f	2010-09-13	4344	\N	27140	\N
37397	GENERIC_DAY	1	2	f	2010-09-22	4344	\N	27140	\N
37424	GENERIC_DAY	1	2	f	2010-10-04	4348	\N	27140	\N
37431	GENERIC_DAY	1	2	f	2010-09-30	4344	\N	27140	\N
37380	GENERIC_DAY	1	2	f	2010-09-23	4344	\N	27140	\N
37430	GENERIC_DAY	1	0	f	2010-09-12	4348	\N	27140	\N
37411	GENERIC_DAY	1	0	f	2010-10-03	4350	\N	27140	\N
37384	GENERIC_DAY	1	2	f	2010-09-16	4344	\N	27140	\N
37399	GENERIC_DAY	1	0	f	2010-09-18	4350	\N	27140	\N
37433	GENERIC_DAY	1	1	f	2010-10-04	4350	\N	27140	\N
37331	GENERIC_DAY	1	2	f	2010-09-22	4350	\N	27140	\N
37401	GENERIC_DAY	1	0	f	2010-10-03	4358	\N	27140	\N
37405	GENERIC_DAY	1	0	f	2010-09-25	4350	\N	27140	\N
37337	GENERIC_DAY	1	2	f	2010-09-24	4344	\N	27140	\N
37354	GENERIC_DAY	1	0	f	2010-09-26	4350	\N	27140	\N
37404	GENERIC_DAY	1	2	f	2010-09-15	4358	\N	27140	\N
37437	GENERIC_DAY	1	0	f	2010-09-12	4358	\N	27140	\N
37382	GENERIC_DAY	1	2	f	2010-09-20	4358	\N	27140	\N
37369	GENERIC_DAY	1	0	f	2010-09-12	4350	\N	27140	\N
37345	GENERIC_DAY	1	2	f	2010-09-17	4358	\N	27140	\N
37417	GENERIC_DAY	1	2	f	2010-09-14	4350	\N	27140	\N
37332	GENERIC_DAY	1	2	f	2010-09-15	4344	\N	27140	\N
37408	GENERIC_DAY	1	2	f	2010-09-21	4348	\N	27140	\N
37347	GENERIC_DAY	1	2	f	2010-09-30	4358	\N	27140	\N
37376	GENERIC_DAY	1	2	f	2010-09-29	4348	\N	27140	\N
37391	GENERIC_DAY	1	2	f	2010-09-08	4348	\N	27140	\N
37375	GENERIC_DAY	1	0	f	2010-09-11	4348	\N	27140	\N
37362	GENERIC_DAY	1	0	f	2010-09-25	4348	\N	27140	\N
37344	GENERIC_DAY	1	2	f	2010-09-30	4350	\N	27140	\N
37381	GENERIC_DAY	1	2	f	2010-09-08	4344	\N	27140	\N
37409	GENERIC_DAY	1	2	f	2010-10-01	4348	\N	27140	\N
37343	GENERIC_DAY	1	2	f	2010-09-15	4350	\N	27140	\N
37346	GENERIC_DAY	1	2	f	2010-09-16	4358	\N	27140	\N
37357	GENERIC_DAY	1	2	f	2010-09-13	4358	\N	27140	\N
37350	GENERIC_DAY	1	2	f	2010-09-17	4350	\N	27140	\N
37435	GENERIC_DAY	1	2	f	2010-09-29	4350	\N	27140	\N
37364	GENERIC_DAY	1	2	f	2010-09-29	4344	\N	27140	\N
37427	GENERIC_DAY	1	1	f	2010-10-04	4358	\N	27140	\N
37365	GENERIC_DAY	1	2	f	2010-09-10	4348	\N	27140	\N
37398	GENERIC_DAY	1	0	f	2010-09-12	4344	\N	27140	\N
37373	GENERIC_DAY	1	0	f	2010-10-02	4348	\N	27140	\N
37338	GENERIC_DAY	1	2	f	2010-09-24	4350	\N	27140	\N
37358	GENERIC_DAY	1	2	f	2010-09-14	4358	\N	27140	\N
37359	GENERIC_DAY	1	0	f	2010-09-18	4348	\N	27140	\N
37428	GENERIC_DAY	1	2	f	2010-09-14	4344	\N	27140	\N
37370	GENERIC_DAY	1	2	f	2010-09-17	4344	\N	27140	\N
37336	GENERIC_DAY	1	0	f	2010-09-25	4344	\N	27140	\N
37351	GENERIC_DAY	1	0	f	2010-09-19	4358	\N	27140	\N
37361	GENERIC_DAY	1	0	f	2010-09-18	4344	\N	27140	\N
37367	GENERIC_DAY	1	0	f	2010-09-25	4358	\N	27140	\N
37418	GENERIC_DAY	1	0	f	2010-09-11	4350	\N	27140	\N
37374	GENERIC_DAY	1	0	f	2010-09-18	4358	\N	27140	\N
37422	GENERIC_DAY	1	2	f	2010-09-21	4358	\N	27140	\N
37385	GENERIC_DAY	1	2	f	2010-09-28	4348	\N	27140	\N
37387	GENERIC_DAY	1	2	f	2010-09-27	4344	\N	27140	\N
37392	GENERIC_DAY	1	0	f	2010-10-03	4344	\N	27140	\N
37407	GENERIC_DAY	1	2	f	2010-09-20	4350	\N	27140	\N
37366	GENERIC_DAY	1	2	f	2010-09-21	4350	\N	27140	\N
37334	GENERIC_DAY	1	2	f	2010-09-13	4350	\N	27140	\N
37403	GENERIC_DAY	1	0	f	2010-09-11	4344	\N	27140	\N
37442	GENERIC_DAY	1	0	f	2010-09-19	4350	\N	27141	\N
37450	GENERIC_DAY	1	2	f	2010-09-14	4348	\N	27141	\N
37460	GENERIC_DAY	1	2	f	2010-09-17	4350	\N	27141	\N
37466	GENERIC_DAY	1	2	f	2010-09-21	4358	\N	27141	\N
37468	GENERIC_DAY	1	2	f	2010-09-16	4350	\N	27141	\N
37449	GENERIC_DAY	1	2	f	2010-09-10	4344	\N	27141	\N
37474	GENERIC_DAY	1	2	f	2010-09-23	4350	\N	27141	\N
37464	GENERIC_DAY	1	2	f	2010-09-08	4358	\N	27141	\N
37475	GENERIC_DAY	1	2	f	2010-09-22	4358	\N	27141	\N
37445	GENERIC_DAY	1	2	f	2010-09-14	4350	\N	27141	\N
37439	GENERIC_DAY	1	2	f	2010-09-16	4348	\N	27141	\N
37469	GENERIC_DAY	1	2	f	2010-09-17	4348	\N	27141	\N
37452	GENERIC_DAY	1	1	f	2010-09-24	4350	\N	27141	\N
37457	GENERIC_DAY	1	0	f	2010-09-18	4348	\N	27141	\N
37451	GENERIC_DAY	1	2	f	2010-09-08	4344	\N	27141	\N
37471	GENERIC_DAY	1	0	f	2010-09-12	4358	\N	27141	\N
37447	GENERIC_DAY	1	2	f	2010-09-23	4348	\N	27141	\N
37472	GENERIC_DAY	1	2	f	2010-09-15	4348	\N	27141	\N
37458	GENERIC_DAY	1	0	f	2010-09-12	4350	\N	27141	\N
37453	GENERIC_DAY	1	2	f	2010-09-24	4344	\N	27141	\N
37440	GENERIC_DAY	1	2	f	2010-09-14	4358	\N	27141	\N
37467	GENERIC_DAY	1	2	f	2010-09-13	4348	\N	27141	\N
37462	GENERIC_DAY	1	2	f	2010-09-20	4348	\N	27141	\N
37454	GENERIC_DAY	1	2	f	2010-09-09	4350	\N	27141	\N
37446	GENERIC_DAY	1	2	f	2010-09-16	4358	\N	27141	\N
37470	GENERIC_DAY	1	0	f	2010-09-18	4358	\N	27141	\N
37443	GENERIC_DAY	1	2	f	2010-09-20	4358	\N	27141	\N
37473	GENERIC_DAY	1	2	f	2010-09-17	4358	\N	27141	\N
37459	GENERIC_DAY	1	2	f	2010-09-09	4358	\N	27141	\N
37455	GENERIC_DAY	1	2	f	2010-09-16	4344	\N	27141	\N
37444	GENERIC_DAY	1	2	f	2010-09-21	4344	\N	27141	\N
37441	GENERIC_DAY	1	0	f	2010-09-12	4348	\N	27141	\N
37456	GENERIC_DAY	1	1	f	2010-09-24	4348	\N	27141	\N
37463	GENERIC_DAY	1	0	f	2010-09-11	4358	\N	27141	\N
37448	GENERIC_DAY	1	0	f	2010-09-11	4348	\N	27141	\N
37461	GENERIC_DAY	1	2	f	2010-09-09	4344	\N	27141	\N
37465	GENERIC_DAY	1	2	f	2010-09-14	4344	\N	27141	\N
37476	GENERIC_DAY	1	2	f	2010-09-22	4344	\N	27141	\N
37542	GENERIC_DAY	1	4	f	2010-10-27	4352	\N	27142	\N
37523	GENERIC_DAY	1	4	f	2010-10-26	4354	\N	27142	\N
37535	GENERIC_DAY	1	0	f	2010-11-07	4354	\N	27142	\N
37564	GENERIC_DAY	1	4	f	2010-10-05	4354	\N	27142	\N
37534	GENERIC_DAY	1	4	f	2010-10-26	4352	\N	27142	\N
37530	GENERIC_DAY	1	0	f	2010-10-31	4352	\N	27142	\N
37568	GENERIC_DAY	1	4	f	2010-10-22	4354	\N	27142	\N
37559	GENERIC_DAY	1	0	f	2010-10-24	4354	\N	27142	\N
37520	GENERIC_DAY	1	4	f	2010-10-11	4354	\N	27142	\N
37556	GENERIC_DAY	1	4	f	2010-10-20	4352	\N	27142	\N
37572	GENERIC_DAY	1	0	f	2010-10-30	4352	\N	27142	\N
37569	GENERIC_DAY	1	4	f	2010-10-12	4354	\N	27142	\N
37533	GENERIC_DAY	1	4	f	2010-10-29	4354	\N	27142	\N
37573	GENERIC_DAY	1	0	f	2010-10-31	4354	\N	27142	\N
37567	GENERIC_DAY	1	4	f	2010-10-15	4352	\N	27142	\N
37548	GENERIC_DAY	1	0	f	2010-11-06	4354	\N	27142	\N
37509	GENERIC_DAY	1	4	f	2010-10-21	4354	\N	27142	\N
37560	GENERIC_DAY	1	4	f	2010-11-02	4354	\N	27142	\N
37545	GENERIC_DAY	1	4	f	2010-10-21	4352	\N	27142	\N
37549	GENERIC_DAY	1	4	f	2010-10-28	4354	\N	27142	\N
37574	GENERIC_DAY	1	4	f	2010-10-18	4352	\N	27142	\N
37528	GENERIC_DAY	1	4	f	2010-10-12	4352	\N	27142	\N
37553	GENERIC_DAY	1	4	f	2010-10-20	4354	\N	27142	\N
37514	GENERIC_DAY	1	4	f	2010-11-03	4354	\N	27142	\N
37570	GENERIC_DAY	1	4	f	2010-10-06	4352	\N	27142	\N
37546	GENERIC_DAY	1	4	f	2010-10-14	4352	\N	27142	\N
37571	GENERIC_DAY	1	4	f	2010-10-27	4354	\N	27142	\N
37531	GENERIC_DAY	1	4	f	2010-10-19	4352	\N	27142	\N
37540	GENERIC_DAY	1	4	f	2010-10-28	4352	\N	27142	\N
37513	GENERIC_DAY	1	0	f	2010-10-30	4354	\N	27142	\N
37522	GENERIC_DAY	1	0	f	2010-10-09	4354	\N	27142	\N
37539	GENERIC_DAY	1	4	f	2010-10-25	4354	\N	27142	\N
37551	GENERIC_DAY	1	0	f	2010-11-06	4352	\N	27142	\N
37525	GENERIC_DAY	1	4	f	2010-10-11	4352	\N	27142	\N
37565	GENERIC_DAY	1	4	f	2010-11-05	4352	\N	27142	\N
37529	GENERIC_DAY	1	4	f	2010-11-08	4352	\N	27142	\N
37521	GENERIC_DAY	1	0	f	2010-10-17	4354	\N	27142	\N
37547	GENERIC_DAY	1	0	f	2010-10-23	4354	\N	27142	\N
37563	GENERIC_DAY	1	0	f	2010-10-24	4352	\N	27142	\N
37526	GENERIC_DAY	1	4	f	2010-10-05	4352	\N	27142	\N
37511	GENERIC_DAY	1	4	f	2010-11-05	4354	\N	27142	\N
37527	GENERIC_DAY	1	4	f	2010-11-02	4352	\N	27142	\N
37552	GENERIC_DAY	1	4	f	2010-10-25	4352	\N	27142	\N
37575	GENERIC_DAY	1	0	f	2010-10-16	4352	\N	27142	\N
37507	GENERIC_DAY	1	4	f	2010-11-03	4352	\N	27142	\N
37555	GENERIC_DAY	1	0	f	2010-10-16	4354	\N	27142	\N
37561	GENERIC_DAY	1	4	f	2010-11-04	4352	\N	27142	\N
37544	GENERIC_DAY	1	0	f	2010-10-23	4352	\N	27142	\N
37554	GENERIC_DAY	1	4	f	2010-10-15	4354	\N	27142	\N
37524	GENERIC_DAY	1	4	f	2010-10-06	4354	\N	27142	\N
37562	GENERIC_DAY	1	4	f	2010-11-04	4354	\N	27142	\N
37532	GENERIC_DAY	1	4	f	2010-10-07	4354	\N	27142	\N
37536	GENERIC_DAY	1	0	f	2010-10-09	4352	\N	27142	\N
37537	GENERIC_DAY	1	4	f	2010-11-01	4352	\N	27142	\N
37518	GENERIC_DAY	1	4	f	2010-10-08	4352	\N	27142	\N
37110	GENERIC_DAY	1	2	f	2010-10-26	4350	\N	27137	\N
37045	GENERIC_DAY	1	0	f	2010-10-30	4348	\N	27137	\N
37098	GENERIC_DAY	1	2	f	2010-10-14	4358	\N	27137	\N
37054	GENERIC_DAY	1	2	f	2010-11-05	4350	\N	27137	\N
37103	GENERIC_DAY	1	2	f	2010-10-13	4358	\N	27137	\N
37112	GENERIC_DAY	1	0	f	2010-11-07	4344	\N	27137	\N
37025	GENERIC_DAY	1	2	f	2010-11-05	4348	\N	27137	\N
37033	GENERIC_DAY	1	2	f	2010-11-08	4348	\N	27137	\N
37046	GENERIC_DAY	1	2	f	2010-11-08	4344	\N	27137	\N
37052	GENERIC_DAY	1	2	f	2010-11-01	4358	\N	27137	\N
37016	GENERIC_DAY	1	2	f	2010-10-21	4344	\N	27137	\N
37023	GENERIC_DAY	1	2	f	2010-11-01	4350	\N	27137	\N
37049	GENERIC_DAY	1	0	f	2010-10-16	4344	\N	27137	\N
37020	GENERIC_DAY	1	2	f	2010-10-15	4350	\N	27137	\N
37084	GENERIC_DAY	1	2	f	2010-10-28	4350	\N	27137	\N
37028	GENERIC_DAY	1	0	f	2010-10-23	4350	\N	27137	\N
37031	GENERIC_DAY	1	2	f	2010-11-04	4358	\N	27137	\N
37076	GENERIC_DAY	1	0	f	2010-10-16	4350	\N	27137	\N
37022	GENERIC_DAY	1	2	f	2010-10-18	4344	\N	27137	\N
37026	GENERIC_DAY	1	2	f	2010-10-25	4348	\N	27137	\N
37055	GENERIC_DAY	1	2	f	2010-10-25	4358	\N	27137	\N
37044	GENERIC_DAY	1	2	f	2010-10-19	4350	\N	27137	\N
37097	GENERIC_DAY	1	2	f	2010-10-22	4344	\N	27137	\N
37017	GENERIC_DAY	1	2	f	2010-10-29	4350	\N	27137	\N
37013	GENERIC_DAY	1	0	f	2010-10-23	4344	\N	27137	\N
37047	GENERIC_DAY	1	2	f	2010-10-20	4350	\N	27137	\N
37068	GENERIC_DAY	1	2	f	2010-10-20	4358	\N	27137	\N
37072	GENERIC_DAY	1	2	f	2010-10-28	4348	\N	27137	\N
37111	GENERIC_DAY	1	0	f	2010-10-16	4348	\N	27137	\N
37085	GENERIC_DAY	1	2	f	2010-10-29	4348	\N	27137	\N
37010	GENERIC_DAY	1	0	f	2010-10-24	4358	\N	27137	\N
37024	GENERIC_DAY	1	1	f	2010-11-08	4358	\N	27137	\N
37077	GENERIC_DAY	1	2	f	2010-10-26	4344	\N	27137	\N
37113	GENERIC_DAY	1	0	f	2010-10-24	4350	\N	27137	\N
37043	GENERIC_DAY	1	2	f	2010-11-03	4350	\N	27137	\N
37058	GENERIC_DAY	1	2	f	2010-10-26	4348	\N	27137	\N
37030	GENERIC_DAY	1	2	f	2010-10-13	4344	\N	27137	\N
37101	GENERIC_DAY	1	0	f	2010-10-17	4348	\N	27137	\N
37012	GENERIC_DAY	1	0	f	2010-11-06	4350	\N	27137	\N
37102	GENERIC_DAY	1	2	f	2010-10-29	4344	\N	27137	\N
37071	GENERIC_DAY	1	2	f	2010-10-29	4358	\N	27137	\N
37042	GENERIC_DAY	1	2	f	2010-10-15	4344	\N	27137	\N
37041	GENERIC_DAY	1	0	f	2010-10-24	4344	\N	27137	\N
37104	GENERIC_DAY	1	2	f	2010-10-13	4350	\N	27137	\N
37096	GENERIC_DAY	1	2	f	2010-10-27	4350	\N	27137	\N
37060	GENERIC_DAY	1	2	f	2010-10-25	4350	\N	27137	\N
37087	GENERIC_DAY	1	0	f	2010-10-23	4358	\N	27137	\N
37083	GENERIC_DAY	1	2	f	2010-11-03	4358	\N	27137	\N
37114	GENERIC_DAY	1	2	f	2010-10-26	4358	\N	27137	\N
37105	GENERIC_DAY	1	0	f	2010-11-06	4344	\N	27137	\N
37032	GENERIC_DAY	1	2	f	2010-10-14	4344	\N	27137	\N
37051	GENERIC_DAY	1	2	f	2010-11-05	4358	\N	27137	\N
37015	GENERIC_DAY	1	2	f	2010-10-22	4358	\N	27137	\N
37107	GENERIC_DAY	1	2	f	2010-10-15	4348	\N	27137	\N
37021	GENERIC_DAY	1	2	f	2010-11-04	4344	\N	27137	\N
37053	GENERIC_DAY	1	0	f	2010-10-23	4348	\N	27137	\N
37039	GENERIC_DAY	1	2	f	2010-10-19	4344	\N	27137	\N
37078	GENERIC_DAY	1	2	f	2010-10-19	4348	\N	27137	\N
37079	GENERIC_DAY	1	2	f	2010-11-01	4348	\N	27137	\N
37040	GENERIC_DAY	1	2	f	2010-11-03	4344	\N	27137	\N
37029	GENERIC_DAY	1	2	f	2010-11-05	4344	\N	27137	\N
37074	GENERIC_DAY	1	2	f	2010-10-27	4344	\N	27137	\N
37035	GENERIC_DAY	1	2	f	2010-10-25	4344	\N	27137	\N
37034	GENERIC_DAY	1	2	f	2010-10-18	4350	\N	27137	\N
37089	GENERIC_DAY	1	2	f	2010-10-15	4358	\N	27137	\N
37011	GENERIC_DAY	1	2	f	2010-11-02	4348	\N	27137	\N
37109	GENERIC_DAY	1	0	f	2010-11-06	4358	\N	27137	\N
37050	GENERIC_DAY	1	2	f	2010-10-20	4344	\N	27137	\N
37091	GENERIC_DAY	1	0	f	2010-11-07	4350	\N	27137	\N
37088	GENERIC_DAY	1	2	f	2010-11-04	4350	\N	27137	\N
37064	GENERIC_DAY	1	2	f	2010-11-02	4350	\N	27137	\N
37115	GENERIC_DAY	1	0	f	2010-10-17	4358	\N	27137	\N
37073	GENERIC_DAY	1	2	f	2010-11-02	4344	\N	27137	\N
37081	GENERIC_DAY	1	2	f	2010-10-28	4344	\N	27137	\N
37108	GENERIC_DAY	1	0	f	2010-10-30	4358	\N	27137	\N
37018	GENERIC_DAY	1	2	f	2010-11-03	4348	\N	27137	\N
37092	GENERIC_DAY	1	0	f	2010-11-07	4348	\N	27137	\N
37014	GENERIC_DAY	1	2	f	2010-10-20	4348	\N	27137	\N
37057	GENERIC_DAY	1	2	f	2010-10-21	4350	\N	27137	\N
37090	GENERIC_DAY	1	0	f	2010-11-06	4348	\N	27137	\N
37095	GENERIC_DAY	1	1	f	2010-11-08	4350	\N	27137	\N
37094	GENERIC_DAY	1	2	f	2010-10-21	4358	\N	27137	\N
37038	GENERIC_DAY	1	0	f	2010-10-24	4348	\N	27137	\N
37100	GENERIC_DAY	1	2	f	2010-11-01	4344	\N	27137	\N
37061	GENERIC_DAY	1	2	f	2010-10-22	4348	\N	27137	\N
37067	GENERIC_DAY	1	2	f	2010-10-19	4358	\N	27137	\N
37099	GENERIC_DAY	1	0	f	2010-10-31	4358	\N	27137	\N
37027	GENERIC_DAY	1	2	f	2010-10-22	4350	\N	27137	\N
37062	GENERIC_DAY	1	2	f	2010-10-14	4350	\N	27137	\N
37116	GENERIC_DAY	1	2	f	2010-10-18	4358	\N	27137	\N
37048	GENERIC_DAY	1	0	f	2010-11-07	4358	\N	27137	\N
37059	GENERIC_DAY	1	2	f	2010-10-13	4348	\N	27137	\N
37037	GENERIC_DAY	1	0	f	2010-10-30	4350	\N	27137	\N
37009	GENERIC_DAY	1	0	f	2010-10-17	4350	\N	27137	\N
37065	GENERIC_DAY	1	0	f	2010-10-16	4358	\N	27137	\N
37036	GENERIC_DAY	1	0	f	2010-10-31	4344	\N	27137	\N
37019	GENERIC_DAY	1	0	f	2010-10-31	4350	\N	27137	\N
37106	GENERIC_DAY	1	0	f	2010-10-30	4344	\N	27137	\N
37069	GENERIC_DAY	1	2	f	2010-10-28	4358	\N	27137	\N
37056	GENERIC_DAY	1	2	f	2010-10-18	4348	\N	27137	\N
37140	GENERIC_DAY	1	2	f	2010-11-22	4348	\N	27138	\N
37178	GENERIC_DAY	1	2	f	2010-12-06	4348	\N	27138	\N
37155	GENERIC_DAY	1	0	f	2010-11-20	4358	\N	27138	\N
37168	GENERIC_DAY	1	2	f	2010-12-10	4358	\N	27138	\N
37204	GENERIC_DAY	1	2	f	2010-11-26	4358	\N	27138	\N
37246	GENERIC_DAY	1	2	f	2010-11-23	4350	\N	27138	\N
37228	GENERIC_DAY	1	2	f	2010-11-30	4348	\N	27138	\N
37185	GENERIC_DAY	1	2	f	2010-12-08	4348	\N	27138	\N
37125	GENERIC_DAY	1	0	f	2010-11-21	4344	\N	27138	\N
37128	GENERIC_DAY	1	0	f	2010-11-27	4344	\N	27138	\N
37127	GENERIC_DAY	1	0	f	2010-12-04	4350	\N	27138	\N
37134	GENERIC_DAY	1	2	f	2010-11-12	4358	\N	27138	\N
37132	GENERIC_DAY	1	2	f	2010-11-25	4344	\N	27138	\N
37211	GENERIC_DAY	1	2	f	2010-11-16	4350	\N	27138	\N
37253	GENERIC_DAY	1	2	f	2010-11-22	4350	\N	27138	\N
37159	GENERIC_DAY	1	0	f	2010-12-05	4358	\N	27138	\N
37224	GENERIC_DAY	1	0	f	2010-11-21	4350	\N	27138	\N
37205	GENERIC_DAY	1	2	f	2010-11-11	4350	\N	27138	\N
37142	GENERIC_DAY	1	2	f	2010-12-03	4350	\N	27138	\N
37183	GENERIC_DAY	1	2	f	2010-12-02	4350	\N	27138	\N
37152	GENERIC_DAY	1	0	f	2010-11-14	4350	\N	27138	\N
37223	GENERIC_DAY	1	2	f	2010-11-15	4350	\N	27138	\N
37222	GENERIC_DAY	1	2	f	2010-12-08	4344	\N	27138	\N
37133	GENERIC_DAY	1	2	f	2010-12-10	4344	\N	27138	\N
37202	GENERIC_DAY	1	2	f	2010-11-26	4348	\N	27138	\N
37166	GENERIC_DAY	1	2	f	2010-11-15	4348	\N	27138	\N
37172	GENERIC_DAY	1	2	f	2010-11-15	4344	\N	27138	\N
37131	GENERIC_DAY	1	2	f	2010-11-09	4350	\N	27138	\N
37203	GENERIC_DAY	1	2	f	2010-11-19	4358	\N	27138	\N
37201	GENERIC_DAY	1	2	f	2010-12-07	4348	\N	27138	\N
37225	GENERIC_DAY	1	2	f	2010-11-26	4344	\N	27138	\N
37164	GENERIC_DAY	1	0	f	2010-12-11	4358	\N	27138	\N
37192	GENERIC_DAY	1	2	f	2010-11-19	4350	\N	27138	\N
37153	GENERIC_DAY	1	2	f	2010-12-02	4348	\N	27138	\N
37180	GENERIC_DAY	1	2	f	2010-12-09	4344	\N	27138	\N
37237	GENERIC_DAY	1	0	f	2010-12-12	4344	\N	27138	\N
37245	GENERIC_DAY	1	0	f	2010-12-12	4350	\N	27138	\N
37193	GENERIC_DAY	1	2	f	2010-12-07	4350	\N	27138	\N
37158	GENERIC_DAY	1	0	f	2010-11-21	4358	\N	27138	\N
37195	GENERIC_DAY	1	2	f	2010-11-24	4350	\N	27138	\N
37122	GENERIC_DAY	1	2	f	2010-11-18	4350	\N	27138	\N
37173	GENERIC_DAY	1	2	f	2010-12-06	4344	\N	27138	\N
37221	GENERIC_DAY	1	0	f	2010-11-21	4348	\N	27138	\N
37175	GENERIC_DAY	1	0	f	2010-11-14	4344	\N	27138	\N
37161	GENERIC_DAY	1	2	f	2010-12-07	4358	\N	27138	\N
37181	GENERIC_DAY	1	2	f	2010-11-29	4344	\N	27138	\N
37170	GENERIC_DAY	1	2	f	2010-11-10	4344	\N	27138	\N
37256	GENERIC_DAY	1	2	f	2010-11-23	4348	\N	27138	\N
37212	GENERIC_DAY	1	2	f	2010-11-17	4348	\N	27138	\N
37239	GENERIC_DAY	1	2	f	2010-11-19	4348	\N	27138	\N
37240	GENERIC_DAY	1	2	f	2010-12-03	4348	\N	27138	\N
37149	GENERIC_DAY	1	0	f	2010-12-12	4348	\N	27138	\N
37157	GENERIC_DAY	1	2	f	2010-12-10	4350	\N	27138	\N
37254	GENERIC_DAY	1	2	f	2010-11-10	4348	\N	27138	\N
37160	GENERIC_DAY	1	2	f	2010-12-13	4358	\N	27138	\N
37141	GENERIC_DAY	1	0	f	2010-11-13	4344	\N	27138	\N
37167	GENERIC_DAY	1	2	f	2010-11-19	4344	\N	27138	\N
37139	GENERIC_DAY	1	0	f	2010-12-11	4348	\N	27138	\N
37156	GENERIC_DAY	1	2	f	2010-11-12	4348	\N	27138	\N
37196	GENERIC_DAY	1	0	f	2010-11-13	4348	\N	27138	\N
37229	GENERIC_DAY	1	0	f	2010-11-20	4344	\N	27138	\N
37179	GENERIC_DAY	1	2	f	2010-11-24	4358	\N	27138	\N
37208	GENERIC_DAY	1	2	f	2010-11-29	4348	\N	27138	\N
37226	GENERIC_DAY	1	2	f	2010-11-18	4358	\N	27138	\N
37207	GENERIC_DAY	1	0	f	2010-11-28	4350	\N	27138	\N
37235	GENERIC_DAY	1	2	f	2010-11-16	4344	\N	27138	\N
37144	GENERIC_DAY	1	2	f	2010-11-25	4358	\N	27138	\N
37251	GENERIC_DAY	1	0	f	2010-12-11	4344	\N	27138	\N
37255	GENERIC_DAY	1	2	f	2010-11-18	4348	\N	27138	\N
37186	GENERIC_DAY	1	2	f	2010-11-15	4358	\N	27138	\N
37177	GENERIC_DAY	1	0	f	2010-12-11	4350	\N	27138	\N
37165	GENERIC_DAY	1	2	f	2010-11-11	4348	\N	27138	\N
37194	GENERIC_DAY	1	0	f	2010-11-27	4350	\N	27138	\N
37200	GENERIC_DAY	1	2	f	2010-12-03	4344	\N	27138	\N
37123	GENERIC_DAY	1	2	f	2010-12-09	4348	\N	27138	\N
37206	GENERIC_DAY	1	2	f	2010-12-10	4348	\N	27138	\N
37230	GENERIC_DAY	1	2	f	2010-12-08	4358	\N	27138	\N
37169	GENERIC_DAY	1	0	f	2010-12-05	4348	\N	27138	\N
37233	GENERIC_DAY	1	2	f	2010-11-24	4348	\N	27138	\N
37243	GENERIC_DAY	1	0	f	2010-12-04	4344	\N	27138	\N
37241	GENERIC_DAY	1	0	f	2010-11-20	4350	\N	27138	\N
37187	GENERIC_DAY	1	2	f	2010-12-01	4344	\N	27138	\N
37216	GENERIC_DAY	1	2	f	2010-11-22	4358	\N	27138	\N
37218	GENERIC_DAY	1	0	f	2010-12-05	4350	\N	27138	\N
37209	GENERIC_DAY	1	2	f	2010-12-08	4350	\N	27138	\N
37234	GENERIC_DAY	1	0	f	2010-11-14	4358	\N	27138	\N
37129	GENERIC_DAY	1	2	f	2010-12-13	4350	\N	27138	\N
37135	GENERIC_DAY	1	0	f	2010-11-13	4358	\N	27138	\N
37188	GENERIC_DAY	1	2	f	2010-11-09	4344	\N	27138	\N
37117	GENERIC_DAY	1	2	f	2010-11-16	4358	\N	27138	\N
37198	GENERIC_DAY	1	0	f	2010-12-04	4358	\N	27138	\N
37147	GENERIC_DAY	1	0	f	2010-11-28	4358	\N	27138	\N
37250	GENERIC_DAY	1	2	f	2010-12-13	4344	\N	27138	\N
37138	GENERIC_DAY	1	0	f	2010-11-27	4348	\N	27138	\N
37249	GENERIC_DAY	1	2	f	2010-11-23	4344	\N	27138	\N
37145	GENERIC_DAY	1	2	f	2010-12-09	4358	\N	27138	\N
37252	GENERIC_DAY	1	2	f	2010-12-02	4358	\N	27138	\N
37118	GENERIC_DAY	1	2	f	2010-12-06	4350	\N	27138	\N
37126	GENERIC_DAY	1	2	f	2010-12-01	4358	\N	27138	\N
37190	GENERIC_DAY	1	2	f	2010-12-01	4350	\N	27138	\N
37232	GENERIC_DAY	1	2	f	2010-11-25	4350	\N	27138	\N
37248	GENERIC_DAY	1	2	f	2010-11-30	4358	\N	27138	\N
37143	GENERIC_DAY	1	2	f	2010-12-03	4358	\N	27138	\N
37215	GENERIC_DAY	1	0	f	2010-11-20	4348	\N	27138	\N
37174	GENERIC_DAY	1	0	f	2010-11-28	4348	\N	27138	\N
37189	GENERIC_DAY	1	2	f	2010-11-12	4350	\N	27138	\N
37191	GENERIC_DAY	1	2	f	2010-11-09	4348	\N	27138	\N
37154	GENERIC_DAY	1	2	f	2010-11-24	4344	\N	27138	\N
37176	GENERIC_DAY	1	2	f	2010-11-30	4350	\N	27138	\N
37130	GENERIC_DAY	1	0	f	2010-11-14	4348	\N	27138	\N
37171	GENERIC_DAY	1	0	f	2010-12-04	4348	\N	27138	\N
37162	GENERIC_DAY	1	2	f	2010-11-22	4344	\N	27138	\N
37217	GENERIC_DAY	1	0	f	2010-12-05	4344	\N	27138	\N
37236	GENERIC_DAY	1	2	f	2010-12-01	4348	\N	27138	\N
37182	GENERIC_DAY	1	0	f	2010-11-28	4344	\N	27138	\N
37238	GENERIC_DAY	1	2	f	2010-12-07	4344	\N	27138	\N
37213	GENERIC_DAY	1	2	f	2010-12-13	4348	\N	27138	\N
37231	GENERIC_DAY	1	2	f	2010-11-17	4350	\N	27138	\N
37244	GENERIC_DAY	1	2	f	2010-11-26	4350	\N	27138	\N
37163	GENERIC_DAY	1	2	f	2010-12-02	4344	\N	27138	\N
37146	GENERIC_DAY	1	2	f	2010-12-09	4350	\N	27138	\N
37121	GENERIC_DAY	1	2	f	2010-11-11	4358	\N	27138	\N
37227	GENERIC_DAY	1	2	f	2010-11-17	4358	\N	27138	\N
37120	GENERIC_DAY	1	2	f	2010-11-23	4358	\N	27138	\N
37242	GENERIC_DAY	1	2	f	2010-11-10	4350	\N	27138	\N
37219	GENERIC_DAY	1	2	f	2010-11-16	4348	\N	27138	\N
37137	GENERIC_DAY	1	2	f	2010-11-11	4344	\N	27138	\N
37136	GENERIC_DAY	1	0	f	2010-11-27	4358	\N	27138	\N
37199	GENERIC_DAY	1	2	f	2010-11-30	4344	\N	27138	\N
37210	GENERIC_DAY	1	2	f	2010-11-25	4348	\N	27138	\N
37197	GENERIC_DAY	1	2	f	2010-11-29	4350	\N	27138	\N
37184	GENERIC_DAY	1	2	f	2010-11-09	4358	\N	27138	\N
37124	GENERIC_DAY	1	0	f	2010-11-13	4350	\N	27138	\N
37150	GENERIC_DAY	1	2	f	2010-11-17	4344	\N	27138	\N
37151	GENERIC_DAY	1	2	f	2010-12-06	4358	\N	27138	\N
37247	GENERIC_DAY	1	2	f	2010-11-12	4344	\N	27138	\N
37214	GENERIC_DAY	1	2	f	2010-11-18	4344	\N	27138	\N
37119	GENERIC_DAY	1	2	f	2010-11-10	4358	\N	27138	\N
37220	GENERIC_DAY	1	2	f	2010-11-29	4358	\N	27138	\N
37148	GENERIC_DAY	1	0	f	2010-12-12	4358	\N	27138	\N
31490	SPECIFIC_DAY	1	8	f	2010-06-23	4352	31212	\N	\N
31481	SPECIFIC_DAY	1	8	f	2010-06-17	4352	31212	\N	\N
31494	SPECIFIC_DAY	1	8	f	2010-07-30	4352	31212	\N	\N
31495	SPECIFIC_DAY	1	8	f	2010-07-22	4352	31212	\N	\N
31480	SPECIFIC_DAY	1	8	f	2010-07-13	4352	31212	\N	\N
31469	SPECIFIC_DAY	1	0	f	2010-07-18	4352	31212	\N	\N
31462	SPECIFIC_DAY	1	8	f	2010-06-25	4352	31212	\N	\N
31489	SPECIFIC_DAY	1	8	f	2010-06-21	4352	31212	\N	\N
31447	SPECIFIC_DAY	1	8	f	2010-08-03	4352	31212	\N	\N
31468	SPECIFIC_DAY	1	8	f	2010-06-18	4352	31212	\N	\N
31455	SPECIFIC_DAY	1	8	f	2010-07-12	4352	31212	\N	\N
31457	SPECIFIC_DAY	1	8	f	2010-06-29	4352	31212	\N	\N
31488	SPECIFIC_DAY	1	8	f	2010-07-05	4352	31212	\N	\N
31463	SPECIFIC_DAY	1	8	f	2010-07-01	4352	31212	\N	\N
31459	SPECIFIC_DAY	1	8	f	2010-06-30	4352	31212	\N	\N
31453	SPECIFIC_DAY	1	0	f	2010-07-11	4352	31212	\N	\N
31485	SPECIFIC_DAY	1	8	f	2010-06-14	4352	31212	\N	\N
31466	SPECIFIC_DAY	1	8	f	2010-06-28	4352	31212	\N	\N
31454	SPECIFIC_DAY	1	8	f	2010-07-21	4352	31212	\N	\N
31456	SPECIFIC_DAY	1	8	f	2010-07-27	4352	31212	\N	\N
31476	SPECIFIC_DAY	1	8	f	2010-06-16	4352	31212	\N	\N
31450	SPECIFIC_DAY	1	8	f	2010-07-19	4352	31212	\N	\N
31465	SPECIFIC_DAY	1	0	f	2010-06-13	4352	31212	\N	\N
31475	SPECIFIC_DAY	1	8	f	2010-08-02	4352	31212	\N	\N
31497	SPECIFIC_DAY	1	8	f	2010-07-23	4352	31212	\N	\N
31448	SPECIFIC_DAY	1	8	f	2010-07-28	4352	31212	\N	\N
31473	SPECIFIC_DAY	1	8	f	2010-07-08	4352	31212	\N	\N
31491	SPECIFIC_DAY	1	8	f	2010-07-16	4352	31212	\N	\N
2895	SPECIFIC_DAY	8	0	f	2010-06-27	1216	2729	\N	\N
2883	SPECIFIC_DAY	8	8	f	2010-06-18	1216	2729	\N	\N
2891	SPECIFIC_DAY	8	8	f	2010-06-23	1216	2729	\N	\N
2884	SPECIFIC_DAY	8	0	f	2010-06-19	1216	2729	\N	\N
2880	SPECIFIC_DAY	8	8	f	2010-06-25	1216	2729	\N	\N
2893	SPECIFIC_DAY	8	8	f	2010-06-24	1216	2729	\N	\N
2894	SPECIFIC_DAY	8	8	f	2010-06-29	1216	2729	\N	\N
2889	SPECIFIC_DAY	8	8	f	2010-06-28	1216	2729	\N	\N
2890	SPECIFIC_DAY	8	4	f	2010-06-30	1216	2729	\N	\N
2885	SPECIFIC_DAY	8	8	f	2010-06-16	1216	2729	\N	\N
2892	SPECIFIC_DAY	8	0	f	2010-06-13	1216	2729	\N	\N
2897	SPECIFIC_DAY	8	8	f	2010-06-21	1216	2729	\N	\N
2882	SPECIFIC_DAY	8	8	f	2010-06-15	1216	2729	\N	\N
2888	SPECIFIC_DAY	8	0	f	2010-06-20	1216	2729	\N	\N
2896	SPECIFIC_DAY	8	8	f	2010-06-14	1216	2729	\N	\N
2887	SPECIFIC_DAY	8	8	f	2010-06-17	1216	2729	\N	\N
4242	SPECIFIC_DAY	4	0	f	2010-07-10	1220	2730	\N	\N
4248	SPECIFIC_DAY	4	0	f	2010-07-04	1220	2730	\N	\N
4243	SPECIFIC_DAY	4	8	f	2010-07-15	1220	2730	\N	\N
4244	SPECIFIC_DAY	4	0	f	2010-07-11	1220	2730	\N	\N
4254	SPECIFIC_DAY	4	8	f	2010-07-07	1220	2730	\N	\N
4252	SPECIFIC_DAY	4	8	f	2010-07-13	1220	2730	\N	\N
4249	SPECIFIC_DAY	4	8	f	2010-07-09	1220	2730	\N	\N
4251	SPECIFIC_DAY	4	8	f	2010-07-01	1220	2730	\N	\N
4250	SPECIFIC_DAY	4	0	f	2010-07-03	1220	2730	\N	\N
4255	SPECIFIC_DAY	4	4	f	2010-06-30	1220	2730	\N	\N
4257	SPECIFIC_DAY	4	8	f	2010-07-02	1220	2730	\N	\N
4258	SPECIFIC_DAY	4	8	f	2010-07-08	1220	2730	\N	\N
4247	SPECIFIC_DAY	4	8	f	2010-07-05	1220	2730	\N	\N
4256	SPECIFIC_DAY	4	8	f	2010-07-06	1220	2730	\N	\N
4245	SPECIFIC_DAY	4	8	f	2010-07-16	1220	2730	\N	\N
4253	SPECIFIC_DAY	4	8	f	2010-07-14	1220	2730	\N	\N
4246	SPECIFIC_DAY	4	8	f	2010-07-12	1220	2730	\N	\N
248680	SPECIFIC_DAY	0	8	f	2011-01-18	1220	248360	\N	\N
248681	SPECIFIC_DAY	0	8	f	2011-01-19	1220	248360	\N	\N
248682	SPECIFIC_DAY	0	8	f	2011-01-21	1220	248360	\N	\N
248683	SPECIFIC_DAY	0	0	f	2011-01-23	1220	248360	\N	\N
248684	SPECIFIC_DAY	0	8	f	2011-01-17	1220	248360	\N	\N
248685	SPECIFIC_DAY	0	0	f	2011-01-16	1220	248360	\N	\N
248686	SPECIFIC_DAY	0	8	f	2011-01-12	1220	248360	\N	\N
248687	SPECIFIC_DAY	0	8	f	2011-01-24	1220	248360	\N	\N
248688	SPECIFIC_DAY	0	8	f	2011-01-14	1220	248360	\N	\N
248689	SPECIFIC_DAY	0	8	f	2011-01-13	1220	248360	\N	\N
248690	SPECIFIC_DAY	0	4	f	2011-01-10	1220	248360	\N	\N
248691	SPECIFIC_DAY	0	8	f	2011-01-25	1220	248360	\N	\N
248692	SPECIFIC_DAY	0	8	f	2011-01-20	1220	248360	\N	\N
248693	SPECIFIC_DAY	0	0	f	2011-01-15	1220	248360	\N	\N
248694	SPECIFIC_DAY	0	8	f	2011-01-11	1220	248360	\N	\N
248695	SPECIFIC_DAY	0	8	f	2011-01-26	1220	248360	\N	\N
248696	SPECIFIC_DAY	0	0	f	2011-01-22	1220	248360	\N	\N
248697	SPECIFIC_DAY	0	0	f	2011-01-09	1216	248361	\N	\N
248698	SPECIFIC_DAY	0	8	f	2010-12-31	1216	248361	\N	\N
248699	SPECIFIC_DAY	0	8	f	2010-12-29	1216	248361	\N	\N
248700	SPECIFIC_DAY	0	8	f	2010-12-27	1216	248361	\N	\N
248701	SPECIFIC_DAY	0	0	f	2010-12-26	1216	248361	\N	\N
248702	SPECIFIC_DAY	0	8	f	2010-12-28	1216	248361	\N	\N
248703	SPECIFIC_DAY	0	0	f	2010-12-25	1216	248361	\N	\N
248704	SPECIFIC_DAY	0	8	f	2010-12-30	1216	248361	\N	\N
248705	SPECIFIC_DAY	0	8	f	2011-01-04	1216	248361	\N	\N
248706	SPECIFIC_DAY	0	8	f	2011-01-06	1216	248361	\N	\N
248707	SPECIFIC_DAY	0	8	f	2010-12-24	1216	248361	\N	\N
248708	SPECIFIC_DAY	0	0	f	2010-12-22	1216	248361	\N	\N
248709	SPECIFIC_DAY	0	8	f	2011-01-05	1216	248361	\N	\N
248710	SPECIFIC_DAY	0	0	f	2011-01-02	1216	248361	\N	\N
248711	SPECIFIC_DAY	0	0	f	2011-01-01	1216	248361	\N	\N
248712	SPECIFIC_DAY	0	8	f	2010-12-23	1216	248361	\N	\N
248713	SPECIFIC_DAY	0	8	f	2011-01-03	1216	248361	\N	\N
248714	SPECIFIC_DAY	0	0	f	2011-01-08	1216	248361	\N	\N
248715	SPECIFIC_DAY	0	4	f	2011-01-10	1216	248361	\N	\N
248716	SPECIFIC_DAY	0	8	f	2011-01-07	1216	248361	\N	\N
248769	SPECIFIC_DAY	0	0	f	2011-01-26	1220	31222	\N	\N
248770	SPECIFIC_DAY	0	8	f	2011-02-07	1220	31222	\N	\N
248771	SPECIFIC_DAY	0	8	f	2011-02-11	1220	31222	\N	\N
248772	SPECIFIC_DAY	0	8	f	2011-02-08	1220	31222	\N	\N
248773	SPECIFIC_DAY	0	0	f	2011-02-13	1220	31222	\N	\N
248774	SPECIFIC_DAY	0	8	f	2011-01-27	1220	31222	\N	\N
248775	SPECIFIC_DAY	0	8	f	2011-02-09	1220	31222	\N	\N
248776	SPECIFIC_DAY	0	0	f	2011-02-12	1220	31222	\N	\N
248777	SPECIFIC_DAY	0	8	f	2011-01-31	1220	31222	\N	\N
248778	SPECIFIC_DAY	0	0	f	2011-01-30	1220	31222	\N	\N
248779	SPECIFIC_DAY	0	8	f	2011-02-03	1220	31222	\N	\N
248780	SPECIFIC_DAY	0	0	f	2011-02-05	1220	31222	\N	\N
248781	SPECIFIC_DAY	0	8	f	2011-02-10	1220	31222	\N	\N
248782	SPECIFIC_DAY	0	4	f	2011-02-14	1220	31222	\N	\N
248783	SPECIFIC_DAY	0	8	f	2011-02-01	1220	31222	\N	\N
248784	SPECIFIC_DAY	0	0	f	2011-02-06	1220	31222	\N	\N
248785	SPECIFIC_DAY	0	8	f	2011-02-02	1220	31222	\N	\N
248786	SPECIFIC_DAY	0	8	f	2011-01-28	1220	31222	\N	\N
248787	SPECIFIC_DAY	0	8	f	2011-02-04	1220	31222	\N	\N
248788	SPECIFIC_DAY	0	0	f	2011-01-29	1220	31222	\N	\N
251564	GENERIC_DAY	0	4	f	2010-10-26	4354	\N	27075	\N
251565	GENERIC_DAY	0	4	f	2010-10-13	4354	\N	27075	\N
251566	GENERIC_DAY	0	4	f	2010-11-01	4354	\N	27075	\N
251567	GENERIC_DAY	0	0	f	2010-10-17	4352	\N	27075	\N
251568	GENERIC_DAY	0	4	f	2010-10-14	4354	\N	27075	\N
251569	GENERIC_DAY	0	4	f	2010-10-15	4352	\N	27075	\N
251570	GENERIC_DAY	0	4	f	2010-10-04	4354	\N	27075	\N
251571	GENERIC_DAY	0	0	f	2010-10-09	4352	\N	27075	\N
251572	GENERIC_DAY	0	4	f	2010-11-02	4352	\N	27075	\N
251573	GENERIC_DAY	0	4	f	2010-10-15	4354	\N	27075	\N
251574	GENERIC_DAY	0	0	f	2010-10-03	4352	\N	27075	\N
251575	GENERIC_DAY	0	4	f	2010-11-03	4352	\N	27075	\N
251576	GENERIC_DAY	0	0	f	2010-10-03	4354	\N	27075	\N
251577	GENERIC_DAY	0	4	f	2010-10-07	4354	\N	27075	\N
251578	GENERIC_DAY	0	0	f	2010-10-10	4352	\N	27075	\N
251579	GENERIC_DAY	0	0	f	2010-10-31	4354	\N	27075	\N
251580	GENERIC_DAY	0	0	f	2010-10-09	4354	\N	27075	\N
251581	GENERIC_DAY	0	4	f	2010-10-01	4352	\N	27075	\N
251582	GENERIC_DAY	0	4	f	2010-10-01	4354	\N	27075	\N
251583	GENERIC_DAY	0	4	f	2010-11-04	4352	\N	27075	\N
251584	GENERIC_DAY	0	0	f	2010-10-31	4352	\N	27075	\N
251585	GENERIC_DAY	0	4	f	2010-10-11	4352	\N	27075	\N
251586	GENERIC_DAY	0	0	f	2010-10-30	4352	\N	27075	\N
251587	GENERIC_DAY	0	4	f	2010-10-19	4354	\N	27075	\N
251588	GENERIC_DAY	0	4	f	2010-11-03	4354	\N	27075	\N
27618	GENERIC_DAY	11	0	f	2010-08-14	4348	\N	27074	\N
27599	GENERIC_DAY	11	2	f	2010-08-10	4358	\N	27074	\N
27573	GENERIC_DAY	11	2	f	2010-08-20	4350	\N	27074	\N
27609	GENERIC_DAY	11	2	f	2010-08-26	4348	\N	27074	\N
27597	GENERIC_DAY	11	2	f	2010-08-05	4350	\N	27074	\N
27660	GENERIC_DAY	11	2	f	2010-08-20	4344	\N	27074	\N
27614	GENERIC_DAY	11	2	f	2010-08-06	4348	\N	27074	\N
27652	GENERIC_DAY	11	2	f	2010-08-25	4358	\N	27074	\N
27631	GENERIC_DAY	11	2	f	2010-08-04	4344	\N	27074	\N
27658	GENERIC_DAY	11	2	f	2010-08-17	4358	\N	27074	\N
27656	GENERIC_DAY	11	2	f	2010-08-09	4358	\N	27074	\N
27662	GENERIC_DAY	11	2	f	2010-08-11	4344	\N	27074	\N
27639	GENERIC_DAY	11	2	f	2010-08-25	4350	\N	27074	\N
27655	GENERIC_DAY	11	1	f	2010-08-27	4358	\N	27074	\N
27583	GENERIC_DAY	11	2	f	2010-08-24	4348	\N	27074	\N
27667	GENERIC_DAY	11	2	f	2010-08-27	4344	\N	27074	\N
27619	GENERIC_DAY	11	2	f	2010-08-23	4344	\N	27074	\N
27669	GENERIC_DAY	11	2	f	2010-08-24	4344	\N	27074	\N
27595	GENERIC_DAY	11	2	f	2010-08-16	4344	\N	27074	\N
27617	GENERIC_DAY	11	2	f	2010-08-05	4344	\N	27074	\N
27659	GENERIC_DAY	11	2	f	2010-08-13	4344	\N	27074	\N
27604	GENERIC_DAY	11	2	f	2010-08-23	4348	\N	27074	\N
27600	GENERIC_DAY	11	0	f	2010-08-08	4344	\N	27074	\N
27636	GENERIC_DAY	11	2	f	2010-08-09	4350	\N	27074	\N
27622	GENERIC_DAY	11	2	f	2010-08-19	4344	\N	27074	\N
27647	GENERIC_DAY	11	0	f	2010-08-15	4344	\N	27074	\N
27580	GENERIC_DAY	11	2	f	2010-08-05	4348	\N	27074	\N
27577	GENERIC_DAY	11	0	f	2010-08-15	4358	\N	27074	\N
27581	GENERIC_DAY	11	2	f	2010-08-23	4358	\N	27074	\N
27644	GENERIC_DAY	11	0	f	2010-08-21	4344	\N	27074	\N
27637	GENERIC_DAY	11	0	f	2010-08-14	4344	\N	27074	\N
27598	GENERIC_DAY	11	2	f	2010-08-13	4350	\N	27074	\N
27648	GENERIC_DAY	11	2	f	2010-08-12	4358	\N	27074	\N
27650	GENERIC_DAY	11	2	f	2010-08-03	4350	\N	27074	\N
27570	GENERIC_DAY	11	0	f	2010-08-21	4358	\N	27074	\N
27624	GENERIC_DAY	11	2	f	2010-08-18	4344	\N	27074	\N
27607	GENERIC_DAY	11	2	f	2010-08-12	4350	\N	27074	\N
27628	GENERIC_DAY	11	2	f	2010-08-19	4358	\N	27074	\N
27615	GENERIC_DAY	11	2	f	2010-08-25	4344	\N	27074	\N
27620	GENERIC_DAY	11	0	f	2010-08-21	4350	\N	27074	\N
27582	GENERIC_DAY	11	2	f	2010-08-25	4348	\N	27074	\N
27576	GENERIC_DAY	11	2	f	2010-08-20	4358	\N	27074	\N
27613	GENERIC_DAY	11	0	f	2010-08-21	4348	\N	27074	\N
27651	GENERIC_DAY	11	0	f	2010-08-22	4344	\N	27074	\N
27640	GENERIC_DAY	11	2	f	2010-08-04	4358	\N	27074	\N
27629	GENERIC_DAY	11	2	f	2010-08-06	4344	\N	27074	\N
27602	GENERIC_DAY	11	2	f	2010-08-20	4348	\N	27074	\N
27612	GENERIC_DAY	11	2	f	2010-08-03	4358	\N	27074	\N
27588	GENERIC_DAY	11	2	f	2010-08-16	4358	\N	27074	\N
27601	GENERIC_DAY	11	0	f	2010-08-15	4348	\N	27074	\N
27594	GENERIC_DAY	11	2	f	2010-08-03	4344	\N	27074	\N
27605	GENERIC_DAY	11	0	f	2010-08-08	4358	\N	27074	\N
27587	GENERIC_DAY	11	2	f	2010-08-17	4348	\N	27074	\N
27591	GENERIC_DAY	11	2	f	2010-08-17	4344	\N	27074	\N
27663	GENERIC_DAY	11	2	f	2010-08-19	4350	\N	27074	\N
27641	GENERIC_DAY	11	2	f	2010-08-18	4348	\N	27074	\N
27571	GENERIC_DAY	11	2	f	2010-08-17	4350	\N	27074	\N
27596	GENERIC_DAY	11	0	f	2010-08-22	4358	\N	27074	\N
27661	GENERIC_DAY	11	0	f	2010-08-14	4358	\N	27074	\N
27632	GENERIC_DAY	11	2	f	2010-08-09	4348	\N	27074	\N
27585	GENERIC_DAY	11	2	f	2010-08-06	4358	\N	27074	\N
27578	GENERIC_DAY	11	2	f	2010-08-23	4350	\N	27074	\N
27666	GENERIC_DAY	11	0	f	2010-08-22	4350	\N	27074	\N
27665	GENERIC_DAY	11	2	f	2010-08-11	4358	\N	27074	\N
27654	GENERIC_DAY	11	2	f	2010-08-26	4358	\N	27074	\N
27633	GENERIC_DAY	11	2	f	2010-08-16	4350	\N	27074	\N
27664	GENERIC_DAY	11	2	f	2010-08-24	4358	\N	27074	\N
27627	GENERIC_DAY	11	0	f	2010-08-15	4350	\N	27074	\N
27610	GENERIC_DAY	11	2	f	2010-08-04	4348	\N	27074	\N
27592	GENERIC_DAY	11	2	f	2010-08-03	4348	\N	27074	\N
27572	GENERIC_DAY	11	0	f	2010-08-07	4344	\N	27074	\N
27642	GENERIC_DAY	11	2	f	2010-08-11	4348	\N	27074	\N
27579	GENERIC_DAY	11	0	f	2010-08-07	4348	\N	27074	\N
27574	GENERIC_DAY	11	0	f	2010-08-22	4348	\N	27074	\N
27646	GENERIC_DAY	11	2	f	2010-08-12	4348	\N	27074	\N
27623	GENERIC_DAY	11	2	f	2010-08-27	4348	\N	27074	\N
27634	GENERIC_DAY	11	2	f	2010-08-26	4344	\N	27074	\N
27603	GENERIC_DAY	11	2	f	2010-08-12	4344	\N	27074	\N
27584	GENERIC_DAY	11	2	f	2010-08-10	4350	\N	27074	\N
27635	GENERIC_DAY	11	0	f	2010-08-08	4350	\N	27074	\N
27653	GENERIC_DAY	11	2	f	2010-08-16	4348	\N	27074	\N
27586	GENERIC_DAY	11	0	f	2010-08-14	4350	\N	27074	\N
27589	GENERIC_DAY	11	0	f	2010-08-07	4358	\N	27074	\N
27645	GENERIC_DAY	11	2	f	2010-08-19	4348	\N	27074	\N
27575	GENERIC_DAY	11	2	f	2010-08-18	4358	\N	27074	\N
27611	GENERIC_DAY	11	2	f	2010-08-10	4348	\N	27074	\N
27649	GENERIC_DAY	11	2	f	2010-08-04	4350	\N	27074	\N
27608	GENERIC_DAY	11	2	f	2010-08-11	4350	\N	27074	\N
27590	GENERIC_DAY	11	2	f	2010-08-13	4358	\N	27074	\N
27630	GENERIC_DAY	11	2	f	2010-08-09	4344	\N	27074	\N
27593	GENERIC_DAY	11	2	f	2010-08-26	4350	\N	27074	\N
27668	GENERIC_DAY	11	2	f	2010-08-05	4358	\N	27074	\N
27621	GENERIC_DAY	11	0	f	2010-08-07	4350	\N	27074	\N
27643	GENERIC_DAY	11	2	f	2010-08-18	4350	\N	27074	\N
27657	GENERIC_DAY	11	0	f	2010-08-08	4348	\N	27074	\N
27626	GENERIC_DAY	11	2	f	2010-08-13	4348	\N	27074	\N
27606	GENERIC_DAY	11	2	f	2010-08-24	4350	\N	27074	\N
27638	GENERIC_DAY	11	2	f	2010-08-10	4344	\N	27074	\N
27625	GENERIC_DAY	11	2	f	2010-08-06	4350	\N	27074	\N
27616	GENERIC_DAY	11	1	f	2010-08-27	4350	\N	27074	\N
73566	GENERIC_DAY	2	0	f	2010-06-22	4354	\N	59633	\N
73535	GENERIC_DAY	2	0	f	2010-06-18	21817	\N	59633	\N
73438	GENERIC_DAY	2	0	f	2010-06-22	4350	\N	59633	\N
73572	GENERIC_DAY	2	0	f	2010-06-29	4344	\N	59633	\N
73524	GENERIC_DAY	2	0	f	2010-07-02	4344	\N	59633	\N
73494	GENERIC_DAY	2	0	f	2010-06-26	4358	\N	59633	\N
73427	GENERIC_DAY	2	0	f	2010-06-23	21817	\N	59633	\N
73522	GENERIC_DAY	2	0	f	2010-06-29	4354	\N	59633	\N
73573	GENERIC_DAY	2	0	f	2010-06-20	4356	\N	59633	\N
73399	GENERIC_DAY	2	0	f	2010-06-20	1216	\N	59633	\N
73574	GENERIC_DAY	2	0	f	2010-06-16	1220	\N	59633	\N
73545	GENERIC_DAY	2	0	f	2010-06-18	4344	\N	59633	\N
73576	GENERIC_DAY	2	0	f	2010-06-25	4354	\N	59633	\N
73498	GENERIC_DAY	2	0	f	2010-06-22	1216	\N	59633	\N
73452	GENERIC_DAY	2	0	f	2010-06-19	1214	\N	59633	\N
73542	GENERIC_DAY	2	0	f	2010-07-01	4344	\N	59633	\N
73527	GENERIC_DAY	2	0	f	2010-06-20	4352	\N	59633	\N
73563	GENERIC_DAY	2	0	f	2010-07-01	21817	\N	59633	\N
73570	GENERIC_DAY	2	0	f	2010-06-28	4352	\N	59633	\N
73440	GENERIC_DAY	2	0	f	2010-06-18	4350	\N	59633	\N
73398	GENERIC_DAY	2	0	f	2010-06-19	4352	\N	59633	\N
73567	GENERIC_DAY	2	0	f	2010-06-30	21817	\N	59633	\N
73534	GENERIC_DAY	2	0	f	2010-07-02	1220	\N	59633	\N
73470	GENERIC_DAY	2	0	f	2010-07-01	4348	\N	59633	\N
73568	GENERIC_DAY	2	4	f	2010-06-29	4356	\N	59633	\N
73408	GENERIC_DAY	2	0	f	2010-06-22	4352	\N	59633	\N
73558	GENERIC_DAY	2	0	f	2010-07-02	21817	\N	59633	\N
73480	GENERIC_DAY	2	0	f	2010-06-19	21817	\N	59633	\N
73407	GENERIC_DAY	2	0	f	2010-06-22	1220	\N	59633	\N
73571	GENERIC_DAY	2	4	f	2010-06-28	1214	\N	59633	\N
73575	GENERIC_DAY	2	0	f	2010-06-30	4354	\N	59633	\N
73533	GENERIC_DAY	2	0	f	2010-06-25	4358	\N	59633	\N
73580	GENERIC_DAY	2	0	f	2010-06-26	4356	\N	59633	\N
73479	GENERIC_DAY	2	3	f	2010-06-18	1214	\N	59633	\N
73510	GENERIC_DAY	2	0	f	2010-06-28	4344	\N	59633	\N
73472	GENERIC_DAY	2	0	f	2010-07-01	4358	\N	59633	\N
73448	GENERIC_DAY	2	0	f	2010-07-02	4358	\N	59633	\N
73454	GENERIC_DAY	2	0	f	2010-06-20	1214	\N	59633	\N
73411	GENERIC_DAY	2	0	f	2010-06-20	4348	\N	59633	\N
73431	GENERIC_DAY	2	4	f	2010-06-18	4356	\N	59633	\N
73426	GENERIC_DAY	2	0	f	2010-06-16	1216	\N	59633	\N
73560	GENERIC_DAY	2	0	f	2010-07-02	1216	\N	59633	\N
73445	GENERIC_DAY	2	1	f	2010-06-17	4358	\N	59633	\N
73507	GENERIC_DAY	2	0	f	2010-06-23	4354	\N	59633	\N
73531	GENERIC_DAY	2	0	f	2010-06-23	4348	\N	59633	\N
73561	GENERIC_DAY	2	2	f	2010-07-02	4356	\N	59633	\N
73432	GENERIC_DAY	2	0	f	2010-06-15	1216	\N	59633	\N
73543	GENERIC_DAY	2	0	f	2010-06-30	1220	\N	59633	\N
73541	GENERIC_DAY	2	4	f	2010-06-25	1214	\N	59633	\N
73532	GENERIC_DAY	2	0	f	2010-06-17	21817	\N	59633	\N
73578	GENERIC_DAY	2	0	f	2010-06-28	4354	\N	59633	\N
73419	GENERIC_DAY	2	0	f	2010-06-19	4348	\N	59633	\N
73553	GENERIC_DAY	2	0	f	2010-07-02	4350	\N	59633	\N
73528	GENERIC_DAY	2	0	f	2010-06-24	4354	\N	59633	\N
73443	GENERIC_DAY	2	0	f	2010-06-23	1220	\N	59633	\N
73554	GENERIC_DAY	2	0	f	2010-06-22	4344	\N	59633	\N
73540	GENERIC_DAY	2	0	f	2010-06-26	4344	\N	59633	\N
73436	GENERIC_DAY	2	0	f	2010-06-26	1216	\N	59633	\N
73460	GENERIC_DAY	2	0	f	2010-06-15	1220	\N	59633	\N
73547	GENERIC_DAY	2	0	f	2010-06-30	4350	\N	59633	\N
73468	GENERIC_DAY	2	4	f	2010-06-17	4356	\N	59633	\N
73491	GENERIC_DAY	2	0	f	2010-06-23	4344	\N	59633	\N
73525	GENERIC_DAY	2	0	f	2010-06-28	21817	\N	59633	\N
73417	GENERIC_DAY	2	0	f	2010-06-20	4344	\N	59633	\N
73405	GENERIC_DAY	2	0	f	2010-06-20	4358	\N	59633	\N
73409	GENERIC_DAY	2	0	f	2010-06-18	4354	\N	59633	\N
73423	GENERIC_DAY	2	0	f	2010-06-18	4352	\N	59633	\N
73463	GENERIC_DAY	2	0	f	2010-06-22	21817	\N	59633	\N
73552	GENERIC_DAY	2	3	f	2010-06-16	1214	\N	59633	\N
73467	GENERIC_DAY	2	0	f	2010-06-26	1220	\N	59633	\N
73503	GENERIC_DAY	2	0	f	2010-06-19	4344	\N	59633	\N
73482	GENERIC_DAY	2	0	f	2010-07-02	4352	\N	59633	\N
73546	GENERIC_DAY	2	0	f	2010-06-30	4352	\N	59633	\N
73582	GENERIC_DAY	2	0	f	2010-06-17	4350	\N	59633	\N
73550	GENERIC_DAY	2	0	f	2010-06-23	4358	\N	59633	\N
73464	GENERIC_DAY	2	0	f	2010-06-29	4348	\N	59633	\N
73564	GENERIC_DAY	2	3	f	2010-06-22	1214	\N	59633	\N
73569	GENERIC_DAY	2	0	f	2010-06-17	4344	\N	59633	\N
73518	GENERIC_DAY	2	0	f	2010-06-16	4350	\N	59633	\N
73469	GENERIC_DAY	2	0	f	2010-06-27	4352	\N	59633	\N
73537	GENERIC_DAY	2	0	f	2010-06-26	21817	\N	59633	\N
73466	GENERIC_DAY	2	0	f	2010-06-24	1216	\N	59633	\N
73490	GENERIC_DAY	2	4	f	2010-06-29	1214	\N	59633	\N
73453	GENERIC_DAY	2	0	f	2010-06-28	4348	\N	59633	\N
73523	GENERIC_DAY	2	0	f	2010-06-15	4344	\N	59633	\N
73458	GENERIC_DAY	2	0	f	2010-06-25	1216	\N	59633	\N
73562	GENERIC_DAY	2	0	f	2010-06-24	4352	\N	59633	\N
73456	GENERIC_DAY	2	0	f	2010-06-28	4350	\N	59633	\N
73459	GENERIC_DAY	2	1	f	2010-06-15	4358	\N	59633	\N
73444	GENERIC_DAY	2	0	f	2010-07-01	1220	\N	59633	\N
73457	GENERIC_DAY	2	0	f	2010-06-30	4344	\N	59633	\N
73400	GENERIC_DAY	2	0	f	2010-06-17	1220	\N	59633	\N
73538	GENERIC_DAY	2	0	f	2010-06-27	1216	\N	59633	\N
73544	GENERIC_DAY	2	0	f	2010-06-23	1216	\N	59633	\N
73473	GENERIC_DAY	2	4	f	2010-06-28	4356	\N	59633	\N
73513	GENERIC_DAY	2	0	f	2010-06-25	21817	\N	59633	\N
73488	GENERIC_DAY	2	4	f	2010-06-15	4356	\N	59633	\N
73446	GENERIC_DAY	2	0	f	2010-06-19	1216	\N	59633	\N
73455	GENERIC_DAY	2	0	f	2010-06-26	4348	\N	59633	\N
73521	GENERIC_DAY	2	0	f	2010-06-24	4344	\N	59633	\N
73410	GENERIC_DAY	2	0	f	2010-06-25	4348	\N	59633	\N
73495	GENERIC_DAY	2	0	f	2010-06-27	4354	\N	59633	\N
73430	GENERIC_DAY	2	4	f	2010-07-01	4356	\N	59633	\N
73519	GENERIC_DAY	2	0	f	2010-06-28	1220	\N	59633	\N
73501	GENERIC_DAY	2	0	f	2010-06-30	1216	\N	59633	\N
73439	GENERIC_DAY	2	0	f	2010-06-30	4358	\N	59633	\N
73415	GENERIC_DAY	2	0	f	2010-06-20	4354	\N	59633	\N
73502	GENERIC_DAY	2	0	f	2010-06-27	21817	\N	59633	\N
73447	GENERIC_DAY	2	3	f	2010-06-15	1214	\N	59633	\N
73404	GENERIC_DAY	2	0	f	2010-06-24	4348	\N	59633	\N
73565	GENERIC_DAY	2	0	f	2010-06-16	4348	\N	59633	\N
73434	GENERIC_DAY	2	0	f	2010-06-23	4352	\N	59633	\N
73450	GENERIC_DAY	2	0	f	2010-06-27	4358	\N	59633	\N
73504	GENERIC_DAY	2	4	f	2010-07-01	1214	\N	59633	\N
73509	GENERIC_DAY	2	0	f	2010-06-30	4348	\N	59633	\N
73401	GENERIC_DAY	2	0	f	2010-06-28	4358	\N	59633	\N
73526	GENERIC_DAY	2	0	f	2010-06-24	1220	\N	59633	\N
73462	GENERIC_DAY	2	0	f	2010-07-01	4350	\N	59633	\N
73397	GENERIC_DAY	2	0	f	2010-06-24	4358	\N	59633	\N
73506	GENERIC_DAY	2	0	f	2010-06-24	21817	\N	59633	\N
73559	GENERIC_DAY	2	0	f	2010-07-01	4352	\N	59633	\N
73530	GENERIC_DAY	2	0	f	2010-06-16	4352	\N	59633	\N
73437	GENERIC_DAY	2	0	f	2010-06-16	4354	\N	59633	\N
73516	GENERIC_DAY	2	0	f	2010-06-27	4350	\N	59633	\N
73481	GENERIC_DAY	2	2	f	2010-07-02	1214	\N	59633	\N
73511	GENERIC_DAY	2	1	f	2010-06-16	4358	\N	59633	\N
73421	GENERIC_DAY	2	0	f	2010-06-20	4350	\N	59633	\N
73515	GENERIC_DAY	2	4	f	2010-06-24	1214	\N	59633	\N
73551	GENERIC_DAY	2	0	f	2010-06-26	4352	\N	59633	\N
73416	GENERIC_DAY	2	4	f	2010-06-30	1214	\N	59633	\N
73441	GENERIC_DAY	2	0	f	2010-06-17	1216	\N	59633	\N
73487	GENERIC_DAY	2	0	f	2010-06-15	4350	\N	59633	\N
73499	GENERIC_DAY	2	0	f	2010-06-17	4352	\N	59633	\N
73412	GENERIC_DAY	2	0	f	2010-06-26	1214	\N	59633	\N
73478	GENERIC_DAY	2	0	f	2010-06-29	4350	\N	59633	\N
73529	GENERIC_DAY	2	0	f	2010-06-26	4354	\N	59633	\N
73517	GENERIC_DAY	2	0	f	2010-06-25	4344	\N	59633	\N
73418	GENERIC_DAY	2	0	f	2010-06-27	4356	\N	59633	\N
73471	GENERIC_DAY	2	4	f	2010-06-25	4356	\N	59633	\N
73477	GENERIC_DAY	2	3	f	2010-06-17	1214	\N	59633	\N
73508	GENERIC_DAY	2	0	f	2010-06-29	1220	\N	59633	\N
73579	GENERIC_DAY	2	0	f	2010-06-27	4344	\N	59633	\N
73475	GENERIC_DAY	2	0	f	2010-06-22	4358	\N	59633	\N
73505	GENERIC_DAY	2	0	f	2010-06-19	4356	\N	59633	\N
73484	GENERIC_DAY	2	4	f	2010-06-24	4356	\N	59633	\N
73556	GENERIC_DAY	2	0	f	2010-06-18	1216	\N	59633	\N
73461	GENERIC_DAY	2	0	f	2010-07-02	4354	\N	59633	\N
73496	GENERIC_DAY	2	0	f	2010-06-15	4348	\N	59633	\N
73520	GENERIC_DAY	2	0	f	2010-07-01	1216	\N	59633	\N
73557	GENERIC_DAY	2	0	f	2010-06-15	4354	\N	59633	\N
73403	GENERIC_DAY	2	0	f	2010-06-16	4344	\N	59633	\N
73489	GENERIC_DAY	2	0	f	2010-06-24	4350	\N	59633	\N
73420	GENERIC_DAY	2	4	f	2010-06-23	4356	\N	59633	\N
73449	GENERIC_DAY	2	4	f	2010-06-23	1214	\N	59633	\N
73402	GENERIC_DAY	2	0	f	2010-06-27	1214	\N	59633	\N
73497	GENERIC_DAY	2	0	f	2010-06-26	4350	\N	59633	\N
73539	GENERIC_DAY	2	0	f	2010-07-02	4348	\N	59633	\N
73577	GENERIC_DAY	2	4	f	2010-06-30	4356	\N	59633	\N
73465	GENERIC_DAY	2	0	f	2010-06-22	4348	\N	59633	\N
73493	GENERIC_DAY	2	0	f	2010-07-01	4354	\N	59633	\N
73548	GENERIC_DAY	2	0	f	2010-06-19	4358	\N	59633	\N
73486	GENERIC_DAY	2	1	f	2010-06-18	4358	\N	59633	\N
73483	GENERIC_DAY	2	0	f	2010-06-15	21817	\N	59633	\N
73429	GENERIC_DAY	2	0	f	2010-06-29	21817	\N	59633	\N
73581	GENERIC_DAY	2	0	f	2010-06-20	1220	\N	59633	\N
73442	GENERIC_DAY	2	0	f	2010-06-27	4348	\N	59633	\N
73512	GENERIC_DAY	2	0	f	2010-06-17	4348	\N	59633	\N
73485	GENERIC_DAY	2	0	f	2010-06-18	1220	\N	59633	\N
73433	GENERIC_DAY	2	0	f	2010-06-18	4348	\N	59633	\N
73413	GENERIC_DAY	2	0	f	2010-06-29	4352	\N	59633	\N
73424	GENERIC_DAY	2	0	f	2010-06-17	4354	\N	59633	\N
37904	SPECIFIC_DAY	4	8	f	2010-08-10	1220	31213	\N	\N
37908	SPECIFIC_DAY	4	0	f	2010-08-07	1220	31213	\N	\N
37895	SPECIFIC_DAY	4	8	f	2010-08-16	1220	31213	\N	\N
37897	SPECIFIC_DAY	4	8	f	2010-08-06	1220	31213	\N	\N
37898	SPECIFIC_DAY	4	8	f	2010-08-20	1220	31213	\N	\N
37900	SPECIFIC_DAY	4	8	f	2010-08-09	1220	31213	\N	\N
37910	SPECIFIC_DAY	4	8	f	2010-08-05	1220	31213	\N	\N
37907	SPECIFIC_DAY	4	8	f	2010-08-12	1220	31213	\N	\N
37902	SPECIFIC_DAY	4	8	f	2010-08-18	1220	31213	\N	\N
37906	SPECIFIC_DAY	4	0	f	2010-08-15	1220	31213	\N	\N
37899	SPECIFIC_DAY	4	4	f	2010-08-04	1220	31213	\N	\N
37909	SPECIFIC_DAY	4	8	f	2010-08-11	1220	31213	\N	\N
37903	SPECIFIC_DAY	4	0	f	2010-08-08	1220	31213	\N	\N
37896	SPECIFIC_DAY	4	0	f	2010-08-14	1220	31213	\N	\N
37901	SPECIFIC_DAY	4	8	f	2010-08-13	1220	31213	\N	\N
37905	SPECIFIC_DAY	4	8	f	2010-08-19	1220	31213	\N	\N
37911	SPECIFIC_DAY	4	8	f	2010-08-17	1220	31213	\N	\N
27479	GENERIC_DAY	11	4	f	2010-08-12	4354	\N	27071	\N
27458	GENERIC_DAY	11	4	f	2010-08-10	4354	\N	27071	\N
27445	GENERIC_DAY	11	4	f	2010-08-03	4354	\N	27071	\N
27463	GENERIC_DAY	11	0	f	2010-08-01	4354	\N	27071	\N
27431	GENERIC_DAY	11	4	f	2010-07-26	4354	\N	27071	\N
27496	GENERIC_DAY	11	4	f	2010-08-17	4354	\N	27071	\N
27491	GENERIC_DAY	11	4	f	2010-08-05	4354	\N	27071	\N
27462	GENERIC_DAY	11	0	f	2010-07-31	4354	\N	27071	\N
27483	GENERIC_DAY	11	4	f	2010-07-29	4354	\N	27071	\N
27477	GENERIC_DAY	11	0	f	2010-07-24	4354	\N	27071	\N
27457	GENERIC_DAY	11	4	f	2010-08-16	4352	\N	27071	\N
27455	GENERIC_DAY	11	0	f	2010-07-25	4352	\N	27071	\N
27471	GENERIC_DAY	11	4	f	2010-07-28	4354	\N	27071	\N
27468	GENERIC_DAY	11	4	f	2010-08-13	4352	\N	27071	\N
27492	GENERIC_DAY	11	0	f	2010-08-14	4354	\N	27071	\N
27467	GENERIC_DAY	11	4	f	2010-08-18	4352	\N	27071	\N
27428	GENERIC_DAY	11	0	f	2010-07-31	4352	\N	27071	\N
27478	GENERIC_DAY	11	0	f	2010-08-08	4352	\N	27071	\N
27453	GENERIC_DAY	11	4	f	2010-08-09	4354	\N	27071	\N
27454	GENERIC_DAY	11	4	f	2010-08-06	4352	\N	27071	\N
27465	GENERIC_DAY	11	0	f	2010-07-25	4354	\N	27071	\N
27461	GENERIC_DAY	11	4	f	2010-08-13	4354	\N	27071	\N
27497	GENERIC_DAY	11	4	f	2010-08-11	4352	\N	27071	\N
27460	GENERIC_DAY	11	4	f	2010-07-27	4354	\N	27071	\N
27439	GENERIC_DAY	11	4	f	2010-08-16	4354	\N	27071	\N
27447	GENERIC_DAY	11	0	f	2010-07-17	4352	\N	27071	\N
27481	GENERIC_DAY	11	4	f	2010-08-05	4352	\N	27071	\N
27475	GENERIC_DAY	11	4	f	2010-08-09	4352	\N	27071	\N
27494	GENERIC_DAY	11	4	f	2010-07-29	4352	\N	27071	\N
27450	GENERIC_DAY	11	4	f	2010-08-02	4354	\N	27071	\N
27472	GENERIC_DAY	11	4	f	2010-07-19	4352	\N	27071	\N
27437	GENERIC_DAY	11	4	f	2010-07-19	4354	\N	27071	\N
27474	GENERIC_DAY	11	4	f	2010-07-16	4354	\N	27071	\N
27470	GENERIC_DAY	11	0	f	2010-07-18	4354	\N	27071	\N
27446	GENERIC_DAY	11	4	f	2010-07-20	4354	\N	27071	\N
27484	GENERIC_DAY	11	4	f	2010-07-23	4352	\N	27071	\N
27464	GENERIC_DAY	11	4	f	2010-08-17	4352	\N	27071	\N
27449	GENERIC_DAY	11	0	f	2010-08-15	4354	\N	27071	\N
27480	GENERIC_DAY	11	4	f	2010-08-03	4352	\N	27071	\N
27473	GENERIC_DAY	11	0	f	2010-08-07	4352	\N	27071	\N
27435	GENERIC_DAY	11	4	f	2010-07-16	4352	\N	27071	\N
27432	GENERIC_DAY	11	4	f	2010-07-22	4352	\N	27071	\N
27486	GENERIC_DAY	11	4	f	2010-07-23	4354	\N	27071	\N
27438	GENERIC_DAY	11	4	f	2010-07-20	4352	\N	27071	\N
27440	GENERIC_DAY	11	0	f	2010-08-15	4352	\N	27071	\N
27469	GENERIC_DAY	11	4	f	2010-07-15	4354	\N	27071	\N
27429	GENERIC_DAY	11	0	f	2010-08-07	4354	\N	27071	\N
27436	GENERIC_DAY	11	4	f	2010-07-27	4352	\N	27071	\N
27452	GENERIC_DAY	11	4	f	2010-07-30	4352	\N	27071	\N
27493	GENERIC_DAY	11	0	f	2010-07-24	4352	\N	27071	\N
27430	GENERIC_DAY	11	0	f	2010-08-08	4354	\N	27071	\N
27487	GENERIC_DAY	11	4	f	2010-08-12	4352	\N	27071	\N
27466	GENERIC_DAY	11	4	f	2010-07-15	4352	\N	27071	\N
27433	GENERIC_DAY	11	4	f	2010-07-26	4352	\N	27071	\N
27476	GENERIC_DAY	11	0	f	2010-08-01	4352	\N	27071	\N
27489	GENERIC_DAY	11	4	f	2010-08-04	4352	\N	27071	\N
27488	GENERIC_DAY	11	4	f	2010-07-21	4352	\N	27071	\N
27485	GENERIC_DAY	11	4	f	2010-08-18	4354	\N	27071	\N
27434	GENERIC_DAY	11	4	f	2010-07-30	4354	\N	27071	\N
27459	GENERIC_DAY	11	4	f	2010-08-04	4354	\N	27071	\N
27456	GENERIC_DAY	11	0	f	2010-08-14	4352	\N	27071	\N
27444	GENERIC_DAY	11	4	f	2010-07-28	4352	\N	27071	\N
27441	GENERIC_DAY	11	4	f	2010-08-10	4352	\N	27071	\N
27482	GENERIC_DAY	11	0	f	2010-07-18	4352	\N	27071	\N
27495	GENERIC_DAY	11	4	f	2010-08-06	4354	\N	27071	\N
27448	GENERIC_DAY	11	4	f	2010-08-11	4354	\N	27071	\N
27442	GENERIC_DAY	11	4	f	2010-08-02	4352	\N	27071	\N
27490	GENERIC_DAY	11	0	f	2010-07-17	4354	\N	27071	\N
27451	GENERIC_DAY	11	4	f	2010-07-21	4354	\N	27071	\N
27443	GENERIC_DAY	11	4	f	2010-07-22	4354	\N	27071	\N
31121	GENERIC_DAY	6	0	f	2010-07-03	4348	\N	27090	\N
31129	GENERIC_DAY	6	0	f	2010-07-03	4350	\N	27090	\N
31136	GENERIC_DAY	6	0	f	2010-07-11	4350	\N	27090	\N
31142	GENERIC_DAY	6	0	f	2010-07-07	4344	\N	27090	\N
31123	GENERIC_DAY	6	6	f	2010-07-07	21817	\N	27090	\N
31139	GENERIC_DAY	6	1	f	2010-07-06	4348	\N	27090	\N
31164	GENERIC_DAY	6	0	f	2010-07-03	4358	\N	27090	\N
31161	GENERIC_DAY	6	0	f	2010-06-27	4344	\N	27090	\N
31178	GENERIC_DAY	6	0	f	2010-06-28	4350	\N	27090	\N
31143	GENERIC_DAY	6	0	f	2010-07-05	4350	\N	27090	\N
31140	GENERIC_DAY	6	0	f	2010-06-27	21817	\N	27090	\N
31141	GENERIC_DAY	6	0	f	2010-07-08	4344	\N	27090	\N
31130	GENERIC_DAY	6	1	f	2010-07-08	4358	\N	27090	\N
31109	GENERIC_DAY	6	1	f	2010-07-14	4350	\N	27090	\N
31175	GENERIC_DAY	6	0	f	2010-07-02	4350	\N	27090	\N
31114	GENERIC_DAY	6	1	f	2010-07-08	4348	\N	27090	\N
31173	GENERIC_DAY	6	2	f	2010-07-09	4358	\N	27090	\N
31155	GENERIC_DAY	6	3	f	2010-06-28	4358	\N	27090	\N
31119	GENERIC_DAY	6	0	f	2010-06-27	4348	\N	27090	\N
31115	GENERIC_DAY	6	0	f	2010-06-30	4350	\N	27090	\N
31128	GENERIC_DAY	6	2	f	2010-07-13	4358	\N	27090	\N
31100	GENERIC_DAY	6	4	f	2010-07-13	21817	\N	27090	\N
31165	GENERIC_DAY	6	0	f	2010-07-12	4344	\N	27090	\N
31144	GENERIC_DAY	6	3	f	2010-06-30	4348	\N	27090	\N
31133	GENERIC_DAY	6	2	f	2010-06-28	21817	\N	27090	\N
31099	GENERIC_DAY	6	0	f	2010-07-11	4348	\N	27090	\N
31124	GENERIC_DAY	6	4	f	2010-07-01	21817	\N	27090	\N
31185	GENERIC_DAY	6	0	f	2010-07-10	21817	\N	27090	\N
31113	GENERIC_DAY	6	0	f	2010-06-27	4358	\N	27090	\N
31108	GENERIC_DAY	6	2	f	2010-07-12	4358	\N	27090	\N
31118	GENERIC_DAY	6	0	f	2010-07-02	4344	\N	27090	\N
31153	GENERIC_DAY	6	0	f	2010-07-11	4358	\N	27090	\N
31137	GENERIC_DAY	6	2	f	2010-07-01	4358	\N	27090	\N
31167	GENERIC_DAY	6	1	f	2010-07-02	4348	\N	27090	\N
31122	GENERIC_DAY	6	0	f	2010-07-01	4350	\N	27090	\N
31181	GENERIC_DAY	6	6	f	2010-07-05	21817	\N	27090	\N
31169	GENERIC_DAY	6	1	f	2010-07-13	4348	\N	27090	\N
31132	GENERIC_DAY	6	4	f	2010-07-12	21817	\N	27090	\N
31101	GENERIC_DAY	6	0	f	2010-07-09	4344	\N	27090	\N
31177	GENERIC_DAY	6	0	f	2010-07-04	4358	\N	27090	\N
31160	GENERIC_DAY	6	0	f	2010-07-04	4350	\N	27090	\N
31149	GENERIC_DAY	6	1	f	2010-07-09	4348	\N	27090	\N
31171	GENERIC_DAY	6	0	f	2010-07-01	4344	\N	27090	\N
31107	GENERIC_DAY	6	0	f	2010-07-04	4348	\N	27090	\N
31134	GENERIC_DAY	6	2	f	2010-07-14	4358	\N	27090	\N
31163	GENERIC_DAY	6	0	f	2010-07-06	4344	\N	27090	\N
31103	GENERIC_DAY	6	0	f	2010-06-30	4344	\N	27090	\N
31172	GENERIC_DAY	6	3	f	2010-06-29	4358	\N	27090	\N
31186	GENERIC_DAY	6	1	f	2010-07-06	4358	\N	27090	\N
31174	GENERIC_DAY	6	0	f	2010-07-10	4350	\N	27090	\N
31147	GENERIC_DAY	6	1	f	2010-07-13	4350	\N	27090	\N
31150	GENERIC_DAY	6	1	f	2010-07-07	4358	\N	27090	\N
31180	GENERIC_DAY	6	0	f	2010-07-04	21817	\N	27090	\N
31158	GENERIC_DAY	6	3	f	2010-06-29	4348	\N	27090	\N
31126	GENERIC_DAY	6	0	f	2010-07-10	4348	\N	27090	\N
31111	GENERIC_DAY	6	0	f	2010-06-29	4350	\N	27090	\N
31157	GENERIC_DAY	6	1	f	2010-07-05	4348	\N	27090	\N
31179	GENERIC_DAY	6	0	f	2010-06-27	4350	\N	27090	\N
31162	GENERIC_DAY	6	0	f	2010-07-08	4350	\N	27090	\N
31102	GENERIC_DAY	6	0	f	2010-06-29	4344	\N	27090	\N
31105	GENERIC_DAY	6	3	f	2010-06-30	21817	\N	27090	\N
31183	GENERIC_DAY	6	1	f	2010-07-12	4348	\N	27090	\N
31106	GENERIC_DAY	6	0	f	2010-07-03	4344	\N	27090	\N
31145	GENERIC_DAY	6	0	f	2010-07-07	4350	\N	27090	\N
31152	GENERIC_DAY	6	0	f	2010-07-03	21817	\N	27090	\N
31131	GENERIC_DAY	6	2	f	2010-06-29	21817	\N	27090	\N
31110	GENERIC_DAY	6	3	f	2010-06-28	4348	\N	27090	\N
31135	GENERIC_DAY	6	0	f	2010-07-11	21817	\N	27090	\N
31120	GENERIC_DAY	6	0	f	2010-07-05	4344	\N	27090	\N
31138	GENERIC_DAY	6	0	f	2010-07-04	4344	\N	27090	\N
31182	GENERIC_DAY	6	2	f	2010-06-30	4358	\N	27090	\N
31166	GENERIC_DAY	6	1	f	2010-07-14	4348	\N	27090	\N
31127	GENERIC_DAY	6	1	f	2010-07-12	4350	\N	27090	\N
31117	GENERIC_DAY	6	6	f	2010-07-02	21817	\N	27090	\N
31151	GENERIC_DAY	6	4	f	2010-07-09	21817	\N	27090	\N
31176	GENERIC_DAY	6	0	f	2010-07-10	4344	\N	27090	\N
31125	GENERIC_DAY	6	6	f	2010-07-08	21817	\N	27090	\N
31116	GENERIC_DAY	6	0	f	2010-07-13	4344	\N	27090	\N
31170	GENERIC_DAY	6	0	f	2010-07-14	4344	\N	27090	\N
31146	GENERIC_DAY	6	1	f	2010-07-09	4350	\N	27090	\N
31104	GENERIC_DAY	6	1	f	2010-07-07	4348	\N	27090	\N
31184	GENERIC_DAY	6	0	f	2010-07-06	4350	\N	27090	\N
31154	GENERIC_DAY	6	6	f	2010-07-06	21817	\N	27090	\N
31148	GENERIC_DAY	6	0	f	2010-07-11	4344	\N	27090	\N
31156	GENERIC_DAY	6	1	f	2010-07-05	4358	\N	27090	\N
31098	GENERIC_DAY	6	1	f	2010-07-02	4358	\N	27090	\N
31168	GENERIC_DAY	6	0	f	2010-07-10	4358	\N	27090	\N
31112	GENERIC_DAY	6	2	f	2010-07-01	4348	\N	27090	\N
31159	GENERIC_DAY	6	0	f	2010-06-28	4344	\N	27090	\N
251589	GENERIC_DAY	0	4	f	2010-10-18	4354	\N	27075	\N
251590	GENERIC_DAY	0	4	f	2010-10-18	4352	\N	27075	\N
251793	GENERIC_DAY	0	4	f	2010-10-07	4352	\N	27075	\N
251794	GENERIC_DAY	0	4	f	2010-10-12	4352	\N	27075	\N
251795	GENERIC_DAY	0	0	f	2010-10-16	4352	\N	27075	\N
251796	GENERIC_DAY	0	0	f	2010-10-02	4352	\N	27075	\N
251797	GENERIC_DAY	0	4	f	2010-10-26	4352	\N	27075	\N
251798	GENERIC_DAY	0	0	f	2010-10-23	4354	\N	27075	\N
251799	GENERIC_DAY	0	4	f	2010-10-12	4354	\N	27075	\N
251800	GENERIC_DAY	0	4	f	2010-10-14	4352	\N	27075	\N
251801	GENERIC_DAY	0	4	f	2010-11-02	4354	\N	27075	\N
251802	GENERIC_DAY	0	4	f	2010-10-06	4352	\N	27075	\N
251803	GENERIC_DAY	0	0	f	2010-10-24	4352	\N	27075	\N
251804	GENERIC_DAY	0	4	f	2010-11-01	4352	\N	27075	\N
251805	GENERIC_DAY	0	4	f	2010-10-20	4352	\N	27075	\N
251806	GENERIC_DAY	0	4	f	2010-10-13	4352	\N	27075	\N
251807	GENERIC_DAY	0	4	f	2010-10-25	4354	\N	27075	\N
251808	GENERIC_DAY	0	0	f	2010-10-17	4354	\N	27075	\N
251809	GENERIC_DAY	0	4	f	2010-10-21	4352	\N	27075	\N
251810	GENERIC_DAY	0	4	f	2010-10-05	4354	\N	27075	\N
251811	GENERIC_DAY	0	4	f	2010-10-22	4352	\N	27075	\N
251812	GENERIC_DAY	0	0	f	2010-10-16	4354	\N	27075	\N
251813	GENERIC_DAY	0	4	f	2010-10-28	4352	\N	27075	\N
251814	GENERIC_DAY	0	4	f	2010-10-29	4354	\N	27075	\N
251815	GENERIC_DAY	0	4	f	2010-10-29	4352	\N	27075	\N
251816	GENERIC_DAY	0	4	f	2010-10-11	4354	\N	27075	\N
251817	GENERIC_DAY	0	4	f	2010-10-21	4354	\N	27075	\N
251818	GENERIC_DAY	0	0	f	2010-10-30	4354	\N	27075	\N
251819	GENERIC_DAY	0	4	f	2010-10-22	4354	\N	27075	\N
251820	GENERIC_DAY	0	4	f	2010-10-06	4354	\N	27075	\N
251821	GENERIC_DAY	0	4	f	2010-10-05	4352	\N	27075	\N
251822	GENERIC_DAY	0	0	f	2010-10-23	4352	\N	27075	\N
251823	GENERIC_DAY	0	0	f	2010-10-02	4354	\N	27075	\N
251824	GENERIC_DAY	0	0	f	2010-10-24	4354	\N	27075	\N
251825	GENERIC_DAY	0	4	f	2010-10-25	4352	\N	27075	\N
251826	GENERIC_DAY	0	4	f	2010-10-20	4354	\N	27075	\N
251827	GENERIC_DAY	0	4	f	2010-10-28	4354	\N	27075	\N
251828	GENERIC_DAY	0	4	f	2010-10-04	4352	\N	27075	\N
251829	GENERIC_DAY	0	4	f	2010-10-27	4352	\N	27075	\N
251830	GENERIC_DAY	0	4	f	2010-10-08	4354	\N	27075	\N
251831	GENERIC_DAY	0	0	f	2010-10-10	4354	\N	27075	\N
251832	GENERIC_DAY	0	4	f	2010-11-04	4354	\N	27075	\N
251833	GENERIC_DAY	0	4	f	2010-10-19	4352	\N	27075	\N
251834	GENERIC_DAY	0	4	f	2010-10-08	4352	\N	27075	\N
251835	GENERIC_DAY	0	4	f	2010-10-27	4354	\N	27075	\N
251836	GENERIC_DAY	0	0	f	2010-11-14	4354	\N	27073	\N
251837	GENERIC_DAY	0	0	f	2010-11-07	4352	\N	27073	\N
251838	GENERIC_DAY	0	4	f	2010-11-16	4354	\N	27073	\N
251839	GENERIC_DAY	0	4	f	2010-11-09	4352	\N	27073	\N
251840	GENERIC_DAY	0	4	f	2010-11-08	4354	\N	27073	\N
251841	GENERIC_DAY	0	4	f	2010-11-10	4352	\N	27073	\N
251842	GENERIC_DAY	0	4	f	2010-11-12	4352	\N	27073	\N
251843	GENERIC_DAY	0	4	f	2010-11-15	4354	\N	27073	\N
251844	GENERIC_DAY	0	4	f	2010-11-17	4354	\N	27073	\N
251845	GENERIC_DAY	0	4	f	2010-11-05	4352	\N	27073	\N
251846	GENERIC_DAY	0	0	f	2010-11-06	4352	\N	27073	\N
251847	GENERIC_DAY	0	4	f	2010-11-18	4354	\N	27073	\N
251848	GENERIC_DAY	0	4	f	2010-11-22	4352	\N	27073	\N
251849	GENERIC_DAY	0	0	f	2010-11-06	4354	\N	27073	\N
251850	GENERIC_DAY	0	0	f	2010-11-21	4352	\N	27073	\N
251851	GENERIC_DAY	0	4	f	2010-11-11	4354	\N	27073	\N
251852	GENERIC_DAY	0	0	f	2010-11-13	4354	\N	27073	\N
251853	GENERIC_DAY	0	4	f	2010-11-18	4352	\N	27073	\N
251854	GENERIC_DAY	0	0	f	2010-11-21	4354	\N	27073	\N
251855	GENERIC_DAY	0	0	f	2010-11-20	4354	\N	27073	\N
251856	GENERIC_DAY	0	4	f	2010-11-16	4352	\N	27073	\N
251857	GENERIC_DAY	0	0	f	2010-11-13	4352	\N	27073	\N
251858	GENERIC_DAY	0	4	f	2010-11-05	4354	\N	27073	\N
251859	GENERIC_DAY	0	4	f	2010-11-19	4352	\N	27073	\N
251860	GENERIC_DAY	0	4	f	2010-11-17	4352	\N	27073	\N
251861	GENERIC_DAY	0	0	f	2010-11-07	4354	\N	27073	\N
251862	GENERIC_DAY	0	4	f	2010-11-09	4354	\N	27073	\N
251863	GENERIC_DAY	0	4	f	2010-11-11	4352	\N	27073	\N
251864	GENERIC_DAY	0	2	f	2010-11-23	4354	\N	27073	\N
251865	GENERIC_DAY	0	0	f	2010-11-14	4352	\N	27073	\N
251866	GENERIC_DAY	0	4	f	2010-11-22	4354	\N	27073	\N
251867	GENERIC_DAY	0	2	f	2010-11-23	4352	\N	27073	\N
251868	GENERIC_DAY	0	4	f	2010-11-12	4354	\N	27073	\N
251869	GENERIC_DAY	0	0	f	2010-11-20	4352	\N	27073	\N
251870	GENERIC_DAY	0	4	f	2010-11-08	4352	\N	27073	\N
251871	GENERIC_DAY	0	4	f	2010-11-10	4354	\N	27073	\N
251872	GENERIC_DAY	0	4	f	2010-11-15	4352	\N	27073	\N
251873	GENERIC_DAY	0	4	f	2010-11-19	4354	\N	27073	\N
269748	SPECIFIC_DAY	29	0	f	2010-12-22	1216	269771	\N	\N
269749	SPECIFIC_DAY	29	8	f	2010-12-24	1216	269771	\N	\N
269750	SPECIFIC_DAY	29	8	f	2011-01-06	1216	269771	\N	\N
269751	SPECIFIC_DAY	29	4	f	2011-01-10	1216	269771	\N	\N
269752	SPECIFIC_DAY	29	8	f	2011-01-04	1216	269771	\N	\N
269753	SPECIFIC_DAY	29	0	f	2010-12-25	1216	269771	\N	\N
269754	SPECIFIC_DAY	29	0	f	2011-01-02	1216	269771	\N	\N
269755	SPECIFIC_DAY	29	8	f	2010-12-31	1216	269771	\N	\N
269756	SPECIFIC_DAY	29	8	f	2011-01-07	1216	269771	\N	\N
269757	SPECIFIC_DAY	29	8	f	2010-12-30	1216	269771	\N	\N
269758	SPECIFIC_DAY	29	0	f	2011-01-01	1216	269771	\N	\N
269759	SPECIFIC_DAY	29	0	f	2011-01-09	1216	269771	\N	\N
269760	SPECIFIC_DAY	29	8	f	2010-12-28	1216	269771	\N	\N
269761	SPECIFIC_DAY	29	8	f	2010-12-23	1216	269771	\N	\N
269762	SPECIFIC_DAY	29	0	f	2011-01-08	1216	269771	\N	\N
269763	SPECIFIC_DAY	29	0	f	2010-12-26	1216	269771	\N	\N
269764	SPECIFIC_DAY	29	8	f	2010-12-29	1216	269771	\N	\N
269765	SPECIFIC_DAY	29	8	f	2011-01-03	1216	269771	\N	\N
269766	SPECIFIC_DAY	29	8	f	2010-12-27	1216	269771	\N	\N
269767	SPECIFIC_DAY	29	8	f	2011-01-05	1216	269771	\N	\N
269768	SPECIFIC_DAY	29	8	f	2011-01-11	1220	269772	\N	\N
269769	SPECIFIC_DAY	29	8	f	2011-01-18	1220	269772	\N	\N
269770	SPECIFIC_DAY	29	8	f	2011-01-26	1220	269772	\N	\N
269872	SPECIFIC_DAY	29	0	f	2011-01-22	1220	269772	\N	\N
269873	SPECIFIC_DAY	29	0	f	2011-01-16	1220	269772	\N	\N
269874	SPECIFIC_DAY	29	8	f	2011-01-25	1220	269772	\N	\N
269875	SPECIFIC_DAY	29	4	f	2011-01-10	1220	269772	\N	\N
269876	SPECIFIC_DAY	29	0	f	2011-01-15	1220	269772	\N	\N
269877	SPECIFIC_DAY	29	8	f	2011-01-14	1220	269772	\N	\N
269878	SPECIFIC_DAY	29	8	f	2011-01-19	1220	269772	\N	\N
269879	SPECIFIC_DAY	29	8	f	2011-01-17	1220	269772	\N	\N
269880	SPECIFIC_DAY	29	8	f	2011-01-21	1220	269772	\N	\N
269881	SPECIFIC_DAY	29	8	f	2011-01-20	1220	269772	\N	\N
269882	SPECIFIC_DAY	29	8	f	2011-01-24	1220	269772	\N	\N
269883	SPECIFIC_DAY	29	8	f	2011-01-13	1220	269772	\N	\N
269884	SPECIFIC_DAY	29	8	f	2011-01-12	1220	269772	\N	\N
269885	SPECIFIC_DAY	29	0	f	2011-01-23	1220	269772	\N	\N
269886	GENERIC_DAY	28	0	f	2010-10-02	4352	\N	27147	\N
269887	GENERIC_DAY	28	1	f	2010-10-14	4352	\N	27147	\N
269888	GENERIC_DAY	28	4	f	2010-09-30	4352	\N	27147	\N
269889	GENERIC_DAY	28	4	f	2010-09-16	4354	\N	27147	\N
269890	GENERIC_DAY	28	4	f	2010-09-13	4352	\N	27147	\N
269891	GENERIC_DAY	28	4	f	2010-10-08	4352	\N	27147	\N
269892	GENERIC_DAY	28	4	f	2010-10-12	4354	\N	27147	\N
269893	GENERIC_DAY	28	4	f	2010-09-27	4352	\N	27147	\N
269894	GENERIC_DAY	28	4	f	2010-09-20	4352	\N	27147	\N
269895	GENERIC_DAY	28	4	f	2010-09-24	4352	\N	27147	\N
269896	GENERIC_DAY	28	4	f	2010-10-08	4354	\N	27147	\N
269897	GENERIC_DAY	28	0	f	2010-09-19	4354	\N	27147	\N
269898	GENERIC_DAY	28	0	f	2010-09-11	4354	\N	27147	\N
269899	GENERIC_DAY	28	0	f	2010-09-26	4352	\N	27147	\N
269900	GENERIC_DAY	28	4	f	2010-10-06	4352	\N	27147	\N
269901	GENERIC_DAY	28	4	f	2010-10-11	4354	\N	27147	\N
269902	GENERIC_DAY	28	0	f	2010-10-10	4352	\N	27147	\N
269903	GENERIC_DAY	28	4	f	2010-10-05	4354	\N	27147	\N
269904	GENERIC_DAY	28	1	f	2010-10-14	4354	\N	27147	\N
269905	GENERIC_DAY	28	0	f	2010-10-03	4352	\N	27147	\N
269906	GENERIC_DAY	28	4	f	2010-09-09	4352	\N	27147	\N
269907	GENERIC_DAY	28	4	f	2010-10-01	4352	\N	27147	\N
269908	GENERIC_DAY	28	0	f	2010-09-11	4352	\N	27147	\N
269909	GENERIC_DAY	28	4	f	2010-10-05	4352	\N	27147	\N
269910	GENERIC_DAY	28	0	f	2010-09-25	4354	\N	27147	\N
269911	GENERIC_DAY	28	0	f	2010-09-12	4352	\N	27147	\N
269912	GENERIC_DAY	28	4	f	2010-10-06	4354	\N	27147	\N
269913	GENERIC_DAY	28	0	f	2010-09-25	4352	\N	27147	\N
269914	GENERIC_DAY	28	4	f	2010-09-14	4354	\N	27147	\N
269915	GENERIC_DAY	28	4	f	2010-09-08	4352	\N	27147	\N
269916	GENERIC_DAY	28	4	f	2010-09-15	4354	\N	27147	\N
269917	GENERIC_DAY	28	4	f	2010-09-22	4354	\N	27147	\N
269918	GENERIC_DAY	28	4	f	2010-09-21	4354	\N	27147	\N
269919	GENERIC_DAY	28	4	f	2010-09-10	4352	\N	27147	\N
269920	GENERIC_DAY	28	4	f	2010-09-22	4352	\N	27147	\N
269921	GENERIC_DAY	28	4	f	2010-10-04	4354	\N	27147	\N
269922	GENERIC_DAY	28	4	f	2010-10-07	4352	\N	27147	\N
269923	GENERIC_DAY	28	4	f	2010-09-27	4354	\N	27147	\N
269924	GENERIC_DAY	28	4	f	2010-09-23	4352	\N	27147	\N
269925	GENERIC_DAY	28	4	f	2010-09-09	4354	\N	27147	\N
269926	GENERIC_DAY	28	4	f	2010-10-07	4354	\N	27147	\N
269927	GENERIC_DAY	28	0	f	2010-10-10	4354	\N	27147	\N
269928	GENERIC_DAY	28	0	f	2010-09-12	4354	\N	27147	\N
269929	GENERIC_DAY	28	0	f	2010-10-09	4352	\N	27147	\N
269930	GENERIC_DAY	28	4	f	2010-09-29	4354	\N	27147	\N
269931	GENERIC_DAY	28	0	f	2010-10-09	4354	\N	27147	\N
269932	GENERIC_DAY	28	4	f	2010-09-14	4352	\N	27147	\N
269933	GENERIC_DAY	28	4	f	2010-10-12	4352	\N	27147	\N
269934	GENERIC_DAY	28	0	f	2010-09-18	4354	\N	27147	\N
269935	GENERIC_DAY	28	4	f	2010-09-10	4354	\N	27147	\N
269936	GENERIC_DAY	28	4	f	2010-10-01	4354	\N	27147	\N
269937	GENERIC_DAY	28	4	f	2010-09-24	4354	\N	27147	\N
269938	GENERIC_DAY	28	4	f	2010-09-23	4354	\N	27147	\N
269939	GENERIC_DAY	28	4	f	2010-09-13	4354	\N	27147	\N
269940	GENERIC_DAY	28	4	f	2010-10-11	4352	\N	27147	\N
269941	GENERIC_DAY	28	0	f	2010-10-03	4354	\N	27147	\N
269942	GENERIC_DAY	28	4	f	2010-09-29	4352	\N	27147	\N
269943	GENERIC_DAY	28	4	f	2010-09-17	4354	\N	27147	\N
269944	GENERIC_DAY	28	0	f	2010-09-26	4354	\N	27147	\N
269945	GENERIC_DAY	28	4	f	2010-09-08	4354	\N	27147	\N
269946	GENERIC_DAY	28	4	f	2010-10-13	4354	\N	27147	\N
269947	GENERIC_DAY	28	4	f	2010-09-21	4352	\N	27147	\N
269948	GENERIC_DAY	28	4	f	2010-09-30	4354	\N	27147	\N
269949	GENERIC_DAY	28	4	f	2010-09-15	4352	\N	27147	\N
269950	GENERIC_DAY	28	4	f	2010-09-28	4352	\N	27147	\N
269951	GENERIC_DAY	28	4	f	2010-09-20	4354	\N	27147	\N
269952	GENERIC_DAY	28	4	f	2010-09-28	4354	\N	27147	\N
269953	GENERIC_DAY	28	0	f	2010-09-18	4352	\N	27147	\N
269954	GENERIC_DAY	28	4	f	2010-10-04	4352	\N	27147	\N
269955	GENERIC_DAY	28	4	f	2010-10-13	4352	\N	27147	\N
269956	GENERIC_DAY	28	0	f	2010-09-19	4352	\N	27147	\N
269957	GENERIC_DAY	28	0	f	2010-10-02	4354	\N	27147	\N
269958	GENERIC_DAY	28	4	f	2010-09-17	4352	\N	27147	\N
269959	GENERIC_DAY	28	4	f	2010-09-16	4352	\N	27147	\N
269960	GENERIC_DAY	27	2	f	2010-09-13	4350	\N	27148	\N
269961	GENERIC_DAY	27	2	f	2010-09-15	4348	\N	27148	\N
269962	GENERIC_DAY	27	2	f	2010-10-04	4344	\N	27148	\N
269963	GENERIC_DAY	27	2	f	2010-09-30	4350	\N	27148	\N
269964	GENERIC_DAY	27	2	f	2010-09-08	4348	\N	27148	\N
269965	GENERIC_DAY	27	2	f	2010-09-23	4348	\N	27148	\N
269966	GENERIC_DAY	27	0	f	2010-09-19	4350	\N	27148	\N
269967	GENERIC_DAY	27	0	f	2010-09-18	4358	\N	27148	\N
269968	GENERIC_DAY	27	2	f	2010-09-27	4350	\N	27148	\N
269969	GENERIC_DAY	27	2	f	2010-09-16	4348	\N	27148	\N
269970	GENERIC_DAY	27	2	f	2010-09-22	4348	\N	27148	\N
269971	GENERIC_DAY	27	0	f	2010-09-12	4350	\N	27148	\N
269972	GENERIC_DAY	27	0	f	2010-09-11	4358	\N	27148	\N
269973	GENERIC_DAY	27	0	f	2010-09-26	4344	\N	27148	\N
269974	GENERIC_DAY	27	2	f	2010-09-14	4358	\N	27148	\N
269975	GENERIC_DAY	27	2	f	2010-09-10	4358	\N	27148	\N
269976	GENERIC_DAY	27	2	f	2010-09-30	4348	\N	27148	\N
269977	GENERIC_DAY	27	2	f	2010-09-21	4348	\N	27148	\N
269978	GENERIC_DAY	27	2	f	2010-09-14	4348	\N	27148	\N
269979	GENERIC_DAY	27	2	f	2010-09-09	4344	\N	27148	\N
269980	GENERIC_DAY	27	2	f	2010-09-14	4344	\N	27148	\N
269981	GENERIC_DAY	27	1	f	2010-10-04	4350	\N	27148	\N
269982	GENERIC_DAY	27	2	f	2010-09-16	4344	\N	27148	\N
269983	GENERIC_DAY	27	0	f	2010-09-26	4350	\N	27148	\N
269984	GENERIC_DAY	27	0	f	2010-10-02	4350	\N	27148	\N
269985	GENERIC_DAY	27	2	f	2010-09-17	4350	\N	27148	\N
269986	GENERIC_DAY	27	2	f	2010-09-13	4344	\N	27148	\N
269987	GENERIC_DAY	27	1	f	2010-10-04	4358	\N	27148	\N
269988	GENERIC_DAY	27	2	f	2010-09-20	4348	\N	27148	\N
269989	GENERIC_DAY	27	0	f	2010-10-02	4358	\N	27148	\N
269990	GENERIC_DAY	27	2	f	2010-09-29	4344	\N	27148	\N
269991	GENERIC_DAY	27	2	f	2010-09-08	4358	\N	27148	\N
269992	GENERIC_DAY	27	2	f	2010-09-16	4358	\N	27148	\N
269993	GENERIC_DAY	27	2	f	2010-09-29	4350	\N	27148	\N
269994	GENERIC_DAY	27	2	f	2010-09-09	4358	\N	27148	\N
269995	GENERIC_DAY	27	0	f	2010-09-25	4350	\N	27148	\N
269996	GENERIC_DAY	27	2	f	2010-09-30	4344	\N	27148	\N
269997	GENERIC_DAY	27	2	f	2010-09-09	4348	\N	27148	\N
269998	GENERIC_DAY	27	0	f	2010-09-12	4348	\N	27148	\N
269999	GENERIC_DAY	27	0	f	2010-09-18	4348	\N	27148	\N
270000	GENERIC_DAY	27	2	f	2010-09-08	4350	\N	27148	\N
270001	GENERIC_DAY	27	2	f	2010-09-30	4358	\N	27148	\N
270002	GENERIC_DAY	27	2	f	2010-09-29	4358	\N	27148	\N
270003	GENERIC_DAY	27	2	f	2010-09-28	4344	\N	27148	\N
270004	GENERIC_DAY	27	2	f	2010-09-21	4350	\N	27148	\N
270005	GENERIC_DAY	27	0	f	2010-09-11	4350	\N	27148	\N
270006	GENERIC_DAY	27	2	f	2010-09-16	4350	\N	27148	\N
270007	GENERIC_DAY	27	0	f	2010-09-11	4348	\N	27148	\N
270008	GENERIC_DAY	27	2	f	2010-10-04	4348	\N	27148	\N
270009	GENERIC_DAY	27	0	f	2010-10-02	4344	\N	27148	\N
270010	GENERIC_DAY	27	2	f	2010-10-01	4358	\N	27148	\N
270011	GENERIC_DAY	27	0	f	2010-09-25	4348	\N	27148	\N
270012	GENERIC_DAY	27	2	f	2010-09-27	4348	\N	27148	\N
270013	GENERIC_DAY	27	0	f	2010-10-03	4348	\N	27148	\N
270014	GENERIC_DAY	27	2	f	2010-09-20	4358	\N	27148	\N
270015	GENERIC_DAY	27	0	f	2010-10-02	4348	\N	27148	\N
270016	GENERIC_DAY	27	2	f	2010-09-17	4344	\N	27148	\N
270017	GENERIC_DAY	27	2	f	2010-09-22	4358	\N	27148	\N
270018	GENERIC_DAY	27	2	f	2010-09-08	4344	\N	27148	\N
270019	GENERIC_DAY	27	0	f	2010-09-25	4344	\N	27148	\N
270020	GENERIC_DAY	27	2	f	2010-10-01	4350	\N	27148	\N
270021	GENERIC_DAY	27	2	f	2010-09-10	4348	\N	27148	\N
270022	GENERIC_DAY	27	2	f	2010-09-10	4344	\N	27148	\N
270023	GENERIC_DAY	27	2	f	2010-09-23	4350	\N	27148	\N
270024	GENERIC_DAY	27	2	f	2010-09-20	4344	\N	27148	\N
270025	GENERIC_DAY	27	2	f	2010-09-15	4350	\N	27148	\N
270026	GENERIC_DAY	27	0	f	2010-09-18	4344	\N	27148	\N
270027	GENERIC_DAY	27	2	f	2010-09-28	4348	\N	27148	\N
270028	GENERIC_DAY	27	2	f	2010-09-14	4350	\N	27148	\N
270029	GENERIC_DAY	27	2	f	2010-09-15	4358	\N	27148	\N
270030	GENERIC_DAY	27	2	f	2010-09-23	4358	\N	27148	\N
270031	GENERIC_DAY	27	0	f	2010-10-03	4344	\N	27148	\N
270032	GENERIC_DAY	27	2	f	2010-09-09	4350	\N	27148	\N
270033	GENERIC_DAY	27	2	f	2010-09-23	4344	\N	27148	\N
270034	GENERIC_DAY	27	2	f	2010-09-17	4358	\N	27148	\N
270035	GENERIC_DAY	27	0	f	2010-09-19	4344	\N	27148	\N
270036	GENERIC_DAY	27	2	f	2010-09-27	4344	\N	27148	\N
270037	GENERIC_DAY	27	0	f	2010-09-19	4348	\N	27148	\N
270038	GENERIC_DAY	27	2	f	2010-09-24	4350	\N	27148	\N
270039	GENERIC_DAY	27	0	f	2010-09-25	4358	\N	27148	\N
270040	GENERIC_DAY	27	0	f	2010-10-03	4358	\N	27148	\N
270041	GENERIC_DAY	27	2	f	2010-09-29	4348	\N	27148	\N
270042	GENERIC_DAY	27	2	f	2010-09-21	4358	\N	27148	\N
270043	GENERIC_DAY	27	2	f	2010-09-28	4358	\N	27148	\N
270044	GENERIC_DAY	27	0	f	2010-09-26	4348	\N	27148	\N
270045	GENERIC_DAY	27	2	f	2010-09-20	4350	\N	27148	\N
270046	GENERIC_DAY	27	0	f	2010-09-12	4344	\N	27148	\N
270047	GENERIC_DAY	27	2	f	2010-09-24	4348	\N	27148	\N
270048	GENERIC_DAY	27	2	f	2010-09-22	4344	\N	27148	\N
270049	GENERIC_DAY	27	2	f	2010-09-17	4348	\N	27148	\N
270050	GENERIC_DAY	27	2	f	2010-09-28	4350	\N	27148	\N
270051	GENERIC_DAY	27	2	f	2010-09-13	4348	\N	27148	\N
270052	GENERIC_DAY	27	2	f	2010-09-15	4344	\N	27148	\N
270053	GENERIC_DAY	27	2	f	2010-09-24	4344	\N	27148	\N
270054	GENERIC_DAY	27	2	f	2010-10-01	4348	\N	27148	\N
270055	GENERIC_DAY	27	2	f	2010-09-27	4358	\N	27148	\N
270056	GENERIC_DAY	27	2	f	2010-09-13	4358	\N	27148	\N
270057	GENERIC_DAY	27	0	f	2010-09-11	4344	\N	27148	\N
270058	GENERIC_DAY	27	0	f	2010-09-19	4358	\N	27148	\N
270059	GENERIC_DAY	27	2	f	2010-09-21	4344	\N	27148	\N
270060	GENERIC_DAY	27	2	f	2010-10-01	4344	\N	27148	\N
270061	GENERIC_DAY	27	0	f	2010-09-26	4358	\N	27148	\N
270062	GENERIC_DAY	27	2	f	2010-09-24	4358	\N	27148	\N
270063	GENERIC_DAY	27	2	f	2010-09-22	4350	\N	27148	\N
270064	GENERIC_DAY	27	0	f	2010-09-12	4358	\N	27148	\N
270065	GENERIC_DAY	27	2	f	2010-09-10	4350	\N	27148	\N
270066	GENERIC_DAY	27	0	f	2010-09-18	4350	\N	27148	\N
270067	GENERIC_DAY	27	0	f	2010-10-03	4350	\N	27148	\N
270068	GENERIC_DAY	26	2	f	2010-09-16	4344	\N	27149	\N
270069	GENERIC_DAY	26	0	f	2010-09-19	4348	\N	27149	\N
270070	GENERIC_DAY	26	2	f	2010-09-09	4344	\N	27149	\N
270071	GENERIC_DAY	26	2	f	2010-09-08	4348	\N	27149	\N
270072	GENERIC_DAY	26	2	f	2010-09-17	4348	\N	27149	\N
270073	GENERIC_DAY	26	2	f	2010-09-16	4358	\N	27149	\N
270074	GENERIC_DAY	26	2	f	2010-09-15	4348	\N	27149	\N
270075	GENERIC_DAY	26	2	f	2010-09-15	4358	\N	27149	\N
270076	GENERIC_DAY	26	0	f	2010-09-12	4350	\N	27149	\N
270077	GENERIC_DAY	26	0	f	2010-09-19	4350	\N	27149	\N
270078	GENERIC_DAY	26	2	f	2010-09-08	4344	\N	27149	\N
270079	GENERIC_DAY	26	2	f	2010-09-17	4344	\N	27149	\N
270080	GENERIC_DAY	26	2	f	2010-09-13	4348	\N	27149	\N
270081	GENERIC_DAY	26	2	f	2010-09-16	4350	\N	27149	\N
270082	GENERIC_DAY	26	0	f	2010-09-18	4358	\N	27149	\N
270083	GENERIC_DAY	26	2	f	2010-09-23	4344	\N	27149	\N
270084	GENERIC_DAY	26	2	f	2010-09-22	4350	\N	27149	\N
270085	GENERIC_DAY	26	2	f	2010-09-21	4350	\N	27149	\N
270086	GENERIC_DAY	26	0	f	2010-09-19	4344	\N	27149	\N
270087	GENERIC_DAY	26	2	f	2010-09-14	4344	\N	27149	\N
270088	GENERIC_DAY	26	0	f	2010-09-11	4348	\N	27149	\N
270089	GENERIC_DAY	26	2	f	2010-09-24	4344	\N	27149	\N
270090	GENERIC_DAY	26	2	f	2010-09-20	4358	\N	27149	\N
270091	GENERIC_DAY	26	2	f	2010-09-08	4350	\N	27149	\N
270092	GENERIC_DAY	26	2	f	2010-09-17	4358	\N	27149	\N
270093	GENERIC_DAY	26	2	f	2010-09-13	4358	\N	27149	\N
270094	GENERIC_DAY	26	0	f	2010-09-19	4358	\N	27149	\N
270095	GENERIC_DAY	26	0	f	2010-09-11	4344	\N	27149	\N
270096	GENERIC_DAY	26	2	f	2010-09-21	4358	\N	27149	\N
270097	GENERIC_DAY	26	2	f	2010-09-10	4350	\N	27149	\N
270098	GENERIC_DAY	26	2	f	2010-09-17	4350	\N	27149	\N
270099	GENERIC_DAY	26	0	f	2010-09-12	4344	\N	27149	\N
270100	GENERIC_DAY	26	1	f	2010-09-24	4348	\N	27149	\N
270101	GENERIC_DAY	26	2	f	2010-09-14	4348	\N	27149	\N
270102	GENERIC_DAY	26	2	f	2010-09-21	4348	\N	27149	\N
270103	GENERIC_DAY	26	2	f	2010-09-10	4358	\N	27149	\N
270104	GENERIC_DAY	26	2	f	2010-09-21	4344	\N	27149	\N
270105	GENERIC_DAY	26	2	f	2010-09-22	4348	\N	27149	\N
270106	GENERIC_DAY	26	2	f	2010-09-15	4344	\N	27149	\N
270107	GENERIC_DAY	26	2	f	2010-09-10	4348	\N	27149	\N
270108	GENERIC_DAY	26	2	f	2010-09-20	4344	\N	27149	\N
270109	GENERIC_DAY	26	2	f	2010-09-13	4350	\N	27149	\N
270110	GENERIC_DAY	26	0	f	2010-09-12	4358	\N	27149	\N
270111	GENERIC_DAY	26	2	f	2010-09-20	4350	\N	27149	\N
270112	GENERIC_DAY	26	2	f	2010-09-09	4350	\N	27149	\N
270113	GENERIC_DAY	26	2	f	2010-09-22	4358	\N	27149	\N
270114	GENERIC_DAY	26	1	f	2010-09-24	4350	\N	27149	\N
270115	GENERIC_DAY	26	2	f	2010-09-09	4348	\N	27149	\N
270116	GENERIC_DAY	26	2	f	2010-09-23	4348	\N	27149	\N
270117	GENERIC_DAY	26	2	f	2010-09-08	4358	\N	27149	\N
270118	GENERIC_DAY	26	2	f	2010-09-15	4350	\N	27149	\N
270119	GENERIC_DAY	26	2	f	2010-09-16	4348	\N	27149	\N
270120	GENERIC_DAY	26	2	f	2010-09-14	4350	\N	27149	\N
270121	GENERIC_DAY	26	2	f	2010-09-23	4358	\N	27149	\N
270122	GENERIC_DAY	26	1	f	2010-09-24	4358	\N	27149	\N
270123	GENERIC_DAY	26	2	f	2010-09-09	4358	\N	27149	\N
270124	GENERIC_DAY	26	2	f	2010-09-13	4344	\N	27149	\N
270125	GENERIC_DAY	26	2	f	2010-09-20	4348	\N	27149	\N
270126	GENERIC_DAY	26	0	f	2010-09-18	4350	\N	27149	\N
270127	GENERIC_DAY	26	0	f	2010-09-11	4350	\N	27149	\N
270128	GENERIC_DAY	26	0	f	2010-09-11	4358	\N	27149	\N
270129	GENERIC_DAY	26	0	f	2010-09-12	4348	\N	27149	\N
270130	GENERIC_DAY	26	2	f	2010-09-22	4344	\N	27149	\N
270131	GENERIC_DAY	26	2	f	2010-09-10	4344	\N	27149	\N
270132	GENERIC_DAY	26	0	f	2010-09-18	4348	\N	27149	\N
270133	GENERIC_DAY	26	2	f	2010-09-23	4350	\N	27149	\N
270134	GENERIC_DAY	26	0	f	2010-09-18	4344	\N	27149	\N
270135	GENERIC_DAY	26	2	f	2010-09-14	4358	\N	27149	\N
270136	GENERIC_DAY	25	0	f	2010-10-09	4354	\N	27150	\N
270137	GENERIC_DAY	25	4	f	2010-10-12	4352	\N	27150	\N
270138	GENERIC_DAY	25	4	f	2010-10-06	4352	\N	27150	\N
270139	GENERIC_DAY	25	4	f	2010-10-14	4354	\N	27150	\N
270140	GENERIC_DAY	25	0	f	2010-10-10	4354	\N	27150	\N
270141	GENERIC_DAY	25	4	f	2010-10-21	4352	\N	27150	\N
270142	GENERIC_DAY	25	4	f	2010-10-06	4354	\N	27150	\N
270143	GENERIC_DAY	25	0	f	2010-10-16	4352	\N	27150	\N
270144	GENERIC_DAY	25	0	f	2010-11-06	4352	\N	27150	\N
270145	GENERIC_DAY	25	4	f	2010-10-25	4352	\N	27150	\N
270146	GENERIC_DAY	25	4	f	2010-10-19	4352	\N	27150	\N
270147	GENERIC_DAY	25	4	f	2010-10-20	4352	\N	27150	\N
270148	GENERIC_DAY	25	4	f	2010-10-05	4352	\N	27150	\N
270149	GENERIC_DAY	25	4	f	2010-10-12	4354	\N	27150	\N
270150	GENERIC_DAY	25	0	f	2010-10-17	4354	\N	27150	\N
270151	GENERIC_DAY	25	4	f	2010-11-03	4352	\N	27150	\N
270152	GENERIC_DAY	25	0	f	2010-10-23	4352	\N	27150	\N
270153	GENERIC_DAY	25	0	f	2010-10-31	4352	\N	27150	\N
270154	GENERIC_DAY	25	4	f	2010-11-02	4354	\N	27150	\N
270155	GENERIC_DAY	25	4	f	2010-11-02	4352	\N	27150	\N
270156	GENERIC_DAY	25	4	f	2010-11-05	4352	\N	27150	\N
270157	GENERIC_DAY	25	0	f	2010-11-07	4354	\N	27150	\N
270158	GENERIC_DAY	25	0	f	2010-10-24	4352	\N	27150	\N
270159	GENERIC_DAY	25	4	f	2010-10-15	4352	\N	27150	\N
270160	GENERIC_DAY	25	4	f	2010-10-18	4352	\N	27150	\N
270161	GENERIC_DAY	25	4	f	2010-11-01	4354	\N	27150	\N
270162	GENERIC_DAY	25	4	f	2010-11-05	4354	\N	27150	\N
270163	GENERIC_DAY	25	0	f	2010-11-07	4352	\N	27150	\N
270164	GENERIC_DAY	25	4	f	2010-10-26	4352	\N	27150	\N
270165	GENERIC_DAY	25	4	f	2010-11-08	4352	\N	27150	\N
270166	GENERIC_DAY	25	4	f	2010-10-18	4354	\N	27150	\N
270167	GENERIC_DAY	25	4	f	2010-10-22	4354	\N	27150	\N
270168	GENERIC_DAY	25	4	f	2010-10-20	4354	\N	27150	\N
270169	GENERIC_DAY	25	0	f	2010-11-06	4354	\N	27150	\N
270170	GENERIC_DAY	25	4	f	2010-11-01	4352	\N	27150	\N
270171	GENERIC_DAY	25	4	f	2010-10-29	4352	\N	27150	\N
270172	GENERIC_DAY	25	4	f	2010-10-29	4354	\N	27150	\N
270173	GENERIC_DAY	25	4	f	2010-10-19	4354	\N	27150	\N
270174	GENERIC_DAY	25	4	f	2010-10-11	4354	\N	27150	\N
270175	GENERIC_DAY	25	4	f	2010-10-13	4354	\N	27150	\N
270176	GENERIC_DAY	25	4	f	2010-10-11	4352	\N	27150	\N
270177	GENERIC_DAY	25	4	f	2010-10-27	4352	\N	27150	\N
270178	GENERIC_DAY	25	4	f	2010-10-08	4352	\N	27150	\N
270179	GENERIC_DAY	25	4	f	2010-11-03	4354	\N	27150	\N
270180	GENERIC_DAY	25	0	f	2010-10-10	4352	\N	27150	\N
270181	GENERIC_DAY	25	0	f	2010-10-09	4352	\N	27150	\N
270182	GENERIC_DAY	25	4	f	2010-10-07	4352	\N	27150	\N
270183	GENERIC_DAY	25	4	f	2010-10-08	4354	\N	27150	\N
270184	GENERIC_DAY	25	0	f	2010-10-17	4352	\N	27150	\N
270185	GENERIC_DAY	25	4	f	2010-11-04	4354	\N	27150	\N
270186	GENERIC_DAY	25	4	f	2010-10-14	4352	\N	27150	\N
270187	GENERIC_DAY	25	4	f	2010-10-26	4354	\N	27150	\N
270188	GENERIC_DAY	25	4	f	2010-11-04	4352	\N	27150	\N
270189	GENERIC_DAY	25	4	f	2010-10-27	4354	\N	27150	\N
270190	GENERIC_DAY	25	4	f	2010-10-25	4354	\N	27150	\N
270191	GENERIC_DAY	25	4	f	2010-10-22	4352	\N	27150	\N
270192	GENERIC_DAY	25	0	f	2010-10-23	4354	\N	27150	\N
270193	GENERIC_DAY	25	0	f	2010-10-16	4354	\N	27150	\N
270194	GENERIC_DAY	25	4	f	2010-10-07	4354	\N	27150	\N
270195	GENERIC_DAY	25	4	f	2010-10-28	4352	\N	27150	\N
270196	GENERIC_DAY	25	0	f	2010-10-24	4354	\N	27150	\N
270197	GENERIC_DAY	25	0	f	2010-10-30	4354	\N	27150	\N
270198	GENERIC_DAY	25	4	f	2010-10-28	4354	\N	27150	\N
270199	GENERIC_DAY	25	4	f	2010-10-05	4354	\N	27150	\N
270200	GENERIC_DAY	25	4	f	2010-10-13	4352	\N	27150	\N
270201	GENERIC_DAY	25	4	f	2010-11-08	4354	\N	27150	\N
270202	GENERIC_DAY	25	4	f	2010-10-15	4354	\N	27150	\N
270203	GENERIC_DAY	25	0	f	2010-10-30	4352	\N	27150	\N
270204	GENERIC_DAY	25	0	f	2010-10-31	4354	\N	27150	\N
270205	GENERIC_DAY	25	4	f	2010-10-21	4354	\N	27150	\N
270206	GENERIC_DAY	24	4	f	2010-11-01	4352	\N	27151	\N
270207	GENERIC_DAY	24	0	f	2010-10-24	4354	\N	27151	\N
270208	GENERIC_DAY	24	0	f	2010-10-23	4354	\N	27151	\N
270209	GENERIC_DAY	24	4	f	2010-10-19	4354	\N	27151	\N
270210	GENERIC_DAY	24	4	f	2010-10-29	4354	\N	27151	\N
270211	GENERIC_DAY	24	4	f	2010-10-26	4354	\N	27151	\N
270212	GENERIC_DAY	24	4	f	2010-10-21	4352	\N	27151	\N
270213	GENERIC_DAY	24	4	f	2010-10-22	4352	\N	27151	\N
270214	GENERIC_DAY	24	0	f	2010-10-24	4352	\N	27151	\N
270215	GENERIC_DAY	24	0	f	2010-10-17	4352	\N	27151	\N
270216	GENERIC_DAY	24	4	f	2010-10-15	4354	\N	27151	\N
270217	GENERIC_DAY	24	4	f	2010-10-25	4352	\N	27151	\N
270218	GENERIC_DAY	24	4	f	2010-10-27	4352	\N	27151	\N
270219	GENERIC_DAY	24	0	f	2010-10-31	4352	\N	27151	\N
270220	GENERIC_DAY	24	4	f	2010-10-27	4354	\N	27151	\N
270221	GENERIC_DAY	24	4	f	2010-10-18	4352	\N	27151	\N
270222	GENERIC_DAY	24	0	f	2010-10-17	4354	\N	27151	\N
270223	GENERIC_DAY	24	4	f	2010-10-20	4352	\N	27151	\N
270224	GENERIC_DAY	24	2	f	2010-11-02	4352	\N	27151	\N
270225	GENERIC_DAY	24	0	f	2010-10-31	4354	\N	27151	\N
270226	GENERIC_DAY	24	2	f	2010-11-02	4354	\N	27151	\N
270227	GENERIC_DAY	24	4	f	2010-10-22	4354	\N	27151	\N
270228	GENERIC_DAY	24	4	f	2010-10-29	4352	\N	27151	\N
270229	GENERIC_DAY	24	4	f	2010-10-18	4354	\N	27151	\N
270230	GENERIC_DAY	24	4	f	2010-10-21	4354	\N	27151	\N
270231	GENERIC_DAY	24	4	f	2010-11-01	4354	\N	27151	\N
270232	GENERIC_DAY	24	0	f	2010-10-16	4352	\N	27151	\N
270233	GENERIC_DAY	24	4	f	2010-10-26	4352	\N	27151	\N
270234	GENERIC_DAY	24	4	f	2010-10-20	4354	\N	27151	\N
270235	GENERIC_DAY	24	4	f	2010-10-28	4354	\N	27151	\N
270236	GENERIC_DAY	24	0	f	2010-10-30	4352	\N	27151	\N
270237	GENERIC_DAY	24	4	f	2010-10-19	4352	\N	27151	\N
270238	GENERIC_DAY	24	4	f	2010-10-28	4352	\N	27151	\N
270239	GENERIC_DAY	24	4	f	2010-10-15	4352	\N	27151	\N
270240	GENERIC_DAY	24	0	f	2010-10-30	4354	\N	27151	\N
270241	GENERIC_DAY	24	0	f	2010-10-23	4352	\N	27151	\N
270242	GENERIC_DAY	24	0	f	2010-10-16	4354	\N	27151	\N
270243	GENERIC_DAY	24	4	f	2010-10-25	4354	\N	27151	\N
270244	GENERIC_DAY	23	4	f	2010-10-06	4352	\N	27152	\N
270245	GENERIC_DAY	23	0	f	2010-10-24	4352	\N	27152	\N
270246	GENERIC_DAY	23	4	f	2010-10-06	4354	\N	27152	\N
270247	GENERIC_DAY	23	0	f	2010-10-02	4354	\N	27152	\N
270248	GENERIC_DAY	23	4	f	2010-10-29	4354	\N	27152	\N
270249	GENERIC_DAY	23	0	f	2010-10-09	4354	\N	27152	\N
270250	GENERIC_DAY	23	4	f	2010-10-28	4352	\N	27152	\N
270251	GENERIC_DAY	23	0	f	2010-10-23	4352	\N	27152	\N
270252	GENERIC_DAY	23	4	f	2010-10-18	4354	\N	27152	\N
270253	GENERIC_DAY	23	4	f	2010-09-27	4354	\N	27152	\N
270254	GENERIC_DAY	23	4	f	2010-10-27	4354	\N	27152	\N
270255	GENERIC_DAY	23	4	f	2010-10-22	4354	\N	27152	\N
270256	GENERIC_DAY	23	4	f	2010-10-15	4352	\N	27152	\N
270257	GENERIC_DAY	23	4	f	2010-10-12	4352	\N	27152	\N
270258	GENERIC_DAY	23	4	f	2010-10-13	4352	\N	27152	\N
270259	GENERIC_DAY	23	4	f	2010-09-29	4352	\N	27152	\N
270260	GENERIC_DAY	23	4	f	2010-09-28	4354	\N	27152	\N
270261	GENERIC_DAY	23	0	f	2010-10-03	4354	\N	27152	\N
270262	GENERIC_DAY	23	0	f	2010-09-26	4352	\N	27152	\N
270263	GENERIC_DAY	23	4	f	2010-09-30	4354	\N	27152	\N
270264	GENERIC_DAY	23	0	f	2010-10-24	4354	\N	27152	\N
270265	GENERIC_DAY	23	0	f	2010-10-16	4354	\N	27152	\N
270266	GENERIC_DAY	23	0	f	2010-10-09	4352	\N	27152	\N
270267	GENERIC_DAY	23	4	f	2010-10-13	4354	\N	27152	\N
270268	GENERIC_DAY	23	4	f	2010-10-20	4354	\N	27152	\N
270269	GENERIC_DAY	23	4	f	2010-10-15	4354	\N	27152	\N
270270	GENERIC_DAY	23	4	f	2010-10-04	4352	\N	27152	\N
270271	GENERIC_DAY	23	4	f	2010-10-11	4352	\N	27152	\N
270272	GENERIC_DAY	23	4	f	2010-10-20	4352	\N	27152	\N
270273	GENERIC_DAY	23	4	f	2010-10-12	4354	\N	27152	\N
270274	GENERIC_DAY	23	4	f	2010-10-26	4352	\N	27152	\N
270275	GENERIC_DAY	23	0	f	2010-10-02	4352	\N	27152	\N
270276	GENERIC_DAY	23	4	f	2010-10-19	4352	\N	27152	\N
270277	GENERIC_DAY	23	4	f	2010-10-18	4352	\N	27152	\N
270278	GENERIC_DAY	23	4	f	2010-10-14	4354	\N	27152	\N
270279	GENERIC_DAY	23	4	f	2010-10-25	4352	\N	27152	\N
270280	GENERIC_DAY	23	4	f	2010-10-28	4354	\N	27152	\N
270281	GENERIC_DAY	23	4	f	2010-10-11	4354	\N	27152	\N
270282	GENERIC_DAY	23	0	f	2010-09-25	4354	\N	27152	\N
270283	GENERIC_DAY	23	0	f	2010-10-17	4352	\N	27152	\N
270284	GENERIC_DAY	23	4	f	2010-10-01	4354	\N	27152	\N
270285	GENERIC_DAY	23	4	f	2010-10-14	4352	\N	27152	\N
270286	GENERIC_DAY	23	4	f	2010-10-21	4354	\N	27152	\N
270287	GENERIC_DAY	23	0	f	2010-10-16	4352	\N	27152	\N
270288	GENERIC_DAY	23	4	f	2010-10-07	4352	\N	27152	\N
270289	GENERIC_DAY	23	4	f	2010-10-29	4352	\N	27152	\N
270290	GENERIC_DAY	23	4	f	2010-09-28	4352	\N	27152	\N
270291	GENERIC_DAY	23	0	f	2010-09-26	4354	\N	27152	\N
270292	GENERIC_DAY	23	4	f	2010-10-25	4354	\N	27152	\N
270293	GENERIC_DAY	23	4	f	2010-10-07	4354	\N	27152	\N
270294	GENERIC_DAY	23	4	f	2010-10-19	4354	\N	27152	\N
270295	GENERIC_DAY	23	4	f	2010-10-22	4352	\N	27152	\N
270296	GENERIC_DAY	23	0	f	2010-10-23	4354	\N	27152	\N
270297	GENERIC_DAY	23	4	f	2010-10-04	4354	\N	27152	\N
270298	GENERIC_DAY	23	0	f	2010-10-17	4354	\N	27152	\N
270299	GENERIC_DAY	23	4	f	2010-09-27	4352	\N	27152	\N
270300	GENERIC_DAY	23	0	f	2010-09-25	4352	\N	27152	\N
270301	GENERIC_DAY	23	0	f	2010-10-10	4352	\N	27152	\N
270302	GENERIC_DAY	23	4	f	2010-10-05	4354	\N	27152	\N
270303	GENERIC_DAY	23	0	f	2010-10-03	4352	\N	27152	\N
270304	GENERIC_DAY	23	4	f	2010-10-27	4352	\N	27152	\N
270305	GENERIC_DAY	23	4	f	2010-10-01	4352	\N	27152	\N
270306	GENERIC_DAY	23	4	f	2010-10-08	4352	\N	27152	\N
270307	GENERIC_DAY	23	4	f	2010-09-30	4352	\N	27152	\N
270308	GENERIC_DAY	23	0	f	2010-10-10	4354	\N	27152	\N
270309	GENERIC_DAY	23	4	f	2010-10-08	4354	\N	27152	\N
270310	GENERIC_DAY	23	4	f	2010-09-29	4354	\N	27152	\N
270311	GENERIC_DAY	23	4	f	2010-10-05	4352	\N	27152	\N
270312	GENERIC_DAY	23	4	f	2010-10-26	4354	\N	27152	\N
270313	GENERIC_DAY	23	4	f	2010-10-21	4352	\N	27152	\N
270314	GENERIC_DAY	22	4	f	2010-10-01	4354	\N	27153	\N
270315	GENERIC_DAY	22	0	f	2010-10-10	4354	\N	27153	\N
270316	GENERIC_DAY	22	4	f	2010-09-13	4352	\N	27153	\N
270317	GENERIC_DAY	22	4	f	2010-09-08	4352	\N	27153	\N
270318	GENERIC_DAY	22	4	f	2010-09-20	4352	\N	27153	\N
270319	GENERIC_DAY	22	0	f	2010-09-11	4354	\N	27153	\N
270320	GENERIC_DAY	22	0	f	2010-09-18	4352	\N	27153	\N
270321	GENERIC_DAY	22	0	f	2010-10-02	4354	\N	27153	\N
270322	GENERIC_DAY	22	4	f	2010-10-12	4354	\N	27153	\N
270323	GENERIC_DAY	22	0	f	2010-10-09	4354	\N	27153	\N
270324	GENERIC_DAY	22	4	f	2010-09-20	4354	\N	27153	\N
270325	GENERIC_DAY	22	0	f	2010-10-03	4352	\N	27153	\N
270326	GENERIC_DAY	22	0	f	2010-09-18	4354	\N	27153	\N
270327	GENERIC_DAY	22	4	f	2010-09-30	4352	\N	27153	\N
270328	GENERIC_DAY	22	4	f	2010-10-07	4354	\N	27153	\N
270329	GENERIC_DAY	22	4	f	2010-10-04	4352	\N	27153	\N
270330	GENERIC_DAY	22	4	f	2010-09-29	4354	\N	27153	\N
270331	GENERIC_DAY	22	4	f	2010-10-11	4352	\N	27153	\N
270332	GENERIC_DAY	22	0	f	2010-09-25	4352	\N	27153	\N
270333	GENERIC_DAY	22	4	f	2010-09-29	4352	\N	27153	\N
270334	GENERIC_DAY	22	4	f	2010-09-24	4354	\N	27153	\N
270335	GENERIC_DAY	22	0	f	2010-10-10	4352	\N	27153	\N
270336	GENERIC_DAY	22	4	f	2010-09-22	4352	\N	27153	\N
270337	GENERIC_DAY	22	4	f	2010-09-15	4354	\N	27153	\N
270338	GENERIC_DAY	22	4	f	2010-09-16	4352	\N	27153	\N
270339	GENERIC_DAY	22	0	f	2010-10-09	4352	\N	27153	\N
270340	GENERIC_DAY	22	0	f	2010-10-02	4352	\N	27153	\N
270341	GENERIC_DAY	22	4	f	2010-09-17	4352	\N	27153	\N
270342	GENERIC_DAY	22	4	f	2010-10-05	4352	\N	27153	\N
270343	GENERIC_DAY	22	4	f	2010-09-09	4354	\N	27153	\N
270344	GENERIC_DAY	22	4	f	2010-09-30	4354	\N	27153	\N
270345	GENERIC_DAY	22	0	f	2010-09-25	4354	\N	27153	\N
270346	GENERIC_DAY	22	4	f	2010-09-13	4354	\N	27153	\N
270347	GENERIC_DAY	22	4	f	2010-09-27	4354	\N	27153	\N
270348	GENERIC_DAY	22	4	f	2010-09-14	4354	\N	27153	\N
270349	GENERIC_DAY	22	4	f	2010-09-21	4352	\N	27153	\N
270350	GENERIC_DAY	22	0	f	2010-09-19	4354	\N	27153	\N
270351	GENERIC_DAY	22	4	f	2010-09-27	4352	\N	27153	\N
270352	GENERIC_DAY	22	0	f	2010-09-12	4352	\N	27153	\N
270353	GENERIC_DAY	22	4	f	2010-09-10	4354	\N	27153	\N
270354	GENERIC_DAY	22	4	f	2010-09-14	4352	\N	27153	\N
270355	GENERIC_DAY	22	4	f	2010-10-04	4354	\N	27153	\N
270356	GENERIC_DAY	22	0	f	2010-09-19	4352	\N	27153	\N
270357	GENERIC_DAY	22	0	f	2010-09-12	4354	\N	27153	\N
270358	GENERIC_DAY	22	4	f	2010-09-28	4352	\N	27153	\N
270359	GENERIC_DAY	22	4	f	2010-09-28	4354	\N	27153	\N
270360	GENERIC_DAY	22	4	f	2010-10-08	4354	\N	27153	\N
270361	GENERIC_DAY	22	0	f	2010-09-11	4352	\N	27153	\N
270362	GENERIC_DAY	22	4	f	2010-09-10	4352	\N	27153	\N
270363	GENERIC_DAY	22	4	f	2010-10-12	4352	\N	27153	\N
270364	GENERIC_DAY	22	4	f	2010-09-15	4352	\N	27153	\N
270365	GENERIC_DAY	22	0	f	2010-09-26	4354	\N	27153	\N
270366	GENERIC_DAY	22	4	f	2010-09-17	4354	\N	27153	\N
270367	GENERIC_DAY	22	4	f	2010-10-05	4354	\N	27153	\N
270368	GENERIC_DAY	22	0	f	2010-09-26	4352	\N	27153	\N
270369	GENERIC_DAY	22	4	f	2010-10-06	4354	\N	27153	\N
270370	GENERIC_DAY	22	4	f	2010-10-11	4354	\N	27153	\N
270371	GENERIC_DAY	22	4	f	2010-09-21	4354	\N	27153	\N
270372	GENERIC_DAY	22	0	f	2010-10-03	4354	\N	27153	\N
270373	GENERIC_DAY	22	4	f	2010-09-23	4354	\N	27153	\N
270374	GENERIC_DAY	22	4	f	2010-09-16	4354	\N	27153	\N
270375	GENERIC_DAY	22	4	f	2010-09-08	4354	\N	27153	\N
270376	GENERIC_DAY	22	4	f	2010-10-07	4352	\N	27153	\N
270377	GENERIC_DAY	22	4	f	2010-10-06	4352	\N	27153	\N
270378	GENERIC_DAY	22	4	f	2010-10-01	4352	\N	27153	\N
270379	GENERIC_DAY	22	4	f	2010-09-22	4354	\N	27153	\N
270380	GENERIC_DAY	22	4	f	2010-09-23	4352	\N	27153	\N
270381	GENERIC_DAY	22	4	f	2010-09-24	4352	\N	27153	\N
270382	GENERIC_DAY	22	4	f	2010-10-08	4352	\N	27153	\N
270383	GENERIC_DAY	22	4	f	2010-09-09	4352	\N	27153	\N
270384	GENERIC_DAY	21	4	f	2010-11-23	4352	\N	27154	\N
270385	GENERIC_DAY	21	0	f	2011-01-16	4354	\N	27154	\N
270386	GENERIC_DAY	21	4	f	2010-11-11	4352	\N	27154	\N
270387	GENERIC_DAY	21	4	f	2010-12-17	4354	\N	27154	\N
270388	GENERIC_DAY	21	4	f	2010-12-24	4352	\N	27154	\N
270389	GENERIC_DAY	21	4	f	2010-11-11	4354	\N	27154	\N
270390	GENERIC_DAY	21	4	f	2011-01-03	4354	\N	27154	\N
270391	GENERIC_DAY	21	0	f	2011-01-09	4352	\N	27154	\N
270392	GENERIC_DAY	21	4	f	2010-12-01	4354	\N	27154	\N
270393	GENERIC_DAY	21	4	f	2010-12-03	4354	\N	27154	\N
270394	GENERIC_DAY	21	0	f	2011-01-02	4354	\N	27154	\N
270395	GENERIC_DAY	21	0	f	2010-12-12	4352	\N	27154	\N
270396	GENERIC_DAY	21	4	f	2010-12-02	4352	\N	27154	\N
270397	GENERIC_DAY	21	4	f	2010-11-25	4352	\N	27154	\N
270398	GENERIC_DAY	21	4	f	2011-01-17	4354	\N	27154	\N
270399	GENERIC_DAY	21	4	f	2011-01-05	4352	\N	27154	\N
270400	GENERIC_DAY	21	4	f	2010-11-19	4352	\N	27154	\N
270401	GENERIC_DAY	21	4	f	2010-11-29	4352	\N	27154	\N
270402	GENERIC_DAY	21	4	f	2010-12-27	4352	\N	27154	\N
270403	GENERIC_DAY	21	0	f	2010-12-04	4354	\N	27154	\N
270404	GENERIC_DAY	21	4	f	2010-11-26	4352	\N	27154	\N
270405	GENERIC_DAY	21	0	f	2010-11-28	4354	\N	27154	\N
270406	GENERIC_DAY	21	4	f	2010-12-16	4352	\N	27154	\N
270407	GENERIC_DAY	21	0	f	2010-12-26	4352	\N	27154	\N
270408	GENERIC_DAY	21	4	f	2011-01-12	4352	\N	27154	\N
270409	GENERIC_DAY	21	4	f	2010-12-03	4352	\N	27154	\N
270410	GENERIC_DAY	21	4	f	2010-12-02	4354	\N	27154	\N
270411	GENERIC_DAY	21	4	f	2011-01-10	4354	\N	27154	\N
270412	GENERIC_DAY	21	0	f	2011-01-09	4354	\N	27154	\N
270413	GENERIC_DAY	21	4	f	2010-12-23	4352	\N	27154	\N
270414	GENERIC_DAY	21	4	f	2010-11-24	4352	\N	27154	\N
270415	GENERIC_DAY	21	4	f	2011-01-04	4352	\N	27154	\N
270416	GENERIC_DAY	21	4	f	2011-01-06	4354	\N	27154	\N
270417	GENERIC_DAY	21	4	f	2010-12-30	4352	\N	27154	\N
270418	GENERIC_DAY	21	4	f	2010-12-31	4352	\N	27154	\N
270419	GENERIC_DAY	21	0	f	2010-11-20	4352	\N	27154	\N
270420	GENERIC_DAY	21	4	f	2010-11-12	4352	\N	27154	\N
270421	GENERIC_DAY	21	4	f	2010-12-10	4354	\N	27154	\N
270422	GENERIC_DAY	21	4	f	2010-12-14	4354	\N	27154	\N
270423	GENERIC_DAY	21	0	f	2010-12-05	4352	\N	27154	\N
270424	GENERIC_DAY	21	4	f	2011-01-03	4352	\N	27154	\N
270425	GENERIC_DAY	21	4	f	2011-01-14	4354	\N	27154	\N
270426	GENERIC_DAY	21	4	f	2010-12-13	4352	\N	27154	\N
270427	GENERIC_DAY	21	0	f	2010-11-13	4352	\N	27154	\N
270428	GENERIC_DAY	21	4	f	2010-12-16	4354	\N	27154	\N
270429	GENERIC_DAY	21	4	f	2010-12-01	4352	\N	27154	\N
270430	GENERIC_DAY	21	4	f	2011-01-04	4354	\N	27154	\N
270431	GENERIC_DAY	21	4	f	2010-11-22	4352	\N	27154	\N
270432	GENERIC_DAY	21	4	f	2010-11-15	4352	\N	27154	\N
270433	GENERIC_DAY	21	0	f	2010-12-04	4352	\N	27154	\N
270434	GENERIC_DAY	21	4	f	2010-11-18	4352	\N	27154	\N
270435	GENERIC_DAY	21	4	f	2010-12-24	4354	\N	27154	\N
270436	GENERIC_DAY	21	0	f	2010-12-11	4352	\N	27154	\N
270437	GENERIC_DAY	21	0	f	2010-12-18	4352	\N	27154	\N
270438	GENERIC_DAY	21	0	f	2010-12-12	4354	\N	27154	\N
270439	GENERIC_DAY	21	4	f	2011-01-13	4354	\N	27154	\N
270440	GENERIC_DAY	21	0	f	2011-01-16	4352	\N	27154	\N
270441	GENERIC_DAY	21	4	f	2010-11-17	4354	\N	27154	\N
270442	GENERIC_DAY	21	4	f	2010-12-07	4354	\N	27154	\N
270443	GENERIC_DAY	21	4	f	2010-12-15	4352	\N	27154	\N
270444	GENERIC_DAY	21	4	f	2011-01-12	4354	\N	27154	\N
270445	GENERIC_DAY	21	4	f	2010-12-28	4354	\N	27154	\N
270446	GENERIC_DAY	21	4	f	2010-11-12	4354	\N	27154	\N
270447	GENERIC_DAY	21	0	f	2010-11-21	4352	\N	27154	\N
270448	GENERIC_DAY	21	4	f	2010-11-16	4354	\N	27154	\N
270449	GENERIC_DAY	21	4	f	2010-11-24	4354	\N	27154	\N
270450	GENERIC_DAY	21	0	f	2011-01-08	4354	\N	27154	\N
270451	GENERIC_DAY	21	4	f	2010-12-20	4352	\N	27154	\N
270452	GENERIC_DAY	21	4	f	2010-11-10	4354	\N	27154	\N
270453	GENERIC_DAY	21	0	f	2010-12-18	4354	\N	27154	\N
270454	GENERIC_DAY	21	0	f	2010-12-25	4352	\N	27154	\N
270455	GENERIC_DAY	21	4	f	2010-11-09	4354	\N	27154	\N
270456	GENERIC_DAY	21	0	f	2010-11-14	4352	\N	27154	\N
270457	GENERIC_DAY	21	4	f	2010-12-28	4352	\N	27154	\N
270458	GENERIC_DAY	21	4	f	2010-12-09	4352	\N	27154	\N
270459	GENERIC_DAY	21	4	f	2010-12-08	4352	\N	27154	\N
270460	GENERIC_DAY	21	4	f	2010-12-17	4352	\N	27154	\N
270461	GENERIC_DAY	21	4	f	2010-12-15	4354	\N	27154	\N
270462	GENERIC_DAY	21	4	f	2010-12-29	4354	\N	27154	\N
270463	GENERIC_DAY	21	0	f	2010-11-27	4352	\N	27154	\N
270464	GENERIC_DAY	21	4	f	2010-12-29	4352	\N	27154	\N
270465	GENERIC_DAY	21	4	f	2010-11-22	4354	\N	27154	\N
270466	GENERIC_DAY	21	4	f	2010-11-25	4354	\N	27154	\N
270467	GENERIC_DAY	21	4	f	2011-01-07	4352	\N	27154	\N
270468	GENERIC_DAY	21	0	f	2011-01-01	4352	\N	27154	\N
270469	GENERIC_DAY	21	4	f	2011-01-14	4352	\N	27154	\N
270470	GENERIC_DAY	21	4	f	2011-01-11	4352	\N	27154	\N
270471	GENERIC_DAY	21	0	f	2010-12-25	4354	\N	27154	\N
270472	GENERIC_DAY	21	4	f	2010-12-22	4352	\N	27154	\N
270473	GENERIC_DAY	21	0	f	2010-12-11	4354	\N	27154	\N
270474	GENERIC_DAY	21	4	f	2010-12-06	4352	\N	27154	\N
270475	GENERIC_DAY	21	4	f	2011-01-11	4354	\N	27154	\N
270476	GENERIC_DAY	21	4	f	2011-01-05	4354	\N	27154	\N
270477	GENERIC_DAY	21	4	f	2010-12-13	4354	\N	27154	\N
270478	GENERIC_DAY	21	4	f	2011-01-10	4352	\N	27154	\N
270479	GENERIC_DAY	21	4	f	2010-11-09	4352	\N	27154	\N
270480	GENERIC_DAY	21	0	f	2010-12-26	4354	\N	27154	\N
270481	GENERIC_DAY	21	4	f	2010-11-19	4354	\N	27154	\N
270482	GENERIC_DAY	21	4	f	2011-01-17	4352	\N	27154	\N
270483	GENERIC_DAY	21	4	f	2010-12-08	4354	\N	27154	\N
270484	GENERIC_DAY	21	4	f	2010-11-17	4352	\N	27154	\N
270485	GENERIC_DAY	21	4	f	2010-12-10	4352	\N	27154	\N
270486	GENERIC_DAY	21	0	f	2011-01-01	4354	\N	27154	\N
270487	GENERIC_DAY	21	4	f	2010-11-15	4354	\N	27154	\N
270488	GENERIC_DAY	21	0	f	2010-12-05	4354	\N	27154	\N
270489	GENERIC_DAY	21	4	f	2010-12-06	4354	\N	27154	\N
270490	GENERIC_DAY	21	0	f	2011-01-02	4352	\N	27154	\N
270491	GENERIC_DAY	21	0	f	2010-12-19	4354	\N	27154	\N
270492	GENERIC_DAY	21	4	f	2010-12-09	4354	\N	27154	\N
270493	GENERIC_DAY	21	4	f	2010-11-26	4354	\N	27154	\N
270494	GENERIC_DAY	21	4	f	2010-11-30	4352	\N	27154	\N
270495	GENERIC_DAY	21	4	f	2010-12-20	4354	\N	27154	\N
270496	GENERIC_DAY	21	4	f	2010-11-16	4352	\N	27154	\N
270497	GENERIC_DAY	21	4	f	2010-12-30	4354	\N	27154	\N
270498	GENERIC_DAY	21	4	f	2011-01-06	4352	\N	27154	\N
270499	GENERIC_DAY	21	4	f	2011-01-13	4352	\N	27154	\N
270500	GENERIC_DAY	21	4	f	2010-12-21	4352	\N	27154	\N
270501	GENERIC_DAY	21	4	f	2010-12-07	4352	\N	27154	\N
270502	GENERIC_DAY	21	0	f	2011-01-15	4354	\N	27154	\N
270503	GENERIC_DAY	21	4	f	2010-12-31	4354	\N	27154	\N
270504	GENERIC_DAY	21	0	f	2010-11-13	4354	\N	27154	\N
270505	GENERIC_DAY	21	4	f	2010-11-23	4354	\N	27154	\N
270506	GENERIC_DAY	21	0	f	2010-11-14	4354	\N	27154	\N
270507	GENERIC_DAY	21	4	f	2010-12-27	4354	\N	27154	\N
270508	GENERIC_DAY	21	0	f	2010-11-20	4354	\N	27154	\N
270509	GENERIC_DAY	21	0	f	2010-12-19	4352	\N	27154	\N
270510	GENERIC_DAY	21	4	f	2011-01-07	4354	\N	27154	\N
270511	GENERIC_DAY	21	0	f	2011-01-15	4352	\N	27154	\N
270512	GENERIC_DAY	21	4	f	2010-11-29	4354	\N	27154	\N
270513	GENERIC_DAY	21	0	f	2010-11-28	4352	\N	27154	\N
270514	GENERIC_DAY	21	4	f	2010-12-23	4354	\N	27154	\N
270515	GENERIC_DAY	21	4	f	2010-11-18	4354	\N	27154	\N
270516	GENERIC_DAY	21	4	f	2010-12-21	4354	\N	27154	\N
270517	GENERIC_DAY	21	0	f	2010-11-27	4354	\N	27154	\N
270518	GENERIC_DAY	21	0	f	2010-11-21	4354	\N	27154	\N
270519	GENERIC_DAY	21	4	f	2010-12-14	4352	\N	27154	\N
270520	GENERIC_DAY	21	4	f	2010-11-30	4354	\N	27154	\N
270521	GENERIC_DAY	21	4	f	2010-11-10	4352	\N	27154	\N
270522	GENERIC_DAY	21	4	f	2010-12-22	4354	\N	27154	\N
270523	GENERIC_DAY	21	0	f	2011-01-08	4352	\N	27154	\N
270524	GENERIC_DAY	20	0	f	2010-10-16	4358	\N	27155	\N
270525	GENERIC_DAY	20	0	f	2010-10-17	4344	\N	27155	\N
270526	GENERIC_DAY	20	2	f	2010-10-13	4344	\N	27155	\N
270527	GENERIC_DAY	20	2	f	2010-10-21	4358	\N	27155	\N
270528	GENERIC_DAY	20	2	f	2010-11-02	4344	\N	27155	\N
270529	GENERIC_DAY	20	0	f	2010-10-23	4358	\N	27155	\N
270530	GENERIC_DAY	20	2	f	2010-10-15	4348	\N	27155	\N
270531	GENERIC_DAY	20	2	f	2010-10-25	4344	\N	27155	\N
270532	GENERIC_DAY	20	0	f	2010-10-31	4358	\N	27155	\N
270533	GENERIC_DAY	20	2	f	2010-11-03	4348	\N	27155	\N
270534	GENERIC_DAY	20	2	f	2010-10-14	4350	\N	27155	\N
270535	GENERIC_DAY	20	0	f	2010-10-16	4344	\N	27155	\N
270536	GENERIC_DAY	20	2	f	2010-10-20	4348	\N	27155	\N
270537	GENERIC_DAY	20	2	f	2010-10-19	4350	\N	27155	\N
270538	GENERIC_DAY	20	0	f	2010-11-06	4348	\N	27155	\N
270539	GENERIC_DAY	20	2	f	2010-10-13	4350	\N	27155	\N
270540	GENERIC_DAY	20	0	f	2010-11-06	4344	\N	27155	\N
270541	GENERIC_DAY	20	0	f	2010-10-30	4348	\N	27155	\N
270542	GENERIC_DAY	20	2	f	2010-10-18	4344	\N	27155	\N
270543	GENERIC_DAY	20	0	f	2010-10-24	4358	\N	27155	\N
270544	GENERIC_DAY	20	0	f	2010-11-06	4358	\N	27155	\N
270545	GENERIC_DAY	20	2	f	2010-10-22	4350	\N	27155	\N
270546	GENERIC_DAY	20	2	f	2010-10-27	4344	\N	27155	\N
270547	GENERIC_DAY	20	2	f	2010-10-26	4344	\N	27155	\N
270548	GENERIC_DAY	20	0	f	2010-10-30	4344	\N	27155	\N
270549	GENERIC_DAY	20	2	f	2010-11-05	4344	\N	27155	\N
270550	GENERIC_DAY	20	2	f	2010-10-14	4358	\N	27155	\N
270551	GENERIC_DAY	20	0	f	2010-10-16	4348	\N	27155	\N
270552	GENERIC_DAY	20	1	f	2010-11-08	4350	\N	27155	\N
270553	GENERIC_DAY	20	0	f	2010-10-17	4350	\N	27155	\N
270554	GENERIC_DAY	20	2	f	2010-11-04	4348	\N	27155	\N
270555	GENERIC_DAY	20	2	f	2010-10-20	4350	\N	27155	\N
270556	GENERIC_DAY	20	2	f	2010-10-21	4350	\N	27155	\N
270557	GENERIC_DAY	20	1	f	2010-11-08	4358	\N	27155	\N
270558	GENERIC_DAY	20	2	f	2010-10-28	4344	\N	27155	\N
270559	GENERIC_DAY	20	0	f	2010-10-23	4344	\N	27155	\N
270560	GENERIC_DAY	20	2	f	2010-10-29	4348	\N	27155	\N
270561	GENERIC_DAY	20	0	f	2010-10-17	4358	\N	27155	\N
270562	GENERIC_DAY	20	0	f	2010-10-24	4344	\N	27155	\N
270563	GENERIC_DAY	20	0	f	2010-10-31	4348	\N	27155	\N
270564	GENERIC_DAY	20	2	f	2010-10-18	4348	\N	27155	\N
270565	GENERIC_DAY	20	2	f	2010-11-08	4348	\N	27155	\N
270566	GENERIC_DAY	20	2	f	2010-10-25	4358	\N	27155	\N
270567	GENERIC_DAY	20	0	f	2010-10-30	4350	\N	27155	\N
270568	GENERIC_DAY	20	0	f	2010-11-07	4350	\N	27155	\N
270569	GENERIC_DAY	20	2	f	2010-10-29	4358	\N	27155	\N
270570	GENERIC_DAY	20	2	f	2010-10-19	4348	\N	27155	\N
270571	GENERIC_DAY	20	2	f	2010-10-20	4358	\N	27155	\N
270572	GENERIC_DAY	20	2	f	2010-10-21	4348	\N	27155	\N
270573	GENERIC_DAY	20	2	f	2010-10-27	4348	\N	27155	\N
270574	GENERIC_DAY	20	2	f	2010-11-04	4350	\N	27155	\N
270575	GENERIC_DAY	20	2	f	2010-10-14	4344	\N	27155	\N
270576	GENERIC_DAY	20	2	f	2010-10-18	4350	\N	27155	\N
270577	GENERIC_DAY	20	0	f	2010-10-31	4350	\N	27155	\N
270578	GENERIC_DAY	20	2	f	2010-11-02	4350	\N	27155	\N
270579	GENERIC_DAY	20	0	f	2010-10-23	4348	\N	27155	\N
270580	GENERIC_DAY	20	2	f	2010-10-25	4350	\N	27155	\N
270581	GENERIC_DAY	20	0	f	2010-11-07	4358	\N	27155	\N
270582	GENERIC_DAY	20	0	f	2010-10-31	4344	\N	27155	\N
270583	GENERIC_DAY	20	2	f	2010-10-27	4358	\N	27155	\N
270584	GENERIC_DAY	20	2	f	2010-11-02	4348	\N	27155	\N
270585	GENERIC_DAY	20	2	f	2010-10-22	4358	\N	27155	\N
270586	GENERIC_DAY	20	2	f	2010-11-01	4358	\N	27155	\N
270587	GENERIC_DAY	20	2	f	2010-10-13	4358	\N	27155	\N
270588	GENERIC_DAY	20	2	f	2010-11-03	4344	\N	27155	\N
270589	GENERIC_DAY	20	2	f	2010-11-03	4350	\N	27155	\N
270590	GENERIC_DAY	20	2	f	2010-11-05	4350	\N	27155	\N
270591	GENERIC_DAY	20	2	f	2010-10-13	4348	\N	27155	\N
270592	GENERIC_DAY	20	2	f	2010-10-28	4348	\N	27155	\N
270593	GENERIC_DAY	20	0	f	2010-10-17	4348	\N	27155	\N
270594	GENERIC_DAY	20	2	f	2010-11-01	4348	\N	27155	\N
270595	GENERIC_DAY	20	2	f	2010-10-18	4358	\N	27155	\N
270596	GENERIC_DAY	20	2	f	2010-10-20	4344	\N	27155	\N
270597	GENERIC_DAY	20	0	f	2010-10-23	4350	\N	27155	\N
270598	GENERIC_DAY	20	2	f	2010-10-19	4358	\N	27155	\N
270599	GENERIC_DAY	20	2	f	2010-10-22	4344	\N	27155	\N
270600	GENERIC_DAY	20	2	f	2010-10-15	4344	\N	27155	\N
270601	GENERIC_DAY	20	0	f	2010-10-24	4350	\N	27155	\N
270602	GENERIC_DAY	20	2	f	2010-10-14	4348	\N	27155	\N
270603	GENERIC_DAY	20	2	f	2010-11-08	4344	\N	27155	\N
270604	GENERIC_DAY	20	0	f	2010-11-07	4348	\N	27155	\N
270605	GENERIC_DAY	20	0	f	2010-11-06	4350	\N	27155	\N
270606	GENERIC_DAY	20	2	f	2010-10-28	4350	\N	27155	\N
270607	GENERIC_DAY	20	2	f	2010-10-19	4344	\N	27155	\N
270608	GENERIC_DAY	20	2	f	2010-10-21	4344	\N	27155	\N
270609	GENERIC_DAY	20	0	f	2010-10-24	4348	\N	27155	\N
270610	GENERIC_DAY	20	0	f	2010-10-16	4350	\N	27155	\N
270611	GENERIC_DAY	20	2	f	2010-10-26	4348	\N	27155	\N
270612	GENERIC_DAY	20	2	f	2010-11-01	4350	\N	27155	\N
270613	GENERIC_DAY	20	2	f	2010-11-04	4344	\N	27155	\N
270614	GENERIC_DAY	20	2	f	2010-11-04	4358	\N	27155	\N
270615	GENERIC_DAY	20	2	f	2010-11-05	4348	\N	27155	\N
270616	GENERIC_DAY	20	2	f	2010-11-05	4358	\N	27155	\N
270617	GENERIC_DAY	20	2	f	2010-10-15	4350	\N	27155	\N
270618	GENERIC_DAY	20	2	f	2010-10-26	4350	\N	27155	\N
270619	GENERIC_DAY	20	2	f	2010-10-29	4350	\N	27155	\N
270620	GENERIC_DAY	20	2	f	2010-10-28	4358	\N	27155	\N
270621	GENERIC_DAY	20	2	f	2010-10-26	4358	\N	27155	\N
270622	GENERIC_DAY	20	2	f	2010-10-15	4358	\N	27155	\N
270623	GENERIC_DAY	20	2	f	2010-10-22	4348	\N	27155	\N
270624	GENERIC_DAY	20	2	f	2010-10-27	4350	\N	27155	\N
270625	GENERIC_DAY	20	2	f	2010-10-25	4348	\N	27155	\N
270626	GENERIC_DAY	20	2	f	2010-11-01	4344	\N	27155	\N
270627	GENERIC_DAY	20	0	f	2010-10-30	4358	\N	27155	\N
270628	GENERIC_DAY	20	2	f	2010-10-29	4344	\N	27155	\N
270629	GENERIC_DAY	20	2	f	2010-11-02	4358	\N	27155	\N
270630	GENERIC_DAY	20	2	f	2010-11-03	4358	\N	27155	\N
270631	GENERIC_DAY	20	0	f	2010-11-07	4344	\N	27155	\N
270632	GENERIC_DAY	19	0	f	2010-11-14	4350	\N	27156	\N
270633	GENERIC_DAY	19	2	f	2010-12-03	4358	\N	27156	\N
270634	GENERIC_DAY	19	2	f	2010-12-07	4344	\N	27156	\N
270635	GENERIC_DAY	19	2	f	2010-12-13	4350	\N	27156	\N
270636	GENERIC_DAY	19	2	f	2010-12-02	4350	\N	27156	\N
270637	GENERIC_DAY	19	2	f	2010-11-23	4348	\N	27156	\N
270638	GENERIC_DAY	19	2	f	2010-11-11	4358	\N	27156	\N
270639	GENERIC_DAY	19	2	f	2010-12-09	4348	\N	27156	\N
270640	GENERIC_DAY	19	0	f	2010-11-21	4348	\N	27156	\N
270641	GENERIC_DAY	19	2	f	2010-11-09	4350	\N	27156	\N
270642	GENERIC_DAY	19	0	f	2010-12-04	4358	\N	27156	\N
270643	GENERIC_DAY	19	2	f	2010-11-16	4358	\N	27156	\N
270644	GENERIC_DAY	19	2	f	2010-12-08	4348	\N	27156	\N
270645	GENERIC_DAY	19	2	f	2010-12-09	4350	\N	27156	\N
270646	GENERIC_DAY	19	2	f	2010-12-13	4348	\N	27156	\N
270647	GENERIC_DAY	19	2	f	2010-11-29	4350	\N	27156	\N
270648	GENERIC_DAY	19	2	f	2010-12-01	4350	\N	27156	\N
270649	GENERIC_DAY	19	2	f	2010-11-10	4358	\N	27156	\N
270650	GENERIC_DAY	19	0	f	2010-12-12	4344	\N	27156	\N
270651	GENERIC_DAY	19	0	f	2010-12-12	4348	\N	27156	\N
270652	GENERIC_DAY	19	0	f	2010-12-05	4350	\N	27156	\N
270653	GENERIC_DAY	19	2	f	2010-11-24	4344	\N	27156	\N
270654	GENERIC_DAY	19	2	f	2010-11-24	4348	\N	27156	\N
270655	GENERIC_DAY	19	0	f	2010-11-13	4344	\N	27156	\N
270656	GENERIC_DAY	19	2	f	2010-11-19	4348	\N	27156	\N
270657	GENERIC_DAY	19	2	f	2010-12-07	4348	\N	27156	\N
270658	GENERIC_DAY	19	2	f	2010-12-10	4348	\N	27156	\N
270659	GENERIC_DAY	19	2	f	2010-11-30	4358	\N	27156	\N
270660	GENERIC_DAY	19	2	f	2010-11-29	4358	\N	27156	\N
270661	GENERIC_DAY	19	0	f	2010-12-04	4348	\N	27156	\N
270662	GENERIC_DAY	19	0	f	2010-11-14	4358	\N	27156	\N
270663	GENERIC_DAY	19	2	f	2010-11-10	4350	\N	27156	\N
270664	GENERIC_DAY	19	2	f	2010-11-09	4358	\N	27156	\N
270665	GENERIC_DAY	19	2	f	2010-11-17	4344	\N	27156	\N
270666	GENERIC_DAY	19	0	f	2010-11-27	4344	\N	27156	\N
270667	GENERIC_DAY	19	2	f	2010-11-17	4348	\N	27156	\N
270668	GENERIC_DAY	19	0	f	2010-11-13	4348	\N	27156	\N
270669	GENERIC_DAY	19	2	f	2010-12-03	4344	\N	27156	\N
270670	GENERIC_DAY	19	0	f	2010-11-13	4358	\N	27156	\N
270671	GENERIC_DAY	19	2	f	2010-11-16	4350	\N	27156	\N
270672	GENERIC_DAY	19	0	f	2010-12-04	4350	\N	27156	\N
270673	GENERIC_DAY	19	2	f	2010-11-26	4358	\N	27156	\N
270674	GENERIC_DAY	19	2	f	2010-11-15	4348	\N	27156	\N
270675	GENERIC_DAY	19	0	f	2010-12-05	4348	\N	27156	\N
270676	GENERIC_DAY	19	0	f	2010-11-20	4358	\N	27156	\N
270677	GENERIC_DAY	19	0	f	2010-11-14	4348	\N	27156	\N
270678	GENERIC_DAY	19	2	f	2010-11-15	4350	\N	27156	\N
270679	GENERIC_DAY	19	2	f	2010-11-12	4348	\N	27156	\N
270680	GENERIC_DAY	19	2	f	2010-11-18	4348	\N	27156	\N
270681	GENERIC_DAY	19	0	f	2010-11-20	4348	\N	27156	\N
270682	GENERIC_DAY	19	2	f	2010-12-09	4358	\N	27156	\N
270683	GENERIC_DAY	19	0	f	2010-12-11	4344	\N	27156	\N
270684	GENERIC_DAY	19	0	f	2010-12-12	4358	\N	27156	\N
270685	GENERIC_DAY	19	2	f	2010-11-22	4350	\N	27156	\N
270686	GENERIC_DAY	19	2	f	2010-11-30	4344	\N	27156	\N
270687	GENERIC_DAY	19	2	f	2010-11-24	4350	\N	27156	\N
270688	GENERIC_DAY	19	2	f	2010-11-22	4344	\N	27156	\N
270689	GENERIC_DAY	19	2	f	2010-11-17	4350	\N	27156	\N
270690	GENERIC_DAY	19	2	f	2010-11-25	4344	\N	27156	\N
270691	GENERIC_DAY	19	0	f	2010-11-27	4350	\N	27156	\N
270692	GENERIC_DAY	19	2	f	2010-12-06	4344	\N	27156	\N
270693	GENERIC_DAY	19	2	f	2010-11-23	4358	\N	27156	\N
270694	GENERIC_DAY	19	2	f	2010-11-16	4344	\N	27156	\N
270695	GENERIC_DAY	19	2	f	2010-11-19	4350	\N	27156	\N
270696	GENERIC_DAY	19	2	f	2010-12-13	4344	\N	27156	\N
270697	GENERIC_DAY	19	2	f	2010-11-15	4344	\N	27156	\N
270698	GENERIC_DAY	19	2	f	2010-12-10	4344	\N	27156	\N
270699	GENERIC_DAY	19	2	f	2010-11-22	4348	\N	27156	\N
270700	GENERIC_DAY	19	0	f	2010-11-27	4348	\N	27156	\N
270701	GENERIC_DAY	19	0	f	2010-11-14	4344	\N	27156	\N
270702	GENERIC_DAY	19	2	f	2010-11-09	4348	\N	27156	\N
270703	GENERIC_DAY	19	2	f	2010-11-10	4348	\N	27156	\N
270704	GENERIC_DAY	19	0	f	2010-11-21	4358	\N	27156	\N
270705	GENERIC_DAY	19	2	f	2010-11-25	4358	\N	27156	\N
270706	GENERIC_DAY	19	2	f	2010-11-12	4350	\N	27156	\N
270707	GENERIC_DAY	19	2	f	2010-12-07	4350	\N	27156	\N
270708	GENERIC_DAY	19	2	f	2010-12-02	4348	\N	27156	\N
270709	GENERIC_DAY	19	0	f	2010-12-11	4358	\N	27156	\N
270710	GENERIC_DAY	19	2	f	2010-11-10	4344	\N	27156	\N
270711	GENERIC_DAY	19	0	f	2010-11-20	4350	\N	27156	\N
270712	GENERIC_DAY	19	0	f	2010-12-12	4350	\N	27156	\N
270713	GENERIC_DAY	19	2	f	2010-11-15	4358	\N	27156	\N
270714	GENERIC_DAY	19	0	f	2010-11-28	4344	\N	27156	\N
270715	GENERIC_DAY	19	2	f	2010-11-09	4344	\N	27156	\N
270716	GENERIC_DAY	19	2	f	2010-12-13	4358	\N	27156	\N
270717	GENERIC_DAY	19	2	f	2010-11-29	4344	\N	27156	\N
270718	GENERIC_DAY	19	0	f	2010-12-05	4344	\N	27156	\N
270719	GENERIC_DAY	19	2	f	2010-12-09	4344	\N	27156	\N
270720	GENERIC_DAY	19	0	f	2010-11-13	4350	\N	27156	\N
270721	GENERIC_DAY	19	2	f	2010-11-12	4358	\N	27156	\N
270722	GENERIC_DAY	19	2	f	2010-12-07	4358	\N	27156	\N
270723	GENERIC_DAY	19	0	f	2010-12-11	4348	\N	27156	\N
270724	GENERIC_DAY	19	2	f	2010-12-10	4358	\N	27156	\N
270725	GENERIC_DAY	19	2	f	2010-12-03	4350	\N	27156	\N
270726	GENERIC_DAY	19	2	f	2010-12-06	4348	\N	27156	\N
270727	GENERIC_DAY	19	2	f	2010-11-30	4350	\N	27156	\N
270728	GENERIC_DAY	19	0	f	2010-11-21	4350	\N	27156	\N
270729	GENERIC_DAY	19	0	f	2010-11-28	4348	\N	27156	\N
270730	GENERIC_DAY	19	2	f	2010-11-23	4350	\N	27156	\N
270731	GENERIC_DAY	19	2	f	2010-11-11	4348	\N	27156	\N
270732	GENERIC_DAY	19	2	f	2010-11-11	4344	\N	27156	\N
270733	GENERIC_DAY	19	2	f	2010-11-23	4344	\N	27156	\N
270734	GENERIC_DAY	19	2	f	2010-12-01	4348	\N	27156	\N
270735	GENERIC_DAY	19	2	f	2010-11-26	4344	\N	27156	\N
270736	GENERIC_DAY	19	2	f	2010-11-24	4358	\N	27156	\N
270737	GENERIC_DAY	19	0	f	2010-11-28	4358	\N	27156	\N
270738	GENERIC_DAY	19	0	f	2010-12-04	4344	\N	27156	\N
270739	GENERIC_DAY	19	2	f	2010-12-06	4350	\N	27156	\N
270740	GENERIC_DAY	19	2	f	2010-12-01	4358	\N	27156	\N
270741	GENERIC_DAY	19	0	f	2010-11-28	4350	\N	27156	\N
270742	GENERIC_DAY	19	2	f	2010-11-19	4344	\N	27156	\N
270743	GENERIC_DAY	19	2	f	2010-11-26	4350	\N	27156	\N
270744	GENERIC_DAY	19	2	f	2010-11-18	4358	\N	27156	\N
270745	GENERIC_DAY	19	0	f	2010-12-05	4358	\N	27156	\N
270746	GENERIC_DAY	19	2	f	2010-11-25	4350	\N	27156	\N
270747	GENERIC_DAY	19	2	f	2010-12-10	4350	\N	27156	\N
270748	GENERIC_DAY	19	0	f	2010-11-20	4344	\N	27156	\N
270749	GENERIC_DAY	19	2	f	2010-11-29	4348	\N	27156	\N
270750	GENERIC_DAY	19	2	f	2010-11-12	4344	\N	27156	\N
270751	GENERIC_DAY	19	2	f	2010-12-02	4358	\N	27156	\N
270752	GENERIC_DAY	19	2	f	2010-12-01	4344	\N	27156	\N
270753	GENERIC_DAY	19	2	f	2010-11-25	4348	\N	27156	\N
270754	GENERIC_DAY	19	2	f	2010-12-03	4348	\N	27156	\N
270755	GENERIC_DAY	19	0	f	2010-12-11	4350	\N	27156	\N
270756	GENERIC_DAY	19	0	f	2010-11-27	4358	\N	27156	\N
270757	GENERIC_DAY	19	2	f	2010-11-18	4350	\N	27156	\N
270758	GENERIC_DAY	19	2	f	2010-12-08	4350	\N	27156	\N
270759	GENERIC_DAY	19	2	f	2010-11-11	4350	\N	27156	\N
270760	GENERIC_DAY	19	0	f	2010-11-21	4344	\N	27156	\N
270761	GENERIC_DAY	19	2	f	2010-12-06	4358	\N	27156	\N
270762	GENERIC_DAY	19	2	f	2010-11-16	4348	\N	27156	\N
270763	GENERIC_DAY	19	2	f	2010-11-22	4358	\N	27156	\N
270764	GENERIC_DAY	19	2	f	2010-11-26	4348	\N	27156	\N
270765	GENERIC_DAY	19	2	f	2010-12-08	4344	\N	27156	\N
270766	GENERIC_DAY	19	2	f	2010-12-02	4344	\N	27156	\N
270767	GENERIC_DAY	19	2	f	2010-11-18	4344	\N	27156	\N
270768	GENERIC_DAY	19	2	f	2010-11-30	4348	\N	27156	\N
270769	GENERIC_DAY	19	2	f	2010-12-08	4358	\N	27156	\N
270770	GENERIC_DAY	19	2	f	2010-11-19	4358	\N	27156	\N
270771	GENERIC_DAY	19	2	f	2010-11-17	4358	\N	27156	\N
270882	SPECIFIC_DAY	19	0	f	2010-07-24	4344	31227	\N	\N
270883	SPECIFIC_DAY	19	8	f	2010-07-20	4344	31227	\N	\N
270884	SPECIFIC_DAY	19	8	f	2010-07-21	4344	31227	\N	\N
270885	SPECIFIC_DAY	19	8	f	2010-07-12	4344	31227	\N	\N
270886	SPECIFIC_DAY	19	8	f	2010-07-23	4344	31227	\N	\N
270887	SPECIFIC_DAY	19	0	f	2010-07-18	4344	31227	\N	\N
270888	SPECIFIC_DAY	19	8	f	2010-08-02	4344	31227	\N	\N
270889	SPECIFIC_DAY	19	0	f	2010-07-25	4344	31227	\N	\N
270890	SPECIFIC_DAY	19	8	f	2010-08-03	4344	31227	\N	\N
270891	SPECIFIC_DAY	19	0	f	2010-07-10	4344	31227	\N	\N
270892	SPECIFIC_DAY	19	8	f	2010-08-13	4344	31227	\N	\N
270893	SPECIFIC_DAY	19	8	f	2010-08-06	4344	31227	\N	\N
270894	SPECIFIC_DAY	19	8	f	2010-07-28	4344	31227	\N	\N
270895	SPECIFIC_DAY	19	8	f	2010-08-12	4344	31227	\N	\N
270896	SPECIFIC_DAY	19	8	f	2010-08-04	4344	31227	\N	\N
270897	SPECIFIC_DAY	19	8	f	2010-07-13	4344	31227	\N	\N
270898	SPECIFIC_DAY	19	0	f	2010-07-17	4344	31227	\N	\N
270899	SPECIFIC_DAY	19	0	f	2010-08-08	4344	31227	\N	\N
270900	SPECIFIC_DAY	19	0	f	2010-08-01	4344	31227	\N	\N
270901	SPECIFIC_DAY	19	0	f	2010-08-07	4344	31227	\N	\N
270902	SPECIFIC_DAY	19	8	f	2010-07-14	4344	31227	\N	\N
270903	SPECIFIC_DAY	19	8	f	2010-08-10	4344	31227	\N	\N
270904	SPECIFIC_DAY	19	8	f	2010-07-15	4344	31227	\N	\N
270905	SPECIFIC_DAY	19	8	f	2010-07-16	4344	31227	\N	\N
270906	SPECIFIC_DAY	19	8	f	2010-07-30	4344	31227	\N	\N
270907	SPECIFIC_DAY	19	8	f	2010-07-22	4344	31227	\N	\N
270908	SPECIFIC_DAY	19	8	f	2010-07-19	4344	31227	\N	\N
270909	SPECIFIC_DAY	19	8	f	2010-07-26	4344	31227	\N	\N
270910	SPECIFIC_DAY	19	8	f	2010-08-11	4344	31227	\N	\N
270911	SPECIFIC_DAY	19	0	f	2010-07-11	4344	31227	\N	\N
270912	SPECIFIC_DAY	19	8	f	2010-07-29	4344	31227	\N	\N
270913	SPECIFIC_DAY	19	8	f	2010-08-05	4344	31227	\N	\N
270914	SPECIFIC_DAY	19	0	f	2010-07-31	4344	31227	\N	\N
270915	SPECIFIC_DAY	19	8	f	2010-07-27	4344	31227	\N	\N
270916	SPECIFIC_DAY	19	8	f	2010-08-09	4344	31227	\N	\N
270929	SPECIFIC_DAY	19	0	f	2010-07-03	4350	31226	\N	\N
270930	SPECIFIC_DAY	19	0	f	2010-06-26	4350	31226	\N	\N
270931	SPECIFIC_DAY	19	8	f	2010-06-22	4350	31226	\N	\N
270932	SPECIFIC_DAY	19	8	f	2010-06-17	4350	31226	\N	\N
270933	SPECIFIC_DAY	19	8	f	2010-06-28	4350	31226	\N	\N
270934	SPECIFIC_DAY	19	8	f	2010-06-14	4350	31226	\N	\N
270935	SPECIFIC_DAY	19	0	f	2010-06-21	4350	31226	\N	\N
270936	SPECIFIC_DAY	19	8	f	2010-06-30	4350	31226	\N	\N
270937	SPECIFIC_DAY	19	8	f	2010-07-08	4350	31226	\N	\N
270938	SPECIFIC_DAY	19	0	f	2010-06-19	4350	31226	\N	\N
270939	SPECIFIC_DAY	19	8	f	2010-06-15	4350	31226	\N	\N
270940	SPECIFIC_DAY	19	0	f	2010-06-27	4350	31226	\N	\N
270941	SPECIFIC_DAY	19	8	f	2010-07-06	4350	31226	\N	\N
270942	SPECIFIC_DAY	19	8	f	2010-06-25	4350	31226	\N	\N
270943	SPECIFIC_DAY	19	8	f	2010-07-01	4350	31226	\N	\N
270944	SPECIFIC_DAY	19	8	f	2010-06-23	4350	31226	\N	\N
270945	SPECIFIC_DAY	19	0	f	2010-07-04	4350	31226	\N	\N
270946	SPECIFIC_DAY	19	8	f	2010-06-18	4350	31226	\N	\N
270947	SPECIFIC_DAY	19	8	f	2010-06-24	4350	31226	\N	\N
270948	SPECIFIC_DAY	19	6	f	2010-07-09	4350	31226	\N	\N
270949	SPECIFIC_DAY	19	8	f	2010-07-02	4350	31226	\N	\N
270950	SPECIFIC_DAY	19	8	f	2010-06-16	4350	31226	\N	\N
270951	SPECIFIC_DAY	19	8	f	2010-07-07	4350	31226	\N	\N
270952	SPECIFIC_DAY	19	8	f	2010-07-05	4350	31226	\N	\N
270953	SPECIFIC_DAY	19	8	f	2010-06-29	4350	31226	\N	\N
270954	SPECIFIC_DAY	19	0	f	2010-06-20	4350	31226	\N	\N
271130	GENERIC_DAY	18	1	f	2010-08-19	21817	\N	27157	\N
271131	GENERIC_DAY	18	1	f	2010-08-20	240482	\N	27157	\N
271132	GENERIC_DAY	18	0	f	2010-08-14	4348	\N	27157	\N
271133	GENERIC_DAY	18	0	f	2010-08-18	4354	\N	27157	\N
271134	GENERIC_DAY	18	0	f	2010-08-15	4344	\N	27157	\N
271135	GENERIC_DAY	18	0	f	2010-08-23	1214	\N	27157	\N
271136	GENERIC_DAY	18	0	f	2010-08-25	4344	\N	27157	\N
271137	GENERIC_DAY	18	0	f	2010-08-15	240484	\N	27157	\N
271138	GENERIC_DAY	18	0	f	2010-08-16	4350	\N	27157	\N
271139	GENERIC_DAY	18	5	f	2010-08-18	240484	\N	27157	\N
271140	GENERIC_DAY	18	0	f	2010-08-15	1216	\N	27157	\N
271141	GENERIC_DAY	18	0	f	2010-08-21	4358	\N	27157	\N
271142	GENERIC_DAY	18	0	f	2010-08-21	1216	\N	27157	\N
271143	GENERIC_DAY	18	0	f	2010-08-25	4348	\N	27157	\N
271144	GENERIC_DAY	18	0	f	2010-08-20	4354	\N	27157	\N
271145	GENERIC_DAY	18	0	f	2010-08-25	4358	\N	27157	\N
271146	GENERIC_DAY	18	0	f	2010-08-14	4350	\N	27157	\N
271147	GENERIC_DAY	18	0	f	2010-08-25	4354	\N	27157	\N
271148	GENERIC_DAY	18	0	f	2010-08-20	1214	\N	27157	\N
271149	GENERIC_DAY	18	0	f	2010-08-17	4354	\N	27157	\N
271150	GENERIC_DAY	18	0	f	2010-08-22	1216	\N	27157	\N
271151	GENERIC_DAY	18	0	f	2010-08-24	1216	\N	27157	\N
271152	GENERIC_DAY	18	0	f	2010-08-21	4348	\N	27157	\N
271153	GENERIC_DAY	18	0	f	2010-08-15	21817	\N	27157	\N
271154	GENERIC_DAY	18	0	f	2010-08-18	4358	\N	27157	\N
271155	GENERIC_DAY	18	0	f	2010-08-16	1214	\N	27157	\N
271156	GENERIC_DAY	18	0	f	2010-08-17	4352	\N	27157	\N
271157	GENERIC_DAY	18	0	f	2010-08-22	1220	\N	27157	\N
271158	GENERIC_DAY	18	0	f	2010-08-19	4358	\N	27157	\N
271159	GENERIC_DAY	18	0	f	2010-08-25	1216	\N	27157	\N
271160	GENERIC_DAY	18	0	f	2010-08-17	1216	\N	27157	\N
271161	GENERIC_DAY	18	0	f	2010-08-17	4350	\N	27157	\N
271162	GENERIC_DAY	18	1	f	2010-08-16	240482	\N	27157	\N
271163	GENERIC_DAY	18	0	f	2010-08-22	1214	\N	27157	\N
271164	GENERIC_DAY	18	0	f	2010-08-19	1216	\N	27157	\N
271165	GENERIC_DAY	18	0	f	2010-08-19	1220	\N	27157	\N
271166	GENERIC_DAY	18	0	f	2010-08-15	1220	\N	27157	\N
271167	GENERIC_DAY	18	1	f	2010-08-23	21817	\N	27157	\N
271168	GENERIC_DAY	18	0	f	2010-08-23	4358	\N	27157	\N
271169	GENERIC_DAY	18	0	f	2010-08-15	240482	\N	27157	\N
271170	GENERIC_DAY	18	0	f	2010-08-14	4356	\N	27157	\N
271171	GENERIC_DAY	18	0	f	2010-08-21	4356	\N	27157	\N
271172	GENERIC_DAY	18	0	f	2010-08-24	4358	\N	27157	\N
271173	GENERIC_DAY	18	0	f	2010-08-15	4352	\N	27157	\N
271174	GENERIC_DAY	18	0	f	2010-08-21	21817	\N	27157	\N
271175	GENERIC_DAY	18	0	f	2010-08-24	1220	\N	27157	\N
271176	GENERIC_DAY	18	0	f	2010-08-22	21817	\N	27157	\N
271177	GENERIC_DAY	18	0	f	2010-08-25	4356	\N	27157	\N
271178	GENERIC_DAY	18	0	f	2010-08-20	4352	\N	27157	\N
271179	GENERIC_DAY	18	0	f	2010-08-22	4350	\N	27157	\N
271180	GENERIC_DAY	18	0	f	2010-08-14	240482	\N	27157	\N
271181	GENERIC_DAY	18	5	f	2010-08-19	240484	\N	27157	\N
271182	GENERIC_DAY	18	0	f	2010-08-17	4348	\N	27157	\N
271183	GENERIC_DAY	18	0	f	2010-08-23	1216	\N	27157	\N
271184	GENERIC_DAY	18	0	f	2010-08-14	4352	\N	27157	\N
271185	GENERIC_DAY	18	0	f	2010-08-21	240482	\N	27157	\N
271186	GENERIC_DAY	18	0	f	2010-08-23	4348	\N	27157	\N
271187	GENERIC_DAY	18	0	f	2010-08-24	4350	\N	27157	\N
271188	GENERIC_DAY	18	5	f	2010-08-16	240484	\N	27157	\N
271189	GENERIC_DAY	18	1	f	2010-08-19	240482	\N	27157	\N
271190	GENERIC_DAY	18	0	f	2010-08-14	1214	\N	27157	\N
271191	GENERIC_DAY	18	0	f	2010-08-16	4348	\N	27157	\N
271192	GENERIC_DAY	18	0	f	2010-08-17	4356	\N	27157	\N
271193	GENERIC_DAY	18	0	f	2010-08-24	4352	\N	27157	\N
271194	GENERIC_DAY	18	0	f	2010-08-14	1220	\N	27157	\N
271195	GENERIC_DAY	18	0	f	2010-08-18	4356	\N	27157	\N
271196	GENERIC_DAY	18	5	f	2010-08-20	240484	\N	27157	\N
271197	GENERIC_DAY	18	0	f	2010-08-20	4344	\N	27157	\N
271198	GENERIC_DAY	18	0	f	2010-08-15	4354	\N	27157	\N
271199	GENERIC_DAY	18	0	f	2010-08-23	4354	\N	27157	\N
271200	GENERIC_DAY	18	0	f	2010-08-23	4352	\N	27157	\N
271201	GENERIC_DAY	18	1	f	2010-08-20	21817	\N	27157	\N
271202	GENERIC_DAY	18	1	f	2010-08-17	21817	\N	27157	\N
271203	GENERIC_DAY	18	0	f	2010-08-22	4358	\N	27157	\N
271204	GENERIC_DAY	18	1	f	2010-08-18	240482	\N	27157	\N
271205	GENERIC_DAY	18	0	f	2010-08-14	4354	\N	27157	\N
271206	GENERIC_DAY	18	0	f	2010-08-16	1220	\N	27157	\N
271207	GENERIC_DAY	18	0	f	2010-08-24	4354	\N	27157	\N
271208	GENERIC_DAY	18	0	f	2010-08-17	1214	\N	27157	\N
271209	GENERIC_DAY	18	0	f	2010-08-15	4348	\N	27157	\N
271210	GENERIC_DAY	18	0	f	2010-08-24	4344	\N	27157	\N
271211	GENERIC_DAY	18	0	f	2010-08-20	1220	\N	27157	\N
271212	GENERIC_DAY	18	0	f	2010-08-24	4348	\N	27157	\N
271213	GENERIC_DAY	18	0	f	2010-08-19	4356	\N	27157	\N
271214	GENERIC_DAY	18	0	f	2010-08-20	4358	\N	27157	\N
271215	GENERIC_DAY	18	0	f	2010-08-15	1214	\N	27157	\N
271216	GENERIC_DAY	18	0	f	2010-08-22	4348	\N	27157	\N
271217	GENERIC_DAY	18	0	f	2010-08-21	240484	\N	27157	\N
271218	GENERIC_DAY	18	0	f	2010-08-15	4356	\N	27157	\N
271219	GENERIC_DAY	18	0	f	2010-08-14	4358	\N	27157	\N
271220	GENERIC_DAY	18	0	f	2010-08-21	4352	\N	27157	\N
271221	GENERIC_DAY	18	0	f	2010-08-22	4344	\N	27157	\N
271222	GENERIC_DAY	18	0	f	2010-08-18	1216	\N	27157	\N
271223	GENERIC_DAY	18	0	f	2010-08-25	4352	\N	27157	\N
271224	GENERIC_DAY	18	0	f	2010-08-19	1214	\N	27157	\N
271225	GENERIC_DAY	18	5	f	2010-08-17	240484	\N	27157	\N
271226	GENERIC_DAY	18	0	f	2010-08-18	4352	\N	27157	\N
271227	GENERIC_DAY	18	0	f	2010-08-22	240484	\N	27157	\N
271228	GENERIC_DAY	18	1	f	2010-08-24	240482	\N	27157	\N
271229	GENERIC_DAY	18	1	f	2010-08-18	21817	\N	27157	\N
271230	GENERIC_DAY	18	0	f	2010-08-14	4344	\N	27157	\N
271231	GENERIC_DAY	18	1	f	2010-08-25	240482	\N	27157	\N
271232	GENERIC_DAY	18	0	f	2010-08-22	4354	\N	27157	\N
271233	GENERIC_DAY	18	0	f	2010-08-18	4348	\N	27157	\N
271234	GENERIC_DAY	18	0	f	2010-08-14	1216	\N	27157	\N
271235	GENERIC_DAY	18	0	f	2010-08-23	4356	\N	27157	\N
271236	GENERIC_DAY	18	0	f	2010-08-25	1220	\N	27157	\N
271237	GENERIC_DAY	18	0	f	2010-08-20	4350	\N	27157	\N
271238	GENERIC_DAY	18	1	f	2010-08-24	21817	\N	27157	\N
271239	GENERIC_DAY	18	0	f	2010-08-23	1220	\N	27157	\N
271240	GENERIC_DAY	18	0	f	2010-08-21	1220	\N	27157	\N
271241	GENERIC_DAY	18	0	f	2010-08-16	4358	\N	27157	\N
271242	GENERIC_DAY	18	0	f	2010-08-19	4348	\N	27157	\N
271243	GENERIC_DAY	18	0	f	2010-08-21	4354	\N	27157	\N
271244	GENERIC_DAY	18	0	f	2010-08-16	4344	\N	27157	\N
271245	GENERIC_DAY	18	0	f	2010-08-20	4356	\N	27157	\N
271246	GENERIC_DAY	18	0	f	2010-08-19	4352	\N	27157	\N
271247	GENERIC_DAY	18	0	f	2010-08-15	4350	\N	27157	\N
271248	GENERIC_DAY	18	0	f	2010-08-22	4352	\N	27157	\N
271249	GENERIC_DAY	18	0	f	2010-08-24	4356	\N	27157	\N
271250	GENERIC_DAY	18	0	f	2010-08-22	4356	\N	27157	\N
271251	GENERIC_DAY	18	0	f	2010-08-23	4350	\N	27157	\N
271252	GENERIC_DAY	18	0	f	2010-08-17	4358	\N	27157	\N
271253	GENERIC_DAY	18	5	f	2010-08-23	240484	\N	27157	\N
271254	GENERIC_DAY	18	0	f	2010-08-18	1214	\N	27157	\N
271255	GENERIC_DAY	18	1	f	2010-08-25	240484	\N	27157	\N
271256	GENERIC_DAY	18	0	f	2010-08-19	4354	\N	27157	\N
271257	GENERIC_DAY	18	0	f	2010-08-14	240484	\N	27157	\N
271258	GENERIC_DAY	18	0	f	2010-08-17	1220	\N	27157	\N
271259	GENERIC_DAY	18	0	f	2010-08-19	4350	\N	27157	\N
271260	GENERIC_DAY	18	0	f	2010-08-16	1216	\N	27157	\N
271261	GENERIC_DAY	18	1	f	2010-08-16	21817	\N	27157	\N
271262	GENERIC_DAY	18	1	f	2010-08-17	240482	\N	27157	\N
271263	GENERIC_DAY	18	0	f	2010-08-23	4344	\N	27157	\N
271264	GENERIC_DAY	18	0	f	2010-08-21	1214	\N	27157	\N
271265	GENERIC_DAY	18	0	f	2010-08-15	4358	\N	27157	\N
271266	GENERIC_DAY	18	0	f	2010-08-25	4350	\N	27157	\N
271267	GENERIC_DAY	18	0	f	2010-08-20	4348	\N	27157	\N
271268	GENERIC_DAY	18	0	f	2010-08-14	21817	\N	27157	\N
271269	GENERIC_DAY	18	0	f	2010-08-25	1214	\N	27157	\N
271270	GENERIC_DAY	18	1	f	2010-08-23	240482	\N	27157	\N
271271	GENERIC_DAY	18	0	f	2010-08-16	4356	\N	27157	\N
271272	GENERIC_DAY	18	0	f	2010-08-18	4350	\N	27157	\N
271273	GENERIC_DAY	18	0	f	2010-08-18	1220	\N	27157	\N
271274	GENERIC_DAY	18	0	f	2010-08-16	4354	\N	27157	\N
271275	GENERIC_DAY	18	1	f	2010-08-25	21817	\N	27157	\N
271276	GENERIC_DAY	18	0	f	2010-08-17	4344	\N	27157	\N
271277	GENERIC_DAY	18	5	f	2010-08-24	240484	\N	27157	\N
271278	GENERIC_DAY	18	0	f	2010-08-18	4344	\N	27157	\N
271279	GENERIC_DAY	18	0	f	2010-08-21	4344	\N	27157	\N
271280	GENERIC_DAY	18	0	f	2010-08-20	1216	\N	27157	\N
271281	GENERIC_DAY	18	0	f	2010-08-21	4350	\N	27157	\N
271282	GENERIC_DAY	18	0	f	2010-08-22	240482	\N	27157	\N
271283	GENERIC_DAY	18	0	f	2010-08-19	4344	\N	27157	\N
271284	GENERIC_DAY	18	0	f	2010-08-16	4352	\N	27157	\N
271285	GENERIC_DAY	18	0	f	2010-08-24	1214	\N	27157	\N
271632	SPECIFIC_DAY	18	6	f	2010-08-17	4348	31228	\N	\N
271633	SPECIFIC_DAY	18	6	f	2010-08-18	4348	31228	\N	\N
271634	SPECIFIC_DAY	18	6	f	2010-08-24	4348	31228	\N	\N
271635	SPECIFIC_DAY	18	0	f	2010-08-15	4348	31228	\N	\N
271636	SPECIFIC_DAY	18	0	f	2010-08-21	4348	31228	\N	\N
271637	SPECIFIC_DAY	18	0	f	2010-08-22	4348	31228	\N	\N
271638	SPECIFIC_DAY	18	6	f	2010-08-20	4348	31228	\N	\N
271639	SPECIFIC_DAY	18	6	f	2010-08-16	4348	31228	\N	\N
271640	SPECIFIC_DAY	18	6	f	2010-08-23	4348	31228	\N	\N
271641	SPECIFIC_DAY	18	0	f	2010-08-14	4348	31228	\N	\N
271642	SPECIFIC_DAY	18	6	f	2010-08-19	4348	31228	\N	\N
271643	SPECIFIC_DAY	18	6	f	2010-08-25	4348	31228	\N	\N
271644	SPECIFIC_DAY	18	8	f	2011-02-04	1220	31230	\N	\N
271645	SPECIFIC_DAY	18	4	f	2011-02-14	1220	31230	\N	\N
271646	SPECIFIC_DAY	18	8	f	2011-02-07	1220	31230	\N	\N
271647	SPECIFIC_DAY	18	8	f	2011-01-31	1220	31230	\N	\N
271648	SPECIFIC_DAY	18	0	f	2011-01-29	1220	31230	\N	\N
271649	SPECIFIC_DAY	18	8	f	2011-02-09	1220	31230	\N	\N
271650	SPECIFIC_DAY	18	0	f	2011-02-12	1220	31230	\N	\N
271651	SPECIFIC_DAY	18	0	f	2011-01-26	1220	31230	\N	\N
271652	SPECIFIC_DAY	18	8	f	2011-02-01	1220	31230	\N	\N
271653	SPECIFIC_DAY	18	0	f	2011-02-05	1220	31230	\N	\N
271654	SPECIFIC_DAY	18	0	f	2011-02-13	1220	31230	\N	\N
271655	SPECIFIC_DAY	18	8	f	2011-02-02	1220	31230	\N	\N
271656	SPECIFIC_DAY	18	0	f	2011-02-06	1220	31230	\N	\N
271657	SPECIFIC_DAY	18	8	f	2011-02-08	1220	31230	\N	\N
271658	SPECIFIC_DAY	18	8	f	2011-02-03	1220	31230	\N	\N
271659	SPECIFIC_DAY	18	8	f	2011-02-10	1220	31230	\N	\N
271660	SPECIFIC_DAY	18	8	f	2011-02-11	1220	31230	\N	\N
271661	SPECIFIC_DAY	18	8	f	2011-01-28	1220	31230	\N	\N
271662	SPECIFIC_DAY	18	8	f	2011-01-27	1220	31230	\N	\N
271663	SPECIFIC_DAY	18	0	f	2011-01-30	1220	31230	\N	\N
271749	SPECIFIC_DAY	18	1	f	2010-07-19	1216	31234	\N	\N
271750	SPECIFIC_DAY	18	8	f	2010-07-12	1216	31234	\N	\N
271751	SPECIFIC_DAY	18	0	f	2010-07-10	1216	31234	\N	\N
271752	SPECIFIC_DAY	18	8	f	2010-07-09	1216	31234	\N	\N
271753	SPECIFIC_DAY	18	0	f	2010-07-04	1216	31234	\N	\N
271754	SPECIFIC_DAY	18	8	f	2010-07-05	1216	31234	\N	\N
271755	SPECIFIC_DAY	18	8	f	2010-07-08	1216	31234	\N	\N
271756	SPECIFIC_DAY	18	8	f	2010-07-14	1216	31234	\N	\N
271757	SPECIFIC_DAY	18	0	f	2010-07-03	1216	31234	\N	\N
271758	SPECIFIC_DAY	18	0	f	2010-07-11	1216	31234	\N	\N
271759	SPECIFIC_DAY	18	8	f	2010-07-16	1216	31234	\N	\N
271760	SPECIFIC_DAY	18	0	f	2010-07-17	1216	31234	\N	\N
271761	SPECIFIC_DAY	18	4	f	2010-06-30	1216	31234	\N	\N
271762	SPECIFIC_DAY	18	0	f	2010-07-18	1216	31234	\N	\N
271763	SPECIFIC_DAY	18	8	f	2010-07-15	1216	31234	\N	\N
271764	SPECIFIC_DAY	18	8	f	2010-07-02	1216	31234	\N	\N
271765	SPECIFIC_DAY	18	8	f	2010-07-07	1216	31234	\N	\N
271766	SPECIFIC_DAY	18	8	f	2010-07-01	1216	31234	\N	\N
271767	SPECIFIC_DAY	18	8	f	2010-07-13	1216	31234	\N	\N
271768	SPECIFIC_DAY	18	8	f	2010-07-06	1216	31234	\N	\N
271769	SPECIFIC_DAY	18	0	f	2010-09-19	1216	31231	\N	\N
271770	SPECIFIC_DAY	18	4	f	2010-09-08	1216	31231	\N	\N
271771	SPECIFIC_DAY	18	8	f	2010-09-15	1216	31231	\N	\N
271772	SPECIFIC_DAY	18	8	f	2010-09-20	1216	31231	\N	\N
271773	SPECIFIC_DAY	18	0	f	2010-09-18	1216	31231	\N	\N
271774	SPECIFIC_DAY	18	8	f	2010-09-13	1216	31231	\N	\N
271775	SPECIFIC_DAY	18	8	f	2010-09-10	1216	31231	\N	\N
271776	SPECIFIC_DAY	18	8	f	2010-09-21	1216	31231	\N	\N
271777	SPECIFIC_DAY	18	8	f	2010-09-14	1216	31231	\N	\N
271778	SPECIFIC_DAY	18	8	f	2010-09-16	1216	31231	\N	\N
271779	SPECIFIC_DAY	18	8	f	2010-09-23	1216	31231	\N	\N
271780	SPECIFIC_DAY	18	8	f	2010-09-09	1216	31231	\N	\N
271781	SPECIFIC_DAY	18	8	f	2010-09-17	1216	31231	\N	\N
271718	SPECIFIC_DAY	19	8	f	2010-10-04	1216	31229	\N	\N
271716	SPECIFIC_DAY	19	8	f	2010-10-12	1216	31229	\N	\N
271725	SPECIFIC_DAY	19	8	f	2010-10-13	1216	31229	\N	\N
271726	SPECIFIC_DAY	19	8	f	2010-10-01	1216	31229	\N	\N
271720	SPECIFIC_DAY	19	4	f	2010-09-27	1216	31229	\N	\N
271719	SPECIFIC_DAY	19	8	f	2010-10-07	1216	31229	\N	\N
271727	SPECIFIC_DAY	19	8	f	2010-09-28	1216	31229	\N	\N
271722	SPECIFIC_DAY	19	8	f	2010-10-08	1216	31229	\N	\N
271723	SPECIFIC_DAY	19	8	f	2010-09-29	1216	31229	\N	\N
271717	SPECIFIC_DAY	19	8	f	2010-09-30	1216	31229	\N	\N
271728	SPECIFIC_DAY	19	8	f	2010-10-05	1216	31229	\N	\N
271724	SPECIFIC_DAY	19	8	f	2010-10-06	1216	31229	\N	\N
271721	SPECIFIC_DAY	19	8	f	2010-10-11	1216	31229	\N	\N
271782	SPECIFIC_DAY	18	8	f	2010-09-24	1216	31231	\N	\N
271783	SPECIFIC_DAY	18	8	f	2010-09-22	1216	31231	\N	\N
271784	SPECIFIC_DAY	18	0	f	2010-09-11	1216	31231	\N	\N
271785	SPECIFIC_DAY	18	0	f	2010-09-12	1216	31231	\N	\N
271786	GENERIC_DAY	18	8	f	2010-10-08	1220	\N	271791	\N
271787	GENERIC_DAY	18	0	f	2010-10-03	1220	\N	271791	\N
271788	GENERIC_DAY	18	8	f	2010-09-03	1220	\N	271791	\N
271789	GENERIC_DAY	18	0	f	2010-09-18	1220	\N	271791	\N
271790	GENERIC_DAY	18	8	f	2010-10-12	1220	\N	271791	\N
271892	GENERIC_DAY	18	0	f	2010-09-12	1220	\N	271791	\N
271893	GENERIC_DAY	18	0	f	2010-09-19	1220	\N	271791	\N
271894	GENERIC_DAY	18	4	f	2010-10-13	1220	\N	271791	\N
271895	GENERIC_DAY	18	8	f	2010-09-17	1220	\N	271791	\N
271896	GENERIC_DAY	18	8	f	2010-09-14	1220	\N	271791	\N
271897	GENERIC_DAY	18	8	f	2010-09-06	1220	\N	271791	\N
271898	GENERIC_DAY	18	8	f	2010-09-21	1220	\N	271791	\N
271899	GENERIC_DAY	18	0	f	2010-08-29	1220	\N	271791	\N
271900	GENERIC_DAY	18	8	f	2010-09-30	1220	\N	271791	\N
271901	GENERIC_DAY	18	0	f	2010-09-11	1220	\N	271791	\N
271902	GENERIC_DAY	18	8	f	2010-10-01	1220	\N	271791	\N
271903	GENERIC_DAY	18	8	f	2010-08-25	1220	\N	271791	\N
271904	GENERIC_DAY	18	8	f	2010-10-11	1220	\N	271791	\N
271905	GENERIC_DAY	18	8	f	2010-09-27	1220	\N	271791	\N
271906	GENERIC_DAY	18	8	f	2010-09-15	1220	\N	271791	\N
271907	GENERIC_DAY	18	0	f	2010-09-04	1220	\N	271791	\N
271908	GENERIC_DAY	18	0	f	2010-08-22	1220	\N	271791	\N
271909	GENERIC_DAY	18	0	f	2010-10-10	1220	\N	271791	\N
271910	GENERIC_DAY	18	8	f	2010-09-09	1220	\N	271791	\N
271911	GENERIC_DAY	18	8	f	2010-09-01	1220	\N	271791	\N
271912	GENERIC_DAY	18	8	f	2010-10-06	1220	\N	271791	\N
271913	GENERIC_DAY	18	8	f	2010-09-13	1220	\N	271791	\N
271914	GENERIC_DAY	18	0	f	2010-10-09	1220	\N	271791	\N
271915	GENERIC_DAY	18	8	f	2010-08-23	1220	\N	271791	\N
271916	GENERIC_DAY	18	8	f	2010-09-16	1220	\N	271791	\N
271917	GENERIC_DAY	18	8	f	2010-09-08	1220	\N	271791	\N
271918	GENERIC_DAY	18	8	f	2010-09-24	1220	\N	271791	\N
271919	GENERIC_DAY	18	0	f	2010-08-28	1220	\N	271791	\N
271920	GENERIC_DAY	18	0	f	2010-08-20	1220	\N	271791	\N
271921	GENERIC_DAY	18	0	f	2010-09-25	1220	\N	271791	\N
271922	GENERIC_DAY	18	8	f	2010-08-26	1220	\N	271791	\N
271923	GENERIC_DAY	18	8	f	2010-08-31	1220	\N	271791	\N
271924	GENERIC_DAY	18	0	f	2010-10-02	1220	\N	271791	\N
271925	GENERIC_DAY	18	8	f	2010-09-22	1220	\N	271791	\N
271926	GENERIC_DAY	18	0	f	2010-08-21	1220	\N	271791	\N
271927	GENERIC_DAY	18	8	f	2010-08-30	1220	\N	271791	\N
271928	GENERIC_DAY	18	8	f	2010-10-07	1220	\N	271791	\N
271929	GENERIC_DAY	18	8	f	2010-10-04	1220	\N	271791	\N
271930	GENERIC_DAY	18	8	f	2010-09-07	1220	\N	271791	\N
271931	GENERIC_DAY	18	0	f	2010-09-05	1220	\N	271791	\N
271932	GENERIC_DAY	18	8	f	2010-09-29	1220	\N	271791	\N
271933	GENERIC_DAY	18	8	f	2010-09-23	1220	\N	271791	\N
271934	GENERIC_DAY	18	8	f	2010-10-05	1220	\N	271791	\N
271935	GENERIC_DAY	18	0	f	2010-09-26	1220	\N	271791	\N
271936	GENERIC_DAY	18	8	f	2010-09-20	1220	\N	271791	\N
271937	GENERIC_DAY	18	8	f	2010-09-28	1220	\N	271791	\N
271938	GENERIC_DAY	18	8	f	2010-08-27	1220	\N	271791	\N
271939	GENERIC_DAY	18	8	f	2010-09-10	1220	\N	271791	\N
271940	GENERIC_DAY	18	8	f	2010-08-24	1220	\N	271791	\N
271941	GENERIC_DAY	18	8	f	2010-09-02	1220	\N	271791	\N
271942	GENERIC_DAY	17	0	f	2010-06-27	4352	\N	27158	\N
271943	GENERIC_DAY	17	4	t	2010-06-15	4352	\N	27158	\N
271944	GENERIC_DAY	17	7	f	2010-07-15	4354	\N	27158	\N
271945	GENERIC_DAY	17	4	f	2010-06-30	4352	\N	27158	\N
271946	GENERIC_DAY	17	7	f	2010-07-14	4354	\N	27158	\N
271947	GENERIC_DAY	17	2	f	2010-07-20	4352	\N	27158	\N
271948	GENERIC_DAY	17	4	f	2010-06-28	4352	\N	27158	\N
271949	GENERIC_DAY	17	2	f	2010-07-15	4352	\N	27158	\N
271950	GENERIC_DAY	17	4	f	2010-07-06	4354	\N	27158	\N
271951	GENERIC_DAY	17	0	f	2010-07-31	4352	\N	27158	\N
271952	GENERIC_DAY	17	4	t	2010-06-25	4352	\N	27158	\N
271953	GENERIC_DAY	17	0	f	2010-07-04	4352	\N	27158	\N
271954	GENERIC_DAY	17	0	f	2010-07-10	4352	\N	27158	\N
271955	GENERIC_DAY	17	7	f	2010-07-22	4354	\N	27158	\N
271956	GENERIC_DAY	17	0	f	2010-07-11	4354	\N	27158	\N
271957	GENERIC_DAY	17	5	f	2010-07-01	4354	\N	27158	\N
271958	GENERIC_DAY	17	5	f	2010-07-02	4354	\N	27158	\N
271959	GENERIC_DAY	17	7	f	2010-07-21	4354	\N	27158	\N
271960	GENERIC_DAY	17	7	f	2010-07-20	4354	\N	27158	\N
271961	GENERIC_DAY	17	4	t	2010-06-22	4352	\N	27158	\N
271962	GENERIC_DAY	17	5	f	2010-08-03	4352	\N	27158	\N
271963	GENERIC_DAY	17	4	f	2010-07-05	4354	\N	27158	\N
271964	GENERIC_DAY	17	4	t	2010-06-18	4354	\N	27158	\N
271965	GENERIC_DAY	17	4	f	2010-08-02	4354	\N	27158	\N
271966	GENERIC_DAY	17	5	f	2010-07-06	4352	\N	27158	\N
271967	GENERIC_DAY	17	4	f	2010-07-07	4354	\N	27158	\N
271968	GENERIC_DAY	17	2	f	2010-07-19	4352	\N	27158	\N
271969	GENERIC_DAY	17	4	t	2010-06-16	4352	\N	27158	\N
271970	GENERIC_DAY	17	7	f	2010-07-27	4354	\N	27158	\N
271971	GENERIC_DAY	17	0	f	2010-07-10	4354	\N	27158	\N
271972	GENERIC_DAY	17	2	f	2010-07-09	4352	\N	27158	\N
271973	GENERIC_DAY	17	0	f	2010-07-17	4354	\N	27158	\N
271974	GENERIC_DAY	17	0	f	2010-07-03	4354	\N	27158	\N
271975	GENERIC_DAY	17	4	t	2010-06-17	4352	\N	27158	\N
271976	GENERIC_DAY	17	0	t	2010-06-19	4354	\N	27158	\N
271977	GENERIC_DAY	17	0	f	2010-07-03	4352	\N	27158	\N
271978	GENERIC_DAY	17	5	f	2010-07-08	4354	\N	27158	\N
271979	GENERIC_DAY	17	2	f	2010-07-27	4352	\N	27158	\N
271980	GENERIC_DAY	17	7	f	2010-07-26	4354	\N	27158	\N
271981	GENERIC_DAY	17	4	t	2010-06-21	4352	\N	27158	\N
271982	GENERIC_DAY	17	4	f	2010-08-03	4354	\N	27158	\N
271983	GENERIC_DAY	17	2	f	2010-07-14	4352	\N	27158	\N
271984	GENERIC_DAY	17	2	f	2010-07-22	4352	\N	27158	\N
271985	GENERIC_DAY	17	0	f	2010-06-26	4354	\N	27158	\N
271986	GENERIC_DAY	17	5	f	2010-07-07	4352	\N	27158	\N
271987	GENERIC_DAY	17	5	f	2010-08-02	4352	\N	27158	\N
271988	GENERIC_DAY	17	5	f	2010-07-29	4352	\N	27158	\N
271989	GENERIC_DAY	17	4	t	2010-06-24	4352	\N	27158	\N
271990	GENERIC_DAY	17	2	f	2010-07-21	4352	\N	27158	\N
271991	GENERIC_DAY	17	7	f	2010-07-12	4354	\N	27158	\N
271992	GENERIC_DAY	17	0	f	2010-07-18	4352	\N	27158	\N
271993	GENERIC_DAY	17	2	f	2010-08-04	4354	\N	27158	\N
271994	GENERIC_DAY	17	8	t	2010-06-14	4354	\N	27158	\N
271995	GENERIC_DAY	17	0	t	2010-06-20	4352	\N	27158	\N
271996	GENERIC_DAY	17	0	f	2010-07-11	4352	\N	27158	\N
271997	GENERIC_DAY	17	0	f	2010-06-26	4352	\N	27158	\N
271998	GENERIC_DAY	17	5	f	2010-07-05	4352	\N	27158	\N
271999	GENERIC_DAY	17	4	f	2010-07-01	4352	\N	27158	\N
272000	GENERIC_DAY	17	0	t	2010-06-19	4352	\N	27158	\N
272001	GENERIC_DAY	17	3	f	2010-08-04	4352	\N	27158	\N
272002	GENERIC_DAY	17	4	f	2010-07-08	4352	\N	27158	\N
272003	GENERIC_DAY	17	4	t	2010-06-23	4352	\N	27158	\N
272004	GENERIC_DAY	17	0	f	2010-07-18	4354	\N	27158	\N
272005	GENERIC_DAY	17	4	t	2010-06-18	4352	\N	27158	\N
272006	GENERIC_DAY	17	4	f	2010-07-29	4354	\N	27158	\N
272007	GENERIC_DAY	17	5	f	2010-06-30	4354	\N	27158	\N
272008	GENERIC_DAY	17	5	f	2010-07-28	4352	\N	27158	\N
272009	GENERIC_DAY	17	0	f	2010-06-27	4354	\N	27158	\N
272010	GENERIC_DAY	17	4	f	2010-07-30	4354	\N	27158	\N
272011	GENERIC_DAY	17	2	f	2010-07-23	4352	\N	27158	\N
272012	GENERIC_DAY	17	0	f	2010-07-04	4354	\N	27158	\N
272013	GENERIC_DAY	17	5	f	2010-07-30	4352	\N	27158	\N
272014	GENERIC_DAY	17	2	f	2010-07-13	4352	\N	27158	\N
272015	GENERIC_DAY	17	0	f	2010-07-24	4352	\N	27158	\N
272016	GENERIC_DAY	17	0	f	2010-07-24	4354	\N	27158	\N
272017	GENERIC_DAY	17	4	t	2010-06-25	4354	\N	27158	\N
272018	GENERIC_DAY	17	4	t	2010-06-15	4354	\N	27158	\N
272019	GENERIC_DAY	17	0	f	2010-07-31	4354	\N	27158	\N
272020	GENERIC_DAY	17	4	f	2010-07-02	4352	\N	27158	\N
272021	GENERIC_DAY	17	2	f	2010-07-16	4352	\N	27158	\N
272022	GENERIC_DAY	17	7	f	2010-07-19	4354	\N	27158	\N
272023	GENERIC_DAY	17	4	t	2010-06-24	4354	\N	27158	\N
272024	GENERIC_DAY	17	5	f	2010-06-29	4354	\N	27158	\N
272025	GENERIC_DAY	17	4	f	2010-06-29	4352	\N	27158	\N
272026	GENERIC_DAY	17	4	t	2010-06-23	4354	\N	27158	\N
272027	GENERIC_DAY	17	0	t	2010-06-20	4354	\N	27158	\N
272028	GENERIC_DAY	17	4	t	2010-06-17	4354	\N	27158	\N
272029	GENERIC_DAY	17	2	f	2010-07-12	4352	\N	27158	\N
272030	GENERIC_DAY	17	4	f	2010-07-28	4354	\N	27158	\N
272031	GENERIC_DAY	17	0	f	2010-07-17	4352	\N	27158	\N
272032	GENERIC_DAY	17	0	f	2010-07-25	4352	\N	27158	\N
272033	GENERIC_DAY	17	7	f	2010-07-23	4354	\N	27158	\N
272034	GENERIC_DAY	17	4	t	2010-06-22	4354	\N	27158	\N
272035	GENERIC_DAY	17	5	f	2010-06-28	4354	\N	27158	\N
272036	GENERIC_DAY	17	4	t	2010-06-21	4354	\N	27158	\N
272037	GENERIC_DAY	17	0	f	2010-08-01	4354	\N	27158	\N
272038	GENERIC_DAY	17	4	t	2010-06-16	4354	\N	27158	\N
272039	GENERIC_DAY	17	7	f	2010-07-16	4354	\N	27158	\N
272040	GENERIC_DAY	17	0	f	2010-07-25	4354	\N	27158	\N
272041	GENERIC_DAY	17	7	f	2010-07-13	4354	\N	27158	\N
272042	GENERIC_DAY	17	0	f	2010-08-01	4352	\N	27158	\N
272043	GENERIC_DAY	17	7	f	2010-07-09	4354	\N	27158	\N
272044	GENERIC_DAY	17	2	f	2010-07-26	4352	\N	27158	\N
272045	GENERIC_DAY	16	0	f	2010-07-18	4350	\N	27159	\N
272046	GENERIC_DAY	16	4	f	2010-07-26	4350	\N	27159	\N
272047	GENERIC_DAY	16	4	f	2010-07-20	4358	\N	27159	\N
272048	GENERIC_DAY	16	0	t	2010-06-19	4350	\N	27159	\N
272049	GENERIC_DAY	16	5	f	2010-07-30	4348	\N	27159	\N
272050	GENERIC_DAY	16	4	f	2010-07-16	4358	\N	27159	\N
272051	GENERIC_DAY	16	1	f	2010-07-12	4344	\N	27159	\N
272052	GENERIC_DAY	16	0	f	2010-08-02	4344	\N	27159	\N
272053	GENERIC_DAY	16	1	f	2010-07-09	4344	\N	27159	\N
272054	GENERIC_DAY	16	2	t	2010-06-21	4350	\N	27159	\N
272055	GENERIC_DAY	16	2	t	2010-06-15	4358	\N	27159	\N
272056	GENERIC_DAY	16	3	f	2010-07-13	4350	\N	27159	\N
272057	GENERIC_DAY	16	3	f	2010-07-16	4348	\N	27159	\N
272058	GENERIC_DAY	16	4	f	2010-07-22	4358	\N	27159	\N
272059	GENERIC_DAY	16	4	f	2010-07-26	4358	\N	27159	\N
272060	GENERIC_DAY	16	4	f	2010-07-23	4358	\N	27159	\N
272061	GENERIC_DAY	16	0	f	2010-07-10	4358	\N	27159	\N
272062	GENERIC_DAY	16	3	f	2010-07-12	4350	\N	27159	\N
272063	GENERIC_DAY	16	0	f	2010-07-31	4350	\N	27159	\N
272064	GENERIC_DAY	16	2	t	2010-06-22	4350	\N	27159	\N
272065	GENERIC_DAY	16	2	t	2010-06-25	4348	\N	27159	\N
272066	GENERIC_DAY	16	4	f	2010-07-15	4350	\N	27159	\N
272067	GENERIC_DAY	16	2	t	2010-07-06	4344	\N	27159	\N
272068	GENERIC_DAY	16	13	f	2010-07-08	21817	\N	27159	\N
272069	GENERIC_DAY	16	0	f	2010-07-17	4348	\N	27159	\N
272070	GENERIC_DAY	16	0	f	2010-07-10	4348	\N	27159	\N
272071	GENERIC_DAY	16	2	t	2010-06-24	4350	\N	27159	\N
272072	GENERIC_DAY	16	0	f	2010-07-24	4358	\N	27159	\N
272073	GENERIC_DAY	16	3	f	2010-07-12	21817	\N	27159	\N
272074	GENERIC_DAY	16	2	t	2010-06-24	4348	\N	27159	\N
272075	GENERIC_DAY	16	4	f	2010-07-20	4350	\N	27159	\N
272076	GENERIC_DAY	16	0	f	2010-07-24	4348	\N	27159	\N
272077	GENERIC_DAY	16	2	t	2010-07-01	4358	\N	27159	\N
272078	GENERIC_DAY	16	2	t	2010-07-01	4348	\N	27159	\N
272079	GENERIC_DAY	16	2	t	2010-07-05	4350	\N	27159	\N
272080	GENERIC_DAY	16	2	t	2010-06-16	4350	\N	27159	\N
272081	GENERIC_DAY	16	0	f	2010-07-08	4344	\N	27159	\N
272082	GENERIC_DAY	16	0	f	2010-07-08	4348	\N	27159	\N
272083	GENERIC_DAY	16	2	t	2010-06-16	4358	\N	27159	\N
272084	GENERIC_DAY	16	0	f	2010-07-31	4358	\N	27159	\N
272085	GENERIC_DAY	16	0	t	2010-06-20	4348	\N	27159	\N
272086	GENERIC_DAY	16	2	t	2010-06-22	4344	\N	27159	\N
272087	GENERIC_DAY	16	3	f	2010-07-09	4358	\N	27159	\N
272088	GENERIC_DAY	16	2	t	2010-06-30	4344	\N	27159	\N
272089	GENERIC_DAY	16	0	f	2010-07-21	4344	\N	27159	\N
272090	GENERIC_DAY	16	4	f	2010-07-29	4350	\N	27159	\N
272091	GENERIC_DAY	16	0	f	2010-07-28	4344	\N	27159	\N
272092	GENERIC_DAY	16	0	f	2010-07-29	4344	\N	27159	\N
272093	GENERIC_DAY	16	0	f	2010-08-01	4348	\N	27159	\N
272094	GENERIC_DAY	16	2	t	2010-07-02	4348	\N	27159	\N
272095	GENERIC_DAY	16	0	f	2010-07-17	4358	\N	27159	\N
272096	GENERIC_DAY	16	0	f	2010-07-22	4344	\N	27159	\N
272097	GENERIC_DAY	16	2	t	2010-06-16	4348	\N	27159	\N
272098	GENERIC_DAY	16	0	f	2010-07-11	4350	\N	27159	\N
272099	GENERIC_DAY	16	5	f	2010-07-26	4348	\N	27159	\N
272100	GENERIC_DAY	16	4	f	2010-07-28	4350	\N	27159	\N
272101	GENERIC_DAY	16	3	f	2010-07-12	4348	\N	27159	\N
272102	GENERIC_DAY	16	0	t	2010-06-27	4350	\N	27159	\N
272103	GENERIC_DAY	16	2	t	2010-06-17	4348	\N	27159	\N
272104	GENERIC_DAY	16	4	f	2010-07-19	4358	\N	27159	\N
272105	GENERIC_DAY	16	2	t	2010-06-21	4358	\N	27159	\N
272106	GENERIC_DAY	16	2	t	2010-06-18	4358	\N	27159	\N
272107	GENERIC_DAY	16	4	f	2010-07-30	4358	\N	27159	\N
272108	GENERIC_DAY	16	5	f	2010-07-20	4348	\N	27159	\N
272109	GENERIC_DAY	16	0	t	2010-07-03	4348	\N	27159	\N
272110	GENERIC_DAY	16	2	t	2010-06-17	4350	\N	27159	\N
272111	GENERIC_DAY	16	4	f	2010-07-27	4358	\N	27159	\N
272112	GENERIC_DAY	16	5	f	2010-07-22	4348	\N	27159	\N
272113	GENERIC_DAY	16	2	t	2010-07-07	4350	\N	27159	\N
272114	GENERIC_DAY	16	0	t	2010-06-19	4344	\N	27159	\N
272115	GENERIC_DAY	16	4	f	2010-07-19	4350	\N	27159	\N
272116	GENERIC_DAY	16	0	f	2010-07-23	4344	\N	27159	\N
272117	GENERIC_DAY	16	2	t	2010-06-18	4350	\N	27159	\N
272118	GENERIC_DAY	16	2	t	2010-06-23	4350	\N	27159	\N
272119	GENERIC_DAY	16	4	f	2010-07-15	4358	\N	27159	\N
272120	GENERIC_DAY	16	2	t	2010-07-06	4348	\N	27159	\N
272121	GENERIC_DAY	16	2	t	2010-06-29	4344	\N	27159	\N
272122	GENERIC_DAY	16	5	f	2010-07-19	4348	\N	27159	\N
272123	GENERIC_DAY	16	0	f	2010-07-24	4350	\N	27159	\N
272124	GENERIC_DAY	16	2	t	2010-06-29	4350	\N	27159	\N
272125	GENERIC_DAY	16	4	t	2010-06-14	4350	\N	27159	\N
272126	GENERIC_DAY	16	3	f	2010-07-14	4348	\N	27159	\N
272127	GENERIC_DAY	16	2	t	2010-07-06	4350	\N	27159	\N
272128	GENERIC_DAY	16	0	f	2010-07-08	4358	\N	27159	\N
272129	GENERIC_DAY	16	5	f	2010-07-23	4348	\N	27159	\N
272130	GENERIC_DAY	16	2	t	2010-06-25	4344	\N	27159	\N
272131	GENERIC_DAY	16	0	f	2010-07-27	4344	\N	27159	\N
272132	GENERIC_DAY	16	0	f	2010-07-08	4350	\N	27159	\N
272133	GENERIC_DAY	16	2	t	2010-06-28	4350	\N	27159	\N
272134	GENERIC_DAY	16	0	f	2010-07-10	21817	\N	27159	\N
272135	GENERIC_DAY	16	2	t	2010-07-05	4348	\N	27159	\N
272136	GENERIC_DAY	16	2	t	2010-06-23	4344	\N	27159	\N
272137	GENERIC_DAY	16	0	t	2010-07-04	4344	\N	27159	\N
272138	GENERIC_DAY	16	3	f	2010-07-14	4350	\N	27159	\N
272139	GENERIC_DAY	16	3	f	2010-07-13	4358	\N	27159	\N
272140	GENERIC_DAY	16	2	t	2010-06-18	4348	\N	27159	\N
272141	GENERIC_DAY	16	3	f	2010-07-09	4350	\N	27159	\N
272142	GENERIC_DAY	16	2	t	2010-07-02	4344	\N	27159	\N
272143	GENERIC_DAY	16	4	f	2010-07-23	4350	\N	27159	\N
272144	GENERIC_DAY	16	0	f	2010-07-24	4344	\N	27159	\N
272145	GENERIC_DAY	16	0	f	2010-07-25	4358	\N	27159	\N
272146	GENERIC_DAY	16	0	f	2010-07-30	4344	\N	27159	\N
272147	GENERIC_DAY	16	2	t	2010-07-02	4350	\N	27159	\N
272148	GENERIC_DAY	16	0	f	2010-07-31	4348	\N	27159	\N
272149	GENERIC_DAY	16	0	f	2010-07-19	4344	\N	27159	\N
272150	GENERIC_DAY	16	4	f	2010-07-30	4350	\N	27159	\N
272151	GENERIC_DAY	16	4	f	2010-07-29	4358	\N	27159	\N
272152	GENERIC_DAY	16	2	t	2010-06-21	4348	\N	27159	\N
272153	GENERIC_DAY	16	4	t	2010-06-14	4358	\N	27159	\N
272154	GENERIC_DAY	16	2	t	2010-07-02	4358	\N	27159	\N
272155	GENERIC_DAY	16	2	t	2010-06-15	4344	\N	27159	\N
272156	GENERIC_DAY	16	0	f	2010-07-20	4344	\N	27159	\N
272157	GENERIC_DAY	16	3	f	2010-07-09	4348	\N	27159	\N
272158	GENERIC_DAY	16	0	f	2010-07-10	4344	\N	27159	\N
272159	GENERIC_DAY	16	3	f	2010-07-15	4348	\N	27159	\N
272160	GENERIC_DAY	16	2	t	2010-07-07	4344	\N	27159	\N
272161	GENERIC_DAY	16	2	t	2010-06-24	4358	\N	27159	\N
272162	GENERIC_DAY	16	0	f	2010-07-18	4348	\N	27159	\N
272163	GENERIC_DAY	16	2	t	2010-06-22	4348	\N	27159	\N
272164	GENERIC_DAY	16	2	f	2010-07-15	4344	\N	27159	\N
272165	GENERIC_DAY	16	0	t	2010-07-04	4348	\N	27159	\N
272166	GENERIC_DAY	16	0	f	2010-07-11	4348	\N	27159	\N
272167	GENERIC_DAY	16	2	t	2010-06-28	4358	\N	27159	\N
272168	GENERIC_DAY	16	0	t	2010-07-03	4358	\N	27159	\N
272169	GENERIC_DAY	16	2	t	2010-06-30	4358	\N	27159	\N
272170	GENERIC_DAY	16	4	f	2010-07-14	4358	\N	27159	\N
272171	GENERIC_DAY	16	0	t	2010-06-20	4358	\N	27159	\N
272172	GENERIC_DAY	16	0	f	2010-07-25	4344	\N	27159	\N
272173	GENERIC_DAY	16	2	t	2010-06-24	4344	\N	27159	\N
272174	GENERIC_DAY	16	3	f	2010-07-09	21817	\N	27159	\N
272175	GENERIC_DAY	16	4	f	2010-07-16	4350	\N	27159	\N
272176	GENERIC_DAY	16	2	t	2010-07-01	4344	\N	27159	\N
272177	GENERIC_DAY	16	2	t	2010-06-30	4350	\N	27159	\N
272178	GENERIC_DAY	16	0	t	2010-06-27	4358	\N	27159	\N
272179	GENERIC_DAY	16	2	t	2010-06-28	4344	\N	27159	\N
272180	GENERIC_DAY	16	0	t	2010-06-20	4350	\N	27159	\N
272181	GENERIC_DAY	16	0	t	2010-07-03	4344	\N	27159	\N
272182	GENERIC_DAY	16	3	f	2010-07-13	4348	\N	27159	\N
272183	GENERIC_DAY	16	0	f	2010-07-31	4344	\N	27159	\N
272184	GENERIC_DAY	16	2	t	2010-06-29	4358	\N	27159	\N
272185	GENERIC_DAY	16	4	f	2010-08-02	4350	\N	27159	\N
272186	GENERIC_DAY	16	2	t	2010-07-01	4350	\N	27159	\N
272187	GENERIC_DAY	16	5	f	2010-07-21	4348	\N	27159	\N
272188	GENERIC_DAY	16	0	f	2010-07-11	4358	\N	27159	\N
272189	GENERIC_DAY	16	0	f	2010-07-18	4358	\N	27159	\N
272190	GENERIC_DAY	16	4	f	2010-07-21	4350	\N	27159	\N
272191	GENERIC_DAY	16	4	f	2010-08-02	4358	\N	27159	\N
272192	GENERIC_DAY	16	5	f	2010-07-29	4348	\N	27159	\N
272193	GENERIC_DAY	16	0	t	2010-07-04	4350	\N	27159	\N
272194	GENERIC_DAY	16	0	f	2010-07-25	4348	\N	27159	\N
272195	GENERIC_DAY	16	3	f	2010-07-14	4344	\N	27159	\N
272196	GENERIC_DAY	16	0	t	2010-06-19	4348	\N	27159	\N
272197	GENERIC_DAY	16	0	f	2010-07-11	4344	\N	27159	\N
272198	GENERIC_DAY	16	0	f	2010-07-26	4344	\N	27159	\N
272199	GENERIC_DAY	16	0	t	2010-07-03	4350	\N	27159	\N
272200	GENERIC_DAY	16	0	t	2010-06-26	4350	\N	27159	\N
272201	GENERIC_DAY	16	2	t	2010-06-15	4350	\N	27159	\N
272202	GENERIC_DAY	16	2	t	2010-06-30	4348	\N	27159	\N
272203	GENERIC_DAY	16	2	t	2010-06-25	4350	\N	27159	\N
272204	GENERIC_DAY	16	2	t	2010-06-18	4344	\N	27159	\N
272205	GENERIC_DAY	16	0	f	2010-07-18	4344	\N	27159	\N
272206	GENERIC_DAY	16	0	t	2010-06-19	4358	\N	27159	\N
272207	GENERIC_DAY	16	5	f	2010-08-02	4348	\N	27159	\N
272208	GENERIC_DAY	16	1	f	2010-07-13	4344	\N	27159	\N
272209	GENERIC_DAY	16	3	f	2010-07-12	4358	\N	27159	\N
272210	GENERIC_DAY	16	0	t	2010-06-27	4344	\N	27159	\N
272211	GENERIC_DAY	16	2	f	2010-07-16	4344	\N	27159	\N
272212	GENERIC_DAY	16	4	f	2010-07-27	4350	\N	27159	\N
272213	GENERIC_DAY	16	2	t	2010-06-29	4348	\N	27159	\N
272214	GENERIC_DAY	16	2	t	2010-07-06	4358	\N	27159	\N
272215	GENERIC_DAY	16	0	t	2010-06-26	4348	\N	27159	\N
272216	GENERIC_DAY	16	0	f	2010-07-25	4350	\N	27159	\N
272217	GENERIC_DAY	16	2	t	2010-06-16	4344	\N	27159	\N
272218	GENERIC_DAY	16	2	t	2010-06-17	4358	\N	27159	\N
272219	GENERIC_DAY	16	0	t	2010-06-26	4358	\N	27159	\N
272220	GENERIC_DAY	16	0	f	2010-08-01	4358	\N	27159	\N
272221	GENERIC_DAY	16	2	t	2010-07-07	4358	\N	27159	\N
272222	GENERIC_DAY	16	0	f	2010-07-17	4344	\N	27159	\N
272223	GENERIC_DAY	16	0	f	2010-08-01	4344	\N	27159	\N
272224	GENERIC_DAY	16	2	t	2010-06-25	4358	\N	27159	\N
272225	GENERIC_DAY	16	0	t	2010-06-26	4344	\N	27159	\N
272226	GENERIC_DAY	16	4	f	2010-07-28	4348	\N	27159	\N
272227	GENERIC_DAY	16	2	t	2010-07-05	4358	\N	27159	\N
272228	GENERIC_DAY	16	0	f	2010-07-11	21817	\N	27159	\N
272229	GENERIC_DAY	16	2	t	2010-06-17	4344	\N	27159	\N
272230	GENERIC_DAY	16	2	t	2010-06-23	4348	\N	27159	\N
272231	GENERIC_DAY	16	0	f	2010-08-01	4350	\N	27159	\N
272232	GENERIC_DAY	16	2	t	2010-06-21	4344	\N	27159	\N
272233	GENERIC_DAY	16	2	t	2010-06-22	4358	\N	27159	\N
272234	GENERIC_DAY	16	3	f	2010-07-13	21817	\N	27159	\N
272235	GENERIC_DAY	16	0	t	2010-06-27	4348	\N	27159	\N
272236	GENERIC_DAY	16	0	f	2010-07-17	4350	\N	27159	\N
272237	GENERIC_DAY	16	4	f	2010-07-21	4358	\N	27159	\N
272238	GENERIC_DAY	16	0	f	2010-07-10	4350	\N	27159	\N
272239	GENERIC_DAY	16	0	t	2010-06-20	4344	\N	27159	\N
272240	GENERIC_DAY	16	0	t	2010-07-04	4358	\N	27159	\N
272241	GENERIC_DAY	16	5	f	2010-07-28	4358	\N	27159	\N
272242	GENERIC_DAY	16	2	t	2010-07-07	4348	\N	27159	\N
272243	GENERIC_DAY	16	2	t	2010-07-05	4344	\N	27159	\N
272244	GENERIC_DAY	16	2	t	2010-06-23	4358	\N	27159	\N
272245	GENERIC_DAY	16	2	t	2010-06-28	4348	\N	27159	\N
272246	GENERIC_DAY	16	4	f	2010-07-22	4350	\N	27159	\N
272247	GENERIC_DAY	16	5	f	2010-07-27	4348	\N	27159	\N
272248	GENERIC_DAY	16	2	t	2010-06-15	4348	\N	27159	\N
272249	GENERIC_DAY	15	6	f	2010-07-21	4354	\N	27160	\N
272250	GENERIC_DAY	15	0	f	2010-07-17	4352	\N	27160	\N
272251	GENERIC_DAY	15	1	f	2010-07-20	4352	\N	27160	\N
272252	GENERIC_DAY	15	0	f	2010-07-11	4354	\N	27160	\N
272253	GENERIC_DAY	15	0	f	2010-07-10	4352	\N	27160	\N
272254	GENERIC_DAY	15	1	f	2010-07-19	4352	\N	27160	\N
272255	GENERIC_DAY	15	1	f	2010-07-16	4352	\N	27160	\N
272256	GENERIC_DAY	15	0	f	2010-07-27	4352	\N	27160	\N
272257	GENERIC_DAY	15	1	f	2010-07-09	4352	\N	27160	\N
272258	GENERIC_DAY	15	0	f	2010-07-18	4352	\N	27160	\N
272259	GENERIC_DAY	15	0	f	2010-07-25	4354	\N	27160	\N
272260	GENERIC_DAY	15	6	f	2010-07-22	4354	\N	27160	\N
272261	GENERIC_DAY	15	7	f	2010-07-12	4354	\N	27160	\N
272262	GENERIC_DAY	15	6	f	2010-07-23	4354	\N	27160	\N
272263	GENERIC_DAY	15	0	f	2010-07-18	4354	\N	27160	\N
272264	GENERIC_DAY	15	7	f	2010-07-13	4354	\N	27160	\N
272265	GENERIC_DAY	15	2	f	2010-07-26	4352	\N	27160	\N
272266	GENERIC_DAY	15	1	f	2010-07-12	4352	\N	27160	\N
272267	GENERIC_DAY	15	7	f	2010-07-15	4354	\N	27160	\N
272268	GENERIC_DAY	15	2	f	2010-07-23	4352	\N	27160	\N
272269	GENERIC_DAY	15	0	f	2010-07-17	4354	\N	27160	\N
272270	GENERIC_DAY	15	0	f	2010-07-25	4352	\N	27160	\N
272271	GENERIC_DAY	15	1	f	2010-07-15	4352	\N	27160	\N
272272	GENERIC_DAY	15	7	f	2010-07-14	4354	\N	27160	\N
272273	GENERIC_DAY	15	0	f	2010-07-10	4354	\N	27160	\N
272274	GENERIC_DAY	15	2	f	2010-07-22	4352	\N	27160	\N
272275	GENERIC_DAY	15	1	f	2010-07-13	4352	\N	27160	\N
272276	GENERIC_DAY	15	2	f	2010-07-21	4352	\N	27160	\N
272277	GENERIC_DAY	15	0	f	2010-07-11	4352	\N	27160	\N
272278	GENERIC_DAY	15	7	f	2010-07-09	4354	\N	27160	\N
272279	GENERIC_DAY	15	0	f	2010-07-24	4352	\N	27160	\N
272280	GENERIC_DAY	15	1	f	2010-07-14	4352	\N	27160	\N
272281	GENERIC_DAY	15	4	f	2010-07-27	4354	\N	27160	\N
272282	GENERIC_DAY	15	7	f	2010-07-19	4354	\N	27160	\N
272283	GENERIC_DAY	15	0	f	2010-07-24	4354	\N	27160	\N
272284	GENERIC_DAY	15	7	f	2010-07-20	4354	\N	27160	\N
272285	GENERIC_DAY	15	7	f	2010-07-16	4354	\N	27160	\N
272286	GENERIC_DAY	15	6	f	2010-07-26	4354	\N	27160	\N
272287	GENERIC_DAY	14	4	f	2010-08-17	4354	\N	27161	\N
272288	GENERIC_DAY	14	3	f	2010-07-30	4354	\N	27161	\N
272289	GENERIC_DAY	14	4	f	2010-08-18	4352	\N	27161	\N
272290	GENERIC_DAY	14	4	f	2010-08-24	4352	\N	27161	\N
272291	GENERIC_DAY	14	4	f	2010-08-23	4354	\N	27161	\N
272292	GENERIC_DAY	14	0	f	2010-08-22	4354	\N	27161	\N
272293	GENERIC_DAY	14	0	f	2010-08-01	4354	\N	27161	\N
272294	GENERIC_DAY	14	5	f	2010-08-06	4352	\N	27161	\N
272295	GENERIC_DAY	14	3	f	2010-07-28	4354	\N	27161	\N
272296	GENERIC_DAY	14	5	f	2010-08-09	4352	\N	27161	\N
272297	GENERIC_DAY	14	0	f	2010-08-15	4352	\N	27161	\N
272298	GENERIC_DAY	14	5	f	2010-08-10	4352	\N	27161	\N
272299	GENERIC_DAY	14	3	f	2010-07-29	4354	\N	27161	\N
272300	GENERIC_DAY	14	3	f	2010-08-04	4354	\N	27161	\N
272301	GENERIC_DAY	14	4	f	2010-08-18	4354	\N	27161	\N
272302	GENERIC_DAY	14	0	f	2010-08-21	4352	\N	27161	\N
272303	GENERIC_DAY	14	4	f	2010-08-26	4354	\N	27161	\N
272304	GENERIC_DAY	14	0	f	2010-08-21	4354	\N	27161	\N
272305	GENERIC_DAY	14	3	f	2010-08-10	4354	\N	27161	\N
272306	GENERIC_DAY	14	4	f	2010-08-17	4352	\N	27161	\N
272307	GENERIC_DAY	14	5	f	2010-07-29	4352	\N	27161	\N
272308	GENERIC_DAY	14	4	f	2010-08-27	4352	\N	27161	\N
272309	GENERIC_DAY	14	0	f	2010-08-22	4352	\N	27161	\N
272310	GENERIC_DAY	14	4	f	2010-08-31	4354	\N	27161	\N
272311	GENERIC_DAY	14	4	f	2010-08-25	4352	\N	27161	\N
272312	GENERIC_DAY	14	4	f	2010-08-23	4352	\N	27161	\N
272313	GENERIC_DAY	14	5	f	2010-08-05	4352	\N	27161	\N
272314	GENERIC_DAY	14	4	f	2010-08-27	4354	\N	27161	\N
272315	GENERIC_DAY	14	0	f	2010-08-28	4352	\N	27161	\N
272316	GENERIC_DAY	14	5	f	2010-08-04	4352	\N	27161	\N
272317	GENERIC_DAY	14	0	f	2010-08-07	4352	\N	27161	\N
272318	GENERIC_DAY	14	4	f	2010-08-24	4354	\N	27161	\N
272319	GENERIC_DAY	14	3	f	2010-08-09	4354	\N	27161	\N
272320	GENERIC_DAY	14	0	f	2010-08-01	4352	\N	27161	\N
272321	GENERIC_DAY	14	4	f	2010-08-30	4354	\N	27161	\N
272322	GENERIC_DAY	14	0	f	2010-08-14	4352	\N	27161	\N
272323	GENERIC_DAY	14	0	f	2010-08-29	4354	\N	27161	\N
272324	GENERIC_DAY	14	3	f	2010-08-05	4354	\N	27161	\N
272325	GENERIC_DAY	14	4	f	2010-08-20	4352	\N	27161	\N
272326	GENERIC_DAY	14	3	f	2010-08-11	4354	\N	27161	\N
272327	GENERIC_DAY	14	4	f	2010-08-25	4354	\N	27161	\N
272328	GENERIC_DAY	14	4	f	2010-08-30	4352	\N	27161	\N
272329	GENERIC_DAY	14	4	f	2010-08-31	4352	\N	27161	\N
272330	GENERIC_DAY	14	5	f	2010-07-30	4352	\N	27161	\N
272331	GENERIC_DAY	14	3	f	2010-08-03	4354	\N	27161	\N
272332	GENERIC_DAY	14	5	f	2010-08-11	4352	\N	27161	\N
272333	GENERIC_DAY	14	5	f	2010-08-02	4352	\N	27161	\N
272334	GENERIC_DAY	14	5	f	2010-07-28	4352	\N	27161	\N
272335	GENERIC_DAY	14	0	f	2010-08-15	4354	\N	27161	\N
272336	GENERIC_DAY	14	0	f	2010-07-31	4354	\N	27161	\N
272337	GENERIC_DAY	14	0	f	2010-08-08	4354	\N	27161	\N
272338	GENERIC_DAY	14	4	f	2010-08-16	4352	\N	27161	\N
272339	GENERIC_DAY	14	4	f	2010-08-13	4354	\N	27161	\N
272340	GENERIC_DAY	14	0	f	2010-08-08	4352	\N	27161	\N
272341	GENERIC_DAY	14	0	f	2010-08-28	4354	\N	27161	\N
272342	GENERIC_DAY	14	4	f	2010-08-19	4354	\N	27161	\N
272343	GENERIC_DAY	14	4	f	2010-08-16	4354	\N	27161	\N
272344	GENERIC_DAY	14	4	f	2010-08-12	4354	\N	27161	\N
272345	GENERIC_DAY	14	0	f	2010-08-07	4354	\N	27161	\N
272346	GENERIC_DAY	14	5	f	2010-08-03	4352	\N	27161	\N
272347	GENERIC_DAY	14	4	f	2010-08-26	4352	\N	27161	\N
272348	GENERIC_DAY	14	4	f	2010-08-13	4352	\N	27161	\N
272349	GENERIC_DAY	14	0	f	2010-07-31	4352	\N	27161	\N
272350	GENERIC_DAY	14	3	f	2010-08-06	4354	\N	27161	\N
272351	GENERIC_DAY	14	0	f	2010-08-14	4354	\N	27161	\N
272352	GENERIC_DAY	14	0	f	2010-08-29	4352	\N	27161	\N
272353	GENERIC_DAY	14	4	f	2010-08-19	4352	\N	27161	\N
272354	GENERIC_DAY	14	4	f	2010-08-12	4352	\N	27161	\N
272355	GENERIC_DAY	14	4	f	2010-08-20	4354	\N	27161	\N
272356	GENERIC_DAY	14	3	f	2010-08-02	4354	\N	27161	\N
272357	GENERIC_DAY	13	2	f	2010-07-22	4358	\N	27162	\N
272358	GENERIC_DAY	13	0	f	2010-07-07	21817	\N	27162	\N
272359	GENERIC_DAY	13	0	f	2010-07-22	4344	\N	27162	\N
272360	GENERIC_DAY	13	0	f	2010-07-24	4344	\N	27162	\N
272361	GENERIC_DAY	13	0	f	2010-07-08	4358	\N	27162	\N
272362	GENERIC_DAY	13	0	f	2010-07-11	21817	\N	27162	\N
272363	GENERIC_DAY	13	0	f	2010-07-05	4350	\N	27162	\N
272364	GENERIC_DAY	13	2	f	2010-07-09	4348	\N	27162	\N
272365	GENERIC_DAY	13	0	f	2010-07-11	4344	\N	27162	\N
272366	GENERIC_DAY	13	0	f	2010-07-04	21817	\N	27162	\N
272367	GENERIC_DAY	13	0	f	2010-07-17	4348	\N	27162	\N
272368	GENERIC_DAY	13	0	f	2010-07-17	4350	\N	27162	\N
272369	GENERIC_DAY	13	0	f	2010-07-08	4350	\N	27162	\N
272370	GENERIC_DAY	13	0	f	2010-07-25	4344	\N	27162	\N
272371	GENERIC_DAY	13	2	f	2010-07-21	4358	\N	27162	\N
272372	GENERIC_DAY	13	3	f	2010-07-22	4348	\N	27162	\N
272373	GENERIC_DAY	13	2	f	2010-07-12	4350	\N	27162	\N
272374	GENERIC_DAY	13	2	f	2010-07-12	21817	\N	27162	\N
272375	GENERIC_DAY	13	0	f	2010-07-03	4350	\N	27162	\N
272376	GENERIC_DAY	13	3	f	2010-07-21	4348	\N	27162	\N
272377	GENERIC_DAY	13	0	f	2010-07-09	4344	\N	27162	\N
272378	GENERIC_DAY	13	0	f	2010-07-18	4358	\N	27162	\N
272379	GENERIC_DAY	13	0	f	2010-07-04	4358	\N	27162	\N
272380	GENERIC_DAY	13	2	f	2010-07-12	4358	\N	27162	\N
272381	GENERIC_DAY	13	0	f	2010-07-10	4350	\N	27162	\N
272382	GENERIC_DAY	13	0	f	2010-07-11	4358	\N	27162	\N
272383	GENERIC_DAY	13	2	f	2010-07-28	4358	\N	27162	\N
272384	GENERIC_DAY	13	0	f	2010-07-27	4344	\N	27162	\N
272385	GENERIC_DAY	13	2	f	2010-07-14	4350	\N	27162	\N
272386	GENERIC_DAY	13	0	f	2010-07-10	4348	\N	27162	\N
272387	GENERIC_DAY	13	0	f	2010-07-11	4348	\N	27162	\N
272388	GENERIC_DAY	13	3	f	2010-07-23	4350	\N	27162	\N
272389	GENERIC_DAY	13	0	f	2010-07-10	4344	\N	27162	\N
272390	GENERIC_DAY	13	0	f	2010-07-08	4348	\N	27162	\N
272391	GENERIC_DAY	13	0	f	2010-07-04	4348	\N	27162	\N
272392	GENERIC_DAY	13	0	f	2010-07-10	21817	\N	27162	\N
272393	GENERIC_DAY	13	0	f	2010-07-08	4344	\N	27162	\N
272394	GENERIC_DAY	13	3	f	2010-07-21	4350	\N	27162	\N
272395	GENERIC_DAY	13	3	f	2010-07-22	4350	\N	27162	\N
272396	GENERIC_DAY	13	2	f	2010-07-26	4358	\N	27162	\N
272397	GENERIC_DAY	13	0	f	2010-07-17	4358	\N	27162	\N
272398	GENERIC_DAY	13	2	f	2010-07-12	4348	\N	27162	\N
272399	GENERIC_DAY	13	0	f	2010-07-03	4344	\N	27162	\N
272400	GENERIC_DAY	13	0	f	2010-07-23	4344	\N	27162	\N
272401	GENERIC_DAY	13	2	f	2010-07-28	4350	\N	27162	\N
272402	GENERIC_DAY	13	0	f	2010-07-02	4350	\N	27162	\N
272403	GENERIC_DAY	13	0	f	2010-07-06	4358	\N	27162	\N
272404	GENERIC_DAY	13	8	f	2010-07-02	4344	\N	27162	\N
272405	GENERIC_DAY	13	0	f	2010-07-11	4350	\N	27162	\N
272406	GENERIC_DAY	13	3	f	2010-07-27	4348	\N	27162	\N
272407	GENERIC_DAY	13	2	f	2010-07-20	4358	\N	27162	\N
272408	GENERIC_DAY	13	0	f	2010-07-26	4344	\N	27162	\N
272409	GENERIC_DAY	13	0	f	2010-07-24	4358	\N	27162	\N
272410	GENERIC_DAY	13	0	f	2010-07-20	4344	\N	27162	\N
272411	GENERIC_DAY	13	0	f	2010-07-03	4348	\N	27162	\N
272412	GENERIC_DAY	13	0	f	2010-07-07	4348	\N	27162	\N
272413	GENERIC_DAY	13	0	f	2010-07-16	4344	\N	27162	\N
272414	GENERIC_DAY	13	3	f	2010-07-26	4348	\N	27162	\N
272415	GENERIC_DAY	13	0	f	2010-07-18	4348	\N	27162	\N
272416	GENERIC_DAY	13	8	f	2010-07-08	21817	\N	27162	\N
272417	GENERIC_DAY	13	0	f	2010-07-25	4358	\N	27162	\N
272418	GENERIC_DAY	13	0	f	2010-07-05	4348	\N	27162	\N
272419	GENERIC_DAY	13	0	f	2010-07-10	4358	\N	27162	\N
272420	GENERIC_DAY	13	3	f	2010-07-26	4350	\N	27162	\N
272421	GENERIC_DAY	13	2	f	2010-07-28	4348	\N	27162	\N
272422	GENERIC_DAY	13	3	f	2010-07-14	4358	\N	27162	\N
272423	GENERIC_DAY	13	8	f	2010-07-06	4344	\N	27162	\N
272424	GENERIC_DAY	13	3	f	2010-07-20	4348	\N	27162	\N
272425	GENERIC_DAY	13	0	f	2010-07-06	4350	\N	27162	\N
272426	GENERIC_DAY	13	0	f	2010-07-02	21817	\N	27162	\N
272427	GENERIC_DAY	13	0	f	2010-07-17	4344	\N	27162	\N
272428	GENERIC_DAY	13	8	f	2010-07-07	4344	\N	27162	\N
272429	GENERIC_DAY	13	3	f	2010-07-19	4350	\N	27162	\N
272430	GENERIC_DAY	13	2	f	2010-07-13	4350	\N	27162	\N
272431	GENERIC_DAY	13	1	f	2010-07-14	4344	\N	27162	\N
272432	GENERIC_DAY	13	0	f	2010-07-05	21817	\N	27162	\N
272433	GENERIC_DAY	13	0	f	2010-07-18	4344	\N	27162	\N
272434	GENERIC_DAY	13	0	f	2010-07-25	4348	\N	27162	\N
272435	GENERIC_DAY	13	3	f	2010-07-15	4358	\N	27162	\N
272436	GENERIC_DAY	13	2	f	2010-07-09	4358	\N	27162	\N
272437	GENERIC_DAY	13	0	f	2010-07-15	4344	\N	27162	\N
272438	GENERIC_DAY	13	3	f	2010-07-23	4348	\N	27162	\N
272439	GENERIC_DAY	13	2	f	2010-07-23	4358	\N	27162	\N
272440	GENERIC_DAY	13	3	f	2010-07-27	4350	\N	27162	\N
272441	GENERIC_DAY	13	0	f	2010-07-06	21817	\N	27162	\N
272442	GENERIC_DAY	13	0	f	2010-07-03	21817	\N	27162	\N
272443	GENERIC_DAY	13	2	f	2010-07-15	4348	\N	27162	\N
272444	GENERIC_DAY	13	0	f	2010-07-13	4344	\N	27162	\N
272445	GENERIC_DAY	13	3	f	2010-07-20	4350	\N	27162	\N
272446	GENERIC_DAY	13	8	f	2010-07-05	4344	\N	27162	\N
272447	GENERIC_DAY	13	0	f	2010-07-02	4348	\N	27162	\N
272448	GENERIC_DAY	13	0	f	2010-07-21	4344	\N	27162	\N
272449	GENERIC_DAY	13	0	f	2010-07-12	4344	\N	27162	\N
272450	GENERIC_DAY	13	0	f	2010-07-02	4358	\N	27162	\N
272451	GENERIC_DAY	13	0	f	2010-07-04	4350	\N	27162	\N
272452	GENERIC_DAY	13	3	f	2010-07-16	4358	\N	27162	\N
272453	GENERIC_DAY	13	2	f	2010-07-13	4348	\N	27162	\N
272454	GENERIC_DAY	13	0	f	2010-07-03	4358	\N	27162	\N
272455	GENERIC_DAY	13	0	f	2010-07-18	4350	\N	27162	\N
272456	GENERIC_DAY	13	2	f	2010-07-16	4348	\N	27162	\N
272457	GENERIC_DAY	13	0	f	2010-07-24	4350	\N	27162	\N
272458	GENERIC_DAY	13	3	f	2010-07-15	4350	\N	27162	\N
272459	GENERIC_DAY	13	0	f	2010-07-28	4344	\N	27162	\N
272460	GENERIC_DAY	13	0	f	2010-07-07	4358	\N	27162	\N
272461	GENERIC_DAY	13	0	f	2010-07-24	4348	\N	27162	\N
272462	GENERIC_DAY	13	2	f	2010-07-09	4350	\N	27162	\N
272463	GENERIC_DAY	13	2	f	2010-07-13	21817	\N	27162	\N
272464	GENERIC_DAY	13	0	f	2010-07-19	4344	\N	27162	\N
272465	GENERIC_DAY	13	0	f	2010-07-04	4344	\N	27162	\N
272466	GENERIC_DAY	13	0	f	2010-07-06	4348	\N	27162	\N
272467	GENERIC_DAY	13	0	f	2010-07-05	4358	\N	27162	\N
272468	GENERIC_DAY	13	0	f	2010-07-25	4350	\N	27162	\N
272469	GENERIC_DAY	13	0	f	2010-07-07	4350	\N	27162	\N
272470	GENERIC_DAY	13	2	f	2010-07-27	4358	\N	27162	\N
272471	GENERIC_DAY	13	3	f	2010-07-16	4350	\N	27162	\N
272472	GENERIC_DAY	13	3	f	2010-07-19	4348	\N	27162	\N
272473	GENERIC_DAY	13	2	f	2010-07-19	4358	\N	27162	\N
272474	GENERIC_DAY	13	2	f	2010-07-09	21817	\N	27162	\N
272475	GENERIC_DAY	13	2	f	2010-07-13	4358	\N	27162	\N
272476	GENERIC_DAY	13	2	f	2010-07-14	4348	\N	27162	\N
272477	SPECIFIC_DAY	12	8	f	2010-07-23	4352	31239	\N	\N
272478	SPECIFIC_DAY	12	8	f	2010-07-12	4352	31239	\N	\N
272479	SPECIFIC_DAY	12	0	f	2010-06-26	4352	31239	\N	\N
272480	SPECIFIC_DAY	12	8	f	2010-07-09	4352	31239	\N	\N
272481	SPECIFIC_DAY	12	8	f	2010-06-23	4352	31239	\N	\N
272482	SPECIFIC_DAY	12	8	f	2010-07-27	4352	31239	\N	\N
272483	SPECIFIC_DAY	12	8	f	2010-08-04	4352	31239	\N	\N
272484	SPECIFIC_DAY	12	4	f	2010-08-05	4352	31239	\N	\N
272485	SPECIFIC_DAY	12	0	f	2010-06-27	4352	31239	\N	\N
272486	SPECIFIC_DAY	12	8	f	2010-06-15	4352	31239	\N	\N
272487	SPECIFIC_DAY	12	8	f	2010-07-05	4352	31239	\N	\N
272488	SPECIFIC_DAY	12	8	f	2010-07-06	4352	31239	\N	\N
272489	SPECIFIC_DAY	12	8	f	2010-07-13	4352	31239	\N	\N
272490	SPECIFIC_DAY	12	8	f	2010-06-16	4352	31239	\N	\N
272491	SPECIFIC_DAY	12	8	f	2010-07-01	4352	31239	\N	\N
272492	SPECIFIC_DAY	12	8	f	2010-08-02	4352	31239	\N	\N
272493	SPECIFIC_DAY	12	8	f	2010-06-30	4352	31239	\N	\N
272494	SPECIFIC_DAY	12	0	f	2010-07-18	4352	31239	\N	\N
272495	SPECIFIC_DAY	12	0	f	2010-07-03	4352	31239	\N	\N
272496	SPECIFIC_DAY	12	0	f	2010-07-11	4352	31239	\N	\N
272497	SPECIFIC_DAY	12	0	f	2010-07-10	4352	31239	\N	\N
272498	SPECIFIC_DAY	12	0	f	2010-06-21	4352	31239	\N	\N
272499	SPECIFIC_DAY	12	8	f	2010-07-21	4352	31239	\N	\N
272500	SPECIFIC_DAY	12	8	f	2010-07-29	4352	31239	\N	\N
272501	SPECIFIC_DAY	12	8	f	2010-07-16	4352	31239	\N	\N
272502	SPECIFIC_DAY	12	8	f	2010-06-28	4352	31239	\N	\N
272503	SPECIFIC_DAY	12	0	f	2010-07-24	4352	31239	\N	\N
272504	SPECIFIC_DAY	12	0	f	2010-06-20	4352	31239	\N	\N
272505	SPECIFIC_DAY	12	8	f	2010-08-03	4352	31239	\N	\N
272506	SPECIFIC_DAY	12	8	f	2010-07-30	4352	31239	\N	\N
272507	SPECIFIC_DAY	12	8	f	2010-07-14	4352	31239	\N	\N
272508	SPECIFIC_DAY	12	8	f	2010-06-25	4352	31239	\N	\N
272509	SPECIFIC_DAY	12	8	f	2010-06-17	4352	31239	\N	\N
272510	SPECIFIC_DAY	12	8	f	2010-06-14	4352	31239	\N	\N
272511	SPECIFIC_DAY	12	8	f	2010-07-28	4352	31239	\N	\N
272512	SPECIFIC_DAY	12	8	f	2010-06-24	4352	31239	\N	\N
272513	SPECIFIC_DAY	12	0	f	2010-07-17	4352	31239	\N	\N
272514	SPECIFIC_DAY	12	8	f	2010-07-08	4352	31239	\N	\N
272515	SPECIFIC_DAY	12	8	f	2010-07-07	4352	31239	\N	\N
272516	SPECIFIC_DAY	12	0	f	2010-07-04	4352	31239	\N	\N
272517	SPECIFIC_DAY	12	0	f	2010-08-01	4352	31239	\N	\N
272518	SPECIFIC_DAY	12	8	f	2010-06-22	4352	31239	\N	\N
272519	SPECIFIC_DAY	12	0	f	2010-07-31	4352	31239	\N	\N
272520	SPECIFIC_DAY	12	8	f	2010-07-26	4352	31239	\N	\N
272521	SPECIFIC_DAY	12	0	f	2010-06-13	4352	31239	\N	\N
272522	SPECIFIC_DAY	12	8	f	2010-07-20	4352	31239	\N	\N
272523	SPECIFIC_DAY	12	8	f	2010-07-15	4352	31239	\N	\N
272524	SPECIFIC_DAY	12	8	f	2010-06-18	4352	31239	\N	\N
272525	SPECIFIC_DAY	12	8	f	2010-07-02	4352	31239	\N	\N
272526	SPECIFIC_DAY	12	8	f	2010-06-29	4352	31239	\N	\N
272527	SPECIFIC_DAY	12	0	f	2010-07-25	4352	31239	\N	\N
272528	SPECIFIC_DAY	12	0	f	2010-06-19	4352	31239	\N	\N
272529	SPECIFIC_DAY	12	8	f	2010-07-22	4352	31239	\N	\N
272530	SPECIFIC_DAY	12	8	f	2010-07-19	4352	31239	\N	\N
272683	GENERIC_DAY	12	0	f	2010-08-28	4358	\N	27163	\N
272684	GENERIC_DAY	12	0	f	2010-08-10	4344	\N	27163	\N
272685	GENERIC_DAY	12	2	f	2010-08-24	4348	\N	27163	\N
272686	GENERIC_DAY	12	0	f	2010-08-05	4344	\N	27163	\N
272687	GENERIC_DAY	12	2	f	2010-08-24	4350	\N	27163	\N
272688	GENERIC_DAY	12	3	f	2010-07-29	4350	\N	27163	\N
272689	GENERIC_DAY	12	0	f	2010-08-03	4344	\N	27163	\N
272690	GENERIC_DAY	12	3	f	2010-07-29	4348	\N	27163	\N
272691	GENERIC_DAY	12	3	f	2010-08-18	4344	\N	27163	\N
272692	GENERIC_DAY	12	2	f	2010-09-01	4350	\N	27163	\N
272693	GENERIC_DAY	12	0	f	2010-08-15	4344	\N	27163	\N
272694	GENERIC_DAY	12	2	f	2010-08-31	4358	\N	27163	\N
272695	GENERIC_DAY	12	0	f	2010-08-04	4344	\N	27163	\N
272696	GENERIC_DAY	12	0	f	2010-08-12	4344	\N	27163	\N
272697	GENERIC_DAY	12	2	f	2010-08-16	4358	\N	27163	\N
272698	GENERIC_DAY	12	2	f	2010-08-12	4358	\N	27163	\N
272699	GENERIC_DAY	12	0	f	2010-08-01	4344	\N	27163	\N
272700	GENERIC_DAY	12	0	f	2010-08-08	4350	\N	27163	\N
272701	GENERIC_DAY	12	0	f	2010-08-22	4348	\N	27163	\N
272702	GENERIC_DAY	12	2	f	2010-08-03	4358	\N	27163	\N
272703	GENERIC_DAY	12	3	f	2010-08-03	4348	\N	27163	\N
272704	GENERIC_DAY	12	0	f	2010-08-08	4358	\N	27163	\N
272705	GENERIC_DAY	12	2	f	2010-08-26	4350	\N	27163	\N
272706	GENERIC_DAY	12	3	f	2010-08-02	4348	\N	27163	\N
272707	GENERIC_DAY	12	2	f	2010-08-25	4358	\N	27163	\N
272708	GENERIC_DAY	12	2	f	2010-08-30	4348	\N	27163	\N
272709	GENERIC_DAY	12	2	f	2010-08-23	4358	\N	27163	\N
272710	GENERIC_DAY	12	2	f	2010-08-05	4358	\N	27163	\N
272711	GENERIC_DAY	12	3	f	2010-07-30	4348	\N	27163	\N
272712	GENERIC_DAY	12	2	f	2010-08-25	4344	\N	27163	\N
272713	GENERIC_DAY	12	0	f	2010-08-29	4344	\N	27163	\N
272714	GENERIC_DAY	12	0	f	2010-08-21	4344	\N	27163	\N
272715	GENERIC_DAY	12	3	f	2010-08-10	4350	\N	27163	\N
272716	GENERIC_DAY	12	0	f	2010-08-08	4344	\N	27163	\N
272717	GENERIC_DAY	12	0	f	2010-08-28	4350	\N	27163	\N
272718	GENERIC_DAY	12	2	f	2010-08-17	4358	\N	27163	\N
272719	GENERIC_DAY	12	3	f	2010-08-09	4348	\N	27163	\N
272720	GENERIC_DAY	12	0	f	2010-08-07	4350	\N	27163	\N
272721	GENERIC_DAY	12	0	f	2010-07-31	4348	\N	27163	\N
272722	GENERIC_DAY	12	2	f	2010-08-10	4358	\N	27163	\N
272723	GENERIC_DAY	12	2	f	2010-08-31	4344	\N	27163	\N
272724	GENERIC_DAY	12	3	f	2010-08-18	4350	\N	27163	\N
272725	GENERIC_DAY	12	3	f	2010-08-06	4350	\N	27163	\N
272726	GENERIC_DAY	12	0	f	2010-07-30	4344	\N	27163	\N
272727	GENERIC_DAY	12	2	f	2010-08-26	4348	\N	27163	\N
272728	GENERIC_DAY	12	3	f	2010-08-13	4344	\N	27163	\N
272729	GENERIC_DAY	12	3	f	2010-08-03	4350	\N	27163	\N
272730	GENERIC_DAY	12	0	f	2010-08-22	4358	\N	27163	\N
272731	GENERIC_DAY	12	2	f	2010-09-01	4358	\N	27163	\N
272732	GENERIC_DAY	12	3	f	2010-08-16	4350	\N	27163	\N
272733	GENERIC_DAY	12	0	f	2010-08-22	4344	\N	27163	\N
272734	GENERIC_DAY	12	2	f	2010-08-25	4348	\N	27163	\N
272735	GENERIC_DAY	12	3	f	2010-08-05	4348	\N	27163	\N
272736	GENERIC_DAY	12	2	f	2010-08-27	4348	\N	27163	\N
272737	GENERIC_DAY	12	0	f	2010-08-29	4350	\N	27163	\N
272738	GENERIC_DAY	12	3	f	2010-08-23	4344	\N	27163	\N
272739	GENERIC_DAY	12	2	f	2010-08-27	4350	\N	27163	\N
272740	GENERIC_DAY	12	2	f	2010-08-24	4358	\N	27163	\N
272741	GENERIC_DAY	12	0	f	2010-08-18	4348	\N	27163	\N
272742	GENERIC_DAY	12	0	f	2010-08-15	4350	\N	27163	\N
272743	GENERIC_DAY	12	2	f	2010-08-02	4358	\N	27163	\N
272744	GENERIC_DAY	12	0	f	2010-07-29	4344	\N	27163	\N
272745	GENERIC_DAY	12	0	f	2010-08-21	4348	\N	27163	\N
272746	GENERIC_DAY	12	3	f	2010-08-05	4350	\N	27163	\N
272747	GENERIC_DAY	12	3	f	2010-08-11	4348	\N	27163	\N
272748	GENERIC_DAY	12	2	f	2010-08-06	4358	\N	27163	\N
272749	GENERIC_DAY	12	0	f	2010-08-01	4348	\N	27163	\N
272750	GENERIC_DAY	12	0	f	2010-07-31	4344	\N	27163	\N
272751	GENERIC_DAY	12	0	f	2010-07-31	4350	\N	27163	\N
272752	GENERIC_DAY	12	0	f	2010-08-29	4358	\N	27163	\N
272753	GENERIC_DAY	12	0	f	2010-08-14	4350	\N	27163	\N
272754	GENERIC_DAY	12	3	f	2010-08-12	4348	\N	27163	\N
272755	GENERIC_DAY	12	2	f	2010-07-30	4358	\N	27163	\N
272756	GENERIC_DAY	12	0	f	2010-08-14	4344	\N	27163	\N
272757	GENERIC_DAY	12	0	f	2010-08-08	4348	\N	27163	\N
272758	GENERIC_DAY	12	2	f	2010-08-20	4358	\N	27163	\N
272759	GENERIC_DAY	12	0	f	2010-08-14	4358	\N	27163	\N
272760	GENERIC_DAY	12	2	f	2010-08-13	4358	\N	27163	\N
272761	GENERIC_DAY	12	2	f	2010-08-27	4358	\N	27163	\N
272762	GENERIC_DAY	12	2	f	2010-08-26	4344	\N	27163	\N
272763	GENERIC_DAY	12	3	f	2010-08-06	4348	\N	27163	\N
272764	GENERIC_DAY	12	2	f	2010-08-09	4358	\N	27163	\N
272765	GENERIC_DAY	12	0	f	2010-08-01	4350	\N	27163	\N
272766	GENERIC_DAY	12	3	f	2010-08-11	4350	\N	27163	\N
272767	GENERIC_DAY	12	0	f	2010-08-09	4344	\N	27163	\N
272768	GENERIC_DAY	12	3	f	2010-08-20	4344	\N	27163	\N
272769	GENERIC_DAY	12	2	f	2010-08-26	4358	\N	27163	\N
272770	GENERIC_DAY	12	0	f	2010-08-15	4358	\N	27163	\N
272771	GENERIC_DAY	12	2	f	2010-08-25	4350	\N	27163	\N
272772	GENERIC_DAY	12	3	f	2010-08-19	4344	\N	27163	\N
272773	GENERIC_DAY	12	2	f	2010-08-30	4350	\N	27163	\N
272774	GENERIC_DAY	12	0	f	2010-08-01	4358	\N	27163	\N
272775	GENERIC_DAY	12	3	f	2010-08-12	4350	\N	27163	\N
272776	GENERIC_DAY	12	0	f	2010-08-15	4348	\N	27163	\N
272777	GENERIC_DAY	12	2	f	2010-08-31	4348	\N	27163	\N
272778	GENERIC_DAY	12	2	f	2010-08-30	4358	\N	27163	\N
272779	GENERIC_DAY	12	2	f	2010-08-18	4358	\N	27163	\N
272780	GENERIC_DAY	12	2	f	2010-09-01	4344	\N	27163	\N
272781	GENERIC_DAY	12	0	f	2010-08-23	4348	\N	27163	\N
272782	GENERIC_DAY	12	0	f	2010-08-29	4348	\N	27163	\N
272783	GENERIC_DAY	12	3	f	2010-08-17	4344	\N	27163	\N
272784	GENERIC_DAY	12	2	f	2010-08-04	4358	\N	27163	\N
272785	GENERIC_DAY	12	2	f	2010-07-29	4358	\N	27163	\N
272786	GENERIC_DAY	12	2	f	2010-08-27	4344	\N	27163	\N
272787	GENERIC_DAY	12	3	f	2010-07-30	4350	\N	27163	\N
272788	GENERIC_DAY	12	0	f	2010-08-17	4348	\N	27163	\N
272789	GENERIC_DAY	12	3	f	2010-08-16	4344	\N	27163	\N
272790	GENERIC_DAY	12	2	f	2010-08-24	4344	\N	27163	\N
272791	GENERIC_DAY	12	0	f	2010-08-20	4348	\N	27163	\N
272792	GENERIC_DAY	12	3	f	2010-08-04	4348	\N	27163	\N
272793	GENERIC_DAY	12	0	f	2010-08-21	4350	\N	27163	\N
272794	GENERIC_DAY	12	0	f	2010-08-07	4348	\N	27163	\N
272795	GENERIC_DAY	12	0	f	2010-08-21	4358	\N	27163	\N
272796	GENERIC_DAY	12	3	f	2010-08-10	4348	\N	27163	\N
272797	GENERIC_DAY	12	0	f	2010-08-07	4358	\N	27163	\N
272798	GENERIC_DAY	12	3	f	2010-08-19	4350	\N	27163	\N
272799	GENERIC_DAY	12	3	f	2010-08-04	4350	\N	27163	\N
272800	GENERIC_DAY	12	3	f	2010-08-23	4350	\N	27163	\N
272801	GENERIC_DAY	12	0	f	2010-08-28	4344	\N	27163	\N
272802	GENERIC_DAY	12	3	f	2010-08-20	4350	\N	27163	\N
272803	GENERIC_DAY	12	0	f	2010-08-11	4344	\N	27163	\N
272804	GENERIC_DAY	12	0	f	2010-08-22	4350	\N	27163	\N
272805	GENERIC_DAY	12	2	f	2010-08-19	4358	\N	27163	\N
272806	GENERIC_DAY	12	0	f	2010-08-07	4344	\N	27163	\N
272807	GENERIC_DAY	12	0	f	2010-08-28	4348	\N	27163	\N
272808	GENERIC_DAY	12	0	f	2010-08-16	4348	\N	27163	\N
272809	GENERIC_DAY	12	2	f	2010-08-31	4350	\N	27163	\N
272810	GENERIC_DAY	12	0	f	2010-08-02	4344	\N	27163	\N
272811	GENERIC_DAY	12	2	f	2010-08-30	4344	\N	27163	\N
272812	GENERIC_DAY	12	3	f	2010-08-17	4350	\N	27163	\N
272813	GENERIC_DAY	12	0	f	2010-07-31	4358	\N	27163	\N
272814	GENERIC_DAY	12	3	f	2010-08-02	4350	\N	27163	\N
272815	GENERIC_DAY	12	3	f	2010-08-13	4350	\N	27163	\N
272816	GENERIC_DAY	12	0	f	2010-08-06	4344	\N	27163	\N
272817	GENERIC_DAY	12	2	f	2010-09-01	4348	\N	27163	\N
272818	GENERIC_DAY	12	0	f	2010-08-14	4348	\N	27163	\N
272819	GENERIC_DAY	12	0	f	2010-08-19	4348	\N	27163	\N
272820	GENERIC_DAY	12	3	f	2010-08-09	4350	\N	27163	\N
272821	GENERIC_DAY	12	0	f	2010-08-13	4348	\N	27163	\N
272822	GENERIC_DAY	12	2	f	2010-08-11	4358	\N	27163	\N
272823	SPECIFIC_DAY	12	8	f	2010-07-05	1220	31236	\N	\N
272824	SPECIFIC_DAY	12	0	f	2010-07-11	1220	31236	\N	\N
272825	SPECIFIC_DAY	12	8	f	2010-07-09	1220	31236	\N	\N
272826	SPECIFIC_DAY	12	8	f	2010-07-13	1220	31236	\N	\N
272827	SPECIFIC_DAY	12	0	f	2010-07-04	1220	31236	\N	\N
272828	SPECIFIC_DAY	12	8	f	2010-07-06	1220	31236	\N	\N
272829	SPECIFIC_DAY	12	8	f	2010-07-12	1220	31236	\N	\N
272830	SPECIFIC_DAY	12	8	f	2010-07-16	1220	31236	\N	\N
272831	SPECIFIC_DAY	12	0	f	2010-07-03	1220	31236	\N	\N
272832	SPECIFIC_DAY	12	8	f	2010-07-02	1220	31236	\N	\N
272833	SPECIFIC_DAY	12	8	f	2010-07-07	1220	31236	\N	\N
272834	SPECIFIC_DAY	12	4	f	2010-06-30	1220	31236	\N	\N
272835	SPECIFIC_DAY	12	8	f	2010-07-14	1220	31236	\N	\N
272836	SPECIFIC_DAY	12	8	f	2010-07-01	1220	31236	\N	\N
272837	SPECIFIC_DAY	12	0	f	2010-07-10	1220	31236	\N	\N
272838	SPECIFIC_DAY	12	8	f	2010-07-15	1220	31236	\N	\N
272839	SPECIFIC_DAY	12	8	f	2010-07-08	1220	31236	\N	\N
272840	SPECIFIC_DAY	12	8	f	2010-06-24	1216	31235	\N	\N
272841	SPECIFIC_DAY	12	8	f	2010-06-15	1216	31235	\N	\N
272842	SPECIFIC_DAY	12	0	f	2010-06-19	1216	31235	\N	\N
272843	SPECIFIC_DAY	12	8	f	2010-06-21	1216	31235	\N	\N
272844	SPECIFIC_DAY	12	0	f	2010-06-13	1216	31235	\N	\N
272845	SPECIFIC_DAY	12	4	f	2010-06-30	1216	31235	\N	\N
272846	SPECIFIC_DAY	12	8	f	2010-06-18	1216	31235	\N	\N
272847	SPECIFIC_DAY	12	8	f	2010-06-17	1216	31235	\N	\N
272848	SPECIFIC_DAY	12	0	f	2010-06-20	1216	31235	\N	\N
272849	SPECIFIC_DAY	12	8	f	2010-06-14	1216	31235	\N	\N
272850	SPECIFIC_DAY	12	0	f	2010-06-26	1216	31235	\N	\N
272851	SPECIFIC_DAY	12	8	f	2010-06-22	1216	31235	\N	\N
272852	SPECIFIC_DAY	12	8	f	2010-06-29	1216	31235	\N	\N
272853	SPECIFIC_DAY	12	8	f	2010-06-28	1216	31235	\N	\N
272854	SPECIFIC_DAY	12	8	f	2010-06-25	1216	31235	\N	\N
272855	SPECIFIC_DAY	12	8	f	2010-06-23	1216	31235	\N	\N
272856	SPECIFIC_DAY	12	8	f	2010-06-16	1216	31235	\N	\N
272857	SPECIFIC_DAY	12	0	f	2010-06-27	1216	31235	\N	\N
273225	GENERIC_DAY	11	4	f	2010-06-18	4344	\N	27164	\N
273226	GENERIC_DAY	11	0	f	2010-06-25	4350	\N	27164	\N
273227	GENERIC_DAY	11	0	f	2010-06-16	21817	\N	27164	\N
273228	GENERIC_DAY	11	0	f	2010-06-20	4344	\N	27164	\N
273229	GENERIC_DAY	11	0	f	2010-06-26	4348	\N	27164	\N
273230	GENERIC_DAY	11	1	f	2010-06-30	4348	\N	27164	\N
273231	GENERIC_DAY	11	4	f	2010-06-18	4348	\N	27164	\N
273232	GENERIC_DAY	11	0	f	2010-06-19	4350	\N	27164	\N
273233	GENERIC_DAY	11	0	f	2010-06-19	4344	\N	27164	\N
273234	GENERIC_DAY	11	1	f	2010-06-23	21817	\N	27164	\N
273235	GENERIC_DAY	11	0	f	2010-06-19	21817	\N	27164	\N
273236	GENERIC_DAY	11	0	f	2010-06-15	4358	\N	27164	\N
273237	GENERIC_DAY	11	0	f	2010-06-20	4358	\N	27164	\N
273238	GENERIC_DAY	11	6	f	2010-06-28	4344	\N	27164	\N
273239	GENERIC_DAY	11	0	f	2010-06-26	4358	\N	27164	\N
273240	GENERIC_DAY	11	1	f	2010-06-29	4348	\N	27164	\N
273241	GENERIC_DAY	11	0	f	2010-06-20	4348	\N	27164	\N
273242	GENERIC_DAY	11	4	f	2010-06-17	4344	\N	27164	\N
273243	GENERIC_DAY	11	1	f	2010-06-28	21817	\N	27164	\N
273244	GENERIC_DAY	11	1	f	2010-07-01	4348	\N	27164	\N
273245	GENERIC_DAY	11	4	f	2010-06-15	4344	\N	27164	\N
273246	GENERIC_DAY	11	1	f	2010-06-25	21817	\N	27164	\N
273247	GENERIC_DAY	11	3	f	2010-07-01	4344	\N	27164	\N
273248	GENERIC_DAY	11	0	f	2010-06-24	4350	\N	27164	\N
273249	GENERIC_DAY	11	0	f	2010-06-26	4344	\N	27164	\N
273250	GENERIC_DAY	11	2	f	2010-06-25	4348	\N	27164	\N
273251	GENERIC_DAY	11	4	f	2010-06-23	4344	\N	27164	\N
273252	GENERIC_DAY	11	0	f	2010-06-20	21817	\N	27164	\N
273253	GENERIC_DAY	11	4	f	2010-06-16	4348	\N	27164	\N
273254	GENERIC_DAY	11	0	f	2010-06-26	21817	\N	27164	\N
273255	GENERIC_DAY	11	4	f	2010-06-14	4350	\N	27164	\N
273256	GENERIC_DAY	11	0	f	2010-07-01	4350	\N	27164	\N
273257	GENERIC_DAY	11	1	f	2010-06-24	4358	\N	27164	\N
273258	GENERIC_DAY	11	4	f	2010-06-17	4348	\N	27164	\N
273259	GENERIC_DAY	11	0	f	2010-06-18	4350	\N	27164	\N
273260	GENERIC_DAY	11	1	f	2010-06-30	4358	\N	27164	\N
273261	GENERIC_DAY	11	0	f	2010-06-20	4350	\N	27164	\N
273262	GENERIC_DAY	11	0	f	2010-06-19	4358	\N	27164	\N
273263	GENERIC_DAY	11	1	f	2010-06-23	4358	\N	27164	\N
273264	GENERIC_DAY	11	0	f	2010-06-27	4344	\N	27164	\N
273265	GENERIC_DAY	11	6	f	2010-06-29	4344	\N	27164	\N
273266	GENERIC_DAY	11	0	f	2010-06-16	4358	\N	27164	\N
273267	GENERIC_DAY	11	0	f	2010-06-19	4348	\N	27164	\N
273268	GENERIC_DAY	11	0	f	2010-06-27	4358	\N	27164	\N
273269	GENERIC_DAY	11	1	f	2010-06-30	21817	\N	27164	\N
273270	GENERIC_DAY	11	0	f	2010-06-17	4350	\N	27164	\N
273271	GENERIC_DAY	11	0	f	2010-06-26	4350	\N	27164	\N
273272	GENERIC_DAY	11	0	f	2010-06-15	21817	\N	27164	\N
273273	GENERIC_DAY	11	4	f	2010-06-25	4344	\N	27164	\N
273274	GENERIC_DAY	11	0	f	2010-06-27	21817	\N	27164	\N
273275	GENERIC_DAY	11	0	f	2010-06-17	4358	\N	27164	\N
273276	GENERIC_DAY	11	4	f	2010-06-14	4358	\N	27164	\N
273277	GENERIC_DAY	11	0	f	2010-06-27	4348	\N	27164	\N
273278	GENERIC_DAY	11	0	f	2010-06-18	21817	\N	27164	\N
273279	GENERIC_DAY	11	0	f	2010-06-28	4350	\N	27164	\N
273280	GENERIC_DAY	11	0	f	2010-06-30	4350	\N	27164	\N
273281	GENERIC_DAY	11	0	f	2010-06-22	4358	\N	27164	\N
273282	GENERIC_DAY	11	0	f	2010-06-29	4350	\N	27164	\N
273283	GENERIC_DAY	11	0	f	2010-07-01	21817	\N	27164	\N
273284	GENERIC_DAY	11	1	f	2010-06-29	21817	\N	27164	\N
273285	GENERIC_DAY	11	4	f	2010-06-22	4344	\N	27164	\N
273286	GENERIC_DAY	11	4	f	2010-06-22	4348	\N	27164	\N
273287	GENERIC_DAY	11	0	f	2010-06-17	21817	\N	27164	\N
273288	GENERIC_DAY	11	0	f	2010-06-29	4358	\N	27164	\N
273289	GENERIC_DAY	11	1	f	2010-06-28	4348	\N	27164	\N
273290	GENERIC_DAY	11	0	f	2010-07-01	4358	\N	27164	\N
273291	GENERIC_DAY	11	0	f	2010-06-22	4350	\N	27164	\N
273292	GENERIC_DAY	11	2	f	2010-06-23	4348	\N	27164	\N
273293	GENERIC_DAY	11	0	f	2010-06-18	4358	\N	27164	\N
273294	GENERIC_DAY	11	5	f	2010-06-30	4344	\N	27164	\N
273295	GENERIC_DAY	11	0	f	2010-06-22	21817	\N	27164	\N
273296	GENERIC_DAY	11	2	f	2010-06-24	4348	\N	27164	\N
273297	GENERIC_DAY	11	1	f	2010-06-24	21817	\N	27164	\N
273298	GENERIC_DAY	11	0	f	2010-06-15	4350	\N	27164	\N
273299	GENERIC_DAY	11	4	f	2010-06-15	4348	\N	27164	\N
273300	GENERIC_DAY	11	0	f	2010-06-28	4358	\N	27164	\N
273301	GENERIC_DAY	11	1	f	2010-06-25	4358	\N	27164	\N
273302	GENERIC_DAY	11	0	f	2010-06-16	4350	\N	27164	\N
273303	GENERIC_DAY	11	0	f	2010-06-23	4350	\N	27164	\N
273304	GENERIC_DAY	11	4	f	2010-06-16	4344	\N	27164	\N
273305	GENERIC_DAY	11	4	f	2010-06-24	4344	\N	27164	\N
273306	GENERIC_DAY	11	0	f	2010-06-27	4350	\N	27164	\N
273307	GENERIC_DAY	10	7	f	2010-07-15	4354	\N	27165	\N
273308	GENERIC_DAY	10	5	f	2010-07-28	4352	\N	27165	\N
273309	GENERIC_DAY	10	3	f	2010-08-04	4354	\N	27165	\N
273310	GENERIC_DAY	10	7	f	2010-07-09	4354	\N	27165	\N
273311	GENERIC_DAY	10	1	f	2010-07-09	4352	\N	27165	\N
273312	GENERIC_DAY	10	4	f	2010-07-05	4354	\N	27165	\N
273313	GENERIC_DAY	10	6	f	2010-07-23	4354	\N	27165	\N
273314	GENERIC_DAY	10	7	f	2010-07-20	4354	\N	27165	\N
273315	GENERIC_DAY	10	3	f	2010-07-29	4354	\N	27165	\N
273316	GENERIC_DAY	10	4	f	2010-07-02	4354	\N	27165	\N
273317	GENERIC_DAY	10	0	f	2010-07-11	4352	\N	27165	\N
273318	GENERIC_DAY	10	0	f	2010-07-04	4352	\N	27165	\N
273319	GENERIC_DAY	10	3	f	2010-08-03	4354	\N	27165	\N
273320	GENERIC_DAY	10	0	f	2010-07-17	4354	\N	27165	\N
273321	GENERIC_DAY	10	1	f	2010-07-19	4352	\N	27165	\N
273322	GENERIC_DAY	10	0	f	2010-07-18	4352	\N	27165	\N
273323	GENERIC_DAY	10	0	f	2010-07-25	4354	\N	27165	\N
273324	GENERIC_DAY	10	0	f	2010-07-24	4352	\N	27165	\N
273325	GENERIC_DAY	10	0	f	2010-07-31	4354	\N	27165	\N
273326	GENERIC_DAY	10	0	f	2010-08-01	4354	\N	27165	\N
273327	GENERIC_DAY	10	0	f	2010-07-18	4354	\N	27165	\N
273328	GENERIC_DAY	10	3	f	2010-07-28	4354	\N	27165	\N
273329	GENERIC_DAY	10	2	f	2010-07-23	4352	\N	27165	\N
273330	GENERIC_DAY	10	1	f	2010-07-12	4352	\N	27165	\N
273331	GENERIC_DAY	10	7	f	2010-07-13	4354	\N	27165	\N
273332	GENERIC_DAY	10	0	f	2010-07-24	4354	\N	27165	\N
273333	GENERIC_DAY	10	4	f	2010-07-05	4352	\N	27165	\N
273334	GENERIC_DAY	10	2	f	2010-07-26	4352	\N	27165	\N
273335	GENERIC_DAY	10	5	f	2010-08-04	4352	\N	27165	\N
273336	GENERIC_DAY	10	5	f	2010-08-03	4352	\N	27165	\N
273337	GENERIC_DAY	10	0	f	2010-08-01	4352	\N	27165	\N
273338	GENERIC_DAY	10	1	f	2010-07-20	4352	\N	27165	\N
273339	GENERIC_DAY	10	4	f	2010-07-07	4352	\N	27165	\N
273340	GENERIC_DAY	10	0	f	2010-07-11	4354	\N	27165	\N
273341	GENERIC_DAY	10	3	f	2010-07-30	4354	\N	27165	\N
273342	GENERIC_DAY	10	2	f	2010-07-21	4352	\N	27165	\N
273343	GENERIC_DAY	10	0	f	2010-07-03	4354	\N	27165	\N
273344	GENERIC_DAY	10	3	f	2010-08-02	4354	\N	27165	\N
273345	GENERIC_DAY	10	5	f	2010-08-05	4352	\N	27165	\N
273346	GENERIC_DAY	10	7	f	2010-07-14	4354	\N	27165	\N
273347	GENERIC_DAY	10	0	f	2010-07-31	4352	\N	27165	\N
273348	GENERIC_DAY	10	0	f	2010-07-25	4352	\N	27165	\N
273349	GENERIC_DAY	10	2	f	2010-07-22	4352	\N	27165	\N
273350	GENERIC_DAY	10	4	f	2010-07-06	4354	\N	27165	\N
273351	GENERIC_DAY	10	1	f	2010-07-16	4352	\N	27165	\N
273352	GENERIC_DAY	10	7	f	2010-07-12	4354	\N	27165	\N
273353	GENERIC_DAY	10	0	f	2010-07-17	4352	\N	27165	\N
273354	GENERIC_DAY	10	0	f	2010-07-04	4354	\N	27165	\N
273355	GENERIC_DAY	10	0	f	2010-07-10	4354	\N	27165	\N
273356	GENERIC_DAY	10	7	f	2010-07-19	4354	\N	27165	\N
273357	GENERIC_DAY	10	4	f	2010-07-06	4352	\N	27165	\N
273358	GENERIC_DAY	10	5	f	2010-07-08	4354	\N	27165	\N
273359	GENERIC_DAY	10	0	f	2010-07-10	4352	\N	27165	\N
273360	GENERIC_DAY	10	1	f	2010-07-14	4352	\N	27165	\N
273361	GENERIC_DAY	10	2	f	2010-07-27	4352	\N	27165	\N
273362	GENERIC_DAY	10	0	f	2010-07-03	4352	\N	27165	\N
273363	GENERIC_DAY	10	3	f	2010-08-05	4354	\N	27165	\N
273364	GENERIC_DAY	10	6	f	2010-07-26	4354	\N	27165	\N
273365	GENERIC_DAY	10	6	f	2010-07-21	4354	\N	27165	\N
273366	GENERIC_DAY	10	1	f	2010-07-15	4352	\N	27165	\N
273367	GENERIC_DAY	10	4	f	2010-07-07	4354	\N	27165	\N
273368	GENERIC_DAY	10	5	f	2010-07-30	4352	\N	27165	\N
273369	GENERIC_DAY	10	7	f	2010-07-16	4354	\N	27165	\N
273370	GENERIC_DAY	10	6	f	2010-07-22	4354	\N	27165	\N
273371	GENERIC_DAY	10	4	f	2010-07-02	4352	\N	27165	\N
273372	GENERIC_DAY	10	5	f	2010-08-02	4352	\N	27165	\N
273373	GENERIC_DAY	10	5	f	2010-07-29	4352	\N	27165	\N
273374	GENERIC_DAY	10	3	f	2010-07-08	4352	\N	27165	\N
273375	GENERIC_DAY	10	1	f	2010-07-13	4352	\N	27165	\N
273376	GENERIC_DAY	10	6	f	2010-07-27	4354	\N	27165	\N
273377	GENERIC_DAY	9	0	f	2010-07-10	1220	\N	271792	\N
273378	GENERIC_DAY	9	0	f	2010-07-11	1220	\N	271792	\N
273379	GENERIC_DAY	9	6	f	2010-07-09	1216	\N	271792	\N
273380	GENERIC_DAY	9	6	f	2010-07-01	1216	\N	271792	\N
273381	GENERIC_DAY	9	6	f	2010-07-13	1220	\N	271792	\N
273382	GENERIC_DAY	9	0	t	2010-06-19	1220	\N	271792	\N
273383	GENERIC_DAY	9	6	f	2010-07-12	1216	\N	271792	\N
273384	GENERIC_DAY	9	6	f	2010-07-07	1220	\N	271792	\N
273385	GENERIC_DAY	9	6	f	2010-06-25	1220	\N	271792	\N
273386	GENERIC_DAY	9	0	t	2010-06-24	1216	\N	271792	\N
273387	GENERIC_DAY	9	0	t	2010-06-23	1216	\N	271792	\N
273388	GENERIC_DAY	9	2	t	2010-06-16	1216	\N	271792	\N
273389	GENERIC_DAY	9	6	t	2010-06-18	1220	\N	271792	\N
273390	GENERIC_DAY	9	0	f	2010-07-04	1220	\N	271792	\N
273391	GENERIC_DAY	9	0	f	2010-07-04	1216	\N	271792	\N
273392	GENERIC_DAY	9	6	f	2010-07-08	1216	\N	271792	\N
273393	GENERIC_DAY	9	0	f	2010-07-03	1220	\N	271792	\N
273394	GENERIC_DAY	9	2	f	2010-07-15	1220	\N	271792	\N
273395	GENERIC_DAY	9	6	f	2010-06-28	1220	\N	271792	\N
273396	GENERIC_DAY	9	6	f	2010-07-14	1220	\N	271792	\N
273397	GENERIC_DAY	9	0	t	2010-06-20	1220	\N	271792	\N
273398	GENERIC_DAY	9	1	t	2010-06-14	1216	\N	271792	\N
273399	GENERIC_DAY	9	2	t	2010-06-18	1216	\N	271792	\N
273400	GENERIC_DAY	9	8	t	2010-06-24	1220	\N	271792	\N
273401	GENERIC_DAY	9	6	f	2010-07-02	1216	\N	271792	\N
273402	GENERIC_DAY	9	6	f	2010-07-12	1220	\N	271792	\N
273403	GENERIC_DAY	9	6	f	2010-06-29	1216	\N	271792	\N
273404	GENERIC_DAY	9	6	f	2010-06-29	1220	\N	271792	\N
273405	GENERIC_DAY	9	6	f	2010-07-02	1220	\N	271792	\N
273406	GENERIC_DAY	9	0	f	2010-06-26	1216	\N	271792	\N
273407	GENERIC_DAY	9	6	f	2010-07-14	1216	\N	271792	\N
273408	GENERIC_DAY	9	6	t	2010-06-21	1220	\N	271792	\N
273409	GENERIC_DAY	9	0	t	2010-06-22	1216	\N	271792	\N
273410	GENERIC_DAY	9	0	t	2010-06-20	1216	\N	271792	\N
273411	GENERIC_DAY	9	2	t	2010-06-15	1216	\N	271792	\N
273412	GENERIC_DAY	9	6	f	2010-06-30	1220	\N	271792	\N
273413	GENERIC_DAY	9	6	f	2010-07-05	1220	\N	271792	\N
273414	GENERIC_DAY	9	0	f	2010-06-27	1220	\N	271792	\N
273415	GENERIC_DAY	9	6	t	2010-06-17	1220	\N	271792	\N
273416	GENERIC_DAY	9	6	f	2010-07-07	1216	\N	271792	\N
273417	GENERIC_DAY	9	6	f	2010-07-13	1216	\N	271792	\N
273418	GENERIC_DAY	9	6	f	2010-07-08	1220	\N	271792	\N
273419	GENERIC_DAY	9	6	f	2010-06-25	1216	\N	271792	\N
273420	GENERIC_DAY	9	0	f	2010-06-26	1220	\N	271792	\N
273421	GENERIC_DAY	9	6	f	2010-06-30	1216	\N	271792	\N
273422	GENERIC_DAY	9	2	t	2010-06-21	1216	\N	271792	\N
273423	GENERIC_DAY	9	6	f	2010-07-06	1216	\N	271792	\N
273424	GENERIC_DAY	9	2	t	2010-06-17	1216	\N	271792	\N
273425	GENERIC_DAY	9	0	t	2010-06-19	1216	\N	271792	\N
273426	GENERIC_DAY	9	0	f	2010-07-11	1216	\N	271792	\N
273427	GENERIC_DAY	9	2	f	2010-07-15	1216	\N	271792	\N
273428	GENERIC_DAY	9	6	f	2010-07-01	1220	\N	271792	\N
273429	GENERIC_DAY	9	6	f	2010-07-09	1220	\N	271792	\N
273430	GENERIC_DAY	9	6	t	2010-06-15	1220	\N	271792	\N
273431	GENERIC_DAY	9	8	t	2010-06-22	1220	\N	271792	\N
273432	GENERIC_DAY	9	0	f	2010-07-03	1216	\N	271792	\N
273433	GENERIC_DAY	9	0	f	2010-06-27	1216	\N	271792	\N
273434	GENERIC_DAY	9	6	f	2010-07-06	1220	\N	271792	\N
273435	GENERIC_DAY	9	6	t	2010-06-16	1220	\N	271792	\N
273436	GENERIC_DAY	9	6	f	2010-06-28	1216	\N	271792	\N
273437	GENERIC_DAY	9	7	t	2010-06-14	1220	\N	271792	\N
273438	GENERIC_DAY	9	6	f	2010-07-05	1216	\N	271792	\N
273439	GENERIC_DAY	9	0	f	2010-07-10	1216	\N	271792	\N
273440	GENERIC_DAY	9	8	t	2010-06-23	1220	\N	271792	\N
273733	GENERIC_DAY	8	3	f	2010-09-03	4348	\N	271793	\N
273734	GENERIC_DAY	8	3	t	2010-07-07	4348	\N	271793	\N
273735	GENERIC_DAY	8	4	f	2010-07-26	4348	\N	271793	\N
273736	GENERIC_DAY	8	3	f	2010-09-09	4344	\N	271793	\N
273737	GENERIC_DAY	8	0	f	2010-08-04	4344	\N	271793	\N
273738	GENERIC_DAY	8	3	f	2010-08-24	4350	\N	271793	\N
273739	GENERIC_DAY	8	3	f	2010-08-30	4348	\N	271793	\N
273740	GENERIC_DAY	8	0	f	2010-08-10	4344	\N	271793	\N
273741	GENERIC_DAY	8	0	f	2010-07-26	4344	\N	271793	\N
273742	GENERIC_DAY	8	3	t	2010-07-15	4358	\N	271793	\N
273743	GENERIC_DAY	8	3	f	2010-09-22	4348	\N	271793	\N
273744	GENERIC_DAY	8	2	f	2010-09-06	4358	\N	271793	\N
273745	GENERIC_DAY	8	0	t	2010-07-06	4344	\N	271793	\N
273746	GENERIC_DAY	8	0	f	2010-08-21	4344	\N	271793	\N
273747	GENERIC_DAY	8	0	t	2010-07-03	4350	\N	271793	\N
273748	GENERIC_DAY	8	3	f	2010-08-25	4350	\N	271793	\N
273749	GENERIC_DAY	8	0	f	2010-07-28	4344	\N	271793	\N
273750	GENERIC_DAY	8	0	f	2010-09-26	4358	\N	271793	\N
273751	GENERIC_DAY	8	4	f	2010-08-23	4344	\N	271793	\N
273752	GENERIC_DAY	8	4	f	2010-08-09	4348	\N	271793	\N
273753	GENERIC_DAY	8	2	t	2010-07-05	4358	\N	271793	\N
273754	GENERIC_DAY	8	2	f	2010-09-01	4358	\N	271793	\N
273755	GENERIC_DAY	8	4	f	2010-07-23	4348	\N	271793	\N
273756	GENERIC_DAY	8	3	f	2010-08-31	4350	\N	271793	\N
273757	GENERIC_DAY	8	2	f	2010-09-20	4358	\N	271793	\N
273758	GENERIC_DAY	8	2	t	2010-07-12	4348	\N	271793	\N
273759	GENERIC_DAY	8	2	f	2010-09-09	4358	\N	271793	\N
273760	GENERIC_DAY	8	3	t	2010-07-14	4348	\N	271793	\N
273761	GENERIC_DAY	8	4	f	2010-08-16	4350	\N	271793	\N
273762	GENERIC_DAY	8	0	f	2010-09-04	4358	\N	271793	\N
273763	GENERIC_DAY	8	0	f	2010-09-19	4344	\N	271793	\N
273764	GENERIC_DAY	8	4	f	2010-08-19	4344	\N	271793	\N
273765	GENERIC_DAY	8	3	f	2010-08-24	4344	\N	271793	\N
273766	GENERIC_DAY	8	4	f	2010-08-11	4348	\N	271793	\N
273767	GENERIC_DAY	8	3	f	2010-08-09	4358	\N	271793	\N
273768	GENERIC_DAY	8	0	t	2010-07-12	4344	\N	271793	\N
273769	GENERIC_DAY	8	3	f	2010-08-23	4358	\N	271793	\N
273770	GENERIC_DAY	8	2	f	2010-09-17	4358	\N	271793	\N
273771	GENERIC_DAY	8	3	f	2010-08-03	4358	\N	271793	\N
273772	GENERIC_DAY	8	4	f	2010-08-11	4350	\N	271793	\N
273773	GENERIC_DAY	8	3	f	2010-08-23	4350	\N	271793	\N
273774	GENERIC_DAY	8	2	f	2010-09-24	4344	\N	271793	\N
273775	GENERIC_DAY	8	4	f	2010-07-23	4350	\N	271793	\N
273776	GENERIC_DAY	8	3	f	2010-09-03	4344	\N	271793	\N
273777	GENERIC_DAY	8	0	f	2010-07-29	4344	\N	271793	\N
273778	GENERIC_DAY	8	0	f	2010-07-24	4358	\N	271793	\N
273779	GENERIC_DAY	8	0	f	2010-08-15	4350	\N	271793	\N
273780	GENERIC_DAY	8	4	f	2010-07-21	4350	\N	271793	\N
273781	GENERIC_DAY	8	2	f	2010-08-30	4358	\N	271793	\N
273782	GENERIC_DAY	8	0	f	2010-09-18	4350	\N	271793	\N
273783	GENERIC_DAY	8	0	f	2010-09-19	4348	\N	271793	\N
273784	GENERIC_DAY	8	2	t	2010-07-16	4350	\N	271793	\N
273785	GENERIC_DAY	8	0	t	2010-07-07	4344	\N	271793	\N
273786	GENERIC_DAY	8	3	f	2010-09-21	4350	\N	271793	\N
273787	GENERIC_DAY	8	0	f	2010-09-26	4344	\N	271793	\N
273788	GENERIC_DAY	8	1	f	2010-09-27	4344	\N	271793	\N
273789	GENERIC_DAY	8	3	f	2010-07-30	4358	\N	271793	\N
273790	GENERIC_DAY	8	4	f	2010-07-26	4350	\N	271793	\N
273791	GENERIC_DAY	8	0	f	2010-09-25	4358	\N	271793	\N
273792	GENERIC_DAY	8	0	f	2010-07-17	4350	\N	271793	\N
273793	GENERIC_DAY	8	0	f	2010-07-27	4344	\N	271793	\N
273794	GENERIC_DAY	8	3	f	2010-09-13	4350	\N	271793	\N
273795	GENERIC_DAY	8	2	t	2010-07-13	21817	\N	271793	\N
273796	GENERIC_DAY	8	3	f	2010-08-31	4348	\N	271793	\N
273797	GENERIC_DAY	8	0	t	2010-07-03	21817	\N	271793	\N
273798	GENERIC_DAY	8	3	f	2010-08-05	4358	\N	271793	\N
273799	GENERIC_DAY	8	0	f	2010-07-31	4358	\N	271793	\N
273800	GENERIC_DAY	8	3	f	2010-08-17	4358	\N	271793	\N
273801	GENERIC_DAY	8	3	f	2010-09-09	4350	\N	271793	\N
273802	GENERIC_DAY	8	0	f	2010-08-14	4348	\N	271793	\N
273803	GENERIC_DAY	8	4	f	2010-08-20	4344	\N	271793	\N
273804	GENERIC_DAY	8	2	f	2010-09-23	4358	\N	271793	\N
273805	GENERIC_DAY	8	4	f	2010-07-27	4350	\N	271793	\N
273806	GENERIC_DAY	8	3	f	2010-08-24	4348	\N	271793	\N
273807	GENERIC_DAY	8	4	f	2010-08-06	4348	\N	271793	\N
273808	GENERIC_DAY	8	2	t	2010-07-02	4358	\N	271793	\N
273809	GENERIC_DAY	8	0	t	2010-07-15	4344	\N	271793	\N
273810	GENERIC_DAY	8	3	f	2010-08-25	4348	\N	271793	\N
273811	GENERIC_DAY	8	0	f	2010-08-08	4344	\N	271793	\N
273812	GENERIC_DAY	8	3	f	2010-09-14	4348	\N	271793	\N
273813	GENERIC_DAY	8	2	f	2010-09-10	4358	\N	271793	\N
273814	GENERIC_DAY	8	0	t	2010-07-02	4344	\N	271793	\N
273815	GENERIC_DAY	8	4	f	2010-07-19	4348	\N	271793	\N
273816	GENERIC_DAY	8	3	f	2010-09-07	4348	\N	271793	\N
273817	GENERIC_DAY	8	3	f	2010-07-29	4358	\N	271793	\N
273818	GENERIC_DAY	8	3	f	2010-09-21	4344	\N	271793	\N
273819	GENERIC_DAY	8	3	f	2010-09-15	4348	\N	271793	\N
273820	GENERIC_DAY	8	4	f	2010-07-22	4350	\N	271793	\N
273821	GENERIC_DAY	8	3	f	2010-09-07	4344	\N	271793	\N
273822	GENERIC_DAY	8	3	f	2010-09-15	4344	\N	271793	\N
273823	GENERIC_DAY	8	4	f	2010-08-06	4350	\N	271793	\N
273824	GENERIC_DAY	8	4	f	2010-07-29	4348	\N	271793	\N
273825	GENERIC_DAY	8	3	f	2010-09-08	4348	\N	271793	\N
273826	GENERIC_DAY	8	0	f	2010-08-13	4348	\N	271793	\N
273827	GENERIC_DAY	8	2	t	2010-07-08	4350	\N	271793	\N
273828	GENERIC_DAY	8	3	f	2010-09-20	4348	\N	271793	\N
273829	GENERIC_DAY	8	0	t	2010-07-03	4344	\N	271793	\N
273830	GENERIC_DAY	8	0	t	2010-07-04	4358	\N	271793	\N
273831	GENERIC_DAY	8	3	f	2010-09-10	4348	\N	271793	\N
273832	GENERIC_DAY	8	3	f	2010-09-16	4350	\N	271793	\N
273833	GENERIC_DAY	8	0	f	2010-08-22	4348	\N	271793	\N
273834	GENERIC_DAY	8	3	f	2010-09-02	4344	\N	271793	\N
273835	GENERIC_DAY	8	0	f	2010-07-22	4344	\N	271793	\N
273836	GENERIC_DAY	8	0	f	2010-07-31	4344	\N	271793	\N
273837	GENERIC_DAY	8	0	f	2010-08-11	4344	\N	271793	\N
273838	GENERIC_DAY	8	0	f	2010-07-21	4344	\N	271793	\N
273839	GENERIC_DAY	8	0	f	2010-07-24	4348	\N	271793	\N
273840	GENERIC_DAY	8	3	f	2010-08-27	4358	\N	271793	\N
273841	GENERIC_DAY	8	0	f	2010-07-20	4344	\N	271793	\N
273842	GENERIC_DAY	8	0	f	2010-08-29	4350	\N	271793	\N
273843	GENERIC_DAY	8	4	f	2010-07-28	4348	\N	271793	\N
273844	GENERIC_DAY	8	2	t	2010-07-13	4350	\N	271793	\N
273845	GENERIC_DAY	8	3	f	2010-09-13	4344	\N	271793	\N
273846	GENERIC_DAY	8	2	t	2010-07-12	21817	\N	271793	\N
273847	GENERIC_DAY	8	4	f	2010-08-17	4344	\N	271793	\N
273848	GENERIC_DAY	8	2	f	2010-09-03	4358	\N	271793	\N
273849	GENERIC_DAY	8	0	f	2010-08-17	4348	\N	271793	\N
273850	GENERIC_DAY	8	3	f	2010-09-06	4350	\N	271793	\N
273851	GENERIC_DAY	8	0	f	2010-09-04	4344	\N	271793	\N
273852	GENERIC_DAY	8	0	f	2010-09-04	4348	\N	271793	\N
273853	GENERIC_DAY	8	0	f	2010-07-17	4348	\N	271793	\N
273854	GENERIC_DAY	8	3	f	2010-09-14	4344	\N	271793	\N
273855	GENERIC_DAY	8	0	f	2010-08-08	4348	\N	271793	\N
273856	GENERIC_DAY	8	0	t	2010-07-11	21817	\N	271793	\N
273857	GENERIC_DAY	8	0	t	2010-07-10	21817	\N	271793	\N
273858	GENERIC_DAY	8	4	f	2010-08-18	4350	\N	271793	\N
273859	GENERIC_DAY	8	3	t	2010-07-02	4348	\N	271793	\N
273860	GENERIC_DAY	8	0	f	2010-09-05	4348	\N	271793	\N
273861	GENERIC_DAY	8	3	f	2010-07-19	4358	\N	271793	\N
273862	GENERIC_DAY	8	3	f	2010-09-03	4350	\N	271793	\N
273863	GENERIC_DAY	8	3	t	2010-07-16	4348	\N	271793	\N
273864	GENERIC_DAY	8	0	f	2010-09-05	4358	\N	271793	\N
273865	GENERIC_DAY	8	0	f	2010-09-25	4344	\N	271793	\N
273866	GENERIC_DAY	8	2	f	2010-09-14	4358	\N	271793	\N
273867	GENERIC_DAY	8	0	t	2010-07-06	4350	\N	271793	\N
273868	GENERIC_DAY	8	4	f	2010-08-12	4350	\N	271793	\N
273869	GENERIC_DAY	8	0	f	2010-09-12	4348	\N	271793	\N
273870	GENERIC_DAY	8	3	f	2010-09-06	4348	\N	271793	\N
273871	GENERIC_DAY	8	4	f	2010-08-02	4348	\N	271793	\N
273872	GENERIC_DAY	8	0	f	2010-09-26	4350	\N	271793	\N
273873	GENERIC_DAY	8	3	f	2010-09-02	4350	\N	271793	\N
273874	GENERIC_DAY	8	0	f	2010-08-14	4358	\N	271793	\N
273875	GENERIC_DAY	8	0	t	2010-07-03	4348	\N	271793	\N
273876	GENERIC_DAY	8	2	f	2010-08-24	4358	\N	271793	\N
273877	GENERIC_DAY	8	3	f	2010-09-01	4348	\N	271793	\N
273878	GENERIC_DAY	8	3	f	2010-08-19	4358	\N	271793	\N
273879	GENERIC_DAY	8	0	f	2010-09-27	4350	\N	271793	\N
273880	GENERIC_DAY	8	0	f	2010-08-02	4344	\N	271793	\N
273881	GENERIC_DAY	8	0	f	2010-09-25	4348	\N	271793	\N
273882	GENERIC_DAY	8	1	f	2010-08-23	4348	\N	271793	\N
273883	GENERIC_DAY	8	0	f	2010-08-08	4358	\N	271793	\N
273884	GENERIC_DAY	8	0	f	2010-08-01	4348	\N	271793	\N
273885	GENERIC_DAY	8	0	f	2010-07-17	4344	\N	271793	\N
273886	GENERIC_DAY	8	4	f	2010-07-19	4350	\N	271793	\N
273887	GENERIC_DAY	8	0	f	2010-07-23	4344	\N	271793	\N
273888	GENERIC_DAY	8	0	f	2010-09-19	4358	\N	271793	\N
273889	GENERIC_DAY	8	0	t	2010-07-05	4344	\N	271793	\N
273890	GENERIC_DAY	8	0	f	2010-08-19	4348	\N	271793	\N
273891	GENERIC_DAY	8	3	f	2010-09-17	4344	\N	271793	\N
273892	GENERIC_DAY	8	0	f	2010-08-29	4348	\N	271793	\N
273893	GENERIC_DAY	8	3	f	2010-08-26	4344	\N	271793	\N
273894	GENERIC_DAY	8	0	f	2010-09-05	4344	\N	271793	\N
273895	GENERIC_DAY	8	4	f	2010-08-17	4350	\N	271793	\N
273896	GENERIC_DAY	8	2	f	2010-08-25	4358	\N	271793	\N
273897	GENERIC_DAY	8	3	f	2010-07-23	4358	\N	271793	\N
273898	GENERIC_DAY	8	3	t	2010-07-16	4358	\N	271793	\N
273899	GENERIC_DAY	8	0	f	2010-08-21	4350	\N	271793	\N
273900	GENERIC_DAY	8	3	f	2010-09-14	4350	\N	271793	\N
273901	GENERIC_DAY	8	2	f	2010-09-22	4358	\N	271793	\N
273902	GENERIC_DAY	8	3	f	2010-08-13	4358	\N	271793	\N
273903	GENERIC_DAY	8	2	f	2010-09-21	4358	\N	271793	\N
273904	GENERIC_DAY	8	4	f	2010-08-09	4350	\N	271793	\N
273905	GENERIC_DAY	8	2	f	2010-09-15	4358	\N	271793	\N
273906	GENERIC_DAY	8	0	f	2010-09-18	4358	\N	271793	\N
273907	GENERIC_DAY	8	3	f	2010-09-22	4344	\N	271793	\N
273908	GENERIC_DAY	8	0	f	2010-07-17	4358	\N	271793	\N
273909	GENERIC_DAY	8	3	f	2010-09-24	4358	\N	271793	\N
273910	GENERIC_DAY	8	2	t	2010-07-12	4358	\N	271793	\N
273911	GENERIC_DAY	8	4	f	2010-07-30	4348	\N	271793	\N
273912	GENERIC_DAY	8	3	f	2010-09-17	4348	\N	271793	\N
273913	GENERIC_DAY	8	3	f	2010-08-11	4358	\N	271793	\N
273914	GENERIC_DAY	8	0	f	2010-09-11	4350	\N	271793	\N
273915	GENERIC_DAY	8	0	f	2010-07-25	4358	\N	271793	\N
273916	GENERIC_DAY	8	2	t	2010-07-06	4358	\N	271793	\N
273917	GENERIC_DAY	8	2	t	2010-07-12	4350	\N	271793	\N
273918	GENERIC_DAY	8	3	f	2010-09-23	4348	\N	271793	\N
273919	GENERIC_DAY	8	0	t	2010-07-10	4348	\N	271793	\N
273920	GENERIC_DAY	8	0	f	2010-08-22	4344	\N	271793	\N
273921	GENERIC_DAY	8	0	t	2010-07-13	4344	\N	271793	\N
273922	GENERIC_DAY	8	3	f	2010-09-10	4350	\N	271793	\N
273923	GENERIC_DAY	8	0	t	2010-07-10	4350	\N	271793	\N
273924	GENERIC_DAY	8	0	t	2010-07-14	4344	\N	271793	\N
273925	GENERIC_DAY	8	0	f	2010-07-18	4358	\N	271793	\N
273926	GENERIC_DAY	8	4	f	2010-08-16	4344	\N	271793	\N
273927	GENERIC_DAY	8	4	f	2010-07-29	4350	\N	271793	\N
273928	GENERIC_DAY	8	0	t	2010-07-10	4358	\N	271793	\N
273929	GENERIC_DAY	8	2	f	2010-09-07	4358	\N	271793	\N
273930	GENERIC_DAY	8	0	f	2010-08-01	4350	\N	271793	\N
273931	GENERIC_DAY	8	3	f	2010-09-08	4350	\N	271793	\N
273932	GENERIC_DAY	8	0	f	2010-07-24	4350	\N	271793	\N
273933	GENERIC_DAY	8	4	f	2010-08-03	4350	\N	271793	\N
273934	GENERIC_DAY	8	0	f	2010-08-22	4358	\N	271793	\N
273935	GENERIC_DAY	8	4	f	2010-08-05	4348	\N	271793	\N
273936	GENERIC_DAY	8	0	f	2010-08-07	4348	\N	271793	\N
273937	GENERIC_DAY	8	4	f	2010-08-13	4350	\N	271793	\N
273938	GENERIC_DAY	8	3	t	2010-07-02	21817	\N	271793	\N
273939	GENERIC_DAY	8	2	f	2010-08-31	4358	\N	271793	\N
273940	GENERIC_DAY	8	0	f	2010-08-12	4344	\N	271793	\N
273941	GENERIC_DAY	8	4	f	2010-08-10	4350	\N	271793	\N
273942	GENERIC_DAY	8	3	f	2010-08-30	4344	\N	271793	\N
273943	GENERIC_DAY	8	0	t	2010-07-16	4344	\N	271793	\N
273944	GENERIC_DAY	8	4	f	2010-08-12	4348	\N	271793	\N
273945	GENERIC_DAY	8	2	t	2010-07-08	4348	\N	271793	\N
273946	GENERIC_DAY	8	0	f	2010-07-25	4344	\N	271793	\N
273947	GENERIC_DAY	8	0	f	2010-07-18	4348	\N	271793	\N
273948	GENERIC_DAY	8	2	t	2010-07-14	4358	\N	271793	\N
273949	GENERIC_DAY	8	2	t	2010-07-15	4350	\N	271793	\N
273950	GENERIC_DAY	8	0	f	2010-09-12	4344	\N	271793	\N
273951	GENERIC_DAY	8	3	f	2010-07-26	4358	\N	271793	\N
273952	GENERIC_DAY	8	3	f	2010-07-20	4358	\N	271793	\N
273953	GENERIC_DAY	8	0	f	2010-07-18	4344	\N	271793	\N
273954	GENERIC_DAY	8	0	f	2010-09-19	4350	\N	271793	\N
273955	GENERIC_DAY	8	3	f	2010-07-21	4358	\N	271793	\N
273956	GENERIC_DAY	8	2	t	2010-07-09	4358	\N	271793	\N
273957	GENERIC_DAY	8	2	t	2010-07-09	4350	\N	271793	\N
273958	GENERIC_DAY	8	0	t	2010-07-03	4358	\N	271793	\N
273959	GENERIC_DAY	8	3	f	2010-07-28	4350	\N	271793	\N
273960	GENERIC_DAY	8	3	f	2010-08-26	4348	\N	271793	\N
273961	GENERIC_DAY	8	4	f	2010-07-20	4350	\N	271793	\N
273962	GENERIC_DAY	8	0	f	2010-07-18	4350	\N	271793	\N
273963	GENERIC_DAY	8	3	t	2010-07-06	21817	\N	271793	\N
273964	GENERIC_DAY	8	0	t	2010-07-05	4350	\N	271793	\N
273965	GENERIC_DAY	8	2	f	2010-09-13	4358	\N	271793	\N
273966	GENERIC_DAY	8	0	f	2010-08-01	4358	\N	271793	\N
273967	GENERIC_DAY	8	0	t	2010-07-11	4358	\N	271793	\N
273968	GENERIC_DAY	8	0	f	2010-07-25	4348	\N	271793	\N
273969	GENERIC_DAY	8	2	t	2010-07-13	4348	\N	271793	\N
273970	GENERIC_DAY	8	2	f	2010-08-26	4358	\N	271793	\N
273971	GENERIC_DAY	8	4	f	2010-08-02	4350	\N	271793	\N
273972	GENERIC_DAY	8	1	f	2010-09-27	4348	\N	271793	\N
273973	GENERIC_DAY	8	0	t	2010-07-08	4344	\N	271793	\N
273974	GENERIC_DAY	8	0	f	2010-08-15	4358	\N	271793	\N
273975	GENERIC_DAY	8	0	f	2010-08-28	4350	\N	271793	\N
273976	GENERIC_DAY	8	0	f	2010-08-18	4348	\N	271793	\N
273977	GENERIC_DAY	8	3	f	2010-09-01	4344	\N	271793	\N
273978	GENERIC_DAY	8	3	f	2010-09-16	4348	\N	271793	\N
273979	GENERIC_DAY	8	3	f	2010-09-24	4350	\N	271793	\N
273980	GENERIC_DAY	8	3	f	2010-09-10	4344	\N	271793	\N
273981	GENERIC_DAY	8	2	t	2010-07-07	4358	\N	271793	\N
273982	GENERIC_DAY	8	0	f	2010-09-11	4344	\N	271793	\N
273983	GENERIC_DAY	8	2	t	2010-07-13	4358	\N	271793	\N
273984	GENERIC_DAY	8	4	f	2010-07-20	4348	\N	271793	\N
273985	GENERIC_DAY	8	4	f	2010-07-30	4350	\N	271793	\N
273986	GENERIC_DAY	8	4	f	2010-08-10	4348	\N	271793	\N
273987	GENERIC_DAY	8	3	f	2010-09-23	4344	\N	271793	\N
273988	GENERIC_DAY	8	3	f	2010-09-13	4348	\N	271793	\N
273989	GENERIC_DAY	8	3	f	2010-08-25	4344	\N	271793	\N
273990	GENERIC_DAY	8	0	f	2010-08-28	4344	\N	271793	\N
273991	GENERIC_DAY	8	4	f	2010-08-13	4344	\N	271793	\N
273992	GENERIC_DAY	8	0	t	2010-07-11	4348	\N	271793	\N
273993	GENERIC_DAY	8	3	f	2010-09-08	4344	\N	271793	\N
273994	GENERIC_DAY	8	4	f	2010-07-21	4348	\N	271793	\N
273995	GENERIC_DAY	8	0	t	2010-07-02	4350	\N	271793	\N
273996	GENERIC_DAY	8	0	t	2010-07-04	4350	\N	271793	\N
273997	GENERIC_DAY	8	0	f	2010-09-18	4344	\N	271793	\N
273998	GENERIC_DAY	8	0	t	2010-07-07	4350	\N	271793	\N
273999	GENERIC_DAY	8	3	f	2010-08-26	4350	\N	271793	\N
274000	GENERIC_DAY	8	0	f	2010-09-18	4348	\N	271793	\N
274001	GENERIC_DAY	8	4	f	2010-08-20	4350	\N	271793	\N
274002	GENERIC_DAY	8	0	f	2010-08-14	4350	\N	271793	\N
274003	GENERIC_DAY	8	2	t	2010-07-08	4358	\N	271793	\N
274004	GENERIC_DAY	8	0	f	2010-08-15	4344	\N	271793	\N
274005	GENERIC_DAY	8	4	f	2010-07-27	4348	\N	271793	\N
274006	GENERIC_DAY	8	0	f	2010-08-05	4344	\N	271793	\N
274007	GENERIC_DAY	8	3	f	2010-08-30	4350	\N	271793	\N
274008	GENERIC_DAY	8	3	f	2010-09-02	4348	\N	271793	\N
274009	GENERIC_DAY	8	3	f	2010-09-06	4344	\N	271793	\N
274010	GENERIC_DAY	8	3	f	2010-08-04	4358	\N	271793	\N
274011	GENERIC_DAY	8	0	f	2010-08-03	4344	\N	271793	\N
274012	GENERIC_DAY	8	0	f	2010-08-01	4344	\N	271793	\N
274013	GENERIC_DAY	8	0	f	2010-08-21	4348	\N	271793	\N
274014	GENERIC_DAY	8	0	t	2010-07-04	4348	\N	271793	\N
274015	GENERIC_DAY	8	3	f	2010-07-27	4358	\N	271793	\N
274016	GENERIC_DAY	8	0	f	2010-08-20	4348	\N	271793	\N
274017	GENERIC_DAY	8	0	f	2010-09-04	4350	\N	271793	\N
274018	GENERIC_DAY	8	3	t	2010-07-05	4348	\N	271793	\N
274019	GENERIC_DAY	8	0	f	2010-09-26	4348	\N	271793	\N
274020	GENERIC_DAY	8	2	f	2010-09-16	4358	\N	271793	\N
274021	GENERIC_DAY	8	0	f	2010-07-31	4350	\N	271793	\N
274022	GENERIC_DAY	8	3	f	2010-09-16	4344	\N	271793	\N
274023	GENERIC_DAY	8	4	f	2010-08-04	4348	\N	271793	\N
274024	GENERIC_DAY	8	0	f	2010-09-25	4350	\N	271793	\N
274025	GENERIC_DAY	8	3	f	2010-09-09	4348	\N	271793	\N
274026	GENERIC_DAY	8	3	t	2010-07-14	4350	\N	271793	\N
274027	GENERIC_DAY	8	2	f	2010-09-08	4358	\N	271793	\N
274028	GENERIC_DAY	8	3	f	2010-09-24	4348	\N	271793	\N
274029	GENERIC_DAY	8	0	f	2010-07-25	4350	\N	271793	\N
274030	GENERIC_DAY	8	4	f	2010-08-03	4348	\N	271793	\N
274031	GENERIC_DAY	8	0	f	2010-07-31	4348	\N	271793	\N
274032	GENERIC_DAY	8	2	t	2010-07-08	21817	\N	271793	\N
274033	GENERIC_DAY	8	3	f	2010-08-02	4358	\N	271793	\N
274034	GENERIC_DAY	8	0	f	2010-08-07	4344	\N	271793	\N
274035	GENERIC_DAY	8	3	f	2010-09-20	4350	\N	271793	\N
274036	GENERIC_DAY	8	0	f	2010-08-07	4350	\N	271793	\N
274037	GENERIC_DAY	8	4	f	2010-08-05	4350	\N	271793	\N
274038	GENERIC_DAY	8	0	f	2010-09-05	4350	\N	271793	\N
274039	GENERIC_DAY	8	0	f	2010-08-07	4358	\N	271793	\N
274040	GENERIC_DAY	8	0	f	2010-08-14	4344	\N	271793	\N
274041	GENERIC_DAY	8	4	f	2010-08-04	4350	\N	271793	\N
274042	GENERIC_DAY	8	2	t	2010-07-09	21817	\N	271793	\N
274043	GENERIC_DAY	8	2	f	2010-08-27	4348	\N	271793	\N
274044	GENERIC_DAY	8	3	f	2010-08-27	4344	\N	271793	\N
274045	GENERIC_DAY	8	3	f	2010-08-27	4350	\N	271793	\N
274046	GENERIC_DAY	8	3	f	2010-09-23	4350	\N	271793	\N
274047	GENERIC_DAY	8	0	f	2010-08-29	4358	\N	271793	\N
274048	GENERIC_DAY	8	0	t	2010-07-04	4344	\N	271793	\N
274049	GENERIC_DAY	8	3	f	2010-08-06	4358	\N	271793	\N
274050	GENERIC_DAY	8	0	f	2010-09-11	4358	\N	271793	\N
274051	GENERIC_DAY	8	0	t	2010-07-09	4344	\N	271793	\N
274052	GENERIC_DAY	8	3	f	2010-08-10	4358	\N	271793	\N
274053	GENERIC_DAY	8	3	f	2010-09-01	4350	\N	271793	\N
274054	GENERIC_DAY	8	0	f	2010-09-12	4350	\N	271793	\N
274055	GENERIC_DAY	8	3	f	2010-09-17	4350	\N	271793	\N
274056	GENERIC_DAY	8	4	f	2010-07-28	4358	\N	271793	\N
274057	GENERIC_DAY	8	4	f	2010-08-19	4350	\N	271793	\N
274058	GENERIC_DAY	8	0	f	2010-09-12	4358	\N	271793	\N
274059	GENERIC_DAY	8	3	f	2010-08-12	4358	\N	271793	\N
274060	GENERIC_DAY	8	0	f	2010-08-21	4358	\N	271793	\N
274061	GENERIC_DAY	8	0	f	2010-07-19	4344	\N	271793	\N
274062	GENERIC_DAY	8	3	f	2010-09-22	4350	\N	271793	\N
274063	GENERIC_DAY	8	3	f	2010-09-20	4344	\N	271793	\N
274064	GENERIC_DAY	8	0	t	2010-07-11	4344	\N	271793	\N
274065	GENERIC_DAY	8	3	f	2010-08-20	4358	\N	271793	\N
274066	GENERIC_DAY	8	3	f	2010-09-21	4348	\N	271793	\N
274067	GENERIC_DAY	8	0	f	2010-07-24	4344	\N	271793	\N
274068	GENERIC_DAY	8	0	f	2010-08-28	4358	\N	271793	\N
274069	GENERIC_DAY	8	0	t	2010-07-10	4344	\N	271793	\N
274070	GENERIC_DAY	8	3	t	2010-07-06	4348	\N	271793	\N
274071	GENERIC_DAY	8	3	t	2010-07-15	4348	\N	271793	\N
274072	GENERIC_DAY	8	0	f	2010-08-09	4344	\N	271793	\N
274073	GENERIC_DAY	8	0	f	2010-08-29	4344	\N	271793	\N
274074	GENERIC_DAY	8	0	f	2010-09-27	4358	\N	271793	\N
274075	GENERIC_DAY	8	0	f	2010-08-15	4348	\N	271793	\N
274076	GENERIC_DAY	8	2	t	2010-07-09	4348	\N	271793	\N
274077	GENERIC_DAY	8	0	f	2010-07-30	4344	\N	271793	\N
274078	GENERIC_DAY	8	3	f	2010-08-16	4358	\N	271793	\N
274079	GENERIC_DAY	8	3	t	2010-07-07	21817	\N	271793	\N
274080	GENERIC_DAY	8	0	t	2010-07-04	21817	\N	271793	\N
274081	GENERIC_DAY	8	3	t	2010-07-05	21817	\N	271793	\N
274082	GENERIC_DAY	8	0	f	2010-08-06	4344	\N	271793	\N
274083	GENERIC_DAY	8	0	f	2010-08-16	4348	\N	271793	\N
274084	GENERIC_DAY	8	4	f	2010-07-22	4348	\N	271793	\N
274085	GENERIC_DAY	8	3	f	2010-09-15	4350	\N	271793	\N
274086	GENERIC_DAY	8	4	f	2010-08-18	4344	\N	271793	\N
274087	GENERIC_DAY	8	0	f	2010-08-22	4350	\N	271793	\N
274088	GENERIC_DAY	8	3	f	2010-09-07	4350	\N	271793	\N
274089	GENERIC_DAY	8	0	f	2010-09-11	4348	\N	271793	\N
274090	GENERIC_DAY	8	0	f	2010-08-28	4348	\N	271793	\N
274091	GENERIC_DAY	8	3	f	2010-08-31	4344	\N	271793	\N
274092	GENERIC_DAY	8	0	t	2010-07-11	4350	\N	271793	\N
274093	GENERIC_DAY	8	3	f	2010-08-18	4358	\N	271793	\N
274094	GENERIC_DAY	8	0	f	2010-08-08	4350	\N	271793	\N
274095	GENERIC_DAY	8	3	f	2010-07-22	4358	\N	271793	\N
274096	GENERIC_DAY	8	2	f	2010-09-02	4358	\N	271793	\N
274464	SPECIFIC_DAY	7	8	f	2010-08-11	1220	31240	\N	\N
274465	SPECIFIC_DAY	7	4	f	2010-08-04	1220	31240	\N	\N
274466	SPECIFIC_DAY	7	8	f	2010-08-17	1220	31240	\N	\N
274467	SPECIFIC_DAY	7	0	f	2010-08-15	1220	31240	\N	\N
274468	SPECIFIC_DAY	7	0	f	2010-08-08	1220	31240	\N	\N
274469	SPECIFIC_DAY	7	8	f	2010-08-12	1220	31240	\N	\N
274470	SPECIFIC_DAY	7	8	f	2010-08-06	1220	31240	\N	\N
274471	SPECIFIC_DAY	7	8	f	2010-08-09	1220	31240	\N	\N
274472	SPECIFIC_DAY	7	8	f	2010-08-19	1220	31240	\N	\N
274473	SPECIFIC_DAY	7	8	f	2010-08-20	1220	31240	\N	\N
274474	SPECIFIC_DAY	7	8	f	2010-08-13	1220	31240	\N	\N
274475	SPECIFIC_DAY	7	8	f	2010-08-16	1220	31240	\N	\N
274476	SPECIFIC_DAY	7	8	f	2010-08-05	1220	31240	\N	\N
274477	SPECIFIC_DAY	7	8	f	2010-08-10	1220	31240	\N	\N
274478	SPECIFIC_DAY	7	0	f	2010-08-14	1220	31240	\N	\N
274479	SPECIFIC_DAY	7	8	f	2010-08-18	1220	31240	\N	\N
274480	SPECIFIC_DAY	7	0	f	2010-08-07	1220	31240	\N	\N
274481	GENERIC_DAY	7	2	f	2010-06-30	4354	\N	271794	\N
274482	GENERIC_DAY	7	2	f	2010-08-16	4352	\N	271794	\N
274483	GENERIC_DAY	7	0	f	2010-08-08	4354	\N	271794	\N
274484	GENERIC_DAY	7	0	f	2010-07-20	4352	\N	271794	\N
274485	GENERIC_DAY	7	0	f	2010-08-21	4352	\N	271794	\N
274486	GENERIC_DAY	7	1	f	2010-08-24	4354	\N	271794	\N
274487	GENERIC_DAY	7	2	f	2010-06-24	4354	\N	271794	\N
274488	GENERIC_DAY	7	2	f	2010-07-30	4352	\N	271794	\N
274489	GENERIC_DAY	7	1	f	2010-07-08	4352	\N	271794	\N
274490	GENERIC_DAY	7	0	f	2010-07-27	4352	\N	271794	\N
274491	GENERIC_DAY	7	2	f	2010-06-25	4354	\N	271794	\N
274492	GENERIC_DAY	7	1	f	2010-08-04	4354	\N	271794	\N
274493	GENERIC_DAY	7	0	f	2010-08-22	4352	\N	271794	\N
274494	GENERIC_DAY	7	1	f	2010-07-06	4354	\N	271794	\N
274495	GENERIC_DAY	7	2	f	2010-06-29	4354	\N	271794	\N
274496	GENERIC_DAY	7	1	f	2010-08-12	4354	\N	271794	\N
274497	GENERIC_DAY	7	0	f	2010-08-22	4354	\N	271794	\N
274498	GENERIC_DAY	7	3	f	2010-07-15	4354	\N	271794	\N
274499	GENERIC_DAY	7	2	f	2010-06-23	4354	\N	271794	\N
274500	GENERIC_DAY	7	3	f	2010-07-09	4354	\N	271794	\N
274501	GENERIC_DAY	7	3	f	2010-07-12	4354	\N	271794	\N
274502	GENERIC_DAY	7	1	f	2010-07-01	4352	\N	271794	\N
274503	GENERIC_DAY	7	3	f	2010-07-20	4354	\N	271794	\N
274504	GENERIC_DAY	7	0	f	2010-06-17	4352	\N	271794	\N
274505	GENERIC_DAY	7	2	f	2010-07-07	4352	\N	271794	\N
274506	GENERIC_DAY	7	3	f	2010-07-19	4354	\N	271794	\N
274507	GENERIC_DAY	7	1	f	2010-07-30	4354	\N	271794	\N
274508	GENERIC_DAY	7	2	f	2010-08-13	4352	\N	271794	\N
274509	GENERIC_DAY	7	2	f	2010-08-06	4352	\N	271794	\N
274510	GENERIC_DAY	7	0	f	2010-07-23	4352	\N	271794	\N
274511	GENERIC_DAY	7	0	f	2010-07-18	4354	\N	271794	\N
274512	GENERIC_DAY	7	1	f	2010-06-25	4352	\N	271794	\N
274513	GENERIC_DAY	7	0	f	2010-06-26	4352	\N	271794	\N
274514	GENERIC_DAY	7	2	f	2010-08-23	4352	\N	271794	\N
274515	GENERIC_DAY	7	1	f	2010-08-23	4354	\N	271794	\N
274516	GENERIC_DAY	7	0	f	2010-07-03	4352	\N	271794	\N
274517	GENERIC_DAY	7	3	f	2010-07-13	4354	\N	271794	\N
274518	GENERIC_DAY	7	0	f	2010-07-13	4352	\N	271794	\N
274519	GENERIC_DAY	7	0	f	2010-08-07	4354	\N	271794	\N
274520	GENERIC_DAY	7	2	f	2010-06-28	4354	\N	271794	\N
274521	GENERIC_DAY	7	0	f	2010-08-14	4352	\N	271794	\N
274522	GENERIC_DAY	7	0	f	2010-08-01	4354	\N	271794	\N
274523	GENERIC_DAY	7	2	f	2010-07-02	4354	\N	271794	\N
274524	GENERIC_DAY	7	1	f	2010-08-17	4354	\N	271794	\N
274525	GENERIC_DAY	7	2	f	2010-08-11	4352	\N	271794	\N
274526	GENERIC_DAY	7	0	t	2010-06-16	4352	\N	271794	\N
274527	GENERIC_DAY	7	0	f	2010-07-12	4352	\N	271794	\N
274528	GENERIC_DAY	7	1	f	2010-06-29	4352	\N	271794	\N
274529	GENERIC_DAY	7	3	f	2010-07-27	4354	\N	271794	\N
274530	GENERIC_DAY	7	0	f	2010-07-04	4352	\N	271794	\N
274531	GENERIC_DAY	7	0	f	2010-07-25	4352	\N	271794	\N
274532	GENERIC_DAY	7	1	f	2010-08-10	4354	\N	271794	\N
274533	GENERIC_DAY	7	0	f	2010-07-17	4354	\N	271794	\N
274534	GENERIC_DAY	7	3	f	2010-06-18	4354	\N	271794	\N
274535	GENERIC_DAY	7	1	f	2010-08-05	4354	\N	271794	\N
274536	GENERIC_DAY	7	0	f	2010-08-01	4352	\N	271794	\N
274537	GENERIC_DAY	7	3	f	2010-07-16	4354	\N	271794	\N
274538	GENERIC_DAY	7	0	f	2010-07-09	4352	\N	271794	\N
274539	GENERIC_DAY	7	0	f	2010-07-14	4352	\N	271794	\N
274540	GENERIC_DAY	7	0	f	2010-07-26	4352	\N	271794	\N
274541	GENERIC_DAY	7	2	f	2010-08-03	4352	\N	271794	\N
274542	GENERIC_DAY	7	2	f	2010-07-01	4354	\N	271794	\N
274543	GENERIC_DAY	7	0	f	2010-07-16	4352	\N	271794	\N
274544	GENERIC_DAY	7	1	f	2010-08-09	4354	\N	271794	\N
274545	GENERIC_DAY	7	2	f	2010-08-17	4352	\N	271794	\N
274546	GENERIC_DAY	7	2	f	2010-08-20	4352	\N	271794	\N
274547	GENERIC_DAY	7	3	f	2010-07-23	4354	\N	271794	\N
274548	GENERIC_DAY	7	2	f	2010-08-09	4352	\N	271794	\N
274549	GENERIC_DAY	7	0	f	2010-08-15	4352	\N	271794	\N
274550	GENERIC_DAY	7	0	f	2010-07-10	4352	\N	271794	\N
274551	GENERIC_DAY	7	2	f	2010-06-22	4354	\N	271794	\N
274552	GENERIC_DAY	7	1	f	2010-07-28	4354	\N	271794	\N
274553	GENERIC_DAY	7	1	f	2010-06-22	4352	\N	271794	\N
274554	GENERIC_DAY	7	0	f	2010-07-25	4354	\N	271794	\N
274555	GENERIC_DAY	7	1	f	2010-08-11	4354	\N	271794	\N
274556	GENERIC_DAY	7	0	f	2010-06-20	4352	\N	271794	\N
274557	GENERIC_DAY	7	0	f	2010-07-24	4352	\N	271794	\N
274558	GENERIC_DAY	7	0	t	2010-06-15	4352	\N	271794	\N
274559	GENERIC_DAY	7	0	f	2010-08-07	4352	\N	271794	\N
274560	GENERIC_DAY	7	0	f	2010-07-15	4352	\N	271794	\N
274561	GENERIC_DAY	7	1	f	2010-06-24	4352	\N	271794	\N
274562	GENERIC_DAY	7	0	f	2010-07-03	4354	\N	271794	\N
274563	GENERIC_DAY	7	1	f	2010-07-05	4354	\N	271794	\N
274564	GENERIC_DAY	7	0	f	2010-07-19	4352	\N	271794	\N
274565	GENERIC_DAY	7	1	f	2010-06-30	4352	\N	271794	\N
274566	GENERIC_DAY	7	0	f	2010-06-18	4352	\N	271794	\N
274567	GENERIC_DAY	7	1	f	2010-08-02	4354	\N	271794	\N
274568	GENERIC_DAY	7	2	f	2010-08-05	4352	\N	271794	\N
274569	GENERIC_DAY	7	2	f	2010-07-05	4352	\N	271794	\N
274570	GENERIC_DAY	7	0	f	2010-07-24	4354	\N	271794	\N
274571	GENERIC_DAY	7	0	f	2010-06-19	4354	\N	271794	\N
274572	GENERIC_DAY	7	2	f	2010-07-29	4352	\N	271794	\N
274573	GENERIC_DAY	7	1	f	2010-06-23	4352	\N	271794	\N
274574	GENERIC_DAY	7	2	f	2010-07-08	4354	\N	271794	\N
274575	GENERIC_DAY	7	0	f	2010-08-15	4354	\N	271794	\N
274576	GENERIC_DAY	7	3	f	2010-06-17	4354	\N	271794	\N
274577	GENERIC_DAY	7	0	f	2010-07-31	4354	\N	271794	\N
274578	GENERIC_DAY	7	3	f	2010-07-22	4354	\N	271794	\N
274579	GENERIC_DAY	7	0	f	2010-07-10	4354	\N	271794	\N
274580	GENERIC_DAY	7	0	f	2010-06-19	4352	\N	271794	\N
274581	GENERIC_DAY	7	0	f	2010-08-08	4352	\N	271794	\N
274582	GENERIC_DAY	7	8	t	2010-06-14	4354	\N	271794	\N
274583	GENERIC_DAY	7	0	f	2010-06-27	4354	\N	271794	\N
274584	GENERIC_DAY	7	0	f	2010-08-14	4354	\N	271794	\N
274585	GENERIC_DAY	7	0	f	2010-07-22	4352	\N	271794	\N
274586	GENERIC_DAY	7	0	f	2010-07-21	4352	\N	271794	\N
274587	GENERIC_DAY	7	2	f	2010-08-10	4352	\N	271794	\N
274588	GENERIC_DAY	7	1	f	2010-07-07	4354	\N	271794	\N
274589	GENERIC_DAY	7	2	f	2010-08-04	4352	\N	271794	\N
274590	GENERIC_DAY	7	3	f	2010-07-26	4354	\N	271794	\N
274591	GENERIC_DAY	7	3	f	2010-07-21	4354	\N	271794	\N
274592	GENERIC_DAY	7	0	f	2010-06-27	4352	\N	271794	\N
274593	GENERIC_DAY	7	1	f	2010-08-13	4354	\N	271794	\N
274594	GENERIC_DAY	7	2	f	2010-08-02	4352	\N	271794	\N
274595	GENERIC_DAY	7	1	f	2010-07-29	4354	\N	271794	\N
274596	GENERIC_DAY	7	8	t	2010-06-15	4354	\N	271794	\N
274597	GENERIC_DAY	7	2	f	2010-08-18	4352	\N	271794	\N
274598	GENERIC_DAY	7	1	f	2010-08-06	4354	\N	271794	\N
274599	GENERIC_DAY	7	1	f	2010-08-03	4354	\N	271794	\N
274600	GENERIC_DAY	7	2	f	2010-07-06	4352	\N	271794	\N
274601	GENERIC_DAY	7	0	f	2010-06-26	4354	\N	271794	\N
274602	GENERIC_DAY	7	0	f	2010-07-04	4354	\N	271794	\N
274603	GENERIC_DAY	7	0	f	2010-07-31	4352	\N	271794	\N
274604	GENERIC_DAY	7	0	f	2010-06-20	4354	\N	271794	\N
274605	GENERIC_DAY	7	1	f	2010-08-16	4354	\N	271794	\N
274606	GENERIC_DAY	7	2	f	2010-08-19	4352	\N	271794	\N
274607	GENERIC_DAY	7	1	f	2010-07-02	4352	\N	271794	\N
274608	GENERIC_DAY	7	0	f	2010-08-21	4354	\N	271794	\N
274609	GENERIC_DAY	7	0	f	2010-07-11	4354	\N	271794	\N
274610	GENERIC_DAY	7	2	f	2010-07-28	4352	\N	271794	\N
274611	GENERIC_DAY	7	2	f	2010-08-12	4352	\N	271794	\N
274612	GENERIC_DAY	7	1	f	2010-08-19	4354	\N	271794	\N
274613	GENERIC_DAY	7	2	f	2010-08-24	4352	\N	271794	\N
274614	GENERIC_DAY	7	1	f	2010-08-20	4354	\N	271794	\N
274615	GENERIC_DAY	7	0	f	2010-07-17	4352	\N	271794	\N
274616	GENERIC_DAY	7	3	f	2010-07-14	4354	\N	271794	\N
274617	GENERIC_DAY	7	1	f	2010-06-28	4352	\N	271794	\N
274618	GENERIC_DAY	7	0	f	2010-07-18	4352	\N	271794	\N
274619	GENERIC_DAY	7	0	f	2010-07-11	4352	\N	271794	\N
274620	GENERIC_DAY	7	1	f	2010-08-18	4354	\N	271794	\N
274621	GENERIC_DAY	7	8	t	2010-06-16	4354	\N	271794	\N
274809	GENERIC_DAY	6	0	f	2010-07-08	4358	\N	27166	\N
274810	GENERIC_DAY	6	0	f	2010-07-08	4348	\N	27166	\N
274811	GENERIC_DAY	6	0	f	2010-07-03	4350	\N	27166	\N
274812	GENERIC_DAY	6	0	f	2010-07-05	4350	\N	27166	\N
274813	GENERIC_DAY	6	0	f	2010-07-02	4348	\N	27166	\N
274814	GENERIC_DAY	6	0	f	2010-06-29	4358	\N	27166	\N
274815	GENERIC_DAY	6	2	f	2010-07-12	4350	\N	27166	\N
274816	GENERIC_DAY	6	1	f	2010-06-29	4348	\N	27166	\N
274817	GENERIC_DAY	6	0	f	2010-07-12	4344	\N	27166	\N
274818	GENERIC_DAY	6	1	f	2010-06-28	21817	\N	27166	\N
274819	GENERIC_DAY	6	0	f	2010-06-27	4358	\N	27166	\N
274820	GENERIC_DAY	6	8	f	2010-07-05	4344	\N	27166	\N
274821	GENERIC_DAY	6	0	f	2010-07-04	4358	\N	27166	\N
274822	GENERIC_DAY	6	0	f	2010-06-28	4358	\N	27166	\N
274823	GENERIC_DAY	6	0	f	2010-07-10	4358	\N	27166	\N
274824	GENERIC_DAY	6	1	f	2010-07-01	21817	\N	27166	\N
274825	GENERIC_DAY	6	6	f	2010-06-28	4344	\N	27166	\N
274826	GENERIC_DAY	6	1	f	2010-06-30	4358	\N	27166	\N
274827	GENERIC_DAY	6	8	f	2010-07-08	21817	\N	27166	\N
274828	GENERIC_DAY	6	2	f	2010-07-09	4348	\N	27166	\N
274829	GENERIC_DAY	6	0	f	2010-07-07	4350	\N	27166	\N
274830	GENERIC_DAY	6	0	f	2010-07-11	4358	\N	27166	\N
274831	GENERIC_DAY	6	4	f	2010-07-01	4344	\N	27166	\N
274832	GENERIC_DAY	6	0	f	2010-07-04	21817	\N	27166	\N
274833	GENERIC_DAY	6	2	f	2010-07-12	4358	\N	27166	\N
274834	GENERIC_DAY	6	2	f	2010-07-13	4358	\N	27166	\N
274835	GENERIC_DAY	6	2	f	2010-07-13	21817	\N	27166	\N
274836	GENERIC_DAY	6	6	f	2010-06-29	4344	\N	27166	\N
274837	GENERIC_DAY	6	0	f	2010-06-27	4344	\N	27166	\N
274838	GENERIC_DAY	6	0	f	2010-07-03	4348	\N	27166	\N
274839	GENERIC_DAY	6	0	f	2010-07-04	4350	\N	27166	\N
274840	GENERIC_DAY	6	0	f	2010-07-05	4348	\N	27166	\N
274841	GENERIC_DAY	6	0	f	2010-07-10	21817	\N	27166	\N
274842	GENERIC_DAY	6	2	f	2010-07-12	21817	\N	27166	\N
274843	GENERIC_DAY	6	8	f	2010-07-06	4344	\N	27166	\N
274844	GENERIC_DAY	6	2	f	2010-07-09	4350	\N	27166	\N
274845	GENERIC_DAY	6	2	f	2010-07-12	4348	\N	27166	\N
274846	GENERIC_DAY	6	0	f	2010-07-06	21817	\N	27166	\N
274847	GENERIC_DAY	6	8	f	2010-07-07	4344	\N	27166	\N
274848	GENERIC_DAY	6	0	f	2010-07-01	4350	\N	27166	\N
274849	GENERIC_DAY	6	0	f	2010-07-03	4358	\N	27166	\N
274850	GENERIC_DAY	6	5	f	2010-06-30	4344	\N	27166	\N
274851	GENERIC_DAY	6	0	f	2010-07-07	4348	\N	27166	\N
274852	GENERIC_DAY	6	2	f	2010-07-09	21817	\N	27166	\N
274853	GENERIC_DAY	6	0	f	2010-07-11	4348	\N	27166	\N
274854	GENERIC_DAY	6	2	f	2010-07-14	4358	\N	27166	\N
274855	GENERIC_DAY	6	0	f	2010-06-30	4350	\N	27166	\N
274856	GENERIC_DAY	6	1	f	2010-07-01	4358	\N	27166	\N
274857	GENERIC_DAY	6	0	f	2010-07-10	4348	\N	27166	\N
274858	GENERIC_DAY	6	0	f	2010-06-27	4350	\N	27166	\N
274859	GENERIC_DAY	6	0	f	2010-07-09	4344	\N	27166	\N
274860	GENERIC_DAY	6	0	f	2010-06-29	4350	\N	27166	\N
274861	GENERIC_DAY	6	0	f	2010-07-06	4358	\N	27166	\N
274862	GENERIC_DAY	6	1	f	2010-07-14	4348	\N	27166	\N
274863	GENERIC_DAY	6	0	f	2010-06-27	21817	\N	27166	\N
274864	GENERIC_DAY	6	1	f	2010-06-30	21817	\N	27166	\N
274865	GENERIC_DAY	6	0	f	2010-07-11	4350	\N	27166	\N
274866	GENERIC_DAY	6	0	f	2010-07-03	4344	\N	27166	\N
274867	GENERIC_DAY	6	0	f	2010-06-27	4348	\N	27166	\N
274868	GENERIC_DAY	6	0	f	2010-07-02	21817	\N	27166	\N
274869	GENERIC_DAY	6	2	f	2010-07-01	4348	\N	27166	\N
274870	GENERIC_DAY	6	0	f	2010-07-07	4358	\N	27166	\N
274871	GENERIC_DAY	6	1	f	2010-06-30	4348	\N	27166	\N
274872	GENERIC_DAY	6	0	f	2010-07-10	4344	\N	27166	\N
274873	GENERIC_DAY	6	0	f	2010-07-08	4350	\N	27166	\N
274874	GENERIC_DAY	6	1	f	2010-07-14	4350	\N	27166	\N
274875	GENERIC_DAY	6	0	f	2010-07-03	21817	\N	27166	\N
274876	GENERIC_DAY	6	0	f	2010-07-02	4358	\N	27166	\N
274877	GENERIC_DAY	6	0	f	2010-07-10	4350	\N	27166	\N
274878	GENERIC_DAY	6	0	f	2010-07-11	21817	\N	27166	\N
274879	GENERIC_DAY	6	2	f	2010-07-13	4350	\N	27166	\N
274880	GENERIC_DAY	6	0	f	2010-07-07	21817	\N	27166	\N
274881	GENERIC_DAY	6	8	f	2010-07-02	4344	\N	27166	\N
274882	GENERIC_DAY	6	0	f	2010-07-13	4344	\N	27166	\N
274883	GENERIC_DAY	6	0	f	2010-07-04	4348	\N	27166	\N
274884	GENERIC_DAY	6	0	f	2010-07-05	4358	\N	27166	\N
274885	GENERIC_DAY	6	0	f	2010-07-08	4344	\N	27166	\N
274886	GENERIC_DAY	6	2	f	2010-07-13	4348	\N	27166	\N
274887	GENERIC_DAY	6	0	f	2010-07-06	4348	\N	27166	\N
274888	GENERIC_DAY	6	0	f	2010-07-06	4350	\N	27166	\N
274889	GENERIC_DAY	6	0	f	2010-07-04	4344	\N	27166	\N
274890	GENERIC_DAY	6	0	f	2010-07-14	4344	\N	27166	\N
274891	GENERIC_DAY	6	2	f	2010-07-09	4358	\N	27166	\N
274892	GENERIC_DAY	6	0	f	2010-07-05	21817	\N	27166	\N
274893	GENERIC_DAY	6	0	f	2010-07-11	4344	\N	27166	\N
274894	GENERIC_DAY	6	1	f	2010-06-29	21817	\N	27166	\N
274895	GENERIC_DAY	6	1	f	2010-06-28	4348	\N	27166	\N
274896	GENERIC_DAY	6	0	f	2010-07-02	4350	\N	27166	\N
274897	GENERIC_DAY	6	0	f	2010-06-28	4350	\N	27166	\N
274898	GENERIC_DAY	5	0	f	2010-07-24	4354	\N	27167	\N
274899	GENERIC_DAY	5	5	f	2010-08-09	4352	\N	27167	\N
274900	GENERIC_DAY	5	0	f	2010-08-14	4354	\N	27167	\N
274901	GENERIC_DAY	5	0	f	2010-08-15	4354	\N	27167	\N
274902	GENERIC_DAY	5	1	f	2010-07-15	4352	\N	27167	\N
274903	GENERIC_DAY	5	3	f	2010-07-30	4354	\N	27167	\N
274904	GENERIC_DAY	5	4	f	2010-08-18	4354	\N	27167	\N
274905	GENERIC_DAY	5	4	f	2010-08-12	4354	\N	27167	\N
274906	GENERIC_DAY	5	4	f	2010-08-17	4354	\N	27167	\N
274907	GENERIC_DAY	5	0	f	2010-07-24	4352	\N	27167	\N
274908	GENERIC_DAY	5	1	f	2010-07-16	4352	\N	27167	\N
274909	GENERIC_DAY	5	0	f	2010-07-31	4354	\N	27167	\N
274910	GENERIC_DAY	5	2	f	2010-07-22	4352	\N	27167	\N
274911	GENERIC_DAY	5	0	f	2010-07-31	4352	\N	27167	\N
274912	GENERIC_DAY	5	3	f	2010-08-02	4354	\N	27167	\N
274913	GENERIC_DAY	5	5	f	2010-08-02	4352	\N	27167	\N
274914	GENERIC_DAY	5	3	f	2010-08-03	4354	\N	27167	\N
274915	GENERIC_DAY	5	3	f	2010-07-29	4354	\N	27167	\N
274916	GENERIC_DAY	5	4	f	2010-08-13	4354	\N	27167	\N
274917	GENERIC_DAY	5	0	f	2010-07-25	4352	\N	27167	\N
274918	GENERIC_DAY	5	6	f	2010-07-23	4354	\N	27167	\N
274919	GENERIC_DAY	5	5	f	2010-07-30	4352	\N	27167	\N
274920	GENERIC_DAY	5	3	f	2010-07-28	4354	\N	27167	\N
274921	GENERIC_DAY	5	0	f	2010-08-01	4354	\N	27167	\N
274922	GENERIC_DAY	5	6	f	2010-07-22	4354	\N	27167	\N
274923	GENERIC_DAY	5	3	f	2010-08-09	4354	\N	27167	\N
274924	GENERIC_DAY	5	3	f	2010-08-06	4354	\N	27167	\N
274925	GENERIC_DAY	5	0	f	2010-08-08	4352	\N	27167	\N
274926	GENERIC_DAY	5	7	f	2010-07-20	4354	\N	27167	\N
274927	GENERIC_DAY	5	4	f	2010-08-16	4352	\N	27167	\N
274928	GENERIC_DAY	5	0	f	2010-08-08	4354	\N	27167	\N
274929	GENERIC_DAY	5	0	f	2010-08-01	4352	\N	27167	\N
274930	GENERIC_DAY	5	5	f	2010-08-11	4352	\N	27167	\N
274931	GENERIC_DAY	5	5	f	2010-08-03	4352	\N	27167	\N
274932	GENERIC_DAY	5	4	f	2010-08-13	4352	\N	27167	\N
274933	GENERIC_DAY	5	5	f	2010-08-04	4352	\N	27167	\N
274934	GENERIC_DAY	5	5	f	2010-07-29	4352	\N	27167	\N
274935	GENERIC_DAY	5	4	f	2010-08-17	4352	\N	27167	\N
274936	GENERIC_DAY	5	7	f	2010-07-16	4354	\N	27167	\N
274937	GENERIC_DAY	5	0	f	2010-07-25	4354	\N	27167	\N
274938	GENERIC_DAY	5	0	f	2010-07-17	4354	\N	27167	\N
274939	GENERIC_DAY	5	2	f	2010-07-26	4352	\N	27167	\N
274940	GENERIC_DAY	5	5	f	2010-08-05	4352	\N	27167	\N
274941	GENERIC_DAY	5	5	f	2010-07-28	4352	\N	27167	\N
274942	GENERIC_DAY	5	7	f	2010-07-15	4354	\N	27167	\N
274943	GENERIC_DAY	5	6	f	2010-07-21	4354	\N	27167	\N
274944	GENERIC_DAY	5	0	f	2010-08-07	4352	\N	27167	\N
274945	GENERIC_DAY	5	2	f	2010-07-21	4352	\N	27167	\N
274946	GENERIC_DAY	5	0	f	2010-07-18	4354	\N	27167	\N
274947	GENERIC_DAY	5	7	f	2010-07-19	4354	\N	27167	\N
274948	GENERIC_DAY	5	0	f	2010-07-18	4352	\N	27167	\N
274949	GENERIC_DAY	5	3	f	2010-08-10	4354	\N	27167	\N
274950	GENERIC_DAY	5	4	f	2010-08-16	4354	\N	27167	\N
274951	GENERIC_DAY	5	4	f	2010-08-12	4352	\N	27167	\N
274952	GENERIC_DAY	5	3	f	2010-08-04	4354	\N	27167	\N
274953	GENERIC_DAY	5	0	f	2010-07-17	4352	\N	27167	\N
274954	GENERIC_DAY	5	6	f	2010-07-27	4354	\N	27167	\N
274955	GENERIC_DAY	5	3	f	2010-08-11	4354	\N	27167	\N
274956	GENERIC_DAY	5	4	f	2010-08-18	4352	\N	27167	\N
274957	GENERIC_DAY	5	2	f	2010-07-23	4352	\N	27167	\N
274958	GENERIC_DAY	5	5	f	2010-08-10	4352	\N	27167	\N
274959	GENERIC_DAY	5	1	f	2010-07-20	4352	\N	27167	\N
274960	GENERIC_DAY	5	0	f	2010-08-07	4354	\N	27167	\N
274961	GENERIC_DAY	5	3	f	2010-08-05	4354	\N	27167	\N
274962	GENERIC_DAY	5	1	f	2010-07-19	4352	\N	27167	\N
274963	GENERIC_DAY	5	2	f	2010-07-27	4352	\N	27167	\N
274964	GENERIC_DAY	5	0	f	2010-08-15	4352	\N	27167	\N
274965	GENERIC_DAY	5	0	f	2010-08-14	4352	\N	27167	\N
274966	GENERIC_DAY	5	5	f	2010-08-06	4352	\N	27167	\N
274967	GENERIC_DAY	5	6	f	2010-07-26	4354	\N	27167	\N
274968	GENERIC_DAY	4	2	f	2010-09-08	4358	\N	27168	\N
274969	GENERIC_DAY	4	2	f	2010-09-03	4358	\N	27168	\N
274970	GENERIC_DAY	4	0	f	2010-08-28	4350	\N	27168	\N
274971	GENERIC_DAY	4	0	f	2010-09-05	4344	\N	27168	\N
274972	GENERIC_DAY	4	2	f	2010-08-31	4344	\N	27168	\N
274973	GENERIC_DAY	4	2	f	2010-08-31	4348	\N	27168	\N
274974	GENERIC_DAY	4	0	f	2010-08-22	4350	\N	27168	\N
274975	GENERIC_DAY	4	0	f	2010-09-12	4344	\N	27168	\N
274976	GENERIC_DAY	4	2	f	2010-09-06	4348	\N	27168	\N
274977	GENERIC_DAY	4	2	f	2010-09-03	4344	\N	27168	\N
274978	GENERIC_DAY	4	2	f	2010-09-06	4350	\N	27168	\N
274979	GENERIC_DAY	4	2	f	2010-09-13	4344	\N	27168	\N
274980	GENERIC_DAY	4	2	f	2010-08-26	4348	\N	27168	\N
274981	GENERIC_DAY	4	2	f	2010-08-25	4344	\N	27168	\N
274982	GENERIC_DAY	4	0	f	2010-08-28	4344	\N	27168	\N
274983	GENERIC_DAY	4	2	f	2010-09-01	4350	\N	27168	\N
274984	GENERIC_DAY	4	2	f	2010-09-01	4358	\N	27168	\N
274985	GENERIC_DAY	4	3	f	2010-08-20	4344	\N	27168	\N
274986	GENERIC_DAY	4	0	f	2010-09-05	4358	\N	27168	\N
274987	GENERIC_DAY	4	0	f	2010-09-12	4348	\N	27168	\N
274988	GENERIC_DAY	4	0	f	2010-08-21	4348	\N	27168	\N
274989	GENERIC_DAY	4	2	f	2010-09-14	4350	\N	27168	\N
274990	GENERIC_DAY	4	0	f	2010-08-28	4358	\N	27168	\N
274991	GENERIC_DAY	4	0	f	2010-09-04	4350	\N	27168	\N
274992	GENERIC_DAY	4	2	f	2010-08-30	4350	\N	27168	\N
274993	GENERIC_DAY	4	2	f	2010-09-03	4350	\N	27168	\N
274994	GENERIC_DAY	4	0	f	2010-09-12	4358	\N	27168	\N
274995	GENERIC_DAY	4	2	f	2010-09-07	4344	\N	27168	\N
274996	GENERIC_DAY	4	0	f	2010-09-04	4348	\N	27168	\N
274997	GENERIC_DAY	4	2	f	2010-08-26	4350	\N	27168	\N
274998	GENERIC_DAY	4	2	f	2010-09-13	4358	\N	27168	\N
274999	GENERIC_DAY	4	0	f	2010-09-11	4344	\N	27168	\N
275000	GENERIC_DAY	4	2	f	2010-09-15	4344	\N	27168	\N
275001	GENERIC_DAY	4	2	f	2010-09-06	4344	\N	27168	\N
275002	GENERIC_DAY	4	2	f	2010-09-10	4358	\N	27168	\N
275003	GENERIC_DAY	4	2	f	2010-09-07	4358	\N	27168	\N
275004	GENERIC_DAY	4	0	f	2010-09-11	4348	\N	27168	\N
275005	GENERIC_DAY	4	2	f	2010-09-14	4344	\N	27168	\N
275006	GENERIC_DAY	4	2	f	2010-08-20	4358	\N	27168	\N
275007	GENERIC_DAY	4	0	f	2010-08-28	4348	\N	27168	\N
275008	GENERIC_DAY	4	2	f	2010-08-30	4344	\N	27168	\N
275009	GENERIC_DAY	4	0	f	2010-09-11	4350	\N	27168	\N
275010	GENERIC_DAY	4	2	f	2010-09-03	4348	\N	27168	\N
275011	GENERIC_DAY	4	3	f	2010-08-23	4344	\N	27168	\N
275012	GENERIC_DAY	4	2	f	2010-09-07	4348	\N	27168	\N
275013	GENERIC_DAY	4	2	f	2010-08-27	4350	\N	27168	\N
275014	GENERIC_DAY	4	2	f	2010-09-08	4350	\N	27168	\N
275015	GENERIC_DAY	4	0	f	2010-08-23	4348	\N	27168	\N
275016	GENERIC_DAY	4	0	f	2010-08-22	4344	\N	27168	\N
275017	GENERIC_DAY	4	2	f	2010-09-07	4350	\N	27168	\N
275018	GENERIC_DAY	4	2	f	2010-08-26	4344	\N	27168	\N
275019	GENERIC_DAY	4	2	f	2010-09-10	4348	\N	27168	\N
275020	GENERIC_DAY	4	0	f	2010-08-20	4348	\N	27168	\N
275021	GENERIC_DAY	4	2	f	2010-09-09	4350	\N	27168	\N
275022	GENERIC_DAY	4	2	f	2010-09-06	4358	\N	27168	\N
275023	GENERIC_DAY	4	1	f	2010-09-15	4358	\N	27168	\N
275024	GENERIC_DAY	4	2	f	2010-09-08	4348	\N	27168	\N
275025	GENERIC_DAY	4	0	f	2010-09-11	4358	\N	27168	\N
275026	GENERIC_DAY	4	2	f	2010-09-08	4344	\N	27168	\N
275027	GENERIC_DAY	4	2	f	2010-08-23	4358	\N	27168	\N
275028	GENERIC_DAY	4	3	f	2010-08-23	4350	\N	27168	\N
275029	GENERIC_DAY	4	2	f	2010-08-25	4350	\N	27168	\N
275030	GENERIC_DAY	4	2	f	2010-08-27	4358	\N	27168	\N
275031	GENERIC_DAY	4	2	f	2010-09-13	4348	\N	27168	\N
275032	GENERIC_DAY	4	0	f	2010-08-22	4348	\N	27168	\N
275033	GENERIC_DAY	4	2	f	2010-09-02	4350	\N	27168	\N
275034	GENERIC_DAY	4	0	f	2010-09-12	4350	\N	27168	\N
275035	GENERIC_DAY	4	2	f	2010-09-14	4358	\N	27168	\N
275036	GENERIC_DAY	4	2	f	2010-09-09	4348	\N	27168	\N
275037	GENERIC_DAY	4	2	f	2010-08-24	4358	\N	27168	\N
275038	GENERIC_DAY	4	2	f	2010-08-31	4358	\N	27168	\N
275039	GENERIC_DAY	4	0	f	2010-09-04	4344	\N	27168	\N
275040	GENERIC_DAY	4	2	f	2010-08-30	4348	\N	27168	\N
275041	GENERIC_DAY	4	2	f	2010-08-31	4350	\N	27168	\N
275042	GENERIC_DAY	4	2	f	2010-09-09	4344	\N	27168	\N
275043	GENERIC_DAY	4	2	f	2010-09-09	4358	\N	27168	\N
275044	GENERIC_DAY	4	2	f	2010-08-24	4350	\N	27168	\N
275045	GENERIC_DAY	4	2	f	2010-09-02	4348	\N	27168	\N
275046	GENERIC_DAY	4	2	f	2010-08-30	4358	\N	27168	\N
275047	GENERIC_DAY	4	0	f	2010-09-04	4358	\N	27168	\N
275048	GENERIC_DAY	4	2	f	2010-08-25	4348	\N	27168	\N
275049	GENERIC_DAY	4	0	f	2010-08-21	4344	\N	27168	\N
275050	GENERIC_DAY	4	2	f	2010-08-27	4348	\N	27168	\N
275051	GENERIC_DAY	4	2	f	2010-09-01	4344	\N	27168	\N
275052	GENERIC_DAY	4	3	f	2010-08-20	4350	\N	27168	\N
275053	GENERIC_DAY	4	2	f	2010-09-15	4348	\N	27168	\N
275054	GENERIC_DAY	4	2	f	2010-08-24	4348	\N	27168	\N
275055	GENERIC_DAY	4	2	f	2010-08-27	4344	\N	27168	\N
275056	GENERIC_DAY	4	0	f	2010-08-29	4358	\N	27168	\N
275057	GENERIC_DAY	4	2	f	2010-09-02	4344	\N	27168	\N
275058	GENERIC_DAY	4	2	f	2010-09-01	4348	\N	27168	\N
275059	GENERIC_DAY	4	2	f	2010-08-25	4358	\N	27168	\N
275060	GENERIC_DAY	4	2	f	2010-09-14	4348	\N	27168	\N
275061	GENERIC_DAY	4	0	f	2010-08-21	4350	\N	27168	\N
275062	GENERIC_DAY	4	2	f	2010-08-26	4358	\N	27168	\N
275063	GENERIC_DAY	4	0	f	2010-08-22	4358	\N	27168	\N
275064	GENERIC_DAY	4	1	f	2010-09-15	4350	\N	27168	\N
275065	GENERIC_DAY	4	0	f	2010-08-29	4350	\N	27168	\N
275066	GENERIC_DAY	4	2	f	2010-09-10	4344	\N	27168	\N
275067	GENERIC_DAY	4	0	f	2010-09-05	4350	\N	27168	\N
275068	GENERIC_DAY	4	0	f	2010-08-29	4348	\N	27168	\N
275069	GENERIC_DAY	4	2	f	2010-09-13	4350	\N	27168	\N
275070	GENERIC_DAY	4	0	f	2010-08-29	4344	\N	27168	\N
275071	GENERIC_DAY	4	2	f	2010-09-10	4350	\N	27168	\N
275072	GENERIC_DAY	4	0	f	2010-09-05	4348	\N	27168	\N
275073	GENERIC_DAY	4	2	f	2010-09-02	4358	\N	27168	\N
275074	GENERIC_DAY	4	0	f	2010-08-21	4358	\N	27168	\N
275075	GENERIC_DAY	4	2	f	2010-08-24	4344	\N	27168	\N
275076	GENERIC_DAY	3	4	f	2010-10-11	4352	\N	42521	\N
275077	GENERIC_DAY	3	4	f	2010-11-02	4354	\N	42521	\N
275078	GENERIC_DAY	3	4	f	2010-11-04	4352	\N	42521	\N
275079	GENERIC_DAY	3	4	f	2010-10-25	4354	\N	42521	\N
275080	GENERIC_DAY	3	0	f	2010-10-09	4352	\N	42521	\N
275081	GENERIC_DAY	3	4	f	2010-11-02	4352	\N	42521	\N
275082	GENERIC_DAY	3	4	f	2010-10-20	4352	\N	42521	\N
275083	GENERIC_DAY	3	4	f	2010-10-21	4354	\N	42521	\N
275084	GENERIC_DAY	3	4	f	2010-10-04	4354	\N	42521	\N
275085	GENERIC_DAY	3	0	f	2010-10-03	4352	\N	42521	\N
275086	GENERIC_DAY	3	0	f	2010-10-10	4354	\N	42521	\N
275087	GENERIC_DAY	3	0	f	2010-10-31	4354	\N	42521	\N
275088	GENERIC_DAY	3	4	f	2010-11-01	4352	\N	42521	\N
275089	GENERIC_DAY	3	0	f	2010-10-24	4354	\N	42521	\N
275090	GENERIC_DAY	3	4	f	2010-10-14	4352	\N	42521	\N
275091	GENERIC_DAY	3	0	f	2010-10-30	4354	\N	42521	\N
275092	GENERIC_DAY	3	4	f	2010-10-13	4352	\N	42521	\N
275093	GENERIC_DAY	3	4	f	2010-10-06	4352	\N	42521	\N
275094	GENERIC_DAY	3	0	f	2010-10-23	4352	\N	42521	\N
275095	GENERIC_DAY	3	0	f	2010-10-24	4352	\N	42521	\N
275096	GENERIC_DAY	3	4	f	2010-10-11	4354	\N	42521	\N
275097	GENERIC_DAY	3	4	f	2010-10-12	4352	\N	42521	\N
275098	GENERIC_DAY	3	4	f	2010-10-21	4352	\N	42521	\N
275099	GENERIC_DAY	3	0	f	2010-10-02	4354	\N	42521	\N
275100	GENERIC_DAY	3	4	f	2010-10-18	4352	\N	42521	\N
275101	GENERIC_DAY	3	4	f	2010-10-20	4354	\N	42521	\N
275102	GENERIC_DAY	3	0	f	2010-10-10	4352	\N	42521	\N
275103	GENERIC_DAY	3	0	f	2010-10-30	4352	\N	42521	\N
275104	GENERIC_DAY	3	4	f	2010-11-03	4352	\N	42521	\N
275105	GENERIC_DAY	3	4	f	2010-10-29	4354	\N	42521	\N
275106	GENERIC_DAY	3	0	f	2010-10-02	4352	\N	42521	\N
275107	GENERIC_DAY	3	4	f	2010-10-27	4352	\N	42521	\N
275108	GENERIC_DAY	3	4	f	2010-10-26	4352	\N	42521	\N
275109	GENERIC_DAY	3	0	f	2010-10-31	4352	\N	42521	\N
275110	GENERIC_DAY	3	0	f	2010-10-17	4352	\N	42521	\N
275111	GENERIC_DAY	3	4	f	2010-10-07	4354	\N	42521	\N
275112	GENERIC_DAY	3	4	f	2010-10-08	4354	\N	42521	\N
275113	GENERIC_DAY	3	4	f	2010-10-13	4354	\N	42521	\N
275114	GENERIC_DAY	3	4	f	2010-10-29	4352	\N	42521	\N
275115	GENERIC_DAY	3	4	f	2010-11-03	4354	\N	42521	\N
275116	GENERIC_DAY	3	4	f	2010-10-07	4352	\N	42521	\N
275117	GENERIC_DAY	3	0	f	2010-10-09	4354	\N	42521	\N
275118	GENERIC_DAY	3	4	f	2010-10-27	4354	\N	42521	\N
275119	GENERIC_DAY	3	4	f	2010-10-28	4354	\N	42521	\N
275120	GENERIC_DAY	3	4	f	2010-10-01	4354	\N	42521	\N
275121	GENERIC_DAY	3	4	f	2010-10-25	4352	\N	42521	\N
275122	GENERIC_DAY	3	0	f	2010-10-16	4352	\N	42521	\N
275123	GENERIC_DAY	3	4	f	2010-10-19	4352	\N	42521	\N
275124	GENERIC_DAY	3	4	f	2010-10-12	4354	\N	42521	\N
275125	GENERIC_DAY	3	4	f	2010-10-01	4352	\N	42521	\N
275126	GENERIC_DAY	3	4	f	2010-10-05	4354	\N	42521	\N
275127	GENERIC_DAY	3	4	f	2010-10-04	4352	\N	42521	\N
275128	GENERIC_DAY	3	4	f	2010-10-18	4354	\N	42521	\N
275129	GENERIC_DAY	3	4	f	2010-11-01	4354	\N	42521	\N
275130	GENERIC_DAY	3	4	f	2010-10-22	4354	\N	42521	\N
275131	GENERIC_DAY	3	4	f	2010-10-15	4352	\N	42521	\N
275132	GENERIC_DAY	3	0	f	2010-10-23	4354	\N	42521	\N
275133	GENERIC_DAY	3	4	f	2010-10-15	4354	\N	42521	\N
275134	GENERIC_DAY	3	4	f	2010-10-22	4352	\N	42521	\N
275135	GENERIC_DAY	3	0	f	2010-10-16	4354	\N	42521	\N
275136	GENERIC_DAY	3	0	f	2010-10-03	4354	\N	42521	\N
275137	GENERIC_DAY	3	4	f	2010-10-19	4354	\N	42521	\N
275138	GENERIC_DAY	3	0	f	2010-10-17	4354	\N	42521	\N
275139	GENERIC_DAY	3	4	f	2010-10-26	4354	\N	42521	\N
275140	GENERIC_DAY	3	4	f	2010-10-08	4352	\N	42521	\N
275141	GENERIC_DAY	3	4	f	2010-10-28	4352	\N	42521	\N
275142	GENERIC_DAY	3	4	f	2010-10-14	4354	\N	42521	\N
275143	GENERIC_DAY	3	4	f	2010-11-04	4354	\N	42521	\N
275144	GENERIC_DAY	3	4	f	2010-10-06	4354	\N	42521	\N
275145	GENERIC_DAY	3	4	f	2010-10-05	4352	\N	42521	\N
275146	GENERIC_DAY	2	2	f	2010-11-23	4352	\N	42522	\N
275147	GENERIC_DAY	2	4	f	2010-11-12	4352	\N	42522	\N
275148	GENERIC_DAY	2	0	f	2010-11-21	4352	\N	42522	\N
275149	GENERIC_DAY	2	0	f	2010-11-13	4354	\N	42522	\N
275150	GENERIC_DAY	2	0	f	2010-11-14	4352	\N	42522	\N
275151	GENERIC_DAY	2	4	f	2010-11-05	4352	\N	42522	\N
275152	GENERIC_DAY	2	4	f	2010-11-10	4352	\N	42522	\N
275153	GENERIC_DAY	2	4	f	2010-11-15	4354	\N	42522	\N
275154	GENERIC_DAY	2	0	f	2010-11-07	4352	\N	42522	\N
275155	GENERIC_DAY	2	0	f	2010-11-20	4352	\N	42522	\N
275156	GENERIC_DAY	2	4	f	2010-11-08	4354	\N	42522	\N
275157	GENERIC_DAY	2	0	f	2010-11-14	4354	\N	42522	\N
275158	GENERIC_DAY	2	4	f	2010-11-22	4354	\N	42522	\N
275159	GENERIC_DAY	2	4	f	2010-11-22	4352	\N	42522	\N
275160	GENERIC_DAY	2	4	f	2010-11-10	4354	\N	42522	\N
275161	GENERIC_DAY	2	0	f	2010-11-07	4354	\N	42522	\N
275162	GENERIC_DAY	2	4	f	2010-11-08	4352	\N	42522	\N
275163	GENERIC_DAY	2	4	f	2010-11-19	4354	\N	42522	\N
275164	GENERIC_DAY	2	0	f	2010-11-20	4354	\N	42522	\N
275165	GENERIC_DAY	2	4	f	2010-11-12	4354	\N	42522	\N
275166	GENERIC_DAY	2	4	f	2010-11-15	4352	\N	42522	\N
275167	GENERIC_DAY	2	2	f	2010-11-23	4354	\N	42522	\N
275168	GENERIC_DAY	2	4	f	2010-11-16	4354	\N	42522	\N
275169	GENERIC_DAY	2	4	f	2010-11-18	4354	\N	42522	\N
275170	GENERIC_DAY	2	0	f	2010-11-06	4352	\N	42522	\N
275171	GENERIC_DAY	2	0	f	2010-11-06	4354	\N	42522	\N
275172	GENERIC_DAY	2	4	f	2010-11-18	4352	\N	42522	\N
275173	GENERIC_DAY	2	0	f	2010-11-13	4352	\N	42522	\N
275174	GENERIC_DAY	2	4	f	2010-11-09	4352	\N	42522	\N
275175	GENERIC_DAY	2	0	f	2010-11-21	4354	\N	42522	\N
275176	GENERIC_DAY	2	4	f	2010-11-05	4354	\N	42522	\N
275177	GENERIC_DAY	2	4	f	2010-11-11	4354	\N	42522	\N
275178	GENERIC_DAY	2	4	f	2010-11-17	4352	\N	42522	\N
275179	GENERIC_DAY	2	4	f	2010-11-17	4354	\N	42522	\N
275180	GENERIC_DAY	2	4	f	2010-11-11	4352	\N	42522	\N
275181	GENERIC_DAY	2	4	f	2010-11-19	4352	\N	42522	\N
275182	GENERIC_DAY	2	4	f	2010-11-16	4352	\N	42522	\N
275183	GENERIC_DAY	2	4	f	2010-11-09	4354	\N	42522	\N
275184	GENERIC_DAY	1	0	f	2010-06-30	4348	\N	271795	\N
275185	GENERIC_DAY	1	0	f	2010-06-20	4350	\N	271795	\N
275186	GENERIC_DAY	1	1	f	2010-06-23	21817	\N	271795	\N
275187	GENERIC_DAY	1	0	f	2010-06-23	4354	\N	271795	\N
275188	GENERIC_DAY	1	0	f	2010-06-20	4348	\N	271795	\N
275189	GENERIC_DAY	1	0	f	2010-06-22	4358	\N	271795	\N
275190	GENERIC_DAY	1	3	f	2010-06-22	4348	\N	271795	\N
275191	GENERIC_DAY	1	0	f	2010-06-16	21817	\N	271795	\N
275192	GENERIC_DAY	1	2	f	2010-06-18	1214	\N	271795	\N
275193	GENERIC_DAY	1	0	f	2010-06-18	1216	\N	271795	\N
275194	GENERIC_DAY	1	0	f	2010-06-28	4354	\N	271795	\N
275195	GENERIC_DAY	1	0	f	2010-06-16	1216	\N	271795	\N
275196	GENERIC_DAY	1	0	f	2010-06-29	4350	\N	271795	\N
275197	GENERIC_DAY	1	0	f	2010-06-25	4354	\N	271795	\N
275198	GENERIC_DAY	1	0	f	2010-06-30	1216	\N	271795	\N
275199	GENERIC_DAY	1	1	f	2010-07-02	240482	\N	271795	\N
275200	GENERIC_DAY	1	0	f	2010-06-15	4352	\N	271795	\N
275201	GENERIC_DAY	1	7	f	2010-07-01	240484	\N	271795	\N
275202	GENERIC_DAY	1	0	f	2010-06-27	4354	\N	271795	\N
275203	GENERIC_DAY	1	0	f	2010-06-19	1216	\N	271795	\N
275204	GENERIC_DAY	1	0	f	2010-06-30	21817	\N	271795	\N
275205	GENERIC_DAY	1	0	f	2010-06-19	21817	\N	271795	\N
275206	GENERIC_DAY	1	0	f	2010-06-26	4354	\N	271795	\N
275207	GENERIC_DAY	1	1	f	2010-06-23	4356	\N	271795	\N
275208	GENERIC_DAY	1	0	f	2010-06-30	4350	\N	271795	\N
275209	GENERIC_DAY	1	2	f	2010-06-22	1214	\N	271795	\N
275210	GENERIC_DAY	1	1	f	2010-06-30	240482	\N	271795	\N
275211	GENERIC_DAY	1	0	f	2010-07-01	4358	\N	271795	\N
275212	GENERIC_DAY	1	3	f	2010-06-15	4348	\N	271795	\N
275213	GENERIC_DAY	1	0	f	2010-06-23	4350	\N	271795	\N
275214	GENERIC_DAY	1	2	f	2010-06-16	1214	\N	271795	\N
275215	GENERIC_DAY	1	0	f	2010-06-26	4352	\N	271795	\N
275216	GENERIC_DAY	1	1	f	2010-06-24	21817	\N	271795	\N
275217	GENERIC_DAY	1	0	f	2010-06-15	1220	\N	271795	\N
275218	GENERIC_DAY	1	7	f	2010-06-30	240484	\N	271795	\N
275219	GENERIC_DAY	1	1	f	2010-06-25	21817	\N	271795	\N
275220	GENERIC_DAY	1	0	f	2010-06-27	4344	\N	271795	\N
275221	GENERIC_DAY	1	0	f	2010-06-29	4354	\N	271795	\N
275222	GENERIC_DAY	1	0	f	2010-06-30	1220	\N	271795	\N
275223	GENERIC_DAY	1	2	f	2010-06-15	1214	\N	271795	\N
275224	GENERIC_DAY	1	0	f	2010-06-27	4356	\N	271795	\N
275225	GENERIC_DAY	1	0	f	2010-06-24	4354	\N	271795	\N
275226	GENERIC_DAY	1	0	f	2010-07-01	21817	\N	271795	\N
275227	GENERIC_DAY	1	0	f	2010-07-01	1214	\N	271795	\N
275228	GENERIC_DAY	1	0	f	2010-06-29	4348	\N	271795	\N
275229	GENERIC_DAY	1	0	f	2010-07-01	4354	\N	271795	\N
275230	GENERIC_DAY	1	0	f	2010-06-19	4344	\N	271795	\N
275231	GENERIC_DAY	1	2	f	2010-06-17	4344	\N	271795	\N
275232	GENERIC_DAY	1	2	f	2010-06-28	4356	\N	271795	\N
275233	GENERIC_DAY	1	0	f	2010-06-16	4354	\N	271795	\N
275234	GENERIC_DAY	1	0	f	2010-07-01	4352	\N	271795	\N
275235	GENERIC_DAY	1	0	f	2010-06-28	1216	\N	271795	\N
275236	GENERIC_DAY	1	3	f	2010-07-02	240484	\N	271795	\N
275237	GENERIC_DAY	1	0	f	2010-06-29	4358	\N	271795	\N
275238	GENERIC_DAY	1	3	f	2010-06-24	4344	\N	271795	\N
275239	GENERIC_DAY	1	0	f	2010-06-23	1220	\N	271795	\N
275240	GENERIC_DAY	1	1	f	2010-06-24	4356	\N	271795	\N
275241	GENERIC_DAY	1	1	f	2010-06-24	4348	\N	271795	\N
275242	GENERIC_DAY	1	1	f	2010-06-17	4356	\N	271795	\N
275243	GENERIC_DAY	1	0	f	2010-06-28	4358	\N	271795	\N
275244	GENERIC_DAY	1	0	f	2010-06-19	4348	\N	271795	\N
275245	GENERIC_DAY	1	3	f	2010-06-16	4348	\N	271795	\N
275246	GENERIC_DAY	1	0	f	2010-06-24	4352	\N	271795	\N
275247	GENERIC_DAY	1	0	f	2010-06-23	1216	\N	271795	\N
275248	GENERIC_DAY	1	1	f	2010-06-18	4356	\N	271795	\N
275249	GENERIC_DAY	1	0	f	2010-07-02	4356	\N	271795	\N
275250	GENERIC_DAY	1	1	f	2010-06-15	4356	\N	271795	\N
275251	GENERIC_DAY	1	0	f	2010-06-26	4344	\N	271795	\N
275252	GENERIC_DAY	1	0	f	2010-07-02	1216	\N	271795	\N
275253	GENERIC_DAY	1	0	f	2010-06-16	4350	\N	271795	\N
275254	GENERIC_DAY	1	0	f	2010-06-19	4354	\N	271795	\N
275255	GENERIC_DAY	1	0	f	2010-06-15	4354	\N	271795	\N
275256	GENERIC_DAY	1	0	f	2010-06-30	4354	\N	271795	\N
275257	GENERIC_DAY	1	0	f	2010-06-15	4350	\N	271795	\N
275258	GENERIC_DAY	1	0	f	2010-06-20	4356	\N	271795	\N
275259	GENERIC_DAY	1	1	f	2010-06-29	240482	\N	271795	\N
275260	GENERIC_DAY	1	0	f	2010-06-24	1220	\N	271795	\N
275261	GENERIC_DAY	1	4	f	2010-06-28	4344	\N	271795	\N
275262	GENERIC_DAY	1	0	f	2010-06-30	4358	\N	271795	\N
275263	GENERIC_DAY	1	0	f	2010-06-29	4356	\N	271795	\N
275264	GENERIC_DAY	1	0	f	2010-07-02	4352	\N	271795	\N
275265	GENERIC_DAY	1	0	f	2010-07-02	4344	\N	271795	\N
275266	GENERIC_DAY	1	2	f	2010-06-28	1214	\N	271795	\N
275267	GENERIC_DAY	1	0	f	2010-06-27	4358	\N	271795	\N
275268	GENERIC_DAY	1	0	f	2010-06-25	4352	\N	271795	\N
275269	GENERIC_DAY	1	0	f	2010-06-18	4352	\N	271795	\N
275270	GENERIC_DAY	1	1	f	2010-06-23	4348	\N	271795	\N
275271	GENERIC_DAY	1	0	f	2010-06-22	1216	\N	271795	\N
275272	GENERIC_DAY	1	0	f	2010-07-02	4354	\N	271795	\N
275273	GENERIC_DAY	1	0	f	2010-06-19	4356	\N	271795	\N
275274	GENERIC_DAY	1	0	f	2010-06-17	4350	\N	271795	\N
275275	GENERIC_DAY	1	0	f	2010-06-18	4358	\N	271795	\N
275276	GENERIC_DAY	1	0	f	2010-06-20	4354	\N	271795	\N
275277	GENERIC_DAY	1	0	f	2010-06-29	4344	\N	271795	\N
275278	GENERIC_DAY	1	1	f	2010-06-23	1214	\N	271795	\N
275279	GENERIC_DAY	1	0	f	2010-06-25	1220	\N	271795	\N
275280	GENERIC_DAY	1	0	f	2010-06-29	21817	\N	271795	\N
275281	GENERIC_DAY	1	0	f	2010-06-22	4354	\N	271795	\N
275282	GENERIC_DAY	1	3	f	2010-06-18	4348	\N	271795	\N
275283	GENERIC_DAY	1	3	f	2010-06-22	4344	\N	271795	\N
275284	GENERIC_DAY	1	0	f	2010-06-16	4358	\N	271795	\N
275285	GENERIC_DAY	1	7	f	2010-06-29	240484	\N	271795	\N
275286	GENERIC_DAY	1	0	f	2010-06-30	4344	\N	271795	\N
275287	GENERIC_DAY	1	0	f	2010-07-01	4356	\N	271795	\N
275288	GENERIC_DAY	1	0	f	2010-07-02	4350	\N	271795	\N
275289	GENERIC_DAY	1	0	f	2010-06-29	1216	\N	271795	\N
275290	GENERIC_DAY	1	0	f	2010-06-25	1216	\N	271795	\N
275291	GENERIC_DAY	1	0	f	2010-06-20	1214	\N	271795	\N
275292	GENERIC_DAY	1	0	f	2010-06-26	21817	\N	271795	\N
275293	GENERIC_DAY	1	2	f	2010-06-15	4344	\N	271795	\N
275294	GENERIC_DAY	1	0	f	2010-07-01	1216	\N	271795	\N
275295	GENERIC_DAY	1	0	f	2010-06-20	1216	\N	271795	\N
275296	GENERIC_DAY	1	0	f	2010-06-28	1220	\N	271795	\N
275297	GENERIC_DAY	1	0	f	2010-06-20	4358	\N	271795	\N
275298	GENERIC_DAY	1	0	f	2010-06-26	4356	\N	271795	\N
275299	GENERIC_DAY	1	0	f	2010-06-15	21817	\N	271795	\N
275300	GENERIC_DAY	1	0	f	2010-06-27	21817	\N	271795	\N
275301	GENERIC_DAY	1	0	f	2010-06-17	4354	\N	271795	\N
275302	GENERIC_DAY	1	2	f	2010-06-18	4344	\N	271795	\N
275303	GENERIC_DAY	1	0	f	2010-07-02	1220	\N	271795	\N
275304	GENERIC_DAY	1	0	f	2010-06-18	21817	\N	271795	\N
275305	GENERIC_DAY	1	0	f	2010-07-01	4348	\N	271795	\N
275306	GENERIC_DAY	1	0	f	2010-06-27	1214	\N	271795	\N
275307	GENERIC_DAY	1	0	f	2010-06-26	1220	\N	271795	\N
275308	GENERIC_DAY	1	0	f	2010-06-29	4352	\N	271795	\N
275309	GENERIC_DAY	1	0	f	2010-07-02	21817	\N	271795	\N
275310	GENERIC_DAY	1	1	f	2010-06-25	1214	\N	271795	\N
275311	GENERIC_DAY	1	0	f	2010-07-01	1220	\N	271795	\N
275312	GENERIC_DAY	1	0	f	2010-06-25	4350	\N	271795	\N
275313	GENERIC_DAY	1	0	f	2010-06-19	4358	\N	271795	\N
275314	GENERIC_DAY	1	2	f	2010-06-16	4344	\N	271795	\N
275315	GENERIC_DAY	1	0	f	2010-06-26	4350	\N	271795	\N
275316	GENERIC_DAY	1	0	f	2010-06-18	1220	\N	271795	\N
275317	GENERIC_DAY	1	0	f	2010-06-30	4356	\N	271795	\N
275318	GENERIC_DAY	1	0	f	2010-06-30	4352	\N	271795	\N
275319	GENERIC_DAY	1	0	f	2010-06-20	1220	\N	271795	\N
275320	GENERIC_DAY	1	0	f	2010-06-27	4348	\N	271795	\N
275321	GENERIC_DAY	1	0	f	2010-06-26	4358	\N	271795	\N
275322	GENERIC_DAY	1	1	f	2010-07-01	240482	\N	271795	\N
275323	GENERIC_DAY	1	0	f	2010-06-20	21817	\N	271795	\N
275324	GENERIC_DAY	1	0	f	2010-06-18	4350	\N	271795	\N
275325	GENERIC_DAY	1	3	f	2010-06-25	4344	\N	271795	\N
275326	GENERIC_DAY	1	0	f	2010-06-15	1216	\N	271795	\N
275327	GENERIC_DAY	1	0	f	2010-06-29	1220	\N	271795	\N
275328	GENERIC_DAY	1	0	f	2010-06-20	4352	\N	271795	\N
275329	GENERIC_DAY	1	0	f	2010-06-22	4352	\N	271795	\N
275330	GENERIC_DAY	1	0	f	2010-06-17	1220	\N	271795	\N
275331	GENERIC_DAY	1	0	f	2010-06-16	1220	\N	271795	\N
275332	GENERIC_DAY	1	1	f	2010-06-16	4356	\N	271795	\N
275333	GENERIC_DAY	1	0	f	2010-06-17	21817	\N	271795	\N
275334	GENERIC_DAY	1	0	f	2010-06-19	1220	\N	271795	\N
275335	GENERIC_DAY	1	0	f	2010-06-22	1220	\N	271795	\N
275336	GENERIC_DAY	1	0	f	2010-06-26	4348	\N	271795	\N
275337	GENERIC_DAY	1	0	f	2010-06-22	4350	\N	271795	\N
275338	GENERIC_DAY	1	0	f	2010-06-20	4344	\N	271795	\N
275339	GENERIC_DAY	1	0	f	2010-06-18	4354	\N	271795	\N
275340	GENERIC_DAY	1	1	f	2010-06-25	4348	\N	271795	\N
275341	GENERIC_DAY	1	0	f	2010-06-19	4352	\N	271795	\N
275342	GENERIC_DAY	1	0	f	2010-06-27	4350	\N	271795	\N
275343	GENERIC_DAY	1	0	f	2010-06-30	1214	\N	271795	\N
275344	GENERIC_DAY	1	0	f	2010-06-27	1220	\N	271795	\N
275345	GENERIC_DAY	1	0	f	2010-06-27	1216	\N	271795	\N
275346	GENERIC_DAY	1	0	f	2010-07-01	4350	\N	271795	\N
275347	GENERIC_DAY	1	0	f	2010-07-02	4358	\N	271795	\N
275348	GENERIC_DAY	1	0	f	2010-06-19	1214	\N	271795	\N
275349	GENERIC_DAY	1	0	f	2010-06-24	4350	\N	271795	\N
275350	GENERIC_DAY	1	1	f	2010-06-24	4358	\N	271795	\N
275351	GENERIC_DAY	1	0	f	2010-06-23	4352	\N	271795	\N
275352	GENERIC_DAY	1	0	f	2010-06-22	4356	\N	271795	\N
275353	GENERIC_DAY	1	0	f	2010-06-24	1216	\N	271795	\N
275354	GENERIC_DAY	1	0	f	2010-06-17	4352	\N	271795	\N
275355	GENERIC_DAY	1	0	f	2010-06-22	21817	\N	271795	\N
275356	GENERIC_DAY	1	0	f	2010-06-28	4348	\N	271795	\N
275357	GENERIC_DAY	1	1	f	2010-06-23	4358	\N	271795	\N
275358	GENERIC_DAY	1	1	f	2010-06-25	4358	\N	271795	\N
275359	GENERIC_DAY	1	0	f	2010-06-19	4350	\N	271795	\N
275360	GENERIC_DAY	1	0	f	2010-06-15	4358	\N	271795	\N
275361	GENERIC_DAY	1	0	f	2010-07-02	1214	\N	271795	\N
275362	GENERIC_DAY	1	0	f	2010-06-17	1216	\N	271795	\N
275363	GENERIC_DAY	1	0	f	2010-06-26	1216	\N	271795	\N
275364	GENERIC_DAY	1	1	f	2010-06-24	1214	\N	271795	\N
275365	GENERIC_DAY	1	0	f	2010-06-26	1214	\N	271795	\N
275366	GENERIC_DAY	1	1	f	2010-06-25	4356	\N	271795	\N
275367	GENERIC_DAY	1	3	f	2010-06-23	4344	\N	271795	\N
275368	GENERIC_DAY	1	0	f	2010-06-28	4350	\N	271795	\N
275369	GENERIC_DAY	1	0	f	2010-06-28	21817	\N	271795	\N
275370	GENERIC_DAY	1	0	f	2010-06-16	4352	\N	271795	\N
275371	GENERIC_DAY	1	0	f	2010-06-28	4352	\N	271795	\N
275372	GENERIC_DAY	1	0	f	2010-06-27	4352	\N	271795	\N
275373	GENERIC_DAY	1	3	f	2010-06-17	4348	\N	271795	\N
275374	GENERIC_DAY	1	0	f	2010-07-01	4344	\N	271795	\N
275375	GENERIC_DAY	1	0	f	2010-06-29	1214	\N	271795	\N
275376	GENERIC_DAY	1	2	f	2010-06-17	1214	\N	271795	\N
275377	GENERIC_DAY	1	0	f	2010-06-17	4358	\N	271795	\N
275378	GENERIC_DAY	1	0	f	2010-07-02	4348	\N	271795	\N
276482	SPECIFIC_DAY	1	8	f	2010-08-10	1216	31221	\N	\N
276483	SPECIFIC_DAY	1	8	f	2010-08-13	1216	31221	\N	\N
276484	SPECIFIC_DAY	1	8	f	2010-08-05	1216	31221	\N	\N
276485	SPECIFIC_DAY	1	8	f	2010-08-16	1216	31221	\N	\N
276486	SPECIFIC_DAY	1	8	f	2010-08-12	1216	31221	\N	\N
276487	SPECIFIC_DAY	1	0	f	2010-08-14	1216	31221	\N	\N
276488	SPECIFIC_DAY	1	8	f	2010-08-09	1216	31221	\N	\N
276489	SPECIFIC_DAY	1	1	f	2010-08-23	1216	31221	\N	\N
276490	SPECIFIC_DAY	1	8	f	2010-08-19	1216	31221	\N	\N
276491	SPECIFIC_DAY	1	0	f	2010-08-07	1216	31221	\N	\N
276492	SPECIFIC_DAY	1	8	f	2010-08-11	1216	31221	\N	\N
276493	SPECIFIC_DAY	1	8	f	2010-08-20	1216	31221	\N	\N
276494	SPECIFIC_DAY	1	0	f	2010-08-15	1216	31221	\N	\N
276495	SPECIFIC_DAY	1	0	f	2010-08-22	1216	31221	\N	\N
276496	SPECIFIC_DAY	1	8	f	2010-08-17	1216	31221	\N	\N
276497	SPECIFIC_DAY	1	3	f	2010-08-04	1216	31221	\N	\N
276498	SPECIFIC_DAY	1	0	f	2010-08-08	1216	31221	\N	\N
276499	SPECIFIC_DAY	1	8	f	2010-08-18	1216	31221	\N	\N
276500	SPECIFIC_DAY	1	8	f	2010-08-06	1216	31221	\N	\N
276501	SPECIFIC_DAY	1	0	f	2010-08-21	1216	31221	\N	\N
271686	SPECIFIC_DAY	20	8	f	2010-11-10	1216	31233	\N	\N
271665	SPECIFIC_DAY	20	8	f	2010-12-10	1216	31233	\N	\N
271685	SPECIFIC_DAY	20	8	f	2010-12-15	1216	31233	\N	\N
271672	SPECIFIC_DAY	20	8	f	2010-11-15	1216	31233	\N	\N
271709	SPECIFIC_DAY	20	8	f	2010-11-29	1216	31233	\N	\N
271707	SPECIFIC_DAY	20	8	f	2010-11-12	1216	31233	\N	\N
271690	SPECIFIC_DAY	20	8	f	2010-12-20	1216	31233	\N	\N
271702	SPECIFIC_DAY	20	8	f	2010-12-07	1216	31233	\N	\N
271691	SPECIFIC_DAY	20	0	f	2010-12-11	1216	31233	\N	\N
271706	SPECIFIC_DAY	20	8	f	2010-12-21	1216	31233	\N	\N
271695	SPECIFIC_DAY	20	8	f	2010-11-18	1216	31233	\N	\N
271711	SPECIFIC_DAY	20	8	f	2010-12-13	1216	31233	\N	\N
271703	SPECIFIC_DAY	20	8	f	2010-11-25	1216	31233	\N	\N
271714	SPECIFIC_DAY	20	0	f	2010-12-04	1216	31233	\N	\N
271681	SPECIFIC_DAY	20	8	f	2010-11-05	1216	31233	\N	\N
271687	SPECIFIC_DAY	20	0	f	2010-12-18	1216	31233	\N	\N
271704	SPECIFIC_DAY	20	8	f	2010-12-22	1216	31233	\N	\N
271666	SPECIFIC_DAY	20	0	f	2010-11-06	1216	31233	\N	\N
271712	SPECIFIC_DAY	20	0	f	2010-12-12	1216	31233	\N	\N
271674	SPECIFIC_DAY	20	8	f	2010-12-03	1216	31233	\N	\N
271715	SPECIFIC_DAY	20	0	f	2010-12-19	1216	31233	\N	\N
271679	SPECIFIC_DAY	20	8	f	2010-11-30	1216	31233	\N	\N
271677	SPECIFIC_DAY	20	8	f	2010-11-11	1216	31233	\N	\N
271669	SPECIFIC_DAY	20	8	f	2010-11-23	1216	31233	\N	\N
271708	SPECIFIC_DAY	20	0	f	2010-12-05	1216	31233	\N	\N
271668	SPECIFIC_DAY	20	0	f	2010-11-13	1216	31233	\N	\N
271671	SPECIFIC_DAY	20	0	f	2010-11-21	1216	31233	\N	\N
271696	SPECIFIC_DAY	20	8	f	2010-11-24	1216	31233	\N	\N
271743	SPECIFIC_DAY	19	0	f	2010-10-17	1216	31232	\N	\N
271731	SPECIFIC_DAY	19	8	f	2010-10-29	1216	31232	\N	\N
271733	SPECIFIC_DAY	19	8	f	2010-10-27	1216	31232	\N	\N
271736	SPECIFIC_DAY	19	0	f	2010-10-30	1216	31232	\N	\N
271732	SPECIFIC_DAY	19	8	f	2010-10-28	1216	31232	\N	\N
271739	SPECIFIC_DAY	19	0	f	2010-10-24	1216	31232	\N	\N
271729	SPECIFIC_DAY	19	8	f	2010-10-15	1216	31232	\N	\N
271742	SPECIFIC_DAY	19	0	f	2010-10-31	1216	31232	\N	\N
271735	SPECIFIC_DAY	19	8	f	2010-10-26	1216	31232	\N	\N
271734	SPECIFIC_DAY	19	8	f	2010-10-25	1216	31232	\N	\N
271730	SPECIFIC_DAY	19	0	f	2010-10-23	1216	31232	\N	\N
271740	SPECIFIC_DAY	19	8	f	2010-10-22	1216	31232	\N	\N
271748	SPECIFIC_DAY	19	8	f	2010-10-21	1216	31232	\N	\N
271741	SPECIFIC_DAY	19	0	f	2010-10-16	1216	31232	\N	\N
271745	SPECIFIC_DAY	19	8	f	2010-10-18	1216	31232	\N	\N
271738	SPECIFIC_DAY	19	0	f	2010-10-13	1216	31232	\N	\N
271746	SPECIFIC_DAY	19	8	f	2010-10-14	1216	31232	\N	\N
271747	SPECIFIC_DAY	19	8	f	2010-10-20	1216	31232	\N	\N
271744	SPECIFIC_DAY	19	4	f	2010-11-01	1216	31232	\N	\N
271737	SPECIFIC_DAY	19	8	f	2010-10-19	1216	31232	\N	\N
276519	SPECIFIC_DAY	1	0	f	2010-09-04	1216	31225	\N	\N
276520	SPECIFIC_DAY	1	8	f	2010-09-03	1216	31225	\N	\N
276521	SPECIFIC_DAY	1	8	f	2010-09-02	1216	31225	\N	\N
276522	SPECIFIC_DAY	1	8	f	2010-09-01	1216	31225	\N	\N
276523	SPECIFIC_DAY	1	8	f	2010-08-31	1216	31225	\N	\N
276524	SPECIFIC_DAY	1	8	f	2010-09-06	1216	31225	\N	\N
276525	SPECIFIC_DAY	1	7	f	2010-08-23	1216	31225	\N	\N
276526	SPECIFIC_DAY	1	8	f	2010-08-26	1216	31225	\N	\N
276527	SPECIFIC_DAY	1	0	f	2010-09-05	1216	31225	\N	\N
276528	SPECIFIC_DAY	1	8	f	2010-09-07	1216	31225	\N	\N
276529	SPECIFIC_DAY	1	0	f	2010-08-29	1216	31225	\N	\N
276530	SPECIFIC_DAY	1	8	f	2010-08-25	1216	31225	\N	\N
276531	SPECIFIC_DAY	1	8	f	2010-08-30	1216	31225	\N	\N
276532	SPECIFIC_DAY	1	8	f	2010-08-24	1216	31225	\N	\N
276533	SPECIFIC_DAY	1	5	f	2010-09-08	1216	31225	\N	\N
276534	SPECIFIC_DAY	1	8	f	2010-08-27	1216	31225	\N	\N
276535	SPECIFIC_DAY	1	0	f	2010-08-28	1216	31225	\N	\N
271684	SPECIFIC_DAY	20	8	f	2010-11-19	1216	31233	\N	\N
271705	SPECIFIC_DAY	20	8	f	2010-11-26	1216	31233	\N	\N
271664	SPECIFIC_DAY	20	8	f	2010-11-16	1216	31233	\N	\N
271713	SPECIFIC_DAY	20	8	f	2010-11-17	1216	31233	\N	\N
271683	SPECIFIC_DAY	20	8	f	2010-11-09	1216	31233	\N	\N
271678	SPECIFIC_DAY	20	8	f	2010-12-17	1216	31233	\N	\N
271700	SPECIFIC_DAY	20	8	f	2010-12-01	1216	31233	\N	\N
271697	SPECIFIC_DAY	20	8	f	2010-11-04	1216	31233	\N	\N
271698	SPECIFIC_DAY	20	8	f	2010-12-06	1216	31233	\N	\N
271692	SPECIFIC_DAY	20	8	f	2010-12-02	1216	31233	\N	\N
271701	SPECIFIC_DAY	20	0	f	2010-11-20	1216	31233	\N	\N
271688	SPECIFIC_DAY	20	8	f	2010-12-16	1216	31233	\N	\N
271699	SPECIFIC_DAY	20	0	f	2010-11-14	1216	31233	\N	\N
271682	SPECIFIC_DAY	20	0	f	2010-11-27	1216	31233	\N	\N
271667	SPECIFIC_DAY	20	8	f	2010-12-08	1216	31233	\N	\N
271673	SPECIFIC_DAY	20	8	f	2010-11-08	1216	31233	\N	\N
271676	SPECIFIC_DAY	20	8	f	2010-11-03	1216	31233	\N	\N
271693	SPECIFIC_DAY	20	8	f	2010-12-14	1216	31233	\N	\N
271675	SPECIFIC_DAY	20	8	f	2010-11-02	1216	31233	\N	\N
271689	SPECIFIC_DAY	20	4	f	2010-11-01	1216	31233	\N	\N
271694	SPECIFIC_DAY	20	0	f	2010-11-28	1216	31233	\N	\N
271670	SPECIFIC_DAY	20	8	f	2010-12-09	1216	31233	\N	\N
271710	SPECIFIC_DAY	20	0	f	2010-11-07	1216	31233	\N	\N
271680	SPECIFIC_DAY	20	8	f	2010-11-22	1216	31233	\N	\N
276553	SPECIFIC_DAY	1	0	f	2010-10-16	1216	31224	\N	\N
276554	SPECIFIC_DAY	1	8	f	2010-10-14	1216	31224	\N	\N
276555	SPECIFIC_DAY	1	0	f	2010-10-13	1216	31224	\N	\N
276556	SPECIFIC_DAY	1	0	f	2010-10-23	1216	31224	\N	\N
276557	SPECIFIC_DAY	1	8	f	2010-10-25	1216	31224	\N	\N
276558	SPECIFIC_DAY	1	8	f	2010-10-20	1216	31224	\N	\N
276559	SPECIFIC_DAY	1	8	f	2010-10-18	1216	31224	\N	\N
276560	SPECIFIC_DAY	1	8	f	2010-10-19	1216	31224	\N	\N
276561	SPECIFIC_DAY	1	8	f	2010-10-15	1216	31224	\N	\N
276562	SPECIFIC_DAY	1	0	f	2010-10-24	1216	31224	\N	\N
276563	SPECIFIC_DAY	1	8	f	2010-10-27	1216	31224	\N	\N
276564	SPECIFIC_DAY	1	8	f	2010-10-21	1216	31224	\N	\N
276565	SPECIFIC_DAY	1	8	f	2010-10-22	1216	31224	\N	\N
276566	SPECIFIC_DAY	1	0	f	2010-10-17	1216	31224	\N	\N
276567	SPECIFIC_DAY	1	8	f	2010-10-26	1216	31224	\N	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
8716326	1	26497	26498	\N	0
8716327	1	26494	26497	\N	0
8716328	1	26499	26502	\N	0
8716329	1	26494	26499	\N	0
8716330	1	26492	26493	\N	0
8716331	1	26494	26495	\N	0
5537806	10	22830	22832	\N	0
5537804	10	22828	22829	\N	0
5537805	10	22826	22827	\N	0
5537800	7	5464	5465	\N	0
4620295	9	5455	5456	\N	0
4620296	9	5456	5457	\N	0
4620297	9	5457	5463	\N	0
4620298	9	5459	5460	\N	0
8716299	2	26470	26475	\N	0
8716301	2	26472	26476	\N	0
8716298	2	26477	26480	\N	0
8716302	2	26473	26478	\N	0
8716300	2	26471	26473	\N	0
8716297	2	26480	26481	\N	0
80248844	4	59292	59293	247652	0
8716291	12	26467	26468	\N	0
8716290	13	26464	26467	\N	0
8716288	13	26462	26464	\N	0
8716289	12	26462	26463	\N	0
81625092	0	59287	59288	\N	0
8716337	3	26521	26524	\N	0
8716336	3	26519	26520	\N	0
8716334	3	26516	26519	\N	0
8716335	3	26516	26521	\N	0
8716332	3	26514	26515	\N	0
8716333	3	26516	26517	\N	0
86933505	0	9292	9293	\N	0
86933506	0	9293	9294	\N	0
786500	14	2121	2122	2525	0
8716304	9	26487	26488	38178	0
8716305	9	26484	26485	38179	0
8716303	13	26484	26490	38180	0
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
14140	Incidencias	
14141	Incidencias	
58782	Incidencias	incidencia uno
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
43686	43507	100.00
43679	43501	100.00
43680	43502	100.00
43681	43503	100.00
43682	43505	100.00
43683	43506	100.00
31576	31844	100.00
31577	31845	100.00
31584	31849	100.00
43689	43510	100.00
31580	31847	100.00
31581	31848	100.00
31526	25949	100.00
31527	25950	100.00
31528	25951	100.00
31537	31816	100.00
31538	31817	100.00
59193	58910	100.00
59194	58911	100.00
31531	25953	100.00
31532	25954	100.00
31533	25955	100.00
31534	25956	100.00
56995	56788	100.00
56994	56787	100.00
56996	56789	100.00
56997	56791	100.00
56998	56792	100.00
57001	56793	100.00
5353	4980	100.00
5354	4981	100.00
5355	4982	100.00
5356	4983	100.00
5359	4985	100.00
5360	4986	100.00
5361	4987	100.00
5362	4988	100.00
57012	56801	100.00
57013	56802	100.00
5365	4990	100.00
5366	4991	100.00
58206	57999	100.00
58207	58000	100.00
58208	58001	100.00
58209	58003	100.00
58210	58004	100.00
58213	58005	100.00
31525	25948	100.00
26108	25897	100.00
26109	25898	100.00
26110	25899	100.00
26115	25903	100.00
59186	58895	100.00
59187	58896	100.00
59190	58897	100.00
26111	25901	100.00
26112	25902	100.00
43227	43464	100.00
43632	43465	100.00
43633	43466	100.00
43634	43467	100.00
43637	43469	100.00
43638	43470	100.00
43639	43471	100.00
43640	43472	100.00
57018	56805	100.00
246945	246663	100.00
43643	43474	100.00
43644	43475	100.00
9191	7577	100.00
9192	7585	100.00
9193	7586	100.00
2020	1533	100.00
2021	1534	100.00
2024	1536	100.00
2025	1537	100.00
2030	1543	100.00
276033	275833	100.00
22725	22339	100.00
22726	22340	100.00
22727	22341	100.00
22728	22343	100.00
22729	22344	100.00
22732	22345	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1819	1	Navantia	2B	t	f	f	\N	\N	\N	1111
1820	1	Barreras	3C	t	f	f	\N	\N	\N	1111
1818	4	Igalia	COMPANY_CODE	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	1114
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
5861
5863
7892
7904
7908
16672
16673
16699
16701
26970
26972
26973
26974
26989
27040
27041
27042
27043
27044
27045
27046
27047
27048
27049
43936
43941
43943
43944
43945
43946
45765
48283
50705
59532
245027
265553
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
42525	1	43936	38380
42529	0	43941	38380
42597	1	43946	707
42531	0	43943	38380
45866	6	45765	707
16800	9	16699	707
16802	7	16701	707
48384	3	48283	707
50806	1	50705	707
245128	0	245027	707
16773	7	16672	707
16774	7	16673	707
5962	18	5861	707
5964	15	5863	707
9408	9	7904	707
9412	8	7908	707
27143	1	27046	707
27144	1	27047	707
27145	1	27048	707
27146	1	27049	707
27139	1	27042	707
27140	1	27043	707
27141	1	27044	707
27142	1	27045	707
27137	1	27040	707
27138	1	27041	707
27074	11	26973	707
27075	11	26974	707
59633	2	59532	707
27073	11	26972	707
27071	11	26970	707
27090	6	26989	707
42532	3	43944	38380
42595	1	43944	707
42533	3	43945	38380
42596	2	43945	707
265654	0	265553	707
9406	8	7892	707
27147	28	27042	38380
27148	28	27043	38380
27149	28	27044	38380
27150	28	27045	38380
27151	28	27046	38380
27152	28	27047	38380
27153	28	27048	38380
27154	28	27049	38380
27155	28	27040	38380
27156	28	27041	38380
27157	18	7892	38380
27158	17	5861	38380
27159	17	5863	38380
27160	17	7904	38380
27161	17	7908	38380
27162	17	16672	38380
27163	17	16673	38380
27164	17	16699	38380
27165	18	16701	38380
27166	11	26989	38380
27167	11	26970	38380
27168	11	26973	38380
42521	11	26974	38380
42522	11	26972	38380
271791	18	43946	38380
271792	12	45765	38380
271793	12	48283	38380
271794	12	50705	38380
271795	7	59532	38380
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
2739
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
26414	1	d4dd6199-87e1-4100-84ce-2fafd72803d6	WORKER	210	1.00	f	\N	26614
26415	1	99b6ff06-2be1-4696-a642-549cd2a4670d	WORKER	70	0.46	f	\N	26615
26416	1	e49031a6-3ec1-4de4-b08a-1df4344e8043	WORKER	80	0.53	f	\N	26615
26417	1	397a6f1c-ce67-4e62-a0cd-1632d509c4c6	WORKER	101	1.00	f	\N	26616
26418	1	0a857d14-ebe2-4b2f-9cef-a7a6ba6a5308	WORKER	200	1.00	f	\N	26617
26419	1	eba58985-d591-4d98-bf04-4bbd76375616	WORKER	100	1.00	f	\N	26619
26420	1	eb0a9aa5-7584-4b1e-9eb0-71acf24ee6e0	WORKER	200	1.00	f	\N	26620
26421	1	93a5a9b6-a15e-44d4-95fb-a0fd5ada3c69	WORKER	200	1.00	f	\N	26621
26422	1	910643dd-deb4-41bb-b738-172989c7cb4b	WORKER	400	1.00	f	\N	26622
26423	1	2ee35234-87fd-4cb7-babf-122bf1e46781	WORKER	150	1.00	f	\N	26624
26424	1	119e0a40-4cf1-4508-968e-c7c13657ca8c	WORKER	200	1.00	f	\N	26625
25720	2	660c29b9-1753-4455-aea5-5ec31036c9ca	WORKER	100	1.00	f	\N	25436
25721	2	ea64a919-5168-4ac0-bee8-69b0f503b92d	WORKER	200	1.00	f	\N	25437
25722	2	1a68a0d8-0270-4b2f-b8e2-9328e57bd510	MACHINE	100	1.00	f	\N	25438
25723	2	4cb59afa-8cc7-4f79-8189-68f6a2b2b847	WORKER	150	1.00	f	\N	25440
25724	2	32760635-b673-4580-ab5d-59217b41ad7c	WORKER	200	1.00	f	\N	25441
25725	2	8deed49b-6563-40e5-be9c-10a078c847d0	WORKER	100	1.00	f	\N	25442
43396	3	PREFIX-00011-00001-00001	WORKER	100	1.00	f	43501	\N
43397	3	PREFIX-00011-00002-00001	WORKER	200	1.00	f	43502	\N
43398	3	PREFIX-00011-00003-00001	MACHINE	100	1.00	f	43503	\N
43399	3	PREFIX-00011-00006-00001	WORKER	150	1.00	f	43505	\N
31736	1	fc19490d-ad1b-4b0a-8c38-83d60e511310	WORKER	100	1.00	f	\N	26652
31737	1	1ac2c837-f52e-45ac-9696-e6f2628792b9	WORKER	100	1.00	f	\N	26653
31738	1	86b4173d-0ef3-40e0-9eca-c7ac726f6828	WORKER	100	1.00	f	\N	26655
31739	1	6e396811-99a6-4aed-aad0-a304dcdc25ec	WORKER	100	1.00	f	\N	26656
31740	1	31bd0579-f473-418c-b793-828086d4a133	WORKER	300	1.00	f	\N	26657
43400	3	PREFIX-00011-00007-00001	WORKER	200	1.00	f	43506	\N
43401	3	PREFIX-00011-00005-00001	WORKER	100	1.00	f	43507	\N
31756	9	PREFIX-00009-00004-00001	WORKER	100	1.00	f	31844	\N
31757	9	PREFIX-00009-00005-00001	WORKER	100	1.00	f	31845	\N
31760	9	PREFIX-00009-00003-00001	WORKER	300	1.00	f	31849	\N
43404	3	PREFIX-00009-00008-00001	WORKER	300	1.00	f	43510	\N
31758	9	PREFIX-00009-00006-00001	WORKER	100	1.00	f	31847	\N
31759	9	PREFIX-00009-00007-00001	WORKER	100	1.00	f	31848	\N
57196	1	1bed5740-6658-485b-ab68-deeba15d8cd8	WORKER	150	1.00	f	\N	57479
57197	1	d6ad7e63-cc46-40c6-a950-8ff15a6b769b	WORKER	200	1.00	f	\N	57480
47690	1	7a525937-e609-40ca-8b72-159f9bb0133c	WORKER	100	1.00	f	\N	47394
47691	1	db3958fb-3606-4e43-a351-f00dbde95b87	WORKER	200	1.00	f	\N	47395
47692	1	638d539e-d6ed-4087-9c1c-f8c45a4bea69	MACHINE	100	1.00	f	\N	47396
26458	7	PREFIX-00008-00004-00001	WORKER	210	1.00	f	25948	\N
26460	7	PREFIX-00008-00005-00002	WORKER	80	0.53	f	25949	\N
26459	7	PREFIX-00008-00005-00001	WORKER	70	0.46	f	25949	\N
26461	7	PREFIX-00008-00006-00001	WORKER	101	1.00	f	25950	\N
31714	7	PREFIX-00008-00007-00001	WORKER	200	1.00	f	25951	\N
31715	7	PREFIX-00008-00008-00001	WORKER	100	1.00	f	25953	\N
47693	1	fcade471-9410-47c9-b942-4639a80f8872	WORKER	150	1.00	f	\N	47398
47694	1	a356897d-2692-41fb-acf8-31e07c505dd5	WORKER	200	1.00	f	\N	47399
47695	1	47a17d32-03b8-4f39-81e3-fa2fce15d308	WORKER	100	1.00	f	\N	47400
57207	1	d164b518-dd57-4829-b414-065b9195b74d	WORKER	100	1.00	f	\N	57484
43367	16	PREFIX-00010-00004-00001	WORKER	210	1.00	f	43464	\N
43368	16	PREFIX-00010-00005-00001	WORKER	70	0.46	f	43465	\N
43369	16	PREFIX-00010-00005-00002	WORKER	80	0.53	f	43465	\N
43370	16	PREFIX-00010-00006-00001	WORKER	101	1.00	f	43466	\N
9090	13	PREFIX-00005-00001-00001	WORKER	150	1.00	f	7577	\N
9095	13	PREFIX-00005-00003-00001	WORKER	200	1.00	f	7585	\N
9096	13	PREFIX-00005-00004-00001	WORKER	100	1.00	f	7586	\N
22636	20	PREFIX-00006-00001-00001	WORKER	100	1.00	f	22339	\N
22637	20	PREFIX-00006-00002-00001	WORKER	200	1.00	f	22340	\N
22638	20	PREFIX-00006-00003-00001	MACHINE	100	1.00	f	22341	\N
1927	19	PREFIX-00002-00003-00001	WORKER	100	1.00	f	1533	\N
1928	19	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1534	\N
1929	19	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1536	\N
1930	19	PREFIX-00002-00006-00001	WORKER	100	1.00	f	1537	\N
1936	18	PREFIX-00002-00007-00001	WORKER	300	1.00	f	1543	\N
31720	7	PREFIX-00008-00013-00001	WORKER	200	1.00	f	31817	\N
59100	3	PREFIX-00008-00016-00001	WORKER	100	1.00	f	58910	\N
5272	30	PREFIX-00003-00004-00001	WORKER	210	1.00	f	4980	\N
9106	16	PREFIX-00003-00005-00002	WORKER	70	0.46	f	4981	\N
5273	30	PREFIX-00003-00005-00001	WORKER	80	1.00	f	4981	\N
5274	30	PREFIX-00003-00006-00001	WORKER	101	1.00	f	4982	\N
5275	30	PREFIX-00003-00007-00001	WORKER	200	1.00	f	4983	\N
5276	30	PREFIX-00003-00008-00001	WORKER	100	1.00	f	4985	\N
5277	30	PREFIX-00003-00009-00001	WORKER	200	1.00	f	4986	\N
5278	30	PREFIX-00003-00010-00001	WORKER	200	1.00	f	4987	\N
5279	30	PREFIX-00003-00011-00001	WORKER	400	1.00	f	4988	\N
57202	3	PREFIX-00003-00015-00001	WORKER	150	1.00	f	56801	\N
57203	3	PREFIX-00003-00016-00001	WORKER	200	1.00	f	56802	\N
5280	30	PREFIX-00003-00012-00001	WORKER	150	1.00	f	4990	\N
57184	5	PREFIX-00013-00001-00001	WORKER	100	1.00	f	56787	\N
57186	5	PREFIX-00013-00003-00001	MACHINE	100	1.00	f	56789	\N
57187	5	PREFIX-00013-00006-00001	WORKER	150	1.00	f	56791	\N
57188	5	PREFIX-00013-00007-00001	WORKER	200	1.00	f	56792	\N
57189	5	PREFIX-00013-00005-00001	WORKER	100	1.00	f	56793	\N
57185	5	PREFIX-00013-00002-00001	WORKER	200	1.00	f	56788	\N
5281	30	PREFIX-00003-00013-00001	WORKER	200	1.00	f	4991	\N
58397	5	PREFIX-00014-00002-00001	WORKER	200	1.00	f	58000	\N
58398	5	PREFIX-00014-00003-00001	MACHINE	100	1.00	f	58001	\N
58399	5	PREFIX-00014-00006-00001	WORKER	150	1.00	f	58003	\N
58400	5	PREFIX-00014-00007-00001	WORKER	200	1.00	f	58004	\N
58401	5	PREFIX-00014-00005-00001	WORKER	100	1.00	f	58005	\N
58396	5	PREFIX-00014-00001-00001	WORKER	100	1.00	f	57999	\N
59101	3	PREFIX-00008-00017-00001	WORKER	100	1.00	f	58911	\N
59102	3	PREFIX-00008-00018-00001	WORKER	100	1.00	f	58912	\N
31716	7	PREFIX-00008-00009-00001	WORKER	200	1.00	f	25954	\N
31719	7	PREFIX-00008-00012-00001	WORKER	150	1.00	f	31816	\N
31717	7	PREFIX-00008-00010-00001	WORKER	200	1.00	f	25955	\N
31718	7	PREFIX-00008-00011-00001	WORKER	400	1.00	f	25956	\N
26362	17	PREFIX-00007-00001-00001	WORKER	100	1.00	f	25897	\N
26363	17	PREFIX-00007-00002-00001	WORKER	200	1.00	f	25898	\N
26364	17	PREFIX-00007-00003-00001	MACHINE	100	1.00	f	25899	\N
26367	17	PREFIX-00007-00005-00001	WORKER	100	1.00	f	25903	\N
59091	5	PREFIX-00007-00010-00001	WORKER	100	1.00	f	58895	\N
59092	5	PREFIX-00007-00011-00001	WORKER	100	1.00	f	58896	\N
59093	5	PREFIX-00007-00012-00001	WORKER	100	1.00	f	58897	\N
26365	17	PREFIX-00007-00006-00001	WORKER	150	1.00	f	25901	\N
26366	17	PREFIX-00007-00007-00001	WORKER	200	1.00	f	25902	\N
43371	16	PREFIX-00010-00007-00001	WORKER	200	1.00	f	43467	\N
43372	16	PREFIX-00010-00008-00001	WORKER	100	1.00	f	43469	\N
43373	16	PREFIX-00010-00009-00001	WORKER	200	1.00	f	43470	\N
43374	16	PREFIX-00010-00010-00001	WORKER	200	1.00	f	43471	\N
43375	16	PREFIX-00010-00011-00001	WORKER	400	1.00	f	43472	\N
57210	9	PREFIX-00010-00014-00001	WORKER	100	1.00	f	56805	\N
246858	3	PREFIX-00010-00016-00001	WORKER	100	1.00	f	246664	\N
246859	3	PREFIX-00010-00017-00001	WORKER	100	1.00	f	246665	\N
43376	16	PREFIX-00010-00012-00001	WORKER	150	1.00	f	43474	\N
43377	16	PREFIX-00010-00013-00001	WORKER	200	1.00	f	43475	\N
22639	20	PREFIX-00006-00006-00001	WORKER	150	1.00	f	22343	\N
22640	20	PREFIX-00006-00007-00001	WORKER	200	1.00	f	22344	\N
22641	20	PREFIX-00006-00005-00001	WORKER	100	1.00	f	22345	\N
275934	2	PREFIX-00006-00008-00001	WORKER	100	1.00	f	275833	\N
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
52925	8	0
52925	8	1
52925	8	2
52925	8	3
52925	8	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
9196	7576
9197	7576
9195	7584
9194	7584
43684	43504
43685	43504
43687	43500
43688	43500
31579	31843
31578	31843
31582	31846
31583	31846
31585	31842
31586	31842
58212	58002
58211	58002
58215	57998
58214	57998
59195	58909
59196	58909
59197	58908
59198	58908
31530	25947
31529	25947
31536	25952
31535	25952
31540	31815
31539	31815
31542	25946
31541	25946
56999	56790
57000	56790
57002	56786
57003	56786
5358	4979
5357	4979
5364	4984
5363	4984
57014	56800
57015	56800
5369	4952
5370	4952
5367	4989
5368	4989
43635	43463
43636	43463
43641	43468
43642	43468
43645	43473
43646	43473
43648	43462
43647	43462
59189	58894
59188	58894
59191	58893
59192	58893
26116	25896
26117	25896
26114	25900
26113	25900
2023	1532
2022	1532
2026	1535
2027	1535
2029	1531
2028	1531
22731	22342
22730	22342
22733	22338
22734	22338
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
14849	35	ec89906f-369e-4ac3-b6fb-15c64a016bc4	Zona Cubierta	14746
14847	35	9c283fde-f94a-456e-a490-af07e9669a63	Zona Motor	14746
14848	34	86a9a95b-3609-47af-a9e1-5dad1ead1d9a	Zona Bodegas	14746
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
14746	1	62ab1b94-706b-49a8-8618-e4f279f683b3	Zonas	t
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
247652	1	247551	247552
2525	1	2326	2327
38178	1	37989	37990
38179	1	37991	37992
38180	1	37991	37988
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
37994	1	43946	1415	2010-07-01 00:00:00	2010-07-01 00:00:00	1276603010805	2010-08-20	8	2010-10-13	4
7979	14	7878	1414	2010-07-09 12:59:30.412	2010-06-14 12:59:30.412	1276514604779	2010-06-30	4	2010-07-19	1
247552	3	247451	1415	2010-09-08 00:00:00	2010-09-08 00:00:00	1278408595482	2011-01-10	4	2011-01-26	8
247551	3	247450	1414	2010-09-08 00:00:00	2010-09-08 00:00:00	1278408570841	2010-12-22	8	2011-01-10	4
37992	6	27066	1415	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597056978	2011-01-26	8	2011-02-14	4
37983	5	27057	1415	2010-07-15 00:00:00	2010-06-15 09:45:17.731	1276591908517	2010-08-04	4	2010-08-20	8
2326	12	2225	1414	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276425557107	2010-06-13	0	2010-06-30	4
2327	13	2226	1415	2010-06-13 12:33:10.77	2010-06-13 12:33:10.77	1276425619376	2010-06-30	4	2010-07-16	8
37989	4	27063	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597077782	2010-08-04	5	2010-08-23	1
37990	7	27064	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597108509	2010-08-23	1	2010-09-08	5
37988	10	27062	1414	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597131694	2010-10-13	8	2010-10-27	8
37991	5	27065	\N	2010-07-01 00:00:00	2010-07-01 00:00:00	1276597033207	\N	0	\N	0
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
13837	Incidencias	100	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
1216	Torno 1	Torno para realizar eixes de ata 10 metros.
1220	Torno 2	Torno para realizar eixes de ata 30 m
240482	Taladro pilon	taladron grande
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
240885	1	mtr010	un buen material	10.00	1010	\N	909
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
909	2	37e9d60d-43c1-4a2e-93cc-01c505293d45	Imported materials without category	f	\N
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
1112	7	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	707
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
4980	14849
4981	14847
4982	14847
4983	14849
4985	14849
4987	14847
4990	14848
25948	14849
25949	14847
25950	14847
25951	14849
25953	14849
25955	14847
31816	14848
43464	14849
43465	14847
43466	14847
43467	14849
43469	14849
43471	14847
43474	14848
43473	14849
246664	14849
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
26614	14849
26615	14847
26616	14847
26617	14849
26619	14849
26621	14847
26624	14848
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
43500	\N	\N	t	7	0.00	0.00	850	\N	\N	0	\N	1
31842	\N	\N	t	8	0.00	0.00	1000	\N	\N	0	\N	1
56786	Javier Moran	\N	t	7	0.00	0.00	850	ref 334	\N	0	\N	1
4952	Xavi	\N	t	16	0.00	0.00	2261	\N	\N	0	1818	1
57998	Javier Moran	\N	t	7	0.00	0.00	850	ref-1	\N	0	\N	1
25946	\N	\N	t	18	30000.00	0.00	2211	\N	\N	0	\N	1
25896	\N	\N	t	12	0.00	0.00	1150	\N	\N	0	\N	1
43462	\N	\N	t	17	0.00	0.00	2211	\N	\N	0	\N	1
7576	\N	\N	t	4	20000.00	0.00	450	001	\N	5	1818	1
1531	Javier Moran	\N	t	7	0.00	0.00	700	ref 1	\N	0	1820	1
22338	\N	t	t	8	0.00	0.00	950	\N	\N	0	\N	1
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer) FROM stdin;
31844	9	tarefa limitantes 1	\N	PREFIX-00009-00004	\N	\N	0.00	f	31843	26652	\N	0
31845	9	tarefa limitantes 2	\N	PREFIX-00009-00005	\N	\N	0.00	f	31843	26653	\N	1
31849	9	tarefa limitantes 5	\N	PREFIX-00009-00003	\N	\N	0.00	f	31842	26657	\N	2
43507	3	Tarefa 5	\N	PREFIX-00011-00005	\N	\N	0.00	f	43500	25442	\N	4
43500	3	Pedido 2 Escenarios	\N	PREFIX-00011	2010-06-15 13:49:04.771	2010-09-22 00:00:00	0.00	f	\N	\N	\N	\N
43501	3	Tarefa 1	\N	PREFIX-00011-00001	\N	\N	0.00	f	43500	25436	\N	0
43502	3	Tarefa 2	\N	PREFIX-00011-00002	\N	\N	0.00	f	43500	25437	\N	1
43503	3	Tarefa 3	\N	PREFIX-00011-00003	\N	\N	0.00	f	43500	25438	\N	2
43504	3	Tarefa 4	\N	PREFIX-00011-00004	\N	\N	0.00	f	43500	25439	\N	3
43505	3	Tarefa 4.2	\N	PREFIX-00011-00006	\N	\N	0.00	f	43504	25440	\N	0
43506	3	Tarefa 4.1	\N	PREFIX-00011-00007	\N	\N	0.00	f	43504	25441	\N	1
43510	3	Recurso limitante xenérica	\N	PREFIX-00009-00008	\N	\N	0.00	f	31842	\N	\N	3
31847	9	tarefa limitantes 3	\N	PREFIX-00009-00006	\N	\N	0.00	f	31846	26655	\N	0
31848	9	tarefa limitantes 4	\N	PREFIX-00009-00007	\N	\N	0.00	f	31846	26656	\N	1
31846	9	container 2	\N	PREFIX-00009-00002	\N	\N	0.00	f	31842	26654	\N	1
31842	10	Pedido recursos limitantes 2	Pedido para proba con recursos limitantes	PREFIX-00009	2010-07-01 00:00:00	2010-09-01 00:00:00	0.00	f	\N	\N	\N	\N
31843	9	container 1	\N	PREFIX-00009-00001	\N	\N	0.00	f	31842	26651	\N	0
4989	31	Tarea 3	\N	PREFIX-00003-00003	\N	\N	0.00	f	4952	\N	\N	2
4980	31	Tarea 1.2	\N	PREFIX-00003-00004	\N	\N	0.20	f	4979	\N	\N	0
4981	31	Tarea 1.1	\N	PREFIX-00003-00005	\N	\N	0.40	f	4979	\N	\N	1
4982	32	Tarea 1.3	\N	PREFIX-00003-00006	\N	\N	0.25	f	4979	\N	\N	2
4983	31	Tarea 1.4	\N	PREFIX-00003-00007	\N	\N	0.00	f	4979	\N	\N	3
25952	7	Tarea2	\N	PREFIX-00008-00002	\N	\N	0.00	f	25946	26618	\N	1
25947	7	Tarea1	\N	PREFIX-00008-00001	\N	\N	0.00	f	25946	26613	\N	0
25948	7	Tarea 1.2	\N	PREFIX-00008-00004	\N	\N	0.00	f	25947	26614	\N	0
25949	7	Tarea 1.1	\N	PREFIX-00008-00005	\N	\N	0.00	f	25947	26615	\N	1
25950	7	Tarea 1.3	\N	PREFIX-00008-00006	\N	\N	0.00	f	25947	26616	\N	2
25951	7	Tarea 1.4	\N	PREFIX-00008-00007	\N	\N	0.00	f	25947	26617	\N	3
25953	7	Tarea 2.2 	\N	PREFIX-00008-00008	\N	\N	0.00	f	25952	26619	\N	0
25954	7	Tarea 2.1	\N	PREFIX-00008-00009	\N	\N	0.00	f	25952	26620	\N	1
43473	16	Tarea 3	\N	PREFIX-00010-00003	\N	\N	0.00	f	43462	26623	\N	2
43463	16	Tarea1	\N	PREFIX-00010-00001	\N	\N	0.00	f	43462	26613	\N	0
43464	16	Tarea 1.2	\N	PREFIX-00010-00004	\N	\N	0.00	f	43463	26614	\N	0
43465	16	Tarea 1.1	\N	PREFIX-00010-00005	\N	\N	0.00	f	43463	26615	\N	1
43466	16	Tarea 1.3	\N	PREFIX-00010-00006	\N	\N	0.00	f	43463	26616	\N	2
43467	16	Tarea 1.4	\N	PREFIX-00010-00007	\N	\N	0.00	f	43463	26617	\N	3
43470	16	Tarea 2.1	\N	PREFIX-00010-00009	\N	\N	0.00	f	43468	26620	\N	1
43471	16	Tarea 2.3	\N	PREFIX-00010-00010	\N	\N	0.00	f	43468	26621	\N	2
43472	16	Tarea 2.4	\N	PREFIX-00010-00011	\N	\N	0.00	f	43468	26622	\N	3
43474	16	Tarea 3.2	\N	PREFIX-00010-00012	\N	\N	0.00	f	43473	26624	\N	0
7584	14	Tarea 1.4	\N	PREFIX-00005-00002	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.21	f	7576	\N	PREFIX-00003-00007	0
7576	15	Desarrollo de un proyecto para el cliente.	\N	PREFIX-00005	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.21	f	\N	\N	\N	\N
7577	14	Subtarefa 1.4.3	\N	PREFIX-00005-00001	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	0.25	f	7584	\N	\N	0
7585	14	Subtarefa 1.4.1	\N	PREFIX-00005-00003	\N	\N	0.30	f	7584	\N	\N	1
7586	14	Subtarefa 1.4.2	\N	PREFIX-00005-00004	\N	\N	0.00	f	7584	\N	\N	2
22339	21	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0.00	f	22338	\N	\N	0
22340	21	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0.00	f	22338	\N	\N	1
22341	21	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0.15	f	22338	\N	\N	2
22343	21	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0.10	f	22342	\N	\N	0
1533	19	tarefa limitantes 1	\N	PREFIX-00002-00003	\N	\N	0.50	f	1532	\N	\N	0
1534	19	tarefa limitantes 2	\N	PREFIX-00002-00004	\N	\N	0.20	f	1532	\N	\N	1
1535	19	container 2	\N	PREFIX-00002-00002	\N	\N	0.00	f	1531	\N	\N	1
1536	19	tarefa limitantes 3	\N	PREFIX-00002-00005	\N	\N	0.00	f	1535	\N	\N	0
1537	19	tarefa limitantes 4	\N	PREFIX-00002-00006	\N	\N	0.00	f	1535	\N	\N	1
1543	18	tarefa limitantes 5	\N	PREFIX-00002-00007	\N	\N	0.40	f	1531	\N	\N	2
1531	21	Pedido recursos limitantes	Pedido para proba con recursos limitantes	PREFIX-00002	2010-06-13 12:33:10.77	\N	0.27	f	\N	\N	\N	\N
1532	20	container 1	\N	PREFIX-00002-00001	\N	\N	0.35	f	1531	\N	\N	0
25946	8	Pedido 5	\N	PREFIX-00008	2010-09-08 00:00:00	2010-12-31 00:00:00	0.00	f	\N	\N	\N	\N
31815	7	Tarea 3	\N	PREFIX-00008-00003	\N	\N	0.00	f	25946	26623	\N	2
31816	7	Tarea 3.2	\N	PREFIX-00008-00012	\N	\N	0.00	f	31815	26624	\N	0
31817	7	Tarea 3.1	\N	PREFIX-00008-00013	\N	\N	0.00	f	31815	26625	\N	1
58908	3	Tarea 4	\N	PREFIX-00008-00014	\N	\N	0.00	f	25946	\N	\N	3
56789	5	Tarefa 3	\N	PREFIX-00013-00003	\N	\N	0.00	f	56786	47396	\N	2
56790	5	Tarefa 4	\N	PREFIX-00013-00004	\N	\N	0.00	f	56786	47397	\N	3
56791	5	Tarefa 4.2	\N	PREFIX-00013-00006	\N	\N	0.00	f	56790	47398	\N	0
56792	5	Tarefa 4.1	\N	PREFIX-00013-00007	\N	\N	0.00	f	56790	47399	\N	1
4985	31	Tarea 2.2 	\N	PREFIX-00003-00008	\N	\N	0.00	f	4984	\N	\N	0
4986	31	Tarea 2.1	\N	PREFIX-00003-00009	\N	\N	0.00	f	4984	\N	\N	1
4987	31	Tarea 2.3	\N	PREFIX-00003-00010	\N	\N	0.00	f	4984	\N	\N	2
4988	31	Tarea 2.4	\N	PREFIX-00003-00011	\N	\N	0.00	f	4984	\N	\N	3
56800	3	Tarefa 4 - Template	\N	PREFIX-00003-00014	2010-06-24 00:00:00	2010-06-24 00:00:00	0.00	f	4952	57478	\N	3
56801	3	Tarefa 4.2	\N	PREFIX-00003-00015	\N	\N	0.00	f	56800	57479	\N	0
56802	3	Tarefa 4.1	\N	PREFIX-00003-00016	\N	\N	0.00	f	56800	57480	\N	1
4990	31	Tarea 3.2	\N	PREFIX-00003-00012	\N	\N	0.00	f	4989	\N	\N	0
56788	5	Tarefa 2	\N	PREFIX-00013-00002	\N	\N	0.60	f	56786	47395	\N	1
56786	5	Aplicacion Pedido 2 - Template	descricion numero 2	PREFIX-00013	2010-06-22 10:26:16.811	2010-09-29 00:00:00	0.20	f	\N	\N	\N	\N
56787	5	Tarefa 1	\N	PREFIX-00013-00001	\N	\N	0.50	f	56786	47394	\N	0
56793	5	Tarefa 5	\N	PREFIX-00013-00005	\N	\N	0.00	f	56786	47400	\N	4
4952	39	Pedido 1	\N	PREFIX-00003	2010-06-14 12:59:30.412	2010-09-23 00:00:00	0.05	f	\N	\N	\N	\N
4979	38	Tarea1	\N	PREFIX-00003-00001	\N	\N	0.19	f	4952	\N	\N	0
4984	31	Tarea2	\N	PREFIX-00003-00002	\N	\N	0.00	f	4952	\N	\N	1
4991	31	Tarea 3.1	\N	PREFIX-00003-00013	\N	\N	0.00	f	4989	\N	\N	1
57999	5	Tarefa 1	\N	PREFIX-00014-00001	\N	\N	0.00	f	57998	25436	\N	0
57998	5	Pedido 2 Template - Aplicacion 2	descricion	PREFIX-00014	2010-06-24 13:17:15.828	2010-10-01 00:00:00	0.00	f	\N	25435	\N	\N
58000	5	Tarefa 2	\N	PREFIX-00014-00002	\N	\N	0.00	f	57998	25437	\N	1
58001	5	Tarefa 3	\N	PREFIX-00014-00003	\N	\N	0.00	f	57998	25438	\N	2
58002	5	Tarefa 4	\N	PREFIX-00014-00004	\N	\N	0.00	f	57998	25439	\N	3
58003	5	Tarefa 4.2	\N	PREFIX-00014-00006	\N	\N	0.00	f	58002	25440	\N	0
58004	5	Tarefa 4.1	\N	PREFIX-00014-00007	\N	\N	0.00	f	58002	25441	\N	1
58005	5	Tarefa 5	\N	PREFIX-00014-00005	\N	\N	0.00	f	57998	25442	\N	4
58909	3	Tarea 4 (copy)	\N	PREFIX-00008-00015	\N	\N	0.00	f	58908	\N	\N	0
58910	3	Subtarea 4.2	\N	PREFIX-00008-00016	\N	\N	0.00	f	58909	\N	\N	0
58911	3	Subtarea 4.1	\N	PREFIX-00008-00017	\N	\N	0.00	f	58909	\N	\N	1
58912	3	Tarea 4.2	\N	PREFIX-00008-00018	\N	\N	0.00	f	58908	\N	\N	1
25955	7	Tarea 2.3	\N	PREFIX-00008-00010	\N	\N	0.00	f	25952	26621	\N	2
25956	7	Tarea 2.4	\N	PREFIX-00008-00011	\N	\N	0.00	f	25952	26622	\N	3
25900	17	Tarefa 4	\N	PREFIX-00007-00004	\N	\N	0.00	f	25896	25439	\N	3
25896	19	Pedido 3	\N	PREFIX-00007	2010-06-15 09:45:17.731	2010-09-22 00:00:00	0.09	f	\N	\N	\N	\N
25897	17	Tarefa 1	\N	PREFIX-00007-00001	\N	\N	0.20	f	25896	25436	\N	0
25898	17	Tarefa 2	\N	PREFIX-00007-00002	\N	\N	0.30	f	25896	25437	\N	1
25899	17	Recursos lim Tarefa 3	\N	PREFIX-00007-00003	\N	\N	0.25	f	25896	25438	\N	2
25903	17	Tarefa 5	\N	PREFIX-00007-00005	\N	\N	0.00	f	25896	25442	\N	4
58893	5	Tarea 6	\N	PREFIX-00007-00008	\N	\N	0.00	f	25896	\N	\N	5
58894	5	Subtarea 6.1	\N	PREFIX-00007-00009	\N	\N	0.00	f	58893	\N	\N	0
58895	5	Subtarea 6.1.1	\N	PREFIX-00007-00010	\N	\N	0.00	f	58894	\N	\N	0
58896	5	Subtarea 6.1.2	\N	PREFIX-00007-00011	\N	\N	0.00	f	58894	\N	\N	1
58897	5	Subtarea 6.2	\N	PREFIX-00007-00012	\N	\N	0.00	f	58893	\N	\N	1
25901	17	Tarefa 4.2	\N	PREFIX-00007-00006	\N	\N	0.00	f	25900	25440	\N	0
25902	17	Tarefa 4.1	\N	PREFIX-00007-00007	\N	\N	0.00	f	25900	25441	\N	1
43462	18	Pedido Escenario 2	\N	PREFIX-00010	2010-06-15 13:42:02.981	2010-09-23 00:00:00	0.00	f	\N	\N	\N	\N
43468	16	Tarea2	\N	PREFIX-00010-00002	\N	\N	0.00	f	43462	26618	\N	1
43469	16	Tarea 2.2 	\N	PREFIX-00010-00008	\N	\N	0.00	f	43468	26619	\N	0
56805	9	Plantilla para grupo template 5	\N	PREFIX-00010-00014	\N	2010-06-25 00:00:00	0.00	f	43462	57484	\N	3
246663	3	Tarefa 4	\N	PREFIX-00010-00015	\N	\N	0.00	f	43462	\N	\N	4
246664	3	Tarefa 4.2	\N	PREFIX-00010-00016	\N	\N	0.00	f	246663	\N	\N	0
246665	3	Tarefa 4.1	\N	PREFIX-00010-00017	\N	\N	0.00	f	246663	\N	\N	1
22344	21	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0.70	f	22342	\N	\N	1
22345	21	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0.00	f	22338	\N	\N	4
22338	23	Pedido 2	\N	PREFIX-00006	2010-06-14 18:10:13.82	2010-09-22 00:00:00	0.17	f	\N	\N	\N	\N
22342	23	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	0.44	f	22338	\N	\N	3
43475	16	Tarea 3.1	\N	PREFIX-00010-00013	\N	\N	0.00	f	43473	26625	\N	1
275833	2	Tarefa 6	\N	PREFIX-00006-00008	\N	\N	0.00	f	22338	\N	\N	5
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
26650	1	Pedido recursos limitantes	Pedido para proba con recursos limitantes	PREFIX-00002	0	\N	3	\N	\N
26651	1	container 1	\N	PREFIX-00002-00001	\N	\N	3	26650	0
26612	1	Pedido 1 Template	\N	PREFIX-00003	0	100	3	\N	\N
26654	1	container 2	\N	PREFIX-00002-00002	\N	\N	3	26650	1
26657	1	tarefa limitantes 5	\N	PREFIX-00002-00007	\N	\N	0	26650	2
26652	1	tarefa limitantes 1	\N	PREFIX-00002-00003	\N	\N	0	26651	0
26653	1	tarefa limitantes 2	\N	PREFIX-00002-00004	\N	\N	0	26651	1
26655	1	tarefa limitantes 3	\N	PREFIX-00002-00005	\N	\N	0	26654	0
26656	1	tarefa limitantes 4	\N	PREFIX-00002-00006	\N	\N	0	26654	1
26613	1	Tarea1	\N	PREFIX-00003-00001	\N	\N	3	26612	0
26618	1	Tarea2	\N	PREFIX-00003-00002	\N	\N	3	26612	1
26623	1	Tarea 3	\N	PREFIX-00003-00003	\N	\N	3	26612	2
26614	1	Tarea 1.2	\N	PREFIX-00003-00004	\N	\N	0	26613	0
26615	1	Tarea 1.1	\N	PREFIX-00003-00005	\N	\N	0	26613	1
26616	1	Tarea 1.3	\N	PREFIX-00003-00006	\N	\N	0	26613	2
26617	1	Tarea 1.4	\N	PREFIX-00003-00007	\N	\N	0	26613	3
26619	1	Tarea 2.2 	\N	PREFIX-00003-00008	\N	\N	0	26618	0
26620	1	Tarea 2.1	\N	PREFIX-00003-00009	\N	\N	0	26618	1
26621	1	Tarea 2.3	\N	PREFIX-00003-00010	\N	\N	0	26618	2
26622	1	Tarea 2.4	\N	PREFIX-00003-00011	\N	\N	0	26618	3
26624	1	Tarea 3.2	\N	PREFIX-00003-00012	\N	\N	0	26623	0
26625	1	Tarea 3.1	\N	PREFIX-00003-00013	\N	\N	0	26623	1
25435	2	Pedido 2 Template	\N	PREFIX-00006	0	99	3	\N	\N
25436	2	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0	25435	0
25437	2	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0	25435	1
25438	2	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0	25435	2
25439	2	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	3	25435	3
25440	2	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0	25439	0
25441	2	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0	25439	1
25442	2	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0	25435	4
47393	1	Pedido 2 - Template	\N	PREFIX-00006	0	99	3	\N	\N
47394	1	Tarefa 1	\N	PREFIX-00006-00001	\N	\N	0	47393	0
47395	1	Tarefa 2	\N	PREFIX-00006-00002	\N	\N	0	47393	1
47396	1	Tarefa 3	\N	PREFIX-00006-00003	\N	\N	0	47393	2
47397	1	Tarefa 4	\N	PREFIX-00006-00004	\N	\N	3	47393	3
47400	1	Tarefa 5	\N	PREFIX-00006-00005	\N	\N	0	47393	4
47398	1	Tarefa 4.2	\N	PREFIX-00006-00006	\N	\N	0	47397	0
47399	1	Tarefa 4.1	\N	PREFIX-00006-00007	\N	\N	0	47397	1
57478	1	Tarefa 4 - Template	\N	PREFIX-00007-00004	10	10	3	\N	\N
57479	1	Tarefa 4.2	\N	PREFIX-00007-00006	\N	\N	0	57478	0
57480	1	Tarefa 4.1	\N	PREFIX-00007-00007	\N	\N	0	57478	1
57484	1	Plantilla para grupo template 5	\N	PREFIX-00006-00005	\N	10	0	\N	\N
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
43507	1
43501	1
43502	1
43503	1
43505	1
43506	1
31844	1
31845	1
31849	1
43510	1
31847	1
31848	1
25948	1
25949	2
25950	1
25951	1
31816	1
56788	1
56787	1
56789	1
56791	1
56792	1
56793	1
4980	1
4981	2
4982	1
4983	1
4985	1
4986	1
4987	1
4988	1
56801	1
56802	1
4990	1
4991	1
57999	1
58000	1
58001	1
58003	1
58004	1
58005	1
31817	1
58910	1
58911	1
58912	1
25953	1
25954	1
25955	1
25956	1
25897	1
25898	1
25899	1
25903	1
58895	1
58896	1
58897	1
25901	1
25902	1
43464	1
43465	2
43466	1
43467	1
43469	1
43470	1
43471	1
43472	1
56805	1
246664	1
246665	1
43474	1
43475	1
7577	1
7585	1
7586	1
1533	1
1534	1
1536	1
1537	1
1543	1
275833	1
22339	1
22340	1
22341	1
22343	1
22344	1
22345	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1531
1532
1535
4952
4979
4984
4989
7576
7584
22338
22342
25896
25900
25946
25947
25952
31815
31842
31843
31846
43462
43463
43468
43473
43500
43504
56786
56790
56800
57998
58002
58893
58894
58908
58909
246663
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
25435
25439
26612
26613
26618
26623
26650
26651
26654
47393
47397
57478
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
26614	0
26615	0
26616	0
26617	0
26619	0
26620	0
26621	0
26622	0
26624	0
26625	0
25436	0
25437	0
25438	0
25440	0
25441	0
25442	0
26652	0
26653	0
26655	0
26656	0
26657	0
47394	0
47395	0
47396	0
47398	0
47399	0
47400	0
57479	0
57480	0
57484	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	16	PREFIX	14	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
26612	1
25435	1
26650	1
47393	1
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
26184	3	2010-06-15 13:50:02.701	38380
57270	5	2010-06-30 19:06:51.829	707
58482	6	2010-06-30 19:31:15.314	707
26185	17	2010-07-23 14:07:22.378	707
26180	17	2010-06-15 13:48:50.068	38380
26168	12	2010-07-27 11:43:00.876	707
7778	19	2010-07-27 11:43:01.896	707
26172	15	2010-07-27 11:43:02.116	707
1721	27	2010-07-27 11:43:07.867	707
5154	44	2010-07-27 11:43:07.749	707
26164	22	2010-07-27 11:43:20.925	707
22526	30	2010-07-29 10:22:52.111	707
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
4354	41	3767394d-4be9-4a09-b7cf-42da82a53b24	t	f	4448
4352	40	94cf72ff-85f9-4eb0-bb30-2f0518688201	t	f	4447
4358	31	62dee224-2641-4c34-bbc6-153f98cdf250	t	f	4450
4348	31	62f19cfb-2859-4bbb-91d6-b178cb48eb2f	t	f	4445
4350	31	98a4b590-e399-43f0-a46f-f11358cb6445	t	f	4446
4344	32	e3974c04-4785-407d-bea4-0aa4530f8a02	t	f	4444
1216	13	bb5d29ab-e802-4d90-841a-2cc87d937a6d	t	t	3
1220	13	d692db0b-e344-467d-8cd5-c746c94ae8f4	t	t	5
21817	18	0b1cfd52-d327-4d01-9bf9-e64626a5ec2d	t	f	21917
1214	7	5aef0e25-573b-442e-b321-ce6c3be6608b	t	f	2
4356	7	2211b5bd-80f0-4f60-a5da-bc8f1de8b94e	t	f	4449
240482	3	075bcdb5-0c5a-4436-a9d5-54ad9cbcf11d	t	f	240582
240484	4	165af6d3-9e58-4f4e-84b7-4cc610cecccf	t	f	240583
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
43936	1	1.00	\N	210	26492	\N
43941	0	1.00	\N	150	26493	\N
43943	0	1.00	\N	100	26506	\N
16701	8	1.00	\N	200	22827	\N
245027	0	0.96	\N	100	57374	\N
16673	8	1.00	\N	200	5465	\N
7878	15	1.00	101	101	5456	\N
7908	9	1.00	\N	200	5460	\N
27047	2	1.00	\N	200	26476	\N
27048	2	1.00	\N	200	26477	\N
27049	2	1.00	\N	400	26478	\N
27045	2	1.00	\N	200	26473	\N
27041	2	1.00	\N	200	26481	\N
16699	11	0.96	\N	100	22826	\N
45765	8	1.33	\N	202	22828	\N
48283	6	1.29	\N	613	22829	\N
50705	3	0.41	\N	480	22830	\N
59532	3	0.96	\N	100	59287	\N
26973	13	0.99	\N	150	26465	\N
27066	7	1.00	100	100	26485	\N
26974	12	1.00	\N	200	26466	\N
26972	12	0.96	\N	100	26468	\N
27057	6	1.00	100	100	26464	\N
26970	12	1.00	\N	200	26463	\N
26989	7	0.96	\N	100	26462	\N
43944	3	1.00	\N	210	26514	\N
43945	3	1.00	\N	150	26515	\N
265553	0	0.96	\N	100	26519	\N
7894	4	0.99	\N	150	9292	\N
7901	2	1.00	\N	200	9293	\N
2225	13	1.00	100	100	2121	\N
2226	14	1.00	100	100	2122	\N
247450	4	0.00	100	100	59292	\N
247451	4	0.00	100	100	59293	\N
27042	3	0.97	\N	210	26470	\N
27043	3	0.99	\N	150	26471	\N
27044	3	0.97	\N	101	26472	\N
27046	3	0.96	\N	100	26475	\N
27040	3	0.99	\N	150	26480	\N
7902	4	0.75	\N	48	9294	\N
7892	10	0.81	\N	52	9294	\N
43946	2	1.00	300	300	26528	\N
5861	21	1.11	\N	310	5454	\N
5863	17	1.35	\N	390	5455	\N
7904	11	0.96	\N	100	5459	\N
16672	9	0.99	\N	150	5464	\N
26993	3	0.99	\N	300	2129	\N
27063	5	1.00	100	100	26487	\N
27064	8	1.00	100	100	26488	\N
27062	11	1.00	80	80	26490	\N
27065	6	1.00	100	0	26484	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
2	1
3	1
5	1
4444	1
4445	1
4446	1
4447	1
4448	1
4449	1
4450	1
21917	1
240582	1
240583	10
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
38380	0	Escenario 2	Escenario de proba.	\N	707
707	1	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
1531	1721	707
4952	5154	707
7576	7778	707
22338	22526	707
25896	26164	707
25946	26168	707
31842	26172	707
25946	26168	38380
7576	7778	38380
1531	1721	38380
4952	5154	38380
31842	26172	38380
22338	22526	38380
25896	26164	38380
43462	26180	38380
43500	26184	38380
43462	26185	707
56786	57270	707
57998	58482	707
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
4952	5053	5154
4979	5080	5154
4980	5081	5154
4981	5082	5154
4982	5083	5154
4983	5084	5154
4984	5085	5154
4985	5086	5154
4986	5087	5154
4987	5088	5154
4988	5089	5154
4989	5090	5154
4990	5091	5154
4991	5092	5154
7576	7677	7778
7577	7678	7778
7584	7685	7778
7585	7686	7778
7586	7687	7778
22338	22439	22526
22339	22440	22526
22340	22441	22526
22341	22442	22526
22342	22443	22526
22343	22444	22526
22344	22445	22526
22345	22446	22526
25896	25997	26164
25897	25998	26164
25898	25999	26164
25899	26000	26164
25900	26001	26164
25901	26002	26164
25902	26003	26164
25903	26004	26164
25946	26047	26168
25947	26048	26168
25948	26049	26168
25949	26050	26168
25950	26051	26168
25951	26052	26168
25952	26053	26168
25953	26054	26168
25954	26055	26168
25955	26056	26168
25956	26057	26168
31815	31916	26168
31816	31917	26168
31817	31918	26168
31842	31943	26172
31843	31944	26172
31844	31945	26172
31845	31946	26172
31846	31947	26172
31847	31948	26172
31848	31949	26172
31849	31950	26172
43462	43563	26180
43463	43564	26180
43464	43565	26180
43465	43566	26180
43466	43567	26180
43467	43568	26180
43468	43569	26180
43469	43570	26180
43470	43571	26180
43471	43572	26180
43472	43573	26180
43473	43574	26180
43474	43575	26180
43475	43576	26180
43500	43601	26184
43501	43602	26184
43502	43603	26184
43503	43604	26184
43504	43605	26184
43505	43606	26184
43506	43607	26184
43507	43608	26184
43462	43609	26185
43463	43610	26185
43464	43611	26185
43465	43612	26185
43466	43613	26185
43467	43614	26185
43468	43615	26185
43469	43616	26185
43470	43617	26185
43471	43618	26185
43472	43619	26185
43473	43620	26185
43474	43621	26185
43475	43622	26185
43510	43625	26172
56786	56887	57270
56787	56888	57270
56788	56889	57270
56789	56890	57270
56790	56891	57270
56791	56892	57270
56792	56893	57270
56793	56894	57270
56800	56901	5154
56801	56902	5154
56802	56903	5154
56805	56906	26185
57998	58099	58482
57999	58100	58482
58000	58101	58482
58001	58102	58482
58002	58103	58482
58003	58104	58482
58004	58105	58482
58005	58106	58482
58893	58994	26164
58894	58995	26164
58895	58996	26164
58896	58997	26164
58897	58998	26164
58908	59009	26168
58909	59010	26168
58910	59011	26168
58911	59012	26168
58912	59013	26168
246663	246764	26185
246664	246765	26185
246665	246766	26185
275833	275658	22526
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
31946	9	0	31845
31950	9	0	31849
43625	3	0	43510
31943	9	3	31842
31944	9	3	31843
31945	9	0	31844
31947	9	3	31846
31948	9	0	31847
31949	9	0	31848
43601	3	3	43500
43602	3	0	43501
43603	3	0	43502
43604	3	0	43503
43605	3	3	43504
43606	3	0	43505
43607	3	0	43506
43608	3	0	43507
26047	8	2	25946
26048	7	3	25947
26049	7	0	25948
26050	7	0	25949
26051	7	0	25950
26052	7	0	25951
31916	7	3	31815
31917	7	0	31816
31918	7	0	31817
59009	3	2	58908
59010	3	3	58909
59011	3	0	58910
59012	3	0	58911
59013	3	4	58912
26053	7	3	25952
56887	5	3	56786
56890	5	0	56789
56891	5	3	56790
56892	5	0	56791
56893	5	0	56792
56894	5	0	56793
56889	5	0	56788
5053	32	3	4952
5080	31	3	4979
5081	31	0	4980
5082	31	0	4981
5083	31	0	4982
5084	31	0	4983
5085	31	3	4984
5086	31	0	4985
58099	5	3	57998
58101	5	0	58000
58103	5	3	58002
58100	5	0	57999
26054	7	0	25953
26055	7	0	25954
26056	7	0	25955
26057	7	0	25956
56888	5	0	56787
5087	31	0	4986
5088	31	0	4987
5089	31	0	4988
56901	3	3	56800
56902	3	0	56801
56903	3	0	56802
5090	31	3	4989
5091	31	0	4990
5092	31	0	4991
58102	5	0	58001
58104	5	0	58003
58105	5	0	58004
58106	5	0	58005
25997	17	3	25896
43563	15	3	43462
43609	10	3	43462
43564	15	3	43463
43610	10	3	43463
43565	15	0	43464
43611	10	0	43464
43566	15	0	43465
43612	10	0	43465
43567	15	0	43466
43613	10	0	43466
43568	15	0	43467
43614	10	0	43467
7677	14	3	7576
7685	14	3	7584
7678	14	0	7577
7686	14	0	7585
7687	14	0	7586
22444	21	0	22343
22445	21	0	22344
22446	21	0	22345
1632	21	3	1531
1633	19	3	1532
1634	19	0	1533
1635	19	0	1534
1644	20	0	1543
1636	20	0	1535
1637	20	1	1536
1638	20	1	1537
22439	21	3	22338
22440	21	0	22339
22441	21	0	22340
22442	21	0	22341
22443	21	3	22342
25998	17	0	25897
25999	17	0	25898
26000	17	0	25899
26004	17	0	25903
58994	5	3	58893
58995	5	3	58894
58996	5	0	58895
58997	5	0	58896
58998	5	0	58897
26001	17	3	25900
26002	17	0	25901
26003	17	0	25902
43569	15	3	43468
43615	10	3	43468
43570	15	0	43469
43616	10	0	43469
43571	15	0	43470
43617	10	0	43470
43572	15	0	43471
43618	10	0	43471
43573	15	0	43472
43619	10	0	43472
56906	9	0	56805
246764	3	0	246663
246765	3	1	246664
246766	3	1	246665
43574	15	3	43473
43620	10	3	43473
43575	15	0	43474
43621	10	0	43474
43576	15	0	43475
43622	10	0	43475
275658	2	0	275833
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
7878	1216
247451	1220
247450	1216
27066	1220
27057	1220
7894	4350
7901	4344
7902	4348
26993	4352
2225	1216
2226	1220
27063	1216
27064	1216
27062	1216
27065	1216
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
8080	14	7878	707
31221	4	27063	707
31231	17	27063	38380
31225	6	27064	707
31232	20	27064	38380
31224	9	27062	707
31239	10	26993	38380
31236	10	2226	38380
31235	10	2225	38380
31233	23	27062	38380
31223	5	27065	707
31229	18	27065	38380
248360	2	247451	707
248361	2	247450	707
31222	6	27066	707
31213	4	27057	707
8082	3	7894	707
8089	1	7901	707
8090	1	7902	707
31212	1	26993	707
31240	10	27057	38380
2729	10	2225	707
2730	11	2226	707
31227	17	7901	38380
31226	17	7894	38380
31228	18	7902	38380
31230	19	27066	38380
31234	16	7878	38380
269771	29	247450	38380
269772	29	247451	38380
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
79429641	4	1818	2010-06-30 19:03:36.719	\N	campo mais grande	23423.00	cd1	\N	\N	\N	\N	0
2916353	22	1818	2010-06-14 15:38:54.504	2010-06-14 15:45:03.801	Desarrollo de un proyecto para el cliente.	20000.00	001	t	t	t	t	2
79396865	3	1818	2010-06-30 18:03:43.193	\N	subcontratacion de prueba	10000.00	cd-123	\N	\N	\N	\N	0
79921155	2	1818	2010-06-30 19:30:45.701	\N	task grande	10000.00	cd-1234	\N	\N	\N	\N	0
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
26512	1	0	\N	\N	\N
26508	1	0	\N	\N	\N
26509	1	0	\N	\N	\N
26510	1	0	\N	\N	\N
26506	1	0	\N	\N	\N
26507	1	0	\N	\N	\N
26492	1	0	\N	\N	\N
26493	1	0	\N	\N	5
26494	1	0	\N	\N	\N
26495	1	0	\N	\N	\N
26497	1	0	\N	\N	\N
26498	1	0	\N	\N	\N
26499	1	0	\N	\N	\N
26500	1	0	\N	\N	\N
26502	1	0	\N	\N	\N
26503	1	0	\N	\N	\N
26478	1	0	\N	\N	\N
26470	1	0	\N	\N	\N
26471	1	0	\N	\N	\N
26472	1	0	\N	\N	\N
26473	1	0	\N	\N	\N
26480	1	0	\N	\N	\N
26481	1	0	\N	\N	\N
57369	1	2	2010-06-22 10:26:16.811	79429641	\N
57371	1	0	\N	\N	\N
57372	1	0	\N	\N	\N
57368	1	0	\N	\N	\N
57374	1	0	\N	\N	\N
57370	1	0	\N	\N	\N
5464	1	1	2010-07-02 12:48:00	\N	\N
5465	1	0	\N	\N	\N
5454	1	0	\N	\N	\N
5455	1	0	\N	\N	\N
5456	1	1	2010-06-30 00:00:00	\N	5
5457	1	2	2010-06-14 12:59:30.412	2916353	\N
5459	1	0	\N	\N	\N
5460	1	0	\N	\N	\N
5461	1	0	\N	\N	\N
5462	1	0	\N	\N	\N
57376	1	1	2010-06-24 00:00:00	\N	\N
57377	1	1	2010-06-24 00:00:00	\N	\N
58580	1	2	2010-06-24 13:17:15.828	79921155	\N
58582	1	0	\N	\N	\N
58581	1	2	2010-06-24 13:17:15.828	79396865	\N
58586	1	0	\N	\N	\N
58583	1	0	\N	\N	\N
58584	1	0	\N	\N	\N
26475	1	0	\N	\N	\N
26476	1	0	\N	\N	\N
26477	1	0	\N	\N	\N
2122	1	1	2010-06-30 00:00:00	\N	5
2129	1	0	\N	\N	\N
268559	1	0	\N	\N	\N
22826	1	0	\N	\N	\N
22827	1	0	\N	\N	\N
22828	1	0	\N	\N	\N
22829	1	0	\N	\N	\N
22830	1	0	\N	\N	\N
22832	1	0	\N	\N	\N
276134	1	0	\N	\N	\N
59293	1	1	2011-01-10 00:00:00	\N	5
59292	1	1	2010-12-22 00:00:00	\N	5
26485	1	1	2011-01-26 00:00:00	\N	5
26528	1	1	2010-08-20 00:00:00	\N	5
26487	1	1	2010-08-04 00:00:00	\N	5
26465	1	0	\N	\N	\N
26466	1	1	2010-10-01 00:30:31.20	\N	\N
59287	1	0	\N	\N	\N
59288	0	1	2010-09-07 22:02:16.80	\N	\N
59290	1	1	2011-02-05 01:05:50.40	\N	\N
26468	1	0	\N	\N	\N
26464	1	1	2010-08-04 00:00:00	\N	5
26463	1	1	2010-07-07 00:00:00	\N	\N
26462	1	1	2010-06-27 00:00:00	\N	\N
26524	1	0	\N	\N	\N
26525	1	1	2010-09-04 18:14:23.937	\N	\N
247046	1	0	\N	\N	\N
26519	1	1	2010-11-24 16:43:43.20	\N	\N
26520	1	0	\N	\N	\N
26521	1	1	2010-10-21 02:01:21.60	\N	\N
26522	1	1	2010-08-29 03:03:16.305	\N	\N
57379	1	0	\N	\N	\N
26514	1	1	2010-08-25 00:00:00	\N	\N
26515	1	0	\N	\N	5
26516	1	1	2010-09-05 14:08:17.391	\N	\N
26517	1	0	\N	\N	\N
9292	1	1	2010-06-14 00:00:00	\N	\N
9293	1	1	2010-06-14 00:00:00	\N	\N
9294	1	1	2010-06-14 00:00:00	\N	\N
2121	1	1	2010-06-13 00:00:00	\N	5
26488	1	1	2010-08-23 00:00:00	\N	5
26490	1	1	2010-10-13 00:00:00	\N	5
26484	1	1	2010-07-19 00:00:00	\N	5
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
9292	9090
9293	9095
9294	9096
26492	43367
26493	43369
26493	43368
26494	43370
26495	43371
26497	43372
26498	43373
26499	43374
26500	43375
26502	43376
26503	43377
26506	43396
26507	43397
26508	43398
26509	43399
26510	43400
26512	43401
26484	31756
26485	31757
26487	31758
26488	31759
26490	31760
26528	43404
57368	57184
57369	57185
57370	57186
57371	57187
57372	57188
57374	57189
5454	5272
5455	5273
5455	9106
5456	5274
5457	5275
5459	5276
5460	5277
5461	5278
5462	5279
5464	5280
5465	5281
57376	57202
57377	57203
58580	58396
58581	58397
58582	58398
58583	58399
58584	58400
58586	58401
26462	26362
26463	26363
26464	26364
26465	26365
26466	26366
26468	26367
59287	59091
59288	59092
59290	59093
26470	26458
26471	26460
26471	26459
26472	26461
26473	31714
26475	31715
26476	31716
26477	31717
26478	31718
26480	31719
26481	31720
59292	59100
59293	59101
26514	43367
26515	43369
26515	43368
26516	43370
26517	43371
26519	43372
26520	43373
26521	43374
26522	43375
26524	43376
26525	43377
57379	57210
247046	246858
247046	246859
2121	1927
2122	1928
2129	1936
268559	1930
268559	1929
22826	22636
22827	22637
22828	22638
22829	22639
22830	22640
22832	22641
276134	275934
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent) FROM stdin;
26492	5	Tarea 1.2	\N	2010-06-15 13:42:02.981	2010-07-22 13:42:02.981	\N	0.00	26496	\N	0
26493	5	Tarea 1.1	\N	2010-07-22 13:42:02.981	2010-08-18 13:42:02.981	\N	0.00	26496	\N	1
26494	5	Tarea 1.3	\N	2010-06-15 13:42:02.981	2010-06-28 04:42:02.981	\N	0.00	26496	\N	2
26495	5	Tarea 1.4	\N	2010-06-28 04:42:02.981	2010-07-23 04:42:02.981	\N	0.00	26496	\N	3
26512	2	Tarefa 5	\N	2010-06-15 13:49:04.771	2010-06-28 01:49:04.771	\N	0.00	26513	\N	4
26508	2	Tarefa 3	\N	2010-06-15 13:49:04.771	2010-06-28 01:49:04.771	\N	0.00	26513	\N	2
26511	2	Tarefa 4	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26513	\N	3
26509	2	Tarefa 4.2	\N	2010-06-15 13:49:04.771	2010-07-04 07:49:04.771	\N	0.00	26511	\N	0
26510	2	Tarefa 4.1	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26511	\N	1
26506	2	Tarefa 1	\N	2010-06-15 13:49:04.771	2010-07-02 13:49:04.771	\N	0.00	26513	\N	0
26507	2	Tarefa 2	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	\N	0.00	26513	\N	1
26513	2	Pedido 2 Escenarios	\N	2010-06-15 13:49:04.771	2010-07-10 13:49:04.771	2010-09-22	0.00	\N	\N	\N
26497	5	Tarea 2.2 	\N	2010-06-28 04:42:02.981	2010-07-10 16:42:02.981	\N	0.00	26501	\N	0
26498	5	Tarea 2.1	\N	2010-07-10 16:42:02.981	2010-08-04 16:42:02.981	\N	0.00	26501	\N	1
26499	5	Tarea 2.3	\N	2010-06-28 04:42:02.981	2010-07-23 04:42:02.981	\N	0.00	26501	\N	2
26500	5	Tarea 2.4	\N	2010-06-15 13:42:02.981	2010-08-04 13:42:02.981	\N	0.00	26501	\N	3
26502	5	Tarea 3.2	\N	2010-07-23 04:42:02.981	2010-08-10 22:42:02.981	\N	0.00	26504	\N	0
26503	5	Tarea 3.1	\N	2010-06-15 13:42:02.981	2010-07-10 13:42:02.981	\N	0.00	26504	\N	1
26496	7	Tarea1	\N	2010-06-15 13:42:02.981	2010-08-18 13:42:02.981	\N	0.00	26505	\N	0
26501	7	Tarea2	\N	2010-06-15 13:42:02.981	2010-08-04 16:42:02.981	\N	0.00	26505	\N	1
26504	7	Tarea 3	\N	2010-06-15 13:42:02.981	2010-08-10 22:42:02.981	\N	0.00	26505	\N	2
26505	7	Pedido Escenario 2	\N	2010-06-15 13:42:02.981	2010-08-18 13:42:02.981	2010-09-23	0.00	\N	\N	\N
5465	29	Tarea 3.1	\N	2010-07-29 12:48:00	2010-09-02 12:48:00	\N	0.00	5466	\N	1
5458	37	Tarea1	\N	2010-06-14 12:59:30.412	2010-08-05 12:59:30.412	\N	0.19	5467	\N	0
5454	29	Tarea 1.2	\N	2010-06-14 12:59:30.412	2010-08-05 12:59:30.412	\N	0.20	5458	\N	0
26475	6	Tarea 2.2 	\N	2010-10-15 00:00:00	2010-11-03 00:00:00	\N	0.00	26479	\N	0
26476	6	Tarea 2.1	\N	2010-09-25 00:00:00	2010-10-30 00:00:00	\N	0.00	26479	\N	1
26477	6	Tarea 2.3	\N	2010-09-08 00:00:00	2010-10-13 00:00:00	\N	0.00	26479	\N	2
26470	6	Tarea 1.2	\N	2010-09-08 00:00:00	2010-10-15 00:00:00	\N	0.00	26474	\N	0
26471	6	Tarea 1.1	\N	2010-09-08 00:00:00	2010-10-05 00:00:00	\N	0.00	26474	\N	1
26472	6	Tarea 1.3	\N	2010-09-08 00:00:00	2010-09-25 00:00:00	\N	0.00	26474	\N	2
26473	6	Tarea 1.4	\N	2010-10-05 00:00:00	2010-11-09 00:00:00	\N	0.00	26474	\N	3
26467	21	Tarefa 4	\N	2010-08-20 00:00:00	2010-11-05 00:30:31.20	\N	0.00	26469	\N	3
26465	17	Tarefa 4.2	\N	2010-08-20 00:00:00	2010-09-16 00:00:00	\N	0.00	26467	\N	0
26466	17	Tarefa 4.1	\N	2010-10-01 00:30:31.20	2010-11-05 00:30:31.20	\N	0.00	26467	\N	1
59291	4	Tarea 6	\N	2010-06-15 09:45:17.731	2011-02-27 12:58:36	\N	0.00	26469	\N	5
26491	13	Pedido recursos limitantes 2	\N	2010-09-08 00:00:00	2011-02-14 00:00:00	2010-09-01	0.00	\N	\N	\N
26528	5	Recurso limitante xenérica	\N	2010-08-20 00:00:00	2010-10-13 00:00:00	2010-10-21	0.00	26491	\N	3
59289	4	Subtarea 6.1	\N	2010-06-15 09:45:17.731	2010-12-12 07:52:38.40	\N	0.00	59291	\N	0
26519	10	Tarea 2.2 	\N	2010-11-24 16:43:43.20	2010-12-11 16:43:43.20	\N	0.00	26523	\N	0
26520	10	Tarea 2.1	\N	2010-12-11 16:43:43.20	2011-01-05 16:43:43.20	\N	0.00	26523	\N	1
26521	10	Tarea 2.3	\N	2010-10-21 02:01:21.60	2010-11-15 01:01:21.60	\N	0.00	26523	\N	2
26522	10	Tarea 2.4	\N	2010-08-29 03:03:16.305	2010-10-18 03:03:16.305	\N	0.00	26523	\N	3
26514	10	Tarea 1.2	\N	2010-08-25 00:00:00	2010-10-01 00:00:00	\N	0.00	26518	\N	0
26515	11	Tarea 1.1	\N	2010-10-01 00:00:00	2010-10-19 18:00:00	\N	0.00	26518	\N	1
26516	10	Tarea 1.3	\N	2010-09-05 14:08:17.391	2010-09-18 05:08:17.391	\N	0.00	26518	\N	2
26517	10	Tarea 1.4	\N	2010-09-18 05:08:17.391	2010-10-13 05:08:17.391	\N	0.00	26518	\N	3
26487	12	tarefa limitantes 3	\N	2010-08-04 00:00:00	2010-08-23 00:00:00	\N	0.00	26489	\N	0
26484	14	tarefa limitantes 1	\N	2010-07-19 00:00:00	2010-08-04 00:00:00	\N	0.00	26486	\N	0
9296	13	Desarrollo de un proyecto para el cliente.	\N	2010-06-14 12:59:30.412	2010-08-26 12:59:30.412	2010-07-09	0.21	\N	\N	\N
9295	13	Tarea 1.4	\N	2010-06-14 12:59:30.412	2010-08-26 12:59:30.412	2010-07-09	0.21	9296	\N	0
9292	12	Subtarefa 1.4.3	\N	2010-06-14 12:59:30.412	2010-07-10 12:59:30.412	2010-07-09	0.25	9295	\N	0
9293	12	Subtarefa 1.4.1	\N	2010-07-10 12:59:30.412	2010-08-14 12:59:30.412	\N	0.30	9295	\N	1
9294	12	Subtarefa 1.4.2	\N	2010-08-14 12:59:30.412	2010-08-26 12:59:30.412	\N	0.00	9295	\N	2
2129	16	tarefa limitantes 5	\N	2010-06-13 12:33:10.77	2010-08-06 12:33:10.77	\N	0.40	2127	\N	2
2122	20	tarefa limitantes 2	\N	2010-06-30 00:00:00	2010-07-16 00:00:00	\N	0.20	2123	\N	1
2121	20	tarefa limitantes 1	\N	2010-06-13 00:00:00	2010-06-30 00:00:00	\N	0.50	2123	\N	0
2123	23	container 1	\N	2010-06-13 12:33:10.77	2010-07-16 00:00:00	\N	0.35	2127	\N	0
26478	6	Tarea 2.4	\N	2010-11-09 00:00:00	2011-01-18 00:00:00	\N	0.00	26479	\N	3
57369	4	Tarefa 2	\N	2010-06-22 10:26:16.811	2010-07-17 10:26:16.811	\N	0.60	57375	\N	1
57373	4	Tarefa 4	\N	2010-06-22 10:26:16.811	2010-07-17 10:26:16.811	\N	0.00	57375	\N	3
57371	4	Tarefa 4.2	\N	2010-06-22 10:26:16.811	2010-07-11 04:26:16.811	\N	0.00	57373	\N	0
57372	4	Tarefa 4.1	\N	2010-06-22 10:26:16.811	2010-07-17 10:26:16.811	\N	0.00	57373	\N	1
57368	4	Tarefa 1	\N	2010-06-22 10:26:16.811	2010-07-04 22:26:16.811	\N	0.50	57375	\N	0
5466	37	Tarea 3	\N	2010-07-02 12:48:00	2010-09-02 12:48:00	\N	0.00	5467	\N	2
5464	28	Tarea 3.2	\N	2010-07-02 12:48:00	2010-07-29 12:48:00	\N	0.00	5466	\N	0
5456	30	Tarea 1.3	\N	2010-06-30 00:00:00	2010-07-19 00:00:00	\N	0.25	5458	\N	2
5457	28	Tarea 1.4	\N	2010-06-14 12:59:30.412	2010-07-09 12:59:30.412	\N	0.00	5458	\N	3
5463	36	Tarea2	\N	2010-07-09 12:59:30.412	2010-09-01 12:59:30.412	\N	0.00	5467	\N	1
5459	28	Tarea 2.2 	\N	2010-07-09 12:59:30.412	2010-07-28 12:59:30.412	\N	0.00	5463	\N	0
5460	28	Tarea 2.1	\N	2010-07-28 12:59:30.412	2010-09-01 12:59:30.412	\N	0.00	5463	\N	1
57374	4	Tarefa 5	\N	2010-06-22 10:26:16.811	2010-07-09 10:26:16.811	\N	0.00	57375	\N	4
57370	4	Tarefa 3	\N	2010-06-22 10:26:16.811	2010-07-04 22:26:16.811	\N	0.00	57375	\N	2
57375	4	Aplicacion Pedido 2 - Template	\N	2010-06-22 10:26:16.811	2010-07-17 10:26:16.811	2010-09-29	0.20	\N	\N	\N
5461	28	Tarea 2.3	\N	2010-07-09 12:59:30.412	2010-08-03 12:59:30.412	\N	0.00	5463	\N	2
5462	28	Tarea 2.4	\N	2010-07-09 12:59:30.412	2010-08-28 12:59:30.412	\N	0.00	5463	\N	3
57378	2	Tarefa 4 - Template	\N	2010-06-24 00:00:00	2010-07-19 00:00:00	2010-06-24	0.00	5467	\N	3
57376	2	Tarefa 4.2	\N	2010-06-24 00:00:00	2010-07-12 18:00:00	\N	0.00	57378	\N	0
57377	2	Tarefa 4.1	\N	2010-06-24 00:00:00	2010-07-19 00:00:00	\N	0.00	57378	\N	1
5467	37	Pedido 1	\N	2010-06-14 12:59:30.412	2010-09-02 12:48:00	2010-09-23	0.05	\N	\N	\N
58580	4	Tarefa 1	\N	2010-06-24 13:17:15.828	2010-07-07 01:17:15.828	\N	0.00	58587	\N	0
58582	4	Tarefa 3	\N	2010-06-24 13:17:15.828	2010-07-07 01:17:15.828	\N	0.00	58587	\N	2
58581	4	Tarefa 2	\N	2010-06-24 13:17:15.828	2010-07-19 13:17:15.828	\N	0.00	58587	\N	1
58586	4	Tarefa 5	\N	2010-06-24 13:17:15.828	2010-07-07 01:17:15.828	\N	0.00	58587	\N	4
58585	5	Tarefa 4	\N	2010-06-24 13:17:15.828	2010-07-19 13:17:15.828	\N	0.00	58587	\N	3
58583	4	Tarefa 4.2	\N	2010-06-24 13:17:15.828	2010-07-13 07:17:15.828	\N	0.00	58585	\N	0
58584	4	Tarefa 4.1	\N	2010-06-24 13:17:15.828	2010-07-19 13:17:15.828	\N	0.00	58585	\N	1
58587	5	Pedido 2 Template - Aplicacion 2	\N	2010-06-24 13:17:15.828	2010-07-19 13:17:15.828	2010-10-01	0.00	\N	\N	\N
26480	6	Tarea 3.2	\N	2010-10-13 00:00:00	2010-11-09 00:00:00	\N	0.00	26482	\N	0
26481	6	Tarea 3.1	\N	2010-11-09 00:00:00	2010-12-14 00:00:00	\N	0.00	26482	\N	1
59293	5	Subtarea 4.1	\N	2011-01-10 00:00:00	2011-01-26 00:00:00	\N	0.00	59294	\N	1
59292	5	Subtarea 4.2	\N	2010-12-22 00:00:00	2011-01-10 00:00:00	\N	0.00	59294	\N	0
26523	17	Tarea2	\N	2010-08-29 03:03:16.305	2011-01-05 16:43:43.20	\N	0.00	26527	\N	1
26485	12	tarefa limitantes 2	\N	2011-01-26 00:00:00	2011-02-14 00:00:00	\N	0.00	26486	\N	1
26469	20	Pedido 3	\N	2010-06-15 09:45:17.731	2011-02-27 12:58:36	2010-09-22	0.09	\N	\N	\N
26526	17	Tarea 3	\N	2010-09-04 18:14:23.937	2010-12-03 19:01:21.60	\N	0.00	26527	\N	2
26524	10	Tarea 3.2	\N	2010-11-15 01:01:21.60	2010-12-03 19:01:21.60	\N	0.00	26526	\N	0
26525	10	Tarea 3.1	\N	2010-09-04 18:14:23.937	2010-09-29 18:14:23.937	\N	0.00	26526	\N	1
247046	2	Tarefa 4	\N	2010-06-15 13:42:02.981	2010-07-10 13:42:02.981	\N	0.00	26527	\N	4
57379	8	Plantilla para grupo template 5	\N	2010-06-15 13:42:02.981	2010-06-28 01:42:02.981	2010-06-25	0.00	26527	\N	3
26518	17	Tarea1	\N	2010-08-25 00:00:00	2010-10-19 18:00:00	\N	0.00	26527	\N	0
26527	17	Pedido Escenario 2	\N	2010-06-15 13:42:02.981	2011-01-05 16:43:43.20	2010-09-23	0.00	\N	\N	\N
59295	6	Tarea 4	\N	2010-12-22 00:00:00	2011-01-26 00:00:00	\N	0.00	26483	\N	3
59294	6	Tarea 4 (copy)	\N	2010-12-22 00:00:00	2011-01-26 00:00:00	\N	0.00	59295	\N	0
26486	14	container 1	\N	2010-09-27 00:00:00	2011-02-14 00:00:00	\N	0.00	26491	\N	0
26489	14	container 2	\N	2010-09-08 00:00:00	2010-11-01 00:00:00	\N	0.00	26491	\N	1
22826	19	Tarefa 1	\N	2010-06-14 18:10:13.82	2010-07-02 18:10:13.82	\N	0.00	22833	\N	0
22827	19	Tarefa 2	\N	2010-07-02 18:10:13.82	2010-08-06 18:10:13.82	\N	0.00	22833	\N	1
26483	10	Pedido 5	\N	2010-09-08 00:00:00	2011-01-26 00:00:00	2010-12-31	0.00	\N	\N	\N
26474	10	Tarea1	\N	2010-09-08 00:00:00	2010-11-09 00:00:00	\N	0.00	26483	\N	0
26479	10	Tarea2	\N	2010-09-08 00:00:00	2011-01-18 00:00:00	\N	0.00	26483	\N	1
5455	30	Tarea 1.1	\N	2010-06-14 12:59:30.412	2010-08-03 12:59:30.412	\N	0.40	5458	\N	1
22828	19	Tarefa 3	\N	2010-06-14 18:10:13.82	2010-07-16 18:10:13.82	\N	0.15	22833	\N	2
26488	13	tarefa limitantes 4	\N	2010-08-23 00:00:00	2010-09-08 00:00:00	\N	0.00	26489	\N	1
22829	20	Tarefa 4.2	\N	2010-07-16 18:10:13.82	2010-09-28 18:10:13.82	\N	0.10	22831	\N	0
26490	16	tarefa limitantes 5	\N	2010-10-13 00:00:00	2010-10-27 00:00:00	\N	0.00	26491	\N	2
22831	26	Tarefa 4	\N	2010-06-14 18:10:13.82	2010-09-28 18:10:13.82	\N	0.44	22833	\N	3
22833	27	Pedido 2	\N	2010-06-14 18:10:13.82	2010-09-28 18:10:13.82	2010-09-22	0.17	\N	\N	\N
59287	4	Subtarea 6.1.1	\N	2010-06-15 09:45:17.731	2010-07-03 09:45:17.731	\N	0.00	59289	\N	0
59288	4	Subtarea 6.1.2	\N	2010-09-07 22:02:16.80	2010-12-12 07:52:38.40	\N	0.00	59289	\N	1
59290	4	Subtarea 6.2	\N	2011-02-05 01:05:50.40	2011-02-27 12:58:36	\N	0.00	59291	\N	1
26464	18	Recursos lim Tarefa 3	\N	2010-08-04 00:00:00	2010-08-20 00:00:00	\N	0.25	26469	\N	2
26463	16	Tarefa 2	\N	2010-07-15 00:00:00	2010-08-19 00:00:00	\N	0.30	26469	\N	1
26462	16	Tarefa 1	\N	2010-06-27 00:00:00	2010-07-15 00:00:00	\N	0.20	26469	\N	0
268559	1	container 2	\N	2010-06-13 12:33:10.77	2010-07-08 12:33:10.77	\N	0.00	2127	\N	1
26482	12	Tarea 3	\N	2010-10-13 00:00:00	2010-12-14 00:00:00	\N	0.00	26483	\N	2
2127	24	Pedido recursos limitantes	\N	2010-06-13 12:33:10.77	2010-08-06 12:33:10.77	\N	0.27	\N	\N	\N
26468	19	Tarefa 5	\N	2010-11-05 00:30:31.20	2010-11-24 00:30:31.20	\N	0.00	26469	\N	4
22830	19	Tarefa 4.1	\N	2010-06-14 18:10:13.82	2010-08-25 18:10:13.82	\N	0.70	22831	\N	1
22832	19	Tarefa 5	\N	2010-08-25 18:10:13.82	2010-09-07 06:10:13.82	\N	0.00	22833	\N	4
276134	1	Tarefa 6	\N	2010-06-14 18:10:13.82	2010-06-27 06:10:13.82	\N	0.00	22833	\N	5
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2123
2127
5458
5463
5466
5467
9295
9296
22831
22833
26467
26469
26474
26479
26482
26483
26486
26489
26491
26496
26501
26504
26505
26511
26513
26518
26523
26526
26527
57373
57375
57378
58585
58587
59289
59291
59294
59295
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
9295	2	7685
9296	2	7677
9292	3	7678
9293	3	7686
9294	3	7687
26493	11	43566
26494	11	43567
26506	1	43602
26507	1	43603
26508	1	43604
26509	1	43606
26510	1	43607
26511	1	43605
26512	1	43608
26513	1	43601
26486	4	31944
26489	4	31947
26491	4	31943
26484	7	31945
26485	7	31946
26487	7	31948
26488	7	31949
26490	7	31950
26528	1	43625
26495	11	43568
26523	8	43615
26501	9	43569
26497	11	43570
26498	11	43571
26499	11	43572
26500	11	43573
26504	9	43574
26527	8	43609
26505	9	43563
26518	8	43610
26496	9	43564
26483	3	26047
26474	3	26048
26469	5	25997
26462	7	25998
26463	7	25999
26467	5	26001
26465	7	26002
26466	7	26003
26468	7	26004
59291	3	58994
59289	3	58995
59287	3	58996
59288	3	58997
59290	3	58998
26464	7	26000
26479	3	26053
26482	3	31916
26470	5	26049
26471	5	26050
26472	5	26051
26473	5	26052
26475	5	26054
26476	5	26055
26477	5	26056
26478	5	26057
26480	5	31917
26481	5	31918
59292	1	59011
59293	1	59012
59294	1	59010
59295	1	59009
26492	11	43565
57370	4	56890
57373	4	56891
57371	4	56892
57372	4	56893
57374	4	56894
57369	4	56889
5467	10	5053
5458	10	5080
5454	18	5081
5455	18	5082
5456	18	5083
5457	18	5084
5463	10	5085
5459	18	5086
5460	18	5087
5461	18	5088
57375	4	56887
57368	4	56888
5462	18	5089
57378	2	56901
57376	2	56902
57377	2	56903
5466	10	5090
5464	18	5091
5465	18	5092
58587	4	58099
58581	5	58101
58582	5	58102
58585	4	58103
58583	5	58104
58584	5	58105
58586	5	58106
58580	5	58100
247046	1	246764
26526	8	43620
26502	11	43575
26503	11	43576
26514	15	43611
26515	15	43612
26516	15	43613
26517	15	43614
26519	15	43616
26520	15	43617
26521	15	43618
26522	15	43619
26524	15	43621
26525	15	43622
57379	13	56906
2123	6	1633
22831	7	22443
2127	6	1632
2121	11	1634
2122	11	1635
2129	5	1644
268559	1	1636
22833	7	22439
22826	13	22440
22827	13	22441
22828	13	22442
22829	13	22444
22830	13	22445
22832	13	22446
276134	1	275658
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
13938	1	EXTRA	f970c975-7dec-426a-8fb6-a4a16c933b7e	12.00	t	t
13939	1	NORMAL	cae21596-0a34-48cd-9631-8c518c8e771d	7.00	t	t
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
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
21817	Desc.
240484	O grupo de carpinteiros co que se quere traballar é de 10.
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, generatecode, work_report_type_id, resource_id, order_element_id) FROM stdin;
14039	1	54569b70-811f-4acb-b885-a088fa0fa1ee	\N	t	13837	\N	\N
58681	1	35214135-bb5f-4bce-9d1c-d7a0fb93d9d0	\N	t	13837	\N	\N
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
14140	1	08f228ff-3818-477c-aa17-d46ec755ca03	8	2010-06-15 00:00:00	\N	\N	14039	4344	4980	13939
14141	1	4b970514-ee0c-4f69-a077-864c837cfd29	8	2010-06-14 00:00:00	\N	\N	14039	4344	4982	13939
58782	1	dc2a5c9f-f90e-4c98-9856-6d5c6f928b15	10	2010-06-29 00:00:00	\N	\N	58681	1214	7584	13939
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
13837	1	Tipo de parte de trabajo	01	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1214	Javier	Moran	78736622D
4344	Carlos	Villa Soldador1	11111111A
4348	Simón	Marchena Soldador2	22222222A
4350	Santiago	Alonso Soldador3	11111111W
4352	Tomás	Del Oro Pintor1	11111111Q
4354	Santiago	Lajos Pintor2	11111111R
4356	Rodrigo	Romero Pintor3	11111111T
4358	Laura	Gómez PintorSoldador	11111111T
21817	Soldadores	---	[Virtual]
240484	Carpinteiros	---	[Virtual]
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

