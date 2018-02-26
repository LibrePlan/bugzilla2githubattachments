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
    expandresourceloadviewcharts boolean
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
    specific_resource_allocation_id bigint,
    generic_resource_allocation_id bigint,
    derived_allocation_id bigint
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
    type integer,
    queue_dependency bigint
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
    disabled boolean
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
    schedulingstatetype integer,
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
-- Name: pending_consolidated_hours; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE pending_consolidated_hours (
    pending_hours_id bigint NOT NULL,
    pendingconsolidatedhours integer,
    resource_allocation_id bigint
);


ALTER TABLE public.pending_consolidated_hours OWNER TO naval;

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
2496783	4	f	910
2496784	4	t	912
2496785	4	f	910
1925	6	t	909
2496786	4	t	912
2496787	4	t	912
2496740	5	t	909
2494921	2	t	910
2496788	4	f	910
2494922	2	t	910
2494923	2	f	910
2494924	2	t	910
2496789	4	f	912
2496739	4	t	909
2496791	3	f	912
2496790	3	f	910
2496736	3	t	910
2496737	3	t	910
2496738	3	t	910
13552	3	t	909
13553	3	t	909
13554	3	t	909
2494909	2	t	910
2494910	2	f	910
2494911	2	f	910
13547	9	t	910
2494902	7	t	910
2496797	4	t	3480461
2496798	4	f	3480461
13541	11	t	909
13548	9	f	910
2496792	1	t	912
2496793	1	f	912
2496794	1	f	912
49998	25	t	909
49999	25	t	909
50003	21	t	909
50005	18	t	909
3504297	2	t	910
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
2494802	8	2010-05-13	100.00	13547	\N
15658	9	2010-05-07	20.00	13547	\N
2494811	6	2010-05-13	50.00	2494902	\N
2494803	7	2010-05-11	25.00	2494902	\N
2496857	4	2010-05-17	20.00	2496797	\N
3504399	2	2010-05-17	40.00	3504297	\N
3504400	2	2010-05-11	20.00	3504297	\N
2494814	2	2010-05-13	25.00	2494909	\N
2494818	2	2010-05-13	30.00	2494921	\N
2494819	2	2010-05-13	30.00	2494922	\N
2496830	3	2010-05-14	100.00	2496736	\N
2496831	3	2010-05-13	25.00	2496737	\N
2496855	1	2010-05-14	38.32	2496792	\N
2496850	3	2010-05-14	60.00	2496783	\N
2496851	4	2010-05-14	50.00	2496784	2010-05-14 15:55:36.437
2496852	3	2010-05-14	50.00	2496785	\N
2496853	4	2010-05-14	40.00	2496786	2010-05-14 15:55:36.437
2496854	4	2010-05-14	25.00	2496787	2010-05-14 15:55:36.437
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
909	4	children	100.0000	f	0.0100	t	t	f
910	3	percentage	100.0000	f	0.0100	t	t	f
911	2	units	2147483647.0000	f	1.0000	t	f	f
912	1	subcontractor	100.0000	f	0.0100	t	t	f
913	1	Importe	10000000.0000	t	0.1000	t	f	f
914	1	Importe (pactado)	10000000.0000	t	1.0000	t	f	f
915	1	Toneladas	1000.0000	t	0.1000	t	f	f
3480460	1	Porcentage (pactado)	100.0000	t	0.1000	t	f	f
3480461	1	QF: Cuestionario calidade estandar	100.0000	f	0.0100	t	t	t
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
2679	108
2680	108
2681	108
2717	108
2718	124
2719	126
2720	108
2721	124
14142	124
14143	124
14146	124
14147	110
14148	124
14149	124
14150	110
14151	124
24071	108
24072	108
24074	108
27674	124
27675	105
39509	124
39510	109
39511	110
39518	108
39519	124
39520	108
57178	49793
57179	49798
57180	49797
2379862	49795
2494207	126
2494210	124
2494211	108
2494212	124
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
16363	4
3467028	3
3467029	3
3467030	3
3467032	4
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, code, name) FROM stdin;
39087	1	81f8e742-8d12-4398-8fef-bc4be2cb0fa8	\N
39088	1	4486b746-229d-40bf-9389-3ad35ff0ab27	\N
404	6	0f51e60f-a149-4cfb-a29b-40f78bed683a	España
405	1	0cf16562-abf4-4f73-8988-ebe39f5b9006	Galicia
406	1	bb51856c-5d7d-43e8-884e-efdaa031265a	Ferrol
407	1	7391bb01-4a5c-4b92-89d0-b58e1bb0d2f1	Vigo
408	1	c8386ce2-dc7c-4584-b5ca-93d4bd461a0f	Maquinas 16h
409	1	d168e5c8-8c12-4c35-bd80-02cfb76e4ce8	Máquinas 24h
410	1	3778986f-6fe9-4d49-ac41-7961ffc32476	\N
411	1	af089a6c-5b21-499a-925e-03c546be7889	\N
412	1	986e6a4e-3fae-490c-b3b1-e9f28839b591	\N
413	1	3bf70e91-d50b-4303-a5d4-513a68f18a65	\N
414	1	517148c4-06bd-41f2-911f-53ada393a02b	\N
39090	1	f9d25679-30f6-41f3-8589-868c58949a47	\N
417	30	c4d6b245-ac35-4559-8d63-49886b3052a9	\N
39092	1	c153c0c2-72df-4a33-9083-f673667fce8f	\N
39093	1	39f71b61-c0c4-4d30-907c-e3c087a5cc26	\N
423	1	94161015-6159-4ff3-a383-75528fcaebd0	\N
422	2	5dbb608d-da47-4026-a618-e9cb6f5a8dbe	\N
39094	1	27af426b-e05b-47a5-a8e2-9cc2968d10fa	\N
39095	2	7d58a4df-359e-4b4d-89f7-50657c4425a1	\N
421	2	4d061406-6370-4523-9c06-295e6a1ab587	\N
39096	1	5ccab13f-76b3-4151-a29a-6973d4f1a26d	\N
39097	1	d257d90c-cacc-4bba-8a45-8da072c07f83	\N
39098	1	3fd2ffd5-43e8-490d-9442-49bb84539ad0	\N
39099	1	cff43092-e2f4-47a6-9c54-a125b9ae4bd0	\N
14443	2	bb97e91d-19e4-482a-843d-363fe819b48e	\N
14444	3	9128f4c3-09f3-4d97-8526-3a7f0ffa6c09	\N
418	17	3fa62c2c-6f9e-4709-8d84-de168c0e6c8f	\N
39101	1	42bffd02-29b3-4130-b117-00359ed41d61	\N
39102	1	3d19ee0a-9031-4208-88e6-771f5c2fb7b0	\N
39103	1	9d012906-81dd-49a9-b18d-64cd79c4d1c9	\N
39091	2	39ba8411-0f68-4356-be49-73da7869d776	\N
39089	2	21e87161-9fd1-4a14-9121-af1f9d41e20a	\N
39100	2	2520ae0d-1a72-458e-a6eb-56999890dda7	\N
419	17	471ffbf4-e05b-4119-975a-74ab182055d0	\N
420	23	70c34204-582f-44f5-bf82-ecbae1344ea8	\N
416	37	eae1d12f-5fed-4ae3-8fcd-cf21a507e6b5	\N
415	36	cb406ea7-9b36-4dff-924b-c6a5b80a4f61	\N
26563	2	0f35407b-d046-47e1-b2d3-89bfe07b3a1f	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
39297	2	2010-05-12	\N	39095	0
1616	1	2010-05-04	\N	410	0
1617	1	2010-05-04	\N	411	0
1618	1	2010-05-04	\N	412	0
39298	1	2010-05-12	\N	39096	0
1619	1	2010-05-04	\N	413	0
1620	1	2010-05-04	\N	414	0
39299	1	2010-05-12	\N	39097	0
39300	1	2010-05-12	\N	39098	0
39301	1	2010-05-12	\N	39099	0
39303	1	2010-05-12	\N	39101	0
39304	1	2010-05-12	\N	39102	0
1629	1	2010-05-04	\N	423	0
1628	2	2010-05-04	\N	422	0
39305	1	2010-05-12	\N	39103	0
39293	2	2010-05-12	\N	39091	0
39291	2	2010-05-12	\N	39089	0
1627	2	2010-05-04	\N	421	0
39302	2	2010-05-12	\N	39100	0
1623	30	2010-05-04	\N	417	0
1624	17	2010-05-04	\N	418	0
1625	17	2010-05-04	\N	419	0
1626	23	2010-05-04	\N	420	0
1622	37	2010-05-04	\N	416	0
1621	36	2010-05-04	\N	415	0
14645	2	2010-05-06	\N	14443	0
14646	3	2010-05-06	\N	14444	0
26765	2	2010-05-12	\N	26563	0
39289	1	2010-05-12	\N	39087	0
39290	1	2010-05-12	\N	39088	0
39292	1	2010-05-12	\N	39090	0
39294	1	2010-05-12	\N	39092	0
39295	1	2010-05-12	\N	39093	0
39296	1	2010-05-12	\N	39094	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, code, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
39193	1	efb43d11-ee0e-4964-8635-b10a983241c3	404	\N	39092	0
39194	1	d2d15e77-183b-4726-977c-b166aad31c35	404	\N	39093	0
505	6	c3862494-9d88-41b3-8ec7-ad1a05bd538b	\N	\N	404	0
506	1	55e4d7e1-fed7-45d1-9f02-8440a4502c02	404	\N	405	0
507	1	10a25ba1-109f-4ac1-a4b7-79d0269764e9	405	\N	406	0
39195	1	fa59c42a-882b-44f7-9801-4d0694915445	404	\N	39094	0
508	1	35ddb31b-2ae2-477d-a409-6288db1a6920	405	\N	407	0
509	1	8c548019-8af4-41b4-8a32-2cb5e23b34de	\N	\N	408	0
510	1	5c6853f2-8763-4935-91cc-397d68803a2f	\N	\N	409	0
511	1	d8d7ea87-4281-4734-afbb-3377b7e8d0a0	408	\N	410	0
39196	2	50d847ec-a79b-406e-9a79-c3033dbe650b	404	\N	39095	0
512	1	9baf6727-7875-4653-86ad-a80fd099be74	404	\N	411	0
14544	2	a3438a7e-e378-48af-9259-de6679a522ad	404	\N	14443	0
513	1	bcf82fa5-f8d7-4003-975f-ee50eedf6a84	407	\N	412	0
14545	3	47406021-c283-4241-81a5-11d2947aca0b	404	\N	14444	0
514	1	7ce3b321-eae1-46cf-a2d3-cbb627edc4c6	404	\N	413	0
518	30	2eab6f15-85e3-4638-9122-e0b9274a130a	407	\N	417	0
515	1	78355e4b-cdb8-420e-ab6b-1a6941f568ca	404	\N	414	0
39197	1	d177636b-b5dc-45c5-9d60-d8806aef3ca8	404	\N	39096	0
39198	1	d6c39db9-0df1-4ffe-a3b0-0fc4f2946f3c	404	\N	39097	0
519	17	b9bc7bc5-3d9d-4ae1-a637-2ac667fb3aec	407	\N	418	0
39199	1	490cded6-9269-4da8-84bc-bae8a628cb7b	404	\N	39098	0
520	17	d63564e3-835a-456f-8b71-6070b3e1f9fa	407	\N	419	0
521	23	b571dca1-4ae9-4852-8fef-8244128df644	407	\N	420	0
517	37	aa9bddff-807a-4a7d-aa31-ba3813089b70	406	\N	416	0
524	1	b9b3855e-5385-4aa3-8d0c-aaac37b9948e	407	\N	423	0
523	2	4419229e-9c87-4029-a8a3-3d29a7b13501	407	\N	422	0
39200	1	560e5691-e00c-4959-bdb1-233711d87d18	404	\N	39099	0
26664	2	d467c5c2-839a-438c-92da-8138b182530a	404	\N	26563	0
516	36	bbdc1fac-3f47-4301-89b4-645fc8bfaf66	406	\N	415	0
522	2	3e80454c-8bab-4d9d-8ef0-340946ac45df	407	\N	421	0
39202	1	859526cd-e38d-4dba-b404-0973390382c1	404	\N	39101	0
39188	1	2b6bda6a-abf3-4f6a-96d2-d2b78fd8c78d	404	\N	39087	0
39189	1	aceb7add-27df-4404-b279-f63df6ef6bf2	404	\N	39088	0
39203	1	ef74fb45-9bcd-416d-9f4a-e1a855f25562	404	\N	39102	0
39191	1	f0148e5a-99cf-4ea7-a525-b2af47eeb54b	404	\N	39090	0
39204	1	30389927-6cbe-4326-9e3a-860f537ed58e	404	\N	39103	0
39192	2	ee00feeb-4930-40d3-bafd-36d81ba65e66	404	\N	39091	0
39190	2	26701598-4701-4f25-ab11-d78faf6c95d0	404	\N	39089	0
39201	2	e1416b54-afe5-4e9b-b829-8bc60782992c	404	\N	39100	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, code, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1212	1	8e045b85-1927-4bd7-ba47-3f49634d9f7d	2011-10-12	0	812	404
1213	1	0915b0f0-0488-4cf8-a1cc-17f2e31c9079	2011-12-06	0	812	404
1214	1	560b0126-ccf6-4b21-abc9-5ad06a92efb5	2010-12-06	0	812	404
1215	1	b82c80db-8a63-4c49-85c6-095dd655b46c	2011-01-06	0	812	404
1216	1	3ee65f0d-11bc-4b34-9c4d-93d8827d4d9f	2010-12-08	0	812	404
1217	1	c34e59e9-5aaf-4cdf-957e-4f743ba1dee8	2010-10-12	0	812	404
1218	1	36caa81f-b24c-4980-841a-89b16a298b84	2011-12-08	0	812	404
1219	1	a470c48c-a20c-4d7c-8646-341c93e317c0	2010-11-01	0	812	405
1220	1	269da39a-4414-4bb7-ba62-b66d2a21b0c2	2010-05-17	0	812	405
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, code, name, color, notassignable) FROM stdin;
808	6	HOLIDAY	HOLIDAY	red	t
809	5	SICK_LEAVE	SICK_LEAVE	red	t
810	4	LEAVE	LEAVE	red	t
811	3	STRIKE	STRIKE	red	t
812	2	BANK_HOLIDAY	BANK_HOLIDAY	red	t
813	1	WORKABLE_BANK_HOLIDAY	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources, generatecodefortypesofworkhours, generatecodeformaterialcategories, generatecodeforunittypes, expandcompanyplanningviewcharts, expandorderplanningviewcharts, expandresourceloadviewcharts) FROM stdin;
606	6	404	B15804842	t	t	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: consolidatedvalue; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidatedvalue (id, consolidated_value_type, version, date, value, consolidation_id, advance_measurement_id) FROM stdin;
16262	NonCalculated	0	2010-05-07	20.00	13946	15658
\.


--
-- Data for Name: consolidation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY consolidation (id, consolidation_type, version, dir_advance_assignment_id, ind_advance_assignment_id) FROM stdin;
13946	NonCalculated	9	13547	\N
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, code, name, enabled) FROM stdin;
3480561	1	dddd6ecc-59b1-4292-bb92-5a8e753e7a7a	Oficial	t
3480562	1	35b25191-ec87-4e5e-b434-43f2f1b3209a	Peón	t
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
116	1	0589ee32-1be9-4261-8a8d-d8caaadf7252	A coruña	t	6	\N
117	1	a8030202-3421-4df5-9acb-9838a0c676fc	Vigo	t	6	\N
118	1	c89ce2c3-9061-4e88-a595-4492aa4704f3	Ferrol	t	6	\N
119	1	0527bba3-7c90-47c6-a029-2daf5d70359c	Rianxo	t	6	\N
120	1	034c910a-8159-4b85-bc58-d7a579923dcf	Cangas	t	6	\N
121	1	4585523a-d231-43fa-b251-5d29f95ee731	Ourense	t	6	\N
122	1	89dc0e70-e6e9-4726-b8e8-9cff01ca07b7	Sanxenxo	t	6	\N
123	1	f1bdaf91-8ba6-4958-abfe-bce67de3ec67	Pontevedra	t	6	\N
102	14	723726cd-fe06-4bdb-84a3-10a9538efca1	Baja por paternidad	t	1	\N
101	15	5470669e-eaff-4b1c-8e09-03e7625c9b7d	Baja por enfermedad	t	1	\N
124	1	529f27df-62e2-4311-885f-f888fc6148b6	Peón	t	2	\N
125	1	d4c08c6f-400d-42b3-9851-a3c68b48d7a8	Oficial de 3º	t	2	\N
126	1	54705705-c3ae-4380-b63b-19feb11e1811	Oficial de 1º	t	2	\N
127	1	557db93c-b856-4837-8b61-bbe322d96373	Ingeniero	t	2	\N
128	1	f6ea2e88-6950-45af-a868-6d003496460d	Oficlal de 2º	t	2	\N
129	1	33628d77-98ee-4664-bdc8-5166f96eb1fb	Torno	t	7	\N
130	1	46c2aaf5-654d-479c-98ce-6cf57a828ab5	Torno 8	t	7	\N
131	1	f5cdf3f7-43bb-4799-81bf-a2e19b820272	Torno 16	t	7	\N
132	1	8695759f-057e-4889-a2cf-89685048ba0b	Plegadora	t	7	\N
133	1	8ae84af1-2620-4ef2-a033-768d16bae913	Grúa	t	7	\N
110	2	8d895bef-5bf1-457a-b2f2-48d103295581	Pintor	t	4	\N
103	5	2563e713-5acf-4169-a8ff-9c49d4066f49	ContratadoFijo	t	5	\N
111	1	49ab6dae-49eb-4f3c-af13-8fae48de9d1d	ContratadoPorObra	t	5	\N
104	4	857ffe46-6ebc-4d42-97e5-d9d50091220a	Despedido	t	5	\N
112	1	c406d21e-ea23-4302-9506-6fad12820605	ContratadoTemporal	t	5	\N
113	1	977a6d69-8c7d-4952-83a8-76fe3e2a524b	Curso de riesgos laborales	t	3	\N
114	1	5de1beac-9a54-43f3-b2e4-1aaaf0dcaec5	Certificación de operador de grúa	t	3	\N
115	1	8f238d1f-6e47-4c35-8ed7-c7dcc05fcc4c	Curso básico de soldado	t	3	\N
106	2	5ba997e0-125c-4913-9077-eb5a2924be55	Tornero	t	4	\N
134	1	931a4622-a143-4596-b24c-9163d6d8862b	Lijador	t	4	\N
108	2	d8ce7296-fc52-4090-9da5-d57d51a95ec0	Soldador	t	4	\N
107	2	cfd531f4-d950-455b-8cd8-cb297c83b21a	Calderero	t	4	\N
105	2	61482488-cf45-4bc0-aaf6-693b4b928493	Andamiero	t	4	\N
109	2	9cc5241f-4453-4590-8539-b1aee394904e	Gruísta	t	4	\N
49794	2	4166cc7f-7d23-4b63-80c4-1c3b72d938ae	Administrador sistemas	t	16121856	\N
49798	1	e1977ded-2a09-42c6-b581-fcf5d18221c8	Coordinador técnico	t	16121856	\N
49795	2	b84f39df-2447-4a2d-8a91-fa85a7b9d634	Consultor	t	16121856	\N
49793	2	d5749edc-7d32-42f4-b9c3-cf350360eda3	Coordinador	t	16121856	\N
49797	2	2f527c19-3e07-425a-b877-8b79dd98ce25	Analista	t	16121856	\N
49796	2	0931ea80-0d35-44d2-9aee-62a16f0434ea	Analista / Desarrollador	t	16121856	\N
13231	14	e610ce21-fb24-43d1-9ee9-385488e37b83	medicalLeave	t	4259840	\N
13232	13	bab312d2-c500-4e4c-9435-8256639004cf	paternityLeave	t	4259840	\N
13233	4	0c410a45-04ef-4af2-b08c-1415e40e0424	hiredResourceWorkingRelationship	t	4259844	\N
13234	3	61164200-d6b6-42a2-88b5-e27aeccea904	firedResourceWorkingRelationship	t	4259844	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
14985	DIRECT	11	\N	13465	\N	124	\N	\N
14986	INDIRECT	11	13776	\N	\N	124	14985	t
14987	DIRECT	11	\N	13466	\N	124	\N	\N
14988	INDIRECT	11	13777	\N	\N	124	14987	t
14989	DIRECT	11	\N	13467	\N	110	\N	\N
14990	INDIRECT	11	13778	\N	\N	110	14989	t
14991	DIRECT	11	\N	13468	\N	124	\N	\N
13895	DIRECT	7	\N	13435	\N	124	\N	\N
13896	INDIRECT	7	13736	\N	\N	124	13895	t
13897	DIRECT	7	\N	13436	\N	124	\N	\N
13898	INDIRECT	7	13737	\N	\N	124	13897	t
13899	DIRECT	7	\N	13437	\N	110	\N	\N
13900	INDIRECT	7	13738	\N	\N	110	13899	t
13901	DIRECT	7	\N	13438	\N	124	\N	\N
13902	INDIRECT	7	13739	\N	\N	124	13901	t
14992	INDIRECT	11	13779	\N	\N	124	14991	t
16574	DIRECT	1	\N	\N	14907	108	\N	\N
16575	INDIRECT	1	\N	\N	14908	108	16574	t
16576	INDIRECT	1	13810	\N	\N	108	16574	t
13927	DIRECT	1	\N	\N	14863	124	\N	\N
13928	INDIRECT	1	13752	\N	\N	124	13927	t
13929	DIRECT	1	\N	\N	14864	124	\N	\N
13930	INDIRECT	1	13753	\N	\N	124	13929	t
13931	DIRECT	1	\N	\N	14865	110	\N	\N
13932	INDIRECT	1	13754	\N	\N	110	13931	t
13933	DIRECT	1	\N	\N	14866	124	\N	\N
13934	INDIRECT	1	13755	\N	\N	124	13933	t
16577	INDIRECT	1	\N	\N	14909	108	16574	t
16578	INDIRECT	1	13811	\N	\N	108	16574	t
16579	INDIRECT	1	\N	\N	14910	108	16574	t
16580	INDIRECT	1	13812	\N	\N	108	16574	t
16581	DIRECT	1	\N	\N	14911	108	\N	\N
16582	INDIRECT	1	13813	\N	\N	108	16581	t
16583	DIRECT	1	\N	\N	14912	108	\N	\N
2303	INDIRECT	5	2034	\N	\N	108	2297	t
16584	INDIRECT	1	13814	\N	\N	108	16583	t
16585	DIRECT	1	\N	\N	14913	124	\N	\N
16586	INDIRECT	1	13815	\N	\N	124	16585	t
16587	DIRECT	1	\N	\N	14914	124	\N	\N
16588	INDIRECT	1	13816	\N	\N	124	16587	t
16589	DIRECT	1	\N	\N	14915	134	\N	\N
16590	INDIRECT	1	\N	\N	14916	134	16589	t
16591	INDIRECT	1	13817	\N	\N	134	16589	t
2297	DIRECT	5	\N	1837	\N	108	\N	\N
2298	INDIRECT	5	\N	1838	\N	108	2297	t
2299	INDIRECT	5	2032	\N	\N	108	2297	t
2300	INDIRECT	5	\N	1839	\N	108	2297	t
2301	INDIRECT	5	2033	\N	\N	108	2297	t
2302	INDIRECT	5	\N	1840	\N	108	2297	t
2304	DIRECT	5	\N	1841	\N	108	\N	\N
2305	INDIRECT	5	2035	\N	\N	108	2304	t
2306	DIRECT	5	\N	1842	\N	108	\N	\N
2307	INDIRECT	5	2036	\N	\N	108	2306	t
2382	DIRECT	4	\N	1843	\N	124	\N	\N
2383	INDIRECT	4	2037	\N	\N	124	2382	t
2384	DIRECT	4	\N	1844	\N	124	\N	\N
2385	INDIRECT	4	2038	\N	\N	124	2384	t
2386	DIRECT	4	\N	1845	\N	134	\N	\N
2387	INDIRECT	4	\N	1846	\N	134	2386	t
2388	INDIRECT	4	2039	\N	\N	134	2386	t
2389	INDIRECT	4	\N	1847	\N	134	2386	t
2390	INDIRECT	4	2040	\N	\N	134	2386	t
2391	DIRECT	4	\N	1848	\N	126	\N	\N
2392	INDIRECT	4	2041	\N	\N	126	2391	t
16592	INDIRECT	1	\N	\N	14917	134	16589	t
16593	INDIRECT	1	13818	\N	\N	134	16589	t
16594	DIRECT	1	\N	\N	14918	126	\N	\N
16595	INDIRECT	1	13819	\N	\N	126	16594	t
27474	DIRECT	6	27279	\N	\N	105	\N	\N
27475	DIRECT	6	27270	\N	\N	124	\N	\N
27481	DIRECT	5	27271	\N	\N	109	\N	\N
27479	DIRECT	5	27282	\N	\N	110	\N	\N
27480	DIRECT	5	27283	\N	\N	124	\N	\N
47786	DIRECT	4	\N	26975	\N	108	\N	\N
47787	INDIRECT	4	27275	\N	\N	108	47786	t
47788	DIRECT	4	\N	26976	\N	108	\N	\N
47789	INDIRECT	4	27276	\N	\N	108	47788	t
47790	DIRECT	4	\N	26977	\N	124	\N	\N
47791	INDIRECT	4	27277	\N	\N	124	47790	t
54255	INDIRECT	11	50253	\N	\N	49796	54251	t
54256	INDIRECT	11	\N	49960	\N	49796	54251	t
54257	INDIRECT	11	50254	\N	\N	49796	54251	t
54258	INDIRECT	11	\N	49961	\N	49796	54251	t
54259	INDIRECT	11	50255	\N	\N	49796	54251	t
54250	INDIRECT	11	50247	\N	\N	49796	54191	t
54252	INDIRECT	11	\N	49902	\N	49796	54251	t
54253	INDIRECT	11	50202	\N	\N	49796	54251	t
54254	INDIRECT	11	\N	49959	\N	49796	54251	t
54260	INDIRECT	11	\N	49962	\N	49796	54251	t
54261	INDIRECT	11	50256	\N	\N	49796	54251	t
54262	INDIRECT	11	\N	49963	\N	49796	54251	t
54263	INDIRECT	11	50257	\N	\N	49796	54251	t
54264	INDIRECT	11	\N	49964	\N	49796	54251	t
54265	INDIRECT	11	50258	\N	\N	49796	54251	t
54266	INDIRECT	11	\N	49965	\N	49796	54251	t
54267	INDIRECT	11	50259	\N	\N	49796	54251	t
54268	DIRECT	11	\N	49966	\N	49796	\N	\N
54269	INDIRECT	11	50260	\N	\N	49796	54268	t
54270	DIRECT	11	\N	49967	\N	49796	\N	\N
54271	INDIRECT	11	\N	49968	\N	49796	54270	t
2394316	DIRECT	4	\N	2394116	\N	49796	\N	\N
2394317	INDIRECT	4	2394217	\N	\N	49796	2394316	t
2394318	DIRECT	4	\N	2394117	\N	49796	\N	\N
2394319	INDIRECT	4	2394218	\N	\N	49796	2394318	t
16618	DIRECT	3	\N	13483	\N	108	\N	\N
16619	INDIRECT	3	\N	13484	\N	108	16618	t
16620	INDIRECT	3	13830	\N	\N	108	16618	t
16621	INDIRECT	3	\N	13485	\N	108	16618	t
16622	INDIRECT	3	13831	\N	\N	108	16618	t
16623	INDIRECT	3	\N	13486	\N	108	16618	t
16624	INDIRECT	3	13832	\N	\N	108	16618	t
16625	DIRECT	3	\N	13487	\N	108	\N	\N
16626	INDIRECT	3	13833	\N	\N	108	16625	t
16627	DIRECT	3	\N	13488	\N	108	\N	\N
16628	INDIRECT	3	13834	\N	\N	108	16627	t
16629	DIRECT	3	\N	13489	\N	124	\N	\N
16630	INDIRECT	3	13835	\N	\N	124	16629	t
16631	DIRECT	3	\N	13490	\N	124	\N	\N
16632	INDIRECT	3	13836	\N	\N	124	16631	t
16633	DIRECT	3	\N	13491	\N	134	\N	\N
16634	INDIRECT	3	\N	13492	\N	134	16633	t
16635	INDIRECT	3	16665	\N	\N	134	16633	t
16636	INDIRECT	3	\N	13493	\N	134	16633	t
16637	INDIRECT	3	16666	\N	\N	134	16633	t
16638	DIRECT	3	\N	13494	\N	126	\N	\N
16639	INDIRECT	3	16667	\N	\N	126	16638	t
47794	DIRECT	12	50197	\N	\N	49798	\N	\N
47795	DIRECT	12	50274	\N	\N	49793	\N	\N
54152	DIRECT	11	\N	49908	\N	49795	\N	\N
54153	INDIRECT	11	50208	\N	\N	49795	54152	t
54154	DIRECT	11	\N	49909	\N	49797	\N	\N
54155	INDIRECT	11	50209	\N	\N	49797	54154	t
54156	DIRECT	11	\N	49910	\N	49796	\N	\N
54157	INDIRECT	11	\N	49911	\N	49796	54156	t
54158	INDIRECT	11	50210	\N	\N	49796	54156	t
54159	INDIRECT	11	\N	49898	\N	49796	54156	t
54160	INDIRECT	11	50199	\N	\N	49796	54156	t
54161	INDIRECT	11	\N	49912	\N	49796	54156	t
54162	INDIRECT	11	50211	\N	\N	49796	54156	t
54163	INDIRECT	11	\N	49913	\N	49796	54156	t
54164	INDIRECT	11	50212	\N	\N	49796	54156	t
54165	INDIRECT	11	\N	49914	\N	49796	54156	t
54166	INDIRECT	11	50213	\N	\N	49796	54156	t
54167	INDIRECT	11	\N	49915	\N	49796	54156	t
54168	INDIRECT	11	50214	\N	\N	49796	54156	t
54169	INDIRECT	11	\N	49916	\N	49796	54156	t
54170	INDIRECT	11	50215	\N	\N	49796	54156	t
54171	INDIRECT	11	\N	49917	\N	49796	54156	t
54172	INDIRECT	11	50216	\N	\N	49796	54156	t
54173	INDIRECT	11	\N	49918	\N	49796	54156	t
54174	INDIRECT	11	50217	\N	\N	49796	54156	t
54175	INDIRECT	11	\N	49919	\N	49796	54156	t
54176	INDIRECT	11	50218	\N	\N	49796	54156	t
54177	INDIRECT	11	\N	49920	\N	49796	54156	t
54178	INDIRECT	11	50219	\N	\N	49796	54156	t
54179	INDIRECT	11	\N	49921	\N	49796	54156	t
54180	INDIRECT	11	50220	\N	\N	49796	54156	t
54181	INDIRECT	11	\N	49922	\N	49796	54156	t
54182	INDIRECT	11	50221	\N	\N	49796	54156	t
54183	INDIRECT	11	\N	49923	\N	49796	54156	t
54184	INDIRECT	11	50222	\N	\N	49796	54156	t
54185	INDIRECT	11	\N	49924	\N	49796	54156	t
54186	INDIRECT	11	50223	\N	\N	49796	54156	t
54272	INDIRECT	11	50261	\N	\N	49796	54270	t
54273	INDIRECT	11	\N	49969	\N	49796	54270	t
54274	INDIRECT	11	50262	\N	\N	49796	54270	t
54275	INDIRECT	11	\N	49903	\N	49796	54270	t
54276	INDIRECT	11	50203	\N	\N	49796	54270	t
54277	INDIRECT	11	\N	49970	\N	49796	54270	t
54278	INDIRECT	11	50263	\N	\N	49796	54270	t
54279	INDIRECT	11	\N	49971	\N	49796	54270	t
54280	INDIRECT	11	50264	\N	\N	49796	54270	t
54281	INDIRECT	11	\N	49972	\N	49796	54270	t
54282	INDIRECT	11	50265	\N	\N	49796	54270	t
54283	INDIRECT	11	\N	49973	\N	49796	54270	t
54284	INDIRECT	11	50266	\N	\N	49796	54270	t
54285	INDIRECT	11	\N	49974	\N	49796	54270	t
54286	INDIRECT	11	50267	\N	\N	49796	54270	t
54287	INDIRECT	11	\N	49975	\N	49796	54270	t
54288	INDIRECT	11	50268	\N	\N	49796	54270	t
54289	DIRECT	11	\N	49904	\N	49796	\N	\N
54290	INDIRECT	11	50204	\N	\N	49796	54289	t
54291	DIRECT	11	\N	49905	\N	49796	\N	\N
54292	INDIRECT	11	50205	\N	\N	49796	54291	t
54293	DIRECT	11	\N	49906	\N	49796	\N	\N
54294	INDIRECT	11	50206	\N	\N	49796	54293	t
54295	DIRECT	11	\N	49907	\N	49796	\N	\N
54296	INDIRECT	11	50207	\N	\N	49796	54295	t
54297	DIRECT	11	\N	49976	\N	49796	\N	\N
54298	INDIRECT	11	50269	\N	\N	49796	54297	t
54187	INDIRECT	11	\N	49925	\N	49796	54156	t
54188	INDIRECT	11	50224	\N	\N	49796	54156	t
54189	INDIRECT	11	\N	49926	\N	49796	54156	t
54190	INDIRECT	11	50225	\N	\N	49796	54156	t
54191	DIRECT	11	\N	49927	\N	49796	\N	\N
54192	INDIRECT	11	\N	49928	\N	49796	54191	t
54193	INDIRECT	11	\N	49929	\N	49796	54191	t
54194	INDIRECT	11	50226	\N	\N	49796	54191	t
54195	INDIRECT	11	\N	49899	\N	49796	54191	t
54196	INDIRECT	11	50200	\N	\N	49796	54191	t
54197	INDIRECT	11	\N	49930	\N	49796	54191	t
54198	INDIRECT	11	50227	\N	\N	49796	54191	t
54199	INDIRECT	11	\N	49931	\N	49796	54191	t
54200	INDIRECT	11	50228	\N	\N	49796	54191	t
54201	INDIRECT	11	\N	49932	\N	49796	54191	t
54202	INDIRECT	11	50229	\N	\N	49796	54191	t
54203	INDIRECT	11	\N	49933	\N	49796	54191	t
54204	INDIRECT	11	50230	\N	\N	49796	54191	t
54205	INDIRECT	11	\N	49934	\N	49796	54191	t
54206	INDIRECT	11	50231	\N	\N	49796	54191	t
54207	INDIRECT	11	\N	49935	\N	49796	54191	t
54208	INDIRECT	11	50232	\N	\N	49796	54191	t
54209	INDIRECT	11	\N	49936	\N	49796	54191	t
54210	INDIRECT	11	50233	\N	\N	49796	54191	t
54211	INDIRECT	11	\N	49937	\N	49796	54191	t
54212	INDIRECT	11	50234	\N	\N	49796	54191	t
54213	INDIRECT	11	\N	49943	\N	49796	54191	t
54214	INDIRECT	11	\N	49944	\N	49796	54191	t
54215	INDIRECT	11	50239	\N	\N	49796	54191	t
54216	INDIRECT	11	\N	49939	\N	49796	54191	t
54217	INDIRECT	11	50236	\N	\N	49796	54191	t
54218	INDIRECT	11	\N	49953	\N	49796	54191	t
54219	INDIRECT	11	50248	\N	\N	49796	54191	t
54220	INDIRECT	11	\N	49954	\N	49796	54191	t
54221	INDIRECT	11	50249	\N	\N	49796	54191	t
54222	INDIRECT	11	\N	49955	\N	49796	54191	t
54223	INDIRECT	11	50250	\N	\N	49796	54191	t
54224	INDIRECT	11	\N	49956	\N	49796	54191	t
54225	INDIRECT	11	50251	\N	\N	49796	54191	t
54226	INDIRECT	11	\N	49957	\N	49796	54191	t
54227	INDIRECT	11	50252	\N	\N	49796	54191	t
54228	INDIRECT	11	\N	49940	\N	49796	54191	t
54229	INDIRECT	11	\N	49941	\N	49796	54191	t
54230	INDIRECT	11	50237	\N	\N	49796	54191	t
54231	INDIRECT	11	\N	49942	\N	49796	54191	t
54232	INDIRECT	11	50238	\N	\N	49796	54191	t
54233	INDIRECT	11	\N	49938	\N	49796	54191	t
54234	INDIRECT	11	50235	\N	\N	49796	54191	t
54235	INDIRECT	11	\N	49945	\N	49796	54191	t
54236	INDIRECT	11	50240	\N	\N	49796	54191	t
54237	INDIRECT	11	\N	49946	\N	49796	54191	t
54238	INDIRECT	11	50241	\N	\N	49796	54191	t
54239	INDIRECT	11	\N	49947	\N	49796	54191	t
54240	INDIRECT	11	50242	\N	\N	49796	54191	t
54241	INDIRECT	11	\N	49948	\N	49796	54191	t
54242	INDIRECT	11	50243	\N	\N	49796	54191	t
54243	INDIRECT	11	\N	49949	\N	49796	54191	t
54244	INDIRECT	11	50244	\N	\N	49796	54191	t
54245	INDIRECT	11	\N	49950	\N	49796	54191	t
54246	INDIRECT	11	50245	\N	\N	49796	54191	t
54247	INDIRECT	11	\N	49951	\N	49796	54191	t
54248	INDIRECT	11	50246	\N	\N	49796	54191	t
54249	INDIRECT	11	\N	49952	\N	49796	54191	t
54251	DIRECT	11	\N	49958	\N	49796	\N	\N
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
1717	1	8e175db2-b5b8-443b-851b-33a0e550bd35	2010-05-04 07:53:06.731	\N	f	133	1113
39400	1	3e610261-d26b-4dde-a495-890507b5d3da	2010-05-12 16:21:42.651	\N	f	49796	39009
1718	2	b250c159-ebc5-495b-9f6b-243b5f95dccb	2010-05-04 07:53:46.183	\N	f	129	1115
1719	1	9f76efe5-97ca-42d2-ba54-51ba0e6444f9	2010-05-04 07:54:30.897	\N	f	130	1117
1720	1	8820c8ab-9eb8-4c72-b028-c9918c85eca4	2010-05-04 07:54:23.716	\N	f	129	1117
39401	1	dffa3b60-7157-4ae9-b006-a9eb38df8ac6	2010-05-12 16:22:10.767	\N	f	49796	39011
1735	29	b705feb4-e360-4458-97e0-bf07fdb79eed	2010-05-04 08:03:55.99	\N	f	117	1123
1732	16	f3a945d2-b2bc-4103-909b-dfcb719595e9	2010-05-04 08:02:53.439	\N	f	118	1128
1736	29	33feee7e-7fd4-4537-96cb-3bab60280934	2010-05-04 00:00:00	\N	f	108	1123
14746	2	78e8d9da-c7a3-407d-9c39-c8d77db15616	2010-05-06 19:46:10.187	\N	f	110	14343
1728	1	7d8dbaea-881a-4bf1-acef-cf31a20abdee	2010-05-04 08:01:54.047	\N	f	105	1136
1729	1	00d707bc-e9b3-41f8-a91b-5f39c9218968	2010-05-04 08:02:04.647	\N	f	117	1136
1727	2	5545f68e-caf1-48d1-991e-7b582ab28dd4	2010-05-04 08:01:20.408	\N	f	105	1134
1730	1	f1d90892-d79a-433e-8231-100009011d0d	2010-05-04 08:02:30.511	\N	f	117	1134
1724	17	44da098a-ea0d-4144-a16d-beb68dd1c337	2010-05-04 07:59:35.761	\N	f	124	1128
26866	2	dc660085-f43d-426f-9d95-ec457eb78a61	2010-05-12 12:28:32.257	\N	f	110	26463
14747	2	17d885e2-2c07-4c6b-9d5f-016f260076c0	2010-05-06 19:46:55.446	\N	f	110	14345
39390	1	493a4ee8-a6f0-4215-af64-b7b3b99d2fd9	2010-05-12 15:43:08.515	\N	f	109	38987
39391	1	42748cea-5102-4f16-a835-3e5e03d3ebbf	2010-05-12 16:16:51.929	\N	f	49796	38991
1737	1	cac19965-8102-4959-84e7-7e826764c702	2010-05-04 08:04:14.571	\N	f	117	1132
1726	2	aed33466-a532-45a7-8d0c-a12f90ffd19e	2010-05-04 08:00:36.93	\N	f	105	1132
1725	23	6d1812b2-bc4f-4f89-b6ce-f13105d6c564	2010-05-04 08:00:06.627	\N	f	124	1130
39393	1	1c9b0730-e12f-4d9c-b15d-74c6c4603cdc	2010-05-12 16:17:53.503	\N	f	49796	38995
1738	22	3b108db8-3e5f-49a0-8b3a-65efa67f9c7c	2010-05-04 08:04:26.693	\N	f	117	1130
39395	1	29b67a0b-e355-425b-b9d7-99478598a51e	2010-05-12 00:00:00	\N	f	49796	38999
39396	1	5e9ad98b-4239-4d6f-bd0d-4ef5a0b11a00	2010-05-12 16:19:41.032	\N	f	49796	39001
1733	36	1e87afbe-046a-401f-a284-164c49e540fd	2010-05-04 08:03:08.802	\N	f	118	1121
1734	35	709aa229-fe19-4b9b-be38-31cf6c1eafd1	2010-05-04 08:03:40.862	\N	f	108	1121
39397	1	8ce31719-73e9-4aac-9ff9-cf946151cea0	2010-05-12 00:00:00	\N	f	49796	39003
39398	1	fac82d36-5478-494d-9372-c4599e409780	2010-05-12 16:20:37.814	\N	f	49796	39005
39399	1	09909f8c-24ed-4652-85c9-fe0dcfe807d9	2010-05-12 00:00:00	\N	f	49796	39007
39402	1	0e10580d-0a5a-4794-a4d2-d8fe70fe174f	2010-05-12 00:00:00	\N	f	49796	39013
39404	1	a9de14a7-8e44-4cbe-9fb2-06427832db3c	2010-05-12 16:23:59.038	\N	f	49793	39017
39405	1	a485604a-6e38-48ac-b41d-b798142dab46	2010-05-12 16:25:09.441	\N	f	49798	39020
39406	1	49b7a39f-a601-4999-9d3f-e9cb7a81773a	2010-05-12 16:25:26.144	\N	f	49795	39022
65549	1	8cf2a9b7-4fc3-404a-92a8-d5e3aefbb6ee	2010-05-13 10:05:29.008	\N	f	49797	38997
39394	2	fdc328a0-0121-4676-98f9-f5686323c82f	2010-05-12 00:00:00	\N	f	49796	38997
65550	1	a4c60a02-4ded-47de-84af-730aaba011c6	2010-05-13 10:06:36.594	\N	f	49797	38993
39392	2	245f0f57-f18b-484a-adfa-19371c7aaf41	2010-05-12 00:00:00	\N	f	49796	38993
39403	2	d224b1de-c922-4627-ab8e-bb5cfb735d4c	2010-05-12 16:23:17.179	\N	f	49793	39015
2417839	1	698b8ecc-a09b-4f9c-bd21-664225ca2e26	2010-05-13 17:12:02.444	\N	f	49795	39015
1731	35	ad802f34-3ae6-4d20-871f-f2fe5624fe08	2010-05-04 08:02:42.579	\N	f	117	1119
1721	37	0655cf74-58fe-45ba-9df1-2d65c422c957	2010-05-04 07:55:10.663	\N	f	108	1119
1722	37	07ae0d78-ecd1-47c8-9085-825de29c359f	2010-05-04 07:55:19.053	\N	f	126	1119
1739	16	72b43332-c29e-4c23-9b94-bc85f66de056	2010-05-04 08:04:36.966	\N	f	117	1126
1723	17	8026594d-618f-4bd6-b272-ec9de0dfc9de	2010-05-04 07:58:59.289	\N	f	124	1126
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, generatecode, resource) FROM stdin;
1	16	229611e4-4370-424a-a191-9f0f852e2ed3	Tipo de baja	Baja	f	f	t	f	1
2	12	de5e4cba-7663-4e01-a776-93fb19fb949c	Categoría	Categoría profesional	t	t	t	f	1
7	1	68bdbf68-3928-4f23-a18d-f45b9127e157	Tipo de máquina	\N	t	t	t	t	2
4	9	1df30019-35db-42ef-b018-51a761184d3e	Tipo de trabajo	Tipo de trabajo	t	t	t	f	1
16121856	2	4f07894c-5345-4c7d-ae9b-72c98a82f410	Perfil técnico	\N	t	t	t	t	0
4259841	11	479d7b13-d3b3-47a8-a394-0d4face24ae3	CATEGORY	Professional category	t	t	t	f	1
4259842	9	37470b57-3421-4ec5-acf9-e5b58a6008da	TRAINING	Training courses and labor training	t	t	t	f	1
5	6	498ff6a4-c6b4-46fe-b806-766895ed6470	Relación contractual	Relación contractual del trabajador con la empresa.	f	f	t	f	1
3	10	8db6e365-fb8b-4452-89ce-8360965e79c8	Formación	Cursos o formación profesional	t	t	t	f	1
6	2	d6348b11-4d8b-4d0d-8909-2bffe2791291	Localización	Localización del recurso	t	f	t	f	0
4259840	15	35402175-3be1-4a4d-b65c-c15799638eb0	LEAVE	Leave	f	f	t	f	1
4259843	7	eea70829-8601-4799-bcbc-f81b17fde23a	JOB	Job	t	t	t	f	1
4259844	5	2ca10ea2-b0d7-4247-8d88-c19a5c72f4a7	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	f	1
4259845	1	bab0cc28-ea14-4dc0-a9ac-7c499d2afe7a	LOCATION_GROUP	Location where the resource work	t	f	t	f	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, consolidated, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
11866	GENERIC_DAY	1	3	\N	2010-07-13	1121	\N	2681	\N
11867	GENERIC_DAY	1	2	\N	2010-06-29	1123	\N	2681	\N
11868	GENERIC_DAY	1	3	\N	2010-07-06	1119	\N	2681	\N
11869	GENERIC_DAY	1	3	\N	2010-07-01	1121	\N	2681	\N
11870	GENERIC_DAY	1	3	\N	2010-07-19	1119	\N	2681	\N
11871	GENERIC_DAY	1	3	\N	2010-08-03	1121	\N	2681	\N
11872	GENERIC_DAY	1	0	\N	2010-06-20	1123	\N	2681	\N
11873	GENERIC_DAY	1	0	\N	2010-08-01	1119	\N	2681	\N
11874	GENERIC_DAY	1	3	\N	2010-07-02	1119	\N	2681	\N
11875	GENERIC_DAY	1	3	\N	2010-07-28	1119	\N	2681	\N
11876	GENERIC_DAY	1	3	\N	2010-07-27	1121	\N	2681	\N
11877	GENERIC_DAY	1	3	\N	2010-08-04	1119	\N	2681	\N
11878	GENERIC_DAY	1	2	\N	2010-07-14	1123	\N	2681	\N
11879	GENERIC_DAY	1	2	\N	2010-06-22	1121	\N	2681	\N
11880	GENERIC_DAY	1	0	\N	2010-06-19	1119	\N	2681	\N
11881	GENERIC_DAY	1	3	\N	2010-06-21	1123	\N	2681	\N
11882	GENERIC_DAY	1	1	\N	2010-08-05	1123	\N	2681	\N
11883	GENERIC_DAY	1	0	\N	2010-07-24	1121	\N	2681	\N
11884	GENERIC_DAY	1	3	\N	2010-08-02	1119	\N	2681	\N
11885	GENERIC_DAY	1	3	\N	2010-07-21	1119	\N	2681	\N
11886	GENERIC_DAY	1	2	\N	2010-06-21	1121	\N	2681	\N
11887	GENERIC_DAY	1	3	\N	2010-06-22	1119	\N	2681	\N
11888	GENERIC_DAY	1	3	\N	2010-06-29	1119	\N	2681	\N
11889	GENERIC_DAY	1	3	\N	2010-07-15	1119	\N	2681	\N
11890	GENERIC_DAY	1	3	\N	2010-07-12	1119	\N	2681	\N
11891	GENERIC_DAY	1	2	\N	2010-08-02	1123	\N	2681	\N
11892	GENERIC_DAY	1	2	\N	2010-06-23	1121	\N	2681	\N
11893	GENERIC_DAY	1	3	\N	2010-06-18	1119	\N	2681	\N
11894	GENERIC_DAY	1	0	\N	2010-07-03	1123	\N	2681	\N
11895	GENERIC_DAY	1	3	\N	2010-06-23	1123	\N	2681	\N
11896	GENERIC_DAY	1	3	\N	2010-07-07	1119	\N	2681	\N
11897	GENERIC_DAY	1	2	\N	2010-07-16	1123	\N	2681	\N
11898	GENERIC_DAY	1	0	\N	2010-07-31	1123	\N	2681	\N
11899	GENERIC_DAY	1	2	\N	2010-07-09	1123	\N	2681	\N
11900	GENERIC_DAY	1	2	\N	2010-07-19	1123	\N	2681	\N
11901	GENERIC_DAY	1	0	\N	2010-07-25	1123	\N	2681	\N
11902	GENERIC_DAY	1	0	\N	2010-07-18	1121	\N	2681	\N
11903	GENERIC_DAY	1	0	\N	2010-07-31	1119	\N	2681	\N
11904	GENERIC_DAY	1	2	\N	2010-07-29	1123	\N	2681	\N
11905	GENERIC_DAY	1	3	\N	2010-08-02	1121	\N	2681	\N
11906	GENERIC_DAY	1	2	\N	2010-07-08	1123	\N	2681	\N
11907	GENERIC_DAY	1	0	\N	2010-07-10	1121	\N	2681	\N
11908	GENERIC_DAY	1	3	\N	2010-07-02	1121	\N	2681	\N
11909	GENERIC_DAY	1	2	\N	2010-07-02	1123	\N	2681	\N
11910	GENERIC_DAY	1	0	\N	2010-06-26	1123	\N	2681	\N
11911	GENERIC_DAY	1	0	\N	2010-07-04	1121	\N	2681	\N
11912	GENERIC_DAY	1	2	\N	2010-06-18	1121	\N	2681	\N
11913	GENERIC_DAY	1	2	\N	2010-07-15	1123	\N	2681	\N
11914	GENERIC_DAY	1	2	\N	2010-07-28	1123	\N	2681	\N
11915	GENERIC_DAY	1	3	\N	2010-07-07	1121	\N	2681	\N
11916	GENERIC_DAY	1	3	\N	2010-07-29	1119	\N	2681	\N
11917	GENERIC_DAY	1	3	\N	2010-06-16	1123	\N	2681	\N
11918	GENERIC_DAY	1	0	\N	2010-08-01	1123	\N	2681	\N
11919	GENERIC_DAY	1	3	\N	2010-06-28	1119	\N	2681	\N
11920	GENERIC_DAY	1	3	\N	2010-06-15	1119	\N	2681	\N
11921	GENERIC_DAY	1	0	\N	2010-07-11	1121	\N	2681	\N
11922	GENERIC_DAY	1	2	\N	2010-06-17	1121	\N	2681	\N
11923	GENERIC_DAY	1	2	\N	2010-07-21	1123	\N	2681	\N
11924	GENERIC_DAY	1	3	\N	2010-07-26	1121	\N	2681	\N
11925	GENERIC_DAY	1	2	\N	2010-08-04	1123	\N	2681	\N
11926	GENERIC_DAY	1	2	\N	2010-07-06	1123	\N	2681	\N
11927	GENERIC_DAY	1	3	\N	2010-07-21	1121	\N	2681	\N
11928	GENERIC_DAY	1	3	\N	2010-06-30	1119	\N	2681	\N
11929	GENERIC_DAY	1	3	\N	2010-07-20	1121	\N	2681	\N
11930	GENERIC_DAY	1	0	\N	2010-07-11	1119	\N	2681	\N
11931	GENERIC_DAY	1	2	\N	2010-06-30	1123	\N	2681	\N
11932	GENERIC_DAY	1	3	\N	2010-07-09	1119	\N	2681	\N
11933	GENERIC_DAY	1	3	\N	2010-06-21	1119	\N	2681	\N
11934	GENERIC_DAY	1	0	\N	2010-07-10	1123	\N	2681	\N
11935	GENERIC_DAY	1	0	\N	2010-06-27	1121	\N	2681	\N
11936	GENERIC_DAY	1	3	\N	2010-08-04	1121	\N	2681	\N
11937	GENERIC_DAY	1	3	\N	2010-07-05	1121	\N	2681	\N
11938	GENERIC_DAY	1	3	\N	2010-07-15	1121	\N	2681	\N
11939	GENERIC_DAY	1	3	\N	2010-06-17	1123	\N	2681	\N
11940	GENERIC_DAY	1	3	\N	2010-06-25	1121	\N	2681	\N
11941	GENERIC_DAY	1	0	\N	2010-07-03	1119	\N	2681	\N
11942	GENERIC_DAY	1	2	\N	2010-06-24	1121	\N	2681	\N
11943	GENERIC_DAY	1	0	\N	2010-06-26	1121	\N	2681	\N
11944	GENERIC_DAY	1	3	\N	2010-07-14	1119	\N	2681	\N
11945	GENERIC_DAY	1	0	\N	2010-07-25	1119	\N	2681	\N
11946	GENERIC_DAY	1	3	\N	2010-07-09	1121	\N	2681	\N
11947	GENERIC_DAY	1	2	\N	2010-07-05	1123	\N	2681	\N
11948	GENERIC_DAY	1	3	\N	2010-06-30	1121	\N	2681	\N
11949	GENERIC_DAY	1	2	\N	2010-07-26	1123	\N	2681	\N
11950	GENERIC_DAY	1	0	\N	2010-08-01	1121	\N	2681	\N
11951	GENERIC_DAY	1	0	\N	2010-06-20	1121	\N	2681	\N
11952	GENERIC_DAY	1	2	\N	2010-06-16	1121	\N	2681	\N
11953	GENERIC_DAY	1	1	\N	2010-08-05	1121	\N	2681	\N
10017	GENERIC_DAY	2	5	\N	2010-05-24	1123	\N	2679	\N
10096	GENERIC_DAY	2	5	\N	2010-05-14	1121	\N	2679	\N
10116	GENERIC_DAY	2	6	\N	2010-05-05	1119	\N	2679	\N
10051	GENERIC_DAY	2	0	\N	2010-05-22	1121	\N	2679	\N
10067	GENERIC_DAY	2	0	\N	2010-05-23	1119	\N	2679	\N
10090	GENERIC_DAY	2	5	\N	2010-06-02	1121	\N	2679	\N
10088	GENERIC_DAY	2	5	\N	2010-05-14	1123	\N	2679	\N
10027	GENERIC_DAY	2	6	\N	2010-05-11	1119	\N	2679	\N
10025	GENERIC_DAY	2	0	\N	2010-06-05	1123	\N	2679	\N
10072	GENERIC_DAY	2	6	\N	2010-05-20	1119	\N	2679	\N
10081	GENERIC_DAY	2	5	\N	2010-06-04	1121	\N	2679	\N
10050	GENERIC_DAY	2	0	\N	2010-05-09	1121	\N	2679	\N
10042	GENERIC_DAY	2	0	\N	2010-05-29	1123	\N	2679	\N
10015	GENERIC_DAY	2	5	\N	2010-06-02	1123	\N	2679	\N
10062	GENERIC_DAY	2	0	\N	2010-06-12	1119	\N	2679	\N
10053	GENERIC_DAY	2	5	\N	2010-05-20	1123	\N	2679	\N
10030	GENERIC_DAY	2	5	\N	2010-05-20	1121	\N	2679	\N
10028	GENERIC_DAY	2	5	\N	2010-05-18	1123	\N	2679	\N
10085	GENERIC_DAY	2	6	\N	2010-06-01	1119	\N	2679	\N
10066	GENERIC_DAY	2	5	\N	2010-05-19	1123	\N	2679	\N
11954	GENERIC_DAY	1	2	\N	2010-06-28	1123	\N	2681	\N
11955	GENERIC_DAY	1	3	\N	2010-06-16	1119	\N	2681	\N
11956	GENERIC_DAY	1	3	\N	2010-07-16	1121	\N	2681	\N
11957	GENERIC_DAY	1	3	\N	2010-07-30	1121	\N	2681	\N
11958	GENERIC_DAY	1	2	\N	2010-08-05	1119	\N	2681	\N
11959	GENERIC_DAY	1	0	\N	2010-07-18	1119	\N	2681	\N
11960	GENERIC_DAY	1	0	\N	2010-07-03	1121	\N	2681	\N
11961	GENERIC_DAY	1	3	\N	2010-07-05	1119	\N	2681	\N
11962	GENERIC_DAY	1	2	\N	2010-07-12	1123	\N	2681	\N
11963	GENERIC_DAY	1	3	\N	2010-07-29	1121	\N	2681	\N
11964	GENERIC_DAY	1	0	\N	2010-06-26	1119	\N	2681	\N
11965	GENERIC_DAY	1	2	\N	2010-07-01	1123	\N	2681	\N
11966	GENERIC_DAY	1	2	\N	2010-07-30	1123	\N	2681	\N
11967	GENERIC_DAY	1	0	\N	2010-07-11	1123	\N	2681	\N
11968	GENERIC_DAY	1	3	\N	2010-07-13	1119	\N	2681	\N
11969	GENERIC_DAY	1	3	\N	2010-07-22	1119	\N	2681	\N
11970	GENERIC_DAY	1	0	\N	2010-07-24	1119	\N	2681	\N
11971	GENERIC_DAY	1	2	\N	2010-08-03	1123	\N	2681	\N
11972	GENERIC_DAY	1	0	\N	2010-06-27	1123	\N	2681	\N
11973	GENERIC_DAY	1	0	\N	2010-06-19	1121	\N	2681	\N
11974	GENERIC_DAY	1	2	\N	2010-06-25	1119	\N	2681	\N
11975	GENERIC_DAY	1	3	\N	2010-07-22	1121	\N	2681	\N
11976	GENERIC_DAY	1	2	\N	2010-07-13	1123	\N	2681	\N
11977	GENERIC_DAY	1	2	\N	2010-06-15	1121	\N	2681	\N
11978	GENERIC_DAY	1	3	\N	2010-06-22	1123	\N	2681	\N
11979	GENERIC_DAY	1	3	\N	2010-06-17	1119	\N	2681	\N
11980	GENERIC_DAY	1	3	\N	2010-07-23	1119	\N	2681	\N
11981	GENERIC_DAY	1	0	\N	2010-07-04	1123	\N	2681	\N
11982	GENERIC_DAY	1	3	\N	2010-07-28	1121	\N	2681	\N
11983	GENERIC_DAY	1	3	\N	2010-07-06	1121	\N	2681	\N
11984	GENERIC_DAY	1	3	\N	2010-06-24	1123	\N	2681	\N
11985	GENERIC_DAY	1	0	\N	2010-07-31	1121	\N	2681	\N
11986	GENERIC_DAY	1	0	\N	2010-07-17	1119	\N	2681	\N
12898	SPECIFIC_DAY	0	0	\N	2010-09-25	1132	2715	\N	\N
12899	SPECIFIC_DAY	0	8	\N	2010-09-29	1132	2715	\N	\N
12900	SPECIFIC_DAY	0	0	\N	2010-09-26	1132	2715	\N	\N
12901	SPECIFIC_DAY	0	0	\N	2010-10-03	1132	2715	\N	\N
12902	SPECIFIC_DAY	0	8	\N	2010-09-14	1132	2715	\N	\N
12903	SPECIFIC_DAY	0	8	\N	2010-09-28	1132	2715	\N	\N
12904	SPECIFIC_DAY	0	8	\N	2010-09-23	1132	2715	\N	\N
12905	SPECIFIC_DAY	0	8	\N	2010-09-22	1132	2715	\N	\N
12906	SPECIFIC_DAY	0	8	\N	2010-09-27	1132	2715	\N	\N
12907	SPECIFIC_DAY	0	4	\N	2010-10-06	1132	2715	\N	\N
12908	SPECIFIC_DAY	0	8	\N	2010-09-20	1132	2715	\N	\N
12909	SPECIFIC_DAY	0	8	\N	2010-09-15	1132	2715	\N	\N
12910	SPECIFIC_DAY	0	0	\N	2010-10-02	1132	2715	\N	\N
12911	SPECIFIC_DAY	0	8	\N	2010-10-01	1132	2715	\N	\N
12912	SPECIFIC_DAY	0	0	\N	2010-09-18	1132	2715	\N	\N
47112	GENERIC_DAY	2	10	\N	2010-09-15	1130	\N	39509	\N
47123	GENERIC_DAY	2	10	\N	2010-08-30	1128	\N	39509	\N
47098	GENERIC_DAY	2	11	\N	2010-09-14	1128	\N	39509	\N
47140	GENERIC_DAY	2	0	\N	2010-08-07	1126	\N	39509	\N
47204	GENERIC_DAY	2	11	\N	2010-07-08	1126	\N	39509	\N
47069	GENERIC_DAY	2	11	\N	2010-08-31	1130	\N	39509	\N
47205	GENERIC_DAY	2	0	\N	2010-07-17	1126	\N	39509	\N
46972	GENERIC_DAY	2	11	\N	2010-07-26	1128	\N	39509	\N
47066	GENERIC_DAY	2	11	\N	2010-07-16	1128	\N	39509	\N
47002	GENERIC_DAY	2	11	\N	2010-09-01	1126	\N	39509	\N
47094	GENERIC_DAY	2	11	\N	2010-08-05	1128	\N	39509	\N
47217	GENERIC_DAY	2	0	\N	2010-08-29	1130	\N	39509	\N
47096	GENERIC_DAY	2	10	\N	2010-08-04	1130	\N	39509	\N
47197	GENERIC_DAY	2	0	\N	2010-07-10	1130	\N	39509	\N
47000	GENERIC_DAY	2	0	\N	2010-08-01	1126	\N	39509	\N
47095	GENERIC_DAY	2	11	\N	2010-07-12	1126	\N	39509	\N
47087	GENERIC_DAY	2	11	\N	2010-07-06	1126	\N	39509	\N
47046	GENERIC_DAY	2	11	\N	2010-08-19	1130	\N	39509	\N
46988	GENERIC_DAY	2	10	\N	2010-08-06	1130	\N	39509	\N
47185	GENERIC_DAY	2	11	\N	2010-08-16	1128	\N	39509	\N
47057	GENERIC_DAY	2	11	\N	2010-06-30	1126	\N	39509	\N
47083	GENERIC_DAY	2	11	\N	2010-07-29	1126	\N	39509	\N
47119	GENERIC_DAY	2	0	\N	2010-07-18	1128	\N	39509	\N
47133	GENERIC_DAY	2	11	\N	2010-08-30	1126	\N	39509	\N
47142	GENERIC_DAY	2	11	\N	2010-09-10	1128	\N	39509	\N
47005	GENERIC_DAY	2	0	\N	2010-08-15	1126	\N	39509	\N
47122	GENERIC_DAY	2	11	\N	2010-07-21	1128	\N	39509	\N
47154	GENERIC_DAY	2	11	\N	2010-09-09	1130	\N	39509	\N
47196	GENERIC_DAY	2	10	\N	2010-09-21	1130	\N	39509	\N
47050	GENERIC_DAY	2	10	\N	2010-08-05	1130	\N	39509	\N
46971	GENERIC_DAY	2	10	\N	2010-08-02	1130	\N	39509	\N
47134	GENERIC_DAY	2	11	\N	2010-08-04	1126	\N	39509	\N
47085	GENERIC_DAY	2	0	\N	2010-07-24	1126	\N	39509	\N
47226	GENERIC_DAY	2	11	\N	2010-08-03	1128	\N	39509	\N
47174	GENERIC_DAY	2	11	\N	2010-07-30	1126	\N	39509	\N
47155	GENERIC_DAY	2	11	\N	2010-07-20	1126	\N	39509	\N
47056	GENERIC_DAY	2	0	\N	2010-07-11	1130	\N	39509	\N
47001	GENERIC_DAY	2	11	\N	2010-07-23	1126	\N	39509	\N
47114	GENERIC_DAY	2	10	\N	2010-07-30	1130	\N	39509	\N
46978	GENERIC_DAY	2	11	\N	2010-07-28	1128	\N	39509	\N
47032	GENERIC_DAY	2	10	\N	2010-08-17	1130	\N	39509	\N
47211	GENERIC_DAY	2	11	\N	2010-08-25	1126	\N	39509	\N
47170	GENERIC_DAY	2	11	\N	2010-09-02	1130	\N	39509	\N
46966	GENERIC_DAY	2	0	\N	2010-09-19	1130	\N	39509	\N
47051	GENERIC_DAY	2	10	\N	2010-07-08	1130	\N	39509	\N
47115	GENERIC_DAY	2	11	\N	2010-09-02	1126	\N	39509	\N
47214	GENERIC_DAY	2	11	\N	2010-09-15	1128	\N	39509	\N
47121	GENERIC_DAY	2	11	\N	2010-07-14	1126	\N	39509	\N
47006	GENERIC_DAY	2	11	\N	2010-09-03	1126	\N	39509	\N
47068	GENERIC_DAY	2	10	\N	2010-09-20	1130	\N	39509	\N
47183	GENERIC_DAY	2	10	\N	2010-07-14	1130	\N	39509	\N
46995	GENERIC_DAY	2	11	\N	2010-08-24	1126	\N	39509	\N
47212	GENERIC_DAY	2	10	\N	2010-08-27	1128	\N	39509	\N
47129	GENERIC_DAY	2	11	\N	2010-08-19	1126	\N	39509	\N
47084	GENERIC_DAY	2	10	\N	2010-08-09	1130	\N	39509	\N
47063	GENERIC_DAY	2	11	\N	2010-08-02	1128	\N	39509	\N
47107	GENERIC_DAY	2	11	\N	2010-09-08	1126	\N	39509	\N
46997	GENERIC_DAY	2	10	\N	2010-07-21	1130	\N	39509	\N
47158	GENERIC_DAY	2	11	\N	2010-07-29	1128	\N	39509	\N
47012	GENERIC_DAY	2	0	\N	2010-08-08	1126	\N	39509	\N
47161	GENERIC_DAY	2	11	\N	2010-07-14	1128	\N	39509	\N
47039	GENERIC_DAY	2	0	\N	2010-09-05	1130	\N	39509	\N
47193	GENERIC_DAY	2	11	\N	2010-08-26	1130	\N	39509	\N
47008	GENERIC_DAY	2	11	\N	2010-08-10	1126	\N	39509	\N
47136	GENERIC_DAY	2	0	\N	2010-08-07	1130	\N	39509	\N
47165	GENERIC_DAY	2	0	\N	2010-07-24	1128	\N	39509	\N
47071	GENERIC_DAY	2	0	\N	2010-07-24	1130	\N	39509	\N
47139	GENERIC_DAY	2	11	\N	2010-07-09	1128	\N	39509	\N
47054	GENERIC_DAY	2	10	\N	2010-09-07	1128	\N	39509	\N
47078	GENERIC_DAY	2	11	\N	2010-09-20	1126	\N	39509	\N
47065	GENERIC_DAY	2	11	\N	2010-07-05	1128	\N	39509	\N
47100	GENERIC_DAY	2	10	\N	2010-09-16	1130	\N	39509	\N
47108	GENERIC_DAY	2	11	\N	2010-08-09	1126	\N	39509	\N
47210	GENERIC_DAY	2	0	\N	2010-09-11	1126	\N	39509	\N
47173	GENERIC_DAY	2	0	\N	2010-08-14	1130	\N	39509	\N
46991	GENERIC_DAY	2	0	\N	2010-08-14	1126	\N	39509	\N
47163	GENERIC_DAY	2	6	\N	2010-09-23	1126	\N	39509	\N
47104	GENERIC_DAY	2	0	\N	2010-09-12	1128	\N	39509	\N
47105	GENERIC_DAY	2	10	\N	2010-09-14	1130	\N	39509	\N
47188	GENERIC_DAY	2	0	\N	2010-07-31	1128	\N	39509	\N
47153	GENERIC_DAY	2	0	\N	2010-07-25	1126	\N	39509	\N
47059	GENERIC_DAY	2	0	\N	2010-08-21	1130	\N	39509	\N
47067	GENERIC_DAY	2	11	\N	2010-07-19	1128	\N	39509	\N
47124	GENERIC_DAY	2	11	\N	2010-09-09	1126	\N	39509	\N
47044	GENERIC_DAY	2	11	\N	2010-08-23	1130	\N	39509	\N
47184	GENERIC_DAY	2	11	\N	2010-09-20	1128	\N	39509	\N
46970	GENERIC_DAY	2	11	\N	2010-07-08	1128	\N	39509	\N
47199	GENERIC_DAY	2	10	\N	2010-09-10	1126	\N	39509	\N
47076	GENERIC_DAY	2	11	\N	2010-08-31	1126	\N	39509	\N
47027	GENERIC_DAY	2	11	\N	2010-07-30	1128	\N	39509	\N
46973	GENERIC_DAY	2	0	\N	2010-07-25	1130	\N	39509	\N
47090	GENERIC_DAY	2	11	\N	2010-06-30	1128	\N	39509	\N
47186	GENERIC_DAY	2	11	\N	2010-08-05	1126	\N	39509	\N
47089	GENERIC_DAY	2	11	\N	2010-09-22	1126	\N	39509	\N
47216	GENERIC_DAY	2	11	\N	2010-09-01	1130	\N	39509	\N
47203	GENERIC_DAY	2	0	\N	2010-07-18	1130	\N	39509	\N
46996	GENERIC_DAY	2	11	\N	2010-08-26	1126	\N	39509	\N
47146	GENERIC_DAY	2	11	\N	2010-09-08	1130	\N	39509	\N
47167	GENERIC_DAY	2	11	\N	2010-08-02	1126	\N	39509	\N
47061	GENERIC_DAY	2	10	\N	2010-07-13	1130	\N	39509	\N
46980	GENERIC_DAY	2	0	\N	2010-08-15	1130	\N	39509	\N
47137	GENERIC_DAY	2	0	\N	2010-07-18	1126	\N	39509	\N
47168	GENERIC_DAY	2	11	\N	2010-07-15	1126	\N	39509	\N
47209	GENERIC_DAY	2	11	\N	2010-07-27	1126	\N	39509	\N
47111	GENERIC_DAY	2	0	\N	2010-07-04	1130	\N	39509	\N
47102	GENERIC_DAY	2	11	\N	2010-08-20	1126	\N	39509	\N
47024	GENERIC_DAY	2	0	\N	2010-07-04	1128	\N	39509	\N
47189	GENERIC_DAY	2	10	\N	2010-07-23	1130	\N	39509	\N
47149	GENERIC_DAY	2	11	\N	2010-07-07	1128	\N	39509	\N
47034	GENERIC_DAY	2	10	\N	2010-08-11	1130	\N	39509	\N
46977	GENERIC_DAY	2	11	\N	2010-07-13	1126	\N	39509	\N
46990	GENERIC_DAY	2	0	\N	2010-08-28	1128	\N	39509	\N
47106	GENERIC_DAY	2	10	\N	2010-07-09	1130	\N	39509	\N
46987	GENERIC_DAY	2	10	\N	2010-07-12	1130	\N	39509	\N
47118	GENERIC_DAY	2	11	\N	2010-08-13	1128	\N	39509	\N
47110	GENERIC_DAY	2	10	\N	2010-08-24	1128	\N	39509	\N
46967	GENERIC_DAY	2	10	\N	2010-07-06	1130	\N	39509	\N
47010	GENERIC_DAY	2	0	\N	2010-09-04	1130	\N	39509	\N
47147	GENERIC_DAY	2	11	\N	2010-07-12	1128	\N	39509	\N
47014	GENERIC_DAY	2	0	\N	2010-07-31	1130	\N	39509	\N
47120	GENERIC_DAY	2	10	\N	2010-07-26	1130	\N	39509	\N
47159	GENERIC_DAY	2	10	\N	2010-07-15	1130	\N	39509	\N
47037	GENERIC_DAY	2	0	\N	2010-08-29	1126	\N	39509	\N
47164	GENERIC_DAY	2	10	\N	2010-09-02	1128	\N	39509	\N
47125	GENERIC_DAY	2	11	\N	2010-09-13	1128	\N	39509	\N
47033	GENERIC_DAY	2	11	\N	2010-07-16	1126	\N	39509	\N
47053	GENERIC_DAY	2	11	\N	2010-07-07	1126	\N	39509	\N
46986	GENERIC_DAY	2	11	\N	2010-09-06	1126	\N	39509	\N
46981	GENERIC_DAY	2	0	\N	2010-07-10	1128	\N	39509	\N
47221	GENERIC_DAY	2	0	\N	2010-09-18	1128	\N	39509	\N
47160	GENERIC_DAY	2	0	\N	2010-08-08	1128	\N	39509	\N
47015	GENERIC_DAY	2	11	\N	2010-09-07	1130	\N	39509	\N
47043	GENERIC_DAY	2	10	\N	2010-08-10	1130	\N	39509	\N
47131	GENERIC_DAY	2	11	\N	2010-07-26	1126	\N	39509	\N
47213	GENERIC_DAY	2	11	\N	2010-08-18	1126	\N	39509	\N
47062	GENERIC_DAY	2	10	\N	2010-09-01	1128	\N	39509	\N
47172	GENERIC_DAY	2	0	\N	2010-07-17	1130	\N	39509	\N
47145	GENERIC_DAY	2	11	\N	2010-08-09	1128	\N	39509	\N
46985	GENERIC_DAY	2	11	\N	2010-08-30	1130	\N	39509	\N
47036	GENERIC_DAY	2	0	\N	2010-09-11	1130	\N	39509	\N
47018	GENERIC_DAY	2	10	\N	2010-06-29	1130	\N	39509	\N
47144	GENERIC_DAY	2	11	\N	2010-09-15	1126	\N	39509	\N
47192	GENERIC_DAY	2	11	\N	2010-07-02	1128	\N	39509	\N
47040	GENERIC_DAY	2	11	\N	2010-07-05	1126	\N	39509	\N
47023	GENERIC_DAY	2	10	\N	2010-08-20	1128	\N	39509	\N
47101	GENERIC_DAY	2	11	\N	2010-06-29	1128	\N	39509	\N
47126	GENERIC_DAY	2	11	\N	2010-08-10	1128	\N	39509	\N
47009	GENERIC_DAY	2	11	\N	2010-09-13	1126	\N	39509	\N
47138	GENERIC_DAY	2	11	\N	2010-09-16	1128	\N	39509	\N
47148	GENERIC_DAY	2	0	\N	2010-09-19	1128	\N	39509	\N
46992	GENERIC_DAY	2	11	\N	2010-08-13	1126	\N	39509	\N
46994	GENERIC_DAY	2	10	\N	2010-08-31	1128	\N	39509	\N
47202	GENERIC_DAY	2	0	\N	2010-07-11	1128	\N	39509	\N
47206	GENERIC_DAY	2	10	\N	2010-09-13	1130	\N	39509	\N
47191	GENERIC_DAY	2	0	\N	2010-07-03	1126	\N	39509	\N
47143	GENERIC_DAY	2	10	\N	2010-09-03	1128	\N	39509	\N
47176	GENERIC_DAY	2	10	\N	2010-07-05	1130	\N	39509	\N
47016	GENERIC_DAY	2	10	\N	2010-07-28	1130	\N	39509	\N
47080	GENERIC_DAY	2	0	\N	2010-07-04	1126	\N	39509	\N
47141	GENERIC_DAY	2	0	\N	2010-09-04	1128	\N	39509	\N
47195	GENERIC_DAY	2	10	\N	2010-07-27	1130	\N	39509	\N
47128	GENERIC_DAY	2	0	\N	2010-09-04	1126	\N	39509	\N
47219	GENERIC_DAY	2	0	\N	2010-09-05	1126	\N	39509	\N
46982	GENERIC_DAY	2	0	\N	2010-07-10	1126	\N	39509	\N
47116	GENERIC_DAY	2	0	\N	2010-08-21	1126	\N	39509	\N
47166	GENERIC_DAY	2	11	\N	2010-08-03	1126	\N	39509	\N
47042	GENERIC_DAY	2	11	\N	2010-09-07	1126	\N	39509	\N
47224	GENERIC_DAY	2	11	\N	2010-07-13	1128	\N	39509	\N
46976	GENERIC_DAY	2	11	\N	2010-07-22	1126	\N	39509	\N
47026	GENERIC_DAY	2	11	\N	2010-07-22	1128	\N	39509	\N
47047	GENERIC_DAY	2	11	\N	2010-08-17	1128	\N	39509	\N
47082	GENERIC_DAY	2	11	\N	2010-09-21	1126	\N	39509	\N
47048	GENERIC_DAY	2	11	\N	2010-07-01	1128	\N	39509	\N
46969	GENERIC_DAY	2	11	\N	2010-07-06	1128	\N	39509	\N
47207	GENERIC_DAY	2	0	\N	2010-08-01	1128	\N	39509	\N
47004	GENERIC_DAY	2	10	\N	2010-09-22	1130	\N	39509	\N
47190	GENERIC_DAY	2	11	\N	2010-07-20	1128	\N	39509	\N
47079	GENERIC_DAY	2	11	\N	2010-09-03	1130	\N	39509	\N
47052	GENERIC_DAY	2	10	\N	2010-08-13	1130	\N	39509	\N
47038	GENERIC_DAY	2	0	\N	2010-07-03	1128	\N	39509	\N
47028	GENERIC_DAY	2	11	\N	2010-06-29	1126	\N	39509	\N
47030	GENERIC_DAY	2	10	\N	2010-08-03	1130	\N	39509	\N
47179	GENERIC_DAY	2	10	\N	2010-09-17	1130	\N	39509	\N
47151	GENERIC_DAY	2	0	\N	2010-08-15	1128	\N	39509	\N
47029	GENERIC_DAY	2	0	\N	2010-09-11	1128	\N	39509	\N
47025	GENERIC_DAY	2	11	\N	2010-09-10	1130	\N	39509	\N
47064	GENERIC_DAY	2	10	\N	2010-07-29	1130	\N	39509	\N
47092	GENERIC_DAY	2	11	\N	2010-08-27	1126	\N	39509	\N
47017	GENERIC_DAY	2	11	\N	2010-08-12	1126	\N	39509	\N
47097	GENERIC_DAY	2	11	\N	2010-07-09	1126	\N	39509	\N
46968	GENERIC_DAY	2	11	\N	2010-08-16	1126	\N	39509	\N
47223	GENERIC_DAY	2	11	\N	2010-08-24	1130	\N	39509	\N
47169	GENERIC_DAY	2	0	\N	2010-08-28	1130	\N	39509	\N
47041	GENERIC_DAY	2	11	\N	2010-07-23	1128	\N	39509	\N
47013	GENERIC_DAY	2	11	\N	2010-07-19	1126	\N	39509	\N
47220	GENERIC_DAY	2	10	\N	2010-08-18	1128	\N	39509	\N
47020	GENERIC_DAY	2	10	\N	2010-09-06	1128	\N	39509	\N
47088	GENERIC_DAY	2	10	\N	2010-07-01	1130	\N	39509	\N
10004	GENERIC_DAY	2	0	\N	2010-06-12	1121	\N	2679	\N
10006	GENERIC_DAY	2	16	\N	2010-05-04	1123	\N	2679	\N
10002	GENERIC_DAY	2	6	\N	2010-06-10	1119	\N	2679	\N
10003	GENERIC_DAY	2	0	\N	2010-06-13	1123	\N	2679	\N
9998	GENERIC_DAY	2	5	\N	2010-05-21	1121	\N	2679	\N
9999	GENERIC_DAY	2	5	\N	2010-05-25	1121	\N	2679	\N
10005	GENERIC_DAY	2	5	\N	2010-05-13	1121	\N	2679	\N
10008	GENERIC_DAY	2	6	\N	2010-05-19	1119	\N	2679	\N
10000	GENERIC_DAY	2	0	\N	2010-05-15	1121	\N	2679	\N
10007	GENERIC_DAY	2	0	\N	2010-06-05	1121	\N	2679	\N
10001	GENERIC_DAY	2	5	\N	2010-06-08	1121	\N	2679	\N
47022	GENERIC_DAY	2	5	\N	2010-09-23	1130	\N	39509	\N
47162	GENERIC_DAY	2	11	\N	2010-09-14	1126	\N	39509	\N
47058	GENERIC_DAY	2	10	\N	2010-06-30	1130	\N	39509	\N
47187	GENERIC_DAY	2	11	\N	2010-07-15	1128	\N	39509	\N
47019	GENERIC_DAY	2	0	\N	2010-08-22	1126	\N	39509	\N
47077	GENERIC_DAY	2	11	\N	2010-08-06	1126	\N	39509	\N
47508	GENERIC_DAY	2	0	\N	2010-09-12	14343	\N	39511	\N
47560	GENERIC_DAY	2	11	\N	2010-07-06	14345	\N	39511	\N
47356	GENERIC_DAY	2	10	\N	2010-07-12	26463	\N	39511	\N
47444	GENERIC_DAY	2	11	\N	2010-07-28	14345	\N	39511	\N
47502	GENERIC_DAY	2	10	\N	2010-08-18	26463	\N	39511	\N
47394	GENERIC_DAY	2	11	\N	2010-08-31	14345	\N	39511	\N
47466	GENERIC_DAY	2	11	\N	2010-07-29	14343	\N	39511	\N
47395	GENERIC_DAY	2	0	\N	2010-09-18	26463	\N	39511	\N
47536	GENERIC_DAY	2	11	\N	2010-08-30	14345	\N	39511	\N
47493	GENERIC_DAY	2	11	\N	2010-09-14	14345	\N	39511	\N
47365	GENERIC_DAY	2	0	\N	2010-08-28	26463	\N	39511	\N
47357	GENERIC_DAY	2	11	\N	2010-07-02	14345	\N	39511	\N
47521	GENERIC_DAY	2	10	\N	2010-09-13	26463	\N	39511	\N
47573	GENERIC_DAY	2	0	\N	2010-07-11	26463	\N	39511	\N
47367	GENERIC_DAY	2	10	\N	2010-07-01	26463	\N	39511	\N
47526	GENERIC_DAY	2	11	\N	2010-08-06	14345	\N	39511	\N
47407	GENERIC_DAY	2	10	\N	2010-08-20	26463	\N	39511	\N
47319	GENERIC_DAY	2	10	\N	2010-08-09	26463	\N	39511	\N
12913	SPECIFIC_DAY	0	0	\N	2010-09-12	1132	2715	\N	\N
12914	SPECIFIC_DAY	0	8	\N	2010-09-30	1132	2715	\N	\N
12915	SPECIFIC_DAY	0	8	\N	2010-09-17	1132	2715	\N	\N
12916	SPECIFIC_DAY	0	0	\N	2010-09-19	1132	2715	\N	\N
12917	SPECIFIC_DAY	0	8	\N	2010-09-24	1132	2715	\N	\N
12918	SPECIFIC_DAY	0	8	\N	2010-09-21	1132	2715	\N	\N
12919	SPECIFIC_DAY	0	8	\N	2010-09-16	1132	2715	\N	\N
12920	SPECIFIC_DAY	0	8	\N	2010-10-04	1132	2715	\N	\N
12921	SPECIFIC_DAY	0	8	\N	2010-10-05	1132	2715	\N	\N
12922	SPECIFIC_DAY	0	8	\N	2010-09-13	1132	2715	\N	\N
12923	SPECIFIC_DAY	0	0	\N	2010-09-11	1132	2715	\N	\N
12924	SPECIFIC_DAY	0	2	\N	2010-10-13	1134	2716	\N	\N
12925	SPECIFIC_DAY	0	8	\N	2010-10-06	1134	2716	\N	\N
12926	SPECIFIC_DAY	0	8	\N	2010-09-20	1134	2716	\N	\N
12927	SPECIFIC_DAY	0	0	\N	2010-10-09	1134	2716	\N	\N
12928	SPECIFIC_DAY	0	8	\N	2010-09-16	1134	2716	\N	\N
12929	SPECIFIC_DAY	0	8	\N	2010-10-01	1134	2716	\N	\N
12930	SPECIFIC_DAY	0	0	\N	2010-09-18	1134	2716	\N	\N
12931	SPECIFIC_DAY	0	8	\N	2010-09-23	1134	2716	\N	\N
12932	SPECIFIC_DAY	0	8	\N	2010-09-24	1134	2716	\N	\N
12933	SPECIFIC_DAY	0	8	\N	2010-10-11	1134	2716	\N	\N
12934	SPECIFIC_DAY	0	8	\N	2010-09-22	1134	2716	\N	\N
12935	SPECIFIC_DAY	0	8	\N	2010-10-07	1134	2716	\N	\N
12936	SPECIFIC_DAY	0	8	\N	2010-10-04	1134	2716	\N	\N
12937	SPECIFIC_DAY	0	0	\N	2010-10-12	1134	2716	\N	\N
12938	SPECIFIC_DAY	0	8	\N	2010-09-27	1134	2716	\N	\N
12939	SPECIFIC_DAY	0	0	\N	2010-09-12	1134	2716	\N	\N
12940	SPECIFIC_DAY	0	8	\N	2010-10-08	1134	2716	\N	\N
12941	SPECIFIC_DAY	0	8	\N	2010-09-13	1134	2716	\N	\N
12942	SPECIFIC_DAY	0	8	\N	2010-09-17	1134	2716	\N	\N
12943	SPECIFIC_DAY	0	0	\N	2010-10-03	1134	2716	\N	\N
12944	SPECIFIC_DAY	0	8	\N	2010-09-21	1134	2716	\N	\N
12945	SPECIFIC_DAY	0	8	\N	2010-09-14	1134	2716	\N	\N
12946	SPECIFIC_DAY	0	0	\N	2010-09-26	1134	2716	\N	\N
12947	SPECIFIC_DAY	0	8	\N	2010-09-15	1134	2716	\N	\N
12948	SPECIFIC_DAY	0	0	\N	2010-09-25	1134	2716	\N	\N
12949	SPECIFIC_DAY	0	8	\N	2010-09-28	1134	2716	\N	\N
12950	SPECIFIC_DAY	0	0	\N	2010-09-19	1134	2716	\N	\N
12951	SPECIFIC_DAY	0	8	\N	2010-10-05	1134	2716	\N	\N
12952	SPECIFIC_DAY	0	8	\N	2010-09-30	1134	2716	\N	\N
12953	SPECIFIC_DAY	0	8	\N	2010-09-29	1134	2716	\N	\N
12954	SPECIFIC_DAY	0	0	\N	2010-09-11	1134	2716	\N	\N
12955	SPECIFIC_DAY	0	0	\N	2010-10-02	1134	2716	\N	\N
12956	SPECIFIC_DAY	0	0	\N	2010-10-10	1134	2716	\N	\N
12957	GENERIC_DAY	0	0	\N	2010-08-08	1121	\N	2717	\N
12958	GENERIC_DAY	0	3	\N	2010-08-10	1121	\N	2717	\N
12959	GENERIC_DAY	0	0	\N	2010-08-07	1123	\N	2717	\N
12960	GENERIC_DAY	0	3	\N	2010-08-10	1119	\N	2717	\N
12961	GENERIC_DAY	0	0	\N	2010-08-07	1121	\N	2717	\N
12962	GENERIC_DAY	0	0	\N	2010-08-08	1123	\N	2717	\N
12963	GENERIC_DAY	0	3	\N	2010-08-06	1121	\N	2717	\N
12964	GENERIC_DAY	0	2	\N	2010-08-10	1123	\N	2717	\N
12965	GENERIC_DAY	0	0	\N	2010-08-07	1119	\N	2717	\N
12966	GENERIC_DAY	0	2	\N	2010-08-06	1123	\N	2717	\N
12967	GENERIC_DAY	0	0	\N	2010-08-08	1119	\N	2717	\N
12968	GENERIC_DAY	0	3	\N	2010-08-09	1121	\N	2717	\N
12969	GENERIC_DAY	0	3	\N	2010-08-06	1119	\N	2717	\N
12970	GENERIC_DAY	0	2	\N	2010-08-09	1123	\N	2717	\N
12971	GENERIC_DAY	0	3	\N	2010-08-09	1119	\N	2717	\N
12972	GENERIC_DAY	0	3	\N	2010-09-01	1128	\N	2718	\N
12973	GENERIC_DAY	0	1	\N	2010-09-10	1128	\N	2718	\N
12974	GENERIC_DAY	0	1	\N	2010-09-10	1130	\N	2718	\N
12975	GENERIC_DAY	0	2	\N	2010-09-09	1130	\N	2718	\N
12976	GENERIC_DAY	0	3	\N	2010-09-08	1126	\N	2718	\N
12977	GENERIC_DAY	0	3	\N	2010-08-30	1126	\N	2718	\N
12978	GENERIC_DAY	0	2	\N	2010-09-06	1130	\N	2718	\N
12979	GENERIC_DAY	0	3	\N	2010-08-26	1126	\N	2718	\N
12980	GENERIC_DAY	0	0	\N	2010-09-05	1128	\N	2718	\N
12981	GENERIC_DAY	0	3	\N	2010-08-27	1128	\N	2718	\N
12982	GENERIC_DAY	0	3	\N	2010-09-09	1126	\N	2718	\N
12983	GENERIC_DAY	0	0	\N	2010-09-05	1126	\N	2718	\N
12984	GENERIC_DAY	0	0	\N	2010-08-28	1128	\N	2718	\N
12985	GENERIC_DAY	0	0	\N	2010-08-29	1128	\N	2718	\N
12986	GENERIC_DAY	0	3	\N	2010-09-03	1128	\N	2718	\N
12987	GENERIC_DAY	0	2	\N	2010-09-03	1130	\N	2718	\N
12988	GENERIC_DAY	0	2	\N	2010-08-26	1130	\N	2718	\N
12989	GENERIC_DAY	0	3	\N	2010-08-25	1128	\N	2718	\N
12990	GENERIC_DAY	0	2	\N	2010-09-10	1126	\N	2718	\N
12991	GENERIC_DAY	0	3	\N	2010-08-31	1128	\N	2718	\N
12992	GENERIC_DAY	0	2	\N	2010-08-25	1130	\N	2718	\N
12993	GENERIC_DAY	0	0	\N	2010-08-28	1130	\N	2718	\N
12994	GENERIC_DAY	0	3	\N	2010-09-09	1128	\N	2718	\N
12995	GENERIC_DAY	0	3	\N	2010-09-07	1126	\N	2718	\N
12996	GENERIC_DAY	0	3	\N	2010-09-02	1126	\N	2718	\N
12997	GENERIC_DAY	0	0	\N	2010-09-05	1130	\N	2718	\N
12998	GENERIC_DAY	0	3	\N	2010-09-01	1126	\N	2718	\N
12999	GENERIC_DAY	0	3	\N	2010-08-25	1126	\N	2718	\N
13000	GENERIC_DAY	0	3	\N	2010-09-06	1126	\N	2718	\N
13001	GENERIC_DAY	0	0	\N	2010-09-04	1128	\N	2718	\N
13002	GENERIC_DAY	0	3	\N	2010-08-31	1126	\N	2718	\N
13003	GENERIC_DAY	0	0	\N	2010-09-04	1126	\N	2718	\N
13004	GENERIC_DAY	0	2	\N	2010-08-30	1130	\N	2718	\N
13005	GENERIC_DAY	0	3	\N	2010-09-06	1128	\N	2718	\N
13006	GENERIC_DAY	0	0	\N	2010-08-28	1126	\N	2718	\N
13007	GENERIC_DAY	0	2	\N	2010-08-31	1130	\N	2718	\N
13008	GENERIC_DAY	0	0	\N	2010-08-29	1130	\N	2718	\N
13009	GENERIC_DAY	0	3	\N	2010-08-26	1128	\N	2718	\N
13010	GENERIC_DAY	0	2	\N	2010-08-27	1130	\N	2718	\N
13011	GENERIC_DAY	0	2	\N	2010-09-01	1130	\N	2718	\N
13012	GENERIC_DAY	0	3	\N	2010-08-30	1128	\N	2718	\N
13013	GENERIC_DAY	0	0	\N	2010-09-04	1130	\N	2718	\N
13014	GENERIC_DAY	0	3	\N	2010-09-08	1128	\N	2718	\N
13015	GENERIC_DAY	0	3	\N	2010-08-27	1126	\N	2718	\N
13016	GENERIC_DAY	0	2	\N	2010-09-08	1130	\N	2718	\N
13017	GENERIC_DAY	0	3	\N	2010-09-03	1126	\N	2718	\N
13018	GENERIC_DAY	0	3	\N	2010-09-02	1128	\N	2718	\N
13019	GENERIC_DAY	0	2	\N	2010-09-07	1130	\N	2718	\N
13020	GENERIC_DAY	0	2	\N	2010-09-02	1130	\N	2718	\N
13021	GENERIC_DAY	0	0	\N	2010-08-29	1126	\N	2718	\N
13022	GENERIC_DAY	0	3	\N	2010-09-07	1128	\N	2718	\N
13023	GENERIC_DAY	0	4	\N	2010-10-25	1119	\N	2719	\N
13024	GENERIC_DAY	0	8	\N	2010-10-22	1119	\N	2719	\N
13025	GENERIC_DAY	0	0	\N	2010-10-17	1119	\N	2719	\N
13026	GENERIC_DAY	0	8	\N	2010-10-15	1119	\N	2719	\N
13027	GENERIC_DAY	0	8	\N	2010-10-20	1119	\N	2719	\N
13028	GENERIC_DAY	0	0	\N	2010-10-16	1119	\N	2719	\N
13029	GENERIC_DAY	0	0	\N	2010-10-23	1119	\N	2719	\N
13030	GENERIC_DAY	0	0	\N	2010-10-24	1119	\N	2719	\N
13031	GENERIC_DAY	0	8	\N	2010-10-19	1119	\N	2719	\N
13032	GENERIC_DAY	0	8	\N	2010-10-18	1119	\N	2719	\N
13033	GENERIC_DAY	0	8	\N	2010-10-14	1119	\N	2719	\N
13034	GENERIC_DAY	0	8	\N	2010-10-21	1119	\N	2719	\N
13035	GENERIC_DAY	0	0	\N	2010-08-15	1121	\N	2720	\N
13036	GENERIC_DAY	0	0	\N	2010-08-14	1121	\N	2720	\N
13037	GENERIC_DAY	0	2	\N	2010-08-16	1123	\N	2720	\N
13038	GENERIC_DAY	0	0	\N	2010-08-14	1123	\N	2720	\N
13039	GENERIC_DAY	0	0	\N	2010-08-15	1119	\N	2720	\N
13040	GENERIC_DAY	0	3	\N	2010-08-12	1119	\N	2720	\N
13041	GENERIC_DAY	0	2	\N	2010-08-11	1123	\N	2720	\N
13042	GENERIC_DAY	0	3	\N	2010-08-13	1121	\N	2720	\N
13043	GENERIC_DAY	0	3	\N	2010-08-11	1121	\N	2720	\N
13044	GENERIC_DAY	0	3	\N	2010-08-12	1121	\N	2720	\N
13045	GENERIC_DAY	0	3	\N	2010-08-16	1121	\N	2720	\N
13046	GENERIC_DAY	0	0	\N	2010-08-15	1123	\N	2720	\N
13047	GENERIC_DAY	0	3	\N	2010-08-11	1119	\N	2720	\N
13048	GENERIC_DAY	0	3	\N	2010-08-13	1119	\N	2720	\N
13049	GENERIC_DAY	0	3	\N	2010-08-16	1119	\N	2720	\N
13050	GENERIC_DAY	0	0	\N	2010-08-14	1119	\N	2720	\N
13051	GENERIC_DAY	0	2	\N	2010-08-13	1123	\N	2720	\N
13052	GENERIC_DAY	0	3	\N	2010-08-17	1119	\N	2720	\N
13053	GENERIC_DAY	0	2	\N	2010-08-17	1123	\N	2720	\N
13054	GENERIC_DAY	0	3	\N	2010-08-17	1121	\N	2720	\N
13055	GENERIC_DAY	0	2	\N	2010-08-12	1123	\N	2720	\N
13056	GENERIC_DAY	0	3	\N	2010-08-24	1128	\N	2721	\N
13057	GENERIC_DAY	0	3	\N	2010-08-20	1128	\N	2721	\N
13058	GENERIC_DAY	0	3	\N	2010-08-20	1126	\N	2721	\N
13059	GENERIC_DAY	0	3	\N	2010-08-18	1128	\N	2721	\N
13060	GENERIC_DAY	0	0	\N	2010-08-21	1130	\N	2721	\N
13061	GENERIC_DAY	0	2	\N	2010-08-23	1130	\N	2721	\N
13062	GENERIC_DAY	0	2	\N	2010-08-20	1130	\N	2721	\N
13063	GENERIC_DAY	0	0	\N	2010-08-22	1130	\N	2721	\N
13064	GENERIC_DAY	0	0	\N	2010-08-21	1126	\N	2721	\N
13065	GENERIC_DAY	0	0	\N	2010-08-22	1126	\N	2721	\N
13066	GENERIC_DAY	0	3	\N	2010-08-18	1126	\N	2721	\N
13067	GENERIC_DAY	0	3	\N	2010-08-19	1128	\N	2721	\N
13068	GENERIC_DAY	0	2	\N	2010-08-24	1130	\N	2721	\N
13069	GENERIC_DAY	0	3	\N	2010-08-23	1126	\N	2721	\N
13070	GENERIC_DAY	0	2	\N	2010-08-19	1130	\N	2721	\N
13071	GENERIC_DAY	0	0	\N	2010-08-21	1128	\N	2721	\N
13072	GENERIC_DAY	0	3	\N	2010-08-19	1126	\N	2721	\N
13073	GENERIC_DAY	0	3	\N	2010-08-24	1126	\N	2721	\N
13074	GENERIC_DAY	0	2	\N	2010-08-18	1130	\N	2721	\N
13075	GENERIC_DAY	0	3	\N	2010-08-23	1128	\N	2721	\N
13076	GENERIC_DAY	0	0	\N	2010-08-22	1128	\N	2721	\N
47335	GENERIC_DAY	2	0	\N	2010-07-03	14345	\N	39511	\N
47472	GENERIC_DAY	2	11	\N	2010-09-16	14345	\N	39511	\N
47561	GENERIC_DAY	2	0	\N	2010-07-04	14343	\N	39511	\N
47548	GENERIC_DAY	2	11	\N	2010-07-27	14345	\N	39511	\N
47441	GENERIC_DAY	2	0	\N	2010-07-31	14345	\N	39511	\N
47375	GENERIC_DAY	2	0	\N	2010-08-28	14343	\N	39511	\N
47396	GENERIC_DAY	2	11	\N	2010-08-02	14345	\N	39511	\N
47492	GENERIC_DAY	2	10	\N	2010-08-11	26463	\N	39511	\N
47510	GENERIC_DAY	2	11	\N	2010-09-01	14343	\N	39511	\N
47501	GENERIC_DAY	2	11	\N	2010-08-05	14345	\N	39511	\N
47415	GENERIC_DAY	2	10	\N	2010-09-03	26463	\N	39511	\N
47439	GENERIC_DAY	2	0	\N	2010-08-21	14345	\N	39511	\N
47531	GENERIC_DAY	2	0	\N	2010-07-24	14343	\N	39511	\N
47369	GENERIC_DAY	2	0	\N	2010-07-31	14343	\N	39511	\N
47397	GENERIC_DAY	2	0	\N	2010-07-10	14345	\N	39511	\N
47467	GENERIC_DAY	2	11	\N	2010-08-18	14343	\N	39511	\N
47428	GENERIC_DAY	2	11	\N	2010-07-28	14343	\N	39511	\N
47542	GENERIC_DAY	2	10	\N	2010-09-14	26463	\N	39511	\N
47511	GENERIC_DAY	2	10	\N	2010-06-30	26463	\N	39511	\N
47419	GENERIC_DAY	2	11	\N	2010-09-20	14345	\N	39511	\N
47475	GENERIC_DAY	2	10	\N	2010-07-27	26463	\N	39511	\N
47505	GENERIC_DAY	2	0	\N	2010-09-05	14345	\N	39511	\N
47363	GENERIC_DAY	2	10	\N	2010-09-09	26463	\N	39511	\N
47535	GENERIC_DAY	2	10	\N	2010-09-10	26463	\N	39511	\N
47352	GENERIC_DAY	2	0	\N	2010-07-11	14345	\N	39511	\N
47509	GENERIC_DAY	2	10	\N	2010-09-22	26463	\N	39511	\N
47518	GENERIC_DAY	2	0	\N	2010-07-04	14345	\N	39511	\N
47339	GENERIC_DAY	2	10	\N	2010-07-15	26463	\N	39511	\N
47346	GENERIC_DAY	2	6	\N	2010-09-23	14343	\N	39511	\N
47541	GENERIC_DAY	2	0	\N	2010-08-01	14345	\N	39511	\N
47382	GENERIC_DAY	2	11	\N	2010-09-14	14343	\N	39511	\N
47343	GENERIC_DAY	2	11	\N	2010-07-23	14345	\N	39511	\N
47414	GENERIC_DAY	2	11	\N	2010-09-09	14343	\N	39511	\N
47418	GENERIC_DAY	2	10	\N	2010-08-25	26463	\N	39511	\N
47341	GENERIC_DAY	2	0	\N	2010-07-24	14345	\N	39511	\N
47522	GENERIC_DAY	2	11	\N	2010-08-17	14345	\N	39511	\N
47323	GENERIC_DAY	2	11	\N	2010-08-19	14345	\N	39511	\N
47406	GENERIC_DAY	2	10	\N	2010-08-31	26463	\N	39511	\N
47329	GENERIC_DAY	2	0	\N	2010-07-18	14345	\N	39511	\N
47452	GENERIC_DAY	2	11	\N	2010-08-10	14345	\N	39511	\N
47566	GENERIC_DAY	2	10	\N	2010-08-23	26463	\N	39511	\N
47491	GENERIC_DAY	2	0	\N	2010-08-08	26463	\N	39511	\N
47558	GENERIC_DAY	2	0	\N	2010-09-19	26463	\N	39511	\N
47539	GENERIC_DAY	2	0	\N	2010-07-31	26463	\N	39511	\N
47424	GENERIC_DAY	2	10	\N	2010-06-29	26463	\N	39511	\N
47477	GENERIC_DAY	2	11	\N	2010-07-08	14345	\N	39511	\N
47366	GENERIC_DAY	2	11	\N	2010-07-01	14343	\N	39511	\N
47556	GENERIC_DAY	2	11	\N	2010-08-26	14345	\N	39511	\N
47495	GENERIC_DAY	2	11	\N	2010-08-03	14343	\N	39511	\N
47351	GENERIC_DAY	2	11	\N	2010-07-05	14345	\N	39511	\N
47440	GENERIC_DAY	2	11	\N	2010-08-30	14343	\N	39511	\N
47355	GENERIC_DAY	2	0	\N	2010-07-24	26463	\N	39511	\N
47516	GENERIC_DAY	2	11	\N	2010-09-02	14343	\N	39511	\N
47411	GENERIC_DAY	2	11	\N	2010-08-27	14343	\N	39511	\N
47464	GENERIC_DAY	2	10	\N	2010-08-30	26463	\N	39511	\N
47520	GENERIC_DAY	2	10	\N	2010-07-05	26463	\N	39511	\N
47463	GENERIC_DAY	2	11	\N	2010-09-09	14345	\N	39511	\N
47499	GENERIC_DAY	2	11	\N	2010-06-30	14345	\N	39511	\N
47408	GENERIC_DAY	2	0	\N	2010-08-07	14343	\N	39511	\N
47562	GENERIC_DAY	2	0	\N	2010-09-04	14343	\N	39511	\N
47398	GENERIC_DAY	2	10	\N	2010-08-04	26463	\N	39511	\N
47315	GENERIC_DAY	2	11	\N	2010-08-11	14343	\N	39511	\N
47374	GENERIC_DAY	2	10	\N	2010-07-06	26463	\N	39511	\N
47401	GENERIC_DAY	2	0	\N	2010-08-01	14343	\N	39511	\N
47361	GENERIC_DAY	2	11	\N	2010-07-09	14343	\N	39511	\N
47571	GENERIC_DAY	2	11	\N	2010-07-07	14343	\N	39511	\N
47325	GENERIC_DAY	2	11	\N	2010-07-02	14343	\N	39511	\N
47376	GENERIC_DAY	2	11	\N	2010-07-13	14345	\N	39511	\N
47514	GENERIC_DAY	2	11	\N	2010-08-20	14343	\N	39511	\N
47559	GENERIC_DAY	2	11	\N	2010-07-16	14343	\N	39511	\N
47344	GENERIC_DAY	2	0	\N	2010-09-19	14343	\N	39511	\N
47427	GENERIC_DAY	2	0	\N	2010-07-17	26463	\N	39511	\N
47543	GENERIC_DAY	2	10	\N	2010-09-21	26463	\N	39511	\N
47353	GENERIC_DAY	2	10	\N	2010-07-20	26463	\N	39511	\N
47400	GENERIC_DAY	2	10	\N	2010-07-09	26463	\N	39511	\N
47433	GENERIC_DAY	2	11	\N	2010-08-24	14345	\N	39511	\N
47504	GENERIC_DAY	2	0	\N	2010-08-28	14345	\N	39511	\N
47330	GENERIC_DAY	2	10	\N	2010-09-17	26463	\N	39511	\N
47481	GENERIC_DAY	2	11	\N	2010-08-06	14343	\N	39511	\N
47485	GENERIC_DAY	2	11	\N	2010-09-07	14345	\N	39511	\N
47360	GENERIC_DAY	2	0	\N	2010-08-15	14345	\N	39511	\N
47384	GENERIC_DAY	2	11	\N	2010-08-13	14343	\N	39511	\N
47318	GENERIC_DAY	2	11	\N	2010-09-10	14345	\N	39511	\N
47423	GENERIC_DAY	2	10	\N	2010-07-19	26463	\N	39511	\N
47320	GENERIC_DAY	2	11	\N	2010-07-16	14345	\N	39511	\N
47487	GENERIC_DAY	2	11	\N	2010-08-09	14343	\N	39511	\N
47340	GENERIC_DAY	2	10	\N	2010-08-03	26463	\N	39511	\N
47373	GENERIC_DAY	2	0	\N	2010-08-14	14343	\N	39511	\N
47474	GENERIC_DAY	2	11	\N	2010-08-23	14345	\N	39511	\N
47387	GENERIC_DAY	2	10	\N	2010-08-06	26463	\N	39511	\N
47519	GENERIC_DAY	2	10	\N	2010-09-16	26463	\N	39511	\N
47451	GENERIC_DAY	2	10	\N	2010-09-20	26463	\N	39511	\N
47377	GENERIC_DAY	2	0	\N	2010-09-12	14345	\N	39511	\N
47555	GENERIC_DAY	2	11	\N	2010-07-20	14345	\N	39511	\N
47553	GENERIC_DAY	2	10	\N	2010-07-21	26463	\N	39511	\N
47469	GENERIC_DAY	2	10	\N	2010-08-27	26463	\N	39511	\N
47554	GENERIC_DAY	2	11	\N	2010-08-09	14345	\N	39511	\N
47529	GENERIC_DAY	2	11	\N	2010-08-25	14343	\N	39511	\N
47370	GENERIC_DAY	2	0	\N	2010-09-18	14345	\N	39511	\N
47498	GENERIC_DAY	2	10	\N	2010-09-15	26463	\N	39511	\N
47350	GENERIC_DAY	2	10	\N	2010-07-26	26463	\N	39511	\N
47405	GENERIC_DAY	2	5	\N	2010-09-23	26463	\N	39511	\N
47412	GENERIC_DAY	2	0	\N	2010-09-04	26463	\N	39511	\N
47483	GENERIC_DAY	2	11	\N	2010-09-20	14343	\N	39511	\N
47470	GENERIC_DAY	2	11	\N	2010-08-19	14343	\N	39511	\N
47347	GENERIC_DAY	2	0	\N	2010-08-07	26463	\N	39511	\N
47480	GENERIC_DAY	2	10	\N	2010-07-13	26463	\N	39511	\N
47494	GENERIC_DAY	2	11	\N	2010-09-17	14343	\N	39511	\N
47549	GENERIC_DAY	2	11	\N	2010-09-10	14343	\N	39511	\N
47523	GENERIC_DAY	2	11	\N	2010-08-13	14345	\N	39511	\N
47513	GENERIC_DAY	2	0	\N	2010-07-03	26463	\N	39511	\N
47378	GENERIC_DAY	2	10	\N	2010-07-23	26463	\N	39511	\N
47402	GENERIC_DAY	2	11	\N	2010-09-03	14345	\N	39511	\N
47364	GENERIC_DAY	2	0	\N	2010-07-25	26463	\N	39511	\N
47443	GENERIC_DAY	2	11	\N	2010-09-08	14345	\N	39511	\N
47453	GENERIC_DAY	2	10	\N	2010-08-24	26463	\N	39511	\N
47404	GENERIC_DAY	2	11	\N	2010-08-02	14343	\N	39511	\N
47416	GENERIC_DAY	2	11	\N	2010-09-22	14343	\N	39511	\N
47552	GENERIC_DAY	2	0	\N	2010-09-11	14345	\N	39511	\N
47471	GENERIC_DAY	2	11	\N	2010-08-23	14343	\N	39511	\N
47567	GENERIC_DAY	2	5	\N	2010-09-23	14345	\N	39511	\N
47517	GENERIC_DAY	2	10	\N	2010-09-06	26463	\N	39511	\N
47442	GENERIC_DAY	2	0	\N	2010-07-10	26463	\N	39511	\N
47528	GENERIC_DAY	2	11	\N	2010-07-21	14345	\N	39511	\N
47538	GENERIC_DAY	2	0	\N	2010-08-22	14345	\N	39511	\N
47390	GENERIC_DAY	2	0	\N	2010-07-04	26463	\N	39511	\N
47391	GENERIC_DAY	2	11	\N	2010-08-25	14345	\N	39511	\N
47409	GENERIC_DAY	2	11	\N	2010-09-01	14345	\N	39511	\N
47322	GENERIC_DAY	2	10	\N	2010-07-30	26463	\N	39511	\N
47447	GENERIC_DAY	2	11	\N	2010-07-22	14343	\N	39511	\N
47328	GENERIC_DAY	2	11	\N	2010-07-05	14343	\N	39511	\N
47445	GENERIC_DAY	2	11	\N	2010-08-10	14343	\N	39511	\N
47478	GENERIC_DAY	2	10	\N	2010-08-10	26463	\N	39511	\N
47465	GENERIC_DAY	2	11	\N	2010-08-20	14345	\N	39511	\N
47359	GENERIC_DAY	2	0	\N	2010-07-17	14343	\N	39511	\N
47482	GENERIC_DAY	2	11	\N	2010-07-29	14345	\N	39511	\N
47546	GENERIC_DAY	2	11	\N	2010-08-26	14343	\N	39511	\N
47479	GENERIC_DAY	2	0	\N	2010-08-29	26463	\N	39511	\N
47507	GENERIC_DAY	2	10	\N	2010-08-17	26463	\N	39511	\N
47488	GENERIC_DAY	2	11	\N	2010-08-24	14343	\N	39511	\N
47458	GENERIC_DAY	2	11	\N	2010-07-12	14343	\N	39511	\N
47462	GENERIC_DAY	2	0	\N	2010-07-18	26463	\N	39511	\N
47551	GENERIC_DAY	2	11	\N	2010-08-27	14345	\N	39511	\N
47533	GENERIC_DAY	2	11	\N	2010-07-09	14345	\N	39511	\N
47314	GENERIC_DAY	2	0	\N	2010-09-12	26463	\N	39511	\N
47455	GENERIC_DAY	2	11	\N	2010-07-14	14343	\N	39511	\N
47381	GENERIC_DAY	2	11	\N	2010-08-18	14345	\N	39511	\N
47568	GENERIC_DAY	2	10	\N	2010-07-16	26463	\N	39511	\N
47392	GENERIC_DAY	2	10	\N	2010-08-12	26463	\N	39511	\N
47420	GENERIC_DAY	2	11	\N	2010-08-04	14343	\N	39511	\N
47362	GENERIC_DAY	2	10	\N	2010-09-01	26463	\N	39511	\N
47425	GENERIC_DAY	2	10	\N	2010-08-19	26463	\N	39511	\N
47316	GENERIC_DAY	2	11	\N	2010-09-02	14345	\N	39511	\N
47446	GENERIC_DAY	2	11	\N	2010-07-14	14345	\N	39511	\N
47456	GENERIC_DAY	2	0	\N	2010-07-17	14345	\N	39511	\N
47557	GENERIC_DAY	2	11	\N	2010-09-13	14343	\N	39511	\N
47450	GENERIC_DAY	2	11	\N	2010-07-07	14345	\N	39511	\N
47547	GENERIC_DAY	2	11	\N	2010-09-21	14343	\N	39511	\N
47372	GENERIC_DAY	2	11	\N	2010-07-30	14345	\N	39511	\N
47386	GENERIC_DAY	2	11	\N	2010-07-30	14343	\N	39511	\N
47393	GENERIC_DAY	2	11	\N	2010-09-21	14345	\N	39511	\N
47527	GENERIC_DAY	2	11	\N	2010-09-03	14343	\N	39511	\N
47385	GENERIC_DAY	2	11	\N	2010-09-22	14345	\N	39511	\N
47496	GENERIC_DAY	2	0	\N	2010-08-01	26463	\N	39511	\N
47348	GENERIC_DAY	2	11	\N	2010-08-12	14345	\N	39511	\N
47550	GENERIC_DAY	2	11	\N	2010-09-07	14343	\N	39511	\N
47368	GENERIC_DAY	2	0	\N	2010-07-03	14343	\N	39511	\N
47331	GENERIC_DAY	2	11	\N	2010-07-21	14343	\N	39511	\N
47460	GENERIC_DAY	2	0	\N	2010-09-11	14343	\N	39511	\N
47399	GENERIC_DAY	2	11	\N	2010-09-15	14345	\N	39511	\N
47537	GENERIC_DAY	2	10	\N	2010-07-08	26463	\N	39511	\N
47417	GENERIC_DAY	2	11	\N	2010-07-12	14345	\N	39511	\N
47570	GENERIC_DAY	2	0	\N	2010-09-19	14345	\N	39511	\N
47413	GENERIC_DAY	2	11	\N	2010-07-06	14343	\N	39511	\N
47572	GENERIC_DAY	2	0	\N	2010-09-18	14343	\N	39511	\N
47429	GENERIC_DAY	2	11	\N	2010-08-16	14345	\N	39511	\N
47448	GENERIC_DAY	2	10	\N	2010-08-05	26463	\N	39511	\N
47486	GENERIC_DAY	2	11	\N	2010-09-15	14343	\N	39511	\N
47410	GENERIC_DAY	2	0	\N	2010-08-29	14343	\N	39511	\N
47388	GENERIC_DAY	2	0	\N	2010-08-21	14343	\N	39511	\N
47473	GENERIC_DAY	2	11	\N	2010-07-22	14345	\N	39511	\N
47432	GENERIC_DAY	2	0	\N	2010-08-15	14343	\N	39511	\N
47379	GENERIC_DAY	2	10	\N	2010-07-22	26463	\N	39511	\N
47468	GENERIC_DAY	2	0	\N	2010-09-04	14345	\N	39511	\N
47380	GENERIC_DAY	2	11	\N	2010-08-03	14345	\N	39511	\N
47332	GENERIC_DAY	2	11	\N	2010-07-01	14345	\N	39511	\N
47324	GENERIC_DAY	2	11	\N	2010-07-13	14343	\N	39511	\N
47532	GENERIC_DAY	2	0	\N	2010-09-05	14343	\N	39511	\N
47354	GENERIC_DAY	2	11	\N	2010-08-12	14343	\N	39511	\N
47565	GENERIC_DAY	2	10	\N	2010-07-07	26463	\N	39511	\N
47438	GENERIC_DAY	2	0	\N	2010-07-25	14343	\N	39511	\N
47383	GENERIC_DAY	2	0	\N	2010-08-22	14343	\N	39511	\N
47506	GENERIC_DAY	2	11	\N	2010-07-19	14343	\N	39511	\N
47545	GENERIC_DAY	2	0	\N	2010-09-11	26463	\N	39511	\N
47574	GENERIC_DAY	2	0	\N	2010-07-10	14343	\N	39511	\N
47430	GENERIC_DAY	2	0	\N	2010-07-18	14343	\N	39511	\N
47524	GENERIC_DAY	2	10	\N	2010-08-02	26463	\N	39511	\N
47484	GENERIC_DAY	2	11	\N	2010-07-23	14343	\N	39511	\N
47500	GENERIC_DAY	2	0	\N	2010-08-22	26463	\N	39511	\N
47437	GENERIC_DAY	2	11	\N	2010-07-26	14343	\N	39511	\N
47459	GENERIC_DAY	2	11	\N	2010-08-16	14343	\N	39511	\N
47434	GENERIC_DAY	2	11	\N	2010-07-27	14343	\N	39511	\N
47431	GENERIC_DAY	2	0	\N	2010-08-08	14345	\N	39511	\N
47515	GENERIC_DAY	2	10	\N	2010-08-26	26463	\N	39511	\N
10023	GENERIC_DAY	2	0	\N	2010-06-13	1121	\N	2679	\N
10077	GENERIC_DAY	2	6	\N	2010-05-10	1119	\N	2679	\N
10097	GENERIC_DAY	2	5	\N	2010-05-07	1123	\N	2679	\N
10036	GENERIC_DAY	2	5	\N	2010-05-06	1123	\N	2679	\N
10064	GENERIC_DAY	2	5	\N	2010-05-11	1121	\N	2679	\N
10110	GENERIC_DAY	2	1	\N	2010-06-14	1119	\N	2679	\N
10079	GENERIC_DAY	2	0	\N	2010-06-06	1123	\N	2679	\N
10105	GENERIC_DAY	2	5	\N	2010-06-08	1123	\N	2679	\N
10095	GENERIC_DAY	2	5	\N	2010-05-10	1123	\N	2679	\N
10099	GENERIC_DAY	2	5	\N	2010-05-31	1121	\N	2679	\N
10065	GENERIC_DAY	2	6	\N	2010-06-09	1119	\N	2679	\N
10032	GENERIC_DAY	2	5	\N	2010-06-04	1123	\N	2679	\N
10107	GENERIC_DAY	2	0	\N	2010-06-06	1119	\N	2679	\N
10010	GENERIC_DAY	2	5	\N	2010-05-18	1121	\N	2679	\N
10082	GENERIC_DAY	2	0	\N	2010-05-16	1123	\N	2679	\N
10033	GENERIC_DAY	2	5	\N	2010-06-10	1121	\N	2679	\N
10086	GENERIC_DAY	2	0	\N	2010-06-05	1119	\N	2679	\N
10021	GENERIC_DAY	2	5	\N	2010-05-21	1123	\N	2679	\N
10080	GENERIC_DAY	2	6	\N	2010-05-14	1119	\N	2679	\N
10070	GENERIC_DAY	2	6	\N	2010-06-02	1119	\N	2679	\N
10074	GENERIC_DAY	2	0	\N	2010-05-08	1119	\N	2679	\N
10104	GENERIC_DAY	2	0	\N	2010-05-22	1123	\N	2679	\N
10059	GENERIC_DAY	2	6	\N	2010-05-06	1119	\N	2679	\N
10020	GENERIC_DAY	2	0	\N	2010-05-30	1121	\N	2679	\N
10108	GENERIC_DAY	2	0	\N	2010-05-23	1123	\N	2679	\N
10037	GENERIC_DAY	2	5	\N	2010-05-12	1121	\N	2679	\N
10013	GENERIC_DAY	2	5	\N	2010-06-11	1121	\N	2679	\N
10083	GENERIC_DAY	2	5	\N	2010-05-26	1123	\N	2679	\N
10048	GENERIC_DAY	2	5	\N	2010-05-11	1123	\N	2679	\N
10112	GENERIC_DAY	2	0	\N	2010-06-06	1121	\N	2679	\N
10038	GENERIC_DAY	2	0	\N	2010-05-09	1123	\N	2679	\N
10094	GENERIC_DAY	2	0	\N	2010-06-13	1119	\N	2679	\N
10061	GENERIC_DAY	2	5	\N	2010-05-10	1121	\N	2679	\N
10098	GENERIC_DAY	2	0	\N	2010-05-15	1123	\N	2679	\N
10014	GENERIC_DAY	2	0	\N	2010-05-30	1123	\N	2679	\N
10087	GENERIC_DAY	2	0	\N	2010-05-22	1119	\N	2679	\N
10009	GENERIC_DAY	2	0	\N	2010-05-08	1123	\N	2679	\N
10063	GENERIC_DAY	2	5	\N	2010-06-03	1123	\N	2679	\N
10071	GENERIC_DAY	2	5	\N	2010-05-05	1121	\N	2679	\N
10047	GENERIC_DAY	2	1	\N	2010-06-14	1121	\N	2679	\N
10041	GENERIC_DAY	2	5	\N	2010-05-27	1121	\N	2679	\N
10069	GENERIC_DAY	2	0	\N	2010-05-09	1119	\N	2679	\N
10018	GENERIC_DAY	2	5	\N	2010-06-09	1123	\N	2679	\N
10113	GENERIC_DAY	2	5	\N	2010-05-24	1121	\N	2679	\N
10034	GENERIC_DAY	2	6	\N	2010-06-07	1119	\N	2679	\N
10100	GENERIC_DAY	2	5	\N	2010-05-05	1123	\N	2679	\N
10092	GENERIC_DAY	2	0	\N	2010-05-29	1119	\N	2679	\N
10073	GENERIC_DAY	2	5	\N	2010-05-13	1123	\N	2679	\N
10084	GENERIC_DAY	2	6	\N	2010-05-31	1119	\N	2679	\N
10076	GENERIC_DAY	2	0	\N	2010-05-16	1119	\N	2679	\N
10024	GENERIC_DAY	2	5	\N	2010-05-28	1121	\N	2679	\N
10043	GENERIC_DAY	2	6	\N	2010-05-13	1119	\N	2679	\N
10012	GENERIC_DAY	2	0	\N	2010-05-15	1119	\N	2679	\N
10058	GENERIC_DAY	2	5	\N	2010-06-03	1121	\N	2679	\N
10093	GENERIC_DAY	2	5	\N	2010-06-01	1123	\N	2679	\N
10016	GENERIC_DAY	2	0	\N	2010-05-29	1121	\N	2679	\N
10055	GENERIC_DAY	2	5	\N	2010-05-19	1121	\N	2679	\N
10115	GENERIC_DAY	2	5	\N	2010-06-07	1121	\N	2679	\N
10111	GENERIC_DAY	2	5	\N	2010-05-28	1123	\N	2679	\N
10057	GENERIC_DAY	2	5	\N	2010-06-11	1123	\N	2679	\N
10089	GENERIC_DAY	2	6	\N	2010-05-24	1119	\N	2679	\N
10054	GENERIC_DAY	2	6	\N	2010-06-11	1119	\N	2679	\N
10091	GENERIC_DAY	2	0	\N	2010-05-08	1121	\N	2679	\N
10044	GENERIC_DAY	2	5	\N	2010-06-01	1121	\N	2679	\N
10040	GENERIC_DAY	2	0	\N	2010-06-12	1123	\N	2679	\N
10049	GENERIC_DAY	2	6	\N	2010-06-08	1119	\N	2679	\N
10039	GENERIC_DAY	2	0	\N	2010-05-23	1121	\N	2679	\N
10026	GENERIC_DAY	2	6	\N	2010-06-04	1119	\N	2679	\N
10101	GENERIC_DAY	2	0	\N	2010-05-16	1121	\N	2679	\N
10035	GENERIC_DAY	2	5	\N	2010-05-26	1121	\N	2679	\N
10078	GENERIC_DAY	2	5	\N	2010-05-27	1123	\N	2679	\N
10011	GENERIC_DAY	2	6	\N	2010-05-07	1119	\N	2679	\N
10109	GENERIC_DAY	2	5	\N	2010-06-07	1123	\N	2679	\N
10052	GENERIC_DAY	2	6	\N	2010-05-18	1119	\N	2679	\N
10106	GENERIC_DAY	2	5	\N	2010-06-09	1121	\N	2679	\N
10022	GENERIC_DAY	2	5	\N	2010-05-06	1121	\N	2679	\N
10114	GENERIC_DAY	2	6	\N	2010-06-03	1119	\N	2679	\N
10075	GENERIC_DAY	2	5	\N	2010-05-25	1123	\N	2679	\N
10060	GENERIC_DAY	2	0	\N	2010-06-14	1123	\N	2679	\N
10102	GENERIC_DAY	2	5	\N	2010-06-10	1123	\N	2679	\N
10045	GENERIC_DAY	2	6	\N	2010-05-26	1119	\N	2679	\N
10103	GENERIC_DAY	2	5	\N	2010-05-07	1121	\N	2679	\N
10031	GENERIC_DAY	2	6	\N	2010-05-28	1119	\N	2679	\N
10056	GENERIC_DAY	2	0	\N	2010-05-30	1119	\N	2679	\N
10117	GENERIC_DAY	2	6	\N	2010-05-27	1119	\N	2679	\N
10029	GENERIC_DAY	2	6	\N	2010-05-12	1119	\N	2679	\N
10118	GENERIC_DAY	2	6	\N	2010-05-21	1119	\N	2679	\N
10019	GENERIC_DAY	2	5	\N	2010-05-12	1123	\N	2679	\N
10046	GENERIC_DAY	2	5	\N	2010-05-31	1123	\N	2679	\N
10068	GENERIC_DAY	2	6	\N	2010-05-25	1119	\N	2679	\N
10131	GENERIC_DAY	2	3	\N	2010-05-20	1121	\N	2680	\N
10247	GENERIC_DAY	2	3	\N	2010-05-11	1123	\N	2680	\N
10120	GENERIC_DAY	2	0	\N	2010-06-06	1119	\N	2680	\N
10267	GENERIC_DAY	2	2	\N	2010-05-06	1119	\N	2680	\N
10214	GENERIC_DAY	2	3	\N	2010-06-17	1121	\N	2680	\N
10124	GENERIC_DAY	2	3	\N	2010-05-19	1123	\N	2680	\N
10229	GENERIC_DAY	2	2	\N	2010-06-16	1123	\N	2680	\N
10145	GENERIC_DAY	2	0	\N	2010-05-23	1123	\N	2680	\N
10208	GENERIC_DAY	2	3	\N	2010-05-12	1121	\N	2680	\N
10135	GENERIC_DAY	2	3	\N	2010-06-11	1123	\N	2680	\N
10178	GENERIC_DAY	2	2	\N	2010-06-14	1121	\N	2680	\N
10253	GENERIC_DAY	2	3	\N	2010-06-24	1119	\N	2680	\N
10119	GENERIC_DAY	2	0	\N	2010-05-08	1119	\N	2680	\N
10245	GENERIC_DAY	2	0	\N	2010-05-09	1119	\N	2680	\N
10202	GENERIC_DAY	2	3	\N	2010-05-31	1121	\N	2680	\N
10180	GENERIC_DAY	2	0	\N	2010-05-15	1119	\N	2680	\N
10238	GENERIC_DAY	2	3	\N	2010-05-24	1123	\N	2680	\N
10167	GENERIC_DAY	2	3	\N	2010-06-11	1121	\N	2680	\N
10168	GENERIC_DAY	2	2	\N	2010-06-18	1123	\N	2680	\N
10134	GENERIC_DAY	2	3	\N	2010-06-23	1121	\N	2680	\N
10143	GENERIC_DAY	2	1	\N	2010-06-25	1121	\N	2680	\N
10235	GENERIC_DAY	2	2	\N	2010-05-27	1119	\N	2680	\N
10270	GENERIC_DAY	2	0	\N	2010-05-16	1121	\N	2680	\N
10244	GENERIC_DAY	2	2	\N	2010-05-20	1119	\N	2680	\N
10183	GENERIC_DAY	2	2	\N	2010-05-24	1119	\N	2680	\N
10242	GENERIC_DAY	2	3	\N	2010-05-14	1123	\N	2680	\N
10162	GENERIC_DAY	2	0	\N	2010-06-20	1121	\N	2680	\N
10200	GENERIC_DAY	2	3	\N	2010-06-16	1121	\N	2680	\N
10220	GENERIC_DAY	2	3	\N	2010-05-18	1123	\N	2680	\N
10155	GENERIC_DAY	2	3	\N	2010-06-07	1123	\N	2680	\N
10237	GENERIC_DAY	2	0	\N	2010-06-12	1123	\N	2680	\N
10201	GENERIC_DAY	2	2	\N	2010-06-11	1119	\N	2680	\N
10272	GENERIC_DAY	2	3	\N	2010-05-21	1121	\N	2680	\N
10191	GENERIC_DAY	2	0	\N	2010-05-22	1123	\N	2680	\N
10236	GENERIC_DAY	2	0	\N	2010-05-22	1121	\N	2680	\N
10151	GENERIC_DAY	2	3	\N	2010-06-02	1121	\N	2680	\N
10182	GENERIC_DAY	2	0	\N	2010-06-06	1123	\N	2680	\N
10141	GENERIC_DAY	2	2	\N	2010-06-17	1123	\N	2680	\N
10252	GENERIC_DAY	2	2	\N	2010-05-19	1119	\N	2680	\N
10239	GENERIC_DAY	2	0	\N	2010-05-09	1123	\N	2680	\N
10161	GENERIC_DAY	2	2	\N	2010-06-03	1119	\N	2680	\N
10144	GENERIC_DAY	2	3	\N	2010-06-16	1119	\N	2680	\N
10153	GENERIC_DAY	2	0	\N	2010-05-23	1121	\N	2680	\N
10126	GENERIC_DAY	2	3	\N	2010-06-14	1123	\N	2680	\N
10215	GENERIC_DAY	2	0	\N	2010-06-13	1121	\N	2680	\N
10173	GENERIC_DAY	2	3	\N	2010-05-31	1123	\N	2680	\N
10231	GENERIC_DAY	2	0	\N	2010-06-19	1121	\N	2680	\N
10209	GENERIC_DAY	2	1	\N	2010-06-25	1123	\N	2680	\N
10146	GENERIC_DAY	2	0	\N	2010-05-29	1123	\N	2680	\N
10132	GENERIC_DAY	2	0	\N	2010-05-30	1123	\N	2680	\N
10251	GENERIC_DAY	2	0	\N	2010-05-08	1123	\N	2680	\N
10175	GENERIC_DAY	2	3	\N	2010-05-25	1121	\N	2680	\N
10152	GENERIC_DAY	2	3	\N	2010-05-27	1121	\N	2680	\N
10258	GENERIC_DAY	2	3	\N	2010-06-15	1119	\N	2680	\N
10138	GENERIC_DAY	2	2	\N	2010-06-15	1123	\N	2680	\N
10212	GENERIC_DAY	2	3	\N	2010-06-15	1121	\N	2680	\N
10249	GENERIC_DAY	2	0	\N	2010-05-22	1119	\N	2680	\N
10262	GENERIC_DAY	2	3	\N	2010-05-28	1121	\N	2680	\N
10187	GENERIC_DAY	2	0	\N	2010-06-19	1123	\N	2680	\N
10255	GENERIC_DAY	2	0	\N	2010-05-09	1121	\N	2680	\N
10150	GENERIC_DAY	2	0	\N	2010-05-16	1123	\N	2680	\N
10172	GENERIC_DAY	2	2	\N	2010-05-05	1119	\N	2680	\N
10217	GENERIC_DAY	2	3	\N	2010-05-19	1121	\N	2680	\N
10198	GENERIC_DAY	2	0	\N	2010-05-29	1121	\N	2680	\N
10165	GENERIC_DAY	2	3	\N	2010-05-10	1123	\N	2680	\N
10233	GENERIC_DAY	2	3	\N	2010-05-11	1121	\N	2680	\N
10179	GENERIC_DAY	2	0	\N	2010-06-05	1123	\N	2680	\N
10199	GENERIC_DAY	2	3	\N	2010-06-09	1123	\N	2680	\N
10224	GENERIC_DAY	2	3	\N	2010-06-07	1121	\N	2680	\N
10154	GENERIC_DAY	2	2	\N	2010-06-23	1123	\N	2680	\N
10204	GENERIC_DAY	2	0	\N	2010-05-23	1119	\N	2680	\N
10174	GENERIC_DAY	2	0	\N	2010-06-20	1119	\N	2680	\N
10248	GENERIC_DAY	2	3	\N	2010-06-23	1119	\N	2680	\N
10185	GENERIC_DAY	2	2	\N	2010-05-07	1119	\N	2680	\N
10221	GENERIC_DAY	2	3	\N	2010-06-01	1121	\N	2680	\N
10125	GENERIC_DAY	2	3	\N	2010-05-24	1121	\N	2680	\N
10228	GENERIC_DAY	2	2	\N	2010-06-24	1123	\N	2680	\N
10157	GENERIC_DAY	2	0	\N	2010-06-06	1121	\N	2680	\N
10240	GENERIC_DAY	2	2	\N	2010-05-25	1119	\N	2680	\N
10184	GENERIC_DAY	2	3	\N	2010-05-25	1123	\N	2680	\N
10210	GENERIC_DAY	2	2	\N	2010-05-21	1119	\N	2680	\N
10128	GENERIC_DAY	2	3	\N	2010-05-05	1123	\N	2680	\N
10189	GENERIC_DAY	2	3	\N	2010-05-18	1121	\N	2680	\N
10129	GENERIC_DAY	2	3	\N	2010-05-10	1121	\N	2680	\N
10176	GENERIC_DAY	2	3	\N	2010-06-22	1121	\N	2680	\N
10188	GENERIC_DAY	2	3	\N	2010-06-03	1121	\N	2680	\N
10223	GENERIC_DAY	2	3	\N	2010-05-14	1121	\N	2680	\N
10261	GENERIC_DAY	2	0	\N	2010-06-05	1119	\N	2680	\N
10123	GENERIC_DAY	2	3	\N	2010-06-14	1119	\N	2680	\N
10269	GENERIC_DAY	2	2	\N	2010-05-18	1119	\N	2680	\N
10166	GENERIC_DAY	2	2	\N	2010-05-13	1119	\N	2680	\N
10160	GENERIC_DAY	2	2	\N	2010-06-01	1119	\N	2680	\N
10186	GENERIC_DAY	2	2	\N	2010-05-31	1119	\N	2680	\N
10142	GENERIC_DAY	2	0	\N	2010-05-16	1119	\N	2680	\N
10246	GENERIC_DAY	2	3	\N	2010-05-13	1123	\N	2680	\N
10254	GENERIC_DAY	2	3	\N	2010-06-01	1123	\N	2680	\N
10170	GENERIC_DAY	2	3	\N	2010-06-22	1119	\N	2680	\N
10196	GENERIC_DAY	2	0	\N	2010-05-30	1119	\N	2680	\N
10121	GENERIC_DAY	2	3	\N	2010-05-28	1123	\N	2680	\N
10260	GENERIC_DAY	2	3	\N	2010-05-12	1123	\N	2680	\N
10192	GENERIC_DAY	2	3	\N	2010-05-26	1123	\N	2680	\N
10158	GENERIC_DAY	2	2	\N	2010-05-28	1119	\N	2680	\N
10203	GENERIC_DAY	2	0	\N	2010-06-20	1123	\N	2680	\N
10147	GENERIC_DAY	2	2	\N	2010-05-14	1119	\N	2680	\N
10181	GENERIC_DAY	2	3	\N	2010-05-06	1123	\N	2680	\N
10159	GENERIC_DAY	2	3	\N	2010-05-27	1123	\N	2680	\N
10137	GENERIC_DAY	2	3	\N	2010-05-07	1121	\N	2680	\N
10177	GENERIC_DAY	2	3	\N	2010-05-06	1121	\N	2680	\N
10171	GENERIC_DAY	2	3	\N	2010-05-13	1121	\N	2680	\N
10264	GENERIC_DAY	2	3	\N	2010-06-09	1121	\N	2680	\N
10136	GENERIC_DAY	2	0	\N	2010-05-08	1121	\N	2680	\N
10265	GENERIC_DAY	2	2	\N	2010-05-10	1119	\N	2680	\N
10211	GENERIC_DAY	2	2	\N	2010-05-12	1119	\N	2680	\N
10243	GENERIC_DAY	2	2	\N	2010-06-22	1123	\N	2680	\N
10230	GENERIC_DAY	2	3	\N	2010-06-24	1121	\N	2680	\N
10218	GENERIC_DAY	2	0	\N	2010-05-15	1121	\N	2680	\N
10259	GENERIC_DAY	2	0	\N	2010-05-15	1123	\N	2680	\N
10139	GENERIC_DAY	2	0	\N	2010-06-12	1121	\N	2680	\N
10234	GENERIC_DAY	2	0	\N	2010-05-30	1121	\N	2680	\N
10241	GENERIC_DAY	2	3	\N	2010-06-08	1123	\N	2680	\N
10193	GENERIC_DAY	2	3	\N	2010-06-21	1121	\N	2680	\N
10156	GENERIC_DAY	2	3	\N	2010-05-26	1121	\N	2680	\N
10195	GENERIC_DAY	2	2	\N	2010-06-07	1119	\N	2680	\N
10271	GENERIC_DAY	2	0	\N	2010-06-12	1119	\N	2680	\N
10205	GENERIC_DAY	2	2	\N	2010-06-21	1123	\N	2680	\N
10127	GENERIC_DAY	2	3	\N	2010-06-08	1121	\N	2680	\N
10122	GENERIC_DAY	2	0	\N	2010-06-05	1121	\N	2680	\N
10226	GENERIC_DAY	2	3	\N	2010-05-05	1121	\N	2680	\N
10232	GENERIC_DAY	2	3	\N	2010-06-17	1119	\N	2680	\N
10169	GENERIC_DAY	2	0	\N	2010-05-29	1119	\N	2680	\N
10266	GENERIC_DAY	2	2	\N	2010-06-10	1119	\N	2680	\N
10257	GENERIC_DAY	2	3	\N	2010-06-18	1119	\N	2680	\N
10164	GENERIC_DAY	2	3	\N	2010-05-07	1123	\N	2680	\N
10133	GENERIC_DAY	2	2	\N	2010-05-11	1119	\N	2680	\N
10225	GENERIC_DAY	2	2	\N	2010-05-26	1119	\N	2680	\N
10219	GENERIC_DAY	2	3	\N	2010-06-04	1123	\N	2680	\N
10163	GENERIC_DAY	2	0	\N	2010-06-13	1119	\N	2680	\N
10149	GENERIC_DAY	2	3	\N	2010-05-21	1123	\N	2680	\N
10194	GENERIC_DAY	2	2	\N	2010-06-08	1119	\N	2680	\N
10268	GENERIC_DAY	2	3	\N	2010-06-10	1123	\N	2680	\N
10256	GENERIC_DAY	2	2	\N	2010-06-04	1119	\N	2680	\N
10206	GENERIC_DAY	2	3	\N	2010-06-18	1121	\N	2680	\N
10227	GENERIC_DAY	2	8	\N	2010-05-04	1123	\N	2680	\N
10216	GENERIC_DAY	2	3	\N	2010-06-21	1119	\N	2680	\N
10190	GENERIC_DAY	2	0	\N	2010-06-13	1123	\N	2680	\N
10213	GENERIC_DAY	2	2	\N	2010-06-25	1119	\N	2680	\N
10140	GENERIC_DAY	2	3	\N	2010-06-03	1123	\N	2680	\N
10197	GENERIC_DAY	2	3	\N	2010-06-04	1121	\N	2680	\N
10207	GENERIC_DAY	2	0	\N	2010-06-19	1119	\N	2680	\N
10263	GENERIC_DAY	2	2	\N	2010-06-09	1119	\N	2680	\N
10222	GENERIC_DAY	2	2	\N	2010-06-02	1119	\N	2680	\N
10148	GENERIC_DAY	2	3	\N	2010-06-02	1123	\N	2680	\N
10130	GENERIC_DAY	2	3	\N	2010-05-20	1123	\N	2680	\N
10250	GENERIC_DAY	2	3	\N	2010-06-10	1121	\N	2680	\N
11831	GENERIC_DAY	1	3	\N	2010-07-16	1119	\N	2681	\N
11832	GENERIC_DAY	1	3	\N	2010-07-27	1119	\N	2681	\N
11833	GENERIC_DAY	1	0	\N	2010-07-04	1119	\N	2681	\N
11834	GENERIC_DAY	1	3	\N	2010-07-20	1119	\N	2681	\N
11835	GENERIC_DAY	1	2	\N	2010-07-22	1123	\N	2681	\N
11836	GENERIC_DAY	1	3	\N	2010-06-25	1123	\N	2681	\N
11837	GENERIC_DAY	1	3	\N	2010-06-18	1123	\N	2681	\N
11838	GENERIC_DAY	1	2	\N	2010-07-07	1123	\N	2681	\N
11839	GENERIC_DAY	1	0	\N	2010-06-27	1119	\N	2681	\N
11840	GENERIC_DAY	1	0	\N	2010-07-10	1119	\N	2681	\N
11841	GENERIC_DAY	1	3	\N	2010-07-14	1121	\N	2681	\N
11842	GENERIC_DAY	1	0	\N	2010-07-17	1121	\N	2681	\N
11843	GENERIC_DAY	1	0	\N	2010-06-20	1119	\N	2681	\N
47403	GENERIC_DAY	2	11	\N	2010-06-29	14343	\N	39511	\N
47497	GENERIC_DAY	2	10	\N	2010-07-28	26463	\N	39511	\N
27841	GENERIC_DAY	3	0	\N	2010-06-20	1134	\N	27675	\N
27859	GENERIC_DAY	3	0	\N	2010-06-12	1134	\N	27675	\N
27865	GENERIC_DAY	3	3	\N	2010-06-16	1132	\N	27675	\N
27848	GENERIC_DAY	3	2	\N	2010-06-23	1136	\N	27675	\N
27879	GENERIC_DAY	3	0	\N	2010-06-20	1136	\N	27675	\N
27842	GENERIC_DAY	3	3	\N	2010-06-21	1134	\N	27675	\N
27869	GENERIC_DAY	3	3	\N	2010-06-24	1132	\N	27675	\N
27846	GENERIC_DAY	3	2	\N	2010-06-15	1136	\N	27675	\N
27873	GENERIC_DAY	3	3	\N	2010-06-15	1132	\N	27675	\N
27878	GENERIC_DAY	3	3	\N	2010-06-16	1134	\N	27675	\N
27849	GENERIC_DAY	3	2	\N	2010-06-24	1136	\N	27675	\N
27886	GENERIC_DAY	3	3	\N	2010-06-17	1134	\N	27675	\N
27864	GENERIC_DAY	3	0	\N	2010-06-13	1132	\N	27675	\N
27887	GENERIC_DAY	3	0	\N	2010-06-27	1136	\N	27675	\N
27863	GENERIC_DAY	3	0	\N	2010-06-26	1134	\N	27675	\N
27860	GENERIC_DAY	3	1	\N	2010-06-28	1134	\N	27675	\N
27881	GENERIC_DAY	3	3	\N	2010-06-18	1132	\N	27675	\N
27854	GENERIC_DAY	3	3	\N	2010-06-24	1134	\N	27675	\N
27883	GENERIC_DAY	3	3	\N	2010-06-11	1132	\N	27675	\N
27844	GENERIC_DAY	3	0	\N	2010-06-19	1134	\N	27675	\N
27843	GENERIC_DAY	3	3	\N	2010-06-11	1134	\N	27675	\N
27870	GENERIC_DAY	3	0	\N	2010-06-12	1132	\N	27675	\N
27888	GENERIC_DAY	3	3	\N	2010-06-23	1132	\N	27675	\N
47564	GENERIC_DAY	2	0	\N	2010-09-05	26463	\N	39511	\N
47449	GENERIC_DAY	2	11	\N	2010-08-17	14343	\N	39511	\N
47336	GENERIC_DAY	2	11	\N	2010-09-13	14345	\N	39511	\N
47435	GENERIC_DAY	2	11	\N	2010-09-08	14343	\N	39511	\N
47326	GENERIC_DAY	2	11	\N	2010-09-06	14343	\N	39511	\N
47534	GENERIC_DAY	2	10	\N	2010-07-14	26463	\N	39511	\N
47426	GENERIC_DAY	2	11	\N	2010-07-15	14343	\N	39511	\N
47358	GENERIC_DAY	2	0	\N	2010-08-14	14345	\N	39511	\N
47530	GENERIC_DAY	2	10	\N	2010-09-08	26463	\N	39511	\N
47345	GENERIC_DAY	2	11	\N	2010-08-04	14345	\N	39511	\N
47421	GENERIC_DAY	2	0	\N	2010-07-11	14343	\N	39511	\N
47422	GENERIC_DAY	2	11	\N	2010-07-20	14343	\N	39511	\N
47512	GENERIC_DAY	2	11	\N	2010-06-30	14343	\N	39511	\N
47436	GENERIC_DAY	2	10	\N	2010-09-02	26463	\N	39511	\N
47569	GENERIC_DAY	2	10	\N	2010-08-13	26463	\N	39511	\N
47389	GENERIC_DAY	2	11	\N	2010-08-11	14345	\N	39511	\N
47338	GENERIC_DAY	2	10	\N	2010-07-02	26463	\N	39511	\N
47317	GENERIC_DAY	2	10	\N	2010-09-07	26463	\N	39511	\N
47454	GENERIC_DAY	2	11	\N	2010-08-05	14343	\N	39511	\N
47457	GENERIC_DAY	2	0	\N	2010-08-29	14345	\N	39511	\N
47321	GENERIC_DAY	2	10	\N	2010-08-16	26463	\N	39511	\N
47476	GENERIC_DAY	2	0	\N	2010-08-21	26463	\N	39511	\N
47461	GENERIC_DAY	2	0	\N	2010-08-07	14345	\N	39511	\N
47490	GENERIC_DAY	2	0	\N	2010-07-25	14345	\N	39511	\N
47327	GENERIC_DAY	2	11	\N	2010-09-06	14345	\N	39511	\N
47544	GENERIC_DAY	2	11	\N	2010-08-31	14343	\N	39511	\N
47371	GENERIC_DAY	2	11	\N	2010-06-29	14345	\N	39511	\N
47333	GENERIC_DAY	2	0	\N	2010-08-15	26463	\N	39511	\N
47489	GENERIC_DAY	2	11	\N	2010-07-08	14343	\N	39511	\N
47525	GENERIC_DAY	2	11	\N	2010-07-19	14345	\N	39511	\N
47337	GENERIC_DAY	2	0	\N	2010-08-08	14343	\N	39511	\N
47349	GENERIC_DAY	2	11	\N	2010-09-17	14345	\N	39511	\N
47540	GENERIC_DAY	2	10	\N	2010-07-29	26463	\N	39511	\N
47563	GENERIC_DAY	2	11	\N	2010-07-26	14345	\N	39511	\N
47342	GENERIC_DAY	2	0	\N	2010-08-14	26463	\N	39511	\N
47503	GENERIC_DAY	2	11	\N	2010-09-16	14343	\N	39511	\N
47334	GENERIC_DAY	2	11	\N	2010-07-15	14345	\N	39511	\N
47249	GENERIC_DAY	2	16	\N	2010-08-19	38987	\N	39510	\N
47309	GENERIC_DAY	2	0	\N	2010-08-21	38987	\N	39510	\N
47305	GENERIC_DAY	2	16	\N	2010-07-12	38987	\N	39510	\N
47235	GENERIC_DAY	2	0	\N	2010-08-28	38987	\N	39510	\N
27836	GENERIC_DAY	3	3	\N	2010-06-14	1132	\N	27675	\N
27851	GENERIC_DAY	3	2	\N	2010-06-28	1132	\N	27675	\N
27867	GENERIC_DAY	3	2	\N	2010-06-16	1136	\N	27675	\N
27847	GENERIC_DAY	3	2	\N	2010-06-17	1136	\N	27675	\N
27874	GENERIC_DAY	3	0	\N	2010-06-27	1132	\N	27675	\N
27852	GENERIC_DAY	3	0	\N	2010-06-12	1136	\N	27675	\N
27837	GENERIC_DAY	3	3	\N	2010-06-17	1132	\N	27675	\N
27862	GENERIC_DAY	3	2	\N	2010-06-22	1136	\N	27675	\N
27838	GENERIC_DAY	3	3	\N	2010-06-10	1134	\N	27675	\N
27835	GENERIC_DAY	3	0	\N	2010-06-13	1134	\N	27675	\N
27884	GENERIC_DAY	3	3	\N	2010-06-22	1134	\N	27675	\N
27839	GENERIC_DAY	3	0	\N	2010-06-26	1132	\N	27675	\N
27877	GENERIC_DAY	3	3	\N	2010-06-25	1134	\N	27675	\N
27840	GENERIC_DAY	3	2	\N	2010-06-14	1136	\N	27675	\N
27876	GENERIC_DAY	3	3	\N	2010-06-21	1132	\N	27675	\N
27872	GENERIC_DAY	3	3	\N	2010-06-10	1132	\N	27675	\N
27861	GENERIC_DAY	3	0	\N	2010-06-20	1132	\N	27675	\N
27871	GENERIC_DAY	3	2	\N	2010-06-18	1136	\N	27675	\N
11844	GENERIC_DAY	1	3	\N	2010-07-08	1119	\N	2681	\N
11845	GENERIC_DAY	1	2	\N	2010-07-27	1123	\N	2681	\N
11846	GENERIC_DAY	1	3	\N	2010-06-24	1119	\N	2681	\N
11847	GENERIC_DAY	1	3	\N	2010-06-15	1123	\N	2681	\N
11848	GENERIC_DAY	1	0	\N	2010-07-25	1121	\N	2681	\N
11849	GENERIC_DAY	1	0	\N	2010-07-24	1123	\N	2681	\N
11850	GENERIC_DAY	1	3	\N	2010-07-12	1121	\N	2681	\N
11851	GENERIC_DAY	1	0	\N	2010-07-17	1123	\N	2681	\N
11852	GENERIC_DAY	1	2	\N	2010-07-23	1123	\N	2681	\N
11853	GENERIC_DAY	1	3	\N	2010-06-28	1121	\N	2681	\N
11854	GENERIC_DAY	1	0	\N	2010-07-18	1123	\N	2681	\N
11855	GENERIC_DAY	1	3	\N	2010-07-23	1121	\N	2681	\N
11856	GENERIC_DAY	1	3	\N	2010-07-30	1119	\N	2681	\N
11857	GENERIC_DAY	1	3	\N	2010-06-23	1119	\N	2681	\N
11858	GENERIC_DAY	1	3	\N	2010-06-29	1121	\N	2681	\N
11859	GENERIC_DAY	1	3	\N	2010-07-08	1121	\N	2681	\N
11860	GENERIC_DAY	1	3	\N	2010-08-03	1119	\N	2681	\N
11861	GENERIC_DAY	1	3	\N	2010-07-26	1119	\N	2681	\N
11862	GENERIC_DAY	1	3	\N	2010-07-19	1121	\N	2681	\N
11863	GENERIC_DAY	1	3	\N	2010-07-01	1119	\N	2681	\N
11864	GENERIC_DAY	1	2	\N	2010-07-20	1123	\N	2681	\N
11865	GENERIC_DAY	1	0	\N	2010-06-19	1123	\N	2681	\N
14291	GENERIC_DAY	1	3	\N	2010-05-06	1128	\N	14143	\N
14280	GENERIC_DAY	1	0	\N	2010-05-09	1128	\N	14143	\N
14294	GENERIC_DAY	1	3	\N	2010-05-07	1126	\N	14143	\N
14286	GENERIC_DAY	1	3	\N	2010-05-06	1126	\N	14143	\N
14277	GENERIC_DAY	1	0	\N	2010-05-09	1130	\N	14143	\N
14279	GENERIC_DAY	1	0	\N	2010-05-09	1126	\N	14143	\N
14287	GENERIC_DAY	1	2	\N	2010-05-10	1130	\N	14143	\N
14282	GENERIC_DAY	1	2	\N	2010-05-11	1128	\N	14143	\N
14281	GENERIC_DAY	1	2	\N	2010-05-06	1130	\N	14143	\N
14292	GENERIC_DAY	1	3	\N	2010-05-07	1128	\N	14143	\N
14290	GENERIC_DAY	1	0	\N	2010-05-08	1130	\N	14143	\N
14284	GENERIC_DAY	1	2	\N	2010-05-11	1130	\N	14143	\N
14285	GENERIC_DAY	1	2	\N	2010-05-07	1130	\N	14143	\N
14278	GENERIC_DAY	1	2	\N	2010-05-11	1126	\N	14143	\N
14288	GENERIC_DAY	1	0	\N	2010-05-08	1126	\N	14143	\N
14289	GENERIC_DAY	1	3	\N	2010-05-10	1126	\N	14143	\N
14293	GENERIC_DAY	1	0	\N	2010-05-08	1128	\N	14143	\N
14283	GENERIC_DAY	1	3	\N	2010-05-10	1128	\N	14143	\N
14275	GENERIC_DAY	1	1	\N	2010-05-14	1130	\N	14142	\N
14272	GENERIC_DAY	1	3	\N	2010-05-13	1128	\N	14142	\N
14276	GENERIC_DAY	1	3	\N	2010-05-13	1126	\N	14142	\N
14270	GENERIC_DAY	1	1	\N	2010-05-14	1128	\N	14142	\N
14274	GENERIC_DAY	1	2	\N	2010-05-12	1130	\N	14142	\N
14273	GENERIC_DAY	1	3	\N	2010-05-12	1126	\N	14142	\N
14271	GENERIC_DAY	1	2	\N	2010-05-14	1126	\N	14142	\N
14268	GENERIC_DAY	1	2	\N	2010-05-13	1130	\N	14142	\N
14269	GENERIC_DAY	1	3	\N	2010-05-12	1128	\N	14142	\N
14312	GENERIC_DAY	0	3	\N	2010-05-20	1128	\N	14146	\N
14313	GENERIC_DAY	0	3	\N	2010-05-19	1126	\N	14146	\N
14314	GENERIC_DAY	0	3	\N	2010-05-19	1128	\N	14146	\N
14315	GENERIC_DAY	0	1	\N	2010-05-21	1130	\N	14146	\N
14316	GENERIC_DAY	0	2	\N	2010-05-20	1130	\N	14146	\N
14317	GENERIC_DAY	0	3	\N	2010-05-20	1126	\N	14146	\N
14318	GENERIC_DAY	0	2	\N	2010-05-21	1126	\N	14146	\N
14319	GENERIC_DAY	0	1	\N	2010-05-21	1128	\N	14146	\N
14320	GENERIC_DAY	0	2	\N	2010-05-19	1130	\N	14146	\N
14321	GENERIC_DAY	0	0	\N	2010-05-15	14345	\N	14147	\N
14322	GENERIC_DAY	0	4	\N	2010-05-17	14345	\N	14147	\N
14323	GENERIC_DAY	0	4	\N	2010-05-17	14343	\N	14147	\N
14324	GENERIC_DAY	0	0	\N	2010-05-16	14345	\N	14147	\N
14325	GENERIC_DAY	0	1	\N	2010-05-18	14345	\N	14147	\N
14326	GENERIC_DAY	0	0	\N	2010-05-15	14343	\N	14147	\N
14327	GENERIC_DAY	0	1	\N	2010-05-18	14343	\N	14147	\N
14328	GENERIC_DAY	0	0	\N	2010-05-16	14343	\N	14147	\N
47298	GENERIC_DAY	2	16	\N	2010-07-19	38987	\N	39510	\N
47280	GENERIC_DAY	2	16	\N	2010-09-15	38987	\N	39510	\N
47234	GENERIC_DAY	2	16	\N	2010-07-27	38987	\N	39510	\N
47275	GENERIC_DAY	2	16	\N	2010-08-30	38987	\N	39510	\N
47303	GENERIC_DAY	2	0	\N	2010-07-25	38987	\N	39510	\N
47306	GENERIC_DAY	2	16	\N	2010-09-08	38987	\N	39510	\N
47236	GENERIC_DAY	2	16	\N	2010-08-20	38987	\N	39510	\N
47247	GENERIC_DAY	2	16	\N	2010-08-18	38987	\N	39510	\N
47263	GENERIC_DAY	2	16	\N	2010-09-22	38987	\N	39510	\N
47293	GENERIC_DAY	2	16	\N	2010-08-12	38987	\N	39510	\N
47255	GENERIC_DAY	2	0	\N	2010-09-05	38987	\N	39510	\N
47266	GENERIC_DAY	2	0	\N	2010-09-19	38987	\N	39510	\N
47273	GENERIC_DAY	2	16	\N	2010-07-20	38987	\N	39510	\N
47304	GENERIC_DAY	2	16	\N	2010-08-23	38987	\N	39510	\N
47289	GENERIC_DAY	2	16	\N	2010-07-21	38987	\N	39510	\N
47242	GENERIC_DAY	2	16	\N	2010-07-13	38987	\N	39510	\N
47308	GENERIC_DAY	2	16	\N	2010-07-01	38987	\N	39510	\N
47296	GENERIC_DAY	2	0	\N	2010-07-24	38987	\N	39510	\N
47288	GENERIC_DAY	2	16	\N	2010-09-13	38987	\N	39510	\N
47251	GENERIC_DAY	2	0	\N	2010-08-15	38987	\N	39510	\N
47310	GENERIC_DAY	2	16	\N	2010-08-24	38987	\N	39510	\N
47279	GENERIC_DAY	2	16	\N	2010-09-02	38987	\N	39510	\N
47240	GENERIC_DAY	2	16	\N	2010-08-25	38987	\N	39510	\N
47243	GENERIC_DAY	2	0	\N	2010-08-07	38987	\N	39510	\N
47250	GENERIC_DAY	2	16	\N	2010-08-27	38987	\N	39510	\N
47282	GENERIC_DAY	2	16	\N	2010-08-05	38987	\N	39510	\N
47278	GENERIC_DAY	2	0	\N	2010-09-18	38987	\N	39510	\N
47252	GENERIC_DAY	2	16	\N	2010-07-22	38987	\N	39510	\N
47267	GENERIC_DAY	2	0	\N	2010-07-18	38987	\N	39510	\N
47230	GENERIC_DAY	2	16	\N	2010-07-26	38987	\N	39510	\N
47231	GENERIC_DAY	2	0	\N	2010-07-17	38987	\N	39510	\N
47256	GENERIC_DAY	2	16	\N	2010-08-03	38987	\N	39510	\N
47294	GENERIC_DAY	2	16	\N	2010-09-17	38987	\N	39510	\N
47248	GENERIC_DAY	2	16	\N	2010-09-14	38987	\N	39510	\N
47299	GENERIC_DAY	2	16	\N	2010-09-06	38987	\N	39510	\N
47290	GENERIC_DAY	2	16	\N	2010-07-05	38987	\N	39510	\N
47257	GENERIC_DAY	2	0	\N	2010-09-11	38987	\N	39510	\N
47285	GENERIC_DAY	2	16	\N	2010-08-31	38987	\N	39510	\N
47269	GENERIC_DAY	2	16	\N	2010-09-07	38987	\N	39510	\N
47228	GENERIC_DAY	2	0	\N	2010-08-08	38987	\N	39510	\N
47276	GENERIC_DAY	2	0	\N	2010-07-03	38987	\N	39510	\N
47295	GENERIC_DAY	2	16	\N	2010-07-29	38987	\N	39510	\N
47232	GENERIC_DAY	2	16	\N	2010-09-09	38987	\N	39510	\N
47270	GENERIC_DAY	2	16	\N	2010-09-01	38987	\N	39510	\N
47227	GENERIC_DAY	2	0	\N	2010-08-01	38987	\N	39510	\N
47253	GENERIC_DAY	2	16	\N	2010-08-10	38987	\N	39510	\N
47237	GENERIC_DAY	2	16	\N	2010-07-06	38987	\N	39510	\N
47271	GENERIC_DAY	2	16	\N	2010-06-29	38987	\N	39510	\N
47300	GENERIC_DAY	2	16	\N	2010-07-30	38987	\N	39510	\N
47260	GENERIC_DAY	2	16	\N	2010-07-07	38987	\N	39510	\N
47265	GENERIC_DAY	2	16	\N	2010-08-16	38987	\N	39510	\N
47284	GENERIC_DAY	2	8	\N	2010-09-23	38987	\N	39510	\N
47238	GENERIC_DAY	2	16	\N	2010-07-14	38987	\N	39510	\N
47301	GENERIC_DAY	2	16	\N	2010-08-13	38987	\N	39510	\N
47229	GENERIC_DAY	2	16	\N	2010-09-10	38987	\N	39510	\N
47233	GENERIC_DAY	2	16	\N	2010-08-11	38987	\N	39510	\N
47307	GENERIC_DAY	2	16	\N	2010-08-04	38987	\N	39510	\N
47291	GENERIC_DAY	2	16	\N	2010-07-23	38987	\N	39510	\N
47311	GENERIC_DAY	2	16	\N	2010-08-02	38987	\N	39510	\N
47268	GENERIC_DAY	2	16	\N	2010-07-09	38987	\N	39510	\N
47312	GENERIC_DAY	2	16	\N	2010-08-06	38987	\N	39510	\N
47245	GENERIC_DAY	2	16	\N	2010-08-26	38987	\N	39510	\N
47297	GENERIC_DAY	2	0	\N	2010-09-04	38987	\N	39510	\N
47274	GENERIC_DAY	2	16	\N	2010-09-21	38987	\N	39510	\N
47246	GENERIC_DAY	2	0	\N	2010-07-31	38987	\N	39510	\N
47244	GENERIC_DAY	2	16	\N	2010-08-09	38987	\N	39510	\N
47313	GENERIC_DAY	2	0	\N	2010-08-22	38987	\N	39510	\N
47292	GENERIC_DAY	2	16	\N	2010-06-30	38987	\N	39510	\N
47254	GENERIC_DAY	2	0	\N	2010-08-14	38987	\N	39510	\N
47287	GENERIC_DAY	2	16	\N	2010-07-02	38987	\N	39510	\N
47261	GENERIC_DAY	2	0	\N	2010-08-29	38987	\N	39510	\N
47277	GENERIC_DAY	2	16	\N	2010-08-17	38987	\N	39510	\N
47281	GENERIC_DAY	2	0	\N	2010-09-12	38987	\N	39510	\N
47259	GENERIC_DAY	2	16	\N	2010-07-16	38987	\N	39510	\N
47239	GENERIC_DAY	2	16	\N	2010-07-28	38987	\N	39510	\N
47264	GENERIC_DAY	2	0	\N	2010-07-10	38987	\N	39510	\N
47262	GENERIC_DAY	2	16	\N	2010-09-03	38987	\N	39510	\N
47241	GENERIC_DAY	2	16	\N	2010-07-08	38987	\N	39510	\N
47258	GENERIC_DAY	2	16	\N	2010-09-20	38987	\N	39510	\N
47272	GENERIC_DAY	2	16	\N	2010-09-16	38987	\N	39510	\N
47286	GENERIC_DAY	2	16	\N	2010-07-15	38987	\N	39510	\N
47283	GENERIC_DAY	2	0	\N	2010-07-11	38987	\N	39510	\N
47302	GENERIC_DAY	2	0	\N	2010-07-04	38987	\N	39510	\N
49478	GENERIC_DAY	1	0	\N	2010-07-24	1123	\N	39520	\N
49479	GENERIC_DAY	1	0	\N	2010-07-18	1121	\N	39520	\N
49480	GENERIC_DAY	1	0	\N	2010-06-26	1123	\N	39520	\N
49481	GENERIC_DAY	1	8	\N	2010-07-01	1121	\N	39520	\N
49482	GENERIC_DAY	1	8	\N	2010-06-16	1119	\N	39520	\N
49483	GENERIC_DAY	1	8	\N	2010-07-15	1123	\N	39520	\N
49484	GENERIC_DAY	1	0	\N	2010-08-01	1119	\N	39520	\N
49485	GENERIC_DAY	1	8	\N	2010-07-13	1119	\N	39520	\N
49486	GENERIC_DAY	1	8	\N	2010-07-07	1121	\N	39520	\N
49487	GENERIC_DAY	1	8	\N	2010-06-24	1123	\N	39520	\N
49488	GENERIC_DAY	1	8	\N	2010-06-29	1119	\N	39520	\N
49489	GENERIC_DAY	1	8	\N	2010-07-26	1123	\N	39520	\N
49490	GENERIC_DAY	1	8	\N	2010-06-18	1121	\N	39520	\N
49491	GENERIC_DAY	1	8	\N	2010-06-11	1119	\N	39520	\N
49492	GENERIC_DAY	1	8	\N	2010-06-24	1119	\N	39520	\N
49493	GENERIC_DAY	1	8	\N	2010-07-23	1119	\N	39520	\N
49494	GENERIC_DAY	1	0	\N	2010-08-01	1121	\N	39520	\N
49495	GENERIC_DAY	1	0	\N	2010-06-13	1121	\N	39520	\N
49496	GENERIC_DAY	1	8	\N	2010-07-19	1119	\N	39520	\N
49497	GENERIC_DAY	1	0	\N	2010-06-13	1119	\N	39520	\N
49498	GENERIC_DAY	1	0	\N	2010-06-27	1123	\N	39520	\N
49499	GENERIC_DAY	1	8	\N	2010-07-20	1123	\N	39520	\N
49500	GENERIC_DAY	1	8	\N	2010-07-16	1123	\N	39520	\N
49501	GENERIC_DAY	1	8	\N	2010-08-02	1119	\N	39520	\N
49502	GENERIC_DAY	1	0	\N	2010-06-20	1119	\N	39520	\N
49503	GENERIC_DAY	1	8	\N	2010-07-01	1119	\N	39520	\N
49504	GENERIC_DAY	1	8	\N	2010-07-14	1123	\N	39520	\N
49505	GENERIC_DAY	1	0	\N	2010-07-24	1121	\N	39520	\N
49506	GENERIC_DAY	1	0	\N	2010-06-20	1121	\N	39520	\N
49507	GENERIC_DAY	1	8	\N	2010-07-12	1119	\N	39520	\N
49508	GENERIC_DAY	1	0	\N	2010-06-12	1123	\N	39520	\N
49509	GENERIC_DAY	1	0	\N	2010-08-01	1123	\N	39520	\N
49510	GENERIC_DAY	1	8	\N	2010-07-30	1119	\N	39520	\N
49511	GENERIC_DAY	1	8	\N	2010-06-30	1123	\N	39520	\N
49512	GENERIC_DAY	1	0	\N	2010-07-04	1119	\N	39520	\N
49513	GENERIC_DAY	1	0	\N	2010-07-25	1121	\N	39520	\N
49514	GENERIC_DAY	1	8	\N	2010-06-23	1119	\N	39520	\N
49515	GENERIC_DAY	1	8	\N	2010-07-27	1121	\N	39520	\N
49516	GENERIC_DAY	1	8	\N	2010-07-22	1121	\N	39520	\N
49517	GENERIC_DAY	1	8	\N	2010-06-23	1123	\N	39520	\N
49518	GENERIC_DAY	1	8	\N	2010-07-07	1123	\N	39520	\N
49519	GENERIC_DAY	1	8	\N	2010-07-12	1123	\N	39520	\N
49520	GENERIC_DAY	1	0	\N	2010-07-17	1121	\N	39520	\N
49521	GENERIC_DAY	1	0	\N	2010-07-10	1119	\N	39520	\N
49522	GENERIC_DAY	1	8	\N	2010-07-16	1119	\N	39520	\N
49523	GENERIC_DAY	1	0	\N	2010-06-27	1121	\N	39520	\N
49524	GENERIC_DAY	1	8	\N	2010-07-14	1121	\N	39520	\N
49525	GENERIC_DAY	1	8	\N	2010-06-28	1121	\N	39520	\N
49526	GENERIC_DAY	1	8	\N	2010-07-08	1121	\N	39520	\N
49527	GENERIC_DAY	1	8	\N	2010-07-15	1121	\N	39520	\N
49528	GENERIC_DAY	1	8	\N	2010-06-25	1123	\N	39520	\N
49529	GENERIC_DAY	1	8	\N	2010-06-18	1119	\N	39520	\N
49530	GENERIC_DAY	1	8	\N	2010-07-28	1123	\N	39520	\N
49531	GENERIC_DAY	1	8	\N	2010-07-05	1123	\N	39520	\N
49532	GENERIC_DAY	1	8	\N	2010-07-23	1121	\N	39520	\N
49533	GENERIC_DAY	1	8	\N	2010-07-02	1123	\N	39520	\N
49534	GENERIC_DAY	1	0	\N	2010-07-03	1123	\N	39520	\N
49535	GENERIC_DAY	1	8	\N	2010-06-30	1119	\N	39520	\N
49536	GENERIC_DAY	1	0	\N	2010-07-24	1119	\N	39520	\N
49537	GENERIC_DAY	1	8	\N	2010-07-19	1123	\N	39520	\N
49538	GENERIC_DAY	1	8	\N	2010-07-02	1119	\N	39520	\N
49539	GENERIC_DAY	1	8	\N	2010-07-26	1121	\N	39520	\N
49540	GENERIC_DAY	1	0	\N	2010-06-12	1121	\N	39520	\N
49541	GENERIC_DAY	1	0	\N	2010-07-31	1123	\N	39520	\N
49542	GENERIC_DAY	1	6	\N	2010-08-06	1123	\N	39520	\N
49543	GENERIC_DAY	1	0	\N	2010-06-12	1119	\N	39520	\N
49544	GENERIC_DAY	1	0	\N	2010-07-04	1121	\N	39520	\N
49545	GENERIC_DAY	1	8	\N	2010-06-24	1121	\N	39520	\N
49546	GENERIC_DAY	1	8	\N	2010-07-09	1121	\N	39520	\N
49547	GENERIC_DAY	1	8	\N	2010-08-03	1121	\N	39520	\N
49548	GENERIC_DAY	1	0	\N	2010-07-11	1119	\N	39520	\N
49549	GENERIC_DAY	1	8	\N	2010-06-10	1119	\N	39520	\N
49550	GENERIC_DAY	1	8	\N	2010-07-16	1121	\N	39520	\N
49551	GENERIC_DAY	1	0	\N	2010-07-25	1119	\N	39520	\N
49552	GENERIC_DAY	1	8	\N	2010-07-12	1121	\N	39520	\N
49553	GENERIC_DAY	1	8	\N	2010-07-05	1121	\N	39520	\N
49554	GENERIC_DAY	1	8	\N	2010-08-05	1119	\N	39520	\N
49555	GENERIC_DAY	1	8	\N	2010-08-03	1119	\N	39520	\N
49556	GENERIC_DAY	1	8	\N	2010-07-15	1119	\N	39520	\N
49557	GENERIC_DAY	1	8	\N	2010-06-17	1123	\N	39520	\N
49558	GENERIC_DAY	1	8	\N	2010-07-02	1121	\N	39520	\N
49559	GENERIC_DAY	1	0	\N	2010-06-19	1121	\N	39520	\N
49560	GENERIC_DAY	1	8	\N	2010-06-10	1123	\N	39520	\N
49561	GENERIC_DAY	1	8	\N	2010-06-25	1121	\N	39520	\N
49562	GENERIC_DAY	1	8	\N	2010-06-17	1121	\N	39520	\N
49563	GENERIC_DAY	1	0	\N	2010-07-04	1123	\N	39520	\N
49564	GENERIC_DAY	1	0	\N	2010-06-26	1119	\N	39520	\N
49565	GENERIC_DAY	1	8	\N	2010-06-28	1123	\N	39520	\N
49566	GENERIC_DAY	1	0	\N	2010-07-11	1123	\N	39520	\N
49567	GENERIC_DAY	1	8	\N	2010-07-30	1123	\N	39520	\N
49568	GENERIC_DAY	1	8	\N	2010-06-14	1121	\N	39520	\N
49569	GENERIC_DAY	1	8	\N	2010-06-15	1121	\N	39520	\N
49570	GENERIC_DAY	1	8	\N	2010-06-29	1123	\N	39520	\N
49571	GENERIC_DAY	1	8	\N	2010-07-29	1121	\N	39520	\N
49572	GENERIC_DAY	1	8	\N	2010-06-29	1121	\N	39520	\N
49573	GENERIC_DAY	1	8	\N	2010-07-28	1121	\N	39520	\N
49574	GENERIC_DAY	1	8	\N	2010-07-27	1119	\N	39520	\N
49575	GENERIC_DAY	1	8	\N	2010-06-23	1121	\N	39520	\N
49576	GENERIC_DAY	1	8	\N	2010-07-29	1123	\N	39520	\N
49577	GENERIC_DAY	1	8	\N	2010-07-21	1119	\N	39520	\N
49578	GENERIC_DAY	1	8	\N	2010-06-15	1119	\N	39520	\N
49579	GENERIC_DAY	1	8	\N	2010-06-28	1119	\N	39520	\N
49580	GENERIC_DAY	1	0	\N	2010-06-26	1121	\N	39520	\N
49581	GENERIC_DAY	1	8	\N	2010-07-19	1121	\N	39520	\N
49582	GENERIC_DAY	1	0	\N	2010-06-27	1119	\N	39520	\N
49583	GENERIC_DAY	1	5	\N	2010-08-06	1119	\N	39520	\N
49584	GENERIC_DAY	1	8	\N	2010-07-29	1119	\N	39520	\N
49585	GENERIC_DAY	1	8	\N	2010-08-02	1123	\N	39520	\N
49586	GENERIC_DAY	1	8	\N	2010-06-22	1119	\N	39520	\N
49587	GENERIC_DAY	1	8	\N	2010-06-22	1121	\N	39520	\N
49588	GENERIC_DAY	1	8	\N	2010-06-30	1121	\N	39520	\N
49589	GENERIC_DAY	1	8	\N	2010-07-06	1123	\N	39520	\N
49590	GENERIC_DAY	1	8	\N	2010-07-13	1121	\N	39520	\N
49591	GENERIC_DAY	1	0	\N	2010-07-03	1121	\N	39520	\N
49592	GENERIC_DAY	1	0	\N	2010-07-25	1123	\N	39520	\N
49593	GENERIC_DAY	1	0	\N	2010-07-10	1123	\N	39520	\N
49594	GENERIC_DAY	1	8	\N	2010-07-09	1119	\N	39520	\N
49595	GENERIC_DAY	1	8	\N	2010-06-15	1123	\N	39520	\N
49596	GENERIC_DAY	1	8	\N	2010-07-13	1123	\N	39520	\N
49597	GENERIC_DAY	1	8	\N	2010-07-28	1119	\N	39520	\N
49598	GENERIC_DAY	1	0	\N	2010-06-13	1123	\N	39520	\N
49599	GENERIC_DAY	1	8	\N	2010-08-02	1121	\N	39520	\N
49600	GENERIC_DAY	1	8	\N	2010-08-04	1119	\N	39520	\N
49601	GENERIC_DAY	1	8	\N	2010-06-21	1123	\N	39520	\N
49602	GENERIC_DAY	1	8	\N	2010-06-10	1121	\N	39520	\N
49603	GENERIC_DAY	1	8	\N	2010-07-27	1123	\N	39520	\N
49604	GENERIC_DAY	1	8	\N	2010-07-30	1121	\N	39520	\N
49605	GENERIC_DAY	1	8	\N	2010-07-08	1123	\N	39520	\N
49606	GENERIC_DAY	1	8	\N	2010-08-05	1121	\N	39520	\N
49607	GENERIC_DAY	1	8	\N	2010-06-16	1121	\N	39520	\N
49608	GENERIC_DAY	1	8	\N	2010-07-06	1121	\N	39520	\N
49609	GENERIC_DAY	1	8	\N	2010-07-21	1121	\N	39520	\N
49610	GENERIC_DAY	1	8	\N	2010-06-16	1123	\N	39520	\N
49611	GENERIC_DAY	1	8	\N	2010-07-05	1119	\N	39520	\N
49612	GENERIC_DAY	1	8	\N	2010-07-08	1119	\N	39520	\N
49613	GENERIC_DAY	1	8	\N	2010-07-21	1123	\N	39520	\N
49614	GENERIC_DAY	1	8	\N	2010-06-22	1123	\N	39520	\N
49615	GENERIC_DAY	1	0	\N	2010-07-03	1119	\N	39520	\N
49616	GENERIC_DAY	1	8	\N	2010-07-23	1123	\N	39520	\N
49617	GENERIC_DAY	1	0	\N	2010-07-11	1121	\N	39520	\N
49618	GENERIC_DAY	1	8	\N	2010-07-07	1119	\N	39520	\N
49619	GENERIC_DAY	1	0	\N	2010-07-31	1119	\N	39520	\N
49620	GENERIC_DAY	1	0	\N	2010-06-19	1119	\N	39520	\N
49621	GENERIC_DAY	1	8	\N	2010-06-21	1119	\N	39520	\N
49622	GENERIC_DAY	1	0	\N	2010-06-20	1123	\N	39520	\N
49623	GENERIC_DAY	1	8	\N	2010-06-11	1123	\N	39520	\N
49624	GENERIC_DAY	1	8	\N	2010-08-05	1123	\N	39520	\N
49625	GENERIC_DAY	1	0	\N	2010-07-31	1121	\N	39520	\N
49626	GENERIC_DAY	1	8	\N	2010-06-17	1119	\N	39520	\N
49627	GENERIC_DAY	1	0	\N	2010-06-19	1123	\N	39520	\N
49628	GENERIC_DAY	1	8	\N	2010-06-11	1121	\N	39520	\N
49629	GENERIC_DAY	1	0	\N	2010-07-18	1123	\N	39520	\N
49630	GENERIC_DAY	1	8	\N	2010-06-14	1119	\N	39520	\N
49631	GENERIC_DAY	1	8	\N	2010-07-01	1123	\N	39520	\N
49632	GENERIC_DAY	1	8	\N	2010-07-22	1123	\N	39520	\N
49633	GENERIC_DAY	1	8	\N	2010-06-18	1123	\N	39520	\N
49634	GENERIC_DAY	1	8	\N	2010-06-14	1123	\N	39520	\N
49635	GENERIC_DAY	1	0	\N	2010-07-18	1119	\N	39520	\N
49636	GENERIC_DAY	1	8	\N	2010-07-14	1119	\N	39520	\N
49637	GENERIC_DAY	1	8	\N	2010-07-09	1123	\N	39520	\N
49638	GENERIC_DAY	1	5	\N	2010-08-06	1121	\N	39520	\N
49639	GENERIC_DAY	1	8	\N	2010-07-22	1119	\N	39520	\N
49640	GENERIC_DAY	1	8	\N	2010-07-26	1119	\N	39520	\N
49641	GENERIC_DAY	1	8	\N	2010-08-03	1123	\N	39520	\N
49642	GENERIC_DAY	1	0	\N	2010-07-10	1121	\N	39520	\N
49643	GENERIC_DAY	1	8	\N	2010-07-06	1119	\N	39520	\N
49644	GENERIC_DAY	1	0	\N	2010-07-17	1123	\N	39520	\N
49645	GENERIC_DAY	1	8	\N	2010-08-04	1121	\N	39520	\N
49646	GENERIC_DAY	1	8	\N	2010-07-20	1121	\N	39520	\N
49647	GENERIC_DAY	1	0	\N	2010-07-17	1119	\N	39520	\N
49648	GENERIC_DAY	1	8	\N	2010-08-04	1123	\N	39520	\N
49649	GENERIC_DAY	1	8	\N	2010-07-20	1119	\N	39520	\N
49650	GENERIC_DAY	1	8	\N	2010-06-21	1121	\N	39520	\N
49651	GENERIC_DAY	1	8	\N	2010-06-25	1119	\N	39520	\N
49073	GENERIC_DAY	1	5	\N	2010-08-17	1119	\N	39518	\N
49074	GENERIC_DAY	1	0	\N	2010-09-19	1121	\N	39518	\N
49075	GENERIC_DAY	1	5	\N	2010-09-13	1123	\N	39518	\N
49076	GENERIC_DAY	1	6	\N	2010-08-23	1119	\N	39518	\N
49077	GENERIC_DAY	1	0	\N	2010-08-29	1121	\N	39518	\N
49078	GENERIC_DAY	1	5	\N	2010-08-16	1119	\N	39518	\N
49079	GENERIC_DAY	1	6	\N	2010-09-02	1119	\N	39518	\N
49080	GENERIC_DAY	1	6	\N	2010-09-10	1119	\N	39518	\N
49081	GENERIC_DAY	1	6	\N	2010-09-06	1119	\N	39518	\N
49082	GENERIC_DAY	1	6	\N	2010-08-10	1123	\N	39518	\N
49083	GENERIC_DAY	1	6	\N	2010-09-14	1119	\N	39518	\N
49084	GENERIC_DAY	1	0	\N	2010-08-08	1119	\N	39518	\N
49085	GENERIC_DAY	1	6	\N	2010-08-18	1119	\N	39518	\N
49086	GENERIC_DAY	1	6	\N	2010-08-17	1123	\N	39518	\N
49087	GENERIC_DAY	1	0	\N	2010-08-08	1121	\N	39518	\N
49088	GENERIC_DAY	1	5	\N	2010-09-07	1123	\N	39518	\N
49089	GENERIC_DAY	1	5	\N	2010-08-18	1123	\N	39518	\N
49090	GENERIC_DAY	1	5	\N	2010-08-11	1119	\N	39518	\N
49091	GENERIC_DAY	1	6	\N	2010-09-13	1119	\N	39518	\N
49092	GENERIC_DAY	1	6	\N	2010-09-08	1119	\N	39518	\N
49093	GENERIC_DAY	1	0	\N	2010-08-22	1121	\N	39518	\N
49094	GENERIC_DAY	1	5	\N	2010-08-23	1121	\N	39518	\N
49095	GENERIC_DAY	1	0	\N	2010-09-18	1119	\N	39518	\N
49096	GENERIC_DAY	1	6	\N	2010-09-01	1119	\N	39518	\N
49097	GENERIC_DAY	1	6	\N	2010-09-03	1119	\N	39518	\N
49098	GENERIC_DAY	1	6	\N	2010-08-13	1123	\N	39518	\N
49099	GENERIC_DAY	1	0	\N	2010-08-14	1121	\N	39518	\N
49100	GENERIC_DAY	1	6	\N	2010-08-20	1119	\N	39518	\N
49101	GENERIC_DAY	1	6	\N	2010-09-20	1119	\N	39518	\N
49102	GENERIC_DAY	1	6	\N	2010-08-26	1119	\N	39518	\N
49103	GENERIC_DAY	1	0	\N	2010-08-22	1119	\N	39518	\N
49104	GENERIC_DAY	1	5	\N	2010-08-10	1119	\N	39518	\N
49105	GENERIC_DAY	1	5	\N	2010-09-14	1123	\N	39518	\N
49106	GENERIC_DAY	1	5	\N	2010-08-27	1123	\N	39518	\N
49107	GENERIC_DAY	1	5	\N	2010-09-15	1121	\N	39518	\N
49108	GENERIC_DAY	1	0	\N	2010-08-21	1119	\N	39518	\N
49109	GENERIC_DAY	1	0	\N	2010-08-22	1123	\N	39518	\N
49110	GENERIC_DAY	1	5	\N	2010-08-17	1121	\N	39518	\N
49111	GENERIC_DAY	1	5	\N	2010-08-25	1121	\N	39518	\N
49112	GENERIC_DAY	1	1	\N	2010-09-21	1123	\N	39518	\N
49113	GENERIC_DAY	1	0	\N	2010-09-05	1119	\N	39518	\N
49114	GENERIC_DAY	1	5	\N	2010-08-24	1121	\N	39518	\N
49115	GENERIC_DAY	1	5	\N	2010-08-19	1123	\N	39518	\N
49116	GENERIC_DAY	1	5	\N	2010-09-17	1121	\N	39518	\N
49117	GENERIC_DAY	1	0	\N	2010-08-28	1119	\N	39518	\N
49118	GENERIC_DAY	1	5	\N	2010-08-20	1121	\N	39518	\N
49119	GENERIC_DAY	1	0	\N	2010-08-14	1119	\N	39518	\N
49120	GENERIC_DAY	1	5	\N	2010-08-23	1123	\N	39518	\N
49121	GENERIC_DAY	1	0	\N	2010-09-18	1121	\N	39518	\N
49122	GENERIC_DAY	1	5	\N	2010-09-10	1121	\N	39518	\N
49123	GENERIC_DAY	1	0	\N	2010-09-11	1123	\N	39518	\N
49124	GENERIC_DAY	1	5	\N	2010-08-26	1123	\N	39518	\N
49125	GENERIC_DAY	1	6	\N	2010-09-07	1119	\N	39518	\N
49126	GENERIC_DAY	1	6	\N	2010-08-27	1119	\N	39518	\N
49127	GENERIC_DAY	1	5	\N	2010-09-15	1123	\N	39518	\N
49128	GENERIC_DAY	1	5	\N	2010-08-24	1123	\N	39518	\N
49129	GENERIC_DAY	1	5	\N	2010-09-02	1121	\N	39518	\N
49130	GENERIC_DAY	1	5	\N	2010-09-03	1121	\N	39518	\N
49131	GENERIC_DAY	1	0	\N	2010-08-21	1123	\N	39518	\N
49132	GENERIC_DAY	1	0	\N	2010-08-28	1123	\N	39518	\N
49133	GENERIC_DAY	1	5	\N	2010-09-20	1121	\N	39518	\N
49134	GENERIC_DAY	1	0	\N	2010-09-19	1123	\N	39518	\N
49135	GENERIC_DAY	1	5	\N	2010-08-13	1121	\N	39518	\N
49136	GENERIC_DAY	1	5	\N	2010-09-01	1121	\N	39518	\N
49137	GENERIC_DAY	1	5	\N	2010-09-06	1121	\N	39518	\N
49138	GENERIC_DAY	1	0	\N	2010-08-14	1123	\N	39518	\N
49139	GENERIC_DAY	1	5	\N	2010-08-09	1121	\N	39518	\N
49140	GENERIC_DAY	1	6	\N	2010-08-09	1123	\N	39518	\N
49141	GENERIC_DAY	1	0	\N	2010-09-04	1119	\N	39518	\N
49142	GENERIC_DAY	1	0	\N	2010-09-04	1121	\N	39518	\N
49143	GENERIC_DAY	1	5	\N	2010-08-18	1121	\N	39518	\N
49144	GENERIC_DAY	1	6	\N	2010-08-25	1119	\N	39518	\N
49145	GENERIC_DAY	1	5	\N	2010-09-07	1121	\N	39518	\N
49146	GENERIC_DAY	1	5	\N	2010-09-01	1123	\N	39518	\N
49147	GENERIC_DAY	1	5	\N	2010-08-31	1123	\N	39518	\N
49148	GENERIC_DAY	1	5	\N	2010-09-17	1123	\N	39518	\N
49149	GENERIC_DAY	1	5	\N	2010-09-16	1121	\N	39518	\N
49150	GENERIC_DAY	1	0	\N	2010-08-08	1123	\N	39518	\N
49151	GENERIC_DAY	1	5	\N	2010-09-20	1123	\N	39518	\N
49152	GENERIC_DAY	1	6	\N	2010-08-30	1119	\N	39518	\N
49153	GENERIC_DAY	1	6	\N	2010-09-16	1119	\N	39518	\N
49154	GENERIC_DAY	1	5	\N	2010-08-16	1121	\N	39518	\N
49155	GENERIC_DAY	1	6	\N	2010-08-16	1123	\N	39518	\N
49156	GENERIC_DAY	1	0	\N	2010-08-07	1121	\N	39518	\N
49157	GENERIC_DAY	1	0	\N	2010-08-15	1121	\N	39518	\N
49158	GENERIC_DAY	1	5	\N	2010-08-12	1119	\N	39518	\N
49159	GENERIC_DAY	1	0	\N	2010-08-15	1119	\N	39518	\N
49160	GENERIC_DAY	1	1	\N	2010-09-21	1121	\N	39518	\N
49161	GENERIC_DAY	1	6	\N	2010-08-31	1119	\N	39518	\N
49162	GENERIC_DAY	1	6	\N	2010-08-12	1123	\N	39518	\N
49163	GENERIC_DAY	1	5	\N	2010-08-20	1123	\N	39518	\N
49164	GENERIC_DAY	1	5	\N	2010-08-10	1121	\N	39518	\N
49165	GENERIC_DAY	1	5	\N	2010-09-02	1123	\N	39518	\N
49166	GENERIC_DAY	1	6	\N	2010-09-17	1119	\N	39518	\N
49167	GENERIC_DAY	1	5	\N	2010-08-19	1121	\N	39518	\N
49168	GENERIC_DAY	1	0	\N	2010-09-04	1123	\N	39518	\N
49169	GENERIC_DAY	1	6	\N	2010-08-19	1119	\N	39518	\N
49170	GENERIC_DAY	1	5	\N	2010-09-16	1123	\N	39518	\N
49171	GENERIC_DAY	1	5	\N	2010-08-13	1119	\N	39518	\N
49172	GENERIC_DAY	1	0	\N	2010-08-28	1121	\N	39518	\N
49173	GENERIC_DAY	1	5	\N	2010-08-31	1121	\N	39518	\N
49174	GENERIC_DAY	1	0	\N	2010-08-07	1119	\N	39518	\N
49175	GENERIC_DAY	1	5	\N	2010-08-27	1121	\N	39518	\N
49176	GENERIC_DAY	1	0	\N	2010-09-19	1119	\N	39518	\N
49177	GENERIC_DAY	1	5	\N	2010-09-13	1121	\N	39518	\N
49178	GENERIC_DAY	1	5	\N	2010-08-25	1123	\N	39518	\N
49179	GENERIC_DAY	1	0	\N	2010-09-12	1123	\N	39518	\N
49180	GENERIC_DAY	1	5	\N	2010-09-03	1123	\N	39518	\N
49181	GENERIC_DAY	1	5	\N	2010-09-08	1121	\N	39518	\N
49182	GENERIC_DAY	1	5	\N	2010-09-10	1123	\N	39518	\N
49183	GENERIC_DAY	1	0	\N	2010-08-15	1123	\N	39518	\N
49184	GENERIC_DAY	1	2	\N	2010-09-21	1119	\N	39518	\N
49185	GENERIC_DAY	1	5	\N	2010-08-11	1121	\N	39518	\N
49186	GENERIC_DAY	1	5	\N	2010-08-12	1121	\N	39518	\N
49187	GENERIC_DAY	1	0	\N	2010-09-18	1123	\N	39518	\N
49188	GENERIC_DAY	1	0	\N	2010-09-05	1123	\N	39518	\N
49189	GENERIC_DAY	1	6	\N	2010-09-09	1119	\N	39518	\N
49190	GENERIC_DAY	1	0	\N	2010-08-29	1119	\N	39518	\N
49191	GENERIC_DAY	1	5	\N	2010-08-30	1121	\N	39518	\N
49192	GENERIC_DAY	1	0	\N	2010-09-05	1121	\N	39518	\N
49193	GENERIC_DAY	1	0	\N	2010-09-12	1121	\N	39518	\N
49194	GENERIC_DAY	1	0	\N	2010-08-29	1123	\N	39518	\N
49195	GENERIC_DAY	1	5	\N	2010-08-30	1123	\N	39518	\N
49196	GENERIC_DAY	1	5	\N	2010-09-09	1123	\N	39518	\N
49197	GENERIC_DAY	1	5	\N	2010-09-08	1123	\N	39518	\N
49198	GENERIC_DAY	1	5	\N	2010-09-14	1121	\N	39518	\N
49199	GENERIC_DAY	1	6	\N	2010-09-15	1119	\N	39518	\N
49200	GENERIC_DAY	1	0	\N	2010-08-07	1123	\N	39518	\N
49201	GENERIC_DAY	1	6	\N	2010-08-11	1123	\N	39518	\N
49202	GENERIC_DAY	1	5	\N	2010-08-09	1119	\N	39518	\N
49203	GENERIC_DAY	1	5	\N	2010-08-26	1121	\N	39518	\N
49204	GENERIC_DAY	1	6	\N	2010-08-24	1119	\N	39518	\N
49205	GENERIC_DAY	1	0	\N	2010-09-11	1119	\N	39518	\N
49206	GENERIC_DAY	1	5	\N	2010-09-06	1123	\N	39518	\N
49207	GENERIC_DAY	1	0	\N	2010-09-11	1121	\N	39518	\N
49208	GENERIC_DAY	1	0	\N	2010-08-21	1121	\N	39518	\N
49209	GENERIC_DAY	1	0	\N	2010-09-12	1119	\N	39518	\N
49210	GENERIC_DAY	1	5	\N	2010-09-09	1121	\N	39518	\N
49211	GENERIC_DAY	1	0	\N	2010-09-25	1126	\N	39519	\N
49212	GENERIC_DAY	1	0	\N	2010-09-19	1126	\N	39519	\N
49213	GENERIC_DAY	1	0	\N	2010-09-05	1130	\N	39519	\N
49214	GENERIC_DAY	1	11	\N	2010-08-13	1130	\N	39519	\N
49215	GENERIC_DAY	1	0	\N	2010-10-17	1128	\N	39519	\N
49216	GENERIC_DAY	1	11	\N	2010-10-27	1126	\N	39519	\N
49217	GENERIC_DAY	1	0	\N	2010-10-03	1130	\N	39519	\N
49218	GENERIC_DAY	1	0	\N	2010-09-25	1130	\N	39519	\N
49219	GENERIC_DAY	1	11	\N	2010-08-27	1128	\N	39519	\N
49220	GENERIC_DAY	1	10	\N	2010-09-02	1126	\N	39519	\N
49221	GENERIC_DAY	1	0	\N	2010-09-18	1126	\N	39519	\N
49222	GENERIC_DAY	1	10	\N	2010-09-16	1128	\N	39519	\N
49223	GENERIC_DAY	1	0	\N	2010-09-26	1126	\N	39519	\N
49224	GENERIC_DAY	1	0	\N	2010-10-23	1128	\N	39519	\N
49225	GENERIC_DAY	1	11	\N	2010-10-15	1126	\N	39519	\N
49226	GENERIC_DAY	1	11	\N	2010-10-01	1126	\N	39519	\N
49227	GENERIC_DAY	1	0	\N	2010-10-10	1128	\N	39519	\N
49228	GENERIC_DAY	1	10	\N	2010-09-14	1128	\N	39519	\N
49229	GENERIC_DAY	1	10	\N	2010-09-24	1130	\N	39519	\N
49230	GENERIC_DAY	1	10	\N	2010-10-27	1130	\N	39519	\N
49231	GENERIC_DAY	1	10	\N	2010-10-04	1130	\N	39519	\N
49232	GENERIC_DAY	1	0	\N	2010-10-23	1126	\N	39519	\N
49233	GENERIC_DAY	1	11	\N	2010-08-30	1128	\N	39519	\N
49234	GENERIC_DAY	1	0	\N	2010-08-14	1130	\N	39519	\N
49235	GENERIC_DAY	1	11	\N	2010-10-15	1128	\N	39519	\N
49236	GENERIC_DAY	1	11	\N	2010-10-04	1126	\N	39519	\N
49237	GENERIC_DAY	1	0	\N	2010-09-11	1130	\N	39519	\N
49238	GENERIC_DAY	1	11	\N	2010-08-17	1126	\N	39519	\N
49239	GENERIC_DAY	1	10	\N	2010-10-06	1130	\N	39519	\N
49240	GENERIC_DAY	1	0	\N	2010-10-10	1126	\N	39519	\N
49241	GENERIC_DAY	1	10	\N	2010-08-12	1128	\N	39519	\N
49242	GENERIC_DAY	1	0	\N	2010-08-22	1126	\N	39519	\N
49243	GENERIC_DAY	1	10	\N	2010-08-20	1126	\N	39519	\N
49244	GENERIC_DAY	1	11	\N	2010-08-16	1130	\N	39519	\N
49245	GENERIC_DAY	1	10	\N	2010-09-15	1128	\N	39519	\N
49246	GENERIC_DAY	1	11	\N	2010-08-09	1126	\N	39519	\N
49247	GENERIC_DAY	1	0	\N	2010-08-28	1130	\N	39519	\N
49248	GENERIC_DAY	1	0	\N	2010-10-16	1130	\N	39519	\N
49249	GENERIC_DAY	1	11	\N	2010-08-27	1130	\N	39519	\N
49250	GENERIC_DAY	1	11	\N	2010-09-09	1130	\N	39519	\N
49251	GENERIC_DAY	1	11	\N	2010-10-08	1126	\N	39519	\N
49252	GENERIC_DAY	1	10	\N	2010-09-23	1126	\N	39519	\N
49253	GENERIC_DAY	1	0	\N	2010-09-18	1130	\N	39519	\N
49254	GENERIC_DAY	1	0	\N	2010-10-09	1130	\N	39519	\N
49255	GENERIC_DAY	1	0	\N	2010-10-23	1130	\N	39519	\N
49256	GENERIC_DAY	1	0	\N	2010-08-14	1126	\N	39519	\N
49257	GENERIC_DAY	1	11	\N	2010-10-28	1126	\N	39519	\N
49258	GENERIC_DAY	1	10	\N	2010-08-25	1126	\N	39519	\N
49259	GENERIC_DAY	1	11	\N	2010-09-30	1126	\N	39519	\N
49260	GENERIC_DAY	1	10	\N	2010-08-23	1126	\N	39519	\N
49261	GENERIC_DAY	1	11	\N	2010-09-14	1130	\N	39519	\N
49262	GENERIC_DAY	1	0	\N	2010-08-21	1128	\N	39519	\N
49263	GENERIC_DAY	1	0	\N	2010-10-02	1130	\N	39519	\N
49264	GENERIC_DAY	1	10	\N	2010-10-21	1130	\N	39519	\N
49265	GENERIC_DAY	1	0	\N	2010-08-07	1130	\N	39519	\N
49266	GENERIC_DAY	1	10	\N	2010-09-07	1126	\N	39519	\N
49267	GENERIC_DAY	1	11	\N	2010-09-23	1130	\N	39519	\N
49268	GENERIC_DAY	1	0	\N	2010-10-09	1128	\N	39519	\N
49269	GENERIC_DAY	1	0	\N	2010-09-18	1128	\N	39519	\N
49270	GENERIC_DAY	1	10	\N	2010-09-27	1130	\N	39519	\N
49271	GENERIC_DAY	1	10	\N	2010-09-30	1130	\N	39519	\N
49272	GENERIC_DAY	1	11	\N	2010-08-17	1130	\N	39519	\N
49273	GENERIC_DAY	1	0	\N	2010-08-28	1128	\N	39519	\N
49274	GENERIC_DAY	1	10	\N	2010-08-31	1126	\N	39519	\N
49275	GENERIC_DAY	1	11	\N	2010-08-30	1130	\N	39519	\N
49276	GENERIC_DAY	1	10	\N	2010-10-28	1130	\N	39519	\N
49277	GENERIC_DAY	1	11	\N	2010-08-10	1130	\N	39519	\N
49278	GENERIC_DAY	1	11	\N	2010-09-10	1128	\N	39519	\N
49279	GENERIC_DAY	1	11	\N	2010-09-09	1128	\N	39519	\N
49280	GENERIC_DAY	1	11	\N	2010-10-26	1128	\N	39519	\N
49281	GENERIC_DAY	1	11	\N	2010-10-29	1128	\N	39519	\N
49282	GENERIC_DAY	1	11	\N	2010-10-01	1128	\N	39519	\N
49283	GENERIC_DAY	1	11	\N	2010-08-26	1128	\N	39519	\N
49284	GENERIC_DAY	1	11	\N	2010-09-03	1128	\N	39519	\N
49285	GENERIC_DAY	1	0	\N	2010-09-11	1126	\N	39519	\N
49286	GENERIC_DAY	1	0	\N	2010-08-15	1130	\N	39519	\N
49287	GENERIC_DAY	1	0	\N	2010-09-12	1128	\N	39519	\N
49288	GENERIC_DAY	1	11	\N	2010-09-28	1128	\N	39519	\N
49289	GENERIC_DAY	1	11	\N	2010-10-27	1128	\N	39519	\N
49290	GENERIC_DAY	1	11	\N	2010-09-08	1128	\N	39519	\N
49291	GENERIC_DAY	1	11	\N	2010-10-07	1126	\N	39519	\N
49292	GENERIC_DAY	1	11	\N	2010-09-17	1130	\N	39519	\N
49293	GENERIC_DAY	1	10	\N	2010-10-14	1130	\N	39519	\N
49294	GENERIC_DAY	1	0	\N	2010-08-08	1128	\N	39519	\N
49295	GENERIC_DAY	1	11	\N	2010-08-18	1128	\N	39519	\N
49296	GENERIC_DAY	1	10	\N	2010-08-30	1126	\N	39519	\N
49297	GENERIC_DAY	1	0	\N	2010-09-12	1126	\N	39519	\N
49298	GENERIC_DAY	1	11	\N	2010-09-06	1128	\N	39519	\N
49299	GENERIC_DAY	1	10	\N	2010-09-13	1128	\N	39519	\N
49300	GENERIC_DAY	1	11	\N	2010-08-25	1128	\N	39519	\N
49301	GENERIC_DAY	1	10	\N	2010-08-10	1128	\N	39519	\N
49302	GENERIC_DAY	1	0	\N	2010-08-29	1126	\N	39519	\N
49303	GENERIC_DAY	1	11	\N	2010-09-21	1130	\N	39519	\N
49304	GENERIC_DAY	1	11	\N	2010-10-14	1128	\N	39519	\N
49305	GENERIC_DAY	1	10	\N	2010-08-18	1126	\N	39519	\N
49306	GENERIC_DAY	1	11	\N	2010-08-20	1128	\N	39519	\N
49307	GENERIC_DAY	1	0	\N	2010-09-11	1128	\N	39519	\N
49308	GENERIC_DAY	1	11	\N	2010-09-13	1130	\N	39519	\N
49309	GENERIC_DAY	1	11	\N	2010-10-08	1128	\N	39519	\N
49310	GENERIC_DAY	1	0	\N	2010-08-08	1130	\N	39519	\N
49311	GENERIC_DAY	1	10	\N	2010-08-19	1126	\N	39519	\N
49312	GENERIC_DAY	1	11	\N	2010-08-18	1130	\N	39519	\N
49313	GENERIC_DAY	1	11	\N	2010-10-05	1128	\N	39519	\N
49314	GENERIC_DAY	1	11	\N	2010-10-25	1126	\N	39519	\N
49315	GENERIC_DAY	1	0	\N	2010-08-29	1130	\N	39519	\N
49316	GENERIC_DAY	1	11	\N	2010-09-06	1130	\N	39519	\N
49317	GENERIC_DAY	1	11	\N	2010-11-04	1128	\N	39519	\N
49318	GENERIC_DAY	1	10	\N	2010-09-06	1126	\N	39519	\N
49319	GENERIC_DAY	1	11	\N	2010-11-03	1128	\N	39519	\N
49320	GENERIC_DAY	1	11	\N	2010-10-07	1128	\N	39519	\N
49321	GENERIC_DAY	1	10	\N	2010-08-17	1128	\N	39519	\N
49322	GENERIC_DAY	1	11	\N	2010-09-22	1126	\N	39519	\N
49323	GENERIC_DAY	1	0	\N	2010-10-24	1126	\N	39519	\N
49324	GENERIC_DAY	1	0	\N	2010-08-22	1130	\N	39519	\N
49325	GENERIC_DAY	1	11	\N	2010-09-08	1130	\N	39519	\N
49326	GENERIC_DAY	1	0	\N	2010-10-31	1126	\N	39519	\N
49327	GENERIC_DAY	1	11	\N	2010-10-05	1126	\N	39519	\N
49328	GENERIC_DAY	1	11	\N	2010-09-22	1130	\N	39519	\N
49329	GENERIC_DAY	1	0	\N	2010-09-19	1130	\N	39519	\N
49330	GENERIC_DAY	1	10	\N	2010-09-10	1130	\N	39519	\N
49331	GENERIC_DAY	1	10	\N	2010-09-09	1126	\N	39519	\N
49332	GENERIC_DAY	1	11	\N	2010-08-31	1130	\N	39519	\N
49333	GENERIC_DAY	1	11	\N	2010-09-21	1126	\N	39519	\N
49334	GENERIC_DAY	1	11	\N	2010-09-15	1130	\N	39519	\N
49335	GENERIC_DAY	1	11	\N	2010-08-19	1130	\N	39519	\N
49336	GENERIC_DAY	1	0	\N	2010-10-30	1130	\N	39519	\N
49337	GENERIC_DAY	1	11	\N	2010-08-23	1128	\N	39519	\N
49338	GENERIC_DAY	1	10	\N	2010-08-09	1128	\N	39519	\N
49339	GENERIC_DAY	1	0	\N	2010-10-17	1130	\N	39519	\N
49340	GENERIC_DAY	1	11	\N	2010-08-24	1128	\N	39519	\N
49341	GENERIC_DAY	1	0	\N	2010-08-15	1126	\N	39519	\N
49342	GENERIC_DAY	1	5	\N	2010-11-05	1130	\N	39519	\N
49343	GENERIC_DAY	1	11	\N	2010-09-27	1128	\N	39519	\N
49344	GENERIC_DAY	1	0	\N	2010-10-30	1128	\N	39519	\N
49345	GENERIC_DAY	1	10	\N	2010-09-29	1130	\N	39519	\N
49346	GENERIC_DAY	1	11	\N	2010-10-22	1126	\N	39519	\N
49347	GENERIC_DAY	1	10	\N	2010-11-02	1130	\N	39519	\N
49348	GENERIC_DAY	1	0	\N	2010-09-04	1130	\N	39519	\N
49349	GENERIC_DAY	1	11	\N	2010-10-28	1128	\N	39519	\N
49350	GENERIC_DAY	1	11	\N	2010-09-07	1128	\N	39519	\N
49351	GENERIC_DAY	1	10	\N	2010-10-18	1130	\N	39519	\N
49352	GENERIC_DAY	1	10	\N	2010-09-22	1128	\N	39519	\N
49353	GENERIC_DAY	1	10	\N	2010-10-25	1130	\N	39519	\N
49354	GENERIC_DAY	1	11	\N	2010-09-14	1126	\N	39519	\N
49355	GENERIC_DAY	1	11	\N	2010-10-06	1128	\N	39519	\N
49356	GENERIC_DAY	1	11	\N	2010-09-23	1128	\N	39519	\N
49357	GENERIC_DAY	1	10	\N	2010-10-07	1130	\N	39519	\N
49358	GENERIC_DAY	1	0	\N	2010-08-21	1130	\N	39519	\N
49359	GENERIC_DAY	1	11	\N	2010-08-20	1130	\N	39519	\N
49360	GENERIC_DAY	1	0	\N	2010-08-07	1128	\N	39519	\N
49361	GENERIC_DAY	1	10	\N	2010-10-05	1130	\N	39519	\N
49362	GENERIC_DAY	1	0	\N	2010-08-15	1128	\N	39519	\N
49363	GENERIC_DAY	1	11	\N	2010-09-01	1128	\N	39519	\N
49364	GENERIC_DAY	1	11	\N	2010-09-02	1128	\N	39519	\N
49365	GENERIC_DAY	1	10	\N	2010-10-26	1130	\N	39519	\N
49366	GENERIC_DAY	1	11	\N	2010-10-20	1126	\N	39519	\N
49367	GENERIC_DAY	1	0	\N	2010-08-22	1128	\N	39519	\N
49368	GENERIC_DAY	1	0	\N	2010-08-07	1126	\N	39519	\N
49369	GENERIC_DAY	1	10	\N	2010-09-21	1128	\N	39519	\N
49370	GENERIC_DAY	1	10	\N	2010-10-22	1130	\N	39519	\N
49371	GENERIC_DAY	1	11	\N	2010-08-31	1128	\N	39519	\N
49372	GENERIC_DAY	1	11	\N	2010-10-11	1128	\N	39519	\N
49373	GENERIC_DAY	1	11	\N	2010-09-27	1126	\N	39519	\N
49374	GENERIC_DAY	1	10	\N	2010-11-04	1130	\N	39519	\N
49375	GENERIC_DAY	1	11	\N	2010-11-02	1128	\N	39519	\N
49376	GENERIC_DAY	1	0	\N	2010-10-09	1126	\N	39519	\N
49377	GENERIC_DAY	1	10	\N	2010-10-19	1130	\N	39519	\N
49378	GENERIC_DAY	1	11	\N	2010-10-18	1128	\N	39519	\N
49379	GENERIC_DAY	1	0	\N	2010-09-04	1128	\N	39519	\N
49380	GENERIC_DAY	1	11	\N	2010-10-13	1128	\N	39519	\N
49381	GENERIC_DAY	1	11	\N	2010-11-04	1126	\N	39519	\N
49382	GENERIC_DAY	1	10	\N	2010-09-08	1126	\N	39519	\N
49383	GENERIC_DAY	1	11	\N	2010-09-24	1128	\N	39519	\N
49384	GENERIC_DAY	1	11	\N	2010-09-17	1126	\N	39519	\N
49385	GENERIC_DAY	1	11	\N	2010-09-29	1128	\N	39519	\N
49386	GENERIC_DAY	1	11	\N	2010-08-13	1126	\N	39519	\N
49387	GENERIC_DAY	1	10	\N	2010-08-13	1128	\N	39519	\N
49388	GENERIC_DAY	1	0	\N	2010-10-03	1128	\N	39519	\N
49389	GENERIC_DAY	1	0	\N	2010-10-24	1130	\N	39519	\N
49390	GENERIC_DAY	1	0	\N	2010-10-02	1126	\N	39519	\N
49391	GENERIC_DAY	1	11	\N	2010-09-16	1130	\N	39519	\N
49392	GENERIC_DAY	1	11	\N	2010-10-18	1126	\N	39519	\N
49393	GENERIC_DAY	1	0	\N	2010-09-19	1128	\N	39519	\N
49394	GENERIC_DAY	1	11	\N	2010-10-26	1126	\N	39519	\N
49395	GENERIC_DAY	1	10	\N	2010-09-17	1128	\N	39519	\N
49396	GENERIC_DAY	1	11	\N	2010-10-13	1126	\N	39519	\N
49397	GENERIC_DAY	1	11	\N	2010-08-09	1130	\N	39519	\N
49398	GENERIC_DAY	1	0	\N	2010-10-03	1126	\N	39519	\N
49399	GENERIC_DAY	1	10	\N	2010-08-11	1128	\N	39519	\N
49400	GENERIC_DAY	1	0	\N	2010-08-28	1126	\N	39519	\N
49401	GENERIC_DAY	1	11	\N	2010-09-10	1126	\N	39519	\N
49402	GENERIC_DAY	1	10	\N	2010-09-20	1128	\N	39519	\N
49403	GENERIC_DAY	1	11	\N	2010-10-04	1128	\N	39519	\N
49404	GENERIC_DAY	1	11	\N	2010-10-29	1126	\N	39519	\N
49405	GENERIC_DAY	1	11	\N	2010-10-20	1128	\N	39519	\N
49406	GENERIC_DAY	1	11	\N	2010-09-24	1126	\N	39519	\N
49407	GENERIC_DAY	1	11	\N	2010-09-20	1126	\N	39519	\N
49408	GENERIC_DAY	1	0	\N	2010-10-02	1128	\N	39519	\N
49409	GENERIC_DAY	1	10	\N	2010-11-03	1130	\N	39519	\N
49410	GENERIC_DAY	1	11	\N	2010-10-14	1126	\N	39519	\N
49411	GENERIC_DAY	1	11	\N	2010-09-07	1130	\N	39519	\N
49412	GENERIC_DAY	1	11	\N	2010-09-13	1126	\N	39519	\N
49413	GENERIC_DAY	1	0	\N	2010-09-25	1128	\N	39519	\N
49414	GENERIC_DAY	1	11	\N	2010-10-22	1128	\N	39519	\N
49415	GENERIC_DAY	1	0	\N	2010-09-26	1128	\N	39519	\N
49416	GENERIC_DAY	1	0	\N	2010-10-31	1130	\N	39519	\N
49417	GENERIC_DAY	1	0	\N	2010-09-26	1130	\N	39519	\N
49418	GENERIC_DAY	1	11	\N	2010-09-28	1126	\N	39519	\N
49419	GENERIC_DAY	1	11	\N	2010-09-20	1130	\N	39519	\N
49420	GENERIC_DAY	1	10	\N	2010-09-01	1126	\N	39519	\N
49421	GENERIC_DAY	1	11	\N	2010-09-03	1130	\N	39519	\N
49422	GENERIC_DAY	1	11	\N	2010-08-19	1128	\N	39519	\N
49423	GENERIC_DAY	1	11	\N	2010-08-11	1126	\N	39519	\N
49424	GENERIC_DAY	1	11	\N	2010-08-11	1130	\N	39519	\N
49425	GENERIC_DAY	1	11	\N	2010-09-30	1128	\N	39519	\N
49426	GENERIC_DAY	1	11	\N	2010-08-12	1126	\N	39519	\N
49427	GENERIC_DAY	1	0	\N	2010-08-29	1128	\N	39519	\N
49428	GENERIC_DAY	1	11	\N	2010-11-02	1126	\N	39519	\N
49429	GENERIC_DAY	1	11	\N	2010-09-15	1126	\N	39519	\N
49430	GENERIC_DAY	1	11	\N	2010-10-19	1128	\N	39519	\N
49431	GENERIC_DAY	1	10	\N	2010-09-03	1126	\N	39519	\N
49432	GENERIC_DAY	1	0	\N	2010-10-31	1128	\N	39519	\N
49433	GENERIC_DAY	1	11	\N	2010-08-24	1130	\N	39519	\N
49434	GENERIC_DAY	1	11	\N	2010-10-06	1126	\N	39519	\N
49435	GENERIC_DAY	1	10	\N	2010-10-11	1130	\N	39519	\N
49436	GENERIC_DAY	1	0	\N	2010-09-05	1126	\N	39519	\N
49437	GENERIC_DAY	1	0	\N	2010-10-24	1128	\N	39519	\N
49438	GENERIC_DAY	1	11	\N	2010-09-29	1126	\N	39519	\N
49439	GENERIC_DAY	1	10	\N	2010-09-28	1130	\N	39519	\N
49440	GENERIC_DAY	1	11	\N	2010-10-11	1126	\N	39519	\N
49441	GENERIC_DAY	1	11	\N	2010-10-21	1126	\N	39519	\N
49442	GENERIC_DAY	1	10	\N	2010-08-16	1128	\N	39519	\N
49443	GENERIC_DAY	1	10	\N	2010-10-29	1130	\N	39519	\N
49444	GENERIC_DAY	1	0	\N	2010-08-21	1126	\N	39519	\N
49445	GENERIC_DAY	1	11	\N	2010-08-23	1130	\N	39519	\N
49446	GENERIC_DAY	1	10	\N	2010-10-15	1130	\N	39519	\N
49447	GENERIC_DAY	1	10	\N	2010-08-26	1126	\N	39519	\N
49448	GENERIC_DAY	1	11	\N	2010-10-25	1128	\N	39519	\N
49449	GENERIC_DAY	1	10	\N	2010-10-20	1130	\N	39519	\N
49450	GENERIC_DAY	1	11	\N	2010-08-16	1126	\N	39519	\N
49451	GENERIC_DAY	1	0	\N	2010-10-10	1130	\N	39519	\N
49452	GENERIC_DAY	1	0	\N	2010-08-08	1126	\N	39519	\N
49453	GENERIC_DAY	1	10	\N	2010-10-08	1130	\N	39519	\N
49454	GENERIC_DAY	1	6	\N	2010-11-05	1126	\N	39519	\N
49455	GENERIC_DAY	1	0	\N	2010-10-30	1126	\N	39519	\N
49456	GENERIC_DAY	1	5	\N	2010-11-05	1128	\N	39519	\N
49457	GENERIC_DAY	1	11	\N	2010-08-26	1130	\N	39519	\N
49458	GENERIC_DAY	1	10	\N	2010-08-27	1126	\N	39519	\N
49459	GENERIC_DAY	1	10	\N	2010-08-24	1126	\N	39519	\N
49460	GENERIC_DAY	1	10	\N	2010-10-01	1130	\N	39519	\N
49461	GENERIC_DAY	1	11	\N	2010-10-19	1126	\N	39519	\N
49462	GENERIC_DAY	1	0	\N	2010-09-04	1126	\N	39519	\N
49463	GENERIC_DAY	1	11	\N	2010-09-01	1130	\N	39519	\N
49464	GENERIC_DAY	1	0	\N	2010-10-16	1128	\N	39519	\N
49465	GENERIC_DAY	1	0	\N	2010-08-14	1128	\N	39519	\N
49466	GENERIC_DAY	1	11	\N	2010-09-16	1126	\N	39519	\N
49467	GENERIC_DAY	1	11	\N	2010-11-03	1126	\N	39519	\N
49468	GENERIC_DAY	1	0	\N	2010-09-12	1130	\N	39519	\N
49469	GENERIC_DAY	1	11	\N	2010-08-12	1130	\N	39519	\N
49470	GENERIC_DAY	1	0	\N	2010-10-16	1126	\N	39519	\N
49471	GENERIC_DAY	1	11	\N	2010-08-25	1130	\N	39519	\N
49472	GENERIC_DAY	1	10	\N	2010-10-13	1130	\N	39519	\N
49473	GENERIC_DAY	1	0	\N	2010-10-17	1126	\N	39519	\N
49474	GENERIC_DAY	1	11	\N	2010-10-21	1128	\N	39519	\N
49475	GENERIC_DAY	1	11	\N	2010-09-02	1130	\N	39519	\N
49476	GENERIC_DAY	1	11	\N	2010-08-10	1126	\N	39519	\N
49477	GENERIC_DAY	1	0	\N	2010-09-05	1128	\N	39519	\N
27850	GENERIC_DAY	3	3	\N	2010-06-18	1134	\N	27675	\N
27875	GENERIC_DAY	3	0	\N	2010-06-19	1132	\N	27675	\N
27880	GENERIC_DAY	3	2	\N	2010-06-10	1136	\N	27675	\N
27834	GENERIC_DAY	3	3	\N	2010-06-25	1132	\N	27675	\N
27833	GENERIC_DAY	3	3	\N	2010-06-15	1134	\N	27675	\N
27857	GENERIC_DAY	3	0	\N	2010-06-26	1136	\N	27675	\N
27832	GENERIC_DAY	3	3	\N	2010-06-23	1134	\N	27675	\N
27856	GENERIC_DAY	3	2	\N	2010-06-21	1136	\N	27675	\N
27868	GENERIC_DAY	3	3	\N	2010-06-14	1134	\N	27675	\N
27853	GENERIC_DAY	3	3	\N	2010-06-22	1132	\N	27675	\N
27866	GENERIC_DAY	3	2	\N	2010-06-25	1136	\N	27675	\N
27882	GENERIC_DAY	3	0	\N	2010-06-13	1136	\N	27675	\N
27885	GENERIC_DAY	3	2	\N	2010-06-11	1136	\N	27675	\N
27855	GENERIC_DAY	3	1	\N	2010-06-28	1136	\N	27675	\N
27858	GENERIC_DAY	3	0	\N	2010-06-27	1134	\N	27675	\N
27845	GENERIC_DAY	3	0	\N	2010-06-19	1136	\N	27675	\N
27778	GENERIC_DAY	3	2	\N	2010-06-25	1130	\N	27674	\N
27804	GENERIC_DAY	3	1	\N	2010-06-28	1130	\N	27674	\N
27788	GENERIC_DAY	3	2	\N	2010-06-22	1130	\N	27674	\N
27825	GENERIC_DAY	3	2	\N	2010-06-18	1130	\N	27674	\N
27784	GENERIC_DAY	3	3	\N	2010-06-23	1128	\N	27674	\N
27808	GENERIC_DAY	3	3	\N	2010-06-25	1128	\N	27674	\N
27795	GENERIC_DAY	3	3	\N	2010-06-11	1128	\N	27674	\N
27811	GENERIC_DAY	3	3	\N	2010-06-16	1126	\N	27674	\N
27827	GENERIC_DAY	3	0	\N	2010-06-20	1126	\N	27674	\N
27822	GENERIC_DAY	3	0	\N	2010-06-12	1128	\N	27674	\N
27798	GENERIC_DAY	3	0	\N	2010-06-20	1130	\N	27674	\N
27802	GENERIC_DAY	3	2	\N	2010-06-23	1130	\N	27674	\N
27819	GENERIC_DAY	3	2	\N	2010-06-14	1130	\N	27674	\N
27777	GENERIC_DAY	3	3	\N	2010-06-17	1128	\N	27674	\N
27809	GENERIC_DAY	3	2	\N	2010-06-16	1130	\N	27674	\N
27829	GENERIC_DAY	3	0	\N	2010-06-19	1128	\N	27674	\N
27826	GENERIC_DAY	3	2	\N	2010-06-15	1130	\N	27674	\N
27831	GENERIC_DAY	3	3	\N	2010-06-24	1126	\N	27674	\N
27794	GENERIC_DAY	3	3	\N	2010-06-15	1126	\N	27674	\N
27799	GENERIC_DAY	3	0	\N	2010-06-12	1126	\N	27674	\N
27813	GENERIC_DAY	3	2	\N	2010-06-11	1130	\N	27674	\N
27821	GENERIC_DAY	3	1	\N	2010-06-28	1128	\N	27674	\N
27779	GENERIC_DAY	3	0	\N	2010-06-13	1128	\N	27674	\N
27781	GENERIC_DAY	3	0	\N	2010-06-26	1130	\N	27674	\N
27803	GENERIC_DAY	3	2	\N	2010-06-21	1130	\N	27674	\N
27776	GENERIC_DAY	3	0	\N	2010-06-19	1130	\N	27674	\N
27830	GENERIC_DAY	3	3	\N	2010-06-14	1128	\N	27674	\N
27787	GENERIC_DAY	3	0	\N	2010-06-13	1126	\N	27674	\N
27796	GENERIC_DAY	3	3	\N	2010-06-22	1126	\N	27674	\N
27786	GENERIC_DAY	3	2	\N	2010-06-28	1126	\N	27674	\N
27812	GENERIC_DAY	3	3	\N	2010-06-24	1128	\N	27674	\N
27824	GENERIC_DAY	3	0	\N	2010-06-12	1130	\N	27674	\N
27782	GENERIC_DAY	3	3	\N	2010-06-18	1128	\N	27674	\N
27818	GENERIC_DAY	3	3	\N	2010-06-21	1128	\N	27674	\N
27791	GENERIC_DAY	3	3	\N	2010-06-10	1128	\N	27674	\N
27806	GENERIC_DAY	3	3	\N	2010-06-10	1126	\N	27674	\N
27815	GENERIC_DAY	3	3	\N	2010-06-11	1126	\N	27674	\N
27823	GENERIC_DAY	3	2	\N	2010-06-24	1130	\N	27674	\N
27797	GENERIC_DAY	3	3	\N	2010-06-18	1126	\N	27674	\N
27775	GENERIC_DAY	3	0	\N	2010-06-26	1128	\N	27674	\N
27816	GENERIC_DAY	3	0	\N	2010-06-20	1128	\N	27674	\N
27820	GENERIC_DAY	3	0	\N	2010-06-19	1126	\N	27674	\N
27807	GENERIC_DAY	3	0	\N	2010-06-27	1130	\N	27674	\N
27801	GENERIC_DAY	3	2	\N	2010-06-17	1130	\N	27674	\N
27783	GENERIC_DAY	3	3	\N	2010-06-23	1126	\N	27674	\N
27785	GENERIC_DAY	3	3	\N	2010-06-17	1126	\N	27674	\N
27789	GENERIC_DAY	3	3	\N	2010-06-16	1128	\N	27674	\N
27790	GENERIC_DAY	3	0	\N	2010-06-26	1126	\N	27674	\N
27810	GENERIC_DAY	3	3	\N	2010-06-14	1126	\N	27674	\N
27792	GENERIC_DAY	3	0	\N	2010-06-27	1126	\N	27674	\N
27780	GENERIC_DAY	3	0	\N	2010-06-13	1130	\N	27674	\N
27805	GENERIC_DAY	3	0	\N	2010-06-27	1128	\N	27674	\N
27814	GENERIC_DAY	3	3	\N	2010-06-15	1128	\N	27674	\N
27828	GENERIC_DAY	3	3	\N	2010-06-21	1126	\N	27674	\N
27817	GENERIC_DAY	3	3	\N	2010-06-25	1126	\N	27674	\N
27800	GENERIC_DAY	3	3	\N	2010-06-22	1128	\N	27674	\N
27793	GENERIC_DAY	3	2	\N	2010-06-10	1130	\N	27674	\N
47055	GENERIC_DAY	2	11	\N	2010-08-20	1130	\N	39509	\N
46979	GENERIC_DAY	2	11	\N	2010-08-23	1126	\N	39509	\N
47194	GENERIC_DAY	2	0	\N	2010-08-14	1128	\N	39509	\N
47060	GENERIC_DAY	2	11	\N	2010-07-21	1126	\N	39509	\N
47021	GENERIC_DAY	2	0	\N	2010-07-03	1130	\N	39509	\N
47127	GENERIC_DAY	2	11	\N	2010-08-04	1128	\N	39509	\N
47171	GENERIC_DAY	2	0	\N	2010-07-31	1126	\N	39509	\N
47157	GENERIC_DAY	2	0	\N	2010-08-21	1128	\N	39509	\N
47007	GENERIC_DAY	2	0	\N	2010-08-28	1126	\N	39509	\N
47150	GENERIC_DAY	2	0	\N	2010-08-22	1128	\N	39509	\N
46974	GENERIC_DAY	2	10	\N	2010-08-23	1128	\N	39509	\N
47218	GENERIC_DAY	2	11	\N	2010-08-17	1126	\N	39509	\N
47109	GENERIC_DAY	2	10	\N	2010-07-07	1130	\N	39509	\N
47180	GENERIC_DAY	2	0	\N	2010-08-01	1130	\N	39509	\N
47208	GENERIC_DAY	2	5	\N	2010-09-23	1128	\N	39509	\N
46983	GENERIC_DAY	2	0	\N	2010-08-08	1130	\N	39509	\N
47074	GENERIC_DAY	2	10	\N	2010-07-19	1130	\N	39509	\N
47201	GENERIC_DAY	2	11	\N	2010-08-18	1130	\N	39509	\N
47099	GENERIC_DAY	2	0	\N	2010-08-29	1128	\N	39509	\N
47011	GENERIC_DAY	2	0	\N	2010-09-18	1130	\N	39509	\N
47200	GENERIC_DAY	2	11	\N	2010-08-12	1128	\N	39509	\N
46993	GENERIC_DAY	2	11	\N	2010-09-22	1128	\N	39509	\N
47156	GENERIC_DAY	2	11	\N	2010-09-16	1126	\N	39509	\N
47181	GENERIC_DAY	2	11	\N	2010-08-25	1130	\N	39509	\N
47175	GENERIC_DAY	2	10	\N	2010-08-25	1128	\N	39509	\N
47070	GENERIC_DAY	2	11	\N	2010-09-21	1128	\N	39509	\N
47182	GENERIC_DAY	2	10	\N	2010-07-02	1130	\N	39509	\N
46999	GENERIC_DAY	2	0	\N	2010-08-07	1128	\N	39509	\N
47113	GENERIC_DAY	2	0	\N	2010-07-11	1126	\N	39509	\N
47049	GENERIC_DAY	2	10	\N	2010-08-26	1128	\N	39509	\N
47135	GENERIC_DAY	2	10	\N	2010-08-12	1130	\N	39509	\N
47075	GENERIC_DAY	2	10	\N	2010-09-09	1128	\N	39509	\N
46984	GENERIC_DAY	2	11	\N	2010-08-06	1128	\N	39509	\N
47117	GENERIC_DAY	2	11	\N	2010-09-17	1126	\N	39509	\N
47222	GENERIC_DAY	2	0	\N	2010-09-12	1126	\N	39509	\N
47003	GENERIC_DAY	2	0	\N	2010-07-17	1128	\N	39509	\N
47225	GENERIC_DAY	2	11	\N	2010-08-27	1130	\N	39509	\N
47130	GENERIC_DAY	2	10	\N	2010-09-08	1128	\N	39509	\N
47152	GENERIC_DAY	2	0	\N	2010-09-05	1128	\N	39509	\N
46989	GENERIC_DAY	2	0	\N	2010-09-18	1126	\N	39509	\N
47178	GENERIC_DAY	2	10	\N	2010-08-16	1130	\N	39509	\N
47081	GENERIC_DAY	2	11	\N	2010-08-11	1128	\N	39509	\N
47198	GENERIC_DAY	2	0	\N	2010-09-12	1130	\N	39509	\N
47132	GENERIC_DAY	2	11	\N	2010-07-02	1126	\N	39509	\N
47035	GENERIC_DAY	2	0	\N	2010-08-22	1130	\N	39509	\N
47093	GENERIC_DAY	2	11	\N	2010-09-17	1128	\N	39509	\N
47072	GENERIC_DAY	2	11	\N	2010-07-01	1126	\N	39509	\N
47045	GENERIC_DAY	2	11	\N	2010-07-28	1126	\N	39509	\N
47086	GENERIC_DAY	2	0	\N	2010-09-19	1126	\N	39509	\N
47031	GENERIC_DAY	2	11	\N	2010-07-27	1128	\N	39509	\N
46998	GENERIC_DAY	2	10	\N	2010-07-20	1130	\N	39509	\N
47177	GENERIC_DAY	2	10	\N	2010-07-16	1130	\N	39509	\N
47103	GENERIC_DAY	2	11	\N	2010-09-06	1130	\N	39509	\N
47073	GENERIC_DAY	2	0	\N	2010-07-25	1128	\N	39509	\N
47091	GENERIC_DAY	2	10	\N	2010-07-22	1130	\N	39509	\N
46975	GENERIC_DAY	2	11	\N	2010-08-11	1126	\N	39509	\N
47215	GENERIC_DAY	2	10	\N	2010-08-19	1128	\N	39509	\N
3442473	GENERIC_DAY	2	4	\N	2010-08-25	38997	\N	57180	\N
3442574	GENERIC_DAY	2	3	\N	2010-11-04	38997	\N	57180	\N
3442370	GENERIC_DAY	2	4	\N	2010-12-02	38993	\N	57180	\N
3442471	GENERIC_DAY	2	5	\N	2010-07-21	38993	\N	57180	\N
3442547	GENERIC_DAY	2	4	\N	2010-08-19	38997	\N	57180	\N
3442350	GENERIC_DAY	2	4	\N	2010-06-10	38997	\N	57180	\N
3442649	GENERIC_DAY	2	1	\N	2010-10-10	38993	\N	57180	\N
3442392	GENERIC_DAY	2	5	\N	2010-08-11	38993	\N	57180	\N
3442407	GENERIC_DAY	2	4	\N	2010-12-21	38993	\N	57180	\N
3442352	GENERIC_DAY	2	5	\N	2010-09-22	38993	\N	57180	\N
3442669	GENERIC_DAY	2	6	\N	2010-09-16	38993	\N	57180	\N
3442663	GENERIC_DAY	2	1	\N	2010-08-15	38993	\N	57180	\N
3442513	GENERIC_DAY	2	3	\N	2010-09-21	38997	\N	57180	\N
3442660	GENERIC_DAY	2	5	\N	2010-07-12	38993	\N	57180	\N
3442651	GENERIC_DAY	2	4	\N	2010-07-21	38997	\N	57180	\N
3442361	GENERIC_DAY	2	4	\N	2010-06-24	38997	\N	57180	\N
3442501	GENERIC_DAY	2	1	\N	2010-07-03	38993	\N	57180	\N
3442521	GENERIC_DAY	2	4	\N	2010-10-18	38997	\N	57180	\N
3442595	GENERIC_DAY	2	4	\N	2010-09-01	38997	\N	57180	\N
3442393	GENERIC_DAY	2	5	\N	2010-07-15	38993	\N	57180	\N
3442430	GENERIC_DAY	2	3	\N	2010-11-16	38997	\N	57180	\N
3442455	GENERIC_DAY	2	5	\N	2010-06-16	38993	\N	57180	\N
3442697	GENERIC_DAY	2	4	\N	2011-01-04	38997	\N	57180	\N
3442690	GENERIC_DAY	2	4	\N	2011-01-07	38993	\N	57180	\N
3442650	GENERIC_DAY	2	4	\N	2010-07-23	38997	\N	57180	\N
3442362	GENERIC_DAY	2	5	\N	2010-07-22	38993	\N	57180	\N
3442643	GENERIC_DAY	2	4	\N	2010-11-18	38997	\N	57180	\N
3442458	GENERIC_DAY	2	6	\N	2010-09-20	38993	\N	57180	\N
3442553	GENERIC_DAY	2	4	\N	2010-10-14	38993	\N	57180	\N
3442570	GENERIC_DAY	2	4	\N	2011-01-19	38993	\N	57180	\N
3442689	GENERIC_DAY	2	5	\N	2010-09-01	38993	\N	57180	\N
3442633	GENERIC_DAY	2	4	\N	2010-10-25	38997	\N	57180	\N
3442481	GENERIC_DAY	2	4	\N	2010-10-22	38997	\N	57180	\N
3442397	GENERIC_DAY	2	3	\N	2010-11-29	38997	\N	57180	\N
3442632	GENERIC_DAY	2	4	\N	2010-07-08	38997	\N	57180	\N
3442487	GENERIC_DAY	2	5	\N	2010-10-27	38993	\N	57180	\N
3442588	GENERIC_DAY	2	4	\N	2010-12-29	38993	\N	57180	\N
3442453	GENERIC_DAY	2	4	\N	2010-12-28	38997	\N	57180	\N
3443265	GENERIC_DAY	2	8	\N	2010-06-01	39022	\N	2379862	\N
3443266	GENERIC_DAY	2	8	\N	2010-06-01	39015	\N	2379862	\N
3443272	GENERIC_DAY	2	8	\N	2010-06-21	39022	\N	2379862	\N
3443273	GENERIC_DAY	2	8	\N	2010-06-23	39015	\N	2379862	\N
3443283	GENERIC_DAY	2	8	\N	2010-06-11	39022	\N	2379862	\N
3443311	GENERIC_DAY	2	0	\N	2010-06-05	39022	\N	2379862	\N
3443314	GENERIC_DAY	2	8	\N	2010-06-17	39015	\N	2379862	\N
3443301	GENERIC_DAY	2	8	\N	2010-06-07	39015	\N	2379862	\N
3443284	GENERIC_DAY	2	8	\N	2010-06-17	39022	\N	2379862	\N
3443267	GENERIC_DAY	2	0	\N	2010-06-13	39015	\N	2379862	\N
3468748	GENERIC_DAY	3	5	\N	2010-05-12	1123	\N	24072	\N
3468749	GENERIC_DAY	3	15	\N	2010-05-19	1121	\N	24072	\N
3468750	GENERIC_DAY	3	6	\N	2010-05-10	1121	\N	24072	\N
3468751	GENERIC_DAY	3	9	\N	2010-05-08	1119	\N	24072	\N
3468752	GENERIC_DAY	3	4	\N	2010-05-11	1121	\N	24072	\N
3468753	GENERIC_DAY	3	15	\N	2010-05-19	1123	\N	24072	\N
3468754	GENERIC_DAY	3	14	\N	2010-05-21	1123	\N	24072	\N
3468755	GENERIC_DAY	3	5	\N	2010-05-12	1119	\N	24072	\N
3468756	GENERIC_DAY	3	10	\N	2010-05-07	1123	\N	24072	\N
3468757	GENERIC_DAY	3	15	\N	2010-05-18	1121	\N	24072	\N
3468758	GENERIC_DAY	3	10	\N	2010-05-07	1121	\N	24072	\N
3468759	GENERIC_DAY	3	11	\N	2010-05-14	1119	\N	24072	\N
3468760	GENERIC_DAY	3	11	\N	2010-05-14	1123	\N	24072	\N
3468761	GENERIC_DAY	3	9	\N	2010-05-07	1119	\N	24072	\N
3468762	GENERIC_DAY	3	16	\N	2010-05-16	1123	\N	24072	\N
3468763	GENERIC_DAY	3	16	\N	2010-05-16	1121	\N	24072	\N
3468764	GENERIC_DAY	3	16	\N	2010-05-18	1119	\N	24072	\N
3468765	GENERIC_DAY	3	14	\N	2010-05-20	1121	\N	24072	\N
3468766	GENERIC_DAY	3	8	\N	2010-05-09	1121	\N	24072	\N
3468767	GENERIC_DAY	3	9	\N	2010-05-08	1121	\N	24072	\N
3468768	GENERIC_DAY	3	4	\N	2010-05-11	1123	\N	24072	\N
3468769	GENERIC_DAY	3	5	\N	2010-05-12	1121	\N	24072	\N
3468770	GENERIC_DAY	3	11	\N	2010-05-14	1121	\N	24072	\N
3468771	GENERIC_DAY	3	7	\N	2010-05-13	1119	\N	24072	\N
3468772	GENERIC_DAY	3	7	\N	2010-05-10	1119	\N	24072	\N
3468773	GENERIC_DAY	3	7	\N	2010-05-13	1123	\N	24072	\N
3468774	GENERIC_DAY	3	9	\N	2010-05-09	1119	\N	24072	\N
3468775	GENERIC_DAY	3	15	\N	2010-05-15	1119	\N	24072	\N
3468776	GENERIC_DAY	3	14	\N	2010-05-15	1121	\N	24072	\N
3468777	GENERIC_DAY	3	9	\N	2010-05-08	1123	\N	24072	\N
3468778	GENERIC_DAY	3	14	\N	2010-05-15	1123	\N	24072	\N
3468779	GENERIC_DAY	3	14	\N	2010-05-21	1121	\N	24072	\N
3468780	GENERIC_DAY	3	7	\N	2010-05-10	1123	\N	24072	\N
3468781	GENERIC_DAY	3	14	\N	2010-05-21	1119	\N	24072	\N
3468782	GENERIC_DAY	3	5	\N	2010-05-11	1119	\N	24072	\N
3468783	GENERIC_DAY	3	14	\N	2010-05-20	1123	\N	24072	\N
3468784	GENERIC_DAY	3	8	\N	2010-05-13	1121	\N	24072	\N
3468785	GENERIC_DAY	3	15	\N	2010-05-18	1123	\N	24072	\N
3468786	GENERIC_DAY	3	14	\N	2010-05-20	1119	\N	24072	\N
3468787	GENERIC_DAY	3	8	\N	2010-05-09	1123	\N	24072	\N
3468788	GENERIC_DAY	3	16	\N	2010-05-16	1119	\N	24072	\N
3468789	GENERIC_DAY	3	15	\N	2010-05-19	1119	\N	24072	\N
3468790	GENERIC_DAY	3	0	\N	2010-05-16	1119	\N	24074	\N
3468791	GENERIC_DAY	3	0	\N	2010-05-15	1119	\N	24074	\N
3468792	GENERIC_DAY	3	14	\N	2010-05-10	1119	\N	24074	\N
3468793	GENERIC_DAY	3	14	\N	2010-05-18	1119	\N	24074	\N
3468794	GENERIC_DAY	3	15	\N	2010-05-12	1119	\N	24074	\N
3468795	GENERIC_DAY	3	14	\N	2010-05-13	1123	\N	24074	\N
3468796	GENERIC_DAY	3	0	\N	2010-05-08	1121	\N	24074	\N
3468797	GENERIC_DAY	3	0	\N	2010-05-15	1123	\N	24074	\N
3468798	GENERIC_DAY	3	0	\N	2010-05-16	1121	\N	24074	\N
3468799	GENERIC_DAY	3	14	\N	2010-05-11	1123	\N	24074	\N
3468800	GENERIC_DAY	3	0	\N	2010-05-15	1121	\N	24074	\N
3468801	GENERIC_DAY	3	14	\N	2010-05-18	1123	\N	24074	\N
3468802	GENERIC_DAY	3	0	\N	2010-05-09	1119	\N	24074	\N
3468803	GENERIC_DAY	3	15	\N	2010-05-10	1121	\N	24074	\N
3468804	GENERIC_DAY	3	14	\N	2010-05-11	1119	\N	24074	\N
3468805	GENERIC_DAY	3	14	\N	2010-05-18	1121	\N	24074	\N
3468806	GENERIC_DAY	3	0	\N	2010-05-08	1119	\N	24074	\N
3468807	GENERIC_DAY	3	0	\N	2010-05-09	1121	\N	24074	\N
3468808	GENERIC_DAY	3	15	\N	2010-05-13	1119	\N	24074	\N
3468809	GENERIC_DAY	3	15	\N	2010-05-11	1121	\N	24074	\N
3468810	GENERIC_DAY	3	14	\N	2010-05-07	1123	\N	24074	\N
3468811	GENERIC_DAY	3	14	\N	2010-05-12	1121	\N	24074	\N
3468812	GENERIC_DAY	3	15	\N	2010-05-14	1119	\N	24074	\N
3468813	GENERIC_DAY	3	15	\N	2010-05-07	1119	\N	24074	\N
3468814	GENERIC_DAY	3	14	\N	2010-05-14	1123	\N	24074	\N
3468815	GENERIC_DAY	3	0	\N	2010-05-08	1123	\N	24074	\N
3468816	GENERIC_DAY	3	14	\N	2010-05-14	1121	\N	24074	\N
3468817	GENERIC_DAY	3	14	\N	2010-05-07	1121	\N	24074	\N
3468818	GENERIC_DAY	3	0	\N	2010-05-09	1123	\N	24074	\N
3468819	GENERIC_DAY	3	14	\N	2010-05-12	1123	\N	24074	\N
3468820	GENERIC_DAY	3	14	\N	2010-05-10	1123	\N	24074	\N
3468821	GENERIC_DAY	3	0	\N	2010-05-16	1123	\N	24074	\N
3468822	GENERIC_DAY	3	14	\N	2010-05-13	1121	\N	24074	\N
3468823	GENERIC_DAY	3	0	\N	2010-05-23	1121	\N	24071	\N
3468824	GENERIC_DAY	3	0	\N	2010-05-23	1123	\N	24071	\N
3468825	GENERIC_DAY	3	8	\N	2010-05-24	1123	\N	24071	\N
3468826	GENERIC_DAY	3	8	\N	2010-05-24	1121	\N	24071	\N
3468827	GENERIC_DAY	3	0	\N	2010-05-22	1119	\N	24071	\N
3468828	GENERIC_DAY	3	0	\N	2010-05-23	1119	\N	24071	\N
3468829	GENERIC_DAY	3	8	\N	2010-05-24	1119	\N	24071	\N
3468830	GENERIC_DAY	3	0	\N	2010-05-22	1123	\N	24071	\N
3468831	GENERIC_DAY	3	0	\N	2010-05-22	1121	\N	24071	\N
3468832	GENERIC_DAY	3	1	\N	2010-05-27	1121	\N	2494211	\N
3468833	GENERIC_DAY	3	1	\N	2010-05-27	1123	\N	2494211	\N
3468834	GENERIC_DAY	3	3	\N	2010-05-31	1119	\N	2494211	\N
3468835	GENERIC_DAY	3	4	\N	2010-06-01	1121	\N	2494211	\N
3468836	GENERIC_DAY	3	2	\N	2010-05-25	1123	\N	2494211	\N
3468837	GENERIC_DAY	3	3	\N	2010-06-01	1123	\N	2494211	\N
3468838	GENERIC_DAY	3	4	\N	2010-05-31	1123	\N	2494211	\N
3468839	GENERIC_DAY	3	1	\N	2010-05-27	1119	\N	2494211	\N
3468840	GENERIC_DAY	3	1	\N	2010-05-25	1121	\N	2494211	\N
3468841	GENERIC_DAY	3	1	\N	2010-05-26	1121	\N	2494211	\N
3468842	GENERIC_DAY	3	3	\N	2010-05-28	1123	\N	2494211	\N
3468843	GENERIC_DAY	3	3	\N	2010-06-01	1119	\N	2494211	\N
3468844	GENERIC_DAY	3	3	\N	2010-05-31	1121	\N	2494211	\N
3468845	GENERIC_DAY	3	1	\N	2010-05-26	1123	\N	2494211	\N
3468846	GENERIC_DAY	3	3	\N	2010-05-28	1119	\N	2494211	\N
3468847	GENERIC_DAY	3	1	\N	2010-05-26	1119	\N	2494211	\N
3468848	GENERIC_DAY	3	1	\N	2010-05-25	1119	\N	2494211	\N
3468849	GENERIC_DAY	3	4	\N	2010-05-28	1121	\N	2494211	\N
3468850	GENERIC_DAY	3	0	\N	2010-06-06	1126	\N	2494212	\N
3468851	GENERIC_DAY	3	4	\N	2010-06-07	1126	\N	2494212	\N
3468852	GENERIC_DAY	3	2	\N	2010-06-04	1128	\N	2494212	\N
3468853	GENERIC_DAY	3	4	\N	2010-06-07	1130	\N	2494212	\N
3468854	GENERIC_DAY	3	0	\N	2010-06-05	1128	\N	2494212	\N
3468855	GENERIC_DAY	3	2	\N	2010-06-03	1128	\N	2494212	\N
3468856	GENERIC_DAY	3	4	\N	2010-06-07	1128	\N	2494212	\N
3468857	GENERIC_DAY	3	2	\N	2010-06-03	1130	\N	2494212	\N
3468858	GENERIC_DAY	3	2	\N	2010-06-02	1130	\N	2494212	\N
3468859	GENERIC_DAY	3	0	\N	2010-06-06	1128	\N	2494212	\N
3468860	GENERIC_DAY	3	0	\N	2010-06-05	1126	\N	2494212	\N
3468861	GENERIC_DAY	3	2	\N	2010-06-02	1128	\N	2494212	\N
3468862	GENERIC_DAY	3	2	\N	2010-06-04	1130	\N	2494212	\N
3468863	GENERIC_DAY	3	2	\N	2010-06-03	1126	\N	2494212	\N
3468864	GENERIC_DAY	3	2	\N	2010-06-04	1126	\N	2494212	\N
3468865	GENERIC_DAY	3	2	\N	2010-06-02	1126	\N	2494212	\N
3468866	GENERIC_DAY	3	0	\N	2010-06-06	1130	\N	2494212	\N
3468867	GENERIC_DAY	3	3	\N	2010-06-01	1126	\N	2494212	\N
3468868	GENERIC_DAY	3	4	\N	2010-06-01	1130	\N	2494212	\N
3468869	GENERIC_DAY	3	0	\N	2010-06-05	1130	\N	2494212	\N
3468870	GENERIC_DAY	3	3	\N	2010-06-01	1128	\N	2494212	\N
3468871	GENERIC_DAY	3	0	\N	2010-06-12	1130	\N	2494210	\N
3468872	GENERIC_DAY	3	3	\N	2010-06-14	1126	\N	2494210	\N
3468873	GENERIC_DAY	3	3	\N	2010-06-11	1130	\N	2494210	\N
3468874	GENERIC_DAY	3	2	\N	2010-06-11	1128	\N	2494210	\N
3468875	GENERIC_DAY	3	0	\N	2010-06-19	1128	\N	2494210	\N
3468876	GENERIC_DAY	3	2	\N	2010-06-15	1128	\N	2494210	\N
3468877	GENERIC_DAY	3	3	\N	2010-06-22	1130	\N	2494210	\N
3468878	GENERIC_DAY	3	3	\N	2010-06-15	1126	\N	2494210	\N
3468879	GENERIC_DAY	3	3	\N	2010-06-08	1128	\N	2494210	\N
3468880	GENERIC_DAY	3	2	\N	2010-06-16	1128	\N	2494210	\N
3468881	GENERIC_DAY	3	0	\N	2010-06-12	1126	\N	2494210	\N
3468882	GENERIC_DAY	3	2	\N	2010-06-10	1128	\N	2494210	\N
3468883	GENERIC_DAY	3	3	\N	2010-06-21	1130	\N	2494210	\N
3468884	GENERIC_DAY	3	3	\N	2010-06-17	1126	\N	2494210	\N
3468885	GENERIC_DAY	3	2	\N	2010-06-22	1128	\N	2494210	\N
3468886	GENERIC_DAY	3	3	\N	2010-06-15	1130	\N	2494210	\N
3468887	GENERIC_DAY	3	0	\N	2010-06-20	1130	\N	2494210	\N
3468888	GENERIC_DAY	3	0	\N	2010-06-13	1128	\N	2494210	\N
3468889	GENERIC_DAY	3	3	\N	2010-06-17	1130	\N	2494210	\N
3468890	GENERIC_DAY	3	3	\N	2010-06-16	1126	\N	2494210	\N
3468891	GENERIC_DAY	3	0	\N	2010-06-19	1126	\N	2494210	\N
3468892	GENERIC_DAY	3	3	\N	2010-06-11	1126	\N	2494210	\N
3468893	GENERIC_DAY	3	0	\N	2010-06-13	1130	\N	2494210	\N
3468894	GENERIC_DAY	3	3	\N	2010-06-14	1130	\N	2494210	\N
3468895	GENERIC_DAY	3	3	\N	2010-06-10	1130	\N	2494210	\N
3468896	GENERIC_DAY	3	2	\N	2010-06-09	1130	\N	2494210	\N
3468897	GENERIC_DAY	3	1	\N	2010-06-24	1126	\N	2494210	\N
3468898	GENERIC_DAY	3	0	\N	2010-06-19	1130	\N	2494210	\N
3468899	GENERIC_DAY	3	2	\N	2010-06-18	1128	\N	2494210	\N
3468900	GENERIC_DAY	3	3	\N	2010-06-22	1126	\N	2494210	\N
3468901	GENERIC_DAY	3	0	\N	2010-06-20	1128	\N	2494210	\N
3468902	GENERIC_DAY	3	0	\N	2010-06-12	1128	\N	2494210	\N
3468903	GENERIC_DAY	3	3	\N	2010-06-23	1126	\N	2494210	\N
3468904	GENERIC_DAY	3	1	\N	2010-06-24	1128	\N	2494210	\N
3468905	GENERIC_DAY	3	3	\N	2010-06-18	1126	\N	2494210	\N
3468906	GENERIC_DAY	3	2	\N	2010-06-24	1130	\N	2494210	\N
3468907	GENERIC_DAY	3	0	\N	2010-06-20	1126	\N	2494210	\N
3468908	GENERIC_DAY	3	3	\N	2010-06-18	1130	\N	2494210	\N
3468909	GENERIC_DAY	3	3	\N	2010-06-10	1126	\N	2494210	\N
3468910	GENERIC_DAY	3	3	\N	2010-06-21	1126	\N	2494210	\N
3468911	GENERIC_DAY	3	3	\N	2010-06-09	1128	\N	2494210	\N
3468912	GENERIC_DAY	3	0	\N	2010-06-13	1126	\N	2494210	\N
3468913	GENERIC_DAY	3	3	\N	2010-06-09	1126	\N	2494210	\N
3468914	GENERIC_DAY	3	3	\N	2010-06-16	1130	\N	2494210	\N
3468915	GENERIC_DAY	3	3	\N	2010-06-08	1126	\N	2494210	\N
3468916	GENERIC_DAY	3	2	\N	2010-06-17	1128	\N	2494210	\N
3468917	GENERIC_DAY	3	2	\N	2010-06-21	1128	\N	2494210	\N
3468918	GENERIC_DAY	3	2	\N	2010-06-08	1130	\N	2494210	\N
3468919	GENERIC_DAY	3	2	\N	2010-06-23	1128	\N	2494210	\N
3468920	GENERIC_DAY	3	3	\N	2010-06-23	1130	\N	2494210	\N
3468921	GENERIC_DAY	3	2	\N	2010-06-14	1128	\N	2494210	\N
3468922	SPECIFIC_DAY	3	8	\N	2010-06-28	1130	2494208	\N	\N
3468923	SPECIFIC_DAY	3	0	\N	2010-07-11	1130	2494208	\N	\N
3468924	SPECIFIC_DAY	3	8	\N	2010-07-15	1130	2494208	\N	\N
3468925	SPECIFIC_DAY	3	0	\N	2010-07-04	1130	2494208	\N	\N
3468926	SPECIFIC_DAY	3	4	\N	2010-07-20	1130	2494208	\N	\N
3468927	SPECIFIC_DAY	3	8	\N	2010-06-29	1130	2494208	\N	\N
3468928	SPECIFIC_DAY	3	8	\N	2010-07-08	1130	2494208	\N	\N
3468929	SPECIFIC_DAY	3	8	\N	2010-07-13	1130	2494208	\N	\N
3468930	SPECIFIC_DAY	3	8	\N	2010-07-19	1130	2494208	\N	\N
3468931	SPECIFIC_DAY	3	0	\N	2010-07-03	1130	2494208	\N	\N
3468932	SPECIFIC_DAY	3	8	\N	2010-06-30	1130	2494208	\N	\N
3468933	SPECIFIC_DAY	3	8	\N	2010-07-02	1130	2494208	\N	\N
3468934	SPECIFIC_DAY	3	8	\N	2010-07-06	1130	2494208	\N	\N
3468935	SPECIFIC_DAY	3	0	\N	2010-07-18	1130	2494208	\N	\N
3468936	SPECIFIC_DAY	3	8	\N	2010-07-14	1130	2494208	\N	\N
3468937	SPECIFIC_DAY	3	0	\N	2010-07-17	1130	2494208	\N	\N
3468938	SPECIFIC_DAY	3	8	\N	2010-07-05	1130	2494208	\N	\N
3468939	SPECIFIC_DAY	3	0	\N	2010-06-27	1130	2494208	\N	\N
3468940	SPECIFIC_DAY	3	8	\N	2010-07-01	1130	2494208	\N	\N
3468941	SPECIFIC_DAY	3	8	\N	2010-07-07	1130	2494208	\N	\N
3468942	SPECIFIC_DAY	3	8	\N	2010-07-16	1130	2494208	\N	\N
3468943	SPECIFIC_DAY	3	8	\N	2010-07-09	1130	2494208	\N	\N
3468944	SPECIFIC_DAY	3	8	\N	2010-06-25	1130	2494208	\N	\N
3468945	SPECIFIC_DAY	3	8	\N	2010-07-12	1130	2494208	\N	\N
3468946	SPECIFIC_DAY	3	0	\N	2010-06-26	1130	2494208	\N	\N
3468947	SPECIFIC_DAY	3	0	\N	2010-07-10	1130	2494208	\N	\N
3468948	SPECIFIC_DAY	3	8	\N	2010-07-20	1121	2494209	\N	\N
3468949	SPECIFIC_DAY	3	8	\N	2010-07-07	1121	2494209	\N	\N
3468950	SPECIFIC_DAY	3	8	\N	2010-06-25	1121	2494209	\N	\N
3468951	SPECIFIC_DAY	3	8	\N	2010-07-08	1121	2494209	\N	\N
3468952	SPECIFIC_DAY	3	8	\N	2010-07-22	1121	2494209	\N	\N
3468953	SPECIFIC_DAY	3	8	\N	2010-07-15	1121	2494209	\N	\N
3468954	SPECIFIC_DAY	3	8	\N	2010-06-28	1121	2494209	\N	\N
3468955	SPECIFIC_DAY	3	0	\N	2010-07-10	1121	2494209	\N	\N
3468956	SPECIFIC_DAY	3	8	\N	2010-07-01	1121	2494209	\N	\N
3468957	SPECIFIC_DAY	3	8	\N	2010-07-05	1121	2494209	\N	\N
3468958	SPECIFIC_DAY	3	8	\N	2010-07-16	1121	2494209	\N	\N
3468959	SPECIFIC_DAY	3	0	\N	2010-07-25	1121	2494209	\N	\N
3468960	SPECIFIC_DAY	3	8	\N	2010-07-21	1121	2494209	\N	\N
3468961	SPECIFIC_DAY	3	8	\N	2010-07-09	1121	2494209	\N	\N
3468962	SPECIFIC_DAY	3	8	\N	2010-07-06	1121	2494209	\N	\N
3468963	SPECIFIC_DAY	3	8	\N	2010-07-14	1121	2494209	\N	\N
3468964	SPECIFIC_DAY	3	0	\N	2010-07-24	1121	2494209	\N	\N
3468965	SPECIFIC_DAY	3	0	\N	2010-07-04	1121	2494209	\N	\N
3468966	SPECIFIC_DAY	3	0	\N	2010-06-27	1121	2494209	\N	\N
3468967	SPECIFIC_DAY	3	8	\N	2010-07-13	1121	2494209	\N	\N
3468968	SPECIFIC_DAY	3	8	\N	2010-07-12	1121	2494209	\N	\N
3468969	SPECIFIC_DAY	3	0	\N	2010-07-18	1121	2494209	\N	\N
3468970	SPECIFIC_DAY	3	0	\N	2010-07-03	1121	2494209	\N	\N
3468971	SPECIFIC_DAY	3	8	\N	2010-06-30	1121	2494209	\N	\N
3468972	SPECIFIC_DAY	3	2	\N	2010-07-26	1121	2494209	\N	\N
3468973	SPECIFIC_DAY	3	0	\N	2010-07-17	1121	2494209	\N	\N
3468974	SPECIFIC_DAY	3	8	\N	2010-07-19	1121	2494209	\N	\N
3468975	SPECIFIC_DAY	3	0	\N	2010-06-26	1121	2494209	\N	\N
3468976	SPECIFIC_DAY	3	8	\N	2010-07-23	1121	2494209	\N	\N
3468977	SPECIFIC_DAY	3	8	\N	2010-07-02	1121	2494209	\N	\N
3468978	SPECIFIC_DAY	3	8	\N	2010-06-29	1121	2494209	\N	\N
3468979	SPECIFIC_DAY	3	0	\N	2010-07-11	1121	2494209	\N	\N
3468980	GENERIC_DAY	3	0	\N	2010-07-31	1119	\N	2494207	\N
3468981	GENERIC_DAY	3	4	\N	2010-08-05	1119	\N	2494207	\N
3468982	GENERIC_DAY	3	0	\N	2010-08-01	1119	\N	2494207	\N
3468983	GENERIC_DAY	3	8	\N	2010-08-02	1119	\N	2494207	\N
3468984	GENERIC_DAY	3	8	\N	2010-07-27	1119	\N	2494207	\N
3468985	GENERIC_DAY	3	8	\N	2010-07-28	1119	\N	2494207	\N
3468986	GENERIC_DAY	3	8	\N	2010-07-30	1119	\N	2494207	\N
3468987	GENERIC_DAY	3	8	\N	2010-07-29	1119	\N	2494207	\N
3468988	GENERIC_DAY	3	8	\N	2010-08-03	1119	\N	2494207	\N
3468989	GENERIC_DAY	3	8	\N	2010-08-04	1119	\N	2494207	\N
3442522	GENERIC_DAY	2	4	\N	2010-10-15	38997	\N	57180	\N
3442335	GENERIC_DAY	2	4	\N	2011-01-20	38997	\N	57180	\N
3442537	GENERIC_DAY	2	3	\N	2010-10-05	38997	\N	57180	\N
3442446	GENERIC_DAY	2	5	\N	2010-08-13	38993	\N	57180	\N
3442461	GENERIC_DAY	2	1	\N	2010-07-25	38993	\N	57180	\N
3442654	GENERIC_DAY	2	5	\N	2010-07-07	38993	\N	57180	\N
3442389	GENERIC_DAY	2	4	\N	2010-08-11	38997	\N	57180	\N
3442695	GENERIC_DAY	2	5	\N	2010-08-04	38993	\N	57180	\N
3442526	GENERIC_DAY	2	5	\N	2010-06-21	38993	\N	57180	\N
3442494	GENERIC_DAY	2	4	\N	2010-10-28	38993	\N	57180	\N
3442500	GENERIC_DAY	2	5	\N	2010-06-22	38993	\N	57180	\N
3442363	GENERIC_DAY	2	4	\N	2010-08-06	38997	\N	57180	\N
3442610	GENERIC_DAY	2	5	\N	2010-06-07	38993	\N	57180	\N
3442492	GENERIC_DAY	2	1	\N	2010-06-27	38993	\N	57180	\N
3442448	GENERIC_DAY	2	1	\N	2010-07-31	38993	\N	57180	\N
3442449	GENERIC_DAY	2	4	\N	2010-06-21	38997	\N	57180	\N
3442652	GENERIC_DAY	2	5	\N	2010-06-30	38993	\N	57180	\N
3442602	GENERIC_DAY	2	4	\N	2010-08-04	38997	\N	57180	\N
3442460	GENERIC_DAY	2	6	\N	2010-09-07	38993	\N	57180	\N
3442535	GENERIC_DAY	2	5	\N	2010-06-28	38993	\N	57180	\N
3442347	GENERIC_DAY	2	1	\N	2010-09-05	38993	\N	57180	\N
3442402	GENERIC_DAY	2	4	\N	2010-06-22	38997	\N	57180	\N
3442462	GENERIC_DAY	2	1	\N	2010-07-17	38993	\N	57180	\N
3442467	GENERIC_DAY	2	5	\N	2010-06-10	38993	\N	57180	\N
3442698	GENERIC_DAY	2	4	\N	2010-08-09	38997	\N	57180	\N
3442656	GENERIC_DAY	2	5	\N	2010-11-05	38993	\N	57180	\N
3442683	GENERIC_DAY	2	6	\N	2010-09-30	38993	\N	57180	\N
3442668	GENERIC_DAY	2	4	\N	2011-01-18	38997	\N	57180	\N
3442359	GENERIC_DAY	2	4	\N	2011-01-24	38993	\N	57180	\N
3442431	GENERIC_DAY	2	5	\N	2010-08-31	38993	\N	57180	\N
3442640	GENERIC_DAY	2	5	\N	2010-10-18	38993	\N	57180	\N
3442577	GENERIC_DAY	2	5	\N	2010-08-27	38993	\N	57180	\N
3442604	GENERIC_DAY	2	3	\N	2010-09-10	38997	\N	57180	\N
3442581	GENERIC_DAY	2	1	\N	2010-08-01	38993	\N	57180	\N
3442476	GENERIC_DAY	2	5	\N	2010-06-08	38993	\N	57180	\N
3442634	GENERIC_DAY	2	4	\N	2010-06-30	38997	\N	57180	\N
3442548	GENERIC_DAY	2	5	\N	2010-07-01	38993	\N	57180	\N
3442406	GENERIC_DAY	2	4	\N	2010-08-13	38997	\N	57180	\N
3442408	GENERIC_DAY	2	4	\N	2010-10-08	38997	\N	57180	\N
3442686	GENERIC_DAY	2	4	\N	2010-12-24	38993	\N	57180	\N
3442575	GENERIC_DAY	2	5	\N	2010-07-09	38993	\N	57180	\N
3442518	GENERIC_DAY	2	5	\N	2010-09-13	38993	\N	57180	\N
3442592	GENERIC_DAY	2	5	\N	2010-11-29	38993	\N	57180	\N
3442438	GENERIC_DAY	2	4	\N	2010-06-18	38997	\N	57180	\N
3442658	GENERIC_DAY	2	6	\N	2010-10-05	38993	\N	57180	\N
3442414	GENERIC_DAY	2	6	\N	2010-07-02	38993	\N	57180	\N
3442608	GENERIC_DAY	2	5	\N	2010-10-07	38993	\N	57180	\N
3442338	GENERIC_DAY	2	3	\N	2010-12-01	38997	\N	57180	\N
3442400	GENERIC_DAY	2	1	\N	2010-06-05	38993	\N	57180	\N
3442615	GENERIC_DAY	2	5	\N	2010-08-12	38993	\N	57180	\N
3442536	GENERIC_DAY	2	4	\N	2011-01-20	38993	\N	57180	\N
3442603	GENERIC_DAY	2	3	\N	2010-09-14	38997	\N	57180	\N
3442375	GENERIC_DAY	2	4	\N	2010-07-01	38997	\N	57180	\N
3442464	GENERIC_DAY	2	4	\N	2010-07-14	38997	\N	57180	\N
3442387	GENERIC_DAY	2	4	\N	2010-07-27	38997	\N	57180	\N
3442611	GENERIC_DAY	2	1	\N	2010-06-06	38993	\N	57180	\N
3442442	GENERIC_DAY	2	5	\N	2010-08-09	38993	\N	57180	\N
3442691	GENERIC_DAY	2	4	\N	2010-06-03	38997	\N	57180	\N
3442597	GENERIC_DAY	2	5	\N	2010-12-14	38993	\N	57180	\N
3442328	GENERIC_DAY	2	4	\N	2011-01-10	38997	\N	57180	\N
3442567	GENERIC_DAY	2	4	\N	2010-08-16	38997	\N	57180	\N
3442367	GENERIC_DAY	2	4	\N	2010-06-16	38997	\N	57180	\N
3442424	GENERIC_DAY	2	3	\N	2010-07-19	38997	\N	57180	\N
3442682	GENERIC_DAY	2	4	\N	2011-01-14	38997	\N	57180	\N
3442444	GENERIC_DAY	2	4	\N	2011-01-19	38997	\N	57180	\N
3442351	GENERIC_DAY	2	1	\N	2010-09-19	38993	\N	57180	\N
3442379	GENERIC_DAY	2	4	\N	2010-11-02	38997	\N	57180	\N
3442620	GENERIC_DAY	2	4	\N	2010-11-03	38993	\N	57180	\N
3442416	GENERIC_DAY	2	4	\N	2010-06-29	38997	\N	57180	\N
3442678	GENERIC_DAY	2	4	\N	2010-08-03	38997	\N	57180	\N
3442472	GENERIC_DAY	2	4	\N	2010-08-17	38997	\N	57180	\N
3442532	GENERIC_DAY	2	4	\N	2011-01-17	38997	\N	57180	\N
3442433	GENERIC_DAY	2	6	\N	2010-10-01	38993	\N	57180	\N
3442505	GENERIC_DAY	2	5	\N	2010-11-15	38993	\N	57180	\N
3442519	GENERIC_DAY	2	4	\N	2010-12-22	38993	\N	57180	\N
3442525	GENERIC_DAY	2	5	\N	2010-09-24	38993	\N	57180	\N
3442451	GENERIC_DAY	2	4	\N	2010-09-23	38997	\N	57180	\N
3442418	GENERIC_DAY	2	3	\N	2010-11-22	38997	\N	57180	\N
3442626	GENERIC_DAY	2	4	\N	2010-07-15	38997	\N	57180	\N
3442396	GENERIC_DAY	2	5	\N	2010-11-22	38993	\N	57180	\N
3442688	GENERIC_DAY	2	5	\N	2010-08-06	38993	\N	57180	\N
3442550	GENERIC_DAY	2	4	\N	2010-12-02	38997	\N	57180	\N
3442598	GENERIC_DAY	2	5	\N	2010-12-01	38993	\N	57180	\N
3442474	GENERIC_DAY	2	5	\N	2010-10-13	38993	\N	57180	\N
3442600	GENERIC_DAY	2	4	\N	2010-10-20	38997	\N	57180	\N
3442515	GENERIC_DAY	2	5	\N	2010-09-23	38993	\N	57180	\N
3442671	GENERIC_DAY	2	4	\N	2010-07-30	38997	\N	57180	\N
3442508	GENERIC_DAY	2	3	\N	2010-11-05	38997	\N	57180	\N
3442490	GENERIC_DAY	2	4	\N	2011-01-10	38993	\N	57180	\N
3442578	GENERIC_DAY	2	4	\N	2010-06-23	38997	\N	57180	\N
3442409	GENERIC_DAY	2	4	\N	2010-08-18	38997	\N	57180	\N
3442369	GENERIC_DAY	2	3	\N	2010-12-10	38997	\N	57180	\N
3442459	GENERIC_DAY	2	4	\N	2011-01-12	38993	\N	57180	\N
3442524	GENERIC_DAY	2	4	\N	2010-11-03	38997	\N	57180	\N
3442498	GENERIC_DAY	2	5	\N	2010-08-23	38993	\N	57180	\N
3442520	GENERIC_DAY	2	5	\N	2010-09-03	38993	\N	57180	\N
3442549	GENERIC_DAY	2	5	\N	2010-08-26	38993	\N	57180	\N
3442349	GENERIC_DAY	2	4	\N	2010-12-20	38997	\N	57180	\N
3442674	GENERIC_DAY	2	4	\N	2011-01-27	38997	\N	57180	\N
3442614	GENERIC_DAY	2	1	\N	2010-08-07	38993	\N	57180	\N
3442585	GENERIC_DAY	2	5	\N	2010-06-29	38993	\N	57180	\N
3442506	GENERIC_DAY	2	1	\N	2010-10-17	38993	\N	57180	\N
3442622	GENERIC_DAY	2	4	\N	2010-08-10	38997	\N	57180	\N
3442618	GENERIC_DAY	2	6	\N	2010-07-06	38993	\N	57180	\N
3442440	GENERIC_DAY	2	3	\N	2010-11-09	38997	\N	57180	\N
3442423	GENERIC_DAY	2	6	\N	2010-09-17	38993	\N	57180	\N
3442450	GENERIC_DAY	2	3	\N	2010-09-30	38997	\N	57180	\N
3442566	GENERIC_DAY	2	3	\N	2010-09-17	38997	\N	57180	\N
3442373	GENERIC_DAY	2	6	\N	2010-09-15	38993	\N	57180	\N
3442628	GENERIC_DAY	2	5	\N	2010-08-02	38993	\N	57180	\N
3442607	GENERIC_DAY	2	3	\N	2010-11-10	38997	\N	57180	\N
3442391	GENERIC_DAY	2	4	\N	2011-01-28	38997	\N	57180	\N
3442647	GENERIC_DAY	2	4	\N	2010-07-13	38997	\N	57180	\N
3442645	GENERIC_DAY	2	6	\N	2010-07-28	38993	\N	57180	\N
3442484	GENERIC_DAY	2	3	\N	2010-11-30	38997	\N	57180	\N
3442625	GENERIC_DAY	2	5	\N	2010-11-04	38993	\N	57180	\N
3442470	GENERIC_DAY	2	4	\N	2011-01-24	38997	\N	57180	\N
3442390	GENERIC_DAY	2	4	\N	2010-11-24	38997	\N	57180	\N
3442346	GENERIC_DAY	2	3	\N	2010-09-16	38997	\N	57180	\N
3442411	GENERIC_DAY	2	4	\N	2010-06-07	38997	\N	57180	\N
3442443	GENERIC_DAY	2	1	\N	2010-08-22	38993	\N	57180	\N
3442591	GENERIC_DAY	2	4	\N	2010-12-20	38993	\N	57180	\N
3442572	GENERIC_DAY	2	4	\N	2010-07-22	38997	\N	57180	\N
3442527	GENERIC_DAY	2	1	\N	2010-09-04	38993	\N	57180	\N
3442648	GENERIC_DAY	2	5	\N	2010-11-26	38993	\N	57180	\N
3442395	GENERIC_DAY	2	6	\N	2010-10-04	38993	\N	57180	\N
3442504	GENERIC_DAY	2	6	\N	2010-09-21	38993	\N	57180	\N
3442394	GENERIC_DAY	2	3	\N	2010-10-01	38997	\N	57180	\N
3442619	GENERIC_DAY	2	4	\N	2010-10-11	38997	\N	57180	\N
3442596	GENERIC_DAY	2	4	\N	2011-01-17	38993	\N	57180	\N
3442340	GENERIC_DAY	2	5	\N	2010-08-17	38993	\N	57180	\N
3442589	GENERIC_DAY	2	1	\N	2010-08-28	38993	\N	57180	\N
3442545	GENERIC_DAY	2	4	\N	2010-12-13	38997	\N	57180	\N
3442339	GENERIC_DAY	2	1	\N	2010-07-04	38993	\N	57180	\N
3442454	GENERIC_DAY	2	4	\N	2010-08-27	38997	\N	57180	\N
3442432	GENERIC_DAY	2	4	\N	2010-06-28	38997	\N	57180	\N
3442573	GENERIC_DAY	2	1	\N	2010-10-09	38993	\N	57180	\N
3442365	GENERIC_DAY	2	6	\N	2010-09-29	38993	\N	57180	\N
3442439	GENERIC_DAY	2	4	\N	2011-01-25	38997	\N	57180	\N
3442344	GENERIC_DAY	2	4	\N	2010-10-26	38993	\N	57180	\N
3442466	GENERIC_DAY	2	5	\N	2010-07-30	38993	\N	57180	\N
3442539	GENERIC_DAY	2	4	\N	2010-06-15	38997	\N	57180	\N
3442491	GENERIC_DAY	2	5	\N	2010-07-26	38993	\N	57180	\N
3442587	GENERIC_DAY	2	4	\N	2010-10-21	38993	\N	57180	\N
3442528	GENERIC_DAY	2	5	\N	2010-09-09	38993	\N	57180	\N
3442579	GENERIC_DAY	2	1	\N	2010-06-13	38993	\N	57180	\N
3442546	GENERIC_DAY	2	3	\N	2010-12-30	38997	\N	57180	\N
3442637	GENERIC_DAY	2	5	\N	2010-11-12	38993	\N	57180	\N
3442616	GENERIC_DAY	2	4	\N	2010-11-11	38993	\N	57180	\N
3442368	GENERIC_DAY	2	1	\N	2010-10-16	38993	\N	57180	\N
3442538	GENERIC_DAY	2	4	\N	2010-12-22	38997	\N	57180	\N
3442341	GENERIC_DAY	2	4	\N	2010-11-08	38993	\N	57180	\N
3442692	GENERIC_DAY	2	1	\N	2010-08-29	38993	\N	57180	\N
3442495	GENERIC_DAY	2	3	\N	2010-12-09	38997	\N	57180	\N
3442653	GENERIC_DAY	2	4	\N	2011-01-14	38993	\N	57180	\N
3442659	GENERIC_DAY	2	5	\N	2010-11-16	38993	\N	57180	\N
3442676	GENERIC_DAY	2	6	\N	2010-07-19	38993	\N	57180	\N
3442696	GENERIC_DAY	2	3	\N	2010-07-06	38997	\N	57180	\N
3442594	GENERIC_DAY	2	5	\N	2010-06-15	38993	\N	57180	\N
3442332	GENERIC_DAY	2	5	\N	2010-11-25	38993	\N	57180	\N
3442399	GENERIC_DAY	2	4	\N	2010-07-12	38997	\N	57180	\N
3442514	GENERIC_DAY	2	5	\N	2010-06-24	38993	\N	57180	\N
3442398	GENERIC_DAY	2	5	\N	2010-08-19	38993	\N	57180	\N
3442489	GENERIC_DAY	2	1	\N	2010-07-11	38993	\N	57180	\N
3442447	GENERIC_DAY	2	4	\N	2010-12-13	38993	\N	57180	\N
3442576	GENERIC_DAY	2	5	\N	2010-07-16	38997	\N	57180	\N
3442383	GENERIC_DAY	2	5	\N	2010-09-27	38993	\N	57180	\N
3442672	GENERIC_DAY	2	4	\N	2010-06-04	38997	\N	57180	\N
3442426	GENERIC_DAY	2	4	\N	2010-09-09	38997	\N	57180	\N
3442480	GENERIC_DAY	2	4	\N	2010-12-15	38993	\N	57180	\N
3442552	GENERIC_DAY	2	4	\N	2010-11-19	38997	\N	57180	\N
3442533	GENERIC_DAY	2	4	\N	2011-01-11	38997	\N	57180	\N
3442385	GENERIC_DAY	2	4	\N	2010-10-25	38993	\N	57180	\N
3442583	GENERIC_DAY	2	4	\N	2010-06-01	38997	\N	57180	\N
3442452	GENERIC_DAY	2	5	\N	2010-08-25	38993	\N	57180	\N
3442631	GENERIC_DAY	2	3	\N	2010-09-29	38997	\N	57180	\N
3442635	GENERIC_DAY	2	6	\N	2010-09-14	38993	\N	57180	\N
3442326	GENERIC_DAY	2	4	\N	2010-12-23	38997	\N	57180	\N
3442509	GENERIC_DAY	2	4	\N	2010-09-27	38997	\N	57180	\N
3442565	GENERIC_DAY	2	3	\N	2010-09-15	38997	\N	57180	\N
3442388	GENERIC_DAY	2	5	\N	2010-07-14	38993	\N	57180	\N
3442419	GENERIC_DAY	2	5	\N	2010-11-17	38993	\N	57180	\N
3442664	GENERIC_DAY	2	4	\N	2011-01-05	38993	\N	57180	\N
3442636	GENERIC_DAY	2	3	\N	2010-07-20	38997	\N	57180	\N
3442630	GENERIC_DAY	2	4	\N	2011-01-05	38997	\N	57180	\N
3442475	GENERIC_DAY	2	3	\N	2010-12-16	38997	\N	57180	\N
3442617	GENERIC_DAY	2	6	\N	2010-07-05	38993	\N	57180	\N
3442378	GENERIC_DAY	2	3	\N	2010-11-25	38997	\N	57180	\N
3442415	GENERIC_DAY	2	5	\N	2010-11-09	38993	\N	57180	\N
3442374	GENERIC_DAY	2	3	\N	2010-10-27	38997	\N	57180	\N
3442605	GENERIC_DAY	2	3	\N	2010-11-17	38997	\N	57180	\N
3442680	GENERIC_DAY	2	5	\N	2010-10-11	38993	\N	57180	\N
3442694	GENERIC_DAY	2	4	\N	2010-08-30	38997	\N	57180	\N
3442327	GENERIC_DAY	2	4	\N	2010-12-23	38993	\N	57180	\N
3442642	GENERIC_DAY	2	4	\N	2010-06-17	38997	\N	57180	\N
3442435	GENERIC_DAY	2	1	\N	2010-09-25	38993	\N	57180	\N
3442483	GENERIC_DAY	2	6	\N	2010-07-20	38993	\N	57180	\N
3442497	GENERIC_DAY	2	5	\N	2010-08-10	38993	\N	57180	\N
3442529	GENERIC_DAY	2	5	\N	2010-12-10	38993	\N	57180	\N
3442670	GENERIC_DAY	2	3	\N	2010-07-05	38997	\N	57180	\N
3442541	GENERIC_DAY	2	5	\N	2010-06-14	38993	\N	57180	\N
3442677	GENERIC_DAY	2	4	\N	2010-06-02	38997	\N	57180	\N
3442412	GENERIC_DAY	2	5	\N	2010-12-07	38993	\N	57180	\N
3442345	GENERIC_DAY	2	5	\N	2010-12-03	38993	\N	57180	\N
3442479	GENERIC_DAY	2	5	\N	2010-11-30	38993	\N	57180	\N
3442496	GENERIC_DAY	2	3	\N	2010-12-03	38997	\N	57180	\N
3442427	GENERIC_DAY	2	5	\N	2010-08-05	38993	\N	57180	\N
3442551	GENERIC_DAY	2	3	\N	2010-12-07	38997	\N	57180	\N
3442348	GENERIC_DAY	2	4	\N	2010-08-02	38997	\N	57180	\N
3442661	GENERIC_DAY	2	4	\N	2011-01-13	38993	\N	57180	\N
3442623	GENERIC_DAY	2	5	\N	2010-12-17	38993	\N	57180	\N
3442342	GENERIC_DAY	2	4	\N	2011-01-26	38997	\N	57180	\N
3442510	GENERIC_DAY	2	4	\N	2010-11-08	38997	\N	57180	\N
3442325	GENERIC_DAY	2	3	\N	2010-10-06	38997	\N	57180	\N
3442353	GENERIC_DAY	2	3	\N	2010-09-20	38997	\N	57180	\N
3442356	GENERIC_DAY	2	4	\N	2010-08-20	38997	\N	57180	\N
3442482	GENERIC_DAY	2	5	\N	2010-10-29	38993	\N	57180	\N
3442372	GENERIC_DAY	2	4	\N	2010-09-02	38997	\N	57180	\N
3442666	GENERIC_DAY	2	1	\N	2010-07-24	38993	\N	57180	\N
3442333	GENERIC_DAY	2	3	\N	2010-10-04	38997	\N	57180	\N
3442679	GENERIC_DAY	2	4	\N	2010-11-18	38993	\N	57180	\N
3442564	GENERIC_DAY	2	4	\N	2010-08-12	38997	\N	57180	\N
3442629	GENERIC_DAY	2	4	\N	2010-06-25	38997	\N	57180	\N
3442463	GENERIC_DAY	2	4	\N	2011-01-03	38993	\N	57180	\N
3442511	GENERIC_DAY	2	4	\N	2011-01-27	38993	\N	57180	\N
3442436	GENERIC_DAY	2	5	\N	2010-06-18	38993	\N	57180	\N
3442486	GENERIC_DAY	2	4	\N	2010-07-29	38997	\N	57180	\N
3442606	GENERIC_DAY	2	5	\N	2010-07-08	38993	\N	57180	\N
3442358	GENERIC_DAY	2	5	\N	2010-08-03	38993	\N	57180	\N
3442646	GENERIC_DAY	2	4	\N	2010-11-02	38993	\N	57180	\N
3442586	GENERIC_DAY	2	5	\N	2010-07-29	38993	\N	57180	\N
3442639	GENERIC_DAY	2	4	\N	2010-12-15	38997	\N	57180	\N
3442364	GENERIC_DAY	2	5	\N	2010-08-16	38993	\N	57180	\N
3442457	GENERIC_DAY	2	4	\N	2010-08-23	38997	\N	57180	\N
3442413	GENERIC_DAY	2	4	\N	2011-01-26	38993	\N	57180	\N
3442540	GENERIC_DAY	2	4	\N	2010-11-11	38997	\N	57180	\N
3442376	GENERIC_DAY	2	4	\N	2010-12-24	38997	\N	57180	\N
3442507	GENERIC_DAY	2	5	\N	2010-06-09	38993	\N	57180	\N
3442675	GENERIC_DAY	2	5	\N	2010-06-25	38993	\N	57180	\N
3442544	GENERIC_DAY	2	1	\N	2010-09-26	38993	\N	57180	\N
3442644	GENERIC_DAY	2	4	\N	2010-07-26	38997	\N	57180	\N
3442569	GENERIC_DAY	2	5	\N	2010-07-23	38993	\N	57180	\N
3442324	GENERIC_DAY	2	5	\N	2010-10-14	38997	\N	57180	\N
3442621	GENERIC_DAY	2	4	\N	2010-09-06	38997	\N	57180	\N
3442516	GENERIC_DAY	2	5	\N	2010-10-20	38993	\N	57180	\N
3442380	GENERIC_DAY	2	5	\N	2010-10-08	38993	\N	57180	\N
3442377	GENERIC_DAY	2	4	\N	2011-01-07	38997	\N	57180	\N
3442355	GENERIC_DAY	2	5	\N	2010-10-15	38993	\N	57180	\N
3442485	GENERIC_DAY	2	1	\N	2010-06-26	38993	\N	57180	\N
3442612	GENERIC_DAY	2	4	\N	2010-09-03	38997	\N	57180	\N
3442638	GENERIC_DAY	2	5	\N	2010-09-02	38993	\N	57180	\N
3442429	GENERIC_DAY	2	4	\N	2011-01-21	38993	\N	57180	\N
3442693	GENERIC_DAY	2	4	\N	2011-01-04	38993	\N	57180	\N
3442531	GENERIC_DAY	2	4	\N	2011-01-11	38993	\N	57180	\N
3442323	GENERIC_DAY	2	5	\N	2010-08-20	38993	\N	57180	\N
3442437	GENERIC_DAY	2	4	\N	2010-10-28	38997	\N	57180	\N
3442366	GENERIC_DAY	2	3	\N	2010-09-07	38997	\N	57180	\N
3442665	GENERIC_DAY	2	3	\N	2010-11-15	38997	\N	57180	\N
3442477	GENERIC_DAY	2	5	\N	2010-12-16	38993	\N	57180	\N
3442530	GENERIC_DAY	2	4	\N	2010-10-07	38997	\N	57180	\N
3442523	GENERIC_DAY	2	5	\N	2010-09-06	38993	\N	57180	\N
3442384	GENERIC_DAY	2	1	\N	2010-09-18	38993	\N	57180	\N
3442386	GENERIC_DAY	2	6	\N	2010-09-28	38993	\N	57180	\N
3442401	GENERIC_DAY	2	4	\N	2010-10-21	38997	\N	57180	\N
3442503	GENERIC_DAY	2	5	\N	2010-06-03	38993	\N	57180	\N
3442382	GENERIC_DAY	2	4	\N	2010-12-29	38997	\N	57180	\N
3442428	GENERIC_DAY	2	5	\N	2010-06-17	38993	\N	57180	\N
3442627	GENERIC_DAY	2	5	\N	2010-11-10	38993	\N	57180	\N
3442681	GENERIC_DAY	2	4	\N	2010-12-28	38993	\N	57180	\N
3442601	GENERIC_DAY	2	4	\N	2010-08-31	38997	\N	57180	\N
3442343	GENERIC_DAY	2	5	\N	2010-06-01	38993	\N	57180	\N
3442360	GENERIC_DAY	2	3	\N	2010-12-14	38997	\N	57180	\N
3442582	GENERIC_DAY	2	1	\N	2010-08-08	38993	\N	57180	\N
3442422	GENERIC_DAY	2	6	\N	2010-10-06	38993	\N	57180	\N
3442403	GENERIC_DAY	2	4	\N	2010-12-31	38993	\N	57180	\N
3442445	GENERIC_DAY	2	5	\N	2010-07-27	38993	\N	57180	\N
3442488	GENERIC_DAY	2	3	\N	2010-07-02	38997	\N	57180	\N
3442543	GENERIC_DAY	2	5	\N	2010-06-11	38993	\N	57180	\N
3442465	GENERIC_DAY	2	4	\N	2010-08-24	38997	\N	57180	\N
3442613	GENERIC_DAY	2	5	\N	2010-06-23	38993	\N	57180	\N
3442493	GENERIC_DAY	2	3	\N	2010-09-28	38997	\N	57180	\N
3442404	GENERIC_DAY	2	4	\N	2010-11-24	38993	\N	57180	\N
3442381	GENERIC_DAY	2	3	\N	2010-10-29	38997	\N	57180	\N
3442685	GENERIC_DAY	2	4	\N	2010-07-07	38997	\N	57180	\N
3442599	GENERIC_DAY	2	1	\N	2010-09-12	38993	\N	57180	\N
3442410	GENERIC_DAY	2	1	\N	2010-07-10	38993	\N	57180	\N
3442584	GENERIC_DAY	2	5	\N	2010-10-19	38993	\N	57180	\N
3442330	GENERIC_DAY	2	5	\N	2010-08-30	38993	\N	57180	\N
3442354	GENERIC_DAY	2	5	\N	2010-12-30	38993	\N	57180	\N
3442662	GENERIC_DAY	2	1	\N	2010-09-11	38993	\N	57180	\N
3442571	GENERIC_DAY	2	4	\N	2010-07-16	38993	\N	57180	\N
3442334	GENERIC_DAY	2	4	\N	2011-01-21	38997	\N	57180	\N
3442425	GENERIC_DAY	2	4	\N	2010-06-08	38997	\N	57180	\N
3442331	GENERIC_DAY	2	4	\N	2010-10-22	38993	\N	57180	\N
3442657	GENERIC_DAY	2	3	\N	2010-11-12	38997	\N	57180	\N
3442357	GENERIC_DAY	2	4	\N	2010-12-31	38997	\N	57180	\N
3442655	GENERIC_DAY	2	4	\N	2010-10-26	38997	\N	57180	\N
3442502	GENERIC_DAY	2	4	\N	2011-01-25	38993	\N	57180	\N
3442512	GENERIC_DAY	2	5	\N	2010-06-04	38993	\N	57180	\N
3442687	GENERIC_DAY	2	4	\N	2010-10-13	38997	\N	57180	\N
3442336	GENERIC_DAY	2	4	\N	2010-09-13	38997	\N	57180	\N
3442580	GENERIC_DAY	2	4	\N	2010-08-05	38997	\N	57180	\N
3442542	GENERIC_DAY	2	1	\N	2010-06-19	38993	\N	57180	\N
3442434	GENERIC_DAY	2	6	\N	2010-09-08	38993	\N	57180	\N
3442417	GENERIC_DAY	2	4	\N	2010-06-14	38997	\N	57180	\N
3442441	GENERIC_DAY	2	4	\N	2010-07-09	38997	\N	57180	\N
3442700	GENERIC_DAY	2	4	\N	2010-12-21	38997	\N	57180	\N
3442684	GENERIC_DAY	2	3	\N	2010-09-08	38997	\N	57180	\N
3442568	GENERIC_DAY	2	4	\N	2011-01-13	38997	\N	57180	\N
3442421	GENERIC_DAY	2	5	\N	2010-08-24	38993	\N	57180	\N
3442699	GENERIC_DAY	2	4	\N	2010-11-19	38993	\N	57180	\N
3442534	GENERIC_DAY	2	3	\N	2010-12-17	38997	\N	57180	\N
3442405	GENERIC_DAY	2	1	\N	2010-08-21	38993	\N	57180	\N
3442624	GENERIC_DAY	2	4	\N	2010-11-23	38993	\N	57180	\N
3442329	GENERIC_DAY	2	4	\N	2011-01-12	38997	\N	57180	\N
3442456	GENERIC_DAY	2	4	\N	2010-09-24	38997	\N	57180	\N
3442667	GENERIC_DAY	2	3	\N	2010-11-26	38997	\N	57180	\N
3442593	GENERIC_DAY	2	4	\N	2010-06-11	38997	\N	57180	\N
3442590	GENERIC_DAY	2	4	\N	2010-12-27	38997	\N	57180	\N
3442517	GENERIC_DAY	2	1	\N	2010-06-12	38993	\N	57180	\N
3442371	GENERIC_DAY	2	1	\N	2010-07-18	38993	\N	57180	\N
3442469	GENERIC_DAY	2	1	\N	2010-08-14	38993	\N	57180	\N
3442609	GENERIC_DAY	2	4	\N	2011-01-03	38997	\N	57180	\N
3442420	GENERIC_DAY	2	1	\N	2010-06-20	38993	\N	57180	\N
3442673	GENERIC_DAY	2	5	\N	2010-06-02	38993	\N	57180	\N
3442478	GENERIC_DAY	2	1	\N	2010-10-02	38993	\N	57180	\N
3442337	GENERIC_DAY	2	5	\N	2010-08-18	38993	\N	57180	\N
3442468	GENERIC_DAY	2	4	\N	2010-12-27	38993	\N	57180	\N
3442499	GENERIC_DAY	2	4	\N	2011-01-28	38993	\N	57180	\N
3442641	GENERIC_DAY	2	5	\N	2010-12-09	38993	\N	57180	\N
3442555	GENERIC_DAY	2	4	\N	2010-09-22	38997	\N	57180	\N
3442558	GENERIC_DAY	2	4	\N	2010-11-23	38997	\N	57180	\N
3442560	GENERIC_DAY	2	4	\N	2011-01-18	38993	\N	57180	\N
3442557	GENERIC_DAY	2	3	\N	2010-07-28	38997	\N	57180	\N
3442562	GENERIC_DAY	2	1	\N	2010-10-03	38993	\N	57180	\N
3442561	GENERIC_DAY	2	5	\N	2010-07-13	38993	\N	57180	\N
3442554	GENERIC_DAY	2	4	\N	2010-08-26	38997	\N	57180	\N
3442559	GENERIC_DAY	2	4	\N	2010-06-09	38997	\N	57180	\N
3442556	GENERIC_DAY	2	4	\N	2010-10-19	38997	\N	57180	\N
3442563	GENERIC_DAY	2	6	\N	2010-09-10	38993	\N	57180	\N
3432787	GENERIC_DAY	2	3	\N	2010-12-14	39017	\N	57178	\N
3432539	GENERIC_DAY	2	3	\N	2010-10-01	39015	\N	57178	\N
3432845	GENERIC_DAY	2	3	\N	2010-07-06	39017	\N	57178	\N
3432543	GENERIC_DAY	2	3	\N	2010-08-19	39017	\N	57178	\N
3432635	GENERIC_DAY	2	3	\N	2011-01-26	39015	\N	57178	\N
3432626	GENERIC_DAY	2	3	\N	2010-08-04	39017	\N	57178	\N
3432773	GENERIC_DAY	2	3	\N	2010-09-14	39017	\N	57178	\N
3432737	GENERIC_DAY	2	3	\N	2010-10-25	39015	\N	57178	\N
3432753	GENERIC_DAY	2	3	\N	2010-07-28	39017	\N	57178	\N
3432550	GENERIC_DAY	2	3	\N	2010-07-21	39015	\N	57178	\N
3432812	GENERIC_DAY	2	3	\N	2010-12-03	39015	\N	57178	\N
3432613	GENERIC_DAY	2	3	\N	2010-12-27	39015	\N	57178	\N
3432637	GENERIC_DAY	2	1	\N	2010-06-25	39015	\N	57178	\N
3432601	GENERIC_DAY	2	3	\N	2010-10-19	39015	\N	57178	\N
3432618	GENERIC_DAY	2	3	\N	2010-09-20	39017	\N	57178	\N
3432709	GENERIC_DAY	2	3	\N	2010-12-30	39015	\N	57178	\N
3432634	GENERIC_DAY	2	3	\N	2010-09-07	39015	\N	57178	\N
3432856	GENERIC_DAY	2	3	\N	2010-07-09	39017	\N	57178	\N
3432619	GENERIC_DAY	2	2	\N	2011-01-20	39017	\N	57178	\N
3432538	GENERIC_DAY	2	3	\N	2010-07-13	39015	\N	57178	\N
3432655	GENERIC_DAY	2	3	\N	2010-10-21	39017	\N	57178	\N
3432727	GENERIC_DAY	2	3	\N	2011-01-25	39015	\N	57178	\N
3432843	GENERIC_DAY	2	3	\N	2010-07-20	39017	\N	57178	\N
3432611	GENERIC_DAY	2	3	\N	2010-07-30	39015	\N	57178	\N
3432598	GENERIC_DAY	2	3	\N	2010-09-06	39015	\N	57178	\N
3432817	GENERIC_DAY	2	3	\N	2010-08-20	39017	\N	57178	\N
3432752	GENERIC_DAY	2	3	\N	2010-07-06	39015	\N	57178	\N
3432757	GENERIC_DAY	2	3	\N	2010-09-06	39017	\N	57178	\N
3432579	GENERIC_DAY	2	3	\N	2010-11-03	39017	\N	57178	\N
3432769	GENERIC_DAY	2	3	\N	2010-09-07	39017	\N	57178	\N
3432667	GENERIC_DAY	2	3	\N	2010-07-15	39017	\N	57178	\N
3432805	GENERIC_DAY	2	2	\N	2011-01-26	39017	\N	57178	\N
3432784	GENERIC_DAY	2	3	\N	2011-01-11	39015	\N	57178	\N
3432759	GENERIC_DAY	2	3	\N	2010-09-03	39017	\N	57178	\N
3432852	GENERIC_DAY	2	2	\N	2011-01-21	39017	\N	57178	\N
3432840	GENERIC_DAY	2	3	\N	2010-07-21	39017	\N	57178	\N
3432640	GENERIC_DAY	2	3	\N	2011-01-19	39015	\N	57178	\N
3432676	GENERIC_DAY	2	3	\N	2010-11-22	39015	\N	57178	\N
3432623	GENERIC_DAY	2	3	\N	2010-07-28	39015	\N	57178	\N
3432777	GENERIC_DAY	2	3	\N	2010-06-29	39017	\N	57178	\N
3432664	GENERIC_DAY	2	3	\N	2010-07-26	39015	\N	57178	\N
3432720	GENERIC_DAY	2	3	\N	2010-10-14	39017	\N	57178	\N
3432555	GENERIC_DAY	2	3	\N	2010-11-19	39017	\N	57178	\N
3432636	GENERIC_DAY	2	3	\N	2010-11-26	39015	\N	57178	\N
3432839	GENERIC_DAY	2	6	\N	2010-06-24	39017	\N	57178	\N
3432589	GENERIC_DAY	2	3	\N	2010-06-30	39017	\N	57178	\N
3432600	GENERIC_DAY	2	6	\N	2010-06-17	39017	\N	57178	\N
3432848	GENERIC_DAY	2	3	\N	2010-12-16	39017	\N	57178	\N
3432832	GENERIC_DAY	2	3	\N	2011-01-10	39017	\N	57178	\N
3432690	GENERIC_DAY	2	3	\N	2010-07-07	39015	\N	57178	\N
3432562	GENERIC_DAY	2	3	\N	2010-08-27	39017	\N	57178	\N
3432617	GENERIC_DAY	2	3	\N	2010-09-29	39017	\N	57178	\N
3432697	GENERIC_DAY	2	3	\N	2010-11-11	39017	\N	57178	\N
3432837	GENERIC_DAY	2	3	\N	2011-01-05	39015	\N	57178	\N
3432644	GENERIC_DAY	2	3	\N	2010-06-29	39015	\N	57178	\N
3432768	GENERIC_DAY	2	3	\N	2010-10-25	39017	\N	57178	\N
3432681	GENERIC_DAY	2	3	\N	2011-01-24	39015	\N	57178	\N
3432725	GENERIC_DAY	2	3	\N	2010-08-03	39015	\N	57178	\N
3432793	GENERIC_DAY	2	3	\N	2010-09-21	39015	\N	57178	\N
3432607	GENERIC_DAY	2	3	\N	2010-09-17	39017	\N	57178	\N
3432668	GENERIC_DAY	2	3	\N	2010-10-14	39015	\N	57178	\N
3432672	GENERIC_DAY	2	3	\N	2010-12-10	39015	\N	57178	\N
3432764	GENERIC_DAY	2	3	\N	2010-11-22	39017	\N	57178	\N
3432614	GENERIC_DAY	2	3	\N	2010-10-01	39017	\N	57178	\N
3432669	GENERIC_DAY	2	3	\N	2010-07-13	39017	\N	57178	\N
3432810	GENERIC_DAY	2	3	\N	2010-07-01	39015	\N	57178	\N
3432682	GENERIC_DAY	2	3	\N	2010-08-24	39015	\N	57178	\N
3432762	GENERIC_DAY	2	3	\N	2010-08-25	39017	\N	57178	\N
3432609	GENERIC_DAY	2	2	\N	2011-01-18	39017	\N	57178	\N
3432540	GENERIC_DAY	2	3	\N	2010-11-23	39017	\N	57178	\N
3432750	GENERIC_DAY	2	3	\N	2010-11-09	39017	\N	57178	\N
3432545	GENERIC_DAY	2	3	\N	2010-07-29	39015	\N	57178	\N
3432675	GENERIC_DAY	2	3	\N	2010-10-26	39017	\N	57178	\N
3432552	GENERIC_DAY	2	3	\N	2011-01-04	39015	\N	57178	\N
3432692	GENERIC_DAY	2	3	\N	2010-08-12	39015	\N	57178	\N
3432591	GENERIC_DAY	2	3	\N	2010-08-06	39015	\N	57178	\N
3432573	GENERIC_DAY	2	3	\N	2011-01-28	39015	\N	57178	\N
3432542	GENERIC_DAY	2	3	\N	2010-11-23	39015	\N	57178	\N
3432648	GENERIC_DAY	2	3	\N	2010-09-24	39017	\N	57178	\N
3432734	GENERIC_DAY	2	3	\N	2010-08-16	39017	\N	57178	\N
3432561	GENERIC_DAY	2	3	\N	2010-08-13	39017	\N	57178	\N
3432820	GENERIC_DAY	2	3	\N	2010-12-07	39017	\N	57178	\N
3432828	GENERIC_DAY	2	3	\N	2010-07-01	39017	\N	57178	\N
3432541	GENERIC_DAY	2	3	\N	2010-08-05	39015	\N	57178	\N
3432696	GENERIC_DAY	2	3	\N	2010-08-10	39017	\N	57178	\N
3432596	GENERIC_DAY	2	3	\N	2010-08-23	39015	\N	57178	\N
3432711	GENERIC_DAY	2	3	\N	2010-07-19	39017	\N	57178	\N
3432716	GENERIC_DAY	2	3	\N	2010-09-16	39017	\N	57178	\N
3432743	GENERIC_DAY	2	3	\N	2010-11-08	39015	\N	57178	\N
3432621	GENERIC_DAY	2	3	\N	2010-12-31	39015	\N	57178	\N
3432706	GENERIC_DAY	2	3	\N	2010-08-17	39015	\N	57178	\N
3432729	GENERIC_DAY	2	3	\N	2010-08-11	39015	\N	57178	\N
3432774	GENERIC_DAY	2	3	\N	2011-01-04	39017	\N	57178	\N
3432719	GENERIC_DAY	2	2	\N	2011-01-12	39017	\N	57178	\N
3432808	GENERIC_DAY	2	3	\N	2010-12-21	39015	\N	57178	\N
3432578	GENERIC_DAY	2	3	\N	2010-07-20	39015	\N	57178	\N
3432620	GENERIC_DAY	2	3	\N	2010-08-02	39015	\N	57178	\N
3432707	GENERIC_DAY	2	3	\N	2010-10-29	39015	\N	57178	\N
3432645	GENERIC_DAY	2	3	\N	2010-12-24	39017	\N	57178	\N
3432701	GENERIC_DAY	2	6	\N	2010-06-10	39017	\N	57178	\N
3432835	GENERIC_DAY	2	3	\N	2010-07-08	39017	\N	57178	\N
3432595	GENERIC_DAY	2	3	\N	2010-09-27	39017	\N	57178	\N
3432570	GENERIC_DAY	2	3	\N	2010-12-01	39015	\N	57178	\N
3432728	GENERIC_DAY	2	3	\N	2010-07-12	39017	\N	57178	\N
3432605	GENERIC_DAY	2	6	\N	2010-06-23	39017	\N	57178	\N
3432638	GENERIC_DAY	2	3	\N	2010-08-17	39017	\N	57178	\N
3432829	GENERIC_DAY	2	3	\N	2010-10-04	39017	\N	57178	\N
3432813	GENERIC_DAY	2	3	\N	2010-09-03	39015	\N	57178	\N
3432714	GENERIC_DAY	2	3	\N	2010-09-24	39015	\N	57178	\N
3432612	GENERIC_DAY	2	3	\N	2011-01-21	39015	\N	57178	\N
3432568	GENERIC_DAY	2	3	\N	2010-07-30	39017	\N	57178	\N
3432723	GENERIC_DAY	2	3	\N	2010-12-22	39015	\N	57178	\N
3432782	GENERIC_DAY	2	3	\N	2010-12-28	39017	\N	57178	\N
3432754	GENERIC_DAY	2	3	\N	2010-10-27	39017	\N	57178	\N
3432802	GENERIC_DAY	2	6	\N	2010-06-11	39017	\N	57178	\N
3432658	GENERIC_DAY	2	3	\N	2010-09-22	39015	\N	57178	\N
3432602	GENERIC_DAY	2	3	\N	2010-12-02	39015	\N	57178	\N
3432571	GENERIC_DAY	2	3	\N	2010-12-17	39015	\N	57178	\N
3432563	GENERIC_DAY	2	3	\N	2010-10-13	39017	\N	57178	\N
3432653	GENERIC_DAY	2	3	\N	2010-07-22	39015	\N	57178	\N
3432557	GENERIC_DAY	2	3	\N	2010-11-04	39015	\N	57178	\N
3432684	GENERIC_DAY	2	3	\N	2010-09-10	39017	\N	57178	\N
3432800	GENERIC_DAY	2	3	\N	2010-09-23	39015	\N	57178	\N
3432657	GENERIC_DAY	2	3	\N	2010-09-22	39017	\N	57178	\N
3432740	GENERIC_DAY	2	3	\N	2010-06-30	39015	\N	57178	\N
3432733	GENERIC_DAY	2	3	\N	2010-08-05	39017	\N	57178	\N
3432760	GENERIC_DAY	2	3	\N	2010-12-20	39015	\N	57178	\N
3432632	GENERIC_DAY	2	3	\N	2010-08-26	39015	\N	57178	\N
3432665	GENERIC_DAY	2	3	\N	2010-09-30	39015	\N	57178	\N
3432702	GENERIC_DAY	2	6	\N	2010-06-01	39017	\N	57178	\N
3432592	GENERIC_DAY	2	3	\N	2011-01-07	39017	\N	57178	\N
3432670	GENERIC_DAY	2	3	\N	2010-08-02	39017	\N	57178	\N
3432730	GENERIC_DAY	2	3	\N	2010-12-23	39015	\N	57178	\N
3432811	GENERIC_DAY	2	3	\N	2010-10-15	39015	\N	57178	\N
3432593	GENERIC_DAY	2	3	\N	2010-11-05	39017	\N	57178	\N
3432587	GENERIC_DAY	2	6	\N	2010-06-09	39017	\N	57178	\N
3432560	GENERIC_DAY	2	3	\N	2010-12-03	39017	\N	57178	\N
3432577	GENERIC_DAY	2	3	\N	2010-10-22	39017	\N	57178	\N
3432625	GENERIC_DAY	2	3	\N	2010-10-04	39015	\N	57178	\N
3432715	GENERIC_DAY	2	3	\N	2010-08-16	39015	\N	57178	\N
3432608	GENERIC_DAY	2	3	\N	2010-08-20	39015	\N	57178	\N
3432651	GENERIC_DAY	2	3	\N	2010-08-09	39017	\N	57178	\N
3432650	GENERIC_DAY	2	3	\N	2010-10-19	39017	\N	57178	\N
3432789	GENERIC_DAY	2	6	\N	2010-06-02	39017	\N	57178	\N
3432678	GENERIC_DAY	2	3	\N	2010-08-18	39017	\N	57178	\N
3432771	GENERIC_DAY	2	3	\N	2010-09-01	39017	\N	57178	\N
3432649	GENERIC_DAY	2	3	\N	2010-08-27	39015	\N	57178	\N
3432628	GENERIC_DAY	2	3	\N	2010-08-04	39015	\N	57178	\N
3432798	GENERIC_DAY	2	3	\N	2010-09-29	39015	\N	57178	\N
3432666	GENERIC_DAY	2	3	\N	2010-09-09	39017	\N	57178	\N
3432606	GENERIC_DAY	2	3	\N	2010-08-13	39015	\N	57178	\N
3432778	GENERIC_DAY	2	3	\N	2011-01-10	39015	\N	57178	\N
3432824	GENERIC_DAY	2	3	\N	2010-12-15	39017	\N	57178	\N
3432801	GENERIC_DAY	2	2	\N	2011-01-25	39017	\N	57178	\N
3432594	GENERIC_DAY	2	3	\N	2010-07-02	39015	\N	57178	\N
3432549	GENERIC_DAY	2	3	\N	2010-10-11	39015	\N	57178	\N
3432842	GENERIC_DAY	2	3	\N	2010-08-03	39017	\N	57178	\N
3432703	GENERIC_DAY	2	3	\N	2010-09-08	39015	\N	57178	\N
3432603	GENERIC_DAY	2	3	\N	2010-11-25	39017	\N	57178	\N
3432726	GENERIC_DAY	2	3	\N	2010-11-16	39015	\N	57178	\N
3432766	GENERIC_DAY	2	2	\N	2011-01-24	39017	\N	57178	\N
3432850	GENERIC_DAY	2	3	\N	2010-09-27	39015	\N	57178	\N
3432772	GENERIC_DAY	2	3	\N	2010-09-13	39015	\N	57178	\N
3432751	GENERIC_DAY	2	3	\N	2010-07-05	39017	\N	57178	\N
3432654	GENERIC_DAY	2	3	\N	2010-12-28	39015	\N	57178	\N
3432814	GENERIC_DAY	2	3	\N	2010-10-26	39015	\N	57178	\N
3432663	GENERIC_DAY	2	3	\N	2010-08-12	39017	\N	57178	\N
3432585	GENERIC_DAY	2	3	\N	2010-11-03	39015	\N	57178	\N
3432641	GENERIC_DAY	2	3	\N	2010-12-17	39017	\N	57178	\N
3432830	GENERIC_DAY	2	3	\N	2010-10-20	39017	\N	57178	\N
3432627	GENERIC_DAY	2	3	\N	2010-11-18	39017	\N	57178	\N
3432584	GENERIC_DAY	2	3	\N	2010-12-01	39017	\N	57178	\N
3432700	GENERIC_DAY	2	3	\N	2011-01-20	39015	\N	57178	\N
3432705	GENERIC_DAY	2	3	\N	2010-12-23	39017	\N	57178	\N
3432799	GENERIC_DAY	2	3	\N	2010-08-06	39017	\N	57178	\N
3432747	GENERIC_DAY	2	3	\N	2011-01-13	39015	\N	57178	\N
3432731	GENERIC_DAY	2	3	\N	2010-09-28	39015	\N	57178	\N
3432849	GENERIC_DAY	2	3	\N	2010-06-28	39015	\N	57178	\N
3432718	GENERIC_DAY	2	3	\N	2010-11-12	39015	\N	57178	\N
3432677	GENERIC_DAY	2	2	\N	2011-01-28	39017	\N	57178	\N
3432763	GENERIC_DAY	2	3	\N	2010-11-16	39017	\N	57178	\N
3432685	GENERIC_DAY	2	3	\N	2010-08-10	39015	\N	57178	\N
3432826	GENERIC_DAY	2	6	\N	2010-06-04	39017	\N	57178	\N
3432717	GENERIC_DAY	2	3	\N	2010-08-31	39015	\N	57178	\N
3432816	GENERIC_DAY	2	3	\N	2010-09-01	39015	\N	57178	\N
3432547	GENERIC_DAY	2	3	\N	2010-09-23	39017	\N	57178	\N
3432776	GENERIC_DAY	2	2	\N	2011-01-17	39017	\N	57178	\N
3432646	GENERIC_DAY	2	6	\N	2010-06-16	39017	\N	57178	\N
3432785	GENERIC_DAY	2	5	\N	2010-06-25	39017	\N	57178	\N
3432566	GENERIC_DAY	2	3	\N	2010-09-02	39015	\N	57178	\N
3432673	GENERIC_DAY	2	3	\N	2010-09-13	39017	\N	57178	\N
3432775	GENERIC_DAY	2	3	\N	2010-10-29	39017	\N	57178	\N
3432544	GENERIC_DAY	2	3	\N	2010-12-13	39017	\N	57178	\N
3432631	GENERIC_DAY	2	3	\N	2010-09-02	39017	\N	57178	\N
3432551	GENERIC_DAY	2	3	\N	2010-10-18	39015	\N	57178	\N
3432674	GENERIC_DAY	2	3	\N	2010-11-25	39015	\N	57178	\N
3432597	GENERIC_DAY	2	6	\N	2010-06-03	39017	\N	57178	\N
3432807	GENERIC_DAY	2	6	\N	2010-06-07	39017	\N	57178	\N
3432558	GENERIC_DAY	2	3	\N	2010-12-07	39015	\N	57178	\N
3432662	GENERIC_DAY	2	3	\N	2010-12-30	39017	\N	57178	\N
3432687	GENERIC_DAY	2	3	\N	2010-07-09	39015	\N	57178	\N
3432857	GENERIC_DAY	2	2	\N	2011-01-19	39017	\N	57178	\N
3432721	GENERIC_DAY	2	3	\N	2010-09-16	39015	\N	57178	\N
3432821	GENERIC_DAY	2	3	\N	2010-10-28	39015	\N	57178	\N
3432809	GENERIC_DAY	2	3	\N	2010-12-13	39015	\N	57178	\N
3432693	GENERIC_DAY	2	3	\N	2010-10-13	39015	\N	57178	\N
3432704	GENERIC_DAY	2	3	\N	2010-10-06	39015	\N	57178	\N
3432790	GENERIC_DAY	2	2	\N	2011-01-11	39017	\N	57178	\N
3432804	GENERIC_DAY	2	3	\N	2010-11-17	39017	\N	57178	\N
3432736	GENERIC_DAY	2	3	\N	2010-07-19	39015	\N	57178	\N
3432851	GENERIC_DAY	2	3	\N	2011-01-03	39015	\N	57178	\N
3432823	GENERIC_DAY	2	3	\N	2010-11-18	39015	\N	57178	\N
3432741	GENERIC_DAY	2	3	\N	2011-01-27	39015	\N	57178	\N
3432735	GENERIC_DAY	2	3	\N	2011-01-05	39017	\N	57178	\N
3432574	GENERIC_DAY	2	3	\N	2011-01-12	39015	\N	57178	\N
3432622	GENERIC_DAY	2	3	\N	2010-09-15	39015	\N	57178	\N
3432818	GENERIC_DAY	2	3	\N	2010-09-30	39017	\N	57178	\N
3432770	GENERIC_DAY	2	3	\N	2010-12-16	39015	\N	57178	\N
3432710	GENERIC_DAY	2	3	\N	2010-08-31	39017	\N	57178	\N
3432761	GENERIC_DAY	2	3	\N	2010-10-27	39015	\N	57178	\N
3432791	GENERIC_DAY	2	2	\N	2011-01-13	39017	\N	57178	\N
3432831	GENERIC_DAY	2	3	\N	2010-11-04	39017	\N	57178	\N
3432656	GENERIC_DAY	2	3	\N	2010-07-26	39017	\N	57178	\N
3432546	GENERIC_DAY	2	3	\N	2010-11-30	39017	\N	57178	\N
3432806	GENERIC_DAY	2	3	\N	2010-08-19	39015	\N	57178	\N
3432647	GENERIC_DAY	2	3	\N	2011-01-03	39017	\N	57178	\N
3432688	GENERIC_DAY	2	2	\N	2011-01-14	39017	\N	57178	\N
3432586	GENERIC_DAY	2	3	\N	2010-07-12	39015	\N	57178	\N
3432699	GENERIC_DAY	2	3	\N	2010-10-08	39017	\N	57178	\N
3432581	GENERIC_DAY	2	3	\N	2010-09-20	39015	\N	57178	\N
3432756	GENERIC_DAY	2	3	\N	2010-12-21	39017	\N	57178	\N
3432724	GENERIC_DAY	2	3	\N	2010-11-26	39017	\N	57178	\N
3432780	GENERIC_DAY	2	3	\N	2010-10-05	39017	\N	57178	\N
3432836	GENERIC_DAY	2	3	\N	2010-07-15	39015	\N	57178	\N
3432712	GENERIC_DAY	2	3	\N	2010-08-18	39015	\N	57178	\N
3432767	GENERIC_DAY	2	3	\N	2010-10-06	39017	\N	57178	\N
3432783	GENERIC_DAY	2	3	\N	2010-12-27	39017	\N	57178	\N
3432588	GENERIC_DAY	2	3	\N	2010-10-18	39017	\N	57178	\N
3432844	GENERIC_DAY	2	3	\N	2010-07-29	39017	\N	57178	\N
3432765	GENERIC_DAY	2	3	\N	2010-11-30	39015	\N	57178	\N
3432629	GENERIC_DAY	2	3	\N	2010-10-05	39015	\N	57178	\N
3432680	GENERIC_DAY	2	6	\N	2010-06-18	39017	\N	57178	\N
3432686	GENERIC_DAY	2	3	\N	2010-09-08	39017	\N	57178	\N
3432689	GENERIC_DAY	2	3	\N	2010-12-29	39017	\N	57178	\N
3432834	GENERIC_DAY	2	3	\N	2010-12-29	39015	\N	57178	\N
3432792	GENERIC_DAY	2	3	\N	2010-07-16	39017	\N	57178	\N
3432683	GENERIC_DAY	2	3	\N	2010-09-28	39017	\N	57178	\N
3432746	GENERIC_DAY	2	3	\N	2010-09-09	39015	\N	57178	\N
3432630	GENERIC_DAY	2	3	\N	2010-10-07	39017	\N	57178	\N
3432846	GENERIC_DAY	2	3	\N	2010-10-20	39015	\N	57178	\N
3432738	GENERIC_DAY	2	3	\N	2010-11-11	39015	\N	57178	\N
3432713	GENERIC_DAY	2	3	\N	2010-11-02	39017	\N	57178	\N
3432838	GENERIC_DAY	2	3	\N	2010-08-11	39017	\N	57178	\N
3432659	GENERIC_DAY	2	3	\N	2010-11-19	39015	\N	57178	\N
3432815	GENERIC_DAY	2	3	\N	2010-09-21	39017	\N	57178	\N
3432583	GENERIC_DAY	2	3	\N	2010-07-02	39017	\N	57178	\N
3432755	GENERIC_DAY	2	3	\N	2010-08-24	39017	\N	57178	\N
3432652	GENERIC_DAY	2	3	\N	2010-09-10	39015	\N	57178	\N
3432819	GENERIC_DAY	2	3	\N	2010-11-10	39017	\N	57178	\N
3432847	GENERIC_DAY	2	3	\N	2010-08-25	39015	\N	57178	\N
3432779	GENERIC_DAY	2	3	\N	2010-11-09	39015	\N	57178	\N
3432854	GENERIC_DAY	2	3	\N	2011-01-14	39015	\N	57178	\N
3432788	GENERIC_DAY	2	3	\N	2010-12-24	39015	\N	57178	\N
3432732	GENERIC_DAY	2	3	\N	2010-07-22	39017	\N	57178	\N
3432556	GENERIC_DAY	2	3	\N	2010-11-08	39017	\N	57178	\N
3432744	GENERIC_DAY	2	3	\N	2010-11-15	39017	\N	57178	\N
3432565	GENERIC_DAY	2	3	\N	2010-07-27	39017	\N	57178	\N
3432691	GENERIC_DAY	2	6	\N	2010-06-21	39017	\N	57178	\N
3432803	GENERIC_DAY	2	3	\N	2010-12-20	39017	\N	57178	\N
3432708	GENERIC_DAY	2	3	\N	2010-09-15	39017	\N	57178	\N
3432739	GENERIC_DAY	2	3	\N	2010-11-15	39015	\N	57178	\N
3432671	GENERIC_DAY	2	3	\N	2010-07-27	39015	\N	57178	\N
3432624	GENERIC_DAY	2	3	\N	2010-10-15	39017	\N	57178	\N
3432795	GENERIC_DAY	2	3	\N	2010-11-17	39015	\N	57178	\N
3432575	GENERIC_DAY	2	3	\N	2010-08-09	39015	\N	57178	\N
3432661	GENERIC_DAY	2	3	\N	2010-10-08	39015	\N	57178	\N
3432827	GENERIC_DAY	2	3	\N	2010-08-30	39015	\N	57178	\N
3432559	GENERIC_DAY	2	3	\N	2010-07-14	39015	\N	57178	\N
3432853	GENERIC_DAY	2	3	\N	2010-11-10	39015	\N	57178	\N
3432822	GENERIC_DAY	2	6	\N	2010-06-14	39017	\N	57178	\N
3432794	GENERIC_DAY	2	3	\N	2010-10-28	39017	\N	57178	\N
3432567	GENERIC_DAY	2	3	\N	2010-10-21	39015	\N	57178	\N
3432599	GENERIC_DAY	2	3	\N	2010-08-30	39017	\N	57178	\N
3432694	GENERIC_DAY	2	3	\N	2010-07-23	39015	\N	57178	\N
3432722	GENERIC_DAY	2	3	\N	2010-09-17	39015	\N	57178	\N
3432642	GENERIC_DAY	2	3	\N	2010-07-23	39017	\N	57178	\N
3432643	GENERIC_DAY	2	3	\N	2010-12-09	39017	\N	57178	\N
3432615	GENERIC_DAY	2	6	\N	2010-06-08	39017	\N	57178	\N
3432576	GENERIC_DAY	2	3	\N	2010-10-11	39017	\N	57178	\N
3432825	GENERIC_DAY	2	3	\N	2010-11-05	39015	\N	57178	\N
3432796	GENERIC_DAY	2	3	\N	2010-07-16	39015	\N	57178	\N
3432748	GENERIC_DAY	2	3	\N	2010-12-14	39015	\N	57178	\N
3432580	GENERIC_DAY	2	3	\N	2011-01-07	39015	\N	57178	\N
3432786	GENERIC_DAY	2	6	\N	2010-06-22	39017	\N	57178	\N
3432841	GENERIC_DAY	2	3	\N	2010-07-14	39017	\N	57178	\N
3432745	GENERIC_DAY	2	3	\N	2010-07-05	39015	\N	57178	\N
3432833	GENERIC_DAY	2	2	\N	2011-01-27	39017	\N	57178	\N
3432855	GENERIC_DAY	2	3	\N	2010-11-12	39017	\N	57178	\N
3432633	GENERIC_DAY	2	3	\N	2010-10-22	39015	\N	57178	\N
3432749	GENERIC_DAY	2	3	\N	2010-11-24	39017	\N	57178	\N
3432742	GENERIC_DAY	2	3	\N	2010-08-26	39017	\N	57178	\N
3432564	GENERIC_DAY	2	3	\N	2010-11-29	39017	\N	57178	\N
3432610	GENERIC_DAY	2	3	\N	2010-07-08	39015	\N	57178	\N
3432639	GENERIC_DAY	2	3	\N	2010-11-29	39015	\N	57178	\N
3432604	GENERIC_DAY	2	3	\N	2010-07-07	39017	\N	57178	\N
3432569	GENERIC_DAY	2	3	\N	2010-08-23	39017	\N	57178	\N
3432572	GENERIC_DAY	2	3	\N	2010-12-10	39017	\N	57178	\N
3432698	GENERIC_DAY	2	3	\N	2010-06-28	39017	\N	57178	\N
3432553	GENERIC_DAY	2	3	\N	2010-12-22	39017	\N	57178	\N
3432797	GENERIC_DAY	2	3	\N	2010-12-09	39015	\N	57178	\N
3432679	GENERIC_DAY	2	3	\N	2011-01-17	39015	\N	57178	\N
3432660	GENERIC_DAY	2	3	\N	2010-12-02	39017	\N	57178	\N
3432616	GENERIC_DAY	2	3	\N	2010-10-07	39015	\N	57178	\N
3432582	GENERIC_DAY	2	3	\N	2010-12-15	39015	\N	57178	\N
3432695	GENERIC_DAY	2	6	\N	2010-06-15	39017	\N	57178	\N
3432590	GENERIC_DAY	2	3	\N	2011-01-18	39015	\N	57178	\N
3432554	GENERIC_DAY	2	3	\N	2010-09-14	39015	\N	57178	\N
3432758	GENERIC_DAY	2	3	\N	2010-12-31	39017	\N	57178	\N
3432781	GENERIC_DAY	2	3	\N	2010-11-02	39015	\N	57178	\N
3432548	GENERIC_DAY	2	3	\N	2010-11-24	39015	\N	57178	\N
3432531	GENERIC_DAY	2	8	\N	2010-08-04	39020	\N	57179	\N
3432527	GENERIC_DAY	2	8	\N	2010-09-07	39020	\N	57179	\N
3432493	GENERIC_DAY	2	8	\N	2010-10-15	39020	\N	57179	\N
3432476	GENERIC_DAY	2	8	\N	2010-09-14	39020	\N	57179	\N
3432457	GENERIC_DAY	2	7	\N	2011-01-12	39020	\N	57179	\N
3432504	GENERIC_DAY	2	7	\N	2010-12-23	39020	\N	57179	\N
3432519	GENERIC_DAY	2	8	\N	2010-11-09	39020	\N	57179	\N
3432474	GENERIC_DAY	2	7	\N	2011-01-03	39020	\N	57179	\N
3432501	GENERIC_DAY	2	8	\N	2010-06-10	39020	\N	57179	\N
3432426	GENERIC_DAY	2	8	\N	2010-07-09	39020	\N	57179	\N
3432385	GENERIC_DAY	2	7	\N	2011-01-07	39020	\N	57179	\N
3432442	GENERIC_DAY	2	8	\N	2010-10-27	39020	\N	57179	\N
3432533	GENERIC_DAY	2	8	\N	2010-10-21	39020	\N	57179	\N
3432460	GENERIC_DAY	2	7	\N	2011-01-28	39020	\N	57179	\N
3432529	GENERIC_DAY	2	8	\N	2010-09-15	39020	\N	57179	\N
3432486	GENERIC_DAY	2	8	\N	2010-07-06	39020	\N	57179	\N
3432499	GENERIC_DAY	2	8	\N	2010-09-30	39020	\N	57179	\N
3432494	GENERIC_DAY	2	8	\N	2010-06-09	39020	\N	57179	\N
3432447	GENERIC_DAY	2	7	\N	2010-11-24	39020	\N	57179	\N
3432451	GENERIC_DAY	2	7	\N	2010-12-03	39020	\N	57179	\N
3432537	GENERIC_DAY	2	8	\N	2010-08-13	39020	\N	57179	\N
3432536	GENERIC_DAY	2	8	\N	2010-10-22	39020	\N	57179	\N
3432444	GENERIC_DAY	2	7	\N	2010-11-17	39020	\N	57179	\N
3432445	GENERIC_DAY	2	8	\N	2010-10-11	39020	\N	57179	\N
3432477	GENERIC_DAY	2	8	\N	2010-07-02	39020	\N	57179	\N
3432511	GENERIC_DAY	2	8	\N	2010-08-09	39020	\N	57179	\N
3432420	GENERIC_DAY	2	8	\N	2010-09-21	39020	\N	57179	\N
3432526	GENERIC_DAY	2	7	\N	2010-12-14	39020	\N	57179	\N
3432485	GENERIC_DAY	2	8	\N	2010-07-08	39020	\N	57179	\N
3432454	GENERIC_DAY	2	8	\N	2010-11-02	39020	\N	57179	\N
3432509	GENERIC_DAY	2	8	\N	2010-08-11	39020	\N	57179	\N
3432381	GENERIC_DAY	2	7	\N	2010-11-19	39020	\N	57179	\N
3432369	GENERIC_DAY	2	8	\N	2010-06-02	39020	\N	57179	\N
3432525	GENERIC_DAY	2	8	\N	2010-08-03	39020	\N	57179	\N
3432417	GENERIC_DAY	2	8	\N	2010-10-05	39020	\N	57179	\N
3432373	GENERIC_DAY	2	7	\N	2010-11-30	39020	\N	57179	\N
3432448	GENERIC_DAY	2	7	\N	2010-12-10	39020	\N	57179	\N
3432452	GENERIC_DAY	2	8	\N	2010-06-04	39020	\N	57179	\N
3432466	GENERIC_DAY	2	8	\N	2010-06-14	39020	\N	57179	\N
3432392	GENERIC_DAY	2	7	\N	2010-12-02	39020	\N	57179	\N
3432462	GENERIC_DAY	2	8	\N	2010-09-17	39020	\N	57179	\N
3432506	GENERIC_DAY	2	8	\N	2010-09-02	39020	\N	57179	\N
3432414	GENERIC_DAY	2	7	\N	2010-11-15	39020	\N	57179	\N
3432521	GENERIC_DAY	2	8	\N	2010-06-16	39020	\N	57179	\N
3432430	GENERIC_DAY	2	7	\N	2010-12-15	39020	\N	57179	\N
3432402	GENERIC_DAY	2	7	\N	2010-11-23	39020	\N	57179	\N
3432421	GENERIC_DAY	2	8	\N	2010-09-16	39020	\N	57179	\N
3432478	GENERIC_DAY	2	7	\N	2011-01-24	39020	\N	57179	\N
3432428	GENERIC_DAY	2	8	\N	2010-09-06	39020	\N	57179	\N
3432490	GENERIC_DAY	2	7	\N	2010-12-20	39020	\N	57179	\N
3432374	GENERIC_DAY	2	8	\N	2010-11-08	39020	\N	57179	\N
3432397	GENERIC_DAY	2	8	\N	2010-07-23	39020	\N	57179	\N
3432514	GENERIC_DAY	2	7	\N	2011-01-14	39020	\N	57179	\N
3432446	GENERIC_DAY	2	8	\N	2010-11-05	39020	\N	57179	\N
3432371	GENERIC_DAY	2	8	\N	2010-08-06	39020	\N	57179	\N
3432424	GENERIC_DAY	2	7	\N	2010-11-16	39020	\N	57179	\N
3432415	GENERIC_DAY	2	7	\N	2011-01-18	39020	\N	57179	\N
3432429	GENERIC_DAY	2	8	\N	2010-07-26	39020	\N	57179	\N
3432517	GENERIC_DAY	2	8	\N	2010-10-04	39020	\N	57179	\N
3432471	GENERIC_DAY	2	8	\N	2010-07-14	39020	\N	57179	\N
3432450	GENERIC_DAY	2	8	\N	2010-10-06	39020	\N	57179	\N
3432465	GENERIC_DAY	2	7	\N	2010-12-27	39020	\N	57179	\N
3432384	GENERIC_DAY	2	8	\N	2010-09-20	39020	\N	57179	\N
3432458	GENERIC_DAY	2	8	\N	2010-08-23	39020	\N	57179	\N
3432520	GENERIC_DAY	2	8	\N	2010-06-29	39020	\N	57179	\N
3432475	GENERIC_DAY	2	7	\N	2011-01-20	39020	\N	57179	\N
3432482	GENERIC_DAY	2	8	\N	2010-10-19	39020	\N	57179	\N
3432443	GENERIC_DAY	2	7	\N	2011-01-26	39020	\N	57179	\N
3432391	GENERIC_DAY	2	8	\N	2010-06-23	39020	\N	57179	\N
3432472	GENERIC_DAY	2	8	\N	2010-08-12	39020	\N	57179	\N
3432378	GENERIC_DAY	2	8	\N	2010-07-19	39020	\N	57179	\N
3432393	GENERIC_DAY	2	8	\N	2010-07-12	39020	\N	57179	\N
3432427	GENERIC_DAY	2	8	\N	2010-08-18	39020	\N	57179	\N
3432432	GENERIC_DAY	2	8	\N	2010-07-01	39020	\N	57179	\N
3432390	GENERIC_DAY	2	7	\N	2011-01-19	39020	\N	57179	\N
3432407	GENERIC_DAY	2	7	\N	2010-12-30	39020	\N	57179	\N
3432436	GENERIC_DAY	2	8	\N	2010-11-03	39020	\N	57179	\N
3432463	GENERIC_DAY	2	7	\N	2010-12-28	39020	\N	57179	\N
3432523	GENERIC_DAY	2	8	\N	2010-11-11	39020	\N	57179	\N
3432496	GENERIC_DAY	2	7	\N	2010-11-25	39020	\N	57179	\N
3432470	GENERIC_DAY	2	7	\N	2010-12-09	39020	\N	57179	\N
3432419	GENERIC_DAY	2	7	\N	2010-12-13	39020	\N	57179	\N
3432518	GENERIC_DAY	2	8	\N	2010-07-20	39020	\N	57179	\N
3432396	GENERIC_DAY	2	8	\N	2010-10-18	39020	\N	57179	\N
3432382	GENERIC_DAY	2	8	\N	2010-08-31	39020	\N	57179	\N
3432464	GENERIC_DAY	2	8	\N	2010-11-04	39020	\N	57179	\N
3432491	GENERIC_DAY	2	8	\N	2010-07-16	39020	\N	57179	\N
3432406	GENERIC_DAY	2	8	\N	2010-06-24	39020	\N	57179	\N
3432399	GENERIC_DAY	2	7	\N	2010-12-31	39020	\N	57179	\N
3432439	GENERIC_DAY	2	8	\N	2010-06-15	39020	\N	57179	\N
3432515	GENERIC_DAY	2	7	\N	2011-01-27	39020	\N	57179	\N
3432512	GENERIC_DAY	2	8	\N	2010-08-05	39020	\N	57179	\N
3432508	GENERIC_DAY	2	8	\N	2010-07-07	39020	\N	57179	\N
3432492	GENERIC_DAY	2	7	\N	2010-12-17	39020	\N	57179	\N
3432479	GENERIC_DAY	2	8	\N	2010-07-29	39020	\N	57179	\N
3432380	GENERIC_DAY	2	8	\N	2010-09-24	39020	\N	57179	\N
3432495	GENERIC_DAY	2	8	\N	2010-09-27	39020	\N	57179	\N
3432370	GENERIC_DAY	2	7	\N	2010-12-01	39020	\N	57179	\N
3432425	GENERIC_DAY	2	7	\N	2011-01-13	39020	\N	57179	\N
3432507	GENERIC_DAY	2	7	\N	2010-12-24	39020	\N	57179	\N
3432469	GENERIC_DAY	2	8	\N	2010-07-13	39020	\N	57179	\N
3432449	GENERIC_DAY	2	8	\N	2010-10-20	39020	\N	57179	\N
3432528	GENERIC_DAY	2	8	\N	2010-11-12	39020	\N	57179	\N
3432484	GENERIC_DAY	2	8	\N	2010-07-15	39020	\N	57179	\N
3432467	GENERIC_DAY	2	8	\N	2010-06-08	39020	\N	57179	\N
3432379	GENERIC_DAY	2	8	\N	2010-09-13	39020	\N	57179	\N
3432383	GENERIC_DAY	2	8	\N	2010-09-08	39020	\N	57179	\N
3432530	GENERIC_DAY	2	8	\N	2010-09-01	39020	\N	57179	\N
3432481	GENERIC_DAY	2	8	\N	2010-10-26	39020	\N	57179	\N
3432401	GENERIC_DAY	2	7	\N	2010-12-07	39020	\N	57179	\N
3432498	GENERIC_DAY	2	8	\N	2010-09-23	39020	\N	57179	\N
3432503	GENERIC_DAY	2	8	\N	2010-08-02	39020	\N	57179	\N
3432489	GENERIC_DAY	2	7	\N	2011-01-05	39020	\N	57179	\N
3432416	GENERIC_DAY	2	8	\N	2010-08-24	39020	\N	57179	\N
3432418	GENERIC_DAY	2	8	\N	2010-09-10	39020	\N	57179	\N
3432438	GENERIC_DAY	2	8	\N	2010-07-22	39020	\N	57179	\N
3432456	GENERIC_DAY	2	8	\N	2010-06-28	39020	\N	57179	\N
3432473	GENERIC_DAY	2	7	\N	2011-01-25	39020	\N	57179	\N
3432375	GENERIC_DAY	2	7	\N	2010-12-29	39020	\N	57179	\N
3432405	GENERIC_DAY	2	8	\N	2010-08-20	39020	\N	57179	\N
3432441	GENERIC_DAY	2	8	\N	2010-10-14	39020	\N	57179	\N
3432500	GENERIC_DAY	2	8	\N	2010-06-22	39020	\N	57179	\N
3432437	GENERIC_DAY	2	7	\N	2010-11-18	39020	\N	57179	\N
3432408	GENERIC_DAY	2	8	\N	2010-10-01	39020	\N	57179	\N
3432487	GENERIC_DAY	2	8	\N	2010-06-11	39020	\N	57179	\N
3432468	GENERIC_DAY	2	7	\N	2011-01-11	39020	\N	57179	\N
3432388	GENERIC_DAY	2	7	\N	2010-12-21	39020	\N	57179	\N
3432412	GENERIC_DAY	2	8	\N	2010-09-22	39020	\N	57179	\N
3432453	GENERIC_DAY	2	8	\N	2010-08-17	39020	\N	57179	\N
3432497	GENERIC_DAY	2	7	\N	2010-12-16	39020	\N	57179	\N
3432403	GENERIC_DAY	2	7	\N	2010-11-29	39020	\N	57179	\N
3432488	GENERIC_DAY	2	8	\N	2010-07-28	39020	\N	57179	\N
3432435	GENERIC_DAY	2	8	\N	2010-10-25	39020	\N	57179	\N
3432513	GENERIC_DAY	2	8	\N	2010-08-27	39020	\N	57179	\N
3432480	GENERIC_DAY	2	8	\N	2010-06-01	39020	\N	57179	\N
3432431	GENERIC_DAY	2	7	\N	2010-12-22	39020	\N	57179	\N
3432516	GENERIC_DAY	2	8	\N	2010-09-28	39020	\N	57179	\N
3432376	GENERIC_DAY	2	7	\N	2011-01-21	39020	\N	57179	\N
3432502	GENERIC_DAY	2	8	\N	2010-08-19	39020	\N	57179	\N
3432413	GENERIC_DAY	2	8	\N	2010-10-28	39020	\N	57179	\N
3432455	GENERIC_DAY	2	8	\N	2010-06-25	39020	\N	57179	\N
3432505	GENERIC_DAY	2	8	\N	2010-08-10	39020	\N	57179	\N
3432389	GENERIC_DAY	2	8	\N	2010-09-29	39020	\N	57179	\N
3432522	GENERIC_DAY	2	8	\N	2010-09-09	39020	\N	57179	\N
3432386	GENERIC_DAY	2	8	\N	2010-06-07	39020	\N	57179	\N
3432422	GENERIC_DAY	2	8	\N	2010-11-10	39020	\N	57179	\N
3432459	GENERIC_DAY	2	8	\N	2010-06-18	39020	\N	57179	\N
3432404	GENERIC_DAY	2	8	\N	2010-06-30	39020	\N	57179	\N
3432395	GENERIC_DAY	2	8	\N	2010-08-30	39020	\N	57179	\N
3432377	GENERIC_DAY	2	8	\N	2010-07-30	39020	\N	57179	\N
3432372	GENERIC_DAY	2	7	\N	2011-01-17	39020	\N	57179	\N
3432510	GENERIC_DAY	2	8	\N	2010-06-17	39020	\N	57179	\N
3432433	GENERIC_DAY	2	8	\N	2010-10-29	39020	\N	57179	\N
3432532	GENERIC_DAY	2	8	\N	2010-08-16	39020	\N	57179	\N
3432434	GENERIC_DAY	2	7	\N	2010-11-22	39020	\N	57179	\N
3432483	GENERIC_DAY	2	8	\N	2010-08-25	39020	\N	57179	\N
3432400	GENERIC_DAY	2	8	\N	2010-06-03	39020	\N	57179	\N
3432440	GENERIC_DAY	2	7	\N	2011-01-04	39020	\N	57179	\N
3432409	GENERIC_DAY	2	7	\N	2011-01-10	39020	\N	57179	\N
3432423	GENERIC_DAY	2	8	\N	2010-10-13	39020	\N	57179	\N
3432398	GENERIC_DAY	2	8	\N	2010-10-08	39020	\N	57179	\N
3432534	GENERIC_DAY	2	8	\N	2010-07-05	39020	\N	57179	\N
3432411	GENERIC_DAY	2	8	\N	2010-10-07	39020	\N	57179	\N
3432410	GENERIC_DAY	2	8	\N	2010-07-27	39020	\N	57179	\N
3432461	GENERIC_DAY	2	8	\N	2010-06-21	39020	\N	57179	\N
3432394	GENERIC_DAY	2	7	\N	2010-11-26	39020	\N	57179	\N
3432524	GENERIC_DAY	2	8	\N	2010-09-03	39020	\N	57179	\N
3432535	GENERIC_DAY	2	8	\N	2010-08-26	39020	\N	57179	\N
3432387	GENERIC_DAY	2	8	\N	2010-07-21	39020	\N	57179	\N
3443275	GENERIC_DAY	2	8	\N	2010-06-14	39022	\N	2379862	\N
3443296	GENERIC_DAY	2	6	\N	2010-06-25	39015	\N	2379862	\N
3443274	GENERIC_DAY	2	0	\N	2010-06-20	39015	\N	2379862	\N
3443280	GENERIC_DAY	2	8	\N	2010-06-15	39015	\N	2379862	\N
3443270	GENERIC_DAY	2	8	\N	2010-06-14	39015	\N	2379862	\N
3443290	GENERIC_DAY	2	8	\N	2010-06-24	39015	\N	2379862	\N
3443299	GENERIC_DAY	2	0	\N	2010-06-13	39022	\N	2379862	\N
3443278	GENERIC_DAY	2	8	\N	2010-06-16	39022	\N	2379862	\N
3443287	GENERIC_DAY	2	8	\N	2010-06-11	39015	\N	2379862	\N
3443297	GENERIC_DAY	2	8	\N	2010-06-23	39022	\N	2379862	\N
3443294	GENERIC_DAY	2	0	\N	2010-06-12	39022	\N	2379862	\N
3443310	GENERIC_DAY	2	8	\N	2010-06-04	39022	\N	2379862	\N
3443292	GENERIC_DAY	2	8	\N	2010-06-09	39015	\N	2379862	\N
3443300	GENERIC_DAY	2	8	\N	2010-06-04	39015	\N	2379862	\N
3443285	GENERIC_DAY	2	0	\N	2010-06-12	39015	\N	2379862	\N
3443277	GENERIC_DAY	2	8	\N	2010-06-10	39022	\N	2379862	\N
3443289	GENERIC_DAY	2	8	\N	2010-06-03	39015	\N	2379862	\N
3443268	GENERIC_DAY	2	8	\N	2010-06-15	39022	\N	2379862	\N
3443303	GENERIC_DAY	2	8	\N	2010-06-08	39022	\N	2379862	\N
3443305	GENERIC_DAY	2	8	\N	2010-06-21	39015	\N	2379862	\N
3443276	GENERIC_DAY	2	0	\N	2010-06-19	39015	\N	2379862	\N
3443271	GENERIC_DAY	2	8	\N	2010-06-22	39015	\N	2379862	\N
3443288	GENERIC_DAY	2	8	\N	2010-06-08	39015	\N	2379862	\N
3443312	GENERIC_DAY	2	0	\N	2010-06-05	39015	\N	2379862	\N
3443286	GENERIC_DAY	2	8	\N	2010-06-03	39022	\N	2379862	\N
3443306	GENERIC_DAY	2	8	\N	2010-06-18	39022	\N	2379862	\N
3443308	GENERIC_DAY	2	8	\N	2010-06-16	39015	\N	2379862	\N
3443282	GENERIC_DAY	2	8	\N	2010-06-09	39022	\N	2379862	\N
3443309	GENERIC_DAY	2	8	\N	2010-06-22	39022	\N	2379862	\N
3443302	GENERIC_DAY	2	0	\N	2010-06-19	39022	\N	2379862	\N
3443291	GENERIC_DAY	2	8	\N	2010-06-24	39022	\N	2379862	\N
3443269	GENERIC_DAY	2	0	\N	2010-06-06	39015	\N	2379862	\N
3443298	GENERIC_DAY	2	0	\N	2010-06-20	39022	\N	2379862	\N
3443293	GENERIC_DAY	2	6	\N	2010-06-25	39022	\N	2379862	\N
3443279	GENERIC_DAY	2	8	\N	2010-06-18	39015	\N	2379862	\N
3443281	GENERIC_DAY	2	8	\N	2010-06-02	39022	\N	2379862	\N
3443307	GENERIC_DAY	2	0	\N	2010-06-06	39022	\N	2379862	\N
3443304	GENERIC_DAY	2	8	\N	2010-06-10	39015	\N	2379862	\N
3443295	GENERIC_DAY	2	8	\N	2010-06-02	39015	\N	2379862	\N
3443313	GENERIC_DAY	2	8	\N	2010-06-07	39022	\N	2379862	\N
2494063	GENERIC_DAY	0	1	\N	2010-05-13	1128	\N	14149	\N
2494064	GENERIC_DAY	0	2	\N	2010-05-12	1128	\N	14149	\N
2494065	GENERIC_DAY	0	3	\N	2010-05-11	1128	\N	14149	\N
2494066	GENERIC_DAY	0	3	\N	2010-05-12	1126	\N	14149	\N
2494067	GENERIC_DAY	0	1	\N	2010-05-13	1126	\N	14149	\N
2494068	GENERIC_DAY	0	3	\N	2010-05-12	1130	\N	14149	\N
2494069	GENERIC_DAY	0	3	\N	2010-05-11	1126	\N	14149	\N
2494070	GENERIC_DAY	0	2	\N	2010-05-11	1130	\N	14149	\N
2494071	GENERIC_DAY	0	2	\N	2010-05-13	1130	\N	14149	\N
2494072	GENERIC_DAY	0	2	\N	2010-05-10	1130	\N	14148	\N
2494073	GENERIC_DAY	0	2	\N	2010-05-05	1130	\N	14148	\N
2494074	GENERIC_DAY	0	0	\N	2010-05-09	1126	\N	14148	\N
2494075	GENERIC_DAY	0	3	\N	2010-05-07	1130	\N	14148	\N
2494076	GENERIC_DAY	0	2	\N	2010-05-07	1128	\N	14148	\N
2494077	GENERIC_DAY	0	0	\N	2010-05-09	1128	\N	14148	\N
2494078	GENERIC_DAY	0	2	\N	2010-05-10	1128	\N	14148	\N
2494079	GENERIC_DAY	0	0	\N	2010-05-08	1130	\N	14148	\N
2494080	GENERIC_DAY	0	3	\N	2010-05-07	1126	\N	14148	\N
2494081	GENERIC_DAY	0	3	\N	2010-05-05	1126	\N	14148	\N
2494082	GENERIC_DAY	0	0	\N	2010-05-08	1126	\N	14148	\N
2494083	GENERIC_DAY	0	3	\N	2010-05-06	1126	\N	14148	\N
2494084	GENERIC_DAY	0	0	\N	2010-05-09	1130	\N	14148	\N
2494085	GENERIC_DAY	0	2	\N	2010-05-10	1126	\N	14148	\N
2494086	GENERIC_DAY	0	0	\N	2010-05-08	1128	\N	14148	\N
2494087	GENERIC_DAY	0	2	\N	2010-05-06	1128	\N	14148	\N
2494088	GENERIC_DAY	0	3	\N	2010-05-05	1128	\N	14148	\N
2494089	GENERIC_DAY	0	3	\N	2010-05-06	1130	\N	14148	\N
2494090	GENERIC_DAY	0	2	\N	2010-05-19	1128	\N	14151	\N
2494091	GENERIC_DAY	0	3	\N	2010-05-19	1130	\N	14151	\N
2494092	GENERIC_DAY	0	3	\N	2010-05-19	1126	\N	14151	\N
2494093	GENERIC_DAY	0	3	\N	2010-05-18	1128	\N	14151	\N
2494094	GENERIC_DAY	0	3	\N	2010-05-18	1126	\N	14151	\N
2494095	GENERIC_DAY	0	2	\N	2010-05-18	1130	\N	14151	\N
2494096	GENERIC_DAY	0	2	\N	2010-05-20	1130	\N	14151	\N
2494097	GENERIC_DAY	0	1	\N	2010-05-20	1128	\N	14151	\N
2494098	GENERIC_DAY	0	1	\N	2010-05-20	1126	\N	14151	\N
2494099	GENERIC_DAY	0	0	\N	2010-05-16	26463	\N	14150	\N
2494100	GENERIC_DAY	0	2	\N	2010-05-17	26463	\N	14150	\N
2494101	GENERIC_DAY	0	0	\N	2010-05-17	14343	\N	14150	\N
2494102	GENERIC_DAY	0	0	\N	2010-05-17	14345	\N	14150	\N
2494103	GENERIC_DAY	0	0	\N	2010-05-15	26463	\N	14150	\N
2494104	GENERIC_DAY	0	0	\N	2010-05-16	14343	\N	14150	\N
2494105	GENERIC_DAY	0	0	\N	2010-05-16	14345	\N	14150	\N
2494106	GENERIC_DAY	0	3	\N	2010-05-14	14343	\N	14150	\N
2494107	GENERIC_DAY	0	0	\N	2010-05-15	14343	\N	14150	\N
2494108	GENERIC_DAY	0	2	\N	2010-05-14	26463	\N	14150	\N
2494109	GENERIC_DAY	0	0	\N	2010-05-15	14345	\N	14150	\N
2494110	GENERIC_DAY	0	3	\N	2010-05-14	14345	\N	14150	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type, queue_dependency) FROM stdin;
4554835	6	13947	13948	0	\N
4554798	6	13947	13948	0	\N
4554836	6	13946	13947	0	\N
4554799	6	13946	13947	0	\N
4554837	6	13948	13949	0	\N
4554800	6	13948	13949	0	\N
4554863	8	13955	13956	0	\N
4554864	8	13954	13955	0	\N
4554862	8	13956	13957	0	\N
4554861	8	13957	13958	0	\N
4554860	8	13958	13961	0	\N
819277	2	2424	2426	0	\N
819274	4	2434	2435	0	\N
819275	4	2431	2434	0	\N
819276	4	2428	2429	0	\N
819200	3	2427	2428	0	\N
819271	4	2427	2428	0	\N
819272	4	2430	2431	0	\N
819273	4	2429	2430	0	\N
819278	2	2424	2426	0	\N
4554794	3	13941	13945	0	\N
4554795	3	13940	13941	0	\N
4554797	3	13938	13939	0	\N
4554796	3	13939	13940	0	\N
8945672	3	27373	27374	0	\N
8945673	3	27373	27375	0	\N
8945671	3	27371	27372	0	\N
78514164	5	13961	13962	0	\N
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
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
16060	Indcidencias	None.
16061	Indcidencias	Incidencia...
16063	Indcidencias	None
2495104	Indcidencias	
2495105	Indcidencias	
2496619	Indcidencias	
2496620	Indcidencias	
2496621	Indcidencias	
2496625	Indcidencias	
2496626	Indcidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
2494909	13484	100.00
2494921	1838	100.00
2494922	1839	100.00
2496736	13435	100.00
2496737	13436	100.00
2496792	13485	100.00
2496783	3466220	100.00
2496784	3466220	100.00
2496785	3466222	100.00
2496786	3466222	100.00
2496787	3466223	100.00
13547	13465	100.00
2494902	13466	100.00
2496797	13467	100.00
3504297	26969	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1515	1	Igalia	B15804842	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	1013
1516	2	Navantia	N00000000	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	1013
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
2679
2680
2681
2717
2718
2719
2720
2721
14142
14143
14146
14147
14148
14149
14150
14151
24071
24072
24074
27674
27675
39509
39510
39511
39518
39519
39520
57178
57179
57180
2379862
2494207
2494210
2494211
2494212
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
34698
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, code, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
3480662	1	07d4ee87-a18b-442c-91d9-10dcad92fdae	15.50	2010-05-14	\N	16161	3480561
3480663	1	e3aad857-5c4b-46db-958e-d9c0f9e1fd5f	12.50	2010-05-14	\N	16160	3480561
3480664	1	75f84160-b06f-4d49-9ece-287805aca066	10.00	2010-05-14	\N	16161	3480562
3480665	1	306123a5-295b-424d-b162-b1a31452fd72	8.00	2010-05-14	\N	16160	3480562
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
13810	1	2e8715ce-98ce-4392-9d0c-48ed8724274d	WORKER	450	1.00	f	\N	14908
13811	1	58d5f8d4-bf24-458c-a2f6-54ac80fc7658	WORKER	300	1.00	f	\N	14909
13812	1	1529f659-1615-442a-9b92-a70ee47e7b0b	WORKER	300	1.00	f	\N	14910
13813	1	ee435ae5-8885-4bfa-80f4-f1ee1f842f7b	WORKER	24	1.00	f	\N	14911
13814	1	ea34222c-86be-4511-a257-ef004c8a041e	WORKER	40	1.00	f	\N	14912
13815	1	d4a8eda4-4400-4ab8-a945-299f8995d28a	WORKER	40	1.00	f	\N	14913
13752	1	d676fa93-8306-4e8b-800b-29086226418f	WORKER	30	1.00	f	\N	14863
13753	1	ffb42ec8-8736-46da-897d-1161ae42fff3	WORKER	20	1.00	f	\N	14864
13754	1	90cf475b-1e51-4271-836b-21665763c003	WORKER	10	1.00	f	\N	14865
13755	1	4a3f39bb-9ccf-4868-abec-c42ba76bf74c	WORKER	20	1.00	f	\N	14866
13816	1	6f2153d8-4abf-4006-acf1-0f272b4e694e	WORKER	100	1.00	f	\N	14914
13817	1	1a3ac5f1-7d34-42a6-bdf9-32567c7572ce	WORKER	140	1.00	f	\N	14916
13818	1	74efc2bd-c2d4-465f-8998-db0119e7bdc0	WORKER	170	1.00	f	\N	14917
13819	1	b84d217e-6341-4f90-89d9-433155852ad2	WORKER	60	1.00	f	\N	14918
13737	8	Navalplan-00002-00002-00001	WORKER	20	1.00	f	13436	\N
13738	8	Navalplan-00002-00003-00001	WORKER	10	1.00	f	13437	\N
13739	8	Navalplan-00002-00004-00001	WORKER	20	1.00	f	13438	\N
13779	11	Navalplan-00003-00004-00001	WORKER	20	1.00	f	13468	\N
27279	6	Navalplan-00006-00001-00002	WORKER	100	0.50	f	26970	\N
27270	8	Navalplan-00006-00001-00001	WORKER	100	0.50	f	26970	\N
27271	8	Navalplan-00006-00002-00001	WORKER	1000	0.20	f	26971	\N
16665	3	Navalplan-00004-00011-00001	WORKER	140	1.00	f	13492	\N
16666	3	Navalplan-00004-00012-00001	WORKER	170	1.00	f	13493	\N
16667	3	Navalplan-00004-00007-00001	WORKER	60	1.00	f	13494	\N
2032	6	Navalplan-00001-00008-00001	WORKER	450	1.00	f	1838	\N
2033	6	Navalplan-00001-00009-00001	WORKER	300	1.00	f	1839	\N
27282	5	Navalplan-00006-00002-00002	WORKER	2000	0.40	f	26971	\N
2034	6	Navalplan-00001-00010-00001	WORKER	300	1.00	f	1840	\N
2035	6	Navalplan-00001-00002-00001	WORKER	24	1.00	f	1841	\N
2037	6	Navalplan-00001-00004-00001	WORKER	40	1.00	f	1843	\N
2038	6	Navalplan-00001-00005-00001	WORKER	100	1.00	f	1844	\N
2039	6	Navalplan-00001-00011-00001	WORKER	140	1.00	f	1846	\N
2040	6	Navalplan-00001-00012-00001	WORKER	170	1.00	f	1847	\N
2041	6	Navalplan-00001-00007-00001	WORKER	60	1.00	f	1848	\N
27283	5	Navalplan-00006-00002-00003	WORKER	2000	0.40	f	26971	\N
27275	7	Navalplan-00006-00003-00001	WORKER	1000	1.00	f	26975	\N
27276	7	Navalplan-00006-00004-00001	WORKER	500	1.00	f	26976	\N
13736	8	Navalplan-00002-00001-00001	WORKER	30	1.00	f	13435	\N
2036	6	Navalplan-00001-00003-00001	WORKER	40	1.00	f	1842	\N
13776	11	Navalplan-00003-00001-00001	WORKER	30	1.00	f	13465	\N
13777	11	Navalplan-00003-00002-00001	WORKER	20	1.00	f	13466	\N
27277	7	Navalplan-00006-00005-00001	WORKER	2000	1.00	f	26977	\N
13830	3	Navalplan-00004-00008-00001	WORKER	450	1.00	f	13484	\N
13831	3	Navalplan-00004-00009-00001	WORKER	300	1.00	f	13485	\N
13832	3	Navalplan-00004-00010-00001	WORKER	300	1.00	f	13486	\N
13833	3	Navalplan-00004-00002-00001	WORKER	24	1.00	f	13487	\N
13834	3	Navalplan-00004-00003-00001	WORKER	40	1.00	f	13488	\N
13835	3	Navalplan-00004-00004-00001	WORKER	40	1.00	f	13489	\N
13778	11	Navalplan-00003-00003-00001	WORKER	10	1.00	f	13467	\N
13836	3	Navalplan-00004-00005-00001	WORKER	100	1.00	f	13490	\N
3466320	5	Navalplan-00009-00001-00001	WORKER	100	1.00	f	3466220	\N
3466321	5	Navalplan-00009-00004-00001	WORKER	100	1.00	f	3466222	\N
3466322	5	Navalplan-00009-00003-00001	WORKER	100	1.00	f	3466223	\N
50197	29	Navalplan-00008-00001-00001	WORKER	1300	0.56	f	49896	\N
50274	12	Navalplan-00008-00001-00002	WORKER	1000	0.43	f	49896	\N
50208	27	Navalplan-00008-00013-00001	WORKER	300	1.00	f	49908	\N
50209	27	Navalplan-00008-00014-00001	WORKER	1493	1.00	f	49909	\N
50210	25	Navalplan-00008-00017-00001	WORKER	105	1.00	f	49911	\N
50199	29	Navalplan-00008-00003-00001	WORKER	84	1.00	f	49898	\N
50211	25	Navalplan-00008-00018-00001	WORKER	112	1.00	f	49912	\N
50212	25	Navalplan-00008-00019-00001	WORKER	105	1.00	f	49913	\N
50213	25	Navalplan-00008-00020-00001	WORKER	105	1.00	f	49914	\N
50214	25	Navalplan-00008-00021-00001	WORKER	112	1.00	f	49915	\N
50215	25	Navalplan-00008-00022-00001	WORKER	232	1.00	f	49916	\N
50216	25	Navalplan-00008-00023-00001	WORKER	77	1.00	f	49917	\N
50217	25	Navalplan-00008-00024-00001	WORKER	155	1.00	f	49918	\N
50218	25	Navalplan-00008-00025-00001	WORKER	63	1.00	f	49919	\N
50219	25	Navalplan-00008-00026-00001	WORKER	134	1.00	f	49920	\N
50220	25	Navalplan-00008-00027-00001	WORKER	240	1.00	f	49921	\N
50221	25	Navalplan-00008-00028-00001	WORKER	6	1.00	f	49922	\N
50222	25	Navalplan-00008-00029-00001	WORKER	183	1.00	f	49923	\N
50223	25	Navalplan-00008-00030-00001	WORKER	162	1.00	f	49924	\N
50224	25	Navalplan-00008-00031-00001	WORKER	190	1.00	f	49925	\N
50225	25	Navalplan-00008-00032-00001	WORKER	140	1.00	f	49926	\N
50226	25	Navalplan-00008-00034-00001	WORKER	140	1.00	f	49929	\N
50200	28	Navalplan-00008-00004-00001	WORKER	154	1.00	f	49899	\N
50227	24	Navalplan-00008-00035-00001	WORKER	352	1.00	f	49930	\N
50228	24	Navalplan-00008-00036-00001	WORKER	35	1.00	f	49931	\N
50229	24	Navalplan-00008-00037-00001	WORKER	35	1.00	f	49932	\N
50230	24	Navalplan-00008-00038-00001	WORKER	35	1.00	f	49933	\N
50231	24	Navalplan-00008-00039-00001	WORKER	50	1.00	f	49934	\N
50232	24	Navalplan-00008-00040-00001	WORKER	56	1.00	f	49935	\N
50233	24	Navalplan-00008-00041-00001	WORKER	260	1.00	f	49936	\N
50234	24	Navalplan-00008-00042-00001	WORKER	63	1.00	f	49937	\N
50239	21	Navalplan-00008-00049-00001	WORKER	70	1.00	f	49944	\N
50236	23	Navalplan-00008-00044-00001	WORKER	21	1.00	f	49939	\N
50248	20	Navalplan-00008-00058-00001	WORKER	56	1.00	f	49953	\N
50249	20	Navalplan-00008-00059-00001	WORKER	70	1.00	f	49954	\N
50250	20	Navalplan-00008-00060-00001	WORKER	70	1.00	f	49955	\N
50251	20	Navalplan-00008-00061-00001	WORKER	70	1.00	f	49956	\N
50252	20	Navalplan-00008-00062-00001	WORKER	35	1.00	f	49957	\N
50237	22	Navalplan-00008-00046-00001	WORKER	35	1.00	f	49941	\N
50238	22	Navalplan-00008-00047-00001	WORKER	35	1.00	f	49942	\N
50235	23	Navalplan-00008-00043-00001	WORKER	35	1.00	f	49938	\N
50240	21	Navalplan-00008-00050-00001	WORKER	140	1.00	f	49945	\N
50241	21	Navalplan-00008-00051-00001	WORKER	70	1.00	f	49946	\N
50242	21	Navalplan-00008-00052-00001	WORKER	70	1.00	f	49947	\N
50243	21	Navalplan-00008-00053-00001	WORKER	35	1.00	f	49948	\N
50244	21	Navalplan-00008-00054-00001	WORKER	35	1.00	f	49949	\N
50245	21	Navalplan-00008-00055-00001	WORKER	70	1.00	f	49950	\N
50246	21	Navalplan-00008-00056-00001	WORKER	70	1.00	f	49951	\N
50247	21	Navalplan-00008-00057-00001	WORKER	70	1.00	f	49952	\N
50202	28	Navalplan-00008-00012-00001	WORKER	176	1.00	f	49902	\N
50253	19	Navalplan-00008-00064-00001	WORKER	70	1.00	f	49959	\N
50254	19	Navalplan-00008-00065-00001	WORKER	77	1.00	f	49960	\N
50255	19	Navalplan-00008-00066-00001	WORKER	42	1.00	f	49961	\N
50256	19	Navalplan-00008-00067-00001	WORKER	100	1.00	f	49962	\N
50257	19	Navalplan-00008-00068-00001	WORKER	35	1.00	f	49963	\N
50258	19	Navalplan-00008-00069-00001	WORKER	56	1.00	f	49964	\N
50259	19	Navalplan-00008-00070-00001	WORKER	77	1.00	f	49965	\N
50260	19	Navalplan-00008-00071-00001	WORKER	300	1.00	f	49966	\N
50261	18	Navalplan-00008-00073-00001	WORKER	93	1.00	f	49968	\N
50262	18	Navalplan-00008-00074-00001	WORKER	50	1.00	f	49969	\N
50203	28	Navalplan-00008-00006-00001	WORKER	261	1.00	f	49903	\N
50263	18	Navalplan-00008-00075-00001	WORKER	482	1.00	f	49970	\N
50264	18	Navalplan-00008-00076-00001	WORKER	340	1.00	f	49971	\N
50265	18	Navalplan-00008-00077-00001	WORKER	130	1.00	f	49972	\N
50266	18	Navalplan-00008-00078-00001	WORKER	269	1.00	f	49973	\N
50267	18	Navalplan-00008-00079-00001	WORKER	180	1.00	f	49974	\N
50268	18	Navalplan-00008-00080-00001	WORKER	120	1.00	f	49975	\N
50204	28	Navalplan-00008-00007-00001	WORKER	387	1.00	f	49904	\N
50205	28	Navalplan-00008-00008-00001	WORKER	570	1.00	f	49905	\N
50206	28	Navalplan-00008-00009-00001	WORKER	1000	1.00	f	49906	\N
50207	28	Navalplan-00008-00010-00001	WORKER	300	1.00	f	49907	\N
50269	15	Navalplan-00008-00081-00001	WORKER	100	1.00	f	49976	\N
2394217	4	Navalplan-00008-00082-00001	WORKER	320	1.00	f	2394116	\N
2394218	4	Navalplan-00008-00083-00001	WORKER	500	1.00	f	2394117	\N
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
509	16	0
509	16	1
509	16	2
509	16	3
509	16	4
509	16	5
509	16	6
510	24	0
510	24	1
510	24	2
510	24	3
510	24	4
510	24	5
510	24	6
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
2494910	13483
2494911	13482
13552	13483
13553	13491
13554	13482
2494923	1837
2494924	1836
1925	1837
2496738	13434
2496793	13483
2496794	13482
49998	49910
49999	49928
50003	49943
50005	49967
2496740	3466221
2496788	3466221
2496789	3466221
2496739	3466219
2496791	3466219
2496790	3466219
2496798	13464
13541	13464
13548	13464
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1414	1	ba75de5d-a7ee-430a-8dfb-720c23cc9735	Bloque 2	1313
1415	1	da5d0351-c4c5-43ea-8af4-80c744ba6504	Bloque 5	1313
1416	1	5d94f20f-d52b-402a-90ab-d39744b6efa5	Bloque 1	1313
1418	1	a48874a6-7079-4c98-b8a8-e383dca0942b	Bloque 3	1313
1419	1	d17daf21-a2c4-46cf-9564-162e39e1f47d	Zona motores	1314
1420	1	3ce2f523-a79e-4cb2-a29c-21019aee328d	Puente	1314
1421	1	4d10737d-01e7-4e13-9b83-e157154b0e31	Bodegas	1314
1422	1	a927f5c2-f5a6-4d80-8a7d-1dde1b65f343	Sentinas	1314
1423	1	ea361cbc-e71f-45de-99b8-634dfb601023	Cubierta	1314
1424	1	1c135347-293d-488a-ae56-9afca04a3f01	CC Ferrol	1315
1426	1	226a2bcc-7ff2-4511-afdb-329047e16d30	CC Bilbao	1315
1427	1	3d91e6c9-2678-4cb7-9fa8-61ca401daba4	CC Vigo	1315
1428	1	47028151-05d6-44bd-a370-c454f347f9af	CC Coruña	1315
1425	15	ea683d67-0096-4270-b9d7-14556be44007	CC Cadiz	1315
1417	11	8d471b29-ec63-4311-af69-e33f878f5dae	Bloque 4	1313
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
1313	1	8da07df6-dcf0-4c99-b2a1-03a13fb6bca8	Bloque	t
1314	1	b1f69297-3874-4284-896f-638117f71d52	Zona del barco	t
1315	1	2200db81-67c3-46a5-99aa-6b6f18d9cb7f	Centro de coste	t
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

COPY limiting_resource_queue_element (id, version, resource_allocation_id, limiting_resource_queue_id, earlier_start_date_because_of_gantt, creation_timestamp, start_date, start_hour, end_date, end_hour) FROM stdin;
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
15756	Indcidencias	100	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
1113	Grúa 1	Primera grúa de la grada norte
1115	Torno A	Torno
1117	Torno 2	Torno
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
3503893	2	2	Tubo 16mm	23.00	13332	\N	3503794
3503892	2	1	Tubo 8mm	15.00	13332	\N	3503794
3503894	1	Acero	desc	20.00	208	\N	3503793
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
3504195	3	100	23.00	3503893	2010-05-24 00:00:00	0	13467
3504196	3	100	15.00	3503892	\N	1	13467
3504197	2	100	23.00	3503893	\N	1	13467
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
303	3	329dc02d-b60f-435f-8cfa-5aa08bef3e1c	Imported materials without category	f	\N
3503792	2	06d08e21-3e05-43fe-b5eb-1fc43add6913	Tubos	t	303
3503794	2	cc2feab1-029f-43c3-b98b-880d966c1f72	Tubos de acero	t	3503792
3503795	2	5f3c985e-0523-4011-9c69-2eb8da831334	Tubos de cobre	t	3503792
3503793	2	0b94e18d-b2d2-4d15-8711-152c0bf97f2e	Acero	t	303
3503791	2	82ea64fe-7a26-49cf-89bc-8dd34dc2d758	obre	t	\N
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
3480763	1	Visor de pedidos
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled) FROM stdin;
1010	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f
1011	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
1012	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
1013	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
3480864	1	visor	9533206da5708b1cfe5245917dbe7430297b79911f3dbf56e9f12b99ccd90fcbb6ccd1650fbb976c120e6809395da8354fa6a321a6e0ead331ce8c8d0c3c9be4	visor@visor.com	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
2121	USER	5	WRITE_AUTHORIZATION	1836	1011	\N
13635	USER	8	WRITE_AUTHORIZATION	13434	1011	\N
50096	USER	29	WRITE_AUTHORIZATION	49895	1011	\N
13636	USER	10	WRITE_AUTHORIZATION	13464	1011	\N
3480965	PROFILE	2	READ_AUTHORIZATION	26969	\N	3480763
27169	USER	8	WRITE_AUTHORIZATION	26969	1011	\N
13637	USER	2	WRITE_AUTHORIZATION	13482	1011	\N
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
13434	1425
13464	1425
13465	1417
\.


--
-- Data for Name: order_element_template_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_template_label (order_element_template_id, label_id) FROM stdin;
14862	1425
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
49895	\N	\N	t	83	621000.00	0.00	14570	\N	\N	0	\N	407
3466219	\N	\N	t	4	20000.00	0.00	300	\N	\N	1	1515	404
13464	\N	\N	t	4	0.00	0.00	80	\N	\N	0	1516	404
26969	Xavier Castaño	t	t	5	2000000.00	0.00	8700	DESC-1000	\N	0	1515	407
13482	\N	\N	t	12	0.00	0.00	1624	\N	\N	0	\N	404
1836	Xavi	t	t	12	50000.00	0.00	1624	B15804842	\N	0	1516	404
13434	\N	\N	t	4	20000.00	0.00	80	\N	\N	0	1516	404
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
1848	6	Impermeabilización	\N	Navalplan-00001-00007	\N	\N	0	1836	\N	\N	6
13434	10	Laminado Moldeado	\N	Navalplan-00002	2010-05-06 19:31:14.452	2010-06-30 00:00:00	3	\N	\N	\N	\N
13435	8	Pegar tablillas	\N	Navalplan-00002-00001	\N	\N	0	13434	\N	\N	0
13436	8	Saturar interna y externamente con resina epoxy	\N	Navalplan-00002-00002	\N	\N	0	13434	\N	\N	1
13437	8	Colocar estructura in interior	\N	Navalplan-00002-00003	\N	\N	0	13434	\N	\N	2
13464	11	Laminado Moldeado Abril Navantia	\N	Navalplan-00003	2010-05-02 00:00:00	2010-07-29 00:00:00	3	\N	\N	\N	\N
13465	11	Pegar tablillas	\N	Navalplan-00003-00001	\N	\N	0	13464	14863	\N	0
13466	11	Saturar interna y externamente con resina epoxy	\N	Navalplan-00003-00002	\N	\N	0	13464	14864	\N	1
13467	11	Colocar estructura in interior	\N	Navalplan-00003-00003	\N	\N	0	13464	14865	\N	2
13468	11	Colocar malla fina	\N	Navalplan-00003-00004	\N	\N	0	13464	14866	\N	3
13438	8	Colocar malla fina	\N	Navalplan-00002-00004	\N	\N	0	13434	\N	\N	3
13483	4	Fabricación en bancada	\N	Navalplan-00004-00001	\N	\N	3	13482	14907	\N	0
13482	4	Construcción de barco de recreo para Sergio Sumay	Desc.	Navalplan-00004	2010-05-07 08:54:00.144	2010-06-06 00:00:00	3	\N	\N	\N	\N
13484	3	Construcción de estructura transversal 	\N	Navalplan-00004-00008	\N	\N	0	13483	14908	\N	0
1836	7	Construcción de barco de recreo	Desc.	Navalplan-00001	2010-05-04 08:05:33.531	\N	3	\N	\N	\N	\N
1837	6	Fabricación en bancada	\N	Navalplan-00001-00001	\N	\N	3	1836	\N	\N	0
1838	6	Construcción de estructura transversal 	\N	Navalplan-00001-00008	\N	\N	0	1837	\N	\N	0
1839	6	Construcción de cavernas	\N	Navalplan-00001-00009	\N	\N	0	1837	\N	\N	1
1840	6	Construcción de anteparas	\N	Navalplan-00001-00010	\N	\N	0	1837	\N	\N	2
1841	6	Fijar estructura a base	\N	Navalplan-00001-00002	\N	\N	0	1836	\N	\N	1
1842	6	Unir quila	\N	Navalplan-00001-00003	\N	\N	0	1836	\N	\N	2
1843	6	Pegar terciado náutico	\N	Navalplan-00001-00004	\N	\N	0	1836	\N	\N	3
1844	6	Aplicar fibras de vidrio	\N	Navalplan-00001-00005	\N	\N	0	1836	\N	\N	4
1845	6	Lijado	\N	Navalplan-00001-00006	\N	\N	3	1836	\N	\N	5
1846	6	Lijado de cubierta	\N	Navalplan-00001-00011	\N	\N	0	1845	\N	\N	0
1847	6	Lijado de casco	\N	Navalplan-00001-00012	\N	\N	0	1845	\N	\N	1
13486	3	Construcción de anteparas	\N	Navalplan-00004-00010	\N	\N	0	13483	14910	\N	2
13487	3	Fijar estructura a base	\N	Navalplan-00004-00002	\N	\N	0	13482	14911	\N	1
13488	3	Unir quila	\N	Navalplan-00004-00003	\N	\N	0	13482	14912	\N	2
13489	3	Pegar terciado náutico	\N	Navalplan-00004-00004	\N	\N	0	13482	14913	\N	3
13490	3	Aplicar fibras de vidrio	\N	Navalplan-00004-00005	\N	\N	0	13482	14914	\N	4
13491	3	Lijado	\N	Navalplan-00004-00006	\N	\N	3	13482	14915	\N	5
13492	3	Lijado de cubierta	\N	Navalplan-00004-00011	\N	\N	0	13491	14916	\N	0
13493	3	Lijado de casco	\N	Navalplan-00004-00012	\N	\N	0	13491	14917	\N	1
13494	3	Impermeabilización	\N	Navalplan-00004-00007	\N	\N	0	13482	14918	\N	6
3466220	5	Construcción elemento 2	\N	Navalplan-00009-00001	2010-05-07 08:54:00.144	2010-05-19 08:54:00.144	0	3466221	\N	\N	0
3466219	6	Construcción de las cavernas	\N	Navalplan-00009	2010-05-07 08:54:00.144	2010-05-19 08:54:00.144	3	\N	\N	\N	\N
13485	4	Construcción de cavernas	\N	Navalplan-00004-00009	\N	\N	0	13483	14909	\N	1
26969	9	Construcción de barco de competición en acero	Desc.	Navalplan-00006	2010-06-10 00:00:00	2010-11-18 00:00:00	3	\N	\N	\N	\N
26970	8	Montaje de andamios	\N	Navalplan-00006-00001	\N	\N	0	26969	\N	\N	0
26971	8	Construcción del casco	\N	Navalplan-00006-00002	\N	\N	0	26969	\N	\N	1
26975	7	Construcción de cubierta	\N	Navalplan-00006-00003	\N	\N	0	26969	\N	\N	2
26976	7	Hélices	\N	Navalplan-00006-00004	\N	\N	0	26969	\N	\N	3
26977	7	Confección velamen	\N	Navalplan-00006-00005	\N	\N	0	26969	\N	\N	4
3466221	5	Construcción de cavernas	\N	Navalplan-00009-00002	2010-05-07 08:54:00.144	2010-05-19 08:54:00.144	3	3466219	\N	Navalplan-00004-00009	0
3466222	5	Construcción elemento 1	\N	Navalplan-00009-00004	\N	\N	0	3466221	\N	\N	1
3466223	5	Construcción elemento 3	\N	Navalplan-00009-00003	\N	\N	0	3466221	\N	\N	2
49896	29	Coordinación del proyecto	\N	Navalplan-00008-00001	\N	\N	0	49895	\N	\N	0
49908	27	Definición de modelo de negocio	\N	Navalplan-00008-00013	\N	\N	0	49895	\N	\N	1
49909	27	Análisis y diseño	\N	Navalplan-00008-00014	\N	\N	0	49895	\N	\N	2
49910	25	Sistema de Gestión de Reservas	\N	Navalplan-00008-00015	\N	\N	4	49895	\N	\N	3
49911	25	Gestor de establicimientos	\N	Navalplan-00008-00017	\N	\N	4	49910	\N	\N	0
49898	29	Gestor de productos	\N	Navalplan-00008-00003	\N	\N	4	49910	\N	\N	1
49912	25	Gestor de tarifas	\N	Navalplan-00008-00018	\N	\N	4	49910	\N	\N	2
49913	25	Gestor temporadas	\N	Navalplan-00008-00019	\N	\N	4	49910	\N	\N	3
49914	25	Gestor de clientes	\N	Navalplan-00008-00020	\N	\N	4	49910	\N	\N	4
49915	25	Gestor de cupos	\N	Navalplan-00008-00021	\N	\N	4	49910	\N	\N	5
49916	25	Gestor de pagos	\N	Navalplan-00008-00022	\N	\N	4	49910	\N	\N	6
49917	25	Gestor de tipos de habitación	\N	Navalplan-00008-00023	\N	\N	4	49910	\N	\N	7
49918	25	Gestor de reservas	\N	Navalplan-00008-00024	\N	\N	4	49910	\N	\N	8
49919	25	Gestor de usuarios	\N	Navalplan-00008-00025	\N	\N	4	49910	\N	\N	9
49920	25	Generador de alertas condicionadas al estado de las reservas	\N	Navalplan-00008-00026	\N	\N	4	49910	\N	\N	10
49921	25	Gestión de comisiones y retribuciones	\N	Navalplan-00008-00027	\N	\N	4	49910	\N	\N	11
49922	25	Sistema acceso personalizado	\N	Navalplan-00008-00028	\N	\N	4	49910	\N	\N	12
49923	25	Gestión de inventario y rentabilización	\N	Navalplan-00008-00029	\N	\N	4	49910	\N	\N	13
49924	25	Gestor de paquetes dinámicos	\N	Navalplan-00008-00030	\N	\N	4	49910	\N	\N	14
49925	25	Implementación XML OTA para consumo de datos	\N	Navalplan-00008-00031	\N	\N	4	49910	\N	\N	15
49926	25	Refactorización y optimización	\N	Navalplan-00008-00032	\N	\N	4	49910	\N	\N	16
49927	25	Sistema de Gestión de Empresas	\N	Navalplan-00008-00016	\N	\N	4	49895	\N	\N	4
49928	25	Sistema de gestión de propiedades (PMS)	\N	Navalplan-00008-00033	\N	\N	4	49927	\N	\N	0
49929	25	Gestor de usuarios y perfiles	\N	Navalplan-00008-00034	\N	\N	4	49928	\N	\N	0
49899	28	Dashboard	\N	Navalplan-00008-00004	\N	\N	4	49928	\N	\N	1
49930	24	Generación de informes	\N	Navalplan-00008-00035	\N	\N	4	49928	\N	\N	2
49931	24	Gestor de habitaciones	\N	Navalplan-00008-00036	\N	\N	4	49928	\N	\N	3
49932	24	Gestor de inventario	\N	Navalplan-00008-00037	\N	\N	4	49928	\N	\N	4
49895	34	Openapps - Invattur	\N	Navalplan-00008	2010-06-01 00:00:00	2011-01-31 00:00:00	2	\N	\N	\N	\N
49933	24	Gestor de disponibilidad y rejillas visuales de ocupación	\N	Navalplan-00008-00038	\N	\N	4	49928	\N	\N	5
49934	24	Búsqueda de reservas	\N	Navalplan-00008-00039	\N	\N	4	49928	\N	\N	6
49935	24	Optimización de habitaciones	\N	Navalplan-00008-00040	\N	\N	4	49928	\N	\N	7
49936	24	Gestión de facturación	\N	Navalplan-00008-00041	\N	\N	4	49928	\N	\N	8
49937	24	Planning de gestión con interfaz gráfica	\N	Navalplan-00008-00042	\N	\N	4	49928	\N	\N	9
49943	21	Sistema de inteligencia de negocio (BI)	\N	Navalplan-00008-00048	\N	\N	4	49927	\N	\N	1
49944	21	Asistente para la creación de informes e indicadores	\N	Navalplan-00008-00049	\N	\N	4	49943	\N	\N	0
49939	23	Ejecución automática de informes	\N	Navalplan-00008-00044	\N	\N	4	49943	\N	\N	1
49953	20	Análisis dinámicos	\N	Navalplan-00008-00058	\N	\N	4	49943	\N	\N	2
49954	20	Panel interactivo (Dashboard)	\N	Navalplan-00008-00059	\N	\N	4	49943	\N	\N	3
49955	20	Análisis diferencial y herramientas de predicción	\N	Navalplan-00008-00060	\N	\N	4	49943	\N	\N	4
49956	20	Data mining	\N	Navalplan-00008-00061	\N	\N	4	49943	\N	\N	5
49957	20	Creación de sistema de alertas configurables para indicadores	\N	Navalplan-00008-00062	\N	\N	4	49943	\N	\N	6
49940	22	Sistema de gestión de relaciones (CRM)	\N	Navalplan-00008-00045	\N	\N	4	49927	\N	\N	2
49941	22	Administración de cuentas y contactos	\N	Navalplan-00008-00046	\N	\N	4	49940	\N	\N	0
49942	22	Cuadro de oportunidades y tendencias	\N	Navalplan-00008-00047	\N	\N	4	49940	\N	\N	1
49938	23	Gestor de historial de clientes	\N	Navalplan-00008-00043	\N	\N	4	49940	\N	\N	2
49945	21	Gestor de mailings	\N	Navalplan-00008-00050	\N	\N	4	49940	\N	\N	3
49947	21	Gestor de tareas	\N	Navalplan-00008-00052	\N	\N	4	49940	\N	\N	5
2394116	4	Pruebas de integración	\N	Navalplan-00008-00082	\N	\N	4	49895	\N	\N	12
2394117	4	Gestión del entorno y configuración	\N	Navalplan-00008-00083	\N	\N	4	49895	\N	\N	13
49946	21	Gestor de programas de fidelización (copy)	\N	Navalplan-00008-00051	\N	\N	4	49940	\N	\N	4
49948	21	Gestor de clientes especiales	\N	Navalplan-00008-00053	\N	\N	4	49940	\N	\N	6
49949	21	Gestor de perfiles de cliente	\N	Navalplan-00008-00054	\N	\N	4	49940	\N	\N	7
49950	21	Gestor de incidencias y seguimiento	\N	Navalplan-00008-00055	\N	\N	4	49940	\N	\N	8
49951	21	Gestor de seguimiento de campañas	\N	Navalplan-00008-00056	\N	\N	4	49940	\N	\N	9
49952	21	Gestor de proyectos	\N	Navalplan-00008-00057	\N	\N	4	49940	\N	\N	10
49900	28	Gestión de Canal	\N	Navalplan-00008-00005	\N	\N	4	49895	\N	\N	5
49958	19	Sistema de gestión de canal	\N	Navalplan-00008-00063	\N	\N	4	49900	\N	\N	0
49902	28	Integración con PMS	\N	Navalplan-00008-00012	\N	\N	4	49958	\N	\N	0
49959	19	Gesor de precios, cupos y reservas	\N	Navalplan-00008-00064	\N	\N	4	49958	\N	\N	1
49960	19	Gestor de tarifas	\N	Navalplan-00008-00065	\N	\N	4	49958	\N	\N	2
49961	19	Gesor de cierre de ventas	\N	Navalplan-00008-00066	\N	\N	4	49958	\N	\N	3
49962	19	Informe predefinidos	\N	Navalplan-00008-00067	\N	\N	4	49958	\N	\N	4
49963	19	Gestor de alertas	\N	Navalplan-00008-00068	\N	\N	4	49958	\N	\N	5
49964	19	Gestor de divisas	\N	Navalplan-00008-00069	\N	\N	4	49958	\N	\N	6
49965	19	Soporte de gestión asíncrona	\N	Navalplan-00008-00070	\N	\N	4	49958	\N	\N	7
49966	19	Interfaz acceso agencias de viajes	\N	Navalplan-00008-00071	\N	\N	4	49900	\N	\N	1
49967	18	Sistema de gestión de contenidos	\N	Navalplan-00008-00072	\N	\N	4	49895	\N	\N	6
49968	18	Módulo de gestión de usuarios y perfiles	\N	Navalplan-00008-00073	\N	\N	4	49967	\N	\N	0
49969	18	Módulo de valoración	\N	Navalplan-00008-00074	\N	\N	4	49967	\N	\N	1
49903	28	Módulo de reserva online	\N	Navalplan-00008-00006	\N	\N	4	49967	\N	\N	2
49970	18	Arquitectura información y gestión de contenidos	\N	Navalplan-00008-00075	\N	\N	4	49967	\N	\N	3
49971	18	Accesibilidad	\N	Navalplan-00008-00076	\N	\N	4	49967	\N	\N	4
49972	18	Módulo de establecimientos	\N	Navalplan-00008-00077	\N	\N	4	49967	\N	\N	5
49973	18	Módulo multiportal	\N	Navalplan-00008-00078	\N	\N	4	49967	\N	\N	6
49974	18	Infraestructura portal	\N	Navalplan-00008-00079	\N	\N	4	49967	\N	\N	7
49975	18	Diseño gráfico portal	\N	Navalplan-00008-00080	\N	\N	4	49967	\N	\N	8
49904	28	Repositorio multimedia	\N	Navalplan-00008-00007	\N	\N	4	49895	\N	\N	7
49905	28	Orquestador	\N	Navalplan-00008-00008	\N	\N	4	49895	\N	\N	8
49906	28	Documentación	\N	Navalplan-00008-00009	\N	\N	4	49895	\N	\N	9
49907	28	Implantación	\N	Navalplan-00008-00010	\N	\N	4	49895	\N	\N	10
49976	15	Formación	\N	Navalplan-00008-00081	\N	\N	4	49895	\N	\N	11
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
14862	1	Laminado Moldeado Template	\N	Navalplan-00002	0	54	3	\N	\N
14863	1	Pegar tablillas	\N	Navalplan-00002-00001	\N	\N	0	14862	0
14864	1	Saturar interna y externamente con resina epoxy	\N	Navalplan-00002-00002	\N	\N	0	14862	1
14865	1	Colocar estructura in interior	\N	Navalplan-00002-00003	\N	\N	0	14862	2
14866	1	Colocar malla fina	\N	Navalplan-00002-00004	\N	\N	0	14862	3
14906	1	Construcción de barco de recreo Template	Desc.	Navalplan-00001	5	30	3	\N	\N
14907	1	Fabricación en bancada	\N	Navalplan-00001-00001	\N	\N	3	14906	0
14911	1	Fijar estructura a base	\N	Navalplan-00001-00002	\N	\N	0	14906	1
14912	1	Unir quila	\N	Navalplan-00001-00003	\N	\N	0	14906	2
14913	1	Pegar terciado náutico	\N	Navalplan-00001-00004	\N	\N	0	14906	3
14914	1	Aplicar fibras de vidrio	\N	Navalplan-00001-00005	\N	\N	0	14906	4
14915	1	Lijado	\N	Navalplan-00001-00006	\N	\N	3	14906	5
14918	1	Impermeabilización	\N	Navalplan-00001-00007	\N	\N	0	14906	6
14908	1	Construcción de estructura transversal 	\N	Navalplan-00001-00008	\N	\N	0	14907	0
14909	1	Construcción de cavernas	\N	Navalplan-00001-00009	\N	\N	0	14907	1
14910	1	Construcción de anteparas	\N	Navalplan-00001-00010	\N	\N	0	14907	2
14916	1	Lijado de cubierta	\N	Navalplan-00001-00011	\N	\N	0	14915	0
14917	1	Lijado de casco	\N	Navalplan-00001-00012	\N	\N	0	14915	1
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
13484	1
13485	1
13486	1
13487	1
13488	1
13489	1
13490	1
13492	1
13493	1
13494	1
1838	1
1839	1
1840	1
1841	1
1842	1
1843	1
1844	1
1846	1
1847	1
1848	1
13435	1
13436	1
13437	1
13438	1
13465	1
13466	1
13467	1
13468	1
26970	2
26971	3
26975	1
26976	1
26977	1
49912	1
49913	1
49914	1
49915	1
49916	1
49917	1
49918	1
49919	1
49920	1
49921	1
49922	1
49923	1
49924	1
49925	1
49926	1
49929	1
49899	1
49930	1
49931	1
49932	1
49933	1
49934	1
49935	1
49936	1
49937	1
49944	1
49939	1
49953	1
49954	1
49955	1
49956	1
49957	1
49941	1
49942	1
49938	1
49945	1
49946	1
49947	1
49948	1
49949	1
49950	1
49951	1
49952	1
49902	1
49959	1
49960	1
49961	1
49962	1
49963	1
49964	1
49965	1
49966	1
49968	1
49969	1
49903	1
49970	1
49971	1
49972	1
49896	2
49908	1
49909	1
49911	1
49898	1
49973	1
49974	1
49975	1
49904	1
49905	1
49906	1
49907	1
49976	1
2394116	1
2394117	1
3466220	1
3466222	1
3466223	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1836
1837
1845
13434
13464
13482
13483
13491
26969
49895
49900
49910
49927
49928
49940
49943
49958
49967
3466219
3466221
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
14862
14906
14907
14915
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
14863	0
14864	0
14865	0
14866	0
14908	0
14909	0
14910	0
14911	0
14912	0
14913	0
14914	0
14916	0
14917	0
14918	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
707	15	Navalplan	9	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
14862	404
14906	404
\.


--
-- Data for Name: pending_consolidated_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY pending_consolidated_hours (pending_hours_id, pendingconsolidatedhours, resource_allocation_id) FROM stdin;
\.


--
-- Data for Name: profile_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY profile_roles (profileid, elt) FROM stdin;
3480763	ROLE_READ_ALL_ORDERS
\.


--
-- Data for Name: quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form (id, version, name, description, qualityformtype, reportadvance, advance_type_id) FROM stdin;
3503993	1	Cuestionario calidade estandar		0	t	3480461
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
3503993	¿Rematouse o paso 1?	20.00	0	0
3503993	¿Rematouse o paso 2?	40.00	1	1
3503993	¿Rematouse o paso 3?	67.00	2	2
3503993	¿Rematouse o paso 4?	90.00	3	3
3503993	¿Rematouse o paso 5?	100.00	4	4
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, code, generatecode, limited_resource, base_calendar_id) FROM stdin;
1113	1	3c324240-63e0-445a-bcf5-0b314b59afcc	t	f	410
1115	2	3ca4b534-5160-400f-99ce-dd5801433e6e	t	f	412
1117	1	61a07e75-96cd-43dd-b8b5-b3c483212d01	t	f	413
39003	1	9244274c-0994-4538-b920-2d3f5166001b	t	f	39094
1128	17	81044d94-0054-40bb-880b-b39643801af1	t	f	419
39005	2	5cb253e5-0de7-4e6c-9563-b77bcf257bfb	t	f	39095
39007	1	4fe9732b-cd03-42ce-8dd1-ae4187456c97	t	f	39096
39009	1	0fc047d4-ef35-4354-8c4d-2894a4315f1b	t	f	39097
1136	1	91324863-6b57-4872-bd7c-6efd2eb8a63e	t	f	423
1134	2	46d8e901-aedb-4208-8193-56c1007bde5d	t	f	422
39011	1	63ba508e-2573-459f-8a97-928e2cae2e43	t	f	39098
39013	1	0c8460dc-3db8-424d-8509-2647ccdd7f10	t	f	39099
1132	2	5ae0aa09-efa1-43ca-97ab-e602d19f5974	t	f	421
1130	23	78e0701b-490e-4ba5-a0c6-d595c41a669d	t	f	420
39017	1	c7ac7af9-8f13-417c-9b46-75427c20c008	t	f	39101
39020	1	94aa93dd-49a2-43c8-9041-c485844fbb9c	t	f	39102
39022	1	4438b0d3-3101-48ae-b11a-4cc1e53f9835	t	f	39103
38997	2	6d8b7cce-66eb-42b4-aeed-917e703120d2	t	f	39091
38993	2	ecff19bb-fc76-4d4a-b9e5-06b863f3fcf0	t	f	39089
39015	2	8115deeb-045c-438c-94ca-a3a1682b0d39	t	f	39100
1121	37	10e48579-9c92-46e9-8d4a-fceca41f8129	t	f	416
14343	2	b26d9987-2e77-4f9e-af03-4c998dc23829	t	f	14443
14345	3	c4376055-55fd-460c-b0fd-2aaef66b1734	t	f	14444
1119	37	fdd18762-9b4a-49a5-a3b3-33dc2b208ba7	t	f	415
26463	2	be0c73e7-c14a-407d-b7dd-de0b19b353f4	t	f	26563
38987	1	0cd7a053-4ba1-4f3c-95a4-f2f24d91b70e	t	f	39087
38991	1	8cf7b604-407f-4d29-961b-feca4afbe56e	t	f	39088
38995	1	723091c5-7091-440d-ad9f-1b26aba267e3	t	f	39090
38999	1	a0ce3e65-c053-4fc4-8f5e-6ee9395f4423	t	f	39092
39001	1	562429a0-91f7-4612-aa54-8b748ce9c3cf	t	f	39093
1123	30	e7262a78-843b-4250-a0e9-1a65a069e4c6	t	f	417
1126	17	95eb279c-f82e-4ce6-9073-d3592c4ad2d6	t	f	418
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, intended_total_hours, originaltotalassignment, task, assignment_function) FROM stdin;
2679	2	2.00	\N	450	2424	\N
2680	2	1.00	\N	300	2425	\N
2681	2	1.00	\N	300	2426	\N
2715	0	1.00	\N	140	2432	\N
2716	0	1.00	\N	170	2433	\N
2717	0	1.00	\N	24	2428	\N
2718	0	1.00	\N	100	2431	\N
2719	0	1.00	\N	60	2435	\N
2720	0	1.00	\N	40	2429	\N
2721	0	1.00	\N	40	2430	\N
14143	1	1.00	\N	30	13938	\N
14142	1	1.00	\N	20	13939	\N
14146	0	1.00	\N	20	13941	\N
14147	0	1.00	\N	10	13940	\N
39518	1	2.00	0	500	27374	\N
39519	1	4.00	0	2000	27375	\N
27675	3	1.00	0	100	27371	\N
27674	3	1.00	0	100	27371	\N
39509	2	4.00	0	2000	27372	\N
39511	2	4.00	0	2000	27372	\N
39510	2	2.00	0	1000	27372	\N
39520	1	3.00	0	1000	27373	\N
14149	5	1.00	\N	20	13947	\N
14148	6	0.94	\N	30	13946	16363
14151	5	1.00	\N	20	13949	\N
14150	5	1.00	\N	10	13948	\N
24072	13	5.63	\N	450	13951	3467032
24074	13	5.36	\N	300	13953	\N
24071	13	3.00	\N	24	13955	\N
2494211	10	0.83	\N	40	13956	\N
2494212	10	1.00	\N	40	13957	\N
2494210	10	1.00	\N	100	13958	\N
2494208	10	1.00	\N	140	13959	\N
2494209	10	1.00	\N	170	13960	\N
2494207	10	1.00	\N	60	13962	\N
57180	34	1.10	\N	1493	57067	\N
57178	35	0.74	\N	1000	57065	\N
57179	35	0.96	\N	1300	57065	\N
2379862	5	2.00	\N	300	57066	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
410	1
411	1
412	1
413	1
414	1
423	1
422	1
421	1
14443	1
14444	1
26563	1
39087	1
39088	1
39090	1
39092	1
39093	1
39094	1
39095	1
39096	1
39097	1
39098	1
39099	1
39101	1
39102	1
39103	1
39091	1
39089	1
39100	1
417	1
418	1
419	1
420	1
416	1
415	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
2715	1132
2716	1134
2494208	1130
2494209	1121
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
16363	2010-05-07	0.50	0.25	0
16363	2010-05-11	1.00	1.00	1
3467030	2010-05-28	0.50	0.25	0
3467030	2010-05-30	0.75	0.70	1
3467030	2010-06-01	1.00	1.00	2
3467032	2010-05-11	0.30	0.20	0
3467032	2010-05-14	0.50	0.30	1
3467032	2010-05-18	0.75	0.65	2
3467032	2010-05-22	1.00	1.00	3
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
16363	0
3467028	0
3467029	0
3467030	0
3467032	1
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
1124499457	6	1515	2010-05-14 13:51:41.182	2010-05-14 13:54:24.119	Construcción de las cavernas	20000.00	\N	t	t	t	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id, priority) FROM stdin;
13951	1	0	\N	\N	\N
13953	1	0	\N	\N	\N
13955	1	0	\N	\N	\N
13956	1	0	\N	\N	\N
13957	1	0	\N	\N	\N
13958	1	0	\N	\N	\N
13959	1	0	\N	\N	\N
13960	1	0	\N	\N	\N
13962	1	0	\N	\N	\N
13946	1	1	2010-05-03 00:00:00	\N	\N
13947	1	0	\N	\N	\N
13948	1	0	\N	\N	\N
13949	1	0	\N	\N	\N
27371	1	0	\N	\N	\N
27372	1	0	\N	\N	\N
27373	1	0	\N	\N	\N
27374	1	0	\N	\N	\N
27375	1	0	\N	\N	\N
2424	1	0	\N	\N	\N
2425	1	0	\N	\N	\N
2426	1	0	\N	\N	\N
2428	1	0	\N	\N	\N
2429	1	0	\N	\N	\N
2430	1	0	\N	\N	\N
2431	1	0	\N	\N	\N
2432	1	0	\N	\N	\N
2433	1	0	\N	\N	\N
2435	1	0	\N	\N	\N
13938	1	0	\N	\N	\N
13939	1	0	\N	\N	\N
13940	1	0	\N	\N	\N
13941	1	0	\N	\N	\N
13952	1	2	2010-05-07 08:54:00.144	1124499457	\N
57066	1	0	\N	\N	\N
57067	2	0	\N	\N	\N
3465918	1	1	2010-05-07 08:54:00.144	\N	\N
57065	2	0	\N	\N	\N
3465919	1	1	2010-05-07 08:54:00.144	\N	\N
3465920	1	1	2010-05-07 08:54:00.144	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
3504095	3	3503993	13467	t
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
3504095	¿Rematouse o paso 1?	20.00	0	t	2010-05-17 00:00:00	0
3504095	¿Rematouse o paso 2?	40.00	1	f	\N	1
3504095	¿Rematouse o paso 3?	67.00	2	f	\N	2
3504095	¿Rematouse o paso 4?	90.00	3	f	\N	3
3504095	¿Rematouse o paso 5?	100.00	4	f	\N	4
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
27371	27279
27371	27270
27372	27271
27372	27282
27372	27283
27373	27275
2424	2032
2425	2033
2426	2034
2428	2035
2429	2036
2430	2037
2431	2038
2432	2039
27374	27276
27375	27277
2433	2040
2435	2041
13938	13736
13939	13737
13940	13738
13941	13739
57065	50197
57065	50274
57066	50208
57067	50209
3465918	3466320
3465919	3466321
3465920	3466322
13946	13776
13947	13777
13948	13778
13949	13779
13951	13830
13952	13831
13953	13832
13955	13833
13956	13834
13957	13835
13958	13836
13959	16665
13960	16666
13962	16667
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
13962	15	Impermeabilización	\N	2010-07-27 00:00:00	2010-08-06 00:00:00	\N	13963	\N	6
2429	6	Unir quila	\N	2010-08-11 08:05:33.531	2010-08-18 08:05:33.531	\N	2436	\N	2
13938	7	Pegar tablillas	\N	2010-05-06 19:31:14.452	2010-05-12 19:31:14.452	\N	13942	\N	0
13939	7	Saturar interna y externamente con resina epoxy	\N	2010-05-12 19:31:14.452	2010-05-15 19:31:14.452	\N	13942	\N	1
13940	7	Colocar estructura in interior	\N	2010-05-15 19:31:14.452	2010-05-19 19:31:14.452	\N	13942	\N	2
13941	7	Colocar malla fina	\N	2010-05-19 19:31:14.452	2010-05-22 19:31:14.452	\N	13942	\N	3
13942	11	Laminado Moldeado	\N	2010-05-06 19:31:14.452	2010-05-22 19:31:14.452	2010-06-30	\N	\N	\N
13963	10	Construcción de barco de recreo para Sergio Sumay	\N	2010-05-07 08:54:00.144	2010-08-06 00:00:00	2010-06-06	\N	\N	\N
2430	6	Pegar terciado náutico	\N	2010-08-18 08:05:33.531	2010-08-25 08:05:33.531	\N	2436	\N	3
13946	17	Pegar tablillas	\N	2010-05-03 00:00:00	2010-05-11 00:00:00	\N	13950	\N	0
13947	17	Saturar interna y externamente con resina epoxy	\N	2010-05-11 00:00:00	2010-05-14 00:00:00	\N	13950	\N	1
13948	17	Colocar estructura in interior	\N	2010-05-14 00:00:00	2010-05-18 00:00:00	\N	13950	\N	2
13949	17	Colocar malla fina	\N	2010-05-18 00:00:00	2010-05-21 00:00:00	\N	13950	\N	3
13950	25	Laminado Moldeado Abril Navantia	\N	2010-05-03 00:00:00	2010-05-21 00:00:00	2010-07-29	\N	\N	\N
27371	10	Montaje de andamios	\N	2010-06-10 00:00:00	2010-06-29 00:00:00	\N	27376	\N	0
27372	10	Construcción del casco	\N	2010-06-29 00:00:00	2010-09-24 00:00:00	\N	27376	\N	1
13954	10	Fabricación en bancada	\N	2010-05-07 08:54:00.144	2010-05-22 08:54:00.144	\N	13963	\N	0
2431	6	Aplicar fibras de vidrio	\N	2010-08-25 08:05:33.531	2010-09-11 08:05:33.531	\N	2436	\N	4
27373	10	Construcción de cubierta	\N	2010-06-10 00:00:00	2010-08-07 00:00:00	\N	27376	\N	2
27374	10	Hélices	\N	2010-08-07 00:00:00	2010-09-22 00:00:00	\N	27376	\N	3
27375	10	Confección velamen	\N	2010-08-07 00:00:00	2010-11-06 00:00:00	\N	27376	\N	4
2432	6	Lijado de cubierta	\N	2010-09-11 08:05:33.531	2010-10-07 08:05:33.531	\N	2434	\N	0
2433	6	Lijado de casco	\N	2010-09-11 08:05:33.531	2010-10-14 08:05:33.531	\N	2434	\N	1
27376	15	Construcción de barco de competición en acero	\N	2010-06-10 00:00:00	2010-11-06 00:00:00	2010-11-18	\N	\N	\N
13945	1	Entrega	\N	2010-05-22 19:31:14.452	2010-05-22 19:31:14.452	\N	13942	\N	4
13951	16	Construcción de estructura transversal 	\N	2010-05-07 00:00:00	2010-05-22 00:00:00	\N	13954	\N	0
2435	6	Impermeabilización	\N	2010-10-14 08:05:33.531	2010-10-26 08:05:33.531	\N	2436	\N	6
13953	16	Construcción de anteparas	\N	2010-05-07 00:00:00	2010-05-19 00:00:00	\N	13954	\N	2
13955	16	Fijar estructura a base	\N	2010-05-22 00:00:00	2010-05-25 00:00:00	\N	13963	\N	1
13956	15	Unir quila	\N	2010-05-25 00:00:00	2010-06-02 00:00:00	\N	13963	\N	2
13957	15	Pegar terciado náutico	\N	2010-06-01 00:00:00	2010-06-08 00:00:00	\N	13963	\N	3
2427	7	Fabricación en bancada	\N	2010-05-04 08:05:33.531	2010-08-06 08:05:33.531	\N	2436	\N	0
2434	7	Lijado	\N	2010-09-11 08:05:33.531	2010-10-14 08:05:33.531	\N	2436	\N	5
2436	7	Construcción de barco de recreo	\N	2010-05-04 08:05:33.531	2010-10-26 08:05:33.531	\N	\N	\N	\N
13958	15	Aplicar fibras de vidrio	\N	2010-06-08 00:00:00	2010-06-25 00:00:00	\N	13963	\N	4
13959	15	Lijado de cubierta	\N	2010-06-25 00:00:00	2010-07-21 00:00:00	\N	13961	\N	0
13952	10	Construcción de cavernas	\N	2010-05-07 08:54:00.144	2010-05-19 08:54:00.144	\N	13954	\N	1
2424	6	Construcción de estructura transversal 	\N	2010-05-04 08:05:33.531	2010-06-15 08:05:33.531	\N	2427	\N	0
2425	6	Construcción de cavernas	\N	2010-05-04 08:05:33.531	2010-06-26 08:05:33.531	\N	2427	\N	1
2426	6	Construcción de anteparas	\N	2010-06-15 08:05:33.531	2010-08-06 08:05:33.531	\N	2427	\N	2
13960	15	Lijado de casco	\N	2010-06-25 00:00:00	2010-07-27 00:00:00	\N	13961	\N	1
2428	6	Fijar estructura a base	\N	2010-08-06 08:05:33.531	2010-08-11 08:05:33.531	\N	2436	\N	1
13961	10	Lijado	\N	2010-06-25 08:54:00.144	2010-07-27 00:00:00	\N	13963	\N	5
57066	42	Definición de modelo de negocio	\N	2010-06-01 00:00:00	2010-06-26 00:00:00	\N	50376	\N	1
57130	33	Entrega proyecto	\N	2011-01-28 03:24:36	2011-01-28 03:24:36	\N	50376	\N	5
3465922	1	Construcción de las cavernas	\N	2010-05-07 08:54:00.144	2010-05-19 20:54:00.144	2010-05-19	\N	\N	\N
3465918	1	Construcción elemento 2	\N	2010-05-07 08:54:00.144	2010-05-19 20:54:00.144	2010-05-19	3465921	\N	0
57065	42	Coordinación del proyecto	\N	2010-06-01 00:00:00	2011-01-29 00:00:00	\N	50376	\N	0
3465919	1	Construcción elemento 1	\N	2010-05-07 08:54:00.144	2010-05-19 20:54:00.144	\N	3465921	\N	1
3465920	1	Construcción elemento 3	\N	2010-05-07 08:54:00.144	2010-05-19 20:54:00.144	\N	3465921	\N	2
57067	43	Análisis y diseño	\N	2010-06-01 00:00:00	2011-01-29 00:00:00	\N	50376	\N	2
3465921	1	Construcción de cavernas	\N	2010-05-07 08:54:00.144	2010-05-19 20:54:00.144	2010-05-19	3465922	\N	0
50376	65	Openapps - Invattur	\N	2010-06-01 00:00:00	2011-01-29 00:00:00	2011-01-31	\N	\N	\N
3465917	0	Entrega bocetos diseño gráfico	\N	2010-07-02 10:24:00	2010-07-02 10:24:00	\N	50376	\N	3
57129	33	Entrega primer prototipo	\N	2010-11-30 18:38:31.20	2010-11-30 18:38:31.20	\N	50376	\N	4
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2427
2434
2436
13942
13950
13954
13961
13963
27376
50376
3465921
3465922
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
13945
57129
57130
3465917
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
13942	5	13434
13938	9	13435
13939	9	13436
13940	9	13437
13941	9	13438
13950	10	13464
13946	19	13465
13947	19	13466
13948	19	13467
13949	19	13468
27376	6	26969
27371	11	26970
27372	11	26971
27373	11	26975
27374	11	26976
27375	11	26977
13954	2	13483
13961	2	13491
13963	2	13482
13951	3	13484
13952	3	13485
13953	3	13486
13955	3	13487
13956	3	13488
13957	3	13489
13958	3	13490
13959	3	13492
13960	3	13493
13962	3	13494
2427	2	1837
2434	2	1845
2436	2	1836
2424	3	1838
2425	3	1839
2426	3	1840
2428	3	1841
2429	3	1842
2430	3	1843
2431	3	1844
2432	3	1846
2433	3	1847
2435	3	1848
3465918	1	3466220
3465919	1	3466222
3465920	1	3466223
3465921	1	3466221
3465922	1	3466219
50376	15	49895
57065	11	49896
57066	11	49908
57067	11	49909
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled, generatecode) FROM stdin;
16160	1	NORMAL	e2512a1f-a47f-4411-9e59-7947896c399e	12.00	t	t
16161	1	EXTRA	fae62c2f-21f1-466e-a289-3f07fc367f01	15.00	t	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure, generatecode) FROM stdin;
203	1	33a83512-40fb-4683-a832-3a432855ddb4	kg	f
204	1	a5ee87fa-db82-4f52-ab73-aede17b584cc	km	f
205	1	12450b3b-0404-498c-9f6d-7ac09cb41159	l	f
206	1	cc004e97-1f3b-43df-88ae-853b3bbc5fdb	m	f
207	1	a557dbef-071d-42b8-b970-d7574b10e701	m2	f
208	1	2b426725-a948-4978-8239-c268367c4ad0	m3	f
209	1	cca49eaa-2113-40dd-b33d-24f427855cf2	tn	f
202	2	3b454c1c-2d35-4ed6-8f5c-638e671f12ef	Unidades	f
13332	1	d166a759-1447-450a-bf82-bee9366dd5c2	units	f
\.


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_profiles (user_id, profile_id) FROM stdin;
3480864	3480763
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY user_roles (userid, elt) FROM stdin;
1011	ROLE_READ_ALL_ORDERS
1011	ROLE_ADMINISTRATION
1011	ROLE_CREATE_ORDER
1011	ROLE_EDIT_ALL_ORDERS
1012	ROLE_WS_READER
1013	ROLE_WS_READER
1013	ROLE_WS_WRITER
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
15959	1	eb0814b0-ad0e-4300-b50e-5c227c74fb7f	2010-05-05 00:00:00	t	15756	1128	\N
15960	2	04146c8a-a321-4d60-bff3-1e2843ec782f	2010-05-04 00:00:00	t	15756	1128	\N
15962	1	ad1c376a-1e9e-4387-a9b4-141f9e035e34	2010-05-06 00:00:00	t	15756	1128	\N
2495003	1	09d629ce-c85b-441b-94ae-6e8ec6527389	2010-05-11 00:00:00	t	15756	1132	\N
2496518	1	b664be86-97e9-45e2-af65-232fdf98188c	2010-05-09 00:00:00	t	15756	1134	\N
2496522	1	a1dc2622-48a6-42d3-a458-830134ba4bbd	2010-05-12 00:00:00	t	15756	1134	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
15857	1	f	1	1315	1428	15756
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
16060	1	c28be531-148c-49aa-b774-b915a2cd06d0	8	2010-05-05 00:00:00	\N	\N	15959	1128	13465	16160
16061	2	6c7e151a-fff6-47a7-990a-c166b0da3d18	8	2010-05-04 00:00:00	\N	\N	15960	1128	13465	16160
16063	1	9d38726d-6693-4cfc-8a0d-65aeb5ad5697	8	2010-05-06 00:00:00	\N	\N	15962	1128	13465	16160
2495104	1	1433241e-97b5-4c38-8cc2-4454dd248855	8	2010-05-11 00:00:00	\N	\N	2495003	1132	13436	16160
2495105	1	2cc59e1b-3ebb-4aca-964d-d49b1a76337a	8	2010-05-11 00:00:00	\N	\N	2495003	1132	13435	16160
2496619	1	fd92ead9-47ba-4ff9-b272-f49b96e72335	40	2010-05-09 00:00:00	\N	\N	2496518	1134	1842	16160
2496620	1	d2aecde7-62d7-4ad2-83fd-569b54852457	40	2010-05-09 00:00:00	\N	\N	2496518	1134	1841	16160
2496621	1	70c1f219-3eb6-4f0d-84b2-004a8d1924dd	25	2010-05-09 00:00:00	\N	\N	2496518	1134	1841	16160
2496625	1	ae1be4e2-397d-4945-a1a7-cf6bc24b2a60	20	2010-05-12 00:00:00	\N	\N	2496522	1134	13466	16160
2496626	1	224d7a04-4cc7-4bf6-a138-a1224c9c539c	30	2010-05-12 00:00:00	\N	\N	2496522	1134	13465	16160
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
15756	1	Parte estándar	0001	t	t	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1136	Jaime	Andamiero	12312333R
1134	Alicia	Andamiera	12312312G
1132	Samuel	Andamiero	12312312P
14343	José María	Pintor	33333333C
14345	Susana	Pintora	34343444D
26463	Manuel	Viveiro Ríos	44543678D
38987	Silvia	Gruísta	34343434e
38991	Diego	Desarrollador I	11111111A
38995	Jacobo	Desarrollador I	11111111C
38999	Desarrollador	Corunet 2	11111111E
39001	Desarrollador	Corunet 3	11111111F
39003	Desarrollador	Corunet 4	11111111G
39005	Desarrollador	Redegal 1	11111111H
39007	Desarrollador	Redegal 2	11111111J
39009	Desarrollador	Redegal 3	11111111K
39011	Desarrollador	Egalcom 1	11111111U
39013	Desarrollador	Egalcom 2	11111111o
39017	Manuel	Pan	22222222B
39020	David	Corunet	22222222D
39022	Agustín	Asolif	22222222C
38997	Desarrollador 	Corunet 1	11111111D
38993	Manuel	Desarrollador I	11111111B
39015	Luis	Agasol	22222222A
1123	Ramón	Soldador	12312312C
1126	Susana	Peón	12312313D
1128	Luis	Peón	12312312E
1130	Sara	Peón	12312312D
1121	María	Soldadora	F12312323
1119	José	Soldador	C12312312
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
16060	1428
16061	1428
16063	1428
2495104	1428
2495105	1428
2496619	1428
2496620	1428
2496621	1428
2496625	1428
2496626	1428
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
-- Name: fk49876b734287ea05; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY pending_consolidated_hours
    ADD CONSTRAINT fk49876b734287ea05 FOREIGN KEY (pending_hours_id) REFERENCES consolidatedvalue(id);


--
-- Name: fk49876b7375ed79ba; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY pending_consolidated_hours
    ADD CONSTRAINT fk49876b7375ed79ba FOREIGN KEY (resource_allocation_id) REFERENCES resourceallocation(id);


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
-- Name: fk5948535285ebb87c; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk5948535285ebb87c FOREIGN KEY (destiny_queue_element_id) REFERENCES limiting_resource_queue_element(id);


--
-- Name: fk59485352a44b51e8; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY limiting_resource_queue_dependency
    ADD CONSTRAINT fk59485352a44b51e8 FOREIGN KEY (origin_queue_element_id) REFERENCES limiting_resource_queue_element(id);


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
-- Name: fk7540af6be6ee3f5d; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY dependency
    ADD CONSTRAINT fk7540af6be6ee3f5d FOREIGN KEY (queue_dependency) REFERENCES limiting_resource_queue_dependency(id);


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
-- Name: fkbb493f501b8e7cf2; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY day_assignment
    ADD CONSTRAINT fkbb493f501b8e7cf2 FOREIGN KEY (derived_allocation_id) REFERENCES derivedallocation(id);


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
-- Name: fkd3056ef7ddc82952; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY orderlinegrouptemplate
    ADD CONSTRAINT fkd3056ef7ddc82952 FOREIGN KEY (group_template_id) REFERENCES orderelementtemplate(id);


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

