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
    montecarlomethodtabvisible boolean NOT NULL
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
    startdate date,
    durationstartinfirstday integer,
    enddate date,
    durationinlastday integer
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
    startdate date,
    durationstartinfirstday integer,
    enddate date,
    durationinlastday integer
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
    workable_days integer,
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
6272	22	t	1011
6273	22	t	1011
6274	15	t	1010
6275	15	f	1011
6276	22	t	1011
6277	22	t	1011
6278	22	t	1011
6279	22	t	1011
6280	22	t	1011
6282	15	f	1011
6281	15	t	1010
6283	22	t	1011
6284	22	t	1011
6286	15	f	1011
6285	15	t	1010
6287	22	t	1011
6288	22	t	1011
6289	22	t	1011
6290	22	t	1011
6291	22	t	1011
6292	15	f	1011
6293	15	t	1010
6295	15	t	1010
6294	15	f	1011
6517	15	t	1010
6516	15	f	1011
6296	15	f	1011
6297	15	t	1010
85372	11	t	1011
85373	11	t	1011
85374	9	f	1011
85375	9	t	1010
85376	11	f	1011
6526	5	f	1011
6525	5	t	1010
85377	11	t	1013
34962	2	f	1013
6518	8	t	1013
6520	7	t	1011
6521	7	t	1011
6522	7	t	1011
6523	6	f	1011
6524	6	f	1010
34961	3	t	1013
85378	11	t	1011
85379	11	t	1011
88998	4	t	1011
6262	22	t	1011
6263	22	t	1011
6264	22	t	1011
6265	22	t	1011
6266	22	t	1011
6355	15	t	1010
6267	15	f	1011
6354	15	f	1011
6268	15	t	1010
6269	22	t	1011
6270	22	t	1011
6271	22	t	1011
85380	9	f	1011
85381	9	t	1010
85382	11	t	1011
85383	11	t	1011
85384	11	t	1011
85385	11	t	1011
85387	9	f	1011
85386	9	t	1010
85388	11	t	1011
85389	11	t	1011
85390	11	t	1011
85391	11	t	1011
85392	11	t	1011
85393	9	f	1011
85394	9	t	1010
85395	11	t	1011
85396	11	t	1011
85397	11	t	1011
85398	9	t	1010
85399	9	f	1011
85400	9	f	1011
85402	9	f	1013
85401	9	t	1010
88999	4	t	1011
89000	4	t	1011
89002	3	f	1011
89001	3	t	1010
85403	11	t	1011
85404	11	t	1011
85405	11	t	1011
85406	11	t	1011
85410	11	t	1011
85412	9	f	1013
85411	9	t	1010
85413	9	f	1011
6357	15	f	1011
85407	11	t	1011
85408	9	t	1010
85409	9	f	1011
6356	15	t	1010
6358	15	t	1010
6359	15	f	1011
6360	15	t	1010
6361	15	f	1011
6464	15	t	1010
6362	15	f	1011
6465	21	t	1011
6466	21	t	1011
6468	15	t	1010
6467	15	f	1011
6469	21	t	1011
6470	21	t	1011
34817	2	f	1013
6471	21	t	1011
6472	21	t	1011
6473	15	t	1010
6474	15	f	1011
6476	15	t	1010
34815	4	t	1013
6475	15	f	1011
34816	3	f	1013
6477	21	t	1011
6478	21	t	1011
6479	21	t	1011
6480	21	t	1011
6481	15	t	1010
6482	15	f	1011
6483	22	f	1011
34963	4	t	1013
6484	21	t	1011
6485	21	t	1011
6487	15	t	1010
6486	15	f	1011
6488	21	t	1011
6489	21	t	1011
6490	21	t	1011
6491	21	t	1011
6492	15	t	1010
6493	15	f	1011
6494	21	t	1011
6495	21	t	1011
6496	21	t	1011
6497	21	t	1011
6498	21	t	1011
6500	15	f	1011
6499	15	t	1010
6501	21	t	1011
6502	21	t	1011
6503	21	t	1011
6504	15	f	1011
6505	15	t	1010
34964	3	f	1013
6506	15	t	1010
6507	15	f	1011
6508	21	t	1011
6509	21	t	1011
6510	21	t	1011
6511	21	t	1011
6512	21	t	1011
6513	15	f	1011
6514	15	t	1010
89021	7	t	1011
6515	21	t	1011
34965	3	f	1013
89022	7	t	1011
89023	7	t	1011
89024	7	t	1011
89025	7	t	1011
89027	5	t	1010
89026	5	f	1011
89029	5	t	1010
89028	5	f	1011
85354	11	t	1011
85355	11	t	1011
84922	11	t	1011
84923	11	t	1011
84924	11	t	1011
85357	9	t	1010
85356	9	f	1011
84925	11	t	1011
84926	11	t	1011
84928	9	f	1011
84927	9	t	1010
84929	11	t	1011
85358	11	t	1011
85359	11	t	1011
84930	11	t	1011
84931	11	t	1011
84932	11	t	1011
84933	11	t	1011
84935	9	f	1011
85360	9	t	1010
85361	9	f	1011
84934	9	t	1010
84936	11	t	1011
85362	11	t	1011
84937	11	t	1011
84938	11	t	1011
85363	11	t	1011
85364	11	t	1011
84939	11	t	1011
84940	11	t	1011
85365	11	t	1011
85367	9	t	1010
85345	9	f	1011
85346	9	t	1010
85347	11	t	1011
85348	11	t	1011
85366	9	f	1011
85368	9	f	1011
85369	9	t	1010
85370	11	t	1011
85350	9	t	1010
85349	9	f	1011
85371	11	t	1011
85351	11	t	1011
85352	11	t	1011
85353	11	t	1011
88506	5	t	1011
88507	5	t	1011
88508	5	t	1011
88509	5	t	1011
88510	5	t	1011
88512	4	t	1010
88511	4	f	1011
88513	5	t	1011
88514	5	t	1011
88515	5	t	1011
88516	5	t	1011
88517	5	t	1011
88518	4	f	1011
88519	4	t	1010
88520	5	t	1011
88521	5	t	1011
88522	5	t	1011
88523	5	t	1011
88524	5	t	1011
88526	4	t	1010
88525	4	f	1011
88527	5	t	1011
88528	5	t	1011
88530	4	f	1011
88529	4	t	1010
88531	5	t	1011
88532	5	t	1011
88533	5	t	1011
88534	5	t	1011
88535	5	t	1011
88536	4	f	1011
88537	4	t	1010
88538	5	t	1011
88539	5	t	1011
88541	4	f	1011
88540	4	t	1010
88542	5	t	1011
88543	5	t	1011
88544	5	t	1011
88545	5	t	1011
88546	4	t	1010
88547	4	f	1011
88548	4	f	1011
88549	4	t	1010
88550	5	t	1011
88551	5	t	1011
88552	5	t	1011
88553	5	t	1011
88555	4	f	1011
88554	4	t	1010
88557	5	t	1013
88556	5	f	1011
88558	5	t	1011
88559	5	t	1011
88560	4	f	1011
88561	4	t	1010
88562	5	t	1011
88563	5	t	1011
88564	5	t	1011
88565	5	t	1011
88566	4	f	1011
88567	4	t	1010
88568	5	t	1011
88569	5	t	1011
88570	5	t	1011
88571	5	t	1011
88572	5	t	1011
88574	4	f	1011
88573	4	t	1010
88575	5	t	1011
88576	5	t	1011
88981	5	t	1011
88982	4	f	1011
88983	4	t	1010
88984	4	t	1010
88985	4	f	1013
88986	4	f	1011
88987	5	t	1011
88988	5	t	1011
88989	5	t	1011
88990	5	t	1011
88991	5	t	1011
88993	4	f	1011
88992	4	t	1010
88994	5	t	1011
88995	4	f	1013
88997	4	t	1010
88996	4	f	1011
91306	2	t	1010
91307	2	f	1011
91308	2	f	1011
91309	2	t	1010
91310	2	t	1010
91311	2	f	1011
91304	3	t	1011
91305	3	t	1011
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
82621	1	1011	82535	t	100.00
82625	1	1011	82559	t	100.00
82638	1	1011	82581	t	100.00
82639	1	1011	82582	t	100.00
82640	1	1011	82583	t	100.00
82641	1	1011	82584	t	100.00
83713	1	1011	83818	t	100.00
83714	1	1011	83825	t	100.00
83715	1	1011	83826	t	100.00
83716	1	1011	83827	t	100.00
83717	1	1011	83828	t	100.00
83718	1	1011	84032	t	100.00
83719	1	1011	84033	t	100.00
83720	1	1011	84034	t	100.00
83721	1	1011	84035	t	100.00
83722	1	1011	84036	t	100.00
83723	1	1011	84038	t	100.00
83724	1	1011	84039	t	100.00
83725	1	1011	84040	t	100.00
83726	1	1011	84041	t	100.00
83727	1	1011	84042	t	100.00
83728	1	1011	84045	t	100.00
84133	1	1011	84046	t	100.00
84134	1	1011	84048	t	100.00
84135	1	1011	84049	t	100.00
84136	1	1011	84050	t	100.00
84137	1	1011	84051	t	100.00
84138	1	1011	84052	t	100.00
84139	1	1011	84054	t	100.00
84140	1	1011	84055	t	100.00
84141	1	1011	84057	t	100.00
84142	1	1011	84058	t	100.00
84143	1	1011	84059	t	100.00
84144	1	1011	84060	t	100.00
84145	1	1011	84062	t	100.00
84146	1	1011	84063	t	100.00
84147	1	1011	84064	t	100.00
84148	1	1011	84065	t	100.00
84149	1	1013	84067	t	100.00
84150	1	1011	84067	f	100.00
84151	1	1011	84069	t	100.00
84152	1	1011	84070	t	100.00
84153	1	1011	84072	t	100.00
84154	1	1011	84073	t	100.00
84155	1	1011	84074	t	100.00
84156	1	1011	84075	t	100.00
84157	1	1011	84077	t	100.00
84158	1	1011	84078	t	100.00
84159	1	1011	84079	t	100.00
84160	1	1011	84080	t	100.00
84161	1	1011	84081	t	100.00
84162	1	1011	84083	t	100.00
84163	1	1011	84084	t	100.00
84164	1	1011	84085	t	100.00
84165	1	1011	84087	t	100.00
84166	1	1011	84088	t	100.00
84167	1	1011	84089	t	100.00
84168	1	1011	84090	t	100.00
84169	1	1011	84091	t	100.00
84170	1	1011	84092	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
34927	2	2011-01-14	25.00	6518	\N
34928	2	2011-01-20	40.00	34815	\N
34883	3	2011-01-14	25.00	6518	2010-11-16 17:17:52.842
34884	3	2011-01-20	40.00	34815	2010-11-16 17:17:52.842
34929	4	2011-01-14	24.99	34963	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
1010	4	children	100.0000	f	0.0100	t	t	f
1011	3	percentage	100.0000	f	0.0100	t	t	f
1012	2	units	2147483647.0000	f	1.0000	t	f	f
1013	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
81774	111
81775	108
81776	108
81777	111
89706	108
89707	108
89708	108
89709	108
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
505	5	e2463215-e109-4990-aacd-56633990e19f	España
506	2	db104e68-e3fe-426f-801a-1dd1862db971	Galicia
507	1	5ba21719-bf3d-48fc-8264-42df3185b2cc	Valencia
508	3	e0c5372e-26fc-44f8-86cf-4927c98f1547	\N
509	2	48505a79-fc71-46e1-8cfc-6f518a7ae8b1	\N
513	1	4f3ad0fe-0f7e-470a-b88f-30d25b8047e6	\N
512	2	e537c4d6-de08-48f1-baf1-5cf6a9e2ac14	\N
510	2	95a33f29-52e9-4be2-b8ff-1140ec2e4cdc	\N
511	2	03bb5f5c-2751-4ebc-a37e-d0f4691a4612	\N
514	1	3de6eef9-b5f7-408e-8e0b-fe2c2b00cbc7	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
2020	3	2010-11-15	\N	508	0
2021	2	2010-11-15	\N	509	0
2025	1	2010-11-15	\N	513	0
2024	2	2010-11-15	\N	512	0
2022	2	2010-11-15	\N	510	0
2023	2	2010-11-15	\N	511	0
2026	1	2010-11-15	\N	514	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
606	5	2b3b907c-cff3-487f-9d3f-b33f9262e9df	\N	\N	505	0
607	2	8d675899-8b1d-49b5-9634-053815f62ecc	505	\N	506	0
608	1	4ab194a8-6667-4484-a950-24debd30063f	505	\N	507	0
609	3	aca50d51-e9e8-4291-8d6e-82b3cc06afd2	507	\N	508	0
610	2	c08545bb-76f7-4c8b-b048-282f2c653c73	505	\N	509	0
614	1	1bc0d3d6-a344-4516-b80c-3df6e5674dc7	505	\N	513	0
613	2	b86c53e8-093e-4da3-abc5-4a842b7c1c7c	505	\N	512	0
611	2	94e92dfb-b9b2-41cb-8d3b-6874f5fcb49a	505	\N	510	0
612	2	d34ed3ca-e11b-4746-a6e6-7cbf7a776c61	505	\N	511	0
615	1	5e1e9ee2-2832-4069-88bb-1d047ddd1b84	506	\N	514	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, duration, calendar_exception_id, base_calendar_id) FROM stdin;
1226	1	19ecfb1a-f109-47b8-9899-889efd02be0b	2011-04-21	0	913	506
1227	1	91b0dbf5-a1ec-480b-99b3-6ff9dadcb339	2010-08-15	0	913	506
1228	1	0b543e24-f63f-453c-8cd1-21d92c335b17	2010-04-21	0	913	506
1229	1	8f0cc281-82f7-4a6e-9b42-2d753621aae6	2011-08-15	0	913	506
1230	1	8fca0b34-5681-4db5-a4ee-b7015a10dd84	2011-12-26	0	914	506
1231	1	6cd60dcb-b1d6-47db-aed4-c877c8aef2d9	2010-05-17	0	913	506
1232	1	85780168-c29a-4025-8d44-f77540c22a45	2011-03-19	0	913	507
1233	1	b5259bb0-6a74-4819-9ffb-efa886bccc5a	2011-04-25	0	913	507
1234	1	f99be195-1ecc-4859-878b-3e460b8d98b3	2010-01-22	0	913	507
1235	1	21adb469-f071-48c9-a7e1-96cf67af9f77	2010-03-19	0	913	507
1236	1	e06c4cba-d518-4020-87cd-2919ed06f43e	2011-01-22	0	913	507
1237	1	2f4a6ff0-7acc-4e64-9bfa-83fe9ab700b5	2011-05-02	0	913	507
1219	2	437aca85-66d3-473c-b837-04cd99ca0591	2011-12-06	0	913	505
1214	3	98de5442-146c-4e95-aa5d-1c8bccb50489	2010-10-12	0	913	505
1220	2	85183975-01ea-496a-83d5-f4213d160ac2	2011-11-01	0	913	505
1213	3	18723914-a787-4298-864c-2ec5eecce7ec	2010-04-22	0	913	505
1221	2	8a484e1a-c8e9-4257-a790-d90d036f766c	2011-10-12	0	913	505
1225	2	8a9186cf-7cec-4940-8af1-ffbe94c670bc	2011-05-01	0	913	505
1212	3	ed91a3a7-ed84-468c-b7b3-5d2bdd780155	2011-01-01	0	913	505
1216	3	9e945c21-a2b7-4894-a9f7-ab68a8e67b77	2010-11-01	0	913	505
1222	2	50db33af-f501-4830-b1f5-25cb7bc3ffbb	2011-04-22	0	913	505
1223	2	6a745ef1-cf93-4d28-b516-17c51afbf1ef	2010-12-06	0	913	505
1224	2	d88cd415-ebb2-4230-9a27-462e2b28cd0e	2011-12-08	0	913	505
1217	3	af352e18-bd6f-429f-9166-1ca449e7424b	2010-12-08	0	913	505
1218	3	c6b0e772-d44d-4e88-a7ea-e177e5688c06	2010-05-01	0	913	505
1215	3	d79b5014-c48e-4992-80af-543ceb5418c6	2010-01-01	0	913	505
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable, duration) FROM stdin;
909	6	HOLIDAY	HOLIDAY	red	t	0
910	5	SICK_LEAVE	SICK_LEAVE	red	t	0
911	4	LEAVE	LEAVE	red	t	0
912	3	STRIKE	STRIKE	red	t	0
913	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t	0
914	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f	0
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts, montecarlomethodtabvisible) FROM stdin;
707	4	505	B15804842	t	t	t	t	t	t	t	f	t	t	t
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
1415	1	fdb410d5-c915-4e6b-a887-0c4d1e9cff16	Desarrolladores	t
1414	2	cc9ab984-61b1-489c-911d-632d5499e0e6	Analistas	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, predefinedcriterioninternalname, active, id_criterion_type, parent) FROM stdin;
111	1	4e95ecbd-c472-4dca-9198-b169bc5b88e0	Coordinador	\N	t	5	\N
112	1	1d08025f-dee1-437a-96da-fd434b2570c0	Analista/Desarrollador	\N	t	5	\N
113	1	aeaecd5e-c8ab-4230-b63f-aa497ef0aeaa	Diseñador gráfico	\N	t	5	\N
114	1	61f0e15f-17dd-43da-ba1d-fad846268738	Administrador de sistemas	\N	t	5	\N
115	1	1900d3cb-ad8b-4639-9143-f29bf7608018	Valencia	\N	t	7	\N
116	1	8c13f53f-8921-4178-b821-df1544d0b0df	Pontevedra	\N	t	7	\N
117	1	b0a512f4-2d58-44ed-b58c-ae5c1a7bc707	A Coruña 	\N	t	7	\N
118	1	e9d91611-cd4c-4908-91f3-5eb49f4ed2f8	Valencia	\N	t	2	\N
119	1	d8153663-1434-4c34-a72c-c159649e19b3	Madrid	\N	t	2	\N
120	1	1a24f62d-7a05-4125-ad18-5579e95d5f53	Galicia	\N	t	2	\N
121	1	b29447ac-a48c-4f99-91e9-0173592979ff	Licenciado en matemáticas	\N	t	4	\N
122	1	f899198a-73f6-488d-a0f9-dc9d5241ecbd	Licenciado en física	\N	t	4	\N
123	1	a9de3cfe-64e3-4a10-b089-436e814dcce3	Ingeniero en informática	\N	t	4	\N
124	1	9179a0a6-f585-4bcb-8f7e-b728d92c3fcd	Ingerniero en Telecomunicaciones	\N	t	4	\N
105	1	d713098d-09cc-409e-91ae-998b8d4ca5c5	Desarrollador Senior	\N	t	3	\N
106	1	d856d7e5-6fd5-4ade-b3ac-c7b4d1694492	Peón	\N	t	3	\N
107	1	95b90b6b-62cc-42ce-a06d-77d9663bdf1a	Oficial 2º	\N	t	3	\N
108	1	148e85ad-6502-4679-a274-07f33aeaccdc	Analista	\N	t	3	\N
109	1	c9aaa0d0-0f9f-45a0-a893-9d0e2ad73207	Oficial 1º	\N	t	3	\N
110	1	090e95c4-cf9c-4da3-8fb3-e05940bf74d0	Desarrollador Junior	\N	t	3	\N
89587	29	7eac57d0-98af-4edd-8743-1b6e6b52659f	medicalLeave	medicalLeave	t	29032448	\N
89588	27	6a9217e0-d642-4744-a506-e070941ebe7b	paternityLeave	paternityLeave	t	29032448	\N
89589	7	d9eeb459-9f99-4733-91a1-06cb2c955444	hiredResourceWorkingRelationship	hiredResourceWorkingRelationship	t	29032449	\N
89590	5	548a4788-55ba-414c-aea0-2d087a0dc714	firedResourceWorkingRelationship	firedResourceWorkingRelationship	t	29032449	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
83208	DIRECT	2	\N	2384	\N	111	\N	\N
83209	INDIRECT	2	\N	2361	\N	111	83208	t
83210	INDIRECT	2	2751	\N	\N	111	83208	t
83211	INDIRECT	2	\N	2385	\N	111	83208	t
83212	INDIRECT	2	2771	\N	\N	111	83208	t
83213	INDIRECT	2	\N	2386	\N	111	83208	t
83214	INDIRECT	2	2772	\N	\N	111	83208	t
83215	INDIRECT	2	\N	2387	\N	111	83208	t
83216	INDIRECT	2	2773	\N	\N	111	83208	t
83217	INDIRECT	2	\N	2388	\N	111	83208	t
83218	INDIRECT	2	2774	\N	\N	111	83208	t
83219	DIRECT	2	\N	2408	\N	108	\N	\N
83220	INDIRECT	2	\N	2409	\N	108	83219	t
83221	INDIRECT	2	2791	\N	\N	108	83219	t
83222	INDIRECT	2	\N	2410	\N	108	83219	t
83223	INDIRECT	2	2792	\N	\N	108	83219	t
83224	INDIRECT	2	\N	2411	\N	108	83219	t
83225	INDIRECT	2	2793	\N	\N	108	83219	t
83226	INDIRECT	2	\N	2412	\N	108	83219	t
83227	INDIRECT	2	2794	\N	\N	108	83219	t
83228	DIRECT	2	\N	2363	\N	112	\N	\N
87951	DIRECT	5	\N	89420	\N	108	\N	\N
87952	INDIRECT	5	\N	89421	\N	108	87951	t
87953	INDIRECT	5	88744	\N	\N	108	87951	t
87954	INDIRECT	5	\N	89422	\N	108	87951	t
87955	INDIRECT	5	88745	\N	\N	108	87951	t
87956	INDIRECT	5	\N	89423	\N	108	87951	t
87957	INDIRECT	5	88746	\N	\N	108	87951	t
87958	INDIRECT	5	\N	89424	\N	108	87951	t
87959	INDIRECT	5	88747	\N	\N	108	87951	t
83229	INDIRECT	2	\N	2364	\N	112	83228	t
83230	INDIRECT	2	2753	\N	\N	112	83228	t
83231	INDIRECT	2	\N	2421	\N	112	83228	t
83232	INDIRECT	2	2803	\N	\N	112	83228	t
83233	INDIRECT	2	\N	2422	\N	112	83228	t
83234	INDIRECT	2	2804	\N	\N	112	83228	t
83235	INDIRECT	2	\N	2423	\N	112	83228	t
83236	INDIRECT	2	2805	\N	\N	112	83228	t
83237	INDIRECT	2	\N	3218	\N	112	83228	t
83238	INDIRECT	2	3275	\N	\N	112	83228	t
83272	DIRECT	1	\N	\N	82559	111	\N	\N
83273	INDIRECT	1	\N	\N	82560	111	83272	t
83274	INDIRECT	1	33871	\N	\N	111	83272	t
83275	INDIRECT	1	\N	\N	82561	111	83272	t
83276	INDIRECT	1	33872	\N	\N	111	83272	t
83277	INDIRECT	1	\N	\N	82562	111	83272	t
83278	INDIRECT	1	33873	\N	\N	111	83272	t
83279	INDIRECT	1	\N	\N	82563	111	83272	t
83280	INDIRECT	1	33874	\N	\N	111	83272	t
83281	INDIRECT	1	\N	\N	82564	111	83272	t
83282	INDIRECT	1	33875	\N	\N	111	83272	t
83310	DIRECT	1	\N	\N	82580	108	\N	\N
83311	INDIRECT	1	\N	\N	82581	108	83310	t
83312	INDIRECT	1	33888	\N	\N	108	83310	t
83313	INDIRECT	1	\N	\N	82582	108	83310	t
83314	INDIRECT	1	33889	\N	\N	108	83310	t
83315	INDIRECT	1	\N	\N	82583	108	83310	t
83316	INDIRECT	1	33890	\N	\N	108	83310	t
83317	INDIRECT	1	\N	\N	82584	108	83310	t
83318	INDIRECT	1	33891	\N	\N	108	83310	t
87902	DIRECT	4	\N	88595	\N	111	\N	\N
87903	INDIRECT	4	\N	88596	\N	111	87902	t
87905	INDIRECT	4	\N	88597	\N	111	87902	t
87907	INDIRECT	4	\N	88598	\N	111	87902	t
83412	DIRECT	1	\N	\N	83818	111	\N	\N
83413	INDIRECT	1	\N	\N	83819	111	83412	t
83414	INDIRECT	1	83856	\N	\N	111	83412	t
83415	INDIRECT	1	\N	\N	83820	111	83412	t
83416	INDIRECT	1	83857	\N	\N	111	83412	t
83417	INDIRECT	1	\N	\N	83821	111	83412	t
83418	INDIRECT	1	83858	\N	\N	111	83412	t
83419	INDIRECT	1	\N	\N	83822	111	83412	t
83420	INDIRECT	1	83859	\N	\N	111	83412	t
83421	INDIRECT	1	\N	\N	83823	111	83412	t
83422	INDIRECT	1	83860	\N	\N	111	83412	t
83423	DIRECT	1	\N	\N	83824	108	\N	\N
83424	INDIRECT	1	\N	\N	83825	108	83423	t
83425	INDIRECT	1	83861	\N	\N	108	83423	t
83931	INDIRECT	1	\N	\N	83826	108	83423	t
83932	INDIRECT	1	83862	\N	\N	108	83423	t
83933	INDIRECT	1	\N	\N	83827	108	83423	t
83934	INDIRECT	1	83863	\N	\N	108	83423	t
83935	INDIRECT	1	\N	\N	83828	108	83423	t
83936	INDIRECT	1	83864	\N	\N	108	83423	t
83937	DIRECT	1	\N	\N	83829	112	\N	\N
87909	INDIRECT	4	\N	88599	\N	111	87902	t
87911	INDIRECT	4	\N	88600	\N	111	87902	t
83938	INDIRECT	1	\N	\N	84032	112	83937	t
83939	INDIRECT	1	83865	\N	\N	112	83937	t
83940	INDIRECT	1	\N	\N	84033	112	83937	t
83941	INDIRECT	1	83866	\N	\N	112	83937	t
83942	INDIRECT	1	\N	\N	84034	112	83937	t
83943	INDIRECT	1	83867	\N	\N	112	83937	t
83944	INDIRECT	1	\N	\N	84035	112	83937	t
83945	INDIRECT	1	83868	\N	\N	112	83937	t
83946	INDIRECT	1	\N	\N	84036	112	83937	t
83947	INDIRECT	1	83869	\N	\N	112	83937	t
87913	DIRECT	4	\N	88601	\N	108	\N	\N
87914	INDIRECT	4	\N	88602	\N	108	87913	t
87915	INDIRECT	4	88256	\N	\N	108	87913	t
87916	INDIRECT	4	\N	88603	\N	108	87913	t
87917	INDIRECT	4	88257	\N	\N	108	87913	t
87918	INDIRECT	4	\N	88604	\N	108	87913	t
87919	INDIRECT	4	88258	\N	\N	108	87913	t
87920	INDIRECT	4	\N	88605	\N	108	87913	t
87921	INDIRECT	4	88259	\N	\N	108	87913	t
87922	DIRECT	4	\N	88606	\N	112	\N	\N
87923	INDIRECT	4	\N	88607	\N	112	87922	t
87924	INDIRECT	4	88260	\N	\N	112	87922	t
87925	INDIRECT	4	\N	88608	\N	112	87922	t
87926	INDIRECT	4	88261	\N	\N	112	87922	t
87927	INDIRECT	4	\N	88609	\N	112	87922	t
87928	INDIRECT	4	88262	\N	\N	112	87922	t
87929	INDIRECT	4	\N	88610	\N	112	87922	t
87930	INDIRECT	4	88263	\N	\N	112	87922	t
87931	INDIRECT	4	\N	88611	\N	112	87922	t
87932	INDIRECT	4	88264	\N	\N	112	87922	t
84950	DIRECT	9	\N	85269	\N	111	\N	\N
84951	INDIRECT	9	\N	85270	\N	111	84950	t
84952	INDIRECT	10	84791	\N	\N	111	84950	t
84953	INDIRECT	9	\N	85271	\N	111	84950	t
84954	INDIRECT	10	84792	\N	\N	111	84950	t
84955	INDIRECT	9	\N	85272	\N	111	84950	t
84956	INDIRECT	10	84793	\N	\N	111	84950	t
84957	INDIRECT	9	\N	85273	\N	111	84950	t
84958	INDIRECT	10	84794	\N	\N	111	84950	t
84959	INDIRECT	9	\N	85274	\N	111	84950	t
84960	INDIRECT	10	84795	\N	\N	111	84950	t
84974	INDIRECT	8	84801	\N	\N	112	84970	t
84975	INDIRECT	9	\N	85283	\N	112	84970	t
84976	INDIRECT	8	84802	\N	\N	112	84970	t
84977	INDIRECT	9	\N	85284	\N	112	84970	t
84978	INDIRECT	8	84803	\N	\N	112	84970	t
84979	INDIRECT	9	\N	85285	\N	112	84970	t
84980	INDIRECT	8	84804	\N	\N	112	84970	t
87904	INDIRECT	5	88251	\N	\N	111	87902	t
87906	INDIRECT	5	88252	\N	\N	111	87902	t
87908	INDIRECT	5	88253	\N	\N	111	87902	t
87910	INDIRECT	5	88254	\N	\N	111	87902	t
87912	INDIRECT	5	88255	\N	\N	111	87902	t
84961	DIRECT	9	\N	85275	\N	108	\N	\N
84962	INDIRECT	9	\N	85276	\N	108	84961	t
84963	INDIRECT	10	84796	\N	\N	108	84961	t
84964	INDIRECT	9	\N	85277	\N	108	84961	t
84965	INDIRECT	10	84797	\N	\N	108	84961	t
84966	INDIRECT	9	\N	85278	\N	108	84961	t
84967	INDIRECT	8	84798	\N	\N	108	84961	t
84968	INDIRECT	9	\N	85279	\N	108	84961	t
84969	INDIRECT	8	84799	\N	\N	108	84961	t
84970	DIRECT	9	\N	85280	\N	112	\N	\N
84971	INDIRECT	9	\N	85281	\N	112	84970	t
84972	INDIRECT	8	84800	\N	\N	112	84970	t
84973	INDIRECT	9	\N	85282	\N	112	84970	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2124	2	01d0df62-4def-419c-b2ca-e926ebc9d6c5	2010-11-15 13:28:49.029	\N	f	115	1920
2121	3	96bf999c-e415-4fb1-a453-3a19b9b0cc57	2010-11-15 13:28:04.423	\N	f	111	1920
2122	2	b21f6e85-f807-459a-97cf-bdd16b502da7	2010-11-15 13:28:37.202	\N	f	116	1922
2123	2	36baab0e-c09b-4b74-bccd-e521957df128	2010-11-15 13:28:33.101	\N	f	111	1922
2132	1	12c49b3d-f01e-4565-b58b-d6d746986358	2010-11-15 13:38:00.663	\N	f	110	1930
2133	1	9235c2de-f931-4335-a61b-0d5db2e33364	2010-11-15 13:38:04.418	\N	f	112	1930
2134	1	263e921b-b3cc-44b5-a0f4-c97fb6bb023f	2010-11-15 13:38:13.011	\N	f	115	1930
2131	2	b3caf29f-12c2-42d2-9161-4fcd9c5ebcd8	2010-11-15 13:37:30.035	\N	f	115	1928
2130	2	c4ede38d-9815-45d7-b7f5-fd16e14aed61	2010-11-15 13:37:15.92	\N	f	112	1928
2129	2	011322df-21c0-4a14-9048-b0de5b7f2d15	2010-11-15 13:37:25.133	\N	f	110	1928
2125	2	f583e0be-717d-42ae-b242-be71c4f6fadf	2010-11-15 13:33:42.349	\N	f	112	1924
2126	2	0635bfc3-7699-4562-a927-e0ddd8c146eb	2010-11-15 13:33:49.128	\N	f	115	1924
2135	1	7271aaa0-3351-4d63-b98e-3f79047b6fff	2010-11-15 13:38:42.693	\N	f	108	1924
2127	2	cb483ce3-50b3-4fbb-b870-8dc444a3e8d1	2010-11-15 13:34:23.188	\N	f	116	1926
2128	2	ef67c54e-ad10-439b-bbf9-f7ebe01fe9ad	2010-11-15 00:00:00	\N	f	112	1926
2136	1	2faf7069-ca06-48e4-a4c5-c4de6800b5c3	2010-11-15 13:38:55.266	\N	f	108	1926
2137	1	1e0dedc4-8578-4147-97d2-fde327d1cc3c	2010-11-15 13:40:42.03	\N	f	120	1932
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, predefinedtypeinternalname, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
29032448	30	886fe898-bbf7-4d6e-b9b0-05e9b5c7b2ea	LEAVE	LEAVE	Leave	f	f	t	f	0
29032449	9	ce67ae35-ae8d-4b30-bf9d-20d2754e3d02	WORK_RELATIONSHIP	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	0
3	14	df8d235c-5a28-4232-9c98-8e4ed9dd2aaf	Categoría profesional	CATEGORY	Professional category	t	t	t	f	0
5	10	de77c351-79b0-41ea-a40b-f7f78e0061ff	Tipo de trabajo	JOB	Tipo de trabajo	t	t	t	f	0
7	2	4213f228-988d-4fca-99b5-01126de23e6b	Localización	LOCATION_GROUP	Location where the workers work	t	f	t	f	0
2	16	8cd14c14-caa8-48be-934f-0a7168878d41	Localización máquinas	MACHINE_LOCATION_GROUP	Location where there are machines	t	f	t	f	1
4	12	fa98dcfe-db72-4766-9ce2-d0f53f3a958e	Formación	TRAINING	Training courses and labor training	t	t	t	f	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, duration, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
7038	SPECIFIC_DAY	16	28800	f	2010-11-26	1924	6683	\N	\N
7039	SPECIFIC_DAY	16	28800	f	2010-11-29	1924	6683	\N	\N
7037	SPECIFIC_DAY	16	28800	f	2010-12-01	1924	6683	\N	\N
7044	SPECIFIC_DAY	16	28800	f	2010-12-09	1924	6684	\N	\N
7043	SPECIFIC_DAY	16	28800	f	2010-12-10	1924	6684	\N	\N
7041	SPECIFIC_DAY	16	28800	f	2010-12-13	1924	6684	\N	\N
7040	SPECIFIC_DAY	16	28800	f	2010-12-14	1924	6684	\N	\N
7042	SPECIFIC_DAY	16	28800	f	2010-12-07	1924	6684	\N	\N
7455	SPECIFIC_DAY	6	28800	f	2010-11-17	1928	6747	\N	\N
7454	SPECIFIC_DAY	6	28800	f	2010-11-16	1928	6747	\N	\N
7453	SPECIFIC_DAY	6	28800	f	2010-11-15	1928	6747	\N	\N
6777	SPECIFIC_DAY	17	28800	f	2011-01-17	1922	6666	\N	\N
6798	SPECIFIC_DAY	17	28800	f	2010-12-27	1922	6666	\N	\N
6803	SPECIFIC_DAY	17	28800	f	2010-12-15	1922	6666	\N	\N
6781	SPECIFIC_DAY	17	28800	f	2011-01-05	1922	6666	\N	\N
6805	SPECIFIC_DAY	17	0	f	2011-01-16	1922	6666	\N	\N
6783	SPECIFIC_DAY	17	0	f	2010-12-25	1922	6666	\N	\N
6804	SPECIFIC_DAY	17	28800	f	2010-11-26	1922	6666	\N	\N
6802	SPECIFIC_DAY	17	0	f	2010-12-08	1922	6666	\N	\N
6827	SPECIFIC_DAY	17	0	f	2010-11-27	1922	6666	\N	\N
6789	SPECIFIC_DAY	17	0	f	2011-01-15	1922	6666	\N	\N
6825	SPECIFIC_DAY	17	28800	f	2010-12-21	1922	6666	\N	\N
6768	SPECIFIC_DAY	17	28800	f	2010-11-17	1922	6666	\N	\N
6826	SPECIFIC_DAY	17	28800	f	2010-11-29	1922	6666	\N	\N
6817	SPECIFIC_DAY	17	28800	f	2010-12-22	1922	6666	\N	\N
6831	SPECIFIC_DAY	17	28800	f	2010-11-18	1922	6666	\N	\N
34492	SPECIFIC_DAY	1	28800	f	2011-01-19	1924	34351	\N	\N
34493	SPECIFIC_DAY	1	28800	f	2011-01-18	1924	34351	\N	\N
34499	SPECIFIC_DAY	1	28800	f	2011-01-25	1924	34352	\N	\N
34507	SPECIFIC_DAY	1	28800	f	2011-01-26	1924	34352	\N	\N
34504	SPECIFIC_DAY	1	28800	f	2011-01-27	1924	34352	\N	\N
34495	SPECIFIC_DAY	1	28800	f	2011-01-24	1924	34352	\N	\N
34501	SPECIFIC_DAY	1	28800	f	2011-01-21	1924	34352	\N	\N
34505	SPECIFIC_DAY	1	28800	f	2011-02-01	1924	34352	\N	\N
34502	SPECIFIC_DAY	1	28800	f	2011-01-31	1924	34352	\N	\N
34496	SPECIFIC_DAY	1	28800	f	2011-01-20	1924	34352	\N	\N
34494	SPECIFIC_DAY	1	28800	f	2011-02-02	1924	34352	\N	\N
34503	SPECIFIC_DAY	1	0	f	2011-01-22	1924	34352	\N	\N
34500	SPECIFIC_DAY	1	28800	f	2011-01-28	1924	34352	\N	\N
34506	SPECIFIC_DAY	1	0	f	2011-01-30	1924	34352	\N	\N
34497	SPECIFIC_DAY	1	0	f	2011-01-29	1924	34352	\N	\N
34498	SPECIFIC_DAY	1	0	f	2011-01-23	1924	34352	\N	\N
34511	SPECIFIC_DAY	1	28800	f	2011-02-03	1924	34353	\N	\N
34509	SPECIFIC_DAY	1	0	f	2011-02-05	1924	34353	\N	\N
34512	SPECIFIC_DAY	1	28800	f	2011-02-04	1924	34353	\N	\N
34508	SPECIFIC_DAY	1	14400	f	2011-02-07	1924	34353	\N	\N
34510	SPECIFIC_DAY	1	0	f	2011-02-06	1924	34353	\N	\N
34513	SPECIFIC_DAY	1	28800	f	2011-02-08	1924	34354	\N	\N
34514	SPECIFIC_DAY	1	14400	f	2011-02-07	1924	34354	\N	\N
34515	SPECIFIC_DAY	1	14400	f	2011-02-09	1924	34354	\N	\N
34517	SPECIFIC_DAY	1	28800	f	2011-02-10	1924	34355	\N	\N
34516	SPECIFIC_DAY	1	14400	f	2011-02-09	1924	34355	\N	\N
87320	GENERIC_DAY	1	14400	f	2011-03-02	1922	\N	85856	\N
87315	GENERIC_DAY	1	14400	f	2011-04-06	1922	\N	85856	\N
87347	GENERIC_DAY	1	14400	f	2011-04-29	1922	\N	85856	\N
87384	GENERIC_DAY	1	14400	f	2011-04-19	1922	\N	85856	\N
87318	GENERIC_DAY	1	14400	f	2011-03-01	1922	\N	85856	\N
87348	GENERIC_DAY	1	28800	f	2011-04-25	1922	\N	85856	\N
87330	GENERIC_DAY	1	14400	f	2011-04-08	1920	\N	85856	\N
87334	GENERIC_DAY	1	0	f	2011-04-23	1920	\N	85856	\N
87357	GENERIC_DAY	1	0	f	2011-04-03	1920	\N	85856	\N
87389	GENERIC_DAY	1	14400	f	2011-04-20	1920	\N	85856	\N
87369	GENERIC_DAY	1	14400	f	2011-04-14	1922	\N	85856	\N
87316	GENERIC_DAY	1	14400	f	2011-03-17	1920	\N	85856	\N
87314	GENERIC_DAY	1	0	f	2011-03-12	1922	\N	85856	\N
87317	GENERIC_DAY	1	14400	f	2011-03-16	1920	\N	85856	\N
87362	GENERIC_DAY	1	0	f	2011-04-24	1922	\N	85856	\N
87325	GENERIC_DAY	1	0	f	2011-03-20	1920	\N	85856	\N
87331	GENERIC_DAY	1	14400	f	2011-03-04	1920	\N	85856	\N
87321	GENERIC_DAY	1	14400	f	2011-03-28	1922	\N	85856	\N
87355	GENERIC_DAY	1	14400	f	2011-03-18	1920	\N	85856	\N
87374	GENERIC_DAY	1	14400	f	2011-04-11	1922	\N	85856	\N
87381	GENERIC_DAY	1	14400	f	2011-03-31	1922	\N	85856	\N
87329	GENERIC_DAY	1	0	f	2011-04-02	1922	\N	85856	\N
87323	GENERIC_DAY	1	0	f	2011-03-19	1922	\N	85856	\N
87339	GENERIC_DAY	1	14400	f	2011-05-03	1920	\N	85856	\N
87360	GENERIC_DAY	1	14400	f	2011-04-12	1922	\N	85856	\N
87378	GENERIC_DAY	1	0	f	2011-03-27	1920	\N	85856	\N
87380	GENERIC_DAY	1	14400	f	2011-04-15	1922	\N	85856	\N
87338	GENERIC_DAY	1	0	f	2011-03-26	1920	\N	85856	\N
87326	GENERIC_DAY	1	14400	f	2011-04-20	1922	\N	85856	\N
87377	GENERIC_DAY	1	14400	f	2011-04-05	1920	\N	85856	\N
87345	GENERIC_DAY	1	14400	f	2011-04-19	1920	\N	85856	\N
87385	GENERIC_DAY	1	0	f	2011-04-10	1922	\N	85856	\N
87333	GENERIC_DAY	1	14400	f	2011-04-18	1922	\N	85856	\N
87313	GENERIC_DAY	1	14400	f	2011-04-08	1922	\N	85856	\N
87373	GENERIC_DAY	1	14400	f	2011-03-31	1920	\N	85856	\N
87350	GENERIC_DAY	1	0	f	2011-03-05	1922	\N	85856	\N
87343	GENERIC_DAY	1	0	f	2011-03-12	1920	\N	85856	\N
87366	GENERIC_DAY	1	14400	f	2011-03-22	1920	\N	85856	\N
87328	GENERIC_DAY	1	0	f	2011-04-24	1920	\N	85856	\N
87351	GENERIC_DAY	1	14400	f	2011-03-24	1920	\N	85856	\N
87352	GENERIC_DAY	1	14400	f	2011-03-28	1920	\N	85856	\N
87375	GENERIC_DAY	1	14400	f	2011-03-23	1920	\N	85856	\N
87376	GENERIC_DAY	1	0	f	2011-03-13	1920	\N	85856	\N
87341	GENERIC_DAY	1	14400	f	2011-03-01	1920	\N	85856	\N
87340	GENERIC_DAY	1	0	f	2011-04-10	1920	\N	85856	\N
87367	GENERIC_DAY	1	14400	f	2011-03-02	1920	\N	85856	\N
87372	GENERIC_DAY	1	14400	f	2011-04-26	1922	\N	85856	\N
87382	GENERIC_DAY	1	14400	f	2011-03-16	1922	\N	85856	\N
87388	GENERIC_DAY	1	14400	f	2011-03-30	1920	\N	85856	\N
87356	GENERIC_DAY	1	14400	f	2011-03-11	1920	\N	85856	\N
87324	GENERIC_DAY	1	14400	f	2011-04-14	1920	\N	85856	\N
87354	GENERIC_DAY	1	14400	f	2011-04-28	1920	\N	85856	\N
87371	GENERIC_DAY	1	14400	f	2011-03-08	1922	\N	85856	\N
87361	GENERIC_DAY	1	14400	f	2011-03-29	1920	\N	85856	\N
87379	GENERIC_DAY	1	14400	f	2011-03-22	1922	\N	85856	\N
87312	GENERIC_DAY	1	0	f	2011-04-09	1922	\N	85856	\N
87337	GENERIC_DAY	1	14400	f	2011-03-03	1922	\N	85856	\N
87365	GENERIC_DAY	1	0	f	2011-04-09	1920	\N	85856	\N
87358	GENERIC_DAY	1	14400	f	2011-04-28	1922	\N	85856	\N
87346	GENERIC_DAY	1	14400	f	2011-04-26	1920	\N	85856	\N
87319	GENERIC_DAY	1	14400	f	2011-04-13	1920	\N	85856	\N
87364	GENERIC_DAY	1	14400	f	2011-04-04	1922	\N	85856	\N
87335	GENERIC_DAY	1	14400	f	2011-03-14	1920	\N	85856	\N
87322	GENERIC_DAY	1	0	f	2011-04-16	1922	\N	85856	\N
87368	GENERIC_DAY	1	14400	f	2011-03-04	1922	\N	85856	\N
87363	GENERIC_DAY	1	14400	f	2011-05-04	1922	\N	85856	\N
87332	GENERIC_DAY	1	0	f	2011-04-02	1920	\N	85856	\N
87390	GENERIC_DAY	1	14400	f	2011-03-30	1922	\N	85856	\N
87344	GENERIC_DAY	1	14400	f	2011-04-05	1922	\N	85856	\N
87336	GENERIC_DAY	1	0	f	2011-04-17	1920	\N	85856	\N
87349	GENERIC_DAY	1	14400	f	2011-04-01	1922	\N	85856	\N
87370	GENERIC_DAY	1	14400	f	2011-03-25	1920	\N	85856	\N
87327	GENERIC_DAY	1	14400	f	2011-03-03	1920	\N	85856	\N
87408	GENERIC_DAY	1	14400	f	2011-03-24	1922	\N	85856	\N
87394	GENERIC_DAY	1	14400	f	2011-03-09	1920	\N	85856	\N
87359	GENERIC_DAY	1	0	f	2011-04-30	1920	\N	85856	\N
87342	GENERIC_DAY	1	14400	f	2011-03-17	1922	\N	85856	\N
87383	GENERIC_DAY	1	14400	f	2011-05-04	1920	\N	85856	\N
87414	GENERIC_DAY	1	14400	f	2011-03-23	1922	\N	85856	\N
87387	GENERIC_DAY	1	14400	f	2011-04-07	1920	\N	85856	\N
87425	GENERIC_DAY	1	14400	f	2011-03-03	1926	\N	85857	\N
87431	GENERIC_DAY	1	14400	f	2011-03-07	1924	\N	85857	\N
87419	GENERIC_DAY	1	0	f	2011-03-05	1926	\N	85857	\N
87427	GENERIC_DAY	1	14400	f	2011-03-01	1924	\N	85857	\N
87421	GENERIC_DAY	1	14400	f	2011-03-07	1926	\N	85857	\N
87426	GENERIC_DAY	1	14400	f	2011-03-04	1926	\N	85857	\N
87420	GENERIC_DAY	1	0	f	2011-03-06	1926	\N	85857	\N
87428	GENERIC_DAY	1	14400	f	2011-03-03	1924	\N	85857	\N
87422	GENERIC_DAY	1	0	f	2011-03-06	1924	\N	85857	\N
87424	GENERIC_DAY	1	0	f	2011-03-05	1924	\N	85857	\N
87432	GENERIC_DAY	1	14400	f	2011-03-04	1924	\N	85857	\N
87429	GENERIC_DAY	1	14400	f	2011-03-02	1924	\N	85857	\N
87423	GENERIC_DAY	1	14400	f	2011-03-02	1926	\N	85857	\N
87430	GENERIC_DAY	1	14400	f	2011-03-01	1926	\N	85857	\N
87433	GENERIC_DAY	1	0	f	2011-03-13	1926	\N	85858	\N
87436	GENERIC_DAY	1	14400	f	2011-03-11	1924	\N	85858	\N
87445	GENERIC_DAY	1	14400	f	2011-03-10	1926	\N	85858	\N
87439	GENERIC_DAY	1	14400	f	2011-03-08	1926	\N	85858	\N
87438	GENERIC_DAY	1	14400	f	2011-03-14	1926	\N	85858	\N
87435	GENERIC_DAY	1	14400	f	2011-03-14	1924	\N	85858	\N
87437	GENERIC_DAY	1	0	f	2011-03-13	1924	\N	85858	\N
87444	GENERIC_DAY	1	0	f	2011-03-12	1926	\N	85858	\N
87434	GENERIC_DAY	1	14400	f	2011-03-09	1924	\N	85858	\N
87442	GENERIC_DAY	1	14400	f	2011-03-09	1926	\N	85858	\N
87441	GENERIC_DAY	1	14400	f	2011-03-10	1924	\N	85858	\N
87443	GENERIC_DAY	1	14400	f	2011-03-11	1926	\N	85858	\N
87440	GENERIC_DAY	1	0	f	2011-03-12	1924	\N	85858	\N
87446	GENERIC_DAY	1	14400	f	2011-03-08	1924	\N	85858	\N
89195	GENERIC_DAY	1	14400	f	2011-11-02	1922	\N	85859	\N
89209	GENERIC_DAY	1	14400	f	2011-10-07	1920	\N	85859	\N
89237	GENERIC_DAY	1	0	f	2011-10-23	1922	\N	85859	\N
89234	GENERIC_DAY	1	14400	f	2011-09-26	1922	\N	85859	\N
89244	GENERIC_DAY	1	0	f	2011-09-24	1920	\N	85859	\N
89203	GENERIC_DAY	1	14400	f	2011-10-03	1922	\N	85859	\N
89213	GENERIC_DAY	1	14400	f	2011-09-23	1922	\N	85859	\N
89218	GENERIC_DAY	1	14400	f	2011-09-07	1922	\N	85859	\N
89193	GENERIC_DAY	1	0	f	2011-09-04	1920	\N	85859	\N
87456	GENERIC_DAY	1	14400	f	2011-10-03	1920	\N	85859	\N
89199	GENERIC_DAY	1	14400	f	2011-09-28	1920	\N	85859	\N
89224	GENERIC_DAY	1	0	f	2011-09-04	1922	\N	85859	\N
87461	GENERIC_DAY	1	0	f	2011-10-09	1922	\N	85859	\N
89196	GENERIC_DAY	1	0	f	2011-10-16	1920	\N	85859	\N
89191	GENERIC_DAY	1	14400	f	2011-09-05	1922	\N	85859	\N
87454	GENERIC_DAY	1	14400	f	2011-10-14	1922	\N	85859	\N
89223	GENERIC_DAY	1	14400	f	2011-09-29	1922	\N	85859	\N
89233	GENERIC_DAY	1	14400	f	2011-10-27	1922	\N	85859	\N
89184	GENERIC_DAY	1	14400	f	2011-09-30	1922	\N	85859	\N
89208	GENERIC_DAY	1	14400	f	2011-09-02	1920	\N	85859	\N
89241	GENERIC_DAY	1	14400	f	2011-09-05	1920	\N	85859	\N
89211	GENERIC_DAY	1	14400	f	2011-10-31	1920	\N	85859	\N
87457	GENERIC_DAY	1	14400	f	2011-10-14	1920	\N	85859	\N
89215	GENERIC_DAY	1	0	f	2011-09-03	1922	\N	85859	\N
89243	GENERIC_DAY	1	14400	f	2011-11-03	1920	\N	85859	\N
87464	GENERIC_DAY	1	14400	f	2011-09-19	1920	\N	85859	\N
89229	GENERIC_DAY	1	14400	f	2011-09-09	1922	\N	85859	\N
89205	GENERIC_DAY	1	14400	f	2011-11-02	1920	\N	85859	\N
87451	GENERIC_DAY	1	14400	f	2011-10-27	1920	\N	85859	\N
89206	GENERIC_DAY	1	0	f	2011-09-24	1922	\N	85859	\N
89239	GENERIC_DAY	1	14400	f	2011-10-25	1922	\N	85859	\N
89216	GENERIC_DAY	1	0	f	2011-10-09	1920	\N	85859	\N
89236	GENERIC_DAY	1	14400	f	2011-09-27	1920	\N	85859	\N
87460	GENERIC_DAY	1	14400	f	2011-09-01	1920	\N	85859	\N
89228	GENERIC_DAY	1	0	f	2011-10-30	1920	\N	85859	\N
89232	GENERIC_DAY	1	14400	f	2011-09-08	1922	\N	85859	\N
87465	GENERIC_DAY	1	14400	f	2011-09-02	1922	\N	85859	\N
89190	GENERIC_DAY	1	14400	f	2011-09-14	1920	\N	85859	\N
89225	GENERIC_DAY	1	14400	f	2011-09-27	1922	\N	85859	\N
89200	GENERIC_DAY	1	0	f	2011-10-23	1920	\N	85859	\N
89188	GENERIC_DAY	1	14400	f	2011-11-04	1922	\N	85859	\N
87453	GENERIC_DAY	1	0	f	2011-09-10	1920	\N	85859	\N
89214	GENERIC_DAY	1	14400	f	2011-10-18	1922	\N	85859	\N
87459	GENERIC_DAY	1	0	f	2011-10-08	1920	\N	85859	\N
89204	GENERIC_DAY	1	14400	f	2011-10-06	1920	\N	85859	\N
89227	GENERIC_DAY	1	0	f	2011-10-22	1922	\N	85859	\N
89198	GENERIC_DAY	1	14400	f	2011-09-29	1920	\N	85859	\N
89220	GENERIC_DAY	1	14400	f	2011-09-07	1920	\N	85859	\N
89238	GENERIC_DAY	1	14400	f	2011-09-23	1920	\N	85859	\N
89201	GENERIC_DAY	1	14400	f	2011-10-05	1922	\N	85859	\N
89197	GENERIC_DAY	1	0	f	2011-09-17	1920	\N	85859	\N
89189	GENERIC_DAY	1	14400	f	2011-09-15	1922	\N	85859	\N
87452	GENERIC_DAY	1	14400	f	2011-09-13	1922	\N	85859	\N
87463	GENERIC_DAY	1	14400	f	2011-09-30	1920	\N	85859	\N
89192	GENERIC_DAY	1	0	f	2011-10-01	1920	\N	85859	\N
89185	GENERIC_DAY	1	14400	f	2011-10-11	1922	\N	85859	\N
87455	GENERIC_DAY	1	0	f	2011-10-02	1920	\N	85859	\N
89221	GENERIC_DAY	1	14400	f	2011-10-28	1922	\N	85859	\N
89262	GENERIC_DAY	1	0	f	2011-10-08	1922	\N	85859	\N
89261	GENERIC_DAY	1	14400	f	2011-09-16	1920	\N	85859	\N
87462	GENERIC_DAY	1	0	f	2011-09-03	1920	\N	85859	\N
89194	GENERIC_DAY	1	14400	f	2011-10-20	1922	\N	85859	\N
89186	GENERIC_DAY	1	14400	f	2011-09-09	1920	\N	85859	\N
89219	GENERIC_DAY	1	14400	f	2011-09-12	1922	\N	85859	\N
89207	GENERIC_DAY	1	0	f	2011-09-17	1922	\N	85859	\N
89222	GENERIC_DAY	1	0	f	2011-10-29	1922	\N	85859	\N
89187	GENERIC_DAY	1	14400	f	2011-10-21	1920	\N	85859	\N
89183	GENERIC_DAY	1	14400	f	2011-09-21	1920	\N	85859	\N
89240	GENERIC_DAY	1	0	f	2011-10-02	1922	\N	85859	\N
89212	GENERIC_DAY	1	14400	f	2011-09-26	1920	\N	85859	\N
89226	GENERIC_DAY	1	14400	f	2011-10-10	1922	\N	85859	\N
89202	GENERIC_DAY	1	14400	f	2011-10-24	1920	\N	85859	\N
87458	GENERIC_DAY	1	14400	f	2011-09-14	1922	\N	85859	\N
89231	GENERIC_DAY	1	14400	f	2011-10-28	1920	\N	85859	\N
87450	GENERIC_DAY	1	14400	f	2011-09-15	1920	\N	85859	\N
89217	GENERIC_DAY	1	14400	f	2011-10-11	1920	\N	85859	\N
89242	GENERIC_DAY	1	14400	f	2011-10-21	1922	\N	85859	\N
89230	GENERIC_DAY	1	0	f	2011-10-29	1920	\N	85859	\N
89235	GENERIC_DAY	1	0	f	2011-09-18	1920	\N	85859	\N
89210	GENERIC_DAY	1	14400	f	2011-10-26	1922	\N	85859	\N
87304	GENERIC_DAY	1	14400	f	2011-03-18	1922	\N	85856	\N
87302	GENERIC_DAY	1	14400	f	2011-03-08	1920	\N	85856	\N
87296	GENERIC_DAY	1	14400	f	2011-04-18	1920	\N	85856	\N
87308	GENERIC_DAY	1	14400	f	2011-03-15	1922	\N	85856	\N
87299	GENERIC_DAY	1	14400	f	2011-03-07	1920	\N	85856	\N
87307	GENERIC_DAY	1	14400	f	2011-03-14	1922	\N	85856	\N
87309	GENERIC_DAY	1	14400	f	2011-04-13	1922	\N	85856	\N
87298	GENERIC_DAY	1	14400	f	2011-03-21	1920	\N	85856	\N
87306	GENERIC_DAY	1	14400	f	2011-04-15	1920	\N	85856	\N
87301	GENERIC_DAY	1	14400	f	2011-03-10	1922	\N	85856	\N
87303	GENERIC_DAY	1	14400	f	2011-03-29	1922	\N	85856	\N
87300	GENERIC_DAY	1	0	f	2011-03-27	1922	\N	85856	\N
87305	GENERIC_DAY	1	14400	f	2011-03-10	1920	\N	85856	\N
87310	GENERIC_DAY	1	0	f	2011-04-03	1922	\N	85856	\N
87311	GENERIC_DAY	1	14400	f	2011-03-07	1922	\N	85856	\N
87297	GENERIC_DAY	1	14400	f	2011-04-01	1920	\N	85856	\N
89257	GENERIC_DAY	1	0	f	2011-09-25	1920	\N	85859	\N
87449	GENERIC_DAY	1	14400	f	2011-10-17	1920	\N	85859	\N
89248	GENERIC_DAY	1	14400	f	2011-09-28	1922	\N	85859	\N
89246	GENERIC_DAY	1	14400	f	2011-10-24	1922	\N	85859	\N
87447	GENERIC_DAY	1	0	f	2011-10-30	1922	\N	85859	\N
89258	GENERIC_DAY	1	0	f	2011-10-15	1922	\N	85859	\N
89249	GENERIC_DAY	1	0	f	2011-10-22	1920	\N	85859	\N
89260	GENERIC_DAY	1	14400	f	2011-09-06	1922	\N	85859	\N
89245	GENERIC_DAY	1	0	f	2011-10-15	1920	\N	85859	\N
89253	GENERIC_DAY	1	14400	f	2011-11-03	1922	\N	85859	\N
89251	GENERIC_DAY	1	14400	f	2011-10-25	1920	\N	85859	\N
89255	GENERIC_DAY	1	14400	f	2011-10-19	1920	\N	85859	\N
87448	GENERIC_DAY	1	14400	f	2011-10-05	1920	\N	85859	\N
89254	GENERIC_DAY	1	0	f	2011-10-16	1922	\N	85859	\N
89247	GENERIC_DAY	1	14400	f	2011-09-01	1922	\N	85859	\N
89252	GENERIC_DAY	1	14400	f	2011-09-22	1920	\N	85859	\N
89256	GENERIC_DAY	1	14400	f	2011-09-20	1920	\N	85859	\N
89259	GENERIC_DAY	1	14400	f	2011-10-18	1920	\N	85859	\N
89250	GENERIC_DAY	1	14400	f	2011-10-10	1920	\N	85859	\N
89307	SPECIFIC_DAY	0	28800	f	2010-12-01	1924	81871	\N	\N
89308	SPECIFIC_DAY	0	14400	f	2010-11-25	1924	81871	\N	\N
89309	SPECIFIC_DAY	0	0	f	2010-12-06	1924	81871	\N	\N
89310	SPECIFIC_DAY	0	28800	f	2010-11-29	1924	81871	\N	\N
89311	SPECIFIC_DAY	0	0	f	2010-12-04	1924	81871	\N	\N
89312	SPECIFIC_DAY	0	0	f	2010-11-27	1924	81871	\N	\N
89313	SPECIFIC_DAY	0	28800	f	2010-12-03	1924	81871	\N	\N
89314	SPECIFIC_DAY	0	0	f	2010-12-05	1924	81871	\N	\N
89315	SPECIFIC_DAY	0	28800	f	2010-11-26	1924	81871	\N	\N
89316	SPECIFIC_DAY	0	28800	f	2010-11-30	1924	81871	\N	\N
89317	SPECIFIC_DAY	0	0	f	2010-11-28	1924	81871	\N	\N
89318	SPECIFIC_DAY	0	28800	f	2010-12-07	1924	81871	\N	\N
89319	SPECIFIC_DAY	0	28800	f	2010-12-02	1924	81871	\N	\N
89320	SPECIFIC_DAY	0	28800	f	2010-11-22	1924	81872	\N	\N
89321	SPECIFIC_DAY	0	28800	f	2010-11-23	1924	81872	\N	\N
89322	SPECIFIC_DAY	0	0	f	2010-11-20	1924	81872	\N	\N
89323	SPECIFIC_DAY	0	0	f	2010-11-21	1924	81872	\N	\N
89324	SPECIFIC_DAY	0	28800	f	2010-11-24	1924	81872	\N	\N
89325	SPECIFIC_DAY	0	14400	f	2010-11-18	1924	81872	\N	\N
89326	SPECIFIC_DAY	0	14400	f	2010-11-25	1924	81872	\N	\N
89327	SPECIFIC_DAY	0	28800	f	2010-11-19	1924	81872	\N	\N
87353	GENERIC_DAY	1	14400	f	2011-04-29	1920	\N	85856	\N
87386	GENERIC_DAY	1	0	f	2011-03-06	1922	\N	85856	\N
89271	GENERIC_DAY	1	14400	f	2011-10-04	1922	\N	85859	\N
89278	GENERIC_DAY	1	14400	f	2011-10-13	1922	\N	85859	\N
89276	GENERIC_DAY	1	14400	f	2011-10-07	1922	\N	85859	\N
89288	GENERIC_DAY	1	14400	f	2011-10-26	1920	\N	85859	\N
89269	GENERIC_DAY	1	14400	f	2011-09-20	1922	\N	85859	\N
89279	GENERIC_DAY	1	14400	f	2011-10-31	1922	\N	85859	\N
89277	GENERIC_DAY	1	0	f	2011-09-25	1922	\N	85859	\N
89270	GENERIC_DAY	1	14400	f	2011-10-17	1922	\N	85859	\N
89275	GENERIC_DAY	1	0	f	2011-09-10	1922	\N	85859	\N
89289	GENERIC_DAY	1	0	f	2011-09-11	1922	\N	85859	\N
89273	GENERIC_DAY	1	14400	f	2011-09-16	1922	\N	85859	\N
89272	GENERIC_DAY	1	0	f	2011-10-01	1922	\N	85859	\N
89283	GENERIC_DAY	1	14400	f	2011-09-08	1920	\N	85859	\N
89284	GENERIC_DAY	1	14400	f	2011-09-21	1922	\N	85859	\N
89281	GENERIC_DAY	1	14400	f	2011-10-04	1920	\N	85859	\N
89274	GENERIC_DAY	1	14400	f	2011-10-19	1922	\N	85859	\N
89263	GENERIC_DAY	1	14400	f	2011-11-04	1920	\N	85859	\N
89285	GENERIC_DAY	1	14400	f	2011-10-20	1920	\N	85859	\N
89264	GENERIC_DAY	1	14400	f	2011-10-06	1922	\N	85859	\N
89266	GENERIC_DAY	1	14400	f	2011-09-12	1920	\N	85859	\N
89268	GENERIC_DAY	1	14400	f	2011-09-19	1922	\N	85859	\N
89287	GENERIC_DAY	1	14400	f	2011-10-13	1920	\N	85859	\N
89280	GENERIC_DAY	1	14400	f	2011-09-13	1920	\N	85859	\N
89267	GENERIC_DAY	1	14400	f	2011-09-22	1922	\N	85859	\N
89282	GENERIC_DAY	1	0	f	2011-09-18	1922	\N	85859	\N
89265	GENERIC_DAY	1	14400	f	2011-09-06	1920	\N	85859	\N
89286	GENERIC_DAY	1	0	f	2011-09-11	1920	\N	85859	\N
89328	SPECIFIC_DAY	0	14400	f	2010-11-18	1924	81873	\N	\N
89329	SPECIFIC_DAY	0	28800	f	2010-11-17	1924	81873	\N	\N
89330	SPECIFIC_DAY	0	28800	f	2010-11-16	1924	81873	\N	\N
87392	GENERIC_DAY	1	0	f	2011-04-17	1922	\N	85856	\N
87399	GENERIC_DAY	1	14400	f	2011-03-11	1922	\N	85856	\N
87393	GENERIC_DAY	1	14400	f	2011-03-09	1922	\N	85856	\N
87397	GENERIC_DAY	1	14400	f	2011-04-27	1922	\N	85856	\N
87391	GENERIC_DAY	1	14400	f	2011-04-07	1922	\N	85856	\N
87413	GENERIC_DAY	1	14400	f	2011-04-06	1920	\N	85856	\N
87400	GENERIC_DAY	1	0	f	2011-03-05	1920	\N	85856	\N
87405	GENERIC_DAY	1	0	f	2011-03-20	1922	\N	85856	\N
87418	GENERIC_DAY	1	14400	f	2011-04-04	1920	\N	85856	\N
87404	GENERIC_DAY	1	0	f	2011-03-06	1920	\N	85856	\N
87407	GENERIC_DAY	1	0	f	2011-04-21	1922	\N	85856	\N
87411	GENERIC_DAY	1	0	f	2011-03-13	1922	\N	85856	\N
87415	GENERIC_DAY	1	0	f	2011-04-21	1920	\N	85856	\N
87406	GENERIC_DAY	1	0	f	2011-04-16	1920	\N	85856	\N
87416	GENERIC_DAY	1	14400	f	2011-03-25	1922	\N	85856	\N
87396	GENERIC_DAY	1	14400	f	2011-05-03	1922	\N	85856	\N
87409	GENERIC_DAY	1	14400	f	2011-04-12	1920	\N	85856	\N
87417	GENERIC_DAY	1	28800	f	2011-05-02	1922	\N	85856	\N
87403	GENERIC_DAY	1	14400	f	2011-04-11	1920	\N	85856	\N
87398	GENERIC_DAY	1	0	f	2011-04-30	1922	\N	85856	\N
87412	GENERIC_DAY	1	14400	f	2011-03-21	1922	\N	85856	\N
87402	GENERIC_DAY	1	0	f	2011-03-26	1922	\N	85856	\N
87395	GENERIC_DAY	1	14400	f	2011-04-27	1920	\N	85856	\N
87410	GENERIC_DAY	1	14400	f	2011-03-15	1920	\N	85856	\N
87401	GENERIC_DAY	1	0	f	2011-04-23	1922	\N	85856	\N
90144	GENERIC_DAY	2	0	f	2011-03-06	1928	\N	89806	\N
90145	GENERIC_DAY	2	0	f	2011-03-08	1928	\N	89806	\N
90146	GENERIC_DAY	2	0	f	2011-03-30	1920	\N	89806	\N
90147	GENERIC_DAY	2	5760	f	2011-02-17	1926	\N	89806	\N
90148	GENERIC_DAY	2	0	f	2011-03-03	1928	\N	89806	\N
90149	GENERIC_DAY	2	5760	f	2011-02-16	1926	\N	89806	\N
90150	GENERIC_DAY	2	14400	f	2011-04-19	1926	\N	89806	\N
90151	GENERIC_DAY	2	0	f	2011-04-16	1930	\N	89806	\N
90152	GENERIC_DAY	2	0	f	2011-04-08	1922	\N	89806	\N
90153	GENERIC_DAY	2	0	f	2011-02-22	1930	\N	89806	\N
90154	GENERIC_DAY	2	0	f	2011-04-16	1924	\N	89806	\N
90155	GENERIC_DAY	2	6480	f	2011-02-18	1922	\N	89806	\N
90156	GENERIC_DAY	2	14400	f	2011-04-05	1926	\N	89806	\N
90157	GENERIC_DAY	2	7200	f	2011-03-03	1926	\N	89806	\N
90158	GENERIC_DAY	2	0	f	2011-03-24	1928	\N	89806	\N
90159	GENERIC_DAY	2	14400	f	2011-03-16	1924	\N	89806	\N
90160	GENERIC_DAY	2	0	f	2011-03-23	1928	\N	89806	\N
90161	GENERIC_DAY	2	0	f	2011-03-14	1930	\N	89806	\N
90162	GENERIC_DAY	2	0	f	2011-03-13	1924	\N	89806	\N
90163	GENERIC_DAY	2	0	f	2011-03-20	1924	\N	89806	\N
90164	GENERIC_DAY	2	14400	f	2011-04-15	1924	\N	89806	\N
90165	GENERIC_DAY	2	0	f	2011-03-25	1928	\N	89806	\N
90166	GENERIC_DAY	2	14400	f	2011-04-15	1926	\N	89806	\N
90167	GENERIC_DAY	2	0	f	2011-03-27	1930	\N	89806	\N
90168	GENERIC_DAY	2	0	f	2011-03-05	1928	\N	89806	\N
90169	GENERIC_DAY	2	0	f	2011-02-19	1920	\N	89806	\N
90170	GENERIC_DAY	2	0	f	2011-03-31	1930	\N	89806	\N
90171	GENERIC_DAY	2	0	f	2011-03-05	1922	\N	89806	\N
90172	GENERIC_DAY	2	0	f	2011-02-27	1924	\N	89806	\N
90173	GENERIC_DAY	2	0	f	2011-03-27	1926	\N	89806	\N
90174	GENERIC_DAY	2	14400	f	2011-03-30	1926	\N	89806	\N
90175	GENERIC_DAY	2	0	f	2011-03-16	1930	\N	89806	\N
90176	GENERIC_DAY	2	0	f	2011-04-19	1922	\N	89806	\N
90177	GENERIC_DAY	2	0	f	2011-03-20	1930	\N	89806	\N
90178	GENERIC_DAY	2	0	f	2011-04-05	1922	\N	89806	\N
90179	GENERIC_DAY	2	0	f	2011-02-22	1928	\N	89806	\N
90180	GENERIC_DAY	2	14400	f	2011-04-11	1924	\N	89806	\N
90181	GENERIC_DAY	2	0	f	2011-04-16	1922	\N	89806	\N
90182	GENERIC_DAY	2	0	f	2011-03-21	1920	\N	89806	\N
90183	GENERIC_DAY	2	0	f	2011-04-04	1920	\N	89806	\N
90184	GENERIC_DAY	2	0	f	2011-02-25	1928	\N	89806	\N
90185	GENERIC_DAY	2	0	f	2011-03-19	1930	\N	89806	\N
90186	GENERIC_DAY	2	7200	f	2011-03-02	1920	\N	89806	\N
90187	GENERIC_DAY	2	7200	f	2011-03-11	1920	\N	89806	\N
90188	GENERIC_DAY	2	14400	f	2011-04-13	1924	\N	89806	\N
90189	GENERIC_DAY	2	14400	f	2011-03-29	1924	\N	89806	\N
90190	GENERIC_DAY	2	7200	f	2011-03-14	1922	\N	89806	\N
90191	GENERIC_DAY	2	0	f	2011-04-10	1926	\N	89806	\N
90192	GENERIC_DAY	2	0	f	2011-04-09	1922	\N	89806	\N
90193	GENERIC_DAY	2	0	f	2011-04-19	1930	\N	89806	\N
90194	GENERIC_DAY	2	5760	f	2011-02-16	1928	\N	89806	\N
90195	GENERIC_DAY	2	14400	f	2011-03-22	1924	\N	89806	\N
90196	GENERIC_DAY	2	14400	f	2011-04-13	1926	\N	89806	\N
90197	GENERIC_DAY	2	7200	f	2011-03-09	1924	\N	89806	\N
90198	GENERIC_DAY	2	7200	f	2011-03-11	1922	\N	89806	\N
90199	GENERIC_DAY	2	0	f	2011-03-16	1922	\N	89806	\N
90200	GENERIC_DAY	2	0	f	2011-03-10	1930	\N	89806	\N
90201	GENERIC_DAY	2	14400	f	2011-03-21	1924	\N	89806	\N
90202	GENERIC_DAY	2	7200	f	2011-03-09	1922	\N	89806	\N
90203	GENERIC_DAY	2	0	f	2011-02-19	1926	\N	89806	\N
90204	GENERIC_DAY	2	14400	f	2011-04-07	1926	\N	89806	\N
90205	GENERIC_DAY	2	0	f	2011-03-30	1928	\N	89806	\N
90206	GENERIC_DAY	2	0	f	2011-03-04	1928	\N	89806	\N
90207	GENERIC_DAY	2	0	f	2011-04-01	1930	\N	89806	\N
90208	GENERIC_DAY	2	0	f	2011-03-12	1930	\N	89806	\N
90209	GENERIC_DAY	2	0	f	2011-03-16	1920	\N	89806	\N
90210	GENERIC_DAY	2	0	f	2011-04-03	1922	\N	89806	\N
90211	GENERIC_DAY	2	0	f	2011-04-05	1928	\N	89806	\N
90212	GENERIC_DAY	2	7200	f	2011-03-10	1920	\N	89806	\N
90213	GENERIC_DAY	2	0	f	2011-04-15	1920	\N	89806	\N
90214	GENERIC_DAY	2	0	f	2011-03-29	1920	\N	89806	\N
90215	GENERIC_DAY	2	0	f	2011-04-18	1930	\N	89806	\N
90216	GENERIC_DAY	2	7200	f	2011-02-21	1926	\N	89806	\N
90217	GENERIC_DAY	2	7200	f	2011-02-24	1926	\N	89806	\N
90218	GENERIC_DAY	2	0	f	2011-02-26	1926	\N	89806	\N
90219	GENERIC_DAY	2	0	f	2011-03-01	1928	\N	89806	\N
90220	GENERIC_DAY	2	0	f	2011-03-26	1930	\N	89806	\N
90221	GENERIC_DAY	2	14400	f	2011-04-08	1924	\N	89806	\N
90222	GENERIC_DAY	2	0	f	2011-03-28	1930	\N	89806	\N
90223	GENERIC_DAY	2	0	f	2011-04-18	1928	\N	89806	\N
90224	GENERIC_DAY	2	14400	f	2011-03-17	1924	\N	89806	\N
90225	GENERIC_DAY	2	7200	f	2011-03-10	1924	\N	89806	\N
90226	GENERIC_DAY	2	0	f	2011-04-18	1922	\N	89806	\N
90227	GENERIC_DAY	2	0	f	2011-04-02	1920	\N	89806	\N
90228	GENERIC_DAY	2	14400	f	2011-04-14	1926	\N	89806	\N
90229	GENERIC_DAY	2	7200	f	2011-03-08	1922	\N	89806	\N
90230	GENERIC_DAY	2	0	f	2011-03-19	1928	\N	89806	\N
90231	GENERIC_DAY	2	0	f	2011-04-07	1930	\N	89806	\N
90232	GENERIC_DAY	2	5760	f	2011-02-17	1920	\N	89806	\N
90233	GENERIC_DAY	2	0	f	2011-02-20	1926	\N	89806	\N
90234	GENERIC_DAY	2	0	f	2011-02-27	1926	\N	89806	\N
90235	GENERIC_DAY	2	0	f	2011-03-28	1928	\N	89806	\N
90236	GENERIC_DAY	2	0	f	2011-04-14	1930	\N	89806	\N
90237	GENERIC_DAY	2	7200	f	2011-02-24	1924	\N	89806	\N
90238	GENERIC_DAY	2	0	f	2011-04-17	1924	\N	89806	\N
90239	GENERIC_DAY	2	0	f	2011-02-20	1930	\N	89806	\N
90240	GENERIC_DAY	2	7200	f	2011-02-21	1922	\N	89806	\N
90241	GENERIC_DAY	2	14400	f	2011-04-12	1926	\N	89806	\N
90242	GENERIC_DAY	2	0	f	2011-04-05	1930	\N	89806	\N
90243	GENERIC_DAY	2	7200	f	2011-02-22	1920	\N	89806	\N
90244	GENERIC_DAY	2	0	f	2011-04-07	1920	\N	89806	\N
90245	GENERIC_DAY	2	14400	f	2011-03-29	1926	\N	89806	\N
90246	GENERIC_DAY	2	7200	f	2011-03-07	1922	\N	89806	\N
90247	GENERIC_DAY	2	0	f	2011-02-26	1928	\N	89806	\N
90248	GENERIC_DAY	2	0	f	2011-04-07	1922	\N	89806	\N
90249	GENERIC_DAY	2	0	f	2011-02-24	1930	\N	89806	\N
90250	GENERIC_DAY	2	0	f	2011-04-12	1930	\N	89806	\N
90251	GENERIC_DAY	2	0	f	2011-03-07	1928	\N	89806	\N
90252	GENERIC_DAY	2	0	f	2011-04-02	1922	\N	89806	\N
90253	GENERIC_DAY	2	14400	f	2011-04-12	1924	\N	89806	\N
90254	GENERIC_DAY	2	0	f	2011-03-06	1922	\N	89806	\N
90255	GENERIC_DAY	2	0	f	2011-03-06	1924	\N	89806	\N
90256	GENERIC_DAY	2	14400	f	2011-03-24	1924	\N	89806	\N
90257	GENERIC_DAY	2	0	f	2011-04-08	1928	\N	89806	\N
90258	GENERIC_DAY	2	0	f	2011-02-19	1930	\N	89806	\N
90259	GENERIC_DAY	2	0	f	2011-04-01	1922	\N	89806	\N
90260	GENERIC_DAY	2	0	f	2011-04-15	1930	\N	89806	\N
90261	GENERIC_DAY	2	0	f	2011-04-09	1924	\N	89806	\N
90262	GENERIC_DAY	2	0	f	2011-03-07	1930	\N	89806	\N
90263	GENERIC_DAY	2	0	f	2011-03-12	1924	\N	89806	\N
90264	GENERIC_DAY	2	0	f	2011-03-13	1926	\N	89806	\N
90265	GENERIC_DAY	2	14400	f	2011-03-15	1926	\N	89806	\N
90266	GENERIC_DAY	2	14400	f	2011-03-25	1924	\N	89806	\N
90267	GENERIC_DAY	2	0	f	2011-04-01	1920	\N	89806	\N
90268	GENERIC_DAY	2	7200	f	2011-03-11	1926	\N	89806	\N
90269	GENERIC_DAY	2	14400	f	2011-03-28	1926	\N	89806	\N
90270	GENERIC_DAY	2	14400	f	2011-03-17	1926	\N	89806	\N
90271	GENERIC_DAY	2	0	f	2011-03-26	1920	\N	89806	\N
90272	GENERIC_DAY	2	7200	f	2011-03-01	1920	\N	89806	\N
90273	GENERIC_DAY	2	0	f	2011-02-19	1924	\N	89806	\N
90274	GENERIC_DAY	2	0	f	2011-03-28	1920	\N	89806	\N
90275	GENERIC_DAY	2	0	f	2011-03-02	1930	\N	89806	\N
90276	GENERIC_DAY	2	0	f	2011-03-12	1922	\N	89806	\N
90277	GENERIC_DAY	2	14400	f	2011-03-21	1926	\N	89806	\N
90278	GENERIC_DAY	2	0	f	2011-04-01	1928	\N	89806	\N
90279	GENERIC_DAY	2	14400	f	2011-04-07	1924	\N	89806	\N
90280	GENERIC_DAY	2	0	f	2011-03-28	1922	\N	89806	\N
90281	GENERIC_DAY	2	7200	f	2011-02-22	1926	\N	89806	\N
90282	GENERIC_DAY	2	0	f	2011-03-12	1928	\N	89806	\N
90283	GENERIC_DAY	2	0	f	2011-03-11	1930	\N	89806	\N
90284	GENERIC_DAY	2	0	f	2011-03-02	1928	\N	89806	\N
90285	GENERIC_DAY	2	0	f	2011-04-16	1928	\N	89806	\N
90286	GENERIC_DAY	2	7200	f	2011-03-02	1924	\N	89806	\N
90287	GENERIC_DAY	2	0	f	2011-02-27	1922	\N	89806	\N
90288	GENERIC_DAY	2	0	f	2011-02-20	1920	\N	89806	\N
90289	GENERIC_DAY	2	0	f	2011-03-24	1930	\N	89806	\N
90290	GENERIC_DAY	2	0	f	2011-03-30	1922	\N	89806	\N
90291	GENERIC_DAY	2	0	f	2011-03-20	1928	\N	89806	\N
90292	GENERIC_DAY	2	0	f	2011-04-09	1928	\N	89806	\N
90293	GENERIC_DAY	2	0	f	2011-03-05	1930	\N	89806	\N
90294	GENERIC_DAY	2	0	f	2011-02-16	1930	\N	89806	\N
90295	GENERIC_DAY	2	0	f	2011-03-20	1920	\N	89806	\N
90296	GENERIC_DAY	2	0	f	2011-03-27	1924	\N	89806	\N
90297	GENERIC_DAY	2	0	f	2011-03-21	1928	\N	89806	\N
90298	GENERIC_DAY	2	0	f	2011-04-19	1928	\N	89806	\N
90299	GENERIC_DAY	2	0	f	2011-04-14	1922	\N	89806	\N
90300	GENERIC_DAY	2	0	f	2011-03-23	1930	\N	89806	\N
90301	GENERIC_DAY	2	0	f	2011-04-06	1928	\N	89806	\N
90302	GENERIC_DAY	2	0	f	2011-03-18	1920	\N	89806	\N
90303	GENERIC_DAY	2	0	f	2011-04-06	1922	\N	89806	\N
90304	GENERIC_DAY	2	7200	f	2011-03-07	1920	\N	89806	\N
7020	SPECIFIC_DAY	16	28800	f	2010-11-18	1924	6681	\N	\N
7019	SPECIFIC_DAY	16	28800	f	2010-11-15	1924	6681	\N	\N
7023	SPECIFIC_DAY	16	28800	f	2010-11-17	1924	6681	\N	\N
7022	SPECIFIC_DAY	16	28800	f	2010-11-16	1924	6681	\N	\N
7021	SPECIFIC_DAY	16	10800	f	2010-11-19	1924	6681	\N	\N
7025	SPECIFIC_DAY	16	28800	f	2010-11-22	1924	6682	\N	\N
7024	SPECIFIC_DAY	16	18000	f	2010-11-19	1924	6682	\N	\N
7028	SPECIFIC_DAY	16	0	f	2010-11-21	1924	6682	\N	\N
7030	SPECIFIC_DAY	16	21600	f	2010-11-25	1924	6682	\N	\N
7026	SPECIFIC_DAY	16	0	f	2010-11-20	1924	6682	\N	\N
7027	SPECIFIC_DAY	16	28800	f	2010-11-24	1924	6682	\N	\N
7029	SPECIFIC_DAY	16	28800	f	2010-11-23	1924	6682	\N	\N
7036	SPECIFIC_DAY	16	28800	f	2010-12-02	1924	6683	\N	\N
7032	SPECIFIC_DAY	16	7200	f	2010-11-25	1924	6683	\N	\N
7033	SPECIFIC_DAY	16	28800	f	2010-11-30	1924	6683	\N	\N
7031	SPECIFIC_DAY	16	28800	f	2010-12-03	1924	6683	\N	\N
7034	SPECIFIC_DAY	16	0	f	2010-11-28	1924	6683	\N	\N
7035	SPECIFIC_DAY	16	0	f	2010-11-27	1924	6683	\N	\N
90140	GENERIC_DAY	2	14400	f	2011-03-24	1926	\N	89806	\N
90141	GENERIC_DAY	2	0	f	2011-04-10	1928	\N	89806	\N
90142	GENERIC_DAY	2	0	f	2011-03-06	1920	\N	89806	\N
90143	GENERIC_DAY	2	7200	f	2011-02-23	1926	\N	89806	\N
90305	GENERIC_DAY	2	0	f	2011-03-26	1928	\N	89806	\N
90306	GENERIC_DAY	2	14400	f	2011-04-08	1926	\N	89806	\N
90307	GENERIC_DAY	2	0	f	2011-04-11	1928	\N	89806	\N
90308	GENERIC_DAY	2	0	f	2011-03-20	1922	\N	89806	\N
90309	GENERIC_DAY	2	14400	f	2011-03-15	1924	\N	89806	\N
90310	GENERIC_DAY	2	14400	f	2011-03-18	1924	\N	89806	\N
90311	GENERIC_DAY	2	0	f	2011-03-17	1920	\N	89806	\N
90312	GENERIC_DAY	2	2880	f	2011-02-18	1928	\N	89806	\N
90313	GENERIC_DAY	2	0	f	2011-04-16	1926	\N	89806	\N
90314	GENERIC_DAY	2	0	f	2011-03-22	1930	\N	89806	\N
90315	GENERIC_DAY	2	14400	f	2011-03-31	1924	\N	89806	\N
90316	GENERIC_DAY	2	5760	f	2011-02-17	1922	\N	89806	\N
90317	GENERIC_DAY	2	0	f	2011-04-17	1930	\N	89806	\N
90318	GENERIC_DAY	2	0	f	2011-04-10	1922	\N	89806	\N
90319	GENERIC_DAY	2	0	f	2011-03-15	1922	\N	89806	\N
90320	GENERIC_DAY	2	0	f	2011-03-20	1926	\N	89806	\N
90321	GENERIC_DAY	2	0	f	2011-04-18	1920	\N	89806	\N
90322	GENERIC_DAY	2	7200	f	2011-02-21	1920	\N	89806	\N
90323	GENERIC_DAY	2	0	f	2011-03-26	1922	\N	89806	\N
90324	GENERIC_DAY	2	0	f	2011-04-08	1920	\N	89806	\N
90325	GENERIC_DAY	2	14400	f	2011-03-22	1926	\N	89806	\N
90326	GENERIC_DAY	2	14400	f	2011-04-18	1924	\N	89806	\N
90327	GENERIC_DAY	2	0	f	2011-04-14	1920	\N	89806	\N
90328	GENERIC_DAY	2	7200	f	2011-03-04	1920	\N	89806	\N
90329	GENERIC_DAY	2	7200	f	2011-02-24	1922	\N	89806	\N
90330	GENERIC_DAY	2	0	f	2011-03-17	1930	\N	89806	\N
90331	GENERIC_DAY	2	5760	f	2011-02-16	1922	\N	89806	\N
90332	GENERIC_DAY	2	0	f	2011-02-28	1930	\N	89806	\N
90333	GENERIC_DAY	2	0	f	2011-04-16	1920	\N	89806	\N
90334	GENERIC_DAY	2	7200	f	2011-03-14	1924	\N	89806	\N
90335	GENERIC_DAY	2	0	f	2011-03-17	1928	\N	89806	\N
90336	GENERIC_DAY	2	0	f	2011-02-26	1924	\N	89806	\N
90337	GENERIC_DAY	2	0	f	2011-03-06	1930	\N	89806	\N
90338	GENERIC_DAY	2	0	f	2011-04-03	1930	\N	89806	\N
90339	GENERIC_DAY	2	0	f	2011-03-14	1928	\N	89806	\N
90340	GENERIC_DAY	2	0	f	2011-03-31	1922	\N	89806	\N
90341	GENERIC_DAY	2	0	f	2011-03-15	1928	\N	89806	\N
90342	GENERIC_DAY	2	0	f	2011-03-26	1926	\N	89806	\N
90343	GENERIC_DAY	2	0	f	2011-02-24	1928	\N	89806	\N
90344	GENERIC_DAY	2	0	f	2011-04-11	1930	\N	89806	\N
90345	GENERIC_DAY	2	0	f	2011-03-06	1926	\N	89806	\N
90346	GENERIC_DAY	2	0	f	2011-04-13	1920	\N	89806	\N
90347	GENERIC_DAY	2	14400	f	2011-03-23	1926	\N	89806	\N
90348	GENERIC_DAY	2	14400	f	2011-04-04	1926	\N	89806	\N
90349	GENERIC_DAY	2	0	f	2011-04-07	1928	\N	89806	\N
90350	GENERIC_DAY	2	0	f	2011-03-09	1930	\N	89806	\N
90351	GENERIC_DAY	2	7200	f	2011-02-28	1926	\N	89806	\N
90352	GENERIC_DAY	2	7200	f	2011-03-09	1926	\N	89806	\N
90353	GENERIC_DAY	2	0	f	2011-04-17	1926	\N	89806	\N
90354	GENERIC_DAY	2	0	f	2011-03-10	1928	\N	89806	\N
90355	GENERIC_DAY	2	14400	f	2011-04-19	1924	\N	89806	\N
90356	GENERIC_DAY	2	14400	f	2011-04-06	1924	\N	89806	\N
90357	GENERIC_DAY	2	0	f	2011-04-04	1928	\N	89806	\N
90358	GENERIC_DAY	2	14400	f	2011-04-01	1926	\N	89806	\N
90359	GENERIC_DAY	2	0	f	2011-04-02	1924	\N	89806	\N
90360	GENERIC_DAY	2	0	f	2011-02-26	1922	\N	89806	\N
90361	GENERIC_DAY	2	0	f	2011-04-09	1920	\N	89806	\N
90362	GENERIC_DAY	2	0	f	2011-03-18	1930	\N	89806	\N
90363	GENERIC_DAY	2	0	f	2011-03-23	1920	\N	89806	\N
90364	GENERIC_DAY	2	0	f	2011-02-19	1922	\N	89806	\N
90365	GENERIC_DAY	2	0	f	2011-03-13	1922	\N	89806	\N
90366	GENERIC_DAY	2	14400	f	2011-03-30	1924	\N	89806	\N
90367	GENERIC_DAY	2	0	f	2011-04-19	1920	\N	89806	\N
90368	GENERIC_DAY	2	0	f	2011-04-17	1920	\N	89806	\N
90369	GENERIC_DAY	2	0	f	2011-03-25	1920	\N	89806	\N
90370	GENERIC_DAY	2	0	f	2011-04-10	1930	\N	89806	\N
90371	GENERIC_DAY	2	0	f	2011-04-12	1920	\N	89806	\N
90372	GENERIC_DAY	2	7200	f	2011-02-25	1924	\N	89806	\N
90373	GENERIC_DAY	2	7200	f	2011-03-01	1924	\N	89806	\N
90374	GENERIC_DAY	2	0	f	2011-03-25	1922	\N	89806	\N
90375	GENERIC_DAY	2	14400	f	2011-03-18	1926	\N	89806	\N
90376	GENERIC_DAY	2	7200	f	2011-02-23	1922	\N	89806	\N
90377	GENERIC_DAY	2	0	f	2011-03-12	1926	\N	89806	\N
90378	GENERIC_DAY	2	0	f	2011-04-11	1920	\N	89806	\N
90379	GENERIC_DAY	2	0	f	2011-03-12	1920	\N	89806	\N
90380	GENERIC_DAY	2	0	f	2011-03-22	1928	\N	89806	\N
90381	GENERIC_DAY	2	0	f	2011-03-27	1922	\N	89806	\N
90382	GENERIC_DAY	2	0	f	2011-03-25	1930	\N	89806	\N
90383	GENERIC_DAY	2	0	f	2011-03-13	1920	\N	89806	\N
90384	GENERIC_DAY	2	7200	f	2011-03-03	1920	\N	89806	\N
90385	GENERIC_DAY	2	0	f	2011-02-28	1928	\N	89806	\N
90386	GENERIC_DAY	2	0	f	2011-02-27	1928	\N	89806	\N
90387	GENERIC_DAY	2	0	f	2011-02-27	1920	\N	89806	\N
90388	GENERIC_DAY	2	0	f	2011-04-03	1920	\N	89806	\N
90389	GENERIC_DAY	2	0	f	2011-02-19	1928	\N	89806	\N
90390	GENERIC_DAY	2	7200	f	2011-03-01	1922	\N	89806	\N
90391	GENERIC_DAY	2	0	f	2011-03-21	1922	\N	89806	\N
90392	GENERIC_DAY	2	5760	f	2011-02-16	1924	\N	89806	\N
90393	GENERIC_DAY	2	7200	f	2011-02-25	1922	\N	89806	\N
90394	GENERIC_DAY	2	0	f	2011-02-20	1922	\N	89806	\N
90395	GENERIC_DAY	2	0	f	2011-03-05	1924	\N	89806	\N
90396	GENERIC_DAY	2	7200	f	2011-03-02	1922	\N	89806	\N
90397	GENERIC_DAY	2	0	f	2011-04-04	1922	\N	89806	\N
90398	GENERIC_DAY	2	14400	f	2011-03-16	1926	\N	89806	\N
90399	GENERIC_DAY	2	7200	f	2011-03-04	1922	\N	89806	\N
90400	GENERIC_DAY	2	7200	f	2011-02-28	1920	\N	89806	\N
90401	GENERIC_DAY	2	6480	f	2011-02-18	1920	\N	89806	\N
90402	GENERIC_DAY	2	0	f	2011-02-18	1930	\N	89806	\N
90403	GENERIC_DAY	2	0	f	2011-02-20	1928	\N	89806	\N
90404	GENERIC_DAY	2	14400	f	2011-04-14	1924	\N	89806	\N
90405	GENERIC_DAY	2	0	f	2011-04-13	1928	\N	89806	\N
90406	GENERIC_DAY	2	0	f	2011-04-02	1930	\N	89806	\N
90407	GENERIC_DAY	2	0	f	2011-03-11	1928	\N	89806	\N
90408	GENERIC_DAY	2	7200	f	2011-02-28	1922	\N	89806	\N
90409	GENERIC_DAY	2	0	f	2011-04-11	1922	\N	89806	\N
90410	GENERIC_DAY	2	14400	f	2011-03-31	1926	\N	89806	\N
90411	GENERIC_DAY	2	14400	f	2011-04-11	1926	\N	89806	\N
90412	GENERIC_DAY	2	0	f	2011-04-03	1928	\N	89806	\N
90413	GENERIC_DAY	2	7200	f	2011-03-03	1924	\N	89806	\N
90414	GENERIC_DAY	2	0	f	2011-03-29	1930	\N	89806	\N
90415	GENERIC_DAY	2	0	f	2011-04-08	1930	\N	89806	\N
90416	GENERIC_DAY	2	0	f	2011-03-15	1930	\N	89806	\N
90417	GENERIC_DAY	2	0	f	2011-03-13	1928	\N	89806	\N
90418	GENERIC_DAY	2	0	f	2011-02-21	1930	\N	89806	\N
90419	GENERIC_DAY	2	7200	f	2011-03-08	1924	\N	89806	\N
90420	GENERIC_DAY	2	0	f	2011-03-18	1928	\N	89806	\N
90421	GENERIC_DAY	2	0	f	2011-04-02	1926	\N	89806	\N
90422	GENERIC_DAY	2	0	f	2011-02-23	1930	\N	89806	\N
90423	GENERIC_DAY	2	0	f	2011-03-08	1930	\N	89806	\N
90424	GENERIC_DAY	2	0	f	2011-04-09	1930	\N	89806	\N
90425	GENERIC_DAY	2	7200	f	2011-03-04	1926	\N	89806	\N
90426	GENERIC_DAY	2	14400	f	2011-03-28	1924	\N	89806	\N
90427	GENERIC_DAY	2	0	f	2011-03-31	1920	\N	89806	\N
90428	GENERIC_DAY	2	7200	f	2011-03-14	1926	\N	89806	\N
90429	GENERIC_DAY	2	7200	f	2011-03-07	1924	\N	89806	\N
90430	GENERIC_DAY	2	0	f	2011-03-23	1922	\N	89806	\N
90431	GENERIC_DAY	2	14400	f	2011-03-25	1926	\N	89806	\N
90432	GENERIC_DAY	2	0	f	2011-02-26	1920	\N	89806	\N
90433	GENERIC_DAY	2	14400	f	2011-04-18	1926	\N	89806	\N
90434	GENERIC_DAY	2	0	f	2011-03-22	1922	\N	89806	\N
90435	GENERIC_DAY	2	7200	f	2011-03-10	1926	\N	89806	\N
90436	GENERIC_DAY	2	0	f	2011-04-10	1920	\N	89806	\N
90437	GENERIC_DAY	2	0	f	2011-03-19	1924	\N	89806	\N
90438	GENERIC_DAY	2	0	f	2011-03-16	1928	\N	89806	\N
90439	GENERIC_DAY	2	0	f	2011-02-21	1928	\N	89806	\N
90440	GENERIC_DAY	2	7200	f	2011-02-28	1924	\N	89806	\N
90441	GENERIC_DAY	2	14400	f	2011-04-01	1924	\N	89806	\N
90442	GENERIC_DAY	2	0	f	2011-03-13	1930	\N	89806	\N
90443	GENERIC_DAY	2	0	f	2011-03-24	1920	\N	89806	\N
90444	GENERIC_DAY	2	0	f	2011-03-27	1920	\N	89806	\N
90445	GENERIC_DAY	2	0	f	2011-02-27	1930	\N	89806	\N
90446	GENERIC_DAY	2	0	f	2011-04-10	1924	\N	89806	\N
90447	GENERIC_DAY	2	5760	f	2011-02-17	1928	\N	89806	\N
90448	GENERIC_DAY	2	0	f	2011-04-06	1920	\N	89806	\N
90449	GENERIC_DAY	2	6480	f	2011-02-18	1926	\N	89806	\N
90450	GENERIC_DAY	2	7200	f	2011-02-24	1920	\N	89806	\N
90451	GENERIC_DAY	2	7200	f	2011-02-23	1924	\N	89806	\N
82052	SPECIFIC_DAY	1	7200	f	2010-11-19	1928	6748	\N	\N
82053	SPECIFIC_DAY	1	28800	f	2010-11-18	1928	6748	\N	\N
82054	SPECIFIC_DAY	1	21600	f	2010-11-19	1928	6749	\N	\N
82055	SPECIFIC_DAY	1	0	f	2010-11-20	1928	6749	\N	\N
82056	SPECIFIC_DAY	1	28800	f	2010-11-22	1928	6749	\N	\N
82057	SPECIFIC_DAY	1	7200	f	2010-11-24	1928	6749	\N	\N
82058	SPECIFIC_DAY	1	28800	f	2010-11-23	1928	6749	\N	\N
90452	GENERIC_DAY	2	0	f	2011-04-12	1928	\N	89806	\N
90453	GENERIC_DAY	2	0	f	2011-04-15	1922	\N	89806	\N
90454	GENERIC_DAY	2	0	f	2011-04-17	1922	\N	89806	\N
90455	GENERIC_DAY	2	0	f	2011-03-03	1930	\N	89806	\N
90456	GENERIC_DAY	2	0	f	2011-03-29	1928	\N	89806	\N
90457	GENERIC_DAY	2	0	f	2011-02-17	1930	\N	89806	\N
90458	GENERIC_DAY	2	7200	f	2011-02-21	1924	\N	89806	\N
90459	GENERIC_DAY	2	7200	f	2011-02-22	1924	\N	89806	\N
90460	GENERIC_DAY	2	7200	f	2011-03-08	1920	\N	89806	\N
90461	GENERIC_DAY	2	7200	f	2011-03-01	1926	\N	89806	\N
90462	GENERIC_DAY	2	0	f	2011-04-13	1922	\N	89806	\N
90463	GENERIC_DAY	2	14400	f	2011-04-05	1924	\N	89806	\N
90464	GENERIC_DAY	2	0	f	2011-03-17	1922	\N	89806	\N
90465	GENERIC_DAY	2	0	f	2011-04-17	1928	\N	89806	\N
90466	GENERIC_DAY	2	0	f	2011-02-20	1924	\N	89806	\N
90467	GENERIC_DAY	2	7200	f	2011-03-08	1926	\N	89806	\N
90468	GENERIC_DAY	2	0	f	2011-03-09	1928	\N	89806	\N
90469	GENERIC_DAY	2	0	f	2011-04-09	1926	\N	89806	\N
90470	GENERIC_DAY	2	14400	f	2011-04-06	1926	\N	89806	\N
90471	GENERIC_DAY	2	0	f	2011-04-15	1928	\N	89806	\N
90472	GENERIC_DAY	2	5760	f	2011-02-17	1924	\N	89806	\N
90473	GENERIC_DAY	2	5760	f	2011-02-16	1920	\N	89806	\N
90474	GENERIC_DAY	2	0	f	2011-02-26	1930	\N	89806	\N
90475	GENERIC_DAY	2	0	f	2011-03-27	1928	\N	89806	\N
90476	GENERIC_DAY	2	0	f	2011-04-06	1930	\N	89806	\N
90477	GENERIC_DAY	2	0	f	2011-03-05	1920	\N	89806	\N
90478	GENERIC_DAY	2	7200	f	2011-03-03	1922	\N	89806	\N
90479	GENERIC_DAY	2	0	f	2011-04-13	1930	\N	89806	\N
90480	GENERIC_DAY	2	0	f	2011-04-03	1926	\N	89806	\N
90481	GENERIC_DAY	2	7200	f	2011-02-25	1920	\N	89806	\N
90482	GENERIC_DAY	2	0	f	2011-03-04	1930	\N	89806	\N
90483	GENERIC_DAY	2	0	f	2011-03-21	1930	\N	89806	\N
90484	GENERIC_DAY	2	7200	f	2011-03-02	1926	\N	89806	\N
90485	GENERIC_DAY	2	14400	f	2011-03-23	1924	\N	89806	\N
90486	GENERIC_DAY	2	0	f	2011-03-24	1922	\N	89806	\N
90487	GENERIC_DAY	2	0	f	2011-03-19	1922	\N	89806	\N
90488	GENERIC_DAY	2	0	f	2011-03-29	1922	\N	89806	\N
90489	GENERIC_DAY	2	7200	f	2011-02-22	1922	\N	89806	\N
90490	GENERIC_DAY	2	0	f	2011-03-18	1922	\N	89806	\N
90491	GENERIC_DAY	2	6480	f	2011-02-18	1924	\N	89806	\N
90492	GENERIC_DAY	2	7200	f	2011-03-07	1926	\N	89806	\N
90493	GENERIC_DAY	2	7200	f	2011-03-14	1920	\N	89806	\N
90494	GENERIC_DAY	2	0	f	2011-03-01	1930	\N	89806	\N
90495	GENERIC_DAY	2	0	f	2011-03-15	1920	\N	89806	\N
90496	GENERIC_DAY	2	7200	f	2011-03-09	1920	\N	89806	\N
90497	GENERIC_DAY	2	0	f	2011-02-23	1928	\N	89806	\N
90498	GENERIC_DAY	2	7200	f	2011-03-11	1924	\N	89806	\N
90499	GENERIC_DAY	2	0	f	2011-03-26	1924	\N	89806	\N
90500	GENERIC_DAY	2	0	f	2011-04-05	1920	\N	89806	\N
90501	GENERIC_DAY	2	0	f	2011-02-25	1930	\N	89806	\N
90502	GENERIC_DAY	2	7200	f	2011-02-23	1920	\N	89806	\N
90503	GENERIC_DAY	2	0	f	2011-04-14	1928	\N	89806	\N
90504	GENERIC_DAY	2	0	f	2011-04-03	1924	\N	89806	\N
90505	GENERIC_DAY	2	0	f	2011-03-22	1920	\N	89806	\N
90506	GENERIC_DAY	2	0	f	2011-03-30	1930	\N	89806	\N
90507	GENERIC_DAY	2	0	f	2011-04-12	1922	\N	89806	\N
82060	SPECIFIC_DAY	1	14400	f	2010-11-25	1928	6750	\N	\N
82061	SPECIFIC_DAY	1	21600	f	2010-11-24	1928	6750	\N	\N
82062	SPECIFIC_DAY	1	0	f	2010-11-27	1928	6751	\N	\N
82063	SPECIFIC_DAY	1	25200	f	2010-12-01	1928	6751	\N	\N
82064	SPECIFIC_DAY	1	28800	f	2010-11-30	1928	6751	\N	\N
82065	SPECIFIC_DAY	1	28800	f	2010-11-29	1928	6751	\N	\N
82066	SPECIFIC_DAY	1	14400	f	2010-11-25	1928	6751	\N	\N
82067	SPECIFIC_DAY	1	28800	f	2010-11-26	1928	6751	\N	\N
82068	SPECIFIC_DAY	1	0	f	2010-11-28	1928	6751	\N	\N
82087	SPECIFIC_DAY	1	0	f	2010-12-06	1930	32560	\N	\N
82088	SPECIFIC_DAY	1	28800	f	2010-12-14	1930	32560	\N	\N
82089	SPECIFIC_DAY	1	0	f	2010-12-04	1930	32560	\N	\N
82090	SPECIFIC_DAY	1	28800	f	2010-12-10	1930	32560	\N	\N
82091	SPECIFIC_DAY	1	0	f	2010-12-12	1930	32560	\N	\N
82092	SPECIFIC_DAY	1	28800	f	2010-12-07	1930	32560	\N	\N
82093	SPECIFIC_DAY	1	28800	f	2010-12-13	1930	32560	\N	\N
82094	SPECIFIC_DAY	1	28800	f	2010-12-03	1930	32560	\N	\N
82095	SPECIFIC_DAY	1	28800	f	2010-12-02	1930	32560	\N	\N
82096	SPECIFIC_DAY	1	0	f	2010-12-11	1930	32560	\N	\N
82097	SPECIFIC_DAY	1	28800	f	2010-12-09	1930	32560	\N	\N
82098	SPECIFIC_DAY	1	0	f	2010-12-08	1930	32560	\N	\N
82099	SPECIFIC_DAY	1	3600	f	2010-12-01	1930	32560	\N	\N
82100	SPECIFIC_DAY	1	0	f	2010-12-05	1930	32560	\N	\N
82101	SPECIFIC_DAY	1	10800	f	2010-12-15	1930	32560	\N	\N
90508	GENERIC_DAY	2	0	f	2011-04-04	1930	\N	89806	\N
90509	GENERIC_DAY	2	0	f	2011-03-19	1926	\N	89806	\N
90510	GENERIC_DAY	2	0	f	2011-03-31	1928	\N	89806	\N
90511	GENERIC_DAY	2	0	f	2011-04-02	1928	\N	89806	\N
90512	GENERIC_DAY	2	14400	f	2011-04-04	1924	\N	89806	\N
90513	GENERIC_DAY	2	7200	f	2011-03-04	1924	\N	89806	\N
90532	GENERIC_DAY	2	14400	f	2011-02-23	1926	\N	89808	\N
90533	GENERIC_DAY	2	9000	f	2011-02-22	1926	\N	89808	\N
90534	GENERIC_DAY	2	14400	f	2011-02-23	1924	\N	89808	\N
90535	GENERIC_DAY	2	9000	f	2011-02-22	1924	\N	89808	\N
90536	GENERIC_DAY	2	10800	f	2011-02-28	1926	\N	89808	\N
90537	GENERIC_DAY	2	10800	f	2011-02-28	1924	\N	89808	\N
90538	GENERIC_DAY	2	0	f	2011-02-26	1924	\N	89808	\N
90539	GENERIC_DAY	2	14400	f	2011-02-24	1926	\N	89808	\N
90540	GENERIC_DAY	2	0	f	2011-02-27	1926	\N	89808	\N
90541	GENERIC_DAY	2	0	f	2011-02-27	1924	\N	89808	\N
90542	GENERIC_DAY	2	14400	f	2011-02-25	1926	\N	89808	\N
90543	GENERIC_DAY	2	14400	f	2011-02-25	1924	\N	89808	\N
90544	GENERIC_DAY	2	0	f	2011-02-26	1926	\N	89808	\N
90545	GENERIC_DAY	2	0	f	2011-03-06	1924	\N	89809	\N
90546	GENERIC_DAY	2	14400	f	2011-03-02	1924	\N	89809	\N
90547	GENERIC_DAY	2	0	f	2011-03-05	1924	\N	89809	\N
90548	GENERIC_DAY	2	14400	f	2011-03-01	1924	\N	89809	\N
90549	GENERIC_DAY	2	3600	f	2011-02-28	1926	\N	89809	\N
90550	GENERIC_DAY	2	14400	f	2011-03-08	1926	\N	89809	\N
90551	GENERIC_DAY	2	14400	f	2011-03-02	1926	\N	89809	\N
90552	GENERIC_DAY	2	14400	f	2011-03-08	1924	\N	89809	\N
90553	GENERIC_DAY	2	14400	f	2011-03-04	1926	\N	89809	\N
90554	GENERIC_DAY	2	14400	f	2011-03-03	1924	\N	89809	\N
90555	GENERIC_DAY	2	0	f	2011-03-06	1926	\N	89809	\N
90556	GENERIC_DAY	2	3600	f	2011-02-28	1924	\N	89809	\N
90557	GENERIC_DAY	2	14400	f	2011-03-07	1926	\N	89809	\N
90558	GENERIC_DAY	2	0	f	2011-03-05	1926	\N	89809	\N
90559	GENERIC_DAY	2	14400	f	2011-03-04	1924	\N	89809	\N
90560	GENERIC_DAY	2	14400	f	2011-03-07	1924	\N	89809	\N
90561	GENERIC_DAY	2	14400	f	2011-03-03	1926	\N	89809	\N
90562	GENERIC_DAY	2	14400	f	2011-03-01	1926	\N	89809	\N
90647	GENERIC_DAY	0	5400	f	2011-03-15	1924	\N	89810	\N
90648	GENERIC_DAY	0	0	f	2011-03-13	1924	\N	89810	\N
90649	GENERIC_DAY	0	14400	f	2011-03-09	1926	\N	89810	\N
90650	GENERIC_DAY	0	5400	f	2011-03-15	1926	\N	89810	\N
82102	SPECIFIC_DAY	1	0	f	2011-01-22	1928	32561	\N	\N
82103	SPECIFIC_DAY	1	28800	f	2011-01-21	1928	32561	\N	\N
82104	SPECIFIC_DAY	1	0	f	2011-01-23	1928	32561	\N	\N
82105	SPECIFIC_DAY	1	28800	f	2011-01-10	1928	32561	\N	\N
82106	SPECIFIC_DAY	1	0	f	2011-01-09	1928	32561	\N	\N
82107	SPECIFIC_DAY	1	0	f	2010-12-25	1928	32561	\N	\N
82108	SPECIFIC_DAY	1	28800	f	2010-12-27	1928	32561	\N	\N
82109	SPECIFIC_DAY	1	28800	f	2010-12-28	1928	32561	\N	\N
82110	SPECIFIC_DAY	1	28800	f	2011-01-19	1928	32561	\N	\N
82111	SPECIFIC_DAY	1	0	f	2010-12-18	1928	32561	\N	\N
82112	SPECIFIC_DAY	1	28800	f	2010-12-29	1928	32561	\N	\N
82113	SPECIFIC_DAY	1	28800	f	2010-12-31	1928	32561	\N	\N
82114	SPECIFIC_DAY	1	28800	f	2010-12-17	1928	32561	\N	\N
82115	SPECIFIC_DAY	1	28800	f	2011-01-06	1928	32561	\N	\N
82116	SPECIFIC_DAY	1	28800	f	2011-01-25	1928	32561	\N	\N
82117	SPECIFIC_DAY	1	28800	f	2010-12-22	1928	32561	\N	\N
82118	SPECIFIC_DAY	1	28800	f	2011-01-13	1928	32561	\N	\N
82119	SPECIFIC_DAY	1	0	f	2011-01-15	1928	32561	\N	\N
82120	SPECIFIC_DAY	1	0	f	2011-01-02	1928	32561	\N	\N
82121	SPECIFIC_DAY	1	28800	f	2010-12-21	1928	32561	\N	\N
82122	SPECIFIC_DAY	1	28800	f	2011-01-24	1928	32561	\N	\N
82123	SPECIFIC_DAY	1	28800	f	2011-01-26	1928	32561	\N	\N
82124	SPECIFIC_DAY	1	0	f	2011-01-16	1928	32561	\N	\N
82125	SPECIFIC_DAY	1	0	f	2010-12-19	1928	32561	\N	\N
82126	SPECIFIC_DAY	1	28800	f	2010-12-16	1928	32561	\N	\N
82127	SPECIFIC_DAY	1	0	f	2011-01-08	1928	32561	\N	\N
90651	GENERIC_DAY	0	0	f	2011-03-12	1926	\N	89810	\N
90652	GENERIC_DAY	0	14400	f	2011-03-11	1924	\N	89810	\N
90653	GENERIC_DAY	0	14400	f	2011-03-09	1924	\N	89810	\N
90654	GENERIC_DAY	0	14400	f	2011-03-14	1924	\N	89810	\N
90655	GENERIC_DAY	0	0	f	2011-03-13	1926	\N	89810	\N
90656	GENERIC_DAY	0	14400	f	2011-03-10	1926	\N	89810	\N
90657	GENERIC_DAY	0	0	f	2011-03-12	1924	\N	89810	\N
90658	GENERIC_DAY	0	14400	f	2011-03-10	1924	\N	89810	\N
90659	GENERIC_DAY	0	14400	f	2011-03-14	1926	\N	89810	\N
90660	GENERIC_DAY	0	14400	f	2011-03-11	1926	\N	89810	\N
82156	SPECIFIC_DAY	1	0	f	2011-02-13	1930	32563	\N	\N
82157	SPECIFIC_DAY	1	28800	f	2011-02-08	1930	32563	\N	\N
82158	SPECIFIC_DAY	1	28800	f	2011-02-07	1930	32563	\N	\N
82159	SPECIFIC_DAY	1	28800	f	2011-02-04	1930	32563	\N	\N
82160	SPECIFIC_DAY	1	28800	f	2011-02-16	1930	32563	\N	\N
82161	SPECIFIC_DAY	1	28800	f	2011-02-15	1930	32563	\N	\N
82162	SPECIFIC_DAY	1	0	f	2011-02-06	1930	32563	\N	\N
82163	SPECIFIC_DAY	1	18000	f	2011-02-02	1930	32563	\N	\N
82164	SPECIFIC_DAY	1	28800	f	2011-02-10	1930	32563	\N	\N
82165	SPECIFIC_DAY	1	28800	f	2011-02-17	1930	32563	\N	\N
82166	SPECIFIC_DAY	1	25200	f	2011-02-18	1930	32563	\N	\N
82167	SPECIFIC_DAY	1	0	f	2011-02-12	1930	32563	\N	\N
82168	SPECIFIC_DAY	1	28800	f	2011-02-11	1930	32563	\N	\N
82169	SPECIFIC_DAY	1	28800	f	2011-02-09	1930	32563	\N	\N
82170	SPECIFIC_DAY	1	28800	f	2010-12-01	1930	7792	\N	\N
82171	SPECIFIC_DAY	1	28800	f	2010-12-02	1930	7792	\N	\N
82172	SPECIFIC_DAY	1	18000	f	2010-12-07	1930	7792	\N	\N
82173	SPECIFIC_DAY	1	28800	f	2010-12-03	1930	7792	\N	\N
82174	SPECIFIC_DAY	1	21600	f	2010-11-30	1930	7792	\N	\N
82175	SPECIFIC_DAY	1	0	f	2010-12-05	1930	7792	\N	\N
82176	SPECIFIC_DAY	1	0	f	2010-12-04	1930	7792	\N	\N
82177	SPECIFIC_DAY	1	0	f	2010-12-06	1930	7792	\N	\N
82178	SPECIFIC_DAY	1	28800	f	2010-12-23	1930	32564	\N	\N
82179	SPECIFIC_DAY	1	18000	f	2010-12-24	1930	32564	\N	\N
82180	SPECIFIC_DAY	1	25200	f	2010-12-22	1930	32564	\N	\N
82181	SPECIFIC_DAY	1	18000	f	2010-12-29	1928	32565	\N	\N
82182	SPECIFIC_DAY	1	10800	f	2010-12-24	1928	32565	\N	\N
82183	SPECIFIC_DAY	1	0	f	2010-12-26	1928	32565	\N	\N
82184	SPECIFIC_DAY	1	28800	f	2010-12-27	1928	32565	\N	\N
82185	SPECIFIC_DAY	1	0	f	2010-12-25	1928	32565	\N	\N
82186	SPECIFIC_DAY	1	28800	f	2010-12-28	1928	32565	\N	\N
82187	SPECIFIC_DAY	1	10800	f	2010-12-29	1928	32566	\N	\N
82204	SPECIFIC_DAY	1	28800	f	2011-01-13	1928	32569	\N	\N
82205	SPECIFIC_DAY	1	28800	f	2011-01-14	1928	32569	\N	\N
82206	SPECIFIC_DAY	1	7200	f	2011-01-19	1928	32569	\N	\N
82207	SPECIFIC_DAY	1	0	f	2011-01-16	1928	32569	\N	\N
82208	SPECIFIC_DAY	1	28800	f	2011-01-17	1928	32569	\N	\N
82209	SPECIFIC_DAY	1	28800	f	2011-01-18	1928	32569	\N	\N
82210	SPECIFIC_DAY	1	21600	f	2011-01-12	1928	32569	\N	\N
82211	SPECIFIC_DAY	1	0	f	2011-01-15	1928	32569	\N	\N
82272	SPECIFIC_DAY	1	28800	f	2011-03-02	1930	32570	\N	\N
82273	SPECIFIC_DAY	1	28800	f	2011-03-01	1930	32570	\N	\N
82274	SPECIFIC_DAY	1	28800	f	2011-02-28	1930	32570	\N	\N
82275	SPECIFIC_DAY	1	21600	f	2011-02-17	1930	32570	\N	\N
82276	SPECIFIC_DAY	1	28800	f	2011-02-18	1930	32570	\N	\N
82277	SPECIFIC_DAY	1	0	f	2011-02-19	1930	32570	\N	\N
82278	SPECIFIC_DAY	1	28800	f	2011-02-22	1930	32570	\N	\N
82279	SPECIFIC_DAY	1	28800	f	2011-03-03	1930	32570	\N	\N
82280	SPECIFIC_DAY	1	0	f	2011-02-26	1930	32570	\N	\N
82281	SPECIFIC_DAY	1	28800	f	2011-02-24	1930	32570	\N	\N
82282	SPECIFIC_DAY	1	14400	f	2011-03-04	1930	32570	\N	\N
82283	SPECIFIC_DAY	1	0	f	2011-02-20	1930	32570	\N	\N
82284	SPECIFIC_DAY	1	28800	f	2011-02-25	1930	32570	\N	\N
82285	SPECIFIC_DAY	1	28800	f	2011-02-21	1930	32570	\N	\N
82286	SPECIFIC_DAY	1	28800	f	2011-02-23	1930	32570	\N	\N
82287	SPECIFIC_DAY	1	0	f	2011-02-27	1930	32570	\N	\N
82288	SPECIFIC_DAY	1	28800	f	2011-03-18	1930	32571	\N	\N
82289	SPECIFIC_DAY	1	0	f	2011-03-12	1930	32571	\N	\N
82290	SPECIFIC_DAY	1	28800	f	2011-03-14	1930	32571	\N	\N
82291	SPECIFIC_DAY	1	28800	f	2011-03-09	1930	32571	\N	\N
82292	SPECIFIC_DAY	1	28800	f	2011-03-07	1930	32571	\N	\N
82293	SPECIFIC_DAY	1	0	f	2011-03-05	1930	32571	\N	\N
82294	SPECIFIC_DAY	1	0	f	2011-03-20	1930	32571	\N	\N
82295	SPECIFIC_DAY	1	28800	f	2011-03-15	1930	32571	\N	\N
82296	SPECIFIC_DAY	1	28800	f	2011-03-17	1930	32571	\N	\N
82297	SPECIFIC_DAY	1	14400	f	2011-03-25	1930	32571	\N	\N
82298	SPECIFIC_DAY	1	28800	f	2011-03-10	1930	32571	\N	\N
82299	SPECIFIC_DAY	1	0	f	2011-03-06	1930	32571	\N	\N
82300	SPECIFIC_DAY	1	28800	f	2011-03-21	1930	32571	\N	\N
82301	SPECIFIC_DAY	1	0	f	2011-03-13	1930	32571	\N	\N
82305	SPECIFIC_DAY	1	28800	f	2011-03-23	1930	32571	\N	\N
82306	SPECIFIC_DAY	1	14400	f	2011-03-04	1930	32571	\N	\N
82307	SPECIFIC_DAY	1	28800	f	2011-03-11	1930	32571	\N	\N
82308	SPECIFIC_DAY	1	28800	f	2011-03-24	1930	32571	\N	\N
82309	SPECIFIC_DAY	1	28800	f	2011-03-22	1930	32571	\N	\N
82310	SPECIFIC_DAY	1	28800	f	2011-04-08	1930	32572	\N	\N
82311	SPECIFIC_DAY	1	14400	f	2011-04-15	1930	32572	\N	\N
82312	SPECIFIC_DAY	1	0	f	2011-03-27	1930	32572	\N	\N
82313	SPECIFIC_DAY	1	28800	f	2011-03-29	1930	32572	\N	\N
82314	SPECIFIC_DAY	1	28800	f	2011-03-28	1930	32572	\N	\N
82315	SPECIFIC_DAY	1	0	f	2011-04-03	1930	32572	\N	\N
82316	SPECIFIC_DAY	1	28800	f	2011-04-07	1930	32572	\N	\N
82317	SPECIFIC_DAY	1	28800	f	2011-03-31	1930	32572	\N	\N
82318	SPECIFIC_DAY	1	28800	f	2011-04-14	1930	32572	\N	\N
82319	SPECIFIC_DAY	1	28800	f	2011-04-05	1930	32572	\N	\N
82320	SPECIFIC_DAY	1	28800	f	2011-04-04	1930	32572	\N	\N
82321	SPECIFIC_DAY	1	14400	f	2011-03-25	1930	32572	\N	\N
82322	SPECIFIC_DAY	1	0	f	2011-04-10	1930	32572	\N	\N
82323	SPECIFIC_DAY	1	28800	f	2011-04-11	1930	32572	\N	\N
82324	SPECIFIC_DAY	1	28800	f	2011-04-01	1930	32572	\N	\N
82325	SPECIFIC_DAY	1	0	f	2011-04-09	1930	32572	\N	\N
82326	SPECIFIC_DAY	1	28800	f	2011-04-13	1930	32572	\N	\N
82327	SPECIFIC_DAY	1	28800	f	2011-04-06	1930	32572	\N	\N
82328	SPECIFIC_DAY	1	0	f	2011-03-26	1930	32572	\N	\N
82329	SPECIFIC_DAY	1	0	f	2011-04-02	1930	32572	\N	\N
82330	SPECIFIC_DAY	1	28800	f	2011-04-12	1930	32572	\N	\N
82331	SPECIFIC_DAY	1	28800	f	2011-03-30	1930	32572	\N	\N
82332	SPECIFIC_DAY	1	28800	f	2011-04-28	1930	32573	\N	\N
82333	SPECIFIC_DAY	1	0	f	2011-04-30	1930	32573	\N	\N
82334	SPECIFIC_DAY	1	28800	f	2011-05-02	1930	32573	\N	\N
82335	SPECIFIC_DAY	1	28800	f	2011-04-26	1930	32573	\N	\N
82336	SPECIFIC_DAY	1	0	f	2011-05-01	1930	32573	\N	\N
82337	SPECIFIC_DAY	1	0	f	2011-04-23	1930	32573	\N	\N
82338	SPECIFIC_DAY	1	28800	f	2011-05-04	1930	32573	\N	\N
82339	SPECIFIC_DAY	1	28800	f	2011-05-05	1930	32573	\N	\N
82340	SPECIFIC_DAY	1	0	f	2011-04-22	1930	32573	\N	\N
82341	SPECIFIC_DAY	1	28800	f	2011-04-19	1930	32573	\N	\N
82069	SPECIFIC_DAY	1	28800	f	2011-06-20	1930	81849	\N	\N
82070	SPECIFIC_DAY	1	28800	f	2011-06-16	1930	81849	\N	\N
82071	SPECIFIC_DAY	1	28800	f	2011-06-17	1930	81849	\N	\N
82072	SPECIFIC_DAY	1	28800	f	2011-06-15	1930	81849	\N	\N
82073	SPECIFIC_DAY	1	25200	f	2011-06-21	1930	81849	\N	\N
82074	SPECIFIC_DAY	1	0	f	2011-06-18	1930	81849	\N	\N
82075	SPECIFIC_DAY	1	28800	f	2011-06-14	1930	81849	\N	\N
82076	SPECIFIC_DAY	1	0	f	2011-06-19	1930	81849	\N	\N
82077	SPECIFIC_DAY	1	10800	f	2011-06-13	1930	81849	\N	\N
82078	SPECIFIC_DAY	1	28800	f	2011-06-14	1928	81850	\N	\N
82079	SPECIFIC_DAY	1	25200	f	2011-06-21	1928	81850	\N	\N
82080	SPECIFIC_DAY	1	0	f	2011-06-18	1928	81850	\N	\N
82081	SPECIFIC_DAY	1	28800	f	2011-06-16	1928	81850	\N	\N
82082	SPECIFIC_DAY	1	28800	f	2011-06-20	1928	81850	\N	\N
82083	SPECIFIC_DAY	1	10800	f	2011-06-13	1928	81850	\N	\N
82084	SPECIFIC_DAY	1	28800	f	2011-06-17	1928	81850	\N	\N
82085	SPECIFIC_DAY	1	0	f	2011-06-19	1928	81850	\N	\N
82086	SPECIFIC_DAY	1	28800	f	2011-06-15	1928	81850	\N	\N
82212	SPECIFIC_DAY	1	28800	f	2011-05-20	1928	81851	\N	\N
82213	SPECIFIC_DAY	1	28800	f	2011-05-23	1928	81851	\N	\N
82214	SPECIFIC_DAY	1	0	f	2011-05-22	1928	81851	\N	\N
82347	SPECIFIC_DAY	1	28800	f	2011-05-03	1930	32573	\N	\N
82348	SPECIFIC_DAY	1	28800	f	2011-04-20	1930	32573	\N	\N
82349	SPECIFIC_DAY	1	0	f	2011-04-21	1930	32573	\N	\N
82350	SPECIFIC_DAY	1	28800	f	2011-04-25	1930	32573	\N	\N
90514	GENERIC_DAY	2	0	f	2011-03-05	1926	\N	89806	\N
90515	GENERIC_DAY	2	7200	f	2011-02-25	1926	\N	89806	\N
90516	GENERIC_DAY	2	7200	f	2011-03-10	1922	\N	89806	\N
90517	GENERIC_DAY	2	14400	f	2011-02-16	1926	\N	89807	\N
90518	GENERIC_DAY	2	14400	f	2011-02-18	1924	\N	89807	\N
90519	GENERIC_DAY	2	14400	f	2011-02-18	1926	\N	89807	\N
90520	GENERIC_DAY	2	5400	f	2011-02-22	1924	\N	89807	\N
90521	GENERIC_DAY	2	0	f	2011-02-19	1926	\N	89807	\N
90522	GENERIC_DAY	2	0	f	2011-02-20	1924	\N	89807	\N
90523	GENERIC_DAY	2	14400	f	2011-02-17	1924	\N	89807	\N
90524	GENERIC_DAY	2	14400	f	2011-02-21	1926	\N	89807	\N
90525	GENERIC_DAY	2	14400	f	2011-02-16	1924	\N	89807	\N
90526	GENERIC_DAY	2	14400	f	2011-02-17	1926	\N	89807	\N
90527	GENERIC_DAY	2	0	f	2011-02-20	1926	\N	89807	\N
90528	GENERIC_DAY	2	14400	f	2011-02-21	1924	\N	89807	\N
90529	GENERIC_DAY	2	5400	f	2011-02-22	1926	\N	89807	\N
90530	GENERIC_DAY	2	0	f	2011-02-19	1924	\N	89807	\N
90531	GENERIC_DAY	2	14400	f	2011-02-24	1924	\N	89808	\N
82059	SPECIFIC_DAY	1	0	f	2010-11-21	1928	6749	\N	\N
6806	SPECIFIC_DAY	17	28800	f	2011-01-11	1922	6666	\N	\N
6821	SPECIFIC_DAY	17	28800	f	2011-01-04	1922	6666	\N	\N
6807	SPECIFIC_DAY	17	28800	f	2010-11-25	1922	6666	\N	\N
6822	SPECIFIC_DAY	17	28800	f	2010-12-02	1922	6666	\N	\N
6778	SPECIFIC_DAY	17	0	f	2010-12-05	1922	6666	\N	\N
6824	SPECIFIC_DAY	17	28800	f	2010-12-17	1922	6666	\N	\N
6812	SPECIFIC_DAY	17	28800	f	2010-12-07	1922	6666	\N	\N
6772	SPECIFIC_DAY	17	28800	f	2010-12-03	1922	6666	\N	\N
6784	SPECIFIC_DAY	17	0	f	2010-11-28	1922	6666	\N	\N
6801	SPECIFIC_DAY	17	28800	f	2011-01-12	1922	6666	\N	\N
6794	SPECIFIC_DAY	17	28800	f	2010-11-23	1922	6666	\N	\N
6767	SPECIFIC_DAY	17	28800	f	2010-12-01	1922	6666	\N	\N
6814	SPECIFIC_DAY	17	28800	f	2010-11-30	1922	6666	\N	\N
6813	SPECIFIC_DAY	17	0	f	2010-12-26	1922	6666	\N	\N
6786	SPECIFIC_DAY	17	28800	f	2010-11-19	1922	6666	\N	\N
6769	SPECIFIC_DAY	17	0	f	2010-12-06	1922	6666	\N	\N
6808	SPECIFIC_DAY	17	28800	f	2010-11-22	1922	6666	\N	\N
6816	SPECIFIC_DAY	17	0	f	2011-01-08	1922	6666	\N	\N
6779	SPECIFIC_DAY	17	28800	f	2010-12-23	1922	6666	\N	\N
6796	SPECIFIC_DAY	17	28800	f	2011-01-07	1922	6666	\N	\N
6828	SPECIFIC_DAY	17	28800	f	2010-12-24	1922	6666	\N	\N
6823	SPECIFIC_DAY	17	0	f	2011-01-02	1922	6666	\N	\N
6819	SPECIFIC_DAY	17	0	f	2010-12-11	1922	6666	\N	\N
6788	SPECIFIC_DAY	17	0	f	2010-12-18	1922	6666	\N	\N
6775	SPECIFIC_DAY	17	28800	f	2011-01-13	1922	6666	\N	\N
6799	SPECIFIC_DAY	17	0	f	2011-01-09	1922	6666	\N	\N
6770	SPECIFIC_DAY	17	28800	f	2011-01-06	1922	6666	\N	\N
6791	SPECIFIC_DAY	17	28800	f	2011-01-10	1922	6666	\N	\N
6782	SPECIFIC_DAY	17	28800	f	2010-12-16	1922	6666	\N	\N
6787	SPECIFIC_DAY	17	28800	f	2010-11-24	1922	6666	\N	\N
6792	SPECIFIC_DAY	17	0	f	2011-01-01	1922	6666	\N	\N
6790	SPECIFIC_DAY	17	28800	f	2010-12-20	1922	6666	\N	\N
6797	SPECIFIC_DAY	17	0	f	2010-12-04	1922	6666	\N	\N
6795	SPECIFIC_DAY	17	28800	f	2010-12-13	1922	6666	\N	\N
6815	SPECIFIC_DAY	17	28800	f	2010-12-29	1922	6666	\N	\N
6810	SPECIFIC_DAY	17	0	f	2010-12-19	1922	6666	\N	\N
6830	SPECIFIC_DAY	17	28800	f	2011-01-14	1922	6666	\N	\N
6771	SPECIFIC_DAY	17	28800	f	2010-12-28	1922	6666	\N	\N
6829	SPECIFIC_DAY	17	28800	f	2010-11-15	1922	6666	\N	\N
6780	SPECIFIC_DAY	17	28800	f	2010-12-30	1922	6666	\N	\N
6793	SPECIFIC_DAY	17	28800	f	2010-12-14	1922	6666	\N	\N
6785	SPECIFIC_DAY	17	0	f	2010-11-21	1922	6666	\N	\N
6774	SPECIFIC_DAY	17	28800	f	2010-12-09	1922	6666	\N	\N
6776	SPECIFIC_DAY	17	28800	f	2010-11-16	1922	6666	\N	\N
6800	SPECIFIC_DAY	17	0	f	2010-11-20	1922	6666	\N	\N
6773	SPECIFIC_DAY	17	28800	f	2010-12-31	1922	6666	\N	\N
6818	SPECIFIC_DAY	17	28800	f	2011-01-03	1922	6666	\N	\N
6811	SPECIFIC_DAY	17	28800	f	2011-01-18	1922	6666	\N	\N
6820	SPECIFIC_DAY	17	0	f	2010-12-12	1922	6666	\N	\N
6809	SPECIFIC_DAY	17	28800	f	2010-12-10	1922	6666	\N	\N
82128	SPECIFIC_DAY	1	28800	f	2011-01-07	1928	32561	\N	\N
82129	SPECIFIC_DAY	1	28800	f	2011-01-14	1928	32561	\N	\N
82130	SPECIFIC_DAY	1	28800	f	2010-12-30	1928	32561	\N	\N
82131	SPECIFIC_DAY	1	28800	f	2010-12-23	1928	32561	\N	\N
82132	SPECIFIC_DAY	1	28800	f	2011-01-20	1928	32561	\N	\N
82133	SPECIFIC_DAY	1	28800	f	2011-01-11	1928	32561	\N	\N
82134	SPECIFIC_DAY	1	28800	f	2011-01-12	1928	32561	\N	\N
82135	SPECIFIC_DAY	1	28800	f	2011-01-03	1928	32561	\N	\N
82136	SPECIFIC_DAY	1	28800	f	2011-01-18	1928	32561	\N	\N
82137	SPECIFIC_DAY	1	18000	f	2010-12-15	1928	32561	\N	\N
82138	SPECIFIC_DAY	1	18000	f	2011-01-27	1928	32561	\N	\N
82139	SPECIFIC_DAY	1	28800	f	2011-01-05	1928	32561	\N	\N
82140	SPECIFIC_DAY	1	28800	f	2010-12-24	1928	32561	\N	\N
82141	SPECIFIC_DAY	1	28800	f	2011-01-04	1928	32561	\N	\N
82142	SPECIFIC_DAY	1	0	f	2010-12-26	1928	32561	\N	\N
82143	SPECIFIC_DAY	1	0	f	2011-01-01	1928	32561	\N	\N
82144	SPECIFIC_DAY	1	28800	f	2010-12-20	1928	32561	\N	\N
82145	SPECIFIC_DAY	1	28800	f	2011-01-17	1928	32561	\N	\N
82146	SPECIFIC_DAY	1	10800	f	2011-02-02	1930	32562	\N	\N
82147	SPECIFIC_DAY	1	28800	f	2011-01-31	1930	32562	\N	\N
82148	SPECIFIC_DAY	1	0	f	2011-01-30	1930	32562	\N	\N
82149	SPECIFIC_DAY	1	28800	f	2011-01-28	1930	32562	\N	\N
82150	SPECIFIC_DAY	1	28800	f	2011-02-01	1930	32562	\N	\N
82151	SPECIFIC_DAY	1	10800	f	2011-01-27	1930	32562	\N	\N
82152	SPECIFIC_DAY	1	0	f	2011-01-29	1930	32562	\N	\N
82153	SPECIFIC_DAY	1	28800	f	2011-02-03	1930	32563	\N	\N
82154	SPECIFIC_DAY	1	28800	f	2011-02-14	1930	32563	\N	\N
82155	SPECIFIC_DAY	1	0	f	2011-02-05	1930	32563	\N	\N
7619	SPECIFIC_DAY	5	28800	f	2010-11-15	1930	7780	\N	\N
7620	SPECIFIC_DAY	5	28800	f	2010-11-16	1930	7780	\N	\N
7621	SPECIFIC_DAY	5	14400	f	2010-11-17	1930	7780	\N	\N
7623	SPECIFIC_DAY	5	7200	f	2010-11-23	1930	7781	\N	\N
7625	SPECIFIC_DAY	5	28800	f	2010-11-19	1930	7781	\N	\N
7626	SPECIFIC_DAY	5	14400	f	2010-11-17	1930	7781	\N	\N
7627	SPECIFIC_DAY	5	28800	f	2010-11-22	1930	7781	\N	\N
7624	SPECIFIC_DAY	5	28800	f	2010-11-18	1930	7781	\N	\N
7622	SPECIFIC_DAY	5	0	f	2010-11-21	1930	7781	\N	\N
7628	SPECIFIC_DAY	5	0	f	2010-11-20	1930	7781	\N	\N
82188	SPECIFIC_DAY	1	18000	f	2010-12-31	1928	32566	\N	\N
82189	SPECIFIC_DAY	1	28800	f	2010-12-30	1928	32566	\N	\N
82190	SPECIFIC_DAY	1	7200	f	2011-01-05	1928	32567	\N	\N
82191	SPECIFIC_DAY	1	28800	f	2011-01-04	1928	32567	\N	\N
82192	SPECIFIC_DAY	1	0	f	2011-01-02	1928	32567	\N	\N
82193	SPECIFIC_DAY	1	0	f	2011-01-01	1928	32567	\N	\N
82194	SPECIFIC_DAY	1	10800	f	2010-12-31	1928	32567	\N	\N
82195	SPECIFIC_DAY	1	28800	f	2011-01-03	1928	32567	\N	\N
82196	SPECIFIC_DAY	1	7200	f	2011-01-12	1928	32568	\N	\N
82197	SPECIFIC_DAY	1	0	f	2011-01-09	1928	32568	\N	\N
82198	SPECIFIC_DAY	1	28800	f	2011-01-10	1928	32568	\N	\N
82199	SPECIFIC_DAY	1	28800	f	2011-01-11	1928	32568	\N	\N
82200	SPECIFIC_DAY	1	28800	f	2011-01-06	1928	32568	\N	\N
82201	SPECIFIC_DAY	1	28800	f	2011-01-07	1928	32568	\N	\N
82202	SPECIFIC_DAY	1	21600	f	2011-01-05	1928	32568	\N	\N
82203	SPECIFIC_DAY	1	0	f	2011-01-08	1928	32568	\N	\N
7482	SPECIFIC_DAY	6	7200	f	2010-11-22	1930	6690	\N	\N
7475	SPECIFIC_DAY	6	7200	f	2010-11-24	1930	6690	\N	\N
7473	SPECIFIC_DAY	6	7200	f	2010-11-17	1930	6690	\N	\N
7480	SPECIFIC_DAY	6	0	f	2010-11-21	1930	6690	\N	\N
7477	SPECIFIC_DAY	6	7200	f	2010-11-19	1930	6690	\N	\N
7479	SPECIFIC_DAY	6	7200	f	2010-11-15	1930	6690	\N	\N
7478	SPECIFIC_DAY	6	7200	f	2010-11-18	1930	6690	\N	\N
7476	SPECIFIC_DAY	6	7200	f	2010-11-16	1930	6690	\N	\N
7474	SPECIFIC_DAY	6	7200	f	2010-11-23	1930	6690	\N	\N
7481	SPECIFIC_DAY	6	0	f	2010-11-20	1930	6690	\N	\N
7488	SPECIFIC_DAY	6	7200	f	2010-11-30	1928	6752	\N	\N
7498	SPECIFIC_DAY	6	7200	f	2010-11-17	1928	6752	\N	\N
7495	SPECIFIC_DAY	6	7200	f	2010-11-24	1928	6752	\N	\N
7497	SPECIFIC_DAY	6	0	f	2010-11-27	1928	6752	\N	\N
7489	SPECIFIC_DAY	6	7200	f	2010-11-18	1928	6752	\N	\N
7493	SPECIFIC_DAY	6	7200	f	2010-11-19	1928	6752	\N	\N
7487	SPECIFIC_DAY	6	7200	f	2010-11-16	1928	6752	\N	\N
7483	SPECIFIC_DAY	6	7200	f	2010-11-25	1928	6752	\N	\N
7490	SPECIFIC_DAY	6	0	f	2010-11-20	1928	6752	\N	\N
7494	SPECIFIC_DAY	6	7200	f	2010-11-15	1928	6752	\N	\N
7485	SPECIFIC_DAY	6	7200	f	2010-11-26	1928	6752	\N	\N
7492	SPECIFIC_DAY	6	7200	f	2010-11-22	1928	6752	\N	\N
7491	SPECIFIC_DAY	6	0	f	2010-11-28	1928	6752	\N	\N
7496	SPECIFIC_DAY	6	7200	f	2010-11-23	1928	6752	\N	\N
7486	SPECIFIC_DAY	6	7200	f	2010-11-29	1928	6752	\N	\N
7484	SPECIFIC_DAY	6	0	f	2010-11-21	1928	6752	\N	\N
7514	SPECIFIC_DAY	6	0	f	2010-11-21	1928	6753	\N	\N
7513	SPECIFIC_DAY	6	7200	f	2010-11-30	1928	6753	\N	\N
7500	SPECIFIC_DAY	6	0	f	2010-11-28	1928	6753	\N	\N
7504	SPECIFIC_DAY	6	7200	f	2010-11-24	1928	6753	\N	\N
7499	SPECIFIC_DAY	6	7200	f	2010-11-17	1928	6753	\N	\N
7509	SPECIFIC_DAY	6	7200	f	2010-11-16	1928	6753	\N	\N
7506	SPECIFIC_DAY	6	7200	f	2010-11-18	1928	6753	\N	\N
7507	SPECIFIC_DAY	6	7200	f	2010-11-25	1928	6753	\N	\N
7511	SPECIFIC_DAY	6	7200	f	2010-11-22	1928	6753	\N	\N
7502	SPECIFIC_DAY	6	0	f	2010-11-27	1928	6753	\N	\N
7503	SPECIFIC_DAY	6	7200	f	2010-11-29	1928	6753	\N	\N
7505	SPECIFIC_DAY	6	7200	f	2010-11-26	1928	6753	\N	\N
7501	SPECIFIC_DAY	6	0	f	2010-11-20	1928	6753	\N	\N
7508	SPECIFIC_DAY	6	7200	f	2010-11-19	1928	6753	\N	\N
7510	SPECIFIC_DAY	6	7200	f	2010-11-23	1928	6753	\N	\N
7512	SPECIFIC_DAY	6	7200	f	2010-11-15	1928	6753	\N	\N
7531	SPECIFIC_DAY	6	7200	f	2010-12-13	1930	6754	\N	\N
7535	SPECIFIC_DAY	6	7200	f	2010-12-07	1930	6754	\N	\N
7518	SPECIFIC_DAY	6	7200	f	2010-11-25	1930	6754	\N	\N
7522	SPECIFIC_DAY	6	0	f	2010-12-08	1930	6754	\N	\N
7542	SPECIFIC_DAY	6	7200	f	2010-11-19	1930	6754	\N	\N
7541	SPECIFIC_DAY	6	7200	f	2010-12-10	1930	6754	\N	\N
7534	SPECIFIC_DAY	6	7200	f	2010-12-01	1930	6754	\N	\N
7515	SPECIFIC_DAY	6	0	f	2010-12-04	1930	6754	\N	\N
7533	SPECIFIC_DAY	6	7200	f	2010-11-23	1930	6754	\N	\N
7532	SPECIFIC_DAY	6	7200	f	2010-12-03	1930	6754	\N	\N
7523	SPECIFIC_DAY	6	0	f	2010-11-27	1930	6754	\N	\N
7520	SPECIFIC_DAY	6	7200	f	2010-12-14	1930	6754	\N	\N
7528	SPECIFIC_DAY	6	7200	f	2010-11-29	1930	6754	\N	\N
7544	SPECIFIC_DAY	6	0	f	2010-11-21	1930	6754	\N	\N
7537	SPECIFIC_DAY	6	0	f	2010-11-20	1930	6754	\N	\N
7539	SPECIFIC_DAY	6	7200	f	2010-12-02	1930	6754	\N	\N
7524	SPECIFIC_DAY	6	0	f	2010-12-06	1930	6754	\N	\N
7540	SPECIFIC_DAY	6	7200	f	2010-11-26	1930	6754	\N	\N
7519	SPECIFIC_DAY	6	0	f	2010-11-28	1930	6754	\N	\N
7536	SPECIFIC_DAY	6	7200	f	2010-11-15	1930	6754	\N	\N
7538	SPECIFIC_DAY	6	7200	f	2010-11-22	1930	6754	\N	\N
7521	SPECIFIC_DAY	6	7200	f	2010-11-17	1930	6754	\N	\N
7543	SPECIFIC_DAY	6	7200	f	2010-11-24	1930	6754	\N	\N
7530	SPECIFIC_DAY	6	0	f	2010-12-12	1930	6754	\N	\N
7517	SPECIFIC_DAY	6	0	f	2010-12-11	1930	6754	\N	\N
7525	SPECIFIC_DAY	6	7200	f	2010-11-16	1930	6754	\N	\N
7516	SPECIFIC_DAY	6	0	f	2010-12-05	1930	6754	\N	\N
7529	SPECIFIC_DAY	6	7200	f	2010-12-09	1930	6754	\N	\N
7526	SPECIFIC_DAY	6	7200	f	2010-11-18	1930	6754	\N	\N
7527	SPECIFIC_DAY	6	7200	f	2010-11-30	1930	6754	\N	\N
7552	SPECIFIC_DAY	6	7200	f	2010-11-16	1930	6755	\N	\N
7550	SPECIFIC_DAY	6	7200	f	2010-11-17	1930	6755	\N	\N
7559	SPECIFIC_DAY	6	7200	f	2010-11-24	1930	6755	\N	\N
7555	SPECIFIC_DAY	6	0	f	2010-11-20	1930	6755	\N	\N
7556	SPECIFIC_DAY	6	0	f	2010-11-21	1930	6755	\N	\N
7548	SPECIFIC_DAY	6	7200	f	2010-11-15	1930	6755	\N	\N
7549	SPECIFIC_DAY	6	0	f	2010-11-28	1930	6755	\N	\N
7553	SPECIFIC_DAY	6	0	f	2010-11-27	1930	6755	\N	\N
7557	SPECIFIC_DAY	6	7200	f	2010-11-22	1930	6755	\N	\N
7545	SPECIFIC_DAY	6	7200	f	2010-11-26	1930	6755	\N	\N
7554	SPECIFIC_DAY	6	7200	f	2010-11-19	1930	6755	\N	\N
7546	SPECIFIC_DAY	6	7200	f	2010-11-29	1930	6755	\N	\N
7551	SPECIFIC_DAY	6	7200	f	2010-11-30	1930	6755	\N	\N
7560	SPECIFIC_DAY	6	7200	f	2010-11-23	1930	6755	\N	\N
7558	SPECIFIC_DAY	6	7200	f	2010-11-18	1930	6755	\N	\N
7547	SPECIFIC_DAY	6	7200	f	2010-11-25	1930	6755	\N	\N
82215	SPECIFIC_DAY	1	14400	f	2011-05-18	1928	81851	\N	\N
82216	SPECIFIC_DAY	1	28800	f	2011-05-24	1928	81851	\N	\N
82217	SPECIFIC_DAY	1	14400	f	2011-05-25	1928	81851	\N	\N
82218	SPECIFIC_DAY	1	0	f	2011-05-21	1928	81851	\N	\N
82219	SPECIFIC_DAY	1	28800	f	2011-05-19	1928	81851	\N	\N
82220	SPECIFIC_DAY	1	0	f	2011-05-21	1930	81852	\N	\N
82221	SPECIFIC_DAY	1	28800	f	2011-05-23	1930	81852	\N	\N
82222	SPECIFIC_DAY	1	28800	f	2011-05-24	1930	81852	\N	\N
82223	SPECIFIC_DAY	1	14400	f	2011-05-18	1930	81852	\N	\N
82224	SPECIFIC_DAY	1	28800	f	2011-05-19	1930	81852	\N	\N
82225	SPECIFIC_DAY	1	14400	f	2011-05-25	1930	81852	\N	\N
82226	SPECIFIC_DAY	1	0	f	2011-05-22	1930	81852	\N	\N
82227	SPECIFIC_DAY	1	28800	f	2011-05-20	1930	81852	\N	\N
82228	SPECIFIC_DAY	1	21600	f	2011-05-26	1928	81853	\N	\N
82229	SPECIFIC_DAY	1	14400	f	2011-05-25	1928	81853	\N	\N
82230	SPECIFIC_DAY	1	14400	f	2011-05-25	1930	81854	\N	\N
82231	SPECIFIC_DAY	1	21600	f	2011-05-26	1930	81854	\N	\N
82232	SPECIFIC_DAY	1	7200	f	2011-05-26	1928	81855	\N	\N
82233	SPECIFIC_DAY	1	28800	f	2011-06-01	1928	81855	\N	\N
82234	SPECIFIC_DAY	1	0	f	2011-05-29	1928	81855	\N	\N
82235	SPECIFIC_DAY	1	0	f	2011-05-28	1928	81855	\N	\N
82236	SPECIFIC_DAY	1	28800	f	2011-05-31	1928	81855	\N	\N
82237	SPECIFIC_DAY	1	28800	f	2011-06-03	1928	81855	\N	\N
82238	SPECIFIC_DAY	1	28800	f	2011-05-27	1928	81855	\N	\N
82239	SPECIFIC_DAY	1	28800	f	2011-06-02	1928	81855	\N	\N
82240	SPECIFIC_DAY	1	28800	f	2011-05-30	1928	81855	\N	\N
82241	SPECIFIC_DAY	1	28800	f	2011-05-30	1930	81856	\N	\N
82242	SPECIFIC_DAY	1	28800	f	2011-05-31	1930	81856	\N	\N
82243	SPECIFIC_DAY	1	7200	f	2011-05-26	1930	81856	\N	\N
82244	SPECIFIC_DAY	1	0	f	2011-05-29	1930	81856	\N	\N
82245	SPECIFIC_DAY	1	0	f	2011-05-28	1930	81856	\N	\N
82246	SPECIFIC_DAY	1	28800	f	2011-06-03	1930	81856	\N	\N
82247	SPECIFIC_DAY	1	28800	f	2011-06-02	1930	81856	\N	\N
82248	SPECIFIC_DAY	1	28800	f	2011-06-01	1930	81856	\N	\N
82249	SPECIFIC_DAY	1	28800	f	2011-05-27	1930	81856	\N	\N
82250	SPECIFIC_DAY	1	3600	f	2011-06-09	1930	81857	\N	\N
82251	SPECIFIC_DAY	1	0	f	2011-06-05	1930	81857	\N	\N
82252	SPECIFIC_DAY	1	28800	f	2011-06-08	1930	81857	\N	\N
82253	SPECIFIC_DAY	1	0	f	2011-06-04	1930	81857	\N	\N
82254	SPECIFIC_DAY	1	28800	f	2011-06-06	1930	81857	\N	\N
82255	SPECIFIC_DAY	1	28800	f	2011-06-07	1930	81857	\N	\N
82256	SPECIFIC_DAY	1	0	f	2011-06-05	1928	81858	\N	\N
82257	SPECIFIC_DAY	1	28800	f	2011-06-08	1928	81858	\N	\N
82258	SPECIFIC_DAY	1	0	f	2011-06-04	1928	81858	\N	\N
82259	SPECIFIC_DAY	1	28800	f	2011-06-06	1928	81858	\N	\N
82260	SPECIFIC_DAY	1	28800	f	2011-06-07	1928	81858	\N	\N
82261	SPECIFIC_DAY	1	3600	f	2011-06-09	1928	81858	\N	\N
82262	SPECIFIC_DAY	1	0	f	2011-06-11	1928	81859	\N	\N
82263	SPECIFIC_DAY	1	18000	f	2011-06-13	1928	81859	\N	\N
82264	SPECIFIC_DAY	1	25200	f	2011-06-09	1928	81859	\N	\N
82265	SPECIFIC_DAY	1	28800	f	2011-06-10	1928	81859	\N	\N
82266	SPECIFIC_DAY	1	0	f	2011-06-12	1928	81859	\N	\N
82267	SPECIFIC_DAY	1	18000	f	2011-06-13	1930	81860	\N	\N
82268	SPECIFIC_DAY	1	0	f	2011-06-12	1930	81860	\N	\N
82269	SPECIFIC_DAY	1	25200	f	2011-06-09	1930	81860	\N	\N
82270	SPECIFIC_DAY	1	0	f	2011-06-11	1930	81860	\N	\N
82271	SPECIFIC_DAY	1	28800	f	2011-06-10	1930	81860	\N	\N
82302	SPECIFIC_DAY	1	0	f	2011-03-19	1930	32571	\N	\N
82303	SPECIFIC_DAY	1	28800	f	2011-03-16	1930	32571	\N	\N
82304	SPECIFIC_DAY	1	28800	f	2011-03-08	1930	32571	\N	\N
82342	SPECIFIC_DAY	1	28800	f	2011-04-29	1930	32573	\N	\N
82343	SPECIFIC_DAY	1	28800	f	2011-04-18	1930	32573	\N	\N
82344	SPECIFIC_DAY	1	0	f	2011-04-16	1930	32573	\N	\N
82345	SPECIFIC_DAY	1	14400	f	2011-04-15	1930	32573	\N	\N
82346	SPECIFIC_DAY	1	0	f	2011-04-17	1930	32573	\N	\N
82351	SPECIFIC_DAY	1	0	f	2011-04-24	1930	32573	\N	\N
82352	SPECIFIC_DAY	1	28800	f	2011-04-27	1930	32573	\N	\N
82353	SPECIFIC_DAY	1	28800	f	2011-05-17	1930	32574	\N	\N
82354	SPECIFIC_DAY	1	28800	f	2011-05-19	1930	32574	\N	\N
82355	SPECIFIC_DAY	1	28800	f	2011-05-16	1930	32574	\N	\N
82356	SPECIFIC_DAY	1	28800	f	2011-05-12	1930	32574	\N	\N
82357	SPECIFIC_DAY	1	14400	f	2011-05-20	1930	32574	\N	\N
82358	SPECIFIC_DAY	1	28800	f	2011-05-13	1930	32574	\N	\N
82359	SPECIFIC_DAY	1	28800	f	2011-05-11	1930	32574	\N	\N
82360	SPECIFIC_DAY	1	0	f	2011-05-14	1930	32574	\N	\N
82361	SPECIFIC_DAY	1	0	f	2011-05-15	1930	32574	\N	\N
82362	SPECIFIC_DAY	1	0	f	2011-05-08	1930	32574	\N	\N
82363	SPECIFIC_DAY	1	28800	f	2011-05-10	1930	32574	\N	\N
82364	SPECIFIC_DAY	1	0	f	2011-05-07	1930	32574	\N	\N
82365	SPECIFIC_DAY	1	28800	f	2011-05-06	1930	32574	\N	\N
82366	SPECIFIC_DAY	1	28800	f	2011-05-09	1930	32574	\N	\N
82367	SPECIFIC_DAY	1	28800	f	2011-05-18	1930	32574	\N	\N
82368	SPECIFIC_DAY	1	14400	f	2011-05-20	1930	32575	\N	\N
82369	SPECIFIC_DAY	1	0	f	2011-05-21	1930	32575	\N	\N
82370	SPECIFIC_DAY	1	28800	f	2011-05-27	1930	32575	\N	\N
82371	SPECIFIC_DAY	1	28800	f	2011-05-23	1930	32575	\N	\N
82372	SPECIFIC_DAY	1	0	f	2011-05-28	1930	32575	\N	\N
82373	SPECIFIC_DAY	1	0	f	2011-05-22	1930	32575	\N	\N
82374	SPECIFIC_DAY	1	28800	f	2011-05-24	1930	32575	\N	\N
82375	SPECIFIC_DAY	1	28800	f	2011-05-31	1930	32575	\N	\N
82376	SPECIFIC_DAY	1	14400	f	2011-06-01	1930	32575	\N	\N
82377	SPECIFIC_DAY	1	28800	f	2011-05-30	1930	32575	\N	\N
82378	SPECIFIC_DAY	1	28800	f	2011-05-25	1930	32575	\N	\N
82379	SPECIFIC_DAY	1	28800	f	2011-05-26	1930	32575	\N	\N
82380	SPECIFIC_DAY	1	0	f	2011-05-29	1930	32575	\N	\N
82381	SPECIFIC_DAY	1	0	f	2011-02-20	1928	81861	\N	\N
82382	SPECIFIC_DAY	1	28800	f	2011-02-21	1928	81861	\N	\N
82383	SPECIFIC_DAY	1	0	f	2011-02-19	1928	81861	\N	\N
82384	SPECIFIC_DAY	1	28800	f	2011-02-22	1928	81861	\N	\N
82385	SPECIFIC_DAY	1	3600	f	2011-02-18	1928	81861	\N	\N
82386	SPECIFIC_DAY	1	25200	f	2011-02-25	1928	81861	\N	\N
82387	SPECIFIC_DAY	1	28800	f	2011-02-23	1928	81861	\N	\N
82388	SPECIFIC_DAY	1	28800	f	2011-02-24	1928	81861	\N	\N
82389	SPECIFIC_DAY	1	28800	f	2011-03-03	1928	81862	\N	\N
82390	SPECIFIC_DAY	1	28800	f	2011-03-01	1928	81862	\N	\N
82391	SPECIFIC_DAY	1	0	f	2011-03-05	1928	81862	\N	\N
82392	SPECIFIC_DAY	1	28800	f	2011-03-04	1928	81862	\N	\N
82393	SPECIFIC_DAY	1	28800	f	2011-03-02	1928	81862	\N	\N
82394	SPECIFIC_DAY	1	28800	f	2011-02-28	1928	81862	\N	\N
82395	SPECIFIC_DAY	1	28800	f	2011-03-07	1928	81862	\N	\N
82396	SPECIFIC_DAY	1	0	f	2011-02-26	1928	81862	\N	\N
82397	SPECIFIC_DAY	1	0	f	2011-03-06	1928	81862	\N	\N
82398	SPECIFIC_DAY	1	0	f	2011-02-27	1928	81862	\N	\N
82399	SPECIFIC_DAY	1	25200	f	2011-03-08	1928	81862	\N	\N
82400	SPECIFIC_DAY	1	3600	f	2011-02-25	1928	81862	\N	\N
82401	SPECIFIC_DAY	1	28800	f	2011-03-09	1928	81863	\N	\N
82402	SPECIFIC_DAY	1	0	f	2011-03-19	1928	81863	\N	\N
82403	SPECIFIC_DAY	1	0	f	2011-03-13	1928	81863	\N	\N
82404	SPECIFIC_DAY	1	28800	f	2011-03-18	1928	81863	\N	\N
82405	SPECIFIC_DAY	1	28800	f	2011-03-14	1928	81863	\N	\N
82406	SPECIFIC_DAY	1	28800	f	2011-03-15	1928	81863	\N	\N
82407	SPECIFIC_DAY	1	28800	f	2011-03-24	1928	81863	\N	\N
82408	SPECIFIC_DAY	1	28800	f	2011-03-23	1928	81863	\N	\N
82409	SPECIFIC_DAY	1	28800	f	2011-03-16	1928	81863	\N	\N
82410	SPECIFIC_DAY	1	28800	f	2011-03-21	1928	81863	\N	\N
82411	SPECIFIC_DAY	1	28800	f	2011-03-22	1928	81863	\N	\N
82412	SPECIFIC_DAY	1	10800	f	2011-03-25	1928	81863	\N	\N
82413	SPECIFIC_DAY	1	0	f	2011-03-12	1928	81863	\N	\N
82414	SPECIFIC_DAY	1	28800	f	2011-03-17	1928	81863	\N	\N
82415	SPECIFIC_DAY	1	28800	f	2011-03-11	1928	81863	\N	\N
82416	SPECIFIC_DAY	1	28800	f	2011-03-10	1928	81863	\N	\N
82417	SPECIFIC_DAY	1	0	f	2011-03-20	1928	81863	\N	\N
82418	SPECIFIC_DAY	1	3600	f	2011-03-08	1928	81863	\N	\N
82419	SPECIFIC_DAY	1	28800	f	2011-03-29	1928	81864	\N	\N
82420	SPECIFIC_DAY	1	28800	f	2011-04-06	1928	81864	\N	\N
82421	SPECIFIC_DAY	1	28800	f	2011-03-31	1928	81864	\N	\N
82422	SPECIFIC_DAY	1	28800	f	2011-04-04	1928	81864	\N	\N
82423	SPECIFIC_DAY	1	21600	f	2011-04-07	1928	81864	\N	\N
82424	SPECIFIC_DAY	1	0	f	2011-04-03	1928	81864	\N	\N
82425	SPECIFIC_DAY	1	0	f	2011-03-27	1928	81864	\N	\N
82426	SPECIFIC_DAY	1	0	f	2011-03-26	1928	81864	\N	\N
82427	SPECIFIC_DAY	1	28800	f	2011-04-05	1928	81864	\N	\N
82428	SPECIFIC_DAY	1	0	f	2011-04-02	1928	81864	\N	\N
82429	SPECIFIC_DAY	1	28800	f	2011-03-30	1928	81864	\N	\N
82430	SPECIFIC_DAY	1	18000	f	2011-03-25	1928	81864	\N	\N
82431	SPECIFIC_DAY	1	28800	f	2011-03-28	1928	81864	\N	\N
82432	SPECIFIC_DAY	1	28800	f	2011-04-01	1928	81864	\N	\N
82433	SPECIFIC_DAY	1	28800	f	2011-04-13	1928	81865	\N	\N
82434	SPECIFIC_DAY	1	0	f	2011-04-22	1928	81865	\N	\N
82435	SPECIFIC_DAY	1	28800	f	2011-04-25	1928	81865	\N	\N
82436	SPECIFIC_DAY	1	0	f	2011-04-17	1928	81865	\N	\N
82437	SPECIFIC_DAY	1	0	f	2011-04-09	1928	81865	\N	\N
82438	SPECIFIC_DAY	1	28800	f	2011-04-26	1928	81865	\N	\N
82439	SPECIFIC_DAY	1	0	f	2011-04-23	1928	81865	\N	\N
82440	SPECIFIC_DAY	1	28800	f	2011-04-20	1928	81865	\N	\N
82441	SPECIFIC_DAY	1	28800	f	2011-04-12	1928	81865	\N	\N
82442	SPECIFIC_DAY	1	7200	f	2011-04-07	1928	81865	\N	\N
82443	SPECIFIC_DAY	1	28800	f	2011-04-08	1928	81865	\N	\N
82444	SPECIFIC_DAY	1	28800	f	2011-04-15	1928	81865	\N	\N
82445	SPECIFIC_DAY	1	0	f	2011-04-21	1928	81865	\N	\N
82446	SPECIFIC_DAY	1	28800	f	2011-04-19	1928	81865	\N	\N
82447	SPECIFIC_DAY	1	0	f	2011-04-24	1928	81865	\N	\N
82448	SPECIFIC_DAY	1	0	f	2011-04-16	1928	81865	\N	\N
82449	SPECIFIC_DAY	1	28800	f	2011-04-14	1928	81865	\N	\N
82450	SPECIFIC_DAY	1	28800	f	2011-04-18	1928	81865	\N	\N
82451	SPECIFIC_DAY	1	0	f	2011-04-10	1928	81865	\N	\N
82452	SPECIFIC_DAY	1	28800	f	2011-04-11	1928	81865	\N	\N
82453	SPECIFIC_DAY	1	28800	f	2011-04-28	1928	81866	\N	\N
82454	SPECIFIC_DAY	1	14400	f	2011-04-29	1928	81866	\N	\N
82455	SPECIFIC_DAY	1	28800	f	2011-04-27	1928	81866	\N	\N
82456	SPECIFIC_DAY	1	28800	f	2011-05-04	1928	81867	\N	\N
82457	SPECIFIC_DAY	1	28800	f	2011-05-05	1928	81867	\N	\N
82458	SPECIFIC_DAY	1	0	f	2011-05-07	1928	81867	\N	\N
82459	SPECIFIC_DAY	1	0	f	2011-05-01	1928	81867	\N	\N
82460	SPECIFIC_DAY	1	0	f	2011-04-30	1928	81867	\N	\N
82461	SPECIFIC_DAY	1	28800	f	2011-05-06	1928	81867	\N	\N
82462	SPECIFIC_DAY	1	21600	f	2011-05-09	1928	81867	\N	\N
82463	SPECIFIC_DAY	1	14400	f	2011-04-29	1928	81867	\N	\N
82464	SPECIFIC_DAY	1	28800	f	2011-05-02	1928	81867	\N	\N
82465	SPECIFIC_DAY	1	28800	f	2011-05-03	1928	81867	\N	\N
82466	SPECIFIC_DAY	1	0	f	2011-05-08	1928	81867	\N	\N
82467	SPECIFIC_DAY	1	14400	f	2011-05-18	1928	81868	\N	\N
82468	SPECIFIC_DAY	1	28800	f	2011-05-10	1928	81868	\N	\N
82469	SPECIFIC_DAY	1	28800	f	2011-05-13	1928	81868	\N	\N
82470	SPECIFIC_DAY	1	0	f	2011-05-14	1928	81868	\N	\N
82471	SPECIFIC_DAY	1	28800	f	2011-05-12	1928	81868	\N	\N
82472	SPECIFIC_DAY	1	28800	f	2011-05-17	1928	81868	\N	\N
82473	SPECIFIC_DAY	1	28800	f	2011-05-11	1928	81868	\N	\N
82474	SPECIFIC_DAY	1	0	f	2011-05-15	1928	81868	\N	\N
82475	SPECIFIC_DAY	1	28800	f	2011-05-16	1928	81868	\N	\N
82476	SPECIFIC_DAY	1	7200	f	2011-05-09	1928	81868	\N	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
2228816	4	89109	89110	\N	0
2228817	4	89110	89111	\N	0
2228818	4	89111	89112	\N	0
29425664	0	89108	89112	\N	2
2228274	17	6364	6365	\N	0
2228808	6	6450	6451	\N	0
2228275	17	6365	6366	\N	0
2228276	17	6366	6367	\N	0
2228809	6	6451	6452	\N	0
2228288	16	6369	6380	\N	1
2228810	6	6452	6453	\N	0
2228755	7	6460	85751	\N	1
2228290	16	6370	6390	\N	1
2228287	16	6371	6404	\N	1
2228291	16	6372	6424	\N	1
2228289	16	6373	6430	\N	1
2228756	7	85751	85769	\N	0
2228299	15	6375	6376	\N	0
2228653	1	6438	6439	\N	0
2228654	1	6439	6440	\N	0
2228655	1	6440	6441	\N	0
2228300	15	6376	6377	\N	0
2228301	15	6377	6378	\N	0
2228302	15	6378	6379	\N	0
2228303	16	6379	6435	\N	0
2228403	14	6379	6400	\N	0
2228404	14	6381	6382	\N	0
2228405	14	6382	6384	\N	0
2228406	14	6384	6385	\N	0
2228407	14	6385	6386	\N	0
2228408	14	6386	6387	\N	0
2228409	14	6387	6388	\N	0
2228410	14	6388	6392	\N	0
2228411	14	6392	6393	\N	0
2228412	14	6393	6395	\N	0
2228749	2	6437	6444	\N	0
2228652	4	6437	6438	\N	0
2228750	2	6444	6445	\N	0
2228751	2	6445	6446	\N	0
2228752	2	6446	6447	\N	0
2228413	14	6395	6396	\N	0
2228414	14	6396	6397	\N	0
2228754	7	85769	85794	\N	0
2228753	7	85794	85800	\N	0
2228812	1	89104	89105	\N	0
2228811	1	89105	89106	\N	0
2228415	14	6397	6398	\N	0
2228466	12	6398	6405	\N	0
2228416	14	6398	6436	\N	0
2228424	13	6400	6401	\N	0
2228425	13	6401	6402	\N	0
2228426	13	6402	6403	\N	0
2228645	3	6403	6414	\N	0
2228467	12	6405	6406	\N	0
2228468	12	6406	6407	\N	0
2228469	12	6407	6409	\N	0
2228470	12	6409	6410	\N	0
2228471	12	6410	6411	\N	0
2228472	12	6411	6412	\N	0
2228514	11	6414	6415	\N	0
2228515	11	6415	6416	\N	0
2228516	11	6416	6417	\N	0
2228517	11	6417	6418	\N	0
2228518	11	6418	6420	\N	0
2228519	11	6420	6421	\N	0
2228539	8	6421	6422	\N	0
2228540	8	6422	6425	\N	0
2228541	8	6425	6426	\N	0
2228542	8	6426	6427	\N	0
2228543	8	6427	6428	\N	0
2228544	8	6428	6429	\N	0
2228538	8	6429	6431	\N	0
29720576	0	91405	91408	\N	0
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
84922	85269	100.00
84923	85276	100.00
84924	85277	100.00
84925	85278	100.00
84926	85279	100.00
84929	85281	100.00
84930	85282	100.00
84931	85283	100.00
84932	85284	100.00
84933	85285	100.00
84936	85287	100.00
84937	85288	100.00
84938	85289	100.00
84939	85290	100.00
84940	85291	100.00
85347	85294	100.00
85348	85295	100.00
85351	85297	100.00
85352	85298	100.00
85353	85299	100.00
85354	85300	100.00
85355	85301	100.00
85358	85303	100.00
85359	85304	100.00
85362	85306	100.00
85363	85307	100.00
85364	85308	100.00
85365	85309	100.00
85370	85311	100.00
85371	85312	100.00
6518	5644	100.00
34815	33734	100.00
6520	33735	100.00
6521	33736	100.00
6522	33737	100.00
6469	3541	100.00
6470	3581	100.00
6471	5567	100.00
6472	5568	100.00
6477	3600	100.00
85372	85313	100.00
85373	85314	100.00
85376	85316	100.00
85377	85316	100.00
85378	85318	100.00
85379	85319	100.00
85382	85321	100.00
85383	85322	100.00
85384	85323	100.00
6262	2384	100.00
6263	2409	100.00
6264	2410	100.00
6265	2411	100.00
6266	2412	100.00
6269	2364	100.00
6270	2421	100.00
6271	2422	100.00
6272	2423	100.00
6273	3218	100.00
6276	2365	100.00
6277	3220	100.00
6278	3131	100.00
6279	3221	100.00
6280	3585	100.00
6283	2389	100.00
6284	3555	100.00
88998	89385	100.00
6478	3601	100.00
6479	2391	100.00
6480	3617	100.00
6483	2390	100.00
34963	2390	100.00
6484	3620	100.00
6287	3539	100.00
6288	3557	100.00
6289	3576	100.00
6290	3577	100.00
6291	3589	100.00
6485	3621	100.00
6488	3632	100.00
6489	3633	100.00
6490	5556	100.00
6491	5560	100.00
6494	5600	100.00
6495	5601	100.00
6496	5602	100.00
6497	5603	100.00
6498	5604	100.00
6501	5606	100.00
6502	5607	100.00
6503	5608	100.00
6508	2392	100.00
6509	5630	100.00
6510	5640	100.00
6511	5641	100.00
6512	5642	100.00
6515	3222	100.00
88999	89386	100.00
89000	89387	100.00
6465	3540	100.00
6466	3579	100.00
89021	89414	100.00
89022	89421	100.00
89023	89422	100.00
89024	89423	100.00
89025	89424	100.00
85385	85324	100.00
85388	85326	100.00
85389	85327	100.00
85390	85328	100.00
85391	85329	100.00
85392	85330	100.00
85395	85332	100.00
85396	85333	100.00
85397	85334	100.00
85403	85336	100.00
85404	85337	100.00
85405	85338	100.00
85406	85339	100.00
85407	85340	100.00
85410	85341	100.00
88506	88595	100.00
88507	88602	100.00
88508	88603	100.00
88509	88604	100.00
88510	88605	100.00
88513	88607	100.00
88514	88608	100.00
88515	88609	100.00
88516	88610	100.00
88517	88611	100.00
88520	88613	100.00
88521	88614	100.00
88522	88615	100.00
88523	88616	100.00
88524	88617	100.00
88527	88620	100.00
88528	88621	100.00
88531	88623	100.00
88532	88624	100.00
88533	88625	100.00
88534	88626	100.00
88535	88627	100.00
88538	88629	100.00
88539	88630	100.00
88542	88632	100.00
88543	88633	100.00
88544	88634	100.00
88545	88635	100.00
88550	88637	100.00
88551	88638	100.00
88552	88639	100.00
88553	88640	100.00
88557	88642	100.00
88556	88642	100.00
88558	88644	100.00
88559	88645	100.00
88562	88647	100.00
88563	88648	100.00
88564	88649	100.00
88565	88650	100.00
88568	88652	100.00
88569	88653	100.00
88570	88654	100.00
88571	88655	100.00
88572	88656	100.00
88575	88658	100.00
88576	88659	100.00
88981	88660	100.00
88987	88662	100.00
88988	88663	100.00
88989	88664	100.00
88990	88665	100.00
88991	88666	100.00
88994	88667	100.00
91304	90811	100.00
91305	90814	100.00
\.


--
-- Data for Name: effortperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY effortperday (base_calendar_id, effort, day_id) FROM stdin;
606	28800	0
606	28800	1
606	28800	2
606	28800	3
606	28800	4
606	0	5
606	0	6
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
2222	1	Igalia (propia)	B15804842	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	1114
2223	1	Igalia (demo)	onlinedemo_code	t	t	t	http://www.navalplan.org/navalplan-demo/	wswriter	wswriter	1114
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id, resourcetype) FROM stdin;
81774	0
81775	0
81776	0
81777	0
89705	0
89706	0
89707	0
89708	0
89709	0
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario, startdate, durationstartinfirstday, enddate, durationinlastday) FROM stdin;
85856	3	81774	404	2011-03-01	0	2011-05-05	0
85857	3	81775	404	2011-03-01	0	2011-03-08	0
85858	3	81776	404	2011-03-08	0	2011-03-15	0
85859	1	81777	404	2011-09-01	0	2011-11-05	0
89806	2	89705	404	2011-02-16	0	2011-04-20	0
89807	2	89706	404	2011-02-16	0	2011-02-22	10800
89808	2	89707	404	2011-02-22	10800	2011-02-28	21600
89809	2	89708	404	2011-02-28	21600	2011-03-09	0
89810	2	89709	404	2011-03-09	0	2011-03-15	10800
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
908
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
1517	1	a531d5a4-6e67-4a17-b37b-5feea4dd8964	12.00	2010-01-01	\N	1314	1415
1518	1	6a8227f4-8df2-4ccf-a3da-63f6b8ac561a	8.00	2010-01-01	\N	1313	1415
1516	2	a09b8250-be7e-41ca-b3fa-bd8f671ef537	13.00	2010-01-01	\N	1314	1414
1515	2	972c4e89-5066-4951-802b-c53976df1c7e	11.00	2010-01-01	\N	1313	1414
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
33871	1	a4977c64-93ac-4310-ae9e-c8a0abbb51c9	WORKER	100	1.00	f	\N	82560
33851	1	75d052b4-b56e-420c-bb0a-a479367be037	WORKER	100	1.00	f	\N	82536
33872	1	f8dd8633-7d2e-4334-95f6-2f2c9e4d1496	WORKER	70	1.00	f	\N	82561
33873	1	461cd1d2-ab54-47d0-b098-2185f3aef390	WORKER	70	1.00	f	\N	82562
33874	1	774ac091-c0c8-4577-aef3-eeee5fad7f74	WORKER	50	1.00	f	\N	82563
33875	1	5da14d58-0daa-408c-8495-fde16fc8044e	WORKER	70	1.00	f	\N	82564
33852	1	59673cbe-98b1-401d-bbbe-94e45c4c7778	WORKER	70	1.00	f	\N	82537
33853	1	a7f8524f-0e00-4b8f-bd9c-34fc17593867	WORKER	70	1.00	f	\N	82538
5139	9	PREFIX-00002-00001-00001	WORKER	16	1.00	f	5644	\N
33854	1	cb2ff671-c7f0-4ddb-87a0-a0a0ff4c8adb	WORKER	50	1.00	f	\N	82539
33855	1	0b428cfb-c2ca-409e-b7a4-79b12f509dd1	WORKER	70	1.00	f	\N	82540
2751	57	PREFIX-00001-00001-00001	WORKER	100	1.00	f	2361	\N
2771	56	PREFIX-00001-00011-00001	WORKER	70	1.00	f	2385	\N
2772	56	PREFIX-00001-00012-00001	WORKER	70	1.00	f	2386	\N
2773	56	PREFIX-00001-00013-00001	WORKER	50	1.00	f	2387	\N
2774	56	PREFIX-00001-00014-00001	WORKER	70	1.00	f	2388	\N
2791	55	PREFIX-00001-00016-00001	WORKER	35	1.00	f	2409	\N
2792	55	PREFIX-00001-00017-00001	WORKER	35	1.00	f	2410	\N
2793	55	PREFIX-00001-00018-00001	WORKER	50	1.00	f	2411	\N
2794	55	PREFIX-00001-00019-00001	WORKER	35	1.00	f	2412	\N
2753	57	PREFIX-00001-00005-00001	WORKER	16	1.00	f	2364	\N
2803	54	PREFIX-00001-00020-00001	WORKER	24	1.00	f	2421	\N
88718	4	PREFIX-00005-00001-00001	WORKER	0	1.00	f	89385	\N
88719	4	PREFIX-00005-00002-00001	WORKER	0	1.00	f	89386	\N
88720	4	PREFIX-00005-00003-00001	WORKER	0	1.00	f	89387	\N
83856	1	eb384510-7eaf-4bae-a6a9-a71809780e40	WORKER	100	1.00	f	\N	83819
2804	54	PREFIX-00001-00021-00001	WORKER	24	1.00	f	2422	\N
2805	54	PREFIX-00001-00022-00001	WORKER	40	1.00	f	2423	\N
3275	53	PREFIX-00001-00026-00001	WORKER	24	1.00	f	3218	\N
83857	1	b2daa896-ee73-498c-825d-2f83de8b35b9	WORKER	70	1.00	f	\N	83820
2754	57	PREFIX-00001-00004-00001	WORKER	24	1.00	f	2365	\N
3276	53	PREFIX-00001-00027-00001	WORKER	10	1.00	f	3220	\N
2806	54	PREFIX-00001-00023-00001	WORKER	24	1.00	f	3131	\N
3277	53	PREFIX-00001-00028-00001	WORKER	10	1.00	f	3221	\N
3318	48	PREFIX-00001-00043-00001	WORKER	35	1.00	f	3585	\N
2775	56	PREFIX-00001-00007-00001	WORKER	20	1.00	f	2389	\N
3297	51	PREFIX-00001-00034-00001	WORKER	30	1.00	f	3555	\N
3288	52	PREFIX-00001-00030-00001	WORKER	15	1.00	f	3539	\N
3298	51	PREFIX-00001-00036-00001	WORKER	20	1.00	f	3557	\N
3311	49	PREFIX-00001-00037-00001	WORKER	35	1.00	f	3576	\N
3312	49	PREFIX-00001-00038-00001	WORKER	15	1.00	f	3577	\N
3322	46	PREFIX-00001-00044-00001	WORKER	16	1.00	f	3589	\N
3289	52	PREFIX-00001-00031-00001	WORKER	20	1.00	f	3540	\N
3313	49	PREFIX-00001-00040-00001	WORKER	24	1.00	f	3579	\N
3290	52	PREFIX-00001-00032-00001	WORKER	16	1.00	f	3541	\N
3314	49	PREFIX-00001-00042-00001	WORKER	21	1.00	f	3581	\N
3329	40	PREFIX-00001-00046-00001	WORKER	60	1.00	f	3600	\N
3330	40	PREFIX-00001-00047-00001	WORKER	250	1.00	f	3601	\N
83858	1	b9870e7f-00f9-40c5-bebc-902ff2a3f235	WORKER	70	1.00	f	\N	83821
83859	1	02791962-3fa7-401b-85cd-2dc9efd275d3	WORKER	50	1.00	f	\N	83822
83860	1	7be1b945-464c-4719-a093-fdcbe7184edc	WORKER	70	1.00	f	\N	83823
83879	1	b8171fa9-e4e3-4e5f-a360-5c4555980f27	WORKER	35	1.00	f	\N	84050
83880	1	4ae5ec9f-d09f-4054-98fd-661aad86fc97	WORKER	15	1.00	f	\N	84051
5082	28	PREFIX-00001-00058-00001	WORKER	40	1.00	f	5567	\N
5083	28	PREFIX-00001-00059-00001	WORKER	40	1.00	f	5568	\N
2777	56	PREFIX-00001-00009-00001	WORKER	30	1.00	f	2391	\N
5057	38	PREFIX-00001-00049-00001	WORKER	100	1.00	f	3617	\N
2776	56	PREFIX-00001-00008-00001	WORKER	100	1.00	f	2390	\N
5058	38	PREFIX-00001-00051-00001	WORKER	90	1.00	f	3620	\N
5059	38	PREFIX-00001-00052-00001	WORKER	120	1.00	f	3621	\N
5066	37	PREFIX-00001-00054-00001	WORKER	120	1.00	f	3632	\N
5067	37	PREFIX-00001-00055-00001	WORKER	100	1.00	f	3633	\N
5071	34	PREFIX-00001-00056-00001	WORKER	84	1.00	f	5556	\N
5075	33	PREFIX-00001-00057-00001	WORKER	64	1.00	f	5560	\N
5108	27	PREFIX-00001-00062-00001	WORKER	40	1.00	f	5600	\N
5109	27	PREFIX-00001-00063-00001	WORKER	56	1.00	f	5601	\N
5110	27	PREFIX-00001-00064-00001	WORKER	100	1.00	f	5602	\N
5111	27	PREFIX-00001-00065-00001	WORKER	75	1.00	f	5603	\N
5112	27	PREFIX-00001-00066-00001	WORKER	90	1.00	f	5604	\N
5113	27	PREFIX-00001-00068-00001	WORKER	20	1.00	f	5606	\N
5114	27	PREFIX-00001-00069-00001	WORKER	50	1.00	f	5607	\N
83881	1	23498238-2696-476a-b50f-7454441678f5	WORKER	16	1.00	f	\N	84052
83882	1	dcedf118-7e47-4910-92f5-d2436e40434d	WORKER	20	1.00	f	\N	84054
83883	1	5dcf1fb0-3183-4ddc-be5b-5df3f2634586	WORKER	24	1.00	f	\N	84055
83884	1	916d50c8-6af0-40a5-ad47-53dd60692ee9	WORKER	16	1.00	f	\N	84057
83885	1	a1c14aa0-84bd-4265-ad03-f2f9aef88674	WORKER	21	1.00	f	\N	84058
83886	1	b4e0f372-8a65-416f-9af9-6b48eeeff4fa	WORKER	40	1.00	f	\N	84059
83887	1	497781d1-1970-4512-bf08-7e87f2e2a6de	WORKER	40	1.00	f	\N	84060
83888	1	6d897d04-14be-4417-84de-29a5ba5db632	WORKER	60	1.00	f	\N	84062
83889	1	8c38b9fe-8e68-46b6-b138-f1bf0c4b680a	WORKER	250	1.00	f	\N	84063
83890	1	373c64b1-7e16-4252-a670-295a2b0074c6	WORKER	30	1.00	f	\N	84064
83891	1	08d32c03-007f-4c73-9e3e-c4ab6dd75d01	WORKER	100	1.00	f	\N	84065
83892	1	394f5f51-48a4-4571-a189-b57927b612f8	WORKER	100	1.00	f	\N	84067
5148	9	PREFIX-00002-00003-00001	WORKER	80	1.00	f	33734	\N
5149	9	PREFIX-00002-00004-00001	WORKER	20	1.00	f	33735	\N
5150	9	PREFIX-00002-00005-00001	WORKER	16	1.00	f	33736	\N
33835	9	PREFIX-00002-00006-00001	WORKER	12	1.00	f	33737	\N
5126	26	PREFIX-00001-00071-00001	WORKER	20	1.00	f	5630	\N
5136	25	PREFIX-00001-00072-00001	WORKER	100	1.00	f	5640	\N
5137	25	PREFIX-00001-00073-00001	WORKER	50	1.00	f	5641	\N
5138	25	PREFIX-00001-00074-00001	WORKER	40	1.00	f	5642	\N
3278	53	PREFIX-00001-00025-00001	WORKER	100	1.00	f	3222	\N
33888	1	c0d32d5b-1dfe-4cdb-a112-3722a7fa7462	WORKER	35	1.00	f	\N	82581
33889	1	27ba9512-2a13-4482-b3bc-352d29918963	WORKER	35	1.00	f	\N	82582
33890	1	c3c96d69-9a34-42b5-8d15-e9373328d8e6	WORKER	50	1.00	f	\N	82583
33891	1	d9baf8b3-e3b5-4c9d-aca0-fd28afd1aaaa	WORKER	35	1.00	f	\N	82584
5115	27	PREFIX-00001-00060-00001	WORKER	54	1.00	f	5608	\N
2778	56	PREFIX-00001-00010-00001	WORKER	80	1.00	f	2392	\N
84833	11	PREFIX-00003-00058-00001	WORKER	64	1.00	f	85324	\N
84834	11	PREFIX-00003-00060-00001	WORKER	40	1.00	f	85326	\N
84835	11	PREFIX-00003-00061-00001	WORKER	56	1.00	f	85327	\N
84836	11	PREFIX-00003-00062-00001	WORKER	100	1.00	f	85328	\N
84837	11	PREFIX-00003-00063-00001	WORKER	75	1.00	f	85329	\N
84838	11	PREFIX-00003-00064-00001	WORKER	90	1.00	f	85330	\N
84839	11	PREFIX-00003-00066-00001	WORKER	20	1.00	f	85332	\N
85648	11	PREFIX-00003-00067-00001	WORKER	50	1.00	f	85333	\N
85649	11	PREFIX-00003-00068-00001	WORKER	54	1.00	f	85334	\N
85655	11	PREFIX-00003-00009-00001	WORKER	100	1.00	f	85341	\N
83861	1	6ef65aef-189e-4249-95e0-c7efc9ebb2c6	WORKER	35	1.00	f	\N	83825
83862	1	60ea9a9a-93c1-420d-8b24-8647bdac6c70	WORKER	35	1.00	f	\N	83826
83863	1	295d5627-3901-4cb1-9a24-c1b4525eba02	WORKER	50	1.00	f	\N	83827
83864	1	7c4434ea-bd5c-48e1-85e5-22991aefe5b7	WORKER	35	1.00	f	\N	83828
83865	1	29a548df-b9ef-4740-83cb-4ee3675b4abc	WORKER	16	1.00	f	\N	84032
83866	1	1ab00d17-ede9-4701-9047-ed2eec5f9380	WORKER	24	1.00	f	\N	84033
83867	1	7d403f76-4aff-4004-846e-fc631a07c3b7	WORKER	24	1.00	f	\N	84034
83868	1	4b6e0df8-ad0d-4fec-97a6-4feb7bdf4fab	WORKER	40	1.00	f	\N	84035
83869	1	14e4a955-008d-455a-9d50-44ca9c6d8577	WORKER	24	1.00	f	\N	84036
83870	1	b632ffec-ccd8-4a3e-820a-5eaf07e5f185	WORKER	24	1.00	f	\N	84038
83871	1	f6cfbdc7-a67f-41da-9edd-9eab31939019	WORKER	10	1.00	f	\N	84039
83872	1	9b0f91e5-65a3-4ea5-ab0c-2184ff7f979b	WORKER	24	1.00	f	\N	84040
83873	1	8b14b96f-d0ab-42e5-9eeb-ce259271f85a	WORKER	10	1.00	f	\N	84041
83874	1	f8b0e955-f40b-4158-b070-3d4b319d482f	WORKER	35	1.00	f	\N	84042
83875	1	4124016b-dbf4-4706-b807-57b47e064228	WORKER	20	1.00	f	\N	84045
83876	1	6a5cf58c-b5f7-4ea0-a874-f2bf3594d6c1	WORKER	30	1.00	f	\N	84046
83877	1	2b842a49-1b5d-49b9-ada0-63700686101a	WORKER	15	1.00	f	\N	84048
83878	1	64609b2c-10e1-4a3b-8422-3a3baf802283	WORKER	20	1.00	f	\N	84049
83893	1	e0ebf2c2-5db8-4e2f-9e32-8924b4e2319e	WORKER	90	1.00	f	\N	84069
83894	1	5c0b07c9-d2c7-4870-9331-a83a22aa6a60	WORKER	120	1.00	f	\N	84070
83895	1	3241a7ba-c4eb-4244-8880-c11b86b7d39c	WORKER	120	1.00	f	\N	84072
83896	1	7e66f1f4-4c27-40b2-8a7f-a516dcb901d7	WORKER	100	1.00	f	\N	84073
83897	1	9a6016a8-7554-454e-9bed-e1fbef0c066e	WORKER	84	1.00	f	\N	84074
83898	1	ea82bc0d-7126-4eae-9b63-df13579c7f02	WORKER	64	1.00	f	\N	84075
83899	1	4a58454c-0058-4521-a6ee-724e276f57a3	WORKER	40	1.00	f	\N	84077
83900	1	daade279-2a8b-453e-996b-657768a2cc6b	WORKER	56	1.00	f	\N	84078
83901	1	8c53d343-da89-4133-9c8a-b70bc0243430	WORKER	100	1.00	f	\N	84079
83902	1	9d9b2402-72ba-48be-8d51-2fbe5035e4b3	WORKER	75	1.00	f	\N	84080
83903	1	d25312a8-e932-41ca-b53d-270aa41a8caa	WORKER	90	1.00	f	\N	84081
83904	1	bfd5ad9e-2e09-4cbd-9be7-08e545968a69	WORKER	20	1.00	f	\N	84083
83905	1	eb8942b2-2c03-4e96-85f3-ea05eda725ca	WORKER	50	1.00	f	\N	84084
83906	1	6052f526-5eb6-429c-84a9-92e3df93663b	WORKER	54	1.00	f	\N	84085
83907	1	af09a53a-4114-42bd-ac08-cb3ba913b4d3	WORKER	80	1.00	f	\N	84087
83908	1	951638c1-f3e9-418d-b29e-015a7a7b7655	WORKER	20	1.00	f	\N	84088
83909	1	8f10175e-69e1-4eea-b8c2-95ae9ca54221	WORKER	100	1.00	f	\N	84089
83910	1	ffc67516-e6f5-435e-a276-10ce21cbbf7b	WORKER	50	1.00	f	\N	84090
83911	1	c7cabea4-ec51-495d-83a7-b83856d0af06	WORKER	40	1.00	f	\N	84091
83912	1	87eb0541-9965-49a0-9a93-739eb953977d	WORKER	100	1.00	f	\N	84092
84809	11	PREFIX-00003-00028-00001	WORKER	35	1.00	f	85291	\N
84810	11	PREFIX-00003-00030-00001	WORKER	20	1.00	f	85294	\N
84811	11	PREFIX-00003-00031-00001	WORKER	30	1.00	f	85295	\N
84812	11	PREFIX-00003-00033-00001	WORKER	15	1.00	f	85297	\N
84813	11	PREFIX-00003-00034-00001	WORKER	20	1.00	f	85298	\N
88747	7	PREFIX-00006-00011-00001	WORKER	35	1.00	f	89424	\N
88739	7	PREFIX-00006-00003-00001	WORKER	100	1.00	f	89415	\N
88740	7	PREFIX-00006-00004-00001	WORKER	70	1.00	f	89416	\N
88741	7	PREFIX-00006-00005-00001	WORKER	70	1.00	f	89417	\N
88742	7	PREFIX-00006-00006-00001	WORKER	50	1.00	f	89418	\N
88743	7	PREFIX-00006-00007-00001	WORKER	70	1.00	f	89419	\N
88744	7	PREFIX-00006-00008-00001	WORKER	35	1.00	f	89421	\N
88745	7	PREFIX-00006-00009-00001	WORKER	35	1.00	f	89422	\N
88746	7	PREFIX-00006-00010-00001	WORKER	50	1.00	f	89423	\N
88251	5	PREFIX-00004-00010-00001	WORKER	100	1.00	f	88596	\N
88252	5	PREFIX-00004-00011-00001	WORKER	70	1.00	f	88597	\N
88253	5	PREFIX-00004-00012-00001	WORKER	70	1.00	f	88598	\N
85651	11	PREFIX-00003-00070-00001	WORKER	20	1.00	f	85337	\N
85652	11	PREFIX-00003-00071-00001	WORKER	100	1.00	f	85338	\N
85653	11	PREFIX-00003-00072-00001	WORKER	50	1.00	f	85339	\N
85654	11	PREFIX-00003-00073-00001	WORKER	40	1.00	f	85340	\N
84814	11	PREFIX-00003-00035-00001	WORKER	35	1.00	f	85299	\N
84815	11	PREFIX-00003-00036-00001	WORKER	15	1.00	f	85300	\N
84816	11	PREFIX-00003-00037-00001	WORKER	16	1.00	f	85301	\N
84817	11	PREFIX-00003-00039-00001	WORKER	20	1.00	f	85303	\N
84818	11	PREFIX-00003-00040-00001	WORKER	24	1.00	f	85304	\N
84819	11	PREFIX-00003-00042-00001	WORKER	16	1.00	f	85306	\N
84820	11	PREFIX-00003-00043-00001	WORKER	21	1.00	f	85307	\N
84821	11	PREFIX-00003-00044-00001	WORKER	40	1.00	f	85308	\N
84822	11	PREFIX-00003-00045-00001	WORKER	40	1.00	f	85309	\N
84823	11	PREFIX-00003-00046-00001	WORKER	60	1.00	f	85311	\N
84824	11	PREFIX-00003-00047-00001	WORKER	250	1.00	f	85312	\N
84825	11	PREFIX-00003-00048-00001	WORKER	30	1.00	f	85313	\N
84826	11	PREFIX-00003-00049-00001	WORKER	100	1.00	f	85314	\N
84827	11	PREFIX-00003-00050-00001	WORKER	100	1.00	f	85316	\N
84828	11	PREFIX-00003-00052-00001	WORKER	90	1.00	f	85318	\N
84829	11	PREFIX-00003-00053-00001	WORKER	120	1.00	f	85319	\N
84830	11	PREFIX-00003-00055-00001	WORKER	120	1.00	f	85321	\N
84831	11	PREFIX-00003-00056-00001	WORKER	100	1.00	f	85322	\N
84832	11	PREFIX-00003-00057-00001	WORKER	84	1.00	f	85323	\N
85650	11	PREFIX-00003-00069-00001	WORKER	80	1.00	f	85336	\N
88254	5	PREFIX-00004-00013-00001	WORKER	50	1.00	f	88599	\N
88255	5	PREFIX-00004-00014-00001	WORKER	70	1.00	f	88600	\N
84791	11	PREFIX-00003-00010-00001	WORKER	100	1.00	f	85270	\N
84792	11	PREFIX-00003-00011-00001	WORKER	70	1.00	f	85271	\N
84793	11	PREFIX-00003-00012-00001	WORKER	70	1.00	f	85272	\N
84794	11	PREFIX-00003-00013-00001	WORKER	50	1.00	f	85273	\N
84795	11	PREFIX-00003-00014-00001	WORKER	70	1.00	f	85274	\N
84796	11	PREFIX-00003-00015-00001	WORKER	35	1.00	f	85276	\N
84797	11	PREFIX-00003-00016-00001	WORKER	35	1.00	f	85277	\N
84798	11	PREFIX-00003-00017-00001	WORKER	50	1.00	f	85278	\N
84799	11	PREFIX-00003-00018-00001	WORKER	35	1.00	f	85279	\N
84800	11	PREFIX-00003-00019-00001	WORKER	16	1.00	f	85281	\N
84801	11	PREFIX-00003-00020-00001	WORKER	24	1.00	f	85282	\N
84802	11	PREFIX-00003-00021-00001	WORKER	24	1.00	f	85283	\N
84803	11	PREFIX-00003-00022-00001	WORKER	40	1.00	f	85284	\N
84804	11	PREFIX-00003-00023-00001	WORKER	24	1.00	f	85285	\N
84805	11	PREFIX-00003-00024-00001	WORKER	24	1.00	f	85287	\N
84806	11	PREFIX-00003-00025-00001	WORKER	10	1.00	f	85288	\N
84807	11	PREFIX-00003-00026-00001	WORKER	24	1.00	f	85289	\N
84808	11	PREFIX-00003-00027-00001	WORKER	10	1.00	f	85290	\N
88256	5	PREFIX-00004-00015-00001	WORKER	35	1.00	f	88602	\N
88257	5	PREFIX-00004-00016-00001	WORKER	35	1.00	f	88603	\N
88258	5	PREFIX-00004-00017-00001	WORKER	50	1.00	f	88604	\N
88259	5	PREFIX-00004-00018-00001	WORKER	35	1.00	f	88605	\N
88260	5	PREFIX-00004-00019-00001	WORKER	16	1.00	f	88607	\N
88261	5	PREFIX-00004-00020-00001	WORKER	24	1.00	f	88608	\N
88262	5	PREFIX-00004-00021-00001	WORKER	24	1.00	f	88609	\N
88263	5	PREFIX-00004-00022-00001	WORKER	40	1.00	f	88610	\N
88264	5	PREFIX-00004-00023-00001	WORKER	24	1.00	f	88611	\N
88265	5	PREFIX-00004-00024-00001	WORKER	24	1.00	f	88613	\N
88266	5	PREFIX-00004-00025-00001	WORKER	10	1.00	f	88614	\N
88267	5	PREFIX-00004-00026-00001	WORKER	24	1.00	f	88615	\N
88268	5	PREFIX-00004-00027-00001	WORKER	10	1.00	f	88616	\N
88269	5	PREFIX-00004-00028-00001	WORKER	35	1.00	f	88617	\N
88270	5	PREFIX-00004-00030-00001	WORKER	20	1.00	f	88620	\N
88271	5	PREFIX-00004-00031-00001	WORKER	30	1.00	f	88621	\N
88272	5	PREFIX-00004-00033-00001	WORKER	15	1.00	f	88623	\N
88273	5	PREFIX-00004-00034-00001	WORKER	20	1.00	f	88624	\N
88678	5	PREFIX-00004-00035-00001	WORKER	35	1.00	f	88625	\N
88679	5	PREFIX-00004-00036-00001	WORKER	15	1.00	f	88626	\N
88680	5	PREFIX-00004-00037-00001	WORKER	16	1.00	f	88627	\N
88681	5	PREFIX-00004-00039-00001	WORKER	20	1.00	f	88629	\N
88682	5	PREFIX-00004-00040-00001	WORKER	24	1.00	f	88630	\N
88683	5	PREFIX-00004-00042-00001	WORKER	16	1.00	f	88632	\N
88684	5	PREFIX-00004-00043-00001	WORKER	21	1.00	f	88633	\N
88685	5	PREFIX-00004-00044-00001	WORKER	40	1.00	f	88634	\N
88686	5	PREFIX-00004-00045-00001	WORKER	40	1.00	f	88635	\N
88687	5	PREFIX-00004-00046-00001	WORKER	60	1.00	f	88637	\N
88688	5	PREFIX-00004-00047-00001	WORKER	250	1.00	f	88638	\N
88689	5	PREFIX-00004-00048-00001	WORKER	30	1.00	f	88639	\N
88690	5	PREFIX-00004-00049-00001	WORKER	100	1.00	f	88640	\N
88691	5	PREFIX-00004-00050-00001	WORKER	100	1.00	f	88642	\N
88692	5	PREFIX-00004-00052-00001	WORKER	90	1.00	f	88644	\N
88693	5	PREFIX-00004-00053-00001	WORKER	120	1.00	f	88645	\N
88694	5	PREFIX-00004-00055-00001	WORKER	120	1.00	f	88647	\N
88695	5	PREFIX-00004-00056-00001	WORKER	100	1.00	f	88648	\N
88696	5	PREFIX-00004-00057-00001	WORKER	84	1.00	f	88649	\N
88697	5	PREFIX-00004-00058-00001	WORKER	64	1.00	f	88650	\N
88698	5	PREFIX-00004-00060-00001	WORKER	40	1.00	f	88652	\N
88699	5	PREFIX-00004-00061-00001	WORKER	56	1.00	f	88653	\N
88700	5	PREFIX-00004-00062-00001	WORKER	100	1.00	f	88654	\N
88701	5	PREFIX-00004-00063-00001	WORKER	75	1.00	f	88655	\N
88702	5	PREFIX-00004-00064-00001	WORKER	90	1.00	f	88656	\N
88703	5	PREFIX-00004-00066-00001	WORKER	20	1.00	f	88658	\N
88704	5	PREFIX-00004-00067-00001	WORKER	50	1.00	f	88659	\N
88705	5	PREFIX-00004-00068-00001	WORKER	54	1.00	f	88660	\N
88706	5	PREFIX-00004-00069-00001	WORKER	80	1.00	f	88662	\N
88707	5	PREFIX-00004-00070-00001	WORKER	20	1.00	f	88663	\N
88708	5	PREFIX-00004-00071-00001	WORKER	100	1.00	f	88664	\N
88709	5	PREFIX-00004-00072-00001	WORKER	50	1.00	f	88665	\N
88710	5	PREFIX-00004-00073-00001	WORKER	40	1.00	f	88666	\N
88711	5	PREFIX-00004-00009-00001	WORKER	100	1.00	f	88667	\N
91207	3	PREFIX-00007-00001-00001	WORKER	100	1.00	f	90811	\N
91208	3	PREFIX-00007-00004-00001	WORKER	100	1.00	f	90814	\N
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
84927	85275
84935	85280
84934	85280
85345	85286
85346	85286
85350	85293
85349	85293
85357	85296
85356	85296
85360	85302
85361	85302
85367	85305
85366	85305
85368	85292
85369	85292
85374	85310
85375	85310
85380	85317
85381	85317
85387	85320
85386	85320
85393	85325
85394	85325
85398	85331
85399	85331
85400	85315
85402	85315
85401	85315
85408	85335
85409	85335
85412	85268
85411	85268
85413	85268
89002	88677
89001	88677
89027	89420
89026	89420
89029	89413
89028	89413
6355	2408
6267	2408
34817	5643
6354	2408
6268	2408
6357	2363
6274	2363
34962	5643
6356	2363
6275	2363
6526	5643
6525	5643
6523	5655
34816	5655
6524	5655
34961	5655
6358	3219
6282	3219
6281	3219
6359	3219
6360	3554
6286	3554
6285	3554
6361	3554
6464	3556
6292	3556
6293	3556
6362	3556
6468	3578
6467	3578
6473	3580
6474	3580
6295	3538
6294	3538
6476	3538
6475	3538
6481	3599
6482	3599
6487	3619
6486	3619
6492	3631
6493	3631
6500	5599
6499	5599
6504	5605
6505	5605
34964	3618
6506	3618
6507	3618
6513	5629
6514	5629
6517	2360
6516	2360
6296	2360
34965	2360
6297	2360
88512	88601
84928	85275
88511	88601
88518	88606
88519	88606
88526	88612
88525	88612
88530	88619
88529	88619
88536	88622
88537	88622
88541	88628
88540	88628
88546	88631
88547	88631
88548	88618
88549	88618
88555	88636
88554	88636
88560	88643
88561	88643
88566	88646
88567	88646
88574	88651
88573	88651
88982	88657
88983	88657
88984	88641
88985	88641
88986	88641
88993	88661
88992	88661
88995	88594
88997	88594
88996	88594
91306	90813
91307	90813
91308	90812
91309	90812
91310	90810
91311	90810
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1818	1	435f12dd-18bb-4a30-b713-7b59e22c9d4c	Madrid	1717
1819	1	12ebdfc9-43d6-4518-83b6-628f6658a6a5	Valencia	1717
1820	1	a91ee925-7973-45ba-b155-f8a13d27352c	Galicia	1717
1821	1	0f3eec5c-31c1-459e-b10e-2b67998659be	Prioridad Baja	1718
1822	1	ed0363bc-5697-4d92-8918-608ca0fc58d9	Prioridad Alta	1718
1823	1	09406f45-de1e-46b3-b964-364451c43dd9	Prioridad Normal	1718
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
1717	1	7b9e6555-bb8b-4d07-af12-b550cfd0606b	Centros de coste	t
1718	1	4f346dcf-caab-4e42-8fb3-1bd1616fdfe0	Tipo de proyecto	t
\.


--
-- Data for Name: limiting_resource_queue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY limiting_resource_queue (id, version, resource_id) FROM stdin;
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
1932	Servidor central compilación	Desc
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
303	1	d9267821-ab83-4bf3-9d85-6098098221bc	Imported materials without category	f	\N
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
1616	1	Supervisores
1617	1	Administradores
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled, lastconnectedscenario) FROM stdin;
1111	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f	\N
1112	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f	\N
1113	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f	\N
1114	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f	\N
1115	1	usuario_admin	145e5c371927c305a5ac684de6b7330b7db651e141920ac7adcc31da479ec920797133cea9f32062c0c016449a3f80239496c8d4ec9085d3e2588c680ede6ba7	xcastanho@igalia.com	f	\N
1116	1	usuario_supervisor	b6c1eb123cb24b4734fdf535d9664381f642616941359ac6f6ea26fcc8f217fc26ea9cb290502634bdbfe607997c5d34e6cf06b982886f585da4bb71d8305a97	xcastanho@gmail.com	f	\N
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
2828	USER	38	WRITE_AUTHORIZATION	2360	1112	\N
2829	USER	7	WRITE_AUTHORIZATION	85268	1112	\N
2830	USER	3	WRITE_AUTHORIZATION	88594	1112	\N
2831	USER	2	WRITE_AUTHORIZATION	88677	1112	\N
2832	USER	1	WRITE_AUTHORIZATION	89413	1112	\N
91506	USER	1	WRITE_AUTHORIZATION	90810	1112	\N
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
5643	\N	\N	t	6	0.00	0.00	144	\N	\N	5	2222	505
2360	Xavier	t	t	74	30000.00	0.00	3051	\N	\N	0	\N	506
85268	\N	\N	t	73	0.00	0.00	3051	\N	\N	0	\N	506
88594	\N	\N	t	73	0.00	0.00	3051	\N	\N	0	\N	506
88677	\N	\N	t	3	0.00	0.00	0	\N	\N	0	\N	505
89413	Xavier Castaño	\N	t	11	20000.00	0.00	515	\N	\N	0	\N	505
90810	\N	\N	t	4	0.00	0.00	200	\N	\N	0	\N	505
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, sum_charged_hours_id, positionincontainer) FROM stdin;
2360	60	Desarrollo de aplicación de gestión de proyectos	Desc.	PREFIX-00001	2010-11-15 13:44:31.902	2011-03-25 00:00:00	0.01	f	\N	\N	\N	2461	\N
2384	57	Coordinación 	\N	PREFIX-00001-00006	\N	\N	0.00	f	2360	\N	\N	3041	0
2361	57	Reuniones	\N	PREFIX-00001-00001	\N	\N	0.00	f	2384	\N	\N	2462	0
2385	56	Planificación periódica	\N	PREFIX-00001-00011	\N	\N	0.00	f	2384	\N	\N	3042	1
5655	12	Algoritmia de cálculo do camino crítico	\N	PREFIX-00002-00002	2011-01-18 00:00:00	2011-02-16 00:00:00	0.25	t	5643	\N	PREFIX-00001-00008	33564	0
2386	56	Actas de reuniones	\N	PREFIX-00001-00012	\N	\N	0.00	f	2384	\N	\N	3043	2
5644	11	Plantear algoritmo	\N	PREFIX-00002-00001	2011-01-18 00:00:00	2011-02-16 00:00:00	0.25	f	5655	\N	\N	33533	0
33734	11	Desarrollar algotirmo camino crítico	\N	PREFIX-00002-00003	\N	\N	0.40	f	5655	\N	\N	33565	1
33735	10	Probar desarrollos realizados	\N	PREFIX-00002-00004	\N	\N	0.00	f	5655	\N	\N	33566	2
2387	56	Control de calidad	\N	PREFIX-00001-00013	\N	\N	0.00	f	2384	\N	\N	3044	3
33736	10	Integrar desarrollo	\N	PREFIX-00002-00005	\N	\N	0.00	f	5655	\N	\N	33567	3
33737	10	Desplegar	\N	PREFIX-00002-00006	\N	\N	0.00	f	5655	\N	\N	33568	4
88594	5	3º proyecto de desarrollo de aplicación de gestión de proyectos	Desc.	PREFIX-00004	2011-09-01 00:00:00	2012-03-01 00:00:00	0.00	f	\N	83817	\N	88324	\N
88595	5	Coordinación 	\N	PREFIX-00004-00001	\N	\N	0.00	f	88594	83818	\N	88325	0
88596	5	Reuniones	\N	PREFIX-00004-00010	\N	\N	0.00	f	88595	83819	\N	88326	0
88597	5	Planificación periódica	\N	PREFIX-00004-00011	\N	\N	0.00	f	88595	83820	\N	88327	1
88598	5	Actas de reuniones	\N	PREFIX-00004-00012	\N	\N	0.00	f	88595	83821	\N	88328	2
88599	5	Control de calidad	\N	PREFIX-00004-00013	\N	\N	0.00	f	88595	83822	\N	88329	3
88661	5	Módulo de entradas/salidas	\N	PREFIX-00004-00008	\N	\N	0.00	f	88594	84086	\N	88795	7
88662	5	API de carga	\N	PREFIX-00004-00069	\N	\N	0.00	f	88661	84087	\N	88796	0
88663	5	API de comunicación vía XML	\N	PREFIX-00004-00070	\N	\N	0.00	f	88661	84088	\N	88797	1
2388	56	Informes de seguimiento	\N	PREFIX-00001-00014	\N	\N	0.00	f	2384	\N	\N	3045	4
2408	56	Análisis	\N	PREFIX-00001-00015	\N	\N	0.00	f	2360	\N	\N	3046	1
2409	56	Análisis del módulo de arquitectura	\N	PREFIX-00001-00016	\N	\N	0.00	f	2408	\N	\N	3047	0
5567	29	Modelo de funciones S	\N	PREFIX-00001-00058	\N	\N	0.00	f	3580	\N	\N	6039	2
2390	58	Algoritmia de cálculo do camino crítico	\N	PREFIX-00001-00008	\N	\N	0.25	f	3618	\N	\N	3053	0
5556	35	Reasignación siguiendo indicaciones de la cadena crítica	\N	PREFIX-00001-00056	\N	\N	0.00	f	3631	\N	\N	5993	2
5604	28	Algoritmo de asignación dando prioridad a deadlines	\N	PREFIX-00001-00066	\N	\N	0.00	f	5599	\N	\N	6046	4
5605	28	Operaciones de nivelación de recursos sobre planificación	\N	PREFIX-00001-00067	\N	\N	0.00	f	3618	\N	\N	6047	4
5608	28	Algoritmia de nivelación de asignación de recursos	\N	PREFIX-00001-00060	\N	\N	0.00	f	5605	\N	\N	6050	2
5629	27	Módulo de entradas/salidas	\N	PREFIX-00001-00070	\N	\N	0.00	f	2360	\N	\N	6237	7
2392	57	API de carga	\N	PREFIX-00001-00010	\N	\N	0.00	f	5629	\N	\N	3054	0
5630	27	API de comunicación vía XML	\N	PREFIX-00001-00071	\N	\N	0.00	f	5629	\N	\N	6238	1
5640	26	API de preprocesamiento y análisis de datos	\N	PREFIX-00001-00072	\N	\N	0.00	f	5629	\N	\N	6239	2
5641	26	API de configuración de elaboración de proceso de planificación	\N	PREFIX-00001-00073	\N	\N	0.00	f	5629	\N	\N	6240	3
5642	26	API de ejecución del proceso	\N	PREFIX-00001-00074	\N	\N	0.00	f	5629	\N	\N	6241	4
3222	54	Gestión del entorno	\N	PREFIX-00001-00025	\N	\N	0.00	f	2360	\N	\N	4996	8
85316	11	Algoritmia de cálculo do camino crítico	\N	PREFIX-00003-00050	\N	\N	0.00	f	85315	84067	\N	85450	0
5643	13	Camino crítico	\N	PREFIX-00002	2011-01-18 00:00:00	2011-02-16 00:00:00	0.25	t	\N	\N	\N	33532	\N
85317	11	Infraestructura de análisis de redes tarefas en 2 modos	\N	PREFIX-00003-00051	\N	\N	0.00	f	85315	84068	\N	85451	1
85318	11	Modo de análisis cara atrás	\N	PREFIX-00003-00052	\N	\N	0.00	f	85317	84069	\N	85452	0
85319	11	Modo de análisis cara adiante	\N	PREFIX-00003-00053	\N	\N	0.00	f	85317	84070	\N	85453	1
85320	11	Algoritmia de la gestión de la cadena crítica	\N	PREFIX-00003-00054	\N	\N	0.00	f	85315	84071	\N	85454	2
85321	11	Método de Montecarlo para simulaciones	\N	PREFIX-00003-00055	\N	\N	0.00	f	85320	84072	\N	85455	0
85322	11	Servicio de cómputo de la cadena crítica	\N	PREFIX-00003-00056	\N	\N	0.00	f	85320	84073	\N	85456	1
85323	11	Reasignación siguiendo indicaciones de la cadena crítica	\N	PREFIX-00003-00057	\N	\N	0.00	f	85320	84074	\N	85457	2
85324	11	Evaluación de proyecto siguiendo cadena crítica	\N	PREFIX-00003-00058	\N	\N	0.00	f	85320	84075	\N	85458	3
85325	11	Algoritmos de asignación de recursos	\N	PREFIX-00003-00059	\N	\N	0.00	f	85315	84076	\N	85459	3
85326	11	Servicio de configuración de función de asignación de recursos	\N	PREFIX-00003-00060	\N	\N	0.00	f	85325	84077	\N	85460	0
88664	5	API de preprocesamiento y análisis de datos	\N	PREFIX-00004-00071	\N	\N	0.00	f	88661	84089	\N	88798	2
2410	56	Análisis del módulo de representación de la información	\N	PREFIX-00001-00017	\N	\N	0.00	f	2408	\N	\N	3048	1
2411	56	Análisis del módulo de planificación	\N	PREFIX-00001-00018	\N	\N	0.00	f	2408	\N	\N	3049	2
2412	56	Análisis del módulo de interface	\N	PREFIX-00001-00019	\N	\N	0.00	f	2408	\N	\N	3050	3
3578	50	Módulo de calendario	\N	PREFIX-00001-00039	\N	\N	0.00	f	3538	\N	\N	4990	2
3540	53	Modelos de calendarios asignados a recursos	\N	PREFIX-00001-00031	\N	\N	0.00	f	3578	\N	\N	4991	0
3579	50	Módulo de clases para calendario	\N	PREFIX-00001-00040	\N	\N	0.00	f	3578	\N	\N	4992	1
3580	50	Módulo de representación de funciones de asignación	\N	PREFIX-00001-00041	\N	\N	0.00	f	3538	\N	\N	4993	3
3541	53	Modelo de asignación plana	\N	PREFIX-00001-00032	\N	\N	0.00	f	3580	\N	\N	4994	0
3581	50	Modelo de función de asignación por tramos	\N	PREFIX-00001-00042	\N	\N	0.00	f	3580	\N	\N	4995	1
5568	29	Modelo de asignación siguiendo las cadena crítica	\N	PREFIX-00001-00059	\N	\N	0.00	f	3580	\N	\N	6040	3
3599	41	Módulo Interface	\N	PREFIX-00001-00045	\N	\N	0.00	f	2360	\N	\N	5982	5
3600	41	Interface para soporte de recursos con máximo de capacidad	\N	PREFIX-00001-00046	\N	\N	0.00	f	3599	\N	\N	5983	0
3601	41	Interface gráfica para interactuación con método de cadena crítica	\N	PREFIX-00001-00047	\N	\N	0.00	f	3599	\N	\N	5984	1
2391	57	Modificación da asignación de recursos	\N	PREFIX-00001-00009	\N	\N	0.00	f	3599	\N	\N	3052	2
5560	34	Evaluación de proyecto siguiendo cadena crítica	\N	PREFIX-00001-00057	\N	\N	0.00	f	3631	\N	\N	5994	3
5606	28	Curvas S	\N	PREFIX-00001-00068	\N	\N	0.00	f	5605	\N	\N	6048	0
5607	28	Configuración de planificación a nivelar	\N	PREFIX-00001-00069	\N	\N	0.00	f	5605	\N	\N	6049	1
88665	5	API de configuración de elaboración de proceso de planificación	\N	PREFIX-00004-00072	\N	\N	0.00	f	88661	84090	\N	88799	3
88666	5	API de ejecución del proceso	\N	PREFIX-00004-00073	\N	\N	0.00	f	88661	84091	\N	88800	4
88667	5	Gestión del entorno	\N	PREFIX-00004-00009	\N	\N	0.00	f	88594	84092	\N	88801	8
85328	11	Algoritmo de asignación de recursos	\N	PREFIX-00003-00062	\N	\N	0.00	f	85325	84079	\N	85462	2
85329	11	Algoritmo de asignación de recursos limitantes	\N	PREFIX-00003-00063	\N	\N	0.00	f	85325	84080	\N	85463	3
85330	11	Algoritmo de asignación dando prioridad a deadlines	\N	PREFIX-00003-00064	\N	\N	0.00	f	85325	84081	\N	85464	4
85331	11	Operaciones de nivelación de recursos sobre planificación	\N	PREFIX-00003-00065	\N	\N	0.00	f	85315	84082	\N	85465	4
85332	11	Curvas S	\N	PREFIX-00003-00066	\N	\N	0.00	f	85331	84083	\N	85466	0
85333	11	Configuración de planificación a nivelar	\N	PREFIX-00003-00067	\N	\N	0.00	f	85331	84084	\N	85467	1
85334	11	Algoritmia de nivelación de asignación de recursos	\N	PREFIX-00003-00068	\N	\N	0.00	f	85331	84085	\N	85468	2
85335	11	Módulo de entradas/salidas	\N	PREFIX-00003-00008	\N	\N	0.00	f	85268	84086	\N	85469	7
85336	11	API de carga	\N	PREFIX-00003-00069	\N	\N	0.00	f	85335	84087	\N	85470	0
85337	11	API de comunicación vía XML	\N	PREFIX-00003-00070	\N	\N	0.00	f	85335	84088	\N	85471	1
85338	11	API de preprocesamiento y análisis de datos	\N	PREFIX-00003-00071	\N	\N	0.00	f	85335	84089	\N	85472	2
85339	11	API de configuración de elaboración de proceso de planificación	\N	PREFIX-00003-00072	\N	\N	0.00	f	85335	84090	\N	85473	3
85340	11	API de ejecución del proceso	\N	PREFIX-00003-00073	\N	\N	0.00	f	85335	84091	\N	85474	4
85341	11	Gestión del entorno	\N	PREFIX-00003-00009	\N	\N	0.00	f	85268	84092	\N	85475	8
85327	11	Infraestructura para composición y colaboración de diferentes estrategias	\N	PREFIX-00003-00061	\N	\N	0.00	f	85325	84078	\N	85461	1
2363	58	Pruebas unitarias	\N	PREFIX-00001-00003	\N	\N	0.00	f	2360	\N	\N	2464	2
2364	58	Pruebas del módulo de arquitectura	\N	PREFIX-00001-00005	\N	\N	0.00	f	2363	\N	\N	2465	0
2421	55	Pruebas del módulo de representación de la información	\N	PREFIX-00001-00020	\N	\N	0.00	f	2363	\N	\N	3063	1
2422	55	Pruebas del módulo de interface	\N	PREFIX-00001-00021	\N	\N	0.00	f	2363	\N	\N	3064	2
2423	55	Pruebas del módulo de planificación	\N	PREFIX-00001-00022	\N	\N	0.00	f	2363	\N	\N	3065	3
3218	54	Pruebas del módulo de entradas/salidas	\N	PREFIX-00001-00026	\N	\N	0.00	f	2363	\N	\N	4976	4
3219	54	Módulo de arquitectura	\N	PREFIX-00001-00024	\N	\N	0.00	f	2360	\N	\N	4977	3
2365	58	Diseño de paquetes y estructura interna librería	\N	PREFIX-00001-00004	\N	\N	0.00	f	3219	\N	\N	2466	0
3220	54	Diseño API y fachadas	\N	PREFIX-00001-00027	\N	\N	0.00	f	3219	\N	\N	4978	1
3131	55	Definición de la documentación	\N	PREFIX-00001-00023	\N	\N	0.00	f	3219	\N	\N	3066	2
3221	54	Diseño de conversaciones con librería	\N	PREFIX-00001-00028	\N	\N	0.00	f	3219	\N	\N	4979	3
3585	49	Diseño de soporte de fases	\N	PREFIX-00001-00043	\N	\N	0.00	f	3219	\N	\N	4980	4
85308	11	Modelo de funciones S	\N	PREFIX-00003-00044	\N	\N	0.00	f	85305	84059	\N	85139	2
85309	11	Modelo de asignación siguiendo las cadena crítica	\N	PREFIX-00003-00045	\N	\N	0.00	f	85305	84060	\N	85140	3
85310	11	Módulo Interface	\N	PREFIX-00003-00006	\N	\N	0.00	f	85268	84061	\N	85141	5
85311	11	Interface para soporte de recursos con máximo de capacidad	\N	PREFIX-00003-00046	\N	\N	0.00	f	85310	84062	\N	85142	0
85312	11	Interface gráfica para interactuación con método de cadena crítica	\N	PREFIX-00003-00047	\N	\N	0.00	f	85310	84063	\N	85446	1
85313	11	Modificación da asignación de recursos	\N	PREFIX-00003-00048	\N	\N	0.00	f	85310	84064	\N	85447	2
85314	11	Interfaz para solicitude/recepción de nivelación de planificación	\N	PREFIX-00003-00049	\N	\N	0.00	f	85310	84065	\N	85448	3
85315	11	Módulo de planificación	\N	PREFIX-00003-00007	\N	\N	0.00	f	85268	84066	\N	85449	6
85293	11	Módulo de redes de tareas	\N	PREFIX-00003-00029	\N	\N	0.00	f	85292	84044	\N	85124	0
85294	11	Modelo de clases para tipos de dependencias	\N	PREFIX-00003-00030	\N	\N	0.00	f	85293	84045	\N	85125	0
85295	11	Modelo de clases para tipos de restricciones	\N	PREFIX-00003-00031	\N	\N	0.00	f	85293	84046	\N	85126	1
85296	11	Módulo de recursos	\N	PREFIX-00003-00032	\N	\N	0.00	f	85292	84047	\N	85127	1
85305	11	Módulo de representación de funciones de asignación	\N	PREFIX-00003-00041	\N	\N	0.00	f	85292	84056	\N	85136	3
85306	11	Modelo de asignación plana	\N	PREFIX-00003-00042	\N	\N	0.00	f	85305	84057	\N	85137	0
85307	11	Modelo de función de asignación por tramos	\N	PREFIX-00003-00043	\N	\N	0.00	f	85305	84058	\N	85138	1
88677	4	Cadena crítica	\N	PREFIX-00005	2010-11-16 18:00:40.161	2010-12-31 00:00:00	0.00	f	\N	\N	\N	88811	\N
89385	4	Tarea 1	\N	PREFIX-00005-00001	\N	\N	0.00	f	88677	\N	\N	88812	0
89386	4	Tarea 2	\N	PREFIX-00005-00002	\N	\N	0.00	f	88677	\N	\N	88813	1
89387	4	Tarea 3	\N	PREFIX-00005-00003	\N	\N	0.00	f	88677	\N	\N	88814	2
3538	54	Módulo de representación de la información	\N	PREFIX-00001-00029	\N	\N	0.00	f	2360	\N	\N	4981	4
3554	52	Módulo de redes de tareas	\N	PREFIX-00001-00033	\N	\N	0.00	f	3538	\N	\N	4982	0
2389	57	Modelo de clases para tipos de dependencias	\N	PREFIX-00001-00007	\N	\N	0.00	f	3554	\N	\N	3051	0
3555	52	Modelo de clases para tipos de restricciones	\N	PREFIX-00001-00034	\N	\N	0.00	f	3554	\N	\N	4983	1
3556	52	Módulo de recursos	\N	PREFIX-00001-00035	\N	\N	0.00	f	3538	\N	\N	4984	1
3539	53	Modelo de clases para representar asignaciones de recursos	\N	PREFIX-00001-00030	\N	\N	0.00	f	3556	\N	\N	4985	0
3557	52	Modelo de recursos con capacidad variable	\N	PREFIX-00001-00036	\N	\N	0.00	f	3556	\N	\N	4986	1
3576	50	Modelo de capacidad variable hasta un máximo	\N	PREFIX-00001-00037	\N	\N	0.00	f	3556	\N	\N	4987	2
3577	50	Modelo de recursos con cumplimiento de criterio	\N	PREFIX-00001-00038	\N	\N	0.00	f	3556	\N	\N	4988	3
3589	47	Modelo de clases de recursos limitantes	\N	PREFIX-00001-00044	\N	\N	0.00	f	3556	\N	\N	4989	4
3617	39	Interfaz para solicitude/recepción de nivelación de planificación	\N	PREFIX-00001-00049	\N	\N	0.00	f	3599	\N	\N	5985	3
3618	40	Módulo de planificación	\N	PREFIX-00001-00048	\N	\N	0.02	f	2360	\N	\N	5986	6
3619	39	Infraestructura de análisis de redes tarefas en 2 modos	\N	PREFIX-00001-00050	\N	\N	0.00	f	3618	\N	\N	5987	1
3620	39	Modo de análisis cara atrás	\N	PREFIX-00001-00051	\N	\N	0.00	f	3619	\N	\N	5988	0
3621	39	Modo de análisis cara adiante	\N	PREFIX-00001-00052	\N	\N	0.00	f	3619	\N	\N	5989	1
3631	38	Algoritmia de la gestión de la cadena crítica	\N	PREFIX-00001-00053	\N	\N	0.00	f	3618	\N	\N	5990	2
3632	38	Método de Montecarlo para simulaciones	\N	PREFIX-00001-00054	\N	\N	0.00	f	3631	\N	\N	5991	0
3633	38	Servicio de cómputo de la cadena crítica	\N	PREFIX-00001-00055	\N	\N	0.00	f	3631	\N	\N	5992	1
5599	28	Algoritmos de asignación de recursos	\N	PREFIX-00001-00061	\N	\N	0.00	f	3618	\N	\N	6041	3
5600	28	Servicio de configuración de función de asignación de recursos	\N	PREFIX-00001-00062	\N	\N	0.00	f	5599	\N	\N	6042	0
5601	28	Infraestructura para composición y colaboración de diferentes estrategias	\N	PREFIX-00001-00063	\N	\N	0.00	f	5599	\N	\N	6043	1
5602	28	Algoritmo de asignación de recursos	\N	PREFIX-00001-00064	\N	\N	0.00	f	5599	\N	\N	6044	2
5603	28	Algoritmo de asignación de recursos limitantes	\N	PREFIX-00001-00065	\N	\N	0.00	f	5599	\N	\N	6045	3
89414	7	Coordinación	\N	PREFIX-00006-00001	\N	\N	0.00	f	89413	82535	\N	88841	0
89413	7	Desarrollo de proyecto web	Desc.	PREFIX-00006	2011-02-16 00:00:00	2011-04-21 00:00:00	0.00	f	\N	\N	\N	88840	\N
89420	7	Análisis - Template con criterio	\N	PREFIX-00006-00002	\N	\N	0.00	f	89413	82580	\N	88847	1
89421	7	Análisis del módulo de arquitectura	\N	PREFIX-00006-00008	\N	\N	0.00	f	89420	82581	\N	88848	0
89422	7	Análisis del módulo de representación de la información	\N	PREFIX-00006-00009	\N	\N	0.00	f	89420	82582	\N	88849	1
89423	7	Análisis del módulo de planificación	\N	PREFIX-00006-00010	\N	\N	0.00	f	89420	82583	\N	88850	2
89424	7	Análisis del módulo de interface	\N	PREFIX-00006-00011	\N	\N	0.00	f	89420	82584	\N	88851	3
89415	7	Reuniones	\N	PREFIX-00006-00003	\N	\N	0.00	f	89414	82536	\N	88842	0
89416	7	Planificación periódica	\N	PREFIX-00006-00004	\N	\N	0.00	f	89414	82537	\N	88843	1
89417	7	Actas de reuniones	\N	PREFIX-00006-00005	\N	\N	0.00	f	89414	82538	\N	88844	2
89418	7	Control de calidad	\N	PREFIX-00006-00006	\N	\N	0.00	f	89414	82539	\N	88845	3
89419	7	Informes de seguimiento	\N	PREFIX-00006-00007	\N	\N	0.00	f	89414	82540	\N	88846	4
85268	11	2º proyecto de desarrollo de aplicación de gestión de proyectos 	Desc.	PREFIX-00003	2011-03-01 00:00:00	2011-07-01 00:00:00	0.00	f	\N	83817	\N	85099	\N
85269	11	Coordinación 	\N	PREFIX-00003-00001	\N	\N	0.00	f	85268	83818	\N	85100	0
85270	11	Reuniones	\N	PREFIX-00003-00010	\N	\N	0.00	f	85269	83819	\N	85101	0
85271	11	Planificación periódica	\N	PREFIX-00003-00011	\N	\N	0.00	f	85269	83820	\N	85102	1
85272	11	Actas de reuniones	\N	PREFIX-00003-00012	\N	\N	0.00	f	85269	83821	\N	85103	2
85273	11	Control de calidad	\N	PREFIX-00003-00013	\N	\N	0.00	f	85269	83822	\N	85104	3
85274	11	Informes de seguimiento	\N	PREFIX-00003-00014	\N	\N	0.00	f	85269	83823	\N	85105	4
85275	11	Análisis	\N	PREFIX-00003-00002	\N	\N	0.00	f	85268	83824	\N	85106	1
85276	11	Análisis del módulo de arquitectura	\N	PREFIX-00003-00015	\N	\N	0.00	f	85275	83825	\N	85107	0
85277	11	Análisis del módulo de representación de la información	\N	PREFIX-00003-00016	\N	\N	0.00	f	85275	83826	\N	85108	1
85278	11	Análisis del módulo de planificación	\N	PREFIX-00003-00017	\N	\N	0.00	f	85275	83827	\N	85109	2
85279	11	Análisis del módulo de interface	\N	PREFIX-00003-00018	\N	\N	0.00	f	85275	83828	\N	85110	3
85280	11	Pruebas unitarias	\N	PREFIX-00003-00003	\N	\N	0.00	f	85268	83829	\N	85111	2
85281	11	Pruebas del módulo de arquitectura	\N	PREFIX-00003-00019	\N	\N	0.00	f	85280	84032	\N	85112	0
85282	11	Pruebas del módulo de representación de la información	\N	PREFIX-00003-00020	\N	\N	0.00	f	85280	84033	\N	85113	1
85283	11	Pruebas del módulo de interface	\N	PREFIX-00003-00021	\N	\N	0.00	f	85280	84034	\N	85114	2
85284	11	Pruebas del módulo de planificación	\N	PREFIX-00003-00022	\N	\N	0.00	f	85280	84035	\N	85115	3
85285	11	Pruebas del módulo de entradas/salidas	\N	PREFIX-00003-00023	\N	\N	0.00	f	85280	84036	\N	85116	4
85286	11	Módulo de arquitectura	\N	PREFIX-00003-00004	\N	\N	0.00	f	85268	84037	\N	85117	3
85287	11	Diseño de paquetes y estructura interna librería	\N	PREFIX-00003-00024	\N	\N	0.00	f	85286	84038	\N	85118	0
85288	11	Diseño API y fachadas	\N	PREFIX-00003-00025	\N	\N	0.00	f	85286	84039	\N	85119	1
85289	11	Definición de la documentación	\N	PREFIX-00003-00026	\N	\N	0.00	f	85286	84040	\N	85120	2
85290	11	Diseño de conversaciones con librería	\N	PREFIX-00003-00027	\N	\N	0.00	f	85286	84041	\N	85121	3
85291	11	Diseño de soporte de fases	\N	PREFIX-00003-00028	\N	\N	0.00	f	85286	84042	\N	85122	4
85292	11	Módulo de representación de la información	\N	PREFIX-00003-00005	\N	\N	0.00	f	85268	84043	\N	85123	4
85297	11	Modelo de clases para representar asignaciones de recursos	\N	PREFIX-00003-00033	\N	\N	0.00	f	85296	84048	\N	85128	0
85298	11	Modelo de recursos con capacidad variable	\N	PREFIX-00003-00034	\N	\N	0.00	f	85296	84049	\N	85129	1
85299	11	Modelo de capacidad variable hasta un máximo	\N	PREFIX-00003-00035	\N	\N	0.00	f	85296	84050	\N	85130	2
85300	11	Modelo de recursos con cumplimiento de criterio	\N	PREFIX-00003-00036	\N	\N	0.00	f	85296	84051	\N	85131	3
85301	11	Modelo de clases de recursos limitantes	\N	PREFIX-00003-00037	\N	\N	0.00	f	85296	84052	\N	85132	4
85302	11	Módulo de calendario	\N	PREFIX-00003-00038	\N	\N	0.00	f	85292	84053	\N	85133	2
85303	11	Modelos de calendarios asignados a recursos	\N	PREFIX-00003-00039	\N	\N	0.00	f	85302	84054	\N	85134	0
85304	11	Módulo de clases para calendario	\N	PREFIX-00003-00040	\N	\N	0.00	f	85302	84055	\N	85135	1
88600	5	Informes de seguimiento	\N	PREFIX-00004-00014	\N	\N	0.00	f	88595	83823	\N	88330	4
88601	5	Análisis	\N	PREFIX-00004-00002	\N	\N	0.00	f	88594	83824	\N	88331	1
88602	5	Análisis del módulo de arquitectura	\N	PREFIX-00004-00015	\N	\N	0.00	f	88601	83825	\N	88332	0
88603	5	Análisis del módulo de representación de la información	\N	PREFIX-00004-00016	\N	\N	0.00	f	88601	83826	\N	88333	1
88604	5	Análisis del módulo de planificación	\N	PREFIX-00004-00017	\N	\N	0.00	f	88601	83827	\N	88334	2
88605	5	Análisis del módulo de interface	\N	PREFIX-00004-00018	\N	\N	0.00	f	88601	83828	\N	88335	3
88606	5	Pruebas unitarias	\N	PREFIX-00004-00003	\N	\N	0.00	f	88594	83829	\N	88336	2
88607	5	Pruebas del módulo de arquitectura	\N	PREFIX-00004-00019	\N	\N	0.00	f	88606	84032	\N	88337	0
88608	5	Pruebas del módulo de representación de la información	\N	PREFIX-00004-00020	\N	\N	0.00	f	88606	84033	\N	88338	1
88609	5	Pruebas del módulo de interface	\N	PREFIX-00004-00021	\N	\N	0.00	f	88606	84034	\N	88339	2
88610	5	Pruebas del módulo de planificación	\N	PREFIX-00004-00022	\N	\N	0.00	f	88606	84035	\N	88340	3
88611	5	Pruebas del módulo de entradas/salidas	\N	PREFIX-00004-00023	\N	\N	0.00	f	88606	84036	\N	88341	4
88612	5	Módulo de arquitectura	\N	PREFIX-00004-00004	\N	\N	0.00	f	88594	84037	\N	88342	3
88613	5	Diseño de paquetes y estructura interna librería	\N	PREFIX-00004-00024	\N	\N	0.00	f	88612	84038	\N	88343	0
88614	5	Diseño API y fachadas	\N	PREFIX-00004-00025	\N	\N	0.00	f	88612	84039	\N	88344	1
88615	5	Definición de la documentación	\N	PREFIX-00004-00026	\N	\N	0.00	f	88612	84040	\N	88345	2
88616	5	Diseño de conversaciones con librería	\N	PREFIX-00004-00027	\N	\N	0.00	f	88612	84041	\N	88346	3
88617	5	Diseño de soporte de fases	\N	PREFIX-00004-00028	\N	\N	0.00	f	88612	84042	\N	88347	4
88618	5	Módulo de representación de la información	\N	PREFIX-00004-00005	\N	\N	0.00	f	88594	84043	\N	88348	4
88619	5	Módulo de redes de tareas	\N	PREFIX-00004-00029	\N	\N	0.00	f	88618	84044	\N	88349	0
88620	5	Modelo de clases para tipos de dependencias	\N	PREFIX-00004-00030	\N	\N	0.00	f	88619	84045	\N	88350	0
88621	5	Modelo de clases para tipos de restricciones	\N	PREFIX-00004-00031	\N	\N	0.00	f	88619	84046	\N	88351	1
88622	5	Módulo de recursos	\N	PREFIX-00004-00032	\N	\N	0.00	f	88618	84047	\N	88352	1
88623	5	Modelo de clases para representar asignaciones de recursos	\N	PREFIX-00004-00033	\N	\N	0.00	f	88622	84048	\N	88353	0
88624	5	Modelo de recursos con capacidad variable	\N	PREFIX-00004-00034	\N	\N	0.00	f	88622	84049	\N	88354	1
88625	5	Modelo de capacidad variable hasta un máximo	\N	PREFIX-00004-00035	\N	\N	0.00	f	88622	84050	\N	88355	2
88626	5	Modelo de recursos con cumplimiento de criterio	\N	PREFIX-00004-00036	\N	\N	0.00	f	88622	84051	\N	88356	3
88627	5	Modelo de clases de recursos limitantes	\N	PREFIX-00004-00037	\N	\N	0.00	f	88622	84052	\N	88357	4
88628	5	Módulo de calendario	\N	PREFIX-00004-00038	\N	\N	0.00	f	88618	84053	\N	88358	2
88629	5	Modelos de calendarios asignados a recursos	\N	PREFIX-00004-00039	\N	\N	0.00	f	88628	84054	\N	88359	0
88630	5	Módulo de clases para calendario	\N	PREFIX-00004-00040	\N	\N	0.00	f	88628	84055	\N	88360	1
88631	5	Módulo de representación de funciones de asignación	\N	PREFIX-00004-00041	\N	\N	0.00	f	88618	84056	\N	88361	3
88632	5	Modelo de asignación plana	\N	PREFIX-00004-00042	\N	\N	0.00	f	88631	84057	\N	88362	0
88633	5	Modelo de función de asignación por tramos	\N	PREFIX-00004-00043	\N	\N	0.00	f	88631	84058	\N	88363	1
88634	5	Modelo de funciones S	\N	PREFIX-00004-00044	\N	\N	0.00	f	88631	84059	\N	88364	2
88635	5	Modelo de asignación siguiendo las cadena crítica	\N	PREFIX-00004-00045	\N	\N	0.00	f	88631	84060	\N	88365	3
88636	5	Módulo Interface	\N	PREFIX-00004-00006	\N	\N	0.00	f	88594	84061	\N	88366	5
88637	5	Interface para soporte de recursos con máximo de capacidad	\N	PREFIX-00004-00046	\N	\N	0.00	f	88636	84062	\N	88367	0
88658	5	Curvas S	\N	PREFIX-00004-00066	\N	\N	0.00	f	88657	84083	\N	88792	0
88638	5	Interface gráfica para interactuación con método de cadena crítica	\N	PREFIX-00004-00047	\N	\N	0.00	f	88636	84063	\N	88368	1
88639	5	Modificación da asignación de recursos	\N	PREFIX-00004-00048	\N	\N	0.00	f	88636	84064	\N	88369	2
88640	5	Interfaz para solicitude/recepción de nivelación de planificación	\N	PREFIX-00004-00049	\N	\N	0.00	f	88636	84065	\N	88370	3
88641	5	Módulo de planificación	\N	PREFIX-00004-00007	\N	\N	0.00	f	88594	84066	\N	88371	6
88642	5	Algoritmia de cálculo do camino crítico	\N	PREFIX-00004-00050	\N	\N	0.00	f	88641	84067	\N	88372	0
88643	5	Infraestructura de análisis de redes tarefas en 2 modos	\N	PREFIX-00004-00051	\N	\N	0.00	f	88641	84068	\N	88373	1
88644	5	Modo de análisis cara atrás	\N	PREFIX-00004-00052	\N	\N	0.00	f	88643	84069	\N	88374	0
88645	5	Modo de análisis cara adiante	\N	PREFIX-00004-00053	\N	\N	0.00	f	88643	84070	\N	88779	1
88646	5	Algoritmia de la gestión de la cadena crítica	\N	PREFIX-00004-00054	\N	\N	0.00	f	88641	84071	\N	88780	2
88647	5	Método de Montecarlo para simulaciones	\N	PREFIX-00004-00055	\N	\N	0.00	f	88646	84072	\N	88781	0
88648	5	Servicio de cómputo de la cadena crítica	\N	PREFIX-00004-00056	\N	\N	0.00	f	88646	84073	\N	88782	1
88649	5	Reasignación siguiendo indicaciones de la cadena crítica	\N	PREFIX-00004-00057	\N	\N	0.00	f	88646	84074	\N	88783	2
88650	5	Evaluación de proyecto siguiendo cadena crítica	\N	PREFIX-00004-00058	\N	\N	0.00	f	88646	84075	\N	88784	3
88651	5	Algoritmos de asignación de recursos	\N	PREFIX-00004-00059	\N	\N	0.00	f	88641	84076	\N	88785	3
88652	5	Servicio de configuración de función de asignación de recursos	\N	PREFIX-00004-00060	\N	\N	0.00	f	88651	84077	\N	88786	0
88653	5	Infraestructura para composición y colaboración de diferentes estrategias	\N	PREFIX-00004-00061	\N	\N	0.00	f	88651	84078	\N	88787	1
88654	5	Algoritmo de asignación de recursos	\N	PREFIX-00004-00062	\N	\N	0.00	f	88651	84079	\N	88788	2
88655	5	Algoritmo de asignación de recursos limitantes	\N	PREFIX-00004-00063	\N	\N	0.00	f	88651	84080	\N	88789	3
88656	5	Algoritmo de asignación dando prioridad a deadlines	\N	PREFIX-00004-00064	\N	\N	0.00	f	88651	84081	\N	88790	4
88657	5	Operaciones de nivelación de recursos sobre planificación	\N	PREFIX-00004-00065	\N	\N	0.00	f	88641	84082	\N	88791	4
88659	5	Configuración de planificación a nivelar	\N	PREFIX-00004-00067	\N	\N	0.00	f	88657	84084	\N	88793	1
88660	5	Algoritmia de nivelación de asignación de recursos	\N	PREFIX-00004-00068	\N	\N	0.00	f	88657	84085	\N	88794	2
90812	3	Order Group 1	\N	PREFIX-00007-00002	\N	\N	0.00	f	90810	\N	\N	90913	1
90810	3	Order 3	\N	PREFIX-00007	2010-11-18 11:49:08.324	\N	0.00	f	\N	\N	\N	90911	\N
90811	3	Order element 1	\N	PREFIX-00007-00001	\N	\N	0.00	f	90810	\N	\N	90912	0
90813	3	Order Group 2	\N	PREFIX-00007-00003	\N	\N	0.00	f	90812	\N	\N	90914	0
90814	3	Order element 2	\N	PREFIX-00007-00004	\N	\N	0.00	f	90813	\N	\N	90915	0
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
82535	1	Coordinación Template	\N	PREFIX-00001-00006	\N	\N	0	\N	\N
82536	1	Reuniones	\N	PREFIX-00001-00001	\N	\N	1	82535	0
82537	1	Planificación periódica	\N	PREFIX-00001-00011	\N	\N	1	82535	1
82538	1	Actas de reuniones	\N	PREFIX-00001-00012	\N	\N	1	82535	2
82539	1	Control de calidad	\N	PREFIX-00001-00013	\N	\N	1	82535	3
82540	1	Informes de seguimiento	\N	PREFIX-00001-00014	\N	\N	1	82535	4
82559	1	Coordinación - Plantilla con criterio	\N	PREFIX-00001-00006	\N	\N	0	\N	\N
82560	1	Reuniones	\N	PREFIX-00001-00001	\N	\N	1	82559	0
82561	1	Planificación periódica	\N	PREFIX-00001-00011	\N	\N	1	82559	1
82562	1	Actas de reuniones	\N	PREFIX-00001-00012	\N	\N	1	82559	2
82563	1	Control de calidad	\N	PREFIX-00001-00013	\N	\N	1	82559	3
82564	1	Informes de seguimiento	\N	PREFIX-00001-00014	\N	\N	1	82559	4
82580	1	Análisis - Template con criterio	\N	PREFIX-00001-00015	\N	\N	3	\N	\N
82581	1	Análisis del módulo de arquitectura	\N	PREFIX-00001-00016	\N	\N	0	82580	0
82582	1	Análisis del módulo de representación de la información	\N	PREFIX-00001-00017	\N	\N	0	82580	1
82583	1	Análisis del módulo de planificación	\N	PREFIX-00001-00018	\N	\N	0	82580	2
82584	1	Análisis del módulo de interface	\N	PREFIX-00001-00019	\N	\N	0	82580	3
83817	1	Desarrollo de aplicación de gestión de proyectos - Template	Desc.	PREFIX-00001	0	129	3	\N	\N
83818	1	Coordinación 	\N	PREFIX-00001-00006	\N	\N	0	83817	0
83824	1	Análisis	\N	PREFIX-00001-00015	\N	\N	3	83817	1
83829	1	Pruebas unitarias	\N	PREFIX-00001-00003	\N	\N	3	83817	2
84037	1	Módulo de arquitectura	\N	PREFIX-00001-00024	\N	\N	3	83817	3
84043	1	Módulo de representación de la información	\N	PREFIX-00001-00029	\N	\N	3	83817	4
84061	1	Módulo Interface	\N	PREFIX-00001-00045	\N	\N	3	83817	5
84066	1	Módulo de planificación	\N	PREFIX-00001-00048	\N	\N	3	83817	6
84086	1	Módulo de entradas/salidas	\N	PREFIX-00001-00070	\N	\N	3	83817	7
84092	1	Gestión del entorno	\N	PREFIX-00001-00025	\N	\N	0	83817	8
83819	1	Reuniones	\N	PREFIX-00001-00001	\N	\N	1	83818	0
83820	1	Planificación periódica	\N	PREFIX-00001-00011	\N	\N	1	83818	1
83821	1	Actas de reuniones	\N	PREFIX-00001-00012	\N	\N	1	83818	2
83822	1	Control de calidad	\N	PREFIX-00001-00013	\N	\N	1	83818	3
83823	1	Informes de seguimiento	\N	PREFIX-00001-00014	\N	\N	1	83818	4
83825	1	Análisis del módulo de arquitectura	\N	PREFIX-00001-00016	\N	\N	0	83824	0
83826	1	Análisis del módulo de representación de la información	\N	PREFIX-00001-00017	\N	\N	0	83824	1
83827	1	Análisis del módulo de planificación	\N	PREFIX-00001-00018	\N	\N	0	83824	2
83828	1	Análisis del módulo de interface	\N	PREFIX-00001-00019	\N	\N	0	83824	3
84032	1	Pruebas del módulo de arquitectura	\N	PREFIX-00001-00005	\N	\N	0	83829	0
84033	1	Pruebas del módulo de representación de la información	\N	PREFIX-00001-00020	\N	\N	0	83829	1
84034	1	Pruebas del módulo de interface	\N	PREFIX-00001-00021	\N	\N	0	83829	2
84035	1	Pruebas del módulo de planificación	\N	PREFIX-00001-00022	\N	\N	0	83829	3
84036	1	Pruebas del módulo de entradas/salidas	\N	PREFIX-00001-00026	\N	\N	0	83829	4
84038	1	Diseño de paquetes y estructura interna librería	\N	PREFIX-00001-00004	\N	\N	0	84037	0
84039	1	Diseño API y fachadas	\N	PREFIX-00001-00027	\N	\N	0	84037	1
84040	1	Definición de la documentación	\N	PREFIX-00001-00023	\N	\N	0	84037	2
84041	1	Diseño de conversaciones con librería	\N	PREFIX-00001-00028	\N	\N	0	84037	3
84042	1	Diseño de soporte de fases	\N	PREFIX-00001-00043	\N	\N	0	84037	4
84044	1	Módulo de redes de tareas	\N	PREFIX-00001-00033	\N	\N	3	84043	0
84047	1	Módulo de recursos	\N	PREFIX-00001-00035	\N	\N	3	84043	1
84053	1	Módulo de calendario	\N	PREFIX-00001-00039	\N	\N	3	84043	2
84056	1	Módulo de representación de funciones de asignación	\N	PREFIX-00001-00041	\N	\N	3	84043	3
84045	1	Modelo de clases para tipos de dependencias	\N	PREFIX-00001-00007	\N	\N	0	84044	0
84046	1	Modelo de clases para tipos de restricciones	\N	PREFIX-00001-00034	\N	\N	0	84044	1
84048	1	Modelo de clases para representar asignaciones de recursos	\N	PREFIX-00001-00030	\N	\N	0	84047	0
84049	1	Modelo de recursos con capacidad variable	\N	PREFIX-00001-00036	\N	\N	0	84047	1
84050	1	Modelo de capacidad variable hasta un máximo	\N	PREFIX-00001-00037	\N	\N	0	84047	2
84051	1	Modelo de recursos con cumplimiento de criterio	\N	PREFIX-00001-00038	\N	\N	0	84047	3
84052	1	Modelo de clases de recursos limitantes	\N	PREFIX-00001-00044	\N	\N	0	84047	4
84054	1	Modelos de calendarios asignados a recursos	\N	PREFIX-00001-00031	\N	\N	0	84053	0
84055	1	Módulo de clases para calendario	\N	PREFIX-00001-00040	\N	\N	0	84053	1
84057	1	Modelo de asignación plana	\N	PREFIX-00001-00032	\N	\N	0	84056	0
84058	1	Modelo de función de asignación por tramos	\N	PREFIX-00001-00042	\N	\N	0	84056	1
84059	1	Modelo de funciones S	\N	PREFIX-00001-00058	\N	\N	0	84056	2
84060	1	Modelo de asignación siguiendo las cadena crítica	\N	PREFIX-00001-00059	\N	\N	0	84056	3
84062	1	Interface para soporte de recursos con máximo de capacidad	\N	PREFIX-00001-00046	\N	\N	0	84061	0
84063	1	Interface gráfica para interactuación con método de cadena crítica	\N	PREFIX-00001-00047	\N	\N	0	84061	1
84064	1	Modificación da asignación de recursos	\N	PREFIX-00001-00009	\N	\N	0	84061	2
84065	1	Interfaz para solicitude/recepción de nivelación de planificación	\N	PREFIX-00001-00049	\N	\N	0	84061	3
84067	1	Algoritmia de cálculo do camino crítico	\N	PREFIX-00001-00008	\N	\N	0	84066	0
84068	1	Infraestructura de análisis de redes tarefas en 2 modos	\N	PREFIX-00001-00050	\N	\N	3	84066	1
84071	1	Algoritmia de la gestión de la cadena crítica	\N	PREFIX-00001-00053	\N	\N	3	84066	2
84076	1	Algoritmos de asignación de recursos	\N	PREFIX-00001-00061	\N	\N	3	84066	3
84082	1	Operaciones de nivelación de recursos sobre planificación	\N	PREFIX-00001-00067	\N	\N	3	84066	4
84069	1	Modo de análisis cara atrás	\N	PREFIX-00001-00051	\N	\N	0	84068	0
84070	1	Modo de análisis cara adiante	\N	PREFIX-00001-00052	\N	\N	0	84068	1
84072	1	Método de Montecarlo para simulaciones	\N	PREFIX-00001-00054	\N	\N	0	84071	0
84073	1	Servicio de cómputo de la cadena crítica	\N	PREFIX-00001-00055	\N	\N	0	84071	1
84074	1	Reasignación siguiendo indicaciones de la cadena crítica	\N	PREFIX-00001-00056	\N	\N	0	84071	2
84075	1	Evaluación de proyecto siguiendo cadena crítica	\N	PREFIX-00001-00057	\N	\N	0	84071	3
84077	1	Servicio de configuración de función de asignación de recursos	\N	PREFIX-00001-00062	\N	\N	0	84076	0
84078	1	Infraestructura para composición y colaboración de diferentes estrategias	\N	PREFIX-00001-00063	\N	\N	0	84076	1
84079	1	Algoritmo de asignación de recursos	\N	PREFIX-00001-00064	\N	\N	0	84076	2
84080	1	Algoritmo de asignación de recursos limitantes	\N	PREFIX-00001-00065	\N	\N	0	84076	3
84081	1	Algoritmo de asignación dando prioridad a deadlines	\N	PREFIX-00001-00066	\N	\N	0	84076	4
84083	1	Curvas S	\N	PREFIX-00001-00068	\N	\N	0	84082	0
84084	1	Configuración de planificación a nivelar	\N	PREFIX-00001-00069	\N	\N	0	84082	1
84085	1	Algoritmia de nivelación de asignación de recursos	\N	PREFIX-00001-00060	\N	\N	0	84082	2
84087	1	API de carga	\N	PREFIX-00001-00010	\N	\N	0	84086	0
84088	1	API de comunicación vía XML	\N	PREFIX-00001-00071	\N	\N	0	84086	1
84089	1	API de preprocesamiento y análisis de datos	\N	PREFIX-00001-00072	\N	\N	0	84086	2
84090	1	API de configuración de elaboración de proceso de planificación	\N	PREFIX-00001-00073	\N	\N	0	84086	3
84091	1	API de ejecución del proceso	\N	PREFIX-00001-00074	\N	\N	0	84086	4
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
85270	1
85271	1
85272	1
85273	1
85274	1
85276	1
85277	1
85278	1
85279	1
85281	1
85282	1
85283	1
85284	1
85285	1
85287	1
85288	1
85289	1
85290	1
85291	1
85294	1
5644	1
33734	1
33735	1
33736	1
33737	1
5600	1
5601	1
5602	1
5603	1
5604	1
5606	1
5607	1
5608	1
2392	1
5630	1
5640	1
5641	1
5642	1
3222	1
85295	1
85297	1
85298	1
85299	1
85300	1
85301	1
85303	1
85304	1
85306	1
85307	1
2361	1
2385	1
2386	1
2387	1
2388	1
2409	1
2410	1
2411	1
2412	1
2364	1
2421	1
2422	1
2423	1
3218	1
2365	1
3220	1
3131	1
3221	1
3585	1
2389	1
3555	1
3539	1
3557	1
3576	1
3577	1
3589	1
3540	1
3579	1
3541	1
3581	1
5567	1
5568	1
3600	1
3601	1
2391	1
3617	1
2390	1
3620	1
3621	1
3632	1
3633	1
5556	1
85308	1
85309	1
85311	1
85312	1
85313	1
5560	1
85314	1
85316	1
85318	1
85319	1
85321	1
85322	1
85323	1
85324	1
85326	1
85327	1
85328	1
85329	1
85330	1
85332	1
85333	1
85334	1
85336	1
85341	1
89421	1
89422	1
89423	1
89424	1
89415	1
89416	1
89417	1
89418	1
89419	1
85337	1
85338	1
85339	1
85340	1
88653	1
88654	1
88655	1
88656	1
88658	1
88659	1
88660	1
88662	1
88663	1
88664	1
88665	1
88666	1
88667	1
89385	1
89386	1
89387	1
88596	1
88597	1
88598	1
88599	1
88600	1
88602	1
88603	1
88604	1
88605	1
88607	1
88608	1
88609	1
88610	1
88611	1
88613	1
88614	1
88615	1
88616	1
88617	1
88620	1
88621	1
88623	1
88624	1
88625	1
88626	1
88627	1
88629	1
88630	1
88632	1
88633	1
88634	1
88635	1
88637	1
88638	1
88639	1
88640	1
88642	1
88644	1
88645	1
88647	1
88648	1
88649	1
88650	1
88652	1
90811	1
90814	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
2360
2363
2384
2408
3219
3538
3554
3556
3578
3580
3599
3618
3619
3631
5599
5605
5629
5643
5655
85268
85269
85275
85280
85286
85292
85293
85296
85302
85305
85310
85315
85317
85320
85325
85331
85335
88594
88595
88601
88606
88612
88618
88619
88622
88628
88631
88636
88641
88643
88646
88651
88657
88661
88677
89413
89414
89420
90810
90812
90813
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
82535
82559
82580
83817
83818
83824
83829
84037
84043
84044
84047
84053
84056
84061
84066
84068
84071
84076
84082
84086
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
82536	0
82537	0
82538	0
82539	0
82540	0
82560	0
82561	0
82562	0
82563	0
82564	0
82581	0
82582	0
82583	0
82584	0
83819	0
83820	0
83821	0
83822	0
83823	0
83825	0
83826	0
83827	0
83828	0
84032	0
84033	0
84034	0
84035	0
84036	0
84038	0
84039	0
84040	0
84041	0
84042	0
84045	0
84046	0
84048	0
84049	0
84050	0
84051	0
84052	0
84054	0
84055	0
84057	0
84058	0
84059	0
84060	0
84062	0
84063	0
84064	0
84065	0
84067	0
84069	0
84070	0
84072	0
84073	0
84074	0
84075	0
84077	0
84078	0
84079	0
84080	0
84081	0
84083	0
84084	0
84085	0
84087	0
84088	0
84089	0
84090	0
84091	0
84092	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
808	11	PREFIX	7	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
83817	506
\.


--
-- Data for Name: orderversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderversion (id, version, modificationbyownertimestamp, ownerscenario) FROM stdin;
2634	13	2010-11-16 17:17:33.22	404
2633	94	2010-11-16 17:42:31.56	404
2638	17	2010-11-16 17:55:28.941	404
2642	7	2010-11-16 17:57:16.056	404
2646	5	2010-11-16 18:02:37.094	404
2650	7	2010-11-16 18:35:58.218	404
91105	3	2010-11-18 11:52:19.919	404
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
1616	ROLE_READ_ALL_ORDERS
1617	ROLE_ADMINISTRATION
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
1920	3	a4354387-23fc-40a5-a153-6435abe1a5ba	t	f	508
1922	2	cf82b504-114f-4cb3-a2b3-2b2cdbd914a3	t	f	509
1930	1	474a5c0b-6b85-4264-8215-b7cab33ffa05	t	f	513
1928	2	82f69009-2cdb-47c2-ae56-a804b61012fe	t	f	512
1924	2	a8afbef3-00c9-492d-bd02-90cacaad51f3	t	f	510
1926	2	a3381a8a-c69e-4e5e-8b00-8337c2f8bc74	t	f	511
1932	1	15ad9eb5-0290-4c0e-9149-d3d220130c14	t	f	514
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
34250	1	1.00	\N	16	6437	\N
34251	1	1.00	\N	80	6444	\N
34252	1	1.00	\N	20	6445	\N
34253	1	1.00	\N	16	6446	\N
34254	1	1.00	\N	12	6447	\N
6580	16	1.00	\N	35	6364	\N
6581	16	1.00	\N	35	6365	\N
6582	16	1.00	\N	50	6366	\N
6583	16	1.00	\N	40	6367	\N
6646	6	1.00	\N	24	6375	\N
6647	6	1.00	\N	10	6376	\N
6648	6	1.00	\N	24	6377	\N
6649	6	1.00	\N	10	6378	\N
6650	6	1.00	\N	35	6379	\N
81748	1	1.00	\N	50	6431	\N
81749	1	1.00	\N	50	6431	\N
6565	17	1.00	\N	360	6363	\N
32459	2	1.00	\N	60	6400	\N
32460	2	1.00	\N	250	6401	\N
32461	2	1.00	\N	30	6402	\N
32462	2	1.00	\N	100	6403	\N
7679	5	1.00	\N	20	6381	\N
7680	5	1.00	\N	30	6382	\N
7691	3	1.00	\N	35	6386	\N
32463	2	1.00	\N	20	6392	\N
32464	2	1.00	\N	24	6393	\N
32465	2	1.00	\N	16	6395	\N
32466	2	1.00	\N	21	6396	\N
32467	2	1.00	\N	40	6397	\N
32468	2	1.00	\N	40	6398	\N
6589	15	0.25	\N	16	6369	\N
6651	6	0.25	\N	24	6370	\N
6652	6	0.25	\N	24	6371	\N
6653	6	0.25	\N	40	6372	\N
6654	6	0.25	\N	24	6373	\N
81750	1	1.00	\N	40	6425	\N
81751	1	1.00	\N	40	6425	\N
81752	1	1.00	\N	10	6426	\N
81753	1	1.00	\N	10	6426	\N
81774	3	1.00	\N	360	6449	\N
81775	3	1.00	\N	40	6450	\N
81776	3	1.00	\N	40	6451	\N
81777	1	1.00	\N	360	85803	\N
81780	0	1.00	\N	60	89106	\N
81781	0	1.00	\N	40	89105	\N
81782	0	1.00	\N	20	89104	\N
89705	2	1.00	\N	360	89108	\N
89706	2	1.00	\N	35	89109	\N
89707	2	1.00	\N	35	89110	\N
89708	2	1.00	\N	50	89111	\N
89709	2	1.00	\N	35	89112	\N
81754	1	1.00	\N	50	6427	\N
81755	1	1.00	\N	50	6427	\N
81756	1	1.00	\N	25	6428	\N
81757	1	1.00	\N	25	6428	\N
81758	1	1.00	\N	20	6429	\N
81759	1	1.00	\N	20	6429	\N
32469	2	1.00	\N	90	6406	\N
32470	2	1.00	\N	120	6407	\N
32471	2	1.00	\N	120	6409	\N
32472	2	1.00	\N	100	6410	\N
32473	2	1.00	\N	84	6411	\N
32474	2	1.00	\N	64	6412	\N
81760	1	1.00	\N	40	6414	\N
81761	1	1.00	\N	56	6415	\N
81762	1	1.00	\N	100	6416	\N
81763	1	1.00	\N	75	6417	\N
81764	1	1.00	\N	90	6418	\N
81765	1	1.00	\N	20	6420	\N
81766	1	1.00	\N	50	6421	\N
81767	1	1.00	\N	54	6422	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
508	1
509	1
513	1
512	1
510	1
511	1
514	1
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
404	0	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
2360	2633	404
5643	2634	404
85268	2638	404
88594	2642	404
88677	2646	404
89413	2650	404
90810	91105	404
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
2360	2562	2633
2361	2563	2633
2363	2565	2633
2364	2566	2633
2365	2567	2633
2384	2586	2633
2385	2587	2633
2386	2588	2633
2387	2589	2633
2388	2590	2633
2389	2591	2633
2390	2592	2633
2391	2593	2633
2392	2594	2633
2408	2945	2633
2409	2946	2633
2410	2947	2633
2411	2948	2633
2412	2949	2633
2421	2962	2633
2422	2963	2633
2423	2964	2633
3131	2965	2633
3218	3472	2633
3219	3473	2633
3220	3474	2633
3221	3475	2633
3222	3476	2633
3538	3508	2633
3539	3509	2633
3540	3510	2633
3541	3511	2633
3554	3759	2633
3555	3760	2633
3556	3761	2633
3557	3763	2633
3576	3886	2633
3577	3887	2633
3578	3888	2633
3579	3890	2633
3580	3891	2633
3581	3893	2633
3585	4161	2633
3589	4333	2633
3599	4905	2633
3600	4906	2633
3601	4907	2633
3617	4947	2633
3618	4948	2633
3619	5252	2633
3620	5253	2633
3621	5254	2633
3631	5296	2633
3632	5297	2633
3633	5298	2633
5556	5434	2633
5560	5688	2633
5567	5900	2633
5568	5901	2633
5599	5940	2633
5600	5941	2633
5601	5942	2633
5602	5943	2633
5603	5944	2633
5604	5945	2633
5605	5946	2633
5606	5947	2633
5607	5948	2633
5608	5949	2633
5629	6119	2633
5630	6120	2633
5640	6138	2633
5641	6139	2633
5642	6140	2633
5643	33633	2634
5644	33634	2634
5655	33645	2634
33734	33646	2634
33735	33647	2634
33736	33648	2634
33737	33649	2634
85268	85200	2638
85269	85201	2638
85270	85202	2638
85271	85203	2638
85272	85204	2638
85273	85205	2638
85274	85206	2638
85275	85207	2638
85276	85208	2638
85277	85209	2638
85278	85210	2638
85279	85211	2638
85280	85212	2638
85281	85213	2638
85282	85214	2638
85283	85215	2638
85284	85216	2638
85285	85217	2638
85286	85218	2638
85287	85219	2638
85288	85220	2638
85289	85221	2638
85290	85222	2638
85291	85223	2638
85292	85224	2638
85293	85225	2638
85294	85226	2638
85295	85227	2638
85296	85228	2638
85297	85229	2638
85298	85230	2638
85299	85231	2638
85300	85232	2638
85301	85233	2638
85302	85234	2638
85303	85235	2638
85304	85236	2638
85305	85237	2638
85306	85238	2638
85307	85239	2638
85308	85240	2638
85309	85241	2638
85310	85242	2638
85311	85243	2638
85312	85547	2638
85313	85548	2638
85314	85549	2638
85315	85550	2638
85316	85551	2638
85317	85552	2638
85318	85553	2638
85319	85554	2638
85320	85555	2638
85321	85556	2638
85322	85557	2638
85323	85558	2638
85324	85559	2638
85325	85560	2638
85326	85561	2638
85327	85562	2638
85328	85563	2638
85329	85564	2638
85330	85565	2638
85331	85566	2638
85332	85567	2638
85333	85568	2638
85334	85569	2638
85335	85570	2638
85336	85571	2638
85337	85572	2638
85338	85573	2638
85339	85574	2638
85340	85575	2638
85341	85576	2638
88594	88425	2642
88595	88426	2642
88596	88427	2642
88597	88428	2642
88598	88429	2642
88599	88430	2642
88600	88431	2642
88601	88432	2642
88602	88433	2642
88603	88434	2642
88604	88435	2642
88605	88436	2642
88606	88437	2642
88607	88438	2642
88608	88439	2642
88609	88440	2642
88610	88441	2642
88611	88442	2642
88612	88443	2642
88613	88444	2642
88614	88445	2642
88615	88446	2642
88616	88447	2642
88617	88448	2642
88618	88449	2642
88619	88450	2642
88620	88451	2642
88621	88452	2642
88622	88453	2642
88623	88454	2642
88624	88455	2642
88625	88456	2642
88626	88457	2642
88627	88458	2642
88628	88459	2642
88629	88460	2642
88630	88461	2642
88631	88462	2642
88632	88463	2642
88633	88464	2642
88634	88465	2642
88635	88466	2642
88636	88467	2642
88637	88468	2642
88638	88469	2642
88639	88470	2642
88640	88471	2642
88641	88472	2642
88642	88473	2642
88643	88474	2642
88644	88475	2642
88645	88880	2642
88646	88881	2642
88647	88882	2642
88648	88883	2642
88649	88884	2642
88650	88885	2642
88651	88886	2642
88652	88887	2642
88653	88888	2642
88654	88889	2642
88655	88890	2642
88656	88891	2642
88657	88892	2642
88658	88893	2642
88659	88894	2642
88660	88895	2642
88661	88896	2642
88662	88897	2642
88663	88898	2642
88664	88899	2642
88665	88900	2642
88666	88901	2642
88667	88902	2642
88677	88912	2646
89385	88913	2646
89386	88914	2646
89387	88915	2646
89413	88941	2650
89414	88942	2650
89415	88943	2650
89416	88944	2650
89417	88945	2650
89418	88946	2650
89419	88947	2650
89420	88948	2650
89421	88949	2650
89422	88950	2650
89423	88951	2650
89424	88952	2650
90810	91012	91105
90811	91013	91105
90812	91014	91105
90813	91015	91105
90814	91016	91105
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
2562	59	3	2360
2586	56	0	2384
2563	58	1	2361
2587	56	1	2385
2588	56	1	2386
2589	56	1	2387
3510	44	0	3540
3511	44	0	3541
5900	28	0	5567
5901	28	0	5568
4905	32	3	3599
33633	9	3	5643
33634	9	0	5644
88912	4	3	88677
88913	4	0	89385
88914	4	0	89386
88915	4	0	89387
4906	32	0	3600
4907	32	0	3601
6119	26	3	5629
6120	26	0	5630
3754	2	4	3218
3755	2	4	3219
3756	2	4	3220
3757	2	4	3221
3758	2	4	3538
3762	2	4	3539
3764	2	4	3540
3765	2	4	3541
2940	2	4	2384
2941	2	4	2385
2942	2	4	2386
2943	2	4	2387
2944	2	4	2388
3766	2	4	3222
2950	2	4	2389
2951	2	4	2391
2952	2	4	2390
2953	2	4	2392
3876	2	4	3218
3877	2	4	3219
3504	2	4	3218
3505	2	4	3219
3506	2	4	3220
3507	2	4	3221
3512	2	4	3222
3806	2	4	3218
3807	2	4	3219
3808	2	4	3220
3809	2	4	3221
3810	2	4	3538
3811	2	4	3554
3812	2	4	3555
3813	2	4	3556
3814	2	4	3539
3815	2	4	3557
3816	2	4	3540
3817	2	4	3541
3818	2	4	3222
3878	2	4	3220
3879	2	4	3221
3880	2	4	3538
3881	2	4	3554
3882	2	4	3555
3883	2	4	3556
3884	2	4	3539
3885	2	4	3557
33645	8	3	5655
4237	2	4	3218
4238	2	4	3219
4239	2	4	3220
4240	2	4	3221
4241	2	4	3585
4242	2	4	3538
4243	2	4	3554
3889	2	4	3540
3892	2	4	3541
3894	2	4	3222
33646	8	0	33734
4244	2	4	3555
4245	2	4	3556
4246	2	4	3539
4247	2	4	3557
4248	2	4	3576
4249	2	4	3577
4250	2	4	3578
4251	2	4	3540
4252	2	4	3579
4253	2	4	3580
4254	2	4	3541
4255	2	4	3581
4256	2	4	3222
33647	8	0	33735
4157	2	4	3218
4158	2	4	3219
4159	2	4	3220
4160	2	4	3221
4162	2	4	3538
4163	2	4	3554
4164	2	4	3555
4165	2	4	3556
4166	2	4	3539
4167	2	4	3557
4168	2	4	3576
4169	2	4	3577
4170	2	4	3578
4171	2	4	3540
4172	2	4	3579
4173	2	4	3580
4174	2	4	3541
4175	2	4	3581
4176	2	4	3222
33648	8	0	33736
4320	2	4	3218
4321	2	4	3219
4322	2	4	3220
4323	2	4	3221
4324	2	4	3585
4325	2	4	3538
4326	2	4	3554
4327	2	4	3555
4328	2	4	3556
4329	2	4	3539
4330	2	4	3557
4331	2	4	3576
4332	2	4	3577
33649	8	0	33737
4334	2	4	3578
4335	2	4	3540
4336	2	4	3579
4337	2	4	3580
4338	2	4	3541
4339	2	4	3581
4340	2	4	3222
2590	56	1	2388
2945	56	3	2408
2946	56	0	2409
2947	56	0	2410
4690	2	4	3218
2948	56	0	2411
4691	2	4	3219
4692	2	4	3220
4693	2	4	3221
4694	2	4	3585
4695	2	4	3538
4696	2	4	3554
4697	2	4	3555
4698	2	4	3556
4699	2	4	3539
4700	2	4	3557
4701	2	4	3576
4702	2	4	3577
4703	2	4	3589
2949	56	0	2412
2565	58	3	2363
2566	58	0	2364
4704	2	4	3578
4505	2	4	3218
4506	2	4	3219
4507	2	4	3220
4508	2	4	3221
4509	2	4	3585
4510	2	4	3538
4511	2	4	3554
4512	2	4	3555
4513	2	4	3556
4514	2	4	3539
4515	2	4	3557
4516	2	4	3576
4517	2	4	3577
4705	2	4	3540
4706	2	4	3579
4707	2	4	3580
4708	2	4	3541
4709	2	4	3581
4710	2	4	3222
4917	2	4	3599
4918	2	4	3600
4919	2	4	3601
5288	2	4	3599
5289	2	4	3600
4518	2	4	3589
4519	2	4	3578
4520	2	4	3540
4521	2	4	3579
4522	2	4	3580
4523	2	4	3541
4524	2	4	3581
4525	2	4	3222
2964	55	0	2423
3472	44	0	3218
3473	44	3	3219
2567	58	0	2365
5381	2	4	3619
5382	2	4	3620
5383	2	4	3621
5384	2	4	3631
5385	2	4	3632
5386	2	4	3633
4944	2	4	3599
4945	2	4	3600
4946	2	4	3601
4875	2	4	3218
4876	2	4	3219
4877	2	4	3220
4878	2	4	3221
4879	2	4	3585
4880	2	4	3538
4881	2	4	3554
4882	2	4	3555
4883	2	4	3556
4884	2	4	3539
4885	2	4	3557
4886	2	4	3576
4887	2	4	3577
4888	2	4	3589
4889	2	4	3578
4890	2	4	3540
4891	2	4	3579
4892	2	4	3580
4893	2	4	3541
4894	2	4	3581
4895	2	4	3222
2962	55	0	2421
5290	2	4	3601
5291	2	4	3617
5292	2	4	3618
5293	2	4	3619
5294	2	4	3620
5295	2	4	3621
2963	55	0	2422
33665	2	3	5655
33666	2	0	33734
33667	2	0	33735
33668	2	0	33736
5332	2	4	3599
5333	2	4	3600
5334	2	4	3601
5335	2	4	3617
5336	2	4	3618
5337	2	4	3619
5338	2	4	3620
5339	2	4	3621
5340	2	4	3631
5341	2	4	3632
5342	2	4	3633
5429	2	4	3620
5430	2	4	3621
5431	2	4	3631
5432	2	4	3632
5433	2	4	3633
5376	2	4	3599
5377	2	4	3600
5378	2	4	3601
5379	2	4	3617
5380	2	4	3618
33669	2	0	33737
5676	2	4	3599
5677	2	4	3600
5423	2	4	3599
5424	2	4	3600
5425	2	4	3601
5426	2	4	3617
5427	2	4	3618
5428	2	4	3619
5728	2	4	3599
5678	2	4	3601
5679	2	4	3617
5680	2	4	3618
5681	2	4	3619
5682	2	4	3620
5683	2	4	3621
5684	2	4	3631
5685	2	4	3632
5686	2	4	3633
5687	2	4	5556
5729	2	4	3600
5730	2	4	3601
5731	2	4	3617
5732	2	4	3618
5733	2	4	3619
5734	2	4	3620
5735	2	4	3621
5736	2	4	3631
5737	2	4	3632
5738	2	4	3633
5739	2	4	5556
85219	11	0	85287
85220	11	0	85288
85221	11	0	85289
6136	2	4	5629
6137	2	4	5630
85222	11	0	85290
85223	11	0	85291
85224	11	3	85292
85225	11	3	85293
88941	7	3	89413
88942	7	0	89414
88943	7	1	89415
88944	7	1	89416
88945	7	1	89417
5740	2	4	5560
5938	2	4	5567
5939	2	4	5568
5881	2	4	3599
5882	2	4	3600
5883	2	4	3601
5884	2	4	3617
5885	2	4	3618
5886	2	4	3619
5887	2	4	3620
5888	2	4	3621
5889	2	4	3631
5890	2	4	3632
5891	2	4	3633
5892	2	4	5556
5893	2	4	5560
4333	44	0	3589
3888	44	3	3578
3890	44	0	3579
3891	44	3	3580
3893	44	0	3581
2593	56	0	2391
4947	32	0	3617
4948	32	3	3618
2592	56	0	2390
5252	32	3	3619
5253	32	0	3620
5254	32	0	3621
5296	32	3	3631
5297	32	0	3632
5298	32	0	3633
5434	32	0	5556
5688	32	0	5560
5940	28	3	5599
5941	28	0	5600
5942	28	0	5601
5943	28	0	5602
5944	28	0	5603
5945	28	0	5604
5946	28	3	5605
5947	28	0	5606
5948	28	0	5607
5949	28	0	5608
2594	56	0	2392
6138	26	0	5640
6139	26	0	5641
6140	26	0	5642
88950	7	0	89422
88951	7	0	89423
88952	7	0	89424
88946	7	1	89418
88947	7	1	89419
3476	44	0	3222
3474	44	0	3220
2965	55	0	3131
3475	44	0	3221
4161	44	0	3585
3508	45	3	3538
3759	44	3	3554
2591	56	0	2389
3760	44	0	3555
3761	44	3	3556
3509	44	0	3539
3763	44	0	3557
3886	44	0	3576
3887	44	0	3577
85200	11	3	85268
85201	11	0	85269
85202	11	1	85270
85203	11	1	85271
85204	11	1	85272
85205	11	1	85273
85206	11	1	85274
85207	11	3	85275
85208	11	0	85276
85209	11	0	85277
85210	11	0	85278
85211	11	0	85279
85212	11	3	85280
85213	11	0	85281
85214	11	0	85282
85215	11	0	85283
85216	11	0	85284
85217	11	0	85285
85218	11	3	85286
88447	5	0	88616
88448	5	0	88617
88449	5	3	88618
88450	5	3	88619
88451	5	0	88620
88452	5	0	88621
88453	5	3	88622
88454	5	0	88623
88455	5	0	88624
88456	5	0	88625
88457	5	0	88626
88458	5	0	88627
88459	5	3	88628
88460	5	0	88629
88461	5	0	88630
88462	5	3	88631
88463	5	0	88632
88464	5	0	88633
88465	5	0	88634
88948	7	3	89420
88949	7	0	89421
85553	11	0	85318
85554	11	0	85319
85555	11	3	85320
85556	11	0	85321
85557	11	0	85322
85558	11	0	85323
85559	11	0	85324
85560	11	3	85325
85561	11	0	85326
85562	11	0	85327
85563	11	0	85328
85564	11	0	85329
85565	11	0	85330
85566	11	3	85331
85567	11	0	85332
85568	11	0	85333
85569	11	0	85334
85570	11	3	85335
85571	11	0	85336
85572	11	0	85337
85573	11	0	85338
85574	11	0	85339
85575	11	0	85340
85576	11	0	85341
88425	5	3	88594
88426	5	0	88595
88427	5	1	88596
88428	5	1	88597
88429	5	1	88598
88430	5	1	88599
88431	5	1	88600
88432	5	3	88601
88433	5	0	88602
88434	5	0	88603
88435	5	0	88604
88436	5	0	88605
88437	5	3	88606
88438	5	0	88607
88439	5	0	88608
88882	5	0	88647
88883	5	0	88648
88884	5	0	88649
88885	5	0	88650
88886	5	3	88651
88887	5	0	88652
88888	5	0	88653
88889	5	0	88654
88890	5	0	88655
88891	5	0	88656
88892	5	3	88657
88893	5	0	88658
85226	11	0	85294
85227	11	0	85295
85228	11	3	85296
85229	11	0	85297
85230	11	0	85298
85231	11	0	85299
85232	11	0	85300
85233	11	0	85301
85234	11	3	85302
85235	11	0	85303
85236	11	0	85304
85237	11	3	85305
85238	11	0	85306
85239	11	0	85307
85240	11	0	85308
85241	11	0	85309
85242	11	3	85310
85243	11	0	85311
85547	11	0	85312
85548	11	0	85313
85549	11	0	85314
85550	11	3	85315
85551	11	0	85316
85552	11	3	85317
88894	5	0	88659
88895	5	0	88660
88896	5	3	88661
88897	5	0	88662
88898	5	0	88663
88899	5	0	88664
88900	5	0	88665
88901	5	0	88666
88902	5	0	88667
88440	5	0	88609
88441	5	0	88610
88442	5	0	88611
88443	5	3	88612
88444	5	0	88613
88445	5	0	88614
88446	5	0	88615
88466	5	0	88635
88467	5	3	88636
88468	5	0	88637
88469	5	0	88638
88470	5	0	88639
88471	5	0	88640
88472	5	3	88641
88473	5	0	88642
88474	5	3	88643
88475	5	0	88644
88880	5	0	88645
88881	5	3	88646
91012	3	3	90810
91013	3	0	90811
91014	3	3	90812
91015	3	3	90813
91016	3	0	90814
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
81764	1928
81765	1928
81766	1928
81767	1928
81780	1924
81781	1924
81782	1924
34250	1924
34251	1924
34252	1924
34253	1924
34254	1924
6580	1924
6581	1924
6582	1924
6583	1924
6646	1928
6647	1928
6648	1928
6649	1928
6650	1928
81748	1930
81749	1928
6565	1922
32459	1930
32460	1928
32461	1930
32462	1930
7679	1930
7680	1930
7691	1930
32463	1930
32464	1928
32465	1928
32466	1928
32467	1928
32468	1928
6589	1930
6651	1928
6652	1928
6653	1930
6654	1930
81750	1928
81751	1930
81752	1928
81753	1930
81754	1928
81755	1930
81756	1930
81757	1928
81758	1928
81759	1930
32469	1930
32470	1930
32471	1930
32472	1930
32473	1930
32474	1930
81760	1928
81761	1928
81762	1928
81763	1928
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario, startdate, durationstartinfirstday, enddate, durationinlastday) FROM stdin;
34351	1	34250	404	2011-01-18	0	2011-01-20	0
34352	1	34251	404	2011-01-20	0	2011-02-03	0
34353	1	34252	404	2011-02-03	0	2011-02-07	14400
34354	1	34253	404	2011-02-07	14400	2011-02-09	14400
34355	1	34254	404	2011-02-09	14400	2011-02-11	0
6681	16	6580	404	2010-11-15	0	2010-11-19	10800
6682	16	6581	404	2010-11-19	10800	2010-11-25	21600
6683	16	6582	404	2010-11-25	21600	2010-12-04	0
6684	16	6583	404	2010-12-04	0	2010-12-15	0
6747	6	6646	404	2010-11-15	0	2010-11-18	0
6748	6	6647	404	2010-11-18	0	2010-11-19	7200
6749	6	6648	404	2010-11-19	7200	2010-11-24	7200
6750	6	6649	404	2010-11-24	7200	2010-11-25	14400
6751	6	6650	404	2010-11-25	14400	2010-12-01	25200
81849	1	81748	404	2011-06-13	18000	2011-06-21	25200
81850	1	81749	404	2011-06-13	18000	2011-06-21	25200
6666	17	6565	404	2010-11-15	0	2011-01-19	0
32560	2	32459	404	2010-12-01	25200	2010-12-15	10800
32561	2	32460	404	2010-12-15	10800	2011-01-27	18000
32562	2	32461	404	2011-01-27	18000	2011-02-02	10800
32563	2	32462	404	2011-02-02	10800	2011-02-18	25200
7780	5	7679	404	2010-11-15	0	2010-11-17	14400
7781	5	7680	404	2010-11-17	14400	2010-11-23	7200
7792	3	7691	404	2010-11-30	7200	2010-12-07	18000
32564	2	32463	404	2010-12-22	3600	2010-12-24	18000
32565	2	32464	404	2010-12-24	18000	2010-12-29	18000
32566	2	32465	404	2010-12-29	18000	2010-12-31	18000
32567	2	32466	404	2010-12-31	18000	2011-01-05	7200
32568	2	32467	404	2011-01-05	7200	2011-01-12	7200
32569	2	32468	404	2011-01-12	7200	2011-01-19	7200
6690	15	6589	404	2010-11-15	0	2010-11-25	0
6752	6	6651	404	2010-11-15	0	2010-12-01	0
6753	6	6652	404	2010-11-15	0	2010-12-01	0
6754	6	6653	404	2010-11-15	0	2010-12-15	0
6755	6	6654	404	2010-11-15	0	2010-12-01	0
81851	1	81750	404	2011-05-18	14400	2011-05-25	14400
81852	1	81751	404	2011-05-18	14400	2011-05-25	14400
81853	1	81752	404	2011-05-25	14400	2011-05-26	21600
81854	1	81753	404	2011-05-25	14400	2011-05-26	21600
81855	1	81754	404	2011-05-26	21600	2011-06-04	0
81856	1	81755	404	2011-05-26	21600	2011-06-04	0
81857	1	81756	404	2011-06-04	0	2011-06-09	3600
81858	1	81757	404	2011-06-04	0	2011-06-09	3600
81859	1	81758	404	2011-06-09	3600	2011-06-13	18000
81860	1	81759	404	2011-06-09	3600	2011-06-13	18000
32570	2	32469	404	2011-02-17	7200	2011-03-04	14400
32571	2	32470	404	2011-03-04	14400	2011-03-25	14400
32572	2	32471	404	2011-03-25	14400	2011-04-15	14400
32573	2	32472	404	2011-04-15	14400	2011-05-06	0
32574	2	32473	404	2011-05-06	0	2011-05-20	14400
32575	2	32474	404	2011-05-20	14400	2011-06-01	14400
81861	1	81760	404	2011-02-18	25200	2011-02-25	25200
81862	1	81761	404	2011-02-25	25200	2011-03-08	25200
81863	1	81762	404	2011-03-08	25200	2011-03-25	10800
81864	1	81763	404	2011-03-25	10800	2011-04-07	21600
81865	1	81764	404	2011-04-07	21600	2011-04-27	0
81866	1	81765	404	2011-04-27	0	2011-04-29	14400
81867	1	81766	404	2011-04-29	14400	2011-05-09	21600
81868	1	81767	404	2011-05-09	21600	2011-05-18	14400
81871	0	81780	404	2010-11-25	14400	2010-12-08	0
81872	0	81781	404	2010-11-18	14400	2010-11-25	14400
81873	0	81782	404	2010-11-16	0	2010-11-18	14400
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
2556076	6	2222	2010-11-16 16:43:47.961	\N	Modelo de clases para asignación	\N	\N	t	t	t	t	0
2556077	6	2222	2010-11-16 16:47:52.357	\N	Traballo relacionado co módulo de representación - Recursos	\N	\N	\N	t	t	t	0
2556302	6	2222	2010-11-16 17:00:21.444	2010-11-16 17:03:12.145	Camino crítico	\N	\N	\N	\N	\N	\N	2
\.


--
-- Data for Name: sumchargedhours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY sumchargedhours (id, version, directchargedhours, indirectchargedhours) FROM stdin;
2461	57	0	0
3041	55	0	0
2462	57	0	0
2485	2	0	0
2486	2	0	0
2487	2	0	0
2488	2	0	0
2489	2	0	0
2490	2	0	0
2491	2	0	0
2492	2	0	0
2493	2	0	0
3653	2	0	0
3654	2	0	0
3655	2	0	0
3656	2	0	0
3657	2	0	0
3658	2	0	0
3659	2	0	0
3660	2	0	0
3661	2	0	0
3662	2	0	0
3663	2	0	0
3664	2	0	0
3665	2	0	0
3371	2	0	0
3372	2	0	0
3373	2	0	0
3374	2	0	0
3375	2	0	0
88811	4	0	0
88812	4	0	0
88813	4	0	0
88814	4	0	0
3705	2	0	0
3706	2	0	0
3707	2	0	0
3708	2	0	0
3709	2	0	0
3710	2	0	0
3711	2	0	0
3712	2	0	0
3713	2	0	0
3714	2	0	0
3715	2	0	0
3716	2	0	0
3717	2	0	0
3403	2	0	0
3404	2	0	0
3405	2	0	0
3406	2	0	0
3407	2	0	0
3408	2	0	0
3409	2	0	0
3410	2	0	0
3411	2	0	0
5045	2	0	0
5046	2	0	0
5047	2	0	0
5048	2	0	0
5006	2	0	0
5007	2	0	0
5008	2	0	0
3042	55	0	0
3043	55	0	0
3044	55	0	0
3045	55	0	0
3046	55	0	0
3047	55	0	0
33532	9	0	0
3048	55	0	0
3049	55	0	0
6220	2	0	0
5049	2	0	0
5151	2	0	0
3977	2	0	0
3978	2	0	0
3979	2	0	0
3980	2	0	0
3981	2	0	0
3982	2	0	0
3983	2	0	0
3984	2	0	0
3985	2	0	0
3986	2	0	0
3987	2	0	0
3988	2	0	0
3989	2	0	0
3990	2	0	0
3991	2	0	0
3992	2	0	0
3993	2	0	0
3994	2	0	0
5152	2	0	0
5153	2	0	0
6221	2	0	0
33564	8	0	0
3050	55	0	0
2464	57	0	0
2465	57	0	0
33533	9	0	0
33565	8	0	0
33566	8	0	0
33567	8	0	0
4791	2	0	0
33568	8	0	0
3063	54	0	0
3064	54	0	0
5477	2	0	0
5478	2	0	0
5479	2	0	0
5480	2	0	0
5481	2	0	0
5482	2	0	0
5483	2	0	0
5484	2	0	0
3065	54	0	0
2466	57	0	0
3066	54	0	0
3051	55	0	0
3995	2	0	0
4421	2	0	0
4422	2	0	0
4423	2	0	0
4424	2	0	0
4425	2	0	0
4426	2	0	0
4427	2	0	0
4428	2	0	0
4429	2	0	0
4430	2	0	0
4431	2	0	0
4432	2	0	0
4433	2	0	0
4434	2	0	0
4435	2	0	0
4056	2	0	0
4057	2	0	0
4058	2	0	0
4059	2	0	0
4060	2	0	0
4061	2	0	0
4062	2	0	0
4063	2	0	0
4064	2	0	0
4065	2	0	0
4066	2	0	0
4067	2	0	0
4068	2	0	0
4069	2	0	0
4070	2	0	0
4071	2	0	0
4072	2	0	0
4073	2	0	0
4074	2	0	0
4075	2	0	0
4436	2	0	0
4437	2	0	0
4438	2	0	0
4439	2	0	0
4440	2	0	0
4441	2	0	0
4136	2	0	0
4137	2	0	0
4138	2	0	0
4139	2	0	0
4140	2	0	0
4343	2	0	0
4344	2	0	0
4345	2	0	0
4346	2	0	0
4347	2	0	0
4348	2	0	0
4349	2	0	0
4350	2	0	0
4351	2	0	0
4352	2	0	0
4353	2	0	0
4354	2	0	0
4355	2	0	0
4356	2	0	0
4357	2	0	0
4792	2	0	0
4793	2	0	0
4794	2	0	0
4795	2	0	0
4796	2	0	0
4797	2	0	0
4798	2	0	0
4799	2	0	0
4800	2	0	0
4801	2	0	0
4802	2	0	0
4803	2	0	0
4804	2	0	0
4805	2	0	0
4806	2	0	0
4807	2	0	0
4808	2	0	0
4809	2	0	0
4606	2	0	0
4607	2	0	0
4608	2	0	0
4609	2	0	0
4610	2	0	0
4611	2	0	0
4612	2	0	0
4613	2	0	0
4614	2	0	0
4615	2	0	0
4616	2	0	0
4617	2	0	0
4618	2	0	0
4619	2	0	0
4620	2	0	0
4621	2	0	0
4622	2	0	0
4623	2	0	0
4624	2	0	0
4625	2	0	0
4626	2	0	0
4810	2	0	0
4811	2	0	0
5018	2	0	0
5019	2	0	0
5020	2	0	0
5485	2	0	0
5486	2	0	0
5487	2	0	0
5524	2	0	0
5525	2	0	0
5526	2	0	0
5527	2	0	0
5528	2	0	0
5187	2	0	0
5188	2	0	0
5189	2	0	0
5190	2	0	0
5191	2	0	0
5192	2	0	0
5193	2	0	0
5194	2	0	0
5195	2	0	0
5196	2	0	0
5197	2	0	0
5529	2	0	0
5530	2	0	0
5531	2	0	0
5532	2	0	0
5533	2	0	0
5534	2	0	0
5535	2	0	0
4976	43	0	0
6237	25	0	0
6238	25	0	0
6239	25	0	0
6240	25	0	0
33544	2	0	0
33545	2	0	0
6241	25	0	0
5829	2	0	0
5830	2	0	0
5831	2	0	0
5832	2	0	0
5833	2	0	0
5834	2	0	0
5835	2	0	0
5836	2	0	0
5837	2	0	0
5838	2	0	0
5839	2	0	0
5840	2	0	0
5841	2	0	0
33546	2	0	0
33547	2	0	0
33548	2	0	0
4977	43	0	0
4978	43	0	0
5777	2	0	0
5778	2	0	0
5779	2	0	0
5780	2	0	0
5781	2	0	0
5782	2	0	0
5783	2	0	0
5784	2	0	0
5785	2	0	0
5786	2	0	0
5787	2	0	0
5788	2	0	0
5789	2	0	0
4979	43	0	0
4980	43	0	0
4981	43	0	0
4982	43	0	0
4983	43	0	0
4984	43	0	0
4985	43	0	0
6001	2	0	0
6002	2	0	0
5231	2	0	0
5232	2	0	0
5233	2	0	0
5234	2	0	0
5235	2	0	0
5236	2	0	0
5237	2	0	0
5238	2	0	0
5239	2	0	0
5240	2	0	0
5241	2	0	0
4986	43	0	0
4987	43	0	0
4988	43	0	0
4989	43	0	0
4990	43	0	0
4991	43	0	0
4992	43	0	0
4993	43	0	0
4994	43	0	0
4995	43	0	0
6039	27	0	0
6040	27	0	0
5982	31	0	0
5983	31	0	0
5984	31	0	0
3052	55	0	0
5985	31	0	0
5986	31	0	0
3053	55	0	0
88840	7	0	0
5987	31	0	0
88847	7	0	0
5988	31	0	0
88848	7	0	0
88849	7	0	0
88850	7	0	0
88851	7	0	0
88841	7	0	0
88842	7	0	0
88843	7	0	0
88844	7	0	0
88845	7	0	0
88846	7	0	0
5989	31	0	0
5990	31	0	0
5991	31	0	0
5992	31	0	0
5993	31	0	0
5994	31	0	0
6041	27	0	0
6042	27	0	0
6043	27	0	0
6044	27	0	0
6045	27	0	0
6046	27	0	0
6047	27	0	0
6048	27	0	0
6049	27	0	0
6050	27	0	0
3054	55	0	0
4996	43	0	0
88324	5	0	0
88325	5	0	0
88326	5	0	0
88327	5	0	0
88328	5	0	0
88329	5	0	0
88330	5	0	0
88331	5	0	0
88332	5	0	0
88333	5	0	0
88334	5	0	0
88335	5	0	0
88336	5	0	0
88337	5	0	0
88338	5	0	0
88339	5	0	0
88340	5	0	0
88341	5	0	0
88342	5	0	0
88343	5	0	0
88344	5	0	0
88345	5	0	0
88346	5	0	0
88347	5	0	0
88348	5	0	0
88349	5	0	0
88350	5	0	0
88351	5	0	0
88352	5	0	0
88353	5	0	0
85099	11	0	0
85100	11	0	0
85101	11	0	0
85102	11	0	0
85103	11	0	0
85104	11	0	0
85105	11	0	0
85106	11	0	0
85107	11	0	0
85108	11	0	0
85109	11	0	0
85110	11	0	0
85111	11	0	0
85112	11	0	0
85113	11	0	0
85114	11	0	0
85115	11	0	0
85116	11	0	0
85117	11	0	0
85118	11	0	0
85119	11	0	0
85120	11	0	0
85121	11	0	0
85122	11	0	0
85123	11	0	0
85124	11	0	0
85125	11	0	0
85126	11	0	0
85127	11	0	0
85128	11	0	0
85129	11	0	0
85130	11	0	0
85131	11	0	0
85132	11	0	0
85133	11	0	0
85134	11	0	0
85135	11	0	0
85136	11	0	0
85137	11	0	0
85138	11	0	0
85139	11	0	0
85140	11	0	0
85141	11	0	0
85142	11	0	0
85446	11	0	0
85447	11	0	0
85448	11	0	0
85449	11	0	0
85450	11	0	0
85451	11	0	0
85452	11	0	0
85453	11	0	0
85454	11	0	0
85455	11	0	0
85456	11	0	0
85457	11	0	0
85458	11	0	0
85459	11	0	0
85460	11	0	0
85461	11	0	0
85462	11	0	0
85463	11	0	0
85464	11	0	0
85465	11	0	0
85466	11	0	0
85467	11	0	0
85468	11	0	0
85469	11	0	0
85470	11	0	0
85471	11	0	0
85472	11	0	0
85473	11	0	0
85474	11	0	0
85475	11	0	0
88354	5	0	0
88355	5	0	0
88356	5	0	0
88357	5	0	0
88358	5	0	0
88359	5	0	0
88360	5	0	0
88361	5	0	0
88362	5	0	0
88363	5	0	0
88364	5	0	0
88365	5	0	0
88366	5	0	0
88367	5	0	0
88368	5	0	0
88369	5	0	0
88370	5	0	0
88371	5	0	0
88372	5	0	0
88373	5	0	0
88374	5	0	0
88779	5	0	0
88780	5	0	0
88781	5	0	0
88782	5	0	0
88783	5	0	0
88784	5	0	0
88785	5	0	0
88786	5	0	0
88787	5	0	0
88788	5	0	0
88789	5	0	0
88790	5	0	0
88791	5	0	0
88792	5	0	0
88793	5	0	0
88794	5	0	0
88795	5	0	0
88796	5	0	0
88797	5	0	0
88798	5	0	0
88799	5	0	0
88800	5	0	0
88801	5	0	0
90911	3	0	0
90912	3	0	0
90913	3	0	0
90914	3	0	0
90915	3	0	0
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, workable_days, subcontrated_task_data_id, priority) FROM stdin;
6449	1	0	\N	\N	\N	\N
6450	1	0	\N	\N	\N	\N
6451	1	0	\N	\N	\N	\N
6438	1	1	2011-01-18	\N	\N	\N
6439	1	1	2011-01-18	\N	\N	\N
6452	1	0	\N	\N	\N	\N
6453	1	0	\N	\N	\N	\N
6455	1	0	\N	\N	\N	\N
6440	1	1	2011-01-18	\N	\N	\N
6441	1	1	2011-01-18	\N	\N	\N
6456	1	0	\N	\N	\N	\N
6457	1	0	\N	\N	\N	\N
6458	1	0	\N	\N	\N	\N
6459	1	0	\N	\N	\N	\N
6461	1	0	\N	\N	\N	\N
6462	1	0	\N	\N	\N	\N
6463	1	0	\N	\N	\N	\N
85749	1	0	\N	\N	\N	\N
85750	1	0	\N	\N	\N	\N
85752	1	0	\N	\N	\N	\N
6437	1	1	2011-01-18	\N	\N	\N
6444	1	1	2011-01-18	\N	\N	\N
6445	1	1	2011-01-18	\N	\N	\N
6446	1	1	2011-01-18	\N	\N	\N
6447	1	1	2011-01-18	\N	\N	\N
6416	1	0	\N	\N	\N	\N
6417	1	0	\N	\N	\N	\N
6418	1	0	\N	\N	\N	\N
6420	1	0	\N	\N	\N	\N
6421	1	0	\N	\N	\N	\N
6422	1	0	\N	\N	\N	\N
6425	1	0	\N	\N	\N	\N
6426	1	0	\N	\N	\N	\N
6427	1	0	\N	\N	\N	\N
6428	1	0	\N	\N	\N	\N
6429	1	0	\N	\N	\N	\N
6431	1	0	\N	\N	\N	\N
85753	1	0	\N	\N	\N	\N
85755	1	0	\N	\N	\N	\N
85756	1	0	\N	\N	\N	\N
85757	1	0	\N	\N	\N	\N
85758	1	0	\N	\N	\N	\N
85759	1	0	\N	\N	\N	\N
85761	1	0	\N	\N	\N	\N
85762	1	0	\N	\N	\N	\N
85764	1	0	\N	\N	\N	\N
85765	1	0	\N	\N	\N	\N
85766	1	0	\N	\N	\N	\N
85767	1	0	\N	\N	\N	\N
85770	1	0	\N	\N	\N	\N
85771	1	0	\N	\N	\N	\N
85772	1	0	\N	\N	\N	\N
85773	1	0	\N	\N	\N	\N
85775	1	0	\N	\N	\N	\N
85776	1	0	\N	\N	\N	\N
85777	1	0	\N	\N	\N	\N
6363	1	0	\N	\N	\N	\N
6364	1	0	\N	\N	\N	\N
6365	1	0	\N	\N	\N	\N
6366	1	0	\N	\N	\N	\N
6367	2	0	\N	5	\N	\N
6369	1	1	2010-11-14	\N	\N	\N
6370	1	0	\N	\N	\N	\N
6371	1	0	\N	\N	\N	\N
6372	1	0	\N	\N	\N	\N
6373	1	0	\N	\N	\N	\N
6375	1	0	\N	\N	\N	\N
6376	1	0	\N	\N	\N	\N
6377	1	0	\N	\N	\N	\N
6378	1	0	\N	\N	\N	\N
6379	1	0	\N	\N	\N	\N
6381	1	0	\N	\N	\N	\N
6382	1	0	\N	\N	\N	\N
6384	1	2	2010-11-23	\N	2556076	\N
6385	1	2	2010-11-25	\N	2556077	\N
6386	1	0	\N	\N	\N	\N
6387	1	0	\N	\N	\N	\N
6388	1	0	\N	\N	\N	\N
6392	1	0	\N	\N	\N	\N
6393	1	0	\N	\N	\N	\N
6395	1	0	\N	\N	\N	\N
6396	1	0	\N	\N	\N	\N
6397	1	0	\N	\N	\N	\N
6398	1	0	\N	\N	\N	\N
6400	1	0	\N	\N	\N	\N
85779	1	0	\N	\N	\N	\N
85780	1	0	\N	\N	\N	\N
85781	1	0	\N	\N	\N	\N
85782	1	0	\N	\N	\N	\N
85784	1	0	\N	\N	\N	\N
85785	1	0	\N	\N	\N	\N
85786	1	0	\N	\N	\N	\N
85787	1	0	\N	\N	\N	\N
85788	1	0	\N	\N	\N	\N
85790	1	0	\N	\N	\N	\N
85791	1	0	\N	\N	\N	\N
85792	1	0	\N	\N	\N	\N
85795	1	0	\N	\N	\N	\N
85796	1	0	\N	\N	\N	\N
85797	1	0	\N	\N	\N	\N
85798	1	0	\N	\N	\N	\N
85799	1	0	\N	\N	\N	\N
85801	1	0	\N	\N	\N	\N
6401	1	0	\N	\N	\N	\N
6402	1	0	\N	\N	\N	\N
6403	1	0	\N	\N	\N	\N
6405	1	2	2011-01-18	\N	2556302	\N
6406	1	0	\N	\N	\N	\N
6407	1	0	\N	\N	\N	\N
6409	1	0	\N	\N	\N	\N
6410	1	0	\N	\N	\N	\N
6411	1	0	\N	\N	\N	\N
6412	1	0	\N	\N	\N	\N
6414	1	0	\N	\N	\N	\N
6415	1	0	\N	\N	\N	\N
85844	1	0	\N	\N	\N	\N
85845	1	0	\N	\N	\N	\N
85846	1	0	\N	\N	\N	\N
85848	1	0	\N	\N	\N	\N
89104	1	0	\N	\N	\N	\N
89105	1	0	\N	\N	\N	\N
89106	1	0	\N	\N	\N	\N
85803	1	0	\N	\N	\N	\N
85804	1	0	\N	\N	\N	\N
85805	1	0	\N	\N	\N	\N
85806	1	0	\N	\N	\N	\N
85807	1	0	\N	\N	\N	\N
85809	1	0	\N	\N	\N	\N
85810	1	0	\N	\N	\N	\N
85811	1	0	\N	\N	\N	\N
85812	1	0	\N	\N	\N	\N
85813	1	0	\N	\N	\N	\N
85815	1	0	\N	\N	\N	\N
85816	1	0	\N	\N	\N	\N
85817	1	0	\N	\N	\N	\N
85818	1	0	\N	\N	\N	\N
85819	1	0	\N	\N	\N	\N
85821	1	0	\N	\N	\N	\N
85822	1	0	\N	\N	\N	\N
85824	1	0	\N	\N	\N	\N
85825	1	0	\N	\N	\N	\N
85826	1	0	\N	\N	\N	\N
85827	1	0	\N	\N	\N	\N
85828	1	0	\N	\N	\N	\N
85830	1	0	\N	\N	\N	\N
85831	1	0	\N	\N	\N	\N
85833	1	0	\N	\N	\N	\N
85834	1	0	\N	\N	\N	\N
85835	1	0	\N	\N	\N	\N
85836	1	0	\N	\N	\N	\N
85839	1	0	\N	\N	\N	\N
85840	1	0	\N	\N	\N	\N
85841	1	0	\N	\N	\N	\N
85842	1	0	\N	\N	\N	\N
85849	1	0	\N	\N	\N	\N
89082	1	0	\N	\N	\N	\N
89083	1	0	\N	\N	\N	\N
89085	1	0	\N	\N	\N	\N
89086	1	0	\N	\N	\N	\N
89087	1	0	\N	\N	\N	\N
89088	1	0	\N	\N	\N	\N
89089	1	0	\N	\N	\N	\N
89091	1	0	\N	\N	\N	\N
89092	1	0	\N	\N	\N	\N
89093	1	0	\N	\N	\N	\N
89096	1	0	\N	\N	\N	\N
89097	1	0	\N	\N	\N	\N
89098	1	0	\N	\N	\N	\N
89099	1	0	\N	\N	\N	\N
89100	1	0	\N	\N	\N	\N
89102	1	0	\N	\N	\N	\N
89108	1	0	\N	\N	\N	\N
89109	1	0	\N	\N	\N	\N
89110	1	0	\N	\N	\N	\N
89111	1	0	\N	\N	\N	\N
89112	1	0	\N	\N	\N	\N
91406	1	0	\N	\N	\N	\N
91405	1	0	\N	\N	\N	\N
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
6449	84793
6449	84794
6449	84791
6449	84795
6449	84792
6450	84796
6451	84797
6452	84798
6453	84799
6455	84800
6456	84801
6457	84802
6458	84803
6459	84804
6461	84805
6462	84806
6463	84807
85749	84808
85750	84809
85752	84810
85753	84811
85755	84812
85756	84813
85757	84814
85758	84815
85759	84816
85761	84817
6438	5148
6439	5149
6440	5150
6441	33835
85762	84818
85764	84819
85765	84820
85766	84821
85767	84822
85770	84823
85771	84824
85772	84825
85773	84826
85775	84827
6437	5139
6444	5148
6445	5149
6446	5150
6447	33835
6363	2771
6363	2751
6363	2772
6363	2774
6363	2773
6364	2791
6365	2792
6366	2793
6367	2794
6369	2753
6370	2803
6371	2804
6372	2805
6373	3275
6375	2754
6376	3276
6377	2806
6378	3277
6379	3318
6381	2775
6382	3297
6384	3288
6385	3298
6386	3311
6387	3312
6388	3322
6392	3289
6393	3313
6395	3290
6396	3314
6397	5082
6398	5083
6400	3329
6401	3330
6402	2777
6403	5057
6405	2776
6406	5058
6407	5059
6409	5066
6410	5067
6411	5071
6412	5075
6414	5108
6415	5109
6416	5110
6417	5111
6418	5112
6420	5113
6421	5114
6422	5115
6425	2778
6426	5126
6427	5136
6428	5137
6429	5138
6431	3278
85776	84828
85777	84829
85779	84830
85780	84831
85781	84832
85782	84833
85784	84834
85785	84835
85786	84836
85787	84837
85788	84838
85790	84839
85791	85648
85792	85649
85795	85650
85803	88252
85803	88255
85803	88253
85803	88251
85803	88254
85804	88256
85805	88257
85806	88258
85807	88259
85809	88260
85810	88261
85811	88262
85812	88263
85813	88264
85815	88265
85816	88266
85817	88267
85818	88268
85819	88269
85821	88270
85822	88271
85824	88272
85825	88273
85826	88678
85827	88679
85828	88680
85830	88681
85831	88682
85833	88683
85834	88684
85835	88685
85836	88686
85839	88687
85840	88688
85841	88689
85842	88690
85844	88691
85845	88692
85846	88693
85848	88694
85849	88695
89082	88696
89083	88697
89085	88698
89086	88699
89087	88700
89088	88701
89089	88702
89091	88703
89092	88704
89093	88705
89096	88706
89097	88707
89098	88708
89099	88709
89100	88710
89102	88711
89104	88718
89105	88719
89106	88720
89108	88740
89108	88743
89108	88742
89108	88741
89108	88739
89109	88744
89110	88745
89111	88746
89112	88747
85796	85651
85797	85652
85798	85653
85799	85654
85801	85655
91405	91207
91406	91208
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, startdayduration, enddate, enddayduration, deadline, advance_percentage, sumofhoursallocated, parent, base_calendar_id, positioninparent) FROM stdin;
6364	21	Análisis del módulo de arquitectura	\N	2010-11-15	0	2010-11-19	10800	\N	0.0000	35	6368	\N	0
6369	21	Pruebas del módulo de arquitectura	\N	2010-11-15	0	2010-11-25	0	\N	0.0000	16	6374	\N	0
6370	21	Pruebas del módulo de representación de la información	\N	2010-11-15	0	2010-12-01	0	\N	0.0000	24	6374	\N	1
6396	20	Modelo de función de asignación por tramos	\N	2010-12-31	18000	2011-01-05	7200	\N	0.0000	21	6399	\N	1
6397	20	Modelo de funciones S	\N	2011-01-05	7200	2011-01-12	7200	\N	0.0000	40	6399	\N	2
6438	3	Desarrollar algotirmo camino crítico	\N	2011-01-20	0	2011-01-30	0	\N	0.0000	0	6442	\N	1
6439	3	Probar desarrollos realizados	\N	2011-01-30	0	2011-02-01	14400	\N	0.0000	0	6442	\N	2
6440	3	Integrar desarrollo	\N	2011-02-01	14400	2011-02-03	14400	\N	0.0000	0	6442	\N	3
6441	3	Desplegar	\N	2011-02-03	14400	2011-02-04	28800	\N	0.0000	0	6442	\N	4
6398	20	Modelo de asignación siguiendo las cadena crítica	\N	2011-01-12	7200	2011-01-19	7200	\N	0.0000	40	6399	\N	3
85750	11	Diseño de soporte de fases	\N	2011-03-01	0	2011-03-05	10800	\N	0.0000	0	85751	\N	4
85753	12	Modelo de clases para tipos de restricciones	\N	2011-03-06	10800	2011-03-09	32400	\N	0.0000	0	85754	\N	1
85804	4	Análisis del módulo de arquitectura	\N	2011-09-01	0	2011-09-05	10800	\N	0.0000	0	85808	\N	0
85755	12	Modelo de clases para representar asignaciones de recursos	\N	2011-03-06	10800	2011-03-07	36000	\N	0.0000	0	85760	\N	0
85805	4	Análisis del módulo de representación de la información	\N	2011-09-01	0	2011-09-05	10800	\N	0.0000	0	85808	\N	1
85790	12	Curvas S	\N	2011-03-11	10800	2011-03-13	25200	\N	0.0000	0	85793	\N	0
85792	12	Algoritmia de nivelación de asignación de recursos	\N	2011-03-11	10800	2011-03-17	32400	\N	0.0000	0	85793	\N	2
85806	4	Análisis del módulo de planificación	\N	2011-09-01	0	2011-09-07	7200	\N	0.0000	0	85808	\N	2
85754	16	Módulo de redes de tareas	\N	2011-03-06	10800	2011-03-09	0	\N	0.0000	0	85769	\N	0
85789	16	Algoritmos de asignación de recursos	\N	2011-03-11	10800	2011-03-23	0	\N	0.0000	0	85794	\N	3
85802	16	2º proyecto de desarrollo de aplicación de gestión de proyectos 	\N	2011-03-01	0	2011-05-05	0	2011-07-01	0.0000	440	\N	\N	\N
85807	4	Análisis del módulo de interface	\N	2011-09-01	0	2011-09-05	10800	\N	0.0000	0	85808	\N	3
85809	4	Pruebas del módulo de arquitectura	\N	2011-09-01	0	2011-09-03	0	\N	0.0000	0	85814	\N	0
85810	4	Pruebas del módulo de representación de la información	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85814	\N	1
85811	4	Pruebas del módulo de interface	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85814	\N	2
6406	20	Modo de análisis cara atrás	\N	2011-02-17	7200	2011-03-04	14400	\N	0.0000	90	6408	\N	0
6442	3	Algoritmia de cálculo do camino crítico	\N	2011-01-18	0	2011-02-04	28800	2011-02-16	0.0000	0	\N	\N	\N
6407	20	Modo de análisis cara adiante	\N	2011-03-04	14400	2011-03-25	14400	\N	0.0000	120	6408	\N	1
85812	4	Pruebas del módulo de planificación	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	85814	\N	3
6409	20	Método de Montecarlo para simulaciones	\N	2011-03-25	14400	2011-04-15	14400	\N	0.0000	120	6413	\N	0
6410	20	Servicio de cómputo de la cadena crítica	\N	2011-04-15	14400	2011-05-06	0	\N	0.0000	100	6413	\N	1
6411	20	Reasignación siguiendo indicaciones de la cadena crítica	\N	2011-05-06	0	2011-05-20	14400	\N	0.0000	84	6413	\N	2
6412	20	Evaluación de proyecto siguiendo cadena crítica	\N	2011-05-20	14400	2011-06-01	14400	\N	0.0000	64	6413	\N	3
85835	4	Modelo de funciones S	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	85837	\N	2
6414	20	Servicio de configuración de función de asignación de recursos	\N	2011-02-18	25200	2011-02-25	25200	\N	0.0000	40	6419	\N	0
6415	20	Infraestructura para composición y colaboración de diferentes estrategias	\N	2011-02-25	25200	2011-03-08	25200	\N	0.0000	56	6419	\N	1
6416	20	Algoritmo de asignación de recursos	\N	2011-03-08	25200	2011-03-25	10800	\N	0.0000	100	6419	\N	2
6417	20	Algoritmo de asignación de recursos limitantes	\N	2011-03-25	10800	2011-04-07	21600	\N	0.0000	75	6419	\N	3
6418	20	Algoritmo de asignación dando prioridad a deadlines	\N	2011-04-07	21600	2011-04-27	0	\N	0.0000	90	6419	\N	4
85836	4	Modelo de asignación siguiendo las cadena crítica	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	85837	\N	3
85839	4	Interface para soporte de recursos con máximo de capacidad	\N	2011-09-01	0	2011-09-08	14400	\N	0.0000	0	85843	\N	0
6435	15	Hito 1º	\N	2010-12-01	25200	2010-12-01	25200	\N	0.0000	0	6391	\N	4
6436	15	Hito 2º	\N	2011-01-19	7200	2011-01-19	7200	\N	0.0000	0	6391	\N	6
6405	22	Algoritmia de cálculo do camino crítico	\N	2011-01-19	7200	2011-01-31	21600	\N	0.2500	0	6424	\N	0
6408	21	Infraestructura de análisis de redes tarefas en 2 modos	\N	2011-02-17	7200	2011-03-25	14400	\N	0.0000	210	6424	\N	1
6413	21	Algoritmia de la gestión de la cadena crítica	\N	2011-03-25	14400	2011-06-01	14400	\N	0.0000	368	6424	\N	2
6419	21	Algoritmos de asignación de recursos	\N	2011-02-18	25200	2011-04-27	0	\N	0.0000	361	6424	\N	3
6437	8	Plantear algoritmo	\N	2011-01-18	0	2011-01-20	0	2011-02-16	0.2500	16	6448	\N	0
6443	9	Camino crítico	\N	2011-01-18	0	2011-02-11	0	2011-02-16	0.2499	144	\N	\N	\N
6363	21	Coordinación 	\N	2010-11-15	0	2011-01-19	0	\N	0.0000	360	6391	\N	0
6365	21	Análisis del módulo de representación de la información	\N	2010-11-19	10800	2010-11-25	21600	\N	0.0000	35	6368	\N	1
6366	21	Análisis del módulo de planificación	\N	2010-11-25	21600	2010-12-04	0	\N	0.0000	50	6368	\N	2
6367	21	Análisis del módulo de interface	\N	2010-12-04	0	2010-12-15	0	\N	0.0000	40	6368	\N	3
85840	4	Interface gráfica para interactuación con método de cadena crítica	\N	2011-09-01	0	2011-10-02	7200	\N	0.0000	0	85843	\N	1
85773	11	Interfaz para solicitude/recepción de nivelación de planificación	\N	2011-03-01	0	2011-03-13	14400	\N	0.0000	0	85774	\N	3
85841	4	Modificación da asignación de recursos	\N	2011-09-01	0	2011-09-04	21600	\N	0.0000	0	85843	\N	2
85842	4	Interfaz para solicitude/recepción de nivelación de planificación	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	85843	\N	3
6371	21	Pruebas del módulo de interface	\N	2010-11-15	0	2010-12-01	0	\N	0.0000	24	6374	\N	2
6372	21	Pruebas del módulo de planificación	\N	2010-11-15	0	2010-12-15	0	\N	0.0000	40	6374	\N	3
6373	21	Pruebas del módulo de entradas/salidas	\N	2010-11-15	0	2010-12-01	0	\N	0.0000	24	6374	\N	4
6375	21	Diseño de paquetes y estructura interna librería	\N	2010-11-15	0	2010-11-18	0	\N	0.0000	24	6380	\N	0
6376	21	Diseño API y fachadas	\N	2010-11-18	0	2010-11-19	7200	\N	0.0000	10	6380	\N	1
6377	21	Definición de la documentación	\N	2010-11-19	7200	2010-11-24	7200	\N	0.0000	24	6380	\N	2
6378	21	Diseño de conversaciones con librería	\N	2010-11-24	7200	2010-11-25	14400	\N	0.0000	10	6380	\N	3
6379	21	Diseño de soporte de fases	\N	2010-11-25	14400	2010-12-01	25200	\N	0.0000	35	6380	\N	4
6381	21	Modelo de clases para tipos de dependencias	\N	2010-11-15	0	2010-11-17	14400	\N	0.0000	20	6383	\N	0
6382	21	Modelo de clases para tipos de restricciones	\N	2010-11-17	14400	2010-11-23	7200	\N	0.0000	30	6383	\N	1
85844	4	Algoritmia de cálculo do camino crítico	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	89095	\N	0
85795	11	API de carga	\N	2011-03-27	10800	2011-04-06	10800	\N	0.0000	0	85800	\N	0
6386	21	Modelo de capacidad variable hasta un máximo	\N	2010-11-30	7200	2010-12-07	18000	\N	0.0000	35	6389	\N	2
85796	11	API de comunicación vía XML	\N	2011-03-27	10800	2011-03-29	25200	\N	0.0000	0	85800	\N	1
85797	11	API de preprocesamiento y análisis de datos	\N	2011-03-27	10800	2011-04-08	25200	\N	0.0000	0	85800	\N	2
85845	4	Modo de análisis cara atrás	\N	2011-09-01	0	2011-09-12	7200	\N	0.0000	0	85847	\N	0
6444	5	Desarrollar algotirmo camino crítico	\N	2011-01-20	0	2011-02-03	0	\N	0.4000	80	6448	\N	1
6445	4	Probar desarrollos realizados	\N	2011-02-03	0	2011-02-07	14400	\N	0.0000	20	6448	\N	2
6446	4	Integrar desarrollo	\N	2011-02-07	14400	2011-02-09	14400	\N	0.0000	16	6448	\N	3
6447	4	Desplegar	\N	2011-02-09	14400	2011-02-11	0	\N	0.0000	12	6448	\N	4
85798	12	API de configuración de elaboración de proceso de planificación	\N	2011-03-27	10800	2011-04-02	18000	\N	0.0000	0	85800	\N	3
85799	10	API de ejecución del proceso	\N	2011-03-27	10800	2011-04-01	10800	\N	0.0000	0	85800	\N	4
85846	4	Modo de análisis cara adiante	\N	2011-09-01	0	2011-09-16	0	\N	0.0000	0	85847	\N	1
6454	16	Análisis	\N	2011-03-01	0	2011-03-27	18000	\N	0.0000	80	85802	\N	1
85778	16	Infraestructura de análisis de redes tarefas en 2 modos	\N	2011-03-11	10800	2011-03-26	0	\N	0.0000	0	85794	\N	1
6384	22	Modelo de clases para representar asignaciones de recursos	\N	2010-11-23	7200	2010-11-24	32400	\N	0.0000	0	6389	\N	0
6385	22	Modelo de recursos con capacidad variable	\N	2010-11-25	7200	2010-11-27	21600	\N	0.0000	0	6389	\N	1
6387	22	Modelo de recursos con cumplimiento de criterio	\N	2010-12-07	18000	2010-12-08	43200	\N	0.0000	0	6389	\N	3
6388	22	Modelo de clases de recursos limitantes	\N	2010-12-14	28800	2010-12-16	28800	\N	0.0000	0	6389	\N	4
85793	16	Operaciones de nivelación de recursos sobre planificación	\N	2011-03-11	10800	2011-03-17	0	\N	0.0000	0	85794	\N	4
6448	6	Algoritmia de cálculo do camino crítico	\N	2011-01-18	0	2011-02-11	0	2011-02-16	0.2499	144	6443	\N	0
6424	22	Módulo de planificación	\N	2011-01-19	7200	2011-06-01	14400	\N	0.0200	1063	6391	\N	8
6391	24	Desarrollo de aplicación de gestión de proyectos	\N	2010-11-15	0	2011-06-21	0	2011-03-25	0.0100	2890	\N	\N	\N
85794	16	Módulo de planificación	\N	2011-03-11	10800	2011-03-26	0	\N	0.0000	0	85802	\N	6
85800	16	Módulo de entradas/salidas	\N	2011-03-27	10800	2011-04-08	0	\N	0.0000	0	85802	\N	7
85848	4	Método de Montecarlo para simulaciones	\N	2011-09-01	0	2011-09-16	0	\N	0.0000	0	89084	\N	0
85849	4	Servicio de cómputo de la cadena crítica	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	89084	\N	1
89082	4	Reasignación siguiendo indicaciones de la cadena crítica	\N	2011-09-01	0	2011-09-11	14400	\N	0.0000	0	89084	\N	2
89083	4	Evaluación de proyecto siguiendo cadena crítica	\N	2011-09-01	0	2011-09-09	0	\N	0.0000	0	89084	\N	3
89085	4	Servicio de configuración de función de asignación de recursos	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	89090	\N	0
89086	4	Infraestructura para composición y colaboración de diferentes estrategias	\N	2011-09-01	0	2011-09-08	0	\N	0.0000	0	89090	\N	1
89087	4	Algoritmo de asignación de recursos	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	89090	\N	2
89088	4	Algoritmo de asignación de recursos limitantes	\N	2011-09-01	0	2011-09-10	10800	\N	0.0000	0	89090	\N	3
89089	4	Algoritmo de asignación dando prioridad a deadlines	\N	2011-09-01	0	2011-09-12	7200	\N	0.0000	0	89090	\N	4
89091	4	Curvas S	\N	2011-09-01	0	2011-09-03	14400	\N	0.0000	0	89094	\N	0
89092	4	Configuración de planificación a nivelar	\N	2011-09-01	0	2011-09-07	7200	\N	0.0000	0	89094	\N	1
89093	4	Algoritmia de nivelación de asignación de recursos	\N	2011-09-01	0	2011-09-07	21600	\N	0.0000	0	89094	\N	2
89096	4	API de carga	\N	2011-09-01	0	2011-09-11	0	\N	0.0000	0	89101	\N	0
89097	4	API de comunicación vía XML	\N	2011-09-01	0	2011-09-03	14400	\N	0.0000	0	89101	\N	1
85784	10	Servicio de configuración de función de asignación de recursos	\N	2011-03-11	10800	2011-03-16	10800	\N	0.0000	0	85789	\N	0
89098	4	API de preprocesamiento y análisis de datos	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	89101	\N	2
85785	10	Infraestructura para composición y colaboración de diferentes estrategias	\N	2011-03-11	10800	2011-03-18	10800	\N	0.0000	0	85789	\N	1
89100	4	API de ejecución del proceso	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	89101	\N	4
6420	20	Curvas S	\N	2011-04-27	0	2011-04-29	14400	\N	0.0000	20	6423	\N	0
6421	20	Configuración de planificación a nivelar	\N	2011-04-29	14400	2011-05-09	21600	\N	0.0000	50	6423	\N	1
6422	20	Algoritmia de nivelación de asignación de recursos	\N	2011-05-09	21600	2011-05-18	14400	\N	0.0000	54	6423	\N	2
6368	23	Análisis	\N	2010-11-15	0	2010-12-15	0	\N	0.0000	160	6391	\N	1
6374	23	Pruebas unitarias	\N	2010-11-15	0	2010-12-15	0	\N	0.0000	128	6391	\N	2
85801	11	Gestión del entorno	\N	2011-03-01	0	2011-03-13	14400	\N	0.0000	0	85802	\N	8
6460	16	Pruebas unitarias	\N	2011-03-01	0	2011-03-06	0	\N	0.0000	0	85802	\N	2
85751	16	Módulo de arquitectura	\N	2011-03-01	0	2011-03-05	0	\N	0.0000	0	85802	\N	3
85760	16	Módulo de recursos	\N	2011-03-06	10800	2011-03-10	0	\N	0.0000	0	85769	\N	1
6380	23	Módulo de arquitectura	\N	2010-11-15	0	2010-12-01	25200	\N	0.0000	103	6391	\N	3
6383	23	Módulo de redes de tareas	\N	2010-11-15	0	2010-11-23	7200	\N	0.0000	50	6390	\N	0
6389	23	Módulo de recursos	\N	2010-11-23	7200	2010-12-22	3600	\N	0.0000	35	6390	\N	1
6390	23	Módulo de representación de la información	\N	2010-11-15	0	2011-01-19	7200	\N	0.0000	246	6391	\N	5
6423	21	Operaciones de nivelación de recursos sobre planificación	\N	2011-04-27	0	2011-05-18	14400	\N	0.0000	124	6424	\N	4
85757	10	Modelo de capacidad variable hasta un máximo	\N	2011-03-06	10800	2011-03-10	21600	\N	0.0000	0	85760	\N	2
85762	10	Módulo de clases para calendario	\N	2011-03-06	10800	2011-03-09	10800	\N	0.0000	0	85763	\N	1
85771	10	Interface gráfica para interactuación con método de cadena crítica	\N	2011-03-01	0	2011-04-01	7200	\N	0.0000	0	85774	\N	1
85772	10	Modificación da asignación de recursos	\N	2011-03-01	0	2011-03-04	21600	\N	0.0000	0	85774	\N	2
85777	11	Modo de análisis cara adiante	\N	2011-03-11	10800	2011-03-26	10800	\N	0.0000	0	85778	\N	1
85779	11	Método de Montecarlo para simulaciones	\N	2011-03-11	10800	2011-03-26	10800	\N	0.0000	0	85783	\N	0
85782	11	Evaluación de proyecto siguiendo cadena crítica	\N	2011-03-11	10800	2011-03-19	10800	\N	0.0000	0	85783	\N	3
6392	20	Modelos de calendarios asignados a recursos	\N	2010-12-22	3600	2010-12-24	18000	\N	0.0000	20	6394	\N	0
6393	20	Módulo de clases para calendario	\N	2010-12-24	18000	2010-12-29	18000	\N	0.0000	24	6394	\N	1
6450	10	Análisis del módulo de arquitectura	\N	2011-03-01	0	2011-03-08	0	\N	0.0000	40	6454	\N	0
6395	20	Modelo de asignación plana	\N	2010-12-29	18000	2010-12-31	18000	\N	0.0000	16	6399	\N	0
6451	10	Análisis del módulo de representación de la información	\N	2011-03-08	0	2011-03-15	0	\N	0.0000	40	6454	\N	1
6400	20	Interface para soporte de recursos con máximo de capacidad	\N	2010-12-01	25200	2010-12-15	10800	\N	0.0000	60	6404	\N	0
6401	20	Interface gráfica para interactuación con método de cadena crítica	\N	2010-12-15	10800	2011-01-27	18000	\N	0.0000	250	6404	\N	1
6402	20	Modificación da asignación de recursos	\N	2011-01-27	18000	2011-02-02	10800	\N	0.0000	30	6404	\N	2
6403	20	Interfaz para solicitude/recepción de nivelación de planificación	\N	2011-02-02	10800	2011-02-18	25200	\N	0.0000	100	6404	\N	3
6452	11	Análisis del módulo de planificación	\N	2011-03-15	0	2011-03-21	7200	\N	0.0000	0	6454	\N	2
6425	20	API de carga	\N	2011-05-18	14400	2011-05-25	14400	\N	0.0000	80	6430	\N	0
6426	20	API de comunicación vía XML	\N	2011-05-25	14400	2011-05-26	21600	\N	0.0000	20	6430	\N	1
6427	20	API de preprocesamiento y análisis de datos	\N	2011-05-26	21600	2011-06-04	0	\N	0.0000	100	6430	\N	2
6428	20	API de configuración de elaboración de proceso de planificación	\N	2011-06-04	0	2011-06-09	3600	\N	0.0000	50	6430	\N	3
6429	20	API de ejecución del proceso	\N	2011-06-09	3600	2011-06-13	18000	\N	0.0000	40	6430	\N	4
6431	20	Gestión del entorno	\N	2011-06-13	18000	2011-06-21	25200	\N	0.0000	100	6391	\N	10
6453	12	Análisis del módulo de interface	\N	2011-03-22	7200	2011-03-26	18000	\N	0.0000	0	6454	\N	3
6455	10	Pruebas del módulo de arquitectura	\N	2011-03-01	0	2011-03-03	0	\N	0.0000	0	6460	\N	0
6394	21	Módulo de calendario	\N	2010-12-22	3600	2010-12-29	18000	\N	0.0000	44	6390	\N	2
6399	21	Módulo de representación de funciones de asignación	\N	2010-12-29	18000	2011-01-19	7200	\N	0.0000	117	6390	\N	3
6404	21	Módulo Interface	\N	2010-12-01	25200	2011-02-18	25200	\N	0.0000	440	6391	\N	7
6430	21	Módulo de entradas/salidas	\N	2011-05-18	14400	2011-06-13	18000	\N	0.0000	290	6391	\N	9
6456	10	Pruebas del módulo de representación de la información	\N	2011-03-01	0	2011-03-04	0	\N	0.0000	0	6460	\N	1
6457	10	Pruebas del módulo de interface	\N	2011-03-01	0	2011-03-04	0	\N	0.0000	0	6460	\N	2
6458	10	Pruebas del módulo de planificación	\N	2011-03-01	0	2011-03-06	0	\N	0.0000	0	6460	\N	3
6459	10	Pruebas del módulo de entradas/salidas	\N	2011-03-01	0	2011-03-04	0	\N	0.0000	0	6460	\N	4
6461	10	Diseño de paquetes y estructura interna librería	\N	2011-03-01	0	2011-03-04	0	\N	0.0000	0	85751	\N	0
6462	11	Diseño API y fachadas	\N	2011-03-01	0	2011-03-02	7200	\N	0.0000	0	85751	\N	1
6463	10	Definición de la documentación	\N	2011-03-01	0	2011-03-04	0	\N	0.0000	0	85751	\N	2
85749	11	Diseño de conversaciones con librería	\N	2011-03-01	0	2011-03-02	7200	\N	0.0000	0	85751	\N	3
85752	11	Modelo de clases para tipos de dependencias	\N	2011-03-06	10800	2011-03-08	25200	\N	0.0000	0	85754	\N	0
85756	11	Modelo de recursos con capacidad variable	\N	2011-03-06	10800	2011-03-08	25200	\N	0.0000	0	85760	\N	1
89104	3	Tarea 1	\N	2010-11-16	0	2010-11-18	14400	\N	0.0000	20	89107	\N	0
89105	3	Tarea 2	\N	2010-11-18	14400	2010-11-25	14400	\N	0.0000	40	89107	\N	1
89106	3	Tarea 3	\N	2010-11-25	14400	2010-12-08	0	\N	0.0000	60	89107	\N	2
89107	4	Cadena crítica	\N	2010-11-16	0	2010-12-08	0	2010-12-31	0.0000	120	\N	\N	\N
6449	10	Coordinación 	\N	2011-03-01	0	2011-05-05	0	\N	0.0000	360	85802	\N	0
85758	12	Modelo de recursos con cumplimiento de criterio	\N	2011-03-06	10800	2011-03-07	36000	\N	0.0000	0	85760	\N	3
85759	11	Modelo de clases de recursos limitantes	\N	2011-03-06	10800	2011-03-08	10800	\N	0.0000	0	85760	\N	4
85761	11	Modelos de calendarios asignados a recursos	\N	2011-03-06	10800	2011-03-08	25200	\N	0.0000	0	85763	\N	0
85764	11	Modelo de asignación plana	\N	2011-03-06	10800	2011-03-08	10800	\N	0.0000	0	85768	\N	0
85765	11	Modelo de función de asignación por tramos	\N	2011-03-06	10800	2011-03-08	28800	\N	0.0000	0	85768	\N	1
85766	10	Modelo de funciones S	\N	2011-03-06	10800	2011-03-11	10800	\N	0.0000	0	85768	\N	2
85767	10	Modelo de asignación siguiendo las cadena crítica	\N	2011-03-06	10800	2011-03-11	10800	\N	0.0000	0	85768	\N	3
89111	6	Análisis del módulo de planificación	\N	2011-02-28	21600	2011-03-09	0	\N	0.0000	50	89113	\N	2
89112	6	Análisis del módulo de interface	\N	2011-03-09	0	2011-03-15	10800	\N	0.0000	35	89113	\N	3
89114	6	Desarrollo de proyecto web	\N	2011-02-16	0	2011-04-20	0	2011-04-21	0.0000	515	\N	\N	\N
85770	10	Interface para soporte de recursos con máximo de capacidad	\N	2011-03-01	0	2011-03-08	14400	\N	0.0000	0	85774	\N	0
85775	11	Algoritmia de cálculo do camino crítico	\N	2011-03-11	10800	2011-03-23	25200	\N	0.0000	0	85794	\N	0
85776	11	Modo de análisis cara atrás	\N	2011-03-11	10800	2011-03-22	18000	\N	0.0000	0	85778	\N	0
85780	11	Servicio de cómputo de la cadena crítica	\N	2011-03-11	10800	2011-03-23	25200	\N	0.0000	0	85783	\N	1
85781	11	Reasignación siguiendo indicaciones de la cadena crítica	\N	2011-03-11	10800	2011-03-21	25200	\N	0.0000	0	85783	\N	2
85786	11	Algoritmo de asignación de recursos	\N	2011-03-11	10800	2011-03-23	25200	\N	0.0000	0	85789	\N	2
85787	12	Algoritmo de asignación de recursos limitantes	\N	2011-03-11	10800	2011-03-20	21600	\N	0.0000	0	85789	\N	3
85788	11	Algoritmo de asignación dando prioridad a deadlines	\N	2011-03-11	10800	2011-03-22	18000	\N	0.0000	0	85789	\N	4
85791	11	Configuración de planificación a nivelar	\N	2011-03-11	10800	2011-03-17	18000	\N	0.0000	0	85793	\N	1
85763	16	Módulo de calendario	\N	2011-03-06	10800	2011-03-09	0	\N	0.0000	0	85769	\N	2
85768	16	Módulo de representación de funciones de asignación	\N	2011-03-06	10800	2011-03-11	0	\N	0.0000	0	85769	\N	3
85769	16	Módulo de representación de la información	\N	2011-03-06	10800	2011-03-11	0	\N	0.0000	0	85802	\N	4
85774	16	Módulo Interface	\N	2011-03-01	0	2011-04-01	0	\N	0.0000	0	85802	\N	5
85783	16	Algoritmia de la gestión de la cadena crítica	\N	2011-03-11	10800	2011-03-26	0	\N	0.0000	0	85794	\N	2
89108	6	Coordinación	\N	2011-02-16	0	2011-04-20	0	\N	0.0000	360	89114	\N	0
89113	6	Análisis - Template con criterio	\N	2011-02-16	0	2011-03-15	10800	\N	0.0000	155	89114	\N	1
89109	6	Análisis del módulo de arquitectura	\N	2011-02-16	0	2011-02-22	10800	\N	0.0000	35	89113	\N	0
89110	6	Análisis del módulo de representación de la información	\N	2011-02-22	10800	2011-02-28	21600	\N	0.0000	35	89113	\N	1
85803	4	Coordinación 	\N	2011-09-01	0	2011-11-05	0	\N	0.0000	360	89103	\N	0
85813	4	Pruebas del módulo de entradas/salidas	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85814	\N	4
85815	4	Diseño de paquetes y estructura interna librería	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85820	\N	0
85816	4	Diseño API y fachadas	\N	2011-09-01	0	2011-09-02	7200	\N	0.0000	0	85820	\N	1
85817	4	Definición de la documentación	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85820	\N	2
85818	4	Diseño de conversaciones con librería	\N	2011-09-01	0	2011-09-02	7200	\N	0.0000	0	85820	\N	3
85819	4	Diseño de soporte de fases	\N	2011-09-01	0	2011-09-05	10800	\N	0.0000	0	85820	\N	4
85821	4	Modelo de clases para tipos de dependencias	\N	2011-09-01	0	2011-09-03	14400	\N	0.0000	0	85823	\N	0
85822	4	Modelo de clases para tipos de restricciones	\N	2011-09-01	0	2011-09-04	21600	\N	0.0000	0	85823	\N	1
85824	4	Modelo de clases para representar asignaciones de recursos	\N	2011-09-01	0	2011-09-02	25200	\N	0.0000	0	85829	\N	0
85825	4	Modelo de recursos con capacidad variable	\N	2011-09-01	0	2011-09-03	14400	\N	0.0000	0	85829	\N	1
85826	4	Modelo de capacidad variable hasta un máximo	\N	2011-09-01	0	2011-09-05	10800	\N	0.0000	0	85829	\N	2
85827	4	Modelo de recursos con cumplimiento de criterio	\N	2011-09-01	0	2011-09-02	25200	\N	0.0000	0	85829	\N	3
85828	4	Modelo de clases de recursos limitantes	\N	2011-09-01	0	2011-09-03	0	\N	0.0000	0	85829	\N	4
85830	4	Modelos de calendarios asignados a recursos	\N	2011-09-01	0	2011-09-03	14400	\N	0.0000	0	85832	\N	0
85831	4	Módulo de clases para calendario	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85832	\N	1
85833	4	Modelo de asignación plana	\N	2011-09-01	0	2011-09-03	0	\N	0.0000	0	85837	\N	0
85834	4	Modelo de función de asignación por tramos	\N	2011-09-01	0	2011-09-03	18000	\N	0.0000	0	85837	\N	1
89099	4	API de configuración de elaboración de proceso de planificación	\N	2011-09-01	0	2011-09-07	7200	\N	0.0000	0	89101	\N	3
89102	4	Gestión del entorno	\N	2011-09-01	0	2011-09-13	14400	\N	0.0000	0	89103	\N	8
85808	6	Análisis	\N	2011-09-01	0	2011-09-07	0	\N	0.0000	0	89103	\N	1
85814	6	Pruebas unitarias	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	89103	\N	2
85820	6	Módulo de arquitectura	\N	2011-09-01	0	2011-09-05	0	\N	0.0000	0	89103	\N	3
85823	6	Módulo de redes de tareas	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85838	\N	0
85829	6	Módulo de recursos	\N	2011-09-01	0	2011-09-05	0	\N	0.0000	0	85838	\N	1
85832	6	Módulo de calendario	\N	2011-09-01	0	2011-09-04	0	\N	0.0000	0	85838	\N	2
85837	6	Módulo de representación de funciones de asignación	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	85838	\N	3
85838	6	Módulo de representación de la información	\N	2011-09-01	0	2011-09-06	0	\N	0.0000	0	89103	\N	4
85843	6	Módulo Interface	\N	2011-09-01	0	2011-10-02	0	\N	0.0000	0	89103	\N	5
85847	6	Infraestructura de análisis de redes tarefas en 2 modos	\N	2011-09-01	0	2011-09-16	0	\N	0.0000	0	89095	\N	1
89084	6	Algoritmia de la gestión de la cadena crítica	\N	2011-09-01	0	2011-09-16	0	\N	0.0000	0	89095	\N	2
89090	6	Algoritmos de asignación de recursos	\N	2011-09-01	0	2011-09-13	0	\N	0.0000	0	89095	\N	3
89094	6	Operaciones de nivelación de recursos sobre planificación	\N	2011-09-01	0	2011-09-07	0	\N	0.0000	0	89095	\N	4
89095	6	Módulo de planificación	\N	2011-09-01	0	2011-09-16	0	\N	0.0000	0	89103	\N	6
89101	6	Módulo de entradas/salidas	\N	2011-09-01	0	2011-09-13	0	\N	0.0000	0	89103	\N	7
89103	6	3º proyecto de desarrollo de aplicación de gestión de proyectos	\N	2011-09-01	0	2011-11-05	0	2012-03-01	0.0000	360	\N	\N	\N
91409	2	Order 3	\N	2010-11-18	0	2010-12-13	0	\N	0.0000	0	\N	\N	\N
91408	2	Order Group 1	\N	2010-11-30	14400	2010-12-13	28800	\N	0.0000	0	91409	\N	1
91407	2	Order Group 2	\N	2010-11-30	14400	2010-12-13	28800	\N	0.0000	0	91408	\N	0
91406	2	Order element 2	\N	2010-11-30	14400	2010-12-13	28800	\N	0.0000	0	91407	\N	0
91405	2	Order element 1	\N	2010-11-18	0	2010-11-30	14400	\N	0.0000	0	91409	\N	0
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
6368
6374
6380
6383
6389
6390
6391
6394
6399
6404
6408
6413
6419
6423
6424
6430
6442
6443
6448
6454
6460
85751
85754
85760
85763
85768
85769
85774
85778
85783
85789
85793
85794
85800
85802
85808
85814
85820
85823
85829
85832
85837
85838
85843
85847
89084
89090
89094
89095
89101
89103
89107
89113
89114
91407
91408
91409
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id, startconstrainttype, constraintdate) FROM stdin;
6435	0	\N
6436	0	\N
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, schedulingdata) FROM stdin;
6368	3	2945
6374	3	2565
6380	3	3473
6383	3	3759
6389	3	3761
6394	2	3888
6399	2	3891
6390	3	3508
89107	2	88912
6404	2	4905
6454	7	85207
89104	3	88913
6408	2	5252
85808	3	88432
89105	3	88914
89106	3	88915
6413	2	5296
6460	7	85212
85814	3	88437
85751	7	85218
85820	3	88443
85754	7	85225
85803	5	88426
85804	5	88433
85805	5	88434
85806	5	88435
85807	5	88436
85760	7	85228
85809	5	88438
85810	5	88439
85811	5	88440
85763	7	85234
85768	7	85237
85769	7	85224
85774	7	85242
6449	13	85201
6450	13	85208
6451	13	85209
6452	13	85210
6453	13	85211
6455	13	85213
6456	13	85214
6457	13	85215
6458	13	85216
6459	13	85217
6461	13	85219
6462	13	85220
6463	13	85221
85749	13	85222
85750	13	85223
85752	13	85226
85753	13	85227
85755	13	85229
85756	13	85230
85757	13	85231
85758	13	85232
85759	13	85233
85761	13	85235
85762	13	85236
85812	5	88441
85813	5	88442
85815	5	88444
85816	5	88445
85817	5	88446
85818	5	88447
85819	5	88448
6419	2	5940
6423	2	5946
6424	2	4948
6391	3	2562
6363	5	2586
6364	5	2946
6365	5	2947
6366	5	2948
6367	5	2949
6369	5	2566
6370	5	2962
6371	5	2963
6372	5	2964
6373	5	3472
6375	5	2567
6376	5	3474
6377	5	2965
6378	5	3475
6379	5	4161
6381	5	2591
6382	5	3760
6384	5	3509
6385	5	3763
6386	5	3886
6387	5	3887
6388	5	4333
6392	3	3510
6393	3	3890
6395	3	3511
6438	1	33666
6439	1	33667
6440	1	33668
6441	1	33669
6442	1	33665
6448	3	33645
6443	4	33633
6437	7	33634
6444	5	33646
6445	5	33647
6446	5	33648
6447	5	33649
6430	2	6119
6396	3	3893
6397	3	5900
6398	3	5901
6400	3	4906
6401	3	4907
6402	3	2593
6403	3	4947
6405	3	2592
6406	3	5253
6407	3	5254
6409	3	5297
6410	3	5298
6411	3	5434
6412	3	5688
6414	3	5941
6415	3	5942
6416	3	5943
6417	3	5944
6418	3	5945
6420	3	5947
6421	3	5948
6422	3	5949
6425	3	2594
6426	3	6120
6427	3	6138
6428	3	6139
6429	3	6140
6431	3	3476
85778	7	85552
85783	7	85555
85789	7	85560
85823	3	88450
85793	7	85566
85794	7	85550
85829	3	88453
89108	1	88942
85800	7	85570
89109	1	88949
85832	3	88459
89110	1	88950
89111	1	88951
89112	1	88952
89113	1	88948
85837	3	88462
85838	3	88449
89114	1	88941
85843	3	88467
85821	5	88451
85822	5	88452
85824	5	88454
85825	5	88455
85826	5	88456
85827	5	88457
85828	5	88458
85830	5	88460
85802	7	85200
85764	13	85238
85765	13	85239
85766	13	85240
85767	13	85241
85770	13	85243
85771	13	85547
85772	13	85548
85773	13	85549
85775	13	85551
85776	13	85553
85777	13	85554
85779	13	85556
85780	13	85557
85781	13	85558
85782	13	85559
85784	13	85561
85785	13	85562
85786	13	85563
85787	13	85564
85788	13	85565
85790	13	85567
85791	13	85568
85792	13	85569
85795	13	85571
85796	13	85572
85797	13	85573
85798	13	85574
85799	13	85575
85801	13	85576
85831	5	88461
85833	5	88463
85834	5	88464
85835	5	88465
85836	5	88466
85839	5	88468
85840	5	88469
85841	5	88470
85842	5	88471
85844	5	88473
85847	3	88474
89084	3	88881
89090	3	88886
89094	3	88892
89095	3	88472
89101	3	88896
89103	3	88425
85845	5	88475
85846	5	88880
85848	5	88882
85849	5	88883
89082	5	88884
89083	5	88885
89085	5	88887
89086	5	88888
89087	5	88889
89088	5	88890
89089	5	88891
89091	5	88893
89092	5	88894
89093	5	88895
89096	5	88897
89097	5	88898
89098	5	88899
89099	5	88900
89100	5	88901
89102	5	88902
91405	1	91013
91406	1	91016
91407	1	91015
91408	1	91014
91409	1	91012
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
1313	1	Hora normal	6336bd36-2e22-4631-9468-03be737cb107	10.00	t	t
1314	1	Hora extra	0b1c1b87-36aa-4fe7-9242-05175ee9b9f1	12.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
202	1	79a5f4b9-caec-4902-85a6-a21a60925c4c	units	f
203	1	fef4e43f-b3b5-4c9e-adbd-760e8a164f39	kg	f
204	1	e8c65280-aace-470e-a279-da4cf168345d	km	f
205	1	b77d0f74-5f7c-417c-aac6-616e556d4f64	l	f
206	1	292f75a2-136d-485a-b4fe-f10ee2c01c0c	m	f
207	1	0debdd04-c5f0-43a7-be0f-559411b5cd1c	m2	f
208	1	0ed18765-adac-47d7-adee-5540bef38a1f	m3	f
209	1	e7974dd6-d57b-4b6f-b845-c10164d6cb8e	tn	f
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_profiles (user_id, profile_id) FROM stdin;
1115	1617
1116	1616
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
1112	ROLE_CREATE_ORDER
1112	ROLE_READ_ALL_ORDERS
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
1920	Victoria	Losada López	35654215E
1922	Almudena	Domínguez Rodríguez	15435623G
1930	María del Carmen	Romero Ríos	99546124E
1928	Cristian	Dopazo Lima	99415325A
1924	Samuel	Hernández Martínez	65042314T
1926	Hector	Del Río Gómez	44512632Q
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

