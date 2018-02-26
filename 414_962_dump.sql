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
    name character varying(255),
    code character varying(255)
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
    position_in_calendar integer,
    code character varying(255)
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
    base_calendar_id bigint,
    code character varying(255)
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
    notassignable boolean,
    code character varying(255)
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
    generatecodeforcriterion boolean,
    generatecodeforlabel boolean,
    generatecodeforworkreport boolean,
    generatecodeforresources boolean
);


ALTER TABLE public.configuration OWNER TO naval;

--
-- Name: cost_category; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE cost_category (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255),
    enabled boolean,
    code character varying(255)
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
    resource integer,
    generatecode boolean
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
    pricecost numeric(19,2),
    initdate date,
    enddate date,
    type_of_work_hours_id bigint,
    cost_category_id bigint,
    code character varying(255)
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
    generatecode boolean
);


ALTER TABLE public.label_type OWNER TO naval;

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
    name character varying(255),
    parent_id bigint,
    code character varying(255)
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
    base_calendar_id bigint,
    limited_resource boolean,
    generatecode boolean
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
    subcontrated_task_data_id bigint
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
    positioninparent integer,
    code character varying(255)
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
-- Name: unit_type; Type: TABLE; Schema: public; Owner: naval; Tablespace: 
--

CREATE TABLE unit_type (
    id bigint NOT NULL,
    version bigint NOT NULL,
    code character varying(255) NOT NULL,
    measure character varying(255)
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
    work_report_type_id bigint NOT NULL,
    resource_id bigint,
    order_element_id bigint,
    generatecode boolean
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
23742	5	t	707
23743	5	t	707
23744	5	t	707
23741	6	t	707
23737	5	t	707
23738	5	t	707
23739	5	t	707
23736	6	t	707
23747	5	t	707
23748	5	t	707
23749	5	t	707
23746	6	t	707
23752	5	t	707
23753	5	t	707
23754	5	t	707
23751	6	t	707
58387	2	t	707
58388	2	t	709
58389	2	t	709
58390	2	t	709
58391	2	f	709
58392	2	t	707
58393	2	t	707
58394	2	t	707
58395	2	f	709
18808	12	t	708
1719	18	f	707
18605	13	t	709
18606	13	t	709
18607	13	t	709
18608	13	f	709
1720	18	t	707
18809	12	t	708
1721	18	f	707
18609	13	f	709
18810	12	f	708
1722	18	t	707
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
57989	1	708	57842	t	100.00
57990	1	709	57846	t	5.00
57991	1	709	57847	t	10.00
57992	1	709	57848	t	15.00
57993	1	708	57849	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
18754	12	2010-03-15	25.00	18808	\N
18700	13	2010-03-30	2.00	18605	\N
18701	13	2010-03-02	1.00	18605	\N
18702	13	2010-04-02	3.00	18606	\N
18703	13	2010-03-31	5.00	18607	\N
18755	12	2010-03-16	5.00	18809	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
707	4	children	100.0000	f	0.0100	t	t	f
708	3	percentage	100.0000	f	0.0100	t	t	f
709	2	units	2147483647.0000	f	1.0000	t	f	f
710	1	subcontractor	100.0000	f	0.0100	t	t	f
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
20210	513
20210	542
20240	513
20240	542
20241	513
20241	542
20274	514
20274	541
20275	514
20275	541
20276	514
20276	541
20279	541
20279	511
20290	541
20290	511
30421	540
30421	514
30422	540
30422	514
30423	540
30423	514
30466	540
30466	509
30467	540
30467	509
30468	540
30468	509
30498	513
30498	538
30499	513
30499	538
30500	513
30500	538
36161	538
36161	509
36164	509
36164	538
36167	509
36167	538
36197	514
36197	539
36198	514
36198	539
36199	514
36199	539
36215	511
36215	539
36216	511
36216	539
36219	511
36219	539
51107	540
55957	540
59186	542
59186	509
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name, code) FROM stdin;
1	1	Default	1
3	3	Galicia	3
2	4	España	2
4	3	Galicia media xornada	4
8	1	Andalucía media xornada	8
7	2	Andalucia	7
10	1	Asturias	10
21	5	\N	21
19	1	\N	19
20	1	\N	20
11	2	\N	11
12	2	\N	12
13	2	\N	13
14	2	\N	14
15	2	\N	15
16	2	\N	16
17	2	\N	17
18	2	\N	18
28	4	\N	28
27	1	\N	27
25	6	\N	25
19595	3	\N	19595
19596	3	\N	19596
22	6	\N	22
26	7	\N	26
30	5	\N	30
31	6	\N	31
19597	4	\N	19597
2828	4	\N	2828
19594	5	\N	19594
29	6	\N	29
24	8	\N	24
23	6	\N	23
50500	2	\N	695fef22-9614-4c6d-bbdf-b3edb5bfed2b
40299	3	\N	0983a313-b2b6-40ac-81d0-bb4f8c72b30f
61408	1	\N	9fe784c4-cecb-4c05-970f-a9c0082bda75
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1422	1	2010-03-01	\N	19	0
1423	1	2010-03-01	\N	20	0
1414	2	2010-03-08	\N	11	0
1415	2	2010-03-15	2010-09-15	12	0
1416	2	2010-03-22	\N	13	0
1417	2	2010-03-29	2010-09-29	14	0
1418	2	2010-03-08	\N	15	0
1419	2	2010-03-15	2010-09-15	16	0
1420	2	2010-03-22	\N	17	0
1421	2	2010-03-29	2010-09-29	18	0
1424	5	2010-03-08	\N	21	0
1431	4	2010-03-22	\N	28	0
1430	1	2010-03-01	\N	27	0
1428	6	2010-03-08	\N	25	0
19797	3	2010-03-01	\N	19595	0
19798	3	2010-03-01	\N	19596	0
1425	6	2010-03-15	2011-09-15	22	0
1429	7	2010-03-15	2011-09-09	26	0
1433	5	2010-03-22	\N	30	0
1434	6	2010-03-29	2011-09-29	31	0
19799	4	2010-03-01	\N	19597	0
3030	4	2010-03-01	\N	2828	0
19796	5	2010-03-01	\N	19594	0
1432	6	2010-03-29	2011-09-29	29	0
1427	8	2010-03-29	2011-09-29	24	0
1426	6	2010-03-01	\N	23	0
50702	2	2010-04-12	\N	50500	0
40501	3	2010-04-07	\N	40299	0
61610	1	2010-04-15	\N	61408	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar, code) FROM stdin;
117	2	1	\N	17	0	117
101	1	\N	\N	1	0	101
118	2	1	\N	18	0	118
125	6	10	\N	25	0	125
103	3	2	\N	3	0	103
102	4	\N	\N	2	0	102
104	3	2	\N	4	0	104
108	1	2	\N	8	0	108
107	2	2	\N	7	0	107
110	1	2	\N	10	0	110
127	1	4	\N	27	0	127
119	1	1	\N	19	0	119
120	1	1	\N	20	0	120
111	2	1	\N	11	0	111
112	2	1	\N	12	0	112
113	2	1	\N	13	0	113
114	2	1	\N	14	0	114
115	2	1	\N	15	0	115
116	2	1	\N	16	0	116
121	5	3	\N	21	0	121
128	4	4	\N	28	0	128
19696	3	10	\N	19595	0	19696
19697	3	4	\N	19596	0	19697
122	6	4	2010-03-08	22	0	122
19699	1	4	\N	22	1	19699
126	7	3	\N	26	0	126
130	5	8	\N	30	0	130
131	6	10	\N	31	0	131
19698	4	8	\N	19597	0	19698
2929	4	3	\N	2828	0	2929
19695	5	7	\N	19594	0	19695
129	6	7	\N	29	0	129
124	8	8	\N	24	0	124
123	6	7	\N	23	0	123
50601	2	1	\N	50500	0	0da73ea4-3a94-4f7b-adbd-845f605c33e6
40400	3	1	\N	40299	0	989ca2f6-86ac-42f2-87c9-e3a84a916029
61509	1	1	\N	61408	0	db849135-0b7d-4e10-9663-d06525333a56
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id, code) FROM stdin;
1035	1	2010-12-31	4	611	10	1035
1036	1	2010-12-24	4	611	10	1036
1037	1	2010-09-08	0	610	10	1037
1012	2	2010-05-17	0	610	3	1012
1043	2	2010-04-11	0	606	21	1043
1016	1	2010-12-24	4	610	3	1016
1017	1	2010-12-31	4	610	3	1017
1042	2	2010-04-10	0	606	21	1042
1015	3	2010-12-31	0	610	2	1015
1040	2	2010-04-09	0	606	21	1040
1018	1	2010-12-24	0	610	2	1018
1078	2	2010-07-10	0	606	28	1078
1079	2	2010-07-08	0	606	28	1079
1013	2	2010-05-17	0	610	4	1013
1019	1	2010-12-24	4	610	4	1019
1020	1	2010-12-31	4	610	4	1020
1076	2	2010-07-11	0	606	28	1076
1074	2	2010-07-05	0	606	28	1074
1038	2	2010-04-08	0	606	21	1038
1044	2	2010-04-05	0	606	21	1044
1039	2	2010-04-06	0	606	21	1039
1041	2	2010-04-07	0	606	21	1041
1028	1	2010-12-24	4	611	8	1028
1029	1	2010-05-03	0	610	8	1029
1030	1	2010-12-31	4	611	8	1030
1027	2	2010-12-24	4	611	7	1027
1026	2	2010-12-31	4	611	7	1026
1031	1	2010-05-03	0	610	7	1031
1075	2	2010-07-06	0	606	28	1075
1073	2	2010-07-07	0	606	28	1073
1077	2	2010-07-09	0	606	28	1077
1059	4	2010-06-26	0	606	25	1059
1064	4	2010-06-21	0	606	25	1064
1065	4	2010-06-22	0	606	25	1065
1060	4	2010-06-23	0	606	25	1060
1061	4	2010-06-24	0	606	25	1061
1063	4	2010-06-27	0	606	25	1063
1062	4	2010-06-25	0	606	25	1062
1100	4	2010-07-28	0	606	31	1100
1048	4	2010-05-08	0	606	22	1048
1051	4	2010-05-09	0	606	22	1051
1047	4	2010-05-06	0	606	22	1047
1045	4	2010-05-07	0	606	22	1045
1050	4	2010-05-03	0	606	22	1050
1046	4	2010-05-04	0	606	22	1046
1049	4	2010-05-05	0	606	22	1049
1069	5	2010-06-30	0	606	26	1069
1066	5	2010-07-04	0	606	26	1066
1068	5	2010-06-29	0	606	26	1068
1072	5	2010-07-01	0	606	26	1072
1071	5	2010-07-03	0	606	26	1071
1070	5	2010-06-28	0	606	26	1070
1067	5	2010-07-02	0	606	26	1067
1092	3	2010-07-21	0	606	30	1092
1093	3	2010-07-19	0	606	30	1093
1087	3	2010-07-23	0	606	30	1087
1088	3	2010-07-22	0	606	30	1088
1090	3	2010-07-24	0	606	30	1090
1091	3	2010-07-20	0	606	30	1091
1089	3	2010-07-25	0	606	30	1089
1099	4	2010-07-29	0	606	31	1099
1098	4	2010-07-31	0	606	31	1098
1095	4	2010-08-01	0	606	31	1095
1097	4	2010-07-27	0	606	31	1097
1094	4	2010-07-26	0	606	31	1094
1096	4	2010-07-30	0	606	31	1096
1081	4	2010-07-13	0	606	29	1081
1082	4	2010-07-18	0	606	29	1082
1080	4	2010-07-14	0	606	29	1080
1086	4	2010-07-17	0	606	29	1086
1083	4	2010-07-12	0	606	29	1083
1084	4	2010-07-16	0	606	29	1084
1085	4	2010-07-15	0	606	29	1085
1054	4	2010-06-10	0	606	23	1054
1058	4	2010-06-07	0	606	23	1058
1056	4	2010-06-12	0	606	23	1056
1053	4	2010-06-09	0	606	23	1053
1055	4	2010-06-13	0	606	23	1055
1052	4	2010-06-11	0	606	23	1052
1057	4	2010-06-08	0	606	23	1057
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable, code) FROM stdin;
606	6	HOLIDAY	red	t	\N
607	5	SICK_LEAVE	red	t	\N
608	4	LEAVE	red	t	\N
609	3	STRIKE	red	t	\N
610	2	BANK_HOLIDAY	red	t	\N
611	1	WORKABLE_BANK_HOLIDAY	orange	f	\N
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode, generatecodeforcriterion, generatecodeforlabel, generatecodeforworkreport, generatecodeforresources) FROM stdin;
202	8	1	COMPANY_CODE	t	f	t	t
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled, code) FROM stdin;
59893	2	Categoria 1	t	e36c8cef-f6da-44dd-a928-ef3422ea50e8
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
538	1	7f15e574-3324-4619-ad13-e9d489df39bd	Grupo 4	t	131083	\N
539	1	4ff7f40d-fd87-4951-afdc-12d592fb932a	Grupo 5	t	131083	\N
540	1	96cad611-2f5f-42c2-97d8-206f7e11426f	Grupo 3	t	131083	\N
516	1	951f9e26-af79-4a9c-86bb-ac600de6c060	Galicia	t	131079	515
519	1	5d6c356a-1402-4021-80e5-edfa6e44d905	Asturias	t	131079	515
521	1	37eded8b-6d1c-4943-afc4-993e22d3710c	Andalucia	t	131079	515
523	1	befa200d-3357-4bd2-972a-8bea2deec57b	País Vasco	t	131079	515
517	1	6504edc6-b1bb-4608-a35a-f54b39568f11	Ferrol	t	131079	516
518	1	36dfe095-76cc-40a9-acf2-e36cf5700358	Vigo	t	131079	516
520	1	fd5aca42-3628-42b0-af37-0b48d0eabe8c	Gijon	t	131079	519
522	1	07e6ed2f-d8f6-4ce9-b18d-befda9750d51	Cádiz	t	131079	521
524	1	f2b1ba01-e77d-4ba5-b9bb-ff873005ef32	San Sebastián	t	131079	523
525	1	c89d53f1-9cfd-4b4c-b07a-b0979efc66b3	Soldadura primeiro nivel	t	131080	\N
526	1	66d2facc-8844-4b70-bfe6-ea7f8c113ec0	Soldadura segundo nivel	t	131080	\N
527	1	069b0e09-37cc-4e82-ba98-926f3a237ccf	Soldadura terceiro nivel	t	131080	\N
528	1	77bef919-a2de-43d1-8cb1-c10060e6b0e8	Practicas segundo ano	t	131081	\N
529	1	c9f1be55-2f20-4cee-abb1-db7f39cf734c	Practicas primeiro ano	t	131081	\N
530	1	19577ea6-672f-415e-a0a7-32185e0e359a	Por obra	t	131081	\N
531	1	c5877b00-cab7-4d1e-a0e1-048c8094ea12	Indefinido	t	131081	\N
532	1	07f99679-ca00-4028-bb94-2996a1e502b1	Temporal	t	131081	\N
505	14	07508303-5089-407b-8fe9-f5806e36affa	medicalLeave	t	131072	\N
506	13	ba745a87-7f56-4104-bd95-1ca311277e06	paternityLeave	t	131072	\N
507	4	00dd4e65-2fea-46ec-a4ce-2c0aa01da7fd	hiredResourceWorkingRelationship	t	131076	\N
508	3	c27ca63f-c4cb-46c1-a9d5-d055a725913c	firedResourceWorkingRelationship	t	131076	\N
515	1	c12c9ade-1a33-4256-988d-36123a06e63d	España	t	131079	\N
541	1	8a6f0c8c-85e9-441f-a8e9-7775411042b5	Grupo 2	t	131083	\N
542	1	2ae840f0-0292-4d12-a774-76cf31298872	Grupo 1	t	131083	\N
533	1	b22867b4-d952-4b3d-9451-fbd24b041a87	Certificado medico 2010	t	131082	\N
534	1	0583346a-ee5b-48d6-9a19-54791d0ce077	Certificado medico 2009	t	131082	\N
535	1	63f30986-f717-42fe-96aa-5d690a97f628	Pase entrada astillero Barreras	t	131082	\N
536	1	280e7e3f-bdc8-4611-84a6-7f626351f3e7	Pase entrada astillero Navalia	t	131082	\N
537	1	234cd3e9-61c2-4689-afb7-13b80ac3f539	Pase entrada astillero Vulcano	t	131082	\N
511	3	99887ae2-8bb7-4275-a427-d920c361fc4d	Califugador	t	131078	\N
513	3	8669109d-8d86-4ac1-89cd-9541f7fc4d53	Soldador	t	131078	\N
509	3	321d79f1-ffb3-4a88-aeb6-4ae4959354bd	Carpinteiro	t	131078	\N
514	3	d1933e2d-2aa9-4ba2-8911-f7dabb0b5995	Pintor	t	131078	\N
512	3	5ef81e42-223e-4f01-99c5-500849e55024	Electricista	t	131078	\N
510	3	9321f46a-6901-448f-8997-ccd3e204d160	Soldador Submarino	t	131078	\N
41715	2	6fdb7933-2072-4bb9-abfc-c62e2e20b798	salud muy buena	t	13500416	\N
41714	2	c6cd46cb-fdae-4626-920a-39a9df4f8976	salud mala	t	13500416	\N
41713	2	127d6d50-282b-4e2f-97e1-df10bd0b1980	salud media	t	13500416	\N
51409	1	22f67a6d-5ade-4693-89eb-12363980232e	caracola	t	131074	\N
51410	1	13f9928d-870b-41e1-85b0-fd4cee6855ed	hola	t	131074	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
24108	DIRECT	4	\N	23636	\N	541	\N	\N
24109	INDIRECT	4	\N	23637	\N	541	24108	t
24110	INDIRECT	4	23937	\N	\N	541	24108	t
24111	INDIRECT	4	\N	23638	\N	541	24108	t
24112	INDIRECT	4	23938	\N	\N	541	24108	t
24113	DIRECT	4	\N	23639	\N	541	\N	\N
24114	INDIRECT	4	\N	23640	\N	541	24113	t
24115	INDIRECT	4	23939	\N	\N	541	24113	t
24116	INDIRECT	4	\N	23641	\N	541	24113	t
24117	INDIRECT	4	23940	\N	\N	541	24113	t
24118	INDIRECT	4	\N	23642	\N	541	24113	t
24119	INDIRECT	4	23941	\N	\N	541	24113	t
24120	DIRECT	4	\N	23643	\N	541	\N	\N
24121	INDIRECT	4	\N	23644	\N	541	24120	t
24122	INDIRECT	4	23942	\N	\N	541	24120	t
24301	DIRECT	3	\N	23640	\N	514	\N	\N
24302	INDIRECT	3	23939	\N	\N	514	24301	t
24303	DIRECT	3	\N	23641	\N	514	\N	\N
24304	INDIRECT	3	23940	\N	\N	514	24303	t
24305	DIRECT	3	\N	23642	\N	514	\N	\N
24306	INDIRECT	3	23941	\N	\N	514	24305	t
24307	DIRECT	3	\N	23644	\N	511	\N	\N
24308	INDIRECT	3	23942	\N	\N	511	24307	t
24123	INDIRECT	4	\N	23645	\N	541	24120	t
24309	DIRECT	3	\N	23645	\N	511	\N	\N
24310	INDIRECT	3	23943	\N	\N	511	24309	t
24124	INDIRECT	4	23943	\N	\N	541	24120	t
24125	INDIRECT	4	\N	23646	\N	541	24120	t
24311	DIRECT	3	\N	23646	\N	511	\N	\N
24126	INDIRECT	4	23944	\N	\N	541	24120	t
24312	INDIRECT	3	23944	\N	\N	511	24311	t
27817	DIRECT	3	\N	23649	\N	540	\N	\N
27818	INDIRECT	3	\N	23650	\N	540	27817	t
27819	INDIRECT	3	23945	\N	\N	540	27817	t
27820	INDIRECT	3	\N	23651	\N	540	27817	t
27821	INDIRECT	3	23946	\N	\N	540	27817	t
27822	DIRECT	3	\N	23652	\N	540	\N	\N
27823	INDIRECT	3	\N	23653	\N	540	27822	t
27824	INDIRECT	3	23947	\N	\N	540	27822	t
27825	INDIRECT	3	\N	23654	\N	540	27822	t
27826	INDIRECT	3	23948	\N	\N	540	27822	t
27827	INDIRECT	3	\N	23655	\N	540	27822	t
27828	INDIRECT	3	23949	\N	\N	540	27822	t
27829	DIRECT	3	\N	23656	\N	540	\N	\N
27830	INDIRECT	3	\N	23657	\N	540	27829	t
27831	INDIRECT	3	23950	\N	\N	540	27829	t
27832	INDIRECT	3	\N	23658	\N	540	27829	t
27833	INDIRECT	3	23951	\N	\N	540	27829	t
27834	INDIRECT	3	\N	23659	\N	540	27829	t
27835	INDIRECT	3	23952	\N	\N	540	27829	t
27938	DIRECT	2	\N	23653	\N	514	\N	\N
27939	INDIRECT	2	23947	\N	\N	514	27938	t
27940	DIRECT	2	\N	23654	\N	514	\N	\N
27941	INDIRECT	2	23948	\N	\N	514	27940	t
27942	DIRECT	2	\N	23655	\N	514	\N	\N
27943	INDIRECT	2	23949	\N	\N	514	27942	t
27944	DIRECT	2	\N	23657	\N	509	\N	\N
27945	INDIRECT	2	23950	\N	\N	509	27944	t
27946	DIRECT	2	\N	23658	\N	509	\N	\N
27947	INDIRECT	2	23951	\N	\N	509	27946	t
27948	DIRECT	2	\N	23659	\N	509	\N	\N
27949	INDIRECT	2	23952	\N	\N	509	27948	t
33955	INDIRECT	3	23955	\N	\N	538	33953	t
36891	DIRECT	3	\N	23675	\N	539	\N	\N
33956	INDIRECT	3	\N	23667	\N	538	33953	t
36892	INDIRECT	3	\N	23676	\N	539	36891	t
33957	INDIRECT	3	23956	\N	\N	538	33953	t
33958	INDIRECT	3	\N	23668	\N	538	33953	t
36893	INDIRECT	3	23961	\N	\N	539	36891	t
33959	INDIRECT	3	23957	\N	\N	538	33953	t
36894	INDIRECT	3	\N	23677	\N	539	36891	t
33960	DIRECT	3	\N	23669	\N	538	\N	\N
33961	INDIRECT	3	\N	23670	\N	538	33960	t
36895	INDIRECT	3	23962	\N	\N	539	36891	t
36896	DIRECT	3	\N	23678	\N	539	\N	\N
33962	INDIRECT	3	23958	\N	\N	538	33960	t
33963	INDIRECT	3	\N	23671	\N	538	33960	t
33964	INDIRECT	3	23959	\N	\N	538	33960	t
33965	INDIRECT	3	\N	23672	\N	538	33960	t
36897	INDIRECT	3	\N	23679	\N	539	36896	t
36898	INDIRECT	3	23963	\N	\N	539	36896	t
36899	INDIRECT	3	\N	23680	\N	539	36896	t
33948	DIRECT	3	\N	23662	\N	538	\N	\N
33949	INDIRECT	3	\N	23663	\N	538	33948	t
33950	INDIRECT	3	23953	\N	\N	538	33948	t
33951	INDIRECT	3	\N	23664	\N	538	33948	t
33952	INDIRECT	3	23954	\N	\N	538	33948	t
33953	DIRECT	3	\N	23665	\N	538	\N	\N
33954	INDIRECT	3	\N	23666	\N	538	33953	t
33966	INDIRECT	3	23960	\N	\N	538	33960	t
34091	DIRECT	2	\N	23666	\N	513	\N	\N
34092	INDIRECT	2	23955	\N	\N	513	34091	t
34093	DIRECT	2	\N	23667	\N	513	\N	\N
34094	INDIRECT	2	23956	\N	\N	513	34093	t
34095	DIRECT	2	\N	23668	\N	513	\N	\N
34096	INDIRECT	2	23957	\N	\N	513	34095	t
34097	DIRECT	2	\N	23670	\N	509	\N	\N
34098	INDIRECT	2	23958	\N	\N	509	34097	t
34099	DIRECT	2	\N	23672	\N	509	\N	\N
34100	INDIRECT	2	23960	\N	\N	509	34099	t
36900	INDIRECT	3	23964	\N	\N	539	36896	t
36901	INDIRECT	3	\N	23681	\N	539	36896	t
36902	INDIRECT	3	23965	\N	\N	539	36896	t
37162	DIRECT	2	\N	23679	\N	514	\N	\N
37163	INDIRECT	2	23963	\N	\N	514	37162	t
37164	DIRECT	2	\N	23680	\N	514	\N	\N
37165	INDIRECT	2	23964	\N	\N	514	37164	t
37166	DIRECT	2	\N	23681	\N	514	\N	\N
37167	INDIRECT	2	23965	\N	\N	514	37166	t
37168	DIRECT	2	\N	23682	\N	539	\N	\N
37169	DIRECT	2	\N	23683	\N	511	\N	\N
37170	INDIRECT	2	\N	23683	\N	539	37168	t
37171	INDIRECT	2	23966	\N	\N	511	37169	t
37172	INDIRECT	2	23966	\N	\N	539	37168	t
37173	INDIRECT	2	\N	23684	\N	539	37168	t
37174	DIRECT	2	\N	23684	\N	511	\N	\N
37175	INDIRECT	2	23967	\N	\N	511	37174	t
37176	INDIRECT	2	23967	\N	\N	539	37168	t
37177	DIRECT	2	\N	23685	\N	511	\N	\N
37178	INDIRECT	2	\N	23685	\N	539	37168	t
37179	INDIRECT	2	23968	\N	\N	511	37177	t
37180	INDIRECT	2	23968	\N	\N	539	37168	t
57966	DIRECT	1	\N	\N	57842	542	\N	\N
57967	INDIRECT	1	\N	\N	57843	542	57966	t
57968	INDIRECT	1	58132	\N	\N	542	57966	t
57969	INDIRECT	1	\N	\N	57844	542	57966	t
57970	INDIRECT	1	58133	\N	\N	542	57966	t
57971	DIRECT	1	\N	\N	57845	542	\N	\N
57972	DIRECT	1	\N	\N	57846	513	\N	\N
57973	INDIRECT	1	\N	\N	57846	542	57971	t
58176	INDIRECT	1	58134	\N	\N	513	57972	t
58177	INDIRECT	1	58134	\N	\N	542	57971	t
58178	INDIRECT	1	\N	\N	57847	542	57971	t
58179	DIRECT	1	\N	\N	57847	513	\N	\N
58180	INDIRECT	1	58135	\N	\N	542	57971	t
58181	INDIRECT	1	58135	\N	\N	513	58179	t
58182	INDIRECT	1	\N	\N	57848	542	57971	t
58183	DIRECT	1	\N	\N	57848	513	\N	\N
58184	INDIRECT	1	58136	\N	\N	513	58183	t
58185	INDIRECT	1	58136	\N	\N	542	57971	t
58186	DIRECT	1	\N	\N	57849	542	\N	\N
58187	DIRECT	1	\N	\N	57850	509	\N	\N
58188	INDIRECT	1	\N	\N	57850	542	58186	t
58189	INDIRECT	1	58137	\N	\N	509	58187	t
58190	INDIRECT	1	58137	\N	\N	542	58186	t
58191	INDIRECT	1	\N	\N	57851	542	58186	t
58192	DIRECT	1	\N	\N	57851	509	\N	\N
58230	DIRECT	2	\N	58301	\N	542	\N	\N
58231	INDIRECT	2	\N	58302	\N	542	58230	t
58232	INDIRECT	2	58170	\N	\N	542	58230	t
58233	INDIRECT	2	\N	58303	\N	542	58230	t
58234	INDIRECT	2	58171	\N	\N	542	58230	t
58235	DIRECT	2	\N	58304	\N	542	\N	\N
58236	INDIRECT	2	\N	58305	\N	542	58235	t
58237	DIRECT	2	\N	58305	\N	513	\N	\N
58238	INDIRECT	2	58172	\N	\N	513	58237	t
58239	INDIRECT	2	58172	\N	\N	542	58235	t
58240	INDIRECT	2	\N	58306	\N	542	58235	t
58241	DIRECT	2	\N	58306	\N	513	\N	\N
58242	INDIRECT	2	58173	\N	\N	513	58241	t
58243	INDIRECT	2	58173	\N	\N	542	58235	t
58244	DIRECT	2	\N	58307	\N	513	\N	\N
58245	INDIRECT	2	\N	58307	\N	542	58235	t
58246	INDIRECT	2	58174	\N	\N	542	58235	t
58247	INDIRECT	2	58174	\N	\N	513	58244	t
58248	DIRECT	2	\N	58308	\N	542	\N	\N
58249	INDIRECT	2	\N	58309	\N	542	58248	t
58250	DIRECT	2	\N	58309	\N	509	\N	\N
2302	DIRECT	16	\N	1619	\N	542	\N	\N
2303	INDIRECT	16	\N	1620	\N	542	2302	t
2304	INDIRECT	16	1919	\N	\N	542	2302	t
2305	INDIRECT	16	\N	1621	\N	542	2302	t
2306	INDIRECT	16	1920	\N	\N	542	2302	t
2307	DIRECT	16	\N	1622	\N	542	\N	\N
2308	INDIRECT	16	\N	1623	\N	542	2307	t
2423	DIRECT	15	\N	1623	\N	513	\N	\N
2424	INDIRECT	15	1921	\N	\N	513	2423	t
58193	INDIRECT	1	58138	\N	\N	509	58192	t
58194	INDIRECT	1	58138	\N	\N	542	58186	t
58195	DIRECT	1	\N	\N	57852	509	\N	\N
58196	INDIRECT	1	\N	\N	57852	542	58186	t
58197	INDIRECT	1	58139	\N	\N	509	58195	t
58198	INDIRECT	1	58139	\N	\N	542	58186	t
58251	INDIRECT	2	58175	\N	\N	509	58250	t
58252	INDIRECT	2	58175	\N	\N	542	58248	t
58253	INDIRECT	2	\N	58310	\N	542	58248	t
58254	DIRECT	2	\N	58310	\N	509	\N	\N
58255	INDIRECT	2	58479	\N	\N	509	58254	t
58256	INDIRECT	2	58479	\N	\N	542	58248	t
58257	INDIRECT	2	\N	58311	\N	542	58248	t
58258	DIRECT	2	\N	58311	\N	509	\N	\N
58259	INDIRECT	2	58480	\N	\N	509	58258	t
58260	INDIRECT	2	58480	\N	\N	542	58248	t
2309	INDIRECT	16	1921	\N	\N	542	2307	t
2310	INDIRECT	16	\N	1624	\N	542	2307	t
2425	DIRECT	15	\N	1624	\N	513	\N	\N
2426	INDIRECT	15	1922	\N	\N	513	2425	t
2311	INDIRECT	16	1922	\N	\N	542	2307	t
2312	INDIRECT	16	\N	1625	\N	542	2307	t
2427	DIRECT	15	\N	1625	\N	513	\N	\N
2313	INDIRECT	16	1923	\N	\N	542	2307	t
2428	INDIRECT	15	1923	\N	\N	513	2427	t
2314	DIRECT	16	\N	1626	\N	542	\N	\N
2315	INDIRECT	16	\N	1627	\N	542	2314	t
2429	DIRECT	15	\N	1627	\N	509	\N	\N
2430	INDIRECT	15	1924	\N	\N	509	2429	t
2316	INDIRECT	16	1924	\N	\N	542	2314	t
2317	INDIRECT	16	\N	1628	\N	542	2314	t
2431	DIRECT	15	\N	1628	\N	509	\N	\N
2432	INDIRECT	15	1925	\N	\N	509	2431	t
2318	INDIRECT	16	1925	\N	\N	542	2314	t
2433	DIRECT	15	\N	1629	\N	509	\N	\N
2319	INDIRECT	16	\N	1629	\N	542	2314	t
2320	INDIRECT	16	1926	\N	\N	542	2314	t
2434	INDIRECT	15	1926	\N	\N	509	2433	t
61712	DIRECT	2	1923	\N	\N	41714	\N	\N
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
1515	1	033bd704-c76d-4f45-8c64-f729c8b663e1	2010-03-01 20:35:51.726	\N	f	513	1314
1516	1	6ab18f95-8b6a-4908-8bd1-ff1ac3d1f52b	2010-03-01 20:35:37.915	\N	f	542	1314
1527	1	099e4093-753c-4951-b36b-0f33facd28ac	2010-03-01 00:00:00	\N	f	513	1326
1528	1	2acffe07-9b00-4bea-80b6-71dc32334334	2010-03-01 21:22:20.06	\N	f	538	1326
1532	1	5d23e9f0-afd1-4613-817f-8f01e663e0dd	2010-03-01 22:36:47.756	\N	f	540	1322
1524	3	2d762b09-3ed4-4f28-adb2-a203b0c07353	2010-03-01 20:57:54.107	\N	t	512	1322
1525	2	4858a83e-1260-4afe-b46d-bda5e3ea29fd	2010-03-01 20:59:16.882	\N	t	510	1322
1533	1	0db2812f-d58a-4bbf-a89f-98a25741fbc4	2010-03-01 22:37:01.009	\N	f	509	1322
19898	1	ac0403bf-8d59-4305-99a4-a5658162a55e	2010-03-01 00:00:00	\N	f	540	19496
19899	1	61222007-0330-484f-b7ae-24456d3ec46b	2010-03-01 00:00:00	\N	f	538	19498
1517	3	c5a26834-165a-4a3b-9d5c-b7aadb225eb6	2010-03-01 20:52:20.246	\N	f	509	1316
1518	3	ea42cb76-331e-4d6d-bcbb-33ad348ec4f0	2010-03-01 20:52:03.961	\N	f	542	1316
1526	4	c3bff800-bb69-40d8-977a-126c4ac2df5e	2010-03-01 20:59:50.035	\N	t	512	1324
1534	3	9b31b2ae-a812-4b6e-b282-551d4144c75d	2010-03-01 00:00:00	\N	f	514	1324
19900	1	579ff199-438f-4bc2-8cd3-9e4773c7617e	2010-03-01 00:00:00	\N	f	540	1324
19901	1	ebd1970e-f0c6-42eb-9b0b-cd4b98fad5ff	2010-03-07 19:49:50.619	\N	f	514	1330
19902	1	6ca93ec4-6ae8-4857-9ef5-6f8aa11a7415	2010-03-07 19:49:15.944	\N	f	539	1330
1531	3	62c3e29b-a10b-4b25-8ce4-64f0deaa9f17	2010-03-01 21:24:44.421	\N	f	511	1332
19903	1	c433c844-21bb-477d-bf69-dc5fdcf28be0	2010-03-07 00:00:00	\N	f	539	1332
19904	1	c8bae97d-3915-4f73-aadd-5a18bcf795b0	2010-03-07 19:50:58.538	\N	f	539	19500
3131	4	08368b54-72fd-4006-b028-4e23db681fde	2010-03-02 11:41:44.278	\N	f	542	2728
19897	2	df4796f7-4be6-49bf-8144-3ed291d910eb	2010-03-01 00:00:00	\N	f	541	19494
1530	3	2d581c81-0b35-40aa-bd73-110f338e3c31	2010-03-01 21:23:05.92	\N	f	509	1328
1529	3	e74e278e-55db-46c3-b97d-d499f08d061f	2010-03-01 21:22:57.304	\N	f	538	1328
1522	5	cca09834-192c-4c1d-b394-c586b87682d2	2010-03-01 20:54:37.921	\N	f	511	1320
1521	5	d0c67f28-d9e2-4022-af62-6f3a6b1d3351	2010-02-28 00:00:00	\N	t	541	1320
1523	3	ed5617c1-ee60-4aaa-91d0-01bb170e23f4	2010-03-01 20:56:23.745	\N	f	541	1320
1520	3	cf997d10-1194-4060-bc0c-ea291cff6c73	2010-03-01 20:52:53.72	\N	f	541	1318
1519	3	3d1dbdeb-1fbc-4d45-b703-7c807be10327	2010-03-01 20:53:11.604	\N	f	514	1318
61206	1	ad5bf1fb-695c-46bd-9ba1-b4ee2f2d34e1	2010-04-15 12:09:28.346	\N	f	542	40199
61207	1	b18c20cb-67ff-4889-86e5-355d7e7b9bd1	2010-04-15 12:33:17.534	\N	f	511	61308
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource, generatecode) FROM stdin;
131081	1	f2a1c236-8bcc-416e-97aa-39c6429f9897	Contrato laboral	tipo de contrato	t	t	t	0	t
131082	1	781a074c-0755-45d0-987e-37061d5e77fb	Documentación	\N	t	f	t	0	t
131083	1	51d107fc-66a3-466a-9f61-b8c9edacf2c2	Grupo	Grupo de pertenza do traballador	f	f	t	1	t
131072	15	cc665415-4ba7-4c8e-ac75-d01cab17f073	LEAVE	Leave	f	f	t	1	t
131073	11	900f947e-4227-44a9-8f93-2412aa0528af	CATEGORY	Professional category	t	t	t	1	t
131075	7	e990dc33-37c0-43ab-8e6e-3f4dbdafb6f0	JOB	Job	t	t	t	1	t
131076	5	a28da058-2ed6-4508-99ef-6ead99194953	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1	t
131077	1	113a187d-cff8-48eb-9973-73ba721b9034	LOCATION_GROUP	Location where the resource work	t	f	t	0	t
131079	1	b91be904-0c35-42b4-b7ad-4c6e097651ba	Localización	\N	f	t	t	1	t
131080	1	86093247-798f-4a9f-8b53-9d7ade8ef74c	Capacitacións de soldadura	Habilidades para soldar	f	f	t	0	t
131078	3	66f8f0e3-0e7f-4195-8bf6-9918235443f3	Tipo de traballo	Tipo de traballo	t	f	t	1	t
13500416	2	4362058d-e5dc-40dd-909a-3ccac7731a01	salud	criterio de lo saludable o no que esta un trabajador	t	t	t	0	t
131074	10	0082936b-0115-4dca-87e2-b5e021d33e30	TRAINING	Training courses and labor training	t	t	t	1	t
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
31537	GENERIC_DAY	4	0	2010-03-21	1324	\N	30421	\N
31512	GENERIC_DAY	4	0	2010-04-03	1324	\N	30421	\N
31560	GENERIC_DAY	4	9	2010-03-22	1324	\N	30421	\N
31533	GENERIC_DAY	4	3	2010-05-13	1324	\N	30421	\N
31550	GENERIC_DAY	4	9	2010-03-31	1324	\N	30421	\N
31565	GENERIC_DAY	4	4	2010-03-19	1324	\N	30421	\N
31525	GENERIC_DAY	4	4	2010-03-26	1324	\N	30421	\N
31547	GENERIC_DAY	4	9	2010-05-04	1324	\N	30421	\N
31532	GENERIC_DAY	4	9	2010-04-28	1324	\N	30421	\N
31555	GENERIC_DAY	4	9	2010-04-08	1324	\N	30421	\N
31529	GENERIC_DAY	4	0	2010-04-24	1324	\N	30421	\N
31556	GENERIC_DAY	4	4	2010-04-16	1324	\N	30421	\N
31531	GENERIC_DAY	4	0	2010-04-11	1324	\N	30421	\N
31564	GENERIC_DAY	4	4	2010-05-07	1324	\N	30421	\N
31549	GENERIC_DAY	4	9	2010-04-21	1324	\N	30421	\N
31518	GENERIC_DAY	4	9	2010-04-19	1324	\N	30421	\N
31528	GENERIC_DAY	4	9	2010-05-03	1324	\N	30421	\N
31540	GENERIC_DAY	4	9	2010-03-25	1324	\N	30421	\N
31554	GENERIC_DAY	4	0	2010-04-25	1324	\N	30421	\N
31538	GENERIC_DAY	4	9	2010-03-16	1324	\N	30421	\N
31553	GENERIC_DAY	4	9	2010-05-05	1324	\N	30421	\N
31548	GENERIC_DAY	4	0	2010-04-18	1324	\N	30421	\N
31552	GENERIC_DAY	4	9	2010-03-17	1324	\N	30421	\N
31527	GENERIC_DAY	4	0	2010-05-09	1324	\N	30421	\N
31562	GENERIC_DAY	4	9	2010-05-06	1324	\N	30421	\N
31541	GENERIC_DAY	4	0	2010-03-20	1324	\N	30421	\N
31559	GENERIC_DAY	4	4	2010-04-02	1324	\N	30421	\N
31526	GENERIC_DAY	4	0	2010-04-17	1324	\N	30421	\N
31514	GENERIC_DAY	4	9	2010-04-06	1324	\N	30421	\N
31545	GENERIC_DAY	4	9	2010-03-18	1324	\N	30421	\N
31563	GENERIC_DAY	4	9	2010-04-15	1324	\N	30421	\N
31515	GENERIC_DAY	4	4	2010-04-09	1324	\N	30421	\N
31568	GENERIC_DAY	4	9	2010-03-29	1324	\N	30421	\N
31544	GENERIC_DAY	4	4	2010-04-23	1324	\N	30421	\N
31534	GENERIC_DAY	4	0	2010-05-02	1324	\N	30421	\N
31530	GENERIC_DAY	4	9	2010-05-12	1324	\N	30421	\N
31561	GENERIC_DAY	4	9	2010-04-26	1324	\N	30421	\N
31535	GENERIC_DAY	4	0	2010-05-08	1324	\N	30421	\N
31566	GENERIC_DAY	4	9	2010-04-05	1324	\N	30421	\N
31524	GENERIC_DAY	4	9	2010-04-20	1324	\N	30421	\N
31557	GENERIC_DAY	4	9	2010-04-13	1324	\N	30421	\N
31511	GENERIC_DAY	4	9	2010-04-14	1324	\N	30421	\N
31521	GENERIC_DAY	4	9	2010-03-23	1324	\N	30421	\N
31523	GENERIC_DAY	4	9	2010-04-01	1324	\N	30421	\N
31551	GENERIC_DAY	4	9	2010-04-27	1324	\N	30421	\N
31509	GENERIC_DAY	4	0	2010-04-10	1324	\N	30421	\N
31520	GENERIC_DAY	4	0	2010-04-04	1324	\N	30421	\N
31558	GENERIC_DAY	4	9	2010-05-10	1324	\N	30421	\N
31517	GENERIC_DAY	4	9	2010-05-11	1324	\N	30421	\N
31536	GENERIC_DAY	4	0	2010-03-27	1324	\N	30421	\N
33730	GENERIC_DAY	1	0	2010-05-16	1324	\N	30422	\N
33731	GENERIC_DAY	1	0	2010-05-15	1324	\N	30422	\N
33732	GENERIC_DAY	1	9	2010-06-21	1324	\N	30422	\N
33733	GENERIC_DAY	1	0	2010-06-06	1324	\N	30422	\N
33734	GENERIC_DAY	1	9	2010-06-14	1324	\N	30422	\N
33735	GENERIC_DAY	1	0	2010-06-19	1324	\N	30422	\N
33736	GENERIC_DAY	1	9	2010-05-25	1324	\N	30422	\N
33737	GENERIC_DAY	1	4	2010-05-14	1324	\N	30422	\N
33738	GENERIC_DAY	1	4	2010-06-18	1324	\N	30422	\N
33739	GENERIC_DAY	1	9	2010-06-24	1324	\N	30422	\N
33740	GENERIC_DAY	1	9	2010-05-18	1324	\N	30422	\N
33741	GENERIC_DAY	1	4	2010-05-21	1324	\N	30422	\N
33742	GENERIC_DAY	1	9	2010-06-15	1324	\N	30422	\N
33743	GENERIC_DAY	1	4	2010-06-25	1324	\N	30422	\N
33744	GENERIC_DAY	1	9	2010-05-31	1324	\N	30422	\N
33745	GENERIC_DAY	1	9	2010-05-26	1324	\N	30422	\N
33746	GENERIC_DAY	1	9	2010-05-24	1324	\N	30422	\N
33747	GENERIC_DAY	1	9	2010-06-01	1324	\N	30422	\N
33748	GENERIC_DAY	1	9	2010-05-20	1324	\N	30422	\N
33749	GENERIC_DAY	1	6	2010-07-06	1324	\N	30422	\N
33157	GENERIC_DAY	3	7	2010-09-02	1322	\N	30466	\N
33156	GENERIC_DAY	3	3	2010-08-20	1322	\N	30466	\N
33145	GENERIC_DAY	3	2	2010-09-10	1322	\N	30466	\N
33124	GENERIC_DAY	3	7	2010-09-15	1322	\N	30466	\N
33131	GENERIC_DAY	3	7	2010-10-04	1322	\N	30466	\N
33152	GENERIC_DAY	3	7	2010-09-20	1322	\N	30466	\N
33122	GENERIC_DAY	3	8	2010-08-11	1322	\N	30466	\N
33128	GENERIC_DAY	3	8	2010-08-19	1322	\N	30466	\N
33136	GENERIC_DAY	3	7	2010-08-24	1322	\N	30466	\N
33140	GENERIC_DAY	3	8	2010-08-23	1322	\N	30466	\N
33143	GENERIC_DAY	3	2	2010-10-01	1322	\N	30466	\N
33750	GENERIC_DAY	1	9	2010-06-10	1324	\N	30422	\N
33751	GENERIC_DAY	1	0	2010-05-30	1324	\N	30422	\N
33752	GENERIC_DAY	1	9	2010-06-23	1324	\N	30422	\N
33753	GENERIC_DAY	1	0	2010-06-20	1324	\N	30422	\N
33754	GENERIC_DAY	1	9	2010-06-08	1324	\N	30422	\N
33755	GENERIC_DAY	1	0	2010-06-27	1324	\N	30422	\N
33756	GENERIC_DAY	1	9	2010-06-02	1324	\N	30422	\N
33757	GENERIC_DAY	1	9	2010-06-17	1324	\N	30422	\N
33758	GENERIC_DAY	1	4	2010-06-11	1324	\N	30422	\N
33759	GENERIC_DAY	1	9	2010-06-22	1324	\N	30422	\N
33760	GENERIC_DAY	1	9	2010-07-05	1324	\N	30422	\N
33761	GENERIC_DAY	1	9	2010-05-27	1324	\N	30422	\N
33762	GENERIC_DAY	1	0	2010-06-26	1324	\N	30422	\N
33763	GENERIC_DAY	1	0	2010-06-13	1324	\N	30422	\N
33764	GENERIC_DAY	1	4	2010-06-04	1324	\N	30422	\N
33765	GENERIC_DAY	1	0	2010-06-05	1324	\N	30422	\N
33766	GENERIC_DAY	1	0	2010-06-12	1324	\N	30422	\N
33767	GENERIC_DAY	1	9	2010-06-07	1324	\N	30422	\N
33768	GENERIC_DAY	1	0	2010-05-22	1324	\N	30422	\N
33769	GENERIC_DAY	1	0	2010-05-29	1324	\N	30422	\N
33770	GENERIC_DAY	1	4	2010-05-28	1324	\N	30422	\N
33771	GENERIC_DAY	1	0	2010-05-23	1324	\N	30422	\N
33772	GENERIC_DAY	1	9	2010-05-19	1324	\N	30422	\N
33773	GENERIC_DAY	1	9	2010-06-09	1324	\N	30422	\N
33774	GENERIC_DAY	1	9	2010-06-16	1324	\N	30422	\N
33775	GENERIC_DAY	1	9	2010-06-03	1324	\N	30422	\N
33776	GENERIC_DAY	1	9	2010-07-13	1324	\N	30423	\N
33777	GENERIC_DAY	1	0	2010-08-08	1324	\N	30423	\N
33778	GENERIC_DAY	1	4	2010-07-09	1324	\N	30423	\N
33779	GENERIC_DAY	1	9	2010-08-05	1324	\N	30423	\N
33780	GENERIC_DAY	1	9	2010-07-21	1324	\N	30423	\N
33781	GENERIC_DAY	1	0	2010-07-10	1324	\N	30423	\N
33782	GENERIC_DAY	1	0	2010-07-18	1324	\N	30423	\N
33783	GENERIC_DAY	1	9	2010-07-28	1324	\N	30423	\N
33784	GENERIC_DAY	1	9	2010-07-22	1324	\N	30423	\N
33785	GENERIC_DAY	1	0	2010-07-11	1324	\N	30423	\N
33786	GENERIC_DAY	1	4	2010-07-30	1324	\N	30423	\N
33787	GENERIC_DAY	1	9	2010-07-20	1324	\N	30423	\N
33788	GENERIC_DAY	1	9	2010-07-15	1324	\N	30423	\N
33789	GENERIC_DAY	1	4	2010-07-16	1324	\N	30423	\N
33790	GENERIC_DAY	1	4	2010-08-06	1324	\N	30423	\N
33791	GENERIC_DAY	1	0	2010-07-31	1324	\N	30423	\N
33792	GENERIC_DAY	1	9	2010-07-08	1324	\N	30423	\N
33793	GENERIC_DAY	1	9	2010-08-09	1324	\N	30423	\N
33794	GENERIC_DAY	1	9	2010-07-26	1324	\N	30423	\N
33795	GENERIC_DAY	1	0	2010-07-17	1324	\N	30423	\N
33796	GENERIC_DAY	1	9	2010-07-27	1324	\N	30423	\N
33797	GENERIC_DAY	1	9	2010-08-10	1324	\N	30423	\N
33798	GENERIC_DAY	1	9	2010-07-12	1324	\N	30423	\N
33799	GENERIC_DAY	1	0	2010-07-24	1324	\N	30423	\N
33800	GENERIC_DAY	1	9	2010-07-07	1324	\N	30423	\N
33801	GENERIC_DAY	1	9	2010-08-02	1324	\N	30423	\N
33802	GENERIC_DAY	1	4	2010-07-23	1324	\N	30423	\N
33803	GENERIC_DAY	1	0	2010-07-25	1324	\N	30423	\N
33804	GENERIC_DAY	1	9	2010-08-03	1324	\N	30423	\N
33805	GENERIC_DAY	1	9	2010-07-29	1324	\N	30423	\N
33806	GENERIC_DAY	1	0	2010-08-01	1324	\N	30423	\N
33807	GENERIC_DAY	1	9	2010-07-19	1324	\N	30423	\N
33808	GENERIC_DAY	1	9	2010-08-04	1324	\N	30423	\N
33809	GENERIC_DAY	1	0	2010-08-07	1324	\N	30423	\N
33810	GENERIC_DAY	1	9	2010-07-14	1324	\N	30423	\N
33188	GENERIC_DAY	3	0	2010-08-14	1322	\N	30467	\N
33180	GENERIC_DAY	3	5	2010-08-19	1322	\N	30467	\N
33173	GENERIC_DAY	3	5	2010-08-18	1322	\N	30467	\N
33182	GENERIC_DAY	3	5	2010-08-16	1322	\N	30467	\N
33187	GENERIC_DAY	3	5	2010-08-26	1322	\N	30467	\N
33169	GENERIC_DAY	3	5	2010-08-12	1322	\N	30467	\N
33176	GENERIC_DAY	3	5	2010-08-25	1322	\N	30467	\N
33177	GENERIC_DAY	3	5	2010-08-31	1322	\N	30467	\N
33178	GENERIC_DAY	3	0	2010-08-15	1322	\N	30467	\N
33171	GENERIC_DAY	3	0	2010-08-29	1322	\N	30467	\N
33181	GENERIC_DAY	3	5	2010-08-17	1322	\N	30467	\N
33175	GENERIC_DAY	3	0	2010-08-22	1322	\N	30467	\N
33186	GENERIC_DAY	3	5	2010-08-30	1322	\N	30467	\N
35843	GENERIC_DAY	5	9	2010-03-29	1326	\N	30498	\N
35853	GENERIC_DAY	5	0	2010-04-03	1326	\N	30498	\N
35868	GENERIC_DAY	5	0	2010-05-01	1326	\N	30498	\N
35875	GENERIC_DAY	5	0	2010-05-09	1326	\N	30498	\N
35870	GENERIC_DAY	5	0	2010-04-24	1326	\N	30498	\N
35828	GENERIC_DAY	5	0	2010-05-16	1326	\N	30498	\N
35839	GENERIC_DAY	5	9	2010-04-28	1326	\N	30498	\N
35876	GENERIC_DAY	5	9	2010-05-20	1326	\N	30498	\N
35836	GENERIC_DAY	5	4	2010-04-16	1326	\N	30498	\N
35869	GENERIC_DAY	5	9	2010-04-08	1326	\N	30498	\N
35873	GENERIC_DAY	5	9	2010-04-06	1326	\N	30498	\N
35821	GENERIC_DAY	5	4	2010-04-09	1326	\N	30498	\N
35822	GENERIC_DAY	5	9	2010-05-06	1326	\N	30498	\N
35874	GENERIC_DAY	5	9	2010-03-31	1326	\N	30498	\N
35852	GENERIC_DAY	5	0	2010-03-27	1326	\N	30498	\N
35865	GENERIC_DAY	5	0	2010-04-04	1326	\N	30498	\N
35878	GENERIC_DAY	5	0	2010-04-17	1326	\N	30498	\N
35842	GENERIC_DAY	5	3	2010-05-21	1326	\N	30498	\N
35831	GENERIC_DAY	5	0	2010-04-25	1326	\N	30498	\N
35850	GENERIC_DAY	5	9	2010-03-24	1326	\N	30498	\N
35825	GENERIC_DAY	5	9	2010-05-12	1326	\N	30498	\N
35880	GENERIC_DAY	5	9	2010-05-19	1326	\N	30498	\N
35849	GENERIC_DAY	5	9	2010-04-19	1326	\N	30498	\N
36605	GENERIC_DAY	3	5	2010-08-10	1328	\N	36164	\N
36606	GENERIC_DAY	3	0	2010-08-07	1328	\N	36164	\N
36607	GENERIC_DAY	3	0	2010-07-25	1328	\N	36164	\N
36608	GENERIC_DAY	3	0	2010-08-08	1328	\N	36164	\N
36609	GENERIC_DAY	3	0	2010-08-14	1328	\N	36164	\N
56513	GENERIC_DAY	2	6	2010-08-23	1320	\N	20279	\N
56514	GENERIC_DAY	2	6	2010-08-05	1320	\N	20279	\N
56515	GENERIC_DAY	2	6	2010-07-19	1320	\N	20279	\N
56516	GENERIC_DAY	2	6	2010-08-17	1320	\N	20279	\N
56517	GENERIC_DAY	2	6	2010-07-21	1320	\N	20279	\N
56518	GENERIC_DAY	2	5	2010-07-14	1320	\N	20290	\N
56519	GENERIC_DAY	2	2	2010-07-23	1320	\N	20290	\N
56520	GENERIC_DAY	2	5	2010-08-03	1320	\N	20290	\N
56521	GENERIC_DAY	2	5	2010-07-19	1320	\N	20290	\N
56522	GENERIC_DAY	2	0	2010-08-01	1320	\N	20290	\N
56523	GENERIC_DAY	2	5	2010-07-20	1320	\N	20290	\N
56524	GENERIC_DAY	2	5	2010-07-28	1320	\N	20290	\N
56525	GENERIC_DAY	2	2	2010-07-16	1320	\N	20290	\N
56526	GENERIC_DAY	2	5	2010-08-05	1320	\N	20290	\N
56527	GENERIC_DAY	2	0	2010-07-31	1320	\N	20290	\N
56528	GENERIC_DAY	2	5	2010-07-15	1320	\N	20290	\N
56529	GENERIC_DAY	2	0	2010-07-25	1320	\N	20290	\N
56530	GENERIC_DAY	2	0	2010-07-24	1320	\N	20290	\N
56531	GENERIC_DAY	2	5	2010-07-29	1320	\N	20290	\N
56532	GENERIC_DAY	2	2	2010-08-06	1320	\N	20290	\N
56533	GENERIC_DAY	2	2	2010-07-30	1320	\N	20290	\N
56534	GENERIC_DAY	2	5	2010-08-02	1320	\N	20290	\N
56535	GENERIC_DAY	2	5	2010-07-21	1320	\N	20290	\N
36610	GENERIC_DAY	3	5	2010-07-26	1328	\N	36164	\N
36611	GENERIC_DAY	3	5	2010-08-12	1328	\N	36164	\N
36612	GENERIC_DAY	3	2	2010-08-20	1328	\N	36164	\N
36613	GENERIC_DAY	3	5	2010-08-23	1328	\N	36164	\N
36614	GENERIC_DAY	3	2	2010-08-13	1328	\N	36164	\N
36615	GENERIC_DAY	3	2	2010-08-06	1328	\N	36164	\N
36616	GENERIC_DAY	3	2	2010-07-30	1328	\N	36164	\N
36617	GENERIC_DAY	3	5	2010-08-05	1328	\N	36164	\N
36618	GENERIC_DAY	3	5	2010-08-09	1328	\N	36164	\N
36619	GENERIC_DAY	3	5	2010-08-24	1328	\N	36164	\N
36620	GENERIC_DAY	3	5	2010-08-18	1328	\N	36164	\N
36749	GENERIC_DAY	2	0	2010-11-13	1328	\N	36167	\N
25804	GENERIC_DAY	9	9	2010-03-08	1318	\N	20274	\N
25796	GENERIC_DAY	9	9	2010-03-25	1318	\N	20274	\N
25758	GENERIC_DAY	9	9	2010-03-09	1318	\N	20274	\N
56652	GENERIC_DAY	2	0	2010-05-09	1318	\N	20275	\N
56653	GENERIC_DAY	2	0	2010-06-05	1318	\N	20275	\N
56654	GENERIC_DAY	2	0	2010-05-22	1318	\N	20275	\N
56655	GENERIC_DAY	2	9	2010-06-01	1318	\N	20275	\N
56706	GENERIC_DAY	2	0	2010-06-27	1318	\N	20276	\N
51060	GENERIC_DAY	3	2	2010-03-17	19496	\N	51107	\N
51065	GENERIC_DAY	3	0	2010-03-14	19496	\N	51107	\N
51054	GENERIC_DAY	3	5	2010-03-16	19496	\N	51107	\N
51056	GENERIC_DAY	3	10	2010-03-08	1322	\N	51107	\N
51064	GENERIC_DAY	3	0	2010-03-17	1324	\N	51107	\N
36750	GENERIC_DAY	2	5	2010-12-08	1328	\N	36167	\N
36751	GENERIC_DAY	2	0	2010-12-11	1328	\N	36167	\N
36752	GENERIC_DAY	2	0	2010-11-27	1328	\N	36167	\N
36753	GENERIC_DAY	2	5	2010-11-29	1328	\N	36167	\N
36754	GENERIC_DAY	2	5	2010-11-08	1328	\N	36167	\N
36755	GENERIC_DAY	2	2	2010-12-17	1328	\N	36167	\N
36756	GENERIC_DAY	2	5	2010-10-26	1328	\N	36167	\N
36757	GENERIC_DAY	2	5	2010-10-19	1328	\N	36167	\N
36758	GENERIC_DAY	2	2	2010-11-05	1328	\N	36167	\N
36759	GENERIC_DAY	2	5	2010-11-24	1328	\N	36167	\N
36760	GENERIC_DAY	2	5	2010-11-04	1328	\N	36167	\N
36761	GENERIC_DAY	2	5	2010-10-21	1328	\N	36167	\N
36762	GENERIC_DAY	2	5	2010-10-28	1328	\N	36167	\N
36763	GENERIC_DAY	2	2	2010-11-12	1328	\N	36167	\N
36764	GENERIC_DAY	2	5	2010-11-02	1328	\N	36167	\N
36765	GENERIC_DAY	2	5	2010-12-09	1328	\N	36167	\N
36766	GENERIC_DAY	2	5	2010-11-25	1328	\N	36167	\N
36767	GENERIC_DAY	2	5	2010-11-11	1328	\N	36167	\N
36768	GENERIC_DAY	2	5	2010-11-17	1328	\N	36167	\N
36769	GENERIC_DAY	2	0	2010-11-06	1328	\N	36167	\N
36770	GENERIC_DAY	2	0	2010-12-12	1328	\N	36167	\N
36771	GENERIC_DAY	2	0	2010-11-21	1328	\N	36167	\N
36772	GENERIC_DAY	2	5	2010-12-02	1328	\N	36167	\N
36773	GENERIC_DAY	2	5	2010-10-25	1328	\N	36167	\N
36774	GENERIC_DAY	2	2	2010-11-26	1328	\N	36167	\N
36775	GENERIC_DAY	2	0	2010-12-04	1328	\N	36167	\N
36776	GENERIC_DAY	2	5	2010-11-03	1328	\N	36167	\N
36777	GENERIC_DAY	2	5	2010-12-13	1328	\N	36167	\N
36778	GENERIC_DAY	2	5	2010-11-22	1328	\N	36167	\N
36779	GENERIC_DAY	2	5	2010-11-23	1328	\N	36167	\N
36780	GENERIC_DAY	2	5	2010-12-14	1328	\N	36167	\N
36781	GENERIC_DAY	2	5	2010-12-07	1328	\N	36167	\N
36782	GENERIC_DAY	2	0	2010-11-07	1328	\N	36167	\N
36783	GENERIC_DAY	2	2	2010-10-29	1328	\N	36167	\N
36784	GENERIC_DAY	2	5	2010-10-27	1328	\N	36167	\N
36785	GENERIC_DAY	2	5	2010-11-15	1328	\N	36167	\N
36786	GENERIC_DAY	2	2	2010-11-19	1328	\N	36167	\N
36787	GENERIC_DAY	2	0	2010-10-16	1328	\N	36167	\N
36788	GENERIC_DAY	2	0	2010-10-17	1328	\N	36167	\N
36789	GENERIC_DAY	2	5	2010-12-15	1328	\N	36167	\N
36790	GENERIC_DAY	2	5	2010-10-18	1328	\N	36167	\N
36791	GENERIC_DAY	2	5	2010-10-20	1328	\N	36167	\N
34181	SPECIFIC_DAY	7	4	2010-04-29	19498	30469	\N	\N
34182	SPECIFIC_DAY	7	4	2010-05-19	19498	30469	\N	\N
34189	SPECIFIC_DAY	7	0	2010-04-10	19498	30469	\N	\N
34155	SPECIFIC_DAY	7	4	2010-04-22	19498	30469	\N	\N
33813	SPECIFIC_DAY	7	4	2010-04-19	19498	30469	\N	\N
34178	SPECIFIC_DAY	7	0	2010-04-17	19498	30469	\N	\N
34166	SPECIFIC_DAY	7	4	2010-04-05	19498	30469	\N	\N
34150	SPECIFIC_DAY	7	4	2010-03-24	19498	30469	\N	\N
34175	SPECIFIC_DAY	7	2	2010-04-16	19498	30469	\N	\N
33830	SPECIFIC_DAY	7	0	2010-05-09	19498	30469	\N	\N
34165	SPECIFIC_DAY	7	4	2010-05-04	19498	30469	\N	\N
34186	SPECIFIC_DAY	7	4	2010-04-01	19498	30469	\N	\N
34151	SPECIFIC_DAY	7	4	2010-05-03	19498	30469	\N	\N
36792	GENERIC_DAY	2	5	2010-11-01	1328	\N	36167	\N
36793	GENERIC_DAY	2	5	2010-11-18	1328	\N	36167	\N
36794	GENERIC_DAY	2	2	2010-10-22	1328	\N	36167	\N
36795	GENERIC_DAY	2	0	2010-10-23	1328	\N	36167	\N
36796	GENERIC_DAY	2	5	2010-11-30	1328	\N	36167	\N
36797	GENERIC_DAY	2	0	2010-10-30	1328	\N	36167	\N
36798	GENERIC_DAY	2	5	2010-11-16	1328	\N	36167	\N
36799	GENERIC_DAY	2	2	2010-10-15	1328	\N	36167	\N
36800	GENERIC_DAY	2	0	2010-11-14	1328	\N	36167	\N
51057	GENERIC_DAY	3	16	2010-03-02	19496	\N	51107	\N
51050	GENERIC_DAY	3	6	2010-03-11	19496	\N	51107	\N
51041	GENERIC_DAY	3	10	2010-03-15	1322	\N	51107	\N
51068	GENERIC_DAY	3	1	2010-03-15	1324	\N	51107	\N
51053	GENERIC_DAY	3	0	2010-03-07	19496	\N	51107	\N
51061	GENERIC_DAY	3	6	2010-03-08	19496	\N	51107	\N
51063	GENERIC_DAY	3	10	2010-03-10	1322	\N	51107	\N
51044	GENERIC_DAY	3	10	2010-03-11	1322	\N	51107	\N
51052	GENERIC_DAY	3	7	2010-03-12	19496	\N	51107	\N
51051	GENERIC_DAY	3	10	2010-03-16	1322	\N	51107	\N
51062	GENERIC_DAY	3	16	2010-03-04	19496	\N	51107	\N
51042	GENERIC_DAY	3	6	2010-03-10	19496	\N	51107	\N
51043	GENERIC_DAY	3	16	2010-03-03	19496	\N	51107	\N
51048	GENERIC_DAY	3	5	2010-03-15	19496	\N	51107	\N
51040	GENERIC_DAY	3	1	2010-03-16	1324	\N	51107	\N
51045	GENERIC_DAY	3	0	2010-03-13	1322	\N	51107	\N
51046	GENERIC_DAY	3	6	2010-03-09	19496	\N	51107	\N
51067	GENERIC_DAY	3	16	2010-03-05	19496	\N	51107	\N
51066	GENERIC_DAY	3	6	2010-03-17	1322	\N	51107	\N
51059	GENERIC_DAY	3	10	2010-03-09	1322	\N	51107	\N
51069	GENERIC_DAY	3	9	2010-03-12	1322	\N	51107	\N
51047	GENERIC_DAY	3	0	2010-03-14	1322	\N	51107	\N
51058	GENERIC_DAY	3	0	2010-03-06	19496	\N	51107	\N
34191	SPECIFIC_DAY	7	0	2010-04-03	19498	30469	\N	\N
34172	SPECIFIC_DAY	7	2	2010-04-09	19498	30469	\N	\N
34177	SPECIFIC_DAY	7	0	2010-04-04	19498	30469	\N	\N
33811	SPECIFIC_DAY	7	2	2010-05-07	19498	30469	\N	\N
34146	SPECIFIC_DAY	7	4	2010-04-20	19498	30469	\N	\N
34147	SPECIFIC_DAY	7	2	2010-05-14	19498	30469	\N	\N
34144	SPECIFIC_DAY	7	4	2010-04-06	19498	30469	\N	\N
34170	SPECIFIC_DAY	7	4	2010-04-26	19498	30469	\N	\N
33824	SPECIFIC_DAY	7	4	2010-03-15	19498	30469	\N	\N
34148	SPECIFIC_DAY	7	0	2010-04-25	19498	30469	\N	\N
34161	SPECIFIC_DAY	7	2	2010-03-26	19498	30469	\N	\N
34185	SPECIFIC_DAY	7	4	2010-05-20	19498	30469	\N	\N
34141	SPECIFIC_DAY	7	4	2010-04-14	19498	30469	\N	\N
34156	SPECIFIC_DAY	7	0	2010-05-02	19498	30469	\N	\N
33818	SPECIFIC_DAY	7	0	2010-05-22	19498	30469	\N	\N
36801	GENERIC_DAY	2	5	2010-11-09	1328	\N	36167	\N
36802	GENERIC_DAY	2	2	2010-12-10	1328	\N	36167	\N
36803	GENERIC_DAY	2	5	2010-12-01	1328	\N	36167	\N
36804	GENERIC_DAY	2	0	2010-12-05	1328	\N	36167	\N
36805	GENERIC_DAY	2	5	2010-11-10	1328	\N	36167	\N
36806	GENERIC_DAY	2	5	2010-12-06	1328	\N	36167	\N
36807	GENERIC_DAY	2	0	2010-11-28	1328	\N	36167	\N
36808	GENERIC_DAY	2	2	2010-12-03	1328	\N	36167	\N
36809	GENERIC_DAY	2	0	2010-11-20	1328	\N	36167	\N
36810	GENERIC_DAY	2	5	2010-12-16	1328	\N	36167	\N
36811	GENERIC_DAY	2	0	2010-10-31	1328	\N	36167	\N
36812	GENERIC_DAY	2	0	2010-10-24	1328	\N	36167	\N
58991	GENERIC_DAY	2	8	2010-04-20	1314	\N	20240	\N
58992	GENERIC_DAY	2	0	2010-05-15	1314	\N	20240	\N
58993	GENERIC_DAY	2	8	2010-05-11	1314	\N	20240	\N
58994	GENERIC_DAY	2	8	2010-05-05	1314	\N	20240	\N
58995	GENERIC_DAY	2	8	2010-05-21	1314	\N	20240	\N
58996	GENERIC_DAY	2	8	2010-05-12	1314	\N	20240	\N
58997	GENERIC_DAY	2	0	2010-04-17	1314	\N	20240	\N
58998	GENERIC_DAY	2	0	2010-04-18	1314	\N	20240	\N
58999	GENERIC_DAY	2	8	2010-04-29	1314	\N	20240	\N
59000	GENERIC_DAY	2	8	2010-05-24	1314	\N	20240	\N
59001	GENERIC_DAY	2	8	2010-04-26	1314	\N	20240	\N
59002	GENERIC_DAY	2	0	2010-05-01	1314	\N	20240	\N
59003	GENERIC_DAY	2	8	2010-04-23	1314	\N	20240	\N
59004	GENERIC_DAY	2	0	2010-05-22	1314	\N	20240	\N
59005	GENERIC_DAY	2	8	2010-05-07	1314	\N	20240	\N
36412	GENERIC_DAY	4	0	2010-06-12	1326	\N	30499	\N
38745	GENERIC_DAY	3	9	2010-04-13	1330	\N	36197	\N
38746	GENERIC_DAY	3	9	2010-04-12	1330	\N	36197	\N
38747	GENERIC_DAY	3	0	2010-05-17	1330	\N	36197	\N
38748	GENERIC_DAY	3	9	2010-03-23	1330	\N	36197	\N
38749	GENERIC_DAY	3	4	2010-05-14	1330	\N	36197	\N
36413	GENERIC_DAY	4	9	2010-05-31	1326	\N	30499	\N
36414	GENERIC_DAY	4	4	2010-06-11	1326	\N	30499	\N
36415	GENERIC_DAY	4	9	2010-06-15	1326	\N	30499	\N
36416	GENERIC_DAY	4	9	2010-06-23	1326	\N	30499	\N
36417	GENERIC_DAY	4	9	2010-06-10	1326	\N	30499	\N
36418	GENERIC_DAY	4	0	2010-05-29	1326	\N	30499	\N
29845	SPECIFIC_DAY	5	5	2010-03-17	19496	20292	\N	\N
29836	SPECIFIC_DAY	5	5	2010-04-13	19496	20292	\N	\N
29831	SPECIFIC_DAY	5	5	2010-03-08	19496	20292	\N	\N
29853	SPECIFIC_DAY	5	5	2010-03-10	19496	20292	\N	\N
29849	SPECIFIC_DAY	5	5	2010-04-28	19496	20292	\N	\N
29842	SPECIFIC_DAY	5	5	2010-04-01	19496	20292	\N	\N
29841	SPECIFIC_DAY	5	0	2010-04-04	19496	20292	\N	\N
29844	SPECIFIC_DAY	5	0	2010-05-08	19496	20292	\N	\N
29834	SPECIFIC_DAY	5	5	2010-03-30	19496	20292	\N	\N
29839	SPECIFIC_DAY	5	5	2010-04-19	19496	20292	\N	\N
29837	SPECIFIC_DAY	5	5	2010-04-22	19496	20292	\N	\N
29852	SPECIFIC_DAY	5	0	2010-05-02	19496	20292	\N	\N
29846	SPECIFIC_DAY	5	2	2010-05-10	19496	20292	\N	\N
29830	SPECIFIC_DAY	5	5	2010-04-06	19496	20292	\N	\N
29829	SPECIFIC_DAY	5	5	2010-03-09	19496	20292	\N	\N
29851	SPECIFIC_DAY	5	0	2010-04-03	19496	20292	\N	\N
29843	SPECIFIC_DAY	5	5	2010-04-21	19496	20292	\N	\N
29840	SPECIFIC_DAY	5	5	2010-04-07	19496	20292	\N	\N
29847	SPECIFIC_DAY	5	2	2010-04-30	19496	20292	\N	\N
29835	SPECIFIC_DAY	5	0	2010-04-24	19496	20292	\N	\N
29848	SPECIFIC_DAY	5	0	2010-04-18	19496	20292	\N	\N
29838	SPECIFIC_DAY	5	5	2010-04-12	19496	20292	\N	\N
29826	SPECIFIC_DAY	5	2	2010-04-23	19496	20292	\N	\N
29850	SPECIFIC_DAY	5	5	2010-04-26	19496	20292	\N	\N
29854	SPECIFIC_DAY	5	2	2010-03-26	19496	20292	\N	\N
29827	SPECIFIC_DAY	5	0	2010-05-09	19496	20292	\N	\N
29832	SPECIFIC_DAY	5	0	2010-03-27	19496	20292	\N	\N
29828	SPECIFIC_DAY	5	0	2010-03-21	19496	20292	\N	\N
29833	SPECIFIC_DAY	5	5	2010-04-08	19496	20292	\N	\N
36419	GENERIC_DAY	4	0	2010-07-17	1326	\N	30500	\N
36420	GENERIC_DAY	4	0	2010-07-03	1326	\N	30500	\N
36421	GENERIC_DAY	4	9	2010-07-12	1326	\N	30500	\N
36422	GENERIC_DAY	4	4	2010-07-02	1326	\N	30500	\N
36423	GENERIC_DAY	4	9	2010-06-29	1326	\N	30500	\N
36424	GENERIC_DAY	4	0	2010-06-27	1326	\N	30500	\N
36425	GENERIC_DAY	4	9	2010-06-30	1326	\N	30500	\N
36426	GENERIC_DAY	4	2	2010-07-21	1326	\N	30500	\N
36427	GENERIC_DAY	4	9	2010-07-19	1326	\N	30500	\N
36428	GENERIC_DAY	4	0	2010-07-04	1326	\N	30500	\N
36429	GENERIC_DAY	4	9	2010-07-15	1326	\N	30500	\N
36430	GENERIC_DAY	4	0	2010-06-26	1326	\N	30500	\N
36431	GENERIC_DAY	4	4	2010-07-16	1326	\N	30500	\N
36432	GENERIC_DAY	4	9	2010-07-01	1326	\N	30500	\N
36433	GENERIC_DAY	4	9	2010-07-13	1326	\N	30500	\N
36434	GENERIC_DAY	4	9	2010-07-14	1326	\N	30500	\N
36435	GENERIC_DAY	4	9	2010-06-28	1326	\N	30500	\N
36436	GENERIC_DAY	4	0	2010-07-18	1326	\N	30500	\N
36437	GENERIC_DAY	4	9	2010-07-20	1326	\N	30500	\N
34164	SPECIFIC_DAY	7	4	2010-05-11	19498	30469	\N	\N
34157	SPECIFIC_DAY	7	4	2010-04-13	19498	30469	\N	\N
33833	SPECIFIC_DAY	7	4	2010-05-06	19498	30469	\N	\N
33834	SPECIFIC_DAY	7	0	2010-05-17	19498	30469	\N	\N
34142	SPECIFIC_DAY	7	4	2010-05-24	19498	30469	\N	\N
33815	SPECIFIC_DAY	7	0	2010-04-11	19498	30469	\N	\N
34167	SPECIFIC_DAY	7	0	2010-03-21	19498	30469	\N	\N
34171	SPECIFIC_DAY	7	4	2010-03-29	19498	30469	\N	\N
33812	SPECIFIC_DAY	7	4	2010-03-10	19498	30469	\N	\N
34139	SPECIFIC_DAY	7	2	2010-03-19	19498	30469	\N	\N
33832	SPECIFIC_DAY	7	2	2010-04-02	19498	30469	\N	\N
33817	SPECIFIC_DAY	7	0	2010-05-01	19498	30469	\N	\N
34152	SPECIFIC_DAY	7	4	2010-04-07	19498	30469	\N	\N
33820	SPECIFIC_DAY	7	0	2010-03-13	19498	30469	\N	\N
34140	SPECIFIC_DAY	7	4	2010-05-05	19498	30469	\N	\N
34154	SPECIFIC_DAY	7	4	2010-04-21	19498	30469	\N	\N
33822	SPECIFIC_DAY	7	2	2010-05-25	19498	30469	\N	\N
34179	SPECIFIC_DAY	7	0	2010-05-08	19498	30469	\N	\N
34184	SPECIFIC_DAY	7	0	2010-04-18	19498	30469	\N	\N
34138	SPECIFIC_DAY	7	4	2010-03-31	19498	30469	\N	\N
33825	SPECIFIC_DAY	7	4	2010-04-08	19498	30469	\N	\N
29875	SPECIFIC_DAY	5	0	2010-03-14	19496	20292	\N	\N
29876	SPECIFIC_DAY	5	5	2010-03-18	19496	20292	\N	\N
35830	GENERIC_DAY	5	9	2010-04-22	1326	\N	30498	\N
35871	GENERIC_DAY	5	9	2010-04-29	1326	\N	30498	\N
36384	GENERIC_DAY	4	0	2010-06-06	1326	\N	30499	\N
36385	GENERIC_DAY	4	9	2010-06-01	1326	\N	30499	\N
36386	GENERIC_DAY	4	9	2010-05-24	1326	\N	30499	\N
59030	GENERIC_DAY	2	8	2010-05-25	1314	\N	20241	\N
59031	GENERIC_DAY	2	0	2010-05-29	1314	\N	20241	\N
59032	GENERIC_DAY	2	8	2010-06-04	1314	\N	20241	\N
36387	GENERIC_DAY	4	9	2010-06-24	1326	\N	30499	\N
36388	GENERIC_DAY	4	0	2010-05-30	1326	\N	30499	\N
34169	SPECIFIC_DAY	7	4	2010-03-23	19498	30469	\N	\N
33828	SPECIFIC_DAY	7	4	2010-05-10	19498	30469	\N	\N
34143	SPECIFIC_DAY	7	4	2010-05-18	19498	30469	\N	\N
34159	SPECIFIC_DAY	7	0	2010-05-23	19498	30469	\N	\N
59033	GENERIC_DAY	2	8	2010-06-07	1314	\N	20241	\N
59034	GENERIC_DAY	2	8	2010-06-02	1314	\N	20241	\N
59035	GENERIC_DAY	2	8	2010-06-03	1314	\N	20241	\N
59036	GENERIC_DAY	2	8	2010-05-28	1314	\N	20241	\N
59037	GENERIC_DAY	2	0	2010-06-05	1314	\N	20241	\N
34176	SPECIFIC_DAY	7	0	2010-04-24	19498	30469	\N	\N
34173	SPECIFIC_DAY	7	4	2010-03-09	19498	30469	\N	\N
34190	SPECIFIC_DAY	7	4	2010-03-30	19498	30469	\N	\N
34174	SPECIFIC_DAY	7	2	2010-04-30	19498	30469	\N	\N
34187	SPECIFIC_DAY	7	0	2010-03-27	19498	30469	\N	\N
34153	SPECIFIC_DAY	7	0	2010-03-28	19498	30469	\N	\N
34183	SPECIFIC_DAY	7	0	2010-03-14	19498	30469	\N	\N
33823	SPECIFIC_DAY	7	4	2010-05-13	19498	30469	\N	\N
33829	SPECIFIC_DAY	7	4	2010-04-12	19498	30469	\N	\N
33827	SPECIFIC_DAY	7	4	2010-03-22	19498	30469	\N	\N
34180	SPECIFIC_DAY	7	2	2010-04-23	19498	30469	\N	\N
34160	SPECIFIC_DAY	7	2	2010-03-12	19498	30469	\N	\N
33814	SPECIFIC_DAY	7	4	2010-03-16	19498	30469	\N	\N
34163	SPECIFIC_DAY	7	0	2010-05-15	19498	30469	\N	\N
34192	SPECIFIC_DAY	7	4	2010-03-08	19498	30469	\N	\N
33816	SPECIFIC_DAY	7	4	2010-04-15	19498	30469	\N	\N
33826	SPECIFIC_DAY	7	4	2010-04-27	19498	30469	\N	\N
36389	GENERIC_DAY	4	0	2010-06-13	1326	\N	30499	\N
36390	GENERIC_DAY	4	9	2010-06-17	1326	\N	30499	\N
36391	GENERIC_DAY	4	9	2010-06-21	1326	\N	30499	\N
59038	GENERIC_DAY	2	8	2010-05-31	1314	\N	20241	\N
59039	GENERIC_DAY	2	0	2010-05-30	1314	\N	20241	\N
59040	GENERIC_DAY	2	8	2010-06-09	1314	\N	20241	\N
59041	GENERIC_DAY	2	0	2010-06-06	1314	\N	20241	\N
59042	GENERIC_DAY	2	8	2010-06-01	1314	\N	20241	\N
59043	GENERIC_DAY	2	4	2010-06-10	1314	\N	20241	\N
59044	GENERIC_DAY	2	8	2010-05-26	1314	\N	20241	\N
36392	GENERIC_DAY	4	0	2010-05-23	1326	\N	30499	\N
36393	GENERIC_DAY	4	4	2010-05-28	1326	\N	30499	\N
36394	GENERIC_DAY	4	9	2010-06-09	1326	\N	30499	\N
36395	GENERIC_DAY	4	9	2010-06-16	1326	\N	30499	\N
33821	SPECIFIC_DAY	7	4	2010-03-11	19498	30469	\N	\N
34168	SPECIFIC_DAY	7	0	2010-05-16	19498	30469	\N	\N
34188	SPECIFIC_DAY	7	4	2010-03-18	19498	30469	\N	\N
34158	SPECIFIC_DAY	7	4	2010-05-12	19498	30469	\N	\N
34145	SPECIFIC_DAY	7	2	2010-05-21	19498	30469	\N	\N
33819	SPECIFIC_DAY	7	4	2010-03-25	19498	30469	\N	\N
34149	SPECIFIC_DAY	7	4	2010-04-28	19498	30469	\N	\N
33831	SPECIFIC_DAY	7	4	2010-03-17	19498	30469	\N	\N
34162	SPECIFIC_DAY	7	0	2010-03-20	19498	30469	\N	\N
36438	GENERIC_DAY	4	6	2010-08-12	1328	\N	36161	\N
36439	GENERIC_DAY	4	1	2010-10-01	1328	\N	36161	\N
36440	GENERIC_DAY	4	6	2010-10-04	1328	\N	36161	\N
36441	GENERIC_DAY	4	6	2010-09-29	1328	\N	36161	\N
36442	GENERIC_DAY	4	6	2010-09-01	1328	\N	36161	\N
36443	GENERIC_DAY	4	6	2010-09-20	1328	\N	36161	\N
36444	GENERIC_DAY	4	6	2010-07-26	1328	\N	36161	\N
36445	GENERIC_DAY	4	6	2010-08-04	1328	\N	36161	\N
36446	GENERIC_DAY	4	6	2010-09-28	1328	\N	36161	\N
36447	GENERIC_DAY	4	6	2010-09-16	1328	\N	36161	\N
36448	GENERIC_DAY	4	6	2010-07-29	1328	\N	36161	\N
36449	GENERIC_DAY	4	1	2010-07-30	1328	\N	36161	\N
36450	GENERIC_DAY	4	6	2010-07-27	1328	\N	36161	\N
36451	GENERIC_DAY	4	6	2010-08-05	1328	\N	36161	\N
36452	GENERIC_DAY	4	6	2010-08-23	1328	\N	36161	\N
36453	GENERIC_DAY	4	6	2010-08-02	1328	\N	36161	\N
36454	GENERIC_DAY	4	6	2010-09-14	1328	\N	36161	\N
36455	GENERIC_DAY	4	1	2010-09-17	1328	\N	36161	\N
36456	GENERIC_DAY	4	6	2010-09-08	1328	\N	36161	\N
36457	GENERIC_DAY	4	5	2010-10-11	1328	\N	36161	\N
36458	GENERIC_DAY	4	1	2010-09-10	1328	\N	36161	\N
36459	GENERIC_DAY	4	6	2010-10-05	1328	\N	36161	\N
36460	GENERIC_DAY	4	1	2010-08-20	1328	\N	36161	\N
36461	GENERIC_DAY	4	6	2010-08-03	1328	\N	36161	\N
36462	GENERIC_DAY	4	6	2010-08-26	1328	\N	36161	\N
36463	GENERIC_DAY	4	6	2010-09-30	1328	\N	36161	\N
36464	GENERIC_DAY	4	1	2010-08-27	1328	\N	36161	\N
36465	GENERIC_DAY	4	6	2010-09-21	1328	\N	36161	\N
36466	GENERIC_DAY	4	5	2010-10-07	1328	\N	36161	\N
36467	GENERIC_DAY	4	6	2010-08-16	1328	\N	36161	\N
36468	GENERIC_DAY	4	6	2010-09-09	1328	\N	36161	\N
36469	GENERIC_DAY	4	6	2010-08-19	1328	\N	36161	\N
36470	GENERIC_DAY	4	6	2010-08-10	1328	\N	36161	\N
36471	GENERIC_DAY	4	1	2010-09-24	1328	\N	36161	\N
36472	GENERIC_DAY	4	5	2010-10-13	1328	\N	36161	\N
36473	GENERIC_DAY	4	6	2010-09-13	1328	\N	36161	\N
36474	GENERIC_DAY	4	6	2010-09-22	1328	\N	36161	\N
36475	GENERIC_DAY	4	6	2010-09-02	1328	\N	36161	\N
36476	GENERIC_DAY	4	5	2010-10-14	1328	\N	36161	\N
36477	GENERIC_DAY	4	6	2010-09-23	1328	\N	36161	\N
36478	GENERIC_DAY	4	6	2010-10-06	1328	\N	36161	\N
36479	GENERIC_DAY	4	6	2010-08-25	1328	\N	36161	\N
36480	GENERIC_DAY	4	6	2010-08-30	1328	\N	36161	\N
36481	GENERIC_DAY	4	6	2010-09-27	1328	\N	36161	\N
36482	GENERIC_DAY	4	6	2010-08-24	1328	\N	36161	\N
36483	GENERIC_DAY	4	6	2010-07-28	1328	\N	36161	\N
36484	GENERIC_DAY	4	5	2010-10-12	1328	\N	36161	\N
36485	GENERIC_DAY	4	6	2010-07-22	1328	\N	36161	\N
36486	GENERIC_DAY	4	6	2010-08-11	1328	\N	36161	\N
36487	GENERIC_DAY	4	6	2010-08-31	1328	\N	36161	\N
36488	GENERIC_DAY	4	6	2010-09-06	1328	\N	36161	\N
36489	GENERIC_DAY	4	1	2010-09-03	1328	\N	36161	\N
36490	GENERIC_DAY	4	6	2010-08-17	1328	\N	36161	\N
36491	GENERIC_DAY	4	6	2010-08-09	1328	\N	36161	\N
36492	GENERIC_DAY	4	6	2010-09-15	1328	\N	36161	\N
36493	GENERIC_DAY	4	1	2010-07-23	1328	\N	36161	\N
36494	GENERIC_DAY	4	1	2010-08-06	1328	\N	36161	\N
36495	GENERIC_DAY	4	6	2010-08-18	1328	\N	36161	\N
36496	GENERIC_DAY	4	1	2010-08-13	1328	\N	36161	\N
36497	GENERIC_DAY	4	6	2010-09-07	1328	\N	36161	\N
36580	GENERIC_DAY	3	0	2010-08-01	1328	\N	36164	\N
36581	GENERIC_DAY	3	0	2010-08-29	1328	\N	36164	\N
36582	GENERIC_DAY	3	5	2010-08-02	1328	\N	36164	\N
36396	GENERIC_DAY	4	0	2010-06-05	1326	\N	30499	\N
36397	GENERIC_DAY	4	4	2010-06-18	1326	\N	30499	\N
36398	GENERIC_DAY	4	0	2010-06-19	1326	\N	30499	\N
36399	GENERIC_DAY	4	9	2010-06-14	1326	\N	30499	\N
36400	GENERIC_DAY	4	9	2010-06-02	1326	\N	30499	\N
36401	GENERIC_DAY	4	9	2010-05-25	1326	\N	30499	\N
36402	GENERIC_DAY	4	9	2010-06-03	1326	\N	30499	\N
36403	GENERIC_DAY	4	9	2010-05-27	1326	\N	30499	\N
36404	GENERIC_DAY	4	9	2010-06-08	1326	\N	30499	\N
36405	GENERIC_DAY	4	0	2010-05-22	1326	\N	30499	\N
36406	GENERIC_DAY	4	9	2010-06-22	1326	\N	30499	\N
36407	GENERIC_DAY	4	0	2010-06-20	1326	\N	30499	\N
36408	GENERIC_DAY	4	4	2010-06-25	1326	\N	30499	\N
36409	GENERIC_DAY	4	4	2010-06-04	1326	\N	30499	\N
36410	GENERIC_DAY	4	9	2010-06-07	1326	\N	30499	\N
36411	GENERIC_DAY	4	9	2010-05-26	1326	\N	30499	\N
36583	GENERIC_DAY	3	2	2010-08-27	1328	\N	36164	\N
36584	GENERIC_DAY	3	2	2010-07-23	1328	\N	36164	\N
36585	GENERIC_DAY	3	5	2010-08-25	1328	\N	36164	\N
36586	GENERIC_DAY	3	5	2010-07-29	1328	\N	36164	\N
36587	GENERIC_DAY	3	5	2010-08-26	1328	\N	36164	\N
36588	GENERIC_DAY	3	5	2010-08-16	1328	\N	36164	\N
36589	GENERIC_DAY	3	0	2010-08-28	1328	\N	36164	\N
36590	GENERIC_DAY	3	5	2010-07-27	1328	\N	36164	\N
36591	GENERIC_DAY	3	5	2010-08-11	1328	\N	36164	\N
36592	GENERIC_DAY	3	0	2010-07-31	1328	\N	36164	\N
36593	GENERIC_DAY	3	0	2010-08-22	1328	\N	36164	\N
36594	GENERIC_DAY	3	5	2010-08-03	1328	\N	36164	\N
36595	GENERIC_DAY	3	5	2010-08-30	1328	\N	36164	\N
36596	GENERIC_DAY	3	5	2010-07-22	1328	\N	36164	\N
36597	GENERIC_DAY	3	0	2010-08-21	1328	\N	36164	\N
36598	GENERIC_DAY	3	5	2010-07-28	1328	\N	36164	\N
36599	GENERIC_DAY	3	5	2010-08-19	1328	\N	36164	\N
29859	SPECIFIC_DAY	5	5	2010-03-31	19496	20292	\N	\N
29857	SPECIFIC_DAY	5	5	2010-04-20	19496	20292	\N	\N
29867	SPECIFIC_DAY	5	5	2010-03-23	19496	20292	\N	\N
29887	SPECIFIC_DAY	5	5	2010-04-05	19496	20292	\N	\N
29864	SPECIFIC_DAY	5	0	2010-04-17	19496	20292	\N	\N
29856	SPECIFIC_DAY	5	5	2010-04-14	19496	20292	\N	\N
29858	SPECIFIC_DAY	5	5	2010-04-15	19496	20292	\N	\N
29870	SPECIFIC_DAY	5	0	2010-03-20	19496	20292	\N	\N
29874	SPECIFIC_DAY	5	0	2010-03-28	19496	20292	\N	\N
29861	SPECIFIC_DAY	5	5	2010-04-29	19496	20292	\N	\N
29877	SPECIFIC_DAY	5	5	2010-03-11	19496	20292	\N	\N
29883	SPECIFIC_DAY	5	5	2010-03-29	19496	20292	\N	\N
29868	SPECIFIC_DAY	5	5	2010-03-24	19496	20292	\N	\N
29878	SPECIFIC_DAY	5	2	2010-04-16	19496	20292	\N	\N
29860	SPECIFIC_DAY	5	2	2010-03-19	19496	20292	\N	\N
29888	SPECIFIC_DAY	5	2	2010-03-12	19496	20292	\N	\N
29880	SPECIFIC_DAY	5	2	2010-04-09	19496	20292	\N	\N
29881	SPECIFIC_DAY	5	2	2010-04-02	19496	20292	\N	\N
29863	SPECIFIC_DAY	5	0	2010-04-11	19496	20292	\N	\N
29866	SPECIFIC_DAY	5	5	2010-05-03	19496	20292	\N	\N
29889	SPECIFIC_DAY	5	5	2010-04-27	19496	20292	\N	\N
29882	SPECIFIC_DAY	5	5	2010-03-22	19496	20292	\N	\N
29865	SPECIFIC_DAY	5	0	2010-04-10	19496	20292	\N	\N
29855	SPECIFIC_DAY	5	5	2010-03-16	19496	20292	\N	\N
29862	SPECIFIC_DAY	5	5	2010-05-05	19496	20292	\N	\N
29885	SPECIFIC_DAY	5	0	2010-04-25	19496	20292	\N	\N
29879	SPECIFIC_DAY	5	5	2010-03-25	19496	20292	\N	\N
29886	SPECIFIC_DAY	5	5	2010-03-15	19496	20292	\N	\N
29873	SPECIFIC_DAY	5	0	2010-05-01	19496	20292	\N	\N
29884	SPECIFIC_DAY	5	5	2010-05-04	19496	20292	\N	\N
29872	SPECIFIC_DAY	5	2	2010-05-07	19496	20292	\N	\N
29869	SPECIFIC_DAY	5	5	2010-05-06	19496	20292	\N	\N
29871	SPECIFIC_DAY	5	0	2010-03-13	19496	20292	\N	\N
36600	GENERIC_DAY	3	5	2010-08-04	1328	\N	36164	\N
36601	GENERIC_DAY	3	5	2010-08-31	1328	\N	36164	\N
36602	GENERIC_DAY	3	0	2010-07-24	1328	\N	36164	\N
36603	GENERIC_DAY	3	0	2010-08-15	1328	\N	36164	\N
36604	GENERIC_DAY	3	5	2010-08-17	1328	\N	36164	\N
33134	GENERIC_DAY	3	7	2010-09-22	1322	\N	30466	\N
33138	GENERIC_DAY	3	7	2010-10-07	1322	\N	30466	\N
33167	GENERIC_DAY	3	7	2010-09-09	1322	\N	30466	\N
33158	GENERIC_DAY	3	7	2010-10-12	1322	\N	30466	\N
33146	GENERIC_DAY	3	7	2010-09-28	1322	\N	30466	\N
33159	GENERIC_DAY	3	7	2010-10-14	1322	\N	30466	\N
33151	GENERIC_DAY	3	7	2010-09-06	1322	\N	30466	\N
33135	GENERIC_DAY	3	7	2010-08-31	1322	\N	30466	\N
33154	GENERIC_DAY	3	7	2010-10-13	1322	\N	30466	\N
33162	GENERIC_DAY	3	2	2010-10-08	1322	\N	30466	\N
33133	GENERIC_DAY	3	8	2010-08-12	1322	\N	30466	\N
33165	GENERIC_DAY	3	7	2010-09-13	1322	\N	30466	\N
33164	GENERIC_DAY	3	3	2010-08-13	1322	\N	30466	\N
33161	GENERIC_DAY	3	2	2010-08-27	1322	\N	30466	\N
33141	GENERIC_DAY	3	7	2010-09-23	1322	\N	30466	\N
33166	GENERIC_DAY	3	7	2010-09-14	1322	\N	30466	\N
33132	GENERIC_DAY	3	8	2010-08-18	1322	\N	30466	\N
33148	GENERIC_DAY	3	7	2010-10-05	1322	\N	30466	\N
33125	GENERIC_DAY	3	2	2010-09-17	1322	\N	30466	\N
33163	GENERIC_DAY	3	7	2010-09-30	1322	\N	30466	\N
33126	GENERIC_DAY	3	8	2010-08-17	1322	\N	30466	\N
33153	GENERIC_DAY	3	7	2010-09-07	1322	\N	30466	\N
33149	GENERIC_DAY	3	7	2010-10-11	1322	\N	30466	\N
33123	GENERIC_DAY	3	7	2010-08-30	1322	\N	30466	\N
33130	GENERIC_DAY	3	2	2010-09-03	1322	\N	30466	\N
33129	GENERIC_DAY	3	2	2010-09-24	1322	\N	30466	\N
33155	GENERIC_DAY	3	7	2010-08-25	1322	\N	30466	\N
33137	GENERIC_DAY	3	7	2010-09-27	1322	\N	30466	\N
33150	GENERIC_DAY	3	7	2010-09-29	1322	\N	30466	\N
33144	GENERIC_DAY	3	7	2010-09-01	1322	\N	30466	\N
33160	GENERIC_DAY	3	7	2010-09-21	1322	\N	30466	\N
33139	GENERIC_DAY	3	7	2010-09-16	1322	\N	30466	\N
33142	GENERIC_DAY	3	7	2010-10-06	1322	\N	30466	\N
33127	GENERIC_DAY	3	7	2010-08-26	1322	\N	30466	\N
33147	GENERIC_DAY	3	8	2010-08-16	1322	\N	30466	\N
33185	GENERIC_DAY	3	5	2010-08-24	1322	\N	30467	\N
33168	GENERIC_DAY	3	0	2010-08-21	1322	\N	30467	\N
33183	GENERIC_DAY	3	5	2010-08-23	1322	\N	30467	\N
33170	GENERIC_DAY	3	2	2010-08-20	1322	\N	30467	\N
33172	GENERIC_DAY	3	2	2010-08-13	1322	\N	30467	\N
33179	GENERIC_DAY	3	0	2010-08-28	1322	\N	30467	\N
33184	GENERIC_DAY	3	2	2010-08-27	1322	\N	30467	\N
33174	GENERIC_DAY	3	5	2010-08-11	1322	\N	30467	\N
33696	GENERIC_DAY	1	0	2010-11-14	1322	\N	30468	\N
33697	GENERIC_DAY	1	0	2010-12-12	1322	\N	30468	\N
33698	GENERIC_DAY	1	4	2010-12-10	1322	\N	30468	\N
33699	GENERIC_DAY	1	9	2010-11-23	1322	\N	30468	\N
33700	GENERIC_DAY	1	9	2010-11-29	1322	\N	30468	\N
33701	GENERIC_DAY	1	9	2010-11-15	1322	\N	30468	\N
33702	GENERIC_DAY	1	0	2010-11-28	1322	\N	30468	\N
33703	GENERIC_DAY	1	0	2010-12-11	1322	\N	30468	\N
33704	GENERIC_DAY	1	9	2010-12-14	1322	\N	30468	\N
33705	GENERIC_DAY	1	0	2010-12-04	1322	\N	30468	\N
33706	GENERIC_DAY	1	0	2010-11-21	1322	\N	30468	\N
33707	GENERIC_DAY	1	9	2010-11-16	1322	\N	30468	\N
33708	GENERIC_DAY	1	9	2010-12-15	1322	\N	30468	\N
33709	GENERIC_DAY	1	9	2010-12-08	1322	\N	30468	\N
33710	GENERIC_DAY	1	0	2010-11-20	1322	\N	30468	\N
33711	GENERIC_DAY	1	4	2010-12-03	1322	\N	30468	\N
33712	GENERIC_DAY	1	9	2010-11-17	1322	\N	30468	\N
33713	GENERIC_DAY	1	9	2010-12-16	1322	\N	30468	\N
33714	GENERIC_DAY	1	4	2010-11-19	1322	\N	30468	\N
33715	GENERIC_DAY	1	9	2010-12-07	1322	\N	30468	\N
33716	GENERIC_DAY	1	9	2010-11-24	1322	\N	30468	\N
33717	GENERIC_DAY	1	9	2010-11-22	1322	\N	30468	\N
33718	GENERIC_DAY	1	9	2010-12-06	1322	\N	30468	\N
33719	GENERIC_DAY	1	9	2010-11-30	1322	\N	30468	\N
33720	GENERIC_DAY	1	9	2010-11-18	1322	\N	30468	\N
33721	GENERIC_DAY	1	9	2010-12-09	1322	\N	30468	\N
33722	GENERIC_DAY	1	9	2010-11-25	1322	\N	30468	\N
33723	GENERIC_DAY	1	9	2010-12-13	1322	\N	30468	\N
33724	GENERIC_DAY	1	0	2010-11-27	1322	\N	30468	\N
33725	GENERIC_DAY	1	9	2010-12-02	1322	\N	30468	\N
35823	GENERIC_DAY	5	0	2010-03-28	1326	\N	30498	\N
35858	GENERIC_DAY	5	0	2010-04-18	1326	\N	30498	\N
35877	GENERIC_DAY	5	9	2010-04-15	1326	\N	30498	\N
35824	GENERIC_DAY	5	0	2010-04-11	1326	\N	30498	\N
35833	GENERIC_DAY	5	9	2010-04-14	1326	\N	30498	\N
35851	GENERIC_DAY	5	9	2010-03-25	1326	\N	30498	\N
35847	GENERIC_DAY	5	9	2010-04-27	1326	\N	30498	\N
35863	GENERIC_DAY	5	9	2010-03-30	1326	\N	30498	\N
35879	GENERIC_DAY	5	9	2010-03-22	1326	\N	30498	\N
35838	GENERIC_DAY	5	0	2010-05-02	1326	\N	30498	\N
35860	GENERIC_DAY	5	9	2010-04-13	1326	\N	30498	\N
35827	GENERIC_DAY	5	9	2010-04-01	1326	\N	30498	\N
35837	GENERIC_DAY	5	9	2010-04-26	1326	\N	30498	\N
35861	GENERIC_DAY	5	9	2010-04-07	1326	\N	30498	\N
35834	GENERIC_DAY	5	9	2010-04-20	1326	\N	30498	\N
35856	GENERIC_DAY	5	4	2010-04-30	1326	\N	30498	\N
35846	GENERIC_DAY	5	4	2010-03-26	1326	\N	30498	\N
35845	GENERIC_DAY	5	9	2010-04-12	1326	\N	30498	\N
35855	GENERIC_DAY	5	0	2010-05-08	1326	\N	30498	\N
35859	GENERIC_DAY	5	0	2010-05-15	1326	\N	30498	\N
35857	GENERIC_DAY	5	4	2010-04-02	1326	\N	30498	\N
33726	GENERIC_DAY	1	0	2010-12-05	1322	\N	30468	\N
33727	GENERIC_DAY	1	4	2010-12-17	1322	\N	30468	\N
33728	GENERIC_DAY	1	4	2010-11-26	1322	\N	30468	\N
33729	GENERIC_DAY	1	9	2010-12-01	1322	\N	30468	\N
31510	GENERIC_DAY	4	9	2010-03-30	1324	\N	30421	\N
31519	GENERIC_DAY	4	9	2010-04-22	1324	\N	30421	\N
31542	GENERIC_DAY	4	9	2010-04-07	1324	\N	30421	\N
31567	GENERIC_DAY	4	9	2010-03-24	1324	\N	30421	\N
31546	GENERIC_DAY	4	4	2010-04-30	1324	\N	30421	\N
31522	GENERIC_DAY	4	0	2010-05-01	1324	\N	30421	\N
31513	GENERIC_DAY	4	9	2010-04-12	1324	\N	30421	\N
31516	GENERIC_DAY	4	9	2010-04-29	1324	\N	30421	\N
31543	GENERIC_DAY	4	9	2010-03-15	1324	\N	30421	\N
31539	GENERIC_DAY	4	0	2010-03-28	1324	\N	30421	\N
35866	GENERIC_DAY	5	4	2010-05-07	1326	\N	30498	\N
35864	GENERIC_DAY	5	9	2010-05-03	1326	\N	30498	\N
35841	GENERIC_DAY	5	9	2010-05-10	1326	\N	30498	\N
35848	GENERIC_DAY	5	9	2010-05-13	1326	\N	30498	\N
35862	GENERIC_DAY	5	9	2010-05-11	1326	\N	30498	\N
38794	GENERIC_DAY	3	9	2010-04-05	1330	\N	36197	\N
38795	GENERIC_DAY	3	4	2010-03-26	1330	\N	36197	\N
38796	GENERIC_DAY	3	0	2010-05-02	1330	\N	36197	\N
38797	GENERIC_DAY	3	0	2010-04-04	1330	\N	36197	\N
38798	GENERIC_DAY	3	0	2010-04-24	1330	\N	36197	\N
38799	GENERIC_DAY	3	9	2010-05-18	1330	\N	36197	\N
38800	GENERIC_DAY	3	0	2010-04-18	1330	\N	36197	\N
38801	GENERIC_DAY	3	9	2010-04-08	1330	\N	36197	\N
35826	GENERIC_DAY	5	4	2010-04-23	1326	\N	30498	\N
35832	GENERIC_DAY	5	9	2010-04-05	1326	\N	30498	\N
35854	GENERIC_DAY	5	9	2010-03-23	1326	\N	30498	\N
35829	GENERIC_DAY	5	9	2010-05-04	1326	\N	30498	\N
35872	GENERIC_DAY	5	9	2010-05-05	1326	\N	30498	\N
35867	GENERIC_DAY	5	9	2010-05-18	1326	\N	30498	\N
35844	GENERIC_DAY	5	9	2010-04-21	1326	\N	30498	\N
35840	GENERIC_DAY	5	4	2010-05-14	1326	\N	30498	\N
35835	GENERIC_DAY	5	0	2010-04-10	1326	\N	30498	\N
36814	SPECIFIC_DAY	4	0	2010-04-18	19500	36168	\N	\N
36815	SPECIFIC_DAY	4	0	2010-04-04	19500	36168	\N	\N
36816	SPECIFIC_DAY	4	0	2010-05-01	19500	36168	\N	\N
36817	SPECIFIC_DAY	4	4	2010-04-21	19500	36168	\N	\N
36818	SPECIFIC_DAY	4	2	2010-03-19	19500	36168	\N	\N
36819	SPECIFIC_DAY	4	2	2010-04-02	19500	36168	\N	\N
36820	SPECIFIC_DAY	4	4	2010-05-05	19500	36168	\N	\N
36821	SPECIFIC_DAY	4	0	2010-04-25	19500	36168	\N	\N
36822	SPECIFIC_DAY	4	4	2010-05-06	19500	36168	\N	\N
36823	SPECIFIC_DAY	4	0	2010-03-28	19500	36168	\N	\N
36824	SPECIFIC_DAY	4	0	2010-05-03	19500	36168	\N	\N
36825	SPECIFIC_DAY	4	4	2010-03-10	19500	36168	\N	\N
36826	SPECIFIC_DAY	4	4	2010-05-11	19500	36168	\N	\N
36827	SPECIFIC_DAY	4	4	2010-04-28	19500	36168	\N	\N
36828	SPECIFIC_DAY	4	0	2010-03-14	19500	36168	\N	\N
36829	SPECIFIC_DAY	4	4	2010-03-02	19500	36168	\N	\N
36830	SPECIFIC_DAY	4	2	2010-04-30	19500	36168	\N	\N
36831	SPECIFIC_DAY	4	4	2010-03-17	19500	36168	\N	\N
36832	SPECIFIC_DAY	4	4	2010-05-04	19500	36168	\N	\N
36833	SPECIFIC_DAY	4	4	2010-04-19	19500	36168	\N	\N
36834	SPECIFIC_DAY	4	4	2010-05-13	19500	36168	\N	\N
36835	SPECIFIC_DAY	4	2	2010-05-07	19500	36168	\N	\N
36836	SPECIFIC_DAY	4	0	2010-05-02	19500	36168	\N	\N
36837	SPECIFIC_DAY	4	2	2010-03-05	19500	36168	\N	\N
36838	SPECIFIC_DAY	4	0	2010-05-16	19500	36168	\N	\N
36839	SPECIFIC_DAY	4	2	2010-04-09	19500	36168	\N	\N
36840	SPECIFIC_DAY	4	4	2010-03-09	19500	36168	\N	\N
36841	SPECIFIC_DAY	4	4	2010-03-31	19500	36168	\N	\N
36842	SPECIFIC_DAY	4	4	2010-04-27	19500	36168	\N	\N
36843	SPECIFIC_DAY	4	2	2010-04-16	19500	36168	\N	\N
36844	SPECIFIC_DAY	4	2	2010-05-14	19500	36168	\N	\N
36845	SPECIFIC_DAY	4	2	2010-05-19	19500	36168	\N	\N
36846	SPECIFIC_DAY	4	0	2010-05-08	19500	36168	\N	\N
36847	SPECIFIC_DAY	4	0	2010-03-13	19500	36168	\N	\N
36848	SPECIFIC_DAY	4	4	2010-03-01	19500	36168	\N	\N
36849	SPECIFIC_DAY	4	4	2010-03-16	19500	36168	\N	\N
36850	SPECIFIC_DAY	4	4	2010-03-25	19500	36168	\N	\N
36851	SPECIFIC_DAY	4	4	2010-04-06	19500	36168	\N	\N
39566	GENERIC_DAY	2	2	2010-08-20	1332	\N	36216	\N
39567	GENERIC_DAY	2	5	2010-08-24	1332	\N	36216	\N
39568	GENERIC_DAY	2	5	2010-08-05	1332	\N	36216	\N
39569	GENERIC_DAY	2	5	2010-08-26	1332	\N	36216	\N
39570	GENERIC_DAY	2	5	2010-08-12	1332	\N	36216	\N
39571	GENERIC_DAY	2	0	2010-07-24	1332	\N	36216	\N
39572	GENERIC_DAY	2	5	2010-08-11	1332	\N	36216	\N
39573	GENERIC_DAY	2	5	2010-08-16	1332	\N	36216	\N
39574	GENERIC_DAY	2	5	2010-08-23	1332	\N	36216	\N
39575	GENERIC_DAY	2	5	2010-08-19	1332	\N	36216	\N
39576	GENERIC_DAY	2	0	2010-08-22	1332	\N	36216	\N
39577	GENERIC_DAY	2	2	2010-08-13	1332	\N	36216	\N
39578	GENERIC_DAY	2	5	2010-08-09	1332	\N	36216	\N
39579	GENERIC_DAY	2	5	2010-08-17	1332	\N	36216	\N
39580	GENERIC_DAY	2	5	2010-08-03	1332	\N	36216	\N
39581	GENERIC_DAY	2	5	2010-08-18	1332	\N	36216	\N
39582	GENERIC_DAY	2	0	2010-08-28	1332	\N	36216	\N
39583	GENERIC_DAY	2	5	2010-07-19	1332	\N	36216	\N
39584	GENERIC_DAY	2	2	2010-07-23	1332	\N	36216	\N
39585	GENERIC_DAY	2	5	2010-07-21	1332	\N	36216	\N
39586	GENERIC_DAY	2	0	2010-08-21	1332	\N	36216	\N
39587	GENERIC_DAY	2	0	2010-08-15	1332	\N	36216	\N
39588	GENERIC_DAY	2	0	2010-08-07	1332	\N	36216	\N
39589	GENERIC_DAY	2	0	2010-07-25	1332	\N	36216	\N
39590	GENERIC_DAY	2	5	2010-08-02	1332	\N	36216	\N
39591	GENERIC_DAY	2	2	2010-07-16	1332	\N	36216	\N
39592	GENERIC_DAY	2	0	2010-08-08	1332	\N	36216	\N
39593	GENERIC_DAY	2	0	2010-08-29	1332	\N	36216	\N
39594	GENERIC_DAY	2	5	2010-08-31	1332	\N	36216	\N
39595	GENERIC_DAY	2	0	2010-07-17	1332	\N	36216	\N
39596	GENERIC_DAY	2	0	2010-08-14	1332	\N	36216	\N
39597	GENERIC_DAY	2	5	2010-08-10	1332	\N	36216	\N
39598	GENERIC_DAY	2	5	2010-07-20	1332	\N	36216	\N
39599	GENERIC_DAY	2	5	2010-08-25	1332	\N	36216	\N
39600	GENERIC_DAY	2	5	2010-07-22	1332	\N	36216	\N
39601	GENERIC_DAY	2	2	2010-08-27	1332	\N	36216	\N
39602	GENERIC_DAY	2	5	2010-08-30	1332	\N	36216	\N
39603	GENERIC_DAY	2	0	2010-07-18	1332	\N	36216	\N
38750	GENERIC_DAY	3	0	2010-04-10	1330	\N	36197	\N
38751	GENERIC_DAY	3	8	2010-05-24	1330	\N	36197	\N
38752	GENERIC_DAY	3	0	2010-04-11	1330	\N	36197	\N
38753	GENERIC_DAY	3	9	2010-04-21	1330	\N	36197	\N
38754	GENERIC_DAY	3	0	2010-03-27	1330	\N	36197	\N
38755	GENERIC_DAY	3	9	2010-03-29	1330	\N	36197	\N
38756	GENERIC_DAY	3	0	2010-04-17	1330	\N	36197	\N
38757	GENERIC_DAY	3	0	2010-04-25	1330	\N	36197	\N
38758	GENERIC_DAY	3	9	2010-05-05	1330	\N	36197	\N
38759	GENERIC_DAY	3	9	2010-04-20	1330	\N	36197	\N
38760	GENERIC_DAY	3	0	2010-05-23	1330	\N	36197	\N
38761	GENERIC_DAY	3	0	2010-05-22	1330	\N	36197	\N
38762	GENERIC_DAY	3	9	2010-03-22	1330	\N	36197	\N
38763	GENERIC_DAY	3	9	2010-05-04	1330	\N	36197	\N
38764	GENERIC_DAY	3	4	2010-05-21	1330	\N	36197	\N
38765	GENERIC_DAY	3	9	2010-03-30	1330	\N	36197	\N
38766	GENERIC_DAY	3	9	2010-04-19	1330	\N	36197	\N
38767	GENERIC_DAY	3	9	2010-05-12	1330	\N	36197	\N
38768	GENERIC_DAY	3	9	2010-04-06	1330	\N	36197	\N
38769	GENERIC_DAY	3	9	2010-04-22	1330	\N	36197	\N
38770	GENERIC_DAY	3	9	2010-05-10	1330	\N	36197	\N
38771	GENERIC_DAY	3	9	2010-04-07	1330	\N	36197	\N
38772	GENERIC_DAY	3	9	2010-04-01	1330	\N	36197	\N
38773	GENERIC_DAY	3	0	2010-05-16	1330	\N	36197	\N
38774	GENERIC_DAY	3	0	2010-04-03	1330	\N	36197	\N
38775	GENERIC_DAY	3	4	2010-04-23	1330	\N	36197	\N
38776	GENERIC_DAY	3	9	2010-03-24	1330	\N	36197	\N
38777	GENERIC_DAY	3	0	2010-05-08	1330	\N	36197	\N
38778	GENERIC_DAY	3	9	2010-04-29	1330	\N	36197	\N
38779	GENERIC_DAY	3	0	2010-05-09	1330	\N	36197	\N
38780	GENERIC_DAY	3	0	2010-03-28	1330	\N	36197	\N
38781	GENERIC_DAY	3	9	2010-04-26	1330	\N	36197	\N
38782	GENERIC_DAY	3	9	2010-05-20	1330	\N	36197	\N
38783	GENERIC_DAY	3	4	2010-04-02	1330	\N	36197	\N
38784	GENERIC_DAY	3	4	2010-04-30	1330	\N	36197	\N
38785	GENERIC_DAY	3	9	2010-04-15	1330	\N	36197	\N
38786	GENERIC_DAY	3	9	2010-04-28	1330	\N	36197	\N
38787	GENERIC_DAY	3	4	2010-04-16	1330	\N	36197	\N
38788	GENERIC_DAY	3	9	2010-04-14	1330	\N	36197	\N
38789	GENERIC_DAY	3	0	2010-05-01	1330	\N	36197	\N
38790	GENERIC_DAY	3	4	2010-04-09	1330	\N	36197	\N
38791	GENERIC_DAY	3	9	2010-05-19	1330	\N	36197	\N
38792	GENERIC_DAY	3	0	2010-05-15	1330	\N	36197	\N
38793	GENERIC_DAY	3	9	2010-05-13	1330	\N	36197	\N
38802	GENERIC_DAY	3	9	2010-04-27	1330	\N	36197	\N
38803	GENERIC_DAY	3	9	2010-03-25	1330	\N	36197	\N
38804	GENERIC_DAY	3	4	2010-05-07	1330	\N	36197	\N
38805	GENERIC_DAY	3	9	2010-05-11	1330	\N	36197	\N
38806	GENERIC_DAY	3	9	2010-03-31	1330	\N	36197	\N
38807	GENERIC_DAY	3	9	2010-05-06	1330	\N	36197	\N
38808	GENERIC_DAY	3	4	2010-06-25	1330	\N	36198	\N
38809	GENERIC_DAY	3	9	2010-06-17	1330	\N	36198	\N
38810	GENERIC_DAY	3	0	2010-06-26	1330	\N	36198	\N
38811	GENERIC_DAY	3	0	2010-06-12	1330	\N	36198	\N
38812	GENERIC_DAY	3	0	2010-06-13	1330	\N	36198	\N
38813	GENERIC_DAY	3	9	2010-06-21	1330	\N	36198	\N
38814	GENERIC_DAY	3	4	2010-06-04	1330	\N	36198	\N
38815	GENERIC_DAY	3	9	2010-06-08	1330	\N	36198	\N
38816	GENERIC_DAY	3	9	2010-06-14	1330	\N	36198	\N
38817	GENERIC_DAY	3	4	2010-06-18	1330	\N	36198	\N
38818	GENERIC_DAY	3	0	2010-06-27	1330	\N	36198	\N
38819	GENERIC_DAY	3	9	2010-05-25	1330	\N	36198	\N
38820	GENERIC_DAY	3	9	2010-06-03	1330	\N	36198	\N
38821	GENERIC_DAY	3	9	2010-05-27	1330	\N	36198	\N
38822	GENERIC_DAY	3	9	2010-05-26	1330	\N	36198	\N
38823	GENERIC_DAY	3	0	2010-05-30	1330	\N	36198	\N
38824	GENERIC_DAY	3	9	2010-06-28	1330	\N	36198	\N
38825	GENERIC_DAY	3	9	2010-06-23	1330	\N	36198	\N
38826	GENERIC_DAY	3	9	2010-06-09	1330	\N	36198	\N
38827	GENERIC_DAY	3	9	2010-06-01	1330	\N	36198	\N
38828	GENERIC_DAY	3	9	2010-06-22	1330	\N	36198	\N
38829	GENERIC_DAY	3	0	2010-06-06	1330	\N	36198	\N
38830	GENERIC_DAY	3	9	2010-06-02	1330	\N	36198	\N
38831	GENERIC_DAY	3	9	2010-06-10	1330	\N	36198	\N
38832	GENERIC_DAY	3	9	2010-06-24	1330	\N	36198	\N
38833	GENERIC_DAY	3	0	2010-05-29	1330	\N	36198	\N
38834	GENERIC_DAY	3	9	2010-06-07	1330	\N	36198	\N
38835	GENERIC_DAY	3	0	2010-06-20	1330	\N	36198	\N
38836	GENERIC_DAY	3	0	2010-06-19	1330	\N	36198	\N
38837	GENERIC_DAY	3	9	2010-05-31	1330	\N	36198	\N
38838	GENERIC_DAY	3	9	2010-06-16	1330	\N	36198	\N
38839	GENERIC_DAY	3	4	2010-05-28	1330	\N	36198	\N
38840	GENERIC_DAY	3	4	2010-06-11	1330	\N	36198	\N
38841	GENERIC_DAY	3	9	2010-06-15	1330	\N	36198	\N
38842	GENERIC_DAY	3	0	2010-06-05	1330	\N	36198	\N
38843	GENERIC_DAY	3	9	2010-07-06	1330	\N	36199	\N
38844	GENERIC_DAY	3	9	2010-07-08	1330	\N	36199	\N
38845	GENERIC_DAY	3	9	2010-07-14	1330	\N	36199	\N
38846	GENERIC_DAY	3	0	2010-07-04	1330	\N	36199	\N
38847	GENERIC_DAY	3	0	2010-07-11	1330	\N	36199	\N
38848	GENERIC_DAY	3	9	2010-07-13	1330	\N	36199	\N
38849	GENERIC_DAY	3	4	2010-07-09	1330	\N	36199	\N
38850	GENERIC_DAY	3	9	2010-07-07	1330	\N	36199	\N
38851	GENERIC_DAY	3	9	2010-06-29	1330	\N	36199	\N
38852	GENERIC_DAY	3	0	2010-07-10	1330	\N	36199	\N
38853	GENERIC_DAY	3	9	2010-06-30	1330	\N	36199	\N
38854	GENERIC_DAY	3	2	2010-07-15	1330	\N	36199	\N
38855	GENERIC_DAY	3	9	2010-07-12	1330	\N	36199	\N
38856	GENERIC_DAY	3	9	2010-07-05	1330	\N	36199	\N
38857	GENERIC_DAY	3	4	2010-07-02	1330	\N	36199	\N
38858	GENERIC_DAY	3	0	2010-07-03	1330	\N	36199	\N
38859	GENERIC_DAY	3	9	2010-07-01	1330	\N	36199	\N
39521	GENERIC_DAY	2	5	2010-07-21	1332	\N	36215	\N
39522	GENERIC_DAY	2	5	2010-09-13	1332	\N	36215	\N
39523	GENERIC_DAY	2	5	2010-09-16	1332	\N	36215	\N
39524	GENERIC_DAY	2	5	2010-09-27	1332	\N	36215	\N
39525	GENERIC_DAY	2	5	2010-09-02	1332	\N	36215	\N
39526	GENERIC_DAY	2	5	2010-09-06	1332	\N	36215	\N
39527	GENERIC_DAY	2	5	2010-08-02	1332	\N	36215	\N
39528	GENERIC_DAY	2	5	2010-08-18	1332	\N	36215	\N
39529	GENERIC_DAY	2	5	2010-08-26	1332	\N	36215	\N
39530	GENERIC_DAY	2	5	2010-08-16	1332	\N	36215	\N
39531	GENERIC_DAY	2	5	2010-10-04	1332	\N	36215	\N
39532	GENERIC_DAY	2	5	2010-08-24	1332	\N	36215	\N
39533	GENERIC_DAY	2	5	2010-08-11	1332	\N	36215	\N
39534	GENERIC_DAY	2	5	2010-08-04	1332	\N	36215	\N
39535	GENERIC_DAY	2	5	2010-08-10	1332	\N	36215	\N
39536	GENERIC_DAY	2	4	2010-10-06	1332	\N	36215	\N
39537	GENERIC_DAY	2	5	2010-08-25	1332	\N	36215	\N
39538	GENERIC_DAY	2	5	2010-07-20	1332	\N	36215	\N
39539	GENERIC_DAY	2	5	2010-09-07	1332	\N	36215	\N
39540	GENERIC_DAY	2	4	2010-10-07	1332	\N	36215	\N
39541	GENERIC_DAY	2	5	2010-08-05	1332	\N	36215	\N
39542	GENERIC_DAY	2	5	2010-08-09	1332	\N	36215	\N
39543	GENERIC_DAY	2	5	2010-09-09	1332	\N	36215	\N
39544	GENERIC_DAY	2	5	2010-08-23	1332	\N	36215	\N
39545	GENERIC_DAY	2	5	2010-09-23	1332	\N	36215	\N
39546	GENERIC_DAY	2	5	2010-07-19	1332	\N	36215	\N
39547	GENERIC_DAY	2	5	2010-09-20	1332	\N	36215	\N
39548	GENERIC_DAY	2	5	2010-08-12	1332	\N	36215	\N
39549	GENERIC_DAY	2	5	2010-08-31	1332	\N	36215	\N
39550	GENERIC_DAY	2	5	2010-08-03	1332	\N	36215	\N
39551	GENERIC_DAY	2	5	2010-08-17	1332	\N	36215	\N
39552	GENERIC_DAY	2	5	2010-08-19	1332	\N	36215	\N
39553	GENERIC_DAY	2	5	2010-09-28	1332	\N	36215	\N
39554	GENERIC_DAY	2	5	2010-09-29	1332	\N	36215	\N
39555	GENERIC_DAY	2	5	2010-09-30	1332	\N	36215	\N
39556	GENERIC_DAY	2	5	2010-09-14	1332	\N	36215	\N
39557	GENERIC_DAY	2	4	2010-10-11	1332	\N	36215	\N
39558	GENERIC_DAY	2	5	2010-09-01	1332	\N	36215	\N
39559	GENERIC_DAY	2	5	2010-08-30	1332	\N	36215	\N
39560	GENERIC_DAY	2	5	2010-09-22	1332	\N	36215	\N
39561	GENERIC_DAY	2	5	2010-07-22	1332	\N	36215	\N
39562	GENERIC_DAY	2	5	2010-09-21	1332	\N	36215	\N
39563	GENERIC_DAY	2	4	2010-10-05	1332	\N	36215	\N
39564	GENERIC_DAY	2	5	2010-09-15	1332	\N	36215	\N
39565	GENERIC_DAY	2	5	2010-08-04	1332	\N	36216	\N
39604	GENERIC_DAY	2	2	2010-08-06	1332	\N	36216	\N
36813	SPECIFIC_DAY	4	4	2010-04-13	19500	36168	\N	\N
36852	SPECIFIC_DAY	4	4	2010-04-22	19500	36168	\N	\N
36853	SPECIFIC_DAY	4	0	2010-04-10	19500	36168	\N	\N
36854	SPECIFIC_DAY	4	0	2010-05-09	19500	36168	\N	\N
36855	SPECIFIC_DAY	4	4	2010-04-15	19500	36168	\N	\N
36856	SPECIFIC_DAY	4	2	2010-04-23	19500	36168	\N	\N
36857	SPECIFIC_DAY	4	4	2010-05-12	19500	36168	\N	\N
36858	SPECIFIC_DAY	4	0	2010-04-03	19500	36168	\N	\N
36859	SPECIFIC_DAY	4	2	2010-03-12	19500	36168	\N	\N
36860	SPECIFIC_DAY	4	4	2010-03-04	19500	36168	\N	\N
36861	SPECIFIC_DAY	4	0	2010-03-06	19500	36168	\N	\N
36862	SPECIFIC_DAY	4	4	2010-03-29	19500	36168	\N	\N
36863	SPECIFIC_DAY	4	4	2010-03-30	19500	36168	\N	\N
36864	SPECIFIC_DAY	4	4	2010-04-20	19500	36168	\N	\N
37269	SPECIFIC_DAY	4	4	2010-03-08	19500	36168	\N	\N
37270	SPECIFIC_DAY	4	4	2010-03-15	19500	36168	\N	\N
37271	SPECIFIC_DAY	4	4	2010-05-10	19500	36168	\N	\N
37272	SPECIFIC_DAY	4	4	2010-04-26	19500	36168	\N	\N
37273	SPECIFIC_DAY	4	0	2010-05-15	19500	36168	\N	\N
37274	SPECIFIC_DAY	4	4	2010-04-14	19500	36168	\N	\N
37275	SPECIFIC_DAY	4	0	2010-04-11	19500	36168	\N	\N
37276	SPECIFIC_DAY	4	0	2010-03-20	19500	36168	\N	\N
37277	SPECIFIC_DAY	4	4	2010-03-23	19500	36168	\N	\N
37278	SPECIFIC_DAY	4	4	2010-03-11	19500	36168	\N	\N
37279	SPECIFIC_DAY	4	0	2010-03-21	19500	36168	\N	\N
37280	SPECIFIC_DAY	4	0	2010-04-17	19500	36168	\N	\N
37281	SPECIFIC_DAY	4	4	2010-04-08	19500	36168	\N	\N
37282	SPECIFIC_DAY	4	4	2010-04-29	19500	36168	\N	\N
37283	SPECIFIC_DAY	4	0	2010-03-07	19500	36168	\N	\N
37284	SPECIFIC_DAY	4	4	2010-05-18	19500	36168	\N	\N
37285	SPECIFIC_DAY	4	4	2010-04-01	19500	36168	\N	\N
37286	SPECIFIC_DAY	4	4	2010-03-22	19500	36168	\N	\N
37287	SPECIFIC_DAY	4	4	2010-03-18	19500	36168	\N	\N
37288	SPECIFIC_DAY	4	4	2010-04-05	19500	36168	\N	\N
37289	SPECIFIC_DAY	4	2	2010-03-26	19500	36168	\N	\N
37290	SPECIFIC_DAY	4	0	2010-04-24	19500	36168	\N	\N
37291	SPECIFIC_DAY	4	4	2010-04-07	19500	36168	\N	\N
37292	SPECIFIC_DAY	4	4	2010-03-24	19500	36168	\N	\N
37293	SPECIFIC_DAY	4	0	2010-03-27	19500	36168	\N	\N
37294	SPECIFIC_DAY	4	4	2010-04-12	19500	36168	\N	\N
37295	SPECIFIC_DAY	4	4	2010-03-03	19500	36168	\N	\N
37296	SPECIFIC_DAY	4	0	2010-05-17	19500	36168	\N	\N
39989	GENERIC_DAY	0	5	2010-11-29	1332	\N	36219	\N
39990	GENERIC_DAY	0	0	2010-12-11	1332	\N	36219	\N
39991	GENERIC_DAY	0	5	2010-10-28	1332	\N	36219	\N
39992	GENERIC_DAY	0	5	2010-10-18	1332	\N	36219	\N
39993	GENERIC_DAY	0	0	2010-11-07	1332	\N	36219	\N
39994	GENERIC_DAY	0	5	2010-11-09	1332	\N	36219	\N
39995	GENERIC_DAY	0	5	2010-11-25	1332	\N	36219	\N
39996	GENERIC_DAY	0	0	2010-11-13	1332	\N	36219	\N
39997	GENERIC_DAY	0	5	2010-11-23	1332	\N	36219	\N
39998	GENERIC_DAY	0	5	2010-10-20	1332	\N	36219	\N
39999	GENERIC_DAY	0	0	2010-10-31	1332	\N	36219	\N
40000	GENERIC_DAY	0	2	2010-11-19	1332	\N	36219	\N
40001	GENERIC_DAY	0	5	2010-12-16	1332	\N	36219	\N
40002	GENERIC_DAY	0	0	2010-10-23	1332	\N	36219	\N
40003	GENERIC_DAY	0	5	2010-12-06	1332	\N	36219	\N
40004	GENERIC_DAY	0	0	2010-11-14	1332	\N	36219	\N
40005	GENERIC_DAY	0	0	2010-10-30	1332	\N	36219	\N
40006	GENERIC_DAY	0	5	2010-11-15	1332	\N	36219	\N
40007	GENERIC_DAY	0	5	2010-10-26	1332	\N	36219	\N
40008	GENERIC_DAY	0	5	2010-10-27	1332	\N	36219	\N
40009	GENERIC_DAY	0	5	2010-11-18	1332	\N	36219	\N
40010	GENERIC_DAY	0	5	2010-12-02	1332	\N	36219	\N
40011	GENERIC_DAY	0	0	2010-11-21	1332	\N	36219	\N
40012	GENERIC_DAY	0	0	2010-10-24	1332	\N	36219	\N
40013	GENERIC_DAY	0	0	2010-11-28	1332	\N	36219	\N
40014	GENERIC_DAY	0	2	2010-12-17	1332	\N	36219	\N
40015	GENERIC_DAY	0	5	2010-11-22	1332	\N	36219	\N
40016	GENERIC_DAY	0	5	2010-12-14	1332	\N	36219	\N
40017	GENERIC_DAY	0	5	2010-11-17	1332	\N	36219	\N
40018	GENERIC_DAY	0	2	2010-12-10	1332	\N	36219	\N
40019	GENERIC_DAY	0	5	2010-12-08	1332	\N	36219	\N
40020	GENERIC_DAY	0	0	2010-12-05	1332	\N	36219	\N
40021	GENERIC_DAY	0	5	2010-10-19	1332	\N	36219	\N
40022	GENERIC_DAY	0	2	2010-10-15	1332	\N	36219	\N
40023	GENERIC_DAY	0	2	2010-11-12	1332	\N	36219	\N
40024	GENERIC_DAY	0	5	2010-10-25	1332	\N	36219	\N
40025	GENERIC_DAY	0	5	2010-12-15	1332	\N	36219	\N
40026	GENERIC_DAY	0	0	2010-11-06	1332	\N	36219	\N
40027	GENERIC_DAY	0	5	2010-11-10	1332	\N	36219	\N
40028	GENERIC_DAY	0	2	2010-10-22	1332	\N	36219	\N
40029	GENERIC_DAY	0	5	2010-11-24	1332	\N	36219	\N
40030	GENERIC_DAY	0	2	2010-11-05	1332	\N	36219	\N
40031	GENERIC_DAY	0	0	2010-12-12	1332	\N	36219	\N
40032	GENERIC_DAY	0	5	2010-11-04	1332	\N	36219	\N
40033	GENERIC_DAY	0	5	2010-11-01	1332	\N	36219	\N
40034	GENERIC_DAY	0	0	2010-10-17	1332	\N	36219	\N
40035	GENERIC_DAY	0	0	2010-11-27	1332	\N	36219	\N
40036	GENERIC_DAY	0	5	2010-12-09	1332	\N	36219	\N
40037	GENERIC_DAY	0	5	2010-11-02	1332	\N	36219	\N
40038	GENERIC_DAY	0	5	2010-12-01	1332	\N	36219	\N
40039	GENERIC_DAY	0	5	2010-11-08	1332	\N	36219	\N
40040	GENERIC_DAY	0	2	2010-12-03	1332	\N	36219	\N
40041	GENERIC_DAY	0	5	2010-11-30	1332	\N	36219	\N
40042	GENERIC_DAY	0	0	2010-10-16	1332	\N	36219	\N
40043	GENERIC_DAY	0	5	2010-11-16	1332	\N	36219	\N
40044	GENERIC_DAY	0	5	2010-12-07	1332	\N	36219	\N
40045	GENERIC_DAY	0	2	2010-11-26	1332	\N	36219	\N
40046	GENERIC_DAY	0	0	2010-12-04	1332	\N	36219	\N
40047	GENERIC_DAY	0	5	2010-12-13	1332	\N	36219	\N
40048	GENERIC_DAY	0	5	2010-10-21	1332	\N	36219	\N
40049	GENERIC_DAY	0	2	2010-10-29	1332	\N	36219	\N
40050	GENERIC_DAY	0	5	2010-11-03	1332	\N	36219	\N
40051	GENERIC_DAY	0	0	2010-11-20	1332	\N	36219	\N
40052	GENERIC_DAY	0	5	2010-11-11	1332	\N	36219	\N
59045	GENERIC_DAY	1	6	2010-09-13	1316	\N	59186	\N
59046	GENERIC_DAY	1	8	2010-09-03	1316	\N	59186	\N
59047	GENERIC_DAY	1	8	2010-07-29	1316	\N	59186	\N
59048	GENERIC_DAY	1	8	2010-08-17	1316	\N	59186	\N
59049	GENERIC_DAY	1	8	2010-07-02	1316	\N	59186	\N
59050	GENERIC_DAY	1	0	2010-07-24	1316	\N	59186	\N
59051	GENERIC_DAY	1	0	2010-06-06	1316	\N	59186	\N
59052	GENERIC_DAY	1	8	2010-05-31	1316	\N	59186	\N
59053	GENERIC_DAY	1	8	2010-08-06	1316	\N	59186	\N
59054	GENERIC_DAY	1	8	2010-07-26	1316	\N	59186	\N
59055	GENERIC_DAY	1	8	2010-07-21	1316	\N	59186	\N
59056	GENERIC_DAY	1	8	2010-06-07	1316	\N	59186	\N
59057	GENERIC_DAY	1	0	2010-07-18	1316	\N	59186	\N
59058	GENERIC_DAY	1	8	2010-07-20	1316	\N	59186	\N
59059	GENERIC_DAY	1	8	2010-07-05	1316	\N	59186	\N
59060	GENERIC_DAY	1	8	2010-05-11	1316	\N	59186	\N
59061	GENERIC_DAY	1	0	2010-09-04	1316	\N	59186	\N
59062	GENERIC_DAY	1	8	2010-06-22	1316	\N	59186	\N
59063	GENERIC_DAY	1	8	2010-08-23	1316	\N	59186	\N
59064	GENERIC_DAY	1	8	2010-04-27	1316	\N	59186	\N
59065	GENERIC_DAY	1	8	2010-09-02	1316	\N	59186	\N
59066	GENERIC_DAY	1	8	2010-07-08	1316	\N	59186	\N
59067	GENERIC_DAY	1	8	2010-07-15	1316	\N	59186	\N
59068	GENERIC_DAY	1	8	2010-08-27	1316	\N	59186	\N
59069	GENERIC_DAY	1	8	2010-06-29	1316	\N	59186	\N
59070	GENERIC_DAY	1	8	2010-06-18	1316	\N	59186	\N
59071	GENERIC_DAY	1	0	2010-05-22	1316	\N	59186	\N
59006	GENERIC_DAY	2	8	2010-05-13	1314	\N	20240	\N
59007	GENERIC_DAY	2	8	2010-04-19	1314	\N	20240	\N
59008	GENERIC_DAY	2	8	2010-04-22	1314	\N	20240	\N
59009	GENERIC_DAY	2	0	2010-04-25	1314	\N	20240	\N
59010	GENERIC_DAY	2	0	2010-05-08	1314	\N	20240	\N
59011	GENERIC_DAY	2	8	2010-05-14	1314	\N	20240	\N
59012	GENERIC_DAY	2	8	2010-05-03	1314	\N	20240	\N
59013	GENERIC_DAY	2	0	2010-05-16	1314	\N	20240	\N
56590	GENERIC_DAY	2	0	2010-10-24	19496	\N	55957	\N
56591	GENERIC_DAY	2	3	2010-10-28	1322	\N	55957	\N
56592	GENERIC_DAY	2	3	2010-11-03	1322	\N	55957	\N
56593	GENERIC_DAY	2	2	2010-10-29	1322	\N	55957	\N
56594	GENERIC_DAY	2	0	2010-10-31	19496	\N	55957	\N
56595	GENERIC_DAY	2	3	2010-11-01	1322	\N	55957	\N
56596	GENERIC_DAY	2	4	2010-11-16	19496	\N	55957	\N
56597	GENERIC_DAY	2	3	2010-11-11	1324	\N	55957	\N
56598	GENERIC_DAY	2	3	2010-11-11	19496	\N	55957	\N
56599	GENERIC_DAY	2	0	2010-11-07	1322	\N	55957	\N
56600	GENERIC_DAY	2	3	2010-11-02	1322	\N	55957	\N
56601	GENERIC_DAY	2	0	2010-11-07	1324	\N	55957	\N
56602	GENERIC_DAY	2	3	2010-10-26	1324	\N	55957	\N
56603	GENERIC_DAY	2	1	2010-10-29	1324	\N	55957	\N
56604	GENERIC_DAY	2	2	2010-11-05	1322	\N	55957	\N
56605	GENERIC_DAY	2	0	2010-11-14	1324	\N	55957	\N
56606	GENERIC_DAY	2	3	2010-11-04	1324	\N	55957	\N
56607	GENERIC_DAY	2	3	2010-10-27	1322	\N	55957	\N
56608	GENERIC_DAY	2	3	2010-11-11	1322	\N	55957	\N
56609	GENERIC_DAY	2	0	2010-10-23	1324	\N	55957	\N
56610	GENERIC_DAY	2	3	2010-11-01	19496	\N	55957	\N
56611	GENERIC_DAY	2	3	2010-10-27	19496	\N	55957	\N
56612	GENERIC_DAY	2	3	2010-10-21	1324	\N	55957	\N
24434	SPECIFIC_DAY	10	9	2010-03-29	19494	20247	\N	\N
24440	SPECIFIC_DAY	10	9	2010-04-05	19494	20247	\N	\N
24422	SPECIFIC_DAY	10	9	2010-03-25	19494	20247	\N	\N
24423	SPECIFIC_DAY	10	0	2010-03-27	19494	20247	\N	\N
24421	SPECIFIC_DAY	10	9	2010-03-24	19494	20247	\N	\N
24431	SPECIFIC_DAY	10	9	2010-03-23	19494	20247	\N	\N
24450	SPECIFIC_DAY	10	9	2010-04-07	19494	20247	\N	\N
24420	SPECIFIC_DAY	10	0	2010-03-21	19494	20247	\N	\N
24446	SPECIFIC_DAY	10	0	2010-03-14	19494	20247	\N	\N
24427	SPECIFIC_DAY	10	9	2010-04-08	19494	20247	\N	\N
24432	SPECIFIC_DAY	10	9	2010-04-01	19494	20247	\N	\N
24439	SPECIFIC_DAY	10	0	2010-03-20	19494	20247	\N	\N
24449	SPECIFIC_DAY	10	0	2010-03-13	19494	20247	\N	\N
24425	SPECIFIC_DAY	10	4	2010-04-02	19494	20247	\N	\N
24436	SPECIFIC_DAY	10	9	2010-03-11	19494	20247	\N	\N
24424	SPECIFIC_DAY	10	9	2010-03-18	19494	20247	\N	\N
24428	SPECIFIC_DAY	10	9	2010-03-17	19494	20247	\N	\N
24437	SPECIFIC_DAY	10	0	2010-04-04	19494	20247	\N	\N
24445	SPECIFIC_DAY	10	9	2010-03-09	19494	20247	\N	\N
24443	SPECIFIC_DAY	10	9	2010-04-06	19494	20247	\N	\N
24430	SPECIFIC_DAY	10	0	2010-04-03	19494	20247	\N	\N
24435	SPECIFIC_DAY	10	4	2010-03-19	19494	20247	\N	\N
24442	SPECIFIC_DAY	10	9	2010-03-30	19494	20247	\N	\N
24448	SPECIFIC_DAY	10	9	2010-03-15	19494	20247	\N	\N
24444	SPECIFIC_DAY	10	9	2010-03-31	19494	20247	\N	\N
59338	GENERIC_DAY	1	0	2010-05-16	1316	\N	59186	\N
59339	GENERIC_DAY	1	8	2010-09-07	1316	\N	59186	\N
59340	GENERIC_DAY	1	8	2010-05-24	1316	\N	59186	\N
59341	GENERIC_DAY	1	8	2010-06-14	1316	\N	59186	\N
59342	GENERIC_DAY	1	8	2010-07-22	1316	\N	59186	\N
59343	GENERIC_DAY	1	0	2010-06-19	1316	\N	59186	\N
59344	GENERIC_DAY	1	8	2010-07-19	1316	\N	59186	\N
59345	GENERIC_DAY	1	0	2010-08-08	1316	\N	59186	\N
59346	GENERIC_DAY	1	0	2010-09-12	1316	\N	59186	\N
59347	GENERIC_DAY	1	8	2010-05-10	1316	\N	59186	\N
59348	GENERIC_DAY	1	0	2010-07-10	1316	\N	59186	\N
59349	GENERIC_DAY	1	0	2010-05-23	1316	\N	59186	\N
59350	GENERIC_DAY	1	0	2010-08-28	1316	\N	59186	\N
59351	GENERIC_DAY	1	8	2010-05-28	1316	\N	59186	\N
59352	GENERIC_DAY	1	8	2010-05-27	1316	\N	59186	\N
59353	GENERIC_DAY	1	8	2010-08-03	1316	\N	59186	\N
59354	GENERIC_DAY	1	8	2010-08-02	1316	\N	59186	\N
59355	GENERIC_DAY	1	0	2010-08-21	1316	\N	59186	\N
59356	GENERIC_DAY	1	0	2010-06-27	1316	\N	59186	\N
59357	GENERIC_DAY	1	0	2010-08-07	1316	\N	59186	\N
59358	GENERIC_DAY	1	8	2010-08-12	1316	\N	59186	\N
44085	GENERIC_DAY	10	8	2010-03-31	1314	\N	20210	\N
44060	GENERIC_DAY	10	8	2010-04-13	1314	\N	20210	\N
44067	GENERIC_DAY	10	8	2010-04-14	1314	\N	20210	\N
44057	GENERIC_DAY	10	8	2010-03-24	1314	\N	20210	\N
44083	GENERIC_DAY	10	8	2010-03-15	1314	\N	20210	\N
44076	GENERIC_DAY	10	8	2010-03-23	1314	\N	20210	\N
44058	GENERIC_DAY	10	8	2010-04-02	1314	\N	20210	\N
44081	GENERIC_DAY	10	8	2010-03-29	1314	\N	20210	\N
44086	GENERIC_DAY	10	0	2010-03-21	1314	\N	20210	\N
44084	GENERIC_DAY	10	0	2010-03-20	1314	\N	20210	\N
44072	GENERIC_DAY	10	8	2010-04-12	1314	\N	20210	\N
44059	GENERIC_DAY	10	8	2010-03-19	1314	\N	20210	\N
44062	GENERIC_DAY	10	8	2010-03-09	1314	\N	20210	\N
44056	GENERIC_DAY	10	8	2010-03-18	1314	\N	20210	\N
44070	GENERIC_DAY	10	0	2010-03-14	1314	\N	20210	\N
44064	GENERIC_DAY	10	8	2010-03-17	1314	\N	20210	\N
44080	GENERIC_DAY	10	8	2010-03-25	1314	\N	20210	\N
44065	GENERIC_DAY	10	0	2010-04-04	1314	\N	20210	\N
44078	GENERIC_DAY	10	0	2010-03-28	1314	\N	20210	\N
44066	GENERIC_DAY	10	8	2010-03-11	1314	\N	20210	\N
44054	GENERIC_DAY	10	0	2010-04-03	1314	\N	20210	\N
44073	GENERIC_DAY	10	8	2010-04-15	1314	\N	20210	\N
44061	GENERIC_DAY	10	0	2010-03-27	1314	\N	20210	\N
56672	GENERIC_DAY	2	0	2010-05-15	1318	\N	20275	\N
56673	GENERIC_DAY	2	0	2010-06-19	1318	\N	20275	\N
56674	GENERIC_DAY	2	0	2010-05-23	1318	\N	20275	\N
56675	GENERIC_DAY	2	9	2010-05-19	1318	\N	20275	\N
59072	GENERIC_DAY	1	8	2010-08-30	1316	\N	59186	\N
59073	GENERIC_DAY	1	8	2010-06-02	1316	\N	59186	\N
59074	GENERIC_DAY	1	8	2010-07-06	1316	\N	59186	\N
59075	GENERIC_DAY	1	8	2010-08-31	1316	\N	59186	\N
59076	GENERIC_DAY	1	8	2010-08-11	1316	\N	59186	\N
59077	GENERIC_DAY	1	8	2010-06-17	1316	\N	59186	\N
59078	GENERIC_DAY	1	8	2010-07-07	1316	\N	59186	\N
25764	GENERIC_DAY	9	0	2010-04-24	1318	\N	20274	\N
25797	GENERIC_DAY	9	4	2010-03-12	1318	\N	20274	\N
25768	GENERIC_DAY	9	9	2010-03-24	1318	\N	20274	\N
25755	GENERIC_DAY	9	0	2010-04-18	1318	\N	20274	\N
25774	GENERIC_DAY	9	9	2010-05-06	1318	\N	20274	\N
25789	GENERIC_DAY	9	9	2010-04-20	1318	\N	20274	\N
25803	GENERIC_DAY	9	9	2010-03-10	1318	\N	20274	\N
56656	GENERIC_DAY	2	9	2010-05-25	1318	\N	20275	\N
56657	GENERIC_DAY	2	0	2010-06-20	1318	\N	20275	\N
56658	GENERIC_DAY	2	9	2010-06-03	1318	\N	20275	\N
56659	GENERIC_DAY	2	0	2010-05-16	1318	\N	20275	\N
56660	GENERIC_DAY	2	0	2010-05-30	1318	\N	20275	\N
56661	GENERIC_DAY	2	0	2010-06-06	1318	\N	20275	\N
56662	GENERIC_DAY	2	4	2010-06-18	1318	\N	20275	\N
56663	GENERIC_DAY	2	9	2010-05-31	1318	\N	20275	\N
56664	GENERIC_DAY	2	0	2010-05-17	1318	\N	20275	\N
56665	GENERIC_DAY	2	9	2010-05-18	1318	\N	20275	\N
56666	GENERIC_DAY	2	9	2010-06-17	1318	\N	20275	\N
56667	GENERIC_DAY	2	9	2010-06-14	1318	\N	20275	\N
56668	GENERIC_DAY	2	9	2010-05-11	1318	\N	20275	\N
56669	GENERIC_DAY	2	9	2010-06-21	1318	\N	20275	\N
56670	GENERIC_DAY	2	4	2010-05-21	1318	\N	20275	\N
56671	GENERIC_DAY	2	9	2010-05-12	1318	\N	20275	\N
56676	GENERIC_DAY	2	9	2010-05-24	1318	\N	20275	\N
56677	GENERIC_DAY	2	0	2010-05-29	1318	\N	20275	\N
56678	GENERIC_DAY	2	4	2010-05-14	1318	\N	20275	\N
56679	GENERIC_DAY	2	0	2010-05-08	1318	\N	20275	\N
56680	GENERIC_DAY	2	4	2010-06-04	1318	\N	20275	\N
56681	GENERIC_DAY	2	9	2010-05-27	1318	\N	20275	\N
59079	GENERIC_DAY	1	0	2010-08-15	1316	\N	59186	\N
59080	GENERIC_DAY	1	8	2010-07-16	1316	\N	59186	\N
59081	GENERIC_DAY	1	8	2010-05-14	1316	\N	59186	\N
59082	GENERIC_DAY	1	8	2010-05-21	1316	\N	59186	\N
59083	GENERIC_DAY	1	8	2010-08-04	1316	\N	59186	\N
59084	GENERIC_DAY	1	8	2010-08-20	1316	\N	59186	\N
59287	GENERIC_DAY	1	8	2010-04-28	1316	\N	59186	\N
59288	GENERIC_DAY	1	0	2010-09-05	1316	\N	59186	\N
59289	GENERIC_DAY	1	8	2010-07-12	1316	\N	59186	\N
59290	GENERIC_DAY	1	8	2010-04-29	1316	\N	59186	\N
56682	GENERIC_DAY	2	9	2010-05-13	1318	\N	20275	\N
56683	GENERIC_DAY	2	4	2010-05-28	1318	\N	20275	\N
56684	GENERIC_DAY	2	9	2010-05-26	1318	\N	20275	\N
56685	GENERIC_DAY	2	9	2010-06-16	1318	\N	20275	\N
56686	GENERIC_DAY	2	9	2010-05-10	1318	\N	20275	\N
59291	GENERIC_DAY	1	8	2010-06-16	1316	\N	59186	\N
59292	GENERIC_DAY	1	0	2010-07-03	1316	\N	59186	\N
59293	GENERIC_DAY	1	0	2010-06-20	1316	\N	59186	\N
59294	GENERIC_DAY	1	8	2010-07-27	1316	\N	59186	\N
59295	GENERIC_DAY	1	0	2010-07-31	1316	\N	59186	\N
59296	GENERIC_DAY	1	0	2010-06-12	1316	\N	59186	\N
59297	GENERIC_DAY	1	8	2010-05-20	1316	\N	59186	\N
59298	GENERIC_DAY	1	0	2010-06-26	1316	\N	59186	\N
59299	GENERIC_DAY	1	8	2010-08-18	1316	\N	59186	\N
59300	GENERIC_DAY	1	8	2010-07-14	1316	\N	59186	\N
59301	GENERIC_DAY	1	8	2010-08-05	1316	\N	59186	\N
59302	GENERIC_DAY	1	0	2010-05-02	1316	\N	59186	\N
59303	GENERIC_DAY	1	0	2010-06-13	1316	\N	59186	\N
59304	GENERIC_DAY	1	8	2010-05-18	1316	\N	59186	\N
59305	GENERIC_DAY	1	8	2010-08-26	1316	\N	59186	\N
59306	GENERIC_DAY	1	8	2010-08-24	1316	\N	59186	\N
59307	GENERIC_DAY	1	8	2010-06-03	1316	\N	59186	\N
59308	GENERIC_DAY	1	0	2010-07-04	1316	\N	59186	\N
59309	GENERIC_DAY	1	0	2010-06-05	1316	\N	59186	\N
59310	GENERIC_DAY	1	8	2010-06-09	1316	\N	59186	\N
59311	GENERIC_DAY	1	8	2010-08-13	1316	\N	59186	\N
56479	GENERIC_DAY	2	6	2010-07-20	1320	\N	20279	\N
56480	GENERIC_DAY	2	5	2010-10-05	1320	\N	20279	\N
56481	GENERIC_DAY	2	6	2010-07-12	1320	\N	20279	\N
56482	GENERIC_DAY	2	5	2010-09-16	1320	\N	20279	\N
56483	GENERIC_DAY	2	6	2010-08-26	1320	\N	20279	\N
56484	GENERIC_DAY	2	1	2010-07-23	1320	\N	20279	\N
56485	GENERIC_DAY	2	5	2010-09-23	1320	\N	20279	\N
56486	GENERIC_DAY	2	6	2010-07-27	1320	\N	20279	\N
56487	GENERIC_DAY	2	6	2010-08-10	1320	\N	20279	\N
56488	GENERIC_DAY	2	6	2010-08-11	1320	\N	20279	\N
56489	GENERIC_DAY	2	5	2010-10-11	1320	\N	20279	\N
56490	GENERIC_DAY	2	5	2010-09-14	1320	\N	20279	\N
56491	GENERIC_DAY	2	5	2010-09-20	1320	\N	20279	\N
56492	GENERIC_DAY	2	5	2010-09-28	1320	\N	20279	\N
56493	GENERIC_DAY	2	6	2010-08-24	1320	\N	20279	\N
56494	GENERIC_DAY	2	5	2010-09-21	1320	\N	20279	\N
56495	GENERIC_DAY	2	5	2010-09-02	1320	\N	20279	\N
56496	GENERIC_DAY	2	1	2010-08-20	1320	\N	20279	\N
56497	GENERIC_DAY	2	5	2010-08-30	1320	\N	20279	\N
56498	GENERIC_DAY	2	5	2010-09-29	1320	\N	20279	\N
56499	GENERIC_DAY	2	6	2010-08-12	1320	\N	20279	\N
56500	GENERIC_DAY	2	1	2010-07-09	1320	\N	20279	\N
56501	GENERIC_DAY	2	5	2010-09-09	1320	\N	20279	\N
56502	GENERIC_DAY	2	6	2010-08-04	1320	\N	20279	\N
56503	GENERIC_DAY	2	5	2010-09-07	1320	\N	20279	\N
56504	GENERIC_DAY	2	5	2010-09-22	1320	\N	20279	\N
56505	GENERIC_DAY	2	6	2010-07-15	1320	\N	20279	\N
56506	GENERIC_DAY	2	6	2010-07-22	1320	\N	20279	\N
56507	GENERIC_DAY	2	6	2010-08-09	1320	\N	20279	\N
56508	GENERIC_DAY	2	6	2010-07-29	1320	\N	20279	\N
56509	GENERIC_DAY	2	5	2010-08-31	1320	\N	20279	\N
56510	GENERIC_DAY	2	6	2010-07-13	1320	\N	20279	\N
56511	GENERIC_DAY	2	1	2010-07-16	1320	\N	20279	\N
56512	GENERIC_DAY	2	6	2010-08-03	1320	\N	20279	\N
56536	GENERIC_DAY	2	0	2010-07-10	1320	\N	20290	\N
56537	GENERIC_DAY	2	5	2010-07-13	1320	\N	20290	\N
56538	GENERIC_DAY	2	0	2010-07-17	1320	\N	20290	\N
56539	GENERIC_DAY	2	5	2010-08-04	1320	\N	20290	\N
56540	GENERIC_DAY	2	0	2010-07-18	1320	\N	20290	\N
56541	GENERIC_DAY	2	2	2010-07-09	1320	\N	20290	\N
56542	GENERIC_DAY	2	5	2010-07-22	1320	\N	20290	\N
56543	GENERIC_DAY	2	5	2010-07-26	1320	\N	20290	\N
56544	GENERIC_DAY	2	5	2010-07-12	1320	\N	20290	\N
56545	GENERIC_DAY	2	5	2010-07-27	1320	\N	20290	\N
56546	GENERIC_DAY	2	0	2010-07-11	1320	\N	20290	\N
56547	GENERIC_DAY	2	3	2010-11-08	1324	\N	55957	\N
56548	GENERIC_DAY	2	3	2010-10-21	19496	\N	55957	\N
56549	GENERIC_DAY	2	1	2010-10-15	19496	\N	55957	\N
56550	GENERIC_DAY	2	0	2010-10-16	1324	\N	55957	\N
56551	GENERIC_DAY	2	3	2010-11-09	1322	\N	55957	\N
56552	GENERIC_DAY	2	3	2010-11-03	19496	\N	55957	\N
56553	GENERIC_DAY	2	1	2010-11-12	1324	\N	55957	\N
56554	GENERIC_DAY	2	5	2010-11-17	1324	\N	55957	\N
56555	GENERIC_DAY	2	0	2010-10-31	1324	\N	55957	\N
56556	GENERIC_DAY	2	0	2010-11-06	19496	\N	55957	\N
56557	GENERIC_DAY	2	0	2010-10-17	19496	\N	55957	\N
56558	GENERIC_DAY	2	3	2010-11-10	19496	\N	55957	\N
56559	GENERIC_DAY	2	0	2010-10-31	1322	\N	55957	\N
56560	GENERIC_DAY	2	0	2010-11-17	1322	\N	55957	\N
56561	GENERIC_DAY	2	3	2010-10-27	1324	\N	55957	\N
56562	GENERIC_DAY	2	3	2010-10-20	19496	\N	55957	\N
56563	GENERIC_DAY	2	3	2010-10-19	19496	\N	55957	\N
56564	GENERIC_DAY	2	2	2010-10-22	1322	\N	55957	\N
56565	GENERIC_DAY	2	3	2010-11-02	19496	\N	55957	\N
56566	GENERIC_DAY	2	1	2010-10-29	19496	\N	55957	\N
56567	GENERIC_DAY	2	3	2010-11-10	1322	\N	55957	\N
56568	GENERIC_DAY	2	0	2010-10-17	1324	\N	55957	\N
56569	GENERIC_DAY	2	0	2010-11-13	1324	\N	55957	\N
56570	GENERIC_DAY	2	3	2010-11-08	19496	\N	55957	\N
56571	GENERIC_DAY	2	3	2010-10-28	1324	\N	55957	\N
56572	GENERIC_DAY	2	3	2010-10-18	1324	\N	55957	\N
56573	GENERIC_DAY	2	4	2010-11-17	19496	\N	55957	\N
56574	GENERIC_DAY	2	0	2010-11-07	19496	\N	55957	\N
56575	GENERIC_DAY	2	3	2010-11-09	1324	\N	55957	\N
56576	GENERIC_DAY	2	0	2010-11-13	1322	\N	55957	\N
56577	GENERIC_DAY	2	0	2010-11-13	19496	\N	55957	\N
56578	GENERIC_DAY	2	0	2010-10-23	19496	\N	55957	\N
56579	GENERIC_DAY	2	3	2010-10-19	1324	\N	55957	\N
56580	GENERIC_DAY	2	0	2010-11-06	1322	\N	55957	\N
56581	GENERIC_DAY	2	3	2010-10-26	19496	\N	55957	\N
56582	GENERIC_DAY	2	0	2010-10-23	1322	\N	55957	\N
56583	GENERIC_DAY	2	0	2010-10-30	1324	\N	55957	\N
56584	GENERIC_DAY	2	0	2010-10-24	1322	\N	55957	\N
56585	GENERIC_DAY	2	3	2010-11-09	19496	\N	55957	\N
56586	GENERIC_DAY	2	5	2010-11-16	1324	\N	55957	\N
56587	GENERIC_DAY	2	0	2010-10-30	19496	\N	55957	\N
56588	GENERIC_DAY	2	0	2010-11-16	1322	\N	55957	\N
56589	GENERIC_DAY	2	0	2010-10-16	1322	\N	55957	\N
56613	GENERIC_DAY	2	3	2010-11-04	19496	\N	55957	\N
56614	GENERIC_DAY	2	5	2010-11-15	1324	\N	55957	\N
56615	GENERIC_DAY	2	3	2010-10-19	1322	\N	55957	\N
56616	GENERIC_DAY	2	4	2010-10-14	19496	\N	55957	\N
56617	GENERIC_DAY	2	3	2010-10-25	1322	\N	55957	\N
56618	GENERIC_DAY	2	1	2010-11-05	1324	\N	55957	\N
56619	GENERIC_DAY	2	1	2010-10-22	1324	\N	55957	\N
56620	GENERIC_DAY	2	0	2010-10-17	1322	\N	55957	\N
56621	GENERIC_DAY	2	3	2010-11-04	1322	\N	55957	\N
56622	GENERIC_DAY	2	0	2010-10-30	1322	\N	55957	\N
56623	GENERIC_DAY	2	0	2010-10-24	1324	\N	55957	\N
56624	GENERIC_DAY	2	0	2010-11-15	1322	\N	55957	\N
56625	GENERIC_DAY	2	2	2010-10-15	1322	\N	55957	\N
56626	GENERIC_DAY	2	4	2010-11-15	19496	\N	55957	\N
56627	GENERIC_DAY	2	3	2010-10-25	1324	\N	55957	\N
56628	GENERIC_DAY	2	0	2010-11-06	1324	\N	55957	\N
56629	GENERIC_DAY	2	1	2010-10-22	19496	\N	55957	\N
56630	GENERIC_DAY	2	5	2010-10-14	1324	\N	55957	\N
56631	GENERIC_DAY	2	1	2010-10-15	1324	\N	55957	\N
56632	GENERIC_DAY	2	3	2010-10-21	1322	\N	55957	\N
56633	GENERIC_DAY	2	0	2010-11-14	1322	\N	55957	\N
56634	GENERIC_DAY	2	0	2010-11-14	19496	\N	55957	\N
56635	GENERIC_DAY	2	3	2010-11-01	1324	\N	55957	\N
56636	GENERIC_DAY	2	3	2010-10-18	1322	\N	55957	\N
56637	GENERIC_DAY	2	3	2010-11-03	1324	\N	55957	\N
56638	GENERIC_DAY	2	1	2010-11-12	19496	\N	55957	\N
56639	GENERIC_DAY	2	3	2010-11-10	1324	\N	55957	\N
56640	GENERIC_DAY	2	3	2010-10-26	1322	\N	55957	\N
56641	GENERIC_DAY	2	3	2010-10-18	19496	\N	55957	\N
56642	GENERIC_DAY	2	2	2010-11-12	1322	\N	55957	\N
56643	GENERIC_DAY	2	3	2010-11-08	1322	\N	55957	\N
56644	GENERIC_DAY	2	3	2010-10-20	1324	\N	55957	\N
56645	GENERIC_DAY	2	3	2010-10-25	19496	\N	55957	\N
56646	GENERIC_DAY	2	0	2010-10-14	1322	\N	55957	\N
56647	GENERIC_DAY	2	3	2010-11-02	1324	\N	55957	\N
56648	GENERIC_DAY	2	0	2010-10-16	19496	\N	55957	\N
56649	GENERIC_DAY	2	1	2010-11-05	19496	\N	55957	\N
56650	GENERIC_DAY	2	3	2010-10-28	19496	\N	55957	\N
56651	GENERIC_DAY	2	3	2010-10-20	1322	\N	55957	\N
24451	SPECIFIC_DAY	10	4	2010-03-12	19494	20247	\N	\N
24429	SPECIFIC_DAY	10	9	2010-03-08	19494	20247	\N	\N
24426	SPECIFIC_DAY	10	4	2010-03-26	19494	20247	\N	\N
24433	SPECIFIC_DAY	10	4	2010-04-09	19494	20247	\N	\N
24441	SPECIFIC_DAY	10	9	2010-03-22	19494	20247	\N	\N
24419	SPECIFIC_DAY	10	0	2010-03-28	19494	20247	\N	\N
59312	GENERIC_DAY	1	8	2010-06-30	1316	\N	59186	\N
59313	GENERIC_DAY	1	8	2010-06-11	1316	\N	59186	\N
59314	GENERIC_DAY	1	8	2010-05-25	1316	\N	59186	\N
59315	GENERIC_DAY	1	0	2010-05-01	1316	\N	59186	\N
59316	GENERIC_DAY	1	8	2010-08-16	1316	\N	59186	\N
59317	GENERIC_DAY	1	8	2010-05-26	1316	\N	59186	\N
59318	GENERIC_DAY	1	8	2010-05-13	1316	\N	59186	\N
59319	GENERIC_DAY	1	8	2010-06-01	1316	\N	59186	\N
59320	GENERIC_DAY	1	8	2010-06-10	1316	\N	59186	\N
59321	GENERIC_DAY	1	8	2010-06-15	1316	\N	59186	\N
59322	GENERIC_DAY	1	8	2010-08-10	1316	\N	59186	\N
59323	GENERIC_DAY	1	0	2010-08-22	1316	\N	59186	\N
59324	GENERIC_DAY	1	8	2010-06-24	1316	\N	59186	\N
59325	GENERIC_DAY	1	8	2010-09-10	1316	\N	59186	\N
59326	GENERIC_DAY	1	8	2010-05-19	1316	\N	59186	\N
59327	GENERIC_DAY	1	8	2010-06-25	1316	\N	59186	\N
59328	GENERIC_DAY	1	0	2010-07-11	1316	\N	59186	\N
59329	GENERIC_DAY	1	8	2010-09-08	1316	\N	59186	\N
59330	GENERIC_DAY	1	8	2010-07-28	1316	\N	59186	\N
59331	GENERIC_DAY	1	8	2010-08-25	1316	\N	59186	\N
59332	GENERIC_DAY	1	8	2010-07-30	1316	\N	59186	\N
59333	GENERIC_DAY	1	8	2010-08-19	1316	\N	59186	\N
59334	GENERIC_DAY	1	0	2010-08-01	1316	\N	59186	\N
59335	GENERIC_DAY	1	8	2010-09-09	1316	\N	59186	\N
59336	GENERIC_DAY	1	8	2010-09-06	1316	\N	59186	\N
59337	GENERIC_DAY	1	8	2010-06-04	1316	\N	59186	\N
59359	GENERIC_DAY	1	8	2010-06-28	1316	\N	59186	\N
59360	GENERIC_DAY	1	8	2010-07-23	1316	\N	59186	\N
59361	GENERIC_DAY	1	8	2010-08-09	1316	\N	59186	\N
59362	GENERIC_DAY	1	8	2010-09-01	1316	\N	59186	\N
59363	GENERIC_DAY	1	8	2010-06-08	1316	\N	59186	\N
59364	GENERIC_DAY	1	8	2010-07-09	1316	\N	59186	\N
59365	GENERIC_DAY	1	0	2010-07-17	1316	\N	59186	\N
59366	GENERIC_DAY	1	0	2010-08-29	1316	\N	59186	\N
59367	GENERIC_DAY	1	0	2010-08-14	1316	\N	59186	\N
59368	GENERIC_DAY	1	8	2010-06-23	1316	\N	59186	\N
59369	GENERIC_DAY	1	0	2010-09-11	1316	\N	59186	\N
59370	GENERIC_DAY	1	0	2010-05-30	1316	\N	59186	\N
59371	GENERIC_DAY	1	0	2010-05-29	1316	\N	59186	\N
59372	GENERIC_DAY	1	8	2010-05-12	1316	\N	59186	\N
59373	GENERIC_DAY	1	8	2010-04-30	1316	\N	59186	\N
59374	GENERIC_DAY	1	8	2010-07-13	1316	\N	59186	\N
59375	GENERIC_DAY	1	8	2010-07-01	1316	\N	59186	\N
59376	GENERIC_DAY	1	0	2010-07-25	1316	\N	59186	\N
59377	GENERIC_DAY	1	8	2010-06-21	1316	\N	59186	\N
59378	GENERIC_DAY	1	0	2010-05-15	1316	\N	59186	\N
44071	GENERIC_DAY	10	8	2010-03-10	1314	\N	20210	\N
44063	GENERIC_DAY	10	8	2010-03-12	1314	\N	20210	\N
44082	GENERIC_DAY	10	8	2010-03-16	1314	\N	20210	\N
44075	GENERIC_DAY	10	8	2010-04-01	1314	\N	20210	\N
44055	GENERIC_DAY	10	8	2010-03-08	1314	\N	20210	\N
44069	GENERIC_DAY	10	8	2010-03-22	1314	\N	20210	\N
44077	GENERIC_DAY	10	8	2010-03-30	1314	\N	20210	\N
44074	GENERIC_DAY	10	8	2010-04-16	1314	\N	20210	\N
44079	GENERIC_DAY	10	8	2010-03-26	1314	\N	20210	\N
44068	GENERIC_DAY	10	0	2010-03-13	1314	\N	20210	\N
59014	GENERIC_DAY	2	8	2010-05-04	1314	\N	20240	\N
59015	GENERIC_DAY	2	8	2010-04-30	1314	\N	20240	\N
59016	GENERIC_DAY	2	0	2010-05-23	1314	\N	20240	\N
59017	GENERIC_DAY	2	8	2010-05-20	1314	\N	20240	\N
59018	GENERIC_DAY	2	8	2010-04-28	1314	\N	20240	\N
59019	GENERIC_DAY	2	0	2010-05-02	1314	\N	20240	\N
59020	GENERIC_DAY	2	0	2010-04-24	1314	\N	20240	\N
59021	GENERIC_DAY	2	8	2010-05-10	1314	\N	20240	\N
56458	GENERIC_DAY	2	5	2010-09-27	1320	\N	20279	\N
56459	GENERIC_DAY	2	6	2010-08-16	1320	\N	20279	\N
56460	GENERIC_DAY	2	5	2010-09-13	1320	\N	20279	\N
56461	GENERIC_DAY	2	1	2010-08-13	1320	\N	20279	\N
56462	GENERIC_DAY	2	5	2010-09-15	1320	\N	20279	\N
56463	GENERIC_DAY	2	5	2010-09-06	1320	\N	20279	\N
56464	GENERIC_DAY	2	5	2010-10-04	1320	\N	20279	\N
59022	GENERIC_DAY	2	8	2010-04-21	1314	\N	20240	\N
59023	GENERIC_DAY	2	8	2010-05-06	1314	\N	20240	\N
59024	GENERIC_DAY	2	0	2010-05-09	1314	\N	20240	\N
59025	GENERIC_DAY	2	8	2010-05-18	1314	\N	20240	\N
59026	GENERIC_DAY	2	8	2010-04-27	1314	\N	20240	\N
59027	GENERIC_DAY	2	8	2010-05-19	1314	\N	20240	\N
59028	GENERIC_DAY	2	8	2010-06-08	1314	\N	20241	\N
59029	GENERIC_DAY	2	8	2010-05-27	1314	\N	20241	\N
51049	GENERIC_DAY	3	16	2010-03-01	19496	\N	51107	\N
51055	GENERIC_DAY	3	0	2010-03-13	19496	\N	51107	\N
56465	GENERIC_DAY	2	5	2010-09-01	1320	\N	20279	\N
56466	GENERIC_DAY	2	1	2010-07-30	1320	\N	20279	\N
56467	GENERIC_DAY	2	6	2010-08-19	1320	\N	20279	\N
56468	GENERIC_DAY	2	6	2010-07-14	1320	\N	20279	\N
56469	GENERIC_DAY	2	5	2010-10-07	1320	\N	20279	\N
56470	GENERIC_DAY	2	5	2010-09-08	1320	\N	20279	\N
56471	GENERIC_DAY	2	6	2010-08-25	1320	\N	20279	\N
56472	GENERIC_DAY	2	6	2010-07-28	1320	\N	20279	\N
56473	GENERIC_DAY	2	6	2010-08-02	1320	\N	20279	\N
56474	GENERIC_DAY	2	6	2010-07-26	1320	\N	20279	\N
56475	GENERIC_DAY	2	5	2010-10-06	1320	\N	20279	\N
56476	GENERIC_DAY	2	1	2010-08-06	1320	\N	20279	\N
56477	GENERIC_DAY	2	5	2010-09-30	1320	\N	20279	\N
56478	GENERIC_DAY	2	6	2010-08-18	1320	\N	20279	\N
24447	SPECIFIC_DAY	10	9	2010-03-16	19494	20247	\N	\N
24438	SPECIFIC_DAY	10	9	2010-03-10	19494	20247	\N	\N
25784	GENERIC_DAY	9	4	2010-04-30	1318	\N	20274	\N
25799	GENERIC_DAY	9	0	2010-03-20	1318	\N	20274	\N
25787	GENERIC_DAY	9	0	2010-03-27	1318	\N	20274	\N
25760	GENERIC_DAY	9	0	2010-04-04	1318	\N	20274	\N
25759	GENERIC_DAY	9	0	2010-04-25	1318	\N	20274	\N
25782	GENERIC_DAY	9	9	2010-04-26	1318	\N	20274	\N
25794	GENERIC_DAY	9	9	2010-05-04	1318	\N	20274	\N
25751	GENERIC_DAY	9	9	2010-04-22	1318	\N	20274	\N
25800	GENERIC_DAY	9	0	2010-03-21	1318	\N	20274	\N
25767	GENERIC_DAY	9	9	2010-03-23	1318	\N	20274	\N
25770	GENERIC_DAY	9	9	2010-03-15	1318	\N	20274	\N
25771	GENERIC_DAY	9	9	2010-03-31	1318	\N	20274	\N
25750	GENERIC_DAY	9	0	2010-04-11	1318	\N	20274	\N
25777	GENERIC_DAY	9	0	2010-04-10	1318	\N	20274	\N
25802	GENERIC_DAY	9	4	2010-04-16	1318	\N	20274	\N
25779	GENERIC_DAY	9	9	2010-04-28	1318	\N	20274	\N
25788	GENERIC_DAY	9	9	2010-04-07	1318	\N	20274	\N
25785	GENERIC_DAY	9	9	2010-04-08	1318	\N	20274	\N
25756	GENERIC_DAY	9	9	2010-03-11	1318	\N	20274	\N
25757	GENERIC_DAY	9	4	2010-03-19	1318	\N	20274	\N
25753	GENERIC_DAY	9	9	2010-04-12	1318	\N	20274	\N
25792	GENERIC_DAY	9	4	2010-04-23	1318	\N	20274	\N
25765	GENERIC_DAY	9	9	2010-03-29	1318	\N	20274	\N
25781	GENERIC_DAY	9	9	2010-04-05	1318	\N	20274	\N
25786	GENERIC_DAY	9	3	2010-05-07	1318	\N	20274	\N
25780	GENERIC_DAY	9	4	2010-03-26	1318	\N	20274	\N
25775	GENERIC_DAY	9	9	2010-03-17	1318	\N	20274	\N
25809	GENERIC_DAY	9	9	2010-04-19	1318	\N	20274	\N
25795	GENERIC_DAY	9	9	2010-04-06	1318	\N	20274	\N
25791	GENERIC_DAY	9	9	2010-03-30	1318	\N	20274	\N
25798	GENERIC_DAY	9	9	2010-04-15	1318	\N	20274	\N
25776	GENERIC_DAY	9	0	2010-05-01	1318	\N	20274	\N
25808	GENERIC_DAY	9	9	2010-04-13	1318	\N	20274	\N
25772	GENERIC_DAY	9	0	2010-04-17	1318	\N	20274	\N
25783	GENERIC_DAY	9	9	2010-04-14	1318	\N	20274	\N
25752	GENERIC_DAY	9	9	2010-03-22	1318	\N	20274	\N
25773	GENERIC_DAY	9	9	2010-03-16	1318	\N	20274	\N
25761	GENERIC_DAY	9	0	2010-03-14	1318	\N	20274	\N
25793	GENERIC_DAY	9	4	2010-04-09	1318	\N	20274	\N
25790	GENERIC_DAY	9	9	2010-05-05	1318	\N	20274	\N
25769	GENERIC_DAY	9	0	2010-03-13	1318	\N	20274	\N
25762	GENERIC_DAY	9	4	2010-04-02	1318	\N	20274	\N
25806	GENERIC_DAY	9	9	2010-04-27	1318	\N	20274	\N
25763	GENERIC_DAY	9	0	2010-05-02	1318	\N	20274	\N
25754	GENERIC_DAY	9	0	2010-03-28	1318	\N	20274	\N
25807	GENERIC_DAY	9	9	2010-04-01	1318	\N	20274	\N
25801	GENERIC_DAY	9	0	2010-04-03	1318	\N	20274	\N
25805	GENERIC_DAY	9	9	2010-03-18	1318	\N	20274	\N
25766	GENERIC_DAY	9	9	2010-04-29	1318	\N	20274	\N
25778	GENERIC_DAY	9	9	2010-04-21	1318	\N	20274	\N
56687	GENERIC_DAY	2	9	2010-05-20	1318	\N	20275	\N
56688	GENERIC_DAY	2	9	2010-06-15	1318	\N	20275	\N
56689	GENERIC_DAY	2	9	2010-06-02	1318	\N	20275	\N
56690	GENERIC_DAY	2	9	2010-07-06	1318	\N	20276	\N
56691	GENERIC_DAY	2	4	2010-07-02	1318	\N	20276	\N
56692	GENERIC_DAY	2	4	2010-06-25	1318	\N	20276	\N
56693	GENERIC_DAY	2	9	2010-06-30	1318	\N	20276	\N
56694	GENERIC_DAY	2	2	2010-07-08	1318	\N	20276	\N
56695	GENERIC_DAY	2	0	2010-07-04	1318	\N	20276	\N
56696	GENERIC_DAY	2	9	2010-06-28	1318	\N	20276	\N
56697	GENERIC_DAY	2	9	2010-06-24	1318	\N	20276	\N
56698	GENERIC_DAY	2	9	2010-06-23	1318	\N	20276	\N
56699	GENERIC_DAY	2	9	2010-07-05	1318	\N	20276	\N
56700	GENERIC_DAY	2	9	2010-06-22	1318	\N	20276	\N
56701	GENERIC_DAY	2	9	2010-07-01	1318	\N	20276	\N
56702	GENERIC_DAY	2	9	2010-06-29	1318	\N	20276	\N
56703	GENERIC_DAY	2	0	2010-07-03	1318	\N	20276	\N
56704	GENERIC_DAY	2	9	2010-07-07	1318	\N	20276	\N
56705	GENERIC_DAY	2	0	2010-06-26	1318	\N	20276	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
819228	13	\N	\N	1
819230	14	\N	\N	0
819229	14	\N	\N	0
6521339	8	20048	20049	1
6521340	8	20048	20050	0
6521334	7	20048	20049	1
6521345	8	20048	20050	0
6521344	8	20048	20049	1
6521335	7	20048	20050	0
6521349	2	20053	20050	0
6521294	2	20042	20025	0
6521287	7	20022	20026	0
6521292	4	20023	20025	0
6521293	4	20023	20025	0
6521290	7	20023	20024	1
6521288	7	20019	20020	0
6521289	7	20020	20021	0
6521295	2	20042	20025	0
6521371	6	20059	20061	0
6521348	2	20053	20050	0
6521343	8	20047	20051	0
6521291	3	\N	\N	0
6521338	8	20047	20051	0
6521370	6	20058	20062	0
6521333	7	20047	20051	0
6521341	8	20044	20045	0
6521336	7	20044	20045	0
6521346	8	20044	20045	0
6521360	6	20058	20062	0
6521363	6	20055	20056	0
6521361	6	20059	20061	0
6521372	6	20059	20060	1
6521337	7	20045	20046	0
6521342	8	20045	20046	0
6521347	8	20045	20046	0
6521373	6	20055	20056	0
6521374	6	20056	20057	0
6521364	6	20056	20057	0
6521362	6	20059	20060	1
6521375	2	20064	20061	0
6521251	7	20029	20015	0
6520969	8	20012	20016	0
6521242	9	20012	20016	0
6520980	8	20012	20016	0
6521174	9	20012	20016	0
6521152	9	20012	20016	0
6520985	9	20012	20016	0
6521245	9	20013	20014	1
6520983	8	20013	20014	1
6520988	9	20013	20014	1
6521177	9	20013	20014	1
6521155	9	20013	20014	1
6520989	9	20014	20015	0
6521246	9	20014	20015	0
6521178	9	20014	20015	0
6520984	8	20014	20015	0
6521156	9	20014	20015	0
6520986	9	20009	20010	0
6521153	9	20009	20010	0
6521243	9	20009	20010	0
6521175	9	20009	20010	0
6520981	8	20009	20010	0
6520970	8	20009	20010	0
6520982	8	20010	20011	0
6521176	9	20010	20011	0
6520987	9	20010	20011	0
6520971	8	20010	20011	0
6521244	9	20010	20011	0
6521154	9	20010	20011	0
19169280	2	57368	57369	0
19169281	2	57368	57369	0
6520872	18	19999	20000	0
6520943	18	19999	20000	0
6520867	17	19999	20000	0
6520873	18	20000	20001	0
6520868	17	20000	20001	0
6520944	18	20000	20001	0
19169282	2	57368	57369	0
6521252	7	20029	20015	0
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
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
58388	58305	5.00
58389	58306	10.00
58390	58307	15.00
18808	1619	100.00
18605	1623	5.00
18606	1624	10.00
18607	1625	15.00
18809	1626	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1819	1	Barreras	A36600971	t	f	f	\N	\N	\N	\N
1820	1	Factoria Naval de Marin	B81998841	t	f	f	\N	\N	\N	\N
1821	1	Navantia	B84076397	t	f	f	\N	\N	\N	\N
1818	2	Vulcano	A36600740	t	t	f	\N	\N	\N	\N
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
20210
20240
20241
20274
20275
20276
20279
20290
30421
30422
30423
30466
30467
30468
30498
30499
30500
36161
36164
36167
36197
36198
36199
36215
36216
36219
51107
55957
59186
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
663
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id, code) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
23942	5	PREFIX-00003-00009-00001	WORKER	300	1.00	f	23644	\N
23943	5	PREFIX-00003-00010-00001	WORKER	250	1.00	f	23645	\N
23944	5	PREFIX-00003-00011-00001	WORKER	200	1.00	f	23646	\N
23949	5	PREFIX-00004-00008-00001	WORKER	200	1.00	f	23655	\N
23950	5	PREFIX-00004-00009-00001	WORKER	300	1.00	f	23657	\N
23951	5	PREFIX-00004-00010-00001	WORKER	250	1.00	f	23658	\N
23952	5	PREFIX-00004-00011-00001	WORKER	200	1.00	f	23659	\N
23953	5	PREFIX-00005-00004-00001	WORKER	100	1.00	f	23663	\N
23954	5	PREFIX-00005-00005-00001	WORKER	100	1.00	f	23664	\N
23955	5	PREFIX-00005-00006-00001	WORKER	350	1.00	f	23666	\N
23956	5	PREFIX-00005-00007-00001	WORKER	200	1.00	f	23667	\N
23957	5	PREFIX-00005-00008-00001	WORKER	100	1.00	f	23668	\N
23958	5	PREFIX-00005-00009-00001	WORKER	300	1.00	f	23670	\N
23959	5	PREFIX-00005-00010-00001	WORKER	250	1.00	f	23671	\N
23960	5	PREFIX-00005-00011-00001	WORKER	200	1.00	f	23672	\N
23937	5	PREFIX-00003-00004-00001	WORKER	100	1.00	f	23637	\N
23938	5	PREFIX-00003-00005-00001	WORKER	100	1.00	f	23638	\N
23939	5	PREFIX-00003-00006-00001	WORKER	350	1.00	f	23640	\N
23940	5	PREFIX-00003-00007-00001	WORKER	200	1.00	f	23641	\N
23941	5	PREFIX-00003-00008-00001	WORKER	100	1.00	f	23642	\N
23961	5	PREFIX-00006-00004-00001	WORKER	100	1.00	f	23676	\N
23962	5	PREFIX-00006-00005-00001	WORKER	100	1.00	f	23677	\N
23963	5	PREFIX-00006-00006-00001	WORKER	350	1.00	f	23679	\N
23964	5	PREFIX-00006-00007-00001	WORKER	200	1.00	f	23680	\N
23945	5	PREFIX-00004-00004-00001	WORKER	100	1.00	f	23650	\N
23946	5	PREFIX-00004-00005-00001	WORKER	100	1.00	f	23651	\N
23947	5	PREFIX-00004-00006-00001	WORKER	350	1.00	f	23653	\N
23948	5	PREFIX-00004-00007-00001	WORKER	250	1.00	f	23654	\N
23965	5	PREFIX-00006-00008-00001	WORKER	100	1.00	f	23681	\N
23966	5	PREFIX-00006-00009-00001	WORKER	300	1.00	f	23683	\N
23967	5	PREFIX-00006-00010-00001	WORKER	250	1.00	f	23684	\N
23968	5	PREFIX-00006-00011-00001	WORKER	200	1.00	f	23685	\N
1919	18	PREFIX-00002-00004-00001	WORKER	100	1.00	f	1620	\N
1920	18	PREFIX-00002-00005-00001	WORKER	100	1.00	f	1621	\N
1921	18	PREFIX-00002-00006-00001	WORKER	200	1.00	f	1623	\N
1922	18	PREFIX-00002-00007-00001	WORKER	200	1.00	f	1624	\N
1923	18	PREFIX-00002-00008-00001	WORKER	100	1.00	f	1625	\N
1924	18	PREFIX-00002-00009-00001	WORKER	300	1.00	f	1627	\N
1925	18	PREFIX-00002-00010-00001	WORKER	250	1.00	f	1628	\N
1926	18	PREFIX-00002-00011-00001	WORKER	200	1.00	f	1629	\N
57267	3	PREFIX-00002-00012-00001	WORKER	100	1.00	f	56965	\N
57268	3	PREFIX-00002-00013-00001	WORKER	100	1.00	f	56966	\N
57269	3	PREFIX-00002-00014-00001	WORKER	100	1.00	f	56967	\N
57270	3	PREFIX-00002-00015-00001	WORKER	100	1.00	f	56968	\N
57271	3	PREFIX-00002-00016-00001	WORKER	100	1.00	f	56969	\N
58132	1	b9db6693-8bd9-45c0-9412-88dbe021a49a	WORKER	100	1.00	f	\N	57843
58133	1	89d92e1f-f3b5-4d17-9032-bbfdab387dc8	WORKER	100	1.00	f	\N	57844
58134	1	b466694d-2d3d-4253-af80-c2cf4df39168	WORKER	200	1.00	f	\N	57846
58135	1	c1793a89-3f15-4eaf-bcfb-0d62ac7fa0a9	WORKER	200	1.00	f	\N	57847
58136	1	3f7f8085-a75c-448b-a0b6-ff04b4599f42	WORKER	100	1.00	f	\N	57848
58137	1	1ba2c332-b077-452e-a55f-3a69b0d04e17	WORKER	300	1.00	f	\N	57850
58138	1	6f796a9a-b5a3-47f2-a5fb-ff782ea2f162	WORKER	250	1.00	f	\N	57851
58139	1	7086d0fe-de4c-458f-b606-4625cf0189fb	WORKER	200	1.00	f	\N	57852
58140	1	75b90066-b448-4ca8-9fdf-aedef6288eff	WORKER	100	1.00	f	\N	57853
58141	1	48411391-ecd9-4b9a-b420-117a21fd54fa	WORKER	100	1.00	f	\N	57854
58142	1	db4b8209-f53b-4571-b3b0-511b2fe6e036	WORKER	100	1.00	f	\N	57855
58143	1	a1e4b9a7-893b-403e-9ef9-9fc98e43b5a5	WORKER	100	1.00	f	\N	57856
58144	1	daca7619-32dd-45ba-9129-72609d0964ce	WORKER	100	1.00	f	\N	57857
58145	1	2ea72ccb-16e1-4b62-bb31-1b25e1de8355	WORKER	100	1.00	f	\N	57858
58146	1	0fcf8356-b746-49d5-8ffe-dacbd78b6597	WORKER	100	1.00	f	\N	57859
58147	1	a88020ce-63a4-4a85-b2a3-c3256cc23a47	WORKER	100	1.00	f	\N	57860
58148	1	3dcf287f-36a5-4d2f-a1b9-b96b684825fa	WORKER	100	1.00	f	\N	57861
58149	1	86296093-2b61-4d77-80ac-cb8da87f2981	WORKER	100	1.00	f	\N	57862
58150	1	2392312a-b2dd-4135-8eb1-80383de82d4b	WORKER	100	1.00	f	\N	57863
57272	3	PREFIX-00002-00017-00001	WORKER	100	1.00	f	56970	\N
57273	3	PREFIX-00002-00018-00001	WORKER	100	1.00	f	56971	\N
57274	3	PREFIX-00002-00019-00001	WORKER	100	1.00	f	56972	\N
57275	3	PREFIX-00002-00020-00001	WORKER	100	1.00	f	56973	\N
57276	3	PREFIX-00002-00021-00001	WORKER	100	1.00	f	56974	\N
57277	3	PREFIX-00002-00022-00001	WORKER	100	1.00	f	56975	\N
58170	2	PREFIX-00009-00015-00001	WORKER	100	1.00	f	58302	\N
58171	2	PREFIX-00009-00016-00001	WORKER	100	1.00	f	58303	\N
58172	2	PREFIX-00009-00017-00001	WORKER	200	1.00	f	58305	\N
58173	2	PREFIX-00009-00018-00001	WORKER	200	1.00	f	58306	\N
58174	2	PREFIX-00009-00019-00001	WORKER	100	1.00	f	58307	\N
58175	2	PREFIX-00009-00020-00001	WORKER	300	1.00	f	58309	\N
58479	2	PREFIX-00009-00021-00001	WORKER	250	1.00	f	58310	\N
58480	2	PREFIX-00009-00022-00001	WORKER	200	1.00	f	58311	\N
58481	2	PREFIX-00009-00004-00001	WORKER	100	1.00	f	58312	\N
58482	2	PREFIX-00009-00005-00001	WORKER	100	1.00	f	58313	\N
58483	2	PREFIX-00009-00006-00001	WORKER	100	1.00	f	58314	\N
58484	2	PREFIX-00009-00007-00001	WORKER	100	1.00	f	58315	\N
58485	2	PREFIX-00009-00008-00001	WORKER	100	1.00	f	58316	\N
58486	2	PREFIX-00009-00009-00001	WORKER	100	1.00	f	58317	\N
58487	2	PREFIX-00009-00010-00001	WORKER	100	1.00	f	58318	\N
58488	2	PREFIX-00009-00011-00001	WORKER	100	1.00	f	58319	\N
58489	2	PREFIX-00009-00012-00001	WORKER	100	1.00	f	58320	\N
58490	2	PREFIX-00009-00013-00001	WORKER	100	1.00	f	58321	\N
58491	2	PREFIX-00009-00014-00001	WORKER	100	1.00	f	58322	\N
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
102	8	0
102	8	1
102	8	2
102	8	3
102	8	4
103	9	0
103	9	1
103	9	2
103	9	3
103	4	4
104	4	0
104	4	1
104	4	2
104	4	3
104	4	4
107	9	0
107	9	1
107	9	2
107	9	3
107	4	4
108	4	0
108	4	1
108	4	2
108	4	3
108	4	4
110	9	0
110	9	1
110	9	2
110	9	3
110	4	4
19699	8	0
19699	8	1
19699	8	2
19699	8	3
19699	8	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
23752	23675
23753	23678
23754	23682
23751	23674
23737	23636
23738	23639
23739	23643
23736	23635
23742	23649
23743	23652
23744	23656
23741	23648
23747	23662
23748	23665
23749	23669
23746	23661
58387	58301
58391	58304
58392	58304
58393	58308
58394	58300
58395	58300
1719	1619
18608	1622
1720	1622
1721	1626
18609	1618
18810	1618
1722	1618
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1212	1	21c56bf5-015f-4382-8ecd-321c2d3fc63d	Media	1111
1213	1	5b859874-e535-4ddb-89d1-36979c7c941f	Urxente	1111
1214	1	6dc2a575-684a-4f2b-8322-c6c4c7b9cdf5	Baixa	1111
1215	1	7aca4595-6e0d-4ac9-8313-4d11aa93f219	Moi urxente	1111
1220	1	d88a6ab9-c489-4b0a-81c7-be478548fbe2	Brasil	1113
1221	1	c676fc92-2a6c-4322-81c6-699f2ba10e6f	España	1113
1222	1	81a9aae2-97c9-4e5b-9f1e-794dc6157e65	Estados Unidos	1113
1223	1	0f84b89d-ac9d-4106-9a3d-d23c4a15cda4	Reino Unido	1113
1224	1	52cafd32-a26d-4a27-a440-b9275327f844	Portugal	1113
1225	1	063fc563-4718-4a03-92ee-f7208c548984	Peligrosidade baixa	1114
1226	1	d9f0d726-c972-4a2f-9529-01c619988db6	Peligrosidade media	1114
1227	1	26e88186-f363-4a41-8a33-0311f9c70871	Peligrosidade alta	1114
1228	1	8370a178-1e52-45fe-b092-a7e57ca7fd87	Media probabilidade de retraso	1115
1229	1	e5f260eb-feb5-496b-976d-f1dc97948627	Alta probabilidade de retraso	1115
1230	1	367cbb06-ae13-446a-a139-91dc97572a7d	Baixa probabilidade de retraso	1115
1217	2	50cd216d-59bf-4e8e-8b16-0fc23878553f	centro de coste 2	1112
1218	2	5d278674-9d8f-41d9-9797-944ca2198334	centro de coste 4	1112
1216	2	dbeb9835-2ede-4a4b-b25b-b0d35d50672e	centro de coste 3	1112
1219	2	253c6726-02ad-4032-9ef1-ebf534bc52ae	centro de coste 1	1112
41511	1	0936dd01-b7f9-4cfc-850f-cf7a6fd6ed3a	bueno	41410
41512	1	6cbe5720-9237-43eb-b9b0-58924c408e0d	malo	41410
41513	1	dabfd214-b117-4468-8c55-ed915241812b	regular	41410
52015	1	uno-c	uno	51914
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name, generatecode) FROM stdin;
1111	1	dbc01881-4cff-4a53-ae52-4ae8e28dbbc7	Prioridade	\N
1113	1	d0cca5f0-bf4c-4456-b91c-3e26b6a9e584	Nacionalidade cliente	\N
1114	1	2fc375cd-d6d1-43c9-91fc-9f197bcb4d9a	Peligrosidade traballo	\N
1115	1	637b38d1-b64a-4171-a3e4-4e076924a657	Posibilidade de retraso	\N
1112	2	7b93c698-9c2c-4fca-a400-005cb0aa2740	Centro de custe	t
41410	1	d15343cb-4b64-442d-a9ae-9bd9cd6817e9	tiempo	t
51914	1	uno	gravedad	f
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
42925	1	m1	material 1	10.00	40097	\N	42824
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

COPY material_category (id, version, name, parent_id, code) FROM stdin;
808	2	Imported materials without category	\N	808
42824	1	tornillos	808	ac5437db-3c96-46ff-aca9-ae3f793fdabc
\.


--
-- Data for Name: naval_profile; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_profile (id, version, profilename) FROM stdin;
\.


--
-- Data for Name: naval_user; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY naval_user (id, version, loginname, password, email, disabled) FROM stdin;
909	4	user	c35c71570b3f45bb21a588107e7cb946b3c50bf2cd9e885d3876de669a73df1133aabe8b69d24db37837c6f26f9e7bc35dc34ee04c8f9a51d53ed7d82859f80e	\N	f
910	3	admin	e02a1a8809e830cf7b7c875e43c16e684ed02a818c7ac25aeadd515432f908ea041447720c194d6b0ec19a1c3dd97f7b378efaab4dd8efd46de568adf3f44c9a	\N	f
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
23836	USER	5	WRITE_AUTHORIZATION	23635	910	\N
23837	USER	5	WRITE_AUTHORIZATION	23648	910	\N
23838	USER	5	WRITE_AUTHORIZATION	23661	910	\N
23839	USER	5	WRITE_AUTHORIZATION	23674	910	\N
58681	USER	1	WRITE_AUTHORIZATION	58300	910	\N
2020	USER	17	WRITE_AUTHORIZATION	1618	910	\N
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
23635	Alumno grupo 2	\N	t	11	100000.00	0.00	1600	\N	\N	0	1819	3
23648	Usuario grupo 3	\N	t	11	200000.00	0.00	1750	\N	\N	0	1819	3
23661	Usuario Grupo 4	\N	t	11	150000.00	0.00	1600	\N	\N	0	1820	3
23674	Usuario grupo 5	\N	t	11	250000.00	0.00	1600	\N	\N	0	1820	3
58300	\N	\N	t	22	0.00	0.00	2550	\N	\N	0	\N	2
1618	Usuario grupo 1	\N	t	22	10000.00	0.00	2550	\N	\N	0	1818	2
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
23651	5	Reunións con traballadores	\N	PREFIX-00004-00005	\N	\N	1	23649	\N	\N	1
23652	5	Bloque 1	\N	PREFIX-00004-00002	\N	\N	3	23648	\N	\N	1
23653	5	Pintar camarotes A e B	\N	PREFIX-00004-00006	\N	\N	0	23652	\N	\N	0
23654	5	Pintar sá de máquinas	\N	PREFIX-00004-00007	\N	\N	0	23652	\N	\N	1
23655	5	Pintar cociñas de buque	\N	PREFIX-00004-00008	\N	\N	0	23652	\N	\N	2
23656	5	Bloque 2	\N	PREFIX-00004-00003	\N	\N	3	23648	\N	\N	2
23657	5	Teito de madeira de camarote A	\N	PREFIX-00004-00009	\N	\N	0	23656	\N	\N	0
23658	5	Cama e mesillas de camarote A	\N	PREFIX-00004-00010	\N	\N	0	23656	\N	\N	1
23659	5	Poñer escotillas camarote A	\N	PREFIX-00004-00011	\N	\N	0	23656	\N	\N	2
23636	5	Coordinacion	\N	PREFIX-00003-00001	\N	\N	0	23635	\N	\N	0
23637	5	Reunions con cliente	\N	PREFIX-00003-00004	\N	\N	1	23636	\N	\N	0
23638	5	Reunions con traballadores	\N	PREFIX-00003-00005	\N	\N	1	23636	\N	\N	1
23639	5	Bloque 1	\N	PREFIX-00003-00002	\N	\N	3	23635	\N	\N	1
23640	5	Pintar camarotes A e B	\N	PREFIX-00003-00006	\N	\N	0	23639	\N	\N	0
23641	5	Pintar sá de máquinas	\N	PREFIX-00003-00007	\N	\N	0	23639	\N	\N	1
23661	7	Pedido Grupo 4	\N	PREFIX-00005	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23662	5	Coordinacion	\N	PREFIX-00005-00001	\N	\N	0	23661	\N	\N	0
23642	5	Pintar cociñas de buque	\N	PREFIX-00003-00008	\N	\N	0	23639	\N	\N	2
23643	5	Bloque 2	\N	PREFIX-00003-00003	\N	\N	3	23635	\N	\N	2
23644	5	Aillar camarote A	\N	PREFIX-00003-00009	\N	\N	0	23643	\N	\N	0
23645	5	Aillar camarote B	\N	PREFIX-00003-00010	\N	\N	0	23643	\N	\N	1
23646	5	Aillar camarote C	\N	PREFIX-00003-00011	\N	\N	0	23643	\N	\N	2
23635	7	Pedido Grupo 2	\N	PREFIX-00003	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23648	7	Pedido Grupo 3	\N	PREFIX-00004	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23649	5	Coordinacion	\N	PREFIX-00004-00001	\N	\N	0	23648	\N	\N	0
23650	5	Reunións con cliente	\N	PREFIX-00004-00004	\N	\N	1	23649	\N	\N	0
23663	5	Reunions con cliente	\N	PREFIX-00005-00004	\N	\N	1	23662	\N	\N	0
23664	5	Reuncion con traballadores	\N	PREFIX-00005-00005	\N	\N	1	23662	\N	\N	1
23665	5	Bloque 1	\N	PREFIX-00005-00002	\N	\N	3	23661	\N	\N	1
23666	5	Soldar cuberta A	\N	PREFIX-00005-00006	\N	\N	0	23665	\N	\N	0
23667	5	Soldar cuberta B	\N	PREFIX-00005-00007	\N	\N	0	23665	\N	\N	1
23668	5	Soldar cuberta C	\N	PREFIX-00005-00008	\N	\N	0	23665	\N	\N	2
23669	5	Bloque 2	\N	PREFIX-00005-00003	\N	\N	3	23661	\N	\N	2
23670	5	Teito de madeira camarote A	\N	PREFIX-00005-00009	\N	\N	0	23669	\N	\N	0
23671	5	Cama e mesilla camarote A	\N	PREFIX-00005-00010	\N	\N	0	23669	\N	\N	1
23672	5	Poñer escotillas camarote A	\N	PREFIX-00005-00011	\N	\N	0	23669	\N	\N	2
23674	7	Pedido Grupo 5	\N	PREFIX-00006	2010-03-01 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
23675	5	Coordinacion	\N	PREFIX-00006-00001	\N	\N	0	23674	\N	\N	0
23676	5	Reunions con traballadores	\N	PREFIX-00006-00004	\N	\N	1	23675	\N	\N	0
23677	5	Reunions cliente	\N	PREFIX-00006-00005	\N	\N	1	23675	\N	\N	1
23678	5	Bloque 1	\N	PREFIX-00006-00002	\N	\N	3	23674	\N	\N	1
23679	5	Pintar camarotes A e B	\N	PREFIX-00006-00006	\N	\N	0	23678	\N	\N	0
23680	5	Pintar sá de máquinas	\N	PREFIX-00006-00007	\N	\N	0	23678	\N	\N	1
23681	5	Pintar cociñas de buque	\N	PREFIX-00006-00008	\N	\N	0	23678	\N	\N	2
23682	5	Bloque 2	\N	PREFIX-00006-00003	\N	\N	3	23674	\N	\N	2
23683	5	Aillar camarote A	\N	PREFIX-00006-00009	\N	\N	0	23682	\N	\N	0
23684	5	Aillar camarote B	\N	PREFIX-00006-00010	\N	\N	0	23682	\N	\N	1
23685	5	Aillar camarote C	\N	PREFIX-00006-00011	\N	\N	0	23682	\N	\N	2
1618	21	Pedido grupo 1	Pedido de proba	PREFIX-00002	2010-03-01 22:40:25.505	2011-02-01 00:00:00	3	\N	\N	\N	\N
1619	18	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	1618	\N	\N	0
1620	18	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	1619	\N	\N	0
1621	18	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	1619	\N	\N	1
1622	18	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	1618	\N	\N	1
1623	18	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	1622	\N	\N	0
1624	18	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	1622	\N	\N	1
1625	18	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	1622	\N	\N	2
1626	18	Bloque 2	\N	PREFIX-00002-00003	\N	\N	0	1618	\N	\N	2
1627	18	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	1	1626	\N	\N	0
1628	18	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	1	1626	\N	\N	1
1629	18	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	1	1626	\N	\N	2
56965	3	task1	\N	PREFIX-00002-00012	\N	\N	0	1618	\N	\N	3
56966	3	task2	\N	PREFIX-00002-00013	\N	\N	0	1618	\N	\N	4
56967	3	task3	\N	PREFIX-00002-00014	\N	\N	0	1618	\N	\N	5
56968	3	tsak4	\N	PREFIX-00002-00015	\N	\N	0	1618	\N	\N	6
56969	3	task5	\N	PREFIX-00002-00016	\N	\N	0	1618	\N	\N	7
56970	3	task6	\N	PREFIX-00002-00017	\N	\N	0	1618	\N	\N	8
56971	3	task7	\N	PREFIX-00002-00018	\N	\N	0	1618	\N	\N	9
56972	3	task8	\N	PREFIX-00002-00019	\N	\N	0	1618	\N	\N	10
56973	3	task9	\N	PREFIX-00002-00020	\N	\N	0	1618	\N	\N	11
56974	3	task10	\N	PREFIX-00002-00021	\N	\N	0	1618	\N	\N	12
56975	3	task11	\N	PREFIX-00002-00022	\N	\N	0	1618	\N	\N	13
58300	2	Template grupo 1	Pedido de proba	PREFIX-00009	2010-04-13 14:05:22.622	2011-03-15 00:00:00	3	\N	\N	\N	\N
58301	2	Coordinación	\N	PREFIX-00009-00001	\N	\N	0	58300	57842	\N	0
58302	2	Reunións con cliente	\N	PREFIX-00009-00015	\N	\N	1	58301	57843	\N	0
58303	2	Reunions con traballadores	\N	PREFIX-00009-00016	\N	\N	1	58301	57844	\N	1
58304	2	Bloque 1	\N	PREFIX-00009-00002	\N	\N	3	58300	57845	\N	1
58305	2	Soldar unions do teito	\N	PREFIX-00009-00017	\N	\N	0	58304	57846	\N	0
58306	2	Soldar unions do chan	\N	PREFIX-00009-00018	\N	\N	0	58304	57847	\N	1
58307	2	Repasar soldadura ocos	\N	PREFIX-00009-00019	\N	\N	0	58304	57848	\N	2
58308	2	Bloque 2	\N	PREFIX-00009-00003	\N	\N	0	58300	57849	\N	2
58309	2	Teito madeira camarote A	\N	PREFIX-00009-00020	\N	\N	1	58308	57850	\N	0
58310	2	Cama e mesilla camarote A	\N	PREFIX-00009-00021	\N	\N	1	58308	57851	\N	1
58311	2	Escotillas camarote	\N	PREFIX-00009-00022	\N	\N	1	58308	57852	\N	2
58312	2	task1	\N	PREFIX-00009-00004	\N	\N	0	58300	57853	\N	3
58313	2	task2	\N	PREFIX-00009-00005	\N	\N	0	58300	57854	\N	4
58314	2	task3	\N	PREFIX-00009-00006	\N	\N	0	58300	57855	\N	5
58315	2	tsak4	\N	PREFIX-00009-00007	\N	\N	0	58300	57856	\N	6
58316	2	task5	\N	PREFIX-00009-00008	\N	\N	0	58300	57857	\N	7
58317	2	task6	\N	PREFIX-00009-00009	\N	\N	0	58300	57858	\N	8
58318	2	task7	\N	PREFIX-00009-00010	\N	\N	0	58300	57859	\N	9
58319	2	task8	\N	PREFIX-00009-00011	\N	\N	0	58300	57860	\N	10
58320	2	task9	\N	PREFIX-00009-00012	\N	\N	0	58300	57861	\N	11
58321	2	task10	\N	PREFIX-00009-00013	\N	\N	0	58300	57862	\N	12
58322	2	task11	\N	PREFIX-00009-00014	\N	\N	0	58300	57863	\N	13
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
57841	1	Template grupo 1	Pedido de proba	PREFIX-00002	0	336	3	\N	\N
57842	1	Coordinación	\N	PREFIX-00002-00001	\N	\N	0	57841	0
57845	1	Bloque 1	\N	PREFIX-00002-00002	\N	\N	3	57841	1
57849	1	Bloque 2	\N	PREFIX-00002-00003	\N	\N	0	57841	2
57853	1	task1	\N	PREFIX-00002-00012	\N	\N	0	57841	3
57854	1	task2	\N	PREFIX-00002-00013	\N	\N	0	57841	4
57855	1	task3	\N	PREFIX-00002-00014	\N	\N	0	57841	5
57856	1	tsak4	\N	PREFIX-00002-00015	\N	\N	0	57841	6
57857	1	task5	\N	PREFIX-00002-00016	\N	\N	0	57841	7
57858	1	task6	\N	PREFIX-00002-00017	\N	\N	0	57841	8
57859	1	task7	\N	PREFIX-00002-00018	\N	\N	0	57841	9
57860	1	task8	\N	PREFIX-00002-00019	\N	\N	0	57841	10
57861	1	task9	\N	PREFIX-00002-00020	\N	\N	0	57841	11
57862	1	task10	\N	PREFIX-00002-00021	\N	\N	0	57841	12
57863	1	task11	\N	PREFIX-00002-00022	\N	\N	0	57841	13
57843	1	Reunións con cliente	\N	PREFIX-00002-00004	\N	\N	1	57842	0
57844	1	Reunions con traballadores	\N	PREFIX-00002-00005	\N	\N	1	57842	1
57846	1	Soldar unions do teito	\N	PREFIX-00002-00006	\N	\N	0	57845	0
57847	1	Soldar unions do chan	\N	PREFIX-00002-00007	\N	\N	0	57845	1
57848	1	Repasar soldadura ocos	\N	PREFIX-00002-00008	\N	\N	0	57845	2
57850	1	Teito madeira camarote A	\N	PREFIX-00002-00009	\N	\N	1	57849	0
57851	1	Cama e mesilla camarote A	\N	PREFIX-00002-00010	\N	\N	1	57849	1
57852	1	Escotillas camarote	\N	PREFIX-00002-00011	\N	\N	1	57849	2
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
23650	1
23651	1
23653	1
23654	1
23655	1
23657	1
23658	1
23659	1
23637	1
23638	1
23640	1
23641	1
23642	1
23644	1
23645	1
23646	1
23663	1
23664	1
23666	1
23667	1
23668	1
23670	1
23671	1
23672	1
23676	1
23677	1
23679	1
23680	1
23681	1
23683	1
23684	1
23685	1
58302	1
58303	1
58305	1
58306	1
58307	1
58309	1
58310	1
58311	1
58312	1
58313	1
58314	1
58315	1
58316	1
58317	1
58318	1
58319	1
58320	1
58321	1
58322	1
1620	1
1621	1
1623	1
1624	1
1625	1
1627	1
1628	1
1629	1
56965	1
56966	1
56967	1
56968	1
56969	1
56970	1
56971	1
56972	1
56973	1
56974	1
56975	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1618
1619
1622
1626
23635
23636
23639
23643
23648
23649
23652
23656
23661
23662
23665
23669
23674
23675
23678
23682
58300
58301
58304
58308
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
57841
57842
57845
57849
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
57843	0
57844	0
57846	0
57847	0
57848	0
57850	0
57851	0
57852	0
57853	0
57854	0
57855	0
57856	0
57857	0
57858	0
57859	0
57860	0
57861	0
57862	0
57863	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	17	PREFIX	9	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
57841	2
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

COPY resource (id, version, code, base_calendar_id, limited_resource, generatecode) FROM stdin;
1326	7	957da07c-acbb-46fd-8c3e-b5ac5cea484c	28	\N	f
1322	8	b7e4edea-e931-4102-88d3-962be706b466	25	\N	f
1314	7	56f6adc6-0bd2-43f6-916f-c31b6b1e9b3a	21	\N	f
19496	3	fa2bfc09-457e-45c4-ba94-ef0b6fb01ad6	19595	\N	f
19498	3	711a6f7d-dff3-4ed0-83ed-5f39f16b78eb	19596	\N	f
1316	8	39971158-b905-4ab6-80f1-ce7ef1c35c2f	22	\N	f
1324	9	ef90a026-8a24-4057-b62f-527c96e31703	26	\N	f
1330	6	f690462b-f214-472d-9e2b-46c1a4331c10	30	\N	f
1332	7	405854ff-894b-43a4-9790-d330c25eb2a4	31	\N	f
19500	4	1a33e076-82ba-4111-93bb-227178d352bb	19597	\N	f
2728	4	4514cc7a-2994-4ce1-a030-187bb7428930	2828	f	f
19494	5	be8d0725-0e03-47ef-bfbb-db2f1c112886	19594	f	f
1328	8	d74f0b01-ddd8-4b95-8f95-5dfa03c79546	29	f	f
1320	10	769eaabf-19fb-49db-a1f3-316b10ce927a	24	f	f
1318	8	7fd7e451-a5b9-4c92-8e98-8c3d02a1c704	23	f	f
50401	2	471541db-1426-4c78-ba58-b7b4742e4a75	50500	f	f
40199	3	72767588-8f72-46dc-b034-9be92f8a8353	40299	t	f
61308	1	3da84978-15c8-4669-8fa2-fa8c5b951492	61408	t	t
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
30498	5	1.00	20044	\N
30499	5	1.00	20045	\N
30500	5	1.00	20046	\N
30469	7	0.60	20043	\N
36161	4	0.62	20048	\N
36164	3	0.55	20049	\N
36167	2	0.50	20050	\N
30466	3	0.78	20023	\N
30467	3	0.55	20024	\N
30468	3	1.00	20025	\N
20292	5	0.60	20018	\N
30421	4	1.00	20019	\N
30422	4	1.00	20020	\N
30423	4	1.00	20021	\N
36197	3	1.00	20055	\N
36198	3	1.00	20056	\N
36199	3	1.00	20057	\N
36215	2	0.55	20059	\N
36216	2	0.55	20060	\N
36219	1	0.50	20061	\N
36168	4	0.60	20054	\N
20279	8	0.59	20013	\N
20290	7	0.55	20014	\N
55957	2	1.00	20015	\N
20247	10	1.00	20008	\N
20274	9	1.00	20009	\N
20275	9	1.00	20010	\N
20276	9	1.00	20011	\N
59186	1	1.00	50096	\N
20210	16	1.00	19999	\N
20240	15	1.00	20000	\N
20241	15	1.00	20001	\N
51107	3	2.00	19998	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
19	1
20	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
27	1
21	1
28	1
25	1
19595	1
19596	1
22	1
26	1
30	1
31	1
19597	1
2828	1
19594	1
29	1
24	1
23	1
50500	1
40299	1
61408	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
60095	1	81ae3188-ee7e-4dd7-97b4-47f7bc7d5cab	2010-04-14	\N	59893	50401
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
20292	19496
30469	19498
36168	19500
20247	19494
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

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
19998	1	0	\N	\N
20023	2	0	\N	\N
20024	0	0	\N	\N
20025	1	0	\N	\N
20018	1	0	\N	\N
20019	1	0	\N	\N
20020	1	0	\N	\N
20021	1	0	\N	\N
20044	1	0	\N	\N
20045	1	0	\N	\N
20046	1	0	\N	\N
20043	1	0	\N	\N
20048	2	0	\N	\N
20049	0	0	\N	\N
20050	1	0	\N	\N
20055	1	0	\N	\N
20056	1	0	\N	\N
20057	1	0	\N	\N
20059	2	0	\N	\N
20060	0	0	\N	\N
20061	1	0	\N	\N
20054	1	0	\N	\N
19999	1	0	\N	\N
20000	1	0	\N	\N
20001	1	0	\N	\N
50096	1	1	2010-04-27 00:00:00	\N
57368	1	1	2010-03-22 07:12:00	\N
57369	1	1	2010-04-28 10:48:00	\N
20013	2	0	\N	\N
20014	0	0	\N	\N
20015	1	2	2010-10-14 00:00:00	\N
20008	1	0	\N	\N
20009	1	0	\N	\N
20010	1	0	\N	\N
20011	1	0	\N	\N
57370	1	0	\N	\N
57371	1	0	\N	\N
57372	1	0	\N	\N
57373	1	0	\N	\N
57374	1	0	\N	\N
58580	1	0	\N	\N
58581	1	0	\N	\N
58582	1	0	\N	\N
58583	1	0	\N	\N
58585	1	0	\N	\N
58586	1	0	\N	\N
58587	1	0	\N	\N
58588	1	0	\N	\N
58589	1	0	\N	\N
57375	1	0	\N	\N
57376	1	0	\N	\N
57377	1	0	\N	\N
57378	1	0	\N	\N
58590	1	0	\N	\N
58591	1	0	\N	\N
58592	1	0	\N	\N
58593	1	0	\N	\N
58594	1	0	\N	\N
58595	1	0	\N	\N
58596	1	0	\N	\N
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
20008	23938
20008	23937
20009	23939
20010	23940
20011	23941
20013	23942
20014	23943
20015	23944
20018	23946
20018	23945
20019	23947
20020	23948
20021	23949
20023	23950
20024	23951
20025	23952
20043	23953
20043	23954
20044	23955
20045	23956
20046	23957
20048	23958
20049	23959
20050	23960
20054	23962
20054	23961
20055	23963
20056	23964
20057	23965
20059	23966
20060	23967
20061	23968
58580	58170
58580	58171
58581	58172
58582	58173
58583	58174
58585	58479
58585	58480
58585	58175
58586	58481
58587	58482
58588	58483
58589	58484
58590	58485
58591	58486
58592	58487
58593	58488
58594	58489
58595	58490
58596	58491
19998	1920
19998	1919
19999	1921
20000	1922
20001	1923
50096	1925
50096	1924
50096	1926
57368	57267
57369	57268
57370	57269
57371	57270
57372	57271
57373	57272
57374	57273
57375	57274
57376	57275
57377	57276
57378	57277
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent, code) FROM stdin;
20047	14	Bloque 1	\N	2010-03-22 00:00:00	2010-07-22 00:00:00	\N	20052	\N	1	\N
20044	12	Soldar cuberta A	\N	2010-03-22 00:00:00	2010-05-22 00:00:00	\N	20047	\N	0	\N
20045	12	Soldar cuberta B	\N	2010-05-22 00:00:00	2010-06-26 00:00:00	\N	20047	\N	1	\N
20046	12	Soldar cuberta C	\N	2010-06-26 00:00:00	2010-07-22 00:00:00	\N	20047	\N	2	\N
20043	12	Coordinacion	\N	2010-03-08 00:00:00	2010-05-26 00:00:00	\N	20052	\N	0	\N
20051	14	Bloque 2	\N	2010-07-22 00:00:00	2010-12-18 00:00:00	\N	20052	\N	2	\N
20048	12	Teito de madeira camarote A	\N	2010-07-22 00:00:00	2010-10-15 00:00:00	\N	20051	\N	0	\N
20049	12	Cama e mesilla camarote A	\N	2010-07-22 00:00:00	2010-09-01 00:00:00	\N	20051	\N	1	\N
20026	12	Bloque 2	\N	2010-08-11 00:00:00	2010-12-18 00:00:00	\N	20027	\N	2	\N
20023	10	Teito de madeira de camarote A	\N	2010-08-11 00:00:00	2010-10-15 00:00:00	\N	20026	\N	0	\N
20024	10	Cama e mesillas de camarote A	\N	2010-08-11 00:00:00	2010-09-01 00:00:00	\N	20026	\N	1	\N
20025	10	Poñer escotillas camarote A	\N	2010-11-14 00:00:00	2010-12-18 00:00:00	\N	20026	\N	2	\N
20018	10	Coordinacion	\N	2010-03-08 00:00:00	2010-05-11 00:00:00	\N	20027	\N	0	\N
20022	12	Bloque 1	\N	2010-03-15 00:00:00	2010-08-11 00:00:00	\N	20027	\N	1	\N
20050	12	Poñer escotillas camarote A	\N	2010-10-15 00:00:00	2010-12-18 00:00:00	\N	20051	\N	2	\N
20052	14	Pedido Grupo 4	\N	2010-03-08 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N	\N
20058	12	Bloque 1	\N	2010-03-22 00:00:00	2010-07-16 00:00:00	\N	20063	\N	1	\N
20055	10	Pintar camarotes A e B	\N	2010-03-22 00:00:00	2010-05-25 00:00:00	\N	20058	\N	0	\N
20019	10	Pintar camarotes A e B	\N	2010-03-15 00:00:00	2010-05-14 00:00:00	\N	20022	\N	0	\N
20056	10	Pintar sá de máquinas	\N	2010-05-25 00:00:00	2010-06-29 00:00:00	\N	20058	\N	1	\N
20057	10	Pintar cociñas de buque	\N	2010-06-29 00:00:00	2010-07-16 00:00:00	\N	20058	\N	2	\N
20020	10	Pintar sá de máquinas	\N	2010-05-14 00:00:00	2010-07-07 00:00:00	\N	20022	\N	1	\N
20021	10	Pintar cociñas de buque	\N	2010-07-07 00:00:00	2010-08-11 00:00:00	\N	20022	\N	2	\N
20027	12	Pedido Grupo 3	\N	2010-03-08 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N	\N
20042	1	Fito recepcion de materiais	\N	2010-11-14 00:00:00	2010-11-14 00:00:00	\N	20027	\N	3	\N
20062	12	Bloque 2	\N	2010-07-16 00:00:00	2010-12-18 00:00:00	\N	20063	\N	2	\N
20059	10	Aillar camarote A	\N	2010-07-16 00:00:00	2010-10-12 00:00:00	\N	20062	\N	0	\N
20060	10	Aillar camarote B	\N	2010-07-16 00:00:00	2010-09-01 00:00:00	\N	20062	\N	1	\N
20053	8	Fito recepcion de materiais	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	20052	\N	3	\N
20061	10	Aillar camarote C	\N	2010-10-15 00:00:00	2010-12-18 00:00:00	\N	20062	\N	2	\N
20054	10	Coordinacion	\N	2010-03-01 00:00:00	2010-05-20 00:00:00	\N	20063	\N	0	\N
20063	12	Pedido Grupo 5	\N	2010-03-01 00:00:00	2010-12-18 00:00:00	2011-06-01	\N	\N	\N	\N
20064	5	Fito recepcion de materias	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20063	\N	3	\N
19999	23	Soldar unions do teito	\N	2010-03-01 22:40:25.505	2010-04-17 22:40:25.505	\N	20002	\N	0	\N
20000	23	Soldar unions do chan	\N	2010-04-17 22:40:25.505	2010-05-25 22:40:25.505	\N	20002	\N	1	\N
20001	23	Repasar soldadura ocos	\N	2010-05-25 22:40:25.505	2010-06-11 22:40:25.505	\N	20002	\N	2	\N
20012	14	Bloque 1	\N	2010-03-08 00:00:00	2010-07-09 00:00:00	\N	20017	\N	1	\N
50096	7	Bloque 2	\N	2010-04-27 00:00:00	2010-09-14 00:00:00	\N	20007	\N	2	\N
20002	26	Bloque 1	\N	2010-03-01 22:40:25.505	2010-06-11 22:40:25.505	\N	20007	\N	1	\N
20007	26	Pedido grupo 1	\N	2010-03-01 22:40:25.505	2010-10-15 00:00:00	2011-02-01	\N	\N	\N	\N
20009	14	Pintar camarotes A e B	\N	2010-03-08 00:00:00	2010-05-08 00:00:00	\N	20012	\N	0	\N
20010	14	Pintar sá de máquinas	\N	2010-05-08 00:00:00	2010-06-22 00:00:00	\N	20012	\N	1	\N
20011	14	Pintar cociñas de buque	\N	2010-06-22 00:00:00	2010-07-09 00:00:00	\N	20012	\N	2	\N
20017	14	Pedido Grupo 2	\N	2010-03-08 00:00:00	2010-12-17 00:00:00	2011-06-01	\N	\N	\N	\N
20040	12	Fito recepcion de materiais	\N	2010-10-15 00:00:00	2010-10-15 00:00:00	\N	20007	\N	3	\N
20029	6	Fito recepcion de materiais	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	20017	\N	3	\N
20016	14	Bloque 2	\N	2010-07-09 00:00:00	2010-12-17 00:00:00	\N	20017	\N	2	\N
20013	14	Aillar camarote A	\N	2010-07-09 00:00:00	2010-10-12 00:00:00	\N	20016	\N	0	\N
20014	14	Aillar camarote B	\N	2010-07-09 00:00:00	2010-08-07 00:00:00	\N	20016	\N	1	\N
20015	14	Aillar camarote C	\N	2010-10-14 00:00:00	2010-12-17 00:00:00	\N	20016	\N	2	\N
20008	14	Coordinacion	\N	2010-03-08 00:00:00	2010-04-10 00:00:00	\N	20017	\N	0	\N
19998	23	Coordinación	\N	2010-03-01 22:40:25.505	2010-03-18 22:40:25.505	\N	20007	\N	0	\N
58597	1	Template grupo 1	\N	2010-04-13 14:05:22.622	2010-07-16 08:05:22.622	2011-03-15	\N	\N	\N	\N
58581	1	Soldar unions do teito	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58584	\N	0	\N
58582	1	Soldar unions do chan	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58584	\N	1	\N
58583	1	Repasar soldadura ocos	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58584	\N	2	\N
58580	1	Coordinación	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58597	\N	0	\N
58584	1	Bloque 1	\N	2010-04-13 14:05:22.622	2010-05-08 14:05:22.622	\N	58597	\N	1	\N
58585	1	Bloque 2	\N	2010-04-13 14:05:22.622	2010-07-16 08:05:22.622	\N	58597	\N	2	\N
58586	1	task1	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	3	\N
58587	1	task2	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	4	\N
58588	1	task3	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	5	\N
58589	1	tsak4	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	6	\N
58590	1	task5	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	7	\N
58591	1	task6	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	8	\N
58592	1	task7	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	9	\N
58593	1	task8	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	10	\N
58594	1	task9	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	11	\N
58595	1	task10	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	12	\N
58596	1	task11	\N	2010-04-13 14:05:22.622	2010-04-26 02:05:22.622	\N	58597	\N	13	\N
57368	5	task1	\N	2010-03-22 07:12:00	2010-04-03 20:12:00	\N	20007	\N	4	\N
57369	5	task2	\N	2010-04-28 10:48:00	2010-05-10 22:48:00	\N	20007	\N	5	\N
57370	5	task3	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	6	\N
57371	5	tsak4	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	7	\N
57372	5	task5	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	8	\N
57373	5	task6	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	9	\N
57374	5	task7	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	10	\N
57375	5	task8	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	11	\N
57376	5	task9	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	12	\N
57377	5	task10	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	13	\N
57378	5	task11	\N	2010-03-01 22:40:25.505	2010-03-14 10:40:25.505	\N	20007	\N	14	\N
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
20002
20007
20012
20016
20017
20022
20026
20027
20047
20051
20052
20058
20062
20063
58584
58597
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
20029
20040
20042
20053
20064
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
20022	3	23652
20026	3	23656
20027	3	23648
20018	5	23649
20019	5	23653
20020	5	23654
20021	5	23655
20023	5	23657
20024	5	23658
20025	5	23659
20008	1	23636
20009	1	23640
20010	1	23641
20011	1	23642
20012	1	23639
20013	1	23644
20014	1	23645
20015	1	23646
20016	1	23643
20017	1	23635
20058	3	23678
20062	3	23682
20063	3	23674
20054	5	23675
20047	3	23665
20055	5	23679
20056	5	23680
20057	5	23681
20051	3	23669
20052	3	23661
20043	5	23662
20044	5	23666
20045	5	23667
20046	5	23668
20048	5	23670
20049	5	23671
20050	5	23672
20059	5	23683
20060	5	23684
20061	5	23685
20002	4	1622
20007	4	1618
19998	7	1619
19999	7	1623
20000	7	1624
20001	7	1625
50096	5	1626
57368	3	56965
58580	1	58301
58581	1	58305
58582	1	58306
58583	1	58307
58584	1	58304
58585	1	58308
58586	1	58312
58587	1	58313
58588	1	58314
58589	1	58315
58590	1	58316
58591	1	58317
58592	1	58318
58593	1	58319
58594	1	58320
58595	1	58321
58596	1	58322
58597	1	58300
57369	3	56966
57370	3	56967
57371	3	56968
57372	3	56969
57373	3	56970
57374	3	56971
57375	3	56972
57376	3	56973
57377	3	56974
57378	3	56975
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
56762	1	jai	a	10.00	t
\.


--
-- Data for Name: unit_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY unit_type (id, version, code, measure) FROM stdin;
40097	1	26fea83a-f705-45b8-874b-db90477a645c	units
40098	1	3f4947e9-8fc9-46b0-9fbf-7b043466f10d	kg
40099	1	51df0d54-0853-43f1-a0b1-2450dd21461a	km
40100	1	5445ee82-5e94-47e4-8a7f-9432834ad646	l
40101	1	e60e972f-5ac5-4cab-9540-edcaac3cf636	m
40103	1	bd88aba0-64ac-4a34-9273-e5fffe5ae809	m3
40104	2	28964100-c982-4122-9da1-d57315c4c65c	tn
40102	4	d3caaa86-9843-439a-af4e-c6743ebd1f26	m2
63024	1	096cb48f-1b61-4a72-b7f9-8e8fa98c511a	toneladas
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
910	ROLE_EDIT_ALL_ORDERS
910	ROLE_READ_ALL_ORDERS
910	ROLE_ADMINISTRATION
910	ROLE_CREATE_ORDER
911	ROLE_WS_READER
912	ROLE_WS_READER
912	ROLE_WS_WRITER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id, generatecode) FROM stdin;
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
51611	1	f	0	1114	1226	51510
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
51510	1	Tipo 1	c1	f	f	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1322	Alfonso 	Domínguez Baúl	55555555E
1314	Javier	Martinez Alvarez	11111111F
1326	Félix	González López	77777777G
19496	Elias	Baeza Robles	11234567L
19498	Elena	Boluda Ferrer	99999999B
1316	María	Pérez Mariño	22222222D
1324	Alicia	Muñoz Lages	66666666D
1330	Manuel	Rodríguez Fernández	99999999F
1332	Raquel	Tilve Moreno	12121212B
19500	Damian	Pintos Abogado	23232323B
2728	Javier	Perez Campos	32323232L
19494	Laura	Menendez Gomez	89876562L
1328	Oscar	Iraola Sáez	88888888B
1320	Raúl 	Cisneros Díaz	44444444H
1318	Luis	Amado  Montes	33333333A
50401	javie	moran	8989234
40199	Javier	Montes	78736622D
61308	Laura	Ponce	123456X
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
-- Name: taskelement_code_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY taskelement
    ADD CONSTRAINT taskelement_code_key UNIQUE (code);


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

