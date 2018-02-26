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
    configuration_id bigint,
    companycode character varying(255)
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
    criterion_id bigint,
    parent bigint,
    isvalid boolean,
    valid boolean,
    order_element_template_id bigint
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
    resource bigint NOT NULL,
    code character varying(255)
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
    workinghours integer NOT NULL,
    percentage numeric(19,2),
    fixedpercentage boolean,
    parent_order_line bigint,
    order_line_template bigint,
    resourcetype character varying(255)
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
    positionnumber integer
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
    workhours integer,
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
    base_calendar_id bigint,
    code character varying(255)
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
    initdate date,
    enddate date,
    cost_category_id bigint,
    resource_id bigint,
    code character varying(255)
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
    task_element_id bigint,
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
1951	3	t	808
1952	3	t	808
1953	3	t	808
1954	3	t	808
3356	4	t	808
3408	3	t	808
7509	26	t	809
7510	26	t	809
7511	26	t	809
7512	26	t	809
7513	26	f	809
5696	36	t	808
7514	26	t	809
7515	26	t	809
7516	26	t	809
86150	3	t	808
86151	3	f	809
5697	36	t	808
86152	3	t	809
86254	3	t	809
86256	3	t	808
86255	3	f	809
86257	3	t	809
86259	3	f	809
7517	26	f	809
86258	3	t	808
86260	3	t	809
8003	24	t	809
86261	3	t	808
86262	3	f	809
8004	24	t	809
86263	3	t	809
5701	35	t	808
8005	24	f	809
8006	24	t	809
8007	24	t	809
8008	24	t	809
8009	24	t	809
5705	34	t	808
8010	24	f	809
8011	24	t	809
8012	24	t	809
5709	33	t	808
8013	24	f	809
8014	24	t	809
8015	24	f	809
5716	32	t	808
9290	23	t	809
86264	3	t	809
86265	3	t	809
86266	3	t	809
86267	3	t	809
86268	3	t	809
86269	3	t	809
86270	3	t	809
86271	3	t	809
86272	3	t	808
86273	3	f	809
86274	3	t	809
86275	3	t	809
86276	3	f	809
86277	3	t	808
86289	7	f	809
90804	9	t	808
5673	5	f	812
5672	5	t	809
9291	23	f	809
5717	32	t	808
9292	23	t	809
9293	23	t	809
9294	23	t	809
6978	31	t	808
9295	23	f	809
9296	23	t	809
9297	23	t	809
9298	23	t	809
6979	31	t	808
6980	31	t	808
6993	30	t	808
6994	30	t	808
6995	30	t	808
5674	5	f	809
3370	8	t	808
5675	5	f	812
6996	30	t	808
7518	26	t	809
57140	7	t	809
105270	4	t	811
105271	4	f	811
9299	23	t	809
9300	23	t	809
9301	23	t	809
9302	23	f	809
9303	23	t	809
9304	23	t	809
9305	23	t	809
9306	23	t	809
9307	23	t	809
85693	3	t	809
85695	3	f	809
85694	3	t	808
85696	3	t	809
85698	3	f	809
85697	3	t	808
85699	3	t	809
85700	3	t	809
11041	22	t	809
11042	22	t	809
11043	22	t	809
11044	22	t	809
11045	22	t	809
11046	22	t	809
11047	22	t	809
11048	22	t	809
90805	8	t	808
90806	8	t	808
86326	5	f	811
86327	5	t	811
86328	5	t	811
86329	5	f	811
9308	23	f	809
11027	22	t	809
11028	22	t	809
11029	22	f	809
11030	22	t	809
11031	22	t	809
11032	22	f	809
11033	22	t	809
11034	22	f	809
11035	22	t	809
57124	7	t	809
57125	7	t	809
57126	7	t	809
57127	7	t	809
57128	7	f	809
57129	7	t	808
57130	7	t	809
57131	7	t	809
57132	7	t	809
57134	7	t	808
57133	7	f	809
57135	7	t	809
57136	7	t	809
57137	7	t	808
11036	22	f	809
11037	22	t	809
11038	22	t	809
11039	22	t	809
11040	22	t	809
57138	7	f	809
57139	7	t	809
86279	11	t	808
57141	7	t	809
90799	3	t	808
57142	7	t	809
57401	7	t	808
57402	7	t	809
57403	7	f	809
57404	7	t	808
57405	7	f	809
79996	14	f	810
79997	14	f	810
79998	14	f	810
80079	3	t	809
80080	3	t	809
80081	3	t	809
80082	3	t	809
80084	3	t	808
80083	3	f	809
80085	3	t	809
80086	3	t	809
80087	3	t	809
80089	3	t	808
80088	3	f	809
80090	3	t	809
80091	3	t	809
85648	3	f	809
80092	3	t	808
85649	3	t	809
85650	3	t	809
85651	3	t	809
85652	3	t	809
85654	3	t	808
85653	3	f	809
85655	3	t	809
85656	3	t	809
85658	3	t	808
85657	3	f	809
85659	3	t	809
85660	3	f	809
85661	3	t	808
85662	3	t	809
85663	3	f	809
85664	3	t	808
85665	3	t	809
85666	3	t	809
85667	3	t	809
85669	3	f	809
85668	3	t	808
85670	3	t	809
85671	3	t	809
85672	3	t	809
85673	3	t	809
85674	3	t	809
85675	3	t	809
85676	3	t	808
85677	3	f	809
85678	3	t	809
85679	3	t	809
85680	3	t	809
85681	3	t	809
85682	3	t	809
85683	3	f	809
85684	3	t	808
85685	3	t	809
85686	3	t	809
85688	3	f	809
85687	3	t	808
85689	3	t	809
85690	3	t	809
85692	3	f	809
85691	3	t	808
57143	7	t	808
85701	3	t	809
85702	3	t	809
85703	3	t	809
85704	3	t	809
85705	3	t	809
85706	3	t	809
85707	3	t	809
85709	3	f	809
85708	3	t	808
85710	3	t	809
85711	3	t	809
85712	3	t	808
85713	3	f	809
86281	11	f	808
90800	2	t	808
107473	4	t	106858
107474	4	f	106858
107475	4	f	106858
57144	7	f	809
57145	7	t	809
57146	7	t	809
57147	7	t	808
57148	7	f	809
57149	7	t	809
57151	7	f	809
57150	7	t	808
57152	7	t	809
57153	7	f	809
57154	7	t	808
57155	7	t	809
57156	7	t	809
57157	7	t	809
57159	7	t	808
57158	7	f	809
57160	7	t	809
57161	7	t	809
57162	7	t	809
57163	7	t	809
57164	7	t	809
57165	7	t	809
57368	7	f	809
57369	7	t	808
57370	7	t	809
57371	7	t	809
57372	7	t	809
57373	7	t	809
57374	7	t	809
57375	7	f	809
57376	7	t	808
57377	7	t	809
57378	7	t	809
57380	7	t	808
57379	7	f	809
57381	7	t	809
57382	7	t	809
57384	7	f	809
57383	7	t	808
57385	7	t	809
57386	7	f	809
57387	7	t	808
57388	7	t	809
57389	7	f	809
57390	7	t	808
57391	7	t	809
57392	7	t	809
57393	7	t	809
57394	7	t	809
57395	7	t	809
57396	7	t	809
57397	7	t	809
57398	7	t	809
57399	7	t	809
57400	7	f	809
86285	8	t	809
86286	8	f	809
86287	8	f	809
90802	5	t	808
86097	3	t	809
86098	3	t	809
86099	3	t	809
86100	3	t	809
86101	3	f	809
86102	3	t	808
86103	3	t	809
86104	3	t	809
86105	3	t	809
86107	3	t	808
86106	3	f	809
86108	3	t	809
86109	3	t	809
86110	3	f	809
86111	3	t	808
86112	3	t	809
86113	3	t	809
86114	3	t	809
86115	3	t	809
86117	3	t	808
86116	3	f	809
86118	3	t	809
86119	3	t	809
86121	3	t	808
86120	3	f	809
86122	3	t	809
86124	3	t	808
86123	3	f	809
86125	3	t	809
86127	3	t	808
86126	3	f	809
86128	3	t	809
86129	3	t	809
86130	3	t	809
86131	3	f	809
86132	3	t	808
86133	3	t	809
86134	3	t	809
86135	3	t	809
86136	3	t	809
86137	3	t	809
86138	3	t	809
86140	3	t	808
86139	3	f	809
86141	3	t	809
86142	3	t	809
86143	3	t	809
86144	3	t	809
86145	3	t	809
86146	3	t	808
86147	3	f	809
86148	3	t	809
86149	3	t	809
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
44704	1	809	44789	t	100.00
44705	1	809	44790	t	100.00
44706	1	809	44791	t	100.00
44707	1	809	44792	t	100.00
44708	1	809	44794	t	100.00
44709	1	809	44795	t	100.00
44710	1	809	44796	t	100.00
44711	1	809	44798	t	100.00
44712	1	809	44799	t	100.00
44713	1	809	44801	t	100.00
44714	1	809	44802	t	100.00
44715	1	809	44803	t	100.00
44716	1	809	44804	t	100.00
44717	1	809	44806	t	100.00
44718	1	809	44807	t	100.00
44719	1	809	44809	t	100.00
44720	1	809	44811	t	100.00
44721	1	809	44813	t	100.00
44722	1	809	44814	t	100.00
44723	1	809	44815	t	100.00
44724	1	809	44817	t	100.00
44725	1	809	44818	t	100.00
44726	1	809	44819	t	100.00
44727	1	809	44820	t	100.00
44728	1	809	44821	t	100.00
44729	1	809	44822	t	100.00
44730	1	809	44824	t	100.00
44731	1	809	44825	t	100.00
44732	1	809	44826	t	100.00
44733	1	809	44827	t	100.00
44734	1	809	44828	t	100.00
44735	1	809	44830	t	100.00
44736	1	809	44831	t	100.00
44737	1	809	44833	t	100.00
44738	1	809	44834	t	100.00
44739	1	809	44836	t	100.00
44740	1	809	44838	t	100.00
44741	1	809	44840	t	100.00
44742	1	809	44841	t	100.00
44844	1	809	44842	t	100.00
44845	1	809	44843	t	100.00
44846	1	809	44945	t	100.00
44847	1	809	44946	t	100.00
44848	1	809	44947	t	100.00
44849	1	809	44948	t	100.00
44850	1	809	44949	t	100.00
44851	1	809	44950	t	100.00
44852	1	809	44951	t	100.00
56555	1	809	56589	t	100.00
56556	1	809	56590	t	100.00
56557	1	809	56591	t	100.00
56558	1	809	56592	t	100.00
56559	1	809	56594	t	100.00
56661	1	809	56595	t	100.00
56662	1	809	56596	t	100.00
56663	1	809	56598	t	100.00
56664	1	809	56599	t	100.00
56665	1	809	56601	t	100.00
56666	1	809	56602	t	100.00
56667	1	809	56603	t	100.00
56668	1	809	56604	t	100.00
56669	1	809	56606	t	100.00
56670	1	809	56607	t	100.00
56671	1	809	56609	t	100.00
56672	1	809	56611	t	100.00
56673	1	809	56613	t	100.00
56674	1	809	56614	t	100.00
56675	1	809	56615	t	100.00
56676	1	809	56617	t	100.00
56677	1	809	56618	t	100.00
56678	1	809	56619	t	100.00
56679	1	809	56620	t	100.00
56680	1	809	56621	t	100.00
56681	1	809	56622	t	100.00
56682	1	809	56624	t	100.00
56683	1	809	56625	t	100.00
56684	1	809	56626	t	100.00
56685	1	809	56627	t	100.00
56686	1	809	56628	t	100.00
56687	1	809	56630	t	100.00
56688	1	809	56631	t	100.00
56689	1	809	56633	t	100.00
56690	1	809	56634	t	100.00
56691	1	809	56636	t	100.00
56692	1	809	56638	t	100.00
56693	1	809	56640	t	100.00
56694	1	809	56641	t	100.00
56695	1	809	56642	t	100.00
56696	1	809	56643	t	100.00
56697	1	809	56644	t	100.00
56698	1	809	56645	t	100.00
56699	1	809	56646	t	100.00
56700	1	809	56647	t	100.00
56701	1	809	56648	t	100.00
56702	1	809	56649	t	100.00
56703	1	809	56650	t	100.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
79924	14	2009-12-16	100.00	7509	\N
79925	14	2009-12-08	25.00	7509	\N
79926	14	2010-02-16	50.00	79996	\N
79927	14	2010-02-01	25.00	79996	\N
79928	14	2010-02-01	100.00	7510	\N
79929	14	2009-12-15	50.00	7510	\N
82458	8	2010-02-15	100.00	7511	\N
79930	14	2010-01-06	50.00	7511	\N
82478	5	2010-04-15	25.00	86326	\N
79931	14	2010-01-03	25.00	7511	\N
82459	8	2010-02-15	100.00	7512	\N
80495	13	2010-02-15	100.00	7514	\N
80496	13	2010-02-15	100.00	7515	\N
80497	13	2010-02-15	100.00	7516	\N
80498	13	2010-02-15	100.00	8003	\N
80499	13	2010-02-15	100.00	8004	\N
80500	13	2010-02-15	100.00	8006	\N
80501	13	2010-02-15	100.00	8007	\N
80502	13	2010-02-15	100.00	8008	\N
80503	13	2010-02-15	100.00	8009	\N
80504	13	2010-02-15	100.00	8011	\N
80505	13	2010-02-15	100.00	8012	\N
80596	12	2010-02-15	100.00	8014	\N
80597	12	2010-02-15	100.00	9290	\N
80598	12	2010-02-15	100.00	9292	\N
80599	12	2010-02-15	100.00	9293	\N
80600	12	2010-02-15	100.00	9294	\N
82020	11	2010-02-15	100.00	9296	\N
82021	11	2010-02-15	100.00	9297	\N
82461	8	2010-04-28	25.00	86285	\N
82479	5	2010-05-05	25.00	86327	\N
82463	7	2010-04-28	25.00	86289	\N
105456	4	2010-02-16	39.92	105270	\N
107575	2	2010-02-17	25.00	107473	\N
107576	2	2010-02-09	10.00	107473	\N
82022	11	2010-02-15	100.00	9298	\N
82023	11	2010-02-15	100.00	9299	\N
82024	11	2010-02-15	100.00	9300	\N
82025	11	2010-02-15	100.00	9301	\N
82026	11	2010-02-15	100.00	9303	\N
82027	11	2010-02-15	100.00	9304	\N
82028	11	2010-02-15	100.00	9305	\N
82029	11	2010-02-15	100.00	9306	\N
82030	11	2010-02-15	100.00	9307	\N
82031	11	2010-02-15	100.00	11027	\N
5765	5	2010-02-09	40.00	5672	\N
5766	5	2010-02-08	20.00	5672	\N
82032	11	2010-02-15	100.00	11028	\N
82033	11	2010-02-15	100.00	11030	\N
82034	11	2010-02-15	100.00	11031	\N
82035	11	2010-02-15	100.00	11033	\N
82036	11	2010-02-15	100.00	11035	\N
82037	11	2010-02-15	100.00	11037	\N
82430	10	2010-02-15	100.00	11038	\N
82431	10	2010-02-15	100.00	11039	\N
82432	10	2010-02-15	100.00	11040	\N
82433	10	2010-02-15	100.00	11041	\N
82434	10	2010-02-15	100.00	11042	\N
82435	10	2010-02-15	100.00	11043	\N
82436	10	2010-02-15	100.00	11044	\N
82437	10	2010-02-15	100.00	11045	\N
82438	10	2010-02-15	100.00	11047	\N
82439	10	2010-02-15	100.00	11048	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
808	4	children	100.0000	f	0.0100	t	t	\N
809	3	percentage	100.0000	f	0.0100	t	t	\N
810	2	units	2147483647.0000	f	1.0000	t	f	\N
811	1	subcontractor	100.0000	f	0.0100	t	t	\N
812	1	Toneladas	10000.0000	t	1.0000	t	f	\N
813	1	Porcentaxe (pactado)	100.0000	t	1.0000	t	f	\N
814	1	Importe	1000000.0000	t	1.0000	t	f	\N
815	1	Importe (pactado)	1000000.0000	t	1.0000	t	f	\N
106858	1	QF: Formulario de calidade para tarefas de tipo A	100.0000	f	0.0100	t	t	t
113322	1	QF: Formulario de calidade para tarefas de tipo C	100.0000	f	0.0100	t	t	t
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
2527	113
2527	115
3063	112
3064	113
3066	119
3069	113
3070	119
58383	115
58383	113
58384	115
58384	113
58450	115
58450	113
58451	115
58451	113
58452	115
58452	113
58453	115
58453	113
58454	115
58454	113
58455	115
58455	113
58456	115
58456	113
58457	115
58457	111
58458	115
58458	112
58459	115
58459	113
58460	115
58460	113
58461	115
58461	113
58468	115
58468	113
58469	115
58469	113
58470	115
58470	113
58472	115
58472	113
60703	115
60703	113
60704	115
60704	113
60705	115
60705	113
60706	115
60706	113
60751	115
60751	113
60752	115
60752	113
60753	115
60753	113
60754	115
60754	113
60755	115
60755	113
60756	115
60756	113
60757	115
60757	113
60758	115
60758	113
60790	115
60790	113
60791	115
60791	113
60792	115
60792	113
60795	115
60795	113
68413	111
68413	115
68414	113
68414	115
68415	113
68415	115
68416	113
68416	115
68417	113
68417	115
68418	113
68418	115
68419	113
68419	115
68420	113
68420	115
68421	113
68421	115
68422	113
68422	115
68423	113
68423	115
97566	113
97566	115
97567	113
97567	115
97578	99889
97579	99889
97580	99889
97581	99889
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
88072	4
106153	4
112717	3
112719	6
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
304	1	\N
303	3	España
306	1	Galicia
307	1	Pontevedra
309	2	Calendario máquinas Pontevedra
308	3	Calendarios máquinas
91002	23	\N
91003	23	\N
318	2	\N
319	3	\N
320	2	\N
311	6	\N
317	2	\N
313	3	\N
312	5	\N
310	3	\N
316	2	\N
314	2	\N
321	4	\N
91001	4	\N
315	5	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-02-03	\N	304	0
1322	2	2010-02-03	\N	318	0
91204	23	2010-01-01	\N	91002	0
1323	3	2010-02-03	\N	319	0
91205	23	2010-02-16	\N	91003	0
1324	2	2010-02-03	\N	320	0
1315	6	2009-02-03	\N	311	0
1321	2	2009-02-03	\N	317	0
1317	3	2009-02-03	\N	313	0
1316	5	2009-02-01	2010-12-31	312	0
2828	2	2011-01-01	\N	312	1
1314	3	2009-02-03	\N	310	0
1320	2	2009-02-03	\N	316	0
1318	2	2009-02-03	\N	314	0
1325	4	2010-02-03	2010-03-31	321	0
91203	4	2009-12-01	2010-01-10	91001	0
1319	5	2009-02-03	\N	315	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
405	1	303	\N	304	0
412	6	307	\N	311	0
418	2	307	\N	317	0
404	3	\N	\N	303	0
407	1	303	\N	306	0
414	3	307	\N	313	0
408	1	306	\N	307	0
413	5	307	\N	312	0
411	3	307	\N	310	0
417	2	307	\N	316	0
415	2	307	\N	314	0
410	2	308	\N	309	0
409	3	\N	\N	308	0
422	4	307	\N	321	0
91103	23	307	\N	91002	0
91104	23	307	\N	91003	0
91102	4	307	\N	91001	0
416	5	307	\N	315	0
419	2	307	\N	318	0
420	3	307	\N	319	0
421	2	309	\N	320	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1518	2	2010-12-06	0	711	303
1515	2	2010-04-02	0	707	303
1517	2	2010-12-08	0	711	303
1516	2	2010-11-01	0	707	303
1520	1	2010-10-12	0	711	303
1521	1	2010-03-19	0	711	306
1522	1	2010-04-01	0	711	306
1523	1	2010-05-17	0	711	306
1524	1	2010-02-17	0	711	307
1525	1	2010-03-19	0	711	309
1526	1	2010-04-01	0	711	309
1527	1	2010-10-12	0	711	308
1528	1	2010-12-08	0	711	308
1529	1	2010-11-01	0	711	308
1530	1	2010-12-06	0	711	308
\.


--
-- Data for Name: calendarexceptiontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexceptiontype (id, version, name, color, notassignable) FROM stdin;
707	6	HOLIDAY	red	t
708	5	SICK_LEAVE	red	t
709	4	LEAVE	red	t
710	3	STRIKE	red	t
711	2	BANK_HOLIDAY	red	t
712	1	WORKABLE_BANK_HOLIDAY	orange	f
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY configuration (id, version, configuration_id, companycode) FROM stdin;
505	3	307	B15804842
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled) FROM stdin;
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
114	1	e23dd050-88db-4aee-b8fc-ab96dffc1d4e	Oficial 1º	t	2	\N
115	1	0f7bb678-aac9-4c9d-a070-00bf09fcecbb	Enxeñeiro en Informática	t	2	\N
116	1	f0845269-cd3e-475a-bf18-b978ee18aaff	Peon	t	2	\N
117	1	e40bcee0-dde5-4707-bd91-a7dd69b8b081	pulidora	t	7	\N
118	1	abf6d5e3-5caa-4467-a696-cf35abd3bced	torno	t	7	\N
101	14	aeca847a-2b3c-4f07-bd5f-a97e9e210cab	medicalLeave	t	1	\N
102	13	63baaa7b-6637-4213-9606-f33223cd9eb0	paternityLeave	t	1	\N
103	4	944b1694-3e09-4160-901b-878014d5ca5c	hiredResourceWorkingRelationship	t	5	\N
104	3	433ba70e-abd0-4459-b9d0-5307ce884de9	firedResourceWorkingRelationship	t	5	\N
112	5	a3d2fdde-053c-4805-b89c-0686e06b80f0	Analista	t	4	\N
99889	2	fe959fdd-19de-4f86-b0ae-bf0afbaa9bb3	Pintor	t	4	\N
113120	1	09d898ce-eb75-4b91-9b54-f657f9be104f	Calderero	t	4	\N
111	5	d1f49e2c-237e-4b1e-8ad0-c0e0f9d825e0	Coordinador	t	4	\N
113	5	a7725710-9bb4-4896-a0c4-0b06375b626f	Desarrollador	t	4	\N
119	4	a24075ab-4d02-4c46-adde-a6cb0bd86b29	Soldador	t	4	\N
109	2	1b2ceacb-180a-4a3e-b502-e92c35925b0c	Pontevedra	t	6	106
108	2	383e38ab-def8-42f3-9585-ee2bd2956a56	Ferrol	t	6	106
110	2	3380514c-2795-46f9-b15d-7af052233a3b	Andalucía	t	6	105
107	2	0a8253f2-2880-49d9-8279-4afdcdc4b2b6	Vigo	t	6	106
106	2	061cb37e-b556-45c4-a31e-f573d1f996b5	Galicia	t	6	105
105	2	fe05c700-ff55-4182-becf-d7e2d9543cf9	España	t	6	\N
44137	3	3f1a6ca8-20ab-4a4a-b9e2-6120e18ba90d	Consultor	t	4	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid, valid, order_element_template_id) FROM stdin;
44069	INDIRECT	19	\N	7077	113	44063	\N	f	\N
2395	DIRECT	2	\N	1870	113	\N	\N	\N	\N
2396	DIRECT	2	\N	1870	115	\N	\N	\N	\N
2397	INDIRECT	2	2139	\N	115	2396	t	\N	\N
2398	INDIRECT	2	2139	\N	113	2395	t	\N	\N
2399	DIRECT	2	\N	1871	115	\N	\N	\N	\N
2400	DIRECT	2	\N	1871	113	\N	\N	\N	\N
2401	INDIRECT	2	2140	\N	113	2400	t	\N	\N
2402	INDIRECT	2	2140	\N	115	2399	t	\N	\N
44070	INDIRECT	19	6950	\N	115	44062	\N	t	\N
44071	INDIRECT	19	6950	\N	113	44063	\N	f	\N
44073	DIRECT	19	\N	7078	113	\N	\N	\N	\N
4796	DIRECT	3	4866	\N	119	\N	\N	\N	\N
4795	DIRECT	3	4865	\N	113	\N	\N	\N	\N
4797	DIRECT	3	\N	4714	117	\N	\N	\N	\N
44072	DIRECT	19	\N	7078	115	\N	\N	\N	\N
4799	DIRECT	3	4869	\N	118	\N	\N	\N	\N
4798	DIRECT	3	4868	\N	119	\N	\N	\N	\N
4954	INDIRECT	2	4867	\N	117	4797	\N	t	\N
44075	INDIRECT	19	\N	7079	113	44073	\N	t	\N
44074	INDIRECT	19	\N	7079	115	44072	\N	t	\N
44076	INDIRECT	19	6951	\N	115	44072	\N	t	\N
44077	INDIRECT	19	6951	\N	113	44073	\N	t	\N
44078	DIRECT	19	\N	7081	113	\N	\N	\N	\N
44079	DIRECT	19	\N	7081	115	\N	\N	\N	\N
44081	INDIRECT	19	\N	7082	113	44078	\N	t	\N
44080	INDIRECT	19	\N	7082	115	44079	\N	t	\N
44083	INDIRECT	19	6953	\N	115	44079	\N	t	\N
4320	DIRECT	6	\N	3698	112	\N	\N	\N	\N
4321	INDIRECT	6	3761	\N	112	4320	t	\N	\N
4322	DIRECT	6	\N	3699	113	\N	\N	\N	\N
4323	INDIRECT	6	3762	\N	113	4322	t	\N	\N
4324	DIRECT	6	\N	3700	119	\N	\N	\N	\N
4325	INDIRECT	6	3763	\N	119	4324	t	\N	\N
44082	INDIRECT	19	6953	\N	113	44078	\N	t	\N
44084	DIRECT	19	\N	7115	113	\N	\N	\N	\N
44085	DIRECT	19	\N	7115	115	\N	\N	\N	\N
44087	INDIRECT	19	\N	7116	113	44084	\N	t	\N
44086	INDIRECT	19	\N	7116	115	44085	\N	t	\N
44088	INDIRECT	19	7185	\N	113	44084	\N	t	\N
44089	INDIRECT	19	7185	\N	115	44085	\N	t	\N
44091	INDIRECT	19	\N	7117	115	44085	\N	t	\N
39068	DIRECT	21	\N	6300	115	\N	\N	\N	\N
44065	INDIRECT	19	\N	7076	113	44063	\N	t	\N
44067	INDIRECT	19	6949	\N	113	44063	\N	t	\N
44066	INDIRECT	19	6949	\N	115	44062	\N	t	\N
44068	INDIRECT	19	\N	7077	115	44062	\N	t	\N
39069	DIRECT	21	\N	6300	113	\N	\N	\N	\N
39070	INDIRECT	21	\N	6301	113	39069	\N	t	\N
39071	INDIRECT	21	\N	6301	115	39068	\N	t	\N
39073	INDIRECT	21	6583	\N	113	39069	\N	t	\N
39072	INDIRECT	21	6583	\N	115	39068	\N	t	\N
39075	INDIRECT	21	\N	6302	113	39069	\N	t	\N
39074	INDIRECT	21	\N	6302	115	39068	\N	t	\N
39076	INDIRECT	21	6584	\N	113	39069	\N	t	\N
39077	INDIRECT	21	6584	\N	115	39068	\N	t	\N
39078	INDIRECT	21	\N	6303	113	39069	\N	t	\N
39079	INDIRECT	21	\N	6303	115	39068	\N	t	\N
39080	INDIRECT	21	6585	\N	115	39068	\N	t	\N
39081	INDIRECT	21	6585	\N	113	39069	\N	t	\N
39086	DIRECT	21	\N	6305	113	\N	\N	\N	\N
40933	INDIRECT	20	\N	6817	113	40923	\N	t	\N
40932	INDIRECT	20	\N	6817	115	40922	\N	t	\N
40935	INDIRECT	20	6908	\N	113	40923	\N	t	\N
40934	INDIRECT	20	6908	\N	115	40922	\N	t	\N
40937	DIRECT	20	\N	6818	113	\N	\N	\N	\N
40936	DIRECT	20	\N	6818	115	\N	\N	\N	\N
40939	INDIRECT	20	\N	6819	113	40937	\N	t	\N
40938	INDIRECT	20	\N	6819	115	40936	\N	t	\N
40941	INDIRECT	20	6909	\N	115	40936	\N	t	\N
40940	INDIRECT	20	6909	\N	113	40937	\N	t	\N
40942	INDIRECT	20	\N	6820	113	40937	\N	t	\N
40943	INDIRECT	20	\N	6820	115	40936	\N	t	\N
40945	INDIRECT	20	6910	\N	115	40936	\N	t	\N
44090	INDIRECT	19	\N	7117	113	44084	\N	t	\N
44092	INDIRECT	19	7186	\N	113	44084	\N	t	\N
44093	INDIRECT	19	7186	\N	115	44085	\N	t	\N
44095	INDIRECT	19	\N	7084	113	44084	\N	t	\N
44094	INDIRECT	19	\N	7084	115	44085	\N	t	\N
44097	INDIRECT	19	6955	\N	115	44085	\N	t	\N
44096	INDIRECT	19	6955	\N	113	44084	\N	t	\N
44119	INDIRECT	19	\N	7122	115	44085	\N	t	\N
44118	INDIRECT	19	\N	7122	113	44084	\N	t	\N
44120	INDIRECT	19	7191	\N	115	44085	\N	t	\N
44121	INDIRECT	19	7191	\N	113	44084	\N	t	\N
44122	DIRECT	19	\N	7123	111	\N	\N	\N	\N
44124	INDIRECT	19	7192	\N	115	44123	\N	t	\N
97284	DIRECT	3	\N	90605	113	\N	\N	\N	\N
97283	DIRECT	3	\N	90605	115	\N	\N	\N	\N
97286	INDIRECT	3	90702	\N	115	97283	\N	t	\N
97285	INDIRECT	3	90702	\N	113	97284	\N	t	\N
97287	DIRECT	3	\N	90606	113	\N	\N	\N	\N
97288	DIRECT	3	\N	90606	115	\N	\N	\N	\N
97290	INDIRECT	3	90703	\N	115	97288	\N	t	\N
97289	INDIRECT	3	90703	\N	113	97287	\N	t	\N
44309	DIRECT	18	\N	6826	112	\N	\N	\N	\N
44310	INDIRECT	18	6915	\N	112	44309	\N	t	\N
40974	INDIRECT	20	6917	\N	115	40963	\N	t	\N
40977	INDIRECT	20	\N	6829	113	40962	\N	f	\N
40976	INDIRECT	20	\N	6829	115	40963	\N	t	\N
44311	DIRECT	18	\N	6829	44137	\N	\N	\N	\N
40978	INDIRECT	20	6918	\N	115	40963	\N	t	\N
44312	INDIRECT	18	6918	\N	44137	44311	\N	t	\N
40979	INDIRECT	20	6918	\N	113	40962	\N	f	\N
40980	INDIRECT	20	\N	6830	115	40963	\N	t	\N
40981	INDIRECT	20	\N	6830	113	40962	\N	f	\N
44313	DIRECT	18	\N	6830	44137	\N	\N	\N	\N
40983	INDIRECT	20	6919	\N	113	40962	\N	f	\N
44314	INDIRECT	18	6919	\N	44137	44313	\N	t	\N
40982	INDIRECT	20	6919	\N	115	40963	\N	t	\N
44125	INDIRECT	19	7192	\N	111	44122	\N	t	\N
44126	DIRECT	19	\N	7124	115	\N	\N	\N	\N
44127	DIRECT	19	\N	7124	113	\N	\N	\N	\N
44129	INDIRECT	19	7193	\N	115	44126	\N	t	\N
44128	INDIRECT	19	7193	\N	113	44127	\N	t	\N
97335	DIRECT	7	\N	90610	99889	\N	\N	\N	\N
97336	INDIRECT	7	90704	\N	99889	97335	\N	t	\N
97337	DIRECT	7	\N	90611	99889	\N	\N	\N	\N
97338	INDIRECT	7	90705	\N	99889	97337	\N	t	\N
97339	DIRECT	7	\N	90613	99889	\N	\N	\N	\N
97340	INDIRECT	7	90706	\N	99889	97339	\N	t	\N
97341	DIRECT	7	\N	90614	99889	\N	\N	\N	\N
97342	INDIRECT	7	90707	\N	99889	97341	\N	t	\N
39082	INDIRECT	21	\N	6304	113	39069	\N	t	\N
39083	INDIRECT	21	\N	6304	115	39068	\N	t	\N
39085	INDIRECT	21	6586	\N	115	39068	\N	t	\N
39084	INDIRECT	21	6586	\N	113	39069	\N	t	\N
39087	DIRECT	21	\N	6305	115	\N	\N	\N	\N
39088	INDIRECT	21	\N	6306	113	39086	\N	t	\N
39089	INDIRECT	21	\N	6306	115	39087	\N	t	\N
39091	INDIRECT	21	6587	\N	115	39087	\N	t	\N
39090	INDIRECT	21	6587	\N	113	39086	\N	t	\N
39093	INDIRECT	21	\N	6307	115	39087	\N	t	\N
39092	INDIRECT	21	\N	6307	113	39086	\N	t	\N
39094	INDIRECT	21	6588	\N	113	39086	\N	t	\N
39095	INDIRECT	21	6588	\N	115	39087	\N	t	\N
39097	INDIRECT	21	\N	6320	115	39087	\N	t	\N
39096	INDIRECT	21	\N	6320	113	39086	\N	t	\N
39099	INDIRECT	21	6598	\N	113	39086	\N	t	\N
39098	INDIRECT	21	6598	\N	115	39087	\N	t	\N
39101	DIRECT	21	\N	6321	113	\N	\N	\N	\N
39100	DIRECT	21	\N	6321	115	\N	\N	\N	\N
39103	INDIRECT	21	\N	6322	115	39100	\N	t	\N
39102	INDIRECT	21	\N	6322	113	39101	\N	t	\N
39105	INDIRECT	21	6599	\N	113	39101	\N	t	\N
39104	INDIRECT	21	6599	\N	115	39100	\N	t	\N
39107	INDIRECT	21	\N	6323	115	39100	\N	t	\N
39106	INDIRECT	21	\N	6323	113	39101	\N	t	\N
39109	INDIRECT	21	6600	\N	113	39101	\N	t	\N
39108	INDIRECT	21	6600	\N	115	39100	\N	t	\N
39110	DIRECT	21	\N	6339	115	\N	\N	\N	\N
39111	DIRECT	21	\N	6339	113	\N	\N	\N	\N
39112	INDIRECT	21	\N	6340	115	39110	\N	t	\N
39113	INDIRECT	21	\N	6340	113	39111	\N	t	\N
39115	INDIRECT	21	6613	\N	113	39111	\N	t	\N
39114	INDIRECT	21	6613	\N	115	39110	\N	t	\N
39116	INDIRECT	21	\N	6341	113	39111	\N	t	\N
39117	INDIRECT	21	\N	6341	115	39110	\N	t	\N
39119	INDIRECT	21	6614	\N	115	39110	\N	t	\N
39136	INDIRECT	21	6624	\N	113	39128	\N	t	\N
39138	DIRECT	21	\N	6674	115	\N	\N	\N	\N
39139	DIRECT	21	\N	6674	113	\N	\N	\N	\N
39141	INDIRECT	21	\N	6675	113	39139	\N	t	\N
39140	INDIRECT	21	\N	6675	115	39138	\N	t	\N
39143	INDIRECT	21	6634	\N	113	39139	\N	t	\N
44053	DIRECT	19	\N	7072	113	\N	\N	\N	\N
44061	INDIRECT	19	6948	\N	115	44052	\N	t	\N
44063	DIRECT	19	\N	7075	113	\N	\N	\N	\N
44062	DIRECT	19	\N	7075	115	\N	\N	\N	\N
44064	INDIRECT	19	\N	7076	115	44062	\N	t	\N
39118	INDIRECT	21	6614	\N	113	39111	\N	t	\N
39121	INDIRECT	21	\N	6342	115	39110	\N	t	\N
39120	INDIRECT	21	\N	6342	113	39111	\N	t	\N
39122	INDIRECT	21	6615	\N	113	39111	\N	t	\N
39123	INDIRECT	21	6615	\N	115	39110	\N	t	\N
39124	INDIRECT	21	\N	6343	113	39111	\N	t	\N
39125	INDIRECT	21	\N	6343	115	39110	\N	t	\N
39126	INDIRECT	21	6616	\N	115	39110	\N	t	\N
39127	INDIRECT	21	6616	\N	113	39111	\N	t	\N
39128	DIRECT	21	\N	6353	113	\N	\N	\N	\N
39129	DIRECT	21	\N	6353	115	\N	\N	\N	\N
39131	INDIRECT	21	\N	6354	113	39128	\N	t	\N
39130	INDIRECT	21	\N	6354	115	39129	\N	t	\N
39132	INDIRECT	21	6623	\N	113	39128	\N	t	\N
39133	INDIRECT	21	6623	\N	115	39129	\N	t	\N
39135	INDIRECT	21	\N	6355	113	39128	\N	t	\N
39134	INDIRECT	21	\N	6355	115	39129	\N	t	\N
39137	INDIRECT	21	6624	\N	115	39129	\N	t	\N
40917	DIRECT	20	\N	6676	113	\N	\N	\N	\N
40916	DIRECT	20	\N	6676	115	\N	\N	\N	\N
40919	INDIRECT	20	\N	6677	115	40916	\N	t	\N
40918	INDIRECT	20	\N	6677	113	40917	\N	t	\N
40920	INDIRECT	20	6635	\N	113	40917	\N	t	\N
40921	INDIRECT	20	6635	\N	115	40916	\N	t	\N
40923	DIRECT	20	\N	6815	113	\N	\N	\N	\N
40922	DIRECT	20	\N	6815	115	\N	\N	\N	\N
40925	INDIRECT	20	\N	6678	115	40922	\N	t	\N
40924	INDIRECT	20	\N	6678	113	40923	\N	t	\N
40926	INDIRECT	20	6636	\N	113	40923	\N	t	\N
40927	INDIRECT	20	6636	\N	115	40922	\N	t	\N
40929	INDIRECT	20	\N	6816	115	40922	\N	t	\N
40928	INDIRECT	20	\N	6816	113	40923	\N	t	\N
40930	INDIRECT	20	6907	\N	115	40922	\N	t	\N
40931	INDIRECT	20	6907	\N	113	40923	\N	t	\N
44325	DIRECT	17	\N	7077	111	\N	\N	\N	\N
44326	INDIRECT	17	6950	\N	111	44325	\N	t	\N
44099	INDIRECT	19	\N	7080	113	44084	\N	t	\N
44098	INDIRECT	19	\N	7080	115	44085	\N	t	\N
44100	INDIRECT	19	6952	\N	113	44084	\N	t	\N
44101	INDIRECT	19	6952	\N	115	44085	\N	t	\N
44103	INDIRECT	19	\N	7118	115	44085	\N	t	\N
44102	INDIRECT	19	\N	7118	113	44084	\N	t	\N
44105	INDIRECT	19	7187	\N	115	44085	\N	t	\N
44104	INDIRECT	19	7187	\N	113	44084	\N	t	\N
44107	INDIRECT	19	\N	7119	113	44084	\N	t	\N
44106	INDIRECT	19	\N	7119	115	44085	\N	t	\N
44109	INDIRECT	19	7188	\N	115	44085	\N	t	\N
44108	INDIRECT	19	7188	\N	113	44084	\N	t	\N
44110	INDIRECT	19	\N	7120	115	44085	\N	t	\N
44111	INDIRECT	19	\N	7120	113	44084	\N	t	\N
44113	INDIRECT	19	7189	\N	113	44084	\N	t	\N
44112	INDIRECT	19	7189	\N	115	44085	\N	t	\N
44115	INDIRECT	19	\N	7121	113	44084	\N	t	\N
44114	INDIRECT	19	\N	7121	115	44085	\N	t	\N
44116	INDIRECT	19	7190	\N	113	44084	\N	t	\N
44117	INDIRECT	19	7190	\N	115	44085	\N	t	\N
44123	DIRECT	19	\N	7123	115	\N	\N	\N	\N
39142	INDIRECT	21	6634	\N	115	39138	\N	t	\N
40944	INDIRECT	20	6910	\N	113	40937	\N	t	\N
40946	INDIRECT	20	\N	6821	113	40937	\N	t	\N
40947	INDIRECT	20	\N	6821	115	40936	\N	t	\N
40949	INDIRECT	20	6911	\N	115	40936	\N	t	\N
40948	INDIRECT	20	6911	\N	113	40937	\N	t	\N
40951	INDIRECT	20	\N	6822	115	40936	\N	t	\N
40950	INDIRECT	20	\N	6822	113	40937	\N	t	\N
40952	INDIRECT	20	6912	\N	115	40936	\N	t	\N
40953	INDIRECT	20	6912	\N	113	40937	\N	t	\N
40955	INDIRECT	20	\N	6823	113	40937	\N	t	\N
40954	INDIRECT	20	\N	6823	115	40936	\N	t	\N
40957	INDIRECT	20	6913	\N	115	40936	\N	t	\N
40956	INDIRECT	20	6913	\N	113	40937	\N	t	\N
40958	INDIRECT	20	\N	6824	113	40937	\N	t	\N
40959	INDIRECT	20	\N	6824	115	40936	\N	t	\N
40960	INDIRECT	20	6914	\N	113	40937	\N	t	\N
40961	INDIRECT	20	6914	\N	115	40936	\N	t	\N
40963	DIRECT	20	\N	6825	115	\N	\N	\N	\N
40962	DIRECT	20	\N	6825	113	\N	\N	\N	\N
40964	INDIRECT	20	\N	6826	113	40962	\N	f	\N
40965	INDIRECT	20	\N	6826	115	40963	\N	t	\N
40966	INDIRECT	20	6915	\N	113	40962	\N	f	\N
40967	INDIRECT	20	6915	\N	115	40963	\N	t	\N
40968	INDIRECT	20	\N	6827	113	40962	\N	t	\N
40969	INDIRECT	20	\N	6827	115	40963	\N	t	\N
40970	INDIRECT	20	6916	\N	113	40962	\N	t	\N
40971	INDIRECT	20	6916	\N	115	40963	\N	t	\N
40972	INDIRECT	20	\N	6828	113	40962	\N	t	\N
40973	INDIRECT	20	\N	6828	115	40963	\N	t	\N
40975	INDIRECT	20	6917	\N	113	40962	\N	t	\N
44052	DIRECT	19	\N	7072	115	\N	\N	\N	\N
44055	INDIRECT	19	\N	7073	113	44053	\N	t	\N
44054	INDIRECT	19	\N	7073	115	44052	\N	t	\N
44057	INDIRECT	19	6947	\N	115	44052	\N	t	\N
44056	INDIRECT	19	6947	\N	113	44053	\N	t	\N
44058	INDIRECT	19	\N	7074	115	44052	\N	t	\N
44059	INDIRECT	19	\N	7074	113	44053	\N	t	\N
44060	INDIRECT	19	6948	\N	113	44053	\N	t	\N
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, startdate, finishdate, isdeleted, criterion, resource, code) FROM stdin;
1421	3	2010-02-03 11:49:18.397	\N	f	115	1222	1421
1420	3	2010-02-03 11:49:18.641	\N	f	111	1222	1420
1418	5	2010-02-01 00:00:00	\N	f	113	1220	1418
1419	5	2010-02-01 00:00:00	\N	f	115	1220	1419
1415	4	2010-02-03 11:32:38.84	\N	f	111	1214	1415
1414	4	2010-02-03 11:32:28.538	\N	f	115	1214	1414
1427	2	2010-02-03 11:51:43.253	\N	f	113	1228	1427
1426	2	2010-02-03 11:51:51.152	\N	f	115	1228	1426
1422	2	2010-02-03 11:50:45.662	\N	f	115	1224	1422
1423	2	2010-02-03 11:50:45.80	\N	f	112	1224	1423
1435	4	2010-02-03 12:11:29.501	\N	f	119	1239	1435
91304	1	2010-02-16 09:39:09.883	\N	f	113	90901	a9d19354-98db-4172-9b97-37dc232a6090
91305	1	2010-02-16 09:39:15.062	\N	f	115	90901	e9eea0c2-bb44-4d82-be35-48cd9258cc77
1424	3	2009-02-03 00:00:00	\N	f	115	1226	1424
1425	3	2009-02-03 00:00:00	\N	f	111	1226	1425
91306	3	2010-01-01 00:00:00	\N	f	99889	90904	78aa841e-d3bc-422d-ae80-f6cbddbe6628
91307	3	2010-02-16 13:10:36.164	\N	f	99889	90906	b4e05509-8a41-4696-8214-2bf2706f2c88
1430	1	2010-02-03 12:01:27.187	\N	f	107	1232	1430
1431	1	2010-02-03 12:01:22.342	\N	f	118	1232	1431
1433	1	2010-02-03 12:02:38.699	\N	f	108	1234	1433
1432	2	2010-02-03 12:02:27.235	\N	f	118	1234	1432
1434	2	2010-02-03 12:06:04.997	\N	f	118	1236	1434
1416	6	2010-02-03 11:46:39.721	\N	f	115	1217	1416
1417	6	2010-02-03 11:46:26.79	\N	f	113	1217	1417
1429	2	2010-02-03 11:53:20.584	\N	f	113	1230	1429
1428	2	2010-02-03 11:53:20.404	\N	f	115	1230	1428
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
7	1	f628f992-3a23-4b8d-879c-ed86d3b8af5f	Tipo de máquina	\N	t	f	t	2
884736	8	9dd011b7-ab94-4374-a2c8-bc8c64512331	JOB	Job	t	t	t	1
884737	1	f3d03f3a-ea9f-46d9-9c0f-8d3f1768d345	LOCATION_GROUP	Location where the resource work	t	f	t	0
4	12	acb3c00d-ba8a-4f13-b8c1-5ff0abf04e50	Tipo de trabajo	Job	t	t	t	1
1	15	9851a32c-67f7-466f-9300-a88df217354a	LEAVE	Leave	f	f	t	1
3	9	fac04b2a-3a26-4be1-839b-a6a9b7b2ba71	TRAINING	Training courses and labor training	t	t	t	1
5	5	7eae9fec-5f5e-4352-ba17-f0043ea00397	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
6	3	0ca57206-77e8-4767-8a7a-97b8a79fe604	Localización	Location where the resource work	t	t	t	0
2	12	8e2eca53-284a-49ed-92d3-72aa70254602	CATEGORY	Professional category	t	t	t	1
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
4387	GENERIC_DAY	1	8	2010-02-19	1224	\N	3063	\N
4388	GENERIC_DAY	1	8	2010-02-15	1224	\N	3063	\N
4389	GENERIC_DAY	1	8	2010-02-16	1224	\N	3063	\N
4390	GENERIC_DAY	1	0	2010-02-20	1224	\N	3063	\N
4391	GENERIC_DAY	1	0	2010-02-06	1224	\N	3063	\N
4392	GENERIC_DAY	1	8	2010-02-12	1224	\N	3063	\N
4393	GENERIC_DAY	1	0	2010-02-21	1224	\N	3063	\N
4394	GENERIC_DAY	1	0	2010-02-13	1224	\N	3063	\N
4395	GENERIC_DAY	1	4	2010-02-23	1224	\N	3063	\N
2988	GENERIC_DAY	2	2	2010-02-01	1230	\N	2527	\N
2989	GENERIC_DAY	2	2	2010-02-02	1230	\N	2527	\N
2990	GENERIC_DAY	2	2	2010-02-02	1228	\N	2527	\N
2991	GENERIC_DAY	2	2	2010-02-02	1220	\N	2527	\N
2992	GENERIC_DAY	2	2	2010-02-01	1220	\N	2527	\N
2985	GENERIC_DAY	2	2	2010-02-01	1228	\N	2527	\N
2986	GENERIC_DAY	2	2	2010-02-02	1217	\N	2527	\N
2987	GENERIC_DAY	2	2	2010-02-01	1217	\N	2527	\N
4162	SPECIFIC_DAY	2	0	2010-02-28	1224	3053	\N	\N
4163	SPECIFIC_DAY	2	0	2010-02-27	1224	3053	\N	\N
4164	SPECIFIC_DAY	2	7	2010-03-01	1224	3053	\N	\N
2999	SPECIFIC_DAY	0	4	2010-02-03	1230	3032	\N	\N
3000	SPECIFIC_DAY	0	6	2010-02-02	1230	3032	\N	\N
3001	SPECIFIC_DAY	0	6	2010-02-01	1230	3032	\N	\N
4165	SPECIFIC_DAY	2	8	2010-02-26	1224	3053	\N	\N
4166	SPECIFIC_DAY	2	0	2010-02-21	1214	3054	\N	\N
4167	SPECIFIC_DAY	2	0	2010-02-20	1214	3054	\N	\N
4168	SPECIFIC_DAY	2	8	2010-02-22	1214	3054	\N	\N
4169	SPECIFIC_DAY	2	8	2010-02-25	1214	3054	\N	\N
4170	SPECIFIC_DAY	2	8	2010-02-24	1214	3054	\N	\N
4171	SPECIFIC_DAY	2	8	2010-02-23	1214	3054	\N	\N
4083	SPECIFIC_DAY	4	0	2010-02-20	1220	3043	\N	\N
4084	SPECIFIC_DAY	4	8	2010-02-09	1220	3043	\N	\N
4085	SPECIFIC_DAY	4	8	2010-02-12	1220	3043	\N	\N
4086	SPECIFIC_DAY	4	8	2010-02-22	1220	3043	\N	\N
4087	SPECIFIC_DAY	4	8	2010-02-16	1220	3043	\N	\N
4088	SPECIFIC_DAY	4	8	2010-02-19	1220	3043	\N	\N
4089	SPECIFIC_DAY	4	0	2010-02-13	1220	3043	\N	\N
4090	SPECIFIC_DAY	4	7	2010-02-23	1220	3043	\N	\N
4091	SPECIFIC_DAY	4	0	2010-02-17	1220	3043	\N	\N
4092	SPECIFIC_DAY	4	0	2010-02-07	1220	3043	\N	\N
4093	SPECIFIC_DAY	4	8	2010-02-11	1220	3043	\N	\N
4094	SPECIFIC_DAY	4	8	2010-02-18	1220	3043	\N	\N
4095	SPECIFIC_DAY	4	8	2010-02-08	1220	3043	\N	\N
4096	SPECIFIC_DAY	4	8	2010-02-15	1220	3043	\N	\N
4097	SPECIFIC_DAY	4	8	2010-02-10	1220	3043	\N	\N
4098	SPECIFIC_DAY	4	0	2010-02-21	1220	3043	\N	\N
4099	SPECIFIC_DAY	4	8	2010-02-04	1220	3043	\N	\N
4100	SPECIFIC_DAY	4	0	2010-02-06	1220	3043	\N	\N
4101	SPECIFIC_DAY	4	8	2010-02-05	1220	3043	\N	\N
4102	SPECIFIC_DAY	4	0	2010-02-14	1220	3043	\N	\N
4103	SPECIFIC_DAY	4	8	2010-03-01	1226	3044	\N	\N
4104	SPECIFIC_DAY	4	0	2010-02-27	1226	3044	\N	\N
4607	GENERIC_DAY	2	0	2010-02-08	1220	\N	3069	\N
4606	GENERIC_DAY	2	0	2010-02-07	1217	\N	3069	\N
4609	GENERIC_DAY	2	0	2010-02-07	1228	\N	3069	\N
4603	GENERIC_DAY	2	4	2010-02-05	1228	\N	3069	\N
4604	GENERIC_DAY	2	4	2010-02-08	1228	\N	3069	\N
4608	GENERIC_DAY	2	0	2010-02-10	1220	\N	3069	\N
4600	GENERIC_DAY	2	4	2010-02-05	1217	\N	3069	\N
4599	GENERIC_DAY	2	4	2010-02-10	1228	\N	3069	\N
4602	GENERIC_DAY	2	0	2010-02-06	1220	\N	3069	\N
4105	SPECIFIC_DAY	4	8	2010-02-23	1226	3044	\N	\N
4106	SPECIFIC_DAY	4	8	2010-02-25	1226	3044	\N	\N
4107	SPECIFIC_DAY	4	8	2010-02-24	1226	3044	\N	\N
4108	SPECIFIC_DAY	4	0	2010-02-28	1226	3044	\N	\N
4109	SPECIFIC_DAY	4	8	2010-03-02	1226	3044	\N	\N
4110	SPECIFIC_DAY	4	8	2010-02-26	1226	3044	\N	\N
4111	SPECIFIC_DAY	4	6	2010-03-03	1226	3044	\N	\N
4112	SPECIFIC_DAY	4	0	2010-02-07	1214	3045	\N	\N
4113	SPECIFIC_DAY	4	0	2010-02-06	1214	3045	\N	\N
4114	SPECIFIC_DAY	4	6	2010-02-09	1214	3045	\N	\N
4115	SPECIFIC_DAY	4	8	2010-02-05	1214	3045	\N	\N
4116	SPECIFIC_DAY	4	8	2010-02-04	1214	3045	\N	\N
4117	SPECIFIC_DAY	4	8	2010-02-08	1214	3045	\N	\N
4174	SPECIFIC_DAY	1	8	2010-02-04	1230	3056	\N	\N
4175	SPECIFIC_DAY	1	8	2010-02-05	1230	3056	\N	\N
4118	SPECIFIC_DAY	4	0	2010-02-21	1228	3046	\N	\N
4119	SPECIFIC_DAY	4	0	2010-02-20	1228	3046	\N	\N
4120	SPECIFIC_DAY	4	8	2010-02-22	1228	3046	\N	\N
4121	SPECIFIC_DAY	4	0	2010-02-14	1214	3047	\N	\N
4122	SPECIFIC_DAY	4	2	2010-02-19	1214	3047	\N	\N
4123	SPECIFIC_DAY	4	8	2010-02-16	1214	3047	\N	\N
4124	SPECIFIC_DAY	4	8	2010-02-15	1214	3047	\N	\N
4125	SPECIFIC_DAY	4	0	2010-02-17	1214	3047	\N	\N
4126	SPECIFIC_DAY	4	8	2010-02-11	1214	3047	\N	\N
4127	SPECIFIC_DAY	4	8	2010-02-10	1214	3047	\N	\N
4128	SPECIFIC_DAY	4	0	2010-02-13	1214	3047	\N	\N
4129	SPECIFIC_DAY	4	8	2010-02-12	1214	3047	\N	\N
4130	SPECIFIC_DAY	4	8	2010-02-18	1214	3047	\N	\N
4145	SPECIFIC_DAY	3	8	2010-03-04	1228	3050	\N	\N
4146	SPECIFIC_DAY	3	0	2010-03-06	1228	3050	\N	\N
4147	SPECIFIC_DAY	3	8	2010-03-03	1228	3050	\N	\N
4148	SPECIFIC_DAY	3	8	2010-03-09	1228	3050	\N	\N
4149	SPECIFIC_DAY	3	8	2010-03-05	1228	3050	\N	\N
4150	SPECIFIC_DAY	3	8	2010-03-08	1228	3050	\N	\N
4151	SPECIFIC_DAY	3	0	2010-03-07	1228	3050	\N	\N
4131	SPECIFIC_DAY	4	8	2010-03-02	1230	3048	\N	\N
4132	SPECIFIC_DAY	4	8	2010-03-01	1230	3048	\N	\N
4133	SPECIFIC_DAY	4	8	2010-02-25	1230	3048	\N	\N
4134	SPECIFIC_DAY	4	0	2010-02-28	1230	3048	\N	\N
4135	SPECIFIC_DAY	4	0	2010-02-27	1230	3048	\N	\N
4601	GENERIC_DAY	2	4	2010-02-08	1230	\N	3069	\N
4605	GENERIC_DAY	2	0	2010-02-05	1230	\N	3069	\N
4612	GENERIC_DAY	2	8	2010-02-10	1239	\N	3070	\N
4611	GENERIC_DAY	2	0	2010-02-07	1239	\N	3070	\N
4136	SPECIFIC_DAY	4	8	2010-02-24	1230	3048	\N	\N
4137	SPECIFIC_DAY	4	8	2010-02-26	1230	3048	\N	\N
4187	SPECIFIC_DAY	0	8	2010-02-09	1217	3059	\N	\N
4188	SPECIFIC_DAY	0	8	2010-02-08	1217	3059	\N	\N
4189	SPECIFIC_DAY	0	0	2010-02-06	1217	3059	\N	\N
4190	SPECIFIC_DAY	0	0	2010-02-07	1217	3059	\N	\N
4191	SPECIFIC_DAY	0	8	2010-02-10	1217	3059	\N	\N
4192	SPECIFIC_DAY	0	8	2010-02-16	1226	3060	\N	\N
4193	SPECIFIC_DAY	0	8	2010-02-12	1226	3060	\N	\N
4194	SPECIFIC_DAY	0	0	2010-02-14	1226	3060	\N	\N
4195	SPECIFIC_DAY	0	8	2010-02-15	1226	3060	\N	\N
4196	SPECIFIC_DAY	0	0	2010-02-13	1226	3060	\N	\N
4197	SPECIFIC_DAY	0	8	2010-02-11	1226	3060	\N	\N
4436	GENERIC_DAY	1	4	2010-03-11	1217	\N	3064	\N
4437	GENERIC_DAY	1	6	2010-03-08	1217	\N	3064	\N
4438	GENERIC_DAY	1	0	2010-03-04	1228	\N	3064	\N
4439	GENERIC_DAY	1	0	2010-02-25	1230	\N	3064	\N
4440	GENERIC_DAY	1	5	2010-03-09	1230	\N	3064	\N
4441	GENERIC_DAY	1	0	2010-03-06	1220	\N	3064	\N
4442	GENERIC_DAY	1	0	2010-02-28	1220	\N	3064	\N
4443	GENERIC_DAY	1	0	2010-03-08	1228	\N	3064	\N
4444	GENERIC_DAY	1	6	2010-02-25	1217	\N	3064	\N
4445	GENERIC_DAY	1	5	2010-03-05	1220	\N	3064	\N
4446	GENERIC_DAY	1	5	2010-03-09	1220	\N	3064	\N
4447	GENERIC_DAY	1	6	2010-03-02	1217	\N	3064	\N
4448	GENERIC_DAY	1	0	2010-02-27	1220	\N	3064	\N
4449	GENERIC_DAY	1	0	2010-03-07	1217	\N	3064	\N
4450	GENERIC_DAY	1	0	2010-03-06	1217	\N	3064	\N
4451	GENERIC_DAY	1	4	2010-03-11	1228	\N	3064	\N
4452	GENERIC_DAY	1	0	2010-02-27	1230	\N	3064	\N
4453	GENERIC_DAY	1	5	2010-03-04	1220	\N	3064	\N
4454	GENERIC_DAY	1	0	2010-02-27	1217	\N	3064	\N
4455	GENERIC_DAY	1	6	2010-02-24	1217	\N	3064	\N
4456	GENERIC_DAY	1	5	2010-03-05	1230	\N	3064	\N
4457	GENERIC_DAY	1	0	2010-03-09	1228	\N	3064	\N
4458	GENERIC_DAY	1	6	2010-03-01	1217	\N	3064	\N
4459	GENERIC_DAY	1	6	2010-02-26	1217	\N	3064	\N
4460	GENERIC_DAY	1	5	2010-03-02	1228	\N	3064	\N
4461	GENERIC_DAY	1	6	2010-03-09	1217	\N	3064	\N
4462	GENERIC_DAY	1	5	2010-02-26	1220	\N	3064	\N
4463	GENERIC_DAY	1	6	2010-03-05	1217	\N	3064	\N
4464	GENERIC_DAY	1	5	2010-02-24	1228	\N	3064	\N
4465	GENERIC_DAY	1	5	2010-03-08	1230	\N	3064	\N
4466	GENERIC_DAY	1	4	2010-03-10	1220	\N	3064	\N
4467	GENERIC_DAY	1	0	2010-03-05	1228	\N	3064	\N
4468	GENERIC_DAY	1	2	2010-03-12	1228	\N	3064	\N
4469	GENERIC_DAY	1	4	2010-03-10	1230	\N	3064	\N
4470	GENERIC_DAY	1	0	2010-02-28	1230	\N	3064	\N
4471	GENERIC_DAY	1	5	2010-02-25	1228	\N	3064	\N
4472	GENERIC_DAY	1	0	2010-03-01	1230	\N	3064	\N
4473	GENERIC_DAY	1	4	2010-03-11	1230	\N	3064	\N
4474	GENERIC_DAY	1	5	2010-03-02	1220	\N	3064	\N
4511	GENERIC_DAY	0	4	2010-02-26	1239	\N	3066	\N
4512	GENERIC_DAY	0	0	2010-02-21	1239	\N	3066	\N
4513	GENERIC_DAY	0	4	2010-03-01	1239	\N	3066	\N
4514	GENERIC_DAY	0	4	2010-02-12	1239	\N	3066	\N
4515	GENERIC_DAY	0	4	2010-03-11	1239	\N	3066	\N
4516	GENERIC_DAY	0	0	2010-02-27	1239	\N	3066	\N
4517	GENERIC_DAY	0	0	2010-02-20	1239	\N	3066	\N
4518	GENERIC_DAY	0	4	2010-03-02	1239	\N	3066	\N
4519	GENERIC_DAY	0	0	2010-02-14	1239	\N	3066	\N
4520	GENERIC_DAY	0	4	2010-02-19	1239	\N	3066	\N
4521	GENERIC_DAY	0	4	2010-03-10	1239	\N	3066	\N
4522	GENERIC_DAY	0	0	2010-02-28	1239	\N	3066	\N
4523	GENERIC_DAY	0	0	2010-03-06	1239	\N	3066	\N
4524	GENERIC_DAY	0	4	2010-02-23	1239	\N	3066	\N
4525	GENERIC_DAY	0	0	2010-02-07	1239	\N	3066	\N
4526	GENERIC_DAY	0	4	2010-02-11	1239	\N	3066	\N
4527	GENERIC_DAY	0	4	2010-02-24	1239	\N	3066	\N
4528	GENERIC_DAY	0	4	2010-02-25	1239	\N	3066	\N
4529	GENERIC_DAY	0	4	2010-03-08	1239	\N	3066	\N
4530	GENERIC_DAY	0	0	2010-02-13	1239	\N	3066	\N
4531	GENERIC_DAY	0	0	2010-03-07	1239	\N	3066	\N
4532	GENERIC_DAY	0	4	2010-03-09	1239	\N	3066	\N
4533	GENERIC_DAY	0	4	2010-02-16	1239	\N	3066	\N
4534	GENERIC_DAY	0	4	2010-03-05	1239	\N	3066	\N
4535	GENERIC_DAY	0	4	2010-02-18	1239	\N	3066	\N
4536	GENERIC_DAY	0	4	2010-02-08	1239	\N	3066	\N
4537	GENERIC_DAY	0	0	2010-02-06	1239	\N	3066	\N
4538	GENERIC_DAY	0	4	2010-02-05	1239	\N	3066	\N
4539	GENERIC_DAY	0	4	2010-02-15	1239	\N	3066	\N
4540	GENERIC_DAY	0	4	2010-02-09	1239	\N	3066	\N
4541	GENERIC_DAY	0	4	2010-02-04	1239	\N	3066	\N
4542	GENERIC_DAY	0	4	2010-02-22	1239	\N	3066	\N
4543	GENERIC_DAY	0	4	2010-03-04	1239	\N	3066	\N
4544	GENERIC_DAY	0	0	2010-02-17	1239	\N	3066	\N
4545	GENERIC_DAY	0	4	2010-03-03	1239	\N	3066	\N
4546	GENERIC_DAY	0	4	2010-02-10	1239	\N	3066	\N
4588	GENERIC_DAY	2	0	2010-02-06	1217	\N	3069	\N
4583	GENERIC_DAY	2	0	2010-02-04	1230	\N	3069	\N
4585	GENERIC_DAY	2	4	2010-02-09	1228	\N	3069	\N
4598	GENERIC_DAY	2	4	2010-02-04	1228	\N	3069	\N
4592	GENERIC_DAY	2	0	2010-02-09	1220	\N	3069	\N
4587	GENERIC_DAY	2	4	2010-02-10	1230	\N	3069	\N
4591	GENERIC_DAY	2	0	2010-02-06	1228	\N	3069	\N
4596	GENERIC_DAY	2	0	2010-02-05	1220	\N	3069	\N
4586	GENERIC_DAY	2	0	2010-02-08	1217	\N	3069	\N
4597	GENERIC_DAY	2	0	2010-02-10	1217	\N	3069	\N
4593	GENERIC_DAY	2	4	2010-02-04	1217	\N	3069	\N
4582	GENERIC_DAY	2	0	2010-02-07	1220	\N	3069	\N
4396	GENERIC_DAY	1	8	2010-02-08	1224	\N	3063	\N
4397	GENERIC_DAY	1	8	2010-02-10	1224	\N	3063	\N
4398	GENERIC_DAY	1	8	2010-02-22	1224	\N	3063	\N
4399	GENERIC_DAY	1	8	2010-02-18	1224	\N	3063	\N
4400	GENERIC_DAY	1	0	2010-02-14	1224	\N	3063	\N
4401	GENERIC_DAY	1	0	2010-02-17	1224	\N	3063	\N
4402	GENERIC_DAY	1	8	2010-02-11	1224	\N	3063	\N
4403	GENERIC_DAY	1	8	2010-02-04	1224	\N	3063	\N
4404	GENERIC_DAY	1	0	2010-02-07	1224	\N	3063	\N
4405	GENERIC_DAY	1	8	2010-02-09	1224	\N	3063	\N
4406	GENERIC_DAY	1	8	2010-02-05	1224	\N	3063	\N
4407	GENERIC_DAY	1	0	2010-02-26	1230	\N	3064	\N
4408	GENERIC_DAY	1	6	2010-03-04	1217	\N	3064	\N
4409	GENERIC_DAY	1	0	2010-03-07	1230	\N	3064	\N
4410	GENERIC_DAY	1	0	2010-03-02	1230	\N	3064	\N
4411	GENERIC_DAY	1	0	2010-02-28	1217	\N	3064	\N
4412	GENERIC_DAY	1	4	2010-03-10	1217	\N	3064	\N
4413	GENERIC_DAY	1	4	2010-03-10	1228	\N	3064	\N
4414	GENERIC_DAY	1	0	2010-03-03	1228	\N	3064	\N
4415	GENERIC_DAY	1	5	2010-03-08	1220	\N	3064	\N
4416	GENERIC_DAY	1	5	2010-03-01	1228	\N	3064	\N
4417	GENERIC_DAY	1	5	2010-03-03	1230	\N	3064	\N
4418	GENERIC_DAY	1	0	2010-02-24	1230	\N	3064	\N
4419	GENERIC_DAY	1	0	2010-03-06	1230	\N	3064	\N
4420	GENERIC_DAY	1	0	2010-03-07	1228	\N	3064	\N
4421	GENERIC_DAY	1	0	2010-03-06	1228	\N	3064	\N
4422	GENERIC_DAY	1	4	2010-03-11	1220	\N	3064	\N
4423	GENERIC_DAY	1	0	2010-03-07	1220	\N	3064	\N
4424	GENERIC_DAY	1	5	2010-02-26	1228	\N	3064	\N
4425	GENERIC_DAY	1	2	2010-03-12	1217	\N	3064	\N
4426	GENERIC_DAY	1	2	2010-03-12	1220	\N	3064	\N
4427	GENERIC_DAY	1	0	2010-02-27	1228	\N	3064	\N
4428	GENERIC_DAY	1	5	2010-03-01	1220	\N	3064	\N
4429	GENERIC_DAY	1	0	2010-02-28	1228	\N	3064	\N
4430	GENERIC_DAY	1	5	2010-02-24	1220	\N	3064	\N
4431	GENERIC_DAY	1	6	2010-03-03	1217	\N	3064	\N
4432	GENERIC_DAY	1	5	2010-03-03	1220	\N	3064	\N
4433	GENERIC_DAY	1	5	2010-03-04	1230	\N	3064	\N
4434	GENERIC_DAY	1	5	2010-02-25	1220	\N	3064	\N
4435	GENERIC_DAY	1	2	2010-03-12	1230	\N	3064	\N
4595	GENERIC_DAY	2	4	2010-02-09	1230	\N	3069	\N
4584	GENERIC_DAY	2	0	2010-02-07	1230	\N	3069	\N
4589	GENERIC_DAY	2	0	2010-02-04	1220	\N	3069	\N
4594	GENERIC_DAY	2	0	2010-02-06	1230	\N	3069	\N
4590	GENERIC_DAY	2	0	2010-02-09	1217	\N	3069	\N
4615	GENERIC_DAY	2	0	2010-02-06	1239	\N	3070	\N
4613	GENERIC_DAY	2	8	2010-02-08	1239	\N	3070	\N
4610	GENERIC_DAY	2	8	2010-02-05	1239	\N	3070	\N
4616	GENERIC_DAY	2	8	2010-02-04	1239	\N	3070	\N
4614	GENERIC_DAY	2	8	2010-02-09	1239	\N	3070	\N
5320	SPECIFIC_DAY	0	8	2010-02-18	1236	5051	\N	\N
5321	SPECIFIC_DAY	0	0	2010-02-06	1236	5051	\N	\N
5322	SPECIFIC_DAY	0	8	2010-02-10	1236	5051	\N	\N
5323	SPECIFIC_DAY	0	0	2010-02-21	1236	5051	\N	\N
5324	SPECIFIC_DAY	0	8	2010-02-22	1236	5051	\N	\N
5325	SPECIFIC_DAY	0	8	2010-02-15	1236	5051	\N	\N
5326	SPECIFIC_DAY	0	0	2010-02-07	1236	5051	\N	\N
5327	SPECIFIC_DAY	0	8	2010-02-12	1236	5051	\N	\N
5328	SPECIFIC_DAY	0	8	2010-02-16	1236	5051	\N	\N
5329	SPECIFIC_DAY	0	4	2010-02-23	1236	5051	\N	\N
5330	SPECIFIC_DAY	0	8	2010-02-11	1236	5051	\N	\N
5331	SPECIFIC_DAY	0	8	2010-02-05	1236	5051	\N	\N
5332	SPECIFIC_DAY	0	0	2010-02-13	1236	5051	\N	\N
5333	SPECIFIC_DAY	0	8	2010-02-19	1236	5051	\N	\N
5334	SPECIFIC_DAY	0	8	2010-02-08	1236	5051	\N	\N
5335	SPECIFIC_DAY	0	8	2010-02-09	1236	5051	\N	\N
5336	SPECIFIC_DAY	0	8	2010-02-04	1236	5051	\N	\N
5337	SPECIFIC_DAY	0	0	2010-02-20	1236	5051	\N	\N
5338	SPECIFIC_DAY	0	0	2010-02-17	1236	5051	\N	\N
5339	SPECIFIC_DAY	0	0	2010-02-14	1236	5051	\N	\N
5296	DERIVED_DAY	0	2	2010-02-16	1214	\N	\N	5152
5297	DERIVED_DAY	0	2	2010-02-04	1224	\N	\N	5152
5298	DERIVED_DAY	0	2	2010-02-11	1224	\N	\N	5152
5299	DERIVED_DAY	0	2	2010-02-15	1214	\N	\N	5152
5300	DERIVED_DAY	0	2	2010-02-04	1214	\N	\N	5152
5301	DERIVED_DAY	0	2	2010-02-15	1224	\N	\N	5152
5302	DERIVED_DAY	0	2	2010-02-22	1224	\N	\N	5152
5303	DERIVED_DAY	0	2	2010-02-05	1224	\N	\N	5152
5304	DERIVED_DAY	0	3	2010-02-09	1214	\N	\N	5152
5305	DERIVED_DAY	0	2	2010-02-16	1224	\N	\N	5152
5306	DERIVED_DAY	0	2	2010-02-12	1214	\N	\N	5152
5307	DERIVED_DAY	0	2	2010-02-10	1214	\N	\N	5152
5308	DERIVED_DAY	0	2	2010-02-18	1214	\N	\N	5152
5309	DERIVED_DAY	0	2	2010-02-12	1224	\N	\N	5152
5310	DERIVED_DAY	0	2	2010-02-10	1224	\N	\N	5152
5311	DERIVED_DAY	0	2	2010-02-23	1224	\N	\N	5152
5312	DERIVED_DAY	0	2	2010-02-11	1214	\N	\N	5152
5313	DERIVED_DAY	0	4	2010-02-19	1214	\N	\N	5152
5314	DERIVED_DAY	0	1	2010-02-09	1224	\N	\N	5152
5315	DERIVED_DAY	0	2	2010-02-18	1224	\N	\N	5152
5316	DERIVED_DAY	0	2	2010-02-08	1224	\N	\N	5152
5317	DERIVED_DAY	0	2	2010-02-22	1214	\N	\N	5152
5318	DERIVED_DAY	0	2	2010-02-05	1214	\N	\N	5152
5319	DERIVED_DAY	0	2	2010-02-08	1214	\N	\N	5152
89491	SPECIFIC_DAY	1	1	2010-04-27	1226	89399	\N	\N
89492	SPECIFIC_DAY	1	8	2010-04-26	1226	89399	\N	\N
89493	SPECIFIC_DAY	1	0	2010-04-24	1226	89399	\N	\N
89494	SPECIFIC_DAY	1	8	2010-04-23	1226	89399	\N	\N
89495	SPECIFIC_DAY	1	0	2010-04-25	1226	89399	\N	\N
89496	SPECIFIC_DAY	1	8	2010-04-22	1226	89399	\N	\N
89497	SPECIFIC_DAY	1	8	2010-04-21	1226	89399	\N	\N
89498	SPECIFIC_DAY	1	8	2010-04-26	1217	89400	\N	\N
89499	SPECIFIC_DAY	1	0	2010-04-24	1217	89400	\N	\N
89500	SPECIFIC_DAY	1	8	2010-04-23	1217	89400	\N	\N
89501	SPECIFIC_DAY	1	2	2010-04-27	1217	89400	\N	\N
89502	SPECIFIC_DAY	1	0	2010-04-25	1217	89400	\N	\N
89503	SPECIFIC_DAY	1	8	2010-04-21	1217	89400	\N	\N
89504	SPECIFIC_DAY	1	8	2010-04-22	1217	89400	\N	\N
89505	SPECIFIC_DAY	1	8	2010-04-21	1222	89401	\N	\N
89506	SPECIFIC_DAY	1	8	2010-04-26	1222	89401	\N	\N
89507	SPECIFIC_DAY	1	8	2010-04-23	1222	89401	\N	\N
89508	SPECIFIC_DAY	1	8	2010-04-22	1222	89401	\N	\N
89509	SPECIFIC_DAY	1	0	2010-04-24	1222	89401	\N	\N
89510	SPECIFIC_DAY	1	1	2010-04-27	1222	89401	\N	\N
89511	SPECIFIC_DAY	1	0	2010-04-25	1222	89401	\N	\N
89512	SPECIFIC_DAY	1	0	2010-05-01	1220	89402	\N	\N
89513	SPECIFIC_DAY	1	8	2010-04-30	1220	89402	\N	\N
89514	SPECIFIC_DAY	1	0	2010-05-02	1220	89402	\N	\N
89515	SPECIFIC_DAY	1	8	2010-04-28	1220	89402	\N	\N
89516	SPECIFIC_DAY	1	8	2010-05-03	1220	89402	\N	\N
89517	SPECIFIC_DAY	1	2	2010-05-04	1220	89402	\N	\N
89518	SPECIFIC_DAY	1	8	2010-04-29	1220	89402	\N	\N
89519	SPECIFIC_DAY	1	8	2010-04-29	1228	89403	\N	\N
89520	SPECIFIC_DAY	1	8	2010-04-28	1228	89403	\N	\N
89521	SPECIFIC_DAY	1	0	2010-05-02	1228	89403	\N	\N
89522	SPECIFIC_DAY	1	1	2010-05-04	1228	89403	\N	\N
89523	SPECIFIC_DAY	1	8	2010-05-03	1228	89403	\N	\N
89524	SPECIFIC_DAY	1	0	2010-05-01	1228	89403	\N	\N
89525	SPECIFIC_DAY	1	8	2010-04-30	1228	89403	\N	\N
89526	SPECIFIC_DAY	1	8	2010-04-29	1224	89404	\N	\N
89527	SPECIFIC_DAY	1	0	2010-05-02	1224	89404	\N	\N
89528	SPECIFIC_DAY	1	8	2010-05-03	1224	89404	\N	\N
89529	SPECIFIC_DAY	1	8	2010-04-30	1224	89404	\N	\N
89530	SPECIFIC_DAY	1	0	2010-05-01	1224	89404	\N	\N
89531	SPECIFIC_DAY	1	1	2010-05-04	1224	89404	\N	\N
89532	SPECIFIC_DAY	1	8	2010-04-28	1224	89404	\N	\N
89533	SPECIFIC_DAY	1	6	2010-04-27	1224	89405	\N	\N
89534	SPECIFIC_DAY	1	6	2010-04-22	1224	89405	\N	\N
89535	SPECIFIC_DAY	1	5	2010-04-30	1224	89405	\N	\N
89536	SPECIFIC_DAY	1	6	2010-04-21	1224	89405	\N	\N
89537	SPECIFIC_DAY	1	6	2010-04-26	1224	89405	\N	\N
89538	SPECIFIC_DAY	1	6	2010-04-23	1224	89405	\N	\N
89539	SPECIFIC_DAY	1	5	2010-05-04	1224	89405	\N	\N
89540	SPECIFIC_DAY	1	5	2010-04-29	1224	89405	\N	\N
89541	SPECIFIC_DAY	1	6	2010-04-28	1224	89405	\N	\N
89542	SPECIFIC_DAY	1	5	2010-05-03	1224	89405	\N	\N
90496	SPECIFIC_DAY	0	8	2010-04-22	1226	86460	\N	\N
90497	SPECIFIC_DAY	0	8	2010-05-07	1226	86460	\N	\N
90498	SPECIFIC_DAY	0	0	2010-05-01	1226	86460	\N	\N
90499	SPECIFIC_DAY	0	8	2010-05-03	1226	86460	\N	\N
90500	SPECIFIC_DAY	0	8	2010-06-02	1226	86460	\N	\N
90501	SPECIFIC_DAY	0	8	2010-05-14	1226	86460	\N	\N
90502	SPECIFIC_DAY	0	8	2010-04-23	1226	86460	\N	\N
90503	SPECIFIC_DAY	0	0	2010-05-30	1226	86460	\N	\N
90504	SPECIFIC_DAY	0	0	2010-05-22	1226	86460	\N	\N
90505	SPECIFIC_DAY	0	0	2010-05-02	1226	86460	\N	\N
90506	SPECIFIC_DAY	0	8	2010-04-21	1226	86460	\N	\N
90507	SPECIFIC_DAY	0	8	2010-05-24	1226	86460	\N	\N
90508	SPECIFIC_DAY	0	8	2010-05-10	1226	86460	\N	\N
90509	SPECIFIC_DAY	0	8	2010-04-28	1226	86460	\N	\N
90510	SPECIFIC_DAY	0	0	2010-04-25	1226	86460	\N	\N
90511	SPECIFIC_DAY	0	8	2010-05-25	1226	86460	\N	\N
90512	SPECIFIC_DAY	0	8	2010-05-06	1226	86460	\N	\N
90513	SPECIFIC_DAY	0	8	2010-04-29	1226	86460	\N	\N
90514	SPECIFIC_DAY	0	0	2010-05-23	1226	86460	\N	\N
90515	SPECIFIC_DAY	0	8	2010-05-04	1226	86460	\N	\N
90516	SPECIFIC_DAY	0	0	2010-05-29	1226	86460	\N	\N
90517	SPECIFIC_DAY	0	0	2010-05-16	1226	86460	\N	\N
90518	SPECIFIC_DAY	0	8	2010-05-12	1226	86460	\N	\N
90519	SPECIFIC_DAY	0	8	2010-04-26	1226	86460	\N	\N
90520	SPECIFIC_DAY	0	8	2010-05-13	1226	86460	\N	\N
90521	SPECIFIC_DAY	0	8	2010-04-30	1226	86460	\N	\N
90522	SPECIFIC_DAY	0	8	2010-04-27	1226	86460	\N	\N
90523	SPECIFIC_DAY	0	8	2010-06-01	1226	86460	\N	\N
90524	SPECIFIC_DAY	0	8	2010-05-20	1226	86460	\N	\N
90525	SPECIFIC_DAY	0	8	2010-05-18	1226	86460	\N	\N
90526	SPECIFIC_DAY	0	8	2010-05-19	1226	86460	\N	\N
90527	SPECIFIC_DAY	0	8	2010-05-28	1226	86460	\N	\N
90528	SPECIFIC_DAY	0	0	2010-05-15	1226	86460	\N	\N
90529	SPECIFIC_DAY	0	0	2010-05-08	1226	86460	\N	\N
90530	SPECIFIC_DAY	0	8	2010-05-31	1226	86460	\N	\N
90531	SPECIFIC_DAY	0	0	2010-05-17	1226	86460	\N	\N
90532	SPECIFIC_DAY	0	8	2010-05-11	1226	86460	\N	\N
90533	SPECIFIC_DAY	0	8	2010-05-05	1226	86460	\N	\N
90534	SPECIFIC_DAY	0	8	2010-06-04	1226	86460	\N	\N
90535	SPECIFIC_DAY	0	0	2010-04-24	1226	86460	\N	\N
90536	SPECIFIC_DAY	0	8	2010-05-26	1226	86460	\N	\N
90537	SPECIFIC_DAY	0	0	2010-05-09	1226	86460	\N	\N
90538	SPECIFIC_DAY	0	8	2010-06-03	1226	86460	\N	\N
90539	SPECIFIC_DAY	0	8	2010-05-21	1226	86460	\N	\N
90540	SPECIFIC_DAY	0	8	2010-05-27	1226	86460	\N	\N
87121	SPECIFIC_DAY	1	8	2010-02-12	1220	86458	\N	\N
87118	SPECIFIC_DAY	1	8	2010-02-22	1220	86458	\N	\N
87138	SPECIFIC_DAY	1	0	2010-03-20	1220	86458	\N	\N
87115	SPECIFIC_DAY	1	8	2010-03-12	1220	86458	\N	\N
87124	SPECIFIC_DAY	1	8	2010-03-16	1220	86458	\N	\N
87131	SPECIFIC_DAY	1	0	2010-02-13	1220	86458	\N	\N
87120	SPECIFIC_DAY	1	8	2010-02-26	1220	86458	\N	\N
87107	SPECIFIC_DAY	1	8	2010-03-04	1220	86458	\N	\N
87149	SPECIFIC_DAY	1	8	2010-03-15	1220	86458	\N	\N
87106	SPECIFIC_DAY	1	8	2010-02-19	1220	86458	\N	\N
87123	SPECIFIC_DAY	1	0	2010-03-28	1220	86458	\N	\N
87113	SPECIFIC_DAY	1	8	2010-02-24	1220	86458	\N	\N
87145	SPECIFIC_DAY	1	0	2010-02-27	1220	86458	\N	\N
87143	SPECIFIC_DAY	1	0	2010-02-14	1220	86458	\N	\N
87110	SPECIFIC_DAY	1	8	2010-02-16	1220	86458	\N	\N
87108	SPECIFIC_DAY	1	8	2010-02-18	1220	86458	\N	\N
87111	SPECIFIC_DAY	1	0	2010-02-28	1220	86458	\N	\N
87103	SPECIFIC_DAY	1	8	2010-03-03	1220	86458	\N	\N
87119	SPECIFIC_DAY	1	8	2010-02-25	1220	86458	\N	\N
87128	SPECIFIC_DAY	1	8	2010-03-17	1220	86458	\N	\N
87146	SPECIFIC_DAY	1	0	2010-03-19	1220	86458	\N	\N
87139	SPECIFIC_DAY	1	8	2010-03-30	1220	86458	\N	\N
87104	SPECIFIC_DAY	1	8	2010-03-01	1220	86458	\N	\N
87140	SPECIFIC_DAY	1	8	2010-03-09	1220	86458	\N	\N
87129	SPECIFIC_DAY	1	8	2010-02-15	1220	86458	\N	\N
87125	SPECIFIC_DAY	1	8	2010-03-02	1220	86458	\N	\N
87148	SPECIFIC_DAY	1	8	2010-03-23	1220	86458	\N	\N
87127	SPECIFIC_DAY	1	8	2010-03-29	1220	86458	\N	\N
87147	SPECIFIC_DAY	1	0	2010-03-07	1220	86458	\N	\N
87132	SPECIFIC_DAY	1	8	2010-03-25	1220	86458	\N	\N
87126	SPECIFIC_DAY	1	8	2010-03-10	1220	86458	\N	\N
87109	SPECIFIC_DAY	1	0	2010-03-21	1220	86458	\N	\N
87117	SPECIFIC_DAY	1	8	2010-03-05	1220	86458	\N	\N
87116	SPECIFIC_DAY	1	0	2010-02-21	1220	86458	\N	\N
87142	SPECIFIC_DAY	1	8	2010-02-23	1220	86458	\N	\N
87130	SPECIFIC_DAY	1	0	2010-03-27	1220	86458	\N	\N
114026	GENERIC_DAY	4	8	2010-02-18	90904	\N	97578	\N
114029	GENERIC_DAY	4	0	2010-02-28	90904	\N	97578	\N
114025	GENERIC_DAY	4	8	2010-02-25	90904	\N	97578	\N
114039	GENERIC_DAY	4	8	2010-02-19	90904	\N	97578	\N
114032	GENERIC_DAY	4	0	2010-02-17	90906	\N	97578	\N
114028	GENERIC_DAY	4	0	2010-02-27	90906	\N	97578	\N
114042	GENERIC_DAY	4	8	2010-02-25	90906	\N	97578	\N
114027	GENERIC_DAY	4	8	2010-02-24	90904	\N	97578	\N
114023	GENERIC_DAY	4	8	2010-02-23	90906	\N	97578	\N
114024	GENERIC_DAY	4	8	2010-02-22	90906	\N	97578	\N
114022	GENERIC_DAY	4	8	2010-03-02	90906	\N	97578	\N
114044	GENERIC_DAY	4	0	2010-02-20	90904	\N	97578	\N
114038	GENERIC_DAY	4	0	2010-02-27	90904	\N	97578	\N
114043	GENERIC_DAY	4	0	2010-02-28	90906	\N	97578	\N
114021	GENERIC_DAY	4	0	2010-02-21	90904	\N	97578	\N
114046	GENERIC_DAY	4	8	2010-02-16	90904	\N	97578	\N
114034	GENERIC_DAY	4	0	2010-02-20	90906	\N	97578	\N
114037	GENERIC_DAY	4	8	2010-02-26	90906	\N	97578	\N
114031	GENERIC_DAY	4	8	2010-02-18	90906	\N	97578	\N
114019	GENERIC_DAY	4	0	2010-02-21	90906	\N	97578	\N
114035	GENERIC_DAY	4	8	2010-02-26	90904	\N	97578	\N
114036	GENERIC_DAY	4	8	2010-02-24	90906	\N	97578	\N
114047	GENERIC_DAY	4	8	2010-02-23	90904	\N	97578	\N
114020	GENERIC_DAY	4	8	2010-03-01	90904	\N	97578	\N
114033	GENERIC_DAY	4	8	2010-03-01	90906	\N	97578	\N
114045	GENERIC_DAY	4	8	2010-02-16	90906	\N	97578	\N
114040	GENERIC_DAY	4	8	2010-02-22	90904	\N	97578	\N
114041	GENERIC_DAY	4	8	2010-02-19	90906	\N	97578	\N
114030	GENERIC_DAY	4	0	2010-02-17	90904	\N	97578	\N
114048	GENERIC_DAY	4	8	2010-03-02	90904	\N	97578	\N
99555	GENERIC_DAY	0	0	2010-01-23	1228	\N	97567	\N
99556	GENERIC_DAY	0	2	2010-02-05	1220	\N	97567	\N
99557	GENERIC_DAY	0	4	2010-02-01	90901	\N	97567	\N
99558	GENERIC_DAY	0	0	2010-02-21	1230	\N	97567	\N
99559	GENERIC_DAY	0	2	2010-02-05	1217	\N	97567	\N
99560	GENERIC_DAY	0	2	2010-02-10	1228	\N	97567	\N
99561	GENERIC_DAY	0	3	2010-02-24	1217	\N	97567	\N
99562	GENERIC_DAY	0	4	2010-02-23	1217	\N	97567	\N
99563	GENERIC_DAY	0	5	2010-02-12	1228	\N	97567	\N
99564	GENERIC_DAY	0	0	2010-01-17	1228	\N	97567	\N
99565	GENERIC_DAY	0	2	2010-02-25	1217	\N	97567	\N
99566	GENERIC_DAY	0	7	2010-02-22	1217	\N	97567	\N
99567	GENERIC_DAY	0	0	2010-01-24	90901	\N	97567	\N
99568	GENERIC_DAY	0	3	2010-02-11	1228	\N	97567	\N
99569	GENERIC_DAY	0	0	2010-02-17	1230	\N	97567	\N
99570	GENERIC_DAY	0	2	2010-01-20	1220	\N	97567	\N
99571	GENERIC_DAY	0	0	2010-01-27	90901	\N	97567	\N
99572	GENERIC_DAY	0	3	2010-02-10	1230	\N	97567	\N
99573	GENERIC_DAY	0	0	2010-02-13	1228	\N	97567	\N
99574	GENERIC_DAY	0	5	2010-02-18	1228	\N	97567	\N
99575	GENERIC_DAY	0	0	2010-02-21	1220	\N	97567	\N
99576	GENERIC_DAY	0	6	2010-02-09	90901	\N	97567	\N
99577	GENERIC_DAY	0	3	2010-02-18	1217	\N	97567	\N
99578	GENERIC_DAY	0	3	2010-01-22	90901	\N	97567	\N
99579	GENERIC_DAY	0	4	2010-02-12	1230	\N	97567	\N
99580	GENERIC_DAY	0	1	2010-02-02	1230	\N	97567	\N
99581	GENERIC_DAY	0	5	2010-02-23	1228	\N	97567	\N
99582	GENERIC_DAY	0	0	2010-02-14	1217	\N	97567	\N
99583	GENERIC_DAY	0	3	2010-02-03	1230	\N	97567	\N
99584	GENERIC_DAY	0	4	2010-01-27	1220	\N	97567	\N
99585	GENERIC_DAY	0	0	2010-01-23	1217	\N	97567	\N
99586	GENERIC_DAY	0	0	2010-02-22	1228	\N	97567	\N
99587	GENERIC_DAY	0	3	2010-01-19	1230	\N	97567	\N
99588	GENERIC_DAY	0	2	2010-02-12	90901	\N	97567	\N
99589	GENERIC_DAY	0	2	2010-02-15	90901	\N	97567	\N
99590	GENERIC_DAY	0	1	2010-01-19	1217	\N	97567	\N
99591	GENERIC_DAY	0	0	2010-01-17	1230	\N	97567	\N
99592	GENERIC_DAY	0	2	2010-01-22	1228	\N	97567	\N
99593	GENERIC_DAY	0	2	2010-01-29	1217	\N	97567	\N
99594	GENERIC_DAY	0	0	2010-02-20	1230	\N	97567	\N
99595	GENERIC_DAY	0	3	2010-02-09	1230	\N	97567	\N
99596	GENERIC_DAY	0	4	2010-01-26	1230	\N	97567	\N
99597	GENERIC_DAY	0	0	2010-02-24	1220	\N	97567	\N
99598	GENERIC_DAY	0	0	2010-01-30	1220	\N	97567	\N
99599	GENERIC_DAY	0	4	2010-01-29	1228	\N	97567	\N
99600	GENERIC_DAY	0	4	2010-01-19	1220	\N	97567	\N
99601	GENERIC_DAY	0	3	2010-01-19	1228	\N	97567	\N
99602	GENERIC_DAY	0	5	2010-02-23	1230	\N	97567	\N
99603	GENERIC_DAY	0	5	2010-02-19	1228	\N	97567	\N
99604	GENERIC_DAY	0	0	2010-02-07	1217	\N	97567	\N
99605	GENERIC_DAY	0	0	2010-02-07	1228	\N	97567	\N
99606	GENERIC_DAY	0	0	2010-02-06	1220	\N	97567	\N
99607	GENERIC_DAY	0	3	2010-01-20	90901	\N	97567	\N
99608	GENERIC_DAY	0	0	2010-01-16	1217	\N	97567	\N
99609	GENERIC_DAY	0	3	2010-01-15	1228	\N	97567	\N
99610	GENERIC_DAY	0	4	2010-01-26	1228	\N	97567	\N
99611	GENERIC_DAY	0	0	2010-01-16	90901	\N	97567	\N
99612	GENERIC_DAY	0	0	2010-02-15	1220	\N	97567	\N
99613	GENERIC_DAY	0	5	2010-02-24	1228	\N	97567	\N
99614	GENERIC_DAY	0	6	2010-02-11	1230	\N	97567	\N
99615	GENERIC_DAY	0	0	2010-01-24	1228	\N	97567	\N
99616	GENERIC_DAY	0	0	2010-01-30	1230	\N	97567	\N
99617	GENERIC_DAY	0	0	2010-02-07	90901	\N	97567	\N
99618	GENERIC_DAY	0	2	2010-01-25	1228	\N	97567	\N
99619	GENERIC_DAY	0	3	2010-01-18	1230	\N	97567	\N
99620	GENERIC_DAY	0	0	2010-02-06	1230	\N	97567	\N
99621	GENERIC_DAY	0	0	2010-01-23	1220	\N	97567	\N
99622	GENERIC_DAY	0	0	2010-02-06	1217	\N	97567	\N
99623	GENERIC_DAY	0	4	2010-01-28	1228	\N	97567	\N
99624	GENERIC_DAY	0	2	2010-02-09	1220	\N	97567	\N
99625	GENERIC_DAY	0	3	2010-02-08	1230	\N	97567	\N
99626	GENERIC_DAY	0	0	2010-02-20	1217	\N	97567	\N
99627	GENERIC_DAY	0	0	2010-01-31	1217	\N	97567	\N
99628	GENERIC_DAY	0	0	2010-01-31	90901	\N	97567	\N
99629	GENERIC_DAY	0	0	2010-01-16	1228	\N	97567	\N
99630	GENERIC_DAY	0	3	2010-01-21	90901	\N	97567	\N
99631	GENERIC_DAY	0	7	2010-02-22	1230	\N	97567	\N
99632	GENERIC_DAY	0	3	2010-01-18	1228	\N	97567	\N
99633	GENERIC_DAY	0	0	2010-02-20	1228	\N	97567	\N
99634	GENERIC_DAY	0	2	2010-01-21	1217	\N	97567	\N
99635	GENERIC_DAY	0	4	2010-01-27	1228	\N	97567	\N
99636	GENERIC_DAY	0	6	2010-02-10	90901	\N	97567	\N
99637	GENERIC_DAY	0	4	2010-01-28	1220	\N	97567	\N
99638	GENERIC_DAY	0	2	2010-01-22	1217	\N	97567	\N
99639	GENERIC_DAY	0	2	2010-01-21	1228	\N	97567	\N
99640	GENERIC_DAY	0	3	2010-02-25	1228	\N	97567	\N
99641	GENERIC_DAY	0	2	2010-02-19	90901	\N	97567	\N
99642	GENERIC_DAY	0	0	2010-01-28	90901	\N	97567	\N
99643	GENERIC_DAY	0	3	2010-02-19	1217	\N	97567	\N
99644	GENERIC_DAY	0	2	2010-01-21	1220	\N	97567	\N
99645	GENERIC_DAY	0	0	2010-01-30	1217	\N	97567	\N
99646	GENERIC_DAY	0	5	2010-02-04	90901	\N	97567	\N
99647	GENERIC_DAY	0	2	2010-01-18	1217	\N	97567	\N
99648	GENERIC_DAY	0	0	2010-01-24	1230	\N	97567	\N
99649	GENERIC_DAY	0	0	2010-01-30	90901	\N	97567	\N
99650	GENERIC_DAY	0	2	2010-01-22	1220	\N	97567	\N
99651	GENERIC_DAY	0	2	2010-02-18	90901	\N	97567	\N
99652	GENERIC_DAY	0	2	2010-02-08	1228	\N	97567	\N
99653	GENERIC_DAY	0	2	2010-01-20	1217	\N	97567	\N
99654	GENERIC_DAY	0	2	2010-01-25	1220	\N	97567	\N
99655	GENERIC_DAY	0	0	2010-02-21	1228	\N	97567	\N
99656	GENERIC_DAY	0	4	2010-01-26	1220	\N	97567	\N
99657	GENERIC_DAY	0	2	2010-01-28	1217	\N	97567	\N
99658	GENERIC_DAY	0	0	2010-02-14	1228	\N	97567	\N
99659	GENERIC_DAY	0	5	2010-01-25	1230	\N	97567	\N
99660	GENERIC_DAY	0	2	2010-01-20	1228	\N	97567	\N
99661	GENERIC_DAY	0	0	2010-01-23	90901	\N	97567	\N
99662	GENERIC_DAY	0	0	2010-01-24	1217	\N	97567	\N
99663	GENERIC_DAY	0	2	2010-02-09	1228	\N	97567	\N
99664	GENERIC_DAY	0	3	2010-02-02	1220	\N	97567	\N
99665	GENERIC_DAY	0	1	2010-02-11	1220	\N	97567	\N
99666	GENERIC_DAY	0	4	2010-02-03	90901	\N	97567	\N
99667	GENERIC_DAY	0	3	2010-01-18	90901	\N	97567	\N
99668	GENERIC_DAY	0	4	2010-01-29	1220	\N	97567	\N
99669	GENERIC_DAY	0	4	2010-02-02	90901	\N	97567	\N
99670	GENERIC_DAY	0	0	2010-02-23	90901	\N	97567	\N
99671	GENERIC_DAY	0	2	2010-02-25	90901	\N	97567	\N
99672	GENERIC_DAY	0	0	2010-02-14	90901	\N	97567	\N
99673	GENERIC_DAY	0	2	2010-02-04	1228	\N	97567	\N
99674	GENERIC_DAY	0	3	2010-01-25	90901	\N	97567	\N
99675	GENERIC_DAY	0	3	2010-02-01	1217	\N	97567	\N
99676	GENERIC_DAY	0	0	2010-02-13	1220	\N	97567	\N
99677	GENERIC_DAY	0	3	2010-02-04	1230	\N	97567	\N
99678	GENERIC_DAY	0	0	2010-02-07	1220	\N	97567	\N
99679	GENERIC_DAY	0	0	2010-02-14	1230	\N	97567	\N
99680	GENERIC_DAY	0	2	2010-02-08	1217	\N	97567	\N
99681	GENERIC_DAY	0	0	2010-02-22	90901	\N	97567	\N
99682	GENERIC_DAY	0	3	2010-02-03	1228	\N	97567	\N
99683	GENERIC_DAY	0	3	2010-02-01	1220	\N	97567	\N
99684	GENERIC_DAY	0	4	2010-01-15	1230	\N	97567	\N
99685	GENERIC_DAY	0	0	2010-02-21	1217	\N	97567	\N
99686	GENERIC_DAY	0	0	2010-02-17	1220	\N	97567	\N
99687	GENERIC_DAY	0	3	2010-02-16	1217	\N	97567	\N
99688	GENERIC_DAY	0	0	2010-01-23	1230	\N	97567	\N
99689	GENERIC_DAY	0	2	2010-01-25	1217	\N	97567	\N
99690	GENERIC_DAY	0	0	2010-02-16	1220	\N	97567	\N
99691	GENERIC_DAY	0	0	2010-01-16	1230	\N	97567	\N
99692	GENERIC_DAY	0	5	2010-01-20	1230	\N	97567	\N
99693	GENERIC_DAY	0	2	2010-02-05	1228	\N	97567	\N
99694	GENERIC_DAY	0	0	2010-02-19	1220	\N	97567	\N
99695	GENERIC_DAY	0	3	2010-02-05	1230	\N	97567	\N
99696	GENERIC_DAY	0	5	2010-01-21	1230	\N	97567	\N
99697	GENERIC_DAY	0	4	2010-02-02	1217	\N	97567	\N
99698	GENERIC_DAY	0	1	2010-02-10	1217	\N	97567	\N
99699	GENERIC_DAY	0	0	2010-02-14	1220	\N	97567	\N
99700	GENERIC_DAY	0	0	2010-01-26	90901	\N	97567	\N
99701	GENERIC_DAY	0	4	2010-02-19	1230	\N	97567	\N
99702	GENERIC_DAY	0	0	2010-02-12	1220	\N	97567	\N
99703	GENERIC_DAY	0	0	2010-02-13	1217	\N	97567	\N
99704	GENERIC_DAY	0	2	2010-02-24	1230	\N	97567	\N
99705	GENERIC_DAY	0	2	2010-02-04	1217	\N	97567	\N
99706	GENERIC_DAY	0	0	2010-02-18	1220	\N	97567	\N
99707	GENERIC_DAY	0	3	2010-02-15	1217	\N	97567	\N
99708	GENERIC_DAY	0	2	2010-01-15	1217	\N	97567	\N
99709	GENERIC_DAY	0	0	2010-02-20	1220	\N	97567	\N
99710	GENERIC_DAY	0	1	2010-02-09	1217	\N	97567	\N
99711	GENERIC_DAY	0	0	2010-02-23	1220	\N	97567	\N
99712	GENERIC_DAY	0	2	2010-01-15	90901	\N	97567	\N
99713	GENERIC_DAY	0	0	2010-02-25	1220	\N	97567	\N
99714	GENERIC_DAY	0	2	2010-02-04	1220	\N	97567	\N
99715	GENERIC_DAY	0	0	2010-01-31	1220	\N	97567	\N
99716	GENERIC_DAY	0	0	2010-01-30	1228	\N	97567	\N
99717	GENERIC_DAY	0	2	2010-01-26	1217	\N	97567	\N
99718	GENERIC_DAY	0	4	2010-01-28	1230	\N	97567	\N
99719	GENERIC_DAY	0	3	2010-01-19	90901	\N	97567	\N
99720	GENERIC_DAY	0	0	2010-02-17	1228	\N	97567	\N
99721	GENERIC_DAY	0	0	2010-01-31	1228	\N	97567	\N
99722	GENERIC_DAY	0	0	2010-02-13	1230	\N	97567	\N
99723	GENERIC_DAY	0	5	2010-02-05	90901	\N	97567	\N
99724	GENERIC_DAY	0	4	2010-01-27	1230	\N	97567	\N
99725	GENERIC_DAY	0	2	2010-02-16	90901	\N	97567	\N
99726	GENERIC_DAY	0	3	2010-01-18	1220	\N	97567	\N
99727	GENERIC_DAY	0	0	2010-02-07	1230	\N	97567	\N
99728	GENERIC_DAY	0	0	2010-02-17	90901	\N	97567	\N
99729	GENERIC_DAY	0	1	2010-02-25	1230	\N	97567	\N
99730	GENERIC_DAY	0	0	2010-01-17	90901	\N	97567	\N
99731	GENERIC_DAY	0	0	2010-02-13	90901	\N	97567	\N
99732	GENERIC_DAY	0	2	2010-02-10	1220	\N	97567	\N
99733	GENERIC_DAY	0	0	2010-01-31	1230	\N	97567	\N
99734	GENERIC_DAY	0	2	2010-02-01	1228	\N	97567	\N
99735	GENERIC_DAY	0	5	2010-02-16	1228	\N	97567	\N
99736	GENERIC_DAY	0	4	2010-02-15	1230	\N	97567	\N
99737	GENERIC_DAY	0	0	2010-02-22	1220	\N	97567	\N
99738	GENERIC_DAY	0	5	2010-01-22	1230	\N	97567	\N
99739	GENERIC_DAY	0	4	2010-01-29	1230	\N	97567	\N
99740	GENERIC_DAY	0	0	2010-02-06	1228	\N	97567	\N
99741	GENERIC_DAY	0	0	2010-01-29	90901	\N	97567	\N
99742	GENERIC_DAY	0	0	2010-02-20	90901	\N	97567	\N
99743	GENERIC_DAY	0	4	2010-02-24	90901	\N	97567	\N
99744	GENERIC_DAY	0	0	2010-02-17	1217	\N	97567	\N
99745	GENERIC_DAY	0	0	2010-01-17	1220	\N	97567	\N
99746	GENERIC_DAY	0	3	2010-01-15	1220	\N	97567	\N
99747	GENERIC_DAY	0	0	2010-02-06	90901	\N	97567	\N
99748	GENERIC_DAY	0	5	2010-02-08	90901	\N	97567	\N
99749	GENERIC_DAY	0	2	2010-01-27	1217	\N	97567	\N
99750	GENERIC_DAY	0	4	2010-02-16	1230	\N	97567	\N
99751	GENERIC_DAY	0	3	2010-02-12	1217	\N	97567	\N
99752	GENERIC_DAY	0	2	2010-02-01	1230	\N	97567	\N
99753	GENERIC_DAY	0	0	2010-01-17	1217	\N	97567	\N
99754	GENERIC_DAY	0	3	2010-02-11	1217	\N	97567	\N
99755	GENERIC_DAY	0	1	2010-02-11	90901	\N	97567	\N
99756	GENERIC_DAY	0	0	2010-01-24	1220	\N	97567	\N
99757	GENERIC_DAY	0	0	2010-02-21	90901	\N	97567	\N
99758	GENERIC_DAY	0	3	2010-02-03	1220	\N	97567	\N
99759	GENERIC_DAY	0	2	2010-02-08	1220	\N	97567	\N
99760	GENERIC_DAY	0	2	2010-02-02	1228	\N	97567	\N
99761	GENERIC_DAY	0	0	2010-01-16	1220	\N	97567	\N
99762	GENERIC_DAY	0	4	2010-02-18	1230	\N	97567	\N
99763	GENERIC_DAY	0	5	2010-02-15	1228	\N	97567	\N
99764	GENERIC_DAY	0	1	2010-02-03	1217	\N	97567	\N
99765	GENERIC_DAY	0	6	2010-01-05	1228	\N	97566	\N
99766	GENERIC_DAY	0	6	2010-01-06	1217	\N	97566	\N
99767	GENERIC_DAY	0	0	2010-01-02	1230	\N	97566	\N
99768	GENERIC_DAY	0	6	2010-01-12	1220	\N	97566	\N
99769	GENERIC_DAY	0	6	2010-01-08	1228	\N	97566	\N
99770	GENERIC_DAY	0	6	2010-01-06	1230	\N	97566	\N
99771	GENERIC_DAY	0	6	2010-01-11	1220	\N	97566	\N
99772	GENERIC_DAY	0	2	2010-01-14	1228	\N	97566	\N
99773	GENERIC_DAY	0	2	2010-01-14	1220	\N	97566	\N
99774	GENERIC_DAY	0	2	2010-01-14	90901	\N	97566	\N
99775	GENERIC_DAY	0	6	2010-01-08	1230	\N	97566	\N
99776	GENERIC_DAY	0	0	2010-01-10	1228	\N	97566	\N
99777	GENERIC_DAY	0	6	2010-01-05	1217	\N	97566	\N
99778	GENERIC_DAY	0	6	2010-01-01	1217	\N	97566	\N
99779	GENERIC_DAY	0	6	2010-01-05	1230	\N	97566	\N
99780	GENERIC_DAY	0	6	2010-01-06	1220	\N	97566	\N
99781	GENERIC_DAY	0	0	2010-01-02	1220	\N	97566	\N
99782	GENERIC_DAY	0	6	2010-01-13	1228	\N	97566	\N
99783	GENERIC_DAY	0	0	2010-01-10	1230	\N	97566	\N
99784	GENERIC_DAY	0	8	2010-01-12	90901	\N	97566	\N
99785	GENERIC_DAY	0	6	2010-01-06	1228	\N	97566	\N
99786	GENERIC_DAY	0	6	2010-01-13	1230	\N	97566	\N
99787	GENERIC_DAY	0	0	2010-01-10	90901	\N	97566	\N
99788	GENERIC_DAY	0	6	2010-01-05	1220	\N	97566	\N
99789	GENERIC_DAY	0	7	2010-01-08	1220	\N	97566	\N
99790	GENERIC_DAY	0	6	2010-01-13	1220	\N	97566	\N
99791	GENERIC_DAY	0	0	2010-01-09	1230	\N	97566	\N
99792	GENERIC_DAY	0	6	2010-01-01	1230	\N	97566	\N
99793	GENERIC_DAY	0	8	2010-01-08	90901	\N	97566	\N
99794	GENERIC_DAY	0	0	2010-01-02	1217	\N	97566	\N
99795	GENERIC_DAY	0	6	2010-01-12	1228	\N	97566	\N
99796	GENERIC_DAY	0	0	2010-01-03	1217	\N	97566	\N
99797	GENERIC_DAY	0	6	2010-01-04	1217	\N	97566	\N
99798	GENERIC_DAY	0	0	2010-01-03	1220	\N	97566	\N
99799	GENERIC_DAY	0	6	2010-01-04	1228	\N	97566	\N
99800	GENERIC_DAY	0	8	2010-01-11	90901	\N	97566	\N
99801	GENERIC_DAY	0	8	2010-01-07	90901	\N	97566	\N
99802	GENERIC_DAY	0	0	2010-01-02	1228	\N	97566	\N
99803	GENERIC_DAY	0	6	2010-01-01	1220	\N	97566	\N
99804	GENERIC_DAY	0	0	2010-01-09	1220	\N	97566	\N
99805	GENERIC_DAY	0	6	2010-01-01	1228	\N	97566	\N
99806	GENERIC_DAY	0	6	2010-01-12	1230	\N	97566	\N
99807	GENERIC_DAY	0	8	2010-01-13	90901	\N	97566	\N
99808	GENERIC_DAY	0	6	2010-01-12	1217	\N	97566	\N
99809	GENERIC_DAY	0	6	2010-01-07	1230	\N	97566	\N
99810	GENERIC_DAY	0	0	2010-01-09	1217	\N	97566	\N
99811	GENERIC_DAY	0	0	2010-01-10	1217	\N	97566	\N
99812	GENERIC_DAY	0	6	2010-01-04	1220	\N	97566	\N
99813	GENERIC_DAY	0	0	2010-01-09	1228	\N	97566	\N
99814	GENERIC_DAY	0	3	2010-01-14	1217	\N	97566	\N
99815	GENERIC_DAY	0	8	2010-01-06	90901	\N	97566	\N
99816	GENERIC_DAY	0	6	2010-01-07	1217	\N	97566	\N
99817	GENERIC_DAY	0	0	2010-01-03	1228	\N	97566	\N
99818	GENERIC_DAY	0	0	2010-01-10	1220	\N	97566	\N
99819	GENERIC_DAY	0	6	2010-01-07	1228	\N	97566	\N
99820	GENERIC_DAY	0	8	2010-01-05	90901	\N	97566	\N
99821	GENERIC_DAY	0	6	2010-01-11	1217	\N	97566	\N
99822	GENERIC_DAY	0	0	2010-01-09	90901	\N	97566	\N
99823	GENERIC_DAY	0	3	2010-01-14	1230	\N	97566	\N
99824	GENERIC_DAY	0	6	2010-01-11	1228	\N	97566	\N
99825	GENERIC_DAY	0	5	2010-01-08	1217	\N	97566	\N
99826	GENERIC_DAY	0	8	2010-01-01	90901	\N	97566	\N
99827	GENERIC_DAY	0	6	2010-01-13	1217	\N	97566	\N
99828	GENERIC_DAY	0	6	2010-01-11	1230	\N	97566	\N
99829	GENERIC_DAY	0	6	2010-01-07	1220	\N	97566	\N
99830	GENERIC_DAY	0	6	2010-01-04	1230	\N	97566	\N
99831	GENERIC_DAY	0	8	2010-01-04	90901	\N	97566	\N
99832	GENERIC_DAY	0	0	2010-01-03	90901	\N	97566	\N
99833	GENERIC_DAY	0	0	2010-01-02	90901	\N	97566	\N
99834	GENERIC_DAY	0	0	2010-01-03	1230	\N	97566	\N
114090	GENERIC_DAY	4	0	2010-02-26	90904	\N	97580	\N
114086	GENERIC_DAY	4	0	2010-02-21	90906	\N	97580	\N
114097	GENERIC_DAY	4	16	2010-03-01	90906	\N	97580	\N
114085	GENERIC_DAY	4	0	2010-03-01	90904	\N	97580	\N
114098	GENERIC_DAY	4	0	2010-02-22	90904	\N	97580	\N
114095	GENERIC_DAY	4	16	2010-02-19	90906	\N	97580	\N
114089	GENERIC_DAY	4	0	2010-03-02	90904	\N	97580	\N
114104	GENERIC_DAY	4	16	2010-02-25	90906	\N	97580	\N
114101	GENERIC_DAY	4	0	2010-02-20	90904	\N	97580	\N
114081	GENERIC_DAY	4	0	2010-02-25	90904	\N	97580	\N
114096	GENERIC_DAY	4	0	2010-02-23	90904	\N	97580	\N
114092	GENERIC_DAY	4	0	2010-02-17	90904	\N	97580	\N
114083	GENERIC_DAY	4	0	2010-02-24	90904	\N	97580	\N
114099	GENERIC_DAY	4	0	2010-02-28	90906	\N	97580	\N
114088	GENERIC_DAY	4	16	2010-02-24	90906	\N	97580	\N
114082	GENERIC_DAY	4	16	2010-02-16	90906	\N	97580	\N
114093	GENERIC_DAY	4	16	2010-02-23	90906	\N	97580	\N
114077	GENERIC_DAY	4	16	2010-02-26	90906	\N	97580	\N
114103	GENERIC_DAY	4	0	2010-02-21	90904	\N	97580	\N
114079	GENERIC_DAY	4	0	2010-02-27	90904	\N	97580	\N
114102	GENERIC_DAY	4	0	2010-02-28	90904	\N	97580	\N
114087	GENERIC_DAY	4	0	2010-02-18	90904	\N	97580	\N
114080	GENERIC_DAY	4	16	2010-03-02	90906	\N	97580	\N
114078	GENERIC_DAY	4	0	2010-02-20	90906	\N	97580	\N
114091	GENERIC_DAY	4	16	2010-02-22	90906	\N	97580	\N
114100	GENERIC_DAY	4	0	2010-02-16	90904	\N	97580	\N
114094	GENERIC_DAY	4	0	2010-02-19	90904	\N	97580	\N
114084	GENERIC_DAY	4	16	2010-02-18	90906	\N	97580	\N
114106	GENERIC_DAY	4	0	2010-02-17	90906	\N	97580	\N
114105	GENERIC_DAY	4	0	2010-02-27	90906	\N	97580	\N
114190	GENERIC_DAY	0	5	2010-03-03	90904	\N	97579	\N
114191	GENERIC_DAY	0	4	2010-03-08	90904	\N	97579	\N
114192	GENERIC_DAY	0	4	2010-03-10	90904	\N	97579	\N
114193	GENERIC_DAY	0	4	2010-03-05	90904	\N	97579	\N
114194	GENERIC_DAY	0	4	2010-03-09	90904	\N	97579	\N
114195	GENERIC_DAY	0	12	2010-03-15	90906	\N	97579	\N
114196	GENERIC_DAY	0	12	2010-03-12	90906	\N	97579	\N
114197	GENERIC_DAY	0	12	2010-03-05	90906	\N	97579	\N
114198	GENERIC_DAY	0	0	2010-03-13	90904	\N	97579	\N
114199	GENERIC_DAY	0	0	2010-03-06	90904	\N	97579	\N
114200	GENERIC_DAY	0	12	2010-03-11	90906	\N	97579	\N
114201	GENERIC_DAY	0	4	2010-03-15	90904	\N	97579	\N
114202	GENERIC_DAY	0	12	2010-03-04	90906	\N	97579	\N
114203	GENERIC_DAY	0	4	2010-03-11	90904	\N	97579	\N
114204	GENERIC_DAY	0	11	2010-03-03	90906	\N	97579	\N
114205	GENERIC_DAY	0	0	2010-03-14	90904	\N	97579	\N
114206	GENERIC_DAY	0	4	2010-03-12	90904	\N	97579	\N
114207	GENERIC_DAY	0	0	2010-03-06	90906	\N	97579	\N
114208	GENERIC_DAY	0	12	2010-03-08	90906	\N	97579	\N
114209	GENERIC_DAY	0	0	2010-03-14	90906	\N	97579	\N
114210	GENERIC_DAY	0	0	2010-03-13	90906	\N	97579	\N
114211	GENERIC_DAY	0	0	2010-03-07	90904	\N	97579	\N
114212	GENERIC_DAY	0	12	2010-03-16	90906	\N	97579	\N
114213	GENERIC_DAY	0	0	2010-03-07	90906	\N	97579	\N
114214	GENERIC_DAY	0	12	2010-03-10	90906	\N	97579	\N
114215	GENERIC_DAY	0	4	2010-03-04	90904	\N	97579	\N
114216	GENERIC_DAY	0	4	2010-03-16	90904	\N	97579	\N
114217	GENERIC_DAY	0	12	2010-03-09	90906	\N	97579	\N
114218	GENERIC_DAY	0	2	2010-03-06	90904	\N	97581	\N
114219	GENERIC_DAY	0	10	2010-03-10	90906	\N	97581	\N
114220	GENERIC_DAY	0	4	2010-03-10	90904	\N	97581	\N
114221	GENERIC_DAY	0	9	2010-03-16	90906	\N	97581	\N
114222	GENERIC_DAY	0	10	2010-03-05	90906	\N	97581	\N
114223	GENERIC_DAY	0	4	2010-03-15	90904	\N	97581	\N
114224	GENERIC_DAY	0	9	2010-03-15	90906	\N	97581	\N
114225	GENERIC_DAY	0	11	2010-03-03	90906	\N	97581	\N
114226	GENERIC_DAY	0	10	2010-03-12	90906	\N	97581	\N
114227	GENERIC_DAY	0	4	2010-03-05	90904	\N	97581	\N
114228	GENERIC_DAY	0	3	2010-03-14	90906	\N	97581	\N
114229	GENERIC_DAY	0	10	2010-03-11	90906	\N	97581	\N
114230	GENERIC_DAY	0	4	2010-03-06	90906	\N	97581	\N
114231	GENERIC_DAY	0	4	2010-03-08	90904	\N	97581	\N
114232	GENERIC_DAY	0	10	2010-03-09	90906	\N	97581	\N
114233	GENERIC_DAY	0	4	2010-03-04	90904	\N	97581	\N
114234	GENERIC_DAY	0	10	2010-03-08	90906	\N	97581	\N
114235	GENERIC_DAY	0	4	2010-03-07	90906	\N	97581	\N
114236	GENERIC_DAY	0	4	2010-03-12	90904	\N	97581	\N
114237	GENERIC_DAY	0	3	2010-03-13	90906	\N	97581	\N
114238	GENERIC_DAY	0	4	2010-03-11	90904	\N	97581	\N
114239	GENERIC_DAY	0	10	2010-03-04	90906	\N	97581	\N
114240	GENERIC_DAY	0	4	2010-03-09	90904	\N	97581	\N
114241	GENERIC_DAY	0	3	2010-03-03	90904	\N	97581	\N
114242	GENERIC_DAY	0	4	2010-03-16	90904	\N	97581	\N
114243	GENERIC_DAY	0	2	2010-03-13	90904	\N	97581	\N
114244	GENERIC_DAY	0	2	2010-03-14	90904	\N	97581	\N
114245	GENERIC_DAY	0	2	2010-03-07	90904	\N	97581	\N
87144	SPECIFIC_DAY	1	0	2010-03-14	1220	86458	\N	\N
87141	SPECIFIC_DAY	1	8	2010-03-18	1220	86458	\N	\N
87102	SPECIFIC_DAY	1	0	2010-03-06	1220	86458	\N	\N
87136	SPECIFIC_DAY	1	8	2010-03-31	1220	86458	\N	\N
87105	SPECIFIC_DAY	1	0	2010-03-13	1220	86458	\N	\N
87122	SPECIFIC_DAY	1	0	2010-02-20	1220	86458	\N	\N
87133	SPECIFIC_DAY	1	8	2010-03-24	1220	86458	\N	\N
87114	SPECIFIC_DAY	1	8	2010-03-22	1220	86458	\N	\N
87134	SPECIFIC_DAY	1	8	2010-03-08	1220	86458	\N	\N
87135	SPECIFIC_DAY	1	8	2010-03-26	1220	86458	\N	\N
87137	SPECIFIC_DAY	1	8	2010-03-11	1220	86458	\N	\N
87112	SPECIFIC_DAY	1	0	2010-02-17	1220	86458	\N	\N
93145	GENERIC_DAY	0	1	2009-12-28	1217	\N	58472	\N
93146	GENERIC_DAY	0	2	2009-12-25	1228	\N	58472	\N
93147	GENERIC_DAY	0	0	2009-12-24	90901	\N	58472	\N
93148	GENERIC_DAY	0	2	2009-12-23	1220	\N	58472	\N
93149	GENERIC_DAY	0	2	2009-12-24	1217	\N	58472	\N
93150	GENERIC_DAY	0	0	2009-12-27	1228	\N	58472	\N
93151	GENERIC_DAY	0	2	2009-12-23	1230	\N	58472	\N
93152	GENERIC_DAY	0	0	2009-12-26	90901	\N	58472	\N
93153	GENERIC_DAY	0	2	2009-12-24	1230	\N	58472	\N
93154	GENERIC_DAY	0	2	2009-12-24	1220	\N	58472	\N
93155	GENERIC_DAY	0	2	2009-12-25	1230	\N	58472	\N
93156	GENERIC_DAY	0	2	2009-12-24	1228	\N	58472	\N
93157	GENERIC_DAY	0	2	2009-12-25	1220	\N	58472	\N
93158	GENERIC_DAY	0	0	2009-12-26	1220	\N	58472	\N
93159	GENERIC_DAY	0	1	2009-12-28	1220	\N	58472	\N
93160	GENERIC_DAY	0	0	2009-12-25	90901	\N	58472	\N
93161	GENERIC_DAY	0	0	2009-12-27	1217	\N	58472	\N
93162	GENERIC_DAY	0	1	2009-12-28	1230	\N	58472	\N
93163	GENERIC_DAY	0	0	2009-12-26	1230	\N	58472	\N
93164	GENERIC_DAY	0	2	2009-12-25	1217	\N	58472	\N
93165	GENERIC_DAY	0	2	2009-12-23	1217	\N	58472	\N
93166	GENERIC_DAY	0	0	2009-12-27	1230	\N	58472	\N
93167	GENERIC_DAY	0	0	2009-12-26	1217	\N	58472	\N
93168	GENERIC_DAY	0	0	2009-12-27	1220	\N	58472	\N
93169	GENERIC_DAY	0	0	2009-12-27	90901	\N	58472	\N
93170	GENERIC_DAY	0	0	2009-12-23	90901	\N	58472	\N
93171	GENERIC_DAY	0	1	2009-12-28	1228	\N	58472	\N
93172	GENERIC_DAY	0	0	2009-12-26	1228	\N	58472	\N
93173	GENERIC_DAY	0	2	2009-12-23	1228	\N	58472	\N
93174	GENERIC_DAY	0	4	2009-12-28	90901	\N	58472	\N
93175	GENERIC_DAY	0	0	2009-12-19	1214	\N	58457	\N
93176	GENERIC_DAY	0	3	2009-12-22	1226	\N	58457	\N
93177	GENERIC_DAY	0	3	2009-12-16	1214	\N	58457	\N
93178	GENERIC_DAY	0	3	2009-12-21	1226	\N	58457	\N
93179	GENERIC_DAY	0	2	2009-12-21	1222	\N	58457	\N
93180	GENERIC_DAY	0	3	2009-12-16	1226	\N	58457	\N
93181	GENERIC_DAY	0	3	2009-12-17	1226	\N	58457	\N
93182	GENERIC_DAY	0	0	2009-12-20	1214	\N	58457	\N
93183	GENERIC_DAY	0	3	2009-12-22	1214	\N	58457	\N
93184	GENERIC_DAY	0	0	2009-12-19	1226	\N	58457	\N
93185	GENERIC_DAY	0	3	2009-12-21	1214	\N	58457	\N
93186	GENERIC_DAY	0	2	2009-12-17	1222	\N	58457	\N
93187	GENERIC_DAY	0	3	2009-12-18	1214	\N	58457	\N
93188	GENERIC_DAY	0	0	2009-12-20	1226	\N	58457	\N
93189	GENERIC_DAY	0	0	2009-12-19	1222	\N	58457	\N
93190	GENERIC_DAY	0	2	2009-12-16	1222	\N	58457	\N
93191	GENERIC_DAY	0	3	2009-12-17	1214	\N	58457	\N
93192	GENERIC_DAY	0	0	2009-12-20	1222	\N	58457	\N
93193	GENERIC_DAY	0	2	2009-12-18	1222	\N	58457	\N
93194	GENERIC_DAY	0	2	2009-12-22	1222	\N	58457	\N
93195	GENERIC_DAY	0	3	2009-12-18	1226	\N	58457	\N
93196	GENERIC_DAY	0	2	2010-01-26	1222	\N	68413	\N
93197	GENERIC_DAY	0	0	2009-12-20	1222	\N	68413	\N
93198	GENERIC_DAY	0	2	2009-12-17	1214	\N	68413	\N
93199	GENERIC_DAY	0	0	2010-02-08	1214	\N	68413	\N
93200	GENERIC_DAY	0	2	2009-12-16	1222	\N	68413	\N
93201	GENERIC_DAY	0	0	2010-01-23	1214	\N	68413	\N
93202	GENERIC_DAY	0	3	2010-01-22	1214	\N	68413	\N
93203	GENERIC_DAY	0	4	2010-02-08	1222	\N	68413	\N
93204	GENERIC_DAY	0	0	2010-02-07	1214	\N	68413	\N
93205	GENERIC_DAY	0	0	2010-01-09	1222	\N	68413	\N
93206	GENERIC_DAY	0	0	2010-02-07	1226	\N	68413	\N
93207	GENERIC_DAY	0	0	2009-12-26	1214	\N	68413	\N
93208	GENERIC_DAY	0	2	2009-12-28	1222	\N	68413	\N
93209	GENERIC_DAY	0	2	2009-12-23	1222	\N	68413	\N
93210	GENERIC_DAY	0	3	2009-12-31	1214	\N	68413	\N
93211	GENERIC_DAY	0	1	2010-02-10	1226	\N	68413	\N
93212	GENERIC_DAY	0	0	2010-01-10	1222	\N	68413	\N
93213	GENERIC_DAY	0	2	2010-01-22	1222	\N	68413	\N
93214	GENERIC_DAY	0	0	2010-01-31	1214	\N	68413	\N
93215	GENERIC_DAY	0	0	2010-02-04	1214	\N	68413	\N
93216	GENERIC_DAY	0	2	2010-01-07	1222	\N	68413	\N
93217	GENERIC_DAY	0	1	2010-01-25	1226	\N	68413	\N
93218	GENERIC_DAY	0	1	2010-01-14	1226	\N	68413	\N
93219	GENERIC_DAY	0	1	2010-01-20	1226	\N	68413	\N
93220	GENERIC_DAY	0	3	2010-01-27	1214	\N	68413	\N
93221	GENERIC_DAY	0	2	2009-12-22	1222	\N	68413	\N
93222	GENERIC_DAY	0	3	2010-01-26	1214	\N	68413	\N
93223	GENERIC_DAY	0	2	2010-02-03	1222	\N	68413	\N
93224	GENERIC_DAY	0	3	2010-01-05	1214	\N	68413	\N
93225	GENERIC_DAY	0	0	2009-12-26	1226	\N	68413	\N
93226	GENERIC_DAY	0	0	2009-12-27	1226	\N	68413	\N
93227	GENERIC_DAY	0	1	2010-01-26	1226	\N	68413	\N
93228	GENERIC_DAY	0	2	2010-01-05	1222	\N	68413	\N
93229	GENERIC_DAY	0	4	2010-02-05	1222	\N	68413	\N
93230	GENERIC_DAY	0	1	2010-02-01	1226	\N	68413	\N
93231	GENERIC_DAY	0	1	2010-01-07	1226	\N	68413	\N
93232	GENERIC_DAY	0	3	2010-01-04	1214	\N	68413	\N
93233	GENERIC_DAY	0	2	2010-01-08	1222	\N	68413	\N
93234	GENERIC_DAY	0	2	2010-02-01	1222	\N	68413	\N
93235	GENERIC_DAY	0	2	2009-12-16	1226	\N	68413	\N
93236	GENERIC_DAY	0	2	2010-01-15	1222	\N	68413	\N
93237	GENERIC_DAY	0	2	2010-01-06	1222	\N	68413	\N
93238	GENERIC_DAY	0	0	2009-12-19	1222	\N	68413	\N
93239	GENERIC_DAY	0	3	2009-12-29	1214	\N	68413	\N
93240	GENERIC_DAY	0	2	2010-01-28	1222	\N	68413	\N
93241	GENERIC_DAY	0	3	2010-01-13	1214	\N	68413	\N
93242	GENERIC_DAY	0	0	2009-12-19	1226	\N	68413	\N
93243	GENERIC_DAY	0	1	2010-01-04	1226	\N	68413	\N
93244	GENERIC_DAY	0	0	2010-02-06	1214	\N	68413	\N
93245	GENERIC_DAY	0	2	2009-12-17	1226	\N	68413	\N
93246	GENERIC_DAY	0	3	2010-01-12	1214	\N	68413	\N
93247	GENERIC_DAY	0	1	2010-02-02	1226	\N	68413	\N
93248	GENERIC_DAY	0	1	2010-01-22	1226	\N	68413	\N
93249	GENERIC_DAY	0	3	2010-01-15	1214	\N	68413	\N
93250	GENERIC_DAY	0	2	2010-02-09	1226	\N	68413	\N
93251	GENERIC_DAY	0	0	2010-01-23	1226	\N	68413	\N
93252	GENERIC_DAY	0	3	2009-12-24	1214	\N	68413	\N
93253	GENERIC_DAY	0	1	2010-02-03	1226	\N	68413	\N
93254	GENERIC_DAY	0	3	2010-01-06	1214	\N	68413	\N
93255	GENERIC_DAY	0	1	2010-01-19	1226	\N	68413	\N
93256	GENERIC_DAY	0	3	2010-01-21	1214	\N	68413	\N
93257	GENERIC_DAY	0	0	2009-12-26	1222	\N	68413	\N
93258	GENERIC_DAY	0	1	2010-01-05	1226	\N	68413	\N
93259	GENERIC_DAY	0	2	2010-02-05	1226	\N	68413	\N
93260	GENERIC_DAY	0	2	2010-01-20	1222	\N	68413	\N
93261	GENERIC_DAY	0	2	2009-12-18	1222	\N	68413	\N
93262	GENERIC_DAY	0	2	2009-12-21	1222	\N	68413	\N
93263	GENERIC_DAY	0	0	2010-01-23	1222	\N	68413	\N
93264	GENERIC_DAY	0	1	2009-12-31	1226	\N	68413	\N
93265	GENERIC_DAY	0	3	2010-01-08	1214	\N	68413	\N
93266	GENERIC_DAY	0	0	2010-01-17	1226	\N	68413	\N
93267	GENERIC_DAY	0	0	2010-01-24	1214	\N	68413	\N
93268	GENERIC_DAY	0	0	2010-02-07	1222	\N	68413	\N
93269	GENERIC_DAY	0	0	2010-01-16	1214	\N	68413	\N
93270	GENERIC_DAY	0	0	2010-02-10	1214	\N	68413	\N
93271	GENERIC_DAY	0	0	2010-01-30	1226	\N	68413	\N
93272	GENERIC_DAY	0	2	2009-12-21	1226	\N	68413	\N
93273	GENERIC_DAY	0	0	2010-01-02	1226	\N	68413	\N
93274	GENERIC_DAY	0	0	2010-01-30	1222	\N	68413	\N
93275	GENERIC_DAY	0	3	2009-12-14	1214	\N	68413	\N
93276	GENERIC_DAY	0	2	2009-12-18	1214	\N	68413	\N
93277	GENERIC_DAY	0	1	2010-01-27	1226	\N	68413	\N
93278	GENERIC_DAY	0	4	2010-02-04	1222	\N	68413	\N
93279	GENERIC_DAY	0	1	2009-12-24	1226	\N	68413	\N
93280	GENERIC_DAY	0	2	2009-12-31	1222	\N	68413	\N
93281	GENERIC_DAY	0	1	2009-12-23	1226	\N	68413	\N
93282	GENERIC_DAY	0	0	2010-02-05	1214	\N	68413	\N
93283	GENERIC_DAY	0	0	2009-12-19	1214	\N	68413	\N
93284	GENERIC_DAY	0	2	2010-02-02	1222	\N	68413	\N
93285	GENERIC_DAY	0	0	2010-01-16	1226	\N	68413	\N
93286	GENERIC_DAY	0	2	2009-12-17	1222	\N	68413	\N
93287	GENERIC_DAY	0	2	2009-12-22	1214	\N	68413	\N
93288	GENERIC_DAY	0	0	2010-01-09	1214	\N	68413	\N
93289	GENERIC_DAY	0	3	2010-01-25	1214	\N	68413	\N
93290	GENERIC_DAY	0	2	2009-12-14	1222	\N	68413	\N
93291	GENERIC_DAY	0	0	2010-01-03	1226	\N	68413	\N
93292	GENERIC_DAY	0	2	2009-12-30	1222	\N	68413	\N
93293	GENERIC_DAY	0	3	2010-01-28	1214	\N	68413	\N
93294	GENERIC_DAY	0	2	2009-12-21	1214	\N	68413	\N
93295	GENERIC_DAY	0	2	2010-01-29	1222	\N	68413	\N
93296	GENERIC_DAY	0	0	2010-01-17	1222	\N	68413	\N
93297	GENERIC_DAY	0	3	2010-01-07	1214	\N	68413	\N
93298	GENERIC_DAY	0	0	2010-01-03	1222	\N	68413	\N
93299	GENERIC_DAY	0	2	2009-12-22	1226	\N	68413	\N
93300	GENERIC_DAY	0	3	2010-01-18	1214	\N	68413	\N
93301	GENERIC_DAY	0	0	2010-01-24	1226	\N	68413	\N
93302	GENERIC_DAY	0	2	2009-12-24	1222	\N	68413	\N
93303	GENERIC_DAY	0	3	2009-12-15	1214	\N	68413	\N
93304	GENERIC_DAY	0	1	2010-01-28	1226	\N	68413	\N
93305	GENERIC_DAY	0	3	2009-12-25	1214	\N	68413	\N
93306	GENERIC_DAY	0	0	2010-01-31	1226	\N	68413	\N
93307	GENERIC_DAY	0	0	2010-01-17	1214	\N	68413	\N
93308	GENERIC_DAY	0	3	2010-01-20	1214	\N	68413	\N
93309	GENERIC_DAY	0	3	2009-12-23	1214	\N	68413	\N
93310	GENERIC_DAY	0	1	2009-12-25	1226	\N	68413	\N
93311	GENERIC_DAY	0	3	2010-01-29	1214	\N	68413	\N
93312	GENERIC_DAY	0	0	2010-02-06	1226	\N	68413	\N
93313	GENERIC_DAY	0	3	2010-02-10	1222	\N	68413	\N
93314	GENERIC_DAY	0	2	2009-12-18	1226	\N	68413	\N
93315	GENERIC_DAY	0	2	2010-01-27	1222	\N	68413	\N
93316	GENERIC_DAY	0	2	2010-01-21	1222	\N	68413	\N
93317	GENERIC_DAY	0	0	2010-01-02	1222	\N	68413	\N
93318	GENERIC_DAY	0	1	2009-12-30	1226	\N	68413	\N
93319	GENERIC_DAY	0	3	2010-02-03	1214	\N	68413	\N
93320	GENERIC_DAY	0	2	2010-02-08	1226	\N	68413	\N
93321	GENERIC_DAY	0	2	2009-12-25	1222	\N	68413	\N
93322	GENERIC_DAY	0	1	2010-01-01	1226	\N	68413	\N
93323	GENERIC_DAY	0	3	2010-01-19	1214	\N	68413	\N
93324	GENERIC_DAY	0	4	2010-02-09	1222	\N	68413	\N
93325	GENERIC_DAY	0	3	2010-01-14	1214	\N	68413	\N
93326	GENERIC_DAY	0	0	2010-01-02	1214	\N	68413	\N
93327	GENERIC_DAY	0	0	2010-01-10	1226	\N	68413	\N
93328	GENERIC_DAY	0	2	2010-01-11	1222	\N	68413	\N
93329	GENERIC_DAY	0	0	2009-12-20	1226	\N	68413	\N
93330	GENERIC_DAY	0	0	2010-01-10	1214	\N	68413	\N
93331	GENERIC_DAY	0	3	2009-12-30	1214	\N	68413	\N
93332	GENERIC_DAY	0	0	2010-02-09	1214	\N	68413	\N
93333	GENERIC_DAY	0	2	2010-01-14	1222	\N	68413	\N
93334	GENERIC_DAY	0	1	2010-01-11	1226	\N	68413	\N
93335	GENERIC_DAY	0	0	2010-01-24	1222	\N	68413	\N
93336	GENERIC_DAY	0	1	2010-01-15	1226	\N	68413	\N
93337	GENERIC_DAY	0	0	2009-12-20	1214	\N	68413	\N
93338	GENERIC_DAY	0	0	2009-12-27	1214	\N	68413	\N
93339	GENERIC_DAY	0	1	2010-01-12	1226	\N	68413	\N
93340	GENERIC_DAY	0	3	2010-01-01	1214	\N	68413	\N
93341	GENERIC_DAY	0	1	2009-12-15	1226	\N	68413	\N
93342	GENERIC_DAY	0	3	2009-12-28	1214	\N	68413	\N
93343	GENERIC_DAY	0	1	2010-01-18	1226	\N	68413	\N
93344	GENERIC_DAY	0	0	2010-01-03	1214	\N	68413	\N
93345	GENERIC_DAY	0	0	2009-12-27	1222	\N	68413	\N
93346	GENERIC_DAY	0	2	2010-02-04	1226	\N	68413	\N
93347	GENERIC_DAY	0	1	2010-01-06	1226	\N	68413	\N
93348	GENERIC_DAY	0	3	2010-02-01	1214	\N	68413	\N
93349	GENERIC_DAY	0	1	2009-12-29	1226	\N	68413	\N
93350	GENERIC_DAY	0	2	2010-01-04	1222	\N	68413	\N
93351	GENERIC_DAY	0	1	2009-12-14	1226	\N	68413	\N
93352	GENERIC_DAY	0	3	2010-01-11	1214	\N	68413	\N
93353	GENERIC_DAY	0	0	2010-02-06	1222	\N	68413	\N
93354	GENERIC_DAY	0	2	2009-12-16	1214	\N	68413	\N
93355	GENERIC_DAY	0	2	2009-12-29	1222	\N	68413	\N
93356	GENERIC_DAY	0	0	2010-01-09	1226	\N	68413	\N
93357	GENERIC_DAY	0	2	2010-01-19	1222	\N	68413	\N
93358	GENERIC_DAY	0	1	2010-01-29	1226	\N	68413	\N
93359	GENERIC_DAY	0	0	2010-01-16	1222	\N	68413	\N
93360	GENERIC_DAY	0	2	2010-01-12	1222	\N	68413	\N
93361	GENERIC_DAY	0	2	2010-01-25	1222	\N	68413	\N
93362	GENERIC_DAY	0	1	2010-01-21	1226	\N	68413	\N
93363	GENERIC_DAY	0	1	2010-01-13	1226	\N	68413	\N
93364	GENERIC_DAY	0	0	2010-01-30	1214	\N	68413	\N
93365	GENERIC_DAY	0	2	2010-01-13	1222	\N	68413	\N
93366	GENERIC_DAY	0	1	2009-12-28	1226	\N	68413	\N
93367	GENERIC_DAY	0	2	2009-12-15	1222	\N	68413	\N
93368	GENERIC_DAY	0	1	2010-01-08	1226	\N	68413	\N
93369	GENERIC_DAY	0	0	2010-01-31	1222	\N	68413	\N
93370	GENERIC_DAY	0	2	2010-01-01	1222	\N	68413	\N
93371	GENERIC_DAY	0	3	2010-02-02	1214	\N	68413	\N
93372	GENERIC_DAY	0	2	2010-01-18	1222	\N	68413	\N
93373	GENERIC_DAY	0	0	2009-12-26	1230	\N	60790	\N
93374	GENERIC_DAY	0	2	2009-12-29	1228	\N	60790	\N
93375	GENERIC_DAY	0	2	2009-12-31	1230	\N	60790	\N
93376	GENERIC_DAY	0	2	2009-12-31	1220	\N	60790	\N
93377	GENERIC_DAY	0	1	2010-01-01	1228	\N	60790	\N
93378	GENERIC_DAY	0	0	2010-01-01	1230	\N	60790	\N
93379	GENERIC_DAY	0	0	2009-12-30	90901	\N	60790	\N
93380	GENERIC_DAY	0	1	2009-12-28	1217	\N	60790	\N
93381	GENERIC_DAY	0	0	2009-12-27	1228	\N	60790	\N
93382	GENERIC_DAY	0	2	2009-12-31	1217	\N	60790	\N
93383	GENERIC_DAY	0	0	2009-12-26	1228	\N	60790	\N
93384	GENERIC_DAY	0	0	2009-12-26	1220	\N	60790	\N
93385	GENERIC_DAY	0	0	2009-12-29	90901	\N	60790	\N
93386	GENERIC_DAY	0	0	2009-12-31	90901	\N	60790	\N
93387	GENERIC_DAY	0	2	2009-12-30	1217	\N	60790	\N
93388	GENERIC_DAY	0	0	2009-12-26	1217	\N	60790	\N
93389	GENERIC_DAY	0	2	2009-12-29	1230	\N	60790	\N
93390	GENERIC_DAY	0	3	2009-12-28	1220	\N	60790	\N
93391	GENERIC_DAY	0	0	2009-12-26	90901	\N	60790	\N
93392	GENERIC_DAY	0	6	2010-01-01	90901	\N	60790	\N
93393	GENERIC_DAY	0	2	2009-12-30	1228	\N	60790	\N
93394	GENERIC_DAY	0	2	2009-12-30	1230	\N	60790	\N
93395	GENERIC_DAY	0	2	2009-12-28	1228	\N	60790	\N
93396	GENERIC_DAY	0	2	2009-12-31	1228	\N	60790	\N
93397	GENERIC_DAY	0	0	2009-12-27	1230	\N	60790	\N
93398	GENERIC_DAY	0	3	2009-12-29	1220	\N	60790	\N
93399	GENERIC_DAY	0	2	2009-12-28	1230	\N	60790	\N
93400	GENERIC_DAY	0	1	2010-01-01	1217	\N	60790	\N
93401	GENERIC_DAY	0	0	2009-12-27	1217	\N	60790	\N
93402	GENERIC_DAY	0	1	2009-12-29	1217	\N	60790	\N
93403	GENERIC_DAY	0	0	2010-01-01	1220	\N	60790	\N
93404	GENERIC_DAY	0	0	2009-12-28	90901	\N	60790	\N
93405	GENERIC_DAY	0	0	2009-12-27	1220	\N	60790	\N
93406	GENERIC_DAY	0	0	2009-12-27	90901	\N	60790	\N
93407	GENERIC_DAY	0	2	2009-12-30	1220	\N	60790	\N
93408	GENERIC_DAY	0	0	2009-12-25	1230	\N	58468	\N
93409	GENERIC_DAY	0	8	2009-12-24	90901	\N	58468	\N
93410	GENERIC_DAY	0	8	2009-12-29	90901	\N	58468	\N
93411	GENERIC_DAY	0	0	2009-12-24	1228	\N	58468	\N
93412	GENERIC_DAY	0	0	2009-12-29	1220	\N	58468	\N
93413	GENERIC_DAY	0	2	2009-12-21	1228	\N	58468	\N
93414	GENERIC_DAY	0	0	2009-12-26	1230	\N	58468	\N
93415	GENERIC_DAY	0	0	2009-12-20	1230	\N	58468	\N
93416	GENERIC_DAY	0	0	2009-12-26	1220	\N	58468	\N
93417	GENERIC_DAY	0	0	2009-12-29	1230	\N	58468	\N
93418	GENERIC_DAY	0	0	2009-12-30	1220	\N	58468	\N
93419	GENERIC_DAY	0	0	2009-12-20	1228	\N	58468	\N
93420	GENERIC_DAY	0	0	2009-12-28	1217	\N	58468	\N
93421	GENERIC_DAY	0	0	2009-12-25	1220	\N	58468	\N
93422	GENERIC_DAY	0	0	2009-12-21	90901	\N	58468	\N
93423	GENERIC_DAY	0	0	2009-12-27	1217	\N	58468	\N
93424	GENERIC_DAY	0	0	2009-12-19	1228	\N	58468	\N
93425	GENERIC_DAY	0	0	2009-12-23	1220	\N	58468	\N
93426	GENERIC_DAY	0	0	2009-12-27	90901	\N	58468	\N
93427	GENERIC_DAY	0	0	2009-12-26	1228	\N	58468	\N
93428	GENERIC_DAY	0	8	2009-12-25	90901	\N	58468	\N
93429	GENERIC_DAY	0	0	2009-12-27	1220	\N	58468	\N
93430	GENERIC_DAY	0	2	2009-12-21	1217	\N	58468	\N
93431	GENERIC_DAY	0	0	2009-12-30	1217	\N	58468	\N
93432	GENERIC_DAY	0	0	2009-12-22	1217	\N	58468	\N
93433	GENERIC_DAY	0	0	2009-12-22	1228	\N	58468	\N
93434	GENERIC_DAY	0	0	2009-12-24	1220	\N	58468	\N
93435	GENERIC_DAY	0	0	2009-12-20	1220	\N	58468	\N
93436	GENERIC_DAY	0	0	2009-12-24	1230	\N	58468	\N
93437	GENERIC_DAY	0	0	2009-12-23	1230	\N	58468	\N
93438	GENERIC_DAY	0	0	2009-12-22	1220	\N	58468	\N
93439	GENERIC_DAY	0	0	2009-12-27	1228	\N	58468	\N
93440	GENERIC_DAY	0	8	2009-12-30	90901	\N	58468	\N
93441	GENERIC_DAY	0	0	2009-12-28	1230	\N	58468	\N
93442	GENERIC_DAY	0	0	2009-12-24	1217	\N	58468	\N
93443	GENERIC_DAY	0	0	2009-12-20	1217	\N	58468	\N
93444	GENERIC_DAY	0	0	2009-12-19	90901	\N	58468	\N
93445	GENERIC_DAY	0	0	2009-12-23	1217	\N	58468	\N
93446	GENERIC_DAY	0	0	2009-12-29	1217	\N	58468	\N
93447	GENERIC_DAY	0	0	2009-12-30	1228	\N	58468	\N
93448	GENERIC_DAY	0	0	2009-12-27	1230	\N	58468	\N
93449	GENERIC_DAY	0	0	2009-12-19	1230	\N	58468	\N
93450	GENERIC_DAY	0	0	2009-12-19	1220	\N	58468	\N
93451	GENERIC_DAY	0	8	2009-12-28	90901	\N	58468	\N
93452	GENERIC_DAY	0	0	2009-12-20	90901	\N	58468	\N
93453	GENERIC_DAY	0	0	2009-12-30	1230	\N	58468	\N
93454	GENERIC_DAY	0	0	2009-12-26	90901	\N	58468	\N
93455	GENERIC_DAY	0	0	2009-12-28	1228	\N	58468	\N
93456	GENERIC_DAY	0	8	2009-12-22	90901	\N	58468	\N
93457	GENERIC_DAY	0	0	2009-12-19	1217	\N	58468	\N
93458	GENERIC_DAY	0	0	2009-12-23	1228	\N	58468	\N
93459	GENERIC_DAY	0	0	2009-12-29	1228	\N	58468	\N
93460	GENERIC_DAY	0	2	2009-12-21	1220	\N	58468	\N
93461	GENERIC_DAY	0	0	2009-12-26	1217	\N	58468	\N
93462	GENERIC_DAY	0	0	2009-12-25	1217	\N	58468	\N
93463	GENERIC_DAY	0	0	2009-12-22	1230	\N	58468	\N
93464	GENERIC_DAY	0	0	2009-12-28	1220	\N	58468	\N
93465	GENERIC_DAY	0	0	2009-12-25	1228	\N	58468	\N
93466	GENERIC_DAY	0	8	2009-12-23	90901	\N	58468	\N
93467	GENERIC_DAY	0	2	2009-12-21	1230	\N	58468	\N
93468	GENERIC_DAY	0	2	2010-01-06	1217	\N	58469	\N
93469	GENERIC_DAY	0	3	2010-01-15	1228	\N	58469	\N
93470	GENERIC_DAY	0	0	2010-01-03	1220	\N	58469	\N
93471	GENERIC_DAY	0	2	2010-01-13	1220	\N	58469	\N
93472	GENERIC_DAY	0	1	2010-01-13	1217	\N	58469	\N
93473	GENERIC_DAY	0	1	2010-01-07	1220	\N	58469	\N
93474	GENERIC_DAY	0	2	2010-01-07	1217	\N	58469	\N
93475	GENERIC_DAY	0	3	2010-01-12	1228	\N	58469	\N
93476	GENERIC_DAY	0	2	2010-01-04	1228	\N	58469	\N
93477	GENERIC_DAY	0	0	2010-01-02	1217	\N	58469	\N
93478	GENERIC_DAY	0	2	2010-01-04	1217	\N	58469	\N
93479	GENERIC_DAY	0	2	2010-01-01	1230	\N	58469	\N
93480	GENERIC_DAY	0	2	2010-01-11	1228	\N	58469	\N
93481	GENERIC_DAY	0	3	2010-01-14	1228	\N	58469	\N
93482	GENERIC_DAY	0	2	2010-01-13	1230	\N	58469	\N
93483	GENERIC_DAY	0	2	2010-01-11	1220	\N	58469	\N
93484	GENERIC_DAY	0	0	2010-01-10	1220	\N	58469	\N
93485	GENERIC_DAY	0	2	2010-01-07	90901	\N	58469	\N
93486	GENERIC_DAY	0	2	2010-01-04	1230	\N	58469	\N
93487	GENERIC_DAY	0	0	2010-01-09	1217	\N	58469	\N
93488	GENERIC_DAY	0	2	2010-01-05	1217	\N	58469	\N
93489	GENERIC_DAY	0	0	2010-01-02	1228	\N	58469	\N
93490	GENERIC_DAY	0	2	2010-01-01	1220	\N	58469	\N
93491	GENERIC_DAY	0	2	2010-01-05	1230	\N	58469	\N
93492	GENERIC_DAY	0	2	2010-01-12	1220	\N	58469	\N
93493	GENERIC_DAY	0	2	2009-12-31	1228	\N	58469	\N
93494	GENERIC_DAY	0	0	2010-01-12	90901	\N	58469	\N
93495	GENERIC_DAY	0	2	2009-12-31	1230	\N	58469	\N
93496	GENERIC_DAY	0	1	2010-01-08	1230	\N	58469	\N
93497	GENERIC_DAY	0	0	2010-01-03	90901	\N	58469	\N
93498	GENERIC_DAY	0	2	2010-01-12	1230	\N	58469	\N
93499	GENERIC_DAY	0	0	2010-01-03	1228	\N	58469	\N
93500	GENERIC_DAY	0	0	2010-01-10	1230	\N	58469	\N
93501	GENERIC_DAY	0	1	2010-01-07	1230	\N	58469	\N
93502	GENERIC_DAY	0	0	2010-01-02	1230	\N	58469	\N
93503	GENERIC_DAY	0	0	2010-01-15	90901	\N	58469	\N
93504	GENERIC_DAY	0	4	2010-01-08	90901	\N	58469	\N
93505	GENERIC_DAY	0	2	2009-12-31	1220	\N	58469	\N
93506	GENERIC_DAY	0	0	2010-01-04	90901	\N	58469	\N
93507	GENERIC_DAY	0	2	2010-01-05	1220	\N	58469	\N
93508	GENERIC_DAY	0	0	2010-01-10	1217	\N	58469	\N
93509	GENERIC_DAY	0	0	2010-01-13	90901	\N	58469	\N
93510	GENERIC_DAY	0	0	2010-01-09	90901	\N	58469	\N
93511	GENERIC_DAY	0	1	2010-01-14	1217	\N	58469	\N
93512	GENERIC_DAY	0	0	2010-01-10	90901	\N	58469	\N
93513	GENERIC_DAY	0	0	2010-01-09	1230	\N	58469	\N
93514	GENERIC_DAY	0	0	2010-01-02	90901	\N	58469	\N
93515	GENERIC_DAY	0	2	2010-01-11	1230	\N	58469	\N
93516	GENERIC_DAY	0	2	2009-12-31	1217	\N	58469	\N
93517	GENERIC_DAY	0	0	2010-01-09	1220	\N	58469	\N
93518	GENERIC_DAY	0	3	2010-01-13	1228	\N	58469	\N
93519	GENERIC_DAY	0	2	2010-01-15	1230	\N	58469	\N
93520	GENERIC_DAY	0	0	2010-01-09	1228	\N	58469	\N
93521	GENERIC_DAY	0	2	2010-01-06	1220	\N	58469	\N
93522	GENERIC_DAY	0	2	2010-01-14	1230	\N	58469	\N
93523	GENERIC_DAY	0	0	2010-01-06	90901	\N	58469	\N
93524	GENERIC_DAY	0	2	2010-01-06	1230	\N	58469	\N
93525	GENERIC_DAY	0	2	2010-01-05	1228	\N	58469	\N
93526	GENERIC_DAY	0	0	2010-01-05	90901	\N	58469	\N
93527	GENERIC_DAY	0	2	2010-01-11	1217	\N	58469	\N
93528	GENERIC_DAY	0	2	2010-01-04	1220	\N	58469	\N
93529	GENERIC_DAY	0	2	2010-01-06	1228	\N	58469	\N
93530	GENERIC_DAY	0	2	2010-01-08	1217	\N	58469	\N
93531	GENERIC_DAY	0	2	2010-01-07	1228	\N	58469	\N
93532	GENERIC_DAY	0	2	2010-01-01	1217	\N	58469	\N
93533	GENERIC_DAY	0	2	2010-01-15	1220	\N	58469	\N
93534	GENERIC_DAY	0	0	2010-01-03	1230	\N	58469	\N
93535	GENERIC_DAY	0	0	2010-01-10	1228	\N	58469	\N
93536	GENERIC_DAY	0	0	2010-01-14	90901	\N	58469	\N
93537	GENERIC_DAY	0	0	2010-01-11	90901	\N	58469	\N
93538	GENERIC_DAY	0	0	2010-01-02	1220	\N	58469	\N
93539	GENERIC_DAY	0	2	2010-01-01	1228	\N	58469	\N
93540	GENERIC_DAY	0	0	2010-01-01	90901	\N	58469	\N
93541	GENERIC_DAY	0	2	2010-01-14	1220	\N	58469	\N
93542	GENERIC_DAY	0	1	2010-01-15	1217	\N	58469	\N
93543	GENERIC_DAY	0	1	2010-01-08	1228	\N	58469	\N
93544	GENERIC_DAY	0	0	2010-01-08	1220	\N	58469	\N
93545	GENERIC_DAY	0	1	2010-01-12	1217	\N	58469	\N
93546	GENERIC_DAY	0	0	2010-01-03	1217	\N	58469	\N
93547	GENERIC_DAY	0	0	2009-12-31	90901	\N	58469	\N
93548	GENERIC_DAY	0	0	2009-12-19	1217	\N	68414	\N
93549	GENERIC_DAY	0	0	2010-01-02	1228	\N	68414	\N
93550	GENERIC_DAY	0	0	2010-02-07	1220	\N	68414	\N
93551	GENERIC_DAY	0	2	2010-02-01	1228	\N	68414	\N
93552	GENERIC_DAY	0	3	2010-01-20	1217	\N	68414	\N
93553	GENERIC_DAY	0	1	2010-01-28	1228	\N	68414	\N
93554	GENERIC_DAY	0	3	2009-12-15	1220	\N	68414	\N
93555	GENERIC_DAY	0	0	2009-12-28	1230	\N	68414	\N
93556	GENERIC_DAY	0	2	2010-02-09	1228	\N	68414	\N
93557	GENERIC_DAY	0	0	2010-02-06	1217	\N	68414	\N
93558	GENERIC_DAY	0	0	2010-01-04	1220	\N	68414	\N
93559	GENERIC_DAY	0	0	2010-01-05	1220	\N	68414	\N
93560	GENERIC_DAY	0	1	2010-02-09	1220	\N	68414	\N
93561	GENERIC_DAY	0	1	2010-01-26	1228	\N	68414	\N
93562	GENERIC_DAY	0	0	2010-01-24	1230	\N	68414	\N
93563	GENERIC_DAY	0	0	2009-12-24	1230	\N	68414	\N
93564	GENERIC_DAY	0	0	2010-01-03	1220	\N	68414	\N
93565	GENERIC_DAY	0	0	2010-01-09	1217	\N	68414	\N
93566	GENERIC_DAY	0	0	2009-12-28	1217	\N	68414	\N
93567	GENERIC_DAY	0	0	2010-01-17	1217	\N	68414	\N
93568	GENERIC_DAY	0	0	2010-01-02	1220	\N	68414	\N
93569	GENERIC_DAY	0	2	2010-02-01	1217	\N	68414	\N
93570	GENERIC_DAY	0	0	2009-12-29	1217	\N	68414	\N
93571	GENERIC_DAY	0	2	2010-01-29	1220	\N	68414	\N
93572	GENERIC_DAY	0	0	2009-12-25	1230	\N	68414	\N
93573	GENERIC_DAY	0	0	2010-01-12	1230	\N	68414	\N
93574	GENERIC_DAY	0	6	2009-12-31	90901	\N	68414	\N
93575	GENERIC_DAY	0	2	2009-12-15	1217	\N	68414	\N
93576	GENERIC_DAY	0	0	2010-01-11	1228	\N	68414	\N
93577	GENERIC_DAY	0	1	2010-02-04	1217	\N	68414	\N
93578	GENERIC_DAY	0	0	2010-01-08	1228	\N	68414	\N
93579	GENERIC_DAY	0	0	2010-01-12	1228	\N	68414	\N
93580	GENERIC_DAY	0	0	2009-12-27	90901	\N	68414	\N
93581	GENERIC_DAY	0	2	2009-12-17	1217	\N	68414	\N
93582	GENERIC_DAY	0	1	2009-12-14	1228	\N	68414	\N
93583	GENERIC_DAY	0	4	2010-01-14	90901	\N	68414	\N
93584	GENERIC_DAY	0	2	2010-01-13	1217	\N	68414	\N
93585	GENERIC_DAY	0	0	2009-12-20	90901	\N	68414	\N
93586	GENERIC_DAY	0	0	2010-01-17	1230	\N	68414	\N
93587	GENERIC_DAY	0	0	2010-01-11	1220	\N	68414	\N
93588	GENERIC_DAY	0	6	2010-01-05	90901	\N	68414	\N
93589	GENERIC_DAY	0	0	2010-01-17	90901	\N	68414	\N
93590	GENERIC_DAY	0	0	2010-02-03	90901	\N	68414	\N
93591	GENERIC_DAY	0	0	2009-12-19	1220	\N	68414	\N
93592	GENERIC_DAY	0	0	2010-01-17	1220	\N	68414	\N
93593	GENERIC_DAY	0	2	2010-01-14	1217	\N	68414	\N
93594	GENERIC_DAY	0	4	2010-01-11	90901	\N	68414	\N
93595	GENERIC_DAY	0	0	2010-01-30	1230	\N	68414	\N
93596	GENERIC_DAY	0	0	2010-01-05	1230	\N	68414	\N
93597	GENERIC_DAY	0	1	2010-01-19	90901	\N	68414	\N
93598	GENERIC_DAY	0	3	2009-12-14	1220	\N	68414	\N
93599	GENERIC_DAY	0	0	2010-01-10	1230	\N	68414	\N
93600	GENERIC_DAY	0	6	2009-12-25	90901	\N	68414	\N
93601	GENERIC_DAY	0	2	2010-01-28	1217	\N	68414	\N
93602	GENERIC_DAY	0	1	2010-01-28	1230	\N	68414	\N
93603	GENERIC_DAY	0	0	2009-12-22	1220	\N	68414	\N
93604	GENERIC_DAY	0	0	2009-12-21	1228	\N	68414	\N
93605	GENERIC_DAY	0	0	2010-01-07	1220	\N	68414	\N
93606	GENERIC_DAY	0	0	2010-01-07	1217	\N	68414	\N
93607	GENERIC_DAY	0	0	2010-02-01	90901	\N	68414	\N
93608	GENERIC_DAY	0	0	2010-02-06	1230	\N	68414	\N
93609	GENERIC_DAY	0	4	2010-02-04	90901	\N	68414	\N
93610	GENERIC_DAY	0	0	2009-12-26	90901	\N	68414	\N
93611	GENERIC_DAY	0	1	2010-01-19	1220	\N	68414	\N
93612	GENERIC_DAY	0	1	2010-01-19	1230	\N	68414	\N
93613	GENERIC_DAY	0	2	2010-01-28	1220	\N	68414	\N
93614	GENERIC_DAY	0	0	2010-01-06	1217	\N	68414	\N
93615	GENERIC_DAY	0	2	2009-12-16	1220	\N	68414	\N
93616	GENERIC_DAY	0	0	2009-12-23	1217	\N	68414	\N
93617	GENERIC_DAY	0	0	2010-01-31	90901	\N	68414	\N
93618	GENERIC_DAY	0	1	2009-12-17	1228	\N	68414	\N
93619	GENERIC_DAY	0	1	2010-01-29	1228	\N	68414	\N
93620	GENERIC_DAY	0	0	2009-12-25	1217	\N	68414	\N
93621	GENERIC_DAY	0	0	2009-12-27	1220	\N	68414	\N
93622	GENERIC_DAY	0	3	2010-01-25	1217	\N	68414	\N
93623	GENERIC_DAY	0	0	2009-12-25	1228	\N	68414	\N
93624	GENERIC_DAY	0	0	2009-12-19	1228	\N	68414	\N
93625	GENERIC_DAY	0	1	2009-12-14	1217	\N	68414	\N
93626	GENERIC_DAY	0	0	2009-12-15	1228	\N	68414	\N
93627	GENERIC_DAY	0	1	2010-01-29	1230	\N	68414	\N
93628	GENERIC_DAY	0	0	2010-01-14	1228	\N	68414	\N
93629	GENERIC_DAY	0	0	2009-12-29	1230	\N	68414	\N
93630	GENERIC_DAY	0	0	2010-02-09	1217	\N	68414	\N
93631	GENERIC_DAY	0	0	2010-01-21	90901	\N	68414	\N
93632	GENERIC_DAY	0	0	2009-12-15	90901	\N	68414	\N
93633	GENERIC_DAY	0	1	2010-01-20	1230	\N	68414	\N
93634	GENERIC_DAY	0	0	2009-12-21	1220	\N	68414	\N
93635	GENERIC_DAY	0	0	2010-01-16	90901	\N	68414	\N
93636	GENERIC_DAY	0	0	2010-01-03	1230	\N	68414	\N
93637	GENERIC_DAY	0	0	2010-01-06	1228	\N	68414	\N
93638	GENERIC_DAY	0	0	2009-12-26	1220	\N	68414	\N
93639	GENERIC_DAY	0	0	2010-01-08	1220	\N	68414	\N
93640	GENERIC_DAY	0	0	2009-12-21	1217	\N	68414	\N
93641	GENERIC_DAY	0	0	2009-12-28	1228	\N	68414	\N
93642	GENERIC_DAY	0	1	2010-01-21	1228	\N	68414	\N
93643	GENERIC_DAY	0	2	2010-01-15	1217	\N	68414	\N
93644	GENERIC_DAY	0	0	2010-02-10	1220	\N	68414	\N
93645	GENERIC_DAY	0	2	2010-02-01	1220	\N	68414	\N
93646	GENERIC_DAY	0	0	2010-01-01	1228	\N	68414	\N
93647	GENERIC_DAY	0	1	2010-02-05	1220	\N	68414	\N
93648	GENERIC_DAY	0	2	2009-12-18	1220	\N	68414	\N
93649	GENERIC_DAY	0	1	2010-01-18	1230	\N	68414	\N
93650	GENERIC_DAY	0	0	2009-12-23	1230	\N	68414	\N
93651	GENERIC_DAY	0	1	2010-01-20	1228	\N	68414	\N
93652	GENERIC_DAY	0	1	2010-02-04	1220	\N	68414	\N
93653	GENERIC_DAY	0	1	2010-01-26	1230	\N	68414	\N
93654	GENERIC_DAY	0	2	2010-01-26	1217	\N	68414	\N
93655	GENERIC_DAY	0	0	2009-12-14	90901	\N	68414	\N
93656	GENERIC_DAY	0	0	2010-01-10	1217	\N	68414	\N
93657	GENERIC_DAY	0	2	2010-01-27	1220	\N	68414	\N
93658	GENERIC_DAY	0	1	2010-02-08	1217	\N	68414	\N
93659	GENERIC_DAY	0	0	2010-01-16	1230	\N	68414	\N
93660	GENERIC_DAY	0	0	2009-12-16	90901	\N	68414	\N
93661	GENERIC_DAY	0	0	2010-01-28	90901	\N	68414	\N
93662	GENERIC_DAY	0	1	2010-01-18	1228	\N	68414	\N
93663	GENERIC_DAY	0	0	2010-02-05	1228	\N	68414	\N
93664	GENERIC_DAY	0	0	2010-01-25	90901	\N	68414	\N
93665	GENERIC_DAY	0	0	2010-01-24	1220	\N	68414	\N
93666	GENERIC_DAY	0	0	2010-01-31	1220	\N	68414	\N
93667	GENERIC_DAY	0	2	2009-12-18	1217	\N	68414	\N
93668	GENERIC_DAY	0	2	2009-12-17	1220	\N	68414	\N
93669	GENERIC_DAY	0	0	2010-02-08	1230	\N	68414	\N
93670	GENERIC_DAY	0	0	2010-01-04	1228	\N	68414	\N
93671	GENERIC_DAY	0	3	2010-01-21	1217	\N	68414	\N
93672	GENERIC_DAY	0	0	2009-12-27	1228	\N	68414	\N
93673	GENERIC_DAY	0	0	2009-12-30	1228	\N	68414	\N
93674	GENERIC_DAY	0	0	2009-12-22	1228	\N	68414	\N
93675	GENERIC_DAY	0	0	2010-01-09	1228	\N	68414	\N
93676	GENERIC_DAY	0	4	2010-01-15	90901	\N	68414	\N
93677	GENERIC_DAY	0	0	2010-01-08	1230	\N	68414	\N
93678	GENERIC_DAY	0	0	2010-01-03	90901	\N	68414	\N
93679	GENERIC_DAY	0	1	2009-12-16	1228	\N	68414	\N
93680	GENERIC_DAY	0	2	2010-01-11	1217	\N	68414	\N
93681	GENERIC_DAY	0	0	2010-01-05	1217	\N	68414	\N
93682	GENERIC_DAY	0	0	2010-01-14	1230	\N	68414	\N
93683	GENERIC_DAY	0	0	2010-01-31	1230	\N	68414	\N
93684	GENERIC_DAY	0	0	2010-01-26	90901	\N	68414	\N
93685	GENERIC_DAY	0	0	2010-01-13	1230	\N	68414	\N
93686	GENERIC_DAY	0	2	2010-01-27	1217	\N	68414	\N
93687	GENERIC_DAY	0	0	2010-02-07	1217	\N	68414	\N
93688	GENERIC_DAY	0	3	2010-01-22	1217	\N	68414	\N
93689	GENERIC_DAY	0	1	2010-01-21	1220	\N	68414	\N
93690	GENERIC_DAY	0	0	2009-12-22	1217	\N	68414	\N
93691	GENERIC_DAY	0	0	2010-01-16	1228	\N	68414	\N
93692	GENERIC_DAY	0	0	2009-12-20	1230	\N	68414	\N
93693	GENERIC_DAY	0	6	2009-12-21	90901	\N	68414	\N
93694	GENERIC_DAY	0	0	2009-12-29	1220	\N	68414	\N
93695	GENERIC_DAY	0	0	2009-12-26	1217	\N	68414	\N
93696	GENERIC_DAY	0	0	2009-12-20	1228	\N	68414	\N
93697	GENERIC_DAY	0	0	2010-01-15	1220	\N	68414	\N
93698	GENERIC_DAY	0	1	2010-01-25	1220	\N	68414	\N
93699	GENERIC_DAY	0	0	2009-12-19	1230	\N	68414	\N
93700	GENERIC_DAY	0	0	2009-12-18	90901	\N	68414	\N
93701	GENERIC_DAY	0	0	2009-12-17	90901	\N	68414	\N
93702	GENERIC_DAY	0	1	2010-02-05	1217	\N	68414	\N
93703	GENERIC_DAY	0	0	2009-12-30	1217	\N	68414	\N
93704	GENERIC_DAY	0	0	2010-01-30	90901	\N	68414	\N
93705	GENERIC_DAY	0	1	2009-12-14	1230	\N	68414	\N
93706	GENERIC_DAY	0	0	2010-01-29	90901	\N	68414	\N
93707	GENERIC_DAY	0	0	2010-01-16	1217	\N	68414	\N
93708	GENERIC_DAY	0	0	2010-01-09	90901	\N	68414	\N
93709	GENERIC_DAY	0	0	2010-01-24	90901	\N	68414	\N
93710	GENERIC_DAY	0	0	2010-02-08	1228	\N	68414	\N
93711	GENERIC_DAY	0	0	2009-12-31	1230	\N	68414	\N
93712	GENERIC_DAY	0	0	2010-02-10	1217	\N	68414	\N
93713	GENERIC_DAY	0	0	2009-12-24	1220	\N	68414	\N
93714	GENERIC_DAY	0	2	2010-02-02	1228	\N	68414	\N
93715	GENERIC_DAY	0	0	2010-01-06	1220	\N	68414	\N
93716	GENERIC_DAY	0	0	2009-12-21	1230	\N	68414	\N
93717	GENERIC_DAY	0	0	2010-01-13	1220	\N	68414	\N
93718	GENERIC_DAY	0	1	2010-01-21	1230	\N	68414	\N
93719	GENERIC_DAY	0	0	2010-01-04	1230	\N	68414	\N
93720	GENERIC_DAY	0	0	2010-01-10	1228	\N	68414	\N
93721	GENERIC_DAY	0	0	2009-12-23	1220	\N	68414	\N
93722	GENERIC_DAY	0	0	2009-12-29	1228	\N	68414	\N
93723	GENERIC_DAY	0	0	2010-01-23	1228	\N	68414	\N
93724	GENERIC_DAY	0	0	2009-12-24	1217	\N	68414	\N
93725	GENERIC_DAY	0	4	2010-02-08	90901	\N	68414	\N
93726	GENERIC_DAY	0	1	2010-01-19	1228	\N	68414	\N
93727	GENERIC_DAY	0	1	2010-01-22	1228	\N	68414	\N
93728	GENERIC_DAY	0	1	2009-12-16	1230	\N	68414	\N
93729	GENERIC_DAY	0	6	2010-01-08	90901	\N	68414	\N
93730	GENERIC_DAY	0	0	2009-12-30	1220	\N	68414	\N
93731	GENERIC_DAY	0	0	2010-01-01	1230	\N	68414	\N
93732	GENERIC_DAY	0	1	2010-01-20	1220	\N	68414	\N
93733	GENERIC_DAY	0	1	2010-01-25	1230	\N	68414	\N
93734	GENERIC_DAY	0	0	2009-12-27	1217	\N	68414	\N
93735	GENERIC_DAY	0	2	2009-12-16	1217	\N	68414	\N
93736	GENERIC_DAY	0	0	2010-01-13	1228	\N	68414	\N
93737	GENERIC_DAY	0	0	2010-02-04	1228	\N	68414	\N
93738	GENERIC_DAY	0	0	2010-01-22	90901	\N	68414	\N
93739	GENERIC_DAY	0	1	2010-01-25	1228	\N	68414	\N
93740	GENERIC_DAY	0	0	2010-01-20	90901	\N	68414	\N
93741	GENERIC_DAY	0	0	2010-01-01	1217	\N	68414	\N
93742	GENERIC_DAY	0	6	2010-01-01	90901	\N	68414	\N
93743	GENERIC_DAY	0	1	2009-12-18	1230	\N	68414	\N
93744	GENERIC_DAY	0	2	2010-01-29	1217	\N	68414	\N
93745	GENERIC_DAY	0	6	2009-12-30	90901	\N	68414	\N
93746	GENERIC_DAY	0	0	2010-01-24	1217	\N	68414	\N
93747	GENERIC_DAY	0	0	2010-01-09	1230	\N	68414	\N
93748	GENERIC_DAY	0	1	2010-01-27	1228	\N	68414	\N
93749	GENERIC_DAY	0	0	2009-12-22	1230	\N	68414	\N
93750	GENERIC_DAY	0	0	2009-12-31	1217	\N	68414	\N
93751	GENERIC_DAY	0	2	2010-01-26	1220	\N	68414	\N
93752	GENERIC_DAY	0	0	2010-02-07	1228	\N	68414	\N
93753	GENERIC_DAY	0	0	2010-01-10	1220	\N	68414	\N
93754	GENERIC_DAY	0	0	2010-01-16	1220	\N	68414	\N
93755	GENERIC_DAY	0	0	2010-01-02	1230	\N	68414	\N
93756	GENERIC_DAY	0	0	2010-01-11	1230	\N	68414	\N
93757	GENERIC_DAY	0	1	2010-02-08	1220	\N	68414	\N
93758	GENERIC_DAY	0	0	2010-01-01	1220	\N	68414	\N
93759	GENERIC_DAY	0	6	2009-12-23	90901	\N	68414	\N
93760	GENERIC_DAY	0	6	2010-01-04	90901	\N	68414	\N
93761	GENERIC_DAY	0	0	2010-02-02	1230	\N	68414	\N
93762	GENERIC_DAY	0	6	2009-12-22	90901	\N	68414	\N
93763	GENERIC_DAY	0	2	2010-01-12	1217	\N	68414	\N
93764	GENERIC_DAY	0	0	2010-02-10	90901	\N	68414	\N
93765	GENERIC_DAY	0	0	2009-12-28	1220	\N	68414	\N
93766	GENERIC_DAY	0	0	2010-02-03	1230	\N	68414	\N
93767	GENERIC_DAY	0	0	2010-01-07	1228	\N	68414	\N
93768	GENERIC_DAY	0	2	2010-01-18	1217	\N	68414	\N
93769	GENERIC_DAY	0	6	2009-12-29	90901	\N	68414	\N
93770	GENERIC_DAY	0	0	2009-12-31	1220	\N	68414	\N
93771	GENERIC_DAY	0	0	2010-01-02	1217	\N	68414	\N
93772	GENERIC_DAY	0	4	2010-01-13	90901	\N	68414	\N
93773	GENERIC_DAY	0	6	2009-12-24	90901	\N	68414	\N
93774	GENERIC_DAY	0	0	2010-01-02	90901	\N	68414	\N
93775	GENERIC_DAY	0	2	2010-02-03	1217	\N	68414	\N
93776	GENERIC_DAY	0	0	2010-01-23	1217	\N	68414	\N
93777	GENERIC_DAY	0	0	2009-12-26	1228	\N	68414	\N
93778	GENERIC_DAY	0	0	2010-01-06	1230	\N	68414	\N
93779	GENERIC_DAY	0	0	2010-01-03	1228	\N	68414	\N
93780	GENERIC_DAY	0	1	2009-12-15	1230	\N	68414	\N
93781	GENERIC_DAY	0	0	2010-02-05	1230	\N	68414	\N
93782	GENERIC_DAY	0	0	2010-01-23	90901	\N	68414	\N
93783	GENERIC_DAY	0	0	2009-12-20	1217	\N	68414	\N
93784	GENERIC_DAY	0	0	2009-12-19	90901	\N	68414	\N
93785	GENERIC_DAY	0	0	2010-01-17	1228	\N	68414	\N
93786	GENERIC_DAY	0	6	2010-01-07	90901	\N	68414	\N
93787	GENERIC_DAY	0	0	2010-01-31	1217	\N	68414	\N
93788	GENERIC_DAY	0	0	2009-12-23	1228	\N	68414	\N
93789	GENERIC_DAY	0	0	2010-02-07	1230	\N	68414	\N
93790	GENERIC_DAY	0	0	2010-01-03	1217	\N	68414	\N
93791	GENERIC_DAY	0	0	2010-01-30	1217	\N	68414	\N
93792	GENERIC_DAY	0	0	2010-01-05	1228	\N	68414	\N
93793	GENERIC_DAY	0	0	2010-02-07	90901	\N	68414	\N
93794	GENERIC_DAY	0	0	2010-01-07	1230	\N	68414	\N
93795	GENERIC_DAY	0	2	2010-02-10	1230	\N	68414	\N
93796	GENERIC_DAY	0	0	2009-12-27	1230	\N	68414	\N
93797	GENERIC_DAY	0	2	2010-02-03	1228	\N	68414	\N
93798	GENERIC_DAY	0	0	2010-02-04	1230	\N	68414	\N
93799	GENERIC_DAY	0	0	2009-12-31	1228	\N	68414	\N
93800	GENERIC_DAY	0	0	2010-02-06	1220	\N	68414	\N
93801	GENERIC_DAY	0	2	2010-02-02	1217	\N	68414	\N
93802	GENERIC_DAY	0	0	2010-01-08	1217	\N	68414	\N
93803	GENERIC_DAY	0	0	2010-01-31	1228	\N	68414	\N
93804	GENERIC_DAY	0	1	2010-01-22	1230	\N	68414	\N
93805	GENERIC_DAY	0	1	2010-01-18	90901	\N	68414	\N
93806	GENERIC_DAY	0	1	2009-12-17	1230	\N	68414	\N
93807	GENERIC_DAY	0	0	2010-01-30	1228	\N	68414	\N
93808	GENERIC_DAY	0	0	2010-01-12	1220	\N	68414	\N
93809	GENERIC_DAY	0	0	2010-01-14	1220	\N	68414	\N
93810	GENERIC_DAY	0	0	2009-12-26	1230	\N	68414	\N
93811	GENERIC_DAY	0	2	2010-02-02	1220	\N	68414	\N
93812	GENERIC_DAY	0	0	2010-01-23	1230	\N	68414	\N
93813	GENERIC_DAY	0	0	2010-02-02	90901	\N	68414	\N
93814	GENERIC_DAY	0	2	2010-02-03	1220	\N	68414	\N
93815	GENERIC_DAY	0	1	2010-01-27	1230	\N	68414	\N
93816	GENERIC_DAY	0	0	2010-01-15	1230	\N	68414	\N
93817	GENERIC_DAY	0	2	2010-02-09	1230	\N	68414	\N
93818	GENERIC_DAY	0	0	2010-01-04	1217	\N	68414	\N
93819	GENERIC_DAY	0	0	2010-01-27	90901	\N	68414	\N
93820	GENERIC_DAY	0	0	2010-01-10	90901	\N	68414	\N
93821	GENERIC_DAY	0	0	2010-01-09	1220	\N	68414	\N
93822	GENERIC_DAY	0	1	2010-01-22	1220	\N	68414	\N
93823	GENERIC_DAY	0	4	2010-01-12	90901	\N	68414	\N
93824	GENERIC_DAY	0	0	2009-12-30	1230	\N	68414	\N
93825	GENERIC_DAY	0	0	2009-12-25	1220	\N	68414	\N
93826	GENERIC_DAY	0	6	2009-12-28	90901	\N	68414	\N
93827	GENERIC_DAY	0	0	2010-01-15	1228	\N	68414	\N
93828	GENERIC_DAY	0	0	2010-01-24	1228	\N	68414	\N
93829	GENERIC_DAY	0	0	2010-02-06	1228	\N	68414	\N
93830	GENERIC_DAY	0	0	2009-12-20	1220	\N	68414	\N
93831	GENERIC_DAY	0	0	2010-02-06	90901	\N	68414	\N
93832	GENERIC_DAY	0	0	2010-02-01	1230	\N	68414	\N
93833	GENERIC_DAY	0	2	2010-02-10	1228	\N	68414	\N
93834	GENERIC_DAY	0	4	2010-02-05	90901	\N	68414	\N
93835	GENERIC_DAY	0	1	2009-12-18	1228	\N	68414	\N
93836	GENERIC_DAY	0	0	2010-01-23	1220	\N	68414	\N
93837	GENERIC_DAY	0	1	2010-02-09	90901	\N	68414	\N
93838	GENERIC_DAY	0	2	2010-01-19	1217	\N	68414	\N
93839	GENERIC_DAY	0	1	2010-01-18	1220	\N	68414	\N
93840	GENERIC_DAY	0	6	2010-01-06	90901	\N	68414	\N
93841	GENERIC_DAY	0	0	2010-01-30	1220	\N	68414	\N
93842	GENERIC_DAY	0	0	2009-12-24	1228	\N	68414	\N
93843	GENERIC_DAY	0	1	2010-01-19	1220	\N	60752	\N
93844	GENERIC_DAY	0	0	2010-01-17	1220	\N	60752	\N
93845	GENERIC_DAY	0	0	2010-01-16	90901	\N	60752	\N
93846	GENERIC_DAY	0	1	2010-01-18	1217	\N	60752	\N
93847	GENERIC_DAY	0	2	2010-01-20	1220	\N	60752	\N
93848	GENERIC_DAY	0	0	2010-01-16	1217	\N	60752	\N
93849	GENERIC_DAY	0	3	2010-01-20	1228	\N	60752	\N
93850	GENERIC_DAY	0	0	2010-01-17	1228	\N	60752	\N
93851	GENERIC_DAY	0	0	2010-01-17	1230	\N	60752	\N
93852	GENERIC_DAY	0	0	2010-01-16	1220	\N	60752	\N
93853	GENERIC_DAY	0	0	2010-01-18	90901	\N	60752	\N
93854	GENERIC_DAY	0	0	2010-01-17	1217	\N	60752	\N
93855	GENERIC_DAY	0	2	2010-01-19	1217	\N	60752	\N
93856	GENERIC_DAY	0	2	2010-01-19	1228	\N	60752	\N
93857	GENERIC_DAY	0	0	2010-01-16	1228	\N	60752	\N
93858	GENERIC_DAY	0	2	2010-01-18	1230	\N	60752	\N
93859	GENERIC_DAY	0	0	2010-01-16	1230	\N	60752	\N
93860	GENERIC_DAY	0	3	2010-01-18	1220	\N	60752	\N
93861	GENERIC_DAY	0	1	2010-01-20	1217	\N	60752	\N
93862	GENERIC_DAY	0	2	2010-01-18	1228	\N	60752	\N
93863	GENERIC_DAY	0	0	2010-01-20	90901	\N	60752	\N
93864	GENERIC_DAY	0	0	2010-01-17	90901	\N	60752	\N
93865	GENERIC_DAY	0	2	2010-01-20	1230	\N	60752	\N
93866	GENERIC_DAY	0	1	2010-01-19	90901	\N	60752	\N
93867	GENERIC_DAY	0	2	2010-01-19	1230	\N	60752	\N
93868	GENERIC_DAY	0	3	2010-02-04	1228	\N	60753	\N
93869	GENERIC_DAY	0	0	2010-02-08	90901	\N	60753	\N
93870	GENERIC_DAY	0	0	2010-01-31	1220	\N	60753	\N
93871	GENERIC_DAY	0	1	2010-02-08	1217	\N	60753	\N
93872	GENERIC_DAY	0	0	2010-02-06	1220	\N	60753	\N
93873	GENERIC_DAY	0	2	2010-02-04	1220	\N	60753	\N
93874	GENERIC_DAY	0	1	2010-02-01	90901	\N	60753	\N
93875	GENERIC_DAY	0	2	2010-02-05	1220	\N	60753	\N
93876	GENERIC_DAY	0	0	2010-01-30	1217	\N	60753	\N
93877	GENERIC_DAY	0	0	2010-02-03	90901	\N	60753	\N
93878	GENERIC_DAY	0	0	2010-01-31	1217	\N	60753	\N
93879	GENERIC_DAY	0	2	2010-02-04	1230	\N	60753	\N
93880	GENERIC_DAY	0	3	2010-02-01	1228	\N	60753	\N
93881	GENERIC_DAY	0	1	2010-02-03	1217	\N	60753	\N
93882	GENERIC_DAY	0	2	2010-02-02	1220	\N	60753	\N
93883	GENERIC_DAY	0	0	2010-02-07	1220	\N	60753	\N
93884	GENERIC_DAY	0	2	2010-02-03	1230	\N	60753	\N
93885	GENERIC_DAY	0	0	2010-02-05	90901	\N	60753	\N
93886	GENERIC_DAY	0	3	2010-02-08	1228	\N	60753	\N
93887	GENERIC_DAY	0	0	2010-02-06	1217	\N	60753	\N
93888	GENERIC_DAY	0	2	2010-02-03	1220	\N	60753	\N
93889	GENERIC_DAY	0	0	2010-01-31	90901	\N	60753	\N
93890	GENERIC_DAY	0	0	2010-01-30	1230	\N	60753	\N
93891	GENERIC_DAY	0	3	2010-02-03	1228	\N	60753	\N
93892	GENERIC_DAY	0	0	2010-02-04	90901	\N	60753	\N
93893	GENERIC_DAY	0	0	2010-01-30	90901	\N	60753	\N
93894	GENERIC_DAY	0	1	2010-02-02	1217	\N	60753	\N
93895	GENERIC_DAY	0	0	2010-01-31	1230	\N	60753	\N
93896	GENERIC_DAY	0	0	2010-01-31	1228	\N	60753	\N
93897	GENERIC_DAY	0	1	2010-02-02	1230	\N	60753	\N
93898	GENERIC_DAY	0	1	2010-02-04	1217	\N	60753	\N
93899	GENERIC_DAY	0	2	2010-02-08	1220	\N	60753	\N
93900	GENERIC_DAY	0	0	2010-02-06	1230	\N	60753	\N
93901	GENERIC_DAY	0	3	2010-02-02	1228	\N	60753	\N
93902	GENERIC_DAY	0	0	2010-02-07	1228	\N	60753	\N
93903	GENERIC_DAY	0	2	2010-02-01	1220	\N	60753	\N
93904	GENERIC_DAY	0	0	2010-01-30	1220	\N	60753	\N
93905	GENERIC_DAY	0	1	2010-02-01	1217	\N	60753	\N
93906	GENERIC_DAY	0	0	2010-02-06	1228	\N	60753	\N
93907	GENERIC_DAY	0	3	2010-02-05	1228	\N	60753	\N
93908	GENERIC_DAY	0	1	2010-02-05	1217	\N	60753	\N
93909	GENERIC_DAY	0	1	2010-02-01	1230	\N	60753	\N
93910	GENERIC_DAY	0	0	2010-02-07	90901	\N	60753	\N
93911	GENERIC_DAY	0	0	2010-02-07	1230	\N	60753	\N
93912	GENERIC_DAY	0	0	2010-01-30	1228	\N	60753	\N
93913	GENERIC_DAY	0	1	2010-02-02	90901	\N	60753	\N
93914	GENERIC_DAY	0	2	2010-02-08	1230	\N	60753	\N
93915	GENERIC_DAY	0	0	2010-02-06	90901	\N	60753	\N
93916	GENERIC_DAY	0	0	2010-02-07	1217	\N	60753	\N
93917	GENERIC_DAY	0	2	2010-02-05	1230	\N	60753	\N
93918	GENERIC_DAY	0	1	2010-01-07	1228	\N	60754	\N
93919	GENERIC_DAY	0	2	2010-01-04	1228	\N	60754	\N
93920	GENERIC_DAY	0	0	2010-01-03	1217	\N	60754	\N
93921	GENERIC_DAY	0	2	2010-01-06	1220	\N	60754	\N
93922	GENERIC_DAY	0	0	2010-01-04	90901	\N	60754	\N
93923	GENERIC_DAY	0	3	2010-01-05	1220	\N	60754	\N
93924	GENERIC_DAY	0	2	2010-01-06	1228	\N	60754	\N
93925	GENERIC_DAY	0	0	2010-01-07	90901	\N	60754	\N
93926	GENERIC_DAY	0	1	2010-01-04	1217	\N	60754	\N
93927	GENERIC_DAY	0	0	2010-01-02	1217	\N	60754	\N
93928	GENERIC_DAY	0	2	2010-01-05	1228	\N	60754	\N
93929	GENERIC_DAY	0	0	2010-01-03	90901	\N	60754	\N
93930	GENERIC_DAY	0	0	2010-01-02	1220	\N	60754	\N
93931	GENERIC_DAY	0	0	2010-01-05	90901	\N	60754	\N
93932	GENERIC_DAY	0	2	2010-01-06	1230	\N	60754	\N
93933	GENERIC_DAY	0	2	2010-01-05	1230	\N	60754	\N
93934	GENERIC_DAY	0	1	2010-01-07	1220	\N	60754	\N
93935	GENERIC_DAY	0	2	2010-01-06	1217	\N	60754	\N
93936	GENERIC_DAY	0	0	2010-01-02	1230	\N	60754	\N
93937	GENERIC_DAY	0	0	2010-01-03	1230	\N	60754	\N
93938	GENERIC_DAY	0	1	2010-01-07	1230	\N	60754	\N
93939	GENERIC_DAY	0	3	2010-01-04	1220	\N	60754	\N
93940	GENERIC_DAY	0	0	2010-01-03	1228	\N	60754	\N
93941	GENERIC_DAY	0	1	2010-01-07	1217	\N	60754	\N
93942	GENERIC_DAY	0	0	2010-01-06	90901	\N	60754	\N
93943	GENERIC_DAY	0	0	2010-01-03	1220	\N	60754	\N
93944	GENERIC_DAY	0	1	2010-01-05	1217	\N	60754	\N
93945	GENERIC_DAY	0	0	2010-01-02	90901	\N	60754	\N
93946	GENERIC_DAY	0	2	2010-01-04	1230	\N	60754	\N
93947	GENERIC_DAY	0	0	2010-01-02	1228	\N	60754	\N
93948	GENERIC_DAY	0	0	2010-01-04	1230	\N	60705	\N
93949	GENERIC_DAY	0	0	2010-01-06	1217	\N	60705	\N
93950	GENERIC_DAY	0	0	2010-01-03	1228	\N	60705	\N
93951	GENERIC_DAY	0	0	2010-01-10	1220	\N	60705	\N
93952	GENERIC_DAY	0	0	2010-01-01	1220	\N	60705	\N
93953	GENERIC_DAY	0	2	2009-12-24	1217	\N	60705	\N
93954	GENERIC_DAY	0	1	2009-12-29	1228	\N	60705	\N
93955	GENERIC_DAY	0	0	2010-01-10	90901	\N	60705	\N
93956	GENERIC_DAY	0	0	2010-01-09	1217	\N	60705	\N
93957	GENERIC_DAY	0	1	2009-12-25	1230	\N	60705	\N
93958	GENERIC_DAY	0	6	2009-12-29	90901	\N	60705	\N
93959	GENERIC_DAY	0	1	2009-12-30	1228	\N	60705	\N
93960	GENERIC_DAY	0	0	2010-01-05	1220	\N	60705	\N
93961	GENERIC_DAY	0	0	2009-12-27	1217	\N	60705	\N
93962	GENERIC_DAY	0	0	2009-12-28	1228	\N	60705	\N
93963	GENERIC_DAY	0	2	2010-01-11	1230	\N	60705	\N
93964	GENERIC_DAY	0	0	2010-01-05	1230	\N	60705	\N
93965	GENERIC_DAY	0	0	2009-12-27	1230	\N	60705	\N
93966	GENERIC_DAY	0	0	2010-01-01	1230	\N	60705	\N
93967	GENERIC_DAY	0	2	2009-12-24	1220	\N	60705	\N
93968	GENERIC_DAY	0	0	2010-01-01	1228	\N	60705	\N
93969	GENERIC_DAY	0	0	2009-12-28	1220	\N	60705	\N
93970	GENERIC_DAY	0	0	2010-01-09	1230	\N	60705	\N
93971	GENERIC_DAY	0	0	2010-01-01	1217	\N	60705	\N
93972	GENERIC_DAY	0	0	2010-01-07	1220	\N	60705	\N
93973	GENERIC_DAY	0	1	2009-12-29	1230	\N	60705	\N
93974	GENERIC_DAY	0	0	2010-01-03	1230	\N	60705	\N
93975	GENERIC_DAY	0	0	2009-12-26	1230	\N	60705	\N
93976	GENERIC_DAY	0	0	2009-12-31	1228	\N	60705	\N
93977	GENERIC_DAY	0	0	2010-01-03	1217	\N	60705	\N
93978	GENERIC_DAY	0	0	2010-01-10	1217	\N	60705	\N
93979	GENERIC_DAY	0	2	2009-12-22	1217	\N	60705	\N
93980	GENERIC_DAY	0	0	2010-01-03	90901	\N	60705	\N
93981	GENERIC_DAY	0	0	2010-01-06	1230	\N	60705	\N
93982	GENERIC_DAY	0	8	2010-01-06	90901	\N	60705	\N
93983	GENERIC_DAY	0	0	2009-12-24	90901	\N	60705	\N
93984	GENERIC_DAY	0	0	2009-12-29	1220	\N	60705	\N
93985	GENERIC_DAY	0	0	2010-01-03	1220	\N	60705	\N
93986	GENERIC_DAY	0	8	2010-01-04	90901	\N	60705	\N
93987	GENERIC_DAY	0	0	2010-01-06	1228	\N	60705	\N
93988	GENERIC_DAY	0	2	2009-12-24	1230	\N	60705	\N
93989	GENERIC_DAY	0	0	2009-12-28	1217	\N	60705	\N
93990	GENERIC_DAY	0	0	2010-01-02	1228	\N	60705	\N
93991	GENERIC_DAY	0	0	2010-01-02	1230	\N	60705	\N
93992	GENERIC_DAY	0	1	2010-01-11	1217	\N	60705	\N
93993	GENERIC_DAY	0	0	2010-01-07	1228	\N	60705	\N
93994	GENERIC_DAY	0	0	2010-01-08	1217	\N	60705	\N
93995	GENERIC_DAY	0	2	2010-01-11	1220	\N	60705	\N
93996	GENERIC_DAY	0	0	2009-12-30	1220	\N	60705	\N
93997	GENERIC_DAY	0	3	2010-01-11	1228	\N	60705	\N
93998	GENERIC_DAY	0	0	2009-12-29	1217	\N	60705	\N
93999	GENERIC_DAY	0	0	2009-12-31	1230	\N	60705	\N
94000	GENERIC_DAY	0	0	2010-01-02	1220	\N	60705	\N
94001	GENERIC_DAY	0	0	2010-01-07	1230	\N	60705	\N
94002	GENERIC_DAY	0	8	2010-01-01	90901	\N	60705	\N
94003	GENERIC_DAY	0	8	2009-12-31	90901	\N	60705	\N
94004	GENERIC_DAY	0	2	2009-12-22	1228	\N	60705	\N
94005	GENERIC_DAY	0	0	2010-01-06	1220	\N	60705	\N
94006	GENERIC_DAY	0	0	2009-12-26	1217	\N	60705	\N
94007	GENERIC_DAY	0	0	2010-01-02	1217	\N	60705	\N
94008	GENERIC_DAY	0	0	2010-01-04	1220	\N	60705	\N
94009	GENERIC_DAY	0	0	2010-01-08	1230	\N	60705	\N
94010	GENERIC_DAY	0	0	2010-01-10	1230	\N	60705	\N
94011	GENERIC_DAY	0	0	2010-01-09	1220	\N	60705	\N
94012	GENERIC_DAY	0	8	2010-01-05	90901	\N	60705	\N
94013	GENERIC_DAY	0	0	2010-01-05	1217	\N	60705	\N
94014	GENERIC_DAY	0	0	2009-12-27	1228	\N	60705	\N
94015	GENERIC_DAY	0	8	2010-01-08	90901	\N	60705	\N
94016	GENERIC_DAY	0	6	2009-12-30	90901	\N	60705	\N
94017	GENERIC_DAY	0	2	2009-12-23	1217	\N	60705	\N
94018	GENERIC_DAY	0	0	2009-12-23	90901	\N	60705	\N
94019	GENERIC_DAY	0	0	2010-01-09	90901	\N	60705	\N
94020	GENERIC_DAY	0	1	2009-12-25	1228	\N	60705	\N
94021	GENERIC_DAY	0	2	2009-12-24	1228	\N	60705	\N
94022	GENERIC_DAY	0	0	2010-01-08	1220	\N	60705	\N
94023	GENERIC_DAY	0	2	2009-12-23	1230	\N	60705	\N
94024	GENERIC_DAY	0	0	2010-01-09	1228	\N	60705	\N
94025	GENERIC_DAY	0	0	2009-12-26	90901	\N	60705	\N
94026	GENERIC_DAY	0	1	2009-12-30	1217	\N	60705	\N
94027	GENERIC_DAY	0	0	2009-12-27	90901	\N	60705	\N
94028	GENERIC_DAY	0	0	2009-12-26	1220	\N	60705	\N
94029	GENERIC_DAY	0	0	2010-01-07	1217	\N	60705	\N
94030	GENERIC_DAY	0	0	2009-12-31	1217	\N	60705	\N
94031	GENERIC_DAY	0	2	2009-12-23	1228	\N	60705	\N
94032	GENERIC_DAY	0	8	2010-01-07	90901	\N	60705	\N
94033	GENERIC_DAY	0	0	2010-01-05	1228	\N	60705	\N
94034	GENERIC_DAY	0	4	2009-12-25	90901	\N	60705	\N
94035	GENERIC_DAY	0	0	2009-12-25	1217	\N	60705	\N
94036	GENERIC_DAY	0	0	2009-12-31	1220	\N	60705	\N
94037	GENERIC_DAY	0	2	2009-12-22	1230	\N	60705	\N
94038	GENERIC_DAY	0	8	2009-12-28	90901	\N	60705	\N
94039	GENERIC_DAY	0	0	2009-12-28	1230	\N	60705	\N
94040	GENERIC_DAY	0	0	2009-12-22	90901	\N	60705	\N
94041	GENERIC_DAY	0	0	2010-01-10	1228	\N	60705	\N
94042	GENERIC_DAY	0	0	2010-01-04	1228	\N	60705	\N
94043	GENERIC_DAY	0	0	2010-01-08	1228	\N	60705	\N
94044	GENERIC_DAY	0	0	2009-12-26	1228	\N	60705	\N
94045	GENERIC_DAY	0	2	2009-12-25	1220	\N	60705	\N
94046	GENERIC_DAY	0	2	2009-12-23	1220	\N	60705	\N
94047	GENERIC_DAY	0	0	2010-01-11	90901	\N	60705	\N
94048	GENERIC_DAY	0	0	2009-12-30	1230	\N	60705	\N
94049	GENERIC_DAY	0	0	2010-01-02	90901	\N	60705	\N
94050	GENERIC_DAY	0	0	2010-01-04	1217	\N	60705	\N
94051	GENERIC_DAY	0	0	2009-12-27	1220	\N	60705	\N
94052	GENERIC_DAY	0	2	2009-12-22	1220	\N	60705	\N
94053	GENERIC_DAY	0	2	2009-12-30	1230	\N	60791	\N
94054	GENERIC_DAY	0	0	2010-01-02	1228	\N	60791	\N
94055	GENERIC_DAY	0	0	2009-12-26	1220	\N	60791	\N
94056	GENERIC_DAY	0	2	2009-12-31	1220	\N	60791	\N
94057	GENERIC_DAY	0	2	2009-12-30	1228	\N	60791	\N
94058	GENERIC_DAY	0	2	2009-12-28	1230	\N	60791	\N
94059	GENERIC_DAY	0	2	2009-12-28	1228	\N	60791	\N
94060	GENERIC_DAY	0	6	2010-01-05	90901	\N	60791	\N
94061	GENERIC_DAY	0	6	2010-01-04	90901	\N	60791	\N
94062	GENERIC_DAY	0	1	2010-01-06	1228	\N	60791	\N
94063	GENERIC_DAY	0	0	2010-01-03	1230	\N	60791	\N
94064	GENERIC_DAY	0	0	2009-12-27	1230	\N	60791	\N
94065	GENERIC_DAY	0	2	2009-12-29	1220	\N	60791	\N
94066	GENERIC_DAY	0	0	2009-12-27	1220	\N	60791	\N
94067	GENERIC_DAY	0	2	2010-01-01	1217	\N	60791	\N
94068	GENERIC_DAY	0	2	2009-12-29	1230	\N	60791	\N
94069	GENERIC_DAY	0	0	2009-12-27	90901	\N	60791	\N
94070	GENERIC_DAY	0	0	2009-12-30	90901	\N	60791	\N
94071	GENERIC_DAY	0	2	2010-01-01	1220	\N	60791	\N
94072	GENERIC_DAY	0	0	2010-01-05	1220	\N	60791	\N
94073	GENERIC_DAY	0	0	2009-12-26	1217	\N	60791	\N
94074	GENERIC_DAY	0	0	2010-01-03	1217	\N	60791	\N
94075	GENERIC_DAY	0	0	2010-01-06	1230	\N	60791	\N
94076	GENERIC_DAY	0	2	2009-12-29	1228	\N	60791	\N
94077	GENERIC_DAY	0	2	2009-12-30	1217	\N	60791	\N
94078	GENERIC_DAY	0	0	2010-01-05	1230	\N	60791	\N
94079	GENERIC_DAY	0	0	2010-01-03	90901	\N	60791	\N
94080	GENERIC_DAY	0	0	2010-01-03	1228	\N	60791	\N
94081	GENERIC_DAY	0	0	2010-01-02	90901	\N	60791	\N
94082	GENERIC_DAY	0	0	2009-12-26	1230	\N	60791	\N
94083	GENERIC_DAY	0	1	2010-01-05	1228	\N	60791	\N
94084	GENERIC_DAY	0	2	2009-12-30	1220	\N	60791	\N
94085	GENERIC_DAY	0	1	2010-01-05	1217	\N	60791	\N
94086	GENERIC_DAY	0	2	2009-12-28	1217	\N	60791	\N
94087	GENERIC_DAY	0	0	2009-12-27	1228	\N	60791	\N
94088	GENERIC_DAY	0	0	2009-12-29	90901	\N	60791	\N
94089	GENERIC_DAY	0	0	2010-01-06	1220	\N	60791	\N
94090	GENERIC_DAY	0	1	2010-01-04	1217	\N	60791	\N
94091	GENERIC_DAY	0	0	2009-12-31	90901	\N	60791	\N
94092	GENERIC_DAY	0	2	2009-12-29	1217	\N	60791	\N
94093	GENERIC_DAY	0	0	2010-01-02	1220	\N	60791	\N
94094	GENERIC_DAY	0	0	2010-01-03	1220	\N	60791	\N
94095	GENERIC_DAY	0	2	2009-12-31	1217	\N	60791	\N
94096	GENERIC_DAY	0	2	2010-01-01	1230	\N	60791	\N
94097	GENERIC_DAY	0	2	2009-12-28	1220	\N	60791	\N
94098	GENERIC_DAY	0	0	2010-01-04	1220	\N	60791	\N
94099	GENERIC_DAY	0	2	2009-12-31	1228	\N	60791	\N
94100	GENERIC_DAY	0	0	2010-01-02	1230	\N	60791	\N
94101	GENERIC_DAY	0	0	2010-01-02	1217	\N	60791	\N
94102	GENERIC_DAY	0	0	2010-01-01	90901	\N	60791	\N
94103	GENERIC_DAY	0	2	2010-01-01	1228	\N	60791	\N
94104	GENERIC_DAY	0	1	2010-01-06	1217	\N	60791	\N
94105	GENERIC_DAY	0	0	2009-12-26	1228	\N	60791	\N
94106	GENERIC_DAY	0	0	2009-12-27	1217	\N	60791	\N
94107	GENERIC_DAY	0	0	2009-12-26	90901	\N	60791	\N
94108	GENERIC_DAY	0	2	2009-12-31	1230	\N	60791	\N
94109	GENERIC_DAY	0	6	2010-01-06	90901	\N	60791	\N
94110	GENERIC_DAY	0	1	2010-01-04	1228	\N	60791	\N
94111	GENERIC_DAY	0	0	2009-12-28	90901	\N	60791	\N
94112	GENERIC_DAY	0	0	2010-01-04	1230	\N	60791	\N
94113	GENERIC_DAY	0	0	2010-01-03	90901	\N	58450	\N
94114	GENERIC_DAY	0	1	2010-01-01	1217	\N	58450	\N
94115	GENERIC_DAY	0	0	2010-01-04	90901	\N	58450	\N
94116	GENERIC_DAY	0	0	2010-01-02	1230	\N	58450	\N
94117	GENERIC_DAY	0	0	2010-01-03	1230	\N	58450	\N
94118	GENERIC_DAY	0	0	2010-01-02	1228	\N	58450	\N
94119	GENERIC_DAY	0	2	2010-01-01	1228	\N	58450	\N
94120	GENERIC_DAY	0	0	2010-01-02	1220	\N	58450	\N
94121	GENERIC_DAY	0	2	2010-01-04	1230	\N	58450	\N
94122	GENERIC_DAY	0	0	2010-01-03	1217	\N	58450	\N
94123	GENERIC_DAY	0	3	2010-01-01	1220	\N	58450	\N
94124	GENERIC_DAY	0	2	2010-01-04	1228	\N	58450	\N
94125	GENERIC_DAY	0	0	2010-01-02	90901	\N	58450	\N
94126	GENERIC_DAY	0	2	2010-01-04	1220	\N	58450	\N
94127	GENERIC_DAY	0	0	2010-01-03	1220	\N	58450	\N
94128	GENERIC_DAY	0	0	2010-01-03	1228	\N	58450	\N
94129	GENERIC_DAY	0	0	2010-01-02	1217	\N	58450	\N
94130	GENERIC_DAY	0	2	2010-01-04	1217	\N	58450	\N
94131	GENERIC_DAY	0	2	2010-01-01	1230	\N	58450	\N
94132	GENERIC_DAY	0	0	2010-01-01	90901	\N	58450	\N
94133	GENERIC_DAY	0	2	2010-01-07	1230	\N	58451	\N
94134	GENERIC_DAY	0	3	2010-01-07	1220	\N	58451	\N
94135	GENERIC_DAY	0	0	2010-01-05	90901	\N	58451	\N
94136	GENERIC_DAY	0	2	2010-01-06	1228	\N	58451	\N
94137	GENERIC_DAY	0	2	2010-01-05	1228	\N	58451	\N
94138	GENERIC_DAY	0	2	2010-01-08	1230	\N	58451	\N
94139	GENERIC_DAY	0	1	2010-01-07	1217	\N	58451	\N
94140	GENERIC_DAY	0	2	2010-01-06	1217	\N	58451	\N
94141	GENERIC_DAY	0	0	2010-01-07	90901	\N	58451	\N
94142	GENERIC_DAY	0	2	2010-01-06	1230	\N	58451	\N
94143	GENERIC_DAY	0	2	2010-01-08	1217	\N	58451	\N
94144	GENERIC_DAY	0	0	2010-01-06	90901	\N	58451	\N
94145	GENERIC_DAY	0	2	2010-01-08	1220	\N	58451	\N
94146	GENERIC_DAY	0	2	2010-01-06	1220	\N	58451	\N
94147	GENERIC_DAY	0	0	2010-01-08	90901	\N	58451	\N
94148	GENERIC_DAY	0	2	2010-01-08	1228	\N	58451	\N
94149	GENERIC_DAY	0	2	2010-01-07	1228	\N	58451	\N
94150	GENERIC_DAY	0	2	2010-01-05	1230	\N	58451	\N
94151	GENERIC_DAY	0	2	2010-01-05	1220	\N	58451	\N
94152	GENERIC_DAY	0	2	2010-01-05	1217	\N	58451	\N
94153	GENERIC_DAY	0	0	2010-01-15	90901	\N	58452	\N
94154	GENERIC_DAY	0	0	2010-01-10	1228	\N	58452	\N
94155	GENERIC_DAY	0	3	2010-01-11	1220	\N	58452	\N
94156	GENERIC_DAY	0	3	2010-01-12	1220	\N	58452	\N
94157	GENERIC_DAY	0	3	2010-01-14	1220	\N	58452	\N
94158	GENERIC_DAY	0	0	2010-01-10	90901	\N	58452	\N
94159	GENERIC_DAY	0	0	2010-01-09	1220	\N	58452	\N
94160	GENERIC_DAY	0	2	2010-01-11	1230	\N	58452	\N
94161	GENERIC_DAY	0	2	2010-01-11	1228	\N	58452	\N
94162	GENERIC_DAY	0	0	2010-01-10	1230	\N	58452	\N
94163	GENERIC_DAY	0	1	2010-01-15	1217	\N	58452	\N
94164	GENERIC_DAY	0	0	2010-01-10	1220	\N	58452	\N
94165	GENERIC_DAY	0	0	2010-01-09	1230	\N	58452	\N
94166	GENERIC_DAY	0	2	2010-01-12	1228	\N	58452	\N
94167	GENERIC_DAY	0	2	2010-01-12	1230	\N	58452	\N
94168	GENERIC_DAY	0	0	2010-01-13	90901	\N	58452	\N
94169	GENERIC_DAY	0	0	2010-01-14	90901	\N	58452	\N
94170	GENERIC_DAY	0	2	2010-01-14	1230	\N	58452	\N
94171	GENERIC_DAY	0	0	2010-01-09	1217	\N	58452	\N
94172	GENERIC_DAY	0	1	2010-01-14	1217	\N	58452	\N
94173	GENERIC_DAY	0	2	2010-01-15	1230	\N	58452	\N
94174	GENERIC_DAY	0	0	2010-01-10	1217	\N	58452	\N
94175	GENERIC_DAY	0	0	2010-01-12	90901	\N	58452	\N
94176	GENERIC_DAY	0	0	2010-01-09	1228	\N	58452	\N
94177	GENERIC_DAY	0	2	2010-01-15	1228	\N	58452	\N
94178	GENERIC_DAY	0	1	2010-01-11	1217	\N	58452	\N
94179	GENERIC_DAY	0	2	2010-01-14	1228	\N	58452	\N
94180	GENERIC_DAY	0	1	2010-01-13	1217	\N	58452	\N
94181	GENERIC_DAY	0	3	2010-01-13	1220	\N	58452	\N
94182	GENERIC_DAY	0	2	2010-01-13	1230	\N	58452	\N
94183	GENERIC_DAY	0	1	2010-01-12	1217	\N	58452	\N
94184	GENERIC_DAY	0	0	2010-01-09	90901	\N	58452	\N
94185	GENERIC_DAY	0	3	2010-01-15	1220	\N	58452	\N
94186	GENERIC_DAY	0	0	2010-01-11	90901	\N	58452	\N
94187	GENERIC_DAY	0	2	2010-01-13	1228	\N	58452	\N
94188	GENERIC_DAY	0	0	2010-01-19	90901	\N	58453	\N
94189	GENERIC_DAY	0	2	2010-01-19	1228	\N	58453	\N
94190	GENERIC_DAY	0	0	2010-01-16	1228	\N	58453	\N
94191	GENERIC_DAY	0	2	2010-01-18	1228	\N	58453	\N
94192	GENERIC_DAY	0	0	2010-01-16	1230	\N	58453	\N
94193	GENERIC_DAY	0	0	2010-01-16	1217	\N	58453	\N
94194	GENERIC_DAY	0	0	2010-01-17	1217	\N	58453	\N
94195	GENERIC_DAY	0	0	2010-01-16	1220	\N	58453	\N
94196	GENERIC_DAY	0	0	2010-01-17	1230	\N	58453	\N
94197	GENERIC_DAY	0	0	2010-01-16	90901	\N	58453	\N
94198	GENERIC_DAY	0	2	2010-01-18	1217	\N	58453	\N
94199	GENERIC_DAY	0	2	2010-01-19	1230	\N	58453	\N
94200	GENERIC_DAY	0	2	2010-01-18	1220	\N	58453	\N
94201	GENERIC_DAY	0	2	2010-01-19	1217	\N	58453	\N
94202	GENERIC_DAY	0	0	2010-01-17	90901	\N	58453	\N
94203	GENERIC_DAY	0	0	2010-01-17	1220	\N	58453	\N
94204	GENERIC_DAY	0	0	2010-01-17	1228	\N	58453	\N
94205	GENERIC_DAY	0	2	2010-01-19	1220	\N	58453	\N
94206	GENERIC_DAY	0	0	2010-01-18	90901	\N	58453	\N
94207	GENERIC_DAY	0	2	2010-01-18	1230	\N	58453	\N
94208	GENERIC_DAY	0	0	2010-01-20	90901	\N	58454	\N
94209	GENERIC_DAY	0	2	2010-01-21	1220	\N	58454	\N
94210	GENERIC_DAY	0	2	2010-01-25	1220	\N	58454	\N
94211	GENERIC_DAY	0	0	2010-01-25	90901	\N	58454	\N
94212	GENERIC_DAY	0	2	2010-01-25	1230	\N	58454	\N
94213	GENERIC_DAY	0	2	2010-01-22	1220	\N	58454	\N
94214	GENERIC_DAY	0	2	2010-01-21	1230	\N	58454	\N
94215	GENERIC_DAY	0	0	2010-01-23	1220	\N	58454	\N
94216	GENERIC_DAY	0	2	2010-01-22	1230	\N	58454	\N
94217	GENERIC_DAY	0	1	2010-01-25	1217	\N	58454	\N
94218	GENERIC_DAY	0	0	2010-01-24	1230	\N	58454	\N
94219	GENERIC_DAY	0	3	2010-01-25	1228	\N	58454	\N
94220	GENERIC_DAY	0	0	2010-01-24	1228	\N	58454	\N
94221	GENERIC_DAY	0	1	2010-01-21	1217	\N	58454	\N
94222	GENERIC_DAY	0	1	2010-01-22	1217	\N	58454	\N
94223	GENERIC_DAY	0	3	2010-01-22	1228	\N	58454	\N
94224	GENERIC_DAY	0	3	2010-01-21	1228	\N	58454	\N
94225	GENERIC_DAY	0	0	2010-01-23	1228	\N	58454	\N
94226	GENERIC_DAY	0	0	2010-01-23	1217	\N	58454	\N
94227	GENERIC_DAY	0	0	2010-01-24	90901	\N	58454	\N
94228	GENERIC_DAY	0	0	2010-01-22	90901	\N	58454	\N
94229	GENERIC_DAY	0	0	2010-01-23	90901	\N	58454	\N
94230	GENERIC_DAY	0	2	2010-01-20	1230	\N	58454	\N
94231	GENERIC_DAY	0	3	2010-01-20	1220	\N	58454	\N
94232	GENERIC_DAY	0	2	2010-01-20	1228	\N	58454	\N
94233	GENERIC_DAY	0	0	2010-01-23	1230	\N	58454	\N
94234	GENERIC_DAY	0	0	2010-01-24	1220	\N	58454	\N
94235	GENERIC_DAY	0	0	2010-01-21	90901	\N	58454	\N
94236	GENERIC_DAY	0	1	2010-01-20	1217	\N	58454	\N
94237	GENERIC_DAY	0	0	2010-01-24	1217	\N	58454	\N
94238	GENERIC_DAY	0	0	2009-12-14	1230	\N	58383	\N
94239	GENERIC_DAY	0	8	2009-12-14	90901	\N	58383	\N
94240	GENERIC_DAY	0	0	2009-12-14	1228	\N	58383	\N
94241	GENERIC_DAY	0	0	2009-12-14	1217	\N	58383	\N
94242	GENERIC_DAY	0	0	2009-12-14	1220	\N	58383	\N
94243	GENERIC_DAY	0	3	2009-12-16	1228	\N	58384	\N
94244	GENERIC_DAY	0	3	2009-12-15	1228	\N	58384	\N
94245	GENERIC_DAY	0	1	2009-12-15	1220	\N	58384	\N
94246	GENERIC_DAY	0	0	2009-12-15	90901	\N	58384	\N
94247	GENERIC_DAY	0	3	2009-12-15	1230	\N	58384	\N
94248	GENERIC_DAY	0	0	2009-12-16	90901	\N	58384	\N
94249	GENERIC_DAY	0	1	2009-12-16	1220	\N	58384	\N
94250	GENERIC_DAY	0	3	2009-12-16	1230	\N	58384	\N
94251	GENERIC_DAY	0	1	2009-12-16	1217	\N	58384	\N
94252	GENERIC_DAY	0	1	2009-12-15	1217	\N	58384	\N
94253	GENERIC_DAY	0	2	2009-12-18	1228	\N	58455	\N
94254	GENERIC_DAY	0	0	2009-12-17	90901	\N	58455	\N
94255	GENERIC_DAY	0	0	2009-12-18	90901	\N	58455	\N
94256	GENERIC_DAY	0	2	2009-12-17	1230	\N	58455	\N
94257	GENERIC_DAY	0	2	2009-12-17	1220	\N	58455	\N
94258	GENERIC_DAY	0	2	2009-12-18	1217	\N	58455	\N
94259	GENERIC_DAY	0	2	2009-12-18	1230	\N	58455	\N
94260	GENERIC_DAY	0	2	2009-12-18	1220	\N	58455	\N
94261	GENERIC_DAY	0	2	2009-12-17	1228	\N	58455	\N
94262	GENERIC_DAY	0	2	2009-12-17	1217	\N	58455	\N
94263	GENERIC_DAY	0	2	2009-12-21	1230	\N	58456	\N
94264	GENERIC_DAY	0	2	2009-12-21	1228	\N	58456	\N
94265	GENERIC_DAY	0	0	2009-12-23	1228	\N	58456	\N
94266	GENERIC_DAY	0	0	2009-12-25	1217	\N	58456	\N
94267	GENERIC_DAY	0	0	2009-12-23	1230	\N	58456	\N
94268	GENERIC_DAY	0	0	2009-12-19	1228	\N	58456	\N
94269	GENERIC_DAY	0	0	2009-12-19	1230	\N	58456	\N
94270	GENERIC_DAY	0	0	2009-12-25	1228	\N	58456	\N
94271	GENERIC_DAY	0	8	2009-12-22	90901	\N	58456	\N
94272	GENERIC_DAY	0	0	2009-12-19	1217	\N	58456	\N
94273	GENERIC_DAY	0	8	2009-12-23	90901	\N	58456	\N
94274	GENERIC_DAY	0	0	2009-12-22	1217	\N	58456	\N
94275	GENERIC_DAY	0	0	2009-12-25	1230	\N	58456	\N
94276	GENERIC_DAY	0	0	2009-12-20	1217	\N	58456	\N
94277	GENERIC_DAY	0	0	2009-12-24	1217	\N	58456	\N
94278	GENERIC_DAY	0	8	2009-12-25	90901	\N	58456	\N
94279	GENERIC_DAY	0	0	2009-12-19	1220	\N	58456	\N
94280	GENERIC_DAY	0	0	2009-12-22	1220	\N	58456	\N
94281	GENERIC_DAY	0	1	2009-12-21	1220	\N	58456	\N
94282	GENERIC_DAY	0	8	2009-12-24	90901	\N	58456	\N
94283	GENERIC_DAY	0	0	2009-12-24	1228	\N	58456	\N
94284	GENERIC_DAY	0	0	2009-12-23	1220	\N	58456	\N
94285	GENERIC_DAY	0	1	2009-12-21	1217	\N	58456	\N
94286	GENERIC_DAY	0	0	2009-12-23	1217	\N	58456	\N
94287	GENERIC_DAY	0	0	2009-12-19	90901	\N	58456	\N
94288	GENERIC_DAY	0	0	2009-12-22	1228	\N	58456	\N
94289	GENERIC_DAY	0	0	2009-12-20	1220	\N	58456	\N
94290	GENERIC_DAY	0	0	2009-12-22	1230	\N	58456	\N
94291	GENERIC_DAY	0	0	2009-12-25	1220	\N	58456	\N
94292	GENERIC_DAY	0	0	2009-12-20	1230	\N	58456	\N
94293	GENERIC_DAY	0	0	2009-12-24	1220	\N	58456	\N
94294	GENERIC_DAY	0	0	2009-12-20	1228	\N	58456	\N
94295	GENERIC_DAY	0	0	2009-12-20	90901	\N	58456	\N
94296	GENERIC_DAY	0	0	2009-12-24	1230	\N	58456	\N
94297	GENERIC_DAY	0	2	2009-12-21	90901	\N	58456	\N
94298	GENERIC_DAY	0	8	2009-12-14	1224	\N	58458	\N
94299	GENERIC_DAY	0	7	2009-12-15	1224	\N	58458	\N
94300	GENERIC_DAY	0	1	2009-12-16	1217	\N	58459	\N
94301	GENERIC_DAY	0	2	2009-12-18	1228	\N	58459	\N
94302	GENERIC_DAY	0	0	2009-12-19	1230	\N	58459	\N
94303	GENERIC_DAY	0	0	2009-12-19	1217	\N	58459	\N
94304	GENERIC_DAY	0	0	2009-12-19	1220	\N	58459	\N
94305	GENERIC_DAY	0	2	2009-12-18	1220	\N	58459	\N
94306	GENERIC_DAY	0	0	2009-12-21	1228	\N	58459	\N
94307	GENERIC_DAY	0	1	2009-12-15	1217	\N	58459	\N
94308	GENERIC_DAY	0	2	2009-12-14	1230	\N	58459	\N
94309	GENERIC_DAY	0	0	2009-12-20	1228	\N	58459	\N
94310	GENERIC_DAY	0	2	2009-12-18	1230	\N	58459	\N
94311	GENERIC_DAY	0	0	2009-12-19	1228	\N	58459	\N
94312	GENERIC_DAY	0	2	2009-12-18	1217	\N	58459	\N
94313	GENERIC_DAY	0	2	2009-12-14	1220	\N	58459	\N
94314	GENERIC_DAY	0	0	2009-12-21	1230	\N	58459	\N
94315	GENERIC_DAY	0	2	2009-12-16	1228	\N	58459	\N
94316	GENERIC_DAY	0	0	2009-12-21	1220	\N	58459	\N
94317	GENERIC_DAY	0	0	2009-12-20	1230	\N	58459	\N
94318	GENERIC_DAY	0	0	2009-12-14	90901	\N	58459	\N
94319	GENERIC_DAY	0	2	2009-12-17	1228	\N	58459	\N
94320	GENERIC_DAY	0	0	2009-12-20	90901	\N	58459	\N
94321	GENERIC_DAY	0	2	2009-12-17	1220	\N	58459	\N
94322	GENERIC_DAY	0	2	2009-12-17	1230	\N	58459	\N
94323	GENERIC_DAY	0	2	2009-12-14	1228	\N	58459	\N
94324	GENERIC_DAY	0	2	2009-12-17	1217	\N	58459	\N
94325	GENERIC_DAY	0	2	2009-12-15	1228	\N	58459	\N
94326	GENERIC_DAY	0	8	2009-12-21	90901	\N	58459	\N
94327	GENERIC_DAY	0	1	2009-12-15	90901	\N	58459	\N
94328	GENERIC_DAY	0	2	2009-12-15	1230	\N	58459	\N
94329	GENERIC_DAY	0	2	2009-12-16	1220	\N	58459	\N
94330	GENERIC_DAY	0	0	2009-12-19	90901	\N	58459	\N
94331	GENERIC_DAY	0	0	2009-12-20	1220	\N	58459	\N
94332	GENERIC_DAY	0	2	2009-12-16	1230	\N	58459	\N
94333	GENERIC_DAY	0	0	2009-12-18	90901	\N	58459	\N
94334	GENERIC_DAY	0	2	2009-12-14	1217	\N	58459	\N
94335	GENERIC_DAY	0	2	2009-12-15	1220	\N	58459	\N
94336	GENERIC_DAY	0	0	2009-12-20	1217	\N	58459	\N
94337	GENERIC_DAY	0	0	2009-12-17	90901	\N	58459	\N
94338	GENERIC_DAY	0	0	2009-12-21	1217	\N	58459	\N
94339	GENERIC_DAY	0	1	2009-12-16	90901	\N	58459	\N
94340	GENERIC_DAY	0	2	2009-12-25	1220	\N	58460	\N
94341	GENERIC_DAY	0	2	2009-12-30	1228	\N	58460	\N
94342	GENERIC_DAY	0	0	2009-12-25	90901	\N	58460	\N
94343	GENERIC_DAY	0	6	2009-12-31	90901	\N	58460	\N
94344	GENERIC_DAY	0	0	2009-12-26	1217	\N	58460	\N
94345	GENERIC_DAY	0	0	2009-12-29	90901	\N	58460	\N
94346	GENERIC_DAY	0	2	2009-12-28	1217	\N	58460	\N
94347	GENERIC_DAY	0	2	2009-12-30	1220	\N	58460	\N
94348	GENERIC_DAY	0	2	2009-12-30	1230	\N	58460	\N
94349	GENERIC_DAY	0	2	2009-12-30	1217	\N	58460	\N
94350	GENERIC_DAY	0	2	2009-12-25	1228	\N	58460	\N
94351	GENERIC_DAY	0	0	2009-12-31	1230	\N	58460	\N
94352	GENERIC_DAY	0	2	2009-12-28	1220	\N	58460	\N
94353	GENERIC_DAY	0	2	2009-12-29	1230	\N	58460	\N
94354	GENERIC_DAY	0	0	2009-12-26	90901	\N	58460	\N
94355	GENERIC_DAY	0	0	2009-12-26	1228	\N	58460	\N
94356	GENERIC_DAY	0	0	2009-12-26	1230	\N	58460	\N
94357	GENERIC_DAY	0	0	2009-12-27	1220	\N	58460	\N
94358	GENERIC_DAY	0	2	2009-12-25	1230	\N	58460	\N
94359	GENERIC_DAY	0	0	2009-12-27	1230	\N	58460	\N
94360	GENERIC_DAY	0	2	2009-12-29	1220	\N	58460	\N
94361	GENERIC_DAY	0	2	2009-12-28	1230	\N	58460	\N
94362	GENERIC_DAY	0	2	2009-12-29	1217	\N	58460	\N
94363	GENERIC_DAY	0	2	2009-12-25	1217	\N	58460	\N
94364	GENERIC_DAY	0	1	2009-12-31	1217	\N	58460	\N
94365	GENERIC_DAY	0	0	2009-12-27	1217	\N	58460	\N
94366	GENERIC_DAY	0	0	2009-12-27	90901	\N	58460	\N
94367	GENERIC_DAY	0	2	2009-12-28	1228	\N	58460	\N
94368	GENERIC_DAY	0	2	2009-12-29	1228	\N	58460	\N
94369	GENERIC_DAY	0	0	2009-12-30	90901	\N	58460	\N
94370	GENERIC_DAY	0	0	2009-12-28	90901	\N	58460	\N
94371	GENERIC_DAY	0	0	2009-12-26	1220	\N	58460	\N
94372	GENERIC_DAY	0	1	2009-12-31	1228	\N	58460	\N
94373	GENERIC_DAY	0	0	2009-12-27	1228	\N	58460	\N
94374	GENERIC_DAY	0	0	2009-12-31	1220	\N	58460	\N
94375	SPECIFIC_DAY	0	0	2009-12-19	1217	60793	\N	\N
94376	SPECIFIC_DAY	0	2	2009-12-29	1217	60793	\N	\N
94377	SPECIFIC_DAY	0	2	2009-12-23	1217	60793	\N	\N
94378	SPECIFIC_DAY	0	0	2009-12-20	1217	60793	\N	\N
94379	SPECIFIC_DAY	0	2	2009-12-18	1217	60793	\N	\N
94380	SPECIFIC_DAY	0	2	2009-12-24	1217	60793	\N	\N
94381	SPECIFIC_DAY	0	0	2009-12-26	1217	60793	\N	\N
94382	SPECIFIC_DAY	0	2	2009-12-21	1217	60793	\N	\N
94383	SPECIFIC_DAY	0	2	2009-12-28	1217	60793	\N	\N
94384	SPECIFIC_DAY	0	0	2009-12-27	1217	60793	\N	\N
94385	SPECIFIC_DAY	0	2	2009-12-25	1217	60793	\N	\N
94386	SPECIFIC_DAY	0	2	2009-12-14	1217	60793	\N	\N
94387	SPECIFIC_DAY	0	2	2009-12-16	1217	60793	\N	\N
94388	SPECIFIC_DAY	0	2	2009-12-17	1217	60793	\N	\N
94389	SPECIFIC_DAY	0	2	2009-12-22	1217	60793	\N	\N
94390	SPECIFIC_DAY	0	2	2009-12-15	1217	60793	\N	\N
94391	SPECIFIC_DAY	0	1	2010-01-06	1217	60794	\N	\N
94392	SPECIFIC_DAY	0	0	2010-01-16	1217	60794	\N	\N
94393	SPECIFIC_DAY	0	1	2010-01-26	1217	60794	\N	\N
94394	SPECIFIC_DAY	0	1	2009-12-30	1217	60794	\N	\N
94395	SPECIFIC_DAY	0	0	2010-01-02	1217	60794	\N	\N
94396	SPECIFIC_DAY	0	1	2010-01-12	1217	60794	\N	\N
94397	SPECIFIC_DAY	0	0	2010-01-30	1217	60794	\N	\N
94398	SPECIFIC_DAY	0	1	2010-01-11	1217	60794	\N	\N
94399	SPECIFIC_DAY	0	1	2010-02-08	1217	60794	\N	\N
94400	SPECIFIC_DAY	0	1	2010-01-21	1217	60794	\N	\N
94401	SPECIFIC_DAY	0	1	2010-01-08	1217	60794	\N	\N
94402	SPECIFIC_DAY	0	1	2010-01-27	1217	60794	\N	\N
94403	SPECIFIC_DAY	0	0	2010-01-09	1217	60794	\N	\N
94404	SPECIFIC_DAY	0	1	2010-02-02	1217	60794	\N	\N
94405	SPECIFIC_DAY	0	1	2010-01-15	1217	60794	\N	\N
94406	SPECIFIC_DAY	0	0	2010-02-07	1217	60794	\N	\N
94407	SPECIFIC_DAY	0	1	2010-02-04	1217	60794	\N	\N
94408	SPECIFIC_DAY	0	1	2010-01-05	1217	60794	\N	\N
94409	SPECIFIC_DAY	0	1	2010-02-11	1217	60794	\N	\N
94410	SPECIFIC_DAY	0	1	2010-02-05	1217	60794	\N	\N
94411	SPECIFIC_DAY	0	1	2010-01-13	1217	60794	\N	\N
94412	SPECIFIC_DAY	0	1	2010-01-25	1217	60794	\N	\N
94413	SPECIFIC_DAY	0	1	2010-01-28	1217	60794	\N	\N
94414	SPECIFIC_DAY	0	0	2010-01-03	1217	60794	\N	\N
94415	SPECIFIC_DAY	0	1	2010-01-20	1217	60794	\N	\N
94416	SPECIFIC_DAY	0	0	2010-01-24	1217	60794	\N	\N
94417	SPECIFIC_DAY	0	0	2010-01-10	1217	60794	\N	\N
94418	SPECIFIC_DAY	0	1	2010-01-22	1217	60794	\N	\N
94419	SPECIFIC_DAY	0	1	2009-12-31	1217	60794	\N	\N
94420	SPECIFIC_DAY	0	1	2010-02-09	1217	60794	\N	\N
94421	SPECIFIC_DAY	0	1	2010-01-14	1217	60794	\N	\N
94422	SPECIFIC_DAY	0	0	2010-01-23	1217	60794	\N	\N
94423	SPECIFIC_DAY	0	0	2010-01-17	1217	60794	\N	\N
94424	SPECIFIC_DAY	0	1	2010-01-19	1217	60794	\N	\N
94425	SPECIFIC_DAY	0	1	2010-01-01	1217	60794	\N	\N
94426	SPECIFIC_DAY	0	1	2010-02-01	1217	60794	\N	\N
94427	SPECIFIC_DAY	0	1	2010-01-04	1217	60794	\N	\N
94428	SPECIFIC_DAY	0	1	2010-02-10	1217	60794	\N	\N
94429	SPECIFIC_DAY	0	1	2010-02-03	1217	60794	\N	\N
94430	SPECIFIC_DAY	0	0	2010-02-06	1217	60794	\N	\N
94431	SPECIFIC_DAY	0	1	2010-01-29	1217	60794	\N	\N
94432	SPECIFIC_DAY	0	1	2010-01-18	1217	60794	\N	\N
94433	SPECIFIC_DAY	0	1	2010-01-07	1217	60794	\N	\N
94434	SPECIFIC_DAY	0	0	2010-01-31	1217	60794	\N	\N
94435	GENERIC_DAY	0	0	2009-12-17	1230	\N	60758	\N
94436	GENERIC_DAY	0	0	2009-12-18	1220	\N	60758	\N
94437	GENERIC_DAY	0	2	2009-12-14	1220	\N	60758	\N
94438	GENERIC_DAY	0	0	2009-12-18	1217	\N	60758	\N
94439	GENERIC_DAY	0	0	2009-12-20	1220	\N	60758	\N
94440	GENERIC_DAY	0	0	2009-12-19	90901	\N	60758	\N
94441	GENERIC_DAY	0	0	2009-12-16	1228	\N	60758	\N
94442	GENERIC_DAY	0	0	2009-12-19	1220	\N	60758	\N
94443	GENERIC_DAY	0	0	2009-12-21	1230	\N	60758	\N
94444	GENERIC_DAY	0	0	2009-12-16	1217	\N	60758	\N
94445	GENERIC_DAY	0	0	2009-12-15	1217	\N	60758	\N
94446	GENERIC_DAY	0	0	2009-12-19	1230	\N	60758	\N
94447	GENERIC_DAY	0	0	2009-12-17	1217	\N	60758	\N
94448	GENERIC_DAY	0	0	2009-12-20	90901	\N	60758	\N
94449	GENERIC_DAY	0	2	2009-12-14	1230	\N	60758	\N
94450	GENERIC_DAY	0	0	2009-12-18	1230	\N	60758	\N
94451	GENERIC_DAY	0	0	2009-12-17	1228	\N	60758	\N
94452	GENERIC_DAY	0	0	2009-12-21	1217	\N	60758	\N
94453	GENERIC_DAY	0	8	2009-12-21	90901	\N	60758	\N
94454	GENERIC_DAY	0	0	2009-12-20	1217	\N	60758	\N
94455	GENERIC_DAY	0	0	2009-12-20	1228	\N	60758	\N
94456	GENERIC_DAY	0	0	2009-12-14	90901	\N	60758	\N
94457	GENERIC_DAY	0	2	2009-12-14	1228	\N	60758	\N
94458	GENERIC_DAY	0	0	2009-12-17	1220	\N	60758	\N
94459	GENERIC_DAY	0	0	2009-12-21	1220	\N	60758	\N
94460	GENERIC_DAY	0	0	2009-12-15	1230	\N	60758	\N
94461	GENERIC_DAY	0	7	2009-12-15	90901	\N	60758	\N
94462	GENERIC_DAY	0	8	2009-12-18	90901	\N	60758	\N
94463	GENERIC_DAY	0	2	2009-12-14	1217	\N	60758	\N
94464	GENERIC_DAY	0	0	2009-12-19	1228	\N	60758	\N
94465	GENERIC_DAY	0	0	2009-12-18	1228	\N	60758	\N
94466	GENERIC_DAY	0	0	2009-12-19	1217	\N	60758	\N
94467	GENERIC_DAY	0	1	2009-12-16	1220	\N	60758	\N
94468	GENERIC_DAY	0	0	2009-12-20	1230	\N	60758	\N
94469	GENERIC_DAY	0	0	2009-12-16	1230	\N	60758	\N
94470	GENERIC_DAY	0	1	2009-12-15	1228	\N	60758	\N
94471	GENERIC_DAY	0	0	2009-12-15	1220	\N	60758	\N
94472	GENERIC_DAY	0	7	2009-12-16	90901	\N	60758	\N
94473	GENERIC_DAY	0	8	2009-12-17	90901	\N	60758	\N
94474	GENERIC_DAY	0	0	2009-12-21	1228	\N	60758	\N
94475	GENERIC_DAY	0	2	2009-12-25	1230	\N	60795	\N
94476	GENERIC_DAY	0	0	2009-12-22	90901	\N	60795	\N
94477	GENERIC_DAY	0	2	2009-12-24	1220	\N	60795	\N
94478	GENERIC_DAY	0	2	2009-12-22	1217	\N	60795	\N
94479	GENERIC_DAY	0	2	2009-12-23	1230	\N	60795	\N
94480	GENERIC_DAY	0	2	2009-12-22	1220	\N	60795	\N
94481	GENERIC_DAY	0	0	2009-12-23	90901	\N	60795	\N
94482	GENERIC_DAY	0	2	2009-12-24	1228	\N	60795	\N
94483	GENERIC_DAY	0	0	2009-12-24	90901	\N	60795	\N
94484	GENERIC_DAY	0	2	2009-12-25	1217	\N	60795	\N
94485	GENERIC_DAY	0	2	2009-12-22	1230	\N	60795	\N
94486	GENERIC_DAY	0	2	2009-12-24	1217	\N	60795	\N
94487	GENERIC_DAY	0	2	2009-12-23	1217	\N	60795	\N
94488	GENERIC_DAY	0	2	2009-12-23	1228	\N	60795	\N
94489	GENERIC_DAY	0	2	2009-12-23	1220	\N	60795	\N
94490	GENERIC_DAY	0	2	2009-12-22	1228	\N	60795	\N
94491	GENERIC_DAY	0	0	2009-12-25	90901	\N	60795	\N
94492	GENERIC_DAY	0	2	2009-12-25	1220	\N	60795	\N
94493	GENERIC_DAY	0	2	2009-12-24	1230	\N	60795	\N
94494	GENERIC_DAY	0	2	2009-12-25	1228	\N	60795	\N
94495	GENERIC_DAY	0	2	2010-01-14	1230	\N	60706	\N
94496	GENERIC_DAY	0	2	2010-01-12	1217	\N	60706	\N
94497	GENERIC_DAY	0	2	2010-01-14	1217	\N	60706	\N
94498	GENERIC_DAY	0	2	2010-01-13	1230	\N	60706	\N
94499	GENERIC_DAY	0	2	2010-01-15	1230	\N	60706	\N
94500	GENERIC_DAY	0	0	2010-01-13	90901	\N	60706	\N
94501	GENERIC_DAY	0	2	2010-01-15	1220	\N	60706	\N
94502	GENERIC_DAY	0	2	2010-01-15	1228	\N	60706	\N
94503	GENERIC_DAY	0	2	2010-01-13	1220	\N	60706	\N
94504	GENERIC_DAY	0	0	2010-01-12	90901	\N	60706	\N
94505	GENERIC_DAY	0	2	2010-01-14	1228	\N	60706	\N
94506	GENERIC_DAY	0	0	2010-01-15	90901	\N	60706	\N
94507	GENERIC_DAY	0	2	2010-01-12	1220	\N	60706	\N
94508	GENERIC_DAY	0	2	2010-01-15	1217	\N	60706	\N
94509	GENERIC_DAY	0	2	2010-01-13	1228	\N	60706	\N
94510	GENERIC_DAY	0	2	2010-01-13	1217	\N	60706	\N
94511	GENERIC_DAY	0	2	2010-01-12	1230	\N	60706	\N
94512	GENERIC_DAY	0	2	2010-01-12	1228	\N	60706	\N
94513	GENERIC_DAY	0	2	2010-01-14	1220	\N	60706	\N
94514	GENERIC_DAY	0	0	2010-01-14	90901	\N	60706	\N
94515	GENERIC_DAY	0	0	2010-01-22	90901	\N	60755	\N
94516	GENERIC_DAY	0	0	2010-01-23	90901	\N	60755	\N
94517	GENERIC_DAY	0	0	2010-01-23	1217	\N	60755	\N
94518	GENERIC_DAY	0	0	2010-01-24	1230	\N	60755	\N
94519	GENERIC_DAY	0	3	2010-01-26	1228	\N	60755	\N
94520	GENERIC_DAY	0	3	2010-01-21	1220	\N	60755	\N
94521	GENERIC_DAY	0	0	2010-01-23	1230	\N	60755	\N
94522	GENERIC_DAY	0	0	2010-01-24	1228	\N	60755	\N
94523	GENERIC_DAY	0	2	2010-01-22	1230	\N	60755	\N
94524	GENERIC_DAY	0	0	2010-01-26	90901	\N	60755	\N
94525	GENERIC_DAY	0	3	2010-01-25	1220	\N	60755	\N
94526	GENERIC_DAY	0	0	2010-01-24	1220	\N	60755	\N
94527	GENERIC_DAY	0	1	2010-01-25	1217	\N	60755	\N
94528	GENERIC_DAY	0	2	2010-01-21	1228	\N	60755	\N
94529	GENERIC_DAY	0	2	2010-01-22	1228	\N	60755	\N
94530	GENERIC_DAY	0	0	2010-01-25	90901	\N	60755	\N
94531	GENERIC_DAY	0	0	2010-01-23	1220	\N	60755	\N
94532	GENERIC_DAY	0	2	2010-01-21	1230	\N	60755	\N
94533	GENERIC_DAY	0	2	2010-01-26	1230	\N	60755	\N
94534	GENERIC_DAY	0	0	2010-01-24	90901	\N	60755	\N
94535	GENERIC_DAY	0	1	2010-01-26	1217	\N	60755	\N
94536	GENERIC_DAY	0	3	2010-01-22	1220	\N	60755	\N
94537	GENERIC_DAY	0	2	2010-01-25	1228	\N	60755	\N
94538	GENERIC_DAY	0	2	2010-01-25	1230	\N	60755	\N
94539	GENERIC_DAY	0	2	2010-01-26	1220	\N	60755	\N
94540	GENERIC_DAY	0	1	2010-01-22	1217	\N	60755	\N
94541	GENERIC_DAY	0	1	2010-01-21	1217	\N	60755	\N
94542	GENERIC_DAY	0	0	2010-01-21	90901	\N	60755	\N
94543	GENERIC_DAY	0	0	2010-01-23	1228	\N	60755	\N
94544	GENERIC_DAY	0	0	2010-01-24	1217	\N	60755	\N
94545	GENERIC_DAY	0	0	2010-01-27	90901	\N	60751	\N
94546	GENERIC_DAY	0	2	2010-01-28	1220	\N	60751	\N
94547	GENERIC_DAY	0	2	2010-01-27	1220	\N	60751	\N
94548	GENERIC_DAY	0	3	2010-01-27	1228	\N	60751	\N
94549	GENERIC_DAY	0	2	2010-01-27	1230	\N	60751	\N
94550	GENERIC_DAY	0	0	2010-01-29	90901	\N	60751	\N
94551	GENERIC_DAY	0	2	2010-01-29	1230	\N	60751	\N
94552	GENERIC_DAY	0	2	2010-01-29	1220	\N	60751	\N
94553	GENERIC_DAY	0	3	2010-01-28	1228	\N	60751	\N
94554	GENERIC_DAY	0	0	2010-01-28	90901	\N	60751	\N
94555	GENERIC_DAY	0	3	2010-01-29	1228	\N	60751	\N
94556	GENERIC_DAY	0	1	2010-01-29	1217	\N	60751	\N
94557	GENERIC_DAY	0	1	2010-01-27	1217	\N	60751	\N
94558	GENERIC_DAY	0	1	2010-01-28	1217	\N	60751	\N
94559	GENERIC_DAY	0	2	2010-01-28	1230	\N	60751	\N
94560	GENERIC_DAY	0	0	2009-12-17	1230	\N	60703	\N
94561	GENERIC_DAY	0	0	2009-12-18	1228	\N	60703	\N
94562	GENERIC_DAY	0	0	2009-12-18	1220	\N	60703	\N
94563	GENERIC_DAY	0	8	2009-12-15	90901	\N	60703	\N
94564	GENERIC_DAY	0	0	2009-12-14	1220	\N	60703	\N
94565	GENERIC_DAY	0	0	2009-12-15	1230	\N	60703	\N
94566	GENERIC_DAY	0	0	2009-12-17	1217	\N	60703	\N
94567	GENERIC_DAY	0	8	2009-12-17	90901	\N	60703	\N
94568	GENERIC_DAY	0	8	2009-12-16	90901	\N	60703	\N
94569	GENERIC_DAY	0	0	2009-12-16	1220	\N	60703	\N
94570	GENERIC_DAY	0	0	2009-12-16	1217	\N	60703	\N
94571	GENERIC_DAY	0	8	2009-12-14	90901	\N	60703	\N
94572	GENERIC_DAY	0	0	2009-12-16	1228	\N	60703	\N
94573	GENERIC_DAY	0	0	2009-12-15	1228	\N	60703	\N
94574	GENERIC_DAY	0	0	2009-12-18	1217	\N	60703	\N
94575	GENERIC_DAY	0	0	2009-12-17	1220	\N	60703	\N
94576	GENERIC_DAY	0	0	2009-12-17	1228	\N	60703	\N
94577	GENERIC_DAY	0	0	2009-12-14	1217	\N	60703	\N
94578	GENERIC_DAY	0	0	2009-12-14	1230	\N	60703	\N
94579	GENERIC_DAY	0	0	2009-12-15	1220	\N	60703	\N
94580	GENERIC_DAY	0	0	2009-12-14	1228	\N	60703	\N
94581	GENERIC_DAY	0	8	2009-12-18	90901	\N	60703	\N
94582	GENERIC_DAY	0	0	2009-12-18	1230	\N	60703	\N
94583	GENERIC_DAY	0	0	2009-12-15	1217	\N	60703	\N
94584	GENERIC_DAY	0	0	2009-12-16	1230	\N	60703	\N
94585	GENERIC_DAY	0	0	2009-12-15	1228	\N	58470	\N
94586	GENERIC_DAY	0	0	2009-12-14	1230	\N	58470	\N
94587	GENERIC_DAY	0	0	2009-12-16	1230	\N	58470	\N
94588	GENERIC_DAY	0	8	2009-12-17	90901	\N	58470	\N
94589	GENERIC_DAY	0	0	2009-12-18	1220	\N	58470	\N
94590	GENERIC_DAY	0	0	2009-12-17	1220	\N	58470	\N
94591	GENERIC_DAY	0	0	2009-12-15	1220	\N	58470	\N
94592	GENERIC_DAY	0	8	2009-12-14	90901	\N	58470	\N
94593	GENERIC_DAY	0	0	2009-12-16	1220	\N	58470	\N
94594	GENERIC_DAY	0	0	2009-12-17	1217	\N	58470	\N
94595	GENERIC_DAY	0	0	2009-12-17	1228	\N	58470	\N
94596	GENERIC_DAY	0	0	2009-12-14	1220	\N	58470	\N
94597	GENERIC_DAY	0	0	2009-12-18	1217	\N	58470	\N
94598	GENERIC_DAY	0	0	2009-12-17	1230	\N	58470	\N
94599	GENERIC_DAY	0	0	2009-12-18	1230	\N	58470	\N
94600	GENERIC_DAY	0	0	2009-12-14	1217	\N	58470	\N
94601	GENERIC_DAY	0	0	2009-12-14	1228	\N	58470	\N
94602	GENERIC_DAY	0	0	2009-12-15	1217	\N	58470	\N
94603	GENERIC_DAY	0	0	2009-12-16	1228	\N	58470	\N
94604	GENERIC_DAY	0	0	2009-12-18	1228	\N	58470	\N
94605	GENERIC_DAY	0	0	2009-12-15	1230	\N	58470	\N
94606	GENERIC_DAY	0	0	2009-12-16	1217	\N	58470	\N
94607	GENERIC_DAY	0	8	2009-12-16	90901	\N	58470	\N
94608	GENERIC_DAY	0	8	2009-12-18	90901	\N	58470	\N
94609	GENERIC_DAY	0	8	2009-12-15	90901	\N	58470	\N
94610	GENERIC_DAY	0	0	2009-12-19	1228	\N	60704	\N
94611	GENERIC_DAY	0	2	2009-12-21	1228	\N	60704	\N
94612	GENERIC_DAY	0	0	2009-12-20	90901	\N	60704	\N
94613	GENERIC_DAY	0	2	2009-12-21	1230	\N	60704	\N
94614	GENERIC_DAY	0	0	2009-12-20	1230	\N	60704	\N
94615	GENERIC_DAY	0	0	2009-12-20	1228	\N	60704	\N
94616	GENERIC_DAY	0	0	2009-12-20	1220	\N	60704	\N
94617	GENERIC_DAY	0	1	2009-12-21	1217	\N	60704	\N
94618	GENERIC_DAY	0	0	2009-12-19	1220	\N	60704	\N
94619	GENERIC_DAY	0	0	2009-12-19	1230	\N	60704	\N
94620	GENERIC_DAY	0	0	2009-12-19	90901	\N	60704	\N
94621	GENERIC_DAY	0	0	2009-12-21	90901	\N	60704	\N
94622	GENERIC_DAY	0	3	2009-12-21	1220	\N	60704	\N
94623	GENERIC_DAY	0	0	2009-12-19	1217	\N	60704	\N
94624	GENERIC_DAY	0	0	2009-12-20	1217	\N	60704	\N
94625	GENERIC_DAY	0	1	2009-12-24	1228	\N	58461	\N
94626	GENERIC_DAY	0	4	2009-12-24	90901	\N	58461	\N
94627	GENERIC_DAY	0	0	2009-12-22	90901	\N	58461	\N
94628	GENERIC_DAY	0	2	2009-12-22	1220	\N	58461	\N
94629	GENERIC_DAY	0	2	2009-12-22	1230	\N	58461	\N
94630	GENERIC_DAY	0	2	2009-12-22	1217	\N	58461	\N
94631	GENERIC_DAY	0	0	2009-12-24	1217	\N	58461	\N
94632	GENERIC_DAY	0	2	2009-12-23	1230	\N	58461	\N
94633	GENERIC_DAY	0	2	2009-12-24	1220	\N	58461	\N
94634	GENERIC_DAY	0	0	2009-12-23	90901	\N	58461	\N
94635	GENERIC_DAY	0	2	2009-12-23	1217	\N	58461	\N
94636	GENERIC_DAY	0	2	2009-12-23	1220	\N	58461	\N
94637	GENERIC_DAY	0	2	2009-12-23	1228	\N	58461	\N
94638	GENERIC_DAY	0	2	2009-12-22	1228	\N	58461	\N
94639	GENERIC_DAY	0	1	2009-12-24	1230	\N	58461	\N
94640	GENERIC_DAY	0	0	2010-01-09	1230	\N	60756	\N
94641	GENERIC_DAY	0	2	2010-01-18	1228	\N	60756	\N
94642	GENERIC_DAY	0	0	2010-01-08	90901	\N	60756	\N
94643	GENERIC_DAY	0	2	2010-01-14	1217	\N	60756	\N
94644	GENERIC_DAY	0	2	2010-01-12	1217	\N	60756	\N
94645	GENERIC_DAY	0	0	2010-01-10	1228	\N	60756	\N
94646	GENERIC_DAY	0	2	2010-01-13	1230	\N	60756	\N
94647	GENERIC_DAY	0	2	2010-01-11	1228	\N	60756	\N
94648	GENERIC_DAY	0	0	2010-01-14	90901	\N	60756	\N
94649	GENERIC_DAY	0	2	2010-01-15	1228	\N	60756	\N
94650	GENERIC_DAY	0	0	2010-01-17	1217	\N	60756	\N
94651	GENERIC_DAY	0	0	2010-01-10	90901	\N	60756	\N
94652	GENERIC_DAY	0	2	2010-01-18	1217	\N	60756	\N
94653	GENERIC_DAY	0	2	2010-01-13	1217	\N	60756	\N
94654	GENERIC_DAY	0	0	2010-01-09	1217	\N	60756	\N
94655	GENERIC_DAY	0	2	2010-01-12	1220	\N	60756	\N
94656	GENERIC_DAY	0	2	2010-01-08	1230	\N	60756	\N
94657	GENERIC_DAY	0	2	2010-01-13	1228	\N	60756	\N
94658	GENERIC_DAY	0	2	2010-01-13	1220	\N	60756	\N
94659	GENERIC_DAY	0	0	2010-01-10	1217	\N	60756	\N
94660	GENERIC_DAY	0	2	2010-01-12	1230	\N	60756	\N
94661	GENERIC_DAY	0	0	2010-01-10	1220	\N	60756	\N
94662	GENERIC_DAY	0	2	2010-01-15	1217	\N	60756	\N
94663	GENERIC_DAY	0	2	2010-01-11	1230	\N	60756	\N
94664	GENERIC_DAY	0	0	2010-01-17	1230	\N	60756	\N
94665	GENERIC_DAY	0	2	2010-01-11	1220	\N	60756	\N
94666	GENERIC_DAY	0	0	2010-01-09	1228	\N	60756	\N
94667	GENERIC_DAY	0	0	2010-01-09	90901	\N	60756	\N
94668	GENERIC_DAY	0	2	2010-01-14	1228	\N	60756	\N
94669	GENERIC_DAY	0	0	2010-01-11	90901	\N	60756	\N
94670	GENERIC_DAY	0	2	2010-01-15	1220	\N	60756	\N
94671	GENERIC_DAY	0	0	2010-01-13	90901	\N	60756	\N
94672	GENERIC_DAY	0	2	2010-01-14	1230	\N	60756	\N
94673	GENERIC_DAY	0	2	2010-01-15	1230	\N	60756	\N
94674	GENERIC_DAY	0	0	2010-01-17	90901	\N	60756	\N
94675	GENERIC_DAY	0	2	2010-01-11	1217	\N	60756	\N
94676	GENERIC_DAY	0	0	2010-01-16	1228	\N	60756	\N
94677	GENERIC_DAY	0	2	2010-01-08	1220	\N	60756	\N
94678	GENERIC_DAY	0	2	2010-01-14	1220	\N	60756	\N
94679	GENERIC_DAY	0	2	2010-01-08	1228	\N	60756	\N
94680	GENERIC_DAY	0	2	2010-01-12	1228	\N	60756	\N
94681	GENERIC_DAY	0	0	2010-01-16	1220	\N	60756	\N
94682	GENERIC_DAY	0	1	2010-01-18	1220	\N	60756	\N
94683	GENERIC_DAY	0	0	2010-01-16	1230	\N	60756	\N
94684	GENERIC_DAY	0	0	2010-01-17	1228	\N	60756	\N
94685	GENERIC_DAY	0	0	2010-01-09	1220	\N	60756	\N
94686	GENERIC_DAY	0	0	2010-01-17	1220	\N	60756	\N
94687	GENERIC_DAY	0	0	2010-01-15	90901	\N	60756	\N
94688	GENERIC_DAY	0	0	2010-01-16	1217	\N	60756	\N
94689	GENERIC_DAY	0	1	2010-01-18	90901	\N	60756	\N
94690	GENERIC_DAY	0	0	2010-01-16	90901	\N	60756	\N
94691	GENERIC_DAY	0	2	2010-01-18	1230	\N	60756	\N
94692	GENERIC_DAY	0	0	2010-01-12	90901	\N	60756	\N
94693	GENERIC_DAY	0	0	2010-01-10	1230	\N	60756	\N
94694	GENERIC_DAY	0	2	2010-01-08	1217	\N	60756	\N
94695	GENERIC_DAY	0	2	2010-01-19	1230	\N	60757	\N
94696	GENERIC_DAY	0	2	2010-01-19	1220	\N	60757	\N
94697	GENERIC_DAY	0	2	2010-01-19	1228	\N	60757	\N
94698	GENERIC_DAY	0	0	2010-01-19	90901	\N	60757	\N
94699	GENERIC_DAY	0	2	2010-01-19	1217	\N	60757	\N
94700	GENERIC_DAY	0	2	2009-12-15	1228	\N	68415	\N
94701	GENERIC_DAY	0	2	2009-12-14	1228	\N	68415	\N
94702	GENERIC_DAY	0	2	2009-12-14	1220	\N	68415	\N
94703	GENERIC_DAY	0	0	2009-12-15	90901	\N	68415	\N
94704	GENERIC_DAY	0	0	2009-12-14	90901	\N	68415	\N
94705	GENERIC_DAY	0	2	2009-12-15	1220	\N	68415	\N
94706	GENERIC_DAY	0	2	2009-12-15	1217	\N	68415	\N
94707	GENERIC_DAY	0	2	2009-12-15	1230	\N	68415	\N
94708	GENERIC_DAY	0	2	2009-12-14	1230	\N	68415	\N
94709	GENERIC_DAY	0	2	2009-12-14	1217	\N	68415	\N
94710	GENERIC_DAY	0	2	2010-01-06	1230	\N	68416	\N
94711	GENERIC_DAY	0	2	2010-01-08	1217	\N	68416	\N
94712	GENERIC_DAY	0	2	2010-01-07	1228	\N	68416	\N
94713	GENERIC_DAY	0	0	2010-01-08	90901	\N	68416	\N
94714	GENERIC_DAY	0	2	2010-01-08	1230	\N	68416	\N
94715	GENERIC_DAY	0	2	2010-01-08	1220	\N	68416	\N
94716	GENERIC_DAY	0	2	2010-01-06	1228	\N	68416	\N
94717	GENERIC_DAY	0	0	2010-01-07	90901	\N	68416	\N
94718	GENERIC_DAY	0	3	2010-01-06	1220	\N	68416	\N
94719	GENERIC_DAY	0	2	2010-01-07	1230	\N	68416	\N
94720	GENERIC_DAY	0	2	2010-01-08	1228	\N	68416	\N
94721	GENERIC_DAY	0	0	2010-01-06	90901	\N	68416	\N
94722	GENERIC_DAY	0	2	2010-01-07	1217	\N	68416	\N
94723	GENERIC_DAY	0	1	2010-01-06	1217	\N	68416	\N
94724	GENERIC_DAY	0	2	2010-01-07	1220	\N	68416	\N
94725	GENERIC_DAY	0	0	2010-01-03	1217	\N	68417	\N
94726	GENERIC_DAY	0	2	2010-01-04	1228	\N	68417	\N
94727	GENERIC_DAY	0	2	2010-01-01	1217	\N	68417	\N
94728	GENERIC_DAY	0	0	2010-01-03	1220	\N	68417	\N
94729	GENERIC_DAY	0	0	2010-01-01	90901	\N	68417	\N
94730	GENERIC_DAY	0	0	2010-01-02	1220	\N	68417	\N
94731	GENERIC_DAY	0	2	2010-01-05	1220	\N	68417	\N
94732	GENERIC_DAY	0	2	2010-01-01	1228	\N	68417	\N
94733	GENERIC_DAY	0	0	2010-01-03	1230	\N	68417	\N
94734	GENERIC_DAY	0	0	2010-01-04	90901	\N	68417	\N
94735	GENERIC_DAY	0	0	2010-01-02	90901	\N	68417	\N
94736	GENERIC_DAY	0	0	2010-01-02	1230	\N	68417	\N
94737	GENERIC_DAY	0	2	2010-01-01	1230	\N	68417	\N
94738	GENERIC_DAY	0	2	2010-01-04	1230	\N	68417	\N
94739	GENERIC_DAY	0	0	2010-01-05	90901	\N	68417	\N
94740	GENERIC_DAY	0	2	2010-01-04	1217	\N	68417	\N
94741	GENERIC_DAY	0	2	2010-01-05	1217	\N	68417	\N
94742	GENERIC_DAY	0	0	2010-01-02	1228	\N	68417	\N
94743	GENERIC_DAY	0	0	2010-01-03	90901	\N	68417	\N
94744	GENERIC_DAY	0	2	2010-01-01	1220	\N	68417	\N
94745	GENERIC_DAY	0	2	2010-01-05	1230	\N	68417	\N
94746	GENERIC_DAY	0	2	2010-01-05	1228	\N	68417	\N
94747	GENERIC_DAY	0	2	2010-01-04	1220	\N	68417	\N
94748	GENERIC_DAY	0	0	2010-01-02	1217	\N	68417	\N
94749	GENERIC_DAY	0	0	2010-01-03	1228	\N	68417	\N
94750	GENERIC_DAY	0	3	2009-12-17	1230	\N	68418	\N
94751	GENERIC_DAY	0	0	2009-12-16	90901	\N	68418	\N
94752	GENERIC_DAY	0	2	2009-12-16	1220	\N	68418	\N
94753	GENERIC_DAY	0	3	2009-12-18	1230	\N	68418	\N
94754	GENERIC_DAY	0	1	2009-12-18	1217	\N	68418	\N
94755	GENERIC_DAY	0	0	2009-12-18	90901	\N	68418	\N
94756	GENERIC_DAY	0	1	2009-12-18	1220	\N	68418	\N
94757	GENERIC_DAY	0	2	2009-12-16	1228	\N	68418	\N
94758	GENERIC_DAY	0	1	2009-12-17	1217	\N	68418	\N
94759	GENERIC_DAY	0	0	2009-12-17	90901	\N	68418	\N
94760	GENERIC_DAY	0	3	2009-12-17	1228	\N	68418	\N
94761	GENERIC_DAY	0	2	2009-12-16	1230	\N	68418	\N
94762	GENERIC_DAY	0	2	2009-12-16	1217	\N	68418	\N
94763	GENERIC_DAY	0	1	2009-12-17	1220	\N	68418	\N
94764	GENERIC_DAY	0	3	2009-12-18	1228	\N	68418	\N
94765	GENERIC_DAY	0	0	2009-12-29	90901	\N	68419	\N
94766	GENERIC_DAY	0	2	2009-12-29	1220	\N	68419	\N
94767	GENERIC_DAY	0	2	2009-12-29	1217	\N	68419	\N
94768	GENERIC_DAY	0	2	2009-12-30	1217	\N	68419	\N
94769	GENERIC_DAY	0	0	2009-12-30	90901	\N	68419	\N
94770	GENERIC_DAY	0	2	2009-12-30	1230	\N	68419	\N
94771	GENERIC_DAY	0	2	2009-12-30	1228	\N	68419	\N
94772	GENERIC_DAY	0	2	2009-12-31	1220	\N	68419	\N
94773	GENERIC_DAY	0	2	2009-12-30	1220	\N	68419	\N
94774	GENERIC_DAY	0	2	2009-12-29	1230	\N	68419	\N
94775	GENERIC_DAY	0	2	2009-12-31	1217	\N	68419	\N
94776	GENERIC_DAY	0	2	2009-12-31	1230	\N	68419	\N
94777	GENERIC_DAY	0	2	2009-12-29	1228	\N	68419	\N
94778	GENERIC_DAY	0	0	2009-12-31	90901	\N	68419	\N
94779	GENERIC_DAY	0	2	2009-12-31	1228	\N	68419	\N
94780	GENERIC_DAY	0	0	2009-12-20	90901	\N	68420	\N
94781	GENERIC_DAY	0	2	2009-12-21	1230	\N	68420	\N
94782	GENERIC_DAY	0	0	2009-12-21	90901	\N	68420	\N
94783	GENERIC_DAY	0	0	2009-12-23	1217	\N	68420	\N
94784	GENERIC_DAY	0	0	2009-12-22	1217	\N	68420	\N
94785	GENERIC_DAY	0	0	2009-12-19	1217	\N	68420	\N
94786	GENERIC_DAY	0	2	2009-12-21	1220	\N	68420	\N
94787	GENERIC_DAY	0	1	2009-12-23	1228	\N	68420	\N
94788	GENERIC_DAY	0	0	2009-12-19	1228	\N	68420	\N
94789	GENERIC_DAY	0	2	2009-12-22	1230	\N	68420	\N
94790	GENERIC_DAY	0	0	2009-12-20	1230	\N	68420	\N
94791	GENERIC_DAY	0	4	2009-12-23	90901	\N	68420	\N
94792	GENERIC_DAY	0	2	2009-12-22	90901	\N	68420	\N
94793	GENERIC_DAY	0	2	2009-12-21	1228	\N	68420	\N
94794	GENERIC_DAY	0	0	2009-12-19	90901	\N	68420	\N
94795	GENERIC_DAY	0	0	2009-12-20	1217	\N	68420	\N
94796	GENERIC_DAY	0	0	2009-12-20	1228	\N	68420	\N
94797	GENERIC_DAY	0	1	2009-12-23	1230	\N	68420	\N
94798	GENERIC_DAY	0	0	2009-12-19	1230	\N	68420	\N
94799	GENERIC_DAY	0	0	2009-12-19	1220	\N	68420	\N
94800	GENERIC_DAY	0	2	2009-12-22	1220	\N	68420	\N
94801	GENERIC_DAY	0	2	2009-12-23	1220	\N	68420	\N
94802	GENERIC_DAY	0	0	2009-12-20	1220	\N	68420	\N
94803	GENERIC_DAY	0	2	2009-12-22	1228	\N	68420	\N
94804	GENERIC_DAY	0	2	2009-12-21	1217	\N	68420	\N
94805	GENERIC_DAY	0	2	2009-12-28	1220	\N	68421	\N
94806	GENERIC_DAY	0	2	2009-12-25	1217	\N	68421	\N
94807	GENERIC_DAY	0	2	2009-12-24	1230	\N	68421	\N
94808	GENERIC_DAY	0	0	2009-12-27	1228	\N	68421	\N
94809	GENERIC_DAY	0	0	2009-12-26	90901	\N	68421	\N
94810	GENERIC_DAY	0	0	2009-12-26	1230	\N	68421	\N
94811	GENERIC_DAY	0	0	2009-12-27	90901	\N	68421	\N
94812	GENERIC_DAY	0	2	2009-12-25	1220	\N	68421	\N
94813	GENERIC_DAY	0	0	2009-12-26	1228	\N	68421	\N
94814	GENERIC_DAY	0	0	2009-12-27	1217	\N	68421	\N
94815	GENERIC_DAY	0	2	2009-12-28	1217	\N	68421	\N
94816	GENERIC_DAY	0	0	2009-12-25	90901	\N	68421	\N
94817	GENERIC_DAY	0	2	2009-12-24	1220	\N	68421	\N
94818	GENERIC_DAY	0	2	2009-12-25	1228	\N	68421	\N
94819	GENERIC_DAY	0	2	2009-12-28	1228	\N	68421	\N
94820	GENERIC_DAY	0	0	2009-12-26	1217	\N	68421	\N
94821	GENERIC_DAY	0	2	2009-12-24	1228	\N	68421	\N
94822	GENERIC_DAY	0	0	2009-12-28	90901	\N	68421	\N
94823	GENERIC_DAY	0	2	2009-12-24	1217	\N	68421	\N
94824	GENERIC_DAY	0	0	2009-12-24	90901	\N	68421	\N
94825	GENERIC_DAY	0	0	2009-12-26	1220	\N	68421	\N
94826	GENERIC_DAY	0	2	2009-12-25	1230	\N	68421	\N
94827	GENERIC_DAY	0	2	2009-12-28	1230	\N	68421	\N
94828	GENERIC_DAY	0	0	2009-12-27	1220	\N	68421	\N
94829	GENERIC_DAY	0	0	2009-12-27	1230	\N	68421	\N
94830	GENERIC_DAY	0	0	2009-12-25	90901	\N	68422	\N
94831	GENERIC_DAY	0	2	2009-12-24	1228	\N	68422	\N
94832	GENERIC_DAY	0	0	2009-12-26	1228	\N	68422	\N
94833	GENERIC_DAY	0	2	2009-12-28	1230	\N	68422	\N
94834	GENERIC_DAY	0	2	2009-12-25	1228	\N	68422	\N
94835	GENERIC_DAY	0	2	2009-12-25	1230	\N	68422	\N
94836	GENERIC_DAY	0	0	2009-12-28	90901	\N	68422	\N
94837	GENERIC_DAY	0	2	2009-12-25	1220	\N	68422	\N
94838	GENERIC_DAY	0	2	2009-12-28	1228	\N	68422	\N
94839	GENERIC_DAY	0	2	2009-12-28	1217	\N	68422	\N
94840	GENERIC_DAY	0	0	2009-12-27	1220	\N	68422	\N
94841	GENERIC_DAY	0	2	2009-12-24	1217	\N	68422	\N
94842	GENERIC_DAY	0	0	2009-12-27	1230	\N	68422	\N
94843	GENERIC_DAY	0	2	2009-12-24	1220	\N	68422	\N
94844	GENERIC_DAY	0	2	2009-12-25	1217	\N	68422	\N
94845	GENERIC_DAY	0	0	2009-12-24	90901	\N	68422	\N
94846	GENERIC_DAY	0	0	2009-12-26	1220	\N	68422	\N
94847	GENERIC_DAY	0	2	2009-12-24	1230	\N	68422	\N
94848	GENERIC_DAY	0	0	2009-12-27	1228	\N	68422	\N
94849	GENERIC_DAY	0	2	2009-12-28	1220	\N	68422	\N
94850	GENERIC_DAY	0	0	2009-12-27	1217	\N	68422	\N
94851	GENERIC_DAY	0	0	2009-12-26	1230	\N	68422	\N
94852	GENERIC_DAY	0	0	2009-12-27	90901	\N	68422	\N
94853	GENERIC_DAY	0	0	2009-12-26	1217	\N	68422	\N
94854	GENERIC_DAY	0	0	2009-12-26	90901	\N	68422	\N
94855	GENERIC_DAY	0	0	2009-12-20	1220	\N	68423	\N
94856	GENERIC_DAY	0	2	2009-12-21	1228	\N	68423	\N
94857	GENERIC_DAY	0	2	2009-12-22	1220	\N	68423	\N
94858	GENERIC_DAY	0	0	2009-12-19	1220	\N	68423	\N
94859	GENERIC_DAY	0	0	2009-12-20	90901	\N	68423	\N
94860	GENERIC_DAY	0	2	2009-12-21	1220	\N	68423	\N
94861	GENERIC_DAY	0	0	2009-12-19	90901	\N	68423	\N
94862	GENERIC_DAY	0	2	2009-12-23	1220	\N	68423	\N
94863	GENERIC_DAY	0	0	2009-12-20	1217	\N	68423	\N
94864	GENERIC_DAY	0	0	2009-12-19	1228	\N	68423	\N
94865	GENERIC_DAY	0	2	2009-12-23	1217	\N	68423	\N
94866	GENERIC_DAY	0	2	2009-12-23	1230	\N	68423	\N
94867	GENERIC_DAY	0	0	2009-12-21	90901	\N	68423	\N
94868	GENERIC_DAY	0	2	2009-12-22	1217	\N	68423	\N
94869	GENERIC_DAY	0	2	2009-12-21	1230	\N	68423	\N
94870	GENERIC_DAY	0	0	2009-12-20	1228	\N	68423	\N
94871	GENERIC_DAY	0	0	2009-12-20	1230	\N	68423	\N
94872	GENERIC_DAY	0	2	2009-12-21	1217	\N	68423	\N
94873	GENERIC_DAY	0	0	2009-12-22	90901	\N	68423	\N
94874	GENERIC_DAY	0	2	2009-12-23	1228	\N	68423	\N
94875	GENERIC_DAY	0	0	2009-12-23	90901	\N	68423	\N
94876	GENERIC_DAY	0	0	2009-12-19	1230	\N	68423	\N
94877	GENERIC_DAY	0	2	2009-12-22	1230	\N	68423	\N
94878	GENERIC_DAY	0	0	2009-12-19	1217	\N	68423	\N
94879	GENERIC_DAY	0	2	2009-12-22	1228	\N	68423	\N
94880	GENERIC_DAY	0	2	2009-12-17	1220	\N	60792	\N
94881	GENERIC_DAY	0	2	2009-12-18	1217	\N	60792	\N
94882	GENERIC_DAY	0	2	2009-12-18	1228	\N	60792	\N
94883	GENERIC_DAY	0	2	2009-12-18	1220	\N	60792	\N
94884	GENERIC_DAY	0	2	2009-12-14	1230	\N	60792	\N
94885	GENERIC_DAY	0	2	2009-12-16	1217	\N	60792	\N
94886	GENERIC_DAY	0	2	2009-12-17	1230	\N	60792	\N
94887	GENERIC_DAY	0	2	2009-12-14	1228	\N	60792	\N
94888	GENERIC_DAY	0	2	2009-12-15	1217	\N	60792	\N
94889	GENERIC_DAY	0	0	2009-12-18	90901	\N	60792	\N
94890	GENERIC_DAY	0	2	2009-12-16	1220	\N	60792	\N
94891	GENERIC_DAY	0	2	2009-12-14	1217	\N	60792	\N
94892	GENERIC_DAY	0	2	2009-12-15	1230	\N	60792	\N
94893	GENERIC_DAY	0	2	2009-12-17	1228	\N	60792	\N
94894	GENERIC_DAY	0	0	2009-12-17	90901	\N	60792	\N
94895	GENERIC_DAY	0	0	2009-12-15	90901	\N	60792	\N
94896	GENERIC_DAY	0	2	2009-12-16	1230	\N	60792	\N
94897	GENERIC_DAY	0	0	2009-12-14	90901	\N	60792	\N
94898	GENERIC_DAY	0	2	2009-12-18	1230	\N	60792	\N
94899	GENERIC_DAY	0	2	2009-12-16	1228	\N	60792	\N
94900	GENERIC_DAY	0	2	2009-12-15	1220	\N	60792	\N
94901	GENERIC_DAY	0	0	2009-12-16	90901	\N	60792	\N
94902	GENERIC_DAY	0	2	2009-12-14	1220	\N	60792	\N
94903	GENERIC_DAY	0	2	2009-12-17	1217	\N	60792	\N
94904	GENERIC_DAY	0	2	2009-12-15	1228	\N	60792	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
1277962	2	3850	3839	0
1277963	2	3845	3849	0
1277964	2	3838	3841	0
1277965	2	3841	3845	0
18874390	5	56330	57491	0
31621126	9	97367	97368	0
18874383	5	56324	56349	0
31621127	9	97370	97371	0
1277971	2	3850	3839	0
1277972	2	3845	3849	0
1277973	2	3838	3841	0
1277974	2	3841	3845	0
1277975	2	3839	3840	0
1278014	2	3842	3843	0
1278015	2	3841	3842	0
1278016	2	3850	3839	0
1278017	2	3845	3849	0
1278018	2	3838	3841	0
1278019	2	3844	3846	0
1278020	2	3846	3847	0
1278021	2	3841	3845	0
1278022	2	3839	3840	0
1277986	2	3842	3843	0
1277987	2	3841	3842	0
1277988	2	3850	3839	0
1277989	2	3845	3849	0
1277990	2	3838	3841	0
1277991	2	3841	3845	0
1277992	2	3839	3840	0
18907208	4	56282	56277	0
1278033	2	3868	3869	0
18907996	5	56282	56277	0
1278034	2	3868	3869	0
1277996	2	3842	3843	0
1277997	2	3841	3842	0
1277998	2	3850	3839	0
1277999	2	3845	3849	0
1278000	2	3838	3841	0
1278001	2	3844	3846	0
1278002	2	3841	3845	0
1278003	2	3839	3840	0
18907548	5	56282	56277	0
18710536	17	56257	56258	0
18710537	17	56258	56259	0
18710538	17	56259	56260	0
18907584	5	56282	56277	0
18710580	14	56298	56299	0
18710563	14	56298	56299	0
18710559	14	56266	56298	0
18710575	14	56266	56298	0
18710570	14	56269	56306	0
18710571	14	56283	56269	0
18907826	5	56274	56270	0
18907590	5	56274	56270	0
18907640	5	56274	56270	0
18874374	5	56324	56349	0
18874391	5	56324	56349	0
18908003	5	56274	56270	0
18907534	5	56271	56263	0
18907652	5	56271	56263	0
18907256	5	56271	56263	0
18874396	5	56330	57474	0
18907602	5	56271	56263	0
18907225	4	56271	56263	0
18908015	5	56271	56263	0
18907838	5	56271	56263	0
18907565	5	56271	56263	0
18907536	5	56281	56282	0
18710572	14	56272	56283	0
18710579	14	56260	56285	0
18710539	14	56260	56285	0
18710562	14	56260	56285	0
18907518	5	56286	56287	0
18907549	5	56286	56287	0
18907635	5	56286	56287	0
18907820	5	56286	56287	0
18907209	4	56286	56287	0
18907997	5	56286	56287	0
18907585	5	56286	56287	0
18907240	5	56286	56287	0
18907821	5	56294	56286	0
18907636	5	56294	56286	0
18907550	5	56294	56286	0
18874399	12	56306	56274	0
18907586	5	56294	56286	0
18907637	5	56287	56288	0
18907999	5	56287	56288	0
18907211	4	56287	56288	0
18907520	5	56287	56288	0
18907242	5	56287	56288	0
18907587	5	56287	56288	0
18907822	5	56287	56288	0
18907551	5	56287	56288	0
18908000	5	56288	56289	0
18907212	4	56288	56289	0
18907243	5	56288	56289	0
18907823	5	56288	56289	0
18907552	5	56288	56289	0
18907521	5	56288	56289	0
18907638	5	56288	56289	0
18907588	5	56288	56289	0
18907213	4	56289	56290	0
27656340	2	57485	57486	0
27656341	2	57486	57487	0
27656342	2	57487	57488	0
27656343	2	57488	57489	0
18874397	5	57491	57490	0
18874389	5	57491	57490	0
27656337	2	57483	57484	0
27656338	2	57481	57483	0
27656339	2	57484	57485	0
18874398	5	56330	57491	0
27656316	2	56343	56345	0
27656333	2	56356	56357	0
27656325	2	56354	56356	0
27656334	2	56357	57469	0
27656335	2	57469	57470	0
27656336	2	57470	57471	0
27656332	2	57471	57476	0
18874392	5	56321	56322	0
18874375	5	56321	56322	0
18874384	5	56321	56322	0
18874376	5	56322	56323	0
31621160	10	97367	97368	0
31621161	10	97370	97371	0
18907523	5	56302	56301	0
18908004	5	56302	56301	0
18907245	5	56302	56301	0
18907214	4	56302	56301	0
18907215	4	56292	56302	0
18908005	5	56292	56302	0
18907246	5	56292	56302	0
18907524	5	56292	56302	0
18710573	14	56267	56272	0
18907210	4	56294	56286	0
18907241	5	56294	56286	0
18907998	5	56294	56286	0
18907519	5	56294	56286	0
18907639	5	56289	56290	0
18907589	5	56289	56290	0
18908001	5	56289	56290	0
18907522	5	56289	56290	0
18907553	5	56289	56290	0
18907244	5	56289	56290	0
18907824	5	56289	56290	0
18907599	5	56293	56262	0
18907835	5	56293	56262	0
18907531	5	56293	56262	0
18907649	5	56293	56262	0
18907253	5	56293	56262	0
18908012	5	56293	56262	0
18907562	5	56293	56262	0
18907222	4	56293	56262	0
18907836	5	56262	56294	0
18907600	5	56262	56294	0
18907563	5	56262	56294	0
18908013	5	56262	56294	0
18907223	4	56262	56294	0
18907532	5	56262	56294	0
18907254	5	56262	56294	0
18907650	5	56262	56294	0
18907564	5	56295	56296	0
18908014	5	56295	56296	0
18907837	5	56295	56296	0
18907533	5	56295	56296	0
18907224	4	56295	56296	0
18907651	5	56295	56296	0
18907255	5	56295	56296	0
18907601	5	56295	56296	0
18907825	5	56309	56279	0
18710577	14	56275	56267	0
18743296	13	56275	56267	0
18710558	14	56266	56316	0
18710576	14	56266	56267	0
18874385	5	56322	56323	0
18874393	5	56322	56323	0
27656344	2	56345	56346	0
27656345	2	56346	56347	0
18874394	5	56323	56324	0
18874377	5	56323	56324	0
18874386	5	56323	56324	0
27656326	2	56333	56334	0
27656327	2	56331	56333	0
27656328	2	56334	56335	0
27656329	2	56335	56336	0
27656317	2	56341	56343	0
27656321	2	56350	56351	0
27656322	2	56351	56352	0
27656323	2	56352	56353	0
27656324	2	56353	56354	0
27656318	2	56338	56339	0
27656319	2	56339	56341	0
18874395	5	57474	57473	0
18874387	5	57474	57473	0
18874388	5	56330	57474	0
27656331	2	57476	57477	0
27656320	2	57479	57481	0
27656330	2	56330	56331	0
18907827	5	56302	56301	0
18907554	5	56302	56301	0
18907591	5	56302	56301	0
18907641	5	56302	56301	0
18907642	5	56292	56302	0
18907828	5	56292	56302	0
18907592	5	56292	56302	0
18907555	5	56292	56302	0
18907516	5	56277	56271	0
18907583	5	56277	56271	0
18907238	5	56277	56271	0
18907818	5	56277	56271	0
18907995	5	56277	56271	0
18907547	5	56277	56271	0
18907633	5	56277	56271	0
18907207	4	56277	56271	0
18907819	5	56282	56277	0
18907634	5	56282	56277	0
18907239	5	56282	56277	0
18907517	5	56282	56277	0
27656367	3	57483	57484	0
27656368	3	57481	57483	0
27656369	3	57484	57485	0
27656370	3	57485	57486	0
27656371	3	57486	57487	0
27656372	3	57487	57488	0
27656373	3	57488	57489	0
27656374	3	56345	56346	0
27656346	3	56343	56345	0
27656375	3	56346	56347	0
27656363	3	56356	56357	0
27656355	3	56354	56356	0
27656364	3	56357	57469	0
27656365	3	57469	57470	0
27656366	3	57470	57471	0
27656362	3	57471	57476	0
27656356	3	56333	56334	0
27656357	3	56331	56333	0
27656358	3	56334	56335	0
27656359	3	56335	56336	0
27656347	3	56341	56343	0
27656351	3	56350	56351	0
27656352	3	56351	56352	0
27656353	3	56352	56353	0
27656354	3	56353	56354	0
27656348	3	56338	56339	0
27656349	3	56339	56341	0
27656361	3	57476	57477	0
27656350	3	57479	57481	0
27656360	3	56330	56331	0
34308098	7	97367	105950	0
34308099	7	97368	105951	0
34308100	7	97371	105951	0
18710560	14	56266	56267	0
18710574	14	56266	56316	0
18907535	5	56263	56264	0
18908010	5	56314	56312	0
18907529	5	56314	56312	0
18907220	4	56314	56312	0
18907560	5	56314	56312	0
18907833	5	56314	56312	0
18907251	5	56314	56312	0
18907647	5	56314	56312	0
18907648	5	56313	56314	0
18907252	5	56313	56314	0
18907530	5	56313	56314	0
18907598	5	56313	56314	0
18907834	5	56313	56314	0
18907221	4	56313	56314	0
18907561	5	56313	56314	0
18908011	5	56313	56314	0
18710561	14	56316	56315	0
18710578	14	56316	56315	0
31621125	6	97364	97365	0
27656206	4	56324	56326	0
27656207	4	56326	56327	0
27656208	4	56327	56328	0
27656205	4	57493	85345	0
27656209	4	57494	85345	0
18907526	5	56310	56309	0
18908007	5	56310	56309	0
18907644	5	56310	56309	0
18907557	5	56310	56309	0
18907830	5	56310	56309	0
27656384	4	86383	86384	0
18908002	5	56309	56279	0
18907604	5	56281	56282	0
18907654	5	56281	56282	0
18907594	5	56310	56309	0
18907645	5	56312	56310	0
18907249	5	56312	56310	0
18907558	5	56312	56310	0
18907831	5	56312	56310	0
18907227	4	56281	56282	0
18907258	5	56281	56282	0
18908017	5	56281	56282	0
18907840	5	56281	56282	0
18907567	5	56281	56282	0
18907839	5	56263	56264	0
18908016	5	56263	56264	0
18907653	5	56263	56264	0
18907603	5	56263	56264	0
18907257	5	56263	56264	0
18907566	5	56263	56264	0
18907226	4	56263	56264	0
18907525	5	56308	56311	0
18907829	5	56308	56311	0
18908006	5	56308	56311	0
18907247	5	56308	56311	0
18907556	5	56308	56311	0
18907643	5	56308	56311	0
18907216	4	56308	56311	0
18907593	5	56308	56311	0
18907217	4	56310	56309	0
18907248	5	56310	56309	0
18907595	5	56312	56310	0
18907527	5	56312	56310	0
18908008	5	56312	56310	0
18907218	4	56312	56310	0
18908009	5	56311	56313	0
18907250	5	56311	56313	0
18907832	5	56311	56313	0
18907646	5	56311	56313	0
18907559	5	56311	56313	0
18907596	5	56311	56313	0
18907219	4	56311	56313	0
18907528	5	56311	56313	0
18907597	5	56314	56312	0
\.


--
-- Data for Name: derivedallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY derivedallocation (id, version, resource_allocation_id, configurationunit) FROM stdin;
5152	0	5051	1616
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
6061	Incidencias	..,
6062	Incidencias	,,,
6063	Incidencias	Inci
58080	Incidencias	
58082	Incidencias	
58077	Incidencias	
58075	Incidencias	
58076	Incidencias	
58081	Incidencias	
58079	Incidencias	
58078	Incidencias	
58083	Incidencias	
58084	Incidencias	
76559	Incidencias	
76563	Incidencias	
76562	Incidencias	
76561	Incidencias	
76564	Incidencias	
76560	Incidencias	
76646	Incidencias	
76647	Incidencias	
76648	Incidencias	
76649	Incidencias	
76650	Incidencias	
76651	Incidencias	
76652	Incidencias	
76653	Incidencias	
76654	Incidencias	
76657	Incidencias	
76658	Incidencias	
78881	Incidencias	
78882	Incidencias	
78883	Incidencias	
78884	Incidencias	
78885	Incidencias	
78886	Incidencias	
78887	Incidencias	
78888	Incidencias	
78889	Incidencias	
78890	Incidencias	
78891	Incidencias	
78892	Incidencias	
78893	Incidencias	
78894	Incidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
7509	6301	100.00
79996	6302	100.00
7510	6302	100.00
7511	6303	100.00
7512	6304	100.00
7514	6306	100.00
7515	6307	100.00
7516	6320	100.00
8003	6322	100.00
8004	6323	100.00
8006	6340	100.00
8007	6341	100.00
8008	6342	100.00
8009	6343	100.00
8011	6354	100.00
8012	6355	100.00
8014	6675	100.00
9290	6677	100.00
9292	6678	100.00
9293	6816	100.00
9294	6817	100.00
9296	6819	100.00
9297	6820	100.00
9298	6821	100.00
9299	6822	100.00
9300	6823	100.00
9301	6824	100.00
9303	6826	100.00
9304	6827	100.00
9305	6828	100.00
9306	6829	100.00
80079	85512	100.00
80080	85513	100.00
80081	85514	100.00
80082	85515	100.00
80085	85517	100.00
80086	85518	100.00
80087	85519	100.00
80090	85521	100.00
80091	85522	100.00
85649	85524	100.00
85650	85525	100.00
85651	85526	100.00
85652	85527	100.00
85655	85529	100.00
85656	85530	100.00
85659	85532	100.00
85662	85534	100.00
85665	85536	100.00
85666	85537	100.00
85667	85538	100.00
85670	85540	100.00
85671	85541	100.00
85672	85542	100.00
85673	85543	100.00
85674	85544	100.00
85675	85545	100.00
85678	85749	100.00
85679	85750	100.00
85680	85751	100.00
85681	85752	100.00
85682	85753	100.00
85685	85755	100.00
85686	85756	100.00
85689	85758	100.00
85690	85759	100.00
85693	85761	100.00
85696	85763	100.00
85699	85765	100.00
85700	85766	100.00
85701	85767	100.00
9307	6830	100.00
11027	7073	100.00
11028	7074	100.00
11030	7076	100.00
11031	7077	100.00
11033	7079	100.00
11035	7082	100.00
11037	7116	100.00
11038	7117	100.00
11039	7084	100.00
85702	85768	100.00
85703	85769	100.00
85704	85770	100.00
85705	85771	100.00
85706	85772	100.00
85707	85773	100.00
85710	85774	100.00
86097	85842	100.00
86098	85843	100.00
86099	85844	100.00
86100	85845	100.00
86103	85847	100.00
86104	85848	100.00
57403	57256	100.00
86326	86215	100.00
86285	86215	100.00
86327	86216	100.00
5673	3698	4000.00
5672	3698	100.00
86105	85849	100.00
86108	86154	100.00
86109	86155	100.00
86112	86157	100.00
86113	86158	100.00
86114	86159	100.00
86115	86160	100.00
86118	86162	100.00
86119	86163	100.00
86122	86165	100.00
86125	86167	100.00
86128	86169	100.00
86129	86170	100.00
86130	86171	100.00
86133	86173	100.00
86134	86174	100.00
86135	86175	100.00
86136	86176	100.00
86137	86177	100.00
86138	86178	100.00
86141	86180	100.00
86142	86181	100.00
86143	86182	100.00
86144	86183	100.00
86145	86184	100.00
86148	86186	100.00
86149	86187	100.00
86152	86189	100.00
86254	86190	100.00
86257	86192	100.00
86260	86194	100.00
86263	86196	100.00
86264	86197	100.00
86265	86198	100.00
86266	86199	100.00
86267	86200	100.00
86268	86201	100.00
86269	86202	100.00
86270	86203	100.00
86271	86204	100.00
86274	86205	100.00
86275	86206	100.00
85711	85775	100.00
107473	90614	100.00
86289	86216	100.00
57124	57195	100.00
57125	57196	100.00
57126	57197	100.00
57127	57198	100.00
57130	57200	100.00
57131	57201	100.00
57132	57202	100.00
57135	57204	100.00
57136	57205	100.00
57139	57207	100.00
57140	57208	100.00
57141	57209	100.00
57142	57210	100.00
57145	57212	100.00
57146	57213	100.00
57149	57215	100.00
57152	57217	100.00
57155	57219	100.00
57156	57220	100.00
57157	57221	100.00
57160	57223	100.00
57161	57224	100.00
57162	57225	100.00
57163	57226	100.00
57164	57227	100.00
57165	57228	100.00
57370	57230	100.00
57371	57231	100.00
57372	57232	100.00
57373	57233	100.00
57374	57234	100.00
57377	57236	100.00
11040	7080	100.00
11041	7118	100.00
11042	7119	100.00
11043	7120	100.00
11044	7121	100.00
11045	7122	100.00
11047	7123	100.00
11048	7124	100.00
57378	57237	100.00
57381	57239	100.00
57382	57240	100.00
57385	57242	100.00
57388	57244	100.00
57391	57246	100.00
57392	57247	100.00
57393	57248	100.00
57394	57249	100.00
57395	57250	100.00
57396	57251	100.00
57397	57252	100.00
57398	57253	100.00
57399	57254	100.00
57402	57255	100.00
105270	57256	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
2020	1	Navantia	B11111111	t	f	f	\N	\N	\N	\N
6464	2	fundación	N00000000	t	f	f	\N	\N	\N	\N
2021	2	Igalia	B15804842	t	t	t	http://localhost:8080/navalplanner-webapp/	wswriter	wswriter	912
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
2527
3063
3064
3066
3069
3070
58383
58384
58450
58451
58452
58453
58454
58455
58456
58457
58458
58459
58460
58461
58468
58469
58470
58472
60703
60704
60705
60706
60751
60752
60753
60754
60755
60756
60757
60758
60790
60791
60792
60795
68413
68414
68415
68416
68417
68418
68419
68420
68421
68422
68423
97566
97567
97578
97579
97580
97581
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
1144
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template, resourcetype) FROM stdin;
3622	3	proxecto-00003-00001-00001	30	1.00	f	3646	\N	WORKER
6919	31	proxecto-00006-00041-00001	32	1.00	f	6830	\N	WORKER
57287	7	proxecto-00008-00043-00001	32	1.00	f	57228	\N	WORKER
6955	30	proxecto-00006-00046-00001	24	1.00	f	7084	\N	WORKER
57273	7	proxecto-00008-00029-00001	28	1.00	f	57209	\N	WORKER
86041	3	proxecto-00010-00017-00001	256	1.00	f	86206	\N	WORKER
3623	3	proxecto-00003-00002-00001	40	1.00	f	3647	\N	WORKER
3624	3	proxecto-00003-00003-00001	40	1.00	f	3648	\N	WORKER
3625	3	proxecto-00003-00004-00001	50	1.00	f	3649	\N	WORKER
85625	3	proxecto-00009-00048-00001	32	1.00	f	85753	\N	WORKER
85626	3	proxecto-00009-00049-00001	64	1.00	f	85755	\N	WORKER
2139	3	proxecto-00001-00005-00001	16	1.00	f	1870	\N	WORKER
2140	3	proxecto-00001-00006-00001	16	1.00	f	1871	\N	WORKER
2141	3	proxecto-00001-00002-00001	32	1.00	f	1872	\N	WORKER
2142	3	proxecto-00001-00007-00001	24	1.00	f	1874	\N	WORKER
2143	3	proxecto-00001-00008-00001	7	1.00	f	1875	\N	WORKER
2144	3	proxecto-00001-00009-00001	14	1.00	f	1877	\N	WORKER
6907	31	proxecto-00006-00029-00001	32	1.00	f	6816	\N	WORKER
6908	31	proxecto-00006-00030-00001	32	1.00	f	6817	\N	WORKER
86046	11	proxecto-00013-00003-00001	100	1.00	f	86215	\N	WORKER
86047	11	proxecto-00013-00004-00001	100	1.00	f	86216	\N	WORKER
86048	11	proxecto-00013-00005-00001	56	1.00	f	86217	\N	WORKER
57279	7	proxecto-00008-00035-00001	48	1.00	f	57219	\N	WORKER
57280	7	proxecto-00008-00036-00001	32	1.00	f	57220	\N	WORKER
57281	7	proxecto-00008-00037-00001	32	1.00	f	57221	\N	WORKER
6909	31	proxecto-00006-00031-00001	64	1.00	f	6819	\N	WORKER
6910	31	proxecto-00006-00032-00001	16	1.00	f	6820	\N	WORKER
6911	31	proxecto-00006-00033-00001	32	1.00	f	6821	\N	WORKER
3626	3	proxecto-00003-00005-00001	32	1.00	f	3650	\N	WORKER
3627	3	proxecto-00003-00006-00001	15	1.00	f	3651	\N	WORKER
3628	3	proxecto-00003-00007-00001	16	1.00	f	3652	\N	WORKER
3629	3	proxecto-00003-00008-00001	8	1.00	f	3653	\N	WORKER
3630	3	proxecto-00003-00009-00001	24	1.00	f	3654	\N	WORKER
3631	3	proxecto-00003-00010-00001	32	1.00	f	3655	\N	WORKER
3632	3	proxecto-00003-00011-00001	42	1.00	f	3656	\N	WORKER
3633	3	proxecto-00003-00012-00001	54	1.00	f	3657	\N	WORKER
6912	31	proxecto-00006-00034-00001	40	1.00	f	6822	\N	WORKER
6913	31	proxecto-00006-00035-00001	16	1.00	f	6823	\N	WORKER
6914	31	proxecto-00006-00036-00001	32	1.00	f	6824	\N	WORKER
6915	31	proxecto-00006-00037-00001	15	1.00	f	6826	\N	WORKER
6916	31	proxecto-00006-00038-00001	48	1.00	f	6827	\N	WORKER
6917	31	proxecto-00006-00039-00001	40	1.00	f	6828	\N	WORKER
6918	31	proxecto-00006-00040-00001	24	1.00	f	6829	\N	WORKER
6947	30	proxecto-00006-00047-00001	64	1.00	f	7073	\N	WORKER
6948	30	proxecto-00006-00048-00001	96	1.00	f	7074	\N	WORKER
6949	30	proxecto-00006-00049-00001	32	1.00	f	7076	\N	WORKER
6950	30	proxecto-00006-00050-00001	40	1.00	f	7077	\N	WORKER
3634	3	proxecto-00003-00013-00001	103	1.00	f	3658	\N	WORKER
3635	3	proxecto-00003-00014-00001	21	1.00	f	3659	\N	WORKER
3737	3	proxecto-00003-00015-00001	42	1.00	f	3660	\N	WORKER
3738	3	proxecto-00003-00016-00001	12	1.00	f	3661	\N	WORKER
3739	3	proxecto-00003-00017-00001	8	1.00	f	3662	\N	WORKER
3740	3	proxecto-00003-00018-00001	24	1.00	f	3663	\N	WORKER
3741	3	proxecto-00003-00019-00001	26	1.00	f	3664	\N	WORKER
3742	3	proxecto-00003-00020-00001	34	1.00	f	3665	\N	WORKER
3743	3	proxecto-00003-00021-00001	43	1.00	f	3666	\N	WORKER
3744	3	proxecto-00003-00022-00001	65	1.00	f	3667	\N	WORKER
3745	3	proxecto-00003-00023-00001	70	1.00	f	3668	\N	WORKER
3746	3	proxecto-00003-00024-00001	50	1.00	f	3669	\N	WORKER
3747	3	proxecto-00003-00025-00001	70	1.00	f	3670	\N	WORKER
3748	3	proxecto-00003-00026-00001	80	1.00	f	3671	\N	WORKER
3749	3	proxecto-00003-00027-00001	100	1.00	f	3672	\N	WORKER
3750	3	proxecto-00003-00028-00001	42	1.00	f	3673	\N	WORKER
3751	3	proxecto-00003-00029-00001	300	1.00	f	3674	\N	WORKER
4866	3	proxecto-00005-00001-00002	40	0.50	f	4713	\N	WORKER
4865	3	proxecto-00005-00001-00001	40	0.50	f	4713	\N	WORKER
4867	3	proxecto-00005-00002-00001	100	1.00	f	4714	\N	WORKER
4869	3	proxecto-00005-00003-00002	100	0.50	f	4715	\N	WORKER
4868	3	proxecto-00005-00003-00001	100	0.50	f	4715	\N	WORKER
57282	7	proxecto-00008-00038-00001	64	1.00	f	57223	\N	WORKER
57283	7	proxecto-00008-00039-00001	16	1.00	f	57224	\N	WORKER
57284	7	proxecto-00008-00040-00001	32	1.00	f	57225	\N	WORKER
85604	3	proxecto-00009-00027-00001	24	1.00	f	85524	\N	WORKER
57285	7	proxecto-00008-00041-00001	40	1.00	f	57226	\N	WORKER
85605	3	proxecto-00009-00028-00001	48	1.00	f	85525	\N	WORKER
57286	7	proxecto-00008-00042-00001	16	1.00	f	57227	\N	WORKER
6583	36	proxecto-00006-00003-00001	8	1.00	f	6301	\N	WORKER
90699	2	proxecto-00015-00004-00001	30	1.00	f	90600	\N	WORKER
90700	2	proxecto-00015-00005-00001	40	1.00	f	90601	\N	WORKER
6584	36	proxecto-00006-00004-00001	16	1.00	f	6302	\N	WORKER
57288	7	proxecto-00008-00044-00001	15	1.00	f	57230	\N	WORKER
57289	7	proxecto-00008-00045-00001	48	1.00	f	57231	\N	WORKER
57290	7	proxecto-00008-00046-00001	40	1.00	f	57232	\N	WORKER
57291	7	proxecto-00008-00047-00001	24	1.00	f	57233	\N	WORKER
57292	7	proxecto-00008-00048-00001	32	1.00	f	57234	\N	WORKER
57293	7	proxecto-00008-00049-00001	64	1.00	f	57236	\N	WORKER
85612	3	proxecto-00009-00035-00001	48	1.00	f	85536	\N	WORKER
85613	3	proxecto-00009-00036-00001	32	1.00	f	85537	\N	WORKER
85614	3	proxecto-00009-00037-00001	32	1.00	f	85538	\N	WORKER
90701	2	proxecto-00015-00006-00001	50	1.00	f	90602	\N	WORKER
6585	36	proxecto-00006-00005-00001	16	1.00	f	6303	\N	WORKER
6586	36	proxecto-00006-00006-00001	40	1.00	f	6304	\N	WORKER
6587	36	proxecto-00006-00007-00001	24	1.00	f	6306	\N	WORKER
6588	36	proxecto-00006-00008-00001	56	1.00	f	6307	\N	WORKER
6598	35	proxecto-00006-00010-00001	8	1.00	f	6320	\N	WORKER
85615	3	proxecto-00009-00038-00001	64	1.00	f	85540	\N	WORKER
85616	3	proxecto-00009-00039-00001	16	1.00	f	85541	\N	WORKER
85617	3	proxecto-00009-00040-00001	32	1.00	f	85542	\N	WORKER
57294	7	proxecto-00008-00050-00001	96	1.00	f	57237	\N	WORKER
6599	35	proxecto-00006-00011-00001	40	1.00	f	6322	\N	WORKER
6600	35	proxecto-00006-00012-00001	8	1.00	f	6323	\N	WORKER
6613	34	proxecto-00006-00014-00001	24	1.00	f	6340	\N	WORKER
6614	34	proxecto-00006-00015-00001	48	1.00	f	6341	\N	WORKER
6615	34	proxecto-00006-00016-00001	28	1.00	f	6342	\N	WORKER
57295	7	proxecto-00008-00051-00001	32	1.00	f	57239	\N	WORKER
6616	34	proxecto-00006-00017-00001	120	1.00	f	6343	\N	WORKER
6623	33	proxecto-00006-00019-00001	24	1.00	f	6354	\N	WORKER
57296	7	proxecto-00008-00052-00001	40	1.00	f	57240	\N	WORKER
6624	33	proxecto-00006-00020-00001	40	1.00	f	6355	\N	WORKER
6634	32	proxecto-00006-00024-00001	40	1.00	f	6675	\N	WORKER
6635	32	proxecto-00006-00025-00001	40	1.00	f	6677	\N	WORKER
6951	30	proxecto-00006-00051-00001	40	1.00	f	7079	\N	WORKER
6953	30	proxecto-00006-00053-00001	32	1.00	f	7082	\N	WORKER
7185	29	proxecto-00006-00056-00001	16	1.00	f	7116	\N	WORKER
57060	7	proxecto-00008-00018-00001	8	1.00	f	57195	\N	WORKER
7186	29	proxecto-00006-00057-00001	24	1.00	f	7117	\N	WORKER
57061	7	proxecto-00008-00019-00001	16	1.00	f	57196	\N	WORKER
6952	30	proxecto-00006-00052-00001	24	1.00	f	7080	\N	WORKER
90702	4	proxecto-00016-00001-00001	300	1.00	f	90605	\N	WORKER
90703	4	proxecto-00016-00002-00001	400	1.00	f	90606	\N	WORKER
7187	29	proxecto-00006-00058-00001	24	1.00	f	7118	\N	WORKER
85618	3	proxecto-00009-00041-00001	40	1.00	f	85543	\N	WORKER
7188	29	proxecto-00006-00059-00001	24	1.00	f	7119	\N	WORKER
7189	29	proxecto-00006-00060-00001	24	1.00	f	7120	\N	WORKER
85619	3	proxecto-00009-00042-00001	16	1.00	f	85544	\N	WORKER
85620	3	proxecto-00009-00043-00001	32	1.00	f	85545	\N	WORKER
85621	3	proxecto-00009-00044-00001	15	1.00	f	85749	\N	WORKER
85622	3	proxecto-00009-00045-00001	48	1.00	f	85750	\N	WORKER
85623	3	proxecto-00009-00046-00001	40	1.00	f	85751	\N	WORKER
85624	3	proxecto-00009-00047-00001	24	1.00	f	85752	\N	WORKER
85637	3	proxecto-00009-00060-00001	24	1.00	f	85770	\N	WORKER
85638	3	proxecto-00009-00061-00001	24	1.00	f	85771	\N	WORKER
85639	3	proxecto-00009-00062-00001	24	1.00	f	85772	\N	WORKER
7190	29	proxecto-00006-00061-00001	24	1.00	f	7121	\N	WORKER
7191	29	proxecto-00006-00062-00001	24	1.00	f	7122	\N	WORKER
90704	8	proxecto-00017-00003-00001	160	1.00	f	90610	\N	WORKER
90705	8	proxecto-00017-00004-00001	160	1.00	f	90611	\N	WORKER
90706	8	proxecto-00017-00005-00001	160	1.00	f	90613	\N	WORKER
90707	8	proxecto-00017-00006-00001	160	1.00	f	90614	\N	WORKER
3761	8	proxecto-00004-00001-00001	100	1.00	f	3698	\N	WORKER
3762	8	proxecto-00004-00002-00001	200	1.00	f	3699	\N	WORKER
3763	8	proxecto-00004-00003-00001	100	1.00	f	3700	\N	WORKER
57062	7	proxecto-00008-00020-00001	16	1.00	f	57197	\N	WORKER
57063	7	proxecto-00008-00021-00001	40	1.00	f	57198	\N	WORKER
57064	7	proxecto-00008-00022-00001	24	1.00	f	57200	\N	WORKER
57267	7	proxecto-00008-00023-00001	56	1.00	f	57201	\N	WORKER
57268	7	proxecto-00008-00024-00001	8	1.00	f	57202	\N	WORKER
6636	32	proxecto-00006-00023-00001	48	1.00	f	6678	\N	WORKER
7192	29	proxecto-00006-00063-00001	256	1.00	f	7123	\N	WORKER
7193	29	proxecto-00006-00064-00001	256	1.00	f	7124	\N	WORKER
57269	7	proxecto-00008-00025-00001	40	1.00	f	57204	\N	WORKER
57270	7	proxecto-00008-00026-00001	8	1.00	f	57205	\N	WORKER
57271	7	proxecto-00008-00027-00001	24	1.00	f	57207	\N	WORKER
57272	7	proxecto-00008-00028-00001	48	1.00	f	57208	\N	WORKER
57274	7	proxecto-00008-00030-00001	120	1.00	f	57210	\N	WORKER
57275	7	proxecto-00008-00031-00001	24	1.00	f	57212	\N	WORKER
57276	7	proxecto-00008-00032-00001	40	1.00	f	57213	\N	WORKER
57277	7	proxecto-00008-00033-00001	40	1.00	f	57215	\N	WORKER
57278	7	proxecto-00008-00034-00001	40	1.00	f	57217	\N	WORKER
57297	7	proxecto-00008-00053-00001	40	1.00	f	57242	\N	WORKER
57298	7	proxecto-00008-00054-00001	32	1.00	f	57244	\N	WORKER
57306	7	proxecto-00008-00062-00001	24	1.00	f	57253	\N	WORKER
57307	7	proxecto-00008-00063-00001	24	1.00	f	57254	\N	WORKER
57308	7	proxecto-00008-00016-00001	256	1.00	f	57255	\N	WORKER
57309	7	proxecto-00008-00017-00001	256	1.00	f	57256	\N	WORKER
57299	7	proxecto-00008-00055-00001	16	1.00	f	57246	\N	WORKER
57300	7	proxecto-00008-00056-00001	24	1.00	f	57247	\N	WORKER
57301	7	proxecto-00008-00057-00001	24	1.00	f	57248	\N	WORKER
57302	7	proxecto-00008-00058-00001	24	1.00	f	57249	\N	WORKER
57303	7	proxecto-00008-00059-00001	24	1.00	f	57250	\N	WORKER
57304	7	proxecto-00008-00060-00001	24	1.00	f	57251	\N	WORKER
57305	7	proxecto-00008-00061-00001	24	1.00	f	57252	\N	WORKER
86004	3	proxecto-00010-00028-00001	48	1.00	f	86158	\N	WORKER
86005	3	proxecto-00010-00029-00001	28	1.00	f	86159	\N	WORKER
86006	3	proxecto-00010-00030-00001	120	1.00	f	86160	\N	WORKER
86007	3	proxecto-00010-00031-00001	24	1.00	f	86162	\N	WORKER
86008	3	proxecto-00010-00032-00001	40	1.00	f	86163	\N	WORKER
86009	3	proxecto-00010-00033-00001	40	1.00	f	86165	\N	WORKER
86010	3	proxecto-00010-00034-00001	40	1.00	f	86167	\N	WORKER
86011	3	proxecto-00010-00035-00001	48	1.00	f	86169	\N	WORKER
86012	3	proxecto-00010-00036-00001	32	1.00	f	86170	\N	WORKER
86013	3	proxecto-00010-00037-00001	32	1.00	f	86171	\N	WORKER
86014	3	proxecto-00010-00038-00001	64	1.00	f	86173	\N	WORKER
86015	3	proxecto-00010-00039-00001	16	1.00	f	86174	\N	WORKER
86016	3	proxecto-00010-00040-00001	32	1.00	f	86175	\N	WORKER
86017	3	proxecto-00010-00041-00001	40	1.00	f	86176	\N	WORKER
86018	3	proxecto-00010-00042-00001	16	1.00	f	86177	\N	WORKER
86019	3	proxecto-00010-00043-00001	32	1.00	f	86178	\N	WORKER
86020	3	proxecto-00010-00044-00001	15	1.00	f	86180	\N	WORKER
86021	3	proxecto-00010-00045-00001	48	1.00	f	86181	\N	WORKER
86040	3	proxecto-00010-00016-00001	256	1.00	f	86205	\N	WORKER
85994	3	proxecto-00010-00018-00001	8	1.00	f	85842	\N	WORKER
85995	3	proxecto-00010-00019-00001	16	1.00	f	85843	\N	WORKER
85996	3	proxecto-00010-00020-00001	16	1.00	f	85844	\N	WORKER
85997	3	proxecto-00010-00021-00001	40	1.00	f	85845	\N	WORKER
85998	3	proxecto-00010-00022-00001	24	1.00	f	85847	\N	WORKER
85999	3	proxecto-00010-00023-00001	56	1.00	f	85848	\N	WORKER
86000	3	proxecto-00010-00024-00001	8	1.00	f	85849	\N	WORKER
86001	3	proxecto-00010-00025-00001	40	1.00	f	86154	\N	WORKER
86002	3	proxecto-00010-00026-00001	8	1.00	f	86155	\N	WORKER
86003	3	proxecto-00010-00027-00001	24	1.00	f	86157	\N	WORKER
85595	3	proxecto-00009-00018-00001	8	1.00	f	85512	\N	WORKER
85596	3	proxecto-00009-00019-00001	16	1.00	f	85513	\N	WORKER
85597	3	proxecto-00009-00020-00001	16	1.00	f	85514	\N	WORKER
85598	3	proxecto-00009-00021-00001	40	1.00	f	85515	\N	WORKER
85599	3	proxecto-00009-00022-00001	24	1.00	f	85517	\N	WORKER
85600	3	proxecto-00009-00023-00001	56	1.00	f	85518	\N	WORKER
85601	3	proxecto-00009-00024-00001	8	1.00	f	85519	\N	WORKER
85602	3	proxecto-00009-00025-00001	40	1.00	f	85521	\N	WORKER
85603	3	proxecto-00009-00026-00001	8	1.00	f	85522	\N	WORKER
85606	3	proxecto-00009-00029-00001	28	1.00	f	85526	\N	WORKER
85607	3	proxecto-00009-00030-00001	120	1.00	f	85527	\N	WORKER
85608	3	proxecto-00009-00031-00001	24	1.00	f	85529	\N	WORKER
85609	3	proxecto-00009-00032-00001	40	1.00	f	85530	\N	WORKER
85610	3	proxecto-00009-00033-00001	40	1.00	f	85532	\N	WORKER
85611	3	proxecto-00009-00034-00001	40	1.00	f	85534	\N	WORKER
85627	3	proxecto-00009-00050-00001	96	1.00	f	85756	\N	WORKER
85628	3	proxecto-00009-00051-00001	32	1.00	f	85758	\N	WORKER
85629	3	proxecto-00009-00052-00001	40	1.00	f	85759	\N	WORKER
85630	3	proxecto-00009-00053-00001	40	1.00	f	85761	\N	WORKER
85631	3	proxecto-00009-00054-00001	32	1.00	f	85763	\N	WORKER
85632	3	proxecto-00009-00055-00001	16	1.00	f	85765	\N	WORKER
85633	3	proxecto-00009-00056-00001	24	1.00	f	85766	\N	WORKER
85634	3	proxecto-00009-00057-00001	24	1.00	f	85767	\N	WORKER
85635	3	proxecto-00009-00058-00001	24	1.00	f	85768	\N	WORKER
85636	3	proxecto-00009-00059-00001	24	1.00	f	85769	\N	WORKER
85640	3	proxecto-00009-00063-00001	24	1.00	f	85773	\N	WORKER
85641	3	proxecto-00009-00016-00001	256	1.00	f	85774	\N	WORKER
85642	3	proxecto-00009-00017-00001	256	1.00	f	85775	\N	WORKER
86022	3	proxecto-00010-00046-00001	40	1.00	f	86182	\N	WORKER
86023	3	proxecto-00010-00047-00001	24	1.00	f	86183	\N	WORKER
86024	3	proxecto-00010-00048-00001	32	1.00	f	86184	\N	WORKER
86025	3	proxecto-00010-00049-00001	64	1.00	f	86186	\N	WORKER
86026	3	proxecto-00010-00050-00001	96	1.00	f	86187	\N	WORKER
86027	3	proxecto-00010-00051-00001	32	1.00	f	86189	\N	WORKER
86028	3	proxecto-00010-00052-00001	40	1.00	f	86190	\N	WORKER
86029	3	proxecto-00010-00053-00001	40	1.00	f	86192	\N	WORKER
86030	3	proxecto-00010-00054-00001	32	1.00	f	86194	\N	WORKER
86031	3	proxecto-00010-00055-00001	16	1.00	f	86196	\N	WORKER
86032	3	proxecto-00010-00056-00001	24	1.00	f	86197	\N	WORKER
86033	3	proxecto-00010-00057-00001	24	1.00	f	86198	\N	WORKER
86034	3	proxecto-00010-00058-00001	24	1.00	f	86199	\N	WORKER
86035	3	proxecto-00010-00059-00001	24	1.00	f	86200	\N	WORKER
86036	3	proxecto-00010-00060-00001	24	1.00	f	86201	\N	WORKER
86037	3	proxecto-00010-00061-00001	24	1.00	f	86202	\N	WORKER
86038	3	proxecto-00010-00062-00001	24	1.00	f	86203	\N	WORKER
86039	3	proxecto-00010-00063-00001	24	1.00	f	86204	\N	WORKER
\.


--
-- Data for Name: hoursperday; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursperday (base_calendar_id, hours, day_id) FROM stdin;
404	8	0
404	8	1
404	8	2
404	8	3
404	8	4
404	0	5
404	0	6
409	16	0
409	16	1
409	16	2
409	16	3
409	16	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
1951	1869
1952	1873
1953	1876
1954	1868
3356	3255
57134	57199
3408	4712
57133	57199
57137	57203
57138	57203
57143	57206
57144	57206
57147	57211
57148	57211
57151	57214
57150	57214
5674	3697
3370	3697
7513	6300
5696	6300
79997	6300
5697	6305
7517	6305
5701	6321
8005	6321
5675	3697
57153	57216
57154	57216
57159	57218
57158	57218
57368	57222
57369	57222
57375	57229
57376	57229
57380	57235
57379	57235
57384	57238
57383	57238
57386	57241
57387	57241
57389	57243
57390	57243
57400	57245
57401	57245
105271	57193
57404	57193
57405	57193
57128	57194
57129	57194
86101	85841
86102	85841
86107	85846
86106	85846
86110	86153
86111	86153
86117	86156
86116	86156
86121	86161
86120	86161
86124	86164
86123	86164
86127	86166
86126	86166
86131	86168
86132	86168
86140	86172
86139	86172
86146	86179
86147	86179
86150	86185
86151	86185
86256	86188
86255	86188
86259	86191
86258	86191
86261	86193
86262	86193
86272	86195
86273	86195
86276	85840
86277	85840
80084	85511
80083	85511
80089	85516
80088	85516
85648	85520
80092	85520
85654	85523
85653	85523
85658	85528
85657	85528
85660	85531
85661	85531
85663	85533
85664	85533
85669	85535
85668	85535
85676	85539
85677	85539
85683	85546
85684	85546
85688	85754
85687	85754
85692	85757
85691	85757
85695	85760
85694	85760
85698	85762
85697	85762
85709	85764
85708	85764
85712	85510
85713	85510
86286	86214
86328	86214
86281	86214
86287	86208
86279	86208
86329	86208
90800	90599
90799	90597
90802	90604
90805	90609
107474	90612
90806	90612
107475	90608
90804	90608
5705	6339
8010	6339
5709	6353
8013	6353
8015	6674
5716	6674
9291	6676
5717	6676
6978	6815
9295	6815
9302	6818
6979	6818
9308	6825
6980	6825
11029	7072
6993	7072
11032	7075
6994	7075
11034	7078
6995	7078
6996	7081
11036	7081
11046	7115
7518	6275
79998	6275
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1111	1	b2b9cdee-2785-4c03-8e01-cec0a93b61cf	CC Mugardos	1010
1112	1	e725226b-94f3-41df-88fe-a1855cedc808	CC Cadiz	1010
1113	1	193da183-85b3-4306-9495-f40b3181480b	CC Vigo	1010
1114	1	b666450b-7fa2-4fca-be96-edc3eaaf0146	CC Ferrol	1010
102516	3	774e42b9-c35c-4de2-a20b-487ff1c413ef	Puente	102414
102515	3	a6256552-5ac7-46a7-95d6-8b8c8b415c65	Bodegas	102414
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name) FROM stdin;
1010	1	a3636840-33ed-4e25-8ffd-6f98aa72df2a	Centro de coste
102414	1	9c0cbc00-9c1f-497b-b8f6-312105e3bdcb	Zonas de buque
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
5858	Incidencias	200	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, code, name, description) FROM stdin;
1232	Tornos1	Torno	desc
1234	Tornos2	Torno2	desc
1236	Tornos3	tornos3	Desc.
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
1717	2	2010-02-03 12:06:45.203	\N	1616	1224
1718	2	2010-02-03 12:06:39.034	\N	1616	1214
\.


--
-- Data for Name: machineworkersconfigurationunit; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machineworkersconfigurationunit (id, version, name, alpha, machine) FROM stdin;
1616	2	New configuration unit	0.50	1236
\.


--
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material (id, version, code, description, default_unit_price, unit_type, disabled, category_id) FROM stdin;
101505	1	1.2	tubos 40mm	5.00	3	f	101404
101506	1	1.1	tubos 20mm	3.00	3	f	101404
\.


--
-- Data for Name: material_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment (id, version, units, unit_price, material_id, estimated_availability, status, order_element_id) FROM stdin;
101615	2	0	3.00	101506	\N	1	6302
101616	2	0	5.00	101505	\N	1	6302
101617	2	100	3.00	101506	\N	1	57195
101618	2	50	5.00	101505	\N	2	57195
101619	2	50	5.00	101505	\N	1	57195
101612	4	50	5.00	101505	2010-03-04 00:00:00	1	6301
101613	4	50	5.00	101505	2010-03-01 00:00:00	1	6301
101614	4	100	3.00	101506	2010-03-01 00:00:00	1	6301
\.


--
-- Data for Name: material_assigment_template; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_assigment_template (id, version, units, unit_price, material_id, order_element_template_id) FROM stdin;
\.


--
-- Data for Name: material_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY material_category (id, version, name, parent_id) FROM stdin;
202	2	Imported materials without category	\N
101404	1	Tubos	\N
101405	1	Acero	\N
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
109686	1	usuario_exemplo_1	8bac5730c2f8d849b04f38369986f7422262200e890cfb202972503dbc8eb19040519f0d3780df7274a086a4e697108f18f761c3eda14c4d59a2efc069f45bd8	usuario@exemplo1.com	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
97162	USER	4	WRITE_AUTHORIZATION	90604	910	\N
2222	USER	2	WRITE_AUTHORIZATION	1868	910	\N
3434	USER	3	WRITE_AUTHORIZATION	3255	910	\N
3436	USER	2	WRITE_AUTHORIZATION	4712	910	\N
6363	USER	37	WRITE_AUTHORIZATION	6275	910	\N
57570	USER	6	WRITE_AUTHORIZATION	57193	910	\N
97163	USER	8	WRITE_AUTHORIZATION	90608	910	\N
109787	USER	1	READ_AUTHORIZATION	3697	109686	\N
3435	USER	7	WRITE_AUTHORIZATION	3697	910	\N
109788	USER	1	READ_AUTHORIZATION	3697	109686	\N
85851	USER	2	WRITE_AUTHORIZATION	85840	910	\N
85850	USER	2	WRITE_AUTHORIZATION	85510	910	\N
\.


--
-- Data for Name: order_element_label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_element_label (order_element_id, label_id) FROM stdin;
6301	102516
6826	102515
6826	102516
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
1868	Xavi	t	t	9	40000.00	4000.00	109	Ref	\N	0	2020	307
90597	\N	\N	t	6	10000.00	0.00	120	CODE-1	\N	5	2021	307
3255	REsp	\N	t	29	50000.00	0.00	1473	Ref	\N	0	2020	307
4712	Resp.	t	t	3	60000.00	0.00	380	Ref.	\N	1	2020	307
90604	\N	\N	t	2	20000.00	0.00	700	\N	\N	0	\N	307
6275	Xavier	\N	t	64	150000.00	0.00	2075	Ref,	\N	0	6464	307
57193	\N	\N	t	63	100000.00	0.00	2075	\N	\N	0	\N	307
90608	\N	\N	t	6	50000.00	0.00	640	\N	\N	0	2020	307
3697	asdf	\N	t	3	60000.00	0.00	400	asdf	\N	0	2020	307
85840	\N	\N	t	63	400000.00	0.00	2075	\N	\N	0	\N	307
85510	\N	\N	t	63	50000.00	0.00	2075	\N	\N	0	\N	307
86208	\N	\N	t	5	100000.00	0.00	256	\N	\N	5	2021	307
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
3255	5	Pedido 2	Desc.	proxecto-00003	2010-02-04 12:10:40.245	2010-11-25 00:00:00	3	\N	\N	\N	\N
6321	35	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	3	6275	\N	\N	2
85510	3	4º release Navalplan - 3	Desc.	proxecto-00009	2010-04-21 00:00:00	2010-05-27 00:00:00	3	\N	56587	\N	\N
85511	3	Módulo de xestión de usuarios	\N	proxecto-00009-00001	\N	\N	3	85510	\N	\N	0
85512	3	Xestión de usuarios	\N	proxecto-00009-00018	\N	\N	0	85511	\N	\N	0
85513	3	Xestión de roles	\N	proxecto-00009-00019	\N	\N	0	85511	\N	\N	1
85514	3	Xestión de perfiles	\N	proxecto-00009-00020	\N	\N	0	85511	\N	\N	2
85515	3	Xestión de roles e pedidos	\N	proxecto-00009-00021	\N	\N	0	85511	\N	\N	3
85516	3	Módulo de organizacións de traballo	\N	proxecto-00009-00002	\N	\N	3	85510	\N	\N	1
85517	3	Xestión de código único	\N	proxecto-00009-00022	\N	\N	0	85516	\N	\N	0
85518	3	Revisión de formulario de pedidos	\N	proxecto-00009-00023	\N	\N	0	85516	\N	\N	1
1869	3	Módulo de categorización do traballo	\N	proxecto-00001-00001	2010-02-01 00:00:00	\N	3	1868	\N	\N	0
1870	3	Gravación de grupos de horas con criterion requirements en plantillas	\N	proxecto-00001-00005	\N	\N	0	1869	\N	\N	0
1871	3	Aplicar modelo contendo grupos de horas	\N	proxecto-00001-00006	2010-01-27 00:00:00	\N	0	1869	\N	\N	1
1872	3	Permitir elixir entre modelos de ordeline ou orderline dentro dun pedido	\N	proxecto-00001-00002	\N	\N	4	1868	\N	\N	1
1873	3	Módulo de recursos	\N	proxecto-00001-00003	\N	\N	4	1868	\N	\N	2
1874	3	Filtrado por criterios, categorías de custo e datas de activación	\N	proxecto-00001-00007	\N	\N	4	1873	\N	\N	0
1875	3	Amosar máis información dos recursos no listado de recursos	\N	proxecto-00001-00008	\N	\N	4	1873	\N	\N	1
1876	3	Módulo de pedidos	\N	proxecto-00001-00004	\N	\N	4	1868	\N	\N	3
1877	3	Modificar o filtrado de order elements  para que permita por criterios, nome de tarefa e datas	\N	proxecto-00001-00009	\N	\N	4	1876	\N	\N	0
1868	4	Proxecto fin 4º release proxecto	Desc.	proxecto-00001	2010-02-01 00:00:00	2010-02-26 00:00:00	2	\N	\N	\N	\N
6322	35	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	0	6321	\N	\N	0
6323	35	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	0	6321	\N	\N	1
6342	34	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	0	6339	\N	\N	2
90604	6	Pedido probas recursos virtuais	\N	proxecto-00016	2010-01-01 00:00:00	2010-03-16 00:00:00	3	\N	\N	\N	\N
6343	34	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	0	6339	\N	\N	3
6353	33	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	3	6275	\N	\N	4
6354	33	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	0	6353	\N	\N	0
6355	33	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	0	6353	\N	\N	1
6674	32	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	3	6275	\N	\N	5
6675	32	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	0	6674	\N	\N	0
6676	32	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	3	6275	\N	\N	6
3697	9	Pedido 3	asdf	proxecto-00004	2010-02-04 13:36:05.265	2010-02-25 00:00:00	3	\N	\N	\N	\N
3698	8	Tarefa 1	\N	proxecto-00004-00001	\N	\N	0	3697	\N	\N	0
3699	8	Tarefa 2	\N	proxecto-00004-00002	\N	\N	0	3697	\N	\N	1
3700	8	Tarefa 3	\N	proxecto-00004-00003	\N	\N	0	3697	\N	\N	2
6275	39	4º release Navalplan	Desc.	proxecto-00006	2009-12-14 00:00:00	2010-02-17 00:00:00	3	\N	\N	\N	\N
6677	32	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	0	6676	\N	\N	0
6320	35	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	0	6305	\N	\N	2
57216	7	Módulo de materiais	\N	proxecto-00008-00007	\N	\N	3	57193	\N	\N	6
57217	7	Informe de necesidades de materiais	\N	proxecto-00008-00034	\N	\N	0	57216	\N	\N	0
4712	3	Pedido con máquinas	Desc.	proxecto-00005	2010-02-04 20:34:28.037	2010-03-04 00:00:00	3	\N	\N	\N	\N
4713	3	tarefa home	\N	proxecto-00005-00001	\N	\N	0	4712	\N	\N	0
4714	3	tarefa máquina	\N	proxecto-00005-00002	\N	\N	0	4712	\N	\N	1
4715	3	tarefa home-maquina	\N	proxecto-00005-00003	\N	\N	0	4712	\N	\N	2
90605	4	Tarefa 1	\N	proxecto-00016-00001	\N	\N	0	90604	\N	\N	0
90606	4	Tarefa 2	\N	proxecto-00016-00002	\N	\N	0	90604	\N	\N	1
57218	7	Módulo de xestión da calidade	\N	proxecto-00008-00008	\N	\N	3	57193	\N	\N	7
3646	3	Tarefa1	\N	proxecto-00003-00001	\N	\N	0	3255	\N	\N	0
3647	3	Tarefa2	\N	proxecto-00003-00002	\N	\N	0	3255	\N	\N	1
3648	3	Tarefa3	\N	proxecto-00003-00003	\N	\N	0	3255	\N	\N	2
3649	3	Tarefa4	\N	proxecto-00003-00004	\N	\N	0	3255	\N	\N	3
3650	3	Tarefa5	\N	proxecto-00003-00005	\N	\N	0	3255	\N	\N	4
3651	3	Tarefa6	\N	proxecto-00003-00006	\N	\N	0	3255	\N	\N	5
3652	3	Tarefa7	\N	proxecto-00003-00007	\N	\N	0	3255	\N	\N	6
3653	3	Tarefa8	\N	proxecto-00003-00008	\N	\N	0	3255	\N	\N	7
3654	3	Tarefa9	\N	proxecto-00003-00009	\N	\N	0	3255	\N	\N	8
3655	3	Tarefa10	\N	proxecto-00003-00010	\N	\N	0	3255	\N	\N	9
3656	3	Tarefa11	\N	proxecto-00003-00011	\N	\N	0	3255	\N	\N	10
3657	3	Tarefa12	\N	proxecto-00003-00012	\N	\N	0	3255	\N	\N	11
3658	3	Tarefa13	\N	proxecto-00003-00013	\N	\N	0	3255	\N	\N	12
3659	3	Tarefa14	\N	proxecto-00003-00014	\N	\N	0	3255	\N	\N	13
3660	3	Tarefa15	\N	proxecto-00003-00015	\N	\N	0	3255	\N	\N	14
3661	3	Tarefa16	\N	proxecto-00003-00016	\N	\N	0	3255	\N	\N	15
3662	3	Tarefa17	\N	proxecto-00003-00017	\N	\N	0	3255	\N	\N	16
3663	3	Tarefa18	\N	proxecto-00003-00018	\N	\N	0	3255	\N	\N	17
3664	3	Tarefa19	\N	proxecto-00003-00019	\N	\N	0	3255	\N	\N	18
3665	3	Tarefa20	\N	proxecto-00003-00020	\N	\N	0	3255	\N	\N	19
3666	3	Tarefa21	\N	proxecto-00003-00021	\N	\N	0	3255	\N	\N	20
3667	3	Tarefa22	\N	proxecto-00003-00022	\N	\N	0	3255	\N	\N	21
3668	3	Tarefa23	\N	proxecto-00003-00023	\N	\N	0	3255	\N	\N	22
3669	3	Tarefa24	\N	proxecto-00003-00024	\N	\N	0	3255	\N	\N	23
3670	3	Tarefa25	\N	proxecto-00003-00025	\N	\N	0	3255	\N	\N	24
3671	3	Tarefa26	\N	proxecto-00003-00026	\N	\N	0	3255	\N	\N	25
3672	3	Tarefa27	\N	proxecto-00003-00027	\N	\N	0	3255	\N	\N	26
3673	3	Tarefa28	\N	proxecto-00003-00028	\N	\N	0	3255	\N	\N	27
3674	3	Tarefa29	\N	proxecto-00003-00029	\N	\N	0	3255	\N	\N	28
57219	7	Administración de check-lists	\N	proxecto-00008-00035	\N	\N	0	57218	\N	\N	0
57220	7	Cubrir formularios de calidade en planificación	\N	proxecto-00008-00036	\N	\N	0	57218	\N	\N	1
57221	7	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00008-00037	\N	\N	0	57218	\N	\N	2
57222	7	Módulo de integración con subcontratas	\N	proxecto-00008-00009	\N	\N	3	57193	\N	\N	8
57223	7	Administración das subcontratas	\N	proxecto-00008-00038	\N	\N	0	57222	\N	\N	0
6302	36	Xestión de roles	\N	proxecto-00006-00004	\N	\N	0	6300	\N	\N	1
6819	31	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	0	6818	\N	\N	0
6820	31	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	0	6818	\N	\N	1
6821	31	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	0	6818	\N	\N	2
6822	31	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	0	6818	\N	\N	3
6823	31	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	0	6818	\N	\N	4
6824	31	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	0	6818	\N	\N	5
6825	31	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	3	6275	\N	\N	9
6826	31	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	0	6825	\N	\N	0
6827	31	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	0	6825	\N	\N	1
90608	10	Pedido proba virtual pintor	Desc	proxecto-00017	2010-02-16 12:55:16.462	2010-03-16 00:00:00	3	\N	\N	\N	\N
57238	7	Módulo de arquitectura tecnolóxica	\N	proxecto-00008-00012	\N	\N	3	57193	\N	\N	11
57239	7	Desenvolvemento de paquetes debian	\N	proxecto-00008-00051	\N	\N	0	57238	\N	\N	0
57240	7	Enlazar a axuda de usuario	\N	proxecto-00008-00052	\N	\N	0	57238	\N	\N	1
57241	7	Módulo de Documentación da API	\N	proxecto-00008-00013	\N	\N	3	57193	\N	\N	12
57237	7	Imprimir información pantalla do planificador	\N	proxecto-00008-00050	\N	\N	0	57235	\N	\N	1
57242	7	Documentación das APIs públicas	\N	proxecto-00008-00053	\N	\N	0	57241	\N	\N	0
57243	7	Módulo de arquivo histórico	\N	proxecto-00008-00014	\N	\N	3	57193	\N	\N	13
57244	7	Pasar pedidos a histórico	\N	proxecto-00008-00054	\N	\N	0	57243	\N	\N	0
57245	7	Módulo de extracción de informes	\N	proxecto-00008-00015	\N	\N	3	57193	\N	\N	14
57246	7	Integración de JasperRports	\N	proxecto-00008-00055	\N	\N	0	57245	\N	\N	0
57247	7	Informes sobre organizacións de traballo	\N	proxecto-00008-00056	\N	\N	0	57245	\N	\N	1
57248	7	Informes sobre partes de traballo	\N	proxecto-00008-00057	\N	\N	0	57245	\N	\N	2
57249	7	Informes de horas traballadas por un traballador	\N	proxecto-00008-00058	\N	\N	0	57245	\N	\N	3
57250	7	Lista de avances de planificación da empresa	\N	proxecto-00008-00059	\N	\N	0	57245	\N	\N	4
6815	31	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	3	6275	\N	\N	7
6678	32	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	0	6815	\N	\N	0
6816	31	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	0	6815	\N	\N	1
6817	31	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	0	6815	\N	\N	2
6818	31	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	3	6275	\N	\N	8
57251	7	Lista de avances de traballo da empresa	\N	proxecto-00008-00060	\N	\N	0	57245	\N	\N	5
57252	7	Informes de horas estimadas/horas realizadas	\N	proxecto-00008-00061	\N	\N	0	57245	\N	\N	6
57253	7	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00008-00062	\N	\N	0	57245	\N	\N	7
57254	7	Informes de traballador indicando custos por hora	\N	proxecto-00008-00063	\N	\N	0	57245	\N	\N	8
57256	8	Análise	\N	proxecto-00008-00017	\N	\N	0	57193	\N	\N	16
7082	30	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	0	7081	\N	\N	0
7084	30	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	0	7115	\N	\N	2
7080	30	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	0	7115	\N	\N	3
7123	29	Coordinación	\N	proxecto-00006-00063	\N	\N	0	6275	\N	\N	15
7124	29	Análise	\N	proxecto-00006-00064	\N	\N	0	6275	\N	\N	16
90611	8	Tarefa filla 1.2	\N	proxecto-00017-00004	\N	\N	0	90609	\N	\N	1
90612	8	Tarefa raíz 2	\N	proxecto-00017-00002	\N	\N	3	90608	\N	\N	1
90613	8	Tarefa filla 2.1	\N	proxecto-00017-00005	\N	\N	0	90612	\N	\N	0
86192	3	Documentación das APIs públicas	\N	proxecto-00010-00053	\N	\N	0	86191	\N	\N	0
86193	3	Módulo de arquivo histórico	\N	proxecto-00010-00014	\N	\N	3	85840	\N	\N	13
86194	3	Pasar pedidos a histórico	\N	proxecto-00010-00054	\N	\N	0	86193	\N	\N	0
86195	3	Módulo de extracción de informes	\N	proxecto-00010-00015	\N	\N	3	85840	\N	\N	14
86196	3	Integración de JasperRports	\N	proxecto-00010-00055	\N	\N	0	86195	\N	\N	0
86197	3	Informes sobre organizacións de traballo	\N	proxecto-00010-00056	\N	\N	0	86195	\N	\N	1
86198	3	Informes sobre partes de traballo	\N	proxecto-00010-00057	\N	\N	0	86195	\N	\N	2
86199	3	Informes de horas traballadas por un traballador	\N	proxecto-00010-00058	\N	\N	0	86195	\N	\N	3
86200	3	Lista de avances de planificación da empresa	\N	proxecto-00010-00059	\N	\N	0	86195	\N	\N	4
86201	3	Lista de avances de traballo da empresa	\N	proxecto-00010-00060	\N	\N	0	86195	\N	\N	5
86202	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00010-00061	\N	\N	0	86195	\N	\N	6
86203	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00010-00062	\N	\N	0	86195	\N	\N	7
86204	3	Informes de traballador indicando custos por hora	\N	proxecto-00010-00063	\N	\N	0	86195	\N	\N	8
86206	3	Análise	\N	proxecto-00010-00017	\N	\N	0	85840	\N	\N	16
90614	8	Tarefa filla 2.2	\N	proxecto-00017-00006	\N	\N	0	90612	\N	\N	1
7072	30	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	3	6275	\N	\N	10
7073	30	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	0	7072	\N	\N	0
7074	30	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	0	7072	\N	\N	1
7075	30	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	3	6275	\N	\N	11
7076	30	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	0	7075	\N	\N	0
7077	30	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	0	7075	\N	\N	1
7078	30	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	3	6275	\N	\N	12
7079	30	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	0	7078	\N	\N	0
7081	30	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	3	6275	\N	\N	13
90609	8	Tarefa raíz 1	\N	proxecto-00017-00001	\N	\N	3	90608	\N	\N	0
90610	8	Tarefa filla 1.1	\N	proxecto-00017-00003	\N	\N	0	90609	\N	\N	0
57193	8	4º release Navalplan - 2	Desc.	proxecto-00008	2010-02-12 18:21:59.723	2010-04-18 00:00:00	3	\N	56587	\N	\N
57194	7	Módulo de xestión de usuarios	\N	proxecto-00008-00001	\N	\N	3	57193	\N	\N	0
57195	7	Xestión de usuarios	\N	proxecto-00008-00018	\N	\N	0	57194	\N	\N	0
57196	7	Xestión de roles	\N	proxecto-00008-00019	\N	\N	0	57194	\N	\N	1
6830	31	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	0	6825	\N	\N	4
7115	29	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	3	6275	\N	\N	14
7116	29	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	0	7115	\N	\N	0
7117	29	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	0	7115	\N	\N	1
7118	29	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	0	7115	\N	\N	4
85525	3	Técnica de recálculo de asignacións	\N	proxecto-00009-00028	\N	\N	0	85523	\N	\N	1
85526	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00009-00029	\N	\N	0	85523	\N	\N	2
85527	3	Modelos de pedidos e planificación	\N	proxecto-00009-00030	\N	\N	0	85523	\N	\N	3
85528	3	Módulo de asignación de recursos	\N	proxecto-00009-00005	\N	\N	3	85510	\N	\N	4
85529	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00009-00031	\N	\N	0	85528	\N	\N	0
85530	3	Asignación avanzada asignación automática configuración	\N	proxecto-00009-00032	\N	\N	0	85528	\N	\N	1
85531	3	Módulo de partes de traballo	\N	proxecto-00009-00006	\N	\N	3	85510	\N	\N	5
85532	3	Procura de partes de traballo	\N	proxecto-00009-00033	\N	\N	0	85531	\N	\N	0
85533	3	Módulo de materiais	\N	proxecto-00009-00007	\N	\N	3	85510	\N	\N	6
85534	3	Informe de necesidades de materiais	\N	proxecto-00009-00034	\N	\N	0	85533	\N	\N	0
85535	3	Módulo de xestión da calidade	\N	proxecto-00009-00008	\N	\N	3	85510	\N	\N	7
85536	3	Administración de check-lists	\N	proxecto-00009-00035	\N	\N	0	85535	\N	\N	0
85537	3	Cubrir formularios de calidade en planificación	\N	proxecto-00009-00036	\N	\N	0	85535	\N	\N	1
85538	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00009-00037	\N	\N	0	85535	\N	\N	2
85539	3	Módulo de integración con subcontratas	\N	proxecto-00009-00009	\N	\N	3	85510	\N	\N	8
85540	3	Administración das subcontratas	\N	proxecto-00009-00038	\N	\N	0	85539	\N	\N	0
85541	3	Formato de intercambio	\N	proxecto-00009-00039	\N	\N	0	85539	\N	\N	1
85542	3	Fluxo de importación/exportación	\N	proxecto-00009-00040	\N	\N	0	85539	\N	\N	2
85543	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00009-00041	\N	\N	0	85539	\N	\N	3
85544	3	Convertir en fitos as subcontratacións	\N	proxecto-00009-00042	\N	\N	0	85539	\N	\N	4
85545	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00009-00043	\N	\N	0	85539	\N	\N	5
85546	3	Módulo de importación exportación	\N	proxecto-00009-00010	\N	\N	3	85510	\N	\N	9
85749	3	Definir workflow de pedidos para ERP	\N	proxecto-00009-00044	\N	\N	0	85546	\N	\N	0
85750	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00009-00045	\N	\N	0	85546	\N	\N	1
85751	3	Formato de intercambio de información de avance	\N	proxecto-00009-00046	\N	\N	0	85546	\N	\N	2
85752	3	Formato de intercambio de recursos	\N	proxecto-00009-00047	\N	\N	0	85546	\N	\N	3
85753	3	Formato de intercambio de materiais	\N	proxecto-00009-00048	\N	\N	0	85546	\N	\N	4
85754	3	Módulo de presentación	\N	proxecto-00009-00011	\N	\N	3	85510	\N	\N	10
85755	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00009-00049	\N	\N	0	85754	\N	\N	0
85756	3	Imprimir información pantalla do planificador	\N	proxecto-00009-00050	\N	\N	0	85754	\N	\N	1
85757	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00009-00012	\N	\N	3	85510	\N	\N	11
85758	3	Desenvolvemento de paquetes debian	\N	proxecto-00009-00051	\N	\N	0	85757	\N	\N	0
85759	3	Enlazar a axuda de usuario	\N	proxecto-00009-00052	\N	\N	0	85757	\N	\N	1
85760	3	Módulo de Documentación da API	\N	proxecto-00009-00013	\N	\N	3	85510	\N	\N	12
7119	29	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	0	7115	\N	\N	5
7120	29	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	0	7115	\N	\N	6
7121	29	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	0	7115	\N	\N	7
7122	29	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	0	7115	\N	\N	8
57197	7	Xestión de perfiles	\N	proxecto-00008-00020	\N	\N	0	57194	\N	\N	2
85761	3	Documentación das APIs públicas	\N	proxecto-00009-00053	\N	\N	0	85760	\N	\N	0
85762	3	Módulo de arquivo histórico	\N	proxecto-00009-00014	\N	\N	3	85510	\N	\N	13
85763	3	Pasar pedidos a histórico	\N	proxecto-00009-00054	\N	\N	0	85762	\N	\N	0
85764	3	Módulo de extracción de informes	\N	proxecto-00009-00015	\N	\N	3	85510	\N	\N	14
85765	3	Integración de JasperRports	\N	proxecto-00009-00055	\N	\N	0	85764	\N	\N	0
85766	3	Informes sobre organizacións de traballo	\N	proxecto-00009-00056	\N	\N	0	85764	\N	\N	1
85767	3	Informes sobre partes de traballo	\N	proxecto-00009-00057	\N	\N	0	85764	\N	\N	2
85768	3	Informes de horas traballadas por un traballador	\N	proxecto-00009-00058	\N	\N	0	85764	\N	\N	3
85769	3	Lista de avances de planificación da empresa	\N	proxecto-00009-00059	\N	\N	0	85764	\N	\N	4
85770	3	Lista de avances de traballo da empresa	\N	proxecto-00009-00060	\N	\N	0	85764	\N	\N	5
85771	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00009-00061	\N	\N	0	85764	\N	\N	6
85772	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00009-00062	\N	\N	0	85764	\N	\N	7
85773	3	Informes de traballador indicando custos por hora	\N	proxecto-00009-00063	\N	\N	0	85764	\N	\N	8
85774	3	Coordinación	\N	proxecto-00009-00016	\N	\N	0	85510	\N	\N	15
85775	3	Análise	\N	proxecto-00009-00017	\N	\N	0	85510	\N	\N	16
57198	7	Xestión de roles e pedidos	\N	proxecto-00008-00021	\N	\N	0	57194	\N	\N	3
57199	7	Módulo de organizacións de traballo	\N	proxecto-00008-00002	\N	\N	3	57193	\N	\N	1
57200	7	Xestión de código único	\N	proxecto-00008-00022	\N	\N	0	57199	\N	\N	0
57201	7	Revisión de formulario de pedidos	\N	proxecto-00008-00023	\N	\N	0	57199	\N	\N	1
57202	7	Filtrado no listado de pedidos	\N	proxecto-00008-00024	\N	\N	0	57199	\N	\N	2
57203	7	Módulo de xestión de usuarios	\N	proxecto-00008-00003	\N	\N	3	57193	\N	\N	2
57204	7	Recursos Virtuais	\N	proxecto-00008-00025	\N	\N	0	57203	\N	\N	0
57205	7	Recursos Virtuais (Continuación)	\N	proxecto-00008-00026	\N	\N	0	57203	\N	\N	1
57206	7	Módulo de planificación	\N	proxecto-00008-00004	\N	\N	3	57193	\N	\N	3
57207	7	Compartir estado pestañas planificación	\N	proxecto-00008-00027	\N	\N	0	57206	\N	\N	0
57208	7	Técnica de recálculo de asignacións	\N	proxecto-00008-00028	\N	\N	0	57206	\N	\N	1
57209	7	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00008-00029	\N	\N	0	57206	\N	\N	2
85519	3	Filtrado no listado de pedidos	\N	proxecto-00009-00024	\N	\N	0	85516	\N	\N	2
85520	3	Módulo de xestión de usuarios	\N	proxecto-00009-00003	\N	\N	3	85510	\N	\N	2
85521	3	Recursos Virtuais	\N	proxecto-00009-00025	\N	\N	0	85520	\N	\N	0
85522	3	Recursos Virtuais (Continuación)	\N	proxecto-00009-00026	\N	\N	0	85520	\N	\N	1
85523	3	Módulo de planificación	\N	proxecto-00009-00004	\N	\N	3	85510	\N	\N	3
85524	3	Compartir estado pestañas planificación	\N	proxecto-00009-00027	\N	\N	0	85523	\N	\N	0
86208	12	Subcontratación da coordinación	\N	proxecto-00013	2010-04-21 00:00:00	2010-05-05 00:00:00	3	\N	\N	\N	\N
86214	11	Análise	\N	proxecto-00013-00002	2010-04-21 00:00:00	2010-05-01 16:00:00	3	86208	\N	proxecto-00009-00017	0
57210	7	Modelos de pedidos e planificación	\N	proxecto-00008-00030	\N	\N	0	57206	\N	\N	3
57211	7	Módulo de asignación de recursos	\N	proxecto-00008-00005	\N	\N	3	57193	\N	\N	4
57212	7	Interpolación polinómica na asignación avanzada	\N	proxecto-00008-00031	\N	\N	0	57211	\N	\N	0
57213	7	Asignación avanzada asignación automática configuración	\N	proxecto-00008-00032	\N	\N	0	57211	\N	\N	1
86215	11	Planificación	\N	proxecto-00013-00003	\N	\N	0	86214	\N	\N	0
86216	11	Seguimiento	\N	proxecto-00013-00004	\N	2010-04-28 00:00:00	0	86214	\N	\N	1
86217	11	Control de calidad	\N	proxecto-00013-00005	\N	\N	0	86214	\N	\N	2
57214	7	Módulo de partes de traballo	\N	proxecto-00008-00006	\N	\N	3	57193	\N	\N	5
57215	7	Procura de partes de traballo	\N	proxecto-00008-00033	\N	\N	0	57214	\N	\N	0
57224	7	Formato de intercambio	\N	proxecto-00008-00039	\N	\N	0	57222	\N	\N	1
57225	7	Fluxo de importación/exportación	\N	proxecto-00008-00040	\N	\N	0	57222	\N	\N	2
57226	7	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00008-00041	\N	\N	0	57222	\N	\N	3
57227	7	Convertir en fitos as subcontratacións	\N	proxecto-00008-00042	\N	\N	0	57222	\N	\N	4
57228	7	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00008-00043	\N	\N	0	57222	\N	\N	5
57229	7	Módulo de importación exportación	\N	proxecto-00008-00010	\N	\N	3	57193	\N	\N	9
57230	7	Definir workflow de pedidos para ERP	\N	proxecto-00008-00044	\N	\N	0	57229	\N	\N	0
57231	7	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00008-00045	\N	\N	0	57229	\N	\N	1
57232	7	Formato de intercambio de información de avance	\N	proxecto-00008-00046	\N	\N	0	57229	\N	\N	2
57233	7	Formato de intercambio de recursos	\N	proxecto-00008-00047	\N	\N	0	57229	\N	\N	3
57234	7	Formato de intercambio de materiais	\N	proxecto-00008-00048	\N	\N	0	57229	\N	\N	4
57235	7	Módulo de presentación	\N	proxecto-00008-00011	\N	\N	3	57193	\N	\N	10
57236	7	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00008-00049	\N	\N	0	57235	\N	\N	0
57255	7	Coordinación	\N	proxecto-00008-00016	\N	\N	0	57193	\N	\N	15
85840	3	4º release Navalplan - 4	Desc.	proxecto-00010	2010-05-26 00:00:00	2010-07-21 00:00:00	3	\N	56587	\N	\N
85841	3	Módulo de xestión de usuarios	\N	proxecto-00010-00001	\N	\N	3	85840	\N	\N	0
85842	3	Xestión de usuarios	\N	proxecto-00010-00018	\N	\N	0	85841	\N	\N	0
85843	3	Xestión de roles	\N	proxecto-00010-00019	\N	\N	0	85841	\N	\N	1
85844	3	Xestión de perfiles	\N	proxecto-00010-00020	\N	\N	0	85841	\N	\N	2
85845	3	Xestión de roles e pedidos	\N	proxecto-00010-00021	\N	\N	0	85841	\N	\N	3
85846	3	Módulo de organizacións de traballo	\N	proxecto-00010-00002	\N	\N	3	85840	\N	\N	1
85847	3	Xestión de código único	\N	proxecto-00010-00022	\N	\N	0	85846	\N	\N	0
85848	3	Revisión de formulario de pedidos	\N	proxecto-00010-00023	\N	\N	0	85846	\N	\N	1
85849	3	Filtrado no listado de pedidos	\N	proxecto-00010-00024	\N	\N	0	85846	\N	\N	2
86153	3	Módulo de xestión de usuarios	\N	proxecto-00010-00003	\N	\N	3	85840	\N	\N	2
86154	3	Recursos Virtuais	\N	proxecto-00010-00025	\N	\N	0	86153	\N	\N	0
86155	3	Recursos Virtuais (Continuación)	\N	proxecto-00010-00026	\N	\N	0	86153	\N	\N	1
86156	3	Módulo de planificación	\N	proxecto-00010-00004	\N	\N	3	85840	\N	\N	3
86157	3	Compartir estado pestañas planificación	\N	proxecto-00010-00027	\N	\N	0	86156	\N	\N	0
86158	3	Técnica de recálculo de asignacións	\N	proxecto-00010-00028	\N	\N	0	86156	\N	\N	1
86159	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00010-00029	\N	\N	0	86156	\N	\N	2
86160	3	Modelos de pedidos e planificación	\N	proxecto-00010-00030	\N	\N	0	86156	\N	\N	3
86161	3	Módulo de asignación de recursos	\N	proxecto-00010-00005	\N	\N	3	85840	\N	\N	4
86162	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00010-00031	\N	\N	0	86161	\N	\N	0
86163	3	Asignación avanzada asignación automática configuración	\N	proxecto-00010-00032	\N	\N	0	86161	\N	\N	1
86164	3	Módulo de partes de traballo	\N	proxecto-00010-00006	\N	\N	3	85840	\N	\N	5
86165	3	Procura de partes de traballo	\N	proxecto-00010-00033	\N	\N	0	86164	\N	\N	0
86166	3	Módulo de materiais	\N	proxecto-00010-00007	\N	\N	3	85840	\N	\N	6
86167	3	Informe de necesidades de materiais	\N	proxecto-00010-00034	\N	\N	0	86166	\N	\N	0
86168	3	Módulo de xestión da calidade	\N	proxecto-00010-00008	\N	\N	3	85840	\N	\N	7
86169	3	Administración de check-lists	\N	proxecto-00010-00035	\N	\N	0	86168	\N	\N	0
6305	36	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	3	6275	\N	\N	1
90597	3	Subcontrata de integración de informes	\N	proxecto-00015	2010-04-21 00:00:00	\N	4	\N	\N	\N	\N
6306	36	Xestión de código único	\N	proxecto-00006-00007	\N	\N	0	6305	\N	\N	0
6307	36	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	0	6305	\N	\N	1
6339	34	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	3	6275	\N	\N	3
6340	34	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	0	6339	\N	\N	0
6341	34	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	0	6339	\N	\N	1
6828	31	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	0	6825	\N	\N	2
6829	31	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	0	6825	\N	\N	3
6300	36	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	3	6275	\N	\N	0
6301	36	Xestión de usuarios	\N	proxecto-00006-00003	\N	2009-12-15 00:00:00	0	6300	\N	\N	0
6303	36	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	0	6300	\N	\N	2
6304	36	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	0	6300	\N	\N	3
90599	2	Integración de JasperRports	\N	proxecto-00015-00003	2010-04-21 00:00:00	2010-04-21 16:00:00	4	90597	\N	\N	0
90600	2	Caso 1	\N	proxecto-00015-00004	\N	\N	4	90599	\N	\N	0
86170	3	Cubrir formularios de calidade en planificación	\N	proxecto-00010-00036	\N	\N	0	86168	\N	\N	1
86171	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00010-00037	\N	\N	0	86168	\N	\N	2
86172	3	Módulo de integración con subcontratas	\N	proxecto-00010-00009	\N	\N	3	85840	\N	\N	8
86173	3	Administración das subcontratas	\N	proxecto-00010-00038	\N	\N	0	86172	\N	\N	0
86174	3	Formato de intercambio	\N	proxecto-00010-00039	\N	\N	0	86172	\N	\N	1
86175	3	Fluxo de importación/exportación	\N	proxecto-00010-00040	\N	\N	0	86172	\N	\N	2
86176	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00010-00041	\N	\N	0	86172	\N	\N	3
86177	3	Convertir en fitos as subcontratacións	\N	proxecto-00010-00042	\N	\N	0	86172	\N	\N	4
86178	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00010-00043	\N	\N	0	86172	\N	\N	5
86179	3	Módulo de importación exportación	\N	proxecto-00010-00010	\N	\N	3	85840	\N	\N	9
86180	3	Definir workflow de pedidos para ERP	\N	proxecto-00010-00044	\N	\N	0	86179	\N	\N	0
86181	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00010-00045	\N	\N	0	86179	\N	\N	1
86182	3	Formato de intercambio de información de avance	\N	proxecto-00010-00046	\N	\N	0	86179	\N	\N	2
86183	3	Formato de intercambio de recursos	\N	proxecto-00010-00047	\N	\N	0	86179	\N	\N	3
86184	3	Formato de intercambio de materiais	\N	proxecto-00010-00048	\N	\N	0	86179	\N	\N	4
86185	3	Módulo de presentación	\N	proxecto-00010-00011	\N	\N	3	85840	\N	\N	10
86186	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00010-00049	\N	\N	0	86185	\N	\N	0
86187	3	Imprimir información pantalla do planificador	\N	proxecto-00010-00050	\N	\N	0	86185	\N	\N	1
86188	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00010-00012	\N	\N	3	85840	\N	\N	11
86189	3	Desenvolvemento de paquetes debian	\N	proxecto-00010-00051	\N	\N	0	86188	\N	\N	0
86190	3	Enlazar a axuda de usuario	\N	proxecto-00010-00052	\N	\N	0	86188	\N	\N	1
86191	3	Módulo de Documentación da API	\N	proxecto-00010-00013	\N	\N	3	85840	\N	\N	12
86205	3	Coordinación	\N	proxecto-00010-00016	\N	\N	0	85840	\N	\N	15
90601	2	Caso 2	\N	proxecto-00015-00005	\N	\N	4	90599	\N	\N	1
90602	2	Caso 3	\N	proxecto-00015-00006	\N	\N	4	90599	\N	\N	2
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
44787	1	4º release Navalplan	Desc.	proxecto-00006	0	65	4	\N	\N
56587	1	4º release Navalplan	Desc.	proxecto-00006	0	65	3	\N	\N
44788	1	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	4	44787	0
44793	1	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	4	44787	1
44797	1	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	4	44787	2
44800	1	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	4	44787	3
44805	1	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	4	44787	4
44808	1	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	4	44787	5
44810	1	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	4	44787	6
44812	1	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	4	44787	7
44816	1	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	4	44787	8
44823	1	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	4	44787	9
44829	1	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	4	44787	10
44832	1	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	4	44787	11
44835	1	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	4	44787	12
44837	1	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	4	44787	13
44839	1	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	4	44787	14
44950	1	Coordinación	\N	proxecto-00006-00063	\N	\N	4	44787	15
44951	1	Análise	\N	proxecto-00006-00064	\N	\N	4	44787	16
44789	1	Xestión de usuarios	\N	proxecto-00006-00003	\N	\N	4	44788	0
44790	1	Xestión de roles	\N	proxecto-00006-00004	\N	\N	4	44788	1
44791	1	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	4	44788	2
44792	1	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	4	44788	3
44794	1	Xestión de código único	\N	proxecto-00006-00007	\N	\N	4	44793	0
44795	1	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	4	44793	1
44796	1	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	4	44793	2
44798	1	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	4	44797	0
44799	1	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	4	44797	1
44801	1	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	4	44800	0
44802	1	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	4	44800	1
44803	1	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	4	44800	2
44804	1	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	4	44800	3
44806	1	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	4	44805	0
44807	1	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	4	44805	1
44809	1	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	4	44808	0
44811	1	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	4	44810	0
44813	1	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	4	44812	0
44814	1	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	4	44812	1
44815	1	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	4	44812	2
44817	1	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	4	44816	0
44818	1	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	4	44816	1
44819	1	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	4	44816	2
44820	1	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	4	44816	3
44821	1	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	4	44816	4
44822	1	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	4	44816	5
44824	1	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	4	44823	0
44825	1	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	4	44823	1
44826	1	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	4	44823	2
44827	1	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	4	44823	3
44828	1	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	4	44823	4
44830	1	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	4	44829	0
44831	1	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	4	44829	1
44833	1	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	4	44832	0
44834	1	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	4	44832	1
44836	1	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	4	44835	0
44838	1	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	4	44837	0
44840	1	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	4	44839	0
44841	1	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	4	44839	1
44842	1	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	4	44839	2
44843	1	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	4	44839	3
44945	1	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	4	44839	4
44946	1	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	4	44839	5
44947	1	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	4	44839	6
44948	1	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	4	44839	7
44949	1	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	4	44839	8
56588	1	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	3	56587	0
56593	1	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	3	56587	1
56597	1	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	3	56587	2
56600	1	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	3	56587	3
56605	1	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	3	56587	4
56608	1	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	3	56587	5
56610	1	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	3	56587	6
56612	1	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	3	56587	7
56616	1	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	3	56587	8
56623	1	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	3	56587	9
56629	1	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	3	56587	10
56632	1	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	3	56587	11
56635	1	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	3	56587	12
56637	1	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	3	56587	13
56639	1	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	3	56587	14
56649	1	Coordinación	\N	proxecto-00006-00063	\N	\N	0	56587	15
56650	1	Análise	\N	proxecto-00006-00064	\N	\N	0	56587	16
56589	1	Xestión de usuarios	\N	proxecto-00006-00003	\N	\N	0	56588	0
56590	1	Xestión de roles	\N	proxecto-00006-00004	\N	\N	0	56588	1
56591	1	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	0	56588	2
56592	1	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	0	56588	3
56594	1	Xestión de código único	\N	proxecto-00006-00007	\N	\N	0	56593	0
56595	1	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	0	56593	1
56596	1	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	0	56593	2
56598	1	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	0	56597	0
56599	1	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	0	56597	1
56601	1	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	0	56600	0
56602	1	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	0	56600	1
56603	1	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	0	56600	2
56604	1	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	0	56600	3
56606	1	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	0	56605	0
56607	1	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	0	56605	1
56609	1	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	0	56608	0
56611	1	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	0	56610	0
56613	1	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	0	56612	0
56614	1	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	0	56612	1
56615	1	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	0	56612	2
56617	1	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	0	56616	0
56618	1	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	0	56616	1
56619	1	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	0	56616	2
56620	1	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	0	56616	3
56621	1	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	0	56616	4
56622	1	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	0	56616	5
56624	1	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	0	56623	0
56625	1	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	0	56623	1
56626	1	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	0	56623	2
56627	1	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	0	56623	3
56628	1	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	0	56623	4
56630	1	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	0	56629	0
56631	1	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	0	56629	1
56633	1	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	0	56632	0
56634	1	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	0	56632	1
56636	1	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	0	56635	0
56638	1	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	0	56637	0
56640	1	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	0	56639	0
56641	1	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	0	56639	1
56642	1	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	0	56639	2
56643	1	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	0	56639	3
56644	1	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	0	56639	4
56645	1	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	0	56639	5
56646	1	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	0	56639	6
56647	1	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	0	56639	7
56648	1	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	0	56639	8
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
1870	1
1871	1
1872	1
1874	1
1875	1
1877	1
3646	1
3647	1
3648	1
3649	1
3650	1
3651	1
3652	1
3653	1
3654	1
3655	1
3656	1
3657	1
3658	1
3659	1
3660	1
3661	1
3662	1
3663	1
3664	1
3665	1
3666	1
3667	1
3668	1
3669	1
3670	1
3671	1
3672	1
3673	1
3674	1
4713	2
4714	1
4715	2
6301	1
6302	1
6303	1
6304	1
6306	1
6307	1
6320	1
6322	1
6323	1
6340	1
6341	1
6342	1
6343	1
6354	1
6355	1
6675	1
6677	1
6678	1
6816	1
6817	1
6819	1
6820	1
6821	1
6822	1
57208	1
57209	1
57210	1
57212	1
57213	1
57215	1
57217	1
57219	1
57220	1
57221	1
57223	1
57224	1
57225	1
57226	1
57227	1
57228	1
57230	1
57231	1
57232	1
57233	1
57234	1
57236	1
57237	1
57239	1
57240	1
57242	1
57244	1
57246	1
57247	1
57248	1
57195	1
57196	1
57197	1
57198	1
57200	1
57201	1
57202	1
57204	1
57205	1
57207	1
3698	1
3699	1
3700	1
90614	1
86165	1
86167	1
86169	1
86170	1
86171	1
86173	1
86174	1
86175	1
86176	1
86177	1
86178	1
86180	1
86181	1
86182	1
86183	1
86184	1
86186	1
86187	1
86189	1
86190	1
86192	1
86194	1
86196	1
86197	1
86198	1
86199	1
86200	1
86201	1
86202	1
86203	1
86204	1
86205	1
86206	1
85512	1
85513	1
85514	1
85515	1
85517	1
85518	1
85519	1
90601	1
90602	1
6823	1
6824	1
90605	1
90606	1
85842	1
85843	1
85844	1
85845	1
85847	1
85848	1
85849	1
86154	1
86155	1
86157	1
86158	1
86159	1
86160	1
86162	1
86163	1
85521	1
85522	1
85524	1
85525	1
85526	1
85527	1
85529	1
85530	1
85532	1
85534	1
85536	1
85537	1
85538	1
85540	1
85541	1
85542	1
85543	1
85544	1
85545	1
85749	1
85750	1
85751	1
85752	1
85753	1
85755	1
85756	1
85758	1
85759	1
85761	1
85763	1
85765	1
85766	1
85767	1
85768	1
85769	1
85770	1
85771	1
85772	1
85773	1
85774	1
85775	1
6826	1
6827	1
6828	1
6829	1
6830	1
7073	1
7074	1
7076	1
7077	1
7079	1
7082	1
7116	1
7117	1
7084	1
7080	1
7118	1
86215	1
86216	1
86217	1
7119	1
90600	1
7120	1
90610	1
90611	1
90613	1
57249	1
57250	1
57251	1
57252	1
57253	1
57254	1
57255	1
57256	1
7121	1
7122	1
7123	1
7124	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
1868
1869
1873
1876
3255
3697
4712
6275
6300
6305
6321
6339
6353
6674
6676
6815
6818
6825
7072
7075
7078
7081
7115
57193
57194
57199
57203
57206
57211
57214
57216
57218
57222
57229
57235
57238
57241
57243
57245
85510
85511
85516
85520
85523
85528
85531
85533
85535
85539
85546
85754
85757
85760
85762
85764
85840
85841
85846
86153
86156
86161
86164
86166
86168
86172
86179
86185
86188
86191
86193
86195
86208
86214
90597
90599
90604
90608
90609
90612
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
44787
44788
44793
44797
44800
44805
44808
44810
44812
44816
44823
44829
44832
44835
44837
44839
56587
56588
56593
56597
56600
56605
56608
56610
56612
56616
56623
56629
56632
56635
56637
56639
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, workhours, lasthoursgroupsequencecode) FROM stdin;
44789	8	\N
44790	16	\N
44791	16	\N
44792	40	\N
44794	24	\N
44795	56	\N
44796	8	\N
44798	40	\N
44799	8	\N
44801	24	\N
44802	48	\N
44803	28	\N
44804	120	\N
44806	24	\N
44807	40	\N
44809	40	\N
44811	40	\N
44813	48	\N
44814	32	\N
44815	32	\N
44817	64	\N
44818	16	\N
44819	32	\N
44820	40	\N
44821	16	\N
44822	32	\N
44824	15	\N
44825	48	\N
44826	40	\N
44827	24	\N
44828	32	\N
44830	64	\N
44831	96	\N
44833	32	\N
44834	40	\N
44836	40	\N
44838	32	\N
44840	16	\N
44841	24	\N
44842	24	\N
44843	24	\N
44945	24	\N
44946	24	\N
44947	24	\N
44948	24	\N
44949	24	\N
44950	254	\N
44951	256	\N
56589	8	\N
56590	16	\N
56591	16	\N
56592	40	\N
56594	24	\N
56595	56	\N
56596	8	\N
56598	40	\N
56599	8	\N
56601	24	\N
56602	48	\N
56603	28	\N
56604	120	\N
56606	24	\N
56607	40	\N
56609	40	\N
56611	40	\N
56613	48	\N
56614	32	\N
56615	32	\N
56617	64	\N
56618	16	\N
56619	32	\N
56620	40	\N
56621	16	\N
56622	32	\N
56624	15	\N
56625	48	\N
56626	40	\N
56627	24	\N
56628	32	\N
56630	64	\N
56631	96	\N
56633	32	\N
56634	40	\N
56636	40	\N
56638	32	\N
56640	16	\N
56641	24	\N
56642	24	\N
56643	24	\N
56644	24	\N
56645	24	\N
56646	24	\N
56647	24	\N
56648	24	\N
56649	256	\N
56650	256	\N
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	4	PREFIX	1	5	f
607	20	proxecto	18	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
44787	307
56587	307
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
106959	1	Formulario de calidade para tarefas de tipo A	Desc.	0	t	106858
113221	1	Formulario de calidade para tarefas de tipo B		1	f	\N
113222	3	Formulario de calidade para tarefas de tipo C		0	t	113322
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
106959	¿Levaches a cabo o proceso A?	10.00	0	0
106959	¿Levaches a cabo o proceso B?	25.00	1	1
106959	¿Levaches a cabo o proceso C?	50.00	2	2
106959	¿Levaches a cabo o proceso D?	75.00	3	3
106959	¿Levaches a cabo o proceso E?	100.00	4	4
113221	Paso 1.	25.00	0	0
113221	Paso 2.	25.00	1	1
113221	Paso 3.	25.00	2	2
113221	Paso 4.	25.00	3	3
113222	¿Fíxose tarefa 1?	30.00	0	0
113222	¿Fíxose tarefa 2?	45.00	1	1
113222	¿Fíxose tarefa 3?	70.00	2	2
113222	¿Fíxose tarefa 4?	100.00	3	3
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, base_calendar_id, code) FROM stdin;
90904	23	91002	389a5a9b-512d-4c4d-9feb-9ed84ab5ce36
90906	23	91003	326c9e07-7918-4ecc-b611-735892d8eb1a
1232	2	318	1232
1234	3	319	1234
1236	2	320	1236
1217	6	311	1217
1230	2	317	1230
1222	3	313	1222
1220	5	312	1220
1214	4	310	1214
1228	2	316	1228
1224	2	314	1224
1239	4	321	1239
90901	4	91001	676cc545-8a05-44b1-a77f-576241d2faf2
1226	5	315	1226
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
2527	3	1.00	2424	\N
3063	1	1.00	3868	\N
3032	0	0.75	2425	\N
3064	1	2.00	3869	\N
3066	0	0.50	3870	\N
3069	2	1.00	3872	\N
3070	2	1.00	3872	\N
5051	0	1.00	3873	\N
97580	13	2.00	97370	\N
97581	13	2.00	97371	112719
3053	2	1.00	3843	\N
3054	2	1.00	3842	\N
3043	4	1.00	3850	\N
3044	4	1.00	3849	\N
3045	4	1.00	3838	\N
3056	1	1.00	3844	\N
3046	4	1.00	3845	\N
3047	4	1.00	3841	\N
3050	3	1.00	3840	\N
3048	4	1.00	3839	\N
3059	0	1.00	3846	\N
3060	0	1.00	3847	\N
97567	4	1.75	97365	\N
97566	4	4.00	97364	\N
58456	8	1.00	56260	\N
58458	8	1.00	56292	\N
58459	8	1.00	56293	\N
58460	8	1.00	56294	\N
60793	3	0.20	56295	\N
60794	3	0.10	56296	\N
60758	4	1.00	56281	\N
60795	3	1.00	56282	\N
60706	5	1.00	56283	\N
60755	4	1.00	56306	\N
60751	4	1.00	56274	\N
60703	5	1.00	56275	\N
89399	1	1.00	86383	\N
89400	1	1.00	86383	\N
89401	1	1.00	86383	\N
89402	1	1.00	86384	\N
89403	1	1.00	86384	\N
89404	1	1.00	86384	\N
89405	1	0.70	86385	\N
86460	3	0.94	85407	88072
58472	6	1.00	56301	\N
58457	8	1.00	56302	\N
68413	2	0.75	56318	\N
60790	3	1.00	56277	\N
58468	7	1.00	56298	\N
58469	7	1.00	56299	\N
86458	1	1.00	57493	\N
68414	2	0.75	56319	\N
60752	4	1.00	56269	\N
60753	4	1.00	56270	\N
60754	4	1.00	56271	\N
60705	5	1.00	56272	\N
60791	3	1.00	56285	\N
58450	8	1.00	56286	\N
58451	8	1.00	56287	\N
58452	8	1.00	56288	\N
58453	8	1.00	56289	\N
58454	8	1.00	56290	\N
58383	9	1.00	56257	\N
97578	13	2.00	97367	\N
97579	13	2.00	97368	\N
58384	9	1.00	56258	\N
58455	8	1.00	56259	\N
58470	7	1.00	56266	\N
60704	5	1.00	56267	\N
58461	8	1.00	56262	\N
60756	4	1.00	56263	\N
60757	4	1.00	56264	\N
68415	2	1.00	56308	\N
68416	2	1.00	56309	\N
68417	2	1.00	56310	\N
68418	2	1.00	56311	\N
68419	2	1.00	56312	\N
68420	2	1.00	56313	\N
68421	2	1.00	56314	\N
68422	2	1.00	56315	\N
68423	2	1.00	56316	\N
60792	3	1.00	56304	\N
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
304	1
318	1
319	1
320	1
311	1
317	1
313	1
312	1
310	1
316	1
314	1
321	3
91002	1
91003	3
91001	2
315	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, initdate, enddate, cost_category_id, resource_id, code) FROM stdin;
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
3032	1230
3059	1217
3060	1226
3053	1224
3054	1214
3043	1220
3044	1226
3045	1214
3056	1230
3046	1228
3047	1214
3050	1228
3048	1230
5051	1236
89399	1226
89400	1217
89401	1222
89402	1220
89403	1228
89404	1224
89405	1224
86460	1226
60793	1217
60794	1217
86458	1220
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
88072	2010-06-05	1.00	1.00	0
106153	2010-03-07	0.30	0.10	0
106153	2010-03-09	0.40	0.15	1
106153	2010-03-11	0.60	0.25	2
106153	2010-03-17	1.00	1.00	3
112717	2010-03-04	0.15	0.05	0
112717	2010-03-06	0.30	0.15	1
112717	2010-03-10	0.60	0.40	2
112717	2010-03-16	1.00	1.00	3
112719	2010-03-06	0.20	0.05	0
112719	2010-03-09	0.40	0.20	1
112719	2010-03-11	0.60	0.40	2
112719	2010-03-17	1.00	1.00	3
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
88072	0
106153	1
112717	1
112719	1
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, task_element_id, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
28508162	4	2021	85408	2010-02-15 17:51:06.094	2010-02-15 18:02:07.281	Subcontratación da coordinación	100000.00	\N	t	t	t	t	2
29327361	3	2021	85397	2010-02-16 09:25:43.689	2010-02-16 09:27:25.023	Subcontrata de integración de informes	10000.00	CODE-1	f	t	t	t	2
33849345	6	2021	57494	2010-02-16 15:56:30.687	2010-02-16 15:58:37.807	Desc	100000.00	\N	\N	t	t	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
3863	1	0	\N	\N
3860	1	0	\N	\N
3843	1	0	\N	\N
3851	1	0	\N	\N
3842	1	0	\N	\N
3850	1	0	\N	\N
2424	1	1	2010-02-01 00:00:00	\N
2425	1	1	2010-01-27 00:00:00	\N
3849	1	0	\N	\N
3861	1	0	\N	\N
3853	1	0	\N	\N
3848	1	0	\N	\N
3838	1	0	\N	\N
3844	1	0	\N	\N
3856	1	0	\N	\N
3859	1	0	\N	\N
3866	1	0	\N	\N
3846	1	0	\N	\N
3862	1	0	\N	\N
3865	1	0	\N	\N
3845	1	0	\N	\N
3855	1	0	\N	\N
3857	1	0	\N	\N
3854	1	0	\N	\N
3841	1	0	\N	\N
3847	1	0	\N	\N
3852	1	0	\N	\N
3840	1	0	\N	\N
3864	1	0	\N	\N
3858	1	0	\N	\N
3839	1	0	\N	\N
3874	1	0	\N	\N
3873	1	0	\N	\N
3872	1	0	\N	\N
56257	1	0	\N	\N
85410	1	0	\N	\N
85411	1	0	\N	\N
85412	1	0	\N	\N
85413	1	0	\N	\N
85415	1	0	\N	\N
85416	1	0	\N	\N
85417	1	0	\N	\N
56258	1	0	\N	\N
56259	1	0	\N	\N
56260	1	0	\N	\N
56262	1	0	\N	\N
56263	1	0	\N	\N
56264	1	0	\N	\N
56333	1	0	\N	\N
56334	1	0	\N	\N
56335	1	0	\N	\N
56336	1	0	\N	\N
56338	1	0	\N	\N
56339	1	0	\N	\N
56349	1	0	\N	\N
56350	1	0	\N	\N
56351	1	0	\N	\N
56352	1	0	\N	\N
56353	1	0	\N	\N
56354	1	0	\N	\N
57476	1	0	\N	\N
85419	1	0	\N	\N
85420	1	0	\N	\N
57477	1	0	\N	\N
57479	1	0	\N	\N
57493	1	0	\N	\N
3868	1	0	\N	\N
3869	1	0	\N	\N
3870	1	0	\N	\N
85422	1	0	\N	\N
85423	1	0	\N	\N
85424	1	0	\N	\N
85425	1	0	\N	\N
85427	1	0	\N	\N
85428	1	0	\N	\N
85430	1	0	\N	\N
97367	1	0	\N	\N
97368	1	1	2010-02-24 00:00:00	\N
97370	1	0	\N	\N
97371	2	1	2010-02-24 00:00:00	\N
85432	1	0	\N	\N
85434	1	0	\N	\N
85435	1	0	\N	\N
85436	1	0	\N	\N
85438	1	0	\N	\N
85439	1	0	\N	\N
85440	1	0	\N	\N
85441	1	0	\N	\N
85442	1	0	\N	\N
85443	1	0	\N	\N
85445	1	0	\N	\N
86355	1	0	\N	\N
86356	1	0	\N	\N
85397	1	2	2010-04-21 00:00:00	29327361
56321	1	0	\N	\N
56322	1	0	\N	\N
56323	1	0	\N	\N
56324	1	0	\N	\N
56326	1	0	\N	\N
56327	1	0	\N	\N
56328	1	0	\N	\N
56330	1	0	\N	\N
56331	1	0	\N	\N
56341	1	0	\N	\N
86357	1	0	\N	\N
85376	1	0	\N	\N
85377	1	0	\N	\N
85378	1	0	\N	\N
85379	1	0	\N	\N
86358	1	0	\N	\N
86360	1	0	\N	\N
86361	1	0	\N	\N
86363	1	0	\N	\N
86364	1	0	\N	\N
86366	1	0	\N	\N
86368	1	0	\N	\N
86370	1	0	\N	\N
86371	1	0	\N	\N
86372	1	0	\N	\N
86373	1	0	\N	\N
86374	1	0	\N	\N
86375	1	0	\N	\N
86376	1	0	\N	\N
86377	1	0	\N	\N
86378	1	0	\N	\N
86380	1	0	\N	\N
86381	1	0	\N	\N
56343	1	0	\N	\N
56345	1	0	\N	\N
56346	1	0	\N	\N
56347	1	0	\N	\N
56356	1	0	\N	\N
56357	1	0	\N	\N
57469	1	0	\N	\N
57470	1	0	\N	\N
57471	1	0	\N	\N
57473	1	0	\N	\N
57474	1	0	\N	\N
57481	1	0	\N	\N
57483	1	0	\N	\N
57484	1	0	\N	\N
57485	1	0	\N	\N
56266	1	0	\N	\N
56267	1	0	\N	\N
56269	1	0	\N	\N
56270	1	0	\N	\N
56271	1	0	\N	\N
56272	1	0	\N	\N
56274	1	0	\N	\N
56275	1	1	2009-12-14 00:00:00	\N
56277	1	0	\N	\N
56279	1	0	\N	\N
56281	1	0	\N	\N
56282	1	0	\N	\N
57486	1	0	\N	\N
57487	1	0	\N	\N
57488	1	0	\N	\N
57489	1	0	\N	\N
57490	1	0	\N	\N
57491	1	0	\N	\N
57494	1	2	2010-02-12 18:21:59.723	33849345
56283	1	0	\N	\N
56285	1	0	\N	\N
56286	1	0	\N	\N
56287	1	0	\N	\N
56288	1	0	\N	\N
56289	1	0	\N	\N
56290	1	0	\N	\N
56292	1	0	\N	\N
56293	1	0	\N	\N
85408	1	2	2010-04-21 00:00:00	28508162
85355	1	0	\N	\N
86383	1	1	2010-04-21 00:00:00	\N
86384	1	1	2010-04-21 00:00:00	\N
86385	2	1	2010-04-21 00:00:00	\N
85356	1	0	\N	\N
85351	1	0	\N	\N
85352	1	0	\N	\N
85353	1	0	\N	\N
85370	1	0	\N	\N
56294	1	0	\N	\N
56295	1	0	\N	\N
56296	1	0	\N	\N
85371	1	0	\N	\N
56298	1	0	\N	\N
56299	1	0	\N	\N
56301	1	0	\N	\N
56302	1	0	\N	\N
85372	1	0	\N	\N
85374	1	0	\N	\N
85375	1	0	\N	\N
85398	1	0	\N	\N
85399	1	0	\N	\N
85400	1	0	\N	\N
85401	1	0	\N	\N
85402	1	0	\N	\N
85403	1	0	\N	\N
85404	1	0	\N	\N
85405	1	0	\N	\N
85358	1	0	\N	\N
85359	1	0	\N	\N
85360	1	0	\N	\N
85361	1	0	\N	\N
85366	1	0	\N	\N
85407	1	0	\N	\N
85395	1	0	\N	\N
85393	1	0	\N	\N
56304	1	0	\N	\N
56306	1	0	\N	\N
56308	1	0	\N	\N
56309	1	0	\N	\N
56310	1	0	\N	\N
56311	1	0	\N	\N
56312	1	0	\N	\N
56313	1	0	\N	\N
56314	1	0	\N	\N
56315	1	0	\N	\N
56316	1	0	\N	\N
56318	1	0	\N	\N
56319	1	0	\N	\N
85346	1	0	\N	\N
85347	1	0	\N	\N
85348	1	0	\N	\N
85349	1	0	\N	\N
85390	1	0	\N	\N
85391	1	0	\N	\N
85387	1	0	\N	\N
85388	1	0	\N	\N
85381	1	0	\N	\N
85382	1	0	\N	\N
85383	1	0	\N	\N
85384	1	0	\N	\N
85385	1	0	\N	\N
85368	1	0	\N	\N
85363	1	0	\N	\N
85364	1	0	\N	\N
97365	1	0	\N	\N
97364	1	0	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
107061	5	106959	90614	t
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
107061	¿Levaches a cabo o proceso C?	50.00	2	f	\N	2
107061	¿Levaches a cabo o proceso D?	75.00	3	f	\N	3
107061	¿Levaches a cabo o proceso E?	100.00	4	f	\N	4
107061	¿Levaches a cabo o proceso A?	10.00	0	t	2010-02-09 00:00:00	0
107061	¿Levaches a cabo o proceso B?	25.00	1	t	2010-02-17 00:00:00	1
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
2424	2139
2425	2140
3838	3622
3839	3623
3840	3624
3841	3625
3842	3626
3843	3627
3844	3628
3845	3629
3846	3630
3847	3631
3848	3632
3849	3633
3850	3634
3851	3635
3852	3737
3853	3738
3854	3739
3855	3740
3856	3741
3857	3742
3858	3743
3859	3744
3860	3745
3861	3746
3862	3747
3863	3748
3864	3749
3865	3750
3866	3751
97367	90704
97368	90705
97370	90706
97371	90707
3868	3761
3869	3762
3870	3763
3872	4866
3872	4865
3873	4867
3874	4868
3874	4869
86383	86046
86384	86047
86385	86048
97364	90702
97365	90703
56257	6583
56258	6584
56259	6585
56260	6586
56262	6587
56263	6588
56264	6598
56266	6599
56267	6600
56269	6613
56270	6614
56271	6615
56272	6616
56274	6623
56275	6624
56277	6634
56279	6635
56281	6636
56282	6907
56283	6908
56285	6909
56286	6910
56287	6911
56288	6912
56289	6913
56290	6914
56292	6915
56293	6916
56294	6917
56295	6918
56296	6919
56298	6947
56299	6948
56301	6949
56302	6950
56304	6951
56306	6953
56308	7185
56309	7186
56310	6955
56311	6952
56312	7187
56313	7188
56314	7189
56315	7190
56316	7191
56318	7192
56319	7193
85346	85595
85347	85596
85348	85597
85349	85598
85351	85599
85352	85600
85353	85601
85355	85602
85356	85603
85358	85604
85359	85605
85360	85606
85361	85607
85363	85608
85364	85609
85366	85610
85368	85611
85370	85612
85371	85613
85372	85614
85374	85615
85375	85616
85376	85617
85377	85618
85378	85619
85379	85620
85381	85621
85382	85622
85383	85623
85384	85624
85385	85625
85387	85626
85388	85627
85390	85628
85391	85629
85393	85630
85395	85631
85397	85632
85398	85633
85399	85634
85400	85635
85401	85636
85402	85637
85403	85638
85404	85639
85405	85640
85407	85641
56321	57060
56322	57061
56323	57062
56324	57063
56326	57064
56327	57267
56328	57268
56330	57269
56331	57270
56333	57271
56334	57272
56335	57273
56336	57274
56338	57275
56339	57276
56341	57277
56343	57278
56345	57279
56346	57280
56347	57281
56349	57282
56350	57283
56351	57284
56352	57285
56353	57286
56354	57287
56356	57288
56357	57289
57469	57290
57470	57291
57471	57292
57473	57293
57474	57294
57476	57295
57477	57296
57479	57297
57481	57298
57483	57299
57484	57300
57485	57301
57486	57302
57487	57303
57488	57304
57489	57305
57490	57306
57491	57307
57493	57308
57494	57309
85410	85994
85411	85995
85412	85996
85413	85997
85415	85998
85416	85999
85417	86000
85419	86001
85420	86002
85422	86003
85423	86004
85424	86005
85425	86006
85427	86007
85428	86008
85430	86009
85432	86010
85434	86011
85435	86012
85436	86013
85438	86014
85439	86015
85440	86016
85441	86017
85442	86018
85443	86019
85445	86020
86355	86021
86356	86022
86357	86023
86358	86024
86360	86025
86361	86026
86363	86027
86364	86028
86366	86029
86368	86030
86370	86031
86371	86032
86372	86033
86373	86034
86374	86035
86375	86036
86376	86037
86377	86038
86378	86039
86380	86040
86381	86041
85408	85642
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
3857	6	Tarefa20	\N	2010-02-04 12:10:40.245	2010-02-05 22:10:40.245	\N	3867	\N	19
3854	6	Tarefa17	\N	2010-02-04 12:10:40.245	2010-02-04 20:10:40.245	\N	3867	\N	16
3841	6	Tarefa4	\N	2010-02-10 12:10:40.245	2010-02-20 12:10:40.245	\N	3867	\N	3
3847	6	Tarefa10	\N	2010-02-11 12:10:40.245	2010-02-17 12:10:40.245	\N	3867	\N	9
3852	6	Tarefa15	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	14
3840	6	Tarefa3	\N	2010-03-03 12:10:40.245	2010-03-10 12:10:40.245	\N	3867	\N	2
3858	6	Tarefa21	\N	2010-02-04 12:10:40.245	2010-02-06 07:10:40.245	\N	3867	\N	20
3839	6	Tarefa2	\N	2010-02-24 12:10:40.245	2010-03-03 12:10:40.245	\N	3867	\N	1
3867	6	Pedido 2	\N	2010-02-04 12:10:40.245	2010-03-10 12:10:40.245	2010-11-25	\N	\N	\N
2426	5	Módulo de categorización do traballo	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	\N	2427	\N	0
2424	5	Gravación de grupos de horas con criterion requirements en plantillas	\N	2010-02-01 00:00:00	2010-02-03 00:00:00	\N	2426	\N	0
2425	5	Aplicar modelo contendo grupos de horas	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	\N	2426	\N	1
2427	5	Proxecto fin 4º release proxecto	\N	2010-02-01 00:00:00	2010-02-04 00:00:00	2010-02-26	\N	\N	\N
85408	6	Análise	\N	2010-04-21 00:00:00	2010-05-01 16:00:00	\N	85409	\N	16
85386	6	Módulo de importación exportación	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	9
3874	5	tarefa home-maquina	\N	2010-02-04 20:34:28.037	2010-02-13 04:34:28.037	\N	3875	\N	2
3873	5	tarefa máquina	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	\N	3875	\N	1
3872	5	tarefa home	\N	2010-02-04 20:34:28.037	2010-02-11 20:34:28.037	\N	3875	\N	0
3875	6	Pedido con máquinas	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	2010-03-04	\N	\N	\N
3860	6	Tarefa23	\N	2010-02-04 12:10:40.245	2010-02-07 10:10:40.245	\N	3867	\N	22
3843	6	Tarefa6	\N	2010-02-26 12:10:40.245	2010-03-02 12:10:40.245	\N	3867	\N	5
3851	6	Tarefa14	\N	2010-02-04 12:10:40.245	2010-02-05 09:10:40.245	\N	3867	\N	13
57475	18	Módulo de presentación	\N	2010-02-14 10:21:59.723	2010-02-21 02:21:59.723	\N	57495	\N	10
57478	18	Módulo de arquitectura tecnolóxica	\N	2010-02-25 01:21:59.723	2010-02-28 01:21:59.723	\N	57495	\N	11
57482	18	Módulo de arquivo histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57495	\N	13
57495	18	4º release Navalplan - 2	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	2010-04-18	\N	\N	\N
56273	46	Módulo de planificación	\N	2009-12-22 00:00:00	2010-02-09 00:00:00	\N	56320	\N	3
56276	46	Módulo de asignación de recursos	\N	2009-12-14 00:00:00	2010-01-30 00:00:00	\N	56320	\N	4
56278	46	Módulo de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56320	\N	5
3842	6	Tarefa5	\N	2010-02-20 12:10:40.245	2010-02-26 12:10:40.245	\N	3867	\N	4
3850	6	Tarefa13	\N	2010-02-04 12:10:40.245	2010-02-24 12:10:40.245	\N	3867	\N	12
3849	6	Tarefa12	\N	2010-02-23 12:10:40.245	2010-03-04 12:10:40.245	\N	3867	\N	11
3861	6	Tarefa24	\N	2010-02-04 12:10:40.245	2010-02-06 14:10:40.245	\N	3867	\N	23
3853	6	Tarefa16	\N	2010-02-04 12:10:40.245	2010-02-05 00:10:40.245	\N	3867	\N	15
3848	6	Tarefa11	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	10
3838	6	Tarefa1	\N	2010-02-04 12:10:40.245	2010-02-10 12:10:40.245	\N	3867	\N	0
3844	6	Tarefa7	\N	2010-02-04 12:10:40.245	2010-02-06 12:10:40.245	\N	3867	\N	6
3856	6	Tarefa19	\N	2010-02-04 12:10:40.245	2010-02-05 14:10:40.245	\N	3867	\N	18
3859	6	Tarefa22	\N	2010-02-04 12:10:40.245	2010-02-07 05:10:40.245	\N	3867	\N	21
3846	6	Tarefa9	\N	2010-02-06 12:10:40.245	2010-02-11 12:10:40.245	\N	3867	\N	8
3862	6	Tarefa25	\N	2010-02-04 12:10:40.245	2010-02-07 10:10:40.245	\N	3867	\N	24
3845	6	Tarefa8	\N	2010-02-20 12:10:40.245	2010-02-23 12:10:40.245	\N	3867	\N	7
3855	6	Tarefa18	\N	2010-02-04 12:10:40.245	2010-02-05 12:10:40.245	\N	3867	\N	17
56280	46	Módulo de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56320	\N	6
56284	46	Módulo de xestión da calidade	\N	2009-12-14 00:00:00	2010-01-16 00:00:00	\N	56320	\N	7
56291	46	Módulo de integración con subcontratas	\N	2009-12-26 00:00:00	2010-01-26 00:00:00	\N	56320	\N	8
56297	46	Módulo de importación exportación	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	\N	56320	\N	9
56300	46	Módulo de presentación	\N	2009-12-19 00:00:00	2010-01-16 00:00:00	\N	56320	\N	10
56303	46	Módulo de arquitectura tecnolóxica	\N	2009-12-16 00:00:00	2009-12-29 00:00:00	\N	56320	\N	11
56307	46	Módulo de arquivo histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56320	\N	13
57484	13	Informes sobre organizacións de traballo	\N	2010-02-16 10:21:59.723	2010-02-17 10:21:59.723	\N	57492	\N	1
3863	6	Tarefa26	\N	2010-02-04 12:10:40.245	2010-02-07 20:10:40.245	\N	3867	\N	25
3866	6	Tarefa29	\N	2010-02-04 12:10:40.245	2010-02-17 00:10:40.245	\N	3867	\N	28
3865	6	Tarefa28	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	27
3864	6	Tarefa27	\N	2010-02-04 12:10:40.245	2010-02-08 16:10:40.245	\N	3867	\N	26
57485	13	Informes sobre partes de traballo	\N	2010-02-17 10:21:59.723	2010-02-18 10:21:59.723	\N	57492	\N	2
57486	13	Informes de horas traballadas por un traballador	\N	2010-02-18 10:21:59.723	2010-02-19 10:21:59.723	\N	57492	\N	3
57494	14	Análise	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	16
56325	18	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-16 02:21:59.723	\N	57495	\N	0
57492	18	Módulo de extracción de informes	\N	2010-02-14 10:21:59.723	2010-02-22 10:21:59.723	\N	57495	\N	14
86386	20	Análise	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-01	86387	\N	0
86387	20	Subcontratación da coordinación	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-05	\N	\N	\N
3868	8	Tarefa 1	\N	2010-02-04 13:36:05.265	2010-02-24 13:36:05.265	\N	3871	\N	0
3869	8	Tarefa 2	\N	2010-02-24 13:36:05.265	2010-03-13 13:36:05.265	\N	3871	\N	1
3870	8	Tarefa 3	\N	2010-02-04 13:36:05.265	2010-03-12 13:36:05.265	\N	3871	\N	2
56321	13	Xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-13 02:21:59.723	\N	56325	\N	0
56322	13	Xestión de roles	\N	2010-02-13 02:21:59.723	2010-02-13 18:21:59.723	\N	56325	\N	1
56323	13	Xestión de perfiles	\N	2010-02-13 18:21:59.723	2010-02-14 10:21:59.723	\N	56325	\N	2
56290	32	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-01-20 00:00:00	2010-01-26 00:00:00	\N	56291	\N	5
56324	13	Xestión de roles e pedidos	\N	2010-02-14 10:21:59.723	2010-02-16 02:21:59.723	\N	56325	\N	3
56305	46	Módulo de Documentación da API	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56320	\N	12
3871	13	Pedido 3	\N	2010-02-04 13:36:05.265	2010-03-13 13:36:05.265	2010-02-25	\N	\N	\N
86383	12	Planificación	\N	2010-04-21 00:00:00	2010-04-28 00:00:00	\N	86386	\N	0
57474	13	Imprimir información pantalla do planificador	\N	2010-02-14 10:21:59.723	2010-02-18 10:21:59.723	\N	57475	\N	1
57483	13	Integración de JasperRports	\N	2010-02-15 18:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	0
86384	14	Seguimiento	\N	2010-04-28 00:00:00	2010-05-05 00:00:00	2010-04-28	86386	\N	1
86385	12	Control de calidad	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	\N	86386	\N	2
56258	32	Xestión de roles	\N	2009-12-15 00:00:00	2009-12-17 00:00:00	\N	56261	\N	1
85355	5	Recursos Virtuais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85357	\N	0
56271	32	Filtrado de pedidos e tarefas de un pedido	\N	2010-01-02 00:00:00	2010-01-08 00:00:00	\N	56273	\N	2
56272	32	Modelos de pedidos e planificación	\N	2009-12-22 00:00:00	2010-01-12 00:00:00	\N	56273	\N	3
56259	32	Xestión de perfiles	\N	2009-12-17 00:00:00	2009-12-19 00:00:00	\N	56261	\N	2
56277	32	Procura de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56278	\N	0
56279	32	Informe de necesidades de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56280	\N	0
56281	32	Administración de check-lists	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56284	\N	0
85356	5	Recursos Virtuais (Continuación)	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85357	\N	1
85351	5	Xestión de código único	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85354	\N	0
85352	5	Revisión de formulario de pedidos	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85354	\N	1
56282	32	Cubrir formularios de calidade en planificación	\N	2009-12-22 00:00:00	2009-12-26 00:00:00	\N	56284	\N	1
56293	32	Formato de intercambio de pedidos e elementos de pedidos	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56297	\N	1
56294	32	Formato de intercambio de información de avance	\N	2009-12-25 00:00:00	2010-01-01 00:00:00	\N	56297	\N	2
56295	32	Formato de intercambio de recursos	\N	2009-12-14 00:00:00	2009-12-30 00:00:00	\N	56297	\N	3
56296	32	Formato de intercambio de materiais	\N	2009-12-30 00:00:00	2010-02-12 00:00:00	\N	56297	\N	4
56298	32	Imprimir o diagrama de Gantt en varias páxinas	\N	2009-12-19 00:00:00	2009-12-31 00:00:00	\N	56300	\N	0
56299	32	Imprimir información pantalla do planificador	\N	2009-12-31 00:00:00	2010-01-16 00:00:00	\N	56300	\N	1
56301	32	Desenvolvemento de paquetes debian	\N	2009-12-23 00:00:00	2009-12-29 00:00:00	\N	56303	\N	0
85353	5	Filtrado no listado de pedidos	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85354	\N	2
85375	5	Formato de intercambio	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	1
85358	5	Compartir estado pestañas planificación	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85362	\N	0
85346	5	Xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85350	\N	0
85347	5	Xestión de roles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	1
85348	5	Xestión de perfiles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	2
85349	5	Xestión de roles e pedidos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85350	\N	3
85409	6	4º release Navalplan - 3	\N	2010-04-21 00:00:00	2010-06-05 00:00:00	2010-05-27	\N	\N	\N
56302	32	Enlazar a axuda de usuario	\N	2009-12-16 00:00:00	2009-12-23 00:00:00	\N	56303	\N	1
56326	13	Xestión de código único	\N	2010-02-16 02:21:59.723	2010-02-17 02:21:59.723	\N	56329	\N	0
56260	32	Xestión de roles e pedidos	\N	2009-12-19 00:00:00	2009-12-26 00:00:00	\N	56261	\N	3
56327	13	Revisión de formulario de pedidos	\N	2010-02-17 02:21:59.723	2010-02-19 10:21:59.723	\N	56329	\N	1
56328	13	Filtrado no listado de pedidos	\N	2010-02-19 10:21:59.723	2010-02-19 18:21:59.723	\N	56329	\N	2
56269	32	Compartir estado pestañas planificación	\N	2010-01-16 00:00:00	2010-01-21 00:00:00	\N	56273	\N	0
56270	32	Técnica de recálculo de asignacións	\N	2010-01-30 00:00:00	2010-02-09 00:00:00	\N	56273	\N	1
56333	13	Compartir estado pestañas planificación	\N	2010-02-14 18:21:59.723	2010-02-15 18:21:59.723	\N	56337	\N	0
56334	13	Técnica de recálculo de asignacións	\N	2010-02-15 18:21:59.723	2010-02-17 18:21:59.723	\N	56337	\N	1
56335	13	Filtrado de pedidos e tarefas de un pedido	\N	2010-02-17 18:21:59.723	2010-02-18 22:21:59.723	\N	56337	\N	2
56336	13	Modelos de pedidos e planificación	\N	2010-02-18 22:21:59.723	2010-02-23 22:21:59.723	\N	56337	\N	3
56292	32	Definir workflow de pedidos para ERP	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56297	\N	0
105951	1	Entrega	\N	2010-03-17 12:55:16.462	2010-03-17 12:55:16.462	\N	\N	\N	\N
105950	1	Fito intermedio	\N	2010-03-03 13:12:10.397	2010-03-03 13:12:10.397	\N	\N	\N	\N
56351	13	Fluxo de importación/exportación	\N	2010-02-13 10:21:59.723	2010-02-14 18:21:59.723	\N	56355	\N	2
56352	13	Interfaz de xestión de Subcontratación no pedido	\N	2010-02-14 18:21:59.723	2010-02-16 10:21:59.723	\N	56355	\N	3
56353	13	Convertir en fitos as subcontratacións	\N	2010-02-16 10:21:59.723	2010-02-17 02:21:59.723	\N	56355	\N	4
56354	13	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-02-17 02:21:59.723	2010-02-18 10:21:59.723	\N	56355	\N	5
56356	13	Definir workflow de pedidos para ERP	\N	2010-02-18 10:21:59.723	2010-02-19 01:21:59.723	\N	57472	\N	0
56357	13	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-02-19 01:21:59.723	2010-02-21 01:21:59.723	\N	57472	\N	1
57469	13	Formato de intercambio de información de avance	\N	2010-02-21 01:21:59.723	2010-02-22 17:21:59.723	\N	57472	\N	2
57470	13	Formato de intercambio de recursos	\N	2010-02-22 17:21:59.723	2010-02-23 17:21:59.723	\N	57472	\N	3
57471	13	Formato de intercambio de materiais	\N	2010-02-23 17:21:59.723	2010-02-25 01:21:59.723	\N	57472	\N	4
57473	13	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-02-18 10:21:59.723	2010-02-21 02:21:59.723	\N	57475	\N	0
57476	13	Desenvolvemento de paquetes debian	\N	2010-02-25 01:21:59.723	2010-02-26 09:21:59.723	\N	57478	\N	0
57477	13	Enlazar a axuda de usuario	\N	2010-02-26 09:21:59.723	2010-02-28 01:21:59.723	\N	57478	\N	1
56332	18	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-14 18:21:59.723	\N	57495	\N	2
56337	18	Módulo de planificación	\N	2010-02-14 18:21:59.723	2010-02-23 22:21:59.723	\N	57495	\N	3
56330	13	Recursos Virtuais	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	56332	\N	0
56331	13	Recursos Virtuais (Continuación)	\N	2010-02-14 10:21:59.723	2010-02-14 18:21:59.723	\N	56332	\N	1
56348	18	Módulo de xestión da calidade	\N	2010-02-18 18:21:59.723	2010-02-23 10:21:59.723	\N	57495	\N	7
57472	18	Módulo de importación exportación	\N	2010-02-18 10:21:59.723	2010-02-25 01:21:59.723	\N	57495	\N	9
56283	32	Incorporar listas de chequeo nos modelos de planificación	\N	2010-01-12 00:00:00	2010-01-16 00:00:00	\N	56284	\N	2
56285	32	Administración das subcontratas	\N	2009-12-26 00:00:00	2010-01-07 00:00:00	\N	56291	\N	0
56286	32	Formato de intercambio	\N	2010-01-01 00:00:00	2010-01-05 00:00:00	\N	56291	\N	1
56287	32	Fluxo de importación/exportación	\N	2010-01-05 00:00:00	2010-01-09 00:00:00	\N	56291	\N	2
56288	32	Interfaz de xestión de Subcontratación no pedido	\N	2010-01-09 00:00:00	2010-01-16 00:00:00	\N	56291	\N	3
85345	2	Entrega	\N	2010-04-01 18:21:59.723	2010-04-01 18:21:59.723	\N	\N	\N	\N
56289	32	Convertir en fitos as subcontratacións	\N	2010-01-16 00:00:00	2010-01-20 00:00:00	\N	56291	\N	4
86364	2	Enlazar a axuda de usuario	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86365	\N	1
86366	2	Documentación das APIs públicas	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86367	\N	0
86368	2	Pasar pedidos a histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86369	\N	0
86370	2	Integración de JasperRports	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	86379	\N	0
86371	2	Informes sobre organizacións de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	1
86372	2	Informes sobre partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	2
86373	2	Informes de horas traballadas por un traballador	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	3
56257	33	Xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-15 00:00:00	2009-12-15	56261	\N	0
86374	2	Lista de avances de planificación da empresa	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	4
86375	2	Lista de avances de traballo da empresa	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	5
86376	2	Informes de horas estimadas/horas realizadas	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	6
86377	2	Horas realizadas organizadas por tipo de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	7
86378	2	Informes de traballador indicando custos por hora	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	8
86380	2	Coordinación	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	\N	86382	\N	15
86381	2	Análise	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	\N	86382	\N	16
85414	3	Módulo de xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	0
85418	3	Módulo de organizacións de traballo	\N	2010-05-26 00:00:00	2010-05-28 08:00:00	\N	86382	\N	1
85421	3	Módulo de xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	2
85426	3	Módulo de planificación	\N	2010-05-26 00:00:00	2010-05-31 00:00:00	\N	86382	\N	3
85429	3	Módulo de asignación de recursos	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	4
85431	3	Módulo de partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	5
85433	3	Módulo de materiais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	6
85437	3	Módulo de xestión da calidade	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86382	\N	7
85444	3	Módulo de integración con subcontratas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	86382	\N	8
86359	3	Módulo de importación exportación	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86382	\N	9
86362	3	Módulo de presentación	\N	2010-05-26 00:00:00	2010-05-30 00:00:00	\N	86382	\N	10
86365	3	Módulo de arquitectura tecnolóxica	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	11
86367	3	Módulo de Documentación da API	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86382	\N	12
56310	32	Informes sobre partes de traballo	\N	2010-01-01 00:00:00	2010-01-06 00:00:00	\N	56317	\N	2
56311	32	Informes de horas traballadas por un traballador	\N	2009-12-16 00:00:00	2009-12-19 00:00:00	\N	56317	\N	3
56312	32	Lista de avances de planificación da empresa	\N	2009-12-29 00:00:00	2010-01-01 00:00:00	\N	56317	\N	4
85359	5	Técnica de recálculo de asignacións	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85362	\N	1
85360	5	Filtrado de pedidos e tarefas de un pedido	\N	2010-04-21 00:00:00	2010-04-22 04:00:00	\N	85362	\N	2
85361	5	Modelos de pedidos e planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85362	\N	3
85366	5	Procura de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85367	\N	0
56313	32	Lista de avances de traballo da empresa	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	5
56314	32	Informes de horas estimadas/horas realizadas	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	6
56315	32	Horas realizadas organizadas por tipo de traballo	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	7
56316	32	Informes de traballador indicando custos por hora	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	8
56318	32	Coordinación	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	15
56319	32	Análise	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	16
56261	46	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-26 00:00:00	\N	56320	\N	0
56265	46	Módulo de organizacións de traballo	\N	2009-12-22 00:00:00	2010-01-20 00:00:00	\N	56320	\N	1
56268	46	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56320	\N	2
56317	46	Módulo de extracción de informes	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	56320	\N	14
56320	46	4º release Navalplan	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	2010-02-17	\N	\N	\N
85378	5	Convertir en fitos as subcontratacións	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	4
85379	5	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	5
85387	5	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85389	\N	0
56338	13	Interpolación polinómica na asignación avanzada	\N	2010-02-12 18:21:59.723	2010-02-13 18:21:59.723	\N	56340	\N	0
85388	5	Imprimir información pantalla do planificador	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85389	\N	1
56339	13	Asignación avanzada asignación automática configuración	\N	2010-02-13 18:21:59.723	2010-02-15 10:21:59.723	\N	56340	\N	1
56262	32	Xestión de código único	\N	2009-12-22 00:00:00	2009-12-25 00:00:00	\N	56265	\N	0
56263	32	Revisión de formulario de pedidos	\N	2010-01-08 00:00:00	2010-01-19 00:00:00	\N	56265	\N	1
56264	32	Filtrado no listado de pedidos	\N	2010-01-19 00:00:00	2010-01-20 00:00:00	\N	56265	\N	2
56266	32	Recursos Virtuais	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56268	\N	0
86369	3	Módulo de arquivo histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86382	\N	13
86379	3	Módulo de extracción de informes	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86382	\N	14
85381	5	Definir workflow de pedidos para ERP	\N	2010-04-21 00:00:00	2010-04-21 15:00:00	\N	85386	\N	0
85382	5	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85386	\N	1
85383	5	Formato de intercambio de información de avance	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85386	\N	2
56267	32	Recursos Virtuais (Continuación)	\N	2009-12-19 00:00:00	2009-12-22 00:00:00	\N	56268	\N	1
56274	32	Interpolación polinómica na asignación avanzada	\N	2010-01-27 00:00:00	2010-01-30 00:00:00	\N	56276	\N	0
56275	32	Asignación avanzada asignación automática configuración	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56276	\N	1
56304	32	Documentación das APIs públicas	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56305	\N	0
56306	32	Pasar pedidos a histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56307	\N	0
56308	32	Integración de JasperRports	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56317	\N	0
56309	32	Informes sobre organizacións de traballo	\N	2010-01-06 00:00:00	2010-01-09 00:00:00	\N	56317	\N	1
85370	5	Administración de check-lists	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85373	\N	0
85371	5	Cubrir formularios de calidade en planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	1
85372	5	Incorporar listas de chequeo nos modelos de planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	2
85374	5	Administración das subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85380	\N	0
85384	5	Formato de intercambio de recursos	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85386	\N	3
85385	5	Formato de intercambio de materiais	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85386	\N	4
85368	5	Informe de necesidades de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85369	\N	0
85363	5	Interpolación polinómica na asignación avanzada	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85365	\N	0
85364	5	Asignación avanzada asignación automática configuración	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85365	\N	1
56343	13	Informe de necesidades de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	56344	\N	0
56349	13	Administración das subcontratas	\N	2010-02-16 02:21:59.723	2010-02-18 18:21:59.723	\N	56355	\N	0
85376	5	Fluxo de importación/exportación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	2
85377	5	Interfaz de xestión de Subcontratación no pedido	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85380	\N	3
57479	13	Documentación das APIs públicas	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57480	\N	0
57493	13	Coordinación	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	15
56329	18	Módulo de organizacións de traballo	\N	2010-02-16 02:21:59.723	2010-02-19 18:21:59.723	\N	57495	\N	1
56340	18	Módulo de asignación de recursos	\N	2010-02-12 18:21:59.723	2010-02-15 10:21:59.723	\N	57495	\N	4
56344	18	Módulo de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	6
56355	18	Módulo de integración con subcontratas	\N	2010-02-12 18:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	8
57480	18	Módulo de Documentación da API	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57495	\N	12
85410	2	Xestión de usuarios	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85414	\N	0
85411	2	Xestión de roles	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85414	\N	1
85412	2	Xestión de perfiles	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85414	\N	2
85413	2	Xestión de roles e pedidos	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85414	\N	3
85415	2	Xestión de código único	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85418	\N	0
85416	2	Revisión de formulario de pedidos	\N	2010-05-26 00:00:00	2010-05-28 08:00:00	\N	85418	\N	1
85417	2	Filtrado no listado de pedidos	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85418	\N	2
85419	2	Recursos Virtuais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85421	\N	0
85420	2	Recursos Virtuais (Continuación)	\N	2010-05-26 00:00:00	2010-05-26 08:00:00	\N	85421	\N	1
85422	2	Compartir estado pestañas planificación	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85426	\N	0
85423	2	Técnica de recálculo de asignacións	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	85426	\N	1
85424	2	Filtrado de pedidos e tarefas de un pedido	\N	2010-05-26 00:00:00	2010-05-27 04:00:00	\N	85426	\N	2
85425	2	Modelos de pedidos e planificación	\N	2010-05-26 00:00:00	2010-05-31 00:00:00	\N	85426	\N	3
85427	2	Interpolación polinómica na asignación avanzada	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	85429	\N	0
85428	2	Asignación avanzada asignación automática configuración	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85429	\N	1
85430	2	Procura de partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85431	\N	0
85432	2	Informe de necesidades de materiais	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85433	\N	0
85434	2	Administración de check-lists	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	85437	\N	0
85435	2	Cubrir formularios de calidade en planificación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85437	\N	1
85436	2	Incorporar listas de chequeo nos modelos de planificación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85437	\N	2
85438	2	Administración das subcontratas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	85444	\N	0
85439	2	Formato de intercambio	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85444	\N	1
85440	2	Fluxo de importación/exportación	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85444	\N	2
85441	2	Interfaz de xestión de Subcontratación no pedido	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	85444	\N	3
85442	2	Convertir en fitos as subcontratacións	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	85444	\N	4
85443	2	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	85444	\N	5
85445	2	Definir workflow de pedidos para ERP	\N	2010-05-26 00:00:00	2010-05-26 15:00:00	\N	86359	\N	0
56350	13	Formato de intercambio	\N	2010-02-12 18:21:59.723	2010-02-13 10:21:59.723	\N	56355	\N	1
85357	6	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	2
86382	3	4º release Navalplan - 4	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	2010-07-21	\N	\N	\N
85354	6	Módulo de organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85409	\N	1
85380	6	Módulo de integración con subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85409	\N	8
85407	7	Coordinación	\N	2010-04-21 00:00:00	2010-06-05 00:00:00	\N	85409	\N	15
85396	6	Módulo de arquivo histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85409	\N	13
85395	5	Pasar pedidos a histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85396	\N	0
97365	6	Tarefa 2	\N	2010-01-15 00:00:00	2010-02-26 00:00:00	\N	97366	\N	1
97364	6	Tarefa 1	\N	2010-01-01 00:00:00	2010-01-15 00:00:00	\N	97366	\N	0
97366	6	Pedido probas recursos virtuais	\N	2010-01-01 00:00:00	2010-02-26 00:00:00	2010-03-16	\N	\N	\N
85397	6	Integración de JasperRports	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85406	\N	0
56341	13	Procura de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	56342	\N	0
97368	21	Tarefa filla 1.2	\N	2010-03-03 12:55:16.462	2010-03-17 12:55:16.462	\N	97369	\N	1
97372	21	Tarefa raíz 2	\N	2010-02-16 12:55:16.462	2010-03-17 12:55:16.462	\N	97373	\N	1
56345	13	Administración de check-lists	\N	2010-02-18 18:21:59.723	2010-02-20 18:21:59.723	\N	56348	\N	0
56346	13	Cubrir formularios de calidade en planificación	\N	2010-02-20 18:21:59.723	2010-02-22 02:21:59.723	\N	56348	\N	1
56347	13	Incorporar listas de chequeo nos modelos de planificación	\N	2010-02-22 02:21:59.723	2010-02-23 10:21:59.723	\N	56348	\N	2
97370	21	Tarefa filla 2.1	\N	2010-02-16 12:55:16.462	2010-03-03 12:55:16.462	\N	97372	\N	0
97371	21	Tarefa filla 2.2	\N	2010-03-03 12:55:16.462	2010-03-17 12:55:16.462	\N	97372	\N	1
97373	21	Pedido proba virtual pintor	\N	2010-02-16 12:55:16.462	2010-03-17 12:55:16.462	2010-03-16	\N	\N	\N
86355	2	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86359	\N	1
86356	2	Formato de intercambio de información de avance	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86359	\N	2
86357	2	Formato de intercambio de recursos	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86359	\N	3
86358	2	Formato de intercambio de materiais	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86359	\N	4
86360	2	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	86362	\N	0
86361	2	Imprimir información pantalla do planificador	\N	2010-05-26 00:00:00	2010-05-30 00:00:00	\N	86362	\N	1
57481	13	Pasar pedidos a histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57482	\N	0
97369	21	Tarefa raíz 1	\N	2010-02-16 12:55:16.462	2010-03-17 12:55:16.462	\N	97373	\N	0
86363	2	Desenvolvemento de paquetes debian	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86365	\N	0
57487	13	Lista de avances de planificación da empresa	\N	2010-02-19 10:21:59.723	2010-02-20 10:21:59.723	\N	57492	\N	4
57488	13	Lista de avances de traballo da empresa	\N	2010-02-20 10:21:59.723	2010-02-21 10:21:59.723	\N	57492	\N	5
57489	13	Informes de horas estimadas/horas realizadas	\N	2010-02-21 10:21:59.723	2010-02-22 10:21:59.723	\N	57492	\N	6
85373	6	Módulo de xestión da calidade	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	7
85406	6	Módulo de extracción de informes	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85409	\N	14
57490	13	Horas realizadas organizadas por tipo de traballo	\N	2010-02-15 10:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	7
85398	5	Informes sobre organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	1
85399	5	Informes sobre partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	2
85400	5	Informes de horas traballadas por un traballador	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	3
85401	5	Lista de avances de planificación da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	4
85402	5	Lista de avances de traballo da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	5
85403	5	Informes de horas estimadas/horas realizadas	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	6
85404	5	Horas realizadas organizadas por tipo de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	7
85405	5	Informes de traballador indicando custos por hora	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	8
85362	6	Módulo de planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85409	\N	3
85367	6	Módulo de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	5
85394	6	Módulo de Documentación da API	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	12
85393	5	Documentación das APIs públicas	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85394	\N	0
85350	6	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	0
85392	6	Módulo de arquitectura tecnolóxica	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	11
85390	5	Desenvolvemento de paquetes debian	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85392	\N	0
85391	5	Enlazar a axuda de usuario	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85392	\N	1
85389	6	Módulo de presentación	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85409	\N	10
85369	6	Módulo de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	6
85365	6	Módulo de asignación de recursos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	4
57491	13	Informes de traballador indicando custos por hora	\N	2010-02-14 10:21:59.723	2010-02-15 10:21:59.723	\N	57492	\N	8
56342	18	Módulo de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	57495	\N	5
97367	21	Tarefa filla 1.1	\N	2010-02-16 12:55:16.462	2010-03-03 12:55:16.462	\N	97369	\N	0
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2426
2427
3867
3871
3875
56261
56265
56268
56273
56276
56278
56280
56284
56291
56297
56300
56303
56305
56307
56317
56320
56325
56329
56332
56337
56340
56342
56344
56348
56355
57472
57475
57478
57480
57482
57492
57495
85350
85354
85357
85362
85365
85367
85369
85373
85380
85386
85389
85392
85394
85396
85406
85409
85414
85418
85421
85426
85429
85431
85433
85437
85444
86359
86362
86365
86367
86369
86379
86382
86386
86387
97366
97369
97372
97373
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
85345
105950
105951
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
2424	1	1870
2425	1	1871
2426	1	1869
2427	1	1868
3838	1	3646
3839	1	3647
3840	1	3648
3841	1	3649
3842	1	3650
3843	1	3651
3844	1	3652
3845	1	3653
3846	1	3654
3847	1	3655
3848	1	3656
3849	1	3657
3850	1	3658
3851	1	3659
3852	1	3660
3853	1	3661
3854	1	3662
3855	1	3663
3856	1	3664
3857	1	3665
3858	1	3666
3859	1	3667
3860	1	3668
3861	1	3669
3862	1	3670
3863	1	3671
3864	1	3672
3865	1	3673
3866	1	3674
3867	1	3255
56338	11	57212
56339	11	57213
3875	2	4712
3872	3	4713
3873	3	4714
3874	3	4715
3871	6	3697
3868	11	3698
3869	11	3699
3870	11	3700
97364	1	90605
97365	1	90606
97366	1	90604
56315	29	7121
56316	29	7122
56318	29	7123
56319	29	7124
85372	3	85538
85374	3	85540
85375	3	85541
85376	3	85542
85414	2	85841
85377	3	85543
85378	3	85544
85379	3	85545
85418	2	85846
85381	3	85749
85382	3	85750
85421	2	86153
85383	3	85751
85384	3	85752
85385	3	85753
85387	3	85755
85426	2	86156
85388	3	85756
85410	3	85842
85411	3	85843
85412	3	85844
85413	3	85845
85390	3	85758
85391	3	85759
85393	3	85761
85395	3	85763
85397	3	85765
85398	3	85766
85399	3	85767
85400	3	85768
85401	3	85769
85402	3	85770
85403	3	85771
85404	3	85772
85405	3	85773
85407	3	85774
85408	3	85775
85415	3	85847
85416	3	85848
85417	3	85849
85419	3	86154
85420	3	86155
85422	3	86157
85423	3	86158
85424	3	86159
85425	3	86160
85427	3	86162
56261	15	6300
56265	15	6305
86365	2	86188
86367	2	86191
86369	2	86193
86379	2	86195
97373	6	90608
97367	11	90610
97368	11	90611
97370	11	90613
97371	11	90614
56325	6	57194
86382	2	85840
85428	3	86163
85430	3	86165
85432	3	86167
85434	3	86169
85435	3	86170
85436	3	86171
85438	3	86173
85439	3	86174
85440	3	86175
56329	6	57199
97369	6	90609
56332	6	57203
85441	3	86176
97372	6	90612
85442	3	86177
85443	3	86178
85445	3	86180
86355	3	86181
86356	3	86182
86357	3	86183
86358	3	86184
86360	3	86186
86361	3	86187
86363	3	86189
86364	3	86190
86366	3	86192
86368	3	86194
86370	3	86196
86371	3	86197
86372	3	86198
86373	3	86199
86374	3	86200
86375	3	86201
86376	3	86202
86377	3	86203
86378	3	86204
86380	3	86205
86381	3	86206
86386	9	86214
86387	9	86208
86383	17	86215
86384	17	86216
85350	2	85511
86385	17	86217
56337	6	57206
85354	2	85516
56340	6	57211
85357	2	85520
85346	3	85512
85347	3	85513
85348	3	85514
85349	3	85515
85351	3	85517
85352	3	85518
85353	3	85519
56342	6	57214
56305	15	7078
56307	15	7081
56317	15	7115
56320	15	6275
56272	29	6343
56274	29	6354
56275	29	6355
56277	29	6675
56279	29	6677
85355	3	85521
85356	3	85522
56344	6	57216
56348	6	57218
56355	6	57222
57472	6	57229
57475	6	57235
57478	6	57238
57480	6	57241
57482	6	57243
56321	11	57195
56322	11	57196
56323	11	57197
56324	11	57198
56326	11	57200
56327	11	57201
56328	11	57202
56330	11	57204
56331	11	57205
56333	11	57207
56334	11	57208
56281	29	6678
56282	29	6816
56283	29	6817
56285	29	6819
56286	29	6820
56287	29	6821
56288	29	6822
56289	29	6823
56290	29	6824
56268	15	6321
56273	15	6339
56276	15	6353
56278	15	6674
56280	15	6676
56284	15	6815
56291	15	6818
56297	15	6825
57492	6	57245
56300	15	7072
57495	6	57193
56303	15	7075
57483	11	57246
57484	11	57247
57485	11	57248
57486	11	57249
57487	11	57250
57488	11	57251
57489	11	57252
56257	29	6301
56258	29	6302
56259	29	6303
56260	29	6304
85429	2	86161
56262	29	6306
85431	2	86164
56263	29	6307
85433	2	86166
56264	29	6320
85362	2	85523
56266	29	6322
56267	29	6323
85437	2	86168
56269	29	6340
56270	29	6341
57490	11	57253
57491	11	57254
57493	11	57255
57494	11	57256
85365	2	85528
56271	29	6342
85367	2	85531
56292	29	6826
85369	2	85533
85444	2	86172
85373	2	85535
86359	2	86179
56293	29	6827
86362	2	86185
56294	29	6828
56295	29	6829
56296	29	6830
85380	2	85539
56298	29	7073
56299	29	7074
56301	29	7076
56302	29	7077
56304	29	7079
85386	2	85546
56306	29	7082
56308	29	7116
85389	2	85754
56309	29	7117
56310	29	7084
85392	2	85757
56311	29	7080
85394	2	85760
85396	2	85762
85406	2	85764
85409	2	85510
85358	3	85524
85359	3	85525
85360	3	85526
85361	3	85527
85363	3	85529
85364	3	85530
85366	3	85532
85368	3	85534
85370	3	85536
85371	3	85537
56312	29	7118
56313	29	7119
56314	29	7120
56335	11	57209
56336	11	57210
56341	11	57215
56343	11	57217
56345	11	57219
56346	11	57220
56347	11	57221
56349	11	57223
56350	11	57224
56351	11	57225
56352	11	57226
56353	11	57227
56354	11	57228
56356	11	57230
56357	11	57231
57469	11	57232
57470	11	57233
57471	11	57234
57473	11	57236
57474	11	57237
57476	11	57239
57477	11	57240
57479	11	57242
57481	11	57244
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
6161	1	Normal	Normal	20.00	t
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
910	ROLE_CREATE_ORDER
910	ROLE_EDIT_ALL_ORDERS
910	ROLE_READ_ALL_ORDERS
910	ROLE_ADMINISTRATION
911	ROLE_WS_READER
912	ROLE_WS_READER
912	ROLE_WS_WRITER
109686	ROLE_CREATE_ORDER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
1239	Desc.
90901	Desc.
90906	Obvs.
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id) FROM stdin;
5960	1	431e4d41-a6cc-4e25-bc0e-c98080ecc32b	2010-02-09 00:00:00	5858	1226	\N
57974	2	6e60aa05-84e1-40a8-99a0-8bc321ee05b7	2010-02-11 00:00:00	5858	1222	\N
57975	1	f63f80fc-630d-42bb-9fcb-e74ab9671b7a	2010-02-14 00:00:00	5858	1226	\N
76458	2	7e3da009-fc95-4c9c-876f-713b46e1cfaf	2009-12-14 00:00:00	5858	1214	\N
76459	1	1cd28979-2f1e-434f-b376-9fbcaf267352	\N	78780	1217	\N
76466	1	8640978f-7109-42ca-a968-6cf9bc708627	\N	78780	1230	\N
76468	1	4cd40ba9-d0b2-4055-a3f7-92efe3de5496	2010-02-01 00:00:00	5858	1220	\N
76471	1	5e35e952-b4fa-4c0b-a43d-e063a0d9de0a	2010-02-01 00:00:00	5858	1230	\N
76472	1	44dca629-f2e2-42eb-a641-0712f1ee8eb7	2010-02-01 00:00:00	5858	1226	\N
83224	2	5999f2c5-73a9-4683-96b1-8986e24f98aa	\N	78780	1214	\N
107869	1	9e7a1ebc-fd77-42f1-9f91-9cf63a8395fc	\N	78780	1222	\N
\.


--
-- Data for Name: work_report_label_type_assigment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_label_type_assigment (id, version, labelssharedbylines, positionnumber, label_type_id, label_id, work_report_type_id) FROM stdin;
108172	1	f	0	1010	1111	108071
\.


--
-- Data for Name: work_report_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_line (id, version, code, numhours, date, clockstart, clockfinish, work_report_id, resource_id, order_element_id, type_work_hours_id) FROM stdin;
6061	1	6f9a2172-bf77-4fda-911e-5453df2adacf	8	2010-02-09 00:00:00	\N	\N	5960	1226	4714	6161
6062	1	f5b06943-670e-4b56-a63f-211fc6f8e4eb	8	2010-02-09 00:00:00	\N	\N	5960	1226	4713	6161
6063	1	75511aa9-5b2c-405b-b0b2-80dd9b65739e	8	2010-02-09 00:00:00	\N	\N	5960	1226	4715	6161
76565	1	5b827b0a-81df-42e4-ba0d-08e2f8928819	10	2009-12-16 00:00:00	\N	\N	76459	1217	6675	6161
76566	1	ab51945a-2dc5-41a8-abd8-69976fc72028	40	2009-12-15 00:00:00	\N	\N	76459	1217	6322	6161
58080	2	f48644ea-392a-41ac-8068-92e41b5159a6	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58082	2	5f7ac7bc-a381-4e86-b983-28fb2644dced	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58077	2	158c18e2-54c6-4139-bd34-53529cb4af66	10	2010-02-11 00:00:00	\N	\N	57974	1222	3699	6161
58075	2	66542f7e-068e-40f6-a1bd-edf819bf2405	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58076	2	9a8e84f9-29f8-4550-ba74-158962f9423e	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58081	2	89f341da-b0fe-49c1-bf43-257c2127b65e	10	2010-02-11 00:00:00	\N	\N	57974	1222	3698	6161
58079	2	859173ea-f99b-4e78-9844-9639cc6ad999	10	2010-02-11 00:00:00	\N	\N	57974	1222	3700	6161
58078	2	dc496741-38e8-4073-8b77-fdbec50c9aee	10	2010-02-11 00:00:00	\N	\N	57974	1222	3699	6161
58083	1	2f78531d-019d-4b8c-bd48-12107664bcea	10	2010-02-14 00:00:00	\N	\N	57975	1226	3699	6161
58084	1	4bf42e12-b9f4-423e-a964-42dfd64cf541	10	2010-02-14 00:00:00	\N	\N	57975	1226	3700	6161
76559	2	c6d80ab6-0c60-4e7a-866f-b1ed61bf00cd	8	2009-12-14 00:00:00	\N	\N	76458	1214	6301	6161
76563	2	a78a465f-fd81-4348-980b-b81bcd72494b	8	2009-12-14 00:00:00	\N	\N	76458	1214	6302	6161
76562	2	90bc3cbd-5899-499c-9257-fea36e75aa6e	8	2009-12-14 00:00:00	\N	\N	76458	1214	6303	6161
76561	2	a05d4dbc-b727-4905-9165-8404a7aec4c1	8	2009-12-14 00:00:00	\N	\N	76458	1214	6304	6161
76564	2	1689814c-f609-41b4-ad58-eceae5b9f4a2	8	2009-12-14 00:00:00	\N	\N	76458	1214	6301	6161
76560	2	22c136e1-a104-4f24-a0fa-38d267f4761b	8	2009-12-14 00:00:00	\N	\N	76458	1214	6302	6161
76633	1	afdb5087-b1c1-47b9-a92d-2ff43858dee1	40	2009-12-16 00:00:00	\N	\N	76466	1230	6306	6161
76634	1	89ce4c00-db59-4e62-a6ed-1afbf7c704d7	40	2009-12-22 00:00:00	\N	\N	76466	1230	6307	6161
76635	1	82b7f1ff-df0f-421f-a36a-bc8ec10b9183	40	2009-12-20 00:00:00	\N	\N	76466	1230	6320	6161
76636	1	46bbe708-df6b-4e75-b59a-f359718795a4	40	2009-12-21 00:00:00	\N	\N	76466	1230	6340	6161
76637	1	c1137136-1857-4189-99e4-03314a839bec	40	2009-12-07 00:00:00	\N	\N	76466	1230	6323	6161
76638	1	c4ff5b0a-6576-4627-b5ee-8d34abb596a8	40	2009-12-30 00:00:00	\N	\N	76466	1230	6343	6161
76639	1	86783000-2c71-47b4-8468-3d3b1f585b4b	40	2010-01-12 00:00:00	\N	\N	76466	1230	6354	6161
76640	1	83ccabe1-95a7-4ba9-8553-82a40509ae1f	40	2010-01-27 00:00:00	\N	\N	76466	1230	6341	6161
76641	1	121025f3-c8d5-4e9f-8ed9-c88481369b52	40	2010-02-01 00:00:00	\N	\N	76466	1230	6355	6161
76642	1	aaca8cc4-dcb5-4f84-812a-5f6802e1e39e	30	2010-01-19 00:00:00	\N	\N	76466	1230	6675	6161
76643	1	efc3ea22-b1de-414b-ae23-2f6a639d9a99	40	2010-02-01 00:00:00	\N	\N	76466	1230	6677	6161
76644	1	52cd66e2-8e38-4d37-ada0-cb8fa58868aa	4	2010-02-01 00:00:00	\N	\N	76466	1230	6301	6161
76646	1	1905fbd8-1db5-4938-8c9f-c64d90dc0fe9	40	2010-02-01 00:00:00	\N	\N	76468	1220	6341	6161
76647	1	8519b18a-9ec2-4767-baf5-fbb6b13c60e3	40	2010-02-01 00:00:00	\N	\N	76468	1220	6678	6161
76648	1	15ff70f5-d3c6-4304-a001-13e0e87de614	40	2010-02-01 00:00:00	\N	\N	76468	1220	6816	6161
76649	1	681fb856-9b2a-4787-9070-e3438d705efa	40	2010-02-01 00:00:00	\N	\N	76468	1220	6816	6161
76650	1	e00a880d-f00a-4347-ad75-9097975becc3	40	2010-02-01 00:00:00	\N	\N	76468	1220	6817	6161
76651	1	88606ba6-003a-4b16-b329-e19f47851561	40	2010-02-01 00:00:00	\N	\N	76468	1220	6819	6161
76652	1	e47a9373-4066-46fc-a0da-57267fc582bf	40	2010-02-01 00:00:00	\N	\N	76468	1220	6820	6161
76653	1	ac1b1930-f520-41fc-81de-4b31a3216ba2	40	2010-02-01 00:00:00	\N	\N	76468	1220	6821	6161
76654	1	64aea4c8-571b-4a8e-baac-39347c876487	40	2010-02-01 00:00:00	\N	\N	76468	1220	6822	6161
76657	1	594fc4f6-9ed5-422a-9abc-3e231f17c0ea	40	2010-02-01 00:00:00	\N	\N	76471	1230	6822	6161
76658	1	da739cbe-4967-4c2d-b9ad-8d69cc2f41d5	40	2010-02-01 00:00:00	\N	\N	76471	1230	6823	6161
78881	1	0f9da8b4-7290-4830-af80-f33884947d94	40	2010-02-01 00:00:00	\N	\N	76471	1230	6824	6161
78882	1	f7a0f2c1-d2f1-41e0-8964-3a9a1dff58aa	40	2010-02-01 00:00:00	\N	\N	76471	1230	6826	6161
78883	1	27c3ef3c-b9e1-4dcb-8638-a44a08406f77	40	2010-02-01 00:00:00	\N	\N	76471	1230	6827	6161
78884	1	ba028f2e-b056-4315-b9ec-45397c493dd2	40	2010-02-01 00:00:00	\N	\N	76471	1230	6828	6161
78885	1	0fdd57ef-fb04-4823-b3a8-68ce010f1429	40	2010-02-01 00:00:00	\N	\N	76471	1230	6829	6161
78886	1	04e995dd-e946-46f7-8130-2204de8f0120	40	2010-02-01 00:00:00	\N	\N	76471	1230	6830	6161
78887	1	336f3b2f-a00a-4734-a7a6-dbd9c678a367	40	2010-02-01 00:00:00	\N	\N	76472	1226	6826	6161
78888	1	c9ee3c0c-7ea9-45f4-a1ed-b52f6ba0472c	32	2010-02-01 00:00:00	\N	\N	76472	1226	6827	6161
78889	1	d0fb008f-af32-4cfd-91f3-20f61b1376f9	32	2010-02-01 00:00:00	\N	\N	76472	1226	6828	6161
78890	1	33e9bd1a-5d39-4e91-b00a-c4b2990be14a	32	2010-02-01 00:00:00	\N	\N	76472	1226	6829	6161
78891	1	49787b1c-4dd8-4ffe-a66c-3f2ab4097885	32	2010-02-01 00:00:00	\N	\N	76472	1226	6830	6161
78892	1	6146ea4f-e307-4ebd-aa81-b4658c92d607	32	2010-02-01 00:00:00	\N	\N	76472	1226	7072	6161
78893	1	11f9c83d-facf-47cb-a900-7ce74c4e0c78	32	2010-02-01 00:00:00	\N	\N	76472	1226	7075	6161
78894	1	0a7b87c6-2971-4ade-9271-0b3ecb58cd65	32	2010-02-01 00:00:00	\N	\N	76472	1226	7078	6161
83329	2	31e0bea5-1b0d-4436-9b1c-d0f7b4d33e08	150	2010-02-08 00:00:00	\N	\N	83224	1214	7124	6161
83325	2	50acdf15-5d16-4d6c-9e9a-b2e8d25a83c3	100	2010-02-08 00:00:00	\N	\N	83224	1214	7115	6161
83330	2	71eb4133-c6e6-478c-9ae7-d4bc0463c6b7	150	2010-02-08 00:00:00	\N	\N	83224	1214	7123	6161
83328	2	5ae68c6a-b76d-4dde-ab4f-d850bd4768e1	70	2010-02-15 00:00:00	\N	\N	83224	1214	7079	6161
83326	2	bfdf9707-350e-4298-a3cf-531ea1aaa9a8	50	2010-02-08 00:00:00	\N	\N	83224	1214	7072	6161
83327	2	84da72ad-df75-48d1-9fe7-f8c343516ce0	50	2010-02-01 00:00:00	\N	\N	83224	1214	7075	6161
107970	1	c3b61766-bf51-4eb7-92e1-abe02ba39ebf	8	2010-02-16 00:00:00	\N	\N	107869	1222	6675	6161
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
5858	1	Nome1	cod1	t	t	f	0
78780	1	Tipo2	code	f	t	f	0
108071	1	tipo c	codea	t	t	t	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1217	Sergio	Sumay Senín	22222222B
1230	Saul	Ramirez Costa	88888888G
1222	María	Francino Arriaga	44444444D
1220	María	Tequila Urzáiz	33333333C
1214	Javier	Rios Manteiga	11111111A
1228	Cristina	Rey Silva	77777777G
1224	Ana	Hervés García	55555555E
1239	Grupo de soldadores para proxecto con Navantia Marzo 2010	---	[Virtual]
90904	Pintor	Proba Pintor	30303030D
90906	Grupo de pintores	---	[Virtual]
90901	Grupo de desenvolvedores	---	[Virtual]
1226	Alfonso	Dominguez Baul	66666666F
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
-- Name: subcontractedtaskdata_task_element_id_key; Type: CONSTRAINT; Schema: public; Owner: naval; Tablespace: 
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT subcontractedtaskdata_task_element_id_key UNIQUE (task_element_id);


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
-- Name: fkecc61140aef2ac0; Type: FK CONSTRAINT; Schema: public; Owner: naval
--

ALTER TABLE ONLY subcontractedtaskdata
    ADD CONSTRAINT fkecc61140aef2ac0 FOREIGN KEY (task_element_id) REFERENCES task(task_element_id);


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

