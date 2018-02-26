--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
    duration integer,
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
    notassignable boolean,
    duration integer
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
    expandresourceloadviewcharts boolean NOT NULL,
    montecarlomethodtabvisible boolean
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
    predefinedcriterioninternalname character varying(255),
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
    predefinedtypeinternalname character varying(255),
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
    duration integer NOT NULL,
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
-- Name: effortperday; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE effortperday (
    base_calendar_id bigint NOT NULL,
    effort integer,
    day_id integer NOT NULL
);


ALTER TABLE public.effortperday OWNER TO naval;

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
    resource_allocation_id bigint NOT NULL,
    resourcetype integer
);


ALTER TABLE public.generic_resource_allocation OWNER TO naval;

--
-- Name: genericdayassignmentscontainer; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE genericdayassignmentscontainer (
    id bigint NOT NULL,
    version bigint NOT NULL,
    resource_allocation_id bigint,
    scenario bigint,
    enddate date,
    durationinlastday integer,
    startdate date,
    durationstartinfirstday integer
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
    sum_charged_hours_id bigint,
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
    scenario bigint,
    enddate date,
    durationinlastday integer,
    startdate date,
    durationstartinfirstday integer
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
-- Name: sumchargedhours; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE sumchargedhours (
    id bigint NOT NULL,
    version bigint NOT NULL,
    directchargedhours integer,
    indirectchargedhours integer
);


ALTER TABLE public.sumchargedhours OWNER TO naval;

--
-- Name: task; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE task (
    task_element_id bigint NOT NULL,
    calculatedvalue integer,
    startconstrainttype integer,
    constraintdate date,
    subcontrated_task_data_id bigint,
    priority integer,
    workable_days integer
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
    startdate date NOT NULL,
    startdayduration integer,
    enddate date NOT NULL,
    enddayduration integer,
    deadline date,
    advance_percentage numeric(19,4),
    sumofhoursallocated integer,
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
    task_element_id bigint NOT NULL,
    startconstrainttype integer,
    constraintdate bytea
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
10506	8	f	2
6985	16	f	2
6984	16	t	1
6087	26	t	1
6086	26	f	2
31108	2	t	2
31109	2	f	2
31110	2	t	1
10510	8	f	2
6972	20	f	2
6973	20	t	1
6085	46	t	2
6969	41	t	2
6982	32	t	2
6971	38	t	2
6983	31	t	2
6986	28	t	2
6970	41	t	2
1723	34	f	2
1755	34	f	2
1724	34	t	1
1756	34	t	1
1739	34	f	2
1740	34	t	1
1760	34	t	1
1759	34	f	2
1768	34	f	2
1767	34	t	1
1786	31	f	2
1785	31	t	1
1778	31	f	2
1793	31	t	1
1794	31	f	2
1777	31	t	1
1795	27	t	2
1796	27	t	2
1797	27	t	2
22523	6	t	2
22528	4	t	2
10514	8	f	2
6980	20	f	2
6981	20	t	1
15052	2	f	2
15053	2	t	1
22529	4	t	2
22530	3	t	1
22531	3	f	2
22525	4	f	2
22524	4	t	1
1771	48	t	2
1772	48	t	2
1773	48	t	2
1774	48	t	2
1775	48	t	2
1776	48	t	2
3775	22	f	2
1799	22	f	2
2942	22	f	2
3013	22	t	1
1798	22	t	1
3014	22	f	2
2941	22	t	1
3774	22	t	1
4453	22	f	2
2982	22	f	2
2981	22	t	1
4452	22	t	1
1800	27	t	2
1801	27	t	2
1802	27	t	2
1803	27	t	2
1804	27	t	2
1805	27	t	2
2943	22	t	1
4455	22	f	2
3776	22	t	1
1806	22	t	1
2984	22	f	2
3015	22	t	1
2944	22	f	2
2983	22	t	1
3777	22	f	2
1807	22	f	2
4454	22	t	1
3016	22	f	2
1808	27	t	2
1809	27	t	2
3779	22	f	2
15051	7	t	2
1717	51	t	2
1718	51	t	2
1719	51	t	2
1720	51	t	2
1721	51	t	2
1722	51	t	2
1757	49	t	2
1758	49	t	2
1761	49	t	2
1762	49	t	2
1763	49	t	2
1764	49	t	2
1765	49	t	2
1766	49	t	2
4456	22	t	1
3017	22	t	1
4457	22	f	2
2985	22	t	1
3018	22	f	2
1810	22	t	1
2945	22	t	1
2986	22	f	2
2946	22	f	2
3778	22	t	1
1811	22	f	2
2947	26	t	2
2948	37	t	2
2949	37	t	2
2950	37	t	2
2951	37	t	2
2954	37	t	2
2952	37	t	2
2953	37	t	2
2955	22	f	2
2956	22	t	1
3781	22	t	1
4459	22	t	1
2987	22	f	2
3019	22	f	2
3020	22	t	1
4458	22	f	2
3780	22	f	2
2988	22	t	1
3021	24	t	2
3022	35	t	2
3023	35	t	2
3783	22	t	1
3782	22	f	2
4460	22	f	2
3024	22	f	2
3025	22	t	1
4461	22	t	1
3026	35	t	2
3027	24	t	2
3028	35	t	2
3785	22	f	2
3784	22	t	1
3737	22	f	2
3029	22	t	1
4463	22	f	2
4462	22	t	1
3786	34	t	2
3787	23	t	2
3788	34	t	2
3789	34	t	2
3790	34	t	2
4465	22	f	2
4464	22	t	1
3791	22	t	1
3792	22	f	2
6080	9	t	2
6060	10	t	2
6061	10	t	2
6062	9	t	1
6063	9	f	2
6081	9	t	1
6082	9	f	2
6064	19	t	2
6065	19	t	2
6066	9	f	2
6067	9	t	1
6084	9	t	1
6083	9	f	2
1741	34	t	1
1726	34	f	2
1725	34	t	1
1742	34	f	2
1769	34	t	1
1770	34	f	2
3793	34	t	2
3794	34	t	2
3795	23	t	2
4467	22	f	2
4466	22	t	1
3796	22	t	1
3797	22	f	2
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
8101	1	2	8010	t	100.00
8102	1	2	8011	t	100.00
8103	1	2	8012	t	100.00
8104	1	2	8014	t	100.00
8105	1	2	8015	t	100.00
8106	1	2	8017	t	100.00
8107	1	2	8018	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
12536	7	2010-11-05	40.00	6085	\N
10715	15	2010-10-27	20.00	6085	\N
25663	0	2010-11-17	20.00	6064	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
1	4	children	100.0000	f	0.0100	t	t	f
2	3	percentage	100.0000	f	0.0100	t	t	f
3	2	units	2147483647.0000	f	1.0000	t	f	f
4	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
13235	204
13236	202
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
303	1	b6f36fe1-db52-4fe0-b91c-6376a2539e5c	Default
5151	1	429b93e2-4f29-4e9b-87e9-13f700a85934	\N
12827	1	acdc5746-9055-4104-b110-1f5597b7d0f2	\N
12828	1	f8eafb4c-fd6e-4cf2-9fca-4b7f5890aafb	\N
7374	7	44fdb486-17ab-4c5f-936e-3c69d94b27ff	\N
7373	7	0cfb9bae-eb51-4fc3-82d2-2256ba51a54f	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
5353	1	2010-10-25	\N	5151	0
13029	1	2010-11-09	\N	12827	0
13030	1	2010-11-09	\N	12828	0
7576	7	2010-10-26	\N	7374	0
7575	7	2010-10-26	\N	7373	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
404	1	0acef048-ad8f-4658-b8cf-1a85acd3a59b	\N	\N	303	0
5252	1	19fecfb6-91d6-458e-82ac-70373b7d8a78	303	\N	5151	0
12928	1	fa7f2e34-dd5a-4d49-afa3-6182f764a534	303	\N	12827	0
12929	1	afc400c1-e5b7-45d9-9759-b87160b97650	303	\N	12828	0
7475	7	cfd38c58-c912-4d12-983c-c078fd8e4f4a	303	\N	7374	0
7474	7	9df9f927-4cc6-4c66-b462-3f3599f12be2	303	\N	7373	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, duration, calendar_exception_id, base_calendar_id) FROM stdin;
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable, duration) FROM stdin;
1010	6	HOLIDAY	HOLIDAY	red	t	0
1011	5	SICK_LEAVE	SICK_LEAVE	red	t	0
1012	4	LEAVE	LEAVE	red	t	0
1013	3	STRIKE	STRIKE	red	t	0
1014	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t	0
1015	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f	0
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts, montecarlomethodtabvisible) FROM stdin;
505	11	303	COMPANY_CODE	t	t	t	t	t	t	t	t	f	t	t
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, taskenddate, consolidation_id, advance_measurement_id) FROM stdin;
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, code, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, predefinedcriterioninternalname, active, id_criterion_type, parent) FROM stdin;
202	19	94939f8e-5779-496f-9839-014b273c495d	medicalLeave	medicalLeave	t	32768	\N
203	17	737c6f99-6662-44ff-a884-973e701e65c6	paternityLeave	paternityLeave	t	32768	\N
204	5	d1f47434-d243-4bc2-8627-1f0eef07c0d2	hiredResourceWorkingRelationship	hiredResourceWorkingRelationship	t	32773	\N
205	3	0e144748-e7ac-49f8-a10f-4c660fcfcaf7	firedResourceWorkingRelationship	firedResourceWorkingRelationship	t	32773	\N
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
13130	1	1e9a4fcf-52ab-4a38-98e2-eeeb8473468b	2010-11-09 10:39:47.232	\N	f	204	12727
13131	1	faef3f0a-e73e-4503-8811-8994d04079c7	2010-11-09 10:40:25.896	\N	f	202	12729
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, predefinedtypeinternalname, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
32768	20	bf03bd11-c36c-46e5-a56a-52f54bc9d4cb	LEAVE	LEAVE	Leave	f	f	t	f	0
32769	15	24902589-c7fd-423b-8aa0-d6741f60a931	MACHINE_LOCATION_GROUP	MACHINE_LOCATION_GROUP	Location where there are machines	t	f	t	f	1
32770	13	018b78a6-b114-4c17-951c-755b58eee860	CATEGORY	CATEGORY	Professional category	t	t	t	f	0
32771	11	065762eb-b55f-4b54-89ae-49bc142e97fe	TRAINING	TRAINING	Training courses and labor training	t	t	t	f	0
32772	9	f437e86b-81d4-4bc8-865c-82844ff33d4e	JOB	JOB	Job	t	t	t	f	0
32773	7	44cf2611-28d8-445e-91c1-9d8304a347ca	WORK_RELATIONSHIP	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	0
32774	1	7a9cea0f-733d-47f5-92f0-27bb17f2bd88	LOCATION_GROUP	LOCATION_GROUP	Location where the workers work	t	f	t	f	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, duration, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
19440	GENERIC_DAY	3	29808	f	2010-12-01	7273	\N	10909	\N
19441	GENERIC_DAY	3	0	f	2010-12-04	7273	\N	10909	\N
19428	GENERIC_DAY	3	0	f	2010-11-07	7273	\N	10909	\N
19408	GENERIC_DAY	3	0	f	2010-11-21	7273	\N	10909	\N
19417	GENERIC_DAY	3	0	f	2010-11-13	7273	\N	10909	\N
19430	GENERIC_DAY	3	29808	f	2010-11-30	7275	\N	10909	\N
19421	GENERIC_DAY	3	0	f	2010-11-13	7275	\N	10909	\N
19425	GENERIC_DAY	3	15408	f	2010-11-18	7275	\N	10909	\N
19393	GENERIC_DAY	3	0	f	2010-12-05	7275	\N	10909	\N
19413	GENERIC_DAY	3	29808	f	2010-12-02	7273	\N	10909	\N
19392	GENERIC_DAY	3	29808	f	2010-12-03	7273	\N	10909	\N
19416	GENERIC_DAY	3	29808	f	2010-11-04	7275	\N	10909	\N
19412	GENERIC_DAY	3	37008	f	2010-11-11	7273	\N	10909	\N
19398	GENERIC_DAY	3	29808	f	2010-12-06	7275	\N	10909	\N
19437	GENERIC_DAY	3	44208	f	2010-11-12	7273	\N	10909	\N
19431	GENERIC_DAY	3	15408	f	2010-11-17	7275	\N	10909	\N
19399	GENERIC_DAY	3	29808	f	2010-11-03	7275	\N	10909	\N
19402	GENERIC_DAY	3	15408	f	2010-11-15	7275	\N	10909	\N
19436	GENERIC_DAY	3	29808	f	2010-12-01	7275	\N	10909	\N
19435	GENERIC_DAY	3	29808	f	2010-11-09	7275	\N	10909	\N
19434	GENERIC_DAY	3	44208	f	2010-11-15	7273	\N	10909	\N
19439	GENERIC_DAY	3	0	f	2010-11-21	7275	\N	10909	\N
19423	GENERIC_DAY	3	29808	f	2010-11-26	7275	\N	10909	\N
19407	GENERIC_DAY	3	0	f	2010-11-06	7275	\N	10909	\N
19427	GENERIC_DAY	3	29808	f	2010-11-23	7275	\N	10909	\N
19397	GENERIC_DAY	3	44208	f	2010-11-16	7273	\N	10909	\N
19420	GENERIC_DAY	3	0	f	2010-12-04	7275	\N	10909	\N
19514	GENERIC_DAY	3	28368	f	2010-12-30	7275	\N	10911	\N
19491	GENERIC_DAY	3	28368	f	2011-01-03	7273	\N	10911	\N
19524	GENERIC_DAY	3	28368	f	2011-01-14	7275	\N	10911	\N
19518	GENERIC_DAY	3	17865	f	2011-01-17	7275	\N	10911	\N
19525	GENERIC_DAY	3	28368	f	2010-12-23	7273	\N	10911	\N
19522	GENERIC_DAY	3	28368	f	2011-01-13	7275	\N	10911	\N
19500	GENERIC_DAY	3	28368	f	2011-01-13	7273	\N	10911	\N
19479	GENERIC_DAY	3	0	f	2010-12-12	7273	\N	10911	\N
19489	GENERIC_DAY	3	28368	f	2011-01-10	7275	\N	10911	\N
11426	SPECIFIC_DAY	13	28800	f	2010-11-08	7273	7777	\N	\N
11411	SPECIFIC_DAY	13	28800	f	2010-11-02	7273	7777	\N	\N
11412	SPECIFIC_DAY	13	28800	f	2010-11-05	7273	7777	\N	\N
11415	SPECIFIC_DAY	13	14400	f	2010-11-11	7273	7777	\N	\N
11413	SPECIFIC_DAY	13	0	f	2010-11-07	7273	7777	\N	\N
11416	SPECIFIC_DAY	13	0	f	2010-10-31	7273	7777	\N	\N
11419	SPECIFIC_DAY	13	28800	f	2010-10-28	7273	7777	\N	\N
11417	SPECIFIC_DAY	13	28800	f	2010-11-04	7273	7777	\N	\N
11425	SPECIFIC_DAY	13	28800	f	2010-10-26	7273	7777	\N	\N
11427	SPECIFIC_DAY	13	28800	f	2010-11-10	7273	7777	\N	\N
11423	SPECIFIC_DAY	13	28800	f	2010-10-29	7273	7777	\N	\N
11420	SPECIFIC_DAY	13	0	f	2010-10-25	7273	7777	\N	\N
11422	SPECIFIC_DAY	13	0	f	2010-10-30	7273	7777	\N	\N
11418	SPECIFIC_DAY	13	28800	f	2010-11-01	7273	7777	\N	\N
11421	SPECIFIC_DAY	13	28800	f	2010-11-09	7273	7777	\N	\N
11410	SPECIFIC_DAY	13	0	f	2010-11-06	7273	7777	\N	\N
25432	SPECIFIC_DAY	0	14400	f	2010-11-11	12727	24443	\N	\N
25433	SPECIFIC_DAY	0	21600	f	2010-11-12	12727	24443	\N	\N
25434	GENERIC_DAY	0	28800	f	2010-11-18	12727	\N	13336	\N
25435	GENERIC_DAY	0	0	f	2010-11-20	12727	\N	13336	\N
25436	GENERIC_DAY	0	7200	f	2010-11-24	12727	\N	13336	\N
25437	GENERIC_DAY	0	28800	f	2010-11-17	12727	\N	13336	\N
25438	GENERIC_DAY	0	0	f	2010-11-21	12727	\N	13336	\N
25439	GENERIC_DAY	0	28800	f	2010-11-22	12727	\N	13336	\N
25440	GENERIC_DAY	0	28800	f	2010-11-23	12727	\N	13336	\N
11424	SPECIFIC_DAY	13	28800	f	2010-11-03	7273	7777	\N	\N
11414	SPECIFIC_DAY	13	28800	f	2010-10-27	7273	7777	\N	\N
24554	SPECIFIC_DAY	3	0	f	2010-10-25	7273	24445	\N	\N
24555	SPECIFIC_DAY	3	18000	f	2010-10-26	7273	24445	\N	\N
25441	GENERIC_DAY	0	28800	f	2010-11-19	12727	\N	13336	\N
25442	GENERIC_DAY	0	28800	f	2010-11-16	12727	\N	13336	\N
25443	GENERIC_DAY	0	28800	f	2010-12-01	12729	\N	13337	\N
25444	GENERIC_DAY	0	28800	f	2010-12-08	12729	\N	13337	\N
25445	GENERIC_DAY	0	28800	f	2010-12-02	12729	\N	13337	\N
25446	GENERIC_DAY	0	28800	f	2010-12-06	12729	\N	13337	\N
25447	GENERIC_DAY	0	28800	f	2010-12-07	12729	\N	13337	\N
25448	GENERIC_DAY	0	28800	f	2010-11-30	12729	\N	13337	\N
25449	GENERIC_DAY	0	21600	f	2010-12-10	12729	\N	13337	\N
25450	GENERIC_DAY	0	28800	f	2010-12-09	12729	\N	13337	\N
25451	GENERIC_DAY	0	0	f	2010-12-05	12729	\N	13337	\N
25452	GENERIC_DAY	0	21600	f	2010-11-24	12729	\N	13337	\N
25453	GENERIC_DAY	0	0	f	2010-12-04	12729	\N	13337	\N
25454	GENERIC_DAY	0	28800	f	2010-11-26	12729	\N	13337	\N
26163	GENERIC_DAY	0	0	f	2010-11-25	7275	\N	22927	\N
26164	GENERIC_DAY	0	0	f	2010-11-26	12729	\N	22927	\N
26165	GENERIC_DAY	0	28800	f	2010-12-06	12727	\N	22927	\N
26166	GENERIC_DAY	0	0	f	2010-11-30	12729	\N	22927	\N
26167	GENERIC_DAY	0	0	f	2010-11-23	7275	\N	22927	\N
26168	GENERIC_DAY	0	28512	f	2010-12-08	12727	\N	22927	\N
26169	GENERIC_DAY	0	0	f	2010-11-27	7275	\N	22927	\N
26170	GENERIC_DAY	0	0	f	2010-12-08	12729	\N	22927	\N
26171	GENERIC_DAY	0	0	f	2010-11-24	7275	\N	22927	\N
26172	GENERIC_DAY	0	7200	f	2010-11-24	12729	\N	22927	\N
26173	GENERIC_DAY	0	0	f	2010-12-01	7275	\N	22927	\N
26174	GENERIC_DAY	0	0	f	2010-11-26	7275	\N	22927	\N
26175	GENERIC_DAY	0	0	f	2010-12-04	7275	\N	22927	\N
26176	GENERIC_DAY	0	0	f	2010-12-03	7273	\N	22927	\N
26177	GENERIC_DAY	0	0	f	2010-12-05	12729	\N	22927	\N
26178	GENERIC_DAY	0	28800	f	2010-11-29	12727	\N	22927	\N
26179	GENERIC_DAY	0	28800	f	2010-12-01	12727	\N	22927	\N
26180	GENERIC_DAY	0	0	f	2010-11-30	7273	\N	22927	\N
26181	GENERIC_DAY	0	0	f	2010-12-03	7275	\N	22927	\N
26182	GENERIC_DAY	0	0	f	2010-12-04	12727	\N	22927	\N
26183	GENERIC_DAY	0	430	f	2010-12-07	7275	\N	22927	\N
26184	GENERIC_DAY	0	0	f	2010-11-28	12729	\N	22927	\N
26185	GENERIC_DAY	0	14400	f	2010-12-09	12727	\N	22927	\N
25455	GENERIC_DAY	0	28800	f	2010-11-25	12729	\N	13337	\N
25456	GENERIC_DAY	0	28800	f	2010-12-03	12729	\N	13337	\N
25457	GENERIC_DAY	0	0	f	2010-11-28	12729	\N	13337	\N
25458	GENERIC_DAY	0	0	f	2010-11-27	12729	\N	13337	\N
25459	GENERIC_DAY	0	28800	f	2010-11-29	12729	\N	13337	\N
26186	GENERIC_DAY	0	0	f	2010-11-28	7275	\N	22927	\N
26187	GENERIC_DAY	0	0	f	2010-12-09	7273	\N	22927	\N
26188	GENERIC_DAY	0	28800	f	2010-11-23	12729	\N	22927	\N
26189	GENERIC_DAY	0	0	f	2010-11-29	7275	\N	22927	\N
25460	GENERIC_DAY	0	0	f	2010-11-13	7275	\N	12237	\N
25461	GENERIC_DAY	0	0	f	2010-11-13	7273	\N	12237	\N
25462	GENERIC_DAY	0	14400	f	2010-11-15	7275	\N	12237	\N
25463	GENERIC_DAY	0	3600	f	2010-11-12	7275	\N	12237	\N
25464	GENERIC_DAY	0	0	f	2010-11-14	7273	\N	12237	\N
25465	GENERIC_DAY	0	0	f	2010-11-14	7275	\N	12237	\N
25466	GENERIC_DAY	0	14400	f	2010-11-15	7273	\N	12237	\N
25467	GENERIC_DAY	0	3600	f	2010-11-12	7273	\N	12237	\N
26190	GENERIC_DAY	0	28800	f	2010-11-30	12727	\N	22927	\N
26191	GENERIC_DAY	0	28800	f	2010-11-26	12727	\N	22927	\N
26192	GENERIC_DAY	0	0	f	2010-11-28	7273	\N	22927	\N
26193	GENERIC_DAY	0	0	f	2010-12-02	12729	\N	22927	\N
19496	GENERIC_DAY	3	28368	f	2010-12-24	7273	\N	10911	\N
19502	GENERIC_DAY	3	28368	f	2010-12-13	7275	\N	10911	\N
19477	GENERIC_DAY	3	28368	f	2011-01-12	7273	\N	10911	\N
19515	GENERIC_DAY	3	28368	f	2010-12-08	7273	\N	10911	\N
12402	GENERIC_DAY	7	28800	f	2010-10-28	7275	\N	12236	\N
12403	GENERIC_DAY	7	7200	f	2010-10-29	7275	\N	12236	\N
12404	GENERIC_DAY	7	0	f	2010-10-28	7273	\N	12236	\N
12405	GENERIC_DAY	7	0	f	2010-10-29	7273	\N	12236	\N
19508	GENERIC_DAY	3	28368	f	2011-01-07	7275	\N	10911	\N
19486	GENERIC_DAY	3	0	f	2010-12-26	7273	\N	10911	\N
19487	GENERIC_DAY	3	0	f	2010-12-19	7275	\N	10911	\N
19517	GENERIC_DAY	3	0	f	2011-01-15	7273	\N	10911	\N
26194	GENERIC_DAY	0	0	f	2010-11-25	7273	\N	22927	\N
26195	GENERIC_DAY	0	0	f	2010-12-05	7275	\N	22927	\N
26196	GENERIC_DAY	0	0	f	2010-12-06	7273	\N	22927	\N
26197	GENERIC_DAY	0	144	f	2010-12-08	7273	\N	22927	\N
26198	GENERIC_DAY	0	0	f	2010-11-30	7275	\N	22927	\N
26199	GENERIC_DAY	0	28800	f	2010-12-03	12727	\N	22927	\N
26200	GENERIC_DAY	0	28800	f	2010-12-02	12727	\N	22927	\N
26201	GENERIC_DAY	0	21600	f	2010-11-24	12727	\N	22927	\N
26202	GENERIC_DAY	0	0	f	2010-12-06	7275	\N	22927	\N
26203	GENERIC_DAY	0	0	f	2010-11-23	12727	\N	22927	\N
26204	GENERIC_DAY	0	0	f	2010-12-02	7273	\N	22927	\N
26205	GENERIC_DAY	0	0	f	2010-12-07	12729	\N	22927	\N
26206	GENERIC_DAY	0	0	f	2010-12-05	7273	\N	22927	\N
26207	GENERIC_DAY	0	428	f	2010-12-07	7273	\N	22927	\N
26208	GENERIC_DAY	0	0	f	2010-12-05	12727	\N	22927	\N
26209	GENERIC_DAY	0	0	f	2010-11-29	12729	\N	22927	\N
26210	GENERIC_DAY	0	144	f	2010-12-08	7275	\N	22927	\N
26211	GENERIC_DAY	0	0	f	2010-11-27	7273	\N	22927	\N
26212	GENERIC_DAY	0	0	f	2010-11-23	7273	\N	22927	\N
26213	GENERIC_DAY	0	0	f	2010-12-09	7275	\N	22927	\N
26214	GENERIC_DAY	0	0	f	2010-11-28	12727	\N	22927	\N
26215	GENERIC_DAY	0	0	f	2010-12-04	7273	\N	22927	\N
26216	GENERIC_DAY	0	0	f	2010-12-01	12729	\N	22927	\N
26217	GENERIC_DAY	0	27942	f	2010-12-07	12727	\N	22927	\N
26218	GENERIC_DAY	0	0	f	2010-11-24	7273	\N	22927	\N
26219	GENERIC_DAY	0	0	f	2010-12-09	12729	\N	22927	\N
26220	GENERIC_DAY	0	0	f	2010-11-26	7273	\N	22927	\N
26221	GENERIC_DAY	0	0	f	2010-12-04	12729	\N	22927	\N
26222	GENERIC_DAY	0	0	f	2010-11-27	12727	\N	22927	\N
26223	GENERIC_DAY	0	28800	f	2010-11-25	12727	\N	22927	\N
26224	GENERIC_DAY	0	0	f	2010-11-29	7273	\N	22927	\N
26225	GENERIC_DAY	0	0	f	2010-11-27	12729	\N	22927	\N
26226	GENERIC_DAY	0	0	f	2010-12-01	7273	\N	22927	\N
26227	GENERIC_DAY	0	0	f	2010-12-06	12729	\N	22927	\N
26228	GENERIC_DAY	0	0	f	2010-11-25	12729	\N	22927	\N
26229	GENERIC_DAY	0	0	f	2010-12-02	7275	\N	22927	\N
26230	GENERIC_DAY	0	0	f	2010-12-03	12729	\N	22927	\N
14006	SPECIFIC_DAY	6	14400	f	2010-11-18	7275	11515	\N	\N
13826	SPECIFIC_DAY	6	14400	f	2010-11-03	7275	11515	\N	\N
13829	SPECIFIC_DAY	6	14400	f	2010-11-19	7275	11515	\N	\N
13831	SPECIFIC_DAY	6	0	f	2010-11-06	7275	11515	\N	\N
14013	SPECIFIC_DAY	6	14400	f	2010-11-03	7275	11515	\N	\N
13828	SPECIFIC_DAY	6	14400	f	2010-11-16	7275	11515	\N	\N
14012	SPECIFIC_DAY	6	14400	f	2010-11-08	7275	11515	\N	\N
13819	SPECIFIC_DAY	6	14400	f	2010-11-05	7275	11515	\N	\N
14003	SPECIFIC_DAY	6	0	f	2010-11-14	7275	11515	\N	\N
14017	SPECIFIC_DAY	6	14400	f	2010-11-05	7275	11515	\N	\N
14014	SPECIFIC_DAY	6	14400	f	2010-11-12	7275	11515	\N	\N
14007	SPECIFIC_DAY	6	14400	f	2010-11-16	7275	11515	\N	\N
13822	SPECIFIC_DAY	6	14400	f	2010-11-11	7275	11515	\N	\N
13825	SPECIFIC_DAY	6	0	f	2010-11-14	7275	11515	\N	\N
14002	SPECIFIC_DAY	6	14400	f	2010-11-09	7275	11515	\N	\N
13823	SPECIFIC_DAY	6	14400	f	2010-11-18	7275	11515	\N	\N
13832	SPECIFIC_DAY	6	0	f	2010-11-07	7275	11515	\N	\N
16468	GENERIC_DAY	4	25200	f	2010-11-02	7273	\N	16363	\N
16469	GENERIC_DAY	4	0	f	2010-11-01	7275	\N	16363	\N
16470	GENERIC_DAY	4	28800	f	2010-11-01	7273	\N	16363	\N
16467	GENERIC_DAY	4	0	f	2010-11-02	7275	\N	16363	\N
14009	SPECIFIC_DAY	6	0	f	2010-11-13	7275	11515	\N	\N
13817	SPECIFIC_DAY	6	0	f	2010-11-13	7275	11515	\N	\N
14016	SPECIFIC_DAY	6	14400	f	2010-11-15	7275	11515	\N	\N
14011	SPECIFIC_DAY	6	10800	f	2010-11-02	7275	11515	\N	\N
14019	SPECIFIC_DAY	6	0	f	2010-11-07	7275	11515	\N	\N
13821	SPECIFIC_DAY	6	14400	f	2010-11-12	7275	11515	\N	\N
13824	SPECIFIC_DAY	6	14400	f	2010-11-17	7275	11515	\N	\N
14004	SPECIFIC_DAY	6	14400	f	2010-11-04	7275	11515	\N	\N
14015	SPECIFIC_DAY	6	0	f	2010-11-06	7275	11515	\N	\N
14005	SPECIFIC_DAY	6	14400	f	2010-11-19	7275	11515	\N	\N
13818	SPECIFIC_DAY	6	14400	f	2010-11-15	7275	11515	\N	\N
13833	SPECIFIC_DAY	6	14400	f	2010-11-10	7275	11515	\N	\N
13830	SPECIFIC_DAY	6	14400	f	2010-11-09	7275	11515	\N	\N
13820	SPECIFIC_DAY	6	14400	f	2010-11-04	7275	11515	\N	\N
14008	SPECIFIC_DAY	6	14400	f	2010-11-17	7275	11515	\N	\N
13816	SPECIFIC_DAY	6	10800	f	2010-11-02	7275	11515	\N	\N
13827	SPECIFIC_DAY	6	14400	f	2010-11-08	7275	11515	\N	\N
14010	SPECIFIC_DAY	6	14400	f	2010-11-11	7275	11515	\N	\N
14018	SPECIFIC_DAY	6	14400	f	2010-11-10	7275	11515	\N	\N
19274	GENERIC_DAY	3	15408	f	2010-11-19	7275	\N	10909	\N
19280	GENERIC_DAY	3	0	f	2010-11-27	7273	\N	10909	\N
19284	GENERIC_DAY	3	29808	f	2010-11-25	7273	\N	10909	\N
19286	GENERIC_DAY	3	0	f	2010-12-05	7273	\N	10909	\N
19282	GENERIC_DAY	3	44208	f	2010-11-17	7273	\N	10909	\N
19273	GENERIC_DAY	3	0	f	2010-11-20	7275	\N	10909	\N
19281	GENERIC_DAY	3	7452	f	2010-11-02	7275	\N	10909	\N
19271	GENERIC_DAY	3	44208	f	2010-11-19	7273	\N	10909	\N
19278	GENERIC_DAY	3	22608	f	2010-11-11	7275	\N	10909	\N
19276	GENERIC_DAY	3	15408	f	2010-11-16	7275	\N	10909	\N
19270	GENERIC_DAY	3	29808	f	2010-11-03	7273	\N	10909	\N
19279	GENERIC_DAY	3	0	f	2010-11-20	7273	\N	10909	\N
19277	GENERIC_DAY	3	0	f	2010-11-06	7273	\N	10909	\N
19272	GENERIC_DAY	3	29808	f	2010-11-30	7273	\N	10909	\N
19285	GENERIC_DAY	3	29808	f	2010-11-04	7273	\N	10909	\N
19269	GENERIC_DAY	3	29808	f	2010-11-29	7275	\N	10909	\N
19275	GENERIC_DAY	3	29808	f	2010-11-05	7275	\N	10909	\N
19283	GENERIC_DAY	3	29808	f	2010-11-08	7275	\N	10909	\N
19400	GENERIC_DAY	3	15408	f	2010-11-12	7275	\N	10909	\N
19438	GENERIC_DAY	3	0	f	2010-11-14	7275	\N	10909	\N
19401	GENERIC_DAY	3	44208	f	2010-11-18	7273	\N	10909	\N
19403	GENERIC_DAY	3	29808	f	2010-11-10	7273	\N	10909	\N
19432	GENERIC_DAY	3	29808	f	2010-12-02	7275	\N	10909	\N
19395	GENERIC_DAY	3	29808	f	2010-11-24	7273	\N	10909	\N
19404	GENERIC_DAY	3	0	f	2010-11-14	7273	\N	10909	\N
19409	GENERIC_DAY	3	29808	f	2010-11-25	7275	\N	10909	\N
19289	GENERIC_DAY	3	29808	f	2010-11-10	7275	\N	10909	\N
19419	GENERIC_DAY	3	29808	f	2010-11-08	7273	\N	10909	\N
19415	GENERIC_DAY	3	0	f	2010-11-02	7273	\N	10909	\N
19411	GENERIC_DAY	3	29808	f	2010-11-26	7273	\N	10909	\N
19394	GENERIC_DAY	3	882	f	2010-12-07	7273	\N	10909	\N
19405	GENERIC_DAY	3	0	f	2010-11-27	7275	\N	10909	\N
19406	GENERIC_DAY	3	0	f	2010-11-28	7275	\N	10909	\N
19287	GENERIC_DAY	3	882	f	2010-12-07	7275	\N	10909	\N
19414	GENERIC_DAY	3	0	f	2010-11-28	7273	\N	10909	\N
19288	GENERIC_DAY	3	0	f	2010-11-07	7275	\N	10909	\N
19433	GENERIC_DAY	3	29808	f	2010-11-09	7273	\N	10909	\N
19426	GENERIC_DAY	3	29808	f	2010-12-03	7275	\N	10909	\N
19422	GENERIC_DAY	3	29808	f	2010-11-22	7273	\N	10909	\N
19396	GENERIC_DAY	3	29808	f	2010-11-29	7273	\N	10909	\N
19418	GENERIC_DAY	3	29808	f	2010-12-06	7273	\N	10909	\N
19410	GENERIC_DAY	3	29808	f	2010-11-24	7275	\N	10909	\N
19424	GENERIC_DAY	3	29808	f	2010-11-22	7275	\N	10909	\N
19429	GENERIC_DAY	3	29808	f	2010-11-23	7273	\N	10909	\N
19290	GENERIC_DAY	3	29808	f	2010-11-05	7273	\N	10909	\N
19444	GENERIC_DAY	3	0	f	2010-12-11	7273	\N	10911	\N
19452	GENERIC_DAY	3	28368	f	2010-12-14	7273	\N	10911	\N
19463	GENERIC_DAY	3	28368	f	2010-12-16	7273	\N	10911	\N
19464	GENERIC_DAY	3	0	f	2010-12-19	7273	\N	10911	\N
19451	GENERIC_DAY	3	0	f	2011-01-01	7273	\N	10911	\N
19442	GENERIC_DAY	3	28368	f	2010-12-13	7273	\N	10911	\N
19476	GENERIC_DAY	3	0	f	2011-01-15	7275	\N	10911	\N
19471	GENERIC_DAY	3	28368	f	2010-12-29	7273	\N	10911	\N
19473	GENERIC_DAY	3	28368	f	2011-01-04	7273	\N	10911	\N
19446	GENERIC_DAY	3	28368	f	2010-12-30	7273	\N	10911	\N
19459	GENERIC_DAY	3	28368	f	2010-12-15	7275	\N	10911	\N
19447	GENERIC_DAY	3	0	f	2010-12-25	7275	\N	10911	\N
19469	GENERIC_DAY	3	28368	f	2010-12-21	7273	\N	10911	\N
19450	GENERIC_DAY	3	0	f	2011-01-16	7275	\N	10911	\N
19445	GENERIC_DAY	3	0	f	2011-01-09	7275	\N	10911	\N
19468	GENERIC_DAY	3	28368	f	2010-12-29	7275	\N	10911	\N
19467	GENERIC_DAY	3	0	f	2011-01-02	7273	\N	10911	\N
19448	GENERIC_DAY	3	28368	f	2011-01-07	7273	\N	10911	\N
19457	GENERIC_DAY	3	28368	f	2011-01-05	7275	\N	10911	\N
19470	GENERIC_DAY	3	0	f	2011-01-02	7275	\N	10911	\N
19458	GENERIC_DAY	3	28368	f	2011-01-05	7273	\N	10911	\N
19456	GENERIC_DAY	3	28368	f	2011-01-14	7273	\N	10911	\N
19462	GENERIC_DAY	3	28368	f	2010-12-31	7275	\N	10911	\N
19475	GENERIC_DAY	3	28368	f	2010-12-10	7275	\N	10911	\N
19455	GENERIC_DAY	3	0	f	2010-12-18	7275	\N	10911	\N
19465	GENERIC_DAY	3	28368	f	2011-01-03	7275	\N	10911	\N
19449	GENERIC_DAY	3	28368	f	2010-12-17	7273	\N	10911	\N
19461	GENERIC_DAY	3	28368	f	2010-12-28	7275	\N	10911	\N
19454	GENERIC_DAY	3	28368	f	2011-01-06	7275	\N	10911	\N
19460	GENERIC_DAY	3	28368	f	2010-12-24	7275	\N	10911	\N
19453	GENERIC_DAY	3	28368	f	2011-01-04	7275	\N	10911	\N
19472	GENERIC_DAY	3	0	f	2010-12-12	7275	\N	10911	\N
19474	GENERIC_DAY	3	28368	f	2010-12-31	7273	\N	10911	\N
19466	GENERIC_DAY	3	28368	f	2010-12-21	7275	\N	10911	\N
19443	GENERIC_DAY	3	28368	f	2010-12-10	7273	\N	10911	\N
19484	GENERIC_DAY	3	28368	f	2010-12-09	7275	\N	10911	\N
19485	GENERIC_DAY	3	28368	f	2010-12-14	7275	\N	10911	\N
19512	GENERIC_DAY	3	28368	f	2010-12-16	7275	\N	10911	\N
19506	GENERIC_DAY	3	0	f	2010-12-25	7273	\N	10911	\N
19494	GENERIC_DAY	3	26630	f	2010-12-07	7275	\N	10911	\N
19501	GENERIC_DAY	3	28368	f	2010-12-20	7273	\N	10911	\N
19521	GENERIC_DAY	3	0	f	2010-12-18	7273	\N	10911	\N
19482	GENERIC_DAY	3	28368	f	2011-01-10	7273	\N	10911	\N
19503	GENERIC_DAY	3	28368	f	2010-12-17	7275	\N	10911	\N
19523	GENERIC_DAY	3	28368	f	2010-12-20	7275	\N	10911	\N
19507	GENERIC_DAY	3	28368	f	2010-12-08	7275	\N	10911	\N
19483	GENERIC_DAY	3	0	f	2010-12-26	7275	\N	10911	\N
19492	GENERIC_DAY	3	0	f	2011-01-16	7273	\N	10911	\N
19519	GENERIC_DAY	3	28368	f	2011-01-06	7273	\N	10911	\N
19493	GENERIC_DAY	3	0	f	2011-01-01	7275	\N	10911	\N
19510	GENERIC_DAY	3	0	f	2011-01-08	7275	\N	10911	\N
19497	GENERIC_DAY	3	28368	f	2010-12-23	7275	\N	10911	\N
19478	GENERIC_DAY	3	28368	f	2010-12-22	7273	\N	10911	\N
19516	GENERIC_DAY	3	26631	f	2010-12-07	7273	\N	10911	\N
19488	GENERIC_DAY	3	28368	f	2010-12-27	7273	\N	10911	\N
19490	GENERIC_DAY	3	28368	f	2010-12-28	7273	\N	10911	\N
19509	GENERIC_DAY	3	28368	f	2011-01-11	7275	\N	10911	\N
19511	GENERIC_DAY	3	0	f	2011-01-09	7273	\N	10911	\N
19499	GENERIC_DAY	3	28368	f	2011-01-12	7275	\N	10911	\N
19480	GENERIC_DAY	3	28368	f	2011-01-11	7273	\N	10911	\N
19505	GENERIC_DAY	3	0	f	2010-12-11	7275	\N	10911	\N
19498	GENERIC_DAY	3	28368	f	2010-12-27	7275	\N	10911	\N
19495	GENERIC_DAY	3	28368	f	2010-12-15	7273	\N	10911	\N
19513	GENERIC_DAY	3	28368	f	2010-12-22	7275	\N	10911	\N
19481	GENERIC_DAY	3	17866	f	2011-01-17	7273	\N	10911	\N
19520	GENERIC_DAY	3	28368	f	2010-12-09	7273	\N	10911	\N
19504	GENERIC_DAY	3	0	f	2011-01-08	7273	\N	10911	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
1802263	1	6161	6162	\N	0
1802262	1	6164	6165	\N	0
8028161	2	7076	15151	\N	0
8028162	2	7071	15150	\N	0
8159232	1	7071	7074	\N	0
2326550	24	7075	7082	\N	0
2326561	21	7080	7081	\N	0
3899415	8	7077	7074	\N	2
8159233	0	6171	7071	\N	0
6258688	3	4968	6168	\N	0
2326549	9	4949	4950	\N	0
8028163	2	4952	4953	\N	0
8290309	1	4958	4962	\N	0
3637254	7	6168	6169	\N	0
8290310	1	4960	4961	\N	0
2326545	10	1851	1852	\N	0
2326546	10	1852	1853	\N	0
2326547	10	1853	1854	\N	0
2326548	10	1854	1855	\N	0
1802256	26	1827	1835	\N	0
1572866	31	1829	1830	\N	0
1572867	31	1830	1831	\N	0
1802243	27	1831	1832	\N	0
1802244	27	1832	1833	\N	0
1802245	27	1833	1834	\N	0
1540096	32	1843	1827	\N	0
1802257	26	1836	1837	\N	0
1802258	26	1837	1838	\N	0
1802259	26	1838	1839	\N	0
1802260	26	1839	1840	\N	0
1802261	26	1840	1841	\N	0
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
31108	30609	100.00
1717	1233	100.00
1718	1234	100.00
1719	1235	100.00
1720	1236	100.00
1721	1237	100.00
1722	1238	100.00
1757	1239	100.00
1758	1268	100.00
1761	1270	100.00
1762	1271	100.00
1763	1272	100.00
1764	1273	100.00
1765	1274	100.00
1766	1275	100.00
1809	2371	100.00
2947	2335	100.00
2948	2397	100.00
2949	2398	100.00
2950	2399	100.00
2951	2400	100.00
2954	2403	100.00
2952	2401	100.00
2953	2402	100.00
3021	2336	100.00
3022	2423	100.00
3023	3636	100.00
3026	3638	100.00
3027	2337	100.00
3028	3639	100.00
3786	3665	100.00
3787	2338	100.00
1771	1291	100.00
1772	1292	100.00
1773	1293	100.00
1774	1294	100.00
1775	1295	100.00
1776	1296	100.00
1795	2330	100.00
1796	2331	100.00
3788	3666	100.00
3789	3667	100.00
3790	3668	100.00
6080	5663	100.00
6060	5667	100.00
6061	5687	100.00
6064	5678	100.00
6065	5679	100.00
3793	3670	100.00
3794	3671	100.00
3795	2339	100.00
22523	22024	100.00
22528	22033	100.00
22529	22034	100.00
1797	2332	100.00
1800	2333	100.00
1801	2359	100.00
1802	2360	100.00
1803	2361	100.00
1804	2362	100.00
1805	2363	100.00
1808	2334	100.00
6085	5698	100.00
6969	6569	100.00
6982	6578	100.00
6971	6579	100.00
6983	6587	100.00
6986	6588	100.00
6970	6570	100.00
15051	14650	100.00
\.


--
-- Data for Name: effortperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY effortperday (base_calendar_id, effort, day_id) FROM stdin;
404	28800	0
404	28800	1
404	28800	2
404	28800	3
404	28800	4
404	0	5
404	0	6
7474	28800	0
7474	28800	1
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id, resourcetype) FROM stdin;
13235	0
13236	0
12135	0
12136	0
16262	0
10808	0
10810	0
22826	0
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario, enddate, durationinlastday, startdate, durationstartinfirstday) FROM stdin;
13336	5	13235	707	2010-11-24	7200	2010-11-16	0
13337	5	13236	707	2010-12-10	21600	2010-11-24	7200
12236	7	12135	707	2010-10-29	7200	2010-10-28	0
12237	7	12136	707	2010-11-16	0	2010-11-12	21600
16363	4	16262	707	2010-11-02	25200	2010-11-01	0
10909	10	10808	707	2010-12-07	1764	2010-11-02	25200
10911	9	10810	707	2011-01-17	35731	2010-12-07	1764
22927	1	22826	707	2010-12-09	14400	2010-11-23	0
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
320
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
10409	9	PREFIX-00002-00012-00001	WORKER	12	1.00	f	10109	\N
6911	1	044fd33e-1455-4d40-8172-509ba195a90b	WORKER	10	1.00	f	\N	8015
6912	1	c6fae1e1-d314-4a57-b9b8-a03794f05cdc	WORKER	50	1.00	f	\N	8017
6913	1	33785d51-31b2-4893-af2f-57f7af3474f1	WORKER	100	1.00	f	\N	8018
6873	41	PREFIX-00002-00003-00001	WORKER	10	1.00	f	6570	\N
14950	7	PREFIX-00002-00015-00001	WORKER	10	1.00	f	14650	\N
31009	2	PREFIX-00011-00001-00001	WORKER	100	1.00	f	30609	\N
6907	1	eca18c3f-6dc2-4712-bb96-3afe9bb9f570	WORKER	100	1.00	f	\N	8010
6908	1	96998447-6d36-480b-ba45-ba8cf061811d	WORKER	5	1.00	f	\N	8011
6909	1	7da5281d-62fd-4f76-89b2-8c19ce4b5b33	WORKER	10	1.00	f	\N	8012
6910	1	185c8209-8bff-4bd7-a324-723a58dc7366	WORKER	10	1.00	f	\N	8014
1677	48	PREFIX-00001-00019-00001	WORKER	15	1.00	f	1291	\N
1678	48	PREFIX-00001-00020-00001	WORKER	5	1.00	f	1292	\N
5989	46	PREFIX-00002-00001-00001	WORKER	100	1.00	f	5698	\N
6872	41	PREFIX-00002-00002-00001	WORKER	5	1.00	f	6569	\N
10405	20	PREFIX-00002-00011-00001	WORKER	5	1.00	f	10105	\N
10413	18	PREFIX-00002-00013-00001	WORKER	40	1.00	f	10113	\N
6878	39	PREFIX-00002-00005-00001	WORKER	10	1.00	f	6578	\N
6879	39	PREFIX-00002-00006-00001	WORKER	10	1.00	f	6579	\N
6884	31	PREFIX-00002-00008-00001	WORKER	50	1.00	f	6587	\N
6885	31	PREFIX-00002-00009-00001	WORKER	100	1.00	f	6588	\N
1679	48	PREFIX-00001-00021-00001	WORKER	10	1.00	f	1293	\N
1680	48	PREFIX-00001-00022-00001	WORKER	15	1.00	f	1294	\N
1681	48	PREFIX-00001-00023-00001	WORKER	5	1.00	f	1295	\N
1682	48	PREFIX-00001-00024-00001	WORKER	20	1.00	f	1296	\N
1703	32	PREFIX-00001-00033-00001	WORKER	15	1.00	f	2330	\N
1704	32	PREFIX-00001-00034-00001	WORKER	10	1.00	f	2331	\N
1705	32	PREFIX-00001-00035-00001	WORKER	20	1.00	f	2332	\N
1706	32	PREFIX-00001-00026-00001	WORKER	10	1.00	f	2333	\N
2435	31	PREFIX-00001-00037-00001	WORKER	5	1.00	f	2359	\N
2436	31	PREFIX-00001-00038-00001	WORKER	20	1.00	f	2360	\N
2437	31	PREFIX-00001-00039-00001	WORKER	5	1.00	f	2361	\N
2438	31	PREFIX-00001-00040-00001	WORKER	5	1.00	f	2362	\N
2439	31	PREFIX-00001-00041-00001	WORKER	5	1.00	f	2363	\N
1707	32	PREFIX-00001-00027-00001	WORKER	25	1.00	f	2334	\N
2443	30	PREFIX-00001-00043-00001	WORKER	10	1.00	f	2371	\N
2506	38	PREFIX-00001-00060-00001	WORKER	10	1.00	f	3665	\N
1711	45	PREFIX-00001-00031-00001	WORKER	15	1.00	f	2338	\N
2507	38	PREFIX-00001-00061-00001	WORKER	20	1.00	f	3666	\N
2508	38	PREFIX-00001-00062-00001	WORKER	5	1.00	f	3667	\N
2509	38	PREFIX-00001-00063-00001	WORKER	30	1.00	f	3668	\N
5966	14	PREFIX-00001-00067-00001	WORKER	10	1.00	f	5663	\N
5970	13	PREFIX-00001-00068-00001	WORKER	108	1.00	f	5667	\N
5982	11	PREFIX-00001-00073-00001	WORKER	100	1.00	f	5687	\N
22424	6	PREFIX-00010-00001-00001	WORKER	100	1.00	f	22024	\N
1659	49	PREFIX-00001-00012-00001	WORKER	5	1.00	f	1270	\N
1660	49	PREFIX-00001-00013-00001	WORKER	5	1.00	f	1271	\N
1661	49	PREFIX-00001-00014-00001	WORKER	2	1.00	f	1272	\N
1662	49	PREFIX-00001-00015-00001	WORKER	5	1.00	f	1273	\N
1663	49	PREFIX-00001-00016-00001	WORKER	5	1.00	f	1274	\N
1664	49	PREFIX-00001-00017-00001	WORKER	2	1.00	f	1275	\N
1708	45	PREFIX-00001-00028-00001	WORKER	25	1.00	f	2335	\N
2465	41	PREFIX-00001-00045-00001	WORKER	15	1.00	f	2397	\N
2466	41	PREFIX-00001-00046-00001	WORKER	10	1.00	f	2398	\N
2467	41	PREFIX-00001-00047-00001	WORKER	15	1.00	f	2399	\N
2468	41	PREFIX-00001-00048-00001	WORKER	20	1.00	f	2400	\N
2471	41	PREFIX-00001-00051-00001	WORKER	20	1.00	f	2403	\N
2469	41	PREFIX-00001-00049-00001	WORKER	20	1.00	f	2401	\N
2470	41	PREFIX-00001-00050-00001	WORKER	30	1.00	f	2402	\N
1709	45	PREFIX-00001-00029-00001	WORKER	25	1.00	f	2336	\N
2484	39	PREFIX-00001-00054-00001	WORKER	10	1.00	f	2423	\N
2485	39	PREFIX-00001-00055-00001	WORKER	20	1.00	f	3636	\N
2486	39	PREFIX-00001-00056-00001	WORKER	20	1.00	f	3638	\N
1710	45	PREFIX-00001-00030-00001	WORKER	20	1.00	f	2337	\N
2487	39	PREFIX-00001-00057-00001	WORKER	20	1.00	f	3639	\N
5977	22	PREFIX-00001-00070-00001	WORKER	200	1.00	f	5678	\N
5978	22	PREFIX-00001-00071-00001	WORKER	233	1.00	f	5679	\N
5986	6	PREFIX-00001-00074-00001	WORKER	100	1.00	f	5691	\N
2510	38	PREFIX-00001-00064-00001	WORKER	15	1.00	f	3670	\N
2511	38	PREFIX-00001-00065-00001	WORKER	10	1.00	f	3671	\N
1712	45	PREFIX-00001-00032-00001	WORKER	15	1.00	f	2339	\N
22429	4	PREFIX-00010-00003-00001	WORKER	100	1.00	f	22033	\N
22430	4	PREFIX-00010-00004-00001	WORKER	3	1.00	f	22034	\N
1630	51	PREFIX-00001-00003-00001	WORKER	30	1.00	f	1233	\N
1631	51	PREFIX-00001-00004-00001	WORKER	30	1.00	f	1234	\N
1632	51	PREFIX-00001-00005-00001	WORKER	35	1.00	f	1235	\N
1633	51	PREFIX-00001-00006-00001	WORKER	35	1.00	f	1236	\N
1634	51	PREFIX-00001-00007-00001	WORKER	15	1.00	f	1237	\N
1635	51	PREFIX-00001-00008-00001	WORKER	15	1.00	f	1238	\N
1636	51	PREFIX-00001-00002-00001	WORKER	10	1.00	f	1239	\N
1658	49	PREFIX-00001-00011-00001	WORKER	55	1.00	f	1268	\N
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
15052	14649
15053	14649
10514	10104
10506	10104
6972	6577
6973	6577
6985	6586
6984	6586
6087	5697
6086	5697
22530	22032
22531	22032
22525	22023
22524	22023
31109	30608
31110	30608
10510	10104
6980	6577
6981	6577
1723	1232
1755	1232
1724	1232
1756	1232
1739	1232
1740	1232
1760	1267
1759	1267
1768	1269
1767	1269
1786	1290
1785	1290
1778	1290
1793	1290
1794	1290
1777	1290
3775	2329
1799	2329
2942	2329
3013	2329
1798	2329
3014	2329
2941	2329
3774	2329
4453	2329
2982	2329
2981	2329
4452	2329
2943	2358
4455	2358
3776	2358
1806	2358
2984	2358
3015	2358
2944	2358
2983	2358
3777	2358
1807	2358
4454	2358
3016	2358
3779	2370
4456	2370
3017	2370
4457	2370
2985	2370
3018	2370
1810	2370
2945	2370
2986	2370
2946	2370
3778	2370
1811	2370
2955	2396
2956	2396
3781	2396
4459	2396
2987	2396
3019	2396
3020	2396
4458	2396
3780	2396
2988	2396
3783	2422
3782	2422
4460	2422
3024	2422
3025	2422
4461	2422
3785	3637
3784	3637
3737	3637
3029	3637
4463	3637
4462	3637
4465	3664
4464	3664
3791	3664
3792	3664
6062	5686
6063	5686
6081	5686
6082	5686
6066	5677
6067	5677
6084	5677
6083	5677
1741	1215
1726	1215
1725	1215
1742	1215
1769	1215
1770	1215
4467	3669
4466	3669
3796	3669
3797	3669
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
5454	1	5051
\.


--
-- Data for Name: limiting_resource_queue_dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_dependency (id, type, origin_queue_element_id, destiny_queue_element_id) FROM stdin;
\.


--
-- Data for Name: limiting_resource_queue_element; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, earliest_end_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
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
909	1	6314b067-13b1-49d8-89b6-8dd9849b2fa8	Imported materials without category	f	\N
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
1112	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	\N
1113	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f	\N
1114	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f	\N
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
22725	USER	3	WRITE_AUTHORIZATION	22023	1112	\N
31310	USER	1	WRITE_AUTHORIZATION	30608	1112	\N
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
5697	javier	\N	t	15	0.00	0.00	352	\N	\N	0	\N	303
1215	\N	\N	t	74	0.00	0.00	1590	\N	\N	0	\N	303
22023	Javier Moran	\N	t	4	0.00	0.00	203	\N	\N	0	\N	303
30608	javier moran	\N	t	1	0.00	0.00	100	hola	\N	0	\N	303
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, sum_charged_hours_id, positionincontainer) FROM stdin;
14649	7	elem 2	\N	PREFIX-00002-00014	\N	\N	0.00	f	5697	\N	\N	14750	3
5697	55	pedido 5	\N	PREFIX-00002	2010-10-25 19:41:05.571	\N	0.11	f	\N	\N	\N	6391	\N
5698	46	elem 1	\N	PREFIX-00002-00001	\N	\N	0.40	f	5697	\N	\N	6392	0
10104	20	elem 1	\N	PREFIX-00002-00010	\N	\N	0.00	f	5697	\N	\N	10231	1
6569	41	elem 1 (copy)	\N	PREFIX-00002-00002	\N	\N	0.00	f	10104	\N	\N	6670	0
10105	20	elem nuevo	\N	PREFIX-00002-00011	\N	\N	0.00	f	10104	\N	\N	10232	1
10113	18	elem tris	\N	PREFIX-00002-00013	\N	\N	0.00	f	10104	\N	\N	10233	2
10109	19	elem 3	\N	PREFIX-00002-00012	\N	\N	0.00	f	5697	\N	\N	10234	2
6577	40	elem grande	\N	PREFIX-00002-00004	\N	\N	0.00	f	5697	\N	\N	6690	4
6578	40	elem 3.1	\N	PREFIX-00002-00005	\N	\N	0.00	f	6577	\N	\N	6691	0
6579	39	elem grande (copy)	\N	PREFIX-00002-00006	\N	\N	0.00	f	6577	\N	\N	6692	1
6586	32	elem c2	\N	PREFIX-00002-00007	\N	\N	0.00	f	5697	\N	\N	6699	5
6587	31	c1.1	\N	PREFIX-00002-00008	\N	\N	0.00	f	6586	\N	\N	6700	0
6588	32	elem c2 (copy)	\N	PREFIX-00002-00009	\N	\N	0.00	f	6586	\N	\N	6701	1
6570	41	elem 2 (copy)	\N	PREFIX-00002-00003	\N	\N	0.00	f	14649	\N	\N	6671	0
3669	38	Documentación	\N	PREFIX-00001-00059	\N	\N	0.00	f	1215	\N	\N	4665	11
22023	7	Pedido 6	\N	PREFIX-00010	2010-11-16 17:18:25.204	\N	0.00	f	\N	\N	\N	22124	\N
22024	6	elem 1	\N	PREFIX-00010-00001	\N	\N	0.00	f	22023	\N	\N	22125	0
14650	7	elem hijo	\N	PREFIX-00002-00015	\N	\N	0.00	f	14649	\N	\N	14751	1
1291	48	Gestión de nodos	\N	PREFIX-00001-00019	\N	\N	0.00	f	1290	\N	\N	2017	0
1292	48	Gestión de redes (o grupos) de nodos	\N	PREFIX-00001-00020	\N	\N	0.00	f	1290	\N	\N	2018	1
1293	48	Configuración de nodos	\N	PREFIX-00001-00021	\N	\N	0.00	f	1290	\N	\N	2019	2
1294	48	Gestión de sensores	\N	PREFIX-00001-00022	\N	\N	0.00	f	1290	\N	\N	2222	3
1295	48	Configuración de offset y escalado por sensor	\N	PREFIX-00001-00023	\N	\N	0.00	f	1290	\N	\N	2223	4
1296	48	Exportación de configuración de un nodo	\N	PREFIX-00001-00024	\N	\N	0.00	f	1290	\N	\N	2224	5
2360	45	Paso de datos a histórico	\N	PREFIX-00001-00038	\N	\N	0.00	f	2358	\N	\N	4433	2
3636	39	Interfaz para permitir la modificación de la configuración remotamente	\N	PREFIX-00001-00055	\N	\N	0.00	f	2422	\N	\N	4654	2
3637	39	Pruebas	\N	PREFIX-00001-00053	\N	\N	0.00	f	1215	\N	\N	4655	9
3638	39	Pruebas funcionales del sistema	\N	PREFIX-00001-00056	\N	\N	0.00	f	3637	\N	\N	4656	0
2337	46	Pruebas de aceptación	\N	PREFIX-00001-00030	\N	\N	0.00	f	3637	\N	\N	4657	1
3639	39	Corrección de bugs	\N	PREFIX-00001-00057	\N	\N	0.00	f	3637	\N	\N	4658	2
3664	38	Entorno e intraestrutura	\N	PREFIX-00001-00058	\N	\N	0.00	f	1215	\N	\N	4659	10
3665	38	Montaje de entorno de desarrollo	\N	PREFIX-00001-00060	\N	\N	0.00	f	3664	\N	\N	4660	0
2338	46	Instalacion y configuración del servidor central con Zabbix	\N	PREFIX-00001-00031	\N	\N	0.00	f	3664	\N	\N	4661	1
3666	38	Puesta en producción	\N	PREFIX-00001-00061	\N	\N	0.00	f	3664	\N	\N	4662	2
3667	38	Soporte de localización (idiomas)	\N	PREFIX-00001-00062	\N	\N	0.00	f	3664	\N	\N	4663	3
3668	38	Redacción del plan de escalabilidad	\N	PREFIX-00001-00063	\N	\N	0.00	f	3664	\N	\N	4664	4
5663	25	hola	\N	PREFIX-00001-00067	\N	\N	0.00	f	1215	\N	\N	6375	12
5686	22	elem	\N	PREFIX-00001-00072	\N	\N	0.00	f	1215	\N	\N	6376	13
5667	24	elem (copy)	\N	PREFIX-00001-00068	\N	\N	0.00	f	5686	\N	\N	6377	0
1215	61	Servidor sens2net	\N	PREFIX-00001	2010-11-01 00:00:00	\N	0.03	f	\N	\N	\N	1316	\N
1232	51	Coordinación	\N	PREFIX-00001-00001	\N	\N	0.00	f	1215	\N	\N	1929	0
1233	51	Planificación semanal	\N	PREFIX-00001-00003	\N	\N	0.00	f	1232	\N	\N	1930	0
1234	51	Informes semanales	\N	PREFIX-00001-00004	\N	\N	0.00	f	1232	\N	\N	1931	1
1235	51	Comunicaciones internas y externas	\N	PREFIX-00001-00005	\N	\N	0.00	f	1232	\N	\N	1932	2
1236	51	Reuniones de coordinación	\N	PREFIX-00001-00006	\N	\N	0.00	f	1232	\N	\N	1933	3
1237	51	Control de calidad	\N	PREFIX-00001-00007	\N	\N	0.00	f	1232	\N	\N	1934	4
1238	51	Seguimiento	\N	PREFIX-00001-00008	\N	\N	0.00	f	1232	\N	\N	1935	5
1267	49	Análisis	\N	PREFIX-00001-00009	\N	\N	0.00	f	1215	\N	\N	1936	1
1239	52	Especificación de requisitos	\N	PREFIX-00001-00002	\N	\N	0.00	f	1267	\N	\N	1937	0
1268	49	Análisis funcional	\N	PREFIX-00001-00011	\N	\N	0.00	f	1267	\N	\N	1938	1
1269	49	Módulo de usuarios y permisos	\N	PREFIX-00001-00010	\N	\N	0.00	f	1215	\N	\N	1939	2
1270	49	Gestión de usuarios	\N	PREFIX-00001-00012	\N	\N	0.00	f	1269	\N	\N	1940	0
1271	49	Gestión de permisos	\N	PREFIX-00001-00013	\N	\N	0.00	f	1269	\N	\N	1941	1
1272	49	Asignación de permisos a usuarios	\N	PREFIX-00001-00014	\N	\N	0.00	f	1269	\N	\N	1942	2
1273	49	Autenticación de usuarios	\N	PREFIX-00001-00015	\N	\N	0.00	f	1269	\N	\N	1943	3
22032	4	elem 2	\N	PREFIX-00010-00002	\N	\N	0.00	f	22023	\N	\N	22134	1
1274	49	Gestión de grupos de usuarios	\N	PREFIX-00001-00016	\N	\N	0.00	f	1269	\N	\N	1944	4
1275	49	Asignación de permisos a grupos de usuarios	\N	PREFIX-00001-00017	\N	\N	0.00	f	1269	\N	\N	1945	5
1290	48	Módulo de nodos y sensores	\N	PREFIX-00001-00018	\N	\N	0.00	f	1215	\N	\N	2016	3
2329	46	Módulo de monitorización	\N	PREFIX-00001-00025	\N	\N	0.00	f	1215	\N	\N	4426	4
2330	46	Monitorización bajo demanda	\N	PREFIX-00001-00033	\N	\N	0.00	f	2329	\N	\N	4427	0
2331	46	Localización nodos en un mapa	\N	PREFIX-00001-00034	\N	\N	0.00	f	2329	\N	\N	4428	1
2332	46	Configuración de los mapas y la geolocalización de los sensores	\N	PREFIX-00001-00035	\N	\N	0.00	f	2329	\N	\N	4429	2
2358	45	Módulo de gestión de datos	\N	PREFIX-00001-00036	\N	\N	0.00	f	1215	\N	\N	4430	5
2333	46	Importación de datos enviados por los nodos	\N	PREFIX-00001-00026	\N	\N	0.00	f	2358	\N	\N	4431	0
2359	45	Almacenamiento de datos en una base de datos	\N	PREFIX-00001-00037	\N	\N	0.00	f	2358	\N	\N	4432	1
22033	4	elem 2 (copy)	\N	PREFIX-00010-00003	\N	\N	0.00	f	22032	\N	\N	22135	0
22034	4	elem 3	\N	PREFIX-00010-00004	\N	\N	0.00	f	22032	\N	\N	22136	1
2335	46	Cálculo y mostrado de estadísticas	\N	PREFIX-00001-00028	\N	\N	0.00	f	2396	\N	\N	4441	0
2397	41	Cálculo del valor real basado en offset y escalado	\N	PREFIX-00001-00045	\N	\N	0.00	f	2396	\N	\N	4442	1
2398	41	Generación de gráficas para una o varias variables en el tiempo	\N	PREFIX-00001-00046	\N	\N	0.00	f	2396	\N	\N	4443	2
2399	41	Generación de gráficas variables de distinto tipo	\N	PREFIX-00001-00047	\N	\N	0.00	f	2396	\N	\N	4646	3
2400	41	Generación de gráficas de variables cruzadas	\N	PREFIX-00001-00048	\N	\N	0.00	f	2396	\N	\N	4647	4
2403	41	Generar informes en HTML y PDF	\N	PREFIX-00001-00051	\N	\N	0.00	f	2396	\N	\N	4648	5
2401	41	Exportación de datos a diversos formatos	\N	PREFIX-00001-00049	\N	\N	0.00	f	2396	\N	\N	4649	6
2402	41	Mostrado de datos sobre el mapa	\N	PREFIX-00001-00050	\N	\N	0.00	f	2396	\N	\N	4650	7
2422	39	Módulo de software de nodos	\N	PREFIX-00001-00052	\N	\N	0.00	f	1215	\N	\N	4651	8
2336	46	Adaptación del software de los nodos al protocolo de Zabbix	\N	PREFIX-00001-00029	\N	\N	0.00	f	2422	\N	\N	4652	0
2423	39	Consulta de la configuración al servidor	\N	PREFIX-00001-00054	\N	\N	0.00	f	2422	\N	\N	4653	1
5687	22	jkljlkljkl	\N	PREFIX-00001-00073	\N	\N	0.00	f	5686	\N	\N	6378	1
5677	23	dxrxsdrsdxresxuiui	\N	PREFIX-00001-00069	\N	\N	0.09	f	1215	\N	\N	6379	14
5678	23	klhjuiohjihjhllhjl	\N	PREFIX-00001-00070	\N	\N	0.20	f	5677	\N	\N	6380	0
5679	23	sxezaseswe	\N	PREFIX-00001-00071	\N	\N	0.00	f	5677	\N	\N	6381	1
5691	16	elem ultimo	\N	PREFIX-00001-00074	\N	\N	0.00	f	1215	\N	\N	6385	15
3670	38	Documentación de usuario	\N	PREFIX-00001-00064	\N	\N	0.00	f	3669	\N	\N	4666	0
3671	38	Documentación de administrador de red	\N	PREFIX-00001-00065	\N	\N	0.00	f	3669	\N	\N	4667	1
30608	2	pedido 7	hola	PREFIX-00011	2010-11-18 12:28:23.116	\N	0.00	f	\N	\N	\N	30709	\N
30609	2	elem 1	\N	PREFIX-00011-00001	\N	\N	0.00	f	30608	\N	\N	30710	0
2361	45	Configuración tiempo de vida de los datos recientes	\N	PREFIX-00001-00039	\N	\N	0.00	f	2358	\N	\N	4434	3
2362	45	Gestión de datos históricos	\N	PREFIX-00001-00040	\N	\N	0.00	f	2358	\N	\N	4435	4
2363	45	Detección de falta de recursos de almacenamiento	\N	PREFIX-00001-00041	\N	\N	0.00	f	2358	\N	\N	4436	5
2370	44	Módulo de alarmas	\N	PREFIX-00001-00042	\N	\N	0.00	f	1215	\N	\N	4437	6
2334	46	Gestión de alarmas	\N	PREFIX-00001-00027	\N	\N	0.00	f	2370	\N	\N	4438	0
2371	44	Envío de notificaciones por email y SMS	\N	PREFIX-00001-00043	\N	\N	0.00	f	2370	\N	\N	4439	1
2396	41	Módulo de consulta de datos	\N	PREFIX-00001-00044	\N	\N	0.00	f	1215	\N	\N	4440	7
2339	46	Documentación de administrador de sistema	\N	PREFIX-00001-00032	\N	\N	0.00	f	3669	\N	\N	4668	2
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
8009	1	pedido 5	\N	PREFIX-00002	0	\N	3	\N	\N
8010	1	elem 1	\N	PREFIX-00002-00001	\N	\N	0	8009	0
8011	1	elem 1	\N	PREFIX-00002-00002	\N	\N	0	8009	1
8012	1	elem 2	\N	PREFIX-00002-00003	\N	\N	0	8009	2
8013	1	elem grande	\N	PREFIX-00002-00004	\N	\N	3	8009	3
8016	1	elem c2	\N	PREFIX-00002-00007	\N	\N	3	8009	4
8014	1	elem 3.1	\N	PREFIX-00002-00005	\N	\N	0	8013	0
8015	1	elem grande (copy)	\N	PREFIX-00002-00006	\N	\N	0	8013	1
8017	1	c1.1	\N	PREFIX-00002-00008	\N	\N	0	8016	0
8018	1	elem c2 (copy)	\N	PREFIX-00002-00009	\N	\N	0	8016	1
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
1233	1
1234	1
1235	1
1236	1
1237	1
1238	1
1239	1
1268	1
1270	1
1271	1
1272	1
5698	1
6569	1
10105	1
10113	1
10109	1
6578	1
6579	1
6587	1
6588	1
6570	1
14650	1
30609	1
1273	1
1274	1
1275	1
1291	1
1292	1
1293	1
1294	1
1295	1
1296	1
2330	1
2331	1
2332	1
2333	1
2359	1
2360	1
2361	1
2362	1
2363	1
2334	1
2371	1
2335	1
2397	1
2398	1
2399	1
2400	1
2403	1
2401	1
2402	1
2336	1
2423	1
3636	1
3638	1
2337	1
3639	1
3665	1
2338	1
3666	1
3667	1
3668	1
5663	1
5667	1
5687	1
5678	1
5679	1
5691	1
3670	1
3671	1
2339	1
22024	1
22033	1
22034	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1215
1232
1267
1269
1290
2329
2358
2370
2396
2422
3637
3664
3669
5677
5686
5697
6577
6586
10104
14649
22023
22032
30608
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
8009
8013
8016
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
8010	0
8011	0
8012	0
8014	0
8015	0
8017	0
8018	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	22	PREFIX	11	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
8009	303
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
6467	67	2010-11-17 18:42:36.713	707
1518	82	2010-11-17 20:32:58.998	707
22324	8	2010-11-18 11:07:31.925	707
30909	2	2010-11-18 12:28:49.676	707
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
5051	1	47b0c846-a0d8-4018-aa2e-023ebec333d7	t	t	5151
12727	1	eccd44b1-73bb-4d7d-ba14-391cff429f65	t	f	12827
12729	1	91b17f1b-911f-48b4-84db-7b341e8f6bb2	t	f	12828
7275	7	be91f28d-69d9-490f-81a7-3c74091ea792	t	f	7374
7273	7	f21a027f-fbb7-428e-874f-d6c76d5fb89c	t	f	7373
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
22826	1	1.00	\N	100	22624	\N
24342	4	1.00	\N	10	7071	\N
7676	19	1.00	\N	100	6171	\N
24344	3	1.00	\N	5	7076	\N
13235	5	1.00	\N	50	7080	\N
13236	5	1.00	\N	100	7081	\N
12135	7	1.00	\N	10	7077	\N
12136	7	1.00	\N	10	7074	\N
16262	4	1.00	\N	15	4968	\N
10808	10	2.07	\N	400	6168	\N
10810	9	1.95	\N	466	6169	\N
10812	8	0.50	\N	55	1827	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
5151	1
12827	1
12828	1
7374	1
7373	1
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
707	7	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
1215	1518	707
5697	6467	707
22023	22324	707
30608	30909	707
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
1215	1417	1518
1232	1434	1518
1233	1435	1518
1234	1436	1518
1235	1437	1518
1236	1438	1518
1237	1439	1518
1238	1440	1518
1239	1441	1518
1267	2037	1518
1268	2039	1518
1269	2040	1518
1270	2041	1518
1271	2042	1518
1272	2043	1518
1273	2044	1518
1274	2045	1518
1275	2046	1518
1290	2061	1518
1291	2062	1518
1292	2063	1518
1293	2064	1518
1294	2065	1518
1295	2066	1518
1296	2067	1518
2329	2146	1518
2330	2147	1518
2331	2148	1518
2332	2149	1518
2333	2150	1518
2334	2151	1518
2335	2152	1518
2336	2153	1518
2337	2154	1518
2338	2155	1518
2339	2156	1518
2358	2212	1518
2359	2214	1518
2360	2215	1518
2361	2216	1518
2362	2217	1518
2363	2218	1518
2370	2596	1518
2371	2598	1518
2396	3179	1518
2397	3181	1518
2398	3182	1518
2399	3183	1518
2400	3184	1518
2401	3185	1518
2402	3186	1518
2403	3187	1518
2422	3523	1518
2423	3525	1518
3636	3526	1518
3637	3527	1518
3638	3528	1518
3639	3530	1518
3664	4091	1518
3665	4092	1518
3666	4094	1518
3667	4095	1518
3668	4096	1518
3669	4097	1518
3670	4098	1518
3671	4099	1518
5663	5865	1518
5667	5873	1518
5677	5891	1518
5678	5892	1518
5679	5893	1518
5686	5916	1518
5687	5918	1518
5691	6284	1518
5697	6290	6467
5698	6291	6467
6569	6771	6467
6570	6772	6467
6577	6779	6467
6578	6780	6467
6579	6781	6467
6586	6800	6467
6587	6801	6467
6588	6802	6467
10104	10306	6467
10105	10307	6467
10109	10319	6467
10113	10334	6467
14649	14851	6467
14650	14852	6467
22023	22225	22324
22024	22226	22324
22032	22235	22324
22033	22236	22324
22034	22237	22324
30608	30810	30909
30609	30811	30909
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
1466	2	3	1232
1467	2	0	1233
1468	2	0	1234
1469	2	0	1235
1470	2	0	1236
1471	2	0	1237
1472	2	0	1238
1473	2	4	1239
2117	2	3	1290
2118	2	0	1291
2119	2	0	1292
2030	2	3	1232
2031	2	0	1233
2032	2	0	1234
2033	2	0	1235
2034	2	0	1236
2035	2	0	1237
2036	2	0	1238
2120	2	0	1293
2038	2	0	1239
2121	2	0	1294
2122	2	0	1295
2123	2	0	1296
5943	2	4	5663
5944	2	3	5686
5945	2	0	5667
5946	2	0	5687
5947	2	3	5677
5948	2	0	5678
5949	2	0	5679
2089	2	3	1290
2090	2	0	1291
2091	2	0	1292
2092	2	0	1293
2093	2	0	1294
2094	2	0	1295
2095	2	0	1296
2208	2	4	2329
2209	2	4	2330
2210	2	4	2331
2211	2	4	2332
2213	2	4	2333
2219	2	4	2334
2220	2	4	2335
2221	2	4	2336
2525	2	4	2337
2526	2	4	2338
2527	2	4	2339
2762	2	3	2329
2763	2	0	2330
2764	2	0	2331
2765	2	0	2332
2766	2	3	2358
2767	2	0	2333
2768	2	0	2359
2769	2	0	2360
2770	2	0	2361
2771	2	0	2362
2772	2	0	2363
2773	2	3	2370
2774	2	0	2334
2775	2	0	2371
2585	2	4	2329
2586	2	4	2330
2587	2	4	2331
2588	2	4	2332
2589	2	4	2358
2590	2	4	2333
2591	2	4	2359
2592	2	4	2360
2593	2	4	2361
2594	2	4	2362
2595	2	4	2363
2597	2	4	2334
2599	2	4	2335
2600	2	4	2336
2601	2	4	2337
2602	2	4	2338
2603	2	4	2339
2776	2	4	2335
2777	2	4	2336
2778	2	4	2337
2779	2	4	2338
2780	2	4	2339
3273	2	3	2329
3274	2	0	2330
3275	2	0	2331
3276	2	0	2332
3277	2	3	2358
3165	2	3	2329
3166	2	0	2330
3167	2	0	2331
3168	2	0	2332
3169	2	3	2358
3170	2	0	2333
3171	2	0	2359
3172	2	0	2360
3173	2	0	2361
3174	2	0	2362
3175	2	0	2363
3176	2	3	2370
3177	2	0	2334
3178	2	0	2371
3180	2	0	2335
3188	2	4	2336
3189	2	4	2337
3190	2	4	2338
3191	2	4	2339
3278	2	0	2333
3279	2	0	2359
3280	2	0	2360
3281	2	0	2361
3282	2	0	2362
3283	2	0	2363
3284	2	3	2370
3285	2	0	2334
3286	2	0	2371
3287	2	3	2396
3288	2	0	2335
3289	2	0	2397
3290	2	0	2398
3291	2	0	2399
3292	2	0	2400
3293	2	0	2403
3294	2	0	2401
3295	2	0	2402
3296	2	4	2336
3297	2	4	2337
3298	2	4	2338
3299	2	4	2339
6274	2	0	5663
6275	2	3	5686
6276	2	0	5667
6277	2	0	5687
6278	2	3	5677
4060	2	3	2329
4061	2	0	2330
3500	2	3	2329
3501	2	0	2330
3502	2	0	2331
3503	2	0	2332
3504	2	3	2358
3505	2	0	2333
3506	2	0	2359
3507	2	0	2360
3508	2	0	2361
3509	2	0	2362
3510	2	0	2363
3511	2	3	2370
3512	2	0	2334
3513	2	0	2371
3514	2	3	2396
3515	2	0	2335
3516	2	0	2397
3517	2	0	2398
3518	2	0	2399
3519	2	0	2400
3520	2	0	2403
3521	2	0	2401
3522	2	0	2402
3524	2	0	2336
3529	2	0	2337
3531	2	4	2338
3532	2	4	2339
4062	2	0	2331
4063	2	0	2332
4064	2	3	2358
4065	2	0	2333
4066	2	0	2359
4067	2	0	2360
4068	2	0	2361
4069	2	0	2362
4070	2	0	2363
4071	2	3	2370
4072	2	0	2334
4073	2	0	2371
4074	2	3	2396
4075	2	0	2335
4076	2	0	2397
4077	2	0	2398
4078	2	0	2399
4079	2	0	2400
4080	2	0	2403
4081	2	0	2401
4082	2	0	2402
4083	2	3	2422
4084	2	0	2336
4085	2	0	2423
4086	2	0	3636
4087	2	3	3637
4088	2	0	3638
4089	2	0	2337
4090	2	0	3639
4093	2	0	2338
4100	2	0	2339
4325	2	3	2329
4326	2	0	2330
4327	2	0	2331
4328	2	0	2332
4329	2	3	2358
4330	2	0	2333
4331	2	0	2359
4332	2	0	2360
4333	2	0	2361
4334	2	0	2362
4335	2	0	2363
4336	2	3	2370
4337	2	0	2334
4338	2	0	2371
4339	2	3	2396
4340	2	0	2335
4341	2	0	2397
4342	2	0	2398
4545	2	0	2399
4546	2	0	2400
4547	2	0	2403
4548	2	0	2401
4549	2	0	2402
4550	2	3	2422
4551	2	0	2336
4552	2	0	2423
4553	2	0	3636
4554	2	3	3637
4555	2	0	3638
4556	2	0	2337
4557	2	0	3639
4558	2	3	3664
4559	2	0	3665
4560	2	0	2338
4561	2	0	3666
4562	2	0	3667
4563	2	0	3668
4564	2	3	3669
4565	2	0	3670
4566	2	0	3671
4567	2	0	2339
10317	2	2	10104
10318	2	4	10105
6279	2	0	5678
6280	2	0	5679
10332	2	2	10104
10333	2	4	10105
10335	2	4	10109
5872	2	4	5663
5889	2	4	5663
5890	2	4	5667
5915	2	4	5663
5917	2	4	5667
5919	2	4	5677
5920	2	4	5678
5921	2	4	5679
6791	2	2	6577
6792	2	4	6578
6793	2	0	6579
10306	18	2	10104
10307	18	4	10105
1417	57	2	1215
1434	49	3	1232
1435	49	0	1233
1436	49	0	1234
1437	49	0	1235
1438	49	0	1236
1439	49	0	1237
1440	49	0	1238
2037	49	3	1267
1441	50	0	1239
2039	49	0	1268
2040	49	3	1269
2041	49	0	1270
2042	49	0	1271
2043	49	0	1272
2044	49	0	1273
2045	49	0	1274
2046	49	0	1275
2061	46	3	1290
2062	46	0	1291
2063	46	0	1292
2064	46	0	1293
2065	46	0	1294
2066	46	0	1295
2067	46	0	1296
2146	37	4	2329
2147	37	4	2330
2148	37	4	2331
2149	37	4	2332
2212	37	4	2358
2150	37	4	2333
2214	37	4	2359
2215	37	4	2360
2216	37	4	2361
2217	37	4	2362
2218	37	4	2363
2596	37	4	2370
2151	37	4	2334
2598	37	4	2371
3179	38	2	2396
2152	37	4	2335
3181	37	0	2397
3182	37	0	2398
3183	37	0	2399
3184	37	0	2400
3187	37	0	2403
3185	37	0	2401
3186	37	0	2402
3523	38	2	2422
2153	37	4	2336
3525	37	0	2423
3526	37	0	3636
3527	38	2	3637
3528	37	0	3638
2154	37	4	2337
3530	37	0	3639
4091	38	2	3664
4092	37	0	3665
2155	37	4	2338
4094	37	0	3666
4095	37	0	3667
4096	37	0	3668
4097	38	2	3669
4098	37	0	3670
5891	20	3	5677
5892	20	0	5678
5893	20	0	5679
6284	16	4	5691
4099	37	0	3671
2156	37	4	2339
22225	6	3	22023
22226	6	0	22024
22235	4	3	22032
22236	4	0	22033
22237	4	0	22034
30810	2	3	30608
30811	2	0	30609
6290	51	2	5697
6291	46	0	5698
6771	43	0	6569
10334	18	4	10113
10319	18	4	10109
6779	39	3	6577
6780	39	0	6578
6781	38	0	6579
6800	33	3	6586
6801	33	0	6587
6802	32	0	6588
14851	7	3	14649
6772	41	0	6570
14852	7	0	14650
5865	19	4	5663
5916	19	4	5686
5873	19	4	5667
5918	19	4	5687
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
24342	12727
7676	7273
24344	7273
10812	7275
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario, enddate, durationinlastday, startdate, durationstartinfirstday) FROM stdin;
24443	4	24342	707	2010-11-12	21600	2010-11-11	14400
7777	19	7676	707	2010-11-11	14400	\N	\N
24445	3	24344	707	2010-10-26	18000	2010-10-25	0
11515	8	10812	707	2010-11-20	0	\N	\N
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
\.


--
-- Data for Name: sumchargedhours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY sumchargedhours (id, version, directchargedhours, indirectchargedhours) FROM stdin;
1333	2	0	0
1334	2	0	0
1335	2	0	0
1336	2	0	0
1337	2	0	0
1338	2	0	0
1339	2	0	0
1340	2	0	0
1365	2	0	0
1366	2	0	0
1367	2	0	0
1368	2	0	0
1369	2	0	0
1370	2	0	0
1371	2	0	0
1372	2	0	0
5788	2	0	0
5789	2	0	0
5790	2	0	0
5791	2	0	0
5792	2	0	0
2251	2	0	0
1960	2	0	0
1961	2	0	0
1962	2	0	0
1963	2	0	0
1964	2	0	0
2252	2	0	0
2253	2	0	0
2254	2	0	0
2255	2	0	0
2256	2	0	0
2257	2	0	0
1965	2	0	0
1966	2	0	0
1988	2	0	0
1989	2	0	0
1990	2	0	0
1991	2	0	0
1992	2	0	0
1993	2	0	0
1994	2	0	0
2309	2	0	0
2310	2	0	0
2247	2	0	0
2248	2	0	0
2249	2	0	0
2250	2	0	0
2311	2	0	0
2312	2	0	0
2313	2	0	0
2314	2	0	0
2315	2	0	0
2316	2	0	0
2317	2	0	0
2318	2	0	0
2319	2	0	0
2320	2	0	0
2321	2	0	0
2322	2	0	0
2626	2	0	0
2627	2	0	0
2628	2	0	0
2686	2	0	0
2687	2	0	0
2688	2	0	0
2689	2	0	0
2690	2	0	0
2691	2	0	0
2692	2	0	0
2693	2	0	0
2694	2	0	0
2695	2	0	0
2696	2	0	0
2697	2	0	0
2698	2	0	0
2699	2	0	0
2700	2	0	0
2701	2	0	0
2702	2	0	0
2703	2	0	0
2704	2	0	0
3064	2	0	0
3065	2	0	0
3066	2	0	0
2863	2	0	0
2864	2	0	0
2865	2	0	0
2866	2	0	0
2867	2	0	0
2868	2	0	0
2869	2	0	0
2870	2	0	0
2871	2	0	0
2872	2	0	0
2873	2	0	0
2874	2	0	0
2875	2	0	0
2876	2	0	0
2877	2	0	0
2878	2	0	0
2879	2	0	0
2880	2	0	0
2881	2	0	0
3067	2	0	0
3068	2	0	0
3069	2	0	0
3070	2	0	0
3071	2	0	0
3072	2	0	0
3073	2	0	0
3074	2	0	0
3075	2	0	0
3076	2	0	0
3077	2	0	0
3078	2	0	0
3079	2	0	0
3080	2	0	0
3081	2	0	0
3082	2	0	0
3083	2	0	0
3084	2	0	0
3085	2	0	0
3086	2	0	0
3087	2	0	0
3088	2	0	0
3089	2	0	0
3090	2	0	0
3374	2	0	0
3375	2	0	0
3376	2	0	0
3377	2	0	0
3378	2	0	0
3379	2	0	0
3380	2	0	0
3381	2	0	0
3382	2	0	0
5842	2	0	0
5843	2	0	0
5844	2	0	0
5845	2	0	0
5846	2	0	0
3383	2	0	0
3384	2	0	0
3385	2	0	0
3386	2	0	0
3387	2	0	0
3388	2	0	0
3389	2	0	0
3390	2	0	0
3391	2	0	0
3392	2	0	0
3393	2	0	0
3394	2	0	0
3395	2	0	0
3396	2	0	0
3397	2	0	0
3398	2	0	0
3399	2	0	0
3400	2	0	0
4161	2	0	0
4162	2	0	0
4163	2	0	0
4164	2	0	0
4165	2	0	0
4166	2	0	0
4167	2	0	0
4168	2	0	0
4169	2	0	0
4170	2	0	0
4171	2	0	0
4172	2	0	0
4173	2	0	0
4174	2	0	0
4175	2	0	0
4176	2	0	0
4177	2	0	0
4178	2	0	0
4179	2	0	0
3601	2	0	0
3602	2	0	0
3603	2	0	0
3604	2	0	0
3605	2	0	0
3606	2	0	0
3607	2	0	0
3608	2	0	0
3609	2	0	0
3610	2	0	0
3611	2	0	0
3612	2	0	0
3613	2	0	0
3614	2	0	0
3615	2	0	0
3616	2	0	0
3617	2	0	0
3618	2	0	0
3619	2	0	0
3620	2	0	0
3621	2	0	0
3622	2	0	0
3623	2	0	0
3624	2	0	0
3625	2	0	0
3626	2	0	0
3627	2	0	0
3628	2	0	0
3629	2	0	0
3630	2	0	0
3631	2	0	0
3632	2	0	0
3633	2	0	0
4180	2	0	0
4181	2	0	0
4182	2	0	0
4183	2	0	0
4184	2	0	0
4185	2	0	0
4186	2	0	0
4187	2	0	0
4188	2	0	0
4189	2	0	0
4190	2	0	0
4191	2	0	0
4192	2	0	0
4193	2	0	0
4194	2	0	0
4195	2	0	0
4196	2	0	0
4197	2	0	0
4198	2	0	0
4199	2	0	0
4200	2	0	0
4201	2	0	0
5764	2	0	0
6680	2	0	0
5847	2	0	0
5848	2	0	0
5771	2	0	0
5772	2	0	0
6678	2	0	0
6679	2	0	0
5814	2	0	0
5815	2	0	0
5816	2	0	0
5817	2	0	0
5818	2	0	0
5819	2	0	0
5820	2	0	0
10205	2	0	0
10206	2	0	0
10216	2	0	0
10217	2	0	0
10218	2	0	0
6691	38	0	0
6692	38	0	0
6699	31	0	0
6700	31	0	0
6701	31	0	0
14750	7	0	0
6671	41	0	0
14751	7	0	0
6391	46	0	0
6392	46	0	0
10231	18	0	0
6670	41	0	0
10232	18	0	0
10233	18	0	0
10234	18	0	0
6690	38	0	0
22124	6	0	0
22125	6	0	0
22134	4	0	0
22135	4	0	0
22136	4	0	0
1316	53	0	1000
1929	49	0	0
1930	49	0	0
1931	49	0	0
1932	49	0	0
1933	49	0	0
1934	49	0	0
1935	49	0	0
1936	49	0	0
1937	49	0	0
1938	49	0	0
1939	49	0	0
1940	49	0	0
1941	49	0	0
1942	49	0	0
1943	49	0	0
1944	49	0	0
1945	49	0	0
2016	46	0	0
2017	46	0	0
2018	46	0	0
2019	46	0	0
2222	46	0	0
2223	46	0	0
2224	46	0	0
4426	37	0	0
4427	37	0	0
4428	37	0	0
4429	37	0	0
4430	37	0	0
4431	37	0	0
4432	37	0	0
4433	37	0	0
4434	37	0	0
4435	37	0	0
4436	37	0	0
4437	37	0	0
4438	37	0	0
4439	37	0	0
4440	38	0	1000
4441	37	0	0
4442	37	0	0
4443	37	0	0
4646	37	0	0
4647	37	0	0
4648	38	1000	0
4649	37	0	0
4650	37	0	0
4651	37	0	0
4652	37	0	0
4653	37	0	0
4654	37	0	0
4655	37	0	0
4656	37	0	0
4657	37	0	0
4658	37	0	0
4659	37	0	0
4660	37	0	0
4661	37	0	0
4662	37	0	0
4663	37	0	0
4664	37	0	0
6375	19	0	0
6376	19	0	0
6377	19	0	0
6378	19	0	0
6379	19	0	0
6380	19	0	0
6381	19	0	0
6385	16	0	0
4665	37	0	0
4666	37	0	0
4667	37	0	0
4668	37	0	0
30709	2	0	0
30710	2	0	0
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority, workable_days) FROM stdin;
1826	1	0	\N	\N	\N	\N
1844	1	0	\N	\N	\N	\N
1845	1	0	\N	\N	\N	\N
1846	1	0	\N	\N	\N	\N
1847	1	0	\N	\N	\N	\N
1848	1	0	\N	\N	\N	\N
1818	1	0	\N	\N	\N	\N
1819	1	0	\N	\N	\N	\N
1820	1	0	\N	\N	\N	\N
1821	1	0	\N	\N	\N	\N
1822	1	0	\N	\N	\N	\N
1823	1	0	\N	\N	\N	\N
1849	1	0	\N	\N	\N	\N
6167	1	0	\N	\N	\N	\N
6161	1	0	\N	\N	\N	\N
6162	1	0	\N	\N	\N	\N
6164	1	0	\N	\N	\N	\N
6165	1	0	\N	\N	\N	\N
1858	1	0	\N	\N	\N	\N
1859	1	0	\N	\N	\N	\N
1860	1	0	\N	\N	\N	\N
1862	1	0	\N	\N	\N	\N
1863	1	0	\N	\N	\N	\N
1864	1	0	\N	\N	\N	\N
1865	1	0	\N	\N	\N	\N
1866	1	0	\N	\N	\N	\N
1867	1	0	\N	\N	\N	\N
1869	1	0	\N	\N	\N	\N
1870	1	0	\N	\N	\N	\N
1872	1	0	\N	\N	\N	\N
1873	1	0	\N	\N	\N	\N
1874	1	0	\N	\N	\N	\N
1875	1	0	\N	\N	\N	\N
1876	1	0	\N	\N	\N	\N
1879	1	0	\N	\N	\N	\N
1877	1	0	\N	\N	\N	\N
1878	1	0	\N	\N	\N	\N
1881	1	0	\N	\N	\N	\N
1882	1	0	\N	\N	\N	\N
1883	1	0	\N	\N	\N	\N
1885	1	0	\N	\N	\N	\N
1886	1	0	\N	\N	\N	\N
1887	1	0	\N	\N	\N	\N
1889	1	0	\N	\N	\N	\N
1890	1	0	\N	\N	\N	\N
1891	1	0	\N	\N	\N	\N
1892	1	0	\N	\N	\N	\N
1893	1	0	\N	\N	\N	\N
1895	1	0	\N	\N	\N	\N
1896	1	0	\N	\N	\N	\N
1897	1	0	\N	\N	\N	\N
7072	1	0	\N	\N	\N	\N
7080	1	0	\N	\N	\N	\N
7081	1	0	\N	\N	\N	\N
7077	1	1	2010-10-28	\N	\N	\N
7074	1	1	2010-11-01	\N	\N	\N
4963	1	0	\N	\N	\N	\N
4964	1	0	\N	\N	\N	\N
4965	1	0	\N	\N	\N	\N
4966	1	0	\N	\N	\N	\N
4960	1	0	\N	\N	\N	\N
4961	1	0	\N	\N	\N	\N
1851	1	0	\N	\N	\N	\N
4968	1	0	\N	\N	\N	\N
4969	1	0	\N	\N	\N	\N
4949	1	0	\N	\N	\N	\N
4950	1	0	\N	\N	\N	\N
4951	1	0	\N	\N	\N	\N
4952	1	0	\N	\N	\N	\N
4953	1	0	\N	\N	\N	\N
4954	1	0	\N	\N	\N	\N
4955	1	0	\N	\N	\N	\N
4957	1	0	\N	\N	\N	\N
4958	1	0	\N	\N	\N	\N
6168	1	0	\N	\N	\N	\N
1852	1	0	\N	\N	\N	\N
1853	1	0	\N	\N	\N	\N
1854	1	0	\N	\N	\N	\N
1855	1	0	\N	\N	\N	\N
1856	1	0	\N	\N	\N	\N
1829	1	0	\N	\N	\N	\N
1830	1	0	\N	\N	\N	\N
1831	1	0	\N	\N	\N	\N
1832	1	0	\N	\N	\N	\N
1833	1	0	\N	\N	\N	\N
1834	1	0	\N	\N	\N	\N
1843	1	0	\N	\N	\N	\N
1827	1	0	\N	\N	\N	\N
1836	1	0	\N	\N	\N	\N
1837	1	0	\N	\N	\N	\N
1838	1	0	\N	\N	\N	\N
1839	1	0	\N	\N	\N	\N
1840	1	0	\N	\N	\N	\N
1841	1	0	\N	\N	\N	\N
22624	1	2	2010-11-23	\N	\N	\N
22626	1	0	\N	\N	\N	\N
22627	1	0	\N	\N	\N	\N
31209	1	0	\N	\N	\N	\N
7071	1	0	\N	\N	\N	\N
15150	1	0	\N	\N	\N	\N
6171	1	0	\N	\N	\N	\N
7076	1	1	2010-10-25	\N	\N	\N
6169	1	1	2010-11-21	\N	\N	\N
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
7072	6879
1818	1630
1819	1631
1820	1632
1821	1633
1822	1634
1823	1635
1826	1636
1858	1703
1859	1704
1860	1705
1862	1706
1863	2435
1864	2436
1865	2437
1866	2438
1867	2439
1869	1707
1870	2443
1872	1708
1873	2465
1874	2466
1875	2467
1876	2468
1879	2471
1877	2469
1878	2470
1881	1709
1882	2484
1883	2485
1885	2486
1886	1710
1887	2487
1889	2506
1890	1711
1891	2507
1892	2508
1893	2509
1895	2510
1896	2511
1897	1712
1844	1677
1845	1678
1846	1679
1847	1680
1848	1681
1849	1682
6161	5970
6162	5982
6164	5977
6165	5978
6167	5966
6171	5989
7076	6872
7071	6873
7077	6878
1836	1630
1837	1631
1838	1632
1839	1633
1840	1634
1841	1635
1843	1636
1827	1658
1829	1659
1830	1660
1831	1661
1832	1662
1833	1663
1834	1664
1851	1677
1852	1678
1853	1679
1854	1680
1855	1681
1856	1682
4949	2465
4950	2466
4951	2467
4952	2468
4953	2471
4954	2469
4955	2470
4957	2484
4958	2485
4960	2486
4961	2487
4963	2506
4964	2507
4965	2508
4966	2509
4968	2510
4969	2511
6168	5977
6169	5978
7074	6879
7080	6884
7081	6885
15150	14950
22624	22424
22626	22429
22627	22430
31209	31009
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, startdayduration, enddate, enddayduration, deadline, advance_percentage, sumofhoursallocated, parent, base_calendar_id, positioninparent) FROM stdin;
1818	4	Planificación semanal	\N	2010-10-25	0	2010-10-28	21600	\N	0.0000	0	1824	\N	0
1819	4	Informes semanales	\N	2010-10-25	0	2010-10-28	21600	\N	0.0000	0	1824	\N	1
1820	4	Comunicaciones internas y externas	\N	2010-10-25	0	2010-10-29	10800	\N	0.0000	0	1824	\N	2
1821	4	Reuniones de coordinación	\N	2010-10-25	0	2010-10-29	10800	\N	0.0000	0	1824	\N	3
1822	4	Control de calidad	\N	2010-10-25	0	2010-10-26	25200	\N	0.0000	0	1824	\N	4
1823	4	Seguimiento	\N	2010-10-25	0	2010-10-26	25200	\N	0.0000	0	1824	\N	5
1881	10	Adaptación del software de los nodos al protocolo de Zabbix	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1884	\N	0
1882	10	Consulta de la configuración al servidor	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1884	\N	1
1883	10	Interfaz para permitir la modificación de la configuración remotamente	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1884	\N	2
1826	2	Especificación de requisitos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	\N	\N	\N
1824	6	Coordinación	\N	2010-10-25	0	2010-10-29	0	\N	0.0000	0	\N	\N	\N
1844	4	Gestión de nodos	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1850	\N	0
1845	4	Gestión de redes (o grupos) de nodos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1850	\N	1
1846	4	Configuración de nodos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1850	\N	2
1847	4	Gestión de sensores	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1850	\N	3
1848	4	Configuración de offset y escalado por sensor	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1850	\N	4
1849	4	Exportación de configuración de un nodo	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1850	\N	5
1850	6	Módulo de nodos y sensores	\N	2010-11-01	0	2010-11-03	0	\N	0.0000	0	\N	\N	\N
1884	12	Módulo de software de nodos	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	\N	\N	\N
6161	4	elem (copy)	\N	2010-11-01	0	2010-11-14	14400	\N	0.0000	0	6163	\N	0
6162	4	jkljlkljkl	\N	2010-11-14	14400	2010-11-27	0	\N	0.0000	0	6163	\N	1
6164	4	klhjuiohjihjhllhjl	\N	2010-11-01	0	2010-11-26	0	\N	0.0000	0	6166	\N	0
6165	4	sxezaseswe	\N	2010-11-26	0	2010-12-26	3600	\N	0.0000	0	6166	\N	1
6163	5	elem	\N	2010-11-01	0	2010-11-27	0	\N	0.0000	0	\N	\N	\N
6166	5	dxrxsdrsdxresxuiui	\N	2010-11-01	0	2010-12-26	3600	\N	0.0000	0	\N	\N	\N
1862	13	Importación de datos enviados por los nodos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1868	\N	0
1863	13	Almacenamiento de datos en una base de datos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	1
1864	13	Paso de datos a histórico	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1868	\N	2
1865	13	Configuración tiempo de vida de los datos recientes	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	3
1872	12	Cálculo y mostrado de estadísticas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1880	\N	0
1873	12	Cálculo del valor real basado en offset y escalado	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1880	\N	1
1874	12	Generación de gráficas para una o varias variables en el tiempo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1880	\N	2
1875	12	Generación de gráficas variables de distinto tipo	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1880	\N	3
1876	12	Generación de gráficas de variables cruzadas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	4
1879	12	Generar informes en HTML y PDF	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	5
31210	1	pedido 7	\N	2010-11-18	0	2010-11-30	0	\N	0.0000	0	\N	\N	\N
31209	1	elem 1	\N	2010-11-18	0	2010-11-30	14400	\N	0.0000	0	31210	\N	0
7071	48	elem 2 (copy)	\N	2010-11-11	14400	2010-11-12	21600	\N	0.0000	10	15151	\N	0
6171	47	elem 1	\N	2010-10-25	0	2010-11-11	14400	\N	0.4000	100	6172	\N	0
7082	36	elem c2	\N	2010-11-16	0	2010-12-10	21600	\N	0.0000	150	6172	\N	4
7080	29	c1.1	\N	2010-11-16	0	2010-11-24	7200	\N	0.0000	50	7082	\N	0
7081	30	elem c2 (copy)	\N	2010-11-24	7200	2010-12-10	21600	\N	0.0000	100	7082	\N	1
1877	12	Exportación de datos a diversos formatos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1880	\N	6
1878	12	Mostrado de datos sobre el mapa	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1880	\N	7
1895	9	Documentación de usuario	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1898	\N	0
1896	9	Documentación de administrador de red	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1898	\N	1
1897	9	Documentación de administrador de sistema	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1898	\N	2
7072	5	elem grande (copy)	\N	2010-11-08	39600	2010-11-10	18000	\N	0.0000	0	7073	\N	0
7073	5	elem grande	\N	2010-11-08	39600	2010-11-10	18000	\N	0.0000	0	\N	\N	\N
6167	3	hola	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	\N	\N	\N
1858	13	Monitorización bajo demanda	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1861	\N	0
1859	13	Localización nodos en un mapa	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1861	\N	1
7077	35	elem 3.1	\N	2010-10-28	0	2010-10-29	7200	\N	0.0000	10	7075	\N	0
6172	68	pedido 5	\N	2010-10-25	0	2010-12-10	0	\N	0.1136	285	\N	\N	\N
4962	43	Pruebas	\N	2010-11-03	14400	2010-11-08	43200	\N	0.0000	0	1825	\N	6
1860	13	Configuración de los mapas y la geolocalización de los sensores	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1861	\N	2
1866	13	Gestión de datos históricos	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	4
1867	13	Detección de falta de recursos de almacenamiento	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1868	\N	5
1885	10	Pruebas funcionales del sistema	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	0
1886	10	Pruebas de aceptación	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	1
1887	10	Corrección de bugs	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1888	\N	2
1889	9	Montaje de entorno de desarrollo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1894	\N	0
1890	9	Instalacion y configuración del servidor central con Zabbix	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1894	\N	1
1891	9	Puesta en producción	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1894	\N	2
1892	9	Soporte de localización (idiomas)	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	1894	\N	3
1893	9	Redacción del plan de escalabilidad	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1894	\N	4
1839	49	Reuniones de coordinación	\N	2010-11-11	54000	2010-11-16	36000	\N	0.0000	0	1842	\N	3
1840	49	Control de calidad	\N	2010-11-16	36000	2010-11-18	32400	\N	0.0000	0	1842	\N	4
1841	49	Seguimiento	\N	2010-11-18	32400	2010-11-20	28800	\N	0.0000	0	1842	\N	5
15151	6	elem 2	\N	2010-11-11	14400	2010-11-14	28800	\N	0.0000	10	6172	\N	2
15150	6	elem hijo	\N	2010-11-12	21600	2010-11-14	28800	\N	0.0000	0	15151	\N	1
11716	15	elem 1	\N	2010-10-25	0	2010-10-26	18000	\N	0.0000	5	6172	\N	1
7076	38	elem 1 (copy)	\N	2010-10-25	0	2010-10-26	18000	\N	0.0000	5	11716	\N	0
7075	49	elem grande	\N	2010-10-28	0	2010-11-16	0	\N	0.0000	20	6172	\N	3
7074	39	elem grande (copy)	\N	2010-11-12	21600	2010-11-16	0	\N	0.0000	10	7075	\N	1
10605	9	elem 1	\N	2010-10-25	0	2010-10-25	18000	\N	0.0000	0	\N	\N	\N
1869	13	Gestión de alarmas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	1871	\N	0
1870	13	Envío de notificaciones por email y SMS	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1871	\N	1
1898	10	Documentación	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	\N	\N	\N
1861	18	Módulo de monitorización	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1868	18	Módulo de gestión de datos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1871	18	Módulo de alarmas	\N	2010-11-01	0	2010-11-04	3600	\N	0.0000	0	\N	\N	\N
1880	16	Módulo de consulta de datos	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	\N	\N	\N
1888	12	Pruebas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	\N	\N	\N
1894	10	Entorno e intraestrutura	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	\N	\N	\N
6168	18	klhjuiohjihjhllhjl	\N	2010-11-02	25200	2010-12-07	1764	\N	0.2000	400	6170	\N	0
1834	49	Asignación de permisos a grupos de usuarios	\N	2010-12-06	25200	2010-12-10	7200	\N	0.0000	0	1835	\N	5
1828	75	Análisis	\N	2010-11-01	0	2010-11-20	0	\N	0.0000	110	1825	\N	1
1843	47	Especificación de requisitos	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	1828	\N	0
1827	51	Análisis funcional	\N	2010-11-02	7200	2010-11-20	0	\N	0.0000	110	1828	\N	1
1842	73	Coordinación	\N	2010-11-01	0	2010-11-20	28800	\N	0.0000	0	1825	\N	0
1836	47	Planificación semanal	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1842	\N	0
1837	48	Informes semanales	\N	2010-11-04	21600	2010-11-07	43200	\N	0.0000	0	1842	\N	1
1838	49	Comunicaciones internas y externas	\N	2010-11-07	43200	2010-11-11	54000	\N	0.0000	0	1842	\N	2
22624	5	elem 1	\N	2010-11-23	0	2010-12-09	14400	\N	0.0000	100	22625	\N	0
22626	3	elem 2 (copy)	\N	2010-11-16	0	2010-11-28	14400	\N	0.0000	0	22628	\N	0
4965	29	Soporte de localización (idiomas)	\N	2010-11-01	0	2010-11-01	18000	\N	0.0000	0	4967	\N	2
4966	29	Redacción del plan de escalabilidad	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	4967	\N	3
4960	29	Pruebas funcionales del sistema	\N	2010-11-03	14400	2010-11-05	28800	\N	0.0000	0	4962	\N	0
4961	29	Corrección de bugs	\N	2010-11-05	28800	2010-11-08	43200	\N	0.0000	0	4962	\N	1
1902	34	Fase II	\N	2010-11-05	0	2010-11-05	0	\N	0.0000	0	1825	\N	10
1901	34	Fase I	\N	2010-11-01	0	2010-11-01	0	2010-12-01	0.0000	0	1825	\N	9
1857	67	Módulo de nodos y sensores	\N	2010-11-01	0	2010-11-07	36000	\N	0.0000	0	1825	\N	3
1851	44	Gestión de nodos	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	1857	\N	0
1852	44	Gestión de redes (o grupos) de nodos	\N	2010-11-02	25200	2010-11-03	14400	\N	0.0000	0	1857	\N	1
1853	44	Configuración de nodos	\N	2010-11-03	14400	2010-11-04	21600	\N	0.0000	0	1857	\N	2
1854	44	Gestión de sensores	\N	2010-11-04	21600	2010-11-06	18000	\N	0.0000	0	1857	\N	3
1855	44	Configuración de offset y escalado por sensor	\N	2010-11-06	18000	2010-11-07	36000	\N	0.0000	0	1857	\N	4
1856	44	Exportación de configuración de un nodo	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1857	\N	5
1835	75	Módulo de usuarios y permisos	\N	2010-11-20	0	2010-12-10	7200	\N	0.0000	0	1825	\N	2
1829	49	Gestión de usuarios	\N	2010-11-20	0	2010-11-21	18000	\N	0.0000	0	1835	\N	0
1830	51	Gestión de permisos	\N	2010-11-21	18000	2010-11-24	28800	\N	0.0000	0	1835	\N	1
1831	51	Asignación de permisos a usuarios	\N	2010-11-24	28800	2010-11-30	7200	\N	0.0000	0	1835	\N	2
1832	50	Autenticación de usuarios	\N	2010-11-30	7200	2010-12-02	21600	\N	0.0000	0	1835	\N	3
1833	50	Gestión de grupos de usuarios	\N	2010-12-02	21600	2010-12-06	25200	\N	0.0000	0	1835	\N	4
22627	4	elem 3	\N	2010-11-16	0	2010-11-16	10800	\N	0.0000	0	22628	\N	1
22628	4	elem 2	\N	2010-11-16	0	2010-11-28	0	\N	0.0000	0	22625	\N	1
22625	7	Pedido 6	\N	2010-11-16	0	2010-12-09	0	\N	0.0000	100	\N	\N	\N
4970	43	Documentación	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	15	1825	\N	8
4968	29	Documentación de usuario	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	15	4970	\N	0
4969	29	Documentación de administrador de red	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4970	\N	1
4956	43	Módulo de consulta de datos	\N	2010-11-01	0	2010-11-05	28800	\N	0.0000	0	1825	\N	4
4949	29	Cálculo del valor real basado en offset y escalado	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	4956	\N	0
4950	29	Generación de gráficas para una o varias variables en el tiempo	\N	2010-11-02	25200	2010-11-04	3600	\N	0.0000	0	4956	\N	1
4951	29	Generación de gráficas variables de distinto tipo	\N	2010-11-01	0	2010-11-02	25200	\N	0.0000	0	4956	\N	2
4952	29	Generación de gráficas de variables cruzadas	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4956	\N	3
4953	29	Generar informes en HTML y PDF	\N	2010-11-03	14400	2010-11-05	28800	\N	0.0000	0	4956	\N	4
4954	29	Exportación de datos a diversos formatos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4956	\N	5
4955	29	Mostrado de datos sobre el mapa	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	4956	\N	6
4959	43	Módulo de software de nodos	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	1825	\N	5
4957	29	Consulta de la configuración al servidor	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4959	\N	0
4958	29	Interfaz para permitir la modificación de la configuración remotamente	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4959	\N	1
6170	20	dxrxsdrsdxresxuiui	\N	2010-11-02	25200	2011-01-17	35731	\N	0.0923	866	1825	\N	11
6169	18	sxezaseswe	\N	2010-12-07	1764	2011-01-17	35731	\N	0.0000	466	6170	\N	1
4967	43	Entorno e intraestrutura	\N	2010-11-01	0	2010-11-04	21600	\N	0.0000	0	1825	\N	7
4963	29	Montaje de entorno de desarrollo	\N	2010-11-01	0	2010-11-02	7200	\N	0.0000	0	4967	\N	0
4964	29	Puesta en producción	\N	2010-11-01	0	2010-11-03	14400	\N	0.0000	0	4967	\N	1
1825	79	Servidor sens2net	\N	2010-11-01	0	2011-01-17	0	\N	0.0251	991	\N	\N	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
1824
1825
1828
1835
1842
1850
1857
1861
1868
1871
1880
1884
1888
1894
1898
4956
4959
4962
4967
4970
6163
6166
6170
6172
7073
7075
7082
10605
11716
15151
22625
22628
31210
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id, startconstrainttype, constraintdate) FROM stdin;
1902	2	\\254\\355\\000\\005sr\\000\\027org.joda.time.LocalDate\\377\\377\\370\\004\\323\\344\\353\\265\\002\\000\\002J\\000\\014iLocalMillisL\\000\\013iChronologyt\\000\\032Lorg/joda/time/Chronology;xp\\000\\000\\001,\\031U(\\000sr\\000'org.joda.time.chrono.ISOChronology$Stub\\251\\310\\021fq7P'\\003\\000\\000xpsr\\000\\037org.joda.time.DateTimeZone$Stub\\246/\\001\\232|2\\032\\343\\003\\000\\000xpw\\005\\000\\003UTCxx
1901	0	\N
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
1824	3	2030
1818	5	2031
1819	5	2032
1820	5	2033
1821	5	2034
1822	5	2035
1823	5	2036
1826	1	2038
1850	3	2117
1844	5	2118
1845	5	2119
1846	5	2120
1847	5	2121
1848	5	2122
1849	5	2123
1861	6	4325
1868	6	4329
1871	6	4336
1880	5	4339
1894	2	4558
1898	2	4564
1858	11	4326
1859	11	4327
1860	11	4328
1862	11	4330
1863	11	4331
1864	11	4332
1865	11	4333
1866	11	4334
1867	11	4335
1869	11	4337
1889	3	4559
1890	3	4560
1891	3	4561
1892	3	4562
1893	3	4563
1895	3	4565
1884	3	4550
1888	3	4554
1870	11	4338
1872	9	4340
1873	9	4341
1874	9	4342
1875	9	4545
1876	9	4546
1879	9	4547
1877	9	4548
1878	9	4549
1881	5	4551
1882	5	4552
1883	5	4553
1885	5	4555
1886	5	4556
1887	5	4557
1896	3	4566
1897	3	4567
7075	15	6779
1842	27	1434
1828	28	2037
1835	28	2040
1857	24	2061
4956	15	3179
6170	5	5891
1825	30	1417
1836	53	1435
1837	53	1436
1838	53	1437
1839	53	1438
1840	53	1439
1841	53	1440
1843	53	1441
1827	55	2039
1829	55	2041
1830	55	2042
1831	55	2043
1832	55	2044
1833	55	2045
1834	55	2046
1851	47	2062
1852	47	2063
1853	47	2064
1854	47	2065
1855	47	2066
1856	47	2067
4949	29	3181
4950	29	3182
4951	29	3183
6168	9	5892
6169	9	5893
11716	3	10306
7082	10	6800
6172	22	6290
6171	43	6291
7071	35	6772
7077	25	6780
7074	29	6781
7080	19	6801
10605	3	10332
7081	19	6802
15150	1	14852
15151	1	14851
4959	15	3523
4962	15	3527
6163	2	6275
6166	2	6278
4967	15	4091
4970	15	4097
4952	29	3184
4953	29	3187
4954	29	3185
4955	29	3186
4957	29	3525
4958	29	3526
4960	29	3528
4961	29	3530
4963	29	4092
4964	29	4094
6161	3	6276
6162	3	6277
6164	3	6279
6165	3	6280
6167	1	6274
4965	29	4095
4966	29	4096
4968	29	4098
4969	29	4099
7073	2	6791
7072	3	6793
7076	27	6771
22628	2	22235
22625	3	22225
31209	1	30811
31210	1	30810
22624	5	22226
22626	3	22236
22627	3	22237
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
15655	1	NM	255b3f1c-b81d-4972-84b7-ce31efe410d0	10.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
808	1	8a90af0d-fd48-4196-9d53-07497194d390	units	f
809	1	95907910-8fb0-404e-844c-201103ef04ea	kg	f
810	1	4ec967f0-cc68-47c8-ab57-e7bebcd36537	km	f
811	1	75dc3cba-5f0c-484f-8dec-0b831543cf4d	l	f
812	1	9976c916-2135-47a4-bf94-7dac85905422	m	f
813	1	b5e7e876-daf4-47f9-80a4-9230ae63ced3	m2	f
814	1	6ea8be91-8731-4e96-8336-c54b8674a769	m3	f
815	1	572d0957-e992-40f0-a73b-9d2ba239c6b1	tn	f
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
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_CREATE_ORDER
1112	ROLE_ADMINISTRATION
1112	ROLE_READ_ALL_ORDERS
1113	ROLE_WS_READER
1114	ROLE_WS_WRITER
1114	ROLE_WS_READER
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
15958	1	16bfbd99-9790-4b55-9a67-1226cb115ba3	\N	t	15756	\N	\N
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
15857	1	ae9678b6-7435-4128-bd85-287f7f53bf73	1000	2010-11-11 11:17:30.981	\N	\N	15958	7275	2403	15655
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
15756	1	report 1	code1	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
5051	Trabajador Limitante 	U1	8923434
12727	U2	last name	123
12729	U3	lastname	2
7275	Varon	Lopez	9234K
7273	Javier	Moran	898923423L
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
-- Name: effortperday_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT effortperday_pkey PRIMARY KEY (base_calendar_id, day_id);


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
-- Name: hoursgroup_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_code_key UNIQUE (code);


--
-- Name: hoursgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY hoursgroup
    ADD CONSTRAINT hoursgroup_pkey PRIMARY KEY (id);


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
-- Name: orderelement_sum_charged_hours_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT orderelement_sum_charged_hours_id_key UNIQUE (sum_charged_hours_id);


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
-- Name: sumchargedhours_pkey; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY sumchargedhours
    ADD CONSTRAINT sumchargedhours_pkey PRIMARY KEY (id);


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
-- Name: fkc405554bfd5e49bc; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY effortperday
    ADD CONSTRAINT fkc405554bfd5e49bc FOREIGN KEY (base_calendar_id) REFERENCES calendardata(id);


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
-- Name: fkdbbb4fee7ec17fa6; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderelement
    ADD CONSTRAINT fkdbbb4fee7ec17fa6 FOREIGN KEY (sum_charged_hours_id) REFERENCES sumchargedhours(id);


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

