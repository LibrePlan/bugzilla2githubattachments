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
458404	5	t	405
458405	5	t	405
458469	4	f	405
458471	5	t	405
458472	5	t	405
458473	5	t	405
458474	5	t	405
458475	5	t	405
458476	5	t	405
458477	5	t	405
458478	5	t	405
458479	5	t	405
458480	5	t	405
458482	4	t	404
458481	4	f	405
458484	4	f	405
458483	4	t	404
458485	4	f	405
458486	4	t	404
458360	5	t	405
458361	5	t	405
458362	5	t	405
458363	5	t	405
458364	5	t	405
458365	5	t	405
458366	5	t	405
458367	5	t	405
458368	5	t	405
458369	5	t	405
458372	5	t	405
458373	5	t	405
458374	5	t	405
458375	5	t	405
458376	5	t	405
458377	5	t	405
458378	5	t	405
458379	5	t	405
458380	5	t	405
458381	5	t	405
458384	5	t	405
458385	5	t	405
458386	5	t	405
458387	5	t	405
458388	5	t	405
458389	5	t	405
458390	5	t	405
458391	5	t	405
458392	5	t	405
458393	5	t	405
458396	5	t	405
458397	5	t	405
458398	5	t	405
458399	5	t	405
458400	5	t	405
458401	5	t	405
458402	5	t	405
458403	5	t	405
458410	5	t	405
458411	5	t	405
458412	5	t	405
458413	5	t	405
458414	5	t	405
458415	5	t	405
458416	5	t	405
458417	5	t	405
458418	5	t	405
458419	5	t	405
458420	5	t	405
458421	4	f	405
458422	4	t	404
458423	5	t	405
458424	5	t	405
458425	5	t	405
458426	5	t	405
458427	5	t	405
458428	5	t	405
458429	5	t	405
458430	5	t	405
361779	5	t	405
361780	5	t	405
361781	5	t	405
458338	5	t	405
458339	5	t	405
458340	5	t	405
458341	5	t	405
458342	5	t	405
458343	5	t	405
458344	5	t	405
458345	5	t	405
458347	4	t	404
458346	4	f	405
458348	5	t	405
458349	5	t	405
458350	5	t	405
458351	5	t	405
458352	5	t	405
458353	5	t	405
458354	5	t	405
458355	5	t	405
458356	5	t	405
458357	5	t	405
458358	4	f	405
458359	4	t	404
458370	4	t	404
458371	4	f	405
458383	4	t	404
458382	4	f	405
458394	4	f	405
458395	4	t	404
458406	4	f	405
458407	4	t	404
458408	4	t	404
458409	4	f	405
458431	5	t	405
458432	5	t	405
458434	4	t	404
458433	4	f	405
458435	5	t	405
458436	5	t	405
458437	5	t	405
458438	5	t	405
458439	5	t	405
458440	5	t	405
458441	5	t	405
458442	5	t	405
458443	5	t	405
458444	5	t	405
458445	4	f	405
458446	4	t	404
458447	5	t	405
458448	5	t	405
458449	5	t	405
458450	5	t	405
458451	5	t	405
458452	5	t	405
458453	5	t	405
458454	5	t	405
458455	5	t	405
458456	5	t	405
458458	4	t	404
458457	4	f	405
458459	5	t	405
458460	5	t	405
458461	5	t	405
458462	5	t	405
458463	5	t	405
458464	5	t	405
458465	5	t	405
458466	5	t	405
458467	5	t	405
458468	5	t	405
458470	4	t	404
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
127724	1	405	127637	t	100.00
127725	1	405	127638	t	100.00
127726	1	405	127639	t	100.00
127727	1	405	127640	t	100.00
127728	1	405	127642	t	100.00
127729	1	405	127643	t	100.00
127730	1	405	127644	t	100.00
127731	1	405	127645	t	100.00
127732	1	405	127646	t	100.00
127733	1	405	127647	t	100.00
127734	1	405	127649	t	100.00
127735	1	405	127650	t	100.00
127736	1	405	127651	t	100.00
127737	1	405	127652	t	100.00
127738	1	405	127653	t	100.00
127739	1	405	127654	t	100.00
127740	1	405	127655	t	100.00
127741	1	405	127656	t	100.00
127742	1	405	127657	t	100.00
127743	1	405	127658	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
404	4	children	100.0000	f	0.0100	t	t	f
405	3	percentage	100.0000	f	0.0100	t	t	f
406	2	units	2147483647.0000	f	1.0000	t	f	f
407	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
460972	107
460972	108
460973	107
460973	108
460974	107
460974	108
460975	107
460975	108
460976	107
460976	108
460977	107
460977	108
460978	107
460978	108
460979	107
460979	108
460980	107
460980	108
460981	107
460981	108
479358	106
479358	108
479359	105
479359	108
479360	105
479360	108
479361	105
479361	108
479362	105
479362	108
479363	105
479363	108
479364	105
479364	108
479365	105
479365	108
479366	105
479366	108
479367	105
479367	108
479368	105
479368	108
479369	2626
479369	108
479370	2626
479370	108
479371	2626
479371	108
479372	2626
479372	108
479373	2626
479373	108
479374	2626
479374	108
479375	2626
479375	108
479376	2626
479376	108
479377	2626
479377	108
479378	2626
479378	108
479379	300578
479379	108
479380	300578
479380	108
479381	300578
479381	108
479382	300578
479382	108
479383	300578
479383	108
479384	300578
479384	108
479385	300578
479385	108
479386	300578
479386	108
479387	300578
479387	108
479388	300578
479388	108
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
506	1	3685c980-1006-4691-9d35-dc3684d0f439	Coruña
505	2	a2957eea-18ba-45e4-af65-b57878f18fce	Default
507	1	687f7478-4ba3-48bc-8f2f-47fbb9a4b87c	Pontevedra
300079	2	b7887e70-7f9c-4a15-b2d7-77b4d474b058	\N
300071	5	e206a338-4058-4552-a1a4-b49bcd0bac48	\N
300072	3	7e144cac-ea03-4431-9e89-95dd2a533cf3	\N
300073	3	bcd6ad14-4908-429e-ab6d-0ba8f828abc8	\N
300074	3	726e3710-2c09-43d3-948c-4e79ee7c081c	\N
300075	3	0e48bd3b-d9c7-4cfd-ae41-5e02b9614150	\N
300076	3	c64788e9-400e-419e-bce2-71900c235597	\N
513	3	975f39aa-d63b-4d12-a327-0383de72ebad	\N
2829	2	pincor2-calendar	\N
2828	2	pincor1-calendar	\N
2830	2	pincor3-calendar	\N
2831	2	pincor4-calendar	\N
2832	2	solcor1-calendar	\N
2833	2	solcor2-calendar	\N
2834	2	solcor3-calendar	\N
2835	2	solcor4-calendar	\N
508	4	9ebb3471-4ea4-4dc4-9ee6-3acb1e030ff5	\N
2121	2	cappon2calendar	\N
2130	2	capcor2calendar	\N
2126	2	esccor1calendar	\N
2127	2	esccor2calendar	\N
2128	2	esccor3calendar	\N
2129	2	esccor4calendar	\N
514	2	85bd3e44-ddd2-4209-822a-28b5ac23e70c	\N
515	2	3e625c59-01c6-4067-aaa2-e90a8a6b5a1a	\N
516	2	88380002-93e7-4af9-97a9-49cce67d8e70	\N
509	2	f693644e-9653-400a-8994-92456bd7affb	\N
510	2	5b04864e-7bdc-451e-a822-a0f89d3d927b	\N
511	2	8f51e287-69b5-4a9e-97e4-7c87f1d67b95	\N
512	2	7e7467f5-84e5-4468-a73a-6154ffe58afb	\N
2122	2	escpon1calendar	\N
2123	2	escpon2calendar	\N
2124	2	escpon3calendar	\N
2125	2	escpon4calendar	\N
300077	3	c59f7bec-be2a-4561-bca8-22ff21fb002b	\N
300078	3	ffc9f94a-ec9f-4078-b27f-ff26ef0538ba	\N
300080	2	5f05e5f3-caea-4f03-b2ff-a83d6ae4464d	\N
300081	2	c8e463c7-aca5-489a-a8d4-c2d02735f568	\N
300082	2	677cca9b-47bd-4096-9368-313207ff8a87	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1718	2	2010-01-01	\N	509	0
1719	2	2010-07-01	\N	510	0
1720	2	2009-01-01	\N	511	0
1721	2	2009-01-01	2010-12-31	512	0
2324	2	2009-01-01	\N	2122	0
2325	2	2009-01-01	2009-12-31	2123	0
2326	2	2010-01-01	\N	2124	0
2327	2	2010-01-01	\N	2125	0
1722	3	2009-01-01	2009-12-31	513	0
3031	2	2010-07-01	\N	2829	0
3030	2	2010-01-01	\N	2828	0
3032	2	2009-01-01	\N	2830	0
3033	2	2009-01-01	2009-12-31	2831	0
3034	2	2009-01-01	2009-12-31	2832	0
3035	2	2009-01-01	\N	2833	0
3036	2	2010-01-01	\N	2834	0
3037	2	2010-07-01	\N	2835	0
1717	4	2010-01-12	\N	508	0
2323	2	2009-01-01	\N	2121	0
2332	2	2009-01-01	\N	2130	0
2328	2	2009-01-01	\N	2126	0
2329	2	2009-01-01	2009-12-31	2127	0
2330	2	2010-01-01	\N	2128	0
2331	2	2010-01-01	\N	2129	0
1723	2	2009-01-01	\N	514	0
1724	2	2010-01-01	\N	515	0
1725	2	2010-07-01	\N	516	0
300281	2	2010-01-01	\N	300079	0
300273	5	2009-01-01	\N	300071	0
300274	3	2009-01-01	\N	300072	0
300275	3	2009-01-01	\N	300073	0
300276	3	2009-01-01	\N	300074	0
300277	3	2009-01-01	\N	300075	0
300278	3	2009-01-01	\N	300076	0
300279	3	2009-01-01	\N	300077	0
300280	3	2009-01-01	\N	300078	0
300282	2	2009-01-01	\N	300080	0
300283	2	2009-01-01	\N	300081	0
300284	2	2010-01-01	\N	300082	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
607	1	322764bb-28a8-49dd-98d9-18a1f61edb69	505	\N	506	0
606	2	97b3fa4e-1e75-4d81-a3d4-c14ec4caacf1	\N	\N	505	0
608	1	e38efe1b-4767-491f-890c-409a85c81d96	505	\N	507	0
2935	2	f11531a2-2ceb-4273-a2da-23082f6ede83	506	\N	2834	0
2936	2	68aed008-3152-4a30-994f-a15f86054727	506	\N	2835	0
609	4	3e2adf2c-2bbd-49f4-ba22-72403ff05910	507	\N	508	0
2222	2	91c9c703-de4b-4941-8a4b-e432367c3a93	507	\N	2121	0
2231	2	6254c5e3-43b2-48f2-bdb2-6fad0afb9e53	506	\N	2130	0
2227	2	09d67d25-7825-4517-b9b6-82f30ace940a	506	\N	2126	0
2228	2	66d04606-a063-40e2-bbf9-2462176ff792	506	\N	2127	0
2229	2	fe77e5f7-cd46-49dc-a32e-20e75097165b	506	\N	2128	0
2230	2	b85e5ea0-6a9c-4252-a881-c82e0a867ef1	506	\N	2129	0
615	2	684cfe4b-abdc-4b95-8b4f-f14f0010a13b	505	\N	514	0
616	2	9219ade6-468f-46de-9a73-ea378267f373	507	\N	515	0
617	2	e2f1eb07-ed0e-451f-b432-7e7eb28da9ea	507	\N	516	0
610	2	742ad580-c08b-441c-a7e3-2be6c32fbdef	507	\N	509	0
611	2	058ef40c-1891-4acb-ad04-cdfb710a99fb	507	\N	510	0
612	2	6ca93742-05de-4eef-97d1-2df17a094579	507	\N	511	0
613	2	c204b9a7-221f-4cef-aee9-1ff813e70242	507	\N	512	0
2223	2	5665c9cc-11a2-4e0a-9b19-d68790889b55	507	\N	2122	0
2224	2	8773ba10-3b08-42a3-bd56-2a91c1fb9fba	507	\N	2123	0
2225	2	5a0de902-5adb-4c32-a9fb-c05394af6e6b	507	\N	2124	0
614	3	4b782780-6be9-4df4-aa4c-fe91f5cbe4ed	507	\N	513	0
2930	2	9a62573f-ebc6-43fa-8830-563afb50320f	506	\N	2829	0
2929	2	f37d654e-e956-428e-8fe6-ac95aaa327f0	506	\N	2828	0
2931	2	fe394177-8114-46df-ba32-8b1fbe5af632	506	\N	2830	0
2932	2	b39d9db8-b931-45c0-b4e9-6e3350dae15e	506	\N	2831	0
2933	2	bd5eec8e-287d-46eb-85b1-93c7ad2b89f1	506	\N	2832	0
2934	2	1900e0b4-393c-42a8-a92a-781612cc956d	506	\N	2833	0
2226	2	16f93021-5b8d-48b3-8eeb-801838b47403	507	\N	2125	0
300182	2	00c4c82b-467e-44fb-b15c-d6f3307bc378	507	\N	300081	0
300183	2	42aad009-ab43-4626-ac57-41c12d84494c	507	\N	300082	0
300180	2	3b250ae7-94b7-4f97-9224-dffebdf2134c	506	\N	300079	0
300172	5	4a79a703-a992-445b-9969-f27998e2abb4	505	\N	300071	0
300173	3	96cc7f6b-1618-4d85-9e34-6dcd6a05b917	505	\N	300072	0
300174	3	1e054a99-ebd3-4948-80db-aec3af82e73e	505	\N	300073	0
300175	3	842f4c08-ad59-4b46-8dd5-5e4123ca66c2	505	\N	300074	0
300176	3	61e467c4-7b50-4acb-8f02-dba9dc727d74	505	\N	300075	0
300177	3	308ecac3-26eb-4f51-94c9-edc3c83c1633	505	\N	300076	0
300178	3	b1852c9e-cf83-4f60-a08f-05e645b1765f	505	\N	300077	0
300179	3	a8efad10-90fb-417c-8cef-336cfbdd1d7a	505	\N	300078	0
300181	2	2fed0415-3557-4947-8afe-524f0d7585e5	506	\N	300080	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1515	1	9f017846-8e68-4aa4-988e-9cfb183f791a	2010-02-19	8	1014	506
1516	1	76d2195a-a186-4c88-910d-9ad3e5db52f4	2010-10-07	8	1014	506
1517	1	20960850-d15a-4298-aafb-a71264df4a7b	2010-12-08	8	1014	505
1518	1	d5ae718b-65e9-45b7-922b-d79b9739e729	2009-03-19	8	1014	505
1519	1	d3e465c6-9bd3-4772-80b1-387647c99ac1	2010-01-06	8	1014	505
1520	1	255e0c62-620b-4a89-bd96-61006bcbf0a2	2009-01-06	8	1014	505
1521	1	2b3a041b-7967-42bf-96d8-ecfe89a350a3	2010-03-19	8	1014	505
1522	1	38a902d2-7902-4cba-bf3f-ee615367800f	2009-01-01	8	1014	505
1523	1	5bec8848-b32a-4a51-a18e-9de5964eb071	2009-12-08	8	1014	505
1524	1	b9eabe20-7e52-4a95-a40f-745b1af5ac12	2010-12-06	8	1014	505
1525	1	c8e14103-b446-4e7f-b520-b441227a49bd	2010-01-01	8	1014	505
1526	1	11dd6cfc-57f4-470c-99e3-ee7be4700d3a	2010-02-23	8	1014	507
1527	1	7710df59-bd8a-4371-8664-94fa4f54576f	2010-08-04	8	1014	507
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable) FROM stdin;
1010	6	HOLIDAY	HOLIDAY	red	t
1011	5	SICK_LEAVE	SICK_LEAVE	red	t
1012	4	LEAVE	LEAVE	red	t
1013	3	STRIKE	STRIKE	red	t
1014	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t
1015	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts) FROM stdin;
707	1	505	COMPANY_CODE	f	f	f	f	f	f	f	t	t	t
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
1313	1	b851f608-b77a-4a27-99da-914ad5eef302	Peón	t
1314	2	aa31a7e2-5c8d-4337-9943-902349ce593d	Oficial	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
101	14	693c96f8-22c5-4d7b-b2a7-7822325f9180	medicalLeave	t	1	\N
102	13	1c6b250d-1012-4cf1-820f-4a37d63aa0c1	paternityLeave	t	1	\N
103	4	30ff3acb-1955-4e61-a79b-68ae688dc441	hiredResourceWorkingRelationship	t	5	\N
104	3	4b39646a-2e5a-4eb0-8d7f-a1a9b1f8010e	firedResourceWorkingRelationship	t	5	\N
108	1	0cb672be-3c2b-406e-b129-4665b2806c29	Coruña	t	6	\N
109	1	f5719466-e0ac-4e03-99c9-752d497532be	Pontevedra	t	6	\N
300576	1	7c4bc37c-72bc-4f2b-8c3d-6e20d3fa07af	Type 1	t	97484800	\N
300577	1	5b1dda32-5827-491d-bc6c-7c859bad9527	Type 2	t	97484800	\N
105	3	081246b0-675c-4dee-8822-113a1378ca9f	Pintor	t	4	\N
107	3	9375b411-4af5-4a9a-b519-9318fef9fae7	Soldador	t	4	\N
106	3	7d265276-0d48-4892-9c1d-e82a8823b2d0	Capataz	t	4	\N
300578	1	255109e5-fdde-4253-9202-8e16372dae27	Decorador	t	4	\N
2626	2	1c9646bf-1366-4fc3-8b51-48a48834d840	Escultor	t	4	\N
300579	1	a0fc6e41-b5ec-4f05-aaeb-b78e52c32e90	Desencapotador	t	4	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
301204	DIRECT	1	\N	\N	301286	300578	\N	\N
301205	DIRECT	1	\N	\N	301286	109	\N	\N
317855	DIRECT	1	\N	\N	312311	107	\N	\N
317856	DIRECT	1	\N	\N	312311	109	\N	\N
81977	DIRECT	1	\N	\N	127649	109	\N	\N
81978	INDIRECT	1	127821	\N	\N	109	81977	t
81979	DIRECT	1	\N	\N	127650	109	\N	\N
81980	INDIRECT	1	127822	\N	\N	109	81979	t
81981	DIRECT	1	\N	\N	127651	109	\N	\N
81982	INDIRECT	1	127823	\N	\N	109	81981	t
81983	DIRECT	1	\N	\N	127652	109	\N	\N
81984	INDIRECT	1	127824	\N	\N	109	81983	t
81985	DIRECT	1	\N	\N	127653	109	\N	\N
81986	INDIRECT	1	127825	\N	\N	109	81985	t
81987	DIRECT	1	\N	\N	127654	109	\N	\N
81988	INDIRECT	1	127826	\N	\N	109	81987	t
81989	DIRECT	1	\N	\N	127655	109	\N	\N
81990	INDIRECT	1	127827	\N	\N	109	81989	t
81991	DIRECT	1	\N	\N	127656	109	\N	\N
81992	INDIRECT	1	127828	\N	\N	109	81991	t
81993	DIRECT	1	\N	\N	127657	109	\N	\N
81994	INDIRECT	1	127829	\N	\N	109	81993	t
81995	DIRECT	1	\N	\N	127658	109	\N	\N
81996	INDIRECT	1	127830	\N	\N	109	81995	t
301228	DIRECT	1	\N	\N	301290	108	\N	\N
301229	DIRECT	1	\N	\N	301290	300578	\N	\N
301911	DIRECT	1	\N	\N	301993	300576	\N	\N
301912	DIRECT	1	\N	\N	301993	109	\N	\N
312233	DIRECT	1	\N	\N	312295	108	\N	\N
312234	DIRECT	1	\N	\N	312295	300577	\N	\N
302562	DIRECT	1	\N	\N	301997	300576	\N	\N
302563	DIRECT	1	\N	\N	301997	108	\N	\N
312241	DIRECT	1	\N	\N	312299	109	\N	\N
312242	DIRECT	1	\N	\N	312299	300577	\N	\N
316865	DIRECT	1	\N	\N	312307	108	\N	\N
316866	DIRECT	1	\N	\N	312307	105	\N	\N
314501	DIRECT	1	\N	\N	312303	108	\N	\N
314502	DIRECT	1	\N	\N	312303	107	\N	\N
318473	DIRECT	1	\N	\N	312315	105	\N	\N
318474	DIRECT	1	\N	\N	312315	109	\N	\N
457926	DIRECT	3	\N	458042	\N	108	\N	\N
457928	DIRECT	3	\N	458043	\N	106	\N	\N
457927	INDIRECT	3	\N	458043	\N	108	457926	t
457929	INDIRECT	3	457951	\N	\N	106	457928	t
457930	INDIRECT	3	457951	\N	\N	108	457926	t
457931	DIRECT	3	\N	458044	\N	107	\N	\N
457932	INDIRECT	3	\N	458044	\N	108	457926	t
458237	INDIRECT	3	\N	458045	\N	107	457931	t
457933	INDIRECT	3	\N	458045	\N	108	457926	t
458239	INDIRECT	3	457952	\N	\N	107	457931	t
458238	INDIRECT	3	457952	\N	\N	108	457926	t
458241	INDIRECT	3	\N	458046	\N	108	457926	t
458240	INDIRECT	3	\N	458046	\N	107	457931	t
458242	INDIRECT	3	457953	\N	\N	108	457926	t
458243	INDIRECT	3	457953	\N	\N	107	457931	t
458245	INDIRECT	3	\N	458047	\N	108	457926	t
458244	INDIRECT	3	\N	458047	\N	107	457931	t
449008	INDIRECT	9	448792	\N	\N	2626	448980	t
449009	INDIRECT	9	448792	\N	\N	108	448895	t
449010	INDIRECT	9	\N	448520	\N	2626	448980	t
449011	INDIRECT	9	\N	448520	\N	108	448895	t
449012	INDIRECT	9	448793	\N	\N	108	448895	t
449013	INDIRECT	9	448793	\N	\N	2626	448980	t
449014	INDIRECT	9	\N	448521	\N	108	448895	t
449015	INDIRECT	9	\N	448521	\N	2626	448980	t
449016	INDIRECT	9	448794	\N	\N	108	448895	t
449017	INDIRECT	9	448794	\N	\N	2626	448980	t
449019	INDIRECT	9	\N	448522	\N	2626	448980	t
449018	INDIRECT	9	\N	448522	\N	108	448895	t
449022	DIRECT	9	\N	448523	\N	300578	\N	\N
456845	INDIRECT	4	456750	\N	\N	109	451339	t
456844	INDIRECT	4	456750	\N	\N	300578	456825	t
456848	INDIRECT	4	456751	\N	\N	300578	456825	t
456849	INDIRECT	4	456751	\N	\N	109	451339	t
456852	INDIRECT	4	456752	\N	\N	109	451339	t
456853	INDIRECT	4	456752	\N	\N	300578	456825	t
456857	INDIRECT	4	456753	\N	\N	109	451339	t
456856	INDIRECT	4	456753	\N	\N	300578	456825	t
456861	INDIRECT	4	456754	\N	\N	300578	456825	t
456860	INDIRECT	4	456754	\N	\N	109	451339	t
456864	INDIRECT	4	456755	\N	\N	109	451339	t
456865	INDIRECT	4	456755	\N	\N	300578	456825	t
456870	INDIRECT	4	456756	\N	\N	109	451339	t
456843	INDIRECT	6	\N	456405	\N	300578	456825	t
456842	INDIRECT	6	\N	456405	\N	109	451339	t
456846	INDIRECT	6	\N	456406	\N	300578	456825	t
456847	INDIRECT	6	\N	456406	\N	109	451339	t
456851	INDIRECT	6	\N	456407	\N	300578	456825	t
456850	INDIRECT	6	\N	456407	\N	109	451339	t
456855	INDIRECT	6	\N	456408	\N	109	451339	t
456854	INDIRECT	6	\N	456408	\N	300578	456825	t
456858	INDIRECT	6	\N	456409	\N	300578	456825	t
456859	INDIRECT	6	\N	456409	\N	109	451339	t
456862	INDIRECT	6	\N	456410	\N	300578	456825	t
456863	INDIRECT	6	\N	456410	\N	109	451339	t
456866	INDIRECT	6	\N	456411	\N	109	451339	t
456867	DIRECT	6	\N	456411	\N	300576	\N	\N
451339	DIRECT	7	\N	450861	\N	109	\N	\N
451341	DIRECT	7	\N	450862	\N	106	\N	\N
451340	INDIRECT	7	\N	450862	\N	109	451339	t
451345	INDIRECT	7	\N	450863	\N	109	451339	t
450089	INDIRECT	6	449976	\N	\N	108	448895	t
451344	DIRECT	7	\N	450863	\N	107	\N	\N
451346	INDIRECT	7	\N	451369	\N	109	451339	t
450092	INDIRECT	6	449977	\N	\N	108	448895	t
451347	INDIRECT	7	\N	451369	\N	107	451344	t
451351	INDIRECT	7	\N	451370	\N	107	451344	t
451350	INDIRECT	7	\N	451370	\N	109	451339	t
451354	INDIRECT	7	\N	451371	\N	109	451339	t
450124	INDIRECT	6	449987	\N	\N	108	448895	t
451355	INDIRECT	7	\N	451371	\N	107	451344	t
451359	INDIRECT	7	\N	451372	\N	109	451339	t
450127	INDIRECT	6	449988	\N	\N	108	448895	t
451358	INDIRECT	7	\N	451372	\N	107	451344	t
451362	INDIRECT	7	\N	451373	\N	109	451339	t
450130	INDIRECT	6	449989	\N	\N	108	448895	t
451363	INDIRECT	7	\N	451373	\N	107	451344	t
451367	INDIRECT	7	\N	451374	\N	109	451339	t
450133	INDIRECT	6	449990	\N	\N	108	448895	t
451366	INDIRECT	7	\N	451374	\N	107	451344	t
451573	INDIRECT	7	\N	451375	\N	107	451344	t
450136	INDIRECT	6	449991	\N	\N	108	448895	t
451572	INDIRECT	7	\N	451375	\N	109	451339	t
451576	INDIRECT	7	\N	451376	\N	107	451344	t
450139	INDIRECT	6	449992	\N	\N	108	448895	t
451577	INDIRECT	7	\N	451376	\N	109	451339	t
451581	INDIRECT	7	\N	451377	\N	109	451339	t
451580	INDIRECT	7	\N	451377	\N	107	451344	t
456665	INDIRECT	6	\N	456385	\N	109	451339	t
456666	INDIRECT	6	\N	456385	\N	105	456639	t
456669	INDIRECT	6	\N	456386	\N	105	456639	t
456640	INDIRECT	6	\N	456378	\N	109	451339	t
456641	INDIRECT	6	\N	456379	\N	109	451339	t
456642	INDIRECT	6	\N	456379	\N	105	456639	t
456645	INDIRECT	6	\N	456380	\N	105	456639	t
456644	INDIRECT	4	456726	\N	\N	105	456639	t
456643	INDIRECT	4	456726	\N	\N	109	451339	t
456646	INDIRECT	6	\N	456380	\N	109	451339	t
456649	INDIRECT	6	\N	456381	\N	109	451339	t
456648	INDIRECT	4	456727	\N	\N	105	456639	t
456647	INDIRECT	4	456727	\N	\N	109	451339	t
456650	INDIRECT	6	\N	456381	\N	105	456639	t
456653	INDIRECT	6	\N	456382	\N	105	456639	t
456651	INDIRECT	4	456728	\N	\N	105	456639	t
456652	INDIRECT	4	456728	\N	\N	109	451339	t
456654	INDIRECT	6	\N	456382	\N	109	451339	t
456670	INDIRECT	6	\N	456386	\N	109	451339	t
456656	INDIRECT	4	456729	\N	\N	109	451339	t
456673	INDIRECT	6	\N	456387	\N	109	451339	t
456674	INDIRECT	6	\N	456387	\N	105	456639	t
456678	INDIRECT	6	\N	456388	\N	105	456639	t
456677	INDIRECT	6	\N	456388	\N	109	451339	t
456682	INDIRECT	6	\N	456389	\N	109	451339	t
456681	DIRECT	6	\N	456389	\N	2626	\N	\N
456683	INDIRECT	6	\N	456390	\N	109	451339	t
450095	INDIRECT	6	449978	\N	\N	108	448895	t
360007	DIRECT	2	\N	\N	359896	108	\N	\N
360008	INDIRECT	2	\N	\N	359897	108	360007	t
360009	INDIRECT	2	359812	\N	\N	108	360007	t
360010	INDIRECT	2	\N	\N	359898	108	360007	t
360011	INDIRECT	2	359813	\N	\N	108	360007	t
360012	INDIRECT	2	\N	\N	359899	108	360007	t
360013	INDIRECT	2	359814	\N	\N	108	360007	t
360014	INDIRECT	2	\N	\N	359900	108	360007	t
360015	INDIRECT	2	359815	\N	\N	108	360007	t
360016	INDIRECT	2	\N	\N	359901	108	360007	t
360017	INDIRECT	2	359816	\N	\N	108	360007	t
360018	INDIRECT	2	\N	\N	359902	108	360007	t
360019	INDIRECT	2	359817	\N	\N	108	360007	t
360020	INDIRECT	2	\N	\N	359903	108	360007	t
360021	INDIRECT	2	359818	\N	\N	108	360007	t
360022	INDIRECT	2	\N	\N	359904	108	360007	t
360023	INDIRECT	2	359819	\N	\N	108	360007	t
360024	INDIRECT	2	\N	\N	359905	108	360007	t
360025	INDIRECT	2	359820	\N	\N	108	360007	t
360026	INDIRECT	2	\N	\N	359906	108	360007	t
360027	INDIRECT	2	359821	\N	\N	108	360007	t
451342	INDIRECT	5	451188	\N	\N	106	451341	t
451343	INDIRECT	5	451188	\N	\N	109	451339	t
451348	INDIRECT	5	451189	\N	\N	109	451339	t
451349	INDIRECT	5	451189	\N	\N	107	451344	t
451353	INDIRECT	5	451190	\N	\N	107	451344	t
451352	INDIRECT	5	451190	\N	\N	109	451339	t
451356	INDIRECT	5	451191	\N	\N	109	451339	t
451357	INDIRECT	5	451191	\N	\N	107	451344	t
451360	INDIRECT	5	451192	\N	\N	109	451339	t
451361	INDIRECT	5	451192	\N	\N	107	451344	t
451364	INDIRECT	5	451193	\N	\N	107	451344	t
451365	INDIRECT	5	451193	\N	\N	109	451339	t
451368	INDIRECT	5	451194	\N	\N	107	451344	t
451571	INDIRECT	5	451194	\N	\N	109	451339	t
451574	INDIRECT	5	451195	\N	\N	107	451344	t
451575	INDIRECT	5	451195	\N	\N	109	451339	t
451578	INDIRECT	5	451196	\N	\N	107	451344	t
451579	INDIRECT	5	451196	\N	\N	109	451339	t
451583	INDIRECT	5	451197	\N	\N	109	451339	t
451582	INDIRECT	5	451197	\N	\N	107	451344	t
451585	INDIRECT	7	\N	451378	\N	107	451344	t
451584	INDIRECT	7	\N	451378	\N	109	451339	t
456657	INDIRECT	6	\N	456383	\N	109	451339	t
456655	INDIRECT	4	456729	\N	\N	105	456639	t
456660	INDIRECT	4	456730	\N	\N	105	456639	t
456659	INDIRECT	4	456730	\N	\N	109	451339	t
456663	INDIRECT	4	456731	\N	\N	109	451339	t
456664	INDIRECT	4	456731	\N	\N	105	456639	t
456668	INDIRECT	4	456732	\N	\N	109	451339	t
456667	INDIRECT	4	456732	\N	\N	105	456639	t
456672	INDIRECT	4	456733	\N	\N	109	451339	t
456671	INDIRECT	4	456733	\N	\N	105	456639	t
456675	INDIRECT	4	456734	\N	\N	109	451339	t
456676	INDIRECT	4	456734	\N	\N	105	456639	t
456679	INDIRECT	4	456735	\N	\N	105	456639	t
456680	INDIRECT	4	456735	\N	\N	109	451339	t
456685	INDIRECT	4	456736	\N	\N	109	451339	t
456686	INDIRECT	4	456736	\N	\N	2626	456681	t
456690	INDIRECT	4	456737	\N	\N	2626	456681	t
456689	INDIRECT	4	456737	\N	\N	109	451339	t
456658	INDIRECT	6	\N	456383	\N	105	456639	t
456661	INDIRECT	6	\N	456384	\N	109	451339	t
456662	INDIRECT	6	\N	456384	\N	105	456639	t
456694	INDIRECT	4	456738	\N	\N	109	451339	t
456693	INDIRECT	4	456738	\N	\N	2626	456681	t
456698	INDIRECT	4	456739	\N	\N	2626	456681	t
456697	INDIRECT	4	456739	\N	\N	109	451339	t
456702	INDIRECT	4	456740	\N	\N	2626	456681	t
456701	INDIRECT	4	456740	\N	\N	109	451339	t
456706	INDIRECT	4	456741	\N	\N	2626	456681	t
456705	INDIRECT	4	456741	\N	\N	109	451339	t
456710	INDIRECT	4	456742	\N	\N	2626	456681	t
456709	INDIRECT	4	456742	\N	\N	109	451339	t
456713	INDIRECT	4	456743	\N	\N	109	451339	t
456714	INDIRECT	4	456743	\N	\N	2626	456681	t
456718	INDIRECT	4	456744	\N	\N	2626	456681	t
456717	INDIRECT	4	456744	\N	\N	109	451339	t
456823	INDIRECT	4	456745	\N	\N	109	451339	t
456721	INDIRECT	4	456745	\N	\N	2626	456681	t
456829	INDIRECT	4	456746	\N	\N	109	451339	t
456828	INDIRECT	4	456746	\N	\N	300578	456825	t
456833	INDIRECT	4	456747	\N	\N	109	451339	t
456684	INDIRECT	6	\N	456390	\N	2626	456681	t
450098	INDIRECT	6	449979	\N	\N	108	448895	t
456687	INDIRECT	6	\N	456391	\N	109	451339	t
456688	INDIRECT	6	\N	456391	\N	2626	456681	t
450101	INDIRECT	6	449980	\N	\N	108	448895	t
456692	INDIRECT	6	\N	456392	\N	109	451339	t
456691	INDIRECT	6	\N	456392	\N	2626	456681	t
450104	INDIRECT	6	449981	\N	\N	108	448895	t
456696	INDIRECT	6	\N	456393	\N	109	451339	t
456695	INDIRECT	6	\N	456393	\N	2626	456681	t
450107	INDIRECT	6	449982	\N	\N	108	448895	t
456700	INDIRECT	6	\N	456394	\N	109	451339	t
456699	INDIRECT	6	\N	456394	\N	2626	456681	t
450110	INDIRECT	6	449983	\N	\N	108	448895	t
456703	INDIRECT	6	\N	456395	\N	2626	456681	t
456704	INDIRECT	6	\N	456395	\N	109	451339	t
450113	INDIRECT	6	449984	\N	\N	108	448895	t
456708	INDIRECT	6	\N	456396	\N	109	451339	t
456707	INDIRECT	6	\N	456396	\N	2626	456681	t
450116	INDIRECT	6	449985	\N	\N	108	448895	t
456712	INDIRECT	6	\N	456397	\N	109	451339	t
456711	INDIRECT	6	\N	456397	\N	2626	456681	t
456716	INDIRECT	6	\N	456398	\N	109	451339	t
456715	INDIRECT	6	\N	456398	\N	2626	456681	t
450121	INDIRECT	6	449986	\N	\N	108	448895	t
456719	INDIRECT	6	\N	456399	\N	2626	456681	t
456720	INDIRECT	6	\N	456399	\N	109	451339	t
456825	DIRECT	6	\N	456400	\N	300578	\N	\N
450142	INDIRECT	6	449993	\N	\N	108	448895	t
456824	INDIRECT	6	\N	456400	\N	109	451339	t
456826	INDIRECT	6	\N	456401	\N	300578	456825	t
450145	INDIRECT	6	449994	\N	\N	108	448895	t
456827	INDIRECT	6	\N	456401	\N	109	451339	t
456830	INDIRECT	6	\N	456402	\N	109	451339	t
450148	INDIRECT	6	449995	\N	\N	108	448895	t
456832	INDIRECT	4	456747	\N	\N	300578	456825	t
456837	INDIRECT	4	456748	\N	\N	109	451339	t
456836	INDIRECT	4	456748	\N	\N	300578	456825	t
456841	INDIRECT	4	456749	\N	\N	109	451339	t
456840	INDIRECT	4	456749	\N	\N	300578	456825	t
456831	INDIRECT	6	\N	456402	\N	300578	456825	t
456835	INDIRECT	6	\N	456403	\N	300578	456825	t
456834	INDIRECT	6	\N	456403	\N	109	451339	t
456838	INDIRECT	6	\N	456404	\N	109	451339	t
451336	DIRECT	7	\N	450860	\N	106	\N	\N
451335	INDIRECT	7	\N	450860	\N	108	448895	t
451338	INDIRECT	7	451187	\N	\N	106	451336	t
451337	INDIRECT	7	451187	\N	\N	108	448895	t
450086	DIRECT	8	\N	449720	\N	300576	\N	\N
448895	DIRECT	9	\N	448489	\N	108	\N	\N
450105	INDIRECT	8	\N	449727	\N	108	448895	t
450109	INDIRECT	8	\N	449728	\N	108	448895	t
450108	INDIRECT	8	\N	449728	\N	300576	450086	t
450111	INDIRECT	8	\N	449729	\N	108	448895	t
450112	INDIRECT	8	\N	449729	\N	300576	450086	t
450115	INDIRECT	8	\N	449730	\N	108	448895	t
450114	INDIRECT	8	\N	449730	\N	300576	450086	t
450118	INDIRECT	8	\N	449731	\N	108	448895	t
450120	INDIRECT	8	\N	449732	\N	108	448895	t
450119	INDIRECT	8	\N	449732	\N	300577	450117	t
450123	INDIRECT	8	\N	449733	\N	108	448895	t
450122	INDIRECT	8	\N	449733	\N	300577	450117	t
450126	INDIRECT	8	\N	449734	\N	108	448895	t
450125	INDIRECT	8	\N	449734	\N	300577	450117	t
450129	INDIRECT	8	\N	449735	\N	108	448895	t
450128	INDIRECT	8	\N	449735	\N	300577	450117	t
450131	INDIRECT	8	\N	449736	\N	300577	450117	t
450132	INDIRECT	8	\N	449736	\N	108	448895	t
450134	INDIRECT	8	\N	449737	\N	108	448895	t
450135	INDIRECT	8	\N	449737	\N	300577	450117	t
450137	INDIRECT	8	\N	449738	\N	300577	450117	t
450138	INDIRECT	8	\N	449738	\N	108	448895	t
450141	INDIRECT	8	\N	449739	\N	300577	450117	t
450140	INDIRECT	8	\N	449739	\N	108	448895	t
450143	INDIRECT	8	\N	449740	\N	300577	450117	t
450144	INDIRECT	8	\N	449740	\N	108	448895	t
450146	INDIRECT	8	\N	449741	\N	108	448895	t
450147	INDIRECT	8	\N	449741	\N	300577	450117	t
456839	INDIRECT	6	\N	456404	\N	300578	456825	t
456868	INDIRECT	6	\N	456412	\N	109	451339	t
456869	INDIRECT	6	\N	456412	\N	300576	456867	t
448943	INDIRECT	9	448776	\N	\N	105	448938	t
448945	INDIRECT	9	\N	448503	\N	108	448895	t
448944	INDIRECT	9	\N	448503	\N	105	448938	t
448969	INDIRECT	9	\N	448509	\N	105	448938	t
448971	INDIRECT	9	448783	\N	\N	108	448895	t
448970	INDIRECT	9	448783	\N	\N	105	448938	t
448972	INDIRECT	9	\N	448510	\N	105	448938	t
448973	INDIRECT	9	\N	448510	\N	108	448895	t
448975	INDIRECT	9	448784	\N	\N	105	448938	t
448974	INDIRECT	9	448784	\N	\N	108	448895	t
448976	INDIRECT	9	\N	448511	\N	105	448938	t
448977	INDIRECT	9	\N	448511	\N	108	448895	t
448979	INDIRECT	9	448785	\N	\N	108	448895	t
448978	INDIRECT	9	448785	\N	\N	105	448938	t
448981	INDIRECT	9	\N	448512	\N	108	448895	t
448982	INDIRECT	9	\N	448513	\N	2626	448980	t
448983	INDIRECT	9	\N	448513	\N	108	448895	t
448984	INDIRECT	9	448786	\N	\N	108	448895	t
448985	INDIRECT	9	448786	\N	\N	2626	448980	t
448987	INDIRECT	9	\N	448514	\N	108	448895	t
448986	INDIRECT	9	\N	448514	\N	2626	448980	t
448989	INDIRECT	9	448787	\N	\N	2626	448980	t
448988	INDIRECT	9	448787	\N	\N	108	448895	t
448991	INDIRECT	9	\N	448515	\N	108	448895	t
448990	INDIRECT	9	\N	448515	\N	2626	448980	t
448992	INDIRECT	9	448788	\N	\N	108	448895	t
448993	INDIRECT	9	448788	\N	\N	2626	448980	t
448995	INDIRECT	9	\N	448516	\N	2626	448980	t
448994	INDIRECT	9	\N	448516	\N	108	448895	t
448997	INDIRECT	9	448789	\N	\N	108	448895	t
448996	INDIRECT	9	448789	\N	\N	2626	448980	t
448998	INDIRECT	9	\N	448517	\N	2626	448980	t
448999	INDIRECT	9	\N	448517	\N	108	448895	t
449001	INDIRECT	9	448790	\N	\N	108	448895	t
449000	INDIRECT	9	448790	\N	\N	2626	448980	t
449002	INDIRECT	9	\N	448518	\N	2626	448980	t
449003	INDIRECT	9	\N	448518	\N	108	448895	t
449005	INDIRECT	9	448791	\N	\N	2626	448980	t
449004	INDIRECT	9	448791	\N	\N	108	448895	t
449007	INDIRECT	9	\N	448519	\N	2626	448980	t
449006	INDIRECT	9	\N	448519	\N	108	448895	t
449020	INDIRECT	9	448795	\N	\N	2626	448980	t
449021	INDIRECT	9	448795	\N	\N	108	448895	t
449023	INDIRECT	9	\N	448523	\N	108	448895	t
449024	INDIRECT	9	\N	448524	\N	108	448895	t
449025	INDIRECT	9	\N	448524	\N	300578	449022	t
449027	INDIRECT	9	448796	\N	\N	300578	449022	t
449026	INDIRECT	9	448796	\N	\N	108	448895	t
449028	INDIRECT	9	\N	448525	\N	108	448895	t
449029	INDIRECT	9	\N	448525	\N	300578	449022	t
449031	INDIRECT	9	448797	\N	\N	108	448895	t
449030	INDIRECT	9	448797	\N	\N	300578	449022	t
449032	INDIRECT	9	\N	448526	\N	108	448895	t
449033	INDIRECT	9	\N	448526	\N	300578	449022	t
449034	INDIRECT	9	448798	\N	\N	108	448895	t
449035	INDIRECT	9	448798	\N	\N	300578	449022	t
450085	INDIRECT	8	\N	449720	\N	108	448895	t
450087	INDIRECT	8	\N	449721	\N	300576	450086	t
450088	INDIRECT	8	\N	449721	\N	108	448895	t
450090	INDIRECT	8	\N	449722	\N	108	448895	t
450091	INDIRECT	8	\N	449722	\N	300576	450086	t
450093	INDIRECT	8	\N	449723	\N	108	448895	t
450094	INDIRECT	8	\N	449723	\N	300576	450086	t
450096	INDIRECT	8	\N	449724	\N	108	448895	t
450097	INDIRECT	8	\N	449724	\N	300576	450086	t
450099	INDIRECT	8	\N	449725	\N	108	448895	t
450100	INDIRECT	8	\N	449725	\N	300576	450086	t
450102	INDIRECT	8	\N	449726	\N	108	448895	t
450103	INDIRECT	8	\N	449726	\N	300576	450086	t
450106	INDIRECT	8	\N	449727	\N	300576	450086	t
450117	DIRECT	8	\N	449731	\N	300577	\N	\N
448903	INDIRECT	9	\N	448492	\N	107	448896	t
448902	INDIRECT	9	\N	448492	\N	108	448895	t
448905	INDIRECT	10	448767	\N	\N	107	448896	t
448904	INDIRECT	10	448767	\N	\N	108	448895	t
448906	INDIRECT	9	\N	448493	\N	107	448896	t
448907	INDIRECT	9	\N	448493	\N	108	448895	t
448909	INDIRECT	10	448768	\N	\N	107	448896	t
448908	INDIRECT	10	448768	\N	\N	108	448895	t
448910	INDIRECT	9	\N	448494	\N	108	448895	t
448911	INDIRECT	9	\N	448494	\N	107	448896	t
448897	INDIRECT	9	\N	448490	\N	108	448895	t
448896	DIRECT	9	\N	448490	\N	107	\N	\N
448899	INDIRECT	9	\N	448491	\N	107	448896	t
448913	INDIRECT	10	448769	\N	\N	107	448896	t
448912	INDIRECT	10	448769	\N	\N	108	448895	t
448915	INDIRECT	9	\N	448495	\N	108	448895	t
448914	INDIRECT	9	\N	448495	\N	107	448896	t
448898	INDIRECT	9	\N	448491	\N	108	448895	t
448901	INDIRECT	10	448766	\N	\N	108	448895	t
448916	INDIRECT	10	448770	\N	\N	107	448896	t
448917	INDIRECT	10	448770	\N	\N	108	448895	t
448900	INDIRECT	10	448766	\N	\N	107	448896	t
448919	INDIRECT	9	\N	448496	\N	107	448896	t
448918	INDIRECT	9	\N	448496	\N	108	448895	t
448947	INDIRECT	9	448777	\N	\N	105	448938	t
448946	INDIRECT	9	448777	\N	\N	108	448895	t
448949	INDIRECT	9	\N	448504	\N	108	448895	t
448948	INDIRECT	9	\N	448504	\N	105	448938	t
448951	INDIRECT	9	448778	\N	\N	105	448938	t
448950	INDIRECT	9	448778	\N	\N	108	448895	t
448952	INDIRECT	9	\N	448505	\N	108	448895	t
448953	INDIRECT	9	\N	448505	\N	105	448938	t
448954	INDIRECT	9	448779	\N	\N	108	448895	t
448955	INDIRECT	9	448779	\N	\N	105	448938	t
448956	INDIRECT	9	\N	448506	\N	108	448895	t
448957	INDIRECT	9	\N	448506	\N	105	448938	t
448959	INDIRECT	9	448780	\N	\N	108	448895	t
448958	INDIRECT	9	448780	\N	\N	105	448938	t
448960	INDIRECT	9	\N	448507	\N	108	448895	t
448961	INDIRECT	9	\N	448507	\N	105	448938	t
448963	INDIRECT	9	448781	\N	\N	108	448895	t
448962	INDIRECT	9	448781	\N	\N	105	448938	t
448964	INDIRECT	9	\N	448508	\N	108	448895	t
448965	INDIRECT	9	\N	448508	\N	105	448938	t
448966	INDIRECT	9	448782	\N	\N	108	448895	t
448967	INDIRECT	9	448782	\N	\N	105	448938	t
448968	INDIRECT	9	\N	448509	\N	108	448895	t
448980	DIRECT	9	\N	448512	\N	2626	\N	\N
449052	INDIRECT	9	\N	448531	\N	300578	449022	t
449055	INDIRECT	9	448803	\N	\N	108	448895	t
449054	INDIRECT	9	448803	\N	\N	300578	449022	t
449057	INDIRECT	9	\N	448532	\N	108	448895	t
449056	INDIRECT	9	\N	448532	\N	300578	449022	t
449058	INDIRECT	9	448804	\N	\N	108	448895	t
449059	INDIRECT	9	448804	\N	\N	300578	449022	t
449060	INDIRECT	9	\N	448533	\N	108	448895	t
449061	INDIRECT	9	\N	448533	\N	300578	449022	t
449062	INDIRECT	9	448805	\N	\N	108	448895	t
449063	INDIRECT	9	448805	\N	\N	300578	449022	t
449037	INDIRECT	9	\N	448527	\N	300578	449022	t
449036	INDIRECT	9	\N	448527	\N	108	448895	t
449038	INDIRECT	9	448799	\N	\N	300578	449022	t
449039	INDIRECT	9	448799	\N	\N	108	448895	t
449040	INDIRECT	9	\N	448528	\N	108	448895	t
449041	INDIRECT	9	\N	448528	\N	300578	449022	t
449042	INDIRECT	9	448800	\N	\N	300578	449022	t
449043	INDIRECT	9	448800	\N	\N	108	448895	t
449045	INDIRECT	9	\N	448529	\N	108	448895	t
449044	INDIRECT	9	\N	448529	\N	300578	449022	t
449047	INDIRECT	9	448801	\N	\N	108	448895	t
449046	INDIRECT	9	448801	\N	\N	300578	449022	t
449048	INDIRECT	9	\N	448530	\N	108	448895	t
449049	INDIRECT	9	\N	448530	\N	300578	449022	t
449050	INDIRECT	9	448802	\N	\N	108	448895	t
449051	INDIRECT	9	448802	\N	\N	300578	449022	t
449053	INDIRECT	9	\N	448531	\N	108	448895	t
456639	DIRECT	6	\N	456378	\N	105	\N	\N
451586	INDIRECT	5	451198	\N	\N	109	451339	t
451587	INDIRECT	5	451198	\N	\N	107	451344	t
448930	INDIRECT	9	\N	448499	\N	107	448896	t
448931	INDIRECT	9	\N	448499	\N	108	448895	t
448933	INDIRECT	10	448774	\N	\N	108	448895	t
448932	INDIRECT	10	448774	\N	\N	107	448896	t
448935	INDIRECT	9	\N	448500	\N	107	448896	t
448934	INDIRECT	9	\N	448500	\N	108	448895	t
448937	INDIRECT	10	448775	\N	\N	108	448895	t
448936	INDIRECT	10	448775	\N	\N	107	448896	t
448939	INDIRECT	9	\N	448501	\N	108	448895	t
448938	DIRECT	9	\N	448501	\N	105	\N	\N
448920	INDIRECT	10	448771	\N	\N	108	448895	t
448921	INDIRECT	10	448771	\N	\N	107	448896	t
448923	INDIRECT	9	\N	448497	\N	107	448896	t
448922	INDIRECT	9	\N	448497	\N	108	448895	t
448924	INDIRECT	10	448772	\N	\N	108	448895	t
448925	INDIRECT	10	448772	\N	\N	107	448896	t
448927	INDIRECT	9	\N	448498	\N	108	448895	t
448926	INDIRECT	9	\N	448498	\N	107	448896	t
448929	INDIRECT	10	448773	\N	\N	108	448895	t
448928	INDIRECT	10	448773	\N	\N	107	448896	t
448940	INDIRECT	9	\N	448502	\N	108	448895	t
448941	INDIRECT	9	\N	448502	\N	105	448938	t
448942	INDIRECT	9	448776	\N	\N	108	448895	t
456887	INDIRECT	6	\N	456418	\N	300576	456867	t
456886	INDIRECT	6	\N	456418	\N	109	451339	t
456889	INDIRECT	6	\N	456924	\N	300576	456867	t
456890	INDIRECT	6	\N	456924	\N	109	451339	t
456892	INDIRECT	6	\N	456925	\N	300576	456867	t
456893	INDIRECT	6	\N	456925	\N	109	451339	t
456896	INDIRECT	6	\N	456926	\N	109	451339	t
456895	INDIRECT	6	\N	456926	\N	300576	456867	t
456899	INDIRECT	6	\N	456927	\N	109	451339	t
456898	DIRECT	6	\N	456927	\N	300577	\N	\N
456900	INDIRECT	6	\N	456928	\N	109	451339	t
456901	INDIRECT	6	\N	456928	\N	300577	456898	t
456904	INDIRECT	6	\N	456929	\N	109	451339	t
456903	INDIRECT	6	\N	456929	\N	300577	456898	t
456907	INDIRECT	6	\N	456930	\N	300577	456898	t
456906	INDIRECT	6	\N	456930	\N	109	451339	t
456909	INDIRECT	6	\N	456931	\N	300577	456898	t
456910	INDIRECT	6	\N	456931	\N	109	451339	t
456913	INDIRECT	6	\N	456932	\N	109	451339	t
456912	INDIRECT	6	\N	456932	\N	300577	456898	t
456916	INDIRECT	6	\N	456933	\N	109	451339	t
456915	INDIRECT	6	\N	456933	\N	300577	456898	t
456918	INDIRECT	6	\N	456934	\N	300577	456898	t
456888	INDIRECT	4	456762	\N	\N	109	451339	t
456919	INDIRECT	6	\N	456934	\N	109	451339	t
456921	INDIRECT	6	\N	456935	\N	109	451339	t
456891	INDIRECT	4	456763	\N	\N	109	451339	t
456894	INDIRECT	4	456764	\N	\N	109	451339	t
456897	INDIRECT	4	456765	\N	\N	109	451339	t
456902	INDIRECT	4	456766	\N	\N	109	451339	t
456905	INDIRECT	4	456767	\N	\N	109	451339	t
456908	INDIRECT	4	456768	\N	\N	109	451339	t
456911	INDIRECT	4	456769	\N	\N	109	451339	t
456914	INDIRECT	4	456770	\N	\N	109	451339	t
456917	INDIRECT	4	456771	\N	\N	109	451339	t
456920	INDIRECT	4	456772	\N	\N	109	451339	t
456873	INDIRECT	4	456757	\N	\N	109	451339	t
456876	INDIRECT	4	456758	\N	\N	109	451339	t
456879	INDIRECT	4	456759	\N	\N	109	451339	t
456882	INDIRECT	4	456760	\N	\N	109	451339	t
456885	INDIRECT	4	456761	\N	\N	109	451339	t
456923	INDIRECT	4	456773	\N	\N	109	451339	t
457128	INDIRECT	4	456774	\N	\N	109	451339	t
457131	INDIRECT	4	456775	\N	\N	109	451339	t
458247	INDIRECT	3	457954	\N	\N	107	457931	t
458246	INDIRECT	3	457954	\N	\N	108	457926	t
458248	INDIRECT	3	\N	458048	\N	107	457931	t
458249	INDIRECT	3	\N	458048	\N	108	457926	t
458251	INDIRECT	3	457955	\N	\N	107	457931	t
458250	INDIRECT	3	457955	\N	\N	108	457926	t
458252	INDIRECT	3	\N	458049	\N	108	457926	t
458253	INDIRECT	3	\N	458049	\N	107	457931	t
458255	INDIRECT	3	457956	\N	\N	107	457931	t
458254	INDIRECT	3	457956	\N	\N	108	457926	t
458257	INDIRECT	3	\N	458050	\N	107	457931	t
458256	INDIRECT	3	\N	458050	\N	108	457926	t
458259	INDIRECT	3	457957	\N	\N	107	457931	t
458258	INDIRECT	3	457957	\N	\N	108	457926	t
458261	INDIRECT	3	\N	458051	\N	107	457931	t
458260	INDIRECT	3	\N	458051	\N	108	457926	t
458263	INDIRECT	3	457958	\N	\N	107	457931	t
458262	INDIRECT	3	457958	\N	\N	108	457926	t
458264	INDIRECT	3	\N	458052	\N	107	457931	t
458265	INDIRECT	3	\N	458052	\N	108	457926	t
458266	INDIRECT	3	457959	\N	\N	108	457926	t
458267	INDIRECT	3	457959	\N	\N	107	457931	t
458268	INDIRECT	3	\N	458053	\N	107	457931	t
458269	INDIRECT	3	\N	458053	\N	108	457926	t
458270	INDIRECT	3	457960	\N	\N	108	457926	t
458271	INDIRECT	3	457960	\N	\N	107	457931	t
458272	INDIRECT	3	\N	458054	\N	107	457931	t
458273	INDIRECT	3	\N	458054	\N	108	457926	t
458275	INDIRECT	3	457961	\N	\N	107	457931	t
458274	INDIRECT	3	457961	\N	\N	108	457926	t
456871	INDIRECT	6	\N	456413	\N	109	451339	t
456872	INDIRECT	6	\N	456413	\N	300576	456867	t
456874	INDIRECT	6	\N	456414	\N	109	451339	t
456875	INDIRECT	6	\N	456414	\N	300576	456867	t
456877	INDIRECT	6	\N	456415	\N	300576	456867	t
456878	INDIRECT	6	\N	456415	\N	109	451339	t
456881	INDIRECT	6	\N	456416	\N	300576	456867	t
456880	INDIRECT	6	\N	456416	\N	109	451339	t
456884	INDIRECT	6	\N	456417	\N	300576	456867	t
456883	INDIRECT	6	\N	456417	\N	109	451339	t
456922	INDIRECT	6	\N	456935	\N	300577	456898	t
457127	INDIRECT	6	\N	456936	\N	300577	456898	t
457126	INDIRECT	6	\N	456936	\N	109	451339	t
457130	INDIRECT	6	\N	456937	\N	300577	456898	t
457129	INDIRECT	6	\N	456937	\N	109	451339	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2437	2	esccor2-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	108	2026
2436	2	esccor2-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	2626	2026
300681	3	0ae4f672-e137-4e7d-ae67-1efe1eb1557c	2009-01-01 00:00:00	\N	f	300576	299975
300682	3	da1c2403-7eb5-41a6-9ec3-63a298fd31aa	2009-01-01 00:00:00	\N	f	109	299975
2438	2	esccor3-c2	2010-01-01 00:00:00	\N	f	108	2027
2439	2	esccor3-c1	2010-01-01 00:00:00	\N	f	2626	2027
1824	2	d6b041ca-84c7-4e07-a6e9-1dca7784960a	2009-01-01 00:00:00	\N	f	105	1623
1825	2	2b280a26-aa30-4457-a72a-fdefe98091ee	2009-01-01 00:00:00	\N	f	109	1623
1827	2	ad4624d0-9ca3-4f5a-9982-1869075446ae	2009-01-01 00:00:00	2010-12-31 00:00:00	f	109	1625
1826	2	5f3a3b0c-223b-4d9f-a38d-84be398d236b	2009-01-01 00:00:00	2010-12-31 00:00:00	f	105	1625
2427	2	escpon1-c1	2009-01-01 00:00:00	\N	f	2626	2021
2426	2	escpon1-c2	2009-01-01 00:00:00	\N	f	109	2021
2441	2	esccor4-c2	2010-01-01 00:00:00	\N	f	108	2028
2440	2	esccor4-c1	2010-01-01 00:00:00	\N	f	2626	2028
3137	2	pincor4-c2	2009-01-01 00:00:00	2010-12-31 00:00:00	f	108	2730
3138	2	pincor4-c1	2009-01-01 00:00:00	2010-12-31 00:00:00	f	105	2730
3139	2	solcor1-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	107	2731
3140	2	solcor1-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	108	2731
3141	2	solcor2-c1	2009-01-01 00:00:00	\N	f	107	2732
3142	2	solcor2-c2	2009-01-01 00:00:00	\N	f	108	2732
1831	2	e17af40b-a1d8-445d-918b-a5791f5c6577	2009-01-01 00:00:00	\N	f	107	1629
1830	2	5d5ee6cc-10f4-4d89-893d-568aa0f627a0	2009-01-01 00:00:00	\N	f	109	1629
1833	2	fa7198dc-47e4-40fc-89c5-309bce23497d	2010-01-01 00:00:00	\N	f	107	1631
1832	2	621ad988-f19c-4843-9756-b9f125e97819	2010-01-01 00:00:00	\N	f	109	1631
1835	2	23e67b60-9508-41a6-ba22-4a877b9a9b79	2010-07-01 00:00:00	\N	f	107	1633
1834	2	ab9d5be4-0d89-4efc-96a1-144d2c4f1b03	2010-07-01 00:00:00	\N	f	109	1633
1820	2	c09d65cf-9b86-4f09-8ac1-52f25d1288b6	2010-01-01 00:00:00	\N	f	109	1619
1821	2	21b9b92f-6209-4321-9672-600c5c93661a	2010-01-01 00:00:00	\N	f	105	1619
1822	2	a62d7acb-aedd-42f9-8b59-1a302ba83236	2010-07-01 00:00:00	\N	f	105	1621
1823	2	21f16db3-c723-4ca0-8045-1722cb0ad708	2010-07-01 00:00:00	\N	f	109	1621
3144	2	solcor3-c2	2010-01-01 00:00:00	\N	f	107	2733
3143	2	solcor3-c1	2010-01-01 00:00:00	\N	f	108	2733
1828	3	680d44b3-57f4-4c3b-b576-dc7609f2cedd	2009-01-01 00:00:00	2009-12-31 00:00:00	f	107	1627
1829	3	39d358f0-1460-4474-9e45-7bf39b69c125	2009-01-01 00:00:00	2009-12-31 00:00:00	f	109	1627
3134	2	pincor2-c1	2010-07-01 00:00:00	\N	f	105	2728
3133	2	pincor2-c2	2010-07-01 00:00:00	\N	f	108	2728
3131	2	pincor1-c2	2010-01-01 00:00:00	\N	f	105	2727
3132	2	pincor1-c1	2010-01-01 00:00:00	\N	f	108	2727
3135	2	pincor3-c2	2009-01-01 00:00:00	\N	f	105	2729
3136	2	pincor3-c1	2009-01-01 00:00:00	\N	f	108	2729
3146	2	solcor4-c1	2010-07-01 00:00:00	\N	f	108	2734
3145	2	solcor4-c2	2010-07-01 00:00:00	\N	f	107	2734
1818	4	6af403e8-5db6-4345-a6b3-554af44ab8c7	2010-01-12 00:00:00	\N	f	106	1617
1819	4	1fc00e6d-304e-459b-8fd2-42aa698f0489	2010-01-12 00:00:00	\N	f	109	1617
2424	2	cappon2-c2	2009-01-01 00:00:00	\N	f	109	2020
2425	2	cappon2-c1	2009-01-01 00:00:00	\N	f	106	2020
2442	2	capcor2-c2	2009-01-01 00:00:00	\N	f	108	2029
2443	2	capcor2-c1	2009-01-01 00:00:00	\N	f	106	2029
2434	2	esccor1-c1	2009-01-01 00:00:00	\N	f	2626	2025
2435	2	esccor1-c2	2009-01-01 00:00:00	\N	f	108	2025
2429	2	escpon2-c1	2009-01-01 00:00:00	2009-12-31 00:00:00	f	2626	2022
2428	2	escpon2-c2	2009-01-01 00:00:00	2009-12-31 00:00:00	f	109	2022
2430	2	escpon3-c2	2010-01-01 00:00:00	\N	f	109	2023
2431	2	escpon3-c1	2010-01-01 00:00:00	\N	f	2626	2023
2432	2	escpon4-c2	2010-01-01 00:00:00	\N	f	109	2024
2433	2	escpon4-c1	2010-01-01 00:00:00	\N	f	2626	2024
300680	3	ea440e04-8cd6-4759-af68-a9fbc87b3ba6	2009-01-01 00:00:00	\N	f	108	299973
300679	3	5f3c66ec-09bd-4a2a-aae0-f73de88f8ef9	2009-01-01 00:00:00	\N	f	300576	299973
300685	3	fee99f10-2d38-449b-91b4-53bf9798f4ff	2009-01-01 00:00:00	\N	f	300577	299979
300686	3	83cabb72-183e-4d80-b53e-967f0495ab8f	2009-01-01 00:00:00	\N	f	108	299979
300683	3	17ac2687-4864-49d7-958d-2d1b78d0d2cf	2009-01-01 00:00:00	\N	f	109	299977
300684	3	53d9e583-9e9f-4a6d-88a7-810befae8045	2009-01-01 00:00:00	\N	f	300576	299977
300688	3	93cdf7e2-678a-4de1-84c0-bc17e9c6a408	2009-01-01 00:00:00	\N	f	300577	299981
300687	3	61e2756c-46d3-4b56-a1d4-96b51067aff4	2009-01-01 00:00:00	\N	f	108	299981
300690	3	9108901f-deb4-49f3-b763-65dd0c1cd4b7	2009-01-01 00:00:00	\N	f	300577	299983
300689	3	6f926ed2-6cec-4325-a1cd-ae2186d7a04a	2009-01-01 00:00:00	\N	f	109	299983
300691	3	f59e40b9-2506-441e-ae20-8ca50e5b445d	2009-01-01 00:00:00	\N	f	109	299985
300692	3	cb785185-4826-4347-88a0-fe9ea9bdf97b	2009-01-01 00:00:00	\N	f	300577	299985
300678	2	4af75492-70e5-420b-8055-1b78c399f44d	2009-01-01 00:00:00	\N	f	300576	299971
300677	2	46e1be36-19e4-4552-b83a-b1c6444af6c3	2009-01-01 00:00:00	\N	f	108	299971
300693	2	c7205eb3-17a2-4feb-ae59-317320ac1ddf	2010-01-01 00:00:00	\N	f	108	299987
300694	2	f415f372-f67e-4c39-93d5-6b434650ebec	2010-01-01 00:00:00	\N	f	300578	299987
300696	2	a234790d-fd42-47ba-adcf-fa6e91690e9a	2009-01-01 00:00:00	\N	f	300578	299989
300695	2	e7e85d38-aadb-4adf-8f0e-a889af0b230a	2009-01-01 00:00:00	\N	f	108	299989
300697	2	247f477e-95c4-4a2a-b59f-59bc0ea7950f	2009-01-01 00:00:00	\N	f	300578	299991
300698	2	466d0042-5bb5-431e-bdd0-12ab35ff403a	2009-01-01 00:00:00	\N	f	109	299991
300699	2	c56dfb24-dc5a-4a1d-9b14-3817ddde7aed	2010-01-01 00:00:00	\N	f	300578	299993
300700	2	009da056-cfa9-4ff4-b811-ef358e29d2e4	2010-01-01 00:00:00	\N	f	109	299993
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
1	15	b65ae3c8-46dd-4272-8229-48e18d2f1d94	LEAVE	Leave	f	f	t	f	1
2	11	c6caaf5f-c991-49c0-a6d0-df60a8b626a4	CATEGORY	Professional category	t	t	t	f	1
3	9	2a491f98-9502-4231-9173-dc72bdd722b7	TRAINING	Training courses and labor training	t	t	t	f	1
5	5	d90a5adf-d687-4279-9f51-1df8b2c816a4	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
6	2	ef4d832a-f4b0-47c3-84ea-06fd7f5ebb24	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
97484800	1	3d8d188d-17c9-406c-8fc3-49bb9ec42d1e	MACHINE	\N	t	t	t	t	2
4	10	4974aafc-0893-4737-b466-e5af8994fcac	JOB	Job	t	t	t	f	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_container_id, generic_container_id, derived_container_id) FROM stdin;
461398	GENERIC_DAY	2	3	f	2011-04-15	2732	\N	461073	\N
461804	GENERIC_DAY	2	3	f	2011-05-16	2734	\N	461082	\N
461805	GENERIC_DAY	2	2	f	2011-05-25	2732	\N	461082	\N
461399	GENERIC_DAY	2	2	f	2011-04-12	2734	\N	461073	\N
461400	GENERIC_DAY	2	3	f	2011-04-12	2733	\N	461073	\N
461401	GENERIC_DAY	2	0	f	2011-04-09	2732	\N	461073	\N
461402	GENERIC_DAY	2	3	f	2011-04-04	2732	\N	461073	\N
461403	GENERIC_DAY	2	2	f	2011-04-04	2734	\N	461073	\N
461404	GENERIC_DAY	2	3	f	2011-04-14	2732	\N	461073	\N
461405	GENERIC_DAY	2	2	f	2011-04-13	2734	\N	461073	\N
461406	GENERIC_DAY	2	3	f	2011-04-11	2733	\N	461073	\N
461407	GENERIC_DAY	2	3	f	2011-04-13	2732	\N	461073	\N
461408	GENERIC_DAY	2	2	f	2011-04-15	2734	\N	461073	\N
461409	GENERIC_DAY	2	3	f	2011-04-07	2732	\N	461073	\N
461410	GENERIC_DAY	2	2	f	2011-04-05	2734	\N	461073	\N
461411	GENERIC_DAY	2	3	f	2011-04-08	2732	\N	461073	\N
461412	GENERIC_DAY	2	1	f	2011-04-19	2733	\N	461073	\N
461413	GENERIC_DAY	2	2	f	2011-04-14	2734	\N	461073	\N
461414	GENERIC_DAY	2	0	f	2011-04-02	2734	\N	461073	\N
461415	GENERIC_DAY	2	0	f	2011-04-09	2734	\N	461073	\N
461416	GENERIC_DAY	2	0	f	2011-04-03	2732	\N	461073	\N
461417	GENERIC_DAY	2	2	f	2011-04-01	2734	\N	461073	\N
461418	GENERIC_DAY	2	3	f	2011-04-13	2733	\N	461073	\N
461419	GENERIC_DAY	2	3	f	2011-04-01	2732	\N	461073	\N
461420	GENERIC_DAY	2	3	f	2011-04-01	2733	\N	461073	\N
481067	GENERIC_DAY	1	8	f	2011-06-10	299987	\N	479487	\N
481068	GENERIC_DAY	1	0	f	2011-06-12	299987	\N	479487	\N
481069	GENERIC_DAY	1	2	f	2011-06-15	299989	\N	479487	\N
481070	GENERIC_DAY	1	8	f	2011-06-08	299987	\N	479487	\N
481071	GENERIC_DAY	1	8	f	2011-06-08	299989	\N	479487	\N
481072	GENERIC_DAY	1	8	f	2011-06-13	299987	\N	479487	\N
481073	GENERIC_DAY	1	0	f	2011-06-11	299987	\N	479487	\N
481074	GENERIC_DAY	1	8	f	2011-06-13	299989	\N	479487	\N
481075	GENERIC_DAY	1	0	f	2011-06-11	299989	\N	479487	\N
481076	GENERIC_DAY	1	0	f	2011-06-19	299987	\N	479488	\N
481077	GENERIC_DAY	1	0	f	2011-06-19	299989	\N	479488	\N
481078	GENERIC_DAY	1	8	f	2011-06-17	299987	\N	479488	\N
481079	GENERIC_DAY	1	8	f	2011-06-20	299989	\N	479488	\N
481080	GENERIC_DAY	1	0	f	2011-06-18	299987	\N	479488	\N
481081	GENERIC_DAY	1	8	f	2011-06-22	299987	\N	479488	\N
481082	GENERIC_DAY	1	8	f	2011-06-23	299989	\N	479488	\N
481083	GENERIC_DAY	1	8	f	2011-06-22	299989	\N	479488	\N
481084	GENERIC_DAY	1	2	f	2011-06-24	299987	\N	479488	\N
481085	GENERIC_DAY	1	2	f	2011-06-24	299989	\N	479488	\N
481086	GENERIC_DAY	1	8	f	2011-06-23	299987	\N	479488	\N
481087	GENERIC_DAY	1	8	f	2011-06-21	299989	\N	479488	\N
481088	GENERIC_DAY	1	0	f	2011-06-18	299989	\N	479488	\N
481089	GENERIC_DAY	1	8	f	2011-06-17	299989	\N	479488	\N
481090	GENERIC_DAY	1	8	f	2011-06-21	299987	\N	479488	\N
481091	GENERIC_DAY	1	8	f	2011-06-16	299989	\N	479488	\N
481092	GENERIC_DAY	1	8	f	2011-06-16	299987	\N	479488	\N
481093	GENERIC_DAY	1	8	f	2011-06-20	299987	\N	479488	\N
481094	GENERIC_DAY	1	8	f	2011-06-29	299987	\N	479489	\N
481095	GENERIC_DAY	1	8	f	2011-06-27	299987	\N	479489	\N
481096	GENERIC_DAY	1	8	f	2011-07-01	299989	\N	479489	\N
481097	GENERIC_DAY	1	8	f	2011-06-29	299989	\N	479489	\N
481098	GENERIC_DAY	1	0	f	2011-07-02	299989	\N	479489	\N
479842	GENERIC_DAY	1	16	f	2011-05-02	2029	\N	479459	\N
479843	GENERIC_DAY	1	16	f	2011-05-24	2029	\N	479459	\N
479844	GENERIC_DAY	1	16	f	2011-04-21	2029	\N	479459	\N
479845	GENERIC_DAY	1	0	f	2011-06-19	2029	\N	479459	\N
479846	GENERIC_DAY	1	16	f	2011-04-28	2029	\N	479459	\N
479847	GENERIC_DAY	1	16	f	2011-04-14	2029	\N	479459	\N
479848	GENERIC_DAY	1	16	f	2011-05-20	2029	\N	479459	\N
479849	GENERIC_DAY	1	0	f	2011-06-11	2029	\N	479459	\N
479850	GENERIC_DAY	1	16	f	2011-06-20	2029	\N	479459	\N
479851	GENERIC_DAY	1	16	f	2011-05-05	2029	\N	479459	\N
479852	GENERIC_DAY	1	16	f	2011-06-07	2029	\N	479459	\N
479853	GENERIC_DAY	1	16	f	2011-05-12	2029	\N	479459	\N
479854	GENERIC_DAY	1	16	f	2011-04-01	2029	\N	479459	\N
479855	GENERIC_DAY	1	16	f	2011-05-25	2029	\N	479459	\N
479856	GENERIC_DAY	1	16	f	2011-05-04	2029	\N	479459	\N
479857	GENERIC_DAY	1	0	f	2011-06-25	2029	\N	479459	\N
479858	GENERIC_DAY	1	0	f	2011-04-10	2029	\N	479459	\N
479859	GENERIC_DAY	1	16	f	2011-04-19	2029	\N	479459	\N
479860	GENERIC_DAY	1	0	f	2011-06-26	2029	\N	479459	\N
479861	GENERIC_DAY	1	0	f	2011-05-21	2029	\N	479459	\N
479862	GENERIC_DAY	1	0	f	2011-04-03	2029	\N	479459	\N
479863	GENERIC_DAY	1	0	f	2011-05-29	2029	\N	479459	\N
479864	GENERIC_DAY	1	0	f	2011-04-23	2029	\N	479459	\N
479865	GENERIC_DAY	1	16	f	2011-06-01	2029	\N	479459	\N
479866	GENERIC_DAY	1	16	f	2011-05-09	2029	\N	479459	\N
479867	GENERIC_DAY	1	0	f	2011-05-01	2029	\N	479459	\N
479868	GENERIC_DAY	1	16	f	2011-06-13	2029	\N	479459	\N
479869	GENERIC_DAY	1	16	f	2011-05-31	2029	\N	479459	\N
479870	GENERIC_DAY	1	16	f	2011-04-08	2029	\N	479459	\N
479871	GENERIC_DAY	1	16	f	2011-05-16	2029	\N	479459	\N
479872	GENERIC_DAY	1	0	f	2011-04-30	2029	\N	479459	\N
479873	GENERIC_DAY	1	16	f	2011-05-27	2029	\N	479459	\N
479874	GENERIC_DAY	1	16	f	2011-05-30	2029	\N	479459	\N
479875	GENERIC_DAY	1	16	f	2011-05-03	2029	\N	479459	\N
479876	GENERIC_DAY	1	16	f	2011-04-13	2029	\N	479459	\N
479877	GENERIC_DAY	1	0	f	2011-06-12	2029	\N	479459	\N
479878	GENERIC_DAY	1	16	f	2011-06-27	2029	\N	479459	\N
479879	GENERIC_DAY	1	16	f	2011-04-07	2029	\N	479459	\N
479880	GENERIC_DAY	1	16	f	2011-04-29	2029	\N	479459	\N
479881	GENERIC_DAY	1	0	f	2011-05-14	2029	\N	479459	\N
479882	GENERIC_DAY	1	0	f	2011-05-22	2029	\N	479459	\N
479883	GENERIC_DAY	1	16	f	2011-05-18	2029	\N	479459	\N
479884	GENERIC_DAY	1	16	f	2011-05-10	2029	\N	479459	\N
479885	GENERIC_DAY	1	8	f	2011-06-28	2029	\N	479459	\N
479886	GENERIC_DAY	1	16	f	2011-06-22	2029	\N	479459	\N
479887	GENERIC_DAY	1	16	f	2011-05-19	2029	\N	479459	\N
479888	GENERIC_DAY	1	16	f	2011-06-21	2029	\N	479459	\N
479889	GENERIC_DAY	1	16	f	2011-04-12	2029	\N	479459	\N
479890	GENERIC_DAY	1	16	f	2011-06-16	2029	\N	479459	\N
479891	GENERIC_DAY	1	0	f	2011-04-16	2029	\N	479459	\N
479892	GENERIC_DAY	1	16	f	2011-06-09	2029	\N	479459	\N
479893	GENERIC_DAY	1	16	f	2011-06-15	2029	\N	479459	\N
479894	GENERIC_DAY	1	0	f	2011-05-08	2029	\N	479459	\N
479895	GENERIC_DAY	1	16	f	2011-04-27	2029	\N	479459	\N
479896	GENERIC_DAY	1	16	f	2011-06-10	2029	\N	479459	\N
479897	GENERIC_DAY	1	16	f	2011-06-23	2029	\N	479459	\N
479898	GENERIC_DAY	1	16	f	2011-05-17	2029	\N	479459	\N
479899	GENERIC_DAY	1	16	f	2011-06-17	2029	\N	479459	\N
479900	GENERIC_DAY	1	0	f	2011-04-02	2029	\N	479459	\N
479901	GENERIC_DAY	1	16	f	2011-06-08	2029	\N	479459	\N
479902	GENERIC_DAY	1	16	f	2011-04-20	2029	\N	479459	\N
479903	GENERIC_DAY	1	0	f	2011-06-05	2029	\N	479459	\N
479904	GENERIC_DAY	1	16	f	2011-06-14	2029	\N	479459	\N
479905	GENERIC_DAY	1	16	f	2011-06-06	2029	\N	479459	\N
479906	GENERIC_DAY	1	16	f	2011-04-11	2029	\N	479459	\N
479907	GENERIC_DAY	1	16	f	2011-06-02	2029	\N	479459	\N
479908	GENERIC_DAY	1	16	f	2011-05-23	2029	\N	479459	\N
479909	GENERIC_DAY	1	0	f	2011-04-09	2029	\N	479459	\N
479910	GENERIC_DAY	1	0	f	2011-06-04	2029	\N	479459	\N
479911	GENERIC_DAY	1	16	f	2011-06-03	2029	\N	479459	\N
479912	GENERIC_DAY	1	16	f	2011-04-15	2029	\N	479459	\N
479913	GENERIC_DAY	1	0	f	2011-04-17	2029	\N	479459	\N
479914	GENERIC_DAY	1	16	f	2011-05-11	2029	\N	479459	\N
479915	GENERIC_DAY	1	16	f	2011-04-18	2029	\N	479459	\N
479916	GENERIC_DAY	1	0	f	2011-05-28	2029	\N	479459	\N
479917	GENERIC_DAY	1	16	f	2011-04-06	2029	\N	479459	\N
479918	GENERIC_DAY	1	0	f	2011-05-07	2029	\N	479459	\N
479919	GENERIC_DAY	1	16	f	2011-05-06	2029	\N	479459	\N
479920	GENERIC_DAY	1	16	f	2011-06-24	2029	\N	479459	\N
479921	GENERIC_DAY	1	16	f	2011-04-05	2029	\N	479459	\N
479922	GENERIC_DAY	1	0	f	2011-04-24	2029	\N	479459	\N
479923	GENERIC_DAY	1	0	f	2011-06-18	2029	\N	479459	\N
479924	GENERIC_DAY	1	16	f	2011-04-25	2029	\N	479459	\N
479925	GENERIC_DAY	1	16	f	2011-05-26	2029	\N	479459	\N
479926	GENERIC_DAY	1	16	f	2011-04-04	2029	\N	479459	\N
479927	GENERIC_DAY	1	16	f	2011-04-22	2029	\N	479459	\N
479928	GENERIC_DAY	1	16	f	2011-05-13	2029	\N	479459	\N
479929	GENERIC_DAY	1	0	f	2011-05-15	2029	\N	479459	\N
479930	GENERIC_DAY	1	16	f	2011-04-26	2029	\N	479459	\N
461421	GENERIC_DAY	2	0	f	2011-04-17	2733	\N	461073	\N
461422	GENERIC_DAY	2	0	f	2011-04-17	2732	\N	461073	\N
461423	GENERIC_DAY	2	0	f	2011-04-09	2733	\N	461073	\N
461424	GENERIC_DAY	2	2	f	2011-04-08	2734	\N	461073	\N
461425	GENERIC_DAY	2	2	f	2011-04-11	2734	\N	461073	\N
461426	GENERIC_DAY	2	3	f	2011-04-18	2732	\N	461073	\N
461427	GENERIC_DAY	2	2	f	2011-04-19	2732	\N	461073	\N
461428	GENERIC_DAY	2	0	f	2011-04-16	2734	\N	461073	\N
461429	GENERIC_DAY	2	3	f	2011-04-11	2732	\N	461073	\N
461430	GENERIC_DAY	2	0	f	2011-04-16	2732	\N	461073	\N
461431	GENERIC_DAY	2	0	f	2011-04-10	2734	\N	461073	\N
461432	GENERIC_DAY	2	0	f	2011-04-10	2732	\N	461073	\N
461433	GENERIC_DAY	2	0	f	2011-04-16	2733	\N	461073	\N
461434	GENERIC_DAY	2	0	f	2011-04-02	2732	\N	461073	\N
461435	GENERIC_DAY	2	1	f	2011-04-19	2734	\N	461073	\N
461436	GENERIC_DAY	2	0	f	2011-04-10	2733	\N	461073	\N
461437	GENERIC_DAY	2	0	f	2011-04-03	2734	\N	461073	\N
461438	GENERIC_DAY	2	2	f	2011-04-06	2734	\N	461073	\N
461439	GENERIC_DAY	2	3	f	2011-04-07	2733	\N	461073	\N
461440	GENERIC_DAY	2	0	f	2011-04-03	2733	\N	461073	\N
461441	GENERIC_DAY	2	3	f	2011-04-06	2733	\N	461073	\N
461442	GENERIC_DAY	2	3	f	2011-04-05	2733	\N	461073	\N
461443	GENERIC_DAY	2	3	f	2011-04-14	2733	\N	461073	\N
461444	GENERIC_DAY	2	3	f	2011-04-04	2733	\N	461073	\N
461445	GENERIC_DAY	2	3	f	2011-04-08	2733	\N	461073	\N
461446	GENERIC_DAY	2	3	f	2011-04-05	2732	\N	461073	\N
461447	GENERIC_DAY	2	2	f	2011-04-18	2734	\N	461073	\N
461448	GENERIC_DAY	2	0	f	2011-04-02	2733	\N	461073	\N
461449	GENERIC_DAY	2	0	f	2011-04-17	2734	\N	461073	\N
461450	GENERIC_DAY	2	2	f	2011-04-07	2734	\N	461073	\N
461451	GENERIC_DAY	2	3	f	2011-04-12	2732	\N	461073	\N
461452	GENERIC_DAY	2	3	f	2011-04-18	2733	\N	461073	\N
461453	GENERIC_DAY	2	3	f	2011-04-06	2732	\N	461073	\N
461454	GENERIC_DAY	2	3	f	2011-04-15	2733	\N	461073	\N
461455	GENERIC_DAY	2	0	f	2011-04-10	2734	\N	461074	\N
461456	GENERIC_DAY	2	0	f	2011-04-02	2732	\N	461074	\N
461457	GENERIC_DAY	2	0	f	2011-04-09	2733	\N	461074	\N
461458	GENERIC_DAY	2	3	f	2011-04-12	2734	\N	461074	\N
461459	GENERIC_DAY	2	3	f	2011-04-08	2732	\N	461074	\N
461460	GENERIC_DAY	2	3	f	2011-04-05	2732	\N	461074	\N
461461	GENERIC_DAY	2	2	f	2011-04-13	2733	\N	461074	\N
461462	GENERIC_DAY	2	0	f	2011-04-02	2734	\N	461074	\N
461463	GENERIC_DAY	2	3	f	2011-04-13	2734	\N	461074	\N
461464	GENERIC_DAY	2	0	f	2011-04-17	2733	\N	461074	\N
461465	GENERIC_DAY	2	3	f	2011-04-08	2734	\N	461074	\N
461466	GENERIC_DAY	2	3	f	2011-04-11	2732	\N	461074	\N
461467	GENERIC_DAY	2	2	f	2011-04-01	2733	\N	461074	\N
461468	GENERIC_DAY	2	3	f	2011-04-18	2734	\N	461074	\N
461469	GENERIC_DAY	2	0	f	2011-04-16	2734	\N	461074	\N
461470	GENERIC_DAY	2	3	f	2011-04-11	2734	\N	461074	\N
461471	GENERIC_DAY	2	0	f	2011-04-17	2734	\N	461074	\N
461472	GENERIC_DAY	2	3	f	2011-04-06	2734	\N	461074	\N
461473	GENERIC_DAY	2	3	f	2011-04-12	2732	\N	461074	\N
461474	GENERIC_DAY	2	2	f	2011-04-19	2733	\N	461074	\N
461475	GENERIC_DAY	2	0	f	2011-04-16	2733	\N	461074	\N
461476	GENERIC_DAY	2	3	f	2011-04-15	2732	\N	461074	\N
461477	GENERIC_DAY	2	0	f	2011-04-10	2732	\N	461074	\N
461478	GENERIC_DAY	2	2	f	2011-04-14	2733	\N	461074	\N
461479	GENERIC_DAY	2	1	f	2011-04-19	2734	\N	461074	\N
461480	GENERIC_DAY	2	2	f	2011-04-06	2733	\N	461074	\N
461481	GENERIC_DAY	2	0	f	2011-04-09	2732	\N	461074	\N
461482	GENERIC_DAY	2	3	f	2011-04-13	2732	\N	461074	\N
461483	GENERIC_DAY	2	3	f	2011-04-04	2732	\N	461074	\N
461484	GENERIC_DAY	2	2	f	2011-04-11	2733	\N	461074	\N
461485	GENERIC_DAY	2	3	f	2011-04-18	2732	\N	461074	\N
461486	GENERIC_DAY	2	3	f	2011-04-07	2732	\N	461074	\N
461487	GENERIC_DAY	2	3	f	2011-04-14	2734	\N	461074	\N
461488	GENERIC_DAY	2	1	f	2011-04-19	2732	\N	461074	\N
461489	GENERIC_DAY	2	0	f	2011-04-03	2733	\N	461074	\N
461490	GENERIC_DAY	2	2	f	2011-04-12	2733	\N	461074	\N
461491	GENERIC_DAY	2	2	f	2011-04-15	2733	\N	461074	\N
461492	GENERIC_DAY	2	2	f	2011-04-08	2733	\N	461074	\N
461493	GENERIC_DAY	2	0	f	2011-04-02	2733	\N	461074	\N
461494	GENERIC_DAY	2	2	f	2011-04-07	2733	\N	461074	\N
461495	GENERIC_DAY	2	0	f	2011-04-03	2732	\N	461074	\N
461496	GENERIC_DAY	2	3	f	2011-04-14	2732	\N	461074	\N
461497	GENERIC_DAY	2	0	f	2011-04-03	2734	\N	461074	\N
461498	GENERIC_DAY	2	2	f	2011-04-18	2733	\N	461074	\N
461499	GENERIC_DAY	2	3	f	2011-04-01	2732	\N	461074	\N
461500	GENERIC_DAY	2	0	f	2011-04-10	2733	\N	461074	\N
461501	GENERIC_DAY	2	3	f	2011-04-01	2734	\N	461074	\N
461502	GENERIC_DAY	2	0	f	2011-04-16	2732	\N	461074	\N
461503	GENERIC_DAY	2	2	f	2011-04-04	2733	\N	461074	\N
461504	GENERIC_DAY	2	3	f	2011-04-15	2734	\N	461074	\N
461505	GENERIC_DAY	2	3	f	2011-04-04	2734	\N	461074	\N
461506	GENERIC_DAY	2	0	f	2011-04-09	2734	\N	461074	\N
461507	GENERIC_DAY	2	3	f	2011-04-05	2734	\N	461074	\N
461508	GENERIC_DAY	2	2	f	2011-04-05	2733	\N	461074	\N
461509	GENERIC_DAY	2	0	f	2011-04-17	2732	\N	461074	\N
461510	GENERIC_DAY	2	3	f	2011-04-06	2732	\N	461074	\N
461511	GENERIC_DAY	2	3	f	2011-04-07	2734	\N	461074	\N
461512	GENERIC_DAY	2	0	f	2011-04-09	2732	\N	461075	\N
461513	GENERIC_DAY	2	1	f	2011-04-19	2733	\N	461075	\N
461514	GENERIC_DAY	2	2	f	2011-04-14	2732	\N	461075	\N
461515	GENERIC_DAY	2	3	f	2011-04-18	2734	\N	461075	\N
461516	GENERIC_DAY	2	0	f	2011-04-16	2732	\N	461075	\N
461517	GENERIC_DAY	2	2	f	2011-04-19	2734	\N	461075	\N
461518	GENERIC_DAY	2	3	f	2011-04-14	2733	\N	461075	\N
461519	GENERIC_DAY	2	3	f	2011-04-08	2734	\N	461075	\N
461520	GENERIC_DAY	2	2	f	2011-04-01	2732	\N	461075	\N
461521	GENERIC_DAY	2	0	f	2011-04-10	2734	\N	461075	\N
461522	GENERIC_DAY	2	3	f	2011-04-15	2734	\N	461075	\N
461523	GENERIC_DAY	2	0	f	2011-04-16	2733	\N	461075	\N
461524	GENERIC_DAY	2	3	f	2011-04-07	2733	\N	461075	\N
461525	GENERIC_DAY	2	0	f	2011-04-10	2733	\N	461075	\N
461526	GENERIC_DAY	2	3	f	2011-04-01	2734	\N	461075	\N
461527	GENERIC_DAY	2	3	f	2011-04-07	2734	\N	461075	\N
461528	GENERIC_DAY	2	2	f	2011-04-05	2732	\N	461075	\N
461529	GENERIC_DAY	2	1	f	2011-04-19	2732	\N	461075	\N
461530	GENERIC_DAY	2	0	f	2011-04-09	2734	\N	461075	\N
461531	GENERIC_DAY	2	0	f	2011-04-16	2734	\N	461075	\N
461532	GENERIC_DAY	2	3	f	2011-04-11	2733	\N	461075	\N
461533	GENERIC_DAY	2	3	f	2011-04-08	2733	\N	461075	\N
461534	GENERIC_DAY	2	0	f	2011-04-02	2734	\N	461075	\N
461535	GENERIC_DAY	2	2	f	2011-04-06	2732	\N	461075	\N
461536	GENERIC_DAY	2	0	f	2011-04-10	2732	\N	461075	\N
461537	GENERIC_DAY	2	0	f	2011-04-17	2732	\N	461075	\N
461538	GENERIC_DAY	2	3	f	2011-04-13	2733	\N	461075	\N
461539	GENERIC_DAY	2	0	f	2011-04-03	2734	\N	461075	\N
461540	GENERIC_DAY	2	2	f	2011-04-15	2732	\N	461075	\N
461541	GENERIC_DAY	2	0	f	2011-04-17	2733	\N	461075	\N
461542	GENERIC_DAY	2	0	f	2011-04-09	2733	\N	461075	\N
461543	GENERIC_DAY	2	0	f	2011-04-02	2732	\N	461075	\N
461544	GENERIC_DAY	2	3	f	2011-04-18	2733	\N	461075	\N
461545	GENERIC_DAY	2	3	f	2011-04-12	2733	\N	461075	\N
461546	GENERIC_DAY	2	0	f	2011-04-17	2734	\N	461075	\N
461547	GENERIC_DAY	2	3	f	2011-04-05	2733	\N	461075	\N
461548	GENERIC_DAY	2	2	f	2011-04-04	2732	\N	461075	\N
461549	GENERIC_DAY	2	2	f	2011-04-11	2732	\N	461075	\N
461550	GENERIC_DAY	2	2	f	2011-04-13	2732	\N	461075	\N
461551	GENERIC_DAY	2	3	f	2011-04-15	2733	\N	461075	\N
461552	GENERIC_DAY	2	2	f	2011-04-08	2732	\N	461075	\N
461553	GENERIC_DAY	2	3	f	2011-04-12	2734	\N	461075	\N
461554	GENERIC_DAY	2	3	f	2011-04-11	2734	\N	461075	\N
461555	GENERIC_DAY	2	3	f	2011-04-14	2734	\N	461075	\N
461556	GENERIC_DAY	2	0	f	2011-04-03	2732	\N	461075	\N
461557	GENERIC_DAY	2	0	f	2011-04-02	2733	\N	461075	\N
461558	GENERIC_DAY	2	2	f	2011-04-07	2732	\N	461075	\N
461559	GENERIC_DAY	2	3	f	2011-04-01	2733	\N	461075	\N
461560	GENERIC_DAY	2	3	f	2011-04-06	2733	\N	461075	\N
461561	GENERIC_DAY	2	3	f	2011-04-13	2734	\N	461075	\N
461562	GENERIC_DAY	2	3	f	2011-04-06	2734	\N	461075	\N
461563	GENERIC_DAY	2	2	f	2011-04-18	2732	\N	461075	\N
461564	GENERIC_DAY	2	0	f	2011-04-03	2733	\N	461075	\N
461565	GENERIC_DAY	2	3	f	2011-04-04	2733	\N	461075	\N
461566	GENERIC_DAY	2	2	f	2011-04-12	2732	\N	461075	\N
461567	GENERIC_DAY	2	3	f	2011-04-05	2734	\N	461075	\N
461568	GENERIC_DAY	2	3	f	2011-04-04	2734	\N	461075	\N
461569	GENERIC_DAY	2	8	f	2011-04-21	2732	\N	461076	\N
461570	GENERIC_DAY	2	8	f	2011-04-20	2732	\N	461076	\N
461571	GENERIC_DAY	2	0	f	2011-04-23	2734	\N	461076	\N
461572	GENERIC_DAY	2	8	f	2011-04-25	2732	\N	461076	\N
461573	GENERIC_DAY	2	8	f	2011-04-25	2733	\N	461076	\N
461574	GENERIC_DAY	2	1	f	2011-04-26	2733	\N	461076	\N
461575	GENERIC_DAY	2	8	f	2011-04-20	2734	\N	461076	\N
461576	GENERIC_DAY	2	8	f	2011-04-21	2734	\N	461076	\N
461577	GENERIC_DAY	2	0	f	2011-04-23	2733	\N	461076	\N
461578	GENERIC_DAY	2	8	f	2011-04-22	2732	\N	461076	\N
461579	GENERIC_DAY	2	8	f	2011-04-22	2734	\N	461076	\N
461580	GENERIC_DAY	2	8	f	2011-04-21	2733	\N	461076	\N
461581	GENERIC_DAY	2	2	f	2011-04-26	2732	\N	461076	\N
461582	GENERIC_DAY	2	0	f	2011-04-24	2734	\N	461076	\N
461583	GENERIC_DAY	2	0	f	2011-04-23	2732	\N	461076	\N
461584	GENERIC_DAY	2	0	f	2011-04-24	2733	\N	461076	\N
461585	GENERIC_DAY	2	8	f	2011-04-25	2734	\N	461076	\N
461586	GENERIC_DAY	2	8	f	2011-04-22	2733	\N	461076	\N
461587	GENERIC_DAY	2	1	f	2011-04-26	2734	\N	461076	\N
461588	GENERIC_DAY	2	8	f	2011-04-20	2733	\N	461076	\N
461589	GENERIC_DAY	2	0	f	2011-04-24	2732	\N	461076	\N
461590	GENERIC_DAY	2	0	f	2011-04-30	2733	\N	461077	\N
461591	GENERIC_DAY	2	8	f	2011-04-27	2733	\N	461077	\N
461592	GENERIC_DAY	2	8	f	2011-04-27	2734	\N	461077	\N
461593	GENERIC_DAY	2	0	f	2011-05-01	2734	\N	461077	\N
461594	GENERIC_DAY	2	8	f	2011-04-29	2733	\N	461077	\N
461595	GENERIC_DAY	2	8	f	2011-05-02	2733	\N	461077	\N
461596	GENERIC_DAY	2	0	f	2011-05-01	2732	\N	461077	\N
461597	GENERIC_DAY	2	8	f	2011-04-29	2732	\N	461077	\N
461598	GENERIC_DAY	2	2	f	2011-05-03	2732	\N	461077	\N
461599	GENERIC_DAY	2	8	f	2011-05-02	2734	\N	461077	\N
461600	GENERIC_DAY	2	0	f	2011-05-01	2733	\N	461077	\N
461601	GENERIC_DAY	2	0	f	2011-04-30	2734	\N	461077	\N
461602	GENERIC_DAY	2	8	f	2011-04-29	2734	\N	461077	\N
461603	GENERIC_DAY	2	8	f	2011-05-02	2732	\N	461077	\N
461604	GENERIC_DAY	2	8	f	2011-04-28	2733	\N	461077	\N
461605	GENERIC_DAY	2	1	f	2011-05-03	2733	\N	461077	\N
461606	GENERIC_DAY	2	0	f	2011-04-30	2732	\N	461077	\N
461607	GENERIC_DAY	2	8	f	2011-04-28	2732	\N	461077	\N
461608	GENERIC_DAY	2	1	f	2011-05-03	2734	\N	461077	\N
461609	GENERIC_DAY	2	8	f	2011-04-27	2732	\N	461077	\N
461610	GENERIC_DAY	2	8	f	2011-04-28	2734	\N	461077	\N
461611	GENERIC_DAY	2	8	f	2011-05-04	2734	\N	461078	\N
461612	GENERIC_DAY	2	8	f	2011-05-05	2733	\N	461078	\N
461613	GENERIC_DAY	2	0	f	2011-05-08	2732	\N	461078	\N
461614	GENERIC_DAY	2	8	f	2011-05-05	2734	\N	461078	\N
461615	GENERIC_DAY	2	0	f	2011-05-07	2732	\N	461078	\N
461616	GENERIC_DAY	2	2	f	2011-05-10	2732	\N	461078	\N
461617	GENERIC_DAY	2	1	f	2011-05-10	2733	\N	461078	\N
461618	GENERIC_DAY	2	8	f	2011-05-09	2732	\N	461078	\N
461619	GENERIC_DAY	2	8	f	2011-05-04	2732	\N	461078	\N
461620	GENERIC_DAY	2	8	f	2011-05-06	2732	\N	461078	\N
461621	GENERIC_DAY	2	8	f	2011-05-06	2734	\N	461078	\N
461622	GENERIC_DAY	2	8	f	2011-05-09	2734	\N	461078	\N
461623	GENERIC_DAY	2	0	f	2011-05-08	2734	\N	461078	\N
461624	GENERIC_DAY	2	1	f	2011-05-10	2734	\N	461078	\N
461625	GENERIC_DAY	2	8	f	2011-05-04	2733	\N	461078	\N
461626	GENERIC_DAY	2	0	f	2011-05-08	2733	\N	461078	\N
461627	GENERIC_DAY	2	8	f	2011-05-06	2733	\N	461078	\N
461628	GENERIC_DAY	2	0	f	2011-05-07	2734	\N	461078	\N
461629	GENERIC_DAY	2	0	f	2011-05-07	2733	\N	461078	\N
461630	GENERIC_DAY	2	8	f	2011-05-09	2733	\N	461078	\N
461631	GENERIC_DAY	2	8	f	2011-05-05	2732	\N	461078	\N
461632	GENERIC_DAY	2	2	f	2011-05-27	2734	\N	461079	\N
461633	GENERIC_DAY	2	3	f	2011-05-26	2733	\N	461079	\N
461634	GENERIC_DAY	2	0	f	2011-05-15	2734	\N	461079	\N
461635	GENERIC_DAY	2	2	f	2011-05-19	2732	\N	461079	\N
461636	GENERIC_DAY	2	3	f	2011-05-12	2734	\N	461079	\N
461637	GENERIC_DAY	2	3	f	2011-05-24	2733	\N	461079	\N
461638	GENERIC_DAY	2	0	f	2011-05-15	2732	\N	461079	\N
461639	GENERIC_DAY	2	0	f	2011-05-22	2732	\N	461079	\N
461640	GENERIC_DAY	2	3	f	2011-05-26	2734	\N	461079	\N
461641	GENERIC_DAY	2	3	f	2011-05-18	2734	\N	461079	\N
461642	GENERIC_DAY	2	3	f	2011-05-17	2733	\N	461079	\N
461643	GENERIC_DAY	2	0	f	2011-05-15	2733	\N	461079	\N
461644	GENERIC_DAY	2	3	f	2011-05-12	2733	\N	461079	\N
461645	GENERIC_DAY	2	3	f	2011-05-17	2734	\N	461079	\N
461646	GENERIC_DAY	2	2	f	2011-05-25	2732	\N	461079	\N
461647	GENERIC_DAY	2	0	f	2011-05-14	2733	\N	461079	\N
461648	GENERIC_DAY	2	3	f	2011-05-20	2734	\N	461079	\N
461649	GENERIC_DAY	2	2	f	2011-05-12	2732	\N	461079	\N
461650	GENERIC_DAY	2	3	f	2011-05-16	2733	\N	461079	\N
461651	GENERIC_DAY	2	3	f	2011-05-19	2734	\N	461079	\N
461652	GENERIC_DAY	2	3	f	2011-05-25	2734	\N	461079	\N
461653	GENERIC_DAY	2	0	f	2011-05-21	2733	\N	461079	\N
461654	GENERIC_DAY	2	2	f	2011-05-24	2732	\N	461079	\N
461655	GENERIC_DAY	2	3	f	2011-05-25	2733	\N	461079	\N
461656	GENERIC_DAY	2	3	f	2011-05-23	2733	\N	461079	\N
461657	GENERIC_DAY	2	3	f	2011-05-24	2734	\N	461079	\N
461658	GENERIC_DAY	2	3	f	2011-05-13	2733	\N	461079	\N
461659	GENERIC_DAY	2	3	f	2011-05-23	2734	\N	461079	\N
461660	GENERIC_DAY	2	0	f	2011-05-22	2733	\N	461079	\N
461661	GENERIC_DAY	2	0	f	2011-05-14	2734	\N	461079	\N
461662	GENERIC_DAY	2	3	f	2011-05-18	2733	\N	461079	\N
461663	GENERIC_DAY	2	3	f	2011-05-20	2733	\N	461079	\N
461664	GENERIC_DAY	2	1	f	2011-05-27	2733	\N	461079	\N
461665	GENERIC_DAY	2	3	f	2011-05-11	2733	\N	461079	\N
461666	GENERIC_DAY	2	2	f	2011-05-18	2732	\N	461079	\N
461667	GENERIC_DAY	2	0	f	2011-05-21	2734	\N	461079	\N
461668	GENERIC_DAY	2	3	f	2011-05-11	2734	\N	461079	\N
461669	GENERIC_DAY	2	0	f	2011-05-22	2734	\N	461079	\N
461670	GENERIC_DAY	2	3	f	2011-05-13	2734	\N	461079	\N
461671	GENERIC_DAY	2	1	f	2011-05-27	2732	\N	461079	\N
461672	GENERIC_DAY	2	2	f	2011-05-11	2732	\N	461079	\N
461673	GENERIC_DAY	2	2	f	2011-05-17	2732	\N	461079	\N
461674	GENERIC_DAY	2	2	f	2011-05-23	2732	\N	461079	\N
461675	GENERIC_DAY	2	3	f	2011-05-19	2733	\N	461079	\N
461676	GENERIC_DAY	2	2	f	2011-05-20	2732	\N	461079	\N
461677	GENERIC_DAY	2	2	f	2011-05-13	2732	\N	461079	\N
461678	GENERIC_DAY	2	2	f	2011-05-16	2732	\N	461079	\N
461679	GENERIC_DAY	2	3	f	2011-05-16	2734	\N	461079	\N
461680	GENERIC_DAY	2	0	f	2011-05-14	2732	\N	461079	\N
461681	GENERIC_DAY	2	0	f	2011-05-21	2732	\N	461079	\N
461682	GENERIC_DAY	2	2	f	2011-05-26	2732	\N	461079	\N
461683	GENERIC_DAY	2	0	f	2011-05-15	2734	\N	461080	\N
461684	GENERIC_DAY	2	2	f	2011-05-13	2734	\N	461080	\N
461685	GENERIC_DAY	2	0	f	2011-05-21	2733	\N	461080	\N
461686	GENERIC_DAY	2	2	f	2011-05-26	2733	\N	461080	\N
461687	GENERIC_DAY	2	2	f	2011-05-23	2733	\N	461080	\N
461688	GENERIC_DAY	2	2	f	2011-05-16	2733	\N	461080	\N
461689	GENERIC_DAY	2	2	f	2011-05-24	2734	\N	461080	\N
461690	GENERIC_DAY	2	2	f	2011-05-19	2734	\N	461080	\N
461691	GENERIC_DAY	2	4	f	2011-05-26	2732	\N	461080	\N
461692	GENERIC_DAY	2	0	f	2011-05-14	2734	\N	461080	\N
461693	GENERIC_DAY	2	0	f	2011-05-22	2733	\N	461080	\N
461694	GENERIC_DAY	2	4	f	2011-05-20	2732	\N	461080	\N
461695	GENERIC_DAY	2	2	f	2011-05-18	2733	\N	461080	\N
461696	GENERIC_DAY	2	2	f	2011-05-18	2734	\N	461080	\N
461697	GENERIC_DAY	2	2	f	2011-05-16	2734	\N	461080	\N
461698	GENERIC_DAY	2	2	f	2011-05-19	2733	\N	461080	\N
461699	GENERIC_DAY	2	2	f	2011-05-27	2733	\N	461080	\N
461700	GENERIC_DAY	2	2	f	2011-05-17	2734	\N	461080	\N
461701	GENERIC_DAY	2	2	f	2011-05-27	2732	\N	461080	\N
461702	GENERIC_DAY	2	4	f	2011-05-23	2732	\N	461080	\N
461703	GENERIC_DAY	2	0	f	2011-05-14	2732	\N	461080	\N
461704	GENERIC_DAY	2	2	f	2011-05-12	2734	\N	461080	\N
461705	GENERIC_DAY	2	0	f	2011-05-21	2734	\N	461080	\N
461706	GENERIC_DAY	2	4	f	2011-05-24	2732	\N	461080	\N
461707	GENERIC_DAY	2	0	f	2011-05-22	2732	\N	461080	\N
461708	GENERIC_DAY	2	0	f	2011-05-22	2734	\N	461080	\N
461709	GENERIC_DAY	2	2	f	2011-05-13	2733	\N	461080	\N
461710	GENERIC_DAY	2	2	f	2011-05-17	2733	\N	461080	\N
461711	GENERIC_DAY	2	4	f	2011-05-25	2732	\N	461080	\N
461712	GENERIC_DAY	2	4	f	2011-05-16	2732	\N	461080	\N
461713	GENERIC_DAY	2	4	f	2011-05-13	2732	\N	461080	\N
461714	GENERIC_DAY	2	4	f	2011-05-11	2732	\N	461080	\N
461715	GENERIC_DAY	2	2	f	2011-05-12	2733	\N	461080	\N
461716	GENERIC_DAY	2	0	f	2011-05-27	2734	\N	461080	\N
461717	GENERIC_DAY	2	2	f	2011-05-11	2734	\N	461080	\N
461718	GENERIC_DAY	2	2	f	2011-05-26	2734	\N	461080	\N
461719	GENERIC_DAY	2	2	f	2011-05-25	2733	\N	461080	\N
461720	GENERIC_DAY	2	4	f	2011-05-12	2732	\N	461080	\N
461721	GENERIC_DAY	2	4	f	2011-05-17	2732	\N	461080	\N
461722	GENERIC_DAY	2	0	f	2011-05-15	2733	\N	461080	\N
461723	GENERIC_DAY	2	4	f	2011-05-19	2732	\N	461080	\N
461724	GENERIC_DAY	2	2	f	2011-05-23	2734	\N	461080	\N
461725	GENERIC_DAY	2	0	f	2011-05-14	2733	\N	461080	\N
461726	GENERIC_DAY	2	2	f	2011-05-20	2734	\N	461080	\N
461727	GENERIC_DAY	2	2	f	2011-05-20	2733	\N	461080	\N
461728	GENERIC_DAY	2	0	f	2011-05-15	2732	\N	461080	\N
461729	GENERIC_DAY	2	4	f	2011-05-18	2732	\N	461080	\N
461730	GENERIC_DAY	2	2	f	2011-05-24	2733	\N	461080	\N
461731	GENERIC_DAY	2	0	f	2011-05-21	2732	\N	461080	\N
461732	GENERIC_DAY	2	2	f	2011-05-11	2733	\N	461080	\N
461733	GENERIC_DAY	2	2	f	2011-05-25	2734	\N	461080	\N
461734	GENERIC_DAY	2	8	f	2011-05-30	2733	\N	461081	\N
461735	GENERIC_DAY	2	8	f	2011-06-02	2734	\N	461081	\N
461736	GENERIC_DAY	2	8	f	2011-05-31	2734	\N	461081	\N
461737	GENERIC_DAY	2	0	f	2011-05-28	2734	\N	461081	\N
461738	GENERIC_DAY	2	0	f	2011-05-28	2733	\N	461081	\N
461739	GENERIC_DAY	2	1	f	2011-06-03	2734	\N	461081	\N
461740	GENERIC_DAY	2	8	f	2011-05-30	2732	\N	461081	\N
461741	GENERIC_DAY	2	8	f	2011-06-02	2733	\N	461081	\N
461742	GENERIC_DAY	2	1	f	2011-06-03	2733	\N	461081	\N
461743	GENERIC_DAY	2	0	f	2011-05-29	2732	\N	461081	\N
461744	GENERIC_DAY	2	8	f	2011-05-30	2734	\N	461081	\N
461745	GENERIC_DAY	2	8	f	2011-06-01	2732	\N	461081	\N
461746	GENERIC_DAY	2	8	f	2011-06-02	2732	\N	461081	\N
461747	GENERIC_DAY	2	0	f	2011-05-28	2732	\N	461081	\N
461748	GENERIC_DAY	2	2	f	2011-06-03	2732	\N	461081	\N
461749	GENERIC_DAY	2	8	f	2011-06-01	2734	\N	461081	\N
461750	GENERIC_DAY	2	8	f	2011-05-31	2733	\N	461081	\N
461751	GENERIC_DAY	2	8	f	2011-05-31	2732	\N	461081	\N
461752	GENERIC_DAY	2	0	f	2011-05-29	2733	\N	461081	\N
461753	GENERIC_DAY	2	0	f	2011-05-29	2734	\N	461081	\N
461754	GENERIC_DAY	2	8	f	2011-06-01	2733	\N	461081	\N
461755	GENERIC_DAY	2	1	f	2011-05-27	2732	\N	461082	\N
461756	GENERIC_DAY	2	3	f	2011-05-20	2734	\N	461082	\N
461757	GENERIC_DAY	2	3	f	2011-05-18	2733	\N	461082	\N
461758	GENERIC_DAY	2	3	f	2011-05-23	2733	\N	461082	\N
461759	GENERIC_DAY	2	2	f	2011-05-19	2732	\N	461082	\N
461760	GENERIC_DAY	2	3	f	2011-05-17	2733	\N	461082	\N
461761	GENERIC_DAY	2	0	f	2011-05-15	2733	\N	461082	\N
461762	GENERIC_DAY	2	0	f	2011-05-15	2732	\N	461082	\N
461763	GENERIC_DAY	2	2	f	2011-05-12	2732	\N	461082	\N
461764	GENERIC_DAY	2	3	f	2011-05-23	2734	\N	461082	\N
461765	GENERIC_DAY	2	3	f	2011-05-13	2734	\N	461082	\N
461766	GENERIC_DAY	2	3	f	2011-05-11	2734	\N	461082	\N
461767	GENERIC_DAY	2	2	f	2011-05-16	2732	\N	461082	\N
461768	GENERIC_DAY	2	3	f	2011-05-16	2733	\N	461082	\N
461769	GENERIC_DAY	2	3	f	2011-05-26	2733	\N	461082	\N
461770	GENERIC_DAY	2	3	f	2011-05-19	2734	\N	461082	\N
461771	GENERIC_DAY	2	2	f	2011-05-23	2732	\N	461082	\N
461772	GENERIC_DAY	2	2	f	2011-05-11	2732	\N	461082	\N
461773	GENERIC_DAY	2	2	f	2011-05-18	2732	\N	461082	\N
461774	GENERIC_DAY	2	3	f	2011-05-12	2733	\N	461082	\N
461775	GENERIC_DAY	2	0	f	2011-05-15	2734	\N	461082	\N
461776	GENERIC_DAY	2	2	f	2011-05-17	2732	\N	461082	\N
461777	GENERIC_DAY	2	1	f	2011-05-27	2733	\N	461082	\N
461778	GENERIC_DAY	2	3	f	2011-05-24	2734	\N	461082	\N
461779	GENERIC_DAY	2	3	f	2011-05-26	2734	\N	461082	\N
461780	GENERIC_DAY	2	3	f	2011-05-18	2734	\N	461082	\N
461781	GENERIC_DAY	2	0	f	2011-05-22	2733	\N	461082	\N
461782	GENERIC_DAY	2	3	f	2011-05-12	2734	\N	461082	\N
461783	GENERIC_DAY	2	0	f	2011-05-21	2733	\N	461082	\N
461784	GENERIC_DAY	2	0	f	2011-05-14	2733	\N	461082	\N
461785	GENERIC_DAY	2	0	f	2011-05-22	2734	\N	461082	\N
461786	GENERIC_DAY	2	2	f	2011-05-26	2732	\N	461082	\N
461787	GENERIC_DAY	2	2	f	2011-05-13	2732	\N	461082	\N
461788	GENERIC_DAY	2	0	f	2011-05-14	2734	\N	461082	\N
461789	GENERIC_DAY	2	3	f	2011-05-11	2733	\N	461082	\N
461790	GENERIC_DAY	2	3	f	2011-05-25	2733	\N	461082	\N
461791	GENERIC_DAY	2	3	f	2011-05-20	2733	\N	461082	\N
461792	GENERIC_DAY	2	3	f	2011-05-17	2734	\N	461082	\N
461793	GENERIC_DAY	2	3	f	2011-05-19	2733	\N	461082	\N
461794	GENERIC_DAY	2	2	f	2011-05-20	2732	\N	461082	\N
461795	GENERIC_DAY	2	0	f	2011-05-22	2732	\N	461082	\N
461796	GENERIC_DAY	2	2	f	2011-05-24	2732	\N	461082	\N
461797	GENERIC_DAY	2	0	f	2011-05-21	2734	\N	461082	\N
461798	GENERIC_DAY	2	3	f	2011-05-13	2733	\N	461082	\N
461799	GENERIC_DAY	2	0	f	2011-05-14	2732	\N	461082	\N
461800	GENERIC_DAY	2	3	f	2011-05-25	2734	\N	461082	\N
461801	GENERIC_DAY	2	0	f	2011-05-21	2732	\N	461082	\N
461802	GENERIC_DAY	2	3	f	2011-05-24	2733	\N	461082	\N
461803	GENERIC_DAY	2	2	f	2011-05-27	2734	\N	461082	\N
479931	GENERIC_DAY	1	3	f	2011-04-08	2727	\N	479460	\N
479932	GENERIC_DAY	1	0	f	2011-04-10	2728	\N	479460	\N
479933	GENERIC_DAY	1	0	f	2011-04-03	2729	\N	479460	\N
479934	GENERIC_DAY	1	2	f	2011-04-07	2729	\N	479460	\N
479935	GENERIC_DAY	1	2	f	2011-04-18	2729	\N	479460	\N
479936	GENERIC_DAY	1	0	f	2011-04-17	2727	\N	479460	\N
479937	GENERIC_DAY	1	0	f	2011-04-10	2727	\N	479460	\N
479938	GENERIC_DAY	1	3	f	2011-04-04	2728	\N	479460	\N
479939	GENERIC_DAY	1	3	f	2011-04-05	2727	\N	479460	\N
479940	GENERIC_DAY	1	3	f	2011-04-15	2728	\N	479460	\N
479941	GENERIC_DAY	1	1	f	2011-04-19	2729	\N	479460	\N
479942	GENERIC_DAY	1	3	f	2011-04-13	2727	\N	479460	\N
479943	GENERIC_DAY	1	0	f	2011-04-03	2727	\N	479460	\N
479944	GENERIC_DAY	1	3	f	2011-04-01	2728	\N	479460	\N
479945	GENERIC_DAY	1	3	f	2011-04-11	2728	\N	479460	\N
479946	GENERIC_DAY	1	3	f	2011-04-07	2728	\N	479460	\N
479947	GENERIC_DAY	1	3	f	2011-04-12	2728	\N	479460	\N
479948	GENERIC_DAY	1	0	f	2011-04-16	2729	\N	479460	\N
479949	GENERIC_DAY	1	2	f	2011-04-15	2729	\N	479460	\N
479950	GENERIC_DAY	1	0	f	2011-04-09	2729	\N	479460	\N
479951	GENERIC_DAY	1	0	f	2011-04-17	2729	\N	479460	\N
479952	GENERIC_DAY	1	0	f	2011-04-02	2729	\N	479460	\N
479953	GENERIC_DAY	1	0	f	2011-04-09	2728	\N	479460	\N
479954	GENERIC_DAY	1	3	f	2011-04-18	2728	\N	479460	\N
479955	GENERIC_DAY	1	3	f	2011-04-14	2728	\N	479460	\N
479956	GENERIC_DAY	1	3	f	2011-04-08	2728	\N	479460	\N
479957	GENERIC_DAY	1	3	f	2011-04-07	2727	\N	479460	\N
479958	GENERIC_DAY	1	3	f	2011-04-18	2727	\N	479460	\N
479959	GENERIC_DAY	1	2	f	2011-04-08	2729	\N	479460	\N
479960	GENERIC_DAY	1	3	f	2011-04-14	2727	\N	479460	\N
479961	GENERIC_DAY	1	2	f	2011-04-06	2729	\N	479460	\N
479962	GENERIC_DAY	1	1	f	2011-04-19	2728	\N	479460	\N
479963	GENERIC_DAY	1	2	f	2011-04-11	2729	\N	479460	\N
479964	GENERIC_DAY	1	3	f	2011-04-13	2728	\N	479460	\N
479965	GENERIC_DAY	1	0	f	2011-04-09	2727	\N	479460	\N
479966	GENERIC_DAY	1	3	f	2011-04-15	2727	\N	479460	\N
479967	GENERIC_DAY	1	3	f	2011-04-05	2728	\N	479460	\N
479968	GENERIC_DAY	1	2	f	2011-04-01	2729	\N	479460	\N
479969	GENERIC_DAY	1	2	f	2011-04-19	2727	\N	479460	\N
479970	GENERIC_DAY	1	2	f	2011-04-12	2729	\N	479460	\N
479971	GENERIC_DAY	1	0	f	2011-04-02	2727	\N	479460	\N
479972	GENERIC_DAY	1	2	f	2011-04-14	2729	\N	479460	\N
479973	GENERIC_DAY	1	0	f	2011-04-10	2729	\N	479460	\N
479974	GENERIC_DAY	1	3	f	2011-04-06	2728	\N	479460	\N
479975	GENERIC_DAY	1	2	f	2011-04-13	2729	\N	479460	\N
479976	GENERIC_DAY	1	0	f	2011-04-16	2728	\N	479460	\N
479977	GENERIC_DAY	1	3	f	2011-04-12	2727	\N	479460	\N
479978	GENERIC_DAY	1	3	f	2011-04-06	2727	\N	479460	\N
479979	GENERIC_DAY	1	0	f	2011-04-03	2728	\N	479460	\N
479980	GENERIC_DAY	1	3	f	2011-04-01	2727	\N	479460	\N
479981	GENERIC_DAY	1	0	f	2011-04-16	2727	\N	479460	\N
479982	GENERIC_DAY	1	3	f	2011-04-04	2727	\N	479460	\N
479983	GENERIC_DAY	1	2	f	2011-04-04	2729	\N	479460	\N
479984	GENERIC_DAY	1	2	f	2011-04-05	2729	\N	479460	\N
479985	GENERIC_DAY	1	3	f	2011-04-11	2727	\N	479460	\N
479986	GENERIC_DAY	1	0	f	2011-04-17	2728	\N	479460	\N
479987	GENERIC_DAY	1	0	f	2011-04-02	2728	\N	479460	\N
479988	GENERIC_DAY	1	2	f	2011-04-07	2728	\N	479461	\N
479989	GENERIC_DAY	1	3	f	2011-04-08	2729	\N	479461	\N
479990	GENERIC_DAY	1	3	f	2011-04-07	2727	\N	479461	\N
479991	GENERIC_DAY	1	0	f	2011-04-16	2729	\N	479461	\N
479992	GENERIC_DAY	1	0	f	2011-04-09	2727	\N	479461	\N
479993	GENERIC_DAY	1	0	f	2011-04-02	2727	\N	479461	\N
479994	GENERIC_DAY	1	2	f	2011-04-15	2728	\N	479461	\N
479995	GENERIC_DAY	1	3	f	2011-04-13	2727	\N	479461	\N
479996	GENERIC_DAY	1	1	f	2011-04-19	2729	\N	479461	\N
479997	GENERIC_DAY	1	3	f	2011-04-12	2727	\N	479461	\N
479998	GENERIC_DAY	1	0	f	2011-04-16	2728	\N	479461	\N
479999	GENERIC_DAY	1	3	f	2011-04-08	2727	\N	479461	\N
480000	GENERIC_DAY	1	3	f	2011-04-15	2727	\N	479461	\N
480001	GENERIC_DAY	1	3	f	2011-04-15	2729	\N	479461	\N
480002	GENERIC_DAY	1	3	f	2011-04-04	2727	\N	479461	\N
480003	GENERIC_DAY	1	0	f	2011-04-03	2727	\N	479461	\N
480004	GENERIC_DAY	1	3	f	2011-04-18	2727	\N	479461	\N
480005	GENERIC_DAY	1	2	f	2011-04-06	2728	\N	479461	\N
480006	GENERIC_DAY	1	3	f	2011-04-14	2729	\N	479461	\N
480007	GENERIC_DAY	1	3	f	2011-04-11	2729	\N	479461	\N
480008	GENERIC_DAY	1	3	f	2011-04-06	2729	\N	479461	\N
480009	GENERIC_DAY	1	0	f	2011-04-10	2728	\N	479461	\N
480010	GENERIC_DAY	1	0	f	2011-04-17	2728	\N	479461	\N
480011	GENERIC_DAY	1	0	f	2011-04-03	2729	\N	479461	\N
480012	GENERIC_DAY	1	3	f	2011-04-05	2727	\N	479461	\N
480013	GENERIC_DAY	1	2	f	2011-04-18	2728	\N	479461	\N
480014	GENERIC_DAY	1	3	f	2011-04-06	2727	\N	479461	\N
480015	GENERIC_DAY	1	3	f	2011-04-07	2729	\N	479461	\N
480016	GENERIC_DAY	1	0	f	2011-04-10	2729	\N	479461	\N
480017	GENERIC_DAY	1	3	f	2011-04-18	2729	\N	479461	\N
480018	GENERIC_DAY	1	0	f	2011-04-17	2729	\N	479461	\N
480019	GENERIC_DAY	1	2	f	2011-04-01	2728	\N	479461	\N
480020	GENERIC_DAY	1	0	f	2011-04-10	2727	\N	479461	\N
480021	GENERIC_DAY	1	3	f	2011-04-01	2727	\N	479461	\N
480022	GENERIC_DAY	1	2	f	2011-04-19	2728	\N	479461	\N
480023	GENERIC_DAY	1	2	f	2011-04-13	2728	\N	479461	\N
480024	GENERIC_DAY	1	3	f	2011-04-05	2729	\N	479461	\N
480025	GENERIC_DAY	1	0	f	2011-04-16	2727	\N	479461	\N
480026	GENERIC_DAY	1	2	f	2011-04-12	2728	\N	479461	\N
480027	GENERIC_DAY	1	0	f	2011-04-17	2727	\N	479461	\N
480028	GENERIC_DAY	1	0	f	2011-04-02	2729	\N	479461	\N
480029	GENERIC_DAY	1	2	f	2011-04-04	2728	\N	479461	\N
480030	GENERIC_DAY	1	3	f	2011-04-11	2727	\N	479461	\N
480031	GENERIC_DAY	1	0	f	2011-04-02	2728	\N	479461	\N
480032	GENERIC_DAY	1	3	f	2011-04-04	2729	\N	479461	\N
480033	GENERIC_DAY	1	3	f	2011-04-14	2727	\N	479461	\N
480034	GENERIC_DAY	1	2	f	2011-04-14	2728	\N	479461	\N
480035	GENERIC_DAY	1	3	f	2011-04-12	2729	\N	479461	\N
480036	GENERIC_DAY	1	1	f	2011-04-19	2727	\N	479461	\N
480037	GENERIC_DAY	1	0	f	2011-04-09	2728	\N	479461	\N
480038	GENERIC_DAY	1	0	f	2011-04-09	2729	\N	479461	\N
480039	GENERIC_DAY	1	0	f	2011-04-03	2728	\N	479461	\N
480040	GENERIC_DAY	1	2	f	2011-04-11	2728	\N	479461	\N
480041	GENERIC_DAY	1	2	f	2011-04-05	2728	\N	479461	\N
480042	GENERIC_DAY	1	3	f	2011-04-13	2729	\N	479461	\N
480043	GENERIC_DAY	1	2	f	2011-04-08	2728	\N	479461	\N
480044	GENERIC_DAY	1	3	f	2011-04-01	2729	\N	479461	\N
480045	GENERIC_DAY	1	3	f	2011-04-05	2729	\N	479462	\N
480046	GENERIC_DAY	1	3	f	2011-04-14	2728	\N	479462	\N
480047	GENERIC_DAY	1	3	f	2011-04-01	2729	\N	479462	\N
480048	GENERIC_DAY	1	2	f	2011-04-13	2727	\N	479462	\N
480049	GENERIC_DAY	1	2	f	2011-04-05	2727	\N	479462	\N
480050	GENERIC_DAY	1	3	f	2011-04-07	2728	\N	479462	\N
480051	GENERIC_DAY	1	3	f	2011-04-13	2728	\N	479462	\N
480052	GENERIC_DAY	1	0	f	2011-04-10	2728	\N	479462	\N
480053	GENERIC_DAY	1	3	f	2011-04-15	2728	\N	479462	\N
480054	GENERIC_DAY	1	0	f	2011-04-03	2728	\N	479462	\N
480055	GENERIC_DAY	1	3	f	2011-04-04	2728	\N	479462	\N
480056	GENERIC_DAY	1	3	f	2011-04-08	2729	\N	479462	\N
480057	GENERIC_DAY	1	0	f	2011-04-10	2727	\N	479462	\N
480058	GENERIC_DAY	1	3	f	2011-04-11	2729	\N	479462	\N
480059	GENERIC_DAY	1	0	f	2011-04-03	2729	\N	479462	\N
480060	GENERIC_DAY	1	0	f	2011-04-09	2728	\N	479462	\N
480061	GENERIC_DAY	1	3	f	2011-04-08	2728	\N	479462	\N
480062	GENERIC_DAY	1	2	f	2011-04-15	2727	\N	479462	\N
480063	GENERIC_DAY	1	2	f	2011-04-08	2727	\N	479462	\N
480064	GENERIC_DAY	1	0	f	2011-04-17	2728	\N	479462	\N
480065	GENERIC_DAY	1	2	f	2011-04-04	2727	\N	479462	\N
480066	GENERIC_DAY	1	3	f	2011-04-15	2729	\N	479462	\N
480067	GENERIC_DAY	1	1	f	2011-04-19	2727	\N	479462	\N
480068	GENERIC_DAY	1	0	f	2011-04-03	2727	\N	479462	\N
480069	GENERIC_DAY	1	3	f	2011-04-18	2729	\N	479462	\N
480070	GENERIC_DAY	1	3	f	2011-04-11	2728	\N	479462	\N
480071	GENERIC_DAY	1	2	f	2011-04-19	2729	\N	479462	\N
480072	GENERIC_DAY	1	2	f	2011-04-07	2727	\N	479462	\N
480073	GENERIC_DAY	1	3	f	2011-04-12	2728	\N	479462	\N
480074	GENERIC_DAY	1	3	f	2011-04-04	2729	\N	479462	\N
480075	GENERIC_DAY	1	3	f	2011-04-01	2728	\N	479462	\N
480076	GENERIC_DAY	1	2	f	2011-04-01	2727	\N	479462	\N
480077	GENERIC_DAY	1	2	f	2011-04-12	2727	\N	479462	\N
480078	GENERIC_DAY	1	3	f	2011-04-18	2728	\N	479462	\N
480079	GENERIC_DAY	1	2	f	2011-04-18	2727	\N	479462	\N
480080	GENERIC_DAY	1	3	f	2011-04-05	2728	\N	479462	\N
480081	GENERIC_DAY	1	2	f	2011-04-14	2727	\N	479462	\N
480082	GENERIC_DAY	1	0	f	2011-04-02	2728	\N	479462	\N
480083	GENERIC_DAY	1	0	f	2011-04-16	2728	\N	479462	\N
480084	GENERIC_DAY	1	0	f	2011-04-02	2729	\N	479462	\N
480085	GENERIC_DAY	1	3	f	2011-04-12	2729	\N	479462	\N
480086	GENERIC_DAY	1	0	f	2011-04-09	2727	\N	479462	\N
480087	GENERIC_DAY	1	0	f	2011-04-17	2729	\N	479462	\N
480088	GENERIC_DAY	1	3	f	2011-04-06	2729	\N	479462	\N
480089	GENERIC_DAY	1	3	f	2011-04-14	2729	\N	479462	\N
480090	GENERIC_DAY	1	0	f	2011-04-17	2727	\N	479462	\N
480091	GENERIC_DAY	1	0	f	2011-04-16	2729	\N	479462	\N
480092	GENERIC_DAY	1	3	f	2011-04-13	2729	\N	479462	\N
480093	GENERIC_DAY	1	2	f	2011-04-11	2727	\N	479462	\N
480094	GENERIC_DAY	1	1	f	2011-04-19	2728	\N	479462	\N
480095	GENERIC_DAY	1	0	f	2011-04-09	2729	\N	479462	\N
480096	GENERIC_DAY	1	2	f	2011-04-06	2727	\N	479462	\N
480097	GENERIC_DAY	1	3	f	2011-04-07	2729	\N	479462	\N
480098	GENERIC_DAY	1	0	f	2011-04-16	2727	\N	479462	\N
480099	GENERIC_DAY	1	3	f	2011-04-06	2728	\N	479462	\N
480100	GENERIC_DAY	1	0	f	2011-04-02	2727	\N	479462	\N
480101	GENERIC_DAY	1	0	f	2011-04-10	2729	\N	479462	\N
480102	GENERIC_DAY	1	0	f	2011-04-23	2727	\N	479463	\N
480103	GENERIC_DAY	1	5	f	2011-04-28	2727	\N	479463	\N
480104	GENERIC_DAY	1	4	f	2011-04-26	2729	\N	479463	\N
480105	GENERIC_DAY	1	0	f	2011-04-24	2728	\N	479463	\N
480106	GENERIC_DAY	1	5	f	2011-04-20	2727	\N	479463	\N
480107	GENERIC_DAY	1	5	f	2011-04-21	2728	\N	479463	\N
480108	GENERIC_DAY	1	5	f	2011-04-22	2727	\N	479463	\N
480109	GENERIC_DAY	1	1	f	2011-04-29	2727	\N	479463	\N
480110	GENERIC_DAY	1	5	f	2011-04-27	2728	\N	479463	\N
480111	GENERIC_DAY	1	5	f	2011-04-26	2728	\N	479463	\N
480112	GENERIC_DAY	1	5	f	2011-04-25	2727	\N	479463	\N
480113	GENERIC_DAY	1	5	f	2011-04-28	2728	\N	479463	\N
480114	GENERIC_DAY	1	4	f	2011-04-25	2729	\N	479463	\N
480115	GENERIC_DAY	1	5	f	2011-04-22	2728	\N	479463	\N
480116	GENERIC_DAY	1	0	f	2011-04-23	2728	\N	479463	\N
480117	GENERIC_DAY	1	0	f	2011-04-29	2729	\N	479463	\N
480118	GENERIC_DAY	1	0	f	2011-04-24	2729	\N	479463	\N
480119	GENERIC_DAY	1	4	f	2011-04-22	2729	\N	479463	\N
480120	GENERIC_DAY	1	4	f	2011-04-27	2729	\N	479463	\N
480121	GENERIC_DAY	1	5	f	2011-04-27	2727	\N	479463	\N
480122	GENERIC_DAY	1	5	f	2011-04-25	2728	\N	479463	\N
480123	GENERIC_DAY	1	4	f	2011-04-28	2729	\N	479463	\N
480124	GENERIC_DAY	1	5	f	2011-04-20	2728	\N	479463	\N
480125	GENERIC_DAY	1	5	f	2011-04-21	2727	\N	479463	\N
480126	GENERIC_DAY	1	1	f	2011-04-29	2728	\N	479463	\N
480127	GENERIC_DAY	1	0	f	2011-04-23	2729	\N	479463	\N
480128	GENERIC_DAY	1	4	f	2011-04-20	2729	\N	479463	\N
480129	GENERIC_DAY	1	5	f	2011-04-26	2727	\N	479463	\N
480130	GENERIC_DAY	1	0	f	2011-04-24	2727	\N	479463	\N
480131	GENERIC_DAY	1	4	f	2011-04-21	2729	\N	479463	\N
480132	GENERIC_DAY	1	0	f	2011-04-30	2728	\N	479464	\N
480133	GENERIC_DAY	1	3	f	2011-05-02	2728	\N	479464	\N
480134	GENERIC_DAY	1	0	f	2011-05-01	2729	\N	479464	\N
480135	GENERIC_DAY	1	3	f	2011-04-28	2729	\N	479464	\N
480136	GENERIC_DAY	1	2	f	2011-04-26	2728	\N	479464	\N
480137	GENERIC_DAY	1	3	f	2011-05-05	2728	\N	479464	\N
480138	GENERIC_DAY	1	3	f	2011-04-27	2729	\N	479464	\N
480139	GENERIC_DAY	1	0	f	2011-04-23	2729	\N	479464	\N
480140	GENERIC_DAY	1	2	f	2011-05-06	2727	\N	479464	\N
480141	GENERIC_DAY	1	2	f	2011-04-28	2728	\N	479464	\N
480142	GENERIC_DAY	1	2	f	2011-05-02	2729	\N	479464	\N
480143	GENERIC_DAY	1	2	f	2011-05-05	2729	\N	479464	\N
480144	GENERIC_DAY	1	0	f	2011-04-30	2727	\N	479464	\N
480145	GENERIC_DAY	1	3	f	2011-05-02	2727	\N	479464	\N
480146	GENERIC_DAY	1	3	f	2011-04-21	2727	\N	479464	\N
480147	GENERIC_DAY	1	2	f	2011-04-22	2728	\N	479464	\N
480148	GENERIC_DAY	1	0	f	2011-05-01	2727	\N	479464	\N
480149	GENERIC_DAY	1	3	f	2011-04-25	2727	\N	479464	\N
480150	GENERIC_DAY	1	0	f	2011-04-24	2728	\N	479464	\N
480151	GENERIC_DAY	1	3	f	2011-04-28	2727	\N	479464	\N
480152	GENERIC_DAY	1	0	f	2011-04-24	2729	\N	479464	\N
480153	GENERIC_DAY	1	3	f	2011-04-29	2727	\N	479464	\N
480154	GENERIC_DAY	1	3	f	2011-04-20	2729	\N	479464	\N
480155	GENERIC_DAY	1	2	f	2011-04-27	2728	\N	479464	\N
480156	GENERIC_DAY	1	3	f	2011-04-26	2729	\N	479464	\N
480157	GENERIC_DAY	1	3	f	2011-04-29	2729	\N	479464	\N
480158	GENERIC_DAY	1	2	f	2011-04-20	2728	\N	479464	\N
480159	GENERIC_DAY	1	3	f	2011-04-27	2727	\N	479464	\N
480160	GENERIC_DAY	1	0	f	2011-05-01	2728	\N	479464	\N
480161	GENERIC_DAY	1	2	f	2011-05-03	2729	\N	479464	\N
480162	GENERIC_DAY	1	2	f	2011-04-21	2728	\N	479464	\N
480163	GENERIC_DAY	1	3	f	2011-05-05	2727	\N	479464	\N
480164	GENERIC_DAY	1	3	f	2011-04-25	2729	\N	479464	\N
480165	GENERIC_DAY	1	2	f	2011-04-29	2728	\N	479464	\N
480166	GENERIC_DAY	1	3	f	2011-04-20	2727	\N	479464	\N
480167	GENERIC_DAY	1	0	f	2011-04-23	2728	\N	479464	\N
480168	GENERIC_DAY	1	3	f	2011-04-22	2727	\N	479464	\N
480169	GENERIC_DAY	1	3	f	2011-05-04	2727	\N	479464	\N
480170	GENERIC_DAY	1	0	f	2011-04-23	2727	\N	479464	\N
480171	GENERIC_DAY	1	3	f	2011-04-26	2727	\N	479464	\N
480172	GENERIC_DAY	1	1	f	2011-05-06	2728	\N	479464	\N
480173	GENERIC_DAY	1	2	f	2011-04-25	2728	\N	479464	\N
480174	GENERIC_DAY	1	0	f	2011-04-30	2729	\N	479464	\N
480175	GENERIC_DAY	1	3	f	2011-05-04	2728	\N	479464	\N
480176	GENERIC_DAY	1	1	f	2011-05-06	2729	\N	479464	\N
480177	GENERIC_DAY	1	3	f	2011-04-21	2729	\N	479464	\N
480178	GENERIC_DAY	1	0	f	2011-04-24	2727	\N	479464	\N
480179	GENERIC_DAY	1	3	f	2011-04-22	2729	\N	479464	\N
480180	GENERIC_DAY	1	3	f	2011-05-03	2727	\N	479464	\N
480181	GENERIC_DAY	1	3	f	2011-05-03	2728	\N	479464	\N
480182	GENERIC_DAY	1	2	f	2011-05-04	2729	\N	479464	\N
480183	GENERIC_DAY	1	3	f	2011-05-04	2729	\N	479465	\N
480184	GENERIC_DAY	1	3	f	2011-05-05	2727	\N	479465	\N
480185	GENERIC_DAY	1	0	f	2011-05-15	2729	\N	479465	\N
480186	GENERIC_DAY	1	2	f	2011-05-13	2729	\N	479465	\N
480187	GENERIC_DAY	1	3	f	2011-05-13	2728	\N	479465	\N
480188	GENERIC_DAY	1	0	f	2011-05-01	2728	\N	479465	\N
480189	GENERIC_DAY	1	1	f	2011-05-18	2729	\N	479465	\N
480190	GENERIC_DAY	1	2	f	2011-05-10	2729	\N	479465	\N
480191	GENERIC_DAY	1	0	f	2011-05-15	2727	\N	479465	\N
480192	GENERIC_DAY	1	3	f	2011-05-06	2728	\N	479465	\N
480193	GENERIC_DAY	1	2	f	2011-05-09	2729	\N	479465	\N
480194	GENERIC_DAY	1	0	f	2011-05-07	2727	\N	479465	\N
480195	GENERIC_DAY	1	0	f	2011-05-15	2728	\N	479465	\N
480196	GENERIC_DAY	1	0	f	2011-04-30	2727	\N	479465	\N
480197	GENERIC_DAY	1	3	f	2011-05-12	2727	\N	479465	\N
480198	GENERIC_DAY	1	2	f	2011-05-17	2729	\N	479465	\N
480199	GENERIC_DAY	1	3	f	2011-05-11	2727	\N	479465	\N
480200	GENERIC_DAY	1	2	f	2011-05-02	2728	\N	479465	\N
480201	GENERIC_DAY	1	2	f	2011-05-12	2729	\N	479465	\N
480202	GENERIC_DAY	1	0	f	2011-04-30	2729	\N	479465	\N
480203	GENERIC_DAY	1	3	f	2011-05-02	2729	\N	479465	\N
480204	GENERIC_DAY	1	3	f	2011-05-12	2728	\N	479465	\N
480205	GENERIC_DAY	1	3	f	2011-05-16	2727	\N	479465	\N
480206	GENERIC_DAY	1	1	f	2011-05-18	2728	\N	479465	\N
480207	GENERIC_DAY	1	0	f	2011-05-08	2729	\N	479465	\N
480208	GENERIC_DAY	1	3	f	2011-05-10	2727	\N	479465	\N
480209	GENERIC_DAY	1	2	f	2011-05-11	2729	\N	479465	\N
480210	GENERIC_DAY	1	3	f	2011-05-11	2728	\N	479465	\N
480211	GENERIC_DAY	1	2	f	2011-05-06	2727	\N	479465	\N
480212	GENERIC_DAY	1	0	f	2011-04-30	2728	\N	479465	\N
480213	GENERIC_DAY	1	2	f	2011-05-18	2727	\N	479465	\N
480214	GENERIC_DAY	1	0	f	2011-05-01	2727	\N	479465	\N
480215	GENERIC_DAY	1	2	f	2011-05-03	2728	\N	479465	\N
480216	GENERIC_DAY	1	3	f	2011-05-17	2727	\N	479465	\N
480217	GENERIC_DAY	1	3	f	2011-05-17	2728	\N	479465	\N
480218	GENERIC_DAY	1	3	f	2011-05-13	2727	\N	479465	\N
480219	GENERIC_DAY	1	3	f	2011-05-09	2728	\N	479465	\N
480220	GENERIC_DAY	1	0	f	2011-05-14	2727	\N	479465	\N
480221	GENERIC_DAY	1	2	f	2011-05-04	2728	\N	479465	\N
480222	GENERIC_DAY	1	3	f	2011-05-03	2727	\N	479465	\N
480223	GENERIC_DAY	1	3	f	2011-05-06	2729	\N	479465	\N
480224	GENERIC_DAY	1	3	f	2011-05-16	2728	\N	479465	\N
480225	GENERIC_DAY	1	2	f	2011-05-16	2729	\N	479465	\N
480226	GENERIC_DAY	1	0	f	2011-05-14	2728	\N	479465	\N
480227	GENERIC_DAY	1	0	f	2011-05-07	2729	\N	479465	\N
480228	GENERIC_DAY	1	0	f	2011-05-08	2728	\N	479465	\N
480229	GENERIC_DAY	1	3	f	2011-05-04	2727	\N	479465	\N
480230	GENERIC_DAY	1	3	f	2011-05-09	2727	\N	479465	\N
480231	GENERIC_DAY	1	2	f	2011-05-05	2728	\N	479465	\N
480232	GENERIC_DAY	1	0	f	2011-05-14	2729	\N	479465	\N
480233	GENERIC_DAY	1	3	f	2011-05-10	2728	\N	479465	\N
480234	GENERIC_DAY	1	3	f	2011-05-03	2729	\N	479465	\N
480235	GENERIC_DAY	1	0	f	2011-05-07	2728	\N	479465	\N
480236	GENERIC_DAY	1	3	f	2011-05-02	2727	\N	479465	\N
480237	GENERIC_DAY	1	0	f	2011-05-08	2727	\N	479465	\N
480238	GENERIC_DAY	1	3	f	2011-05-05	2729	\N	479465	\N
480239	GENERIC_DAY	1	0	f	2011-05-01	2729	\N	479465	\N
480240	GENERIC_DAY	1	5	f	2011-05-09	2728	\N	479466	\N
480241	GENERIC_DAY	1	5	f	2011-05-10	2728	\N	479466	\N
480242	GENERIC_DAY	1	2	f	2011-05-17	2729	\N	479466	\N
480243	GENERIC_DAY	1	5	f	2011-05-12	2727	\N	479466	\N
480244	GENERIC_DAY	1	1	f	2011-05-17	2727	\N	479466	\N
480245	GENERIC_DAY	1	6	f	2011-05-13	2729	\N	479466	\N
480246	GENERIC_DAY	1	6	f	2011-05-10	2729	\N	479466	\N
480247	GENERIC_DAY	1	6	f	2011-05-09	2729	\N	479466	\N
480248	GENERIC_DAY	1	0	f	2011-05-14	2729	\N	479466	\N
480249	GENERIC_DAY	1	6	f	2011-05-11	2729	\N	479466	\N
480250	GENERIC_DAY	1	0	f	2011-05-14	2727	\N	479466	\N
480251	GENERIC_DAY	1	0	f	2011-05-15	2729	\N	479466	\N
480252	GENERIC_DAY	1	6	f	2011-05-12	2729	\N	479466	\N
480253	GENERIC_DAY	1	5	f	2011-05-11	2728	\N	479466	\N
480254	GENERIC_DAY	1	0	f	2011-05-08	2727	\N	479466	\N
480255	GENERIC_DAY	1	5	f	2011-05-09	2727	\N	479466	\N
480256	GENERIC_DAY	1	0	f	2011-05-07	2729	\N	479466	\N
480257	GENERIC_DAY	1	5	f	2011-05-12	2728	\N	479466	\N
480258	GENERIC_DAY	1	0	f	2011-05-15	2728	\N	479466	\N
480259	GENERIC_DAY	1	5	f	2011-05-13	2727	\N	479466	\N
480260	GENERIC_DAY	1	5	f	2011-05-16	2727	\N	479466	\N
480261	GENERIC_DAY	1	1	f	2011-05-17	2728	\N	479466	\N
480262	GENERIC_DAY	1	0	f	2011-05-07	2727	\N	479466	\N
480263	GENERIC_DAY	1	0	f	2011-05-08	2729	\N	479466	\N
480264	GENERIC_DAY	1	5	f	2011-05-10	2727	\N	479466	\N
480265	GENERIC_DAY	1	0	f	2011-05-15	2727	\N	479466	\N
480266	GENERIC_DAY	1	0	f	2011-05-08	2728	\N	479466	\N
480267	GENERIC_DAY	1	5	f	2011-05-13	2728	\N	479466	\N
480268	GENERIC_DAY	1	6	f	2011-05-16	2729	\N	479466	\N
480269	GENERIC_DAY	1	0	f	2011-05-07	2728	\N	479466	\N
480270	GENERIC_DAY	1	0	f	2011-05-14	2728	\N	479466	\N
480271	GENERIC_DAY	1	5	f	2011-05-16	2728	\N	479466	\N
480272	GENERIC_DAY	1	5	f	2011-05-11	2727	\N	479466	\N
480273	GENERIC_DAY	1	8	f	2011-05-24	2727	\N	479467	\N
480274	GENERIC_DAY	1	0	f	2011-05-21	2729	\N	479467	\N
480275	GENERIC_DAY	1	8	f	2011-05-24	2729	\N	479467	\N
480276	GENERIC_DAY	1	8	f	2011-05-19	2728	\N	479467	\N
480277	GENERIC_DAY	1	8	f	2011-05-20	2727	\N	479467	\N
480278	GENERIC_DAY	1	8	f	2011-05-24	2728	\N	479467	\N
480279	GENERIC_DAY	1	0	f	2011-05-22	2729	\N	479467	\N
480280	GENERIC_DAY	1	0	f	2011-05-22	2728	\N	479467	\N
480281	GENERIC_DAY	1	8	f	2011-05-20	2729	\N	479467	\N
480282	GENERIC_DAY	1	2	f	2011-05-25	2727	\N	479467	\N
480283	GENERIC_DAY	1	8	f	2011-05-19	2729	\N	479467	\N
480284	GENERIC_DAY	1	1	f	2011-05-25	2728	\N	479467	\N
480285	GENERIC_DAY	1	8	f	2011-05-23	2729	\N	479467	\N
480286	GENERIC_DAY	1	0	f	2011-05-22	2727	\N	479467	\N
480287	GENERIC_DAY	1	8	f	2011-05-23	2728	\N	479467	\N
480288	GENERIC_DAY	1	8	f	2011-05-19	2727	\N	479467	\N
480289	GENERIC_DAY	1	0	f	2011-05-21	2727	\N	479467	\N
480290	GENERIC_DAY	1	8	f	2011-05-23	2727	\N	479467	\N
480291	GENERIC_DAY	1	1	f	2011-05-25	2729	\N	479467	\N
480292	GENERIC_DAY	1	8	f	2011-05-20	2728	\N	479467	\N
480293	GENERIC_DAY	1	0	f	2011-05-21	2728	\N	479467	\N
480294	GENERIC_DAY	1	0	f	2011-05-28	2727	\N	479468	\N
480295	GENERIC_DAY	1	1	f	2011-06-01	2728	\N	479468	\N
480296	GENERIC_DAY	1	8	f	2011-05-30	2727	\N	479468	\N
480297	GENERIC_DAY	1	8	f	2011-05-30	2729	\N	479468	\N
480298	GENERIC_DAY	1	8	f	2011-05-31	2729	\N	479468	\N
480299	GENERIC_DAY	1	8	f	2011-05-27	2729	\N	479468	\N
480300	GENERIC_DAY	1	8	f	2011-05-30	2728	\N	479468	\N
480301	GENERIC_DAY	1	0	f	2011-05-28	2728	\N	479468	\N
480302	GENERIC_DAY	1	8	f	2011-05-31	2727	\N	479468	\N
480303	GENERIC_DAY	1	0	f	2011-05-28	2729	\N	479468	\N
480304	GENERIC_DAY	1	8	f	2011-05-27	2728	\N	479468	\N
480305	GENERIC_DAY	1	8	f	2011-05-26	2728	\N	479468	\N
480306	GENERIC_DAY	1	8	f	2011-05-31	2728	\N	479468	\N
480307	GENERIC_DAY	1	2	f	2011-06-01	2727	\N	479468	\N
480308	GENERIC_DAY	1	0	f	2011-05-29	2728	\N	479468	\N
480309	GENERIC_DAY	1	8	f	2011-05-27	2727	\N	479468	\N
480310	GENERIC_DAY	1	0	f	2011-05-29	2727	\N	479468	\N
480311	GENERIC_DAY	1	8	f	2011-05-26	2727	\N	479468	\N
480312	GENERIC_DAY	1	8	f	2011-05-26	2729	\N	479468	\N
480313	GENERIC_DAY	1	1	f	2011-06-01	2729	\N	479468	\N
480314	GENERIC_DAY	1	0	f	2011-05-29	2729	\N	479468	\N
480315	GENERIC_DAY	1	8	f	2011-06-03	2727	\N	479469	\N
480316	GENERIC_DAY	1	8	f	2011-06-02	2729	\N	479469	\N
480317	GENERIC_DAY	1	2	f	2011-06-08	2727	\N	479469	\N
480318	GENERIC_DAY	1	8	f	2011-06-03	2729	\N	479469	\N
480319	GENERIC_DAY	1	8	f	2011-06-07	2728	\N	479469	\N
480320	GENERIC_DAY	1	1	f	2011-06-08	2728	\N	479469	\N
480321	GENERIC_DAY	1	8	f	2011-06-03	2728	\N	479469	\N
480322	GENERIC_DAY	1	0	f	2011-06-05	2727	\N	479469	\N
480323	GENERIC_DAY	1	0	f	2011-06-04	2727	\N	479469	\N
480324	GENERIC_DAY	1	0	f	2011-06-04	2729	\N	479469	\N
480325	GENERIC_DAY	1	8	f	2011-06-06	2727	\N	479469	\N
480326	GENERIC_DAY	1	8	f	2011-06-02	2728	\N	479469	\N
480327	GENERIC_DAY	1	0	f	2011-06-05	2729	\N	479469	\N
480328	GENERIC_DAY	1	8	f	2011-06-06	2729	\N	479469	\N
480329	GENERIC_DAY	1	8	f	2011-06-07	2729	\N	479469	\N
480330	GENERIC_DAY	1	0	f	2011-06-04	2728	\N	479469	\N
480331	GENERIC_DAY	1	0	f	2011-06-05	2728	\N	479469	\N
480332	GENERIC_DAY	1	8	f	2011-06-07	2727	\N	479469	\N
480333	GENERIC_DAY	1	8	f	2011-06-06	2728	\N	479469	\N
480334	GENERIC_DAY	1	8	f	2011-06-02	2727	\N	479469	\N
480335	GENERIC_DAY	1	1	f	2011-06-08	2729	\N	479469	\N
480336	GENERIC_DAY	1	3	f	2011-04-11	2025	\N	479470	\N
480337	GENERIC_DAY	1	3	f	2011-04-05	2027	\N	479470	\N
480338	GENERIC_DAY	1	0	f	2011-04-10	2028	\N	479470	\N
480339	GENERIC_DAY	1	0	f	2011-04-02	2028	\N	479470	\N
480340	GENERIC_DAY	1	3	f	2011-04-15	2025	\N	479470	\N
480341	GENERIC_DAY	1	3	f	2011-04-05	2025	\N	479470	\N
480342	GENERIC_DAY	1	3	f	2011-04-18	2025	\N	479470	\N
480343	GENERIC_DAY	1	0	f	2011-04-03	2028	\N	479470	\N
480344	GENERIC_DAY	1	3	f	2011-04-12	2027	\N	479470	\N
480345	GENERIC_DAY	1	0	f	2011-04-02	2027	\N	479470	\N
480346	GENERIC_DAY	1	3	f	2011-04-12	2025	\N	479470	\N
480347	GENERIC_DAY	1	3	f	2011-04-01	2027	\N	479470	\N
480348	GENERIC_DAY	1	3	f	2011-04-18	2027	\N	479470	\N
480349	GENERIC_DAY	1	2	f	2011-04-05	2028	\N	479470	\N
480350	GENERIC_DAY	1	1	f	2011-04-19	2028	\N	479470	\N
480351	GENERIC_DAY	1	3	f	2011-04-14	2027	\N	479470	\N
480352	GENERIC_DAY	1	0	f	2011-04-03	2027	\N	479470	\N
480353	GENERIC_DAY	1	3	f	2011-04-07	2025	\N	479470	\N
480354	GENERIC_DAY	1	0	f	2011-04-17	2028	\N	479470	\N
480355	GENERIC_DAY	1	0	f	2011-04-09	2025	\N	479470	\N
480356	GENERIC_DAY	1	2	f	2011-04-07	2028	\N	479470	\N
480357	GENERIC_DAY	1	2	f	2011-04-14	2028	\N	479470	\N
480358	GENERIC_DAY	1	0	f	2011-04-17	2025	\N	479470	\N
480359	GENERIC_DAY	1	3	f	2011-04-06	2025	\N	479470	\N
480360	GENERIC_DAY	1	2	f	2011-04-13	2028	\N	479470	\N
480361	GENERIC_DAY	1	0	f	2011-04-10	2027	\N	479470	\N
480362	GENERIC_DAY	1	2	f	2011-04-19	2025	\N	479470	\N
480363	GENERIC_DAY	1	3	f	2011-04-08	2025	\N	479470	\N
480364	GENERIC_DAY	1	0	f	2011-04-09	2027	\N	479470	\N
480365	GENERIC_DAY	1	3	f	2011-04-13	2027	\N	479470	\N
480366	GENERIC_DAY	1	2	f	2011-04-11	2028	\N	479470	\N
480367	GENERIC_DAY	1	2	f	2011-04-06	2028	\N	479470	\N
480368	GENERIC_DAY	1	0	f	2011-04-10	2025	\N	479470	\N
480369	GENERIC_DAY	1	0	f	2011-04-16	2027	\N	479470	\N
480370	GENERIC_DAY	1	0	f	2011-04-16	2025	\N	479470	\N
480371	GENERIC_DAY	1	1	f	2011-04-19	2027	\N	479470	\N
480372	GENERIC_DAY	1	2	f	2011-04-04	2028	\N	479470	\N
480373	GENERIC_DAY	1	3	f	2011-04-08	2027	\N	479470	\N
480374	GENERIC_DAY	1	3	f	2011-04-11	2027	\N	479470	\N
480375	GENERIC_DAY	1	2	f	2011-04-18	2028	\N	479470	\N
480376	GENERIC_DAY	1	0	f	2011-04-02	2025	\N	479470	\N
480377	GENERIC_DAY	1	2	f	2011-04-15	2028	\N	479470	\N
480378	GENERIC_DAY	1	2	f	2011-04-01	2028	\N	479470	\N
480379	GENERIC_DAY	1	3	f	2011-04-04	2025	\N	479470	\N
480380	GENERIC_DAY	1	0	f	2011-04-03	2025	\N	479470	\N
480381	GENERIC_DAY	1	3	f	2011-04-06	2027	\N	479470	\N
480382	GENERIC_DAY	1	3	f	2011-04-01	2025	\N	479470	\N
480383	GENERIC_DAY	1	3	f	2011-04-07	2027	\N	479470	\N
480384	GENERIC_DAY	1	3	f	2011-04-13	2025	\N	479470	\N
480385	GENERIC_DAY	1	0	f	2011-04-16	2028	\N	479470	\N
480386	GENERIC_DAY	1	3	f	2011-04-15	2027	\N	479470	\N
480387	GENERIC_DAY	1	3	f	2011-04-04	2027	\N	479470	\N
480388	GENERIC_DAY	1	3	f	2011-04-14	2025	\N	479470	\N
480389	GENERIC_DAY	1	2	f	2011-04-08	2028	\N	479470	\N
480390	GENERIC_DAY	1	2	f	2011-04-12	2028	\N	479470	\N
480391	GENERIC_DAY	1	0	f	2011-04-09	2028	\N	479470	\N
480392	GENERIC_DAY	1	0	f	2011-04-17	2027	\N	479470	\N
480393	GENERIC_DAY	1	0	f	2011-04-09	2025	\N	479471	\N
480394	GENERIC_DAY	1	0	f	2011-04-09	2028	\N	479471	\N
480395	GENERIC_DAY	1	3	f	2011-04-14	2025	\N	479471	\N
480396	GENERIC_DAY	1	0	f	2011-04-10	2028	\N	479471	\N
480397	GENERIC_DAY	1	2	f	2011-04-07	2027	\N	479471	\N
480398	GENERIC_DAY	1	2	f	2011-04-14	2027	\N	479471	\N
480399	GENERIC_DAY	1	2	f	2011-04-08	2027	\N	479471	\N
480400	GENERIC_DAY	1	2	f	2011-04-13	2027	\N	479471	\N
480401	GENERIC_DAY	1	0	f	2011-04-02	2028	\N	479471	\N
480402	GENERIC_DAY	1	3	f	2011-04-13	2025	\N	479471	\N
480403	GENERIC_DAY	1	0	f	2011-04-16	2028	\N	479471	\N
480404	GENERIC_DAY	1	3	f	2011-04-11	2028	\N	479471	\N
480405	GENERIC_DAY	1	3	f	2011-04-04	2025	\N	479471	\N
480406	GENERIC_DAY	1	0	f	2011-04-03	2025	\N	479471	\N
480407	GENERIC_DAY	1	2	f	2011-04-01	2027	\N	479471	\N
480408	GENERIC_DAY	1	0	f	2011-04-03	2028	\N	479471	\N
480409	GENERIC_DAY	1	3	f	2011-04-12	2025	\N	479471	\N
480410	GENERIC_DAY	1	3	f	2011-04-13	2028	\N	479471	\N
480411	GENERIC_DAY	1	2	f	2011-04-19	2027	\N	479471	\N
480412	GENERIC_DAY	1	2	f	2011-04-12	2027	\N	479471	\N
480413	GENERIC_DAY	1	2	f	2011-04-15	2027	\N	479471	\N
480414	GENERIC_DAY	1	3	f	2011-04-07	2028	\N	479471	\N
480415	GENERIC_DAY	1	3	f	2011-04-15	2028	\N	479471	\N
480416	GENERIC_DAY	1	3	f	2011-04-06	2025	\N	479471	\N
480417	GENERIC_DAY	1	0	f	2011-04-10	2025	\N	479471	\N
480418	GENERIC_DAY	1	3	f	2011-04-05	2025	\N	479471	\N
480419	GENERIC_DAY	1	1	f	2011-04-19	2028	\N	479471	\N
480420	GENERIC_DAY	1	3	f	2011-04-06	2028	\N	479471	\N
480421	GENERIC_DAY	1	3	f	2011-04-08	2028	\N	479471	\N
480422	GENERIC_DAY	1	3	f	2011-04-18	2028	\N	479471	\N
480423	GENERIC_DAY	1	3	f	2011-04-08	2025	\N	479471	\N
480424	GENERIC_DAY	1	0	f	2011-04-16	2025	\N	479471	\N
480425	GENERIC_DAY	1	3	f	2011-04-01	2025	\N	479471	\N
480426	GENERIC_DAY	1	2	f	2011-04-05	2027	\N	479471	\N
480427	GENERIC_DAY	1	1	f	2011-04-19	2025	\N	479471	\N
480428	GENERIC_DAY	1	2	f	2011-04-11	2027	\N	479471	\N
480429	GENERIC_DAY	1	3	f	2011-04-05	2028	\N	479471	\N
480430	GENERIC_DAY	1	3	f	2011-04-04	2028	\N	479471	\N
480431	GENERIC_DAY	1	3	f	2011-04-01	2028	\N	479471	\N
480432	GENERIC_DAY	1	0	f	2011-04-17	2025	\N	479471	\N
480433	GENERIC_DAY	1	0	f	2011-04-03	2027	\N	479471	\N
480434	GENERIC_DAY	1	0	f	2011-04-10	2027	\N	479471	\N
480435	GENERIC_DAY	1	3	f	2011-04-15	2025	\N	479471	\N
480436	GENERIC_DAY	1	0	f	2011-04-16	2027	\N	479471	\N
480437	GENERIC_DAY	1	3	f	2011-04-12	2028	\N	479471	\N
480438	GENERIC_DAY	1	0	f	2011-04-09	2027	\N	479471	\N
480439	GENERIC_DAY	1	0	f	2011-04-17	2027	\N	479471	\N
480440	GENERIC_DAY	1	2	f	2011-04-18	2027	\N	479471	\N
480441	GENERIC_DAY	1	0	f	2011-04-02	2025	\N	479471	\N
480442	GENERIC_DAY	1	2	f	2011-04-06	2027	\N	479471	\N
480443	GENERIC_DAY	1	0	f	2011-04-17	2028	\N	479471	\N
480444	GENERIC_DAY	1	3	f	2011-04-14	2028	\N	479471	\N
480445	GENERIC_DAY	1	3	f	2011-04-11	2025	\N	479471	\N
480446	GENERIC_DAY	1	3	f	2011-04-18	2025	\N	479471	\N
480447	GENERIC_DAY	1	3	f	2011-04-07	2025	\N	479471	\N
480448	GENERIC_DAY	1	2	f	2011-04-04	2027	\N	479471	\N
480449	GENERIC_DAY	1	0	f	2011-04-02	2027	\N	479471	\N
480450	GENERIC_DAY	1	3	f	2011-04-15	2027	\N	479472	\N
480451	GENERIC_DAY	1	3	f	2011-04-14	2028	\N	479472	\N
480452	GENERIC_DAY	1	0	f	2011-04-03	2027	\N	479472	\N
480453	GENERIC_DAY	1	2	f	2011-04-08	2025	\N	479472	\N
480454	GENERIC_DAY	1	2	f	2011-04-12	2025	\N	479472	\N
480455	GENERIC_DAY	1	3	f	2011-04-01	2027	\N	479472	\N
480456	GENERIC_DAY	1	2	f	2011-04-07	2025	\N	479472	\N
480457	GENERIC_DAY	1	0	f	2011-04-02	2028	\N	479472	\N
480458	GENERIC_DAY	1	2	f	2011-04-13	2025	\N	479472	\N
480459	GENERIC_DAY	1	1	f	2011-04-19	2027	\N	479472	\N
480460	GENERIC_DAY	1	0	f	2011-04-09	2027	\N	479472	\N
480461	GENERIC_DAY	1	2	f	2011-04-01	2025	\N	479472	\N
480462	GENERIC_DAY	1	2	f	2011-04-05	2025	\N	479472	\N
480463	GENERIC_DAY	1	0	f	2011-04-16	2027	\N	479472	\N
480464	GENERIC_DAY	1	3	f	2011-04-12	2028	\N	479472	\N
480465	GENERIC_DAY	1	3	f	2011-04-13	2028	\N	479472	\N
480466	GENERIC_DAY	1	1	f	2011-04-19	2025	\N	479472	\N
480467	GENERIC_DAY	1	3	f	2011-04-14	2027	\N	479472	\N
480468	GENERIC_DAY	1	0	f	2011-04-10	2028	\N	479472	\N
480469	GENERIC_DAY	1	3	f	2011-04-18	2028	\N	479472	\N
480470	GENERIC_DAY	1	3	f	2011-04-05	2028	\N	479472	\N
480471	GENERIC_DAY	1	3	f	2011-04-06	2028	\N	479472	\N
480472	GENERIC_DAY	1	3	f	2011-04-11	2028	\N	479472	\N
480473	GENERIC_DAY	1	0	f	2011-04-17	2028	\N	479472	\N
480474	GENERIC_DAY	1	3	f	2011-04-08	2028	\N	479472	\N
480475	GENERIC_DAY	1	3	f	2011-04-13	2027	\N	479472	\N
480476	GENERIC_DAY	1	0	f	2011-04-16	2028	\N	479472	\N
480477	GENERIC_DAY	1	3	f	2011-04-04	2027	\N	479472	\N
480478	GENERIC_DAY	1	3	f	2011-04-04	2028	\N	479472	\N
480479	GENERIC_DAY	1	3	f	2011-04-06	2027	\N	479472	\N
480480	GENERIC_DAY	1	0	f	2011-04-02	2027	\N	479472	\N
480481	GENERIC_DAY	1	0	f	2011-04-16	2025	\N	479472	\N
480482	GENERIC_DAY	1	3	f	2011-04-15	2028	\N	479472	\N
480483	GENERIC_DAY	1	3	f	2011-04-12	2027	\N	479472	\N
480484	GENERIC_DAY	1	2	f	2011-04-18	2025	\N	479472	\N
480485	GENERIC_DAY	1	3	f	2011-04-18	2027	\N	479472	\N
480486	GENERIC_DAY	1	3	f	2011-04-01	2028	\N	479472	\N
480487	GENERIC_DAY	1	2	f	2011-04-11	2025	\N	479472	\N
480488	GENERIC_DAY	1	0	f	2011-04-09	2025	\N	479472	\N
480489	GENERIC_DAY	1	0	f	2011-04-02	2025	\N	479472	\N
480490	GENERIC_DAY	1	0	f	2011-04-10	2027	\N	479472	\N
480491	GENERIC_DAY	1	2	f	2011-04-14	2025	\N	479472	\N
480492	GENERIC_DAY	1	0	f	2011-04-17	2025	\N	479472	\N
480493	GENERIC_DAY	1	3	f	2011-04-05	2027	\N	479472	\N
480494	GENERIC_DAY	1	2	f	2011-04-19	2028	\N	479472	\N
480495	GENERIC_DAY	1	3	f	2011-04-07	2027	\N	479472	\N
480496	GENERIC_DAY	1	3	f	2011-04-11	2027	\N	479472	\N
480497	GENERIC_DAY	1	3	f	2011-04-07	2028	\N	479472	\N
480498	GENERIC_DAY	1	3	f	2011-04-08	2027	\N	479472	\N
480499	GENERIC_DAY	1	0	f	2011-04-03	2025	\N	479472	\N
480500	GENERIC_DAY	1	0	f	2011-04-03	2028	\N	479472	\N
480501	GENERIC_DAY	1	2	f	2011-04-04	2025	\N	479472	\N
480502	GENERIC_DAY	1	0	f	2011-04-10	2025	\N	479472	\N
480503	GENERIC_DAY	1	2	f	2011-04-06	2025	\N	479472	\N
480504	GENERIC_DAY	1	0	f	2011-04-09	2028	\N	479472	\N
480505	GENERIC_DAY	1	0	f	2011-04-17	2027	\N	479472	\N
480506	GENERIC_DAY	1	2	f	2011-04-15	2025	\N	479472	\N
480507	GENERIC_DAY	1	2	f	2011-04-27	2025	\N	479473	\N
480508	GENERIC_DAY	1	0	f	2011-04-30	2028	\N	479473	\N
480509	GENERIC_DAY	1	3	f	2011-04-26	2027	\N	479473	\N
480510	GENERIC_DAY	1	3	f	2011-05-04	2027	\N	479473	\N
480511	GENERIC_DAY	1	2	f	2011-04-29	2025	\N	479473	\N
480512	GENERIC_DAY	1	3	f	2011-04-22	2027	\N	479473	\N
480513	GENERIC_DAY	1	0	f	2011-05-01	2027	\N	479473	\N
480514	GENERIC_DAY	1	3	f	2011-04-27	2027	\N	479473	\N
480515	GENERIC_DAY	1	0	f	2011-04-30	2027	\N	479473	\N
480516	GENERIC_DAY	1	0	f	2011-04-24	2025	\N	479473	\N
480517	GENERIC_DAY	1	3	f	2011-04-26	2028	\N	479473	\N
480518	GENERIC_DAY	1	3	f	2011-04-29	2028	\N	479473	\N
480519	GENERIC_DAY	1	2	f	2011-04-21	2025	\N	479473	\N
480520	GENERIC_DAY	1	2	f	2011-04-28	2025	\N	479473	\N
480521	GENERIC_DAY	1	3	f	2011-04-22	2028	\N	479473	\N
480522	GENERIC_DAY	1	2	f	2011-04-26	2025	\N	479473	\N
480523	GENERIC_DAY	1	0	f	2011-04-24	2027	\N	479473	\N
480524	GENERIC_DAY	1	0	f	2011-05-01	2028	\N	479473	\N
480525	GENERIC_DAY	1	3	f	2011-04-28	2028	\N	479473	\N
480526	GENERIC_DAY	1	3	f	2011-04-20	2028	\N	479473	\N
480527	GENERIC_DAY	1	3	f	2011-04-25	2027	\N	479473	\N
480528	GENERIC_DAY	1	3	f	2011-04-25	2028	\N	479473	\N
480529	GENERIC_DAY	1	1	f	2011-05-06	2025	\N	479473	\N
480530	GENERIC_DAY	1	2	f	2011-05-02	2025	\N	479473	\N
480531	GENERIC_DAY	1	0	f	2011-05-01	2025	\N	479473	\N
480532	GENERIC_DAY	1	0	f	2011-04-23	2028	\N	479473	\N
480533	GENERIC_DAY	1	2	f	2011-05-03	2025	\N	479473	\N
480534	GENERIC_DAY	1	3	f	2011-05-02	2027	\N	479473	\N
480535	GENERIC_DAY	1	2	f	2011-05-06	2027	\N	479473	\N
480536	GENERIC_DAY	1	3	f	2011-04-21	2027	\N	479473	\N
480537	GENERIC_DAY	1	3	f	2011-05-02	2028	\N	479473	\N
480538	GENERIC_DAY	1	3	f	2011-04-28	2027	\N	479473	\N
480539	GENERIC_DAY	1	3	f	2011-05-03	2027	\N	479473	\N
480540	GENERIC_DAY	1	1	f	2011-05-06	2028	\N	479473	\N
480541	GENERIC_DAY	1	0	f	2011-04-23	2027	\N	479473	\N
480542	GENERIC_DAY	1	3	f	2011-04-20	2027	\N	479473	\N
480543	GENERIC_DAY	1	2	f	2011-04-25	2025	\N	479473	\N
480544	GENERIC_DAY	1	3	f	2011-05-05	2028	\N	479473	\N
480545	GENERIC_DAY	1	3	f	2011-05-05	2027	\N	479473	\N
480546	GENERIC_DAY	1	2	f	2011-04-20	2025	\N	479473	\N
480547	GENERIC_DAY	1	3	f	2011-04-21	2028	\N	479473	\N
480548	GENERIC_DAY	1	0	f	2011-04-24	2028	\N	479473	\N
480549	GENERIC_DAY	1	3	f	2011-05-03	2028	\N	479473	\N
480550	GENERIC_DAY	1	3	f	2011-04-27	2028	\N	479473	\N
480551	GENERIC_DAY	1	0	f	2011-04-30	2025	\N	479473	\N
480552	GENERIC_DAY	1	2	f	2011-05-05	2025	\N	479473	\N
480553	GENERIC_DAY	1	0	f	2011-04-23	2025	\N	479473	\N
480554	GENERIC_DAY	1	2	f	2011-05-04	2025	\N	479473	\N
480555	GENERIC_DAY	1	3	f	2011-05-04	2028	\N	479473	\N
480556	GENERIC_DAY	1	3	f	2011-04-29	2027	\N	479473	\N
480557	GENERIC_DAY	1	2	f	2011-04-22	2025	\N	479473	\N
480558	GENERIC_DAY	1	2	f	2011-04-26	2027	\N	479474	\N
480559	GENERIC_DAY	1	2	f	2011-04-29	2027	\N	479474	\N
480560	GENERIC_DAY	1	2	f	2011-04-25	2028	\N	479474	\N
480561	GENERIC_DAY	1	2	f	2011-05-05	2028	\N	479474	\N
480562	GENERIC_DAY	1	2	f	2011-04-29	2028	\N	479474	\N
480563	GENERIC_DAY	1	4	f	2011-04-26	2025	\N	479474	\N
480564	GENERIC_DAY	1	2	f	2011-04-20	2027	\N	479474	\N
480565	GENERIC_DAY	1	0	f	2011-05-01	2027	\N	479474	\N
480566	GENERIC_DAY	1	0	f	2011-05-01	2028	\N	479474	\N
480567	GENERIC_DAY	1	0	f	2011-04-24	2025	\N	479474	\N
480568	GENERIC_DAY	1	2	f	2011-05-02	2028	\N	479474	\N
480569	GENERIC_DAY	1	2	f	2011-05-03	2027	\N	479474	\N
480570	GENERIC_DAY	1	1	f	2011-05-06	2027	\N	479474	\N
480571	GENERIC_DAY	1	0	f	2011-04-23	2028	\N	479474	\N
480572	GENERIC_DAY	1	2	f	2011-04-22	2027	\N	479474	\N
480573	GENERIC_DAY	1	4	f	2011-04-27	2025	\N	479474	\N
480574	GENERIC_DAY	1	0	f	2011-04-30	2028	\N	479474	\N
480575	GENERIC_DAY	1	4	f	2011-05-02	2025	\N	479474	\N
480576	GENERIC_DAY	1	2	f	2011-05-06	2025	\N	479474	\N
480577	GENERIC_DAY	1	0	f	2011-04-23	2027	\N	479474	\N
480578	GENERIC_DAY	1	2	f	2011-04-26	2028	\N	479474	\N
480579	GENERIC_DAY	1	2	f	2011-04-28	2028	\N	479474	\N
480580	GENERIC_DAY	1	1	f	2011-05-06	2028	\N	479474	\N
480581	GENERIC_DAY	1	4	f	2011-04-22	2025	\N	479474	\N
480582	GENERIC_DAY	1	0	f	2011-04-23	2025	\N	479474	\N
480583	GENERIC_DAY	1	2	f	2011-04-22	2028	\N	479474	\N
480584	GENERIC_DAY	1	2	f	2011-04-21	2027	\N	479474	\N
480585	GENERIC_DAY	1	2	f	2011-05-04	2027	\N	479474	\N
480586	GENERIC_DAY	1	0	f	2011-04-30	2025	\N	479474	\N
480587	GENERIC_DAY	1	4	f	2011-04-21	2025	\N	479474	\N
480588	GENERIC_DAY	1	2	f	2011-05-04	2028	\N	479474	\N
480589	GENERIC_DAY	1	4	f	2011-05-04	2025	\N	479474	\N
480590	GENERIC_DAY	1	4	f	2011-05-05	2025	\N	479474	\N
480591	GENERIC_DAY	1	0	f	2011-05-01	2025	\N	479474	\N
480592	GENERIC_DAY	1	2	f	2011-04-20	2028	\N	479474	\N
480593	GENERIC_DAY	1	2	f	2011-05-03	2028	\N	479474	\N
480594	GENERIC_DAY	1	4	f	2011-04-25	2025	\N	479474	\N
480595	GENERIC_DAY	1	2	f	2011-04-28	2027	\N	479474	\N
480596	GENERIC_DAY	1	0	f	2011-04-24	2027	\N	479474	\N
480597	GENERIC_DAY	1	4	f	2011-04-28	2025	\N	479474	\N
480598	GENERIC_DAY	1	2	f	2011-04-27	2027	\N	479474	\N
480599	GENERIC_DAY	1	0	f	2011-04-30	2027	\N	479474	\N
480600	GENERIC_DAY	1	2	f	2011-04-21	2028	\N	479474	\N
480601	GENERIC_DAY	1	2	f	2011-04-25	2027	\N	479474	\N
480602	GENERIC_DAY	1	2	f	2011-05-02	2027	\N	479474	\N
480603	GENERIC_DAY	1	2	f	2011-05-05	2027	\N	479474	\N
480604	GENERIC_DAY	1	0	f	2011-04-24	2028	\N	479474	\N
480605	GENERIC_DAY	1	4	f	2011-05-03	2025	\N	479474	\N
480606	GENERIC_DAY	1	4	f	2011-04-20	2025	\N	479474	\N
480607	GENERIC_DAY	1	4	f	2011-04-29	2025	\N	479474	\N
480608	GENERIC_DAY	1	2	f	2011-04-27	2028	\N	479474	\N
480609	GENERIC_DAY	1	3	f	2011-04-26	2028	\N	479475	\N
480610	GENERIC_DAY	1	0	f	2011-04-30	2025	\N	479475	\N
480611	GENERIC_DAY	1	3	f	2011-04-28	2027	\N	479475	\N
480612	GENERIC_DAY	1	3	f	2011-04-21	2027	\N	479475	\N
480613	GENERIC_DAY	1	0	f	2011-04-30	2027	\N	479475	\N
480614	GENERIC_DAY	1	0	f	2011-04-23	2028	\N	479475	\N
480615	GENERIC_DAY	1	2	f	2011-04-26	2025	\N	479475	\N
480616	GENERIC_DAY	1	0	f	2011-04-24	2028	\N	479475	\N
480617	GENERIC_DAY	1	2	f	2011-04-22	2025	\N	479475	\N
480618	GENERIC_DAY	1	3	f	2011-05-05	2027	\N	479475	\N
480619	GENERIC_DAY	1	2	f	2011-04-21	2025	\N	479475	\N
480620	GENERIC_DAY	1	3	f	2011-05-02	2027	\N	479475	\N
480621	GENERIC_DAY	1	2	f	2011-04-27	2025	\N	479475	\N
480622	GENERIC_DAY	1	0	f	2011-05-01	2025	\N	479475	\N
480623	GENERIC_DAY	1	0	f	2011-04-30	2028	\N	479475	\N
480624	GENERIC_DAY	1	1	f	2011-05-06	2027	\N	479475	\N
480625	GENERIC_DAY	1	2	f	2011-05-05	2025	\N	479475	\N
480626	GENERIC_DAY	1	2	f	2011-05-03	2025	\N	479475	\N
480627	GENERIC_DAY	1	3	f	2011-05-03	2027	\N	479475	\N
480628	GENERIC_DAY	1	3	f	2011-04-27	2027	\N	479475	\N
480629	GENERIC_DAY	1	2	f	2011-05-06	2028	\N	479475	\N
480630	GENERIC_DAY	1	0	f	2011-05-01	2027	\N	479475	\N
480631	GENERIC_DAY	1	3	f	2011-04-29	2027	\N	479475	\N
480632	GENERIC_DAY	1	3	f	2011-04-28	2028	\N	479475	\N
480633	GENERIC_DAY	1	2	f	2011-05-02	2025	\N	479475	\N
480634	GENERIC_DAY	1	3	f	2011-04-25	2027	\N	479475	\N
480635	GENERIC_DAY	1	3	f	2011-04-25	2028	\N	479475	\N
480636	GENERIC_DAY	1	2	f	2011-04-28	2025	\N	479475	\N
480637	GENERIC_DAY	1	3	f	2011-04-29	2028	\N	479475	\N
480638	GENERIC_DAY	1	0	f	2011-04-24	2027	\N	479475	\N
480639	GENERIC_DAY	1	3	f	2011-04-27	2028	\N	479475	\N
480640	GENERIC_DAY	1	3	f	2011-04-20	2027	\N	479475	\N
480641	GENERIC_DAY	1	2	f	2011-04-29	2025	\N	479475	\N
480642	GENERIC_DAY	1	0	f	2011-04-24	2025	\N	479475	\N
480643	GENERIC_DAY	1	3	f	2011-04-22	2028	\N	479475	\N
480644	GENERIC_DAY	1	3	f	2011-05-04	2028	\N	479475	\N
480645	GENERIC_DAY	1	2	f	2011-04-20	2025	\N	479475	\N
480646	GENERIC_DAY	1	2	f	2011-04-25	2025	\N	479475	\N
480647	GENERIC_DAY	1	3	f	2011-05-03	2028	\N	479475	\N
480648	GENERIC_DAY	1	2	f	2011-05-04	2025	\N	479475	\N
480649	GENERIC_DAY	1	3	f	2011-05-04	2027	\N	479475	\N
480650	GENERIC_DAY	1	3	f	2011-04-26	2027	\N	479475	\N
480651	GENERIC_DAY	1	0	f	2011-04-23	2027	\N	479475	\N
480652	GENERIC_DAY	1	3	f	2011-04-22	2027	\N	479475	\N
480653	GENERIC_DAY	1	0	f	2011-05-01	2028	\N	479475	\N
480654	GENERIC_DAY	1	3	f	2011-04-21	2028	\N	479475	\N
480655	GENERIC_DAY	1	3	f	2011-05-05	2028	\N	479475	\N
480656	GENERIC_DAY	1	3	f	2011-05-02	2028	\N	479475	\N
480657	GENERIC_DAY	1	1	f	2011-05-06	2025	\N	479475	\N
480658	GENERIC_DAY	1	0	f	2011-04-23	2025	\N	479475	\N
480659	GENERIC_DAY	1	3	f	2011-04-20	2028	\N	479475	\N
480660	GENERIC_DAY	1	0	f	2011-05-15	2025	\N	479476	\N
480661	GENERIC_DAY	1	3	f	2011-05-12	2025	\N	479476	\N
480662	GENERIC_DAY	1	2	f	2011-05-11	2028	\N	479476	\N
480663	GENERIC_DAY	1	3	f	2011-05-16	2027	\N	479476	\N
480664	GENERIC_DAY	1	3	f	2011-05-16	2025	\N	479476	\N
480665	GENERIC_DAY	1	1	f	2011-05-25	2028	\N	479476	\N
480666	GENERIC_DAY	1	0	f	2011-05-21	2025	\N	479476	\N
480667	GENERIC_DAY	1	3	f	2011-05-20	2027	\N	479476	\N
480668	GENERIC_DAY	1	2	f	2011-05-25	2025	\N	479476	\N
480669	GENERIC_DAY	1	0	f	2011-05-08	2025	\N	479476	\N
480670	GENERIC_DAY	1	0	f	2011-05-07	2028	\N	479476	\N
480671	GENERIC_DAY	1	3	f	2011-05-19	2027	\N	479476	\N
480672	GENERIC_DAY	1	0	f	2011-05-14	2025	\N	479476	\N
480673	GENERIC_DAY	1	0	f	2011-05-22	2027	\N	479476	\N
480674	GENERIC_DAY	1	0	f	2011-05-08	2027	\N	479476	\N
480675	GENERIC_DAY	1	2	f	2011-05-10	2028	\N	479476	\N
480676	GENERIC_DAY	1	0	f	2011-05-15	2028	\N	479476	\N
480677	GENERIC_DAY	1	0	f	2011-05-14	2027	\N	479476	\N
480678	GENERIC_DAY	1	2	f	2011-05-20	2028	\N	479476	\N
480679	GENERIC_DAY	1	3	f	2011-05-17	2025	\N	479476	\N
480680	GENERIC_DAY	1	3	f	2011-05-24	2027	\N	479476	\N
480681	GENERIC_DAY	1	1	f	2011-05-25	2027	\N	479476	\N
480682	GENERIC_DAY	1	3	f	2011-05-10	2027	\N	479476	\N
480683	GENERIC_DAY	1	2	f	2011-05-09	2028	\N	479476	\N
480684	GENERIC_DAY	1	2	f	2011-05-24	2028	\N	479476	\N
480685	GENERIC_DAY	1	3	f	2011-05-09	2025	\N	479476	\N
480686	GENERIC_DAY	1	3	f	2011-05-20	2025	\N	479476	\N
480687	GENERIC_DAY	1	2	f	2011-05-19	2028	\N	479476	\N
480688	GENERIC_DAY	1	3	f	2011-05-19	2025	\N	479476	\N
480689	GENERIC_DAY	1	0	f	2011-05-22	2025	\N	479476	\N
480690	GENERIC_DAY	1	3	f	2011-05-11	2025	\N	479476	\N
480691	GENERIC_DAY	1	2	f	2011-05-23	2028	\N	479476	\N
480692	GENERIC_DAY	1	3	f	2011-05-11	2027	\N	479476	\N
480693	GENERIC_DAY	1	0	f	2011-05-21	2028	\N	479476	\N
480694	GENERIC_DAY	1	0	f	2011-05-15	2027	\N	479476	\N
480695	GENERIC_DAY	1	3	f	2011-05-23	2027	\N	479476	\N
480696	GENERIC_DAY	1	2	f	2011-05-17	2028	\N	479476	\N
480697	GENERIC_DAY	1	3	f	2011-05-18	2025	\N	479476	\N
480698	GENERIC_DAY	1	0	f	2011-05-08	2028	\N	479476	\N
480699	GENERIC_DAY	1	0	f	2011-05-07	2027	\N	479476	\N
480700	GENERIC_DAY	1	3	f	2011-05-12	2027	\N	479476	\N
480701	GENERIC_DAY	1	3	f	2011-05-24	2025	\N	479476	\N
480702	GENERIC_DAY	1	3	f	2011-05-17	2027	\N	479476	\N
480703	GENERIC_DAY	1	0	f	2011-05-14	2028	\N	479476	\N
480704	GENERIC_DAY	1	3	f	2011-05-13	2027	\N	479476	\N
480705	GENERIC_DAY	1	3	f	2011-05-18	2027	\N	479476	\N
480706	GENERIC_DAY	1	2	f	2011-05-13	2028	\N	479476	\N
480707	GENERIC_DAY	1	2	f	2011-05-18	2028	\N	479476	\N
480708	GENERIC_DAY	1	3	f	2011-05-09	2027	\N	479476	\N
480709	GENERIC_DAY	1	0	f	2011-05-22	2028	\N	479476	\N
480710	GENERIC_DAY	1	0	f	2011-05-21	2027	\N	479476	\N
480711	GENERIC_DAY	1	3	f	2011-05-23	2025	\N	479476	\N
480712	GENERIC_DAY	1	3	f	2011-05-13	2025	\N	479476	\N
480713	GENERIC_DAY	1	3	f	2011-05-10	2025	\N	479476	\N
480714	GENERIC_DAY	1	2	f	2011-05-12	2028	\N	479476	\N
480715	GENERIC_DAY	1	0	f	2011-05-07	2025	\N	479476	\N
480716	GENERIC_DAY	1	2	f	2011-05-16	2028	\N	479476	\N
480717	GENERIC_DAY	1	2	f	2011-05-10	2027	\N	479477	\N
480718	GENERIC_DAY	1	2	f	2011-05-24	2027	\N	479477	\N
480719	GENERIC_DAY	1	3	f	2011-05-13	2025	\N	479477	\N
480720	GENERIC_DAY	1	3	f	2011-05-23	2028	\N	479477	\N
480721	GENERIC_DAY	1	3	f	2011-05-12	2028	\N	479477	\N
480722	GENERIC_DAY	1	3	f	2011-05-23	2025	\N	479477	\N
480723	GENERIC_DAY	1	0	f	2011-05-21	2025	\N	479477	\N
480724	GENERIC_DAY	1	3	f	2011-05-18	2025	\N	479477	\N
480725	GENERIC_DAY	1	3	f	2011-05-24	2028	\N	479477	\N
480726	GENERIC_DAY	1	0	f	2011-05-07	2025	\N	479477	\N
480727	GENERIC_DAY	1	3	f	2011-05-20	2025	\N	479477	\N
480728	GENERIC_DAY	1	0	f	2011-05-07	2027	\N	479477	\N
480729	GENERIC_DAY	1	0	f	2011-05-14	2027	\N	479477	\N
480730	GENERIC_DAY	1	3	f	2011-05-10	2028	\N	479477	\N
480731	GENERIC_DAY	1	0	f	2011-05-14	2028	\N	479477	\N
480732	GENERIC_DAY	1	0	f	2011-05-22	2027	\N	479477	\N
480733	GENERIC_DAY	1	0	f	2011-05-15	2027	\N	479477	\N
480734	GENERIC_DAY	1	0	f	2011-05-08	2025	\N	479477	\N
480735	GENERIC_DAY	1	3	f	2011-05-13	2028	\N	479477	\N
480736	GENERIC_DAY	1	3	f	2011-05-18	2028	\N	479477	\N
480737	GENERIC_DAY	1	3	f	2011-05-12	2025	\N	479477	\N
480738	GENERIC_DAY	1	0	f	2011-05-15	2025	\N	479477	\N
480739	GENERIC_DAY	1	2	f	2011-05-09	2027	\N	479477	\N
480740	GENERIC_DAY	1	0	f	2011-05-22	2028	\N	479477	\N
480741	GENERIC_DAY	1	3	f	2011-05-19	2028	\N	479477	\N
480742	GENERIC_DAY	1	0	f	2011-05-08	2027	\N	479477	\N
480743	GENERIC_DAY	1	0	f	2011-05-14	2025	\N	479477	\N
480744	GENERIC_DAY	1	2	f	2011-05-23	2027	\N	479477	\N
480745	GENERIC_DAY	1	0	f	2011-05-21	2028	\N	479477	\N
480746	GENERIC_DAY	1	2	f	2011-05-13	2027	\N	479477	\N
480747	GENERIC_DAY	1	3	f	2011-05-16	2025	\N	479477	\N
480748	GENERIC_DAY	1	3	f	2011-05-11	2028	\N	479477	\N
480749	GENERIC_DAY	1	3	f	2011-05-10	2025	\N	479477	\N
480750	GENERIC_DAY	1	3	f	2011-05-20	2028	\N	479477	\N
480751	GENERIC_DAY	1	3	f	2011-05-09	2025	\N	479477	\N
480752	GENERIC_DAY	1	2	f	2011-05-18	2027	\N	479477	\N
480753	GENERIC_DAY	1	3	f	2011-05-16	2028	\N	479477	\N
480754	GENERIC_DAY	1	0	f	2011-05-15	2028	\N	479477	\N
480755	GENERIC_DAY	1	0	f	2011-05-21	2027	\N	479477	\N
480756	GENERIC_DAY	1	1	f	2011-05-25	2025	\N	479477	\N
480757	GENERIC_DAY	1	3	f	2011-05-09	2028	\N	479477	\N
480758	GENERIC_DAY	1	3	f	2011-05-24	2025	\N	479477	\N
480759	GENERIC_DAY	1	2	f	2011-05-16	2027	\N	479477	\N
480760	GENERIC_DAY	1	0	f	2011-05-22	2025	\N	479477	\N
480761	GENERIC_DAY	1	2	f	2011-05-20	2027	\N	479477	\N
480762	GENERIC_DAY	1	2	f	2011-05-12	2027	\N	479477	\N
480763	GENERIC_DAY	1	0	f	2011-05-08	2028	\N	479477	\N
480764	GENERIC_DAY	1	3	f	2011-05-17	2025	\N	479477	\N
480765	GENERIC_DAY	1	2	f	2011-05-17	2027	\N	479477	\N
480766	GENERIC_DAY	1	3	f	2011-05-11	2025	\N	479477	\N
480767	GENERIC_DAY	1	3	f	2011-05-19	2025	\N	479477	\N
480768	GENERIC_DAY	1	3	f	2011-05-17	2028	\N	479477	\N
480769	GENERIC_DAY	1	2	f	2011-05-11	2027	\N	479477	\N
480770	GENERIC_DAY	1	1	f	2011-05-25	2028	\N	479477	\N
480771	GENERIC_DAY	1	2	f	2011-05-19	2027	\N	479477	\N
480772	GENERIC_DAY	1	2	f	2011-05-25	2027	\N	479477	\N
480773	GENERIC_DAY	1	0	f	2011-05-07	2028	\N	479477	\N
480774	GENERIC_DAY	1	2	f	2011-05-16	2025	\N	479478	\N
480775	GENERIC_DAY	1	2	f	2011-05-23	2025	\N	479478	\N
480776	GENERIC_DAY	1	0	f	2011-05-22	2027	\N	479478	\N
480777	GENERIC_DAY	1	0	f	2011-05-14	2027	\N	479478	\N
480778	GENERIC_DAY	1	0	f	2011-05-14	2028	\N	479478	\N
480779	GENERIC_DAY	1	3	f	2011-05-13	2027	\N	479478	\N
480780	GENERIC_DAY	1	3	f	2011-05-09	2028	\N	479478	\N
480781	GENERIC_DAY	1	1	f	2011-05-25	2025	\N	479478	\N
480782	GENERIC_DAY	1	0	f	2011-05-21	2028	\N	479478	\N
480783	GENERIC_DAY	1	2	f	2011-05-24	2025	\N	479478	\N
480784	GENERIC_DAY	1	3	f	2011-05-11	2028	\N	479478	\N
480785	GENERIC_DAY	1	3	f	2011-05-16	2028	\N	479478	\N
480786	GENERIC_DAY	1	3	f	2011-05-18	2027	\N	479478	\N
480787	GENERIC_DAY	1	1	f	2011-05-25	2027	\N	479478	\N
480788	GENERIC_DAY	1	3	f	2011-05-24	2028	\N	479478	\N
480789	GENERIC_DAY	1	3	f	2011-05-17	2028	\N	479478	\N
480790	GENERIC_DAY	1	0	f	2011-05-14	2025	\N	479478	\N
480791	GENERIC_DAY	1	3	f	2011-05-23	2027	\N	479478	\N
480792	GENERIC_DAY	1	0	f	2011-05-21	2027	\N	479478	\N
480793	GENERIC_DAY	1	3	f	2011-05-10	2028	\N	479478	\N
480794	GENERIC_DAY	1	3	f	2011-05-19	2027	\N	479478	\N
480795	GENERIC_DAY	1	2	f	2011-05-17	2025	\N	479478	\N
480796	GENERIC_DAY	1	0	f	2011-05-21	2025	\N	479478	\N
480797	GENERIC_DAY	1	3	f	2011-05-16	2027	\N	479478	\N
480798	GENERIC_DAY	1	0	f	2011-05-15	2027	\N	479478	\N
480799	GENERIC_DAY	1	3	f	2011-05-19	2028	\N	479478	\N
480800	GENERIC_DAY	1	0	f	2011-05-07	2027	\N	479478	\N
480801	GENERIC_DAY	1	3	f	2011-05-23	2028	\N	479478	\N
480802	GENERIC_DAY	1	2	f	2011-05-20	2025	\N	479478	\N
480803	GENERIC_DAY	1	0	f	2011-05-22	2025	\N	479478	\N
480804	GENERIC_DAY	1	3	f	2011-05-09	2027	\N	479478	\N
480805	GENERIC_DAY	1	2	f	2011-05-18	2025	\N	479478	\N
480806	GENERIC_DAY	1	3	f	2011-05-12	2027	\N	479478	\N
480807	GENERIC_DAY	1	3	f	2011-05-11	2027	\N	479478	\N
480808	GENERIC_DAY	1	0	f	2011-05-07	2025	\N	479478	\N
480809	GENERIC_DAY	1	0	f	2011-05-15	2025	\N	479478	\N
480810	GENERIC_DAY	1	3	f	2011-05-20	2027	\N	479478	\N
480811	GENERIC_DAY	1	3	f	2011-05-10	2027	\N	479478	\N
480812	GENERIC_DAY	1	0	f	2011-05-08	2025	\N	479478	\N
480813	GENERIC_DAY	1	0	f	2011-05-08	2027	\N	479478	\N
480814	GENERIC_DAY	1	2	f	2011-05-12	2025	\N	479478	\N
480815	GENERIC_DAY	1	3	f	2011-05-24	2027	\N	479478	\N
480816	GENERIC_DAY	1	0	f	2011-05-08	2028	\N	479478	\N
480817	GENERIC_DAY	1	3	f	2011-05-18	2028	\N	479478	\N
480818	GENERIC_DAY	1	2	f	2011-05-09	2025	\N	479478	\N
480819	GENERIC_DAY	1	3	f	2011-05-17	2027	\N	479478	\N
480820	GENERIC_DAY	1	3	f	2011-05-13	2028	\N	479478	\N
480821	GENERIC_DAY	1	2	f	2011-05-11	2025	\N	479478	\N
480822	GENERIC_DAY	1	3	f	2011-05-12	2028	\N	479478	\N
480823	GENERIC_DAY	1	2	f	2011-05-25	2028	\N	479478	\N
480824	GENERIC_DAY	1	3	f	2011-05-20	2028	\N	479478	\N
480825	GENERIC_DAY	1	0	f	2011-05-22	2028	\N	479478	\N
480826	GENERIC_DAY	1	2	f	2011-05-13	2025	\N	479478	\N
480827	GENERIC_DAY	1	0	f	2011-05-07	2028	\N	479478	\N
480828	GENERIC_DAY	1	0	f	2011-05-15	2028	\N	479478	\N
480829	GENERIC_DAY	1	2	f	2011-05-10	2025	\N	479478	\N
480830	GENERIC_DAY	1	2	f	2011-05-19	2025	\N	479478	\N
480831	GENERIC_DAY	1	8	f	2011-05-26	2028	\N	479479	\N
480832	GENERIC_DAY	1	8	f	2011-05-30	2025	\N	479479	\N
480833	GENERIC_DAY	1	0	f	2011-05-28	2028	\N	479479	\N
480834	GENERIC_DAY	1	1	f	2011-06-01	2028	\N	479479	\N
480835	GENERIC_DAY	1	8	f	2011-05-31	2028	\N	479479	\N
480836	GENERIC_DAY	1	2	f	2011-06-01	2025	\N	479479	\N
480837	GENERIC_DAY	1	0	f	2011-05-28	2025	\N	479479	\N
480838	GENERIC_DAY	1	8	f	2011-05-30	2028	\N	479479	\N
480839	GENERIC_DAY	1	8	f	2011-05-27	2027	\N	479479	\N
480840	GENERIC_DAY	1	8	f	2011-05-26	2025	\N	479479	\N
480841	GENERIC_DAY	1	8	f	2011-05-31	2025	\N	479479	\N
480842	GENERIC_DAY	1	8	f	2011-05-30	2027	\N	479479	\N
480843	GENERIC_DAY	1	8	f	2011-05-27	2028	\N	479479	\N
480844	GENERIC_DAY	1	1	f	2011-06-01	2027	\N	479479	\N
480845	GENERIC_DAY	1	8	f	2011-05-27	2025	\N	479479	\N
480846	GENERIC_DAY	1	0	f	2011-05-29	2028	\N	479479	\N
480847	GENERIC_DAY	1	0	f	2011-05-29	2025	\N	479479	\N
480848	GENERIC_DAY	1	0	f	2011-05-29	2027	\N	479479	\N
480849	GENERIC_DAY	1	8	f	2011-05-31	2027	\N	479479	\N
480850	GENERIC_DAY	1	8	f	2011-05-26	2027	\N	479479	\N
480851	GENERIC_DAY	1	0	f	2011-05-28	2027	\N	479479	\N
480852	GENERIC_DAY	1	4	f	2011-04-04	299989	\N	479480	\N
480853	GENERIC_DAY	1	4	f	2011-04-07	299987	\N	479480	\N
480854	GENERIC_DAY	1	4	f	2011-04-05	299987	\N	479480	\N
480855	GENERIC_DAY	1	4	f	2011-04-11	299987	\N	479480	\N
480856	GENERIC_DAY	1	4	f	2011-04-15	299989	\N	479480	\N
480857	GENERIC_DAY	1	4	f	2011-04-01	299989	\N	479480	\N
480858	GENERIC_DAY	1	0	f	2011-04-09	299989	\N	479480	\N
480859	GENERIC_DAY	1	4	f	2011-04-07	299989	\N	479480	\N
480860	GENERIC_DAY	1	4	f	2011-04-12	299989	\N	479480	\N
480861	GENERIC_DAY	1	2	f	2011-04-19	299989	\N	479480	\N
480862	GENERIC_DAY	1	4	f	2011-04-13	299987	\N	479480	\N
480863	GENERIC_DAY	1	4	f	2011-04-08	299987	\N	479480	\N
480864	GENERIC_DAY	1	0	f	2011-04-16	299987	\N	479480	\N
480865	GENERIC_DAY	1	4	f	2011-04-05	299989	\N	479480	\N
480866	GENERIC_DAY	1	4	f	2011-04-08	299989	\N	479480	\N
480867	GENERIC_DAY	1	4	f	2011-04-14	299987	\N	479480	\N
480868	GENERIC_DAY	1	4	f	2011-04-18	299989	\N	479480	\N
480869	GENERIC_DAY	1	4	f	2011-04-18	299987	\N	479480	\N
480870	GENERIC_DAY	1	4	f	2011-04-06	299987	\N	479480	\N
480871	GENERIC_DAY	1	0	f	2011-04-10	299989	\N	479480	\N
480872	GENERIC_DAY	1	4	f	2011-04-14	299989	\N	479480	\N
480873	GENERIC_DAY	1	4	f	2011-04-12	299987	\N	479480	\N
480874	GENERIC_DAY	1	0	f	2011-04-02	299987	\N	479480	\N
480875	GENERIC_DAY	1	0	f	2011-04-09	299987	\N	479480	\N
480876	GENERIC_DAY	1	0	f	2011-04-16	299989	\N	479480	\N
480877	GENERIC_DAY	1	4	f	2011-04-01	299987	\N	479480	\N
480878	GENERIC_DAY	1	0	f	2011-04-02	299989	\N	479480	\N
480879	GENERIC_DAY	1	4	f	2011-04-13	299989	\N	479480	\N
480880	GENERIC_DAY	1	0	f	2011-04-17	299987	\N	479480	\N
480881	GENERIC_DAY	1	4	f	2011-04-06	299989	\N	479480	\N
480882	GENERIC_DAY	1	2	f	2011-04-19	299987	\N	479480	\N
480883	GENERIC_DAY	1	4	f	2011-04-11	299989	\N	479480	\N
480884	GENERIC_DAY	1	0	f	2011-04-17	299989	\N	479480	\N
480885	GENERIC_DAY	1	4	f	2011-04-15	299987	\N	479480	\N
480886	GENERIC_DAY	1	0	f	2011-04-10	299987	\N	479480	\N
480887	GENERIC_DAY	1	4	f	2011-04-04	299987	\N	479480	\N
480888	GENERIC_DAY	1	0	f	2011-04-03	299989	\N	479480	\N
480889	GENERIC_DAY	1	0	f	2011-04-03	299987	\N	479480	\N
480890	GENERIC_DAY	1	0	f	2011-04-03	299989	\N	479481	\N
480891	GENERIC_DAY	1	4	f	2011-04-07	299989	\N	479481	\N
480892	GENERIC_DAY	1	0	f	2011-04-03	299987	\N	479481	\N
480893	GENERIC_DAY	1	4	f	2011-04-04	299987	\N	479481	\N
480894	GENERIC_DAY	1	0	f	2011-04-09	299987	\N	479481	\N
480895	GENERIC_DAY	1	4	f	2011-04-18	299987	\N	479481	\N
480896	GENERIC_DAY	1	4	f	2011-04-01	299987	\N	479481	\N
480897	GENERIC_DAY	1	0	f	2011-04-02	299987	\N	479481	\N
480898	GENERIC_DAY	1	4	f	2011-04-06	299989	\N	479481	\N
480899	GENERIC_DAY	1	0	f	2011-04-10	299989	\N	479481	\N
480900	GENERIC_DAY	1	0	f	2011-04-16	299989	\N	479481	\N
480901	GENERIC_DAY	1	2	f	2011-04-19	299987	\N	479481	\N
480902	GENERIC_DAY	1	4	f	2011-04-08	299989	\N	479481	\N
480903	GENERIC_DAY	1	4	f	2011-04-05	299987	\N	479481	\N
480904	GENERIC_DAY	1	4	f	2011-04-07	299987	\N	479481	\N
480905	GENERIC_DAY	1	4	f	2011-04-15	299987	\N	479481	\N
480906	GENERIC_DAY	1	4	f	2011-04-13	299987	\N	479481	\N
480907	GENERIC_DAY	1	4	f	2011-04-06	299987	\N	479481	\N
480908	GENERIC_DAY	1	0	f	2011-04-09	299989	\N	479481	\N
480909	GENERIC_DAY	1	4	f	2011-04-18	299989	\N	479481	\N
480910	GENERIC_DAY	1	4	f	2011-04-13	299989	\N	479481	\N
480911	GENERIC_DAY	1	0	f	2011-04-17	299989	\N	479481	\N
480912	GENERIC_DAY	1	0	f	2011-04-16	299987	\N	479481	\N
480913	GENERIC_DAY	1	4	f	2011-04-12	299989	\N	479481	\N
480914	GENERIC_DAY	1	4	f	2011-04-14	299989	\N	479481	\N
480915	GENERIC_DAY	1	4	f	2011-04-14	299987	\N	479481	\N
480916	GENERIC_DAY	1	0	f	2011-04-17	299987	\N	479481	\N
480917	GENERIC_DAY	1	4	f	2011-04-05	299989	\N	479481	\N
480918	GENERIC_DAY	1	4	f	2011-04-08	299987	\N	479481	\N
480919	GENERIC_DAY	1	0	f	2011-04-10	299987	\N	479481	\N
480920	GENERIC_DAY	1	4	f	2011-04-04	299989	\N	479481	\N
480921	GENERIC_DAY	1	4	f	2011-04-11	299989	\N	479481	\N
480922	GENERIC_DAY	1	4	f	2011-04-12	299987	\N	479481	\N
480923	GENERIC_DAY	1	2	f	2011-04-19	299989	\N	479481	\N
480924	GENERIC_DAY	1	4	f	2011-04-01	299989	\N	479481	\N
480925	GENERIC_DAY	1	4	f	2011-04-15	299989	\N	479481	\N
480926	GENERIC_DAY	1	0	f	2011-04-02	299989	\N	479481	\N
480927	GENERIC_DAY	1	4	f	2011-04-11	299987	\N	479481	\N
480928	GENERIC_DAY	1	0	f	2011-05-01	299989	\N	479482	\N
480929	GENERIC_DAY	1	4	f	2011-04-21	299989	\N	479482	\N
480930	GENERIC_DAY	1	4	f	2011-05-02	299987	\N	479482	\N
480931	GENERIC_DAY	1	4	f	2011-04-27	299989	\N	479482	\N
480932	GENERIC_DAY	1	0	f	2011-04-30	299987	\N	479482	\N
480933	GENERIC_DAY	1	4	f	2011-04-26	299989	\N	479482	\N
480934	GENERIC_DAY	1	2	f	2011-05-06	299989	\N	479482	\N
480935	GENERIC_DAY	1	0	f	2011-04-23	299987	\N	479482	\N
480936	GENERIC_DAY	1	0	f	2011-04-24	299987	\N	479482	\N
480937	GENERIC_DAY	1	4	f	2011-05-04	299987	\N	479482	\N
480938	GENERIC_DAY	1	0	f	2011-04-23	299989	\N	479482	\N
480939	GENERIC_DAY	1	4	f	2011-04-29	299987	\N	479482	\N
480940	GENERIC_DAY	1	4	f	2011-04-29	299989	\N	479482	\N
480941	GENERIC_DAY	1	4	f	2011-04-20	299987	\N	479482	\N
480942	GENERIC_DAY	1	4	f	2011-04-28	299989	\N	479482	\N
480943	GENERIC_DAY	1	4	f	2011-04-22	299987	\N	479482	\N
480944	GENERIC_DAY	1	0	f	2011-05-01	299987	\N	479482	\N
480945	GENERIC_DAY	1	2	f	2011-05-06	299987	\N	479482	\N
480946	GENERIC_DAY	1	4	f	2011-04-25	299989	\N	479482	\N
480947	GENERIC_DAY	1	4	f	2011-04-21	299987	\N	479482	\N
480948	GENERIC_DAY	1	4	f	2011-04-26	299987	\N	479482	\N
480949	GENERIC_DAY	1	4	f	2011-05-03	299989	\N	479482	\N
480950	GENERIC_DAY	1	4	f	2011-04-27	299987	\N	479482	\N
480951	GENERIC_DAY	1	0	f	2011-04-30	299989	\N	479482	\N
480952	GENERIC_DAY	1	4	f	2011-05-02	299989	\N	479482	\N
480953	GENERIC_DAY	1	0	f	2011-04-24	299989	\N	479482	\N
480954	GENERIC_DAY	1	4	f	2011-05-05	299987	\N	479482	\N
480955	GENERIC_DAY	1	4	f	2011-05-04	299989	\N	479482	\N
480956	GENERIC_DAY	1	4	f	2011-04-25	299987	\N	479482	\N
480957	GENERIC_DAY	1	4	f	2011-04-20	299989	\N	479482	\N
480958	GENERIC_DAY	1	4	f	2011-05-05	299989	\N	479482	\N
480959	GENERIC_DAY	1	4	f	2011-04-28	299987	\N	479482	\N
480960	GENERIC_DAY	1	4	f	2011-04-22	299989	\N	479482	\N
480961	GENERIC_DAY	1	4	f	2011-05-03	299987	\N	479482	\N
480962	GENERIC_DAY	1	4	f	2011-04-21	299989	\N	479483	\N
480963	GENERIC_DAY	1	2	f	2011-05-06	299989	\N	479483	\N
480964	GENERIC_DAY	1	0	f	2011-04-23	299987	\N	479483	\N
480965	GENERIC_DAY	1	4	f	2011-04-27	299989	\N	479483	\N
480966	GENERIC_DAY	1	4	f	2011-04-29	299987	\N	479483	\N
480967	GENERIC_DAY	1	4	f	2011-04-29	299989	\N	479483	\N
480968	GENERIC_DAY	1	0	f	2011-05-01	299989	\N	479483	\N
480969	GENERIC_DAY	1	0	f	2011-05-01	299987	\N	479483	\N
480970	GENERIC_DAY	1	4	f	2011-04-21	299987	\N	479483	\N
480971	GENERIC_DAY	1	4	f	2011-05-04	299987	\N	479483	\N
480972	GENERIC_DAY	1	4	f	2011-05-02	299987	\N	479483	\N
480973	GENERIC_DAY	1	4	f	2011-05-03	299989	\N	479483	\N
480974	GENERIC_DAY	1	4	f	2011-04-28	299989	\N	479483	\N
480975	GENERIC_DAY	1	4	f	2011-04-26	299987	\N	479483	\N
480976	GENERIC_DAY	1	4	f	2011-05-05	299987	\N	479483	\N
480977	GENERIC_DAY	1	4	f	2011-04-25	299989	\N	479483	\N
480978	GENERIC_DAY	1	4	f	2011-04-27	299987	\N	479483	\N
480979	GENERIC_DAY	1	4	f	2011-04-22	299987	\N	479483	\N
480980	GENERIC_DAY	1	4	f	2011-04-28	299987	\N	479483	\N
480981	GENERIC_DAY	1	4	f	2011-05-03	299987	\N	479483	\N
480982	GENERIC_DAY	1	4	f	2011-04-25	299987	\N	479483	\N
480983	GENERIC_DAY	1	4	f	2011-04-22	299989	\N	479483	\N
480984	GENERIC_DAY	1	4	f	2011-04-20	299989	\N	479483	\N
480985	GENERIC_DAY	1	4	f	2011-05-02	299989	\N	479483	\N
480986	GENERIC_DAY	1	4	f	2011-04-20	299987	\N	479483	\N
480987	GENERIC_DAY	1	4	f	2011-04-26	299989	\N	479483	\N
480988	GENERIC_DAY	1	4	f	2011-05-05	299989	\N	479483	\N
480989	GENERIC_DAY	1	4	f	2011-05-04	299989	\N	479483	\N
480990	GENERIC_DAY	1	2	f	2011-05-06	299987	\N	479483	\N
480991	GENERIC_DAY	1	0	f	2011-04-23	299989	\N	479483	\N
480992	GENERIC_DAY	1	0	f	2011-04-30	299987	\N	479483	\N
480993	GENERIC_DAY	1	0	f	2011-04-30	299989	\N	479483	\N
480994	GENERIC_DAY	1	0	f	2011-04-24	299987	\N	479483	\N
480995	GENERIC_DAY	1	0	f	2011-04-24	299989	\N	479483	\N
480996	GENERIC_DAY	1	8	f	2011-05-11	299989	\N	479484	\N
480997	GENERIC_DAY	1	8	f	2011-05-09	299989	\N	479484	\N
480998	GENERIC_DAY	1	0	f	2011-05-08	299987	\N	479484	\N
480999	GENERIC_DAY	1	8	f	2011-05-12	299989	\N	479484	\N
481000	GENERIC_DAY	1	0	f	2011-05-15	299987	\N	479484	\N
481001	GENERIC_DAY	1	2	f	2011-05-17	299987	\N	479484	\N
481002	GENERIC_DAY	1	0	f	2011-05-07	299989	\N	479484	\N
481003	GENERIC_DAY	1	2	f	2011-05-17	299989	\N	479484	\N
481004	GENERIC_DAY	1	0	f	2011-05-07	299987	\N	479484	\N
481005	GENERIC_DAY	1	8	f	2011-05-10	299989	\N	479484	\N
481006	GENERIC_DAY	1	8	f	2011-05-13	299989	\N	479484	\N
481007	GENERIC_DAY	1	0	f	2011-05-14	299989	\N	479484	\N
481008	GENERIC_DAY	1	8	f	2011-05-16	299989	\N	479484	\N
481009	GENERIC_DAY	1	0	f	2011-05-14	299987	\N	479484	\N
481010	GENERIC_DAY	1	8	f	2011-05-16	299987	\N	479484	\N
481011	GENERIC_DAY	1	0	f	2011-05-15	299989	\N	479484	\N
481012	GENERIC_DAY	1	0	f	2011-05-08	299989	\N	479484	\N
481013	GENERIC_DAY	1	8	f	2011-05-09	299987	\N	479484	\N
481014	GENERIC_DAY	1	8	f	2011-05-10	299987	\N	479484	\N
481015	GENERIC_DAY	1	8	f	2011-05-13	299987	\N	479484	\N
481016	GENERIC_DAY	1	8	f	2011-05-11	299987	\N	479484	\N
481017	GENERIC_DAY	1	8	f	2011-05-12	299987	\N	479484	\N
481018	GENERIC_DAY	1	8	f	2011-05-24	299989	\N	479485	\N
481019	GENERIC_DAY	1	0	f	2011-05-22	299987	\N	479485	\N
481020	GENERIC_DAY	1	8	f	2011-05-19	299987	\N	479485	\N
481021	GENERIC_DAY	1	8	f	2011-05-20	299989	\N	479485	\N
481022	GENERIC_DAY	1	2	f	2011-05-26	299989	\N	479485	\N
481023	GENERIC_DAY	1	8	f	2011-05-18	299987	\N	479485	\N
481024	GENERIC_DAY	1	8	f	2011-05-25	299987	\N	479485	\N
481025	GENERIC_DAY	1	8	f	2011-05-18	299989	\N	479485	\N
481026	GENERIC_DAY	1	8	f	2011-05-23	299989	\N	479485	\N
481027	GENERIC_DAY	1	8	f	2011-05-24	299987	\N	479485	\N
481028	GENERIC_DAY	1	8	f	2011-05-20	299987	\N	479485	\N
481029	GENERIC_DAY	1	0	f	2011-05-21	299989	\N	479485	\N
481030	GENERIC_DAY	1	0	f	2011-05-22	299989	\N	479485	\N
481031	GENERIC_DAY	1	8	f	2011-05-25	299989	\N	479485	\N
481032	GENERIC_DAY	1	2	f	2011-05-26	299987	\N	479485	\N
481033	GENERIC_DAY	1	0	f	2011-05-21	299987	\N	479485	\N
481034	GENERIC_DAY	1	8	f	2011-05-23	299987	\N	479485	\N
481035	GENERIC_DAY	1	8	f	2011-05-19	299989	\N	479485	\N
481036	GENERIC_DAY	1	0	f	2011-05-29	299987	\N	479486	\N
481037	GENERIC_DAY	1	8	f	2011-06-02	299987	\N	479486	\N
481038	GENERIC_DAY	1	0	f	2011-05-28	299989	\N	479486	\N
481039	GENERIC_DAY	1	8	f	2011-06-01	299987	\N	479486	\N
481040	GENERIC_DAY	1	8	f	2011-05-31	299987	\N	479486	\N
481041	GENERIC_DAY	1	8	f	2011-06-01	299989	\N	479486	\N
481042	GENERIC_DAY	1	0	f	2011-05-28	299987	\N	479486	\N
481043	GENERIC_DAY	1	0	f	2011-06-04	299987	\N	479486	\N
481044	GENERIC_DAY	1	0	f	2011-06-04	299989	\N	479486	\N
481045	GENERIC_DAY	1	8	f	2011-05-30	299989	\N	479486	\N
481046	GENERIC_DAY	1	8	f	2011-05-27	299987	\N	479486	\N
481047	GENERIC_DAY	1	8	f	2011-05-30	299987	\N	479486	\N
481048	GENERIC_DAY	1	8	f	2011-05-27	299989	\N	479486	\N
481049	GENERIC_DAY	1	8	f	2011-06-02	299989	\N	479486	\N
481050	GENERIC_DAY	1	2	f	2011-06-06	299989	\N	479486	\N
481051	GENERIC_DAY	1	0	f	2011-06-05	299987	\N	479486	\N
481052	GENERIC_DAY	1	0	f	2011-05-29	299989	\N	479486	\N
481053	GENERIC_DAY	1	0	f	2011-06-05	299989	\N	479486	\N
481054	GENERIC_DAY	1	2	f	2011-06-06	299987	\N	479486	\N
481055	GENERIC_DAY	1	8	f	2011-06-03	299989	\N	479486	\N
481056	GENERIC_DAY	1	8	f	2011-05-31	299989	\N	479486	\N
481057	GENERIC_DAY	1	8	f	2011-06-03	299987	\N	479486	\N
481058	GENERIC_DAY	1	0	f	2011-06-12	299989	\N	479487	\N
481059	GENERIC_DAY	1	8	f	2011-06-07	299987	\N	479487	\N
481060	GENERIC_DAY	1	2	f	2011-06-15	299987	\N	479487	\N
481061	GENERIC_DAY	1	8	f	2011-06-09	299987	\N	479487	\N
481062	GENERIC_DAY	1	8	f	2011-06-10	299989	\N	479487	\N
481063	GENERIC_DAY	1	8	f	2011-06-09	299989	\N	479487	\N
481064	GENERIC_DAY	1	8	f	2011-06-07	299989	\N	479487	\N
481065	GENERIC_DAY	1	8	f	2011-06-14	299987	\N	479487	\N
481066	GENERIC_DAY	1	8	f	2011-06-14	299989	\N	479487	\N
481099	GENERIC_DAY	1	2	f	2011-07-05	299987	\N	479489	\N
481100	GENERIC_DAY	1	8	f	2011-07-01	299987	\N	479489	\N
481101	GENERIC_DAY	1	0	f	2011-07-03	299989	\N	479489	\N
481102	GENERIC_DAY	1	8	f	2011-06-27	299989	\N	479489	\N
481103	GENERIC_DAY	1	8	f	2011-07-04	299989	\N	479489	\N
481104	GENERIC_DAY	1	0	f	2011-06-25	299989	\N	479489	\N
481105	GENERIC_DAY	1	8	f	2011-06-30	299989	\N	479489	\N
481106	GENERIC_DAY	1	8	f	2011-06-28	299987	\N	479489	\N
481107	GENERIC_DAY	1	0	f	2011-06-26	299987	\N	479489	\N
481108	GENERIC_DAY	1	0	f	2011-07-03	299987	\N	479489	\N
481109	GENERIC_DAY	1	0	f	2011-06-25	299987	\N	479489	\N
481110	GENERIC_DAY	1	2	f	2011-07-05	299989	\N	479489	\N
481111	GENERIC_DAY	1	8	f	2011-07-04	299987	\N	479489	\N
481112	GENERIC_DAY	1	0	f	2011-06-26	299989	\N	479489	\N
481113	GENERIC_DAY	1	0	f	2011-07-02	299987	\N	479489	\N
481114	GENERIC_DAY	1	8	f	2011-06-28	299989	\N	479489	\N
481115	GENERIC_DAY	1	8	f	2011-06-30	299987	\N	479489	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, queue_dependency, type) FROM stdin;
122029342	2	361872	361875	\N	0
122029343	2	361873	361875	\N	0
122029344	2	361874	361875	\N	0
122029345	2	361875	361876	\N	0
122029346	2	361876	361877	\N	0
122029347	2	361877	361878	\N	0
122029348	2	361877	361879	\N	0
122029349	2	361877	361881	\N	0
122029350	2	361878	361880	\N	0
122029351	2	361879	361880	\N	0
122029352	2	361881	361880	\N	0
122029866	1	458540	458543	\N	0
122029867	1	458541	458543	\N	0
122029868	1	458542	458544	\N	0
122029869	1	458542	458543	\N	0
122029870	1	458543	458545	\N	0
122029871	1	458544	458546	\N	0
122029872	1	458545	458547	\N	0
122029873	1	458546	458547	\N	0
122029874	1	458547	458548	\N	0
122029875	1	458548	458549	\N	0
122029876	1	458553	458556	\N	0
122029877	1	458553	458554	\N	0
122029878	1	458553	458555	\N	0
122029879	1	458556	458557	\N	0
122029880	1	458556	458559	\N	0
122029881	1	458556	458558	\N	0
122029882	1	458559	458560	\N	0
122029883	1	458563	458565	\N	0
122029884	1	458563	458564	\N	0
122029885	1	458565	458566	\N	0
122029886	1	458566	458567	\N	0
122029887	1	458567	458568	\N	0
122029888	1	458568	458569	\N	0
122029889	1	458569	458570	\N	0
122029890	1	458570	458571	\N	0
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
361779	450860	100.00
361780	448491	100.00
361781	448492	100.00
458338	448493	100.00
458339	448494	100.00
458340	448495	100.00
458341	448496	100.00
458342	448497	100.00
458343	448498	100.00
458344	448499	100.00
458345	448500	100.00
458348	448502	100.00
458349	448503	100.00
458350	448504	100.00
458351	448505	100.00
458352	448506	100.00
458353	448507	100.00
458354	448508	100.00
458355	448509	100.00
458356	448510	100.00
458357	448511	100.00
458360	448513	100.00
458361	448514	100.00
458362	448515	100.00
458363	448516	100.00
458364	448517	100.00
458365	448518	100.00
458366	448519	100.00
458367	448520	100.00
458368	448521	100.00
458369	448522	100.00
458410	450862	100.00
458411	451369	100.00
458412	451370	100.00
458413	451371	100.00
458414	451372	100.00
458415	451373	100.00
458416	451374	100.00
458417	451375	100.00
458418	451376	100.00
458419	451377	100.00
458420	451378	100.00
458423	456379	100.00
458424	456380	100.00
458425	456381	100.00
458426	456382	100.00
458427	456383	100.00
458428	456384	100.00
458429	456385	100.00
458430	456386	100.00
458431	456387	100.00
458432	456388	100.00
458435	456390	100.00
458436	456391	100.00
458437	456392	100.00
458438	456393	100.00
458439	456394	100.00
458440	456395	100.00
458441	456396	100.00
458442	456397	100.00
458443	456398	100.00
458444	456399	100.00
458447	456401	100.00
458448	456402	100.00
458449	456403	100.00
458450	456404	100.00
458451	456405	100.00
458452	456406	100.00
458453	456407	100.00
458454	456408	100.00
458455	456409	100.00
458389	449726	100.00
458390	449727	100.00
458391	449728	100.00
458392	449729	100.00
458393	449730	100.00
458396	449732	100.00
458397	449733	100.00
458398	449734	100.00
458399	449735	100.00
458456	456410	100.00
458459	456412	100.00
458460	456413	100.00
458461	456414	100.00
458462	456415	100.00
458463	456416	100.00
458464	456417	100.00
458465	456418	100.00
458466	456924	100.00
458467	456925	100.00
458468	456926	100.00
458471	456928	100.00
458472	456929	100.00
458473	456930	100.00
458474	456931	100.00
458475	456932	100.00
458476	456933	100.00
458477	456934	100.00
458478	456935	100.00
458479	456936	100.00
458480	456937	100.00
458372	448524	100.00
458373	448525	100.00
458374	448526	100.00
458375	448527	100.00
458376	448528	100.00
458377	448529	100.00
458378	448530	100.00
458379	448531	100.00
458380	448532	100.00
458381	448533	100.00
458384	449721	100.00
458385	449722	100.00
458386	449723	100.00
458387	449724	100.00
458388	449725	100.00
458400	449736	100.00
458401	449737	100.00
458402	449738	100.00
458403	449739	100.00
458404	449740	100.00
458405	449741	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
460972
460973
460974
460975
460976
460977
460978
460979
460980
460981
479358
479359
479360
479361
479362
479363
479364
479365
479366
479367
479368
479369
479370
479371
479372
479373
479374
479375
479376
479377
479378
479379
479380
479381
479382
479383
479384
479385
479386
479387
479388
\.


--
-- Data for Name: genericdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY genericdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
479459	1	479358	909
461073	2	460972	909
461074	2	460973	909
461075	2	460974	909
461076	2	460975	909
461077	2	460976	909
461078	2	460977	909
461079	2	460978	909
461080	2	460979	909
461081	2	460980	909
461082	2	460981	909
479460	1	479359	909
479461	1	479360	909
479462	1	479361	909
479463	1	479362	909
479464	1	479363	909
479465	1	479364	909
479466	1	479365	909
479467	1	479366	909
479468	1	479367	909
479469	1	479368	909
479470	1	479369	909
479471	1	479370	909
479472	1	479371	909
479473	1	479372	909
479474	1	479373	909
479475	1	479374	909
479476	1	479375	909
479477	1	479376	909
479478	1	479377	909
479479	1	479378	909
479480	1	479379	909
479481	1	479380	909
479482	1	479381	909
479483	1	479382	909
479484	1	479383	909
479485	1	479384	909
479486	1	479385	909
479487	1	479386	909
479488	1	479387	909
479489	1	479388	909
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
4764
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
1414	1	5a97a149-4210-40e1-8231-9884a8917163	9.00	2009-01-01	2009-12-31	1212	1313
1415	1	b8b87f1f-decf-4b4f-877d-8e7453c512d7	10.00	2010-01-01	\N	1212	1313
1416	1	a3f684d6-fab0-4216-b80a-8c54ce77f431	15.00	2010-01-12	\N	1213	1313
1417	1	a3f32c1c-9101-4be1-a88e-fe49acea18bd	14.00	2009-01-01	2009-12-31	1213	1313
1420	1	cb5465c4-2a83-4e35-9b93-81c2cadd5aef	15.00	2010-01-01	\N	1212	1314
1421	1	ece08593-a215-466c-a29e-c8e1bdfcacfb	20.00	2010-01-01	\N	1213	1314
1418	2	ce075cec-5a1d-48b3-917c-3a4db46063ec	19.00	2009-01-01	2009-12-31	1213	1314
1419	2	ca604069-fc0c-469b-b3bb-2b4b0dfb73da	14.00	2009-01-01	2009-12-31	1212	1314
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
127811	1	73da2d5f-0cff-4754-a4a9-fa68d8925554	WORKER	160	1.00	f	\N	127637
127812	1	f1e9cc35-c732-46a9-9cb3-a273024179c1	WORKER	160	1.00	f	\N	127638
127813	1	580238d4-4cec-40a5-bd28-49eb90366dfc	WORKER	120	1.00	f	\N	127639
127814	1	cd35c4e2-02fe-4df6-a647-14f2f881e2d0	WORKER	200	1.00	f	\N	127640
127815	1	c3ed344b-67d3-4d48-b84b-2debeac96ded	WORKER	120	1.00	f	\N	127642
127816	1	49f3b274-7e6e-4528-8b07-e72109f63436	WORKER	80	1.00	f	\N	127643
127817	1	bdf87375-9d45-4116-bdc4-06143b8fe991	WORKER	80	1.00	f	\N	127644
301090	1	2d48325e-1ae4-4f80-9e45-7d91b3b62aea	WORKER	150	1.00	f	\N	301286
127821	1	76c7162e-4df5-45f0-90d5-c45c83df421b	WORKER	80	1.00	f	\N	127649
127822	1	17f6b080-a64e-4546-a289-9e387cdde8a4	WORKER	200	1.00	f	\N	127650
127823	1	a9083d0b-a931-475a-aa0f-2c96b021eb41	WORKER	160	1.00	f	\N	127651
127824	1	305029f7-8092-4e3e-bc3f-cc1a4f421857	WORKER	160	1.00	f	\N	127652
127825	1	b4948fd7-7d50-4d98-a87e-9aa4fc54d1ac	WORKER	200	1.00	f	\N	127653
127826	1	1bb6eb67-1763-4e34-9b01-60a7c6837f2c	WORKER	200	1.00	f	\N	127654
127827	1	bb6356d4-0d52-425e-a0be-2f9ed70c5615	WORKER	200	1.00	f	\N	127655
127828	1	bd2f2719-fbbf-454f-a864-d8bbfa9ac335	WORKER	160	1.00	f	\N	127656
127829	1	88e2d257-a63a-49a0-9975-42ee432c872d	WORKER	200	1.00	f	\N	127657
127830	1	85af047d-89f1-432c-bbd7-524358ea5e78	WORKER	160	1.00	f	\N	127658
317032	1	38876123-4362-4fa3-b421-450a10d9dd53	WORKER	150	1.00	f	\N	312315
127818	1	39d40d10-d438-46d2-886d-45cd57cb0c15	WORKER	80	1.00	f	\N	127645
127819	1	e918a81d-827d-485f-81b9-a9ac1109f536	WORKER	80	1.00	f	\N	127646
127820	1	7dcb1e41-0d3f-4326-9106-ae775e6b620c	WORKER	80	1.00	f	\N	127647
301100	1	107a2afa-59ae-4fd9-84fa-6e5e8cc09834	WORKER	150	1.00	f	\N	301290
301798	1	c89d289a-6338-47fe-a1b4-53fda92e67f3	MACHINE	120	1.00	f	\N	301993
312106	1	072c79cf-2f49-447f-9cb5-af990f717936	MACHINE	150	1.00	f	\N	312295
312110	1	cff337fd-df8c-4ffb-9b7a-c027aeaeb4e3	MACHINE	150	1.00	f	\N	312299
301861	1	738d4a38-88cd-4570-8891-88c24aced2e2	MACHINE	150	1.00	f	\N	301997
313766	1	a5d82687-9a1c-4e11-9313-933d9985bf5c	WORKER	150	1.00	f	\N	312303
313806	1	d0422151-1b8b-4894-9253-3643f7584d89	WORKER	150	1.00	f	\N	312307
316992	1	f602f7a5-bbec-45bd-97d3-947c6b2ccc58	WORKER	150	1.00	f	\N	312311
456750	7	PREFIX-00041-00109-00001	WORKER	100	1.00	f	456405	\N
456751	7	PREFIX-00041-00110-00001	WORKER	100	1.00	f	456406	\N
456752	7	PREFIX-00041-00111-00001	WORKER	100	1.00	f	456407	\N
456753	7	PREFIX-00041-00112-00001	WORKER	100	1.00	f	456408	\N
456754	7	PREFIX-00041-00113-00001	WORKER	100	1.00	f	456409	\N
456755	7	PREFIX-00041-00114-00001	WORKER	100	1.00	f	456410	\N
456756	7	PREFIX-00041-00116-00001	WORKER	100	1.00	f	456412	\N
456757	7	PREFIX-00041-00117-00001	WORKER	100	1.00	f	456413	\N
456758	7	PREFIX-00041-00118-00001	WORKER	100	1.00	f	456414	\N
456759	7	PREFIX-00041-00119-00001	WORKER	100	1.00	f	456415	\N
456760	7	PREFIX-00041-00120-00001	WORKER	100	1.00	f	456416	\N
456761	7	PREFIX-00041-00121-00001	WORKER	100	1.00	f	456417	\N
449992	9	PREFIX-00041-00064-00001	WORKER	100	1.00	f	449738	\N
449993	9	PREFIX-00041-00065-00001	WORKER	100	1.00	f	449739	\N
456765	7	PREFIX-00041-00125-00001	WORKER	100	1.00	f	456926	\N
456766	7	PREFIX-00041-00127-00001	WORKER	100	1.00	f	456928	\N
456767	7	PREFIX-00041-00128-00001	WORKER	100	1.00	f	456929	\N
456768	7	PREFIX-00041-00129-00001	WORKER	100	1.00	f	456930	\N
456769	7	PREFIX-00041-00130-00001	WORKER	100	1.00	f	456931	\N
359812	2	1bece4b9-190b-400c-84a4-58850774b82a	WORKER	100	1.00	f	\N	359897
359813	2	3da0132e-4856-4261-a4af-3a613c2e54cf	WORKER	100	1.00	f	\N	359898
359814	2	aea51094-19eb-4937-8a3f-09ee8ff2d5ee	WORKER	100	1.00	f	\N	359899
359815	2	c9bb595c-9e2f-40cd-a185-76328a94af23	WORKER	100	1.00	f	\N	359900
359816	2	1943ca0f-045a-475d-83a2-35c5a7e35899	WORKER	100	1.00	f	\N	359901
359817	2	7c3a7470-7353-4bb7-97a1-276190906a96	WORKER	100	1.00	f	\N	359902
359818	2	be16b0a0-b2e2-4b97-b55a-64be20de68c8	WORKER	100	1.00	f	\N	359903
359819	2	fe4a6591-3c34-4a14-8933-4cec1853a14f	WORKER	100	1.00	f	\N	359904
456762	7	PREFIX-00041-00122-00001	WORKER	100	1.00	f	456418	\N
456763	7	PREFIX-00041-00123-00001	WORKER	100	1.00	f	456924	\N
457951	3	PREFIX-00041-00138-00001	WORKER	1000	1.00	f	458043	\N
457952	3	PREFIX-00041-00140-00001	WORKER	100	1.00	f	458045	\N
457953	3	PREFIX-00041-00141-00001	WORKER	100	1.00	f	458046	\N
359820	2	e2d8239a-f01e-4f5d-91b0-7aa502a54637	WORKER	100	1.00	f	\N	359905
359821	2	99631edc-5365-4831-a368-4bd6b2401178	WORKER	100	1.00	f	\N	359906
457954	3	PREFIX-00041-00142-00001	WORKER	100	1.00	f	458047	\N
456764	7	PREFIX-00041-00124-00001	WORKER	100	1.00	f	456925	\N
457955	3	PREFIX-00041-00143-00001	WORKER	100	1.00	f	458048	\N
457956	3	PREFIX-00041-00144-00001	WORKER	100	1.00	f	458049	\N
457957	3	PREFIX-00041-00145-00001	WORKER	100	1.00	f	458050	\N
457958	3	PREFIX-00041-00146-00001	WORKER	100	1.00	f	458051	\N
448776	10	PREFIX-00041-00014-00001	WORKER	100	1.00	f	448502	\N
448777	10	PREFIX-00041-00015-00001	WORKER	100	1.00	f	448503	\N
456726	7	PREFIX-00041-00083-00001	WORKER	100	1.00	f	456379	\N
456727	7	PREFIX-00041-00084-00001	WORKER	100	1.00	f	456380	\N
456728	7	PREFIX-00041-00085-00001	WORKER	100	1.00	f	456381	\N
456729	7	PREFIX-00041-00086-00001	WORKER	100	1.00	f	456382	\N
448770	10	PREFIX-00041-00007-00001	WORKER	100	1.00	f	448495	\N
448771	10	PREFIX-00041-00008-00001	WORKER	100	1.00	f	448496	\N
448772	10	PREFIX-00041-00009-00001	WORKER	100	1.00	f	448497	\N
448773	10	PREFIX-00041-00010-00001	WORKER	100	1.00	f	448498	\N
448774	10	PREFIX-00041-00011-00001	WORKER	100	1.00	f	448499	\N
448775	10	PREFIX-00041-00012-00001	WORKER	100	1.00	f	448500	\N
457959	3	PREFIX-00041-00147-00001	WORKER	100	1.00	f	458052	\N
457960	3	PREFIX-00041-00148-00001	WORKER	100	1.00	f	458053	\N
457961	3	PREFIX-00041-00149-00001	WORKER	100	1.00	f	458054	\N
456770	7	PREFIX-00041-00131-00001	WORKER	100	1.00	f	456932	\N
456771	7	PREFIX-00041-00132-00001	WORKER	100	1.00	f	456933	\N
456772	7	PREFIX-00041-00133-00001	WORKER	100	1.00	f	456934	\N
456773	7	PREFIX-00041-00134-00001	WORKER	100	1.00	f	456935	\N
456774	7	PREFIX-00041-00135-00001	WORKER	100	1.00	f	456936	\N
456775	7	PREFIX-00041-00136-00001	WORKER	100	1.00	f	456937	\N
448766	10	PREFIX-00041-00003-00001	WORKER	100	1.00	f	448491	\N
448767	10	PREFIX-00041-00004-00001	WORKER	100	1.00	f	448492	\N
448768	10	PREFIX-00041-00005-00001	WORKER	100	1.00	f	448493	\N
448769	10	PREFIX-00041-00006-00001	WORKER	100	1.00	f	448494	\N
448778	10	PREFIX-00041-00016-00001	WORKER	100	1.00	f	448504	\N
448779	10	PREFIX-00041-00017-00001	WORKER	100	1.00	f	448505	\N
448780	10	PREFIX-00041-00018-00001	WORKER	100	1.00	f	448506	\N
448781	10	PREFIX-00041-00019-00001	WORKER	100	1.00	f	448507	\N
448782	10	PREFIX-00041-00020-00001	WORKER	100	1.00	f	448508	\N
448783	10	PREFIX-00041-00021-00001	WORKER	100	1.00	f	448509	\N
448784	10	PREFIX-00041-00022-00001	WORKER	100	1.00	f	448510	\N
448785	10	PREFIX-00041-00023-00001	WORKER	100	1.00	f	448511	\N
448786	10	PREFIX-00041-00025-00001	WORKER	100	1.00	f	448513	\N
448787	10	PREFIX-00041-00026-00001	WORKER	100	1.00	f	448514	\N
448788	10	PREFIX-00041-00027-00001	WORKER	100	1.00	f	448515	\N
448789	10	PREFIX-00041-00028-00001	WORKER	100	1.00	f	448516	\N
448790	10	PREFIX-00041-00029-00001	WORKER	100	1.00	f	448517	\N
448791	10	PREFIX-00041-00030-00001	WORKER	100	1.00	f	448518	\N
448792	10	PREFIX-00041-00031-00001	WORKER	100	1.00	f	448519	\N
448793	10	PREFIX-00041-00032-00001	WORKER	100	1.00	f	448520	\N
448794	10	PREFIX-00041-00033-00001	WORKER	100	1.00	f	448521	\N
448795	10	PREFIX-00041-00034-00001	WORKER	100	1.00	f	448522	\N
448796	10	PREFIX-00041-00036-00001	WORKER	100	1.00	f	448524	\N
448797	10	PREFIX-00041-00037-00001	WORKER	100	1.00	f	448525	\N
451188	8	PREFIX-00041-00070-00001	WORKER	1000	1.00	f	450862	\N
451189	8	PREFIX-00041-00072-00001	WORKER	100	1.00	f	451369	\N
451190	8	PREFIX-00041-00073-00001	WORKER	100	1.00	f	451370	\N
451191	8	PREFIX-00041-00074-00001	WORKER	100	1.00	f	451371	\N
451192	8	PREFIX-00041-00075-00001	WORKER	100	1.00	f	451372	\N
451193	8	PREFIX-00041-00076-00001	WORKER	100	1.00	f	451373	\N
451194	8	PREFIX-00041-00077-00001	WORKER	100	1.00	f	451374	\N
451195	8	PREFIX-00041-00078-00001	WORKER	100	1.00	f	451375	\N
451196	8	PREFIX-00041-00079-00001	WORKER	100	1.00	f	451376	\N
451197	8	PREFIX-00041-00080-00001	WORKER	100	1.00	f	451377	\N
451198	8	PREFIX-00041-00081-00001	WORKER	100	1.00	f	451378	\N
451187	8	PREFIX-00041-00069-00001	WORKER	1000	1.00	f	450860	\N
448798	10	PREFIX-00041-00038-00001	WORKER	100	1.00	f	448526	\N
448799	10	PREFIX-00041-00039-00001	WORKER	100	1.00	f	448527	\N
448800	10	PREFIX-00041-00040-00001	WORKER	100	1.00	f	448528	\N
448801	10	PREFIX-00041-00041-00001	WORKER	100	1.00	f	448529	\N
448802	10	PREFIX-00041-00042-00001	WORKER	100	1.00	f	448530	\N
448803	10	PREFIX-00041-00043-00001	WORKER	100	1.00	f	448531	\N
448804	10	PREFIX-00041-00044-00001	WORKER	100	1.00	f	448532	\N
448805	10	PREFIX-00041-00045-00001	WORKER	100	1.00	f	448533	\N
449976	9	PREFIX-00041-00047-00001	WORKER	100	1.00	f	449721	\N
449977	9	PREFIX-00041-00048-00001	WORKER	100	1.00	f	449722	\N
449978	9	PREFIX-00041-00049-00001	WORKER	100	1.00	f	449723	\N
449979	9	PREFIX-00041-00050-00001	WORKER	100	1.00	f	449724	\N
449980	9	PREFIX-00041-00051-00001	WORKER	100	1.00	f	449725	\N
449981	9	PREFIX-00041-00052-00001	WORKER	100	1.00	f	449726	\N
449982	9	PREFIX-00041-00053-00001	WORKER	100	1.00	f	449727	\N
449983	9	PREFIX-00041-00054-00001	WORKER	100	1.00	f	449728	\N
449984	9	PREFIX-00041-00055-00001	WORKER	100	1.00	f	449729	\N
449985	9	PREFIX-00041-00056-00001	WORKER	100	1.00	f	449730	\N
449986	9	PREFIX-00041-00058-00001	WORKER	100	1.00	f	449732	\N
449987	9	PREFIX-00041-00059-00001	WORKER	100	1.00	f	449733	\N
449988	9	PREFIX-00041-00060-00001	WORKER	100	1.00	f	449734	\N
449989	9	PREFIX-00041-00061-00001	WORKER	100	1.00	f	449735	\N
449990	9	PREFIX-00041-00062-00001	WORKER	100	1.00	f	449736	\N
449991	9	PREFIX-00041-00063-00001	WORKER	100	1.00	f	449737	\N
456730	7	PREFIX-00041-00087-00001	WORKER	100	1.00	f	456383	\N
456731	7	PREFIX-00041-00088-00001	WORKER	100	1.00	f	456384	\N
456732	7	PREFIX-00041-00089-00001	WORKER	100	1.00	f	456385	\N
456733	7	PREFIX-00041-00090-00001	WORKER	100	1.00	f	456386	\N
456734	7	PREFIX-00041-00091-00001	WORKER	100	1.00	f	456387	\N
456735	7	PREFIX-00041-00092-00001	WORKER	100	1.00	f	456388	\N
456736	7	PREFIX-00041-00094-00001	WORKER	100	1.00	f	456390	\N
456737	7	PREFIX-00041-00095-00001	WORKER	100	1.00	f	456391	\N
456738	7	PREFIX-00041-00096-00001	WORKER	100	1.00	f	456392	\N
456739	7	PREFIX-00041-00097-00001	WORKER	100	1.00	f	456393	\N
456740	7	PREFIX-00041-00098-00001	WORKER	100	1.00	f	456394	\N
456741	7	PREFIX-00041-00099-00001	WORKER	100	1.00	f	456395	\N
456742	7	PREFIX-00041-00100-00001	WORKER	100	1.00	f	456396	\N
456743	7	PREFIX-00041-00101-00001	WORKER	100	1.00	f	456397	\N
456744	7	PREFIX-00041-00102-00001	WORKER	100	1.00	f	456398	\N
456745	7	PREFIX-00041-00103-00001	WORKER	100	1.00	f	456399	\N
456746	7	PREFIX-00041-00105-00001	WORKER	100	1.00	f	456401	\N
456747	7	PREFIX-00041-00106-00001	WORKER	100	1.00	f	456402	\N
456748	7	PREFIX-00041-00107-00001	WORKER	100	1.00	f	456403	\N
456749	7	PREFIX-00041-00108-00001	WORKER	100	1.00	f	456404	\N
449994	9	PREFIX-00041-00066-00001	WORKER	100	1.00	f	449740	\N
449995	9	PREFIX-00041-00067-00001	WORKER	100	1.00	f	449741	\N
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
606	8	0
606	8	1
606	8	2
606	8	3
606	8	4
606	0	5
606	0	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
458421	450863
458422	450863
458434	456378
458433	456378
458445	456389
458446	456389
458458	456400
458457	456400
458470	456411
458469	456411
458482	456927
458481	456927
458484	450861
458483	450861
458485	448488
458486	448488
458347	448490
458346	448490
458358	448501
458359	448501
458370	448512
458371	448512
458383	448523
458382	448523
458394	449720
458395	449720
458406	449731
458407	449731
458408	448489
458409	448489
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
300374	5	299971
300375	3	299973
300376	3	299975
300377	3	299977
300378	3	299979
300379	3	299981
300380	3	299983
300381	3	299985
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
299971	Máquina limitante 1	Máquina limitante 1
299973	Máquina limitante 2	Máquina limitante 2
299975	Máquina limitante 3	Máquina limitante 3
299977	Máquina limitante 4	Máquina limitante 4
299979	Máquina limitante 5	Máquina limitante 5
299981	Máquina limitante 6	Máquina limitante 6
299983	Máquina limitante 7	Máquina limitante 7
299985	Máquina limitante 8	Máquina limitante 8
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
202	1	0ac1e6a6-02ee-4e51-9f7d-b90c64b49f04	Imported materials without category	f	\N
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
448488	\N	\N	t	149	0.00	0.00	16000	\N	\N	0	\N	505
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, lastadvancemeausurementforspreading, dirtylastadvancemeasurementforspreading, parent, template, externalcode, positionincontainer) FROM stdin;
456384	8	subtarea	\N	PREFIX-00041-00088	\N	\N	0.00	f	456378	359902	\N	5
456385	8	subtarea	\N	PREFIX-00041-00089	\N	\N	0.00	f	456378	359903	\N	6
456386	8	subtarea	\N	PREFIX-00041-00090	\N	\N	0.00	f	456378	359904	\N	7
456387	8	subtarea	\N	PREFIX-00041-00091	\N	\N	0.00	f	456378	359905	\N	8
456388	8	subtarea	\N	PREFIX-00041-00092	\N	\N	0.00	f	456378	359906	\N	9
456389	8	10 tareas escultor	\N	PREFIX-00041-00093	\N	\N	0.00	f	450861	359896	\N	3
456390	8	subtarea	\N	PREFIX-00041-00094	\N	\N	0.00	f	456389	359897	\N	0
456391	8	subtarea	\N	PREFIX-00041-00095	\N	\N	0.00	f	456389	359898	\N	1
456392	8	subtarea	\N	PREFIX-00041-00096	\N	\N	0.00	f	456389	359899	\N	2
456393	8	subtarea	\N	PREFIX-00041-00097	\N	\N	0.00	f	456389	359900	\N	3
456394	8	subtarea	\N	PREFIX-00041-00098	\N	\N	0.00	f	456389	359901	\N	4
456395	8	subtarea	\N	PREFIX-00041-00099	\N	\N	0.00	f	456389	359902	\N	5
456396	8	subtarea	\N	PREFIX-00041-00100	\N	\N	0.00	f	456389	359903	\N	6
456397	8	subtarea	\N	PREFIX-00041-00101	\N	\N	0.00	f	456389	359904	\N	7
456398	8	subtarea	\N	PREFIX-00041-00102	\N	\N	0.00	f	456389	359905	\N	8
456399	8	subtarea	\N	PREFIX-00041-00103	\N	\N	0.00	f	456389	359906	\N	9
456400	8	10 tareas decorador	\N	PREFIX-00041-00104	\N	\N	0.00	f	450861	359896	\N	4
456401	8	subtarea	\N	PREFIX-00041-00105	\N	\N	0.00	f	456400	359897	\N	0
456402	8	subtarea	\N	PREFIX-00041-00106	\N	\N	0.00	f	456400	359898	\N	1
456403	8	subtarea	\N	PREFIX-00041-00107	\N	\N	0.00	f	456400	359899	\N	2
456404	8	subtarea	\N	PREFIX-00041-00108	\N	\N	0.00	f	456400	359900	\N	3
456405	8	subtarea	\N	PREFIX-00041-00109	\N	\N	0.00	f	456400	359901	\N	4
450861	9	bloque pontevedra	\N	PREFIX-00041-00068	\N	\N	0.00	f	448488	\N	\N	1
450862	9	tarea capataz	\N	PREFIX-00041-00070	\N	\N	0.00	f	450861	\N	\N	0
450863	9	10 tareas soldador	\N	PREFIX-00041-00071	\N	\N	0.00	f	450861	359896	\N	1
451369	9	subtarea	\N	PREFIX-00041-00072	\N	\N	0.00	f	450863	359897	\N	0
451370	9	subtarea	\N	PREFIX-00041-00073	\N	\N	0.00	f	450863	359898	\N	1
451371	9	subtarea	\N	PREFIX-00041-00074	\N	\N	0.00	f	450863	359899	\N	2
451372	9	subtarea	\N	PREFIX-00041-00075	\N	\N	0.00	f	450863	359900	\N	3
451373	9	subtarea	\N	PREFIX-00041-00076	\N	\N	0.00	f	450863	359901	\N	4
451374	9	subtarea	\N	PREFIX-00041-00077	\N	\N	0.00	f	450863	359902	\N	5
456933	8	subtarea	\N	PREFIX-00041-00132	\N	\N	0.00	f	456927	359902	\N	5
456934	8	subtarea	\N	PREFIX-00041-00133	\N	\N	0.00	f	456927	359903	\N	6
456935	8	subtarea	\N	PREFIX-00041-00134	\N	\N	0.00	f	456927	359904	\N	7
456936	8	subtarea	\N	PREFIX-00041-00135	\N	\N	0.00	f	456927	359905	\N	8
456937	8	subtarea	\N	PREFIX-00041-00136	\N	\N	0.00	f	456927	359906	\N	9
450860	9	tarea capataz	\N	PREFIX-00041-00069	\N	\N	0.00	f	448489	\N	\N	0
448500	11	subtarea	\N	PREFIX-00041-00012	\N	\N	0.00	f	448490	359906	\N	9
448501	11	10 tareas pintor	\N	PREFIX-00041-00013	\N	\N	0.00	f	448489	359896	\N	2
448502	11	subtarea	\N	PREFIX-00041-00014	\N	\N	0.00	f	448501	359897	\N	0
448503	11	subtarea	\N	PREFIX-00041-00015	\N	\N	0.00	f	448501	359898	\N	1
448504	11	subtarea	\N	PREFIX-00041-00016	\N	\N	0.00	f	448501	359899	\N	2
448505	11	subtarea	\N	PREFIX-00041-00017	\N	\N	0.00	f	448501	359900	\N	3
448506	11	subtarea	\N	PREFIX-00041-00018	\N	\N	0.00	f	448501	359901	\N	4
448507	11	subtarea	\N	PREFIX-00041-00019	\N	\N	0.00	f	448501	359902	\N	5
448508	11	subtarea	\N	PREFIX-00041-00020	\N	\N	0.00	f	448501	359903	\N	6
448509	11	subtarea	\N	PREFIX-00041-00021	\N	\N	0.00	f	448501	359904	\N	7
448510	11	subtarea	\N	PREFIX-00041-00022	\N	\N	0.00	f	448501	359905	\N	8
448525	11	subtarea	\N	PREFIX-00041-00037	\N	\N	0.00	f	448523	359898	\N	1
448527	11	subtarea	\N	PREFIX-00041-00039	\N	\N	0.00	f	448523	359900	\N	3
448528	11	subtarea	\N	PREFIX-00041-00040	\N	\N	0.00	f	448523	359901	\N	4
448529	11	subtarea	\N	PREFIX-00041-00041	\N	\N	0.00	f	448523	359902	\N	5
448530	11	subtarea	\N	PREFIX-00041-00042	\N	\N	0.00	f	448523	359903	\N	6
448531	11	subtarea	\N	PREFIX-00041-00043	\N	\N	0.00	f	448523	359904	\N	7
448532	11	subtarea	\N	PREFIX-00041-00044	\N	\N	0.00	f	448523	359905	\N	8
448533	11	subtarea	\N	PREFIX-00041-00045	\N	\N	0.00	f	448523	359906	\N	9
449720	10	10 tareas máquina type 1	\N	PREFIX-00041-00046	\N	\N	0.00	f	448489	359896	\N	5
449721	10	subtarea	\N	PREFIX-00041-00047	\N	\N	0.00	f	449720	359897	\N	0
449722	10	subtarea	\N	PREFIX-00041-00048	\N	\N	0.00	f	449720	359898	\N	1
449723	10	subtarea	\N	PREFIX-00041-00049	\N	\N	0.00	f	449720	359899	\N	2
449724	10	subtarea	\N	PREFIX-00041-00050	\N	\N	0.00	f	449720	359900	\N	3
449725	10	subtarea	\N	PREFIX-00041-00051	\N	\N	0.00	f	449720	359901	\N	4
449726	10	subtarea	\N	PREFIX-00041-00052	\N	\N	0.00	f	449720	359902	\N	5
449727	10	subtarea	\N	PREFIX-00041-00053	\N	\N	0.00	f	449720	359903	\N	6
449728	10	subtarea	\N	PREFIX-00041-00054	\N	\N	0.00	f	449720	359904	\N	7
449729	10	subtarea	\N	PREFIX-00041-00055	\N	\N	0.00	f	449720	359905	\N	8
449730	10	subtarea	\N	PREFIX-00041-00056	\N	\N	0.00	f	449720	359906	\N	9
449731	10	10 tareas máquina type 2	\N	PREFIX-00041-00057	\N	\N	0.00	f	448489	359896	\N	6
449732	10	subtarea	\N	PREFIX-00041-00058	\N	\N	0.00	f	449731	359897	\N	0
449733	10	subtarea	\N	PREFIX-00041-00059	\N	\N	0.00	f	449731	359898	\N	1
449734	10	subtarea	\N	PREFIX-00041-00060	\N	\N	0.00	f	449731	359899	\N	2
448489	11	bloque coruña	\N	PREFIX-00041-00001	\N	\N	0.00	f	448488	\N	\N	0
448488	11	Pedido 6	\N	PREFIX-00041	2011-04-01 00:00:00	\N	0.00	f	\N	\N	\N	\N
456406	8	subtarea	\N	PREFIX-00041-00110	\N	\N	0.00	f	456400	359902	\N	5
456407	8	subtarea	\N	PREFIX-00041-00111	\N	\N	0.00	f	456400	359903	\N	6
456408	8	subtarea	\N	PREFIX-00041-00112	\N	\N	0.00	f	456400	359904	\N	7
456409	8	subtarea	\N	PREFIX-00041-00113	\N	\N	0.00	f	456400	359905	\N	8
456410	8	subtarea	\N	PREFIX-00041-00114	\N	\N	0.00	f	456400	359906	\N	9
456411	8	10 tareas máquina type 1	\N	PREFIX-00041-00115	\N	\N	0.00	f	450861	359896	\N	5
456412	8	subtarea	\N	PREFIX-00041-00116	\N	\N	0.00	f	456411	359897	\N	0
456413	8	subtarea	\N	PREFIX-00041-00117	\N	\N	0.00	f	456411	359898	\N	1
456414	8	subtarea	\N	PREFIX-00041-00118	\N	\N	0.00	f	456411	359899	\N	2
456415	8	subtarea	\N	PREFIX-00041-00119	\N	\N	0.00	f	456411	359900	\N	3
456416	8	subtarea	\N	PREFIX-00041-00120	\N	\N	0.00	f	456411	359901	\N	4
456417	8	subtarea	\N	PREFIX-00041-00121	\N	\N	0.00	f	456411	359902	\N	5
456418	8	subtarea	\N	PREFIX-00041-00122	\N	\N	0.00	f	456411	359903	\N	6
456924	8	subtarea	\N	PREFIX-00041-00123	\N	\N	0.00	f	456411	359904	\N	7
456925	8	subtarea	\N	PREFIX-00041-00124	\N	\N	0.00	f	456411	359905	\N	8
456926	8	subtarea	\N	PREFIX-00041-00125	\N	\N	0.00	f	456411	359906	\N	9
456927	8	10 tareas máquina type 2	\N	PREFIX-00041-00126	\N	\N	0.00	f	450861	359896	\N	6
456928	8	subtarea	\N	PREFIX-00041-00127	\N	\N	0.00	f	456927	359897	\N	0
456929	8	subtarea	\N	PREFIX-00041-00128	\N	\N	0.00	f	456927	359898	\N	1
456930	8	subtarea	\N	PREFIX-00041-00129	\N	\N	0.00	f	456927	359899	\N	2
456931	8	subtarea	\N	PREFIX-00041-00130	\N	\N	0.00	f	456927	359900	\N	3
456932	8	subtarea	\N	PREFIX-00041-00131	\N	\N	0.00	f	456927	359901	\N	4
458042	6	bloque coruña 2	\N	PREFIX-00041-00137	\N	\N	0.00	f	448488	\N	\N	2
458043	6	tarea capataz	\N	PREFIX-00041-00138	\N	\N	0.00	f	458042	\N	\N	0
458044	6	10 tareas soldador	\N	PREFIX-00041-00139	\N	\N	0.00	f	458042	359896	\N	1
458045	6	subtarea	\N	PREFIX-00041-00140	\N	\N	0.00	f	458044	359897	\N	0
458046	6	subtarea	\N	PREFIX-00041-00141	\N	\N	0.00	f	458044	359898	\N	1
458047	6	subtarea	\N	PREFIX-00041-00142	\N	\N	0.00	f	458044	359899	\N	2
458048	6	subtarea	\N	PREFIX-00041-00143	\N	\N	0.00	f	458044	359900	\N	3
458049	6	subtarea	\N	PREFIX-00041-00144	\N	\N	0.00	f	458044	359901	\N	4
458050	6	subtarea	\N	PREFIX-00041-00145	\N	\N	0.00	f	458044	359902	\N	5
458051	6	subtarea	\N	PREFIX-00041-00146	\N	\N	0.00	f	458044	359903	\N	6
458052	6	subtarea	\N	PREFIX-00041-00147	\N	\N	0.00	f	458044	359904	\N	7
458053	6	subtarea	\N	PREFIX-00041-00148	\N	\N	0.00	f	458044	359905	\N	8
448511	11	subtarea	\N	PREFIX-00041-00023	\N	\N	0.00	f	448501	359906	\N	9
448512	11	10 tareas escultor	\N	PREFIX-00041-00024	\N	\N	0.00	f	448489	359896	\N	3
448513	11	subtarea	\N	PREFIX-00041-00025	\N	\N	0.00	f	448512	359897	\N	0
448514	11	subtarea	\N	PREFIX-00041-00026	\N	\N	0.00	f	448512	359898	\N	1
448515	11	subtarea	\N	PREFIX-00041-00027	\N	\N	0.00	f	448512	359899	\N	2
448526	11	subtarea	\N	PREFIX-00041-00038	\N	\N	0.00	f	448523	359899	\N	2
449735	10	subtarea	\N	PREFIX-00041-00061	\N	\N	0.00	f	449731	359900	\N	3
449736	10	subtarea	\N	PREFIX-00041-00062	\N	\N	0.00	f	449731	359901	\N	4
458054	6	subtarea	\N	PREFIX-00041-00149	\N	\N	0.00	f	458044	359906	\N	9
448516	11	subtarea	\N	PREFIX-00041-00028	\N	\N	0.00	f	448512	359900	\N	3
448517	11	subtarea	\N	PREFIX-00041-00029	\N	\N	0.00	f	448512	359901	\N	4
448518	11	subtarea	\N	PREFIX-00041-00030	\N	\N	0.00	f	448512	359902	\N	5
448519	11	subtarea	\N	PREFIX-00041-00031	\N	\N	0.00	f	448512	359903	\N	6
448520	11	subtarea	\N	PREFIX-00041-00032	\N	\N	0.00	f	448512	359904	\N	7
448521	11	subtarea	\N	PREFIX-00041-00033	\N	\N	0.00	f	448512	359905	\N	8
448522	11	subtarea	\N	PREFIX-00041-00034	\N	\N	0.00	f	448512	359906	\N	9
448523	11	10 tareas decorador	\N	PREFIX-00041-00035	\N	\N	0.00	f	448489	359896	\N	4
448524	11	subtarea	\N	PREFIX-00041-00036	\N	\N	0.00	f	448523	359897	\N	0
449737	10	subtarea	\N	PREFIX-00041-00063	\N	\N	0.00	f	449731	359902	\N	5
449738	10	subtarea	\N	PREFIX-00041-00064	\N	\N	0.00	f	449731	359903	\N	6
449739	10	subtarea	\N	PREFIX-00041-00065	\N	\N	0.00	f	449731	359904	\N	7
449740	10	subtarea	\N	PREFIX-00041-00066	\N	\N	0.00	f	449731	359905	\N	8
449741	10	subtarea	\N	PREFIX-00041-00067	\N	\N	0.00	f	449731	359906	\N	9
448490	11	10 tareas soldador	\N	PREFIX-00041-00002	\N	\N	0.00	f	448489	359896	\N	1
448491	11	subtarea	\N	PREFIX-00041-00003	\N	\N	0.00	f	448490	359897	\N	0
448492	11	subtarea	\N	PREFIX-00041-00004	\N	\N	0.00	f	448490	359898	\N	1
448493	11	subtarea	\N	PREFIX-00041-00005	\N	\N	0.00	f	448490	359899	\N	2
448494	11	subtarea	\N	PREFIX-00041-00006	\N	\N	0.00	f	448490	359900	\N	3
448495	11	subtarea	\N	PREFIX-00041-00007	\N	\N	0.00	f	448490	359901	\N	4
448496	11	subtarea	\N	PREFIX-00041-00008	\N	\N	0.00	f	448490	359902	\N	5
448497	11	subtarea	\N	PREFIX-00041-00009	\N	\N	0.00	f	448490	359903	\N	6
448498	11	subtarea	\N	PREFIX-00041-00010	\N	\N	0.00	f	448490	359904	\N	7
448499	11	subtarea	\N	PREFIX-00041-00011	\N	\N	0.00	f	448490	359905	\N	8
451375	9	subtarea	\N	PREFIX-00041-00078	\N	\N	0.00	f	450863	359903	\N	6
451376	9	subtarea	\N	PREFIX-00041-00079	\N	\N	0.00	f	450863	359904	\N	7
451377	9	subtarea	\N	PREFIX-00041-00080	\N	\N	0.00	f	450863	359905	\N	8
451378	9	subtarea	\N	PREFIX-00041-00081	\N	\N	0.00	f	450863	359906	\N	9
456378	8	10 tareas pintor	\N	PREFIX-00041-00082	\N	\N	0.00	f	450861	359896	\N	2
456379	8	subtarea	\N	PREFIX-00041-00083	\N	\N	0.00	f	456378	359897	\N	0
456380	8	subtarea	\N	PREFIX-00041-00084	\N	\N	0.00	f	456378	359898	\N	1
456381	8	subtarea	\N	PREFIX-00041-00085	\N	\N	0.00	f	456378	359899	\N	2
456382	8	subtarea	\N	PREFIX-00041-00086	\N	\N	0.00	f	456378	359900	\N	3
456383	8	subtarea	\N	PREFIX-00041-00087	\N	\N	0.00	f	456378	359901	\N	4
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
127635	1	elemento con múltiples hijos	\N	PREFIX-00002-00060	\N	\N	3	\N	\N
301286	1	tarea de decorador pontevedrés	\N	PREFIX-00036-00001	\N	\N	4	\N	\N
301290	1	tarea de decorador coruñés	\N	PREFIX-00036-00002	\N	\N	4	\N	\N
127636	1	elemento 52	\N	PREFIX-00002-00061	\N	\N	3	127635	0
127639	1	elemento 51 (copy)	\N	PREFIX-00002-00064	\N	\N	0	127635	1
127640	1	elemento 54	\N	PREFIX-00002-00065	\N	\N	0	127635	2
127641	1	elemento 55	\N	PREFIX-00002-00066	\N	\N	3	127635	3
127645	1	elemento 58	\N	PREFIX-00002-00070	\N	\N	0	127635	4
127646	1	elemento 59	\N	PREFIX-00002-00071	\N	\N	0	127635	5
127647	1	elemento 60	\N	PREFIX-00002-00072	\N	\N	0	127635	6
127648	1	elemento 61	\N	PREFIX-00002-00073	\N	\N	3	127635	7
127637	1	elemento 52 (copy)	\N	PREFIX-00002-00062	\N	\N	0	127636	0
127638	1	elemento 53	\N	PREFIX-00002-00063	\N	\N	0	127636	1
127642	1	elemento 55 (copy)	\N	PREFIX-00002-00067	\N	\N	0	127641	0
127643	1	elemento 56	\N	PREFIX-00002-00068	\N	\N	0	127641	1
127644	1	elemento 57	\N	PREFIX-00002-00069	\N	\N	0	127641	2
127649	1	elemento 61 (copy)	\N	PREFIX-00002-00074	\N	\N	0	127648	0
127650	1	elemento 62	\N	PREFIX-00002-00075	\N	\N	0	127648	1
127651	1	elemento 63	\N	PREFIX-00002-00076	\N	\N	0	127648	2
127652	1	elemento 64	\N	PREFIX-00002-00077	\N	\N	0	127648	3
127653	1	elemento 65	\N	PREFIX-00002-00078	\N	\N	0	127648	4
127654	1	elemento 66	\N	PREFIX-00002-00079	\N	\N	0	127648	5
127655	1	elemento 67	\N	PREFIX-00002-00080	\N	\N	0	127648	6
127656	1	elemento 68	\N	PREFIX-00002-00081	\N	\N	0	127648	7
127657	1	elemento 69	\N	PREFIX-00002-00082	\N	\N	0	127648	8
127658	1	elemento 70	\N	PREFIX-00002-00083	\N	\N	0	127648	9
301993	1	tarea máquina tipo 1 pontevedra	\N	PREFIX-00036-00012	\N	\N	4	\N	\N
301997	1	tarea máquina tipo 1 coruña	\N	PREFIX-00036-00031	\N	\N	4	\N	\N
312295	1	tarea de máquina tipo 2, coruña	\N	PREFIX-00037-00001	\N	\N	4	\N	\N
312299	1	tarea máquina tipo 2 pontevedra	\N	PREFIX-00037-00002	\N	\N	4	\N	\N
312303	1	tarea de soldador coruñés	\N	PREFIX-00038-00001	\N	\N	4	\N	\N
312307	1	tarea de pintor coruñés	\N	PREFIX-00038-00016	\N	\N	4	\N	\N
312311	1	tarea de soldador pontevedrés	\N	PREFIX-00038-00032	\N	\N	4	\N	\N
312315	1	tarea de pintor pontevedrés	\N	PREFIX-00038-00048	\N	\N	4	\N	\N
359900	2	subtarea	\N	PREFIX-00040-00049	\N	\N	4	359896	3
359901	2	subtarea	\N	PREFIX-00040-00050	\N	\N	4	359896	4
359902	2	subtarea	\N	PREFIX-00040-00051	\N	\N	4	359896	5
359903	2	subtarea	\N	PREFIX-00040-00052	\N	\N	4	359896	6
359904	2	subtarea	\N	PREFIX-00040-00053	\N	\N	4	359896	7
359905	2	subtarea	\N	PREFIX-00040-00054	\N	\N	4	359896	8
359906	2	subtarea	\N	PREFIX-00040-00055	\N	\N	4	359896	9
359896	2	10 tareas trabajador coruñés	\N	PREFIX-00040-00045	\N	\N	4	\N	\N
359897	2	subtarea	\N	PREFIX-00040-00046	\N	\N	4	359896	0
359898	2	subtarea	\N	PREFIX-00040-00047	\N	\N	4	359896	1
359899	2	subtarea	\N	PREFIX-00040-00048	\N	\N	4	359896	2
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
456392	1
456393	1
456394	1
456395	1
456396	1
450860	1
448491	1
448492	1
448493	1
448494	1
448495	1
448496	1
448497	1
448498	1
448499	1
448500	1
448502	1
448503	1
448504	1
448505	1
448506	1
448507	1
448508	1
448509	1
448510	1
448511	1
448513	1
448514	1
448515	1
448516	1
448517	1
448518	1
448519	1
448520	1
448521	1
448522	1
448524	1
448525	1
448526	1
448527	1
448528	1
448529	1
448530	1
448531	1
448532	1
448533	1
449721	1
449722	1
449723	1
449724	1
449725	1
449726	1
449727	1
449728	1
449729	1
449730	1
449732	1
449733	1
449734	1
456379	1
456380	1
456381	1
456382	1
456383	1
456384	1
456385	1
456386	1
456387	1
456388	1
456390	1
456391	1
456932	1
456933	1
456934	1
456935	1
456936	1
456937	1
458043	1
458045	1
458046	1
458047	1
458048	1
458049	1
458050	1
458051	1
458052	1
458053	1
458054	1
449735	1
450862	1
451369	1
451370	1
451371	1
451372	1
451373	1
451374	1
451375	1
451376	1
451377	1
451378	1
456397	1
456398	1
456399	1
456401	1
456402	1
456403	1
456404	1
456405	1
456406	1
456407	1
456408	1
456409	1
456410	1
456412	1
456413	1
456414	1
456415	1
456416	1
456417	1
456418	1
456924	1
456925	1
456926	1
456928	1
456929	1
456930	1
456931	1
449736	1
449737	1
449738	1
449739	1
449740	1
449741	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
448488
448489
448490
448501
448512
448523
449720
449731
450861
450863
456378
456389
456400
456411
456927
458042
458044
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
127635
127636
127641
127648
359896
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
127637	0
127638	0
127639	0
127640	0
127642	0
127643	0
127644	0
127645	0
127646	0
127647	0
127649	0
127650	0
127651	0
127652	0
127653	0
127654	0
127655	0
127656	0
127657	0
127658	0
301286	0
301290	0
301993	0
301997	0
312295	0
312299	0
312303	0
312307	0
312311	0
312315	0
359897	0
359898	0
359899	0
359900	0
359901	0
359902	0
359903	0
359904	0
359905	0
359906	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
808	42	PREFIX	41	5	t
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
445336	15	2010-08-03 15:03:02.668	909
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
299987	2	deccor1	f	f	300079
299971	5	8b5c5e0e-bc50-4e2d-b97f-c8c3e181dcf7	t	t	300071
299973	3	a5ab3941-8cce-47e4-bef4-7f8a70109bcf	t	t	300072
299975	3	8bece01f-75b3-4319-81f5-5d6744e380d8	t	t	300073
299977	3	810b486b-18a7-45be-b0a0-1a8b0210f65a	t	t	300074
299979	3	565ef437-e034-45b2-8204-62c7c6717542	t	t	300075
299981	3	3b634508-7f41-40f6-a1db-ddaf43bb6346	t	t	300076
1627	3	1849779f-4419-44dd-98a0-3612d34743e3	t	f	513
2728	2	pincor2	f	f	2829
2727	2	pincor1	f	f	2828
2729	2	pincor3	f	f	2830
2730	2	pincor4	f	f	2831
2731	2	solcor1	f	f	2832
2732	2	solcor2	f	f	2833
2733	2	solcor3	f	f	2834
2734	2	solcor4	f	f	2835
1617	4	166106cf-5fce-4a4a-bd1f-249029b3b565	t	f	508
2020	2	cappon2	f	f	2121
2029	2	capcor2	f	f	2130
2025	2	esccor1	f	f	2126
2026	2	esccor2	f	f	2127
2027	2	esccor3	f	f	2128
2028	2	esccor4	f	f	2129
1629	2	c02f823a-a30c-4dae-af8d-3d978ac3c6d2	t	f	514
1631	2	2d3f15fc-8c78-41d6-81fa-2ca777a3e908	t	f	515
1633	2	c4180e03-c387-4d38-b216-f0cbee9250ae	t	f	516
1619	2	3d74c082-2c65-4ecf-95e8-5e631b45d35e	t	f	509
1621	2	0e516c97-8345-4091-8a0a-d9ad456c2fdd	t	f	510
1623	2	5d577cbe-be59-4f8f-b4af-5d15d958dc4e	t	f	511
1625	2	eac99541-ed3b-401d-8794-9b160f7ff8cc	t	f	512
2021	2	escpon1	f	f	2122
2022	2	escpon2	f	f	2123
2023	2	escpon3	f	f	2124
2024	2	escpon4	f	f	2125
299983	3	6433ea76-6595-4a73-8c21-3e08eadaca9a	t	t	300077
299985	3	2f8b7eb8-7f57-4ab7-ba3b-797d22439366	t	t	300078
299989	2	deccor2	f	f	300080
299991	2	decpon1	f	f	300081
299993	2	decpon2	f	f	300082
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
460979	2	0.96	\N	100	361879	\N
460980	2	2.50	\N	100	361880	\N
460981	2	0.96	\N	100	361881	\N
479359	1	0.96	\N	100	458540	\N
479360	1	0.96	\N	100	458541	\N
479361	1	0.96	\N	100	458542	\N
479362	1	1.56	\N	100	458543	\N
479363	1	0.96	\N	100	458544	\N
479364	1	0.96	\N	100	458545	\N
479365	1	1.79	\N	100	458546	\N
479358	1	1.98	\N	1000	361871	\N
460972	2	0.96	\N	100	361872	\N
460973	2	0.96	\N	100	361873	\N
460974	2	0.96	\N	100	361874	\N
460975	2	2.50	\N	100	361875	\N
460976	2	2.50	\N	100	361876	\N
460977	2	2.50	\N	100	361877	\N
460978	2	0.96	\N	100	361878	\N
479366	1	2.50	\N	100	458547	\N
479367	1	2.50	\N	100	458548	\N
479368	1	2.50	\N	100	458549	\N
479369	1	0.96	\N	100	458551	\N
479370	1	0.96	\N	100	458552	\N
479371	1	0.96	\N	100	458553	\N
479372	1	0.96	\N	100	458554	\N
479373	1	0.96	\N	100	458555	\N
479374	1	0.96	\N	100	458556	\N
479375	1	0.96	\N	100	458557	\N
479376	1	0.96	\N	100	458558	\N
479377	1	0.96	\N	100	458559	\N
479378	1	2.50	\N	100	458560	\N
479379	1	0.96	\N	100	458562	\N
479380	1	0.96	\N	100	458563	\N
479381	1	0.96	\N	100	458564	\N
479382	1	0.96	\N	100	458565	\N
479383	1	1.79	\N	100	458566	\N
479384	1	1.79	\N	100	458567	\N
479385	1	1.79	\N	100	458568	\N
479386	1	1.79	\N	100	458569	\N
479387	1	1.79	\N	100	458570	\N
479388	1	1.79	\N	100	458571	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
513	1
2829	1
2828	1
2830	1
2831	1
2832	1
2833	1
2834	1
2835	1
508	1
2121	1
2130	1
2126	1
2127	1
2128	1
2129	1
514	1
515	1
516	1
509	1
510	1
511	1
512	1
2122	1
2123	1
2124	1
2125	1
300079	1
300071	1
300072	1
300073	1
300074	1
300075	1
300076	1
300077	1
300078	1
300080	1
300081	1
300082	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
1924	3	9ccfbe1c-3101-4bb1-ab9d-54ddafb93dba	2009-01-01	2009-12-31	1313	1627
3233	2	pincor2-r1	2010-07-01	\N	1313	2728
3232	2	pincor1-r1	2010-01-01	\N	1313	2727
3234	2	pincor3-r1	2009-01-01	\N	1313	2729
3235	2	pincor4-r1	2009-01-01	2009-12-31	1313	2730
3236	2	solcor1-r1	2009-01-01	2009-12-31	1313	2731
3237	2	solcor2-r1	2009-01-01	\N	1313	2732
3238	2	solcor3-r1	2010-01-01	\N	1313	2733
3239	2	solcor4-r1	2010-07-01	\N	1313	2734
1919	3	99727b20-ab7a-4eab-a4da-b501fa288928	2010-01-12	\N	1314	1617
2525	2	cappon2-a1	2009-01-01	\N	1314	2020
2534	2	capcor2-a1	2009-01-01	\N	1314	2029
2530	2	esccor1-a1	2009-01-01	\N	1313	2025
2531	2	esccor2-a1	2009-01-01	2009-12-31	1313	2026
2532	2	esccor3-a1	2010-01-01	\N	1313	2027
2533	2	esccor4-a1	2010-01-01	\N	1313	2028
1925	2	ceb97381-5921-48d4-b395-2d76fd5e8a70	2009-01-01	\N	1313	1629
1926	2	d6bc3bc8-cb0a-493b-9c2e-e8d300053a61	2010-01-01	\N	1313	1631
1927	2	fd2b6257-c3df-4b43-b821-ab5015d4a8b3	2010-07-01	\N	1313	1633
1920	2	051ebe17-84e7-4989-8879-e246654d5338	2010-01-01	\N	1313	1619
1921	2	c2552ab2-1eaf-4f9a-a842-e9e4d44a2a8d	2010-07-01	\N	1313	1621
1922	2	98a2b0f1-2f53-4b7e-92d2-c257e6fb9fba	2009-01-01	\N	1313	1623
1923	2	3a7db51d-fc3f-41dd-82be-fbf1f22efdb8	2009-01-01	2010-12-31	1313	1625
2526	2	escpon1-a1	2009-01-01	\N	1313	2021
2527	2	escpon2-a1	2009-01-01	2009-12-31	1313	2022
2528	2	escpon3-a1	2010-01-01	\N	1313	2023
2529	2	escpon4-a1	2010-01-01	\N	1313	2024
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario (id, version, name, description, lastnotownedreassignationstimestamp, predecessor) FROM stdin;
909	7	master	\N	\N	\N
\.


--
-- Data for Name: scenario_orders; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scenario_orders (order_id, order_version_id, scenario_id) FROM stdin;
448488	445336	909
\.


--
-- Data for Name: scheduling_states_by_order_version; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY scheduling_states_by_order_version (order_element_id, scheduling_state_for_version_id, order_version_id) FROM stdin;
448488	448589	445336
448489	448590	445336
448490	448591	445336
448491	448592	445336
448492	448593	445336
448493	448594	445336
448494	448595	445336
448495	448596	445336
448496	448597	445336
448497	448598	445336
448498	448599	445336
448499	448600	445336
448500	448601	445336
448501	448602	445336
448502	448603	445336
448503	448604	445336
448504	448605	445336
448505	448606	445336
448506	448607	445336
448507	448608	445336
448508	448609	445336
448509	448610	445336
448510	448611	445336
448511	448612	445336
448512	448613	445336
448513	448614	445336
448514	448615	445336
448515	448616	445336
448516	448617	445336
448517	448618	445336
448518	448619	445336
448519	448620	445336
448520	448621	445336
448521	448622	445336
448522	448623	445336
448523	448624	445336
448524	448625	445336
448525	448626	445336
448526	448627	445336
448527	448628	445336
448528	448629	445336
448529	448630	445336
448530	448631	445336
448531	448632	445336
448532	448633	445336
448533	448634	445336
449720	449821	445336
449721	449822	445336
449722	449823	445336
449723	449824	445336
449724	449825	445336
449725	449826	445336
449726	449827	445336
449727	449828	445336
449728	449829	445336
449729	449830	445336
449730	449831	445336
449731	449832	445336
449732	449833	445336
449733	449834	445336
449734	449835	445336
449735	449836	445336
449736	449837	445336
449737	449838	445336
449738	449839	445336
449739	449840	445336
449740	449841	445336
449741	449842	445336
450860	450961	445336
450861	450962	445336
450862	450963	445336
450863	450964	445336
451369	451470	445336
451370	451471	445336
451371	451472	445336
451372	451473	445336
451373	451474	445336
451374	451475	445336
451375	451476	445336
451376	451477	445336
451377	451478	445336
451378	451479	445336
456378	456479	445336
456379	456480	445336
456380	456481	445336
456381	456482	445336
456382	456483	445336
456383	456484	445336
456384	456485	445336
456385	456486	445336
456386	456487	445336
456387	456488	445336
456388	456489	445336
456389	456490	445336
456390	456491	445336
456391	456492	445336
456392	456493	445336
456393	456494	445336
456394	456495	445336
456395	456496	445336
456396	456497	445336
456397	456498	445336
456398	456499	445336
456399	456500	445336
456400	456501	445336
456401	456502	445336
456402	456503	445336
456403	456504	445336
456404	456505	445336
456405	456506	445336
456406	456507	445336
456407	456508	445336
456408	456509	445336
456409	456510	445336
456410	456511	445336
456411	456512	445336
456412	456513	445336
456413	456514	445336
456414	456515	445336
456415	456516	445336
456416	456517	445336
456417	456518	445336
456418	456519	445336
456924	457025	445336
456925	457026	445336
456926	457027	445336
456927	457028	445336
456928	457029	445336
456929	457030	445336
456930	457031	445336
456931	457032	445336
456932	457033	445336
456933	457034	445336
456934	457035	445336
456935	457036	445336
456936	457037	445336
456937	457038	445336
458042	458143	445336
458043	458144	445336
458044	458145	445336
458045	458146	445336
458046	458147	445336
458047	458148	445336
458048	458149	445336
458049	458150	445336
458050	458151	445336
458051	458152	445336
458052	458153	445336
458053	458154	445336
458054	458155	445336
\.


--
-- Data for Name: schedulingdataforversion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY schedulingdataforversion (id, version, schedulingstatetype, order_element_id) FROM stdin;
449822	10	0	449721
449823	10	0	449722
449824	10	0	449723
449825	10	0	449724
449826	10	0	449725
448589	11	2	448488
448590	11	3	448489
448591	11	3	448490
448592	11	0	448491
448593	11	0	448492
448594	11	0	448493
448595	11	0	448494
448596	11	0	448495
448597	11	0	448496
448598	11	0	448497
448599	11	0	448498
448600	11	0	448499
448601	11	0	448500
448602	11	3	448501
448603	11	0	448502
448604	11	0	448503
448605	11	0	448504
448606	11	0	448505
448607	11	0	448506
448608	11	0	448507
448609	11	0	448508
448610	11	0	448509
448611	11	0	448510
448612	11	0	448511
449827	10	0	449726
449828	10	0	449727
449829	10	0	449728
449830	10	0	449729
449831	10	0	449730
449832	10	3	449731
449833	10	0	449732
449834	10	0	449733
449835	10	0	449734
449836	10	0	449735
449837	10	0	449736
449838	10	0	449737
449839	10	0	449738
449840	10	0	449739
449841	10	0	449740
449842	10	0	449741
451470	9	0	451369
451471	9	0	451370
451472	9	0	451371
451473	9	0	451372
451474	9	0	451373
450962	9	3	450861
450963	9	0	450862
450964	9	3	450863
451475	9	0	451374
451476	9	0	451375
451477	9	0	451376
451478	9	0	451377
451479	9	0	451378
456479	8	3	456378
456480	8	0	456379
456481	8	0	456380
456482	8	0	456381
456483	8	0	456382
456484	8	0	456383
456485	8	0	456384
456486	8	0	456385
456487	8	0	456386
456488	8	0	456387
456489	8	0	456388
456510	8	0	456409
456511	8	0	456410
456512	8	3	456411
456513	8	0	456412
456514	8	0	456413
456515	8	0	456414
456516	8	0	456415
456517	8	0	456416
456518	8	0	456417
456519	8	0	456418
457025	8	0	456924
457026	8	0	456925
457027	8	0	456926
457028	8	3	456927
457029	8	0	456928
457030	8	0	456929
457031	8	0	456930
457032	8	0	456931
457033	8	0	456932
457034	8	0	456933
457035	8	0	456934
457036	8	0	456935
457037	8	0	456936
457038	8	0	456937
450961	9	0	450860
456500	8	0	456399
456501	8	3	456400
456502	8	0	456401
456503	8	0	456402
456504	8	0	456403
456505	8	0	456404
456506	8	0	456405
456507	8	0	456406
456508	8	0	456407
456509	8	0	456408
458143	6	4	458042
458144	6	4	458043
458145	6	4	458044
458146	6	4	458045
458147	6	4	458046
458148	6	4	458047
458149	6	4	458048
458150	6	4	458049
458151	6	4	458050
458152	6	4	458051
458153	6	4	458052
458154	6	4	458053
458155	6	4	458054
448613	11	3	448512
448614	11	0	448513
448615	11	0	448514
448616	11	0	448515
448617	11	0	448516
448618	11	0	448517
448619	11	0	448518
448620	11	0	448519
448621	11	0	448520
448622	11	0	448521
456490	8	3	456389
456491	8	0	456390
456492	8	0	456391
456493	8	0	456392
456494	8	0	456393
456495	8	0	456394
456496	8	0	456395
456497	8	0	456396
456498	8	0	456397
456499	8	0	456398
448623	11	0	448522
448624	11	3	448523
448625	11	0	448524
448626	11	0	448525
448627	11	0	448526
448628	11	0	448527
448629	11	0	448528
448630	11	0	448529
448631	11	0	448530
448632	11	0	448531
448633	11	0	448532
448634	11	0	448533
449821	10	3	449720
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
\.


--
-- Data for Name: specificdayassignmentscontainer; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specificdayassignmentscontainer (id, version, resource_allocation_id, scenario) FROM stdin;
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
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
361871	1	0	\N	\N	\N
361872	1	0	\N	\N	\N
361873	1	0	\N	\N	\N
361874	1	0	\N	\N	\N
361875	1	0	\N	\N	\N
361876	1	0	\N	\N	\N
361877	1	0	\N	\N	\N
361878	1	1	2011-04-20 15:01:56.92	\N	\N
361879	1	0	\N	\N	\N
361880	1	0	\N	\N	\N
361881	1	0	\N	\N	\N
458540	1	0	\N	\N	\N
458541	1	0	\N	\N	\N
458542	1	0	\N	\N	\N
458543	1	0	\N	\N	\N
458544	1	0	\N	\N	\N
458545	1	0	\N	\N	\N
458546	1	0	\N	\N	\N
458547	1	0	\N	\N	\N
458548	1	0	\N	\N	\N
458549	1	0	\N	\N	\N
458551	1	0	\N	\N	\N
458552	1	0	\N	\N	\N
458553	1	0	\N	\N	\N
458554	1	0	\N	\N	\N
458555	1	0	\N	\N	\N
458556	1	0	\N	\N	\N
458557	1	0	\N	\N	\N
458558	1	0	\N	\N	\N
458559	1	0	\N	\N	\N
458560	1	0	\N	\N	\N
458562	1	0	\N	\N	\N
458563	1	0	\N	\N	\N
458564	1	0	\N	\N	\N
458565	1	0	\N	\N	\N
458566	1	0	\N	\N	\N
458567	1	0	\N	\N	\N
458568	1	0	\N	\N	\N
458569	1	0	\N	\N	\N
458570	1	0	\N	\N	\N
458571	1	0	\N	\N	\N
458573	1	0	\N	\N	\N
458574	1	0	\N	\N	\N
458575	1	0	\N	\N	\N
458576	1	0	\N	\N	\N
458577	1	0	\N	\N	\N
458578	1	0	\N	\N	\N
458579	1	0	\N	\N	\N
458580	1	0	\N	\N	\N
458581	1	0	\N	\N	\N
458582	1	0	\N	\N	\N
458584	1	0	\N	\N	\N
458585	1	0	\N	\N	\N
458586	1	0	\N	\N	\N
458587	1	0	\N	\N	\N
458588	1	0	\N	\N	\N
458589	1	0	\N	\N	\N
458590	1	0	\N	\N	\N
458591	1	0	\N	\N	\N
458592	1	0	\N	\N	\N
458593	1	0	\N	\N	\N
458596	1	0	\N	\N	\N
458597	1	0	\N	\N	\N
458598	1	0	\N	\N	\N
458599	1	0	\N	\N	\N
458600	1	0	\N	\N	\N
458601	1	0	\N	\N	\N
458602	1	0	\N	\N	\N
458603	1	0	\N	\N	\N
458604	1	0	\N	\N	\N
458605	1	0	\N	\N	\N
458606	1	0	\N	\N	\N
458608	1	0	\N	\N	\N
458609	1	0	\N	\N	\N
458610	1	0	\N	\N	\N
458611	1	0	\N	\N	\N
458612	1	0	\N	\N	\N
458613	1	0	\N	\N	\N
458614	1	0	\N	\N	\N
458615	1	0	\N	\N	\N
458616	1	0	\N	\N	\N
458617	1	0	\N	\N	\N
458619	1	0	\N	\N	\N
458620	1	0	\N	\N	\N
458621	1	0	\N	\N	\N
458622	1	0	\N	\N	\N
458623	1	0	\N	\N	\N
458624	1	0	\N	\N	\N
458625	1	0	\N	\N	\N
458626	1	0	\N	\N	\N
458627	1	0	\N	\N	\N
458628	1	0	\N	\N	\N
458630	1	0	\N	\N	\N
458631	1	0	\N	\N	\N
458632	1	0	\N	\N	\N
458633	1	0	\N	\N	\N
458634	1	0	\N	\N	\N
458635	1	0	\N	\N	\N
458636	1	0	\N	\N	\N
458637	1	0	\N	\N	\N
458638	1	0	\N	\N	\N
458639	1	0	\N	\N	\N
458641	1	0	\N	\N	\N
458642	1	0	\N	\N	\N
458643	1	0	\N	\N	\N
458644	1	0	\N	\N	\N
458645	1	0	\N	\N	\N
458646	1	0	\N	\N	\N
458647	1	0	\N	\N	\N
458648	1	0	\N	\N	\N
458649	1	0	\N	\N	\N
458650	1	0	\N	\N	\N
458652	1	0	\N	\N	\N
458653	1	0	\N	\N	\N
458654	1	0	\N	\N	\N
458655	1	0	\N	\N	\N
458656	1	0	\N	\N	\N
458657	1	0	\N	\N	\N
458658	1	0	\N	\N	\N
458659	1	0	\N	\N	\N
458660	1	0	\N	\N	\N
458661	1	0	\N	\N	\N
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
361871	451187
361872	448766
361873	448767
361874	448768
361875	448769
361876	448770
361877	448771
361878	448772
361879	448773
361880	448774
361881	448775
458540	448776
458541	448777
458542	448778
458543	448779
458544	448780
458545	448781
458546	448782
458547	448783
458548	448784
458549	448785
458551	448786
458552	448787
458553	448788
458554	448789
458555	448790
458556	448791
458557	448792
458558	448793
458559	448794
458560	448795
458562	448796
458563	448797
458564	448798
458565	448799
458566	448800
458567	448801
458568	448802
458569	448803
458570	448804
458571	448805
458573	449976
458574	449977
458575	449978
458576	449979
458577	449980
458578	449981
458579	449982
458580	449983
458581	449984
458582	449985
458584	449986
458585	449987
458586	449988
458587	449989
458588	449990
458589	449991
458590	449992
458591	449993
458592	449994
458593	449995
458596	451188
458597	451189
458598	451190
458599	451191
458600	451192
458601	451193
458602	451194
458603	451195
458604	451196
458605	451197
458606	451198
458608	456726
458609	456727
458610	456728
458611	456729
458612	456730
458613	456731
458614	456732
458615	456733
458616	456734
458617	456735
458619	456736
458620	456737
458621	456738
458622	456739
458623	456740
458624	456741
458625	456742
458626	456743
458627	456744
458628	456745
458630	456746
458631	456747
458632	456748
458633	456749
458634	456750
458635	456751
458636	456752
458637	456753
458638	456754
458639	456755
458641	456756
458642	456757
458643	456758
458644	456759
458645	456760
458646	456761
458647	456762
458648	456763
458649	456764
458650	456765
458652	456766
458653	456767
458654	456768
458655	456769
458656	456770
458657	456771
458658	456772
458659	456773
458660	456774
458661	456775
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, advance_percentage, parent, base_calendar_id, positioninparent) FROM stdin;
458626	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	7
458661	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	9
458557	4	subtarea	\N	2011-05-07 00:00:00	2011-05-26 00:00:00	\N	0.00	458561	\N	6
458558	4	subtarea	\N	2011-05-07 00:00:00	2011-05-26 00:00:00	\N	0.00	458561	\N	7
458559	4	subtarea	\N	2011-05-07 00:00:00	2011-05-26 00:00:00	\N	0.00	458561	\N	8
458560	4	subtarea	\N	2011-05-26 00:00:00	2011-06-02 00:00:00	\N	0.00	458561	\N	9
458572	4	10 tareas decorador	\N	2011-04-01 00:00:00	2011-07-06 00:00:00	\N	0.00	458595	\N	4
458562	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458572	\N	0
458563	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458572	\N	1
458564	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458572	\N	2
458565	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458572	\N	3
458566	4	subtarea	\N	2011-05-07 00:00:00	2011-05-18 00:00:00	\N	0.00	458572	\N	4
458567	4	subtarea	\N	2011-05-18 00:00:00	2011-05-27 00:00:00	\N	0.00	458572	\N	5
458568	4	subtarea	\N	2011-05-27 00:00:00	2011-06-07 00:00:00	\N	0.00	458572	\N	6
458569	4	subtarea	\N	2011-06-07 00:00:00	2011-06-16 00:00:00	\N	0.00	458572	\N	7
458586	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	2
458587	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	3
458588	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	4
458589	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	5
458590	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	6
458591	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	7
458592	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	8
458593	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	9
458663	4	bloque pontevedra	\N	2011-04-01 00:00:00	2011-08-04 00:00:00	\N	0.00	458664	\N	1
458596	4	tarea capataz	\N	2011-04-01 00:00:00	2011-08-04 00:00:00	\N	0.00	458663	\N	0
458607	4	10 tareas soldador	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	1
458597	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	0
458598	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	1
458599	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	2
458600	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	3
458601	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	4
458602	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	5
458603	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	6
458604	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	7
458605	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	8
458606	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458607	\N	9
458618	4	10 tareas pintor	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	2
458608	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	0
458609	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	1
458610	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	2
458611	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	3
458612	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	4
458613	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	5
458614	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	6
458615	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	7
458616	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	8
458617	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458618	\N	9
458629	4	10 tareas escultor	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	3
458619	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	0
458620	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	1
458621	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	2
458622	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	3
458623	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	4
458624	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	5
458625	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	6
458627	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	8
458628	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458629	\N	9
458640	4	10 tareas decorador	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	4
458651	4	10 tareas máquina type 1	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	5
458662	4	10 tareas máquina type 2	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458663	\N	6
458654	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	2
458655	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	3
458656	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	4
458657	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	5
458658	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	6
458659	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	7
458660	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	8
458664	4	Pedido 6	\N	2011-04-01 00:00:00	2011-08-04 00:00:00	\N	0.00	\N	\N	\N
458630	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	0
458631	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	1
458632	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	2
458633	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	3
458634	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	4
458635	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	5
458636	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	6
458637	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	7
458638	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	8
458639	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458640	\N	9
458641	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	0
458642	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	1
458643	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	2
458644	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	3
458645	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	4
458646	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	5
458647	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	6
458648	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	7
458649	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	8
458650	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458651	\N	9
458652	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	0
458653	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458662	\N	1
361871	4	tarea capataz	\N	2011-04-01 00:00:00	2011-06-29 00:00:00	\N	0.00	458595	\N	0
361882	4	10 tareas soldador	\N	2011-04-01 00:00:00	2011-06-04 00:00:00	\N	0.00	458595	\N	1
361872	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	361882	\N	0
361873	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	361882	\N	1
361874	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	361882	\N	2
361875	4	subtarea	\N	2011-04-20 00:00:00	2011-04-27 00:00:00	\N	0.00	361882	\N	3
361876	4	subtarea	\N	2011-04-27 00:00:00	2011-05-04 00:00:00	\N	0.00	361882	\N	4
361877	4	subtarea	\N	2011-05-04 00:00:00	2011-05-11 00:00:00	\N	0.00	361882	\N	5
361878	4	subtarea	\N	2011-05-11 00:00:00	2011-05-28 00:00:00	\N	0.00	361882	\N	6
361879	4	subtarea	\N	2011-05-11 00:00:00	2011-05-28 00:00:00	\N	0.00	361882	\N	7
361880	4	subtarea	\N	2011-05-28 00:00:00	2011-06-04 00:00:00	\N	0.00	361882	\N	8
361881	4	subtarea	\N	2011-05-11 00:00:00	2011-05-28 00:00:00	\N	0.00	361882	\N	9
458550	4	10 tareas pintor	\N	2011-04-01 00:00:00	2011-06-09 00:00:00	\N	0.00	458595	\N	2
458540	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458550	\N	0
458541	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458550	\N	1
458542	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458550	\N	2
458543	4	subtarea	\N	2011-04-20 00:00:00	2011-04-30 00:00:00	\N	0.00	458550	\N	3
458544	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458550	\N	4
458545	4	subtarea	\N	2011-04-30 00:00:00	2011-05-19 00:00:00	\N	0.00	458550	\N	5
458546	4	subtarea	\N	2011-05-07 00:00:00	2011-05-18 00:00:00	\N	0.00	458550	\N	6
458547	4	subtarea	\N	2011-05-19 00:00:00	2011-05-26 00:00:00	\N	0.00	458550	\N	7
458548	4	subtarea	\N	2011-05-26 00:00:00	2011-06-02 00:00:00	\N	0.00	458550	\N	8
458549	4	subtarea	\N	2011-06-02 00:00:00	2011-06-09 00:00:00	\N	0.00	458550	\N	9
458561	4	10 tareas escultor	\N	2011-04-01 00:00:00	2011-06-02 00:00:00	\N	0.00	458595	\N	3
458551	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458561	\N	0
458552	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458561	\N	1
458553	4	subtarea	\N	2011-04-01 00:00:00	2011-04-20 00:00:00	\N	0.00	458561	\N	2
458554	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458561	\N	3
458555	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458561	\N	4
458556	4	subtarea	\N	2011-04-20 00:00:00	2011-05-07 00:00:00	\N	0.00	458561	\N	5
458595	4	bloque coruña	\N	2011-04-01 00:00:00	2011-07-06 00:00:00	\N	0.00	458664	\N	0
458570	4	subtarea	\N	2011-06-16 00:00:00	2011-06-25 00:00:00	\N	0.00	458572	\N	8
458571	4	subtarea	\N	2011-06-25 00:00:00	2011-07-06 00:00:00	\N	0.00	458572	\N	9
458583	4	10 tareas máquina type 1	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458595	\N	5
458573	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	0
458574	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	1
458575	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	2
458576	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	3
458577	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	4
458578	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	5
458579	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	6
458580	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	7
458581	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	8
458582	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458583	\N	9
458594	4	10 tareas máquina type 2	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458595	\N	6
458584	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	0
458585	4	subtarea	\N	2011-04-01 00:00:00	2011-04-13 12:00:00	\N	0.00	458594	\N	1
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
361882
458550
458561
458572
458583
458594
458595
458607
458618
458629
458640
458651
458662
458663
458664
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
361871	1	450961
361872	1	448592
361873	1	448593
361874	1	448594
361875	1	448595
361876	1	448596
361877	1	448597
361878	1	448598
361879	1	448599
361880	1	448600
361881	1	448601
361882	1	448591
458540	1	448603
458541	1	448604
458542	1	448605
458543	1	448606
458544	1	448607
458545	1	448608
458546	1	448609
458547	1	448610
458548	1	448611
458549	1	448612
458550	1	448602
458551	1	448614
458552	1	448615
458553	1	448616
458554	1	448617
458555	1	448618
458556	1	448619
458557	1	448620
458558	1	448621
458559	1	448622
458560	1	448623
458561	1	448613
458562	1	448625
458563	1	448626
458564	1	448627
458565	1	448628
458566	1	448629
458567	1	448630
458568	1	448631
458569	1	448632
458570	1	448633
458571	1	448634
458572	1	448624
458573	1	449822
458574	1	449823
458575	1	449824
458576	1	449825
458577	1	449826
458578	1	449827
458579	1	449828
458580	1	449829
458581	1	449830
458582	1	449831
458583	1	449821
458584	1	449833
458585	1	449834
458586	1	449835
458587	1	449836
458588	1	449837
458589	1	449838
458590	1	449839
458591	1	449840
458592	1	449841
458593	1	449842
458594	1	449832
458595	1	448590
458596	1	450963
458597	1	451470
458598	1	451471
458599	1	451472
458600	1	451473
458601	1	451474
458602	1	451475
458603	1	451476
458604	1	451477
458605	1	451478
458606	1	451479
458607	1	450964
458608	1	456480
458609	1	456481
458610	1	456482
458611	1	456483
458612	1	456484
458613	1	456485
458614	1	456486
458615	1	456487
458616	1	456488
458617	1	456489
458618	1	456479
458619	1	456491
458620	1	456492
458621	1	456493
458622	1	456494
458623	1	456495
458624	1	456496
458625	1	456497
458626	1	456498
458627	1	456499
458628	1	456500
458629	1	456490
458630	1	456502
458631	1	456503
458632	1	456504
458633	1	456505
458634	1	456506
458635	1	456507
458636	1	456508
458637	1	456509
458638	1	456510
458639	1	456511
458640	1	456501
458641	1	456513
458642	1	456514
458643	1	456515
458644	1	456516
458645	1	456517
458646	1	456518
458647	1	456519
458648	1	457025
458649	1	457026
458650	1	457027
458651	1	456512
458652	1	457029
458653	1	457030
458654	1	457031
458655	1	457032
458656	1	457033
458657	1	457034
458658	1	457035
458659	1	457036
458660	1	457037
458661	1	457038
458662	1	457028
458663	1	450962
458664	1	448589
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
1212	1	ordinaria	9788e5d7-f09b-4d9e-a899-3424cd87c61b	10.00	t	t
1213	1	extra	127c91d7-4c88-49b7-8964-c07bd4ae5e73	15.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
303	1	74e270ce-6726-499c-9246-74d69199a5d9	units	f
304	1	2e32f5d2-9825-45b8-a938-b497ea9059e6	kg	f
305	1	3d20afc2-c98b-40c5-bd30-46fbfb72d5c9	km	f
306	1	21c95559-268e-418e-9a5a-1a99dc88bda7	l	f
307	1	33b3f555-08bf-455a-a674-7fdc18e28d63	m	f
308	1	d1c68031-ae71-4c5a-8ea7-33f90c9a75b2	m2	f
309	1	15b80125-7d86-4cfd-8e7a-f8afcbccd3bd	m3	f
310	1	3a10ea04-42ee-452f-b7ba-b7c61d15d806	tn	f
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
1112	ROLE_EDIT_ALL_ORDERS
1112	ROLE_ADMINISTRATION
1112	ROLE_CREATE_ORDER
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
1627	Soldador	Pontevedrés 1	721456271
2728	Pintor	Coruñés 2	pincor2
2727	Pintor	Coruñés 1	pincor1
2729	Pintor	Coruñés 3	pincor3
2730	Pintor	Coruñés 4	pincor4
2731	Soldador	Coruñés 1	solcor1
2732	Soldador	Coruñés 2	solcor2
2733	Soldador	Coruñés 3	solcor3
2734	Soldador	Coruñés 4	solcor4
1617	Capataz	Pontevedrés 1	12341234
2020	Capataz	Pontevedrés 2	cappon2
2029	Capataz	Coruñés 2	capcor2
2025	Escultor	Coruñés 1	esccor1
2026	Escultor	Coruñés 2	esccor2
2027	Escultor	Coruñés 3	esccor3
2028	Escultor	Coruñés 4	esccor4
1629	Soldador	Pontevedrés 2	8123046
1631	Soldador	Pontevedrés 3	61272828
1633	Soldador	Pontevedrés 4	167182899
1619	Pintor	Pontevedrés 1	1234651345
1621	Pintor	Pontevedrés 2	62345154
1623	Pintor	Pontevedrés 3	123415
1625	Pintor	Pontevedrés 4	123451261
2021	Escultor	Pontevedrés 1	escpon1
2022	Escultor	Pontevedrés 2	escpon2
2023	Escultor	Pontevedrés 3	escpon3
2024	Escultor	Pontevedrés 4	escpon4
299987	Decorador	Coruñés 1	deccor1
299989	Decorador	Coruñés 2	deccor2
299991	Decorador	Pontevedrés 1	decpon1
299993	Decorador	Pontevedrés 2	decpon2
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
-- Name: idx_advanceassigmenttemplate_on_template; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_advanceassigmenttemplate_on_template ON advanceassignmenttemplate USING btree (order_element_template_id);


--
-- Name: idx_calculatedconsolidatedvalue_on_calculatedconsolidation; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calculatedconsolidatedvalue_on_calculatedconsolidation ON consolidatedvalue USING btree (consolidation_id);


--
-- Name: idx_calendardata_on_basecalendar; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calendardata_on_basecalendar ON calendardata USING btree (base_calendar_id);


--
-- Name: idx_calendarexception_on_basecalendar; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_calendarexception_on_basecalendar ON calendarexception USING btree (base_calendar_id);


--
-- Name: idx_criterion_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterion_on_parent ON criterion USING btree (parent);


--
-- Name: idx_criterionrequirement_on_hoursgroup; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionrequirement_on_hoursgroup ON criterionrequirement USING btree (hours_group_id);


--
-- Name: idx_criterionrequirement_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionrequirement_on_orderelement ON criterionrequirement USING btree (order_element_id);


--
-- Name: idx_criterionsatisfaction_on_resource; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_criterionsatisfaction_on_resource ON criterionsatisfaction USING btree (resource);


--
-- Name: idx_dependency_on_taskelement_origin; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_dependency_on_taskelement_origin ON dependency USING btree (origin);


--
-- Name: idx_directadvanceassigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_directadvanceassigment_on_orderelement ON directadvanceassignment USING btree (direct_order_element_id);


--
-- Name: idx_hourcost_on_category; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hourcost_on_category ON hour_cost USING btree (cost_category_id);


--
-- Name: idx_hoursgroup_on_orderlinetemplate; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hoursgroup_on_orderlinetemplate ON hoursgroup USING btree (order_line_template);


--
-- Name: idx_hoursgroup_on_parentorderline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_hoursgroup_on_parentorderline ON hoursgroup USING btree (parent_order_line);


--
-- Name: idx_indirectadvanceassigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_indirectadvanceassigment_on_orderelement ON indirectadvanceassignment USING btree (indirect_order_element_id);


--
-- Name: idx_label_on_labeltype; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_label_on_labeltype ON label USING btree (label_type_id);


--
-- Name: idx_material_assigment_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_material_assigment_on_orderelement ON material_assigment USING btree (order_element_id);


--
-- Name: idx_material_on_category; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_material_on_category ON material USING btree (category_id);


--
-- Name: idx_materialassigmenttemplate_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_materialassigmenttemplate_on_orderelement ON material_assigment_template USING btree (order_element_template_id);


--
-- Name: idx_materialcategory_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_materialcategory_on_parent ON material_category USING btree (parent_id);


--
-- Name: idx_noncalculatedconsolidatedvalue_on_noncalculatedconsolidatio; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_noncalculatedconsolidatedvalue_on_noncalculatedconsolidatio ON consolidatedvalue USING btree (consolidation_id);


--
-- Name: idx_orderelement_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_parent ON orderelement USING btree (parent);


--
-- Name: idx_orderelement_on_template; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_template ON orderelement USING btree (template);


--
-- Name: idx_orderelement_on_workreport; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_workreport ON work_report USING btree (order_element_id);


--
-- Name: idx_orderelement_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelement_on_workreportline ON work_report_line USING btree (order_element_id);


--
-- Name: idx_orderelementtemplate_on_parent; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_orderelementtemplate_on_parent ON orderelementtemplate USING btree (parent);


--
-- Name: idx_profile_on_profileroles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_profile_on_profileroles ON profile_roles USING btree (profileid);


--
-- Name: idx_qualityform_on_qualityformitems; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_qualityform_on_qualityformitems ON quality_form_items USING btree (quality_form_id);


--
-- Name: idx_queuedependency_on_destinyqueue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_queuedependency_on_destinyqueue ON limiting_resource_queue_dependency USING btree (destiny_queue_element_id);


--
-- Name: idx_queuedependency_on_originqueue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_queuedependency_on_originqueue ON limiting_resource_queue_dependency USING btree (origin_queue_element_id);


--
-- Name: idx_resource_on_workreport; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resource_on_workreport ON work_report USING btree (resource_id);


--
-- Name: idx_resource_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resource_on_workreportline ON work_report_line USING btree (resource_id);


--
-- Name: idx_resourceallocation_on_task; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourceallocation_on_task ON resourceallocation USING btree (task);


--
-- Name: idx_resourcecostcategoryassigment_on_resource; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourcecostcategoryassigment_on_resource ON resources_cost_category_assignment USING btree (resource_id);


--
-- Name: idx_resourcequeueelement_on_resourcequeue; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_resourcequeueelement_on_resourcequeue ON limiting_resource_queue_element USING btree (limiting_resource_queue_id);


--
-- Name: idx_taskelement_on_taskgroup; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskelement_on_taskgroup ON taskelement USING btree (parent);


--
-- Name: idx_taskqualityform_on_orderelement; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskqualityform_on_orderelement ON task_quality_form USING btree (order_element_id);


--
-- Name: idx_taskqualityform_on_taskqualityformitems; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_taskqualityform_on_taskqualityformitems ON task_quality_form_items USING btree (task_quality_form_id);


--
-- Name: idx_typeofworkhours_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_typeofworkhours_on_workreportline ON work_report_line USING btree (type_work_hours_id);


--
-- Name: idx_user_on_userprofiles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_user_on_userprofiles ON user_profiles USING btree (user_id);


--
-- Name: idx_user_on_userroles; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_user_on_userroles ON user_roles USING btree (userid);


--
-- Name: idx_workreport_on_workreportline; Type: INDEX; Schema: public; Owner: naval; Tablespace: 
--

CREATE INDEX idx_workreport_on_workreportline ON work_report_line USING btree (work_report_id);


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

