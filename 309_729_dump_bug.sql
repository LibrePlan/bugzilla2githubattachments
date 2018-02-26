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
    valid boolean
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
    resourcetype bytea,
    workinghours integer NOT NULL,
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
    workhours integer
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
8006	18	t	809
8007	18	t	809
3370	5	t	808
8008	18	t	809
5672	2	t	809
5673	2	f	812
5674	2	f	809
5675	2	f	812
8009	18	t	809
5705	28	t	808
8010	18	f	809
8011	18	t	809
8012	18	t	809
5709	27	t	808
8013	18	f	809
8014	18	t	809
86150	3	t	808
86151	3	f	809
8015	18	f	809
86152	3	t	809
86254	3	t	809
86256	3	t	808
86255	3	f	809
86257	3	t	809
86259	3	f	809
5716	26	t	808
86258	3	t	808
86260	3	t	809
9290	17	t	809
86261	3	t	808
86262	3	f	809
5717	26	t	808
86263	3	t	809
9291	17	f	809
9292	17	t	809
9293	17	t	809
9294	17	t	809
6978	25	t	808
9295	17	f	809
9296	17	t	809
9297	17	t	809
9298	17	t	809
6979	25	t	808
6980	25	t	808
6993	24	t	808
6994	24	t	808
6995	24	t	808
6996	24	t	808
7518	20	t	809
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
7509	20	t	809
7510	20	t	809
7511	20	t	809
7512	20	t	809
7513	20	f	809
5696	30	t	808
7514	20	t	809
7515	20	t	809
7516	20	t	809
7517	20	f	809
5697	30	t	808
8003	18	t	809
8004	18	t	809
5701	29	t	808
8005	18	f	809
57124	3	t	809
57125	3	t	809
57126	3	t	809
57127	3	t	809
57128	3	f	809
57129	3	t	808
57130	3	t	809
57131	3	t	809
57132	3	t	809
57134	3	t	808
57133	3	f	809
57135	3	t	809
57136	3	t	809
57137	3	t	808
57138	3	f	809
57139	3	t	809
57140	3	t	809
85693	3	t	809
85695	3	f	809
85694	3	t	808
85696	3	t	809
85698	3	f	809
85697	3	t	808
85699	3	t	809
85700	3	t	809
9299	17	t	809
9300	17	t	809
9301	17	t	809
9302	17	f	809
9303	17	t	809
9304	17	t	809
9305	17	t	809
9306	17	t	809
9307	17	t	809
9308	17	f	809
11027	16	t	809
11028	16	t	809
11029	16	f	809
11030	16	t	809
11031	16	t	809
11032	16	f	809
11033	16	t	809
11034	16	f	809
11035	16	t	809
11036	16	f	809
11037	16	t	809
11038	16	t	809
11039	16	t	809
11040	16	t	809
11041	16	t	809
11042	16	t	809
11043	16	t	809
11044	16	t	809
11045	16	t	809
11046	16	t	809
11047	16	t	809
11048	16	t	809
86279	5	t	808
57141	3	t	809
57142	3	t	809
79996	8	f	810
79997	8	f	810
79998	8	f	810
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
57144	3	f	809
57143	3	t	808
57145	3	t	809
57146	3	t	809
57147	3	t	808
57148	3	f	809
57149	3	t	809
57151	3	f	809
57150	3	t	808
57152	3	t	809
57154	3	t	808
57153	3	f	809
57155	3	t	809
57156	3	t	809
57157	3	t	809
57158	3	f	809
57159	3	t	808
57160	3	t	809
57161	3	t	809
57162	3	t	809
57163	3	t	809
57164	3	t	809
57165	3	t	809
57368	3	f	809
57369	3	t	808
57370	3	t	809
57371	3	t	809
57372	3	t	809
57373	3	t	809
57374	3	t	809
57376	3	t	808
57375	3	f	809
57377	3	t	809
57378	3	t	809
57380	3	t	808
57379	3	f	809
57381	3	t	809
57382	3	t	809
57383	3	t	808
57384	3	f	809
57385	3	t	809
57387	3	t	808
57386	3	f	809
57388	3	t	809
57389	3	f	809
57390	3	t	808
57391	3	t	809
57392	3	t	809
57393	3	t	809
57394	3	t	809
57395	3	t	809
57396	3	t	809
57397	3	t	809
57398	3	t	809
57399	3	t	809
57401	3	t	808
57400	3	f	809
57402	3	t	809
57403	3	t	809
57404	3	t	808
57405	3	f	809
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
86281	5	t	808
86285	2	t	809
86286	2	f	809
86287	2	f	809
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
5765	2	2010-02-09	40.00	5672	\N
5766	2	2010-02-08	20.00	5672	\N
82461	2	2010-04-28	25.00	86285	\N
79924	8	2009-12-16	100.00	7509	\N
79925	8	2009-12-08	25.00	7509	\N
79928	8	2010-02-01	100.00	7510	\N
79929	8	2009-12-15	50.00	7510	\N
79926	8	2010-02-16	50.00	79996	\N
79927	8	2010-02-01	25.00	79996	\N
79930	8	2010-01-06	50.00	7511	\N
79931	8	2010-01-03	25.00	7511	\N
80495	7	2010-02-15	100.00	7514	\N
80496	7	2010-02-15	100.00	7515	\N
80497	7	2010-02-15	100.00	7516	\N
80498	7	2010-02-15	100.00	8003	\N
80499	7	2010-02-15	100.00	8004	\N
80500	7	2010-02-15	100.00	8006	\N
80501	7	2010-02-15	100.00	8007	\N
80502	7	2010-02-15	100.00	8008	\N
80503	7	2010-02-15	100.00	8009	\N
80504	7	2010-02-15	100.00	8011	\N
80505	7	2010-02-15	100.00	8012	\N
80596	6	2010-02-15	100.00	8014	\N
80597	6	2010-02-15	100.00	9290	\N
80598	6	2010-02-15	100.00	9292	\N
80599	6	2010-02-15	100.00	9293	\N
80600	6	2010-02-15	100.00	9294	\N
82020	5	2010-02-15	100.00	9296	\N
82021	5	2010-02-15	100.00	9297	\N
82022	5	2010-02-15	100.00	9298	\N
82023	5	2010-02-15	100.00	9299	\N
82024	5	2010-02-15	100.00	9300	\N
82025	5	2010-02-15	100.00	9301	\N
82026	5	2010-02-15	100.00	9303	\N
82027	5	2010-02-15	100.00	9304	\N
82028	5	2010-02-15	100.00	9305	\N
82029	5	2010-02-15	100.00	9306	\N
82030	5	2010-02-15	100.00	9307	\N
82031	5	2010-02-15	100.00	11027	\N
82032	5	2010-02-15	100.00	11028	\N
82033	5	2010-02-15	100.00	11030	\N
82034	5	2010-02-15	100.00	11031	\N
82035	5	2010-02-15	100.00	11033	\N
82036	5	2010-02-15	100.00	11035	\N
82037	5	2010-02-15	100.00	11037	\N
82430	4	2010-02-15	100.00	11038	\N
82431	4	2010-02-15	100.00	11039	\N
82432	4	2010-02-15	100.00	11040	\N
82433	4	2010-02-15	100.00	11041	\N
82434	4	2010-02-15	100.00	11042	\N
82435	4	2010-02-15	100.00	11043	\N
82436	4	2010-02-15	100.00	11044	\N
82437	4	2010-02-15	100.00	11045	\N
82438	4	2010-02-15	100.00	11047	\N
82439	4	2010-02-15	100.00	11048	\N
82458	2	2010-02-15	100.00	7511	\N
82459	2	2010-02-15	100.00	7512	\N
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
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
88072	3
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
315	4	\N
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1313	1	2010-02-03	\N	304	0
1322	2	2010-02-03	\N	318	0
1323	3	2010-02-03	\N	319	0
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
1319	4	2009-02-03	\N	315	0
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
416	4	307	\N	315	0
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
112	3	a3d2fdde-053c-4805-b89c-0686e06b80f0	Analista	t	4	\N
44137	1	3f1a6ca8-20ab-4a4a-b9e2-6120e18ba90d	Consultor	t	4	\N
113	3	a7725710-9bb4-4896-a0c4-0b06375b626f	Desarrollador	t	4	\N
119	2	a24075ab-4d02-4c46-adde-a6cb0bd86b29	Soldador	t	4	\N
111	3	d1f49e2c-237e-4b1e-8ad0-c0e0f9d825e0	Coordinador	t	4	\N
101	14	aeca847a-2b3c-4f07-bd5f-a97e9e210cab	medicalLeave	t	1	\N
102	13	63baaa7b-6637-4213-9606-f33223cd9eb0	paternityLeave	t	1	\N
103	4	944b1694-3e09-4160-901b-878014d5ca5c	hiredResourceWorkingRelationship	t	5	\N
104	3	433ba70e-abd0-4459-b9d0-5307ce884de9	firedResourceWorkingRelationship	t	5	\N
109	2	1b2ceacb-180a-4a3e-b502-e92c35925b0c	Pontevedra	t	6	106
108	2	383e38ab-def8-42f3-9585-ee2bd2956a56	Ferrol	t	6	106
110	2	3380514c-2795-46f9-b15d-7af052233a3b	Andalucía	t	6	105
107	2	0a8253f2-2880-49d9-8279-4afdcdc4b2b6	Vigo	t	6	106
106	2	061cb37e-b556-45c4-a31e-f573d1f996b5	Galicia	t	6	105
105	2	fe05c700-ff55-4182-becf-d7e2d9543cf9	España	t	6	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, criterion_id, parent, isvalid, valid) FROM stdin;
39068	DIRECT	15	\N	6300	115	\N	\N	\N
2395	DIRECT	2	\N	1870	113	\N	\N	\N
2396	DIRECT	2	\N	1870	115	\N	\N	\N
2397	INDIRECT	2	2139	\N	115	2396	t	\N
2398	INDIRECT	2	2139	\N	113	2395	t	\N
2399	DIRECT	2	\N	1871	115	\N	\N	\N
2400	DIRECT	2	\N	1871	113	\N	\N	\N
2401	INDIRECT	2	2140	\N	113	2400	t	\N
2402	INDIRECT	2	2140	\N	115	2399	t	\N
44065	INDIRECT	13	\N	7076	113	44063	\N	t
44067	INDIRECT	13	6949	\N	113	44063	\N	t
44066	INDIRECT	13	6949	\N	115	44062	\N	t
4796	DIRECT	3	4866	\N	119	\N	\N	\N
4795	DIRECT	3	4865	\N	113	\N	\N	\N
4797	DIRECT	3	\N	4714	117	\N	\N	\N
44068	INDIRECT	13	\N	7077	115	44062	\N	t
4799	DIRECT	3	4869	\N	118	\N	\N	\N
4798	DIRECT	3	4868	\N	119	\N	\N	\N
4954	INDIRECT	2	4867	\N	117	4797	\N	t
4320	DIRECT	3	\N	3698	112	\N	\N	\N
4321	INDIRECT	3	3761	\N	112	4320	t	\N
4322	DIRECT	3	\N	3699	113	\N	\N	\N
4323	INDIRECT	3	3762	\N	113	4322	t	\N
4324	DIRECT	3	\N	3700	119	\N	\N	\N
4325	INDIRECT	3	3763	\N	119	4324	t	\N
44069	INDIRECT	13	\N	7077	113	44063	\N	f
44071	INDIRECT	13	6950	\N	113	44063	\N	f
44070	INDIRECT	13	6950	\N	115	44062	\N	t
44072	DIRECT	13	\N	7078	115	\N	\N	\N
44073	DIRECT	13	\N	7078	113	\N	\N	\N
44074	INDIRECT	13	\N	7079	115	44072	\N	t
44075	INDIRECT	13	\N	7079	113	44073	\N	t
44077	INDIRECT	13	6951	\N	113	44073	\N	t
44076	INDIRECT	13	6951	\N	115	44072	\N	t
44079	DIRECT	13	\N	7081	115	\N	\N	\N
44078	DIRECT	13	\N	7081	113	\N	\N	\N
44080	INDIRECT	13	\N	7082	115	44079	\N	t
44081	INDIRECT	13	\N	7082	113	44078	\N	t
44083	INDIRECT	13	6953	\N	115	44079	\N	t
44082	INDIRECT	13	6953	\N	113	44078	\N	t
44084	DIRECT	13	\N	7115	113	\N	\N	\N
44085	DIRECT	13	\N	7115	115	\N	\N	\N
44087	INDIRECT	13	\N	7116	113	44084	\N	t
44086	INDIRECT	13	\N	7116	115	44085	\N	t
44089	INDIRECT	13	7185	\N	115	44085	\N	t
44088	INDIRECT	13	7185	\N	113	44084	\N	t
44091	INDIRECT	13	\N	7117	115	44085	\N	t
39069	DIRECT	15	\N	6300	113	\N	\N	\N
39070	INDIRECT	15	\N	6301	113	39069	\N	t
39071	INDIRECT	15	\N	6301	115	39068	\N	t
39072	INDIRECT	15	6583	\N	115	39068	\N	t
39073	INDIRECT	15	6583	\N	113	39069	\N	t
39075	INDIRECT	15	\N	6302	113	39069	\N	t
39074	INDIRECT	15	\N	6302	115	39068	\N	t
39076	INDIRECT	15	6584	\N	113	39069	\N	t
39077	INDIRECT	15	6584	\N	115	39068	\N	t
39079	INDIRECT	15	\N	6303	115	39068	\N	t
39078	INDIRECT	15	\N	6303	113	39069	\N	t
39080	INDIRECT	15	6585	\N	115	39068	\N	t
39081	INDIRECT	15	6585	\N	113	39069	\N	t
39086	DIRECT	15	\N	6305	113	\N	\N	\N
40933	INDIRECT	14	\N	6817	113	40923	\N	t
40932	INDIRECT	14	\N	6817	115	40922	\N	t
40934	INDIRECT	14	6908	\N	115	40922	\N	t
40935	INDIRECT	14	6908	\N	113	40923	\N	t
40937	DIRECT	14	\N	6818	113	\N	\N	\N
40936	DIRECT	14	\N	6818	115	\N	\N	\N
40938	INDIRECT	14	\N	6819	115	40936	\N	t
40939	INDIRECT	14	\N	6819	113	40937	\N	t
40941	INDIRECT	14	6909	\N	115	40936	\N	t
40940	INDIRECT	14	6909	\N	113	40937	\N	t
40943	INDIRECT	14	\N	6820	115	40936	\N	t
40942	INDIRECT	14	\N	6820	113	40937	\N	t
40945	INDIRECT	14	6910	\N	115	40936	\N	t
44090	INDIRECT	13	\N	7117	113	44084	\N	t
44093	INDIRECT	13	7186	\N	115	44085	\N	t
44092	INDIRECT	13	7186	\N	113	44084	\N	t
44095	INDIRECT	13	\N	7084	113	44084	\N	t
44094	INDIRECT	13	\N	7084	115	44085	\N	t
44096	INDIRECT	13	6955	\N	113	44084	\N	t
44097	INDIRECT	13	6955	\N	115	44085	\N	t
44119	INDIRECT	13	\N	7122	115	44085	\N	t
44118	INDIRECT	13	\N	7122	113	44084	\N	t
44120	INDIRECT	13	7191	\N	115	44085	\N	t
44121	INDIRECT	13	7191	\N	113	44084	\N	t
44122	DIRECT	13	\N	7123	111	\N	\N	\N
44124	INDIRECT	13	7192	\N	115	44123	\N	t
44309	DIRECT	12	\N	6826	112	\N	\N	\N
44310	INDIRECT	12	6915	\N	112	44309	\N	t
40974	INDIRECT	14	6917	\N	115	40963	\N	t
44311	DIRECT	12	\N	6829	44137	\N	\N	\N
40976	INDIRECT	14	\N	6829	115	40963	\N	t
40977	INDIRECT	14	\N	6829	113	40962	\N	f
44312	INDIRECT	12	6918	\N	44137	44311	\N	t
40978	INDIRECT	14	6918	\N	115	40963	\N	t
40979	INDIRECT	14	6918	\N	113	40962	\N	f
44313	DIRECT	12	\N	6830	44137	\N	\N	\N
40980	INDIRECT	14	\N	6830	115	40963	\N	t
40981	INDIRECT	14	\N	6830	113	40962	\N	f
40982	INDIRECT	14	6919	\N	115	40963	\N	t
40983	INDIRECT	14	6919	\N	113	40962	\N	f
44314	INDIRECT	12	6919	\N	44137	44313	\N	t
44125	INDIRECT	13	7192	\N	111	44122	\N	t
44127	DIRECT	13	\N	7124	113	\N	\N	\N
44126	DIRECT	13	\N	7124	115	\N	\N	\N
44128	INDIRECT	13	7193	\N	113	44127	\N	t
44129	INDIRECT	13	7193	\N	115	44126	\N	t
39082	INDIRECT	15	\N	6304	113	39069	\N	t
39083	INDIRECT	15	\N	6304	115	39068	\N	t
39084	INDIRECT	15	6586	\N	113	39069	\N	t
39085	INDIRECT	15	6586	\N	115	39068	\N	t
39087	DIRECT	15	\N	6305	115	\N	\N	\N
39088	INDIRECT	15	\N	6306	113	39086	\N	t
39089	INDIRECT	15	\N	6306	115	39087	\N	t
39091	INDIRECT	15	6587	\N	115	39087	\N	t
39090	INDIRECT	15	6587	\N	113	39086	\N	t
39093	INDIRECT	15	\N	6307	115	39087	\N	t
39092	INDIRECT	15	\N	6307	113	39086	\N	t
39094	INDIRECT	15	6588	\N	113	39086	\N	t
39095	INDIRECT	15	6588	\N	115	39087	\N	t
39096	INDIRECT	15	\N	6320	113	39086	\N	t
39097	INDIRECT	15	\N	6320	115	39087	\N	t
39098	INDIRECT	15	6598	\N	115	39087	\N	t
39099	INDIRECT	15	6598	\N	113	39086	\N	t
39101	DIRECT	15	\N	6321	113	\N	\N	\N
39100	DIRECT	15	\N	6321	115	\N	\N	\N
39103	INDIRECT	15	\N	6322	115	39100	\N	t
39102	INDIRECT	15	\N	6322	113	39101	\N	t
39104	INDIRECT	15	6599	\N	115	39100	\N	t
39105	INDIRECT	15	6599	\N	113	39101	\N	t
39106	INDIRECT	15	\N	6323	113	39101	\N	t
39107	INDIRECT	15	\N	6323	115	39100	\N	t
39109	INDIRECT	15	6600	\N	113	39101	\N	t
39108	INDIRECT	15	6600	\N	115	39100	\N	t
39111	DIRECT	15	\N	6339	113	\N	\N	\N
39110	DIRECT	15	\N	6339	115	\N	\N	\N
39112	INDIRECT	15	\N	6340	115	39110	\N	t
39113	INDIRECT	15	\N	6340	113	39111	\N	t
39114	INDIRECT	15	6613	\N	115	39110	\N	t
39115	INDIRECT	15	6613	\N	113	39111	\N	t
39116	INDIRECT	15	\N	6341	113	39111	\N	t
39117	INDIRECT	15	\N	6341	115	39110	\N	t
39118	INDIRECT	15	6614	\N	113	39111	\N	t
39119	INDIRECT	15	6614	\N	115	39110	\N	t
39120	INDIRECT	15	\N	6342	113	39111	\N	t
44053	DIRECT	13	\N	7072	113	\N	\N	\N
39121	INDIRECT	15	\N	6342	115	39110	\N	t
39122	INDIRECT	15	6615	\N	113	39111	\N	t
39123	INDIRECT	15	6615	\N	115	39110	\N	t
39125	INDIRECT	15	\N	6343	115	39110	\N	t
39124	INDIRECT	15	\N	6343	113	39111	\N	t
39127	INDIRECT	15	6616	\N	113	39111	\N	t
39126	INDIRECT	15	6616	\N	115	39110	\N	t
39128	DIRECT	15	\N	6353	113	\N	\N	\N
39129	DIRECT	15	\N	6353	115	\N	\N	\N
39130	INDIRECT	15	\N	6354	115	39129	\N	t
39131	INDIRECT	15	\N	6354	113	39128	\N	t
39132	INDIRECT	15	6623	\N	113	39128	\N	t
39133	INDIRECT	15	6623	\N	115	39129	\N	t
39135	INDIRECT	15	\N	6355	113	39128	\N	t
39134	INDIRECT	15	\N	6355	115	39129	\N	t
39137	INDIRECT	15	6624	\N	115	39129	\N	t
39136	INDIRECT	15	6624	\N	113	39128	\N	t
39139	DIRECT	15	\N	6674	113	\N	\N	\N
39138	DIRECT	15	\N	6674	115	\N	\N	\N
39140	INDIRECT	15	\N	6675	115	39138	\N	t
39141	INDIRECT	15	\N	6675	113	39139	\N	t
39143	INDIRECT	15	6634	\N	113	39139	\N	t
44061	INDIRECT	13	6948	\N	115	44052	\N	t
44063	DIRECT	13	\N	7075	113	\N	\N	\N
44062	DIRECT	13	\N	7075	115	\N	\N	\N
44064	INDIRECT	13	\N	7076	115	44062	\N	t
40916	DIRECT	14	\N	6676	115	\N	\N	\N
40917	DIRECT	14	\N	6676	113	\N	\N	\N
40918	INDIRECT	14	\N	6677	113	40917	\N	t
40919	INDIRECT	14	\N	6677	115	40916	\N	t
40921	INDIRECT	14	6635	\N	115	40916	\N	t
40920	INDIRECT	14	6635	\N	113	40917	\N	t
40922	DIRECT	14	\N	6815	115	\N	\N	\N
40923	DIRECT	14	\N	6815	113	\N	\N	\N
40925	INDIRECT	14	\N	6678	115	40922	\N	t
40924	INDIRECT	14	\N	6678	113	40923	\N	t
40927	INDIRECT	14	6636	\N	115	40922	\N	t
40926	INDIRECT	14	6636	\N	113	40923	\N	t
40929	INDIRECT	14	\N	6816	115	40922	\N	t
40928	INDIRECT	14	\N	6816	113	40923	\N	t
40931	INDIRECT	14	6907	\N	113	40923	\N	t
40930	INDIRECT	14	6907	\N	115	40922	\N	t
44325	DIRECT	11	\N	7077	111	\N	\N	\N
44326	INDIRECT	11	6950	\N	111	44325	\N	t
44098	INDIRECT	13	\N	7080	115	44085	\N	t
44099	INDIRECT	13	\N	7080	113	44084	\N	t
44101	INDIRECT	13	6952	\N	115	44085	\N	t
44100	INDIRECT	13	6952	\N	113	44084	\N	t
44102	INDIRECT	13	\N	7118	113	44084	\N	t
44103	INDIRECT	13	\N	7118	115	44085	\N	t
44104	INDIRECT	13	7187	\N	113	44084	\N	t
44105	INDIRECT	13	7187	\N	115	44085	\N	t
44106	INDIRECT	13	\N	7119	115	44085	\N	t
44107	INDIRECT	13	\N	7119	113	44084	\N	t
44109	INDIRECT	13	7188	\N	115	44085	\N	t
44108	INDIRECT	13	7188	\N	113	44084	\N	t
44110	INDIRECT	13	\N	7120	115	44085	\N	t
44111	INDIRECT	13	\N	7120	113	44084	\N	t
44113	INDIRECT	13	7189	\N	113	44084	\N	t
44112	INDIRECT	13	7189	\N	115	44085	\N	t
44114	INDIRECT	13	\N	7121	115	44085	\N	t
44115	INDIRECT	13	\N	7121	113	44084	\N	t
44117	INDIRECT	13	7190	\N	115	44085	\N	t
44116	INDIRECT	13	7190	\N	113	44084	\N	t
44123	DIRECT	13	\N	7123	115	\N	\N	\N
39142	INDIRECT	15	6634	\N	115	39138	\N	t
40944	INDIRECT	14	6910	\N	113	40937	\N	t
40946	INDIRECT	14	\N	6821	113	40937	\N	t
40947	INDIRECT	14	\N	6821	115	40936	\N	t
40949	INDIRECT	14	6911	\N	115	40936	\N	t
40948	INDIRECT	14	6911	\N	113	40937	\N	t
40950	INDIRECT	14	\N	6822	113	40937	\N	t
40951	INDIRECT	14	\N	6822	115	40936	\N	t
40953	INDIRECT	14	6912	\N	113	40937	\N	t
40952	INDIRECT	14	6912	\N	115	40936	\N	t
40955	INDIRECT	14	\N	6823	113	40937	\N	t
40954	INDIRECT	14	\N	6823	115	40936	\N	t
40956	INDIRECT	14	6913	\N	113	40937	\N	t
40957	INDIRECT	14	6913	\N	115	40936	\N	t
40959	INDIRECT	14	\N	6824	115	40936	\N	t
40958	INDIRECT	14	\N	6824	113	40937	\N	t
40960	INDIRECT	14	6914	\N	113	40937	\N	t
40961	INDIRECT	14	6914	\N	115	40936	\N	t
40963	DIRECT	14	\N	6825	115	\N	\N	\N
40962	DIRECT	14	\N	6825	113	\N	\N	\N
40965	INDIRECT	14	\N	6826	115	40963	\N	t
40964	INDIRECT	14	\N	6826	113	40962	\N	f
40966	INDIRECT	14	6915	\N	113	40962	\N	f
40967	INDIRECT	14	6915	\N	115	40963	\N	t
40968	INDIRECT	14	\N	6827	113	40962	\N	t
40969	INDIRECT	14	\N	6827	115	40963	\N	t
40971	INDIRECT	14	6916	\N	115	40963	\N	t
40970	INDIRECT	14	6916	\N	113	40962	\N	t
40973	INDIRECT	14	\N	6828	115	40963	\N	t
40972	INDIRECT	14	\N	6828	113	40962	\N	t
40975	INDIRECT	14	6917	\N	113	40962	\N	t
44052	DIRECT	13	\N	7072	115	\N	\N	\N
44055	INDIRECT	13	\N	7073	113	44053	\N	t
44054	INDIRECT	13	\N	7073	115	44052	\N	t
44057	INDIRECT	13	6947	\N	115	44052	\N	t
44056	INDIRECT	13	6947	\N	113	44053	\N	t
44059	INDIRECT	13	\N	7074	113	44053	\N	t
44058	INDIRECT	13	\N	7074	115	44052	\N	t
44060	INDIRECT	13	6948	\N	113	44053	\N	t
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
1424	2	2010-02-03 11:51:26.406	\N	f	115	1226	1424
1425	2	2010-02-03 11:51:22.185	\N	f	111	1226	1425
1435	4	2010-02-03 12:11:29.501	\N	f	119	1239	1435
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
4	10	acb3c00d-ba8a-4f13-b8c1-5ff0abf04e50	Tipo de trabajo	Job	t	t	t	1
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
60433	GENERIC_DAY	6	2	2009-12-14	1217	\N	58470	\N
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
60435	GENERIC_DAY	6	2	2009-12-16	1228	\N	58470	\N
60447	GENERIC_DAY	6	2	2009-12-16	1220	\N	58470	\N
60436	GENERIC_DAY	6	2	2009-12-14	1230	\N	58470	\N
60440	GENERIC_DAY	6	2	2009-12-14	1220	\N	58470	\N
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
60429	GENERIC_DAY	6	2	2009-12-18	1228	\N	58470	\N
60438	GENERIC_DAY	6	2	2009-12-14	1228	\N	58470	\N
60432	GENERIC_DAY	6	2	2009-12-16	1217	\N	58470	\N
58504	GENERIC_DAY	8	2	2009-12-14	1228	\N	58383	\N
58506	GENERIC_DAY	8	2	2009-12-14	1230	\N	58383	\N
58503	GENERIC_DAY	8	2	2009-12-14	1220	\N	58383	\N
58505	GENERIC_DAY	8	2	2009-12-14	1217	\N	58383	\N
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
74789	GENERIC_DAY	1	2	2010-01-01	1230	\N	58469	\N
74790	GENERIC_DAY	1	2	2010-01-14	1230	\N	58469	\N
74791	GENERIC_DAY	1	0	2010-01-10	1217	\N	58469	\N
74792	GENERIC_DAY	1	0	2010-01-02	1217	\N	58469	\N
74793	GENERIC_DAY	1	0	2010-01-03	1220	\N	58469	\N
74794	GENERIC_DAY	1	0	2010-01-10	1220	\N	58469	\N
74795	GENERIC_DAY	1	0	2010-01-10	1230	\N	58469	\N
74796	GENERIC_DAY	1	2	2010-01-13	1230	\N	58469	\N
74797	GENERIC_DAY	1	2	2010-01-15	1230	\N	58469	\N
74798	GENERIC_DAY	1	1	2010-01-01	1228	\N	58469	\N
74799	GENERIC_DAY	1	2	2010-01-11	1230	\N	58469	\N
74800	GENERIC_DAY	1	0	2010-01-02	1220	\N	58469	\N
74801	GENERIC_DAY	1	2	2010-01-14	1220	\N	58469	\N
74802	GENERIC_DAY	1	2	2010-01-08	1228	\N	58469	\N
74803	GENERIC_DAY	1	2	2010-01-14	1228	\N	58469	\N
74804	GENERIC_DAY	1	2	2010-01-13	1228	\N	58469	\N
74805	GENERIC_DAY	1	2	2010-01-15	1220	\N	58469	\N
74806	GENERIC_DAY	1	2	2010-01-05	1230	\N	58469	\N
74807	GENERIC_DAY	1	3	2010-01-04	1217	\N	58469	\N
74808	GENERIC_DAY	1	2	2010-01-11	1220	\N	58469	\N
74809	GENERIC_DAY	1	2	2010-01-06	1230	\N	58469	\N
74810	GENERIC_DAY	1	2	2010-01-14	1217	\N	58469	\N
74811	GENERIC_DAY	1	2	2010-01-06	1228	\N	58469	\N
74812	GENERIC_DAY	1	2	2010-01-12	1220	\N	58469	\N
74813	GENERIC_DAY	1	0	2010-01-09	1220	\N	58469	\N
74814	GENERIC_DAY	1	2	2010-01-05	1217	\N	58469	\N
74815	GENERIC_DAY	1	0	2010-01-09	1230	\N	58469	\N
74816	GENERIC_DAY	1	2	2010-01-06	1220	\N	58469	\N
74817	GENERIC_DAY	1	3	2009-12-31	1217	\N	58469	\N
74818	GENERIC_DAY	1	2	2010-01-01	1220	\N	58469	\N
74819	GENERIC_DAY	1	3	2010-01-01	1217	\N	58469	\N
74820	GENERIC_DAY	1	2	2010-01-07	1230	\N	58469	\N
74821	GENERIC_DAY	1	2	2010-01-11	1217	\N	58469	\N
74822	GENERIC_DAY	1	2	2010-01-12	1217	\N	58469	\N
74823	GENERIC_DAY	1	0	2010-01-03	1217	\N	58469	\N
74824	GENERIC_DAY	1	2	2009-12-31	1230	\N	58469	\N
74825	GENERIC_DAY	1	2	2010-01-04	1220	\N	58469	\N
74826	GENERIC_DAY	1	0	2009-12-20	1217	\N	60704	\N
74827	GENERIC_DAY	1	2	2009-12-21	1217	\N	60704	\N
74828	GENERIC_DAY	1	2	2009-12-21	1230	\N	60704	\N
74829	GENERIC_DAY	1	0	2009-12-19	1217	\N	60704	\N
74830	GENERIC_DAY	1	2	2009-12-21	1228	\N	60704	\N
74831	GENERIC_DAY	1	2	2009-12-21	1220	\N	60704	\N
74832	GENERIC_DAY	1	0	2009-12-20	1230	\N	60704	\N
74833	GENERIC_DAY	1	0	2009-12-19	1228	\N	60704	\N
74834	GENERIC_DAY	1	0	2009-12-19	1220	\N	60704	\N
74835	GENERIC_DAY	1	0	2009-12-20	1220	\N	60704	\N
74836	GENERIC_DAY	1	0	2009-12-20	1228	\N	60704	\N
74837	GENERIC_DAY	1	0	2009-12-19	1230	\N	60704	\N
74838	GENERIC_DAY	1	2	2009-12-16	1220	\N	58384	\N
74839	GENERIC_DAY	1	1	2009-12-15	1217	\N	58384	\N
74840	GENERIC_DAY	1	2	2009-12-16	1230	\N	58384	\N
74841	GENERIC_DAY	1	3	2009-12-15	1228	\N	58384	\N
74842	GENERIC_DAY	1	2	2009-12-15	1220	\N	58384	\N
74843	GENERIC_DAY	1	2	2009-12-16	1228	\N	58384	\N
74844	GENERIC_DAY	1	2	2009-12-16	1217	\N	58384	\N
74845	GENERIC_DAY	1	2	2009-12-15	1230	\N	58384	\N
74846	GENERIC_DAY	1	2	2009-12-17	1228	\N	58455	\N
74847	GENERIC_DAY	1	2	2009-12-17	1220	\N	58455	\N
74848	GENERIC_DAY	1	2	2009-12-18	1228	\N	58455	\N
74849	GENERIC_DAY	1	2	2009-12-18	1220	\N	58455	\N
74850	GENERIC_DAY	1	2	2009-12-17	1230	\N	58455	\N
74851	GENERIC_DAY	1	2	2009-12-18	1217	\N	58455	\N
74852	GENERIC_DAY	1	2	2009-12-18	1230	\N	58455	\N
74853	GENERIC_DAY	1	2	2009-12-17	1217	\N	58455	\N
74854	GENERIC_DAY	1	2	2009-12-21	1228	\N	58456	\N
74855	GENERIC_DAY	1	2	2009-12-24	1228	\N	58456	\N
74856	GENERIC_DAY	1	2	2009-12-25	1220	\N	58456	\N
74857	GENERIC_DAY	1	0	2009-12-19	1220	\N	58456	\N
74858	GENERIC_DAY	1	0	2009-12-20	1230	\N	58456	\N
74859	GENERIC_DAY	1	0	2009-12-19	1217	\N	58456	\N
74860	GENERIC_DAY	1	2	2009-12-21	1220	\N	58456	\N
74861	GENERIC_DAY	1	2	2009-12-24	1230	\N	58456	\N
74862	GENERIC_DAY	1	0	2009-12-19	1228	\N	58456	\N
74863	GENERIC_DAY	1	2	2009-12-23	1230	\N	58456	\N
74864	GENERIC_DAY	1	2	2009-12-25	1230	\N	58456	\N
74865	GENERIC_DAY	1	2	2009-12-25	1228	\N	58456	\N
74866	GENERIC_DAY	1	2	2009-12-23	1220	\N	58456	\N
74867	GENERIC_DAY	1	0	2009-12-20	1220	\N	58456	\N
74868	GENERIC_DAY	1	0	2009-12-20	1217	\N	58456	\N
74869	GENERIC_DAY	1	2	2009-12-22	1220	\N	58456	\N
74870	GENERIC_DAY	1	0	2009-12-20	1228	\N	58456	\N
74871	GENERIC_DAY	1	2	2009-12-23	1217	\N	58456	\N
74872	GENERIC_DAY	1	2	2009-12-21	1230	\N	58456	\N
74873	GENERIC_DAY	1	2	2009-12-22	1217	\N	58456	\N
74874	GENERIC_DAY	1	2	2009-12-24	1220	\N	58456	\N
74875	GENERIC_DAY	1	2	2009-12-25	1217	\N	58456	\N
74876	GENERIC_DAY	1	2	2009-12-21	1217	\N	58456	\N
74877	GENERIC_DAY	1	2	2009-12-23	1228	\N	58456	\N
74878	GENERIC_DAY	1	0	2009-12-19	1230	\N	58456	\N
74879	GENERIC_DAY	1	2	2009-12-22	1230	\N	58456	\N
74880	GENERIC_DAY	1	2	2009-12-24	1217	\N	58456	\N
74881	GENERIC_DAY	1	2	2009-12-22	1228	\N	58456	\N
74882	GENERIC_DAY	1	2	2009-12-28	1230	\N	58472	\N
74883	GENERIC_DAY	1	0	2009-12-26	1228	\N	58472	\N
74884	GENERIC_DAY	1	2	2009-12-25	1220	\N	58472	\N
74885	GENERIC_DAY	1	0	2009-12-26	1217	\N	58472	\N
74886	GENERIC_DAY	1	2	2009-12-28	1228	\N	58472	\N
74887	GENERIC_DAY	1	0	2009-12-26	1220	\N	58472	\N
74888	GENERIC_DAY	1	0	2009-12-27	1230	\N	58472	\N
74889	GENERIC_DAY	1	2	2009-12-25	1230	\N	58472	\N
74890	GENERIC_DAY	1	2	2009-12-24	1228	\N	58472	\N
74891	GENERIC_DAY	1	0	2009-12-26	1230	\N	58472	\N
74892	GENERIC_DAY	1	2	2009-12-24	1230	\N	58472	\N
74893	GENERIC_DAY	1	2	2009-12-24	1220	\N	58472	\N
74894	GENERIC_DAY	1	2	2009-12-23	1217	\N	58472	\N
74895	GENERIC_DAY	1	2	2009-12-28	1220	\N	58472	\N
74896	GENERIC_DAY	1	2	2009-12-24	1217	\N	58472	\N
74897	GENERIC_DAY	1	2	2009-12-23	1230	\N	58472	\N
74898	GENERIC_DAY	1	2	2009-12-25	1228	\N	58472	\N
74899	GENERIC_DAY	1	0	2009-12-27	1228	\N	58472	\N
74900	GENERIC_DAY	1	2	2009-12-23	1220	\N	58472	\N
74901	GENERIC_DAY	1	0	2009-12-27	1217	\N	58472	\N
74902	GENERIC_DAY	1	2	2009-12-23	1228	\N	58472	\N
74903	GENERIC_DAY	1	0	2009-12-27	1220	\N	58472	\N
74904	GENERIC_DAY	1	2	2009-12-25	1217	\N	58472	\N
74905	GENERIC_DAY	1	2	2009-12-28	1217	\N	58472	\N
59955	GENERIC_DAY	7	0	2009-12-19	1226	\N	58457	\N
59961	GENERIC_DAY	7	3	2009-12-17	1222	\N	58457	\N
59949	GENERIC_DAY	7	0	2009-12-20	1214	\N	58457	\N
59947	GENERIC_DAY	7	0	2009-12-20	1222	\N	58457	\N
59958	GENERIC_DAY	7	0	2009-12-19	1222	\N	58457	\N
59959	GENERIC_DAY	7	2	2009-12-22	1226	\N	58457	\N
59954	GENERIC_DAY	7	3	2009-12-17	1214	\N	58457	\N
59946	GENERIC_DAY	7	3	2009-12-18	1222	\N	58457	\N
59964	GENERIC_DAY	7	3	2009-12-16	1214	\N	58457	\N
59965	GENERIC_DAY	7	3	2009-12-21	1214	\N	58457	\N
59963	GENERIC_DAY	7	2	2009-12-21	1226	\N	58457	\N
59952	GENERIC_DAY	7	3	2009-12-22	1222	\N	58457	\N
59960	GENERIC_DAY	7	2	2009-12-16	1226	\N	58457	\N
59948	GENERIC_DAY	7	3	2009-12-18	1214	\N	58457	\N
59950	GENERIC_DAY	7	3	2009-12-16	1222	\N	58457	\N
59951	GENERIC_DAY	7	0	2009-12-20	1226	\N	58457	\N
59962	GENERIC_DAY	7	0	2009-12-19	1214	\N	58457	\N
59956	GENERIC_DAY	7	3	2009-12-21	1222	\N	58457	\N
59953	GENERIC_DAY	7	2	2009-12-18	1226	\N	58457	\N
59957	GENERIC_DAY	7	3	2009-12-22	1214	\N	58457	\N
59966	GENERIC_DAY	7	2	2009-12-17	1226	\N	58457	\N
59968	GENERIC_DAY	7	7	2009-12-15	1224	\N	58458	\N
59967	GENERIC_DAY	7	8	2009-12-14	1224	\N	58458	\N
59997	GENERIC_DAY	7	2	2009-12-21	1228	\N	58459	\N
59994	GENERIC_DAY	7	2	2009-12-18	1230	\N	58459	\N
59990	GENERIC_DAY	7	2	2009-12-15	1220	\N	58459	\N
59988	GENERIC_DAY	7	2	2009-12-21	1217	\N	58459	\N
59992	GENERIC_DAY	7	0	2009-12-19	1220	\N	58459	\N
59979	GENERIC_DAY	7	2	2009-12-14	1230	\N	58459	\N
59986	GENERIC_DAY	7	2	2009-12-16	1217	\N	58459	\N
59978	GENERIC_DAY	7	2	2009-12-21	1220	\N	58459	\N
59972	GENERIC_DAY	7	2	2009-12-16	1230	\N	58459	\N
59969	GENERIC_DAY	7	2	2009-12-14	1228	\N	58459	\N
59975	GENERIC_DAY	7	2	2009-12-17	1228	\N	58459	\N
59971	GENERIC_DAY	7	0	2009-12-20	1220	\N	58459	\N
59993	GENERIC_DAY	7	2	2009-12-14	1217	\N	58459	\N
59998	GENERIC_DAY	7	2	2009-12-14	1220	\N	58459	\N
59973	GENERIC_DAY	7	0	2009-12-20	1230	\N	58459	\N
59983	GENERIC_DAY	7	0	2009-12-19	1228	\N	58459	\N
60000	GENERIC_DAY	7	0	2009-12-19	1230	\N	58459	\N
59999	GENERIC_DAY	7	2	2009-12-15	1230	\N	58459	\N
59982	GENERIC_DAY	7	2	2009-12-15	1217	\N	58459	\N
59985	GENERIC_DAY	7	2	2009-12-18	1217	\N	58459	\N
59995	GENERIC_DAY	7	2	2009-12-17	1220	\N	58459	\N
59974	GENERIC_DAY	7	2	2009-12-18	1228	\N	58459	\N
59991	GENERIC_DAY	7	2	2009-12-17	1230	\N	58459	\N
59981	GENERIC_DAY	7	0	2009-12-20	1228	\N	58459	\N
59989	GENERIC_DAY	7	2	2009-12-16	1220	\N	58459	\N
59970	GENERIC_DAY	7	0	2009-12-20	1217	\N	58459	\N
59984	GENERIC_DAY	7	2	2009-12-18	1220	\N	58459	\N
59980	GENERIC_DAY	7	2	2009-12-17	1217	\N	58459	\N
59977	GENERIC_DAY	7	2	2009-12-16	1228	\N	58459	\N
59976	GENERIC_DAY	7	2	2009-12-21	1230	\N	58459	\N
59996	GENERIC_DAY	7	2	2009-12-15	1228	\N	58459	\N
59987	GENERIC_DAY	7	0	2009-12-19	1217	\N	58459	\N
74906	GENERIC_DAY	1	0	2009-12-27	1217	\N	58460	\N
74907	GENERIC_DAY	1	0	2009-12-26	1220	\N	58460	\N
74908	GENERIC_DAY	1	2	2009-12-29	1220	\N	58460	\N
74909	GENERIC_DAY	1	0	2009-12-26	1217	\N	58460	\N
74910	GENERIC_DAY	1	2	2009-12-25	1230	\N	58460	\N
74911	GENERIC_DAY	1	0	2009-12-27	1228	\N	58460	\N
74912	GENERIC_DAY	1	2	2009-12-31	1220	\N	58460	\N
74913	GENERIC_DAY	1	2	2009-12-25	1217	\N	58460	\N
74914	GENERIC_DAY	1	2	2009-12-28	1217	\N	58460	\N
74915	GENERIC_DAY	1	2	2009-12-30	1228	\N	58460	\N
74916	GENERIC_DAY	1	2	2009-12-31	1230	\N	58460	\N
74917	GENERIC_DAY	1	2	2009-12-29	1228	\N	58460	\N
74918	GENERIC_DAY	1	2	2009-12-29	1230	\N	58460	\N
74919	GENERIC_DAY	1	2	2009-12-30	1220	\N	58460	\N
74920	GENERIC_DAY	1	2	2009-12-28	1220	\N	58460	\N
74921	GENERIC_DAY	1	0	2009-12-27	1230	\N	58460	\N
74922	GENERIC_DAY	1	2	2009-12-28	1230	\N	58460	\N
74923	GENERIC_DAY	1	0	2009-12-26	1228	\N	58460	\N
74924	GENERIC_DAY	1	2	2009-12-30	1230	\N	58460	\N
74925	GENERIC_DAY	1	2	2009-12-28	1228	\N	58460	\N
74926	GENERIC_DAY	1	2	2009-12-25	1228	\N	58460	\N
74927	GENERIC_DAY	1	2	2009-12-31	1228	\N	58460	\N
74928	GENERIC_DAY	1	0	2009-12-27	1220	\N	58460	\N
74929	GENERIC_DAY	1	2	2009-12-25	1220	\N	58460	\N
74930	GENERIC_DAY	1	2	2009-12-30	1217	\N	58460	\N
74931	GENERIC_DAY	1	0	2009-12-26	1230	\N	58460	\N
74932	GENERIC_DAY	1	2	2009-12-31	1217	\N	58460	\N
74933	GENERIC_DAY	1	2	2009-12-29	1217	\N	58460	\N
74934	SPECIFIC_DAY	1	0	2009-12-27	1217	60793	\N	\N
74935	SPECIFIC_DAY	1	0	2009-12-19	1217	60793	\N	\N
74936	SPECIFIC_DAY	1	2	2009-12-29	1217	60793	\N	\N
74937	SPECIFIC_DAY	1	2	2009-12-21	1217	60793	\N	\N
74938	SPECIFIC_DAY	1	2	2009-12-22	1217	60793	\N	\N
74939	SPECIFIC_DAY	1	2	2009-12-18	1217	60793	\N	\N
74940	SPECIFIC_DAY	1	0	2009-12-20	1217	60793	\N	\N
74941	SPECIFIC_DAY	1	2	2009-12-28	1217	60793	\N	\N
74942	SPECIFIC_DAY	1	2	2009-12-14	1217	60793	\N	\N
74943	SPECIFIC_DAY	1	2	2009-12-23	1217	60793	\N	\N
74944	SPECIFIC_DAY	1	2	2009-12-16	1217	60793	\N	\N
74945	SPECIFIC_DAY	1	0	2009-12-26	1217	60793	\N	\N
74946	SPECIFIC_DAY	1	2	2009-12-15	1217	60793	\N	\N
74947	SPECIFIC_DAY	1	2	2009-12-17	1217	60793	\N	\N
74948	SPECIFIC_DAY	1	2	2009-12-24	1217	60793	\N	\N
74949	SPECIFIC_DAY	1	2	2009-12-25	1217	60793	\N	\N
74950	SPECIFIC_DAY	1	1	2010-01-26	1217	60794	\N	\N
74951	SPECIFIC_DAY	1	1	2010-01-25	1217	60794	\N	\N
74952	SPECIFIC_DAY	1	0	2010-01-23	1217	60794	\N	\N
74953	SPECIFIC_DAY	1	1	2010-02-08	1217	60794	\N	\N
74954	SPECIFIC_DAY	1	0	2010-02-07	1217	60794	\N	\N
74955	SPECIFIC_DAY	1	1	2010-02-03	1217	60794	\N	\N
74956	SPECIFIC_DAY	1	1	2010-01-21	1217	60794	\N	\N
74957	SPECIFIC_DAY	1	1	2010-01-06	1217	60794	\N	\N
74958	SPECIFIC_DAY	1	0	2010-01-10	1217	60794	\N	\N
74959	SPECIFIC_DAY	1	1	2010-01-27	1217	60794	\N	\N
74960	SPECIFIC_DAY	1	1	2010-01-08	1217	60794	\N	\N
74961	SPECIFIC_DAY	1	1	2010-01-18	1217	60794	\N	\N
74962	SPECIFIC_DAY	1	1	2010-02-01	1217	60794	\N	\N
74963	SPECIFIC_DAY	1	0	2010-01-03	1217	60794	\N	\N
74964	SPECIFIC_DAY	1	1	2010-01-29	1217	60794	\N	\N
74965	SPECIFIC_DAY	1	1	2010-02-05	1217	60794	\N	\N
74966	SPECIFIC_DAY	1	1	2010-01-28	1217	60794	\N	\N
74967	SPECIFIC_DAY	1	1	2009-12-31	1217	60794	\N	\N
74968	SPECIFIC_DAY	1	0	2010-01-02	1217	60794	\N	\N
74969	SPECIFIC_DAY	1	1	2010-01-19	1217	60794	\N	\N
74970	SPECIFIC_DAY	1	1	2010-01-04	1217	60794	\N	\N
74971	SPECIFIC_DAY	1	1	2010-01-05	1217	60794	\N	\N
74972	SPECIFIC_DAY	1	0	2010-01-16	1217	60794	\N	\N
74973	SPECIFIC_DAY	1	1	2010-01-22	1217	60794	\N	\N
74974	SPECIFIC_DAY	1	1	2010-01-14	1217	60794	\N	\N
74975	SPECIFIC_DAY	1	1	2009-12-30	1217	60794	\N	\N
74976	SPECIFIC_DAY	1	1	2010-02-04	1217	60794	\N	\N
74977	SPECIFIC_DAY	1	1	2010-01-01	1217	60794	\N	\N
74978	SPECIFIC_DAY	1	0	2010-01-30	1217	60794	\N	\N
74979	SPECIFIC_DAY	1	1	2010-01-12	1217	60794	\N	\N
74980	SPECIFIC_DAY	1	1	2010-02-10	1217	60794	\N	\N
74981	SPECIFIC_DAY	1	0	2010-02-06	1217	60794	\N	\N
74982	SPECIFIC_DAY	1	1	2010-01-13	1217	60794	\N	\N
74983	SPECIFIC_DAY	1	0	2010-01-24	1217	60794	\N	\N
74984	SPECIFIC_DAY	1	1	2010-01-15	1217	60794	\N	\N
74985	SPECIFIC_DAY	1	1	2010-02-09	1217	60794	\N	\N
74986	SPECIFIC_DAY	1	1	2010-01-20	1217	60794	\N	\N
74987	SPECIFIC_DAY	1	1	2010-01-11	1217	60794	\N	\N
74988	SPECIFIC_DAY	1	1	2010-02-02	1217	60794	\N	\N
74989	SPECIFIC_DAY	1	1	2010-01-07	1217	60794	\N	\N
74990	SPECIFIC_DAY	1	0	2010-01-09	1217	60794	\N	\N
74991	SPECIFIC_DAY	1	1	2010-02-11	1217	60794	\N	\N
74992	SPECIFIC_DAY	1	0	2010-01-31	1217	60794	\N	\N
74993	SPECIFIC_DAY	1	0	2010-01-17	1217	60794	\N	\N
64704	GENERIC_DAY	2	2	2009-12-17	1230	\N	60792	\N
64696	GENERIC_DAY	2	2	2009-12-16	1217	\N	60792	\N
64702	GENERIC_DAY	2	2	2009-12-15	1228	\N	60792	\N
64701	GENERIC_DAY	2	2	2009-12-18	1220	\N	60792	\N
64708	GENERIC_DAY	2	2	2009-12-16	1230	\N	60792	\N
64695	GENERIC_DAY	2	2	2009-12-15	1230	\N	60792	\N
64706	GENERIC_DAY	2	2	2009-12-18	1228	\N	60792	\N
64699	GENERIC_DAY	2	2	2009-12-16	1228	\N	60792	\N
64691	GENERIC_DAY	2	2	2009-12-14	1220	\N	60792	\N
64694	GENERIC_DAY	2	2	2009-12-16	1220	\N	60792	\N
64693	GENERIC_DAY	2	2	2009-12-14	1217	\N	60792	\N
64709	GENERIC_DAY	2	2	2009-12-18	1230	\N	60792	\N
64705	GENERIC_DAY	2	2	2009-12-14	1228	\N	60792	\N
64703	GENERIC_DAY	2	2	2009-12-15	1217	\N	60792	\N
64698	GENERIC_DAY	2	2	2009-12-14	1230	\N	60792	\N
64710	GENERIC_DAY	2	2	2009-12-17	1217	\N	60792	\N
64707	GENERIC_DAY	2	2	2009-12-18	1217	\N	60792	\N
64692	GENERIC_DAY	2	2	2009-12-15	1220	\N	60792	\N
64697	GENERIC_DAY	2	2	2009-12-17	1220	\N	60792	\N
64700	GENERIC_DAY	2	2	2009-12-17	1228	\N	60792	\N
64615	GENERIC_DAY	2	2	2010-01-01	1220	\N	60790	\N
64640	GENERIC_DAY	2	2	2009-12-28	1230	\N	60790	\N
64633	GENERIC_DAY	2	2	2009-12-28	1228	\N	60790	\N
64620	GENERIC_DAY	2	2	2009-12-29	1217	\N	60790	\N
64623	GENERIC_DAY	2	2	2009-12-28	1217	\N	60790	\N
64641	GENERIC_DAY	2	2	2009-12-29	1230	\N	60790	\N
64619	GENERIC_DAY	2	0	2009-12-26	1230	\N	60790	\N
64627	GENERIC_DAY	2	2	2009-12-31	1220	\N	60790	\N
64630	GENERIC_DAY	2	2	2009-12-31	1217	\N	60790	\N
64626	GENERIC_DAY	2	0	2009-12-26	1220	\N	60790	\N
64639	GENERIC_DAY	2	2	2009-12-29	1228	\N	60790	\N
64637	GENERIC_DAY	2	2	2009-12-31	1228	\N	60790	\N
64625	GENERIC_DAY	2	2	2009-12-28	1220	\N	60790	\N
64635	GENERIC_DAY	2	0	2009-12-27	1228	\N	60790	\N
64621	GENERIC_DAY	2	2	2009-12-30	1228	\N	60790	\N
64632	GENERIC_DAY	2	2	2009-12-30	1220	\N	60790	\N
64617	GENERIC_DAY	2	0	2009-12-26	1228	\N	60790	\N
64638	GENERIC_DAY	2	2	2010-01-01	1230	\N	60790	\N
64634	GENERIC_DAY	2	2	2010-01-01	1228	\N	60790	\N
64622	GENERIC_DAY	2	2	2009-12-29	1220	\N	60790	\N
64636	GENERIC_DAY	2	0	2009-12-26	1217	\N	60790	\N
64618	GENERIC_DAY	2	2	2010-01-01	1217	\N	60790	\N
64629	GENERIC_DAY	2	0	2009-12-27	1220	\N	60790	\N
64628	GENERIC_DAY	2	2	2009-12-30	1217	\N	60790	\N
64624	GENERIC_DAY	2	0	2009-12-27	1217	\N	60790	\N
64631	GENERIC_DAY	2	2	2009-12-31	1230	\N	60790	\N
64616	GENERIC_DAY	2	0	2009-12-27	1230	\N	60790	\N
64642	GENERIC_DAY	2	2	2009-12-30	1230	\N	60790	\N
74994	GENERIC_DAY	1	0	2010-01-17	1228	\N	60752	\N
74995	GENERIC_DAY	1	2	2010-01-20	1220	\N	60752	\N
74996	GENERIC_DAY	1	2	2010-01-19	1220	\N	60752	\N
74997	GENERIC_DAY	1	0	2010-01-17	1217	\N	60752	\N
74998	GENERIC_DAY	1	2	2010-01-20	1228	\N	60752	\N
74999	GENERIC_DAY	1	2	2010-01-20	1217	\N	60752	\N
75000	GENERIC_DAY	1	2	2010-01-18	1217	\N	60752	\N
75001	GENERIC_DAY	1	2	2010-01-19	1217	\N	60752	\N
75002	GENERIC_DAY	1	0	2010-01-17	1220	\N	60752	\N
75003	GENERIC_DAY	1	0	2010-01-17	1230	\N	60752	\N
75004	GENERIC_DAY	1	0	2010-01-16	1217	\N	60752	\N
75005	GENERIC_DAY	1	2	2010-01-19	1228	\N	60752	\N
75006	GENERIC_DAY	1	2	2010-01-18	1230	\N	60752	\N
75007	GENERIC_DAY	1	2	2010-01-18	1220	\N	60752	\N
75008	GENERIC_DAY	1	0	2010-01-16	1230	\N	60752	\N
75009	GENERIC_DAY	1	2	2010-01-20	1230	\N	60752	\N
75010	GENERIC_DAY	1	2	2010-01-19	1230	\N	60752	\N
75011	GENERIC_DAY	1	2	2010-01-18	1228	\N	60752	\N
75012	GENERIC_DAY	1	0	2010-01-16	1220	\N	60752	\N
75013	GENERIC_DAY	1	0	2010-01-16	1228	\N	60752	\N
75014	GENERIC_DAY	1	0	2010-01-31	1230	\N	60753	\N
75015	GENERIC_DAY	1	3	2010-02-02	1217	\N	60753	\N
75016	GENERIC_DAY	1	0	2010-01-30	1230	\N	60753	\N
75017	GENERIC_DAY	1	1	2010-02-05	1220	\N	60753	\N
75018	GENERIC_DAY	1	4	2010-02-03	1228	\N	60753	\N
75019	GENERIC_DAY	1	0	2010-02-08	1217	\N	60753	\N
75020	GENERIC_DAY	1	0	2010-01-31	1228	\N	60753	\N
75021	GENERIC_DAY	1	0	2010-02-06	1228	\N	60753	\N
75022	GENERIC_DAY	1	1	2010-02-04	1220	\N	60753	\N
75023	GENERIC_DAY	1	4	2010-02-08	1230	\N	60753	\N
75024	GENERIC_DAY	1	0	2010-02-07	1230	\N	60753	\N
75025	GENERIC_DAY	1	0	2010-01-30	1228	\N	60753	\N
75026	GENERIC_DAY	1	0	2010-02-07	1228	\N	60753	\N
75027	GENERIC_DAY	1	2	2010-02-02	1220	\N	60753	\N
75028	GENERIC_DAY	1	4	2010-02-08	1228	\N	60753	\N
75029	GENERIC_DAY	1	0	2010-02-07	1220	\N	60753	\N
75030	GENERIC_DAY	1	0	2010-01-30	1217	\N	60753	\N
75031	GENERIC_DAY	1	0	2010-02-03	1230	\N	60753	\N
75032	GENERIC_DAY	1	4	2010-02-03	1220	\N	60753	\N
75033	GENERIC_DAY	1	5	2010-02-05	1228	\N	60753	\N
75034	GENERIC_DAY	1	1	2010-02-04	1217	\N	60753	\N
75035	GENERIC_DAY	1	0	2010-02-03	1217	\N	60753	\N
75036	GENERIC_DAY	1	0	2010-02-07	1217	\N	60753	\N
75037	GENERIC_DAY	1	0	2010-02-06	1230	\N	60753	\N
75038	GENERIC_DAY	1	0	2010-02-06	1217	\N	60753	\N
75039	GENERIC_DAY	1	0	2010-02-02	1230	\N	60753	\N
75040	GENERIC_DAY	1	0	2010-02-06	1220	\N	60753	\N
75041	GENERIC_DAY	1	3	2010-02-02	1228	\N	60753	\N
75042	GENERIC_DAY	1	3	2010-02-01	1228	\N	60753	\N
75043	GENERIC_DAY	1	1	2010-02-05	1217	\N	60753	\N
75044	GENERIC_DAY	1	1	2010-02-04	1230	\N	60753	\N
75045	GENERIC_DAY	1	0	2010-02-01	1230	\N	60753	\N
75046	GENERIC_DAY	1	3	2010-02-01	1217	\N	60753	\N
75047	GENERIC_DAY	1	0	2010-01-30	1220	\N	60753	\N
75048	GENERIC_DAY	1	0	2010-01-31	1217	\N	60753	\N
75049	GENERIC_DAY	1	5	2010-02-04	1228	\N	60753	\N
75050	GENERIC_DAY	1	0	2010-01-31	1220	\N	60753	\N
75051	GENERIC_DAY	1	1	2010-02-05	1230	\N	60753	\N
75052	GENERIC_DAY	1	2	2010-02-01	1220	\N	60753	\N
75053	GENERIC_DAY	1	0	2010-02-08	1220	\N	60753	\N
75054	GENERIC_DAY	1	1	2010-01-07	1228	\N	60754	\N
75055	GENERIC_DAY	1	2	2010-01-06	1217	\N	60754	\N
75056	GENERIC_DAY	1	2	2010-01-04	1220	\N	60754	\N
75057	GENERIC_DAY	1	2	2010-01-05	1217	\N	60754	\N
75058	GENERIC_DAY	1	0	2010-01-03	1228	\N	60754	\N
75059	GENERIC_DAY	1	2	2010-01-04	1228	\N	60754	\N
75060	GENERIC_DAY	1	2	2010-01-05	1228	\N	60754	\N
75061	GENERIC_DAY	1	0	2010-01-03	1217	\N	60754	\N
75062	GENERIC_DAY	1	1	2010-01-07	1230	\N	60754	\N
75063	GENERIC_DAY	1	2	2010-01-05	1220	\N	60754	\N
75064	GENERIC_DAY	1	1	2010-01-07	1217	\N	60754	\N
75065	GENERIC_DAY	1	0	2010-01-02	1230	\N	60754	\N
75066	GENERIC_DAY	1	0	2010-01-02	1217	\N	60754	\N
75067	GENERIC_DAY	1	2	2010-01-04	1217	\N	60754	\N
75068	GENERIC_DAY	1	0	2010-01-02	1220	\N	60754	\N
75069	GENERIC_DAY	1	0	2010-01-02	1228	\N	60754	\N
75070	GENERIC_DAY	1	2	2010-01-06	1228	\N	60754	\N
75071	GENERIC_DAY	1	0	2010-01-03	1220	\N	60754	\N
75072	GENERIC_DAY	1	0	2010-01-03	1230	\N	60754	\N
75073	GENERIC_DAY	1	2	2010-01-05	1230	\N	60754	\N
75074	GENERIC_DAY	1	2	2010-01-04	1230	\N	60754	\N
75075	GENERIC_DAY	1	2	2010-01-06	1230	\N	60754	\N
75076	GENERIC_DAY	1	2	2010-01-06	1220	\N	60754	\N
75077	GENERIC_DAY	1	1	2010-01-07	1220	\N	60754	\N
60974	GENERIC_DAY	4	2	2009-12-29	1220	\N	60705	\N
60937	GENERIC_DAY	4	2	2010-01-07	1228	\N	60705	\N
60985	GENERIC_DAY	4	2	2009-12-25	1220	\N	60705	\N
60940	GENERIC_DAY	4	2	2009-12-29	1228	\N	60705	\N
60909	GENERIC_DAY	4	0	2010-01-09	1220	\N	60705	\N
60916	GENERIC_DAY	4	2	2009-12-28	1217	\N	60705	\N
60958	GENERIC_DAY	4	2	2010-01-11	1230	\N	60705	\N
60951	GENERIC_DAY	4	2	2010-01-06	1228	\N	60705	\N
60957	GENERIC_DAY	4	2	2010-01-05	1220	\N	60705	\N
60960	GENERIC_DAY	4	0	2009-12-26	1220	\N	60705	\N
60942	GENERIC_DAY	4	0	2010-01-02	1217	\N	60705	\N
60948	GENERIC_DAY	4	0	2010-01-02	1220	\N	60705	\N
60969	GENERIC_DAY	4	0	2010-01-09	1228	\N	60705	\N
60938	GENERIC_DAY	4	2	2010-01-01	1220	\N	60705	\N
60947	GENERIC_DAY	4	2	2010-01-01	1217	\N	60705	\N
60981	GENERIC_DAY	4	2	2010-01-07	1217	\N	60705	\N
60934	GENERIC_DAY	4	2	2009-12-29	1217	\N	60705	\N
60949	GENERIC_DAY	4	2	2009-12-25	1217	\N	60705	\N
60984	GENERIC_DAY	4	0	2010-01-10	1228	\N	60705	\N
60935	GENERIC_DAY	4	2	2009-12-30	1230	\N	60705	\N
60976	GENERIC_DAY	4	2	2010-01-06	1230	\N	60705	\N
60964	GENERIC_DAY	4	0	2009-12-27	1228	\N	60705	\N
60928	GENERIC_DAY	4	0	2010-01-09	1230	\N	60705	\N
60944	GENERIC_DAY	4	2	2009-12-28	1228	\N	60705	\N
60941	GENERIC_DAY	4	2	2009-12-22	1230	\N	60705	\N
60906	GENERIC_DAY	4	2	2009-12-25	1228	\N	60705	\N
60982	GENERIC_DAY	4	2	2009-12-23	1230	\N	60705	\N
60911	GENERIC_DAY	4	0	2009-12-27	1220	\N	60705	\N
60923	GENERIC_DAY	4	2	2009-12-22	1220	\N	60705	\N
60967	GENERIC_DAY	4	2	2009-12-30	1220	\N	60705	\N
60950	GENERIC_DAY	4	2	2009-12-31	1220	\N	60705	\N
60910	GENERIC_DAY	4	2	2010-01-07	1230	\N	60705	\N
60970	GENERIC_DAY	4	2	2010-01-07	1220	\N	60705	\N
60966	GENERIC_DAY	4	0	2009-12-26	1228	\N	60705	\N
60925	GENERIC_DAY	4	2	2010-01-08	1230	\N	60705	\N
60929	GENERIC_DAY	4	2	2009-12-25	1230	\N	60705	\N
60939	GENERIC_DAY	4	0	2010-01-09	1217	\N	60705	\N
60975	GENERIC_DAY	4	0	2009-12-26	1230	\N	60705	\N
60963	GENERIC_DAY	4	0	2010-01-10	1217	\N	60705	\N
60987	GENERIC_DAY	4	2	2010-01-06	1220	\N	60705	\N
60971	GENERIC_DAY	4	2	2009-12-23	1228	\N	60705	\N
60978	GENERIC_DAY	4	0	2010-01-10	1220	\N	60705	\N
60917	GENERIC_DAY	4	2	2009-12-29	1230	\N	60705	\N
60953	GENERIC_DAY	4	2	2009-12-24	1228	\N	60705	\N
60983	GENERIC_DAY	4	0	2009-12-26	1217	\N	60705	\N
60946	GENERIC_DAY	4	2	2009-12-24	1230	\N	60705	\N
60989	GENERIC_DAY	4	2	2010-01-08	1217	\N	60705	\N
60921	GENERIC_DAY	4	0	2009-12-27	1217	\N	60705	\N
60927	GENERIC_DAY	4	2	2010-01-06	1217	\N	60705	\N
60954	GENERIC_DAY	4	2	2009-12-31	1217	\N	60705	\N
60932	GENERIC_DAY	4	2	2010-01-08	1228	\N	60705	\N
60968	GENERIC_DAY	4	2	2009-12-24	1220	\N	60705	\N
60959	GENERIC_DAY	4	2	2009-12-30	1217	\N	60705	\N
60907	GENERIC_DAY	4	2	2010-01-11	1217	\N	60705	\N
60956	GENERIC_DAY	4	0	2010-01-03	1217	\N	60705	\N
60922	GENERIC_DAY	4	2	2009-12-28	1220	\N	60705	\N
60962	GENERIC_DAY	4	2	2009-12-31	1230	\N	60705	\N
60915	GENERIC_DAY	4	2	2010-01-04	1220	\N	60705	\N
60913	GENERIC_DAY	4	2	2010-01-04	1228	\N	60705	\N
60919	GENERIC_DAY	4	2	2009-12-22	1228	\N	60705	\N
60936	GENERIC_DAY	4	2	2010-01-11	1220	\N	60705	\N
60980	GENERIC_DAY	4	0	2010-01-03	1230	\N	60705	\N
60943	GENERIC_DAY	4	2	2009-12-23	1220	\N	60705	\N
60979	GENERIC_DAY	4	2	2009-12-30	1228	\N	60705	\N
60924	GENERIC_DAY	4	2	2009-12-24	1217	\N	60705	\N
60931	GENERIC_DAY	4	0	2010-01-03	1228	\N	60705	\N
60908	GENERIC_DAY	4	2	2010-01-04	1217	\N	60705	\N
60965	GENERIC_DAY	4	0	2010-01-02	1230	\N	60705	\N
60945	GENERIC_DAY	4	2	2010-01-11	1228	\N	60705	\N
60930	GENERIC_DAY	4	2	2009-12-22	1217	\N	60705	\N
60918	GENERIC_DAY	4	0	2009-12-27	1230	\N	60705	\N
60952	GENERIC_DAY	4	2	2010-01-01	1230	\N	60705	\N
60920	GENERIC_DAY	4	0	2010-01-03	1220	\N	60705	\N
60926	GENERIC_DAY	4	2	2010-01-08	1220	\N	60705	\N
60912	GENERIC_DAY	4	2	2010-01-05	1217	\N	60705	\N
60933	GENERIC_DAY	4	2	2009-12-23	1217	\N	60705	\N
60977	GENERIC_DAY	4	2	2010-01-05	1228	\N	60705	\N
60914	GENERIC_DAY	4	0	2010-01-02	1228	\N	60705	\N
60986	GENERIC_DAY	4	2	2009-12-31	1228	\N	60705	\N
60972	GENERIC_DAY	4	0	2010-01-10	1230	\N	60705	\N
60973	GENERIC_DAY	4	2	2009-12-28	1230	\N	60705	\N
60955	GENERIC_DAY	4	2	2010-01-01	1228	\N	60705	\N
60988	GENERIC_DAY	4	2	2010-01-05	1230	\N	60705	\N
60961	GENERIC_DAY	4	2	2010-01-04	1230	\N	60705	\N
62415	GENERIC_DAY	3	2	2010-01-21	1217	\N	60755	\N
62409	GENERIC_DAY	3	0	2010-01-24	1230	\N	60755	\N
62402	GENERIC_DAY	3	2	2010-01-25	1228	\N	60755	\N
62417	GENERIC_DAY	3	2	2010-01-25	1217	\N	60755	\N
62401	GENERIC_DAY	3	0	2010-01-24	1217	\N	60755	\N
62418	GENERIC_DAY	3	2	2010-01-21	1228	\N	60755	\N
62421	GENERIC_DAY	3	2	2010-01-25	1220	\N	60755	\N
62414	GENERIC_DAY	3	2	2010-01-26	1230	\N	60755	\N
62398	GENERIC_DAY	3	0	2010-01-23	1217	\N	60755	\N
62412	GENERIC_DAY	3	2	2010-01-26	1217	\N	60755	\N
62411	GENERIC_DAY	3	2	2010-01-21	1230	\N	60755	\N
62419	GENERIC_DAY	3	2	2010-01-22	1220	\N	60755	\N
62399	GENERIC_DAY	3	0	2010-01-23	1220	\N	60755	\N
62400	GENERIC_DAY	3	0	2010-01-23	1230	\N	60755	\N
62420	GENERIC_DAY	3	2	2010-01-26	1228	\N	60755	\N
62410	GENERIC_DAY	3	2	2010-01-22	1217	\N	60755	\N
62406	GENERIC_DAY	3	0	2010-01-23	1228	\N	60755	\N
62413	GENERIC_DAY	3	2	2010-01-25	1230	\N	60755	\N
62404	GENERIC_DAY	3	2	2010-01-26	1220	\N	60755	\N
62407	GENERIC_DAY	3	2	2010-01-22	1228	\N	60755	\N
62408	GENERIC_DAY	3	0	2010-01-24	1228	\N	60755	\N
62405	GENERIC_DAY	3	2	2010-01-21	1220	\N	60755	\N
62416	GENERIC_DAY	3	2	2010-01-22	1230	\N	60755	\N
62403	GENERIC_DAY	3	0	2010-01-24	1220	\N	60755	\N
64644	GENERIC_DAY	2	2	2010-01-04	1220	\N	60791	\N
64664	GENERIC_DAY	2	2	2010-01-04	1230	\N	60791	\N
64663	GENERIC_DAY	2	2	2010-01-05	1228	\N	60791	\N
64676	GENERIC_DAY	2	2	2010-01-01	1230	\N	60791	\N
64683	GENERIC_DAY	2	2	2010-01-06	1220	\N	60791	\N
64688	GENERIC_DAY	2	0	2010-01-03	1230	\N	60791	\N
64668	GENERIC_DAY	2	0	2010-01-02	1220	\N	60791	\N
64686	GENERIC_DAY	2	0	2009-12-26	1228	\N	60791	\N
64672	GENERIC_DAY	2	2	2010-01-01	1228	\N	60791	\N
64646	GENERIC_DAY	2	2	2010-01-05	1230	\N	60791	\N
64652	GENERIC_DAY	2	2	2010-01-05	1220	\N	60791	\N
64673	GENERIC_DAY	2	0	2009-12-27	1230	\N	60791	\N
64690	GENERIC_DAY	2	2	2010-01-01	1220	\N	60791	\N
64647	GENERIC_DAY	2	2	2009-12-29	1228	\N	60791	\N
64677	GENERIC_DAY	2	2	2009-12-29	1220	\N	60791	\N
64667	GENERIC_DAY	2	0	2010-01-03	1228	\N	60791	\N
64659	GENERIC_DAY	2	2	2010-01-04	1228	\N	60791	\N
64661	GENERIC_DAY	2	2	2009-12-29	1217	\N	60791	\N
64681	GENERIC_DAY	2	2	2009-12-28	1230	\N	60791	\N
64675	GENERIC_DAY	2	2	2009-12-30	1230	\N	60791	\N
64670	GENERIC_DAY	2	2	2009-12-30	1228	\N	60791	\N
64649	GENERIC_DAY	2	0	2010-01-03	1220	\N	60791	\N
64654	GENERIC_DAY	2	2	2009-12-29	1230	\N	60791	\N
64660	GENERIC_DAY	2	2	2009-12-30	1217	\N	60791	\N
64662	GENERIC_DAY	2	2	2010-01-06	1228	\N	60791	\N
64665	GENERIC_DAY	2	2	2010-01-05	1217	\N	60791	\N
64689	GENERIC_DAY	2	0	2010-01-02	1228	\N	60791	\N
64648	GENERIC_DAY	2	0	2009-12-26	1220	\N	60791	\N
64685	GENERIC_DAY	2	2	2009-12-28	1228	\N	60791	\N
64650	GENERIC_DAY	2	2	2009-12-31	1217	\N	60791	\N
64651	GENERIC_DAY	2	0	2009-12-27	1220	\N	60791	\N
64679	GENERIC_DAY	2	0	2009-12-27	1217	\N	60791	\N
64658	GENERIC_DAY	2	0	2009-12-27	1228	\N	60791	\N
64682	GENERIC_DAY	2	2	2010-01-06	1217	\N	60791	\N
64674	GENERIC_DAY	2	2	2009-12-30	1220	\N	60791	\N
64655	GENERIC_DAY	2	0	2009-12-26	1230	\N	60791	\N
64669	GENERIC_DAY	2	2	2010-01-01	1217	\N	60791	\N
64645	GENERIC_DAY	2	0	2009-12-26	1217	\N	60791	\N
64671	GENERIC_DAY	2	2	2009-12-31	1230	\N	60791	\N
64656	GENERIC_DAY	2	2	2009-12-31	1220	\N	60791	\N
64678	GENERIC_DAY	2	2	2009-12-28	1217	\N	60791	\N
64684	GENERIC_DAY	2	0	2010-01-02	1230	\N	60791	\N
64653	GENERIC_DAY	2	2	2010-01-06	1230	\N	60791	\N
64687	GENERIC_DAY	2	0	2010-01-03	1217	\N	60791	\N
64643	GENERIC_DAY	2	2	2009-12-31	1228	\N	60791	\N
64666	GENERIC_DAY	2	2	2010-01-04	1217	\N	60791	\N
64680	GENERIC_DAY	2	0	2010-01-02	1217	\N	60791	\N
64657	GENERIC_DAY	2	2	2009-12-28	1220	\N	60791	\N
75078	GENERIC_DAY	1	2	2010-01-04	1220	\N	58450	\N
75079	GENERIC_DAY	1	2	2010-01-01	1217	\N	58450	\N
75080	GENERIC_DAY	1	0	2010-01-02	1220	\N	58450	\N
75081	GENERIC_DAY	1	2	2010-01-04	1230	\N	58450	\N
75082	GENERIC_DAY	1	0	2010-01-02	1217	\N	58450	\N
75083	GENERIC_DAY	1	0	2010-01-03	1220	\N	58450	\N
75084	GENERIC_DAY	1	2	2010-01-01	1230	\N	58450	\N
75085	GENERIC_DAY	1	0	2010-01-03	1217	\N	58450	\N
75086	GENERIC_DAY	1	0	2010-01-02	1228	\N	58450	\N
75087	GENERIC_DAY	1	2	2010-01-04	1217	\N	58450	\N
75088	GENERIC_DAY	1	0	2010-01-03	1230	\N	58450	\N
75089	GENERIC_DAY	1	0	2010-01-03	1228	\N	58450	\N
75090	GENERIC_DAY	1	2	2010-01-04	1228	\N	58450	\N
75091	GENERIC_DAY	1	2	2010-01-01	1228	\N	58450	\N
75092	GENERIC_DAY	1	2	2010-01-01	1220	\N	58450	\N
75093	GENERIC_DAY	1	0	2010-01-02	1230	\N	58450	\N
75094	GENERIC_DAY	1	2	2010-01-08	1217	\N	58451	\N
75095	GENERIC_DAY	1	2	2010-01-06	1228	\N	58451	\N
75096	GENERIC_DAY	1	2	2010-01-08	1228	\N	58451	\N
75097	GENERIC_DAY	1	2	2010-01-07	1217	\N	58451	\N
75098	GENERIC_DAY	1	2	2010-01-07	1228	\N	58451	\N
75099	GENERIC_DAY	1	2	2010-01-06	1220	\N	58451	\N
75100	GENERIC_DAY	1	2	2010-01-07	1220	\N	58451	\N
75101	GENERIC_DAY	1	2	2010-01-07	1230	\N	58451	\N
75102	GENERIC_DAY	1	2	2010-01-05	1220	\N	58451	\N
75103	GENERIC_DAY	1	2	2010-01-06	1230	\N	58451	\N
75104	GENERIC_DAY	1	2	2010-01-06	1217	\N	58451	\N
75105	GENERIC_DAY	1	2	2010-01-08	1230	\N	58451	\N
75106	GENERIC_DAY	1	2	2010-01-05	1217	\N	58451	\N
75107	GENERIC_DAY	1	2	2010-01-08	1220	\N	58451	\N
75108	GENERIC_DAY	1	2	2010-01-05	1230	\N	58451	\N
75109	GENERIC_DAY	1	2	2010-01-05	1228	\N	58451	\N
75110	GENERIC_DAY	1	2	2010-01-15	1217	\N	58452	\N
75111	GENERIC_DAY	1	2	2010-01-14	1217	\N	58452	\N
75112	GENERIC_DAY	1	2	2010-01-12	1217	\N	58452	\N
75113	GENERIC_DAY	1	0	2010-01-09	1220	\N	58452	\N
75114	GENERIC_DAY	1	0	2010-01-10	1230	\N	58452	\N
75115	GENERIC_DAY	1	2	2010-01-13	1217	\N	58452	\N
75116	GENERIC_DAY	1	2	2010-01-14	1230	\N	58452	\N
75117	GENERIC_DAY	1	2	2010-01-11	1228	\N	58452	\N
75118	GENERIC_DAY	1	2	2010-01-12	1228	\N	58452	\N
75119	GENERIC_DAY	1	2	2010-01-11	1230	\N	58452	\N
75120	GENERIC_DAY	1	0	2010-01-09	1228	\N	58452	\N
75121	GENERIC_DAY	1	0	2010-01-09	1230	\N	58452	\N
75122	GENERIC_DAY	1	2	2010-01-13	1230	\N	58452	\N
75123	GENERIC_DAY	1	2	2010-01-15	1228	\N	58452	\N
75124	GENERIC_DAY	1	0	2010-01-10	1228	\N	58452	\N
75125	GENERIC_DAY	1	2	2010-01-13	1228	\N	58452	\N
75126	GENERIC_DAY	1	2	2010-01-13	1220	\N	58452	\N
75127	GENERIC_DAY	1	2	2010-01-14	1228	\N	58452	\N
75128	GENERIC_DAY	1	2	2010-01-11	1220	\N	58452	\N
75129	GENERIC_DAY	1	0	2010-01-10	1217	\N	58452	\N
75130	GENERIC_DAY	1	0	2010-01-10	1220	\N	58452	\N
75131	GENERIC_DAY	1	2	2010-01-12	1220	\N	58452	\N
75132	GENERIC_DAY	1	2	2010-01-12	1230	\N	58452	\N
75133	GENERIC_DAY	1	2	2010-01-14	1220	\N	58452	\N
75134	GENERIC_DAY	1	0	2010-01-09	1217	\N	58452	\N
75135	GENERIC_DAY	1	2	2010-01-11	1217	\N	58452	\N
75136	GENERIC_DAY	1	2	2010-01-15	1220	\N	58452	\N
75137	GENERIC_DAY	1	2	2010-01-15	1230	\N	58452	\N
75138	GENERIC_DAY	1	0	2010-01-17	1228	\N	58453	\N
75139	GENERIC_DAY	1	2	2010-01-19	1220	\N	58453	\N
75140	GENERIC_DAY	1	2	2010-01-18	1228	\N	58453	\N
75141	GENERIC_DAY	1	0	2010-01-16	1220	\N	58453	\N
75142	GENERIC_DAY	1	0	2010-01-17	1217	\N	58453	\N
75143	GENERIC_DAY	1	2	2010-01-19	1230	\N	58453	\N
75144	GENERIC_DAY	1	2	2010-01-19	1217	\N	58453	\N
75145	GENERIC_DAY	1	2	2010-01-18	1230	\N	58453	\N
75146	GENERIC_DAY	1	2	2010-01-18	1217	\N	58453	\N
75147	GENERIC_DAY	1	0	2010-01-17	1230	\N	58453	\N
75148	GENERIC_DAY	1	0	2010-01-16	1217	\N	58453	\N
75149	GENERIC_DAY	1	0	2010-01-16	1230	\N	58453	\N
75150	GENERIC_DAY	1	2	2010-01-19	1228	\N	58453	\N
75151	GENERIC_DAY	1	2	2010-01-18	1220	\N	58453	\N
75152	GENERIC_DAY	1	0	2010-01-17	1220	\N	58453	\N
75153	GENERIC_DAY	1	0	2010-01-16	1228	\N	58453	\N
75154	GENERIC_DAY	1	0	2010-01-24	1220	\N	58454	\N
75155	GENERIC_DAY	1	2	2010-01-22	1230	\N	58454	\N
75156	GENERIC_DAY	1	2	2010-01-25	1230	\N	58454	\N
75157	GENERIC_DAY	1	2	2010-01-25	1217	\N	58454	\N
75158	GENERIC_DAY	1	2	2010-01-20	1228	\N	58454	\N
75159	GENERIC_DAY	1	2	2010-01-20	1230	\N	58454	\N
75160	GENERIC_DAY	1	2	2010-01-21	1220	\N	58454	\N
75161	GENERIC_DAY	1	0	2010-01-23	1228	\N	58454	\N
75162	GENERIC_DAY	1	2	2010-01-25	1220	\N	58454	\N
75163	GENERIC_DAY	1	0	2010-01-24	1230	\N	58454	\N
75164	GENERIC_DAY	1	2	2010-01-20	1220	\N	58454	\N
75165	GENERIC_DAY	1	0	2010-01-23	1230	\N	58454	\N
75166	GENERIC_DAY	1	0	2010-01-24	1217	\N	58454	\N
75167	GENERIC_DAY	1	2	2010-01-20	1217	\N	58454	\N
75168	GENERIC_DAY	1	0	2010-01-24	1228	\N	58454	\N
75169	GENERIC_DAY	1	2	2010-01-21	1230	\N	58454	\N
75170	GENERIC_DAY	1	2	2010-01-22	1228	\N	58454	\N
75171	GENERIC_DAY	1	0	2010-01-23	1217	\N	58454	\N
75172	GENERIC_DAY	1	2	2010-01-21	1228	\N	58454	\N
75173	GENERIC_DAY	1	2	2010-01-25	1228	\N	58454	\N
75174	GENERIC_DAY	1	0	2010-01-23	1220	\N	58454	\N
75175	GENERIC_DAY	1	2	2010-01-21	1217	\N	58454	\N
75176	GENERIC_DAY	1	2	2010-01-22	1220	\N	58454	\N
75177	GENERIC_DAY	1	2	2010-01-22	1217	\N	58454	\N
75178	GENERIC_DAY	1	2	2010-01-27	1228	\N	60751	\N
75179	GENERIC_DAY	1	2	2010-01-28	1220	\N	60751	\N
75180	GENERIC_DAY	1	2	2010-01-28	1217	\N	60751	\N
75181	GENERIC_DAY	1	2	2010-01-27	1220	\N	60751	\N
75182	GENERIC_DAY	1	2	2010-01-29	1230	\N	60751	\N
75183	GENERIC_DAY	1	2	2010-01-29	1217	\N	60751	\N
75184	GENERIC_DAY	1	2	2010-01-29	1228	\N	60751	\N
75185	GENERIC_DAY	1	2	2010-01-28	1228	\N	60751	\N
75186	GENERIC_DAY	1	2	2010-01-27	1230	\N	60751	\N
75187	GENERIC_DAY	1	2	2010-01-28	1230	\N	60751	\N
75188	GENERIC_DAY	1	2	2010-01-27	1217	\N	60751	\N
75189	GENERIC_DAY	1	2	2010-01-29	1220	\N	60751	\N
60890	GENERIC_DAY	4	2	2009-12-16	1220	\N	60703	\N
60892	GENERIC_DAY	4	2	2009-12-15	1228	\N	60703	\N
60889	GENERIC_DAY	4	2	2009-12-17	1228	\N	60703	\N
60881	GENERIC_DAY	4	2	2009-12-18	1230	\N	60703	\N
60882	GENERIC_DAY	4	2	2009-12-17	1217	\N	60703	\N
60886	GENERIC_DAY	4	2	2009-12-14	1230	\N	60703	\N
60876	GENERIC_DAY	4	2	2009-12-16	1217	\N	60703	\N
60875	GENERIC_DAY	4	2	2009-12-15	1220	\N	60703	\N
60879	GENERIC_DAY	4	2	2009-12-15	1230	\N	60703	\N
75190	GENERIC_DAY	1	1	2010-01-21	1214	\N	68413	\N
75191	GENERIC_DAY	1	0	2009-12-27	1226	\N	68413	\N
75192	GENERIC_DAY	1	2	2009-12-18	1222	\N	68413	\N
75193	GENERIC_DAY	1	1	2010-01-25	1214	\N	68413	\N
75194	GENERIC_DAY	1	3	2010-01-29	1226	\N	68413	\N
75195	GENERIC_DAY	1	2	2009-12-30	1222	\N	68413	\N
75196	GENERIC_DAY	1	3	2009-12-30	1226	\N	68413	\N
75197	GENERIC_DAY	1	3	2010-01-25	1226	\N	68413	\N
75198	GENERIC_DAY	1	0	2010-01-30	1222	\N	68413	\N
75199	GENERIC_DAY	1	0	2009-12-26	1214	\N	68413	\N
75200	GENERIC_DAY	1	1	2009-12-28	1214	\N	68413	\N
75201	GENERIC_DAY	1	2	2009-12-21	1214	\N	68413	\N
75202	GENERIC_DAY	1	3	2010-01-15	1226	\N	68413	\N
75203	GENERIC_DAY	1	1	2009-12-23	1214	\N	68413	\N
75204	GENERIC_DAY	1	0	2010-02-06	1222	\N	68413	\N
75205	GENERIC_DAY	1	0	2009-12-20	1226	\N	68413	\N
75206	GENERIC_DAY	1	2	2010-01-27	1222	\N	68413	\N
75207	GENERIC_DAY	1	2	2010-02-03	1222	\N	68413	\N
75208	GENERIC_DAY	1	3	2010-01-22	1226	\N	68413	\N
75209	GENERIC_DAY	1	0	2010-02-10	1214	\N	68413	\N
75210	GENERIC_DAY	1	1	2009-12-30	1214	\N	68413	\N
75211	GENERIC_DAY	1	0	2009-12-20	1222	\N	68413	\N
75212	GENERIC_DAY	1	1	2009-12-31	1214	\N	68413	\N
75213	GENERIC_DAY	1	2	2009-12-29	1222	\N	68413	\N
75214	GENERIC_DAY	1	0	2010-02-07	1214	\N	68413	\N
75215	GENERIC_DAY	1	3	2009-12-29	1226	\N	68413	\N
75216	GENERIC_DAY	1	2	2010-02-08	1222	\N	68413	\N
75217	GENERIC_DAY	1	1	2010-01-15	1214	\N	68413	\N
75218	GENERIC_DAY	1	0	2010-01-03	1222	\N	68413	\N
75219	GENERIC_DAY	1	1	2010-01-11	1214	\N	68413	\N
75220	GENERIC_DAY	1	1	2010-01-26	1214	\N	68413	\N
75221	GENERIC_DAY	1	3	2010-01-05	1226	\N	68413	\N
75222	GENERIC_DAY	1	0	2010-01-24	1226	\N	68413	\N
75223	GENERIC_DAY	1	2	2010-01-05	1222	\N	68413	\N
75224	GENERIC_DAY	1	3	2009-12-28	1226	\N	68413	\N
75225	GENERIC_DAY	1	2	2009-12-24	1222	\N	68413	\N
75226	GENERIC_DAY	1	3	2010-01-04	1226	\N	68413	\N
75227	GENERIC_DAY	1	2	2010-01-13	1222	\N	68413	\N
75228	GENERIC_DAY	1	2	2010-01-07	1222	\N	68413	\N
75229	GENERIC_DAY	1	2	2010-01-01	1222	\N	68413	\N
75230	GENERIC_DAY	1	3	2010-02-02	1226	\N	68413	\N
75231	GENERIC_DAY	1	1	2010-01-13	1214	\N	68413	\N
75232	GENERIC_DAY	1	2	2009-12-25	1222	\N	68413	\N
75233	GENERIC_DAY	1	0	2010-01-31	1214	\N	68413	\N
75234	GENERIC_DAY	1	2	2010-01-20	1222	\N	68413	\N
75235	GENERIC_DAY	1	3	2010-01-11	1226	\N	68413	\N
75236	GENERIC_DAY	1	0	2010-01-09	1214	\N	68413	\N
75237	GENERIC_DAY	1	2	2010-01-18	1222	\N	68413	\N
75238	GENERIC_DAY	1	3	2009-12-25	1226	\N	68413	\N
75239	GENERIC_DAY	1	2	2009-12-16	1222	\N	68413	\N
75240	GENERIC_DAY	1	2	2009-12-18	1214	\N	68413	\N
75241	GENERIC_DAY	1	0	2010-01-30	1214	\N	68413	\N
75242	GENERIC_DAY	1	3	2010-01-28	1226	\N	68413	\N
75243	GENERIC_DAY	1	0	2010-01-02	1214	\N	68413	\N
75244	GENERIC_DAY	1	0	2010-01-09	1226	\N	68413	\N
75245	GENERIC_DAY	1	3	2009-12-23	1226	\N	68413	\N
75246	GENERIC_DAY	1	3	2009-12-15	1226	\N	68413	\N
75247	GENERIC_DAY	1	0	2010-01-10	1222	\N	68413	\N
75248	GENERIC_DAY	1	2	2010-01-06	1222	\N	68413	\N
75249	GENERIC_DAY	1	0	2009-12-19	1214	\N	68413	\N
75250	GENERIC_DAY	1	1	2010-01-20	1214	\N	68413	\N
75251	GENERIC_DAY	1	3	2010-01-19	1226	\N	68413	\N
75252	GENERIC_DAY	1	2	2009-12-22	1226	\N	68413	\N
75253	GENERIC_DAY	1	2	2010-02-04	1222	\N	68413	\N
75254	GENERIC_DAY	1	2	2010-01-08	1222	\N	68413	\N
75255	GENERIC_DAY	1	1	2010-01-04	1214	\N	68413	\N
75256	GENERIC_DAY	1	4	2010-02-09	1226	\N	68413	\N
75257	GENERIC_DAY	1	0	2010-01-23	1226	\N	68413	\N
75258	GENERIC_DAY	1	1	2010-02-10	1222	\N	68413	\N
75259	GENERIC_DAY	1	2	2009-12-16	1214	\N	68413	\N
75260	GENERIC_DAY	1	0	2010-01-17	1222	\N	68413	\N
75261	GENERIC_DAY	1	2	2009-12-16	1226	\N	68413	\N
75262	GENERIC_DAY	1	3	2010-01-12	1226	\N	68413	\N
75263	GENERIC_DAY	1	2	2009-12-14	1222	\N	68413	\N
75264	GENERIC_DAY	1	2	2010-01-28	1222	\N	68413	\N
75265	GENERIC_DAY	1	1	2010-01-22	1214	\N	68413	\N
75266	GENERIC_DAY	1	0	2010-01-02	1222	\N	68413	\N
75267	GENERIC_DAY	1	2	2010-02-09	1222	\N	68413	\N
75268	GENERIC_DAY	1	1	2010-01-28	1214	\N	68413	\N
75269	GENERIC_DAY	1	2	2010-02-02	1222	\N	68413	\N
75270	GENERIC_DAY	1	2	2010-01-26	1222	\N	68413	\N
75271	GENERIC_DAY	1	1	2009-12-14	1214	\N	68413	\N
75272	GENERIC_DAY	1	1	2009-12-24	1214	\N	68413	\N
75273	GENERIC_DAY	1	0	2010-01-03	1226	\N	68413	\N
75274	GENERIC_DAY	1	3	2010-01-18	1226	\N	68413	\N
75275	GENERIC_DAY	1	0	2010-02-07	1226	\N	68413	\N
75276	GENERIC_DAY	1	3	2010-01-08	1226	\N	68413	\N
75277	GENERIC_DAY	1	1	2010-02-01	1214	\N	68413	\N
75278	GENERIC_DAY	1	3	2009-12-14	1226	\N	68413	\N
75279	GENERIC_DAY	1	0	2010-02-07	1222	\N	68413	\N
75280	GENERIC_DAY	1	1	2009-12-29	1214	\N	68413	\N
75281	GENERIC_DAY	1	2	2009-12-21	1222	\N	68413	\N
75282	GENERIC_DAY	1	0	2010-01-31	1226	\N	68413	\N
75283	GENERIC_DAY	1	0	2010-01-17	1226	\N	68413	\N
75284	GENERIC_DAY	1	3	2010-01-06	1226	\N	68413	\N
75285	GENERIC_DAY	1	2	2010-01-19	1222	\N	68413	\N
75286	GENERIC_DAY	1	2	2010-02-05	1222	\N	68413	\N
75287	GENERIC_DAY	1	1	2010-01-07	1214	\N	68413	\N
75288	GENERIC_DAY	1	4	2010-02-08	1226	\N	68413	\N
75289	GENERIC_DAY	1	0	2010-02-06	1214	\N	68413	\N
75290	GENERIC_DAY	1	0	2010-01-24	1214	\N	68413	\N
75291	GENERIC_DAY	1	2	2010-01-22	1222	\N	68413	\N
75292	GENERIC_DAY	1	3	2010-02-01	1226	\N	68413	\N
75293	GENERIC_DAY	1	1	2010-01-19	1214	\N	68413	\N
75294	GENERIC_DAY	1	0	2009-12-19	1222	\N	68413	\N
75295	GENERIC_DAY	1	4	2010-02-05	1226	\N	68413	\N
75296	GENERIC_DAY	1	0	2010-01-10	1226	\N	68413	\N
75297	GENERIC_DAY	1	0	2010-01-31	1222	\N	68413	\N
75298	GENERIC_DAY	1	2	2009-12-17	1222	\N	68413	\N
75299	GENERIC_DAY	1	2	2009-12-22	1214	\N	68413	\N
75300	GENERIC_DAY	1	3	2010-01-26	1226	\N	68413	\N
75301	GENERIC_DAY	1	0	2009-12-26	1226	\N	68413	\N
75302	GENERIC_DAY	1	1	2010-01-08	1214	\N	68413	\N
75303	GENERIC_DAY	1	1	2010-01-14	1214	\N	68413	\N
75304	GENERIC_DAY	1	1	2009-12-25	1214	\N	68413	\N
75305	GENERIC_DAY	1	4	2010-02-04	1226	\N	68413	\N
75306	GENERIC_DAY	1	0	2010-01-17	1214	\N	68413	\N
75307	GENERIC_DAY	1	2	2010-01-04	1222	\N	68413	\N
75308	GENERIC_DAY	1	3	2009-12-24	1226	\N	68413	\N
75309	GENERIC_DAY	1	1	2010-01-01	1214	\N	68413	\N
75310	GENERIC_DAY	1	0	2010-01-16	1214	\N	68413	\N
75311	GENERIC_DAY	1	2	2009-12-22	1222	\N	68413	\N
75312	GENERIC_DAY	1	2	2010-01-12	1222	\N	68413	\N
75313	GENERIC_DAY	1	2	2009-12-28	1222	\N	68413	\N
75314	GENERIC_DAY	1	0	2010-02-04	1214	\N	68413	\N
75315	GENERIC_DAY	1	1	2010-02-02	1214	\N	68413	\N
75316	GENERIC_DAY	1	1	2010-02-03	1214	\N	68413	\N
75317	GENERIC_DAY	1	1	2010-01-05	1214	\N	68413	\N
75318	GENERIC_DAY	1	2	2010-01-14	1222	\N	68413	\N
75319	GENERIC_DAY	1	3	2010-01-01	1226	\N	68413	\N
75320	GENERIC_DAY	1	2	2009-12-18	1226	\N	68413	\N
75321	GENERIC_DAY	1	0	2009-12-27	1222	\N	68413	\N
75322	GENERIC_DAY	1	3	2010-01-13	1226	\N	68413	\N
75323	GENERIC_DAY	1	1	2010-01-06	1214	\N	68413	\N
75324	GENERIC_DAY	1	0	2010-01-23	1214	\N	68413	\N
75325	GENERIC_DAY	1	0	2010-02-05	1214	\N	68413	\N
75326	GENERIC_DAY	1	3	2010-01-21	1226	\N	68413	\N
75327	GENERIC_DAY	1	2	2009-12-17	1226	\N	68413	\N
75328	GENERIC_DAY	1	0	2010-01-16	1222	\N	68413	\N
75329	GENERIC_DAY	1	0	2009-12-26	1222	\N	68413	\N
75330	GENERIC_DAY	1	0	2009-12-20	1214	\N	68413	\N
75331	GENERIC_DAY	1	1	2010-01-12	1214	\N	68413	\N
75332	GENERIC_DAY	1	2	2009-12-31	1222	\N	68413	\N
75333	GENERIC_DAY	1	2	2010-01-15	1222	\N	68413	\N
75334	GENERIC_DAY	1	0	2010-02-06	1226	\N	68413	\N
75335	GENERIC_DAY	1	0	2009-12-19	1226	\N	68413	\N
75336	GENERIC_DAY	1	1	2010-01-27	1214	\N	68413	\N
75337	GENERIC_DAY	1	3	2009-12-31	1226	\N	68413	\N
75338	GENERIC_DAY	1	0	2010-01-24	1222	\N	68413	\N
75339	GENERIC_DAY	1	0	2010-01-02	1226	\N	68413	\N
75340	GENERIC_DAY	1	3	2010-01-07	1226	\N	68413	\N
75341	GENERIC_DAY	1	0	2010-01-09	1222	\N	68413	\N
75342	GENERIC_DAY	1	0	2010-01-03	1214	\N	68413	\N
75343	GENERIC_DAY	1	3	2010-02-10	1226	\N	68413	\N
75344	GENERIC_DAY	1	0	2010-01-16	1226	\N	68413	\N
75345	GENERIC_DAY	1	0	2010-01-30	1226	\N	68413	\N
75346	GENERIC_DAY	1	3	2010-02-03	1226	\N	68413	\N
75347	GENERIC_DAY	1	2	2009-12-17	1214	\N	68413	\N
75348	GENERIC_DAY	1	2	2010-01-29	1222	\N	68413	\N
75349	GENERIC_DAY	1	0	2010-01-10	1214	\N	68413	\N
75350	GENERIC_DAY	1	1	2009-12-15	1214	\N	68413	\N
75351	GENERIC_DAY	1	0	2009-12-27	1214	\N	68413	\N
75352	GENERIC_DAY	1	2	2009-12-15	1222	\N	68413	\N
75353	GENERIC_DAY	1	2	2010-01-25	1222	\N	68413	\N
75354	GENERIC_DAY	1	3	2010-01-14	1226	\N	68413	\N
75355	GENERIC_DAY	1	3	2010-01-20	1226	\N	68413	\N
75356	GENERIC_DAY	1	0	2010-02-08	1214	\N	68413	\N
75357	GENERIC_DAY	1	2	2009-12-21	1226	\N	68413	\N
75358	GENERIC_DAY	1	0	2010-02-09	1214	\N	68413	\N
75359	GENERIC_DAY	1	2	2010-01-21	1222	\N	68413	\N
75360	GENERIC_DAY	1	0	2010-01-23	1222	\N	68413	\N
75361	GENERIC_DAY	1	2	2010-02-01	1222	\N	68413	\N
75362	GENERIC_DAY	1	1	2010-01-29	1214	\N	68413	\N
75363	GENERIC_DAY	1	3	2010-01-27	1226	\N	68413	\N
75364	GENERIC_DAY	1	2	2010-01-11	1222	\N	68413	\N
75365	GENERIC_DAY	1	2	2009-12-23	1222	\N	68413	\N
75366	GENERIC_DAY	1	1	2010-01-18	1214	\N	68413	\N
75367	GENERIC_DAY	1	1	2010-02-03	1220	\N	68414	\N
75368	GENERIC_DAY	1	2	2010-02-05	1228	\N	68414	\N
75369	GENERIC_DAY	1	2	2010-01-06	1230	\N	68414	\N
75370	GENERIC_DAY	1	1	2010-01-06	1220	\N	68414	\N
75371	GENERIC_DAY	1	1	2010-01-14	1217	\N	68414	\N
75372	GENERIC_DAY	1	1	2009-12-23	1220	\N	68414	\N
75373	GENERIC_DAY	1	0	2010-02-02	1230	\N	68414	\N
75374	GENERIC_DAY	1	2	2009-12-30	1228	\N	68414	\N
75375	GENERIC_DAY	1	1	2010-02-01	1217	\N	68414	\N
75376	GENERIC_DAY	1	2	2009-12-25	1230	\N	68414	\N
75377	GENERIC_DAY	1	1	2010-01-06	1217	\N	68414	\N
75378	GENERIC_DAY	1	1	2010-01-28	1217	\N	68414	\N
75379	GENERIC_DAY	1	0	2010-02-06	1230	\N	68414	\N
75380	GENERIC_DAY	1	3	2010-02-02	1228	\N	68414	\N
75381	GENERIC_DAY	1	0	2009-12-20	1228	\N	68414	\N
75382	GENERIC_DAY	1	1	2010-01-27	1220	\N	68414	\N
75383	GENERIC_DAY	1	1	2010-02-04	1220	\N	68414	\N
75384	GENERIC_DAY	1	2	2010-01-04	1228	\N	68414	\N
75385	GENERIC_DAY	1	0	2010-01-24	1228	\N	68414	\N
75386	GENERIC_DAY	1	2	2009-12-31	1230	\N	68414	\N
75387	GENERIC_DAY	1	0	2010-01-03	1217	\N	68414	\N
75388	GENERIC_DAY	1	1	2010-01-04	1217	\N	68414	\N
75389	GENERIC_DAY	1	2	2010-02-05	1230	\N	68414	\N
75390	GENERIC_DAY	1	0	2009-12-20	1220	\N	68414	\N
75391	GENERIC_DAY	1	1	2010-01-15	1220	\N	68414	\N
75392	GENERIC_DAY	1	0	2009-12-26	1220	\N	68414	\N
75393	GENERIC_DAY	1	0	2010-02-01	1230	\N	68414	\N
75394	GENERIC_DAY	1	0	2010-02-07	1217	\N	68414	\N
75395	GENERIC_DAY	1	2	2010-01-19	1228	\N	68414	\N
75396	GENERIC_DAY	1	2	2010-01-04	1230	\N	68414	\N
75397	GENERIC_DAY	1	0	2010-01-30	1217	\N	68414	\N
75398	GENERIC_DAY	1	0	2010-01-30	1230	\N	68414	\N
75399	GENERIC_DAY	1	2	2009-12-17	1228	\N	68414	\N
75400	GENERIC_DAY	1	0	2010-01-31	1228	\N	68414	\N
75401	GENERIC_DAY	1	2	2010-01-11	1228	\N	68414	\N
75402	GENERIC_DAY	1	2	2010-01-29	1228	\N	68414	\N
75403	GENERIC_DAY	1	2	2010-02-10	1228	\N	68414	\N
75404	GENERIC_DAY	1	2	2010-01-15	1230	\N	68414	\N
75405	GENERIC_DAY	1	1	2009-12-17	1217	\N	68414	\N
75406	GENERIC_DAY	1	0	2010-01-17	1228	\N	68414	\N
75407	GENERIC_DAY	1	1	2010-01-25	1217	\N	68414	\N
75408	GENERIC_DAY	1	2	2009-12-18	1228	\N	68414	\N
75409	GENERIC_DAY	1	0	2010-01-23	1228	\N	68414	\N
75410	GENERIC_DAY	1	1	2010-01-26	1217	\N	68414	\N
75411	GENERIC_DAY	1	0	2010-02-06	1228	\N	68414	\N
75412	GENERIC_DAY	1	2	2009-12-24	1228	\N	68414	\N
75413	GENERIC_DAY	1	2	2010-01-05	1230	\N	68414	\N
75414	GENERIC_DAY	1	1	2009-12-24	1220	\N	68414	\N
75415	GENERIC_DAY	1	0	2010-01-16	1220	\N	68414	\N
75416	GENERIC_DAY	1	0	2010-01-24	1217	\N	68414	\N
75417	GENERIC_DAY	1	0	2010-01-03	1228	\N	68414	\N
75418	GENERIC_DAY	1	2	2010-01-25	1230	\N	68414	\N
75419	GENERIC_DAY	1	0	2010-01-24	1230	\N	68414	\N
75420	GENERIC_DAY	1	0	2010-01-17	1220	\N	68414	\N
75421	GENERIC_DAY	1	0	2010-01-24	1220	\N	68414	\N
75422	GENERIC_DAY	1	0	2010-02-10	1217	\N	68414	\N
75423	GENERIC_DAY	1	2	2010-01-20	1228	\N	68414	\N
75424	GENERIC_DAY	1	2	2010-01-22	1228	\N	68414	\N
75425	GENERIC_DAY	1	2	2009-12-22	1228	\N	68414	\N
75426	GENERIC_DAY	1	2	2010-01-05	1228	\N	68414	\N
75427	GENERIC_DAY	1	0	2009-12-27	1230	\N	68414	\N
75428	GENERIC_DAY	1	2	2010-01-13	1230	\N	68414	\N
75429	GENERIC_DAY	1	2	2009-12-29	1228	\N	68414	\N
75430	GENERIC_DAY	1	2	2009-12-14	1230	\N	68414	\N
75431	GENERIC_DAY	1	1	2010-01-07	1220	\N	68414	\N
75432	GENERIC_DAY	1	0	2010-01-30	1220	\N	68414	\N
75433	GENERIC_DAY	1	2	2010-01-22	1230	\N	68414	\N
75434	GENERIC_DAY	1	2	2010-01-27	1228	\N	68414	\N
75435	GENERIC_DAY	1	1	2009-12-14	1220	\N	68414	\N
75436	GENERIC_DAY	1	2	2010-01-26	1228	\N	68414	\N
75437	GENERIC_DAY	1	1	2009-12-21	1220	\N	68414	\N
75438	GENERIC_DAY	1	1	2010-01-21	1220	\N	68414	\N
75439	GENERIC_DAY	1	1	2009-12-28	1217	\N	68414	\N
75440	GENERIC_DAY	1	1	2009-12-24	1217	\N	68414	\N
75441	GENERIC_DAY	1	1	2009-12-14	1217	\N	68414	\N
75442	GENERIC_DAY	1	1	2010-02-03	1217	\N	68414	\N
75443	GENERIC_DAY	1	0	2010-01-23	1220	\N	68414	\N
75444	GENERIC_DAY	1	2	2010-01-13	1228	\N	68414	\N
75445	GENERIC_DAY	1	2	2009-12-21	1228	\N	68414	\N
75446	GENERIC_DAY	1	0	2010-01-10	1230	\N	68414	\N
75447	GENERIC_DAY	1	1	2009-12-15	1217	\N	68414	\N
75448	GENERIC_DAY	1	2	2010-01-26	1230	\N	68414	\N
75449	GENERIC_DAY	1	1	2009-12-17	1220	\N	68414	\N
75450	GENERIC_DAY	1	0	2010-02-07	1230	\N	68414	\N
75451	GENERIC_DAY	1	0	2009-12-26	1230	\N	68414	\N
75452	GENERIC_DAY	1	2	2009-12-23	1230	\N	68414	\N
75453	GENERIC_DAY	1	0	2010-01-09	1230	\N	68414	\N
75454	GENERIC_DAY	1	2	2010-01-12	1230	\N	68414	\N
75455	GENERIC_DAY	1	1	2009-12-30	1220	\N	68414	\N
75456	GENERIC_DAY	1	2	2009-12-17	1230	\N	68414	\N
75457	GENERIC_DAY	1	1	2010-01-29	1217	\N	68414	\N
75458	GENERIC_DAY	1	0	2010-01-31	1217	\N	68414	\N
75459	GENERIC_DAY	1	2	2009-12-16	1230	\N	68414	\N
75460	GENERIC_DAY	1	0	2010-01-10	1217	\N	68414	\N
75461	GENERIC_DAY	1	0	2010-02-07	1228	\N	68414	\N
75462	GENERIC_DAY	1	1	2010-01-12	1220	\N	68414	\N
75463	GENERIC_DAY	1	1	2009-12-22	1217	\N	68414	\N
75464	GENERIC_DAY	1	2	2010-01-14	1228	\N	68414	\N
75465	GENERIC_DAY	1	2	2010-02-03	1230	\N	68414	\N
75466	GENERIC_DAY	1	2	2010-01-08	1230	\N	68414	\N
75467	GENERIC_DAY	1	0	2009-12-27	1228	\N	68414	\N
75468	GENERIC_DAY	1	2	2009-12-15	1228	\N	68414	\N
75469	GENERIC_DAY	1	2	2010-01-08	1228	\N	68414	\N
75470	GENERIC_DAY	1	1	2009-12-29	1217	\N	68414	\N
75471	GENERIC_DAY	1	1	2010-01-05	1220	\N	68414	\N
75472	GENERIC_DAY	1	0	2010-01-10	1220	\N	68414	\N
75473	GENERIC_DAY	1	1	2010-01-19	1220	\N	68414	\N
75474	GENERIC_DAY	1	1	2010-01-27	1217	\N	68414	\N
75475	GENERIC_DAY	1	2	2009-12-23	1228	\N	68414	\N
75476	GENERIC_DAY	1	1	2010-01-08	1217	\N	68414	\N
75477	GENERIC_DAY	1	1	2010-01-18	1217	\N	68414	\N
75478	GENERIC_DAY	1	1	2010-01-11	1217	\N	68414	\N
75479	GENERIC_DAY	1	3	2010-02-09	1228	\N	68414	\N
75480	GENERIC_DAY	1	2	2009-12-31	1228	\N	68414	\N
75481	GENERIC_DAY	1	1	2010-01-22	1217	\N	68414	\N
75482	GENERIC_DAY	1	2	2009-12-30	1230	\N	68414	\N
75483	GENERIC_DAY	1	2	2010-02-10	1230	\N	68414	\N
75484	GENERIC_DAY	1	0	2009-12-19	1228	\N	68414	\N
75485	GENERIC_DAY	1	2	2010-02-08	1228	\N	68414	\N
75486	GENERIC_DAY	1	1	2010-01-11	1220	\N	68414	\N
75487	GENERIC_DAY	1	0	2009-12-20	1230	\N	68414	\N
75488	GENERIC_DAY	1	0	2010-01-17	1217	\N	68414	\N
75489	GENERIC_DAY	1	0	2010-01-02	1228	\N	68414	\N
75490	GENERIC_DAY	1	1	2010-01-19	1217	\N	68414	\N
75491	GENERIC_DAY	1	0	2009-12-27	1217	\N	68414	\N
75492	GENERIC_DAY	1	1	2010-01-22	1220	\N	68414	\N
75493	GENERIC_DAY	1	0	2010-01-31	1230	\N	68414	\N
75494	GENERIC_DAY	1	1	2010-02-08	1217	\N	68414	\N
75495	GENERIC_DAY	1	2	2010-01-01	1228	\N	68414	\N
75496	GENERIC_DAY	1	2	2009-12-29	1230	\N	68414	\N
75497	GENERIC_DAY	1	2	2010-02-01	1220	\N	68414	\N
75498	GENERIC_DAY	1	1	2009-12-31	1220	\N	68414	\N
75499	GENERIC_DAY	1	0	2010-01-10	1228	\N	68414	\N
75500	GENERIC_DAY	1	2	2009-12-14	1228	\N	68414	\N
75501	GENERIC_DAY	1	1	2009-12-18	1217	\N	68414	\N
75502	GENERIC_DAY	1	2	2010-01-28	1228	\N	68414	\N
75503	GENERIC_DAY	1	2	2009-12-18	1230	\N	68414	\N
75504	GENERIC_DAY	1	2	2010-01-14	1230	\N	68414	\N
75505	GENERIC_DAY	1	2	2010-01-07	1228	\N	68414	\N
75506	GENERIC_DAY	1	2	2010-01-20	1230	\N	68414	\N
75507	GENERIC_DAY	1	2	2010-01-21	1228	\N	68414	\N
75508	GENERIC_DAY	1	1	2010-02-05	1217	\N	68414	\N
75509	GENERIC_DAY	1	2	2010-01-28	1230	\N	68414	\N
75510	GENERIC_DAY	1	3	2010-02-01	1228	\N	68414	\N
75511	GENERIC_DAY	1	2	2010-01-15	1228	\N	68414	\N
75512	GENERIC_DAY	1	1	2010-01-21	1217	\N	68414	\N
75513	GENERIC_DAY	1	2	2009-12-25	1228	\N	68414	\N
75514	GENERIC_DAY	1	0	2009-12-26	1217	\N	68414	\N
75515	GENERIC_DAY	1	0	2009-12-19	1220	\N	68414	\N
75516	GENERIC_DAY	1	2	2010-02-08	1230	\N	68414	\N
75517	GENERIC_DAY	1	2	2009-12-15	1230	\N	68414	\N
75518	GENERIC_DAY	1	1	2010-01-18	1220	\N	68414	\N
75519	GENERIC_DAY	1	2	2010-02-04	1228	\N	68414	\N
75520	GENERIC_DAY	1	0	2009-12-26	1228	\N	68414	\N
75521	GENERIC_DAY	1	1	2010-01-20	1217	\N	68414	\N
75522	GENERIC_DAY	1	1	2010-01-01	1217	\N	68414	\N
75523	GENERIC_DAY	1	2	2010-01-25	1228	\N	68414	\N
75524	GENERIC_DAY	1	0	2010-01-09	1228	\N	68414	\N
75525	GENERIC_DAY	1	1	2010-01-28	1220	\N	68414	\N
75526	GENERIC_DAY	1	0	2010-01-03	1230	\N	68414	\N
75527	GENERIC_DAY	1	1	2009-12-28	1220	\N	68414	\N
75528	GENERIC_DAY	1	1	2010-01-05	1217	\N	68414	\N
75529	GENERIC_DAY	1	0	2009-12-19	1230	\N	68414	\N
75530	GENERIC_DAY	1	1	2010-01-26	1220	\N	68414	\N
75531	GENERIC_DAY	1	1	2010-01-08	1220	\N	68414	\N
75532	GENERIC_DAY	1	2	2010-01-01	1230	\N	68414	\N
75533	GENERIC_DAY	1	1	2010-01-29	1220	\N	68414	\N
75534	GENERIC_DAY	1	0	2010-01-09	1217	\N	68414	\N
75535	GENERIC_DAY	1	0	2010-02-07	1220	\N	68414	\N
75536	GENERIC_DAY	1	1	2010-02-08	1220	\N	68414	\N
75537	GENERIC_DAY	1	1	2010-01-04	1220	\N	68414	\N
75538	GENERIC_DAY	1	1	2010-01-20	1220	\N	68414	\N
75539	GENERIC_DAY	1	0	2010-02-09	1220	\N	68414	\N
75540	GENERIC_DAY	1	0	2010-01-09	1220	\N	68414	\N
75541	GENERIC_DAY	1	2	2010-01-11	1230	\N	68414	\N
75542	GENERIC_DAY	1	2	2010-01-06	1228	\N	68414	\N
75543	GENERIC_DAY	1	1	2009-12-18	1220	\N	68414	\N
75544	GENERIC_DAY	1	1	2009-12-25	1217	\N	68414	\N
75545	GENERIC_DAY	1	0	2010-02-06	1217	\N	68414	\N
75546	GENERIC_DAY	1	2	2009-12-16	1228	\N	68414	\N
75547	GENERIC_DAY	1	0	2009-12-19	1217	\N	68414	\N
75548	GENERIC_DAY	1	2	2010-01-29	1230	\N	68414	\N
75549	GENERIC_DAY	1	1	2010-01-14	1220	\N	68414	\N
75550	GENERIC_DAY	1	0	2010-01-02	1217	\N	68414	\N
75551	GENERIC_DAY	1	1	2009-12-15	1220	\N	68414	\N
75552	GENERIC_DAY	1	2	2009-12-28	1228	\N	68414	\N
75553	GENERIC_DAY	1	1	2009-12-30	1217	\N	68414	\N
75554	GENERIC_DAY	1	1	2010-01-07	1217	\N	68414	\N
75555	GENERIC_DAY	1	1	2009-12-25	1220	\N	68414	\N
75556	GENERIC_DAY	1	0	2010-01-16	1228	\N	68414	\N
75557	GENERIC_DAY	1	1	2010-01-01	1220	\N	68414	\N
75558	GENERIC_DAY	1	0	2010-01-17	1230	\N	68414	\N
75559	GENERIC_DAY	1	0	2010-01-03	1220	\N	68414	\N
75560	GENERIC_DAY	1	1	2010-02-04	1217	\N	68414	\N
75561	GENERIC_DAY	1	1	2010-02-05	1220	\N	68414	\N
75562	GENERIC_DAY	1	0	2010-01-02	1220	\N	68414	\N
75563	GENERIC_DAY	1	1	2009-12-31	1217	\N	68414	\N
75564	GENERIC_DAY	1	0	2010-01-16	1230	\N	68414	\N
75565	GENERIC_DAY	1	2	2010-02-04	1230	\N	68414	\N
75566	GENERIC_DAY	1	1	2009-12-21	1217	\N	68414	\N
75567	GENERIC_DAY	1	0	2009-12-27	1220	\N	68414	\N
75568	GENERIC_DAY	1	2	2010-01-12	1228	\N	68414	\N
75569	GENERIC_DAY	1	2	2009-12-24	1230	\N	68414	\N
75570	GENERIC_DAY	1	2	2010-01-18	1230	\N	68414	\N
75571	GENERIC_DAY	1	1	2009-12-29	1220	\N	68414	\N
75572	GENERIC_DAY	1	0	2010-01-30	1228	\N	68414	\N
75573	GENERIC_DAY	1	1	2010-01-25	1220	\N	68414	\N
75574	GENERIC_DAY	1	1	2009-12-16	1220	\N	68414	\N
75575	GENERIC_DAY	1	1	2010-02-02	1217	\N	68414	\N
75576	GENERIC_DAY	1	2	2010-01-19	1230	\N	68414	\N
75577	GENERIC_DAY	1	0	2010-02-10	1220	\N	68414	\N
75578	GENERIC_DAY	1	2	2009-12-28	1230	\N	68414	\N
75579	GENERIC_DAY	1	1	2010-01-13	1220	\N	68414	\N
75580	GENERIC_DAY	1	2	2010-01-07	1230	\N	68414	\N
75581	GENERIC_DAY	1	1	2010-01-12	1217	\N	68414	\N
75582	GENERIC_DAY	1	0	2010-01-23	1217	\N	68414	\N
75583	GENERIC_DAY	1	1	2009-12-22	1220	\N	68414	\N
75584	GENERIC_DAY	1	0	2009-12-20	1217	\N	68414	\N
75585	GENERIC_DAY	1	0	2010-01-02	1230	\N	68414	\N
75586	GENERIC_DAY	1	1	2010-01-15	1217	\N	68414	\N
75587	GENERIC_DAY	1	2	2010-02-02	1220	\N	68414	\N
75588	GENERIC_DAY	1	3	2010-02-09	1230	\N	68414	\N
75589	GENERIC_DAY	1	1	2010-01-13	1217	\N	68414	\N
75590	GENERIC_DAY	1	1	2009-12-23	1217	\N	68414	\N
75591	GENERIC_DAY	1	2	2010-01-18	1228	\N	68414	\N
75592	GENERIC_DAY	1	0	2010-01-16	1217	\N	68414	\N
75593	GENERIC_DAY	1	0	2010-01-31	1220	\N	68414	\N
75594	GENERIC_DAY	1	0	2010-01-23	1230	\N	68414	\N
75595	GENERIC_DAY	1	1	2009-12-16	1217	\N	68414	\N
75596	GENERIC_DAY	1	2	2010-01-21	1230	\N	68414	\N
75597	GENERIC_DAY	1	2	2010-01-27	1230	\N	68414	\N
75598	GENERIC_DAY	1	2	2009-12-21	1230	\N	68414	\N
75599	GENERIC_DAY	1	0	2010-02-06	1220	\N	68414	\N
75600	GENERIC_DAY	1	0	2010-02-09	1217	\N	68414	\N
75601	GENERIC_DAY	1	2	2009-12-22	1230	\N	68414	\N
75602	GENERIC_DAY	1	2	2010-02-03	1228	\N	68414	\N
75603	GENERIC_DAY	1	3	2009-12-15	1220	\N	68415	\N
75604	GENERIC_DAY	1	2	2009-12-14	1228	\N	68415	\N
75605	GENERIC_DAY	1	3	2009-12-14	1220	\N	68415	\N
75606	GENERIC_DAY	1	2	2009-12-15	1217	\N	68415	\N
75607	GENERIC_DAY	1	1	2009-12-14	1217	\N	68415	\N
75608	GENERIC_DAY	1	2	2009-12-15	1230	\N	68415	\N
75609	GENERIC_DAY	1	1	2009-12-15	1228	\N	68415	\N
75610	GENERIC_DAY	1	2	2009-12-14	1230	\N	68415	\N
75611	GENERIC_DAY	1	2	2010-01-07	1220	\N	68416	\N
75612	GENERIC_DAY	1	2	2010-01-06	1230	\N	68416	\N
75613	GENERIC_DAY	1	2	2010-01-08	1230	\N	68416	\N
75614	GENERIC_DAY	1	2	2010-01-07	1228	\N	68416	\N
75615	GENERIC_DAY	1	2	2010-01-08	1217	\N	68416	\N
75616	GENERIC_DAY	1	2	2010-01-07	1230	\N	68416	\N
75617	GENERIC_DAY	1	2	2010-01-08	1220	\N	68416	\N
75618	GENERIC_DAY	1	2	2010-01-07	1217	\N	68416	\N
75619	GENERIC_DAY	1	2	2010-01-06	1228	\N	68416	\N
75620	GENERIC_DAY	1	2	2010-01-08	1228	\N	68416	\N
75621	GENERIC_DAY	1	2	2010-01-06	1217	\N	68416	\N
75622	GENERIC_DAY	1	2	2010-01-06	1220	\N	68416	\N
75623	GENERIC_DAY	1	2	2010-01-04	1220	\N	68417	\N
75624	GENERIC_DAY	1	1	2010-01-01	1217	\N	68417	\N
75625	GENERIC_DAY	1	0	2010-01-03	1220	\N	68417	\N
75626	GENERIC_DAY	1	0	2010-01-03	1230	\N	68417	\N
75627	GENERIC_DAY	1	2	2010-01-01	1220	\N	68417	\N
75628	GENERIC_DAY	1	3	2010-01-01	1228	\N	68417	\N
75629	GENERIC_DAY	1	2	2010-01-04	1230	\N	68417	\N
75630	GENERIC_DAY	1	2	2010-01-01	1230	\N	68417	\N
75631	GENERIC_DAY	1	2	2010-01-05	1230	\N	68417	\N
75632	GENERIC_DAY	1	0	2010-01-02	1230	\N	68417	\N
75633	GENERIC_DAY	1	0	2010-01-03	1217	\N	68417	\N
75634	GENERIC_DAY	1	0	2010-01-02	1220	\N	68417	\N
75635	GENERIC_DAY	1	1	2010-01-04	1217	\N	68417	\N
75636	GENERIC_DAY	1	0	2010-01-02	1217	\N	68417	\N
75637	GENERIC_DAY	1	2	2010-01-05	1220	\N	68417	\N
75638	GENERIC_DAY	1	2	2010-01-05	1217	\N	68417	\N
75639	GENERIC_DAY	1	3	2010-01-04	1228	\N	68417	\N
75640	GENERIC_DAY	1	2	2010-01-05	1228	\N	68417	\N
75641	GENERIC_DAY	1	0	2010-01-03	1228	\N	68417	\N
75642	GENERIC_DAY	1	0	2010-01-02	1228	\N	68417	\N
75643	GENERIC_DAY	1	2	2009-12-16	1230	\N	68418	\N
75644	GENERIC_DAY	1	2	2009-12-18	1228	\N	68418	\N
75645	GENERIC_DAY	1	2	2009-12-18	1230	\N	68418	\N
75646	GENERIC_DAY	1	1	2009-12-16	1217	\N	68418	\N
75647	GENERIC_DAY	1	1	2009-12-17	1217	\N	68418	\N
75648	GENERIC_DAY	1	3	2009-12-17	1220	\N	68418	\N
75649	GENERIC_DAY	1	3	2009-12-18	1220	\N	68418	\N
75650	GENERIC_DAY	1	2	2009-12-17	1228	\N	68418	\N
75651	GENERIC_DAY	1	2	2009-12-17	1230	\N	68418	\N
75652	GENERIC_DAY	1	2	2009-12-16	1228	\N	68418	\N
75653	GENERIC_DAY	1	3	2009-12-16	1220	\N	68418	\N
75654	GENERIC_DAY	1	1	2009-12-18	1217	\N	68418	\N
75655	GENERIC_DAY	1	2	2009-12-30	1220	\N	68419	\N
75656	GENERIC_DAY	1	1	2009-12-29	1217	\N	68419	\N
75657	GENERIC_DAY	1	1	2009-12-31	1217	\N	68419	\N
75658	GENERIC_DAY	1	2	2009-12-31	1230	\N	68419	\N
75659	GENERIC_DAY	1	2	2009-12-30	1228	\N	68419	\N
75660	GENERIC_DAY	1	2	2009-12-30	1217	\N	68419	\N
75661	GENERIC_DAY	1	2	2009-12-31	1220	\N	68419	\N
75662	GENERIC_DAY	1	2	2009-12-29	1230	\N	68419	\N
60360	GENERIC_DAY	6	2	2009-12-29	1230	\N	58468	\N
60333	GENERIC_DAY	6	0	2009-12-19	1220	\N	58468	\N
60342	GENERIC_DAY	6	2	2009-12-30	1230	\N	58468	\N
60362	GENERIC_DAY	6	0	2009-12-19	1230	\N	58468	\N
60330	GENERIC_DAY	6	2	2009-12-24	1220	\N	58468	\N
60359	GENERIC_DAY	6	0	2009-12-27	1230	\N	58468	\N
60347	GENERIC_DAY	6	0	2009-12-26	1217	\N	58468	\N
60336	GENERIC_DAY	6	2	2009-12-29	1217	\N	58468	\N
60356	GENERIC_DAY	6	2	2009-12-22	1228	\N	58468	\N
60326	GENERIC_DAY	6	2	2009-12-28	1228	\N	58468	\N
60334	GENERIC_DAY	6	0	2009-12-19	1217	\N	58468	\N
60358	GENERIC_DAY	6	2	2009-12-23	1230	\N	58468	\N
60343	GENERIC_DAY	6	0	2009-12-20	1230	\N	58468	\N
60325	GENERIC_DAY	6	0	2009-12-26	1230	\N	58468	\N
60318	GENERIC_DAY	6	2	2009-12-25	1220	\N	58468	\N
60332	GENERIC_DAY	6	2	2009-12-23	1217	\N	58468	\N
60348	GENERIC_DAY	6	2	2009-12-22	1230	\N	58468	\N
60324	GENERIC_DAY	6	0	2009-12-20	1228	\N	58468	\N
60323	GENERIC_DAY	6	2	2009-12-30	1217	\N	58468	\N
60338	GENERIC_DAY	6	2	2009-12-24	1230	\N	58468	\N
60354	GENERIC_DAY	6	2	2009-12-24	1228	\N	58468	\N
60331	GENERIC_DAY	6	2	2009-12-21	1228	\N	58468	\N
60319	GENERIC_DAY	6	2	2009-12-24	1217	\N	58468	\N
60346	GENERIC_DAY	6	2	2009-12-25	1217	\N	58468	\N
60340	GENERIC_DAY	6	2	2009-12-21	1220	\N	58468	\N
60349	GENERIC_DAY	6	2	2009-12-29	1220	\N	58468	\N
60335	GENERIC_DAY	6	2	2009-12-23	1228	\N	58468	\N
60357	GENERIC_DAY	6	2	2009-12-25	1228	\N	58468	\N
60355	GENERIC_DAY	6	2	2009-12-22	1217	\N	58468	\N
60328	GENERIC_DAY	6	0	2009-12-27	1220	\N	58468	\N
60321	GENERIC_DAY	6	0	2009-12-20	1220	\N	58468	\N
60320	GENERIC_DAY	6	0	2009-12-20	1217	\N	58468	\N
60361	GENERIC_DAY	6	0	2009-12-26	1228	\N	58468	\N
60345	GENERIC_DAY	6	2	2009-12-25	1230	\N	58468	\N
60363	GENERIC_DAY	6	0	2009-12-19	1228	\N	58468	\N
60329	GENERIC_DAY	6	2	2009-12-23	1220	\N	58468	\N
60322	GENERIC_DAY	6	2	2009-12-28	1230	\N	58468	\N
60351	GENERIC_DAY	6	0	2009-12-27	1228	\N	58468	\N
60317	GENERIC_DAY	6	2	2009-12-21	1230	\N	58468	\N
60337	GENERIC_DAY	6	2	2009-12-28	1217	\N	58468	\N
60344	GENERIC_DAY	6	2	2009-12-21	1217	\N	58468	\N
60352	GENERIC_DAY	6	0	2009-12-26	1220	\N	58468	\N
60327	GENERIC_DAY	6	2	2009-12-30	1228	\N	58468	\N
60339	GENERIC_DAY	6	0	2009-12-27	1217	\N	58468	\N
75663	GENERIC_DAY	1	2	2009-12-30	1230	\N	68419	\N
75664	GENERIC_DAY	1	2	2009-12-29	1228	\N	68419	\N
75665	GENERIC_DAY	1	3	2009-12-29	1220	\N	68419	\N
75666	GENERIC_DAY	1	3	2009-12-31	1228	\N	68419	\N
75667	GENERIC_DAY	1	2	2009-12-23	1230	\N	68420	\N
75668	GENERIC_DAY	1	2	2009-12-21	1230	\N	68420	\N
75669	GENERIC_DAY	1	0	2009-12-20	1220	\N	68420	\N
75670	GENERIC_DAY	1	0	2009-12-20	1228	\N	68420	\N
75671	GENERIC_DAY	1	1	2009-12-23	1217	\N	68420	\N
75672	GENERIC_DAY	1	3	2009-12-22	1220	\N	68420	\N
75673	GENERIC_DAY	1	1	2009-12-21	1217	\N	68420	\N
75674	GENERIC_DAY	1	0	2009-12-19	1228	\N	68420	\N
75675	GENERIC_DAY	1	0	2009-12-19	1230	\N	68420	\N
75676	GENERIC_DAY	1	0	2009-12-20	1217	\N	68420	\N
75677	GENERIC_DAY	1	3	2009-12-21	1220	\N	68420	\N
75678	GENERIC_DAY	1	2	2009-12-23	1228	\N	68420	\N
75679	GENERIC_DAY	1	2	2009-12-22	1230	\N	68420	\N
75680	GENERIC_DAY	1	2	2009-12-22	1228	\N	68420	\N
75681	GENERIC_DAY	1	2	2009-12-21	1228	\N	68420	\N
75682	GENERIC_DAY	1	0	2009-12-19	1217	\N	68420	\N
75683	GENERIC_DAY	1	3	2009-12-23	1220	\N	68420	\N
75684	GENERIC_DAY	1	0	2009-12-20	1230	\N	68420	\N
75685	GENERIC_DAY	1	0	2009-12-19	1220	\N	68420	\N
75686	GENERIC_DAY	1	1	2009-12-22	1217	\N	68420	\N
75687	GENERIC_DAY	1	3	2009-12-28	1220	\N	68421	\N
75688	GENERIC_DAY	1	0	2009-12-27	1220	\N	68421	\N
75689	GENERIC_DAY	1	0	2009-12-26	1228	\N	68421	\N
75690	GENERIC_DAY	1	2	2009-12-24	1228	\N	68421	\N
75691	GENERIC_DAY	1	2	2009-12-24	1230	\N	68421	\N
75692	GENERIC_DAY	1	0	2009-12-26	1220	\N	68421	\N
75693	GENERIC_DAY	1	0	2009-12-27	1228	\N	68421	\N
75694	GENERIC_DAY	1	2	2009-12-25	1228	\N	68421	\N
75695	GENERIC_DAY	1	0	2009-12-27	1217	\N	68421	\N
75696	GENERIC_DAY	1	2	2009-12-28	1228	\N	68421	\N
75697	GENERIC_DAY	1	3	2009-12-24	1220	\N	68421	\N
75698	GENERIC_DAY	1	1	2009-12-25	1217	\N	68421	\N
75699	GENERIC_DAY	1	3	2009-12-25	1220	\N	68421	\N
75700	GENERIC_DAY	1	0	2009-12-26	1230	\N	68421	\N
75701	GENERIC_DAY	1	2	2009-12-28	1230	\N	68421	\N
75702	GENERIC_DAY	1	0	2009-12-27	1230	\N	68421	\N
75703	GENERIC_DAY	1	0	2009-12-26	1217	\N	68421	\N
75704	GENERIC_DAY	1	1	2009-12-28	1217	\N	68421	\N
75705	GENERIC_DAY	1	2	2009-12-25	1230	\N	68421	\N
75706	GENERIC_DAY	1	1	2009-12-24	1217	\N	68421	\N
75707	GENERIC_DAY	1	2	2009-12-24	1220	\N	68422	\N
75708	GENERIC_DAY	1	0	2009-12-26	1220	\N	68422	\N
75709	GENERIC_DAY	1	0	2009-12-27	1230	\N	68422	\N
75710	GENERIC_DAY	1	2	2009-12-28	1230	\N	68422	\N
75711	GENERIC_DAY	1	0	2009-12-27	1228	\N	68422	\N
75712	GENERIC_DAY	1	2	2009-12-25	1228	\N	68422	\N
75713	GENERIC_DAY	1	2	2009-12-28	1217	\N	68422	\N
75714	GENERIC_DAY	1	2	2009-12-24	1228	\N	68422	\N
75715	GENERIC_DAY	1	2	2009-12-25	1220	\N	68422	\N
75716	GENERIC_DAY	1	0	2009-12-27	1220	\N	68422	\N
75717	GENERIC_DAY	1	0	2009-12-27	1217	\N	68422	\N
75718	GENERIC_DAY	1	2	2009-12-28	1228	\N	68422	\N
75719	GENERIC_DAY	1	2	2009-12-24	1217	\N	68422	\N
75720	GENERIC_DAY	1	0	2009-12-26	1217	\N	68422	\N
75721	GENERIC_DAY	1	2	2009-12-28	1220	\N	68422	\N
75722	GENERIC_DAY	1	2	2009-12-25	1230	\N	68422	\N
75723	GENERIC_DAY	1	2	2009-12-25	1217	\N	68422	\N
75724	GENERIC_DAY	1	0	2009-12-26	1230	\N	68422	\N
75725	GENERIC_DAY	1	2	2009-12-24	1230	\N	68422	\N
75726	GENERIC_DAY	1	0	2009-12-26	1228	\N	68422	\N
75727	GENERIC_DAY	1	0	2009-12-20	1228	\N	68423	\N
75728	GENERIC_DAY	1	2	2009-12-22	1217	\N	68423	\N
75729	GENERIC_DAY	1	0	2009-12-19	1220	\N	68423	\N
75730	GENERIC_DAY	1	0	2009-12-19	1228	\N	68423	\N
75731	GENERIC_DAY	1	0	2009-12-19	1217	\N	68423	\N
75732	GENERIC_DAY	1	2	2009-12-21	1217	\N	68423	\N
75733	GENERIC_DAY	1	2	2009-12-22	1228	\N	68423	\N
75734	GENERIC_DAY	1	2	2009-12-21	1228	\N	68423	\N
75735	GENERIC_DAY	1	2	2009-12-23	1228	\N	68423	\N
75736	GENERIC_DAY	1	0	2009-12-20	1217	\N	68423	\N
75737	GENERIC_DAY	1	2	2009-12-23	1217	\N	68423	\N
75738	GENERIC_DAY	1	2	2009-12-22	1220	\N	68423	\N
75739	GENERIC_DAY	1	0	2009-12-20	1230	\N	68423	\N
75740	GENERIC_DAY	1	2	2009-12-22	1230	\N	68423	\N
75741	GENERIC_DAY	1	2	2009-12-21	1230	\N	68423	\N
75742	GENERIC_DAY	1	2	2009-12-21	1220	\N	68423	\N
75743	GENERIC_DAY	1	2	2009-12-23	1230	\N	68423	\N
75744	GENERIC_DAY	1	0	2009-12-20	1220	\N	68423	\N
75745	GENERIC_DAY	1	2	2009-12-23	1220	\N	68423	\N
75746	GENERIC_DAY	1	0	2009-12-19	1230	\N	68423	\N
75747	GENERIC_DAY	1	0	2010-01-16	1220	\N	60756	\N
75748	GENERIC_DAY	1	2	2010-01-13	1217	\N	60756	\N
75749	GENERIC_DAY	1	0	2010-01-10	1217	\N	60756	\N
75750	GENERIC_DAY	1	2	2010-01-15	1230	\N	60756	\N
75751	GENERIC_DAY	1	2	2010-01-12	1217	\N	60756	\N
75752	GENERIC_DAY	1	0	2010-01-16	1230	\N	60756	\N
75753	GENERIC_DAY	1	0	2010-01-10	1220	\N	60756	\N
75754	GENERIC_DAY	1	2	2010-01-15	1220	\N	60756	\N
75755	GENERIC_DAY	1	0	2010-01-09	1217	\N	60756	\N
75756	GENERIC_DAY	1	0	2010-01-17	1230	\N	60756	\N
75757	GENERIC_DAY	1	0	2010-01-17	1217	\N	60756	\N
75758	GENERIC_DAY	1	2	2010-01-14	1217	\N	60756	\N
75759	GENERIC_DAY	1	0	2010-01-17	1220	\N	60756	\N
75760	GENERIC_DAY	1	0	2010-01-09	1228	\N	60756	\N
75761	GENERIC_DAY	1	2	2010-01-12	1230	\N	60756	\N
75762	GENERIC_DAY	1	2	2010-01-15	1228	\N	60756	\N
75763	GENERIC_DAY	1	0	2010-01-10	1230	\N	60756	\N
75764	GENERIC_DAY	1	2	2010-01-08	1230	\N	60756	\N
75765	GENERIC_DAY	1	2	2010-01-11	1228	\N	60756	\N
75766	GENERIC_DAY	1	2	2010-01-08	1220	\N	60756	\N
75767	GENERIC_DAY	1	2	2010-01-08	1228	\N	60756	\N
75768	GENERIC_DAY	1	2	2010-01-15	1217	\N	60756	\N
75769	GENERIC_DAY	1	2	2010-01-18	1217	\N	60756	\N
75770	GENERIC_DAY	1	2	2010-01-13	1230	\N	60756	\N
75771	GENERIC_DAY	1	2	2010-01-14	1220	\N	60756	\N
75772	GENERIC_DAY	1	2	2010-01-14	1228	\N	60756	\N
75773	GENERIC_DAY	1	2	2010-01-11	1220	\N	60756	\N
75774	GENERIC_DAY	1	2	2010-01-12	1228	\N	60756	\N
75775	GENERIC_DAY	1	2	2010-01-11	1217	\N	60756	\N
75776	GENERIC_DAY	1	2	2010-01-18	1230	\N	60756	\N
75777	GENERIC_DAY	1	2	2010-01-14	1230	\N	60756	\N
75778	GENERIC_DAY	1	2	2010-01-13	1220	\N	60756	\N
75779	GENERIC_DAY	1	2	2010-01-18	1228	\N	60756	\N
75780	GENERIC_DAY	1	2	2010-01-13	1228	\N	60756	\N
75781	GENERIC_DAY	1	0	2010-01-10	1228	\N	60756	\N
75782	GENERIC_DAY	1	2	2010-01-11	1230	\N	60756	\N
75783	GENERIC_DAY	1	0	2010-01-09	1220	\N	60756	\N
75784	GENERIC_DAY	1	2	2010-01-18	1220	\N	60756	\N
75785	GENERIC_DAY	1	0	2010-01-17	1228	\N	60756	\N
75786	GENERIC_DAY	1	2	2010-01-12	1220	\N	60756	\N
75787	GENERIC_DAY	1	0	2010-01-09	1230	\N	60756	\N
75788	GENERIC_DAY	1	2	2010-01-08	1217	\N	60756	\N
75789	GENERIC_DAY	1	0	2010-01-16	1228	\N	60756	\N
75790	GENERIC_DAY	1	0	2010-01-16	1217	\N	60756	\N
62504	GENERIC_DAY	3	2	2009-12-21	1230	\N	60758	\N
62513	GENERIC_DAY	3	0	2009-12-19	1228	\N	60758	\N
62496	GENERIC_DAY	3	0	2009-12-19	1230	\N	60758	\N
62508	GENERIC_DAY	3	0	2009-12-19	1217	\N	60758	\N
62501	GENERIC_DAY	3	2	2009-12-21	1217	\N	60758	\N
62499	GENERIC_DAY	3	0	2009-12-19	1220	\N	60758	\N
62484	GENERIC_DAY	3	2	2009-12-16	1230	\N	60758	\N
62503	GENERIC_DAY	3	2	2009-12-18	1217	\N	60758	\N
62488	GENERIC_DAY	3	0	2009-12-20	1217	\N	60758	\N
62485	GENERIC_DAY	3	2	2009-12-16	1228	\N	60758	\N
62482	GENERIC_DAY	3	2	2009-12-15	1220	\N	60758	\N
62500	GENERIC_DAY	3	2	2009-12-16	1220	\N	60758	\N
62483	GENERIC_DAY	3	2	2009-12-14	1217	\N	60758	\N
62498	GENERIC_DAY	3	2	2009-12-17	1220	\N	60758	\N
62497	GENERIC_DAY	3	2	2009-12-15	1228	\N	60758	\N
62510	GENERIC_DAY	3	2	2009-12-18	1230	\N	60758	\N
62490	GENERIC_DAY	3	2	2009-12-21	1220	\N	60758	\N
62506	GENERIC_DAY	3	2	2009-12-18	1220	\N	60758	\N
62511	GENERIC_DAY	3	2	2009-12-17	1228	\N	60758	\N
62493	GENERIC_DAY	3	2	2009-12-15	1230	\N	60758	\N
62487	GENERIC_DAY	3	2	2009-12-14	1228	\N	60758	\N
62489	GENERIC_DAY	3	2	2009-12-16	1217	\N	60758	\N
60364	GENERIC_DAY	6	2	2009-12-22	1220	\N	58468	\N
60353	GENERIC_DAY	6	2	2009-12-30	1220	\N	58468	\N
60350	GENERIC_DAY	6	2	2009-12-28	1220	\N	58468	\N
60341	GENERIC_DAY	6	2	2009-12-29	1228	\N	58468	\N
60431	GENERIC_DAY	6	2	2009-12-15	1220	\N	58470	\N
60439	GENERIC_DAY	6	2	2009-12-17	1228	\N	58470	\N
60437	GENERIC_DAY	6	2	2009-12-15	1217	\N	58470	\N
60446	GENERIC_DAY	6	2	2009-12-17	1230	\N	58470	\N
60445	GENERIC_DAY	6	2	2009-12-18	1217	\N	58470	\N
60434	GENERIC_DAY	6	2	2009-12-15	1230	\N	58470	\N
60443	GENERIC_DAY	6	2	2009-12-16	1230	\N	58470	\N
60442	GENERIC_DAY	6	2	2009-12-18	1230	\N	58470	\N
60430	GENERIC_DAY	6	2	2009-12-18	1220	\N	58470	\N
60441	GENERIC_DAY	6	2	2009-12-15	1228	\N	58470	\N
60444	GENERIC_DAY	6	2	2009-12-17	1217	\N	58470	\N
60448	GENERIC_DAY	6	2	2009-12-17	1220	\N	58470	\N
88020	SPECIFIC_DAY	3	7	2010-05-27	1226	86460	\N	\N
88021	SPECIFIC_DAY	3	7	2010-06-03	1226	86460	\N	\N
88022	SPECIFIC_DAY	3	8	2010-05-12	1226	86460	\N	\N
88023	SPECIFIC_DAY	3	7	2010-05-28	1226	86460	\N	\N
88024	SPECIFIC_DAY	3	7	2010-05-24	1226	86460	\N	\N
88025	SPECIFIC_DAY	3	8	2010-05-06	1226	86460	\N	\N
88026	SPECIFIC_DAY	3	8	2010-04-29	1226	86460	\N	\N
88027	SPECIFIC_DAY	3	8	2010-04-30	1226	86460	\N	\N
88028	SPECIFIC_DAY	3	8	2010-05-05	1226	86460	\N	\N
88029	SPECIFIC_DAY	3	8	2010-04-19	1226	86460	\N	\N
88030	SPECIFIC_DAY	3	8	2010-04-20	1226	86460	\N	\N
88031	SPECIFIC_DAY	3	7	2010-05-20	1226	86460	\N	\N
88032	SPECIFIC_DAY	3	7	2010-05-25	1226	86460	\N	\N
88033	SPECIFIC_DAY	3	8	2010-05-04	1226	86460	\N	\N
88034	SPECIFIC_DAY	3	8	2010-05-11	1226	86460	\N	\N
88035	SPECIFIC_DAY	3	8	2010-05-07	1226	86460	\N	\N
88036	SPECIFIC_DAY	3	8	2010-05-10	1226	86460	\N	\N
88037	SPECIFIC_DAY	3	7	2010-05-13	1226	86460	\N	\N
88038	SPECIFIC_DAY	3	8	2010-04-23	1226	86460	\N	\N
88039	SPECIFIC_DAY	3	8	2010-04-26	1226	86460	\N	\N
88040	SPECIFIC_DAY	3	7	2010-05-31	1226	86460	\N	\N
88041	SPECIFIC_DAY	3	8	2010-04-27	1226	86460	\N	\N
88042	SPECIFIC_DAY	3	8	2010-04-21	1226	86460	\N	\N
88043	SPECIFIC_DAY	3	7	2010-06-04	1226	86460	\N	\N
88044	SPECIFIC_DAY	3	7	2010-06-01	1226	86460	\N	\N
88045	SPECIFIC_DAY	3	8	2010-05-03	1226	86460	\N	\N
88046	SPECIFIC_DAY	3	8	2010-04-22	1226	86460	\N	\N
88047	SPECIFIC_DAY	3	7	2010-05-19	1226	86460	\N	\N
88048	SPECIFIC_DAY	3	8	2010-04-28	1226	86460	\N	\N
88049	SPECIFIC_DAY	3	7	2010-05-21	1226	86460	\N	\N
88050	SPECIFIC_DAY	3	7	2010-05-18	1226	86460	\N	\N
88051	SPECIFIC_DAY	3	7	2010-05-14	1226	86460	\N	\N
88052	SPECIFIC_DAY	3	7	2010-05-26	1226	86460	\N	\N
88053	SPECIFIC_DAY	3	7	2010-06-02	1226	86460	\N	\N
60883	GENERIC_DAY	4	2	2009-12-14	1217	\N	60703	\N
60874	GENERIC_DAY	4	2	2009-12-17	1230	\N	60703	\N
60877	GENERIC_DAY	4	2	2009-12-18	1217	\N	60703	\N
60880	GENERIC_DAY	4	2	2009-12-18	1220	\N	60703	\N
60887	GENERIC_DAY	4	2	2009-12-18	1228	\N	60703	\N
60885	GENERIC_DAY	4	2	2009-12-14	1228	\N	60703	\N
60888	GENERIC_DAY	4	2	2009-12-17	1220	\N	60703	\N
60884	GENERIC_DAY	4	2	2009-12-14	1220	\N	60703	\N
60893	GENERIC_DAY	4	2	2009-12-15	1217	\N	60703	\N
60891	GENERIC_DAY	4	2	2009-12-16	1230	\N	60703	\N
60878	GENERIC_DAY	4	2	2009-12-16	1228	\N	60703	\N
62424	GENERIC_DAY	3	2	2009-12-23	1228	\N	58461	\N
62426	GENERIC_DAY	3	2	2009-12-23	1230	\N	58461	\N
62425	GENERIC_DAY	3	2	2009-12-24	1217	\N	58461	\N
62433	GENERIC_DAY	3	2	2009-12-22	1230	\N	58461	\N
62431	GENERIC_DAY	3	2	2009-12-24	1230	\N	58461	\N
62429	GENERIC_DAY	3	2	2009-12-24	1228	\N	58461	\N
62427	GENERIC_DAY	3	2	2009-12-23	1217	\N	58461	\N
62423	GENERIC_DAY	3	2	2009-12-22	1228	\N	58461	\N
62432	GENERIC_DAY	3	2	2009-12-24	1220	\N	58461	\N
62428	GENERIC_DAY	3	2	2009-12-22	1220	\N	58461	\N
62430	GENERIC_DAY	3	2	2009-12-22	1217	\N	58461	\N
62422	GENERIC_DAY	3	2	2009-12-23	1220	\N	58461	\N
62509	GENERIC_DAY	3	2	2009-12-17	1230	\N	60758	\N
62491	GENERIC_DAY	3	2	2009-12-15	1217	\N	60758	\N
62492	GENERIC_DAY	3	2	2009-12-14	1230	\N	60758	\N
62507	GENERIC_DAY	3	2	2009-12-21	1228	\N	60758	\N
62486	GENERIC_DAY	3	0	2009-12-20	1230	\N	60758	\N
62505	GENERIC_DAY	3	2	2009-12-17	1217	\N	60758	\N
62502	GENERIC_DAY	3	0	2009-12-20	1220	\N	60758	\N
62512	GENERIC_DAY	3	2	2009-12-14	1220	\N	60758	\N
62494	GENERIC_DAY	3	2	2009-12-18	1228	\N	60758	\N
62495	GENERIC_DAY	3	0	2009-12-20	1228	\N	60758	\N
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
74762	GENERIC_DAY	1	0	2010-01-09	1228	\N	58469	\N
74763	GENERIC_DAY	1	0	2010-01-02	1230	\N	58469	\N
74764	GENERIC_DAY	1	2	2009-12-31	1220	\N	58469	\N
74765	GENERIC_DAY	1	2	2010-01-13	1220	\N	58469	\N
74766	GENERIC_DAY	1	1	2009-12-31	1228	\N	58469	\N
74767	GENERIC_DAY	1	2	2010-01-15	1217	\N	58469	\N
74768	GENERIC_DAY	1	0	2010-01-02	1228	\N	58469	\N
74769	GENERIC_DAY	1	2	2010-01-15	1228	\N	58469	\N
74770	GENERIC_DAY	1	2	2010-01-12	1228	\N	58469	\N
74771	GENERIC_DAY	1	2	2010-01-05	1220	\N	58469	\N
74772	GENERIC_DAY	1	0	2010-01-03	1230	\N	58469	\N
74773	GENERIC_DAY	1	2	2010-01-11	1228	\N	58469	\N
74774	GENERIC_DAY	1	2	2010-01-08	1230	\N	58469	\N
74775	GENERIC_DAY	1	2	2010-01-13	1217	\N	58469	\N
74776	GENERIC_DAY	1	0	2010-01-03	1228	\N	58469	\N
74777	GENERIC_DAY	1	2	2010-01-07	1217	\N	58469	\N
74778	GENERIC_DAY	1	2	2010-01-08	1217	\N	58469	\N
74779	GENERIC_DAY	1	2	2010-01-04	1230	\N	58469	\N
74780	GENERIC_DAY	1	2	2010-01-05	1228	\N	58469	\N
74781	GENERIC_DAY	1	2	2010-01-12	1230	\N	58469	\N
74782	GENERIC_DAY	1	1	2010-01-04	1228	\N	58469	\N
74783	GENERIC_DAY	1	2	2010-01-08	1220	\N	58469	\N
74784	GENERIC_DAY	1	2	2010-01-07	1228	\N	58469	\N
74785	GENERIC_DAY	1	0	2010-01-09	1217	\N	58469	\N
74786	GENERIC_DAY	1	2	2010-01-06	1217	\N	58469	\N
74787	GENERIC_DAY	1	2	2010-01-07	1220	\N	58469	\N
74788	GENERIC_DAY	1	0	2010-01-10	1228	\N	58469	\N
87102	SPECIFIC_DAY	0	0	2010-03-06	1220	86458	\N	\N
87103	SPECIFIC_DAY	0	8	2010-03-03	1220	86458	\N	\N
87104	SPECIFIC_DAY	0	8	2010-03-01	1220	86458	\N	\N
87105	SPECIFIC_DAY	0	0	2010-03-13	1220	86458	\N	\N
87106	SPECIFIC_DAY	0	8	2010-02-19	1220	86458	\N	\N
87107	SPECIFIC_DAY	0	8	2010-03-04	1220	86458	\N	\N
87108	SPECIFIC_DAY	0	8	2010-02-18	1220	86458	\N	\N
87109	SPECIFIC_DAY	0	0	2010-03-21	1220	86458	\N	\N
87110	SPECIFIC_DAY	0	8	2010-02-16	1220	86458	\N	\N
87111	SPECIFIC_DAY	0	0	2010-02-28	1220	86458	\N	\N
87112	SPECIFIC_DAY	0	0	2010-02-17	1220	86458	\N	\N
87113	SPECIFIC_DAY	0	8	2010-02-24	1220	86458	\N	\N
87114	SPECIFIC_DAY	0	8	2010-03-22	1220	86458	\N	\N
87115	SPECIFIC_DAY	0	8	2010-03-12	1220	86458	\N	\N
87116	SPECIFIC_DAY	0	0	2010-02-21	1220	86458	\N	\N
87117	SPECIFIC_DAY	0	8	2010-03-05	1220	86458	\N	\N
87118	SPECIFIC_DAY	0	8	2010-02-22	1220	86458	\N	\N
87119	SPECIFIC_DAY	0	8	2010-02-25	1220	86458	\N	\N
87120	SPECIFIC_DAY	0	8	2010-02-26	1220	86458	\N	\N
87121	SPECIFIC_DAY	0	8	2010-02-12	1220	86458	\N	\N
87122	SPECIFIC_DAY	0	0	2010-02-20	1220	86458	\N	\N
87123	SPECIFIC_DAY	0	0	2010-03-28	1220	86458	\N	\N
87124	SPECIFIC_DAY	0	8	2010-03-16	1220	86458	\N	\N
87125	SPECIFIC_DAY	0	8	2010-03-02	1220	86458	\N	\N
87126	SPECIFIC_DAY	0	8	2010-03-10	1220	86458	\N	\N
87127	SPECIFIC_DAY	0	8	2010-03-29	1220	86458	\N	\N
87128	SPECIFIC_DAY	0	8	2010-03-17	1220	86458	\N	\N
87129	SPECIFIC_DAY	0	8	2010-02-15	1220	86458	\N	\N
87130	SPECIFIC_DAY	0	0	2010-03-27	1220	86458	\N	\N
87131	SPECIFIC_DAY	0	0	2010-02-13	1220	86458	\N	\N
87132	SPECIFIC_DAY	0	8	2010-03-25	1220	86458	\N	\N
87133	SPECIFIC_DAY	0	8	2010-03-24	1220	86458	\N	\N
87134	SPECIFIC_DAY	0	8	2010-03-08	1220	86458	\N	\N
87135	SPECIFIC_DAY	0	8	2010-03-26	1220	86458	\N	\N
87136	SPECIFIC_DAY	0	8	2010-03-31	1220	86458	\N	\N
87137	SPECIFIC_DAY	0	8	2010-03-11	1220	86458	\N	\N
87138	SPECIFIC_DAY	0	0	2010-03-20	1220	86458	\N	\N
87139	SPECIFIC_DAY	0	8	2010-03-30	1220	86458	\N	\N
87140	SPECIFIC_DAY	0	8	2010-03-09	1220	86458	\N	\N
87141	SPECIFIC_DAY	0	8	2010-03-18	1220	86458	\N	\N
87142	SPECIFIC_DAY	0	8	2010-02-23	1220	86458	\N	\N
87143	SPECIFIC_DAY	0	0	2010-02-14	1220	86458	\N	\N
87144	SPECIFIC_DAY	0	0	2010-03-14	1220	86458	\N	\N
87145	SPECIFIC_DAY	0	0	2010-02-27	1220	86458	\N	\N
87146	SPECIFIC_DAY	0	0	2010-03-19	1220	86458	\N	\N
87147	SPECIFIC_DAY	0	0	2010-03-07	1220	86458	\N	\N
87148	SPECIFIC_DAY	0	8	2010-03-23	1220	86458	\N	\N
87149	SPECIFIC_DAY	0	8	2010-03-15	1220	86458	\N	\N
87150	GENERIC_DAY	0	0	2010-02-12	1220	\N	86459	\N
87151	GENERIC_DAY	0	0	2010-03-12	1230	\N	86459	\N
87152	GENERIC_DAY	0	0	2010-03-28	1234	\N	86459	\N
87153	GENERIC_DAY	0	8	2010-03-04	1236	\N	86459	\N
87154	GENERIC_DAY	0	0	2010-03-30	1228	\N	86459	\N
87155	GENERIC_DAY	0	0	2010-03-23	1226	\N	86459	\N
87156	GENERIC_DAY	0	0	2010-02-24	1232	\N	86459	\N
87157	GENERIC_DAY	0	0	2010-03-28	1239	\N	86459	\N
87158	GENERIC_DAY	0	0	2010-03-19	1230	\N	86459	\N
87159	GENERIC_DAY	0	0	2010-03-09	1234	\N	86459	\N
87160	GENERIC_DAY	0	0	2010-02-17	1236	\N	86459	\N
87161	GENERIC_DAY	0	0	2010-03-08	1234	\N	86459	\N
87162	GENERIC_DAY	0	0	2010-03-28	1232	\N	86459	\N
87163	GENERIC_DAY	0	0	2010-03-28	1226	\N	86459	\N
87164	GENERIC_DAY	0	0	2010-03-25	1224	\N	86459	\N
87165	GENERIC_DAY	0	0	2010-03-22	1234	\N	86459	\N
87166	GENERIC_DAY	0	0	2010-03-07	1220	\N	86459	\N
87167	GENERIC_DAY	0	0	2010-03-24	1228	\N	86459	\N
87168	GENERIC_DAY	0	0	2010-03-23	1230	\N	86459	\N
87169	GENERIC_DAY	0	0	2010-02-17	1230	\N	86459	\N
87170	GENERIC_DAY	0	0	2010-03-16	1220	\N	86459	\N
87171	GENERIC_DAY	0	0	2010-03-04	1220	\N	86459	\N
87172	GENERIC_DAY	0	0	2010-03-11	1228	\N	86459	\N
87173	GENERIC_DAY	0	0	2010-03-03	1220	\N	86459	\N
87174	GENERIC_DAY	0	0	2010-03-06	1239	\N	86459	\N
87175	GENERIC_DAY	0	0	2010-02-13	1239	\N	86459	\N
87176	GENERIC_DAY	0	2	2010-02-15	1232	\N	86459	\N
87177	GENERIC_DAY	0	0	2010-02-21	1230	\N	86459	\N
87178	GENERIC_DAY	0	0	2010-02-15	1220	\N	86459	\N
87179	GENERIC_DAY	0	0	2010-03-15	1217	\N	86459	\N
87180	GENERIC_DAY	0	8	2010-02-25	1236	\N	86459	\N
87181	GENERIC_DAY	0	0	2010-03-27	1239	\N	86459	\N
87182	GENERIC_DAY	0	0	2010-03-19	1234	\N	86459	\N
87183	GENERIC_DAY	0	0	2010-03-14	1239	\N	86459	\N
87184	GENERIC_DAY	0	8	2010-03-25	1236	\N	86459	\N
87185	GENERIC_DAY	0	0	2010-03-21	1224	\N	86459	\N
87186	GENERIC_DAY	0	0	2010-03-15	1232	\N	86459	\N
87187	GENERIC_DAY	0	0	2010-03-21	1236	\N	86459	\N
87188	GENERIC_DAY	0	0	2010-02-23	1239	\N	86459	\N
87189	GENERIC_DAY	0	0	2010-02-14	1220	\N	86459	\N
87190	GENERIC_DAY	0	1	2010-02-16	1230	\N	86459	\N
87191	GENERIC_DAY	0	0	2010-02-17	1224	\N	86459	\N
87192	GENERIC_DAY	0	0	2010-02-21	1239	\N	86459	\N
87193	GENERIC_DAY	0	0	2010-02-28	1232	\N	86459	\N
87194	GENERIC_DAY	0	0	2010-03-15	1214	\N	86459	\N
87195	GENERIC_DAY	0	0	2010-03-16	1228	\N	86459	\N
87196	GENERIC_DAY	0	0	2010-03-21	1228	\N	86459	\N
87197	GENERIC_DAY	0	0	2010-03-23	1214	\N	86459	\N
87198	GENERIC_DAY	0	0	2010-02-25	1222	\N	86459	\N
87199	GENERIC_DAY	0	0	2010-03-19	1220	\N	86459	\N
87200	GENERIC_DAY	0	0	2010-03-06	1222	\N	86459	\N
87201	GENERIC_DAY	0	0	2010-03-21	1222	\N	86459	\N
87202	GENERIC_DAY	0	0	2010-03-22	1224	\N	86459	\N
87203	GENERIC_DAY	0	1	2010-02-12	1217	\N	86459	\N
87204	GENERIC_DAY	0	0	2010-02-24	1230	\N	86459	\N
87205	GENERIC_DAY	0	0	2010-03-10	1222	\N	86459	\N
87206	GENERIC_DAY	0	0	2010-03-22	1220	\N	86459	\N
87207	GENERIC_DAY	0	0	2010-02-25	1234	\N	86459	\N
87208	GENERIC_DAY	0	0	2010-03-14	1228	\N	86459	\N
87209	GENERIC_DAY	0	1	2010-02-19	1217	\N	86459	\N
87210	GENERIC_DAY	0	0	2010-03-08	1228	\N	86459	\N
87211	GENERIC_DAY	0	0	2010-03-20	1236	\N	86459	\N
87212	GENERIC_DAY	0	8	2010-03-17	1236	\N	86459	\N
87213	GENERIC_DAY	0	0	2010-03-12	1220	\N	86459	\N
87214	GENERIC_DAY	0	0	2010-03-14	1214	\N	86459	\N
87215	GENERIC_DAY	0	0	2010-03-02	1234	\N	86459	\N
87216	GENERIC_DAY	0	0	2010-03-16	1239	\N	86459	\N
87217	GENERIC_DAY	0	0	2010-02-28	1224	\N	86459	\N
87218	GENERIC_DAY	0	0	2010-03-30	1226	\N	86459	\N
87219	GENERIC_DAY	0	0	2010-02-20	1239	\N	86459	\N
87220	GENERIC_DAY	0	0	2010-03-24	1214	\N	86459	\N
87221	GENERIC_DAY	0	0	2010-02-28	1220	\N	86459	\N
87222	GENERIC_DAY	0	0	2010-02-17	1228	\N	86459	\N
87223	GENERIC_DAY	0	0	2010-03-12	1228	\N	86459	\N
87224	GENERIC_DAY	0	0	2010-03-22	1217	\N	86459	\N
87225	GENERIC_DAY	0	0	2010-02-13	1222	\N	86459	\N
87226	GENERIC_DAY	0	0	2010-03-07	1236	\N	86459	\N
87227	GENERIC_DAY	0	0	2010-03-03	1232	\N	86459	\N
87228	GENERIC_DAY	0	0	2010-03-01	1226	\N	86459	\N
87229	GENERIC_DAY	0	0	2010-02-23	1226	\N	86459	\N
87230	GENERIC_DAY	0	0	2010-03-11	1239	\N	86459	\N
87231	GENERIC_DAY	0	0	2010-03-26	1224	\N	86459	\N
87232	GENERIC_DAY	0	0	2010-02-26	1226	\N	86459	\N
87233	GENERIC_DAY	0	0	2010-02-28	1236	\N	86459	\N
87234	GENERIC_DAY	0	0	2010-03-18	1217	\N	86459	\N
87235	GENERIC_DAY	0	0	2010-03-10	1226	\N	86459	\N
87236	GENERIC_DAY	0	0	2010-03-27	1228	\N	86459	\N
87237	GENERIC_DAY	0	0	2010-03-03	1234	\N	86459	\N
87238	GENERIC_DAY	0	0	2010-02-17	1239	\N	86459	\N
87239	GENERIC_DAY	0	0	2010-03-18	1234	\N	86459	\N
87240	GENERIC_DAY	0	0	2010-03-22	1228	\N	86459	\N
87241	GENERIC_DAY	0	0	2010-02-16	1226	\N	86459	\N
87242	GENERIC_DAY	0	0	2010-03-17	1224	\N	86459	\N
87243	GENERIC_DAY	0	0	2010-03-07	1222	\N	86459	\N
87244	GENERIC_DAY	0	0	2010-03-12	1214	\N	86459	\N
87245	GENERIC_DAY	0	0	2010-03-31	1224	\N	86459	\N
87246	GENERIC_DAY	0	0	2010-03-28	1236	\N	86459	\N
87247	GENERIC_DAY	0	0	2010-03-20	1239	\N	86459	\N
87248	GENERIC_DAY	0	0	2010-03-18	1224	\N	86459	\N
87249	GENERIC_DAY	0	0	2010-03-11	1220	\N	86459	\N
87250	GENERIC_DAY	0	0	2010-02-20	1217	\N	86459	\N
87251	GENERIC_DAY	0	0	2010-03-23	1224	\N	86459	\N
87252	GENERIC_DAY	0	0	2010-03-03	1230	\N	86459	\N
87253	GENERIC_DAY	0	0	2010-02-20	1224	\N	86459	\N
87254	GENERIC_DAY	0	1	2010-02-22	1230	\N	86459	\N
87255	GENERIC_DAY	0	0	2010-03-28	1222	\N	86459	\N
87256	GENERIC_DAY	0	0	2010-02-16	1220	\N	86459	\N
87257	GENERIC_DAY	0	0	2010-03-13	1214	\N	86459	\N
87258	GENERIC_DAY	0	0	2010-03-17	1230	\N	86459	\N
87259	GENERIC_DAY	0	0	2010-03-10	1220	\N	86459	\N
87260	GENERIC_DAY	0	0	2010-03-17	1217	\N	86459	\N
87261	GENERIC_DAY	0	0	2010-03-13	1234	\N	86459	\N
87262	GENERIC_DAY	0	0	2010-02-16	1224	\N	86459	\N
87263	GENERIC_DAY	0	0	2010-03-13	1226	\N	86459	\N
87264	GENERIC_DAY	0	0	2010-03-20	1222	\N	86459	\N
87265	GENERIC_DAY	0	0	2010-03-15	1220	\N	86459	\N
87266	GENERIC_DAY	0	0	2010-02-27	1220	\N	86459	\N
87267	GENERIC_DAY	0	0	2010-03-06	1220	\N	86459	\N
87268	GENERIC_DAY	0	0	2010-03-16	1222	\N	86459	\N
87269	GENERIC_DAY	0	0	2010-03-29	1217	\N	86459	\N
87270	GENERIC_DAY	0	0	2010-03-25	1222	\N	86459	\N
87271	GENERIC_DAY	0	0	2010-03-29	1220	\N	86459	\N
87272	GENERIC_DAY	0	0	2010-03-18	1228	\N	86459	\N
87273	GENERIC_DAY	0	0	2010-03-07	1230	\N	86459	\N
87274	GENERIC_DAY	0	0	2010-02-27	1234	\N	86459	\N
87275	GENERIC_DAY	0	1	2010-02-22	1236	\N	86459	\N
87276	GENERIC_DAY	0	0	2010-02-28	1217	\N	86459	\N
87277	GENERIC_DAY	0	0	2010-02-26	1222	\N	86459	\N
87278	GENERIC_DAY	0	0	2010-03-01	1228	\N	86459	\N
87279	GENERIC_DAY	0	0	2010-03-06	1230	\N	86459	\N
87280	GENERIC_DAY	0	0	2010-03-31	1228	\N	86459	\N
87281	GENERIC_DAY	0	0	2010-02-22	1224	\N	86459	\N
87282	GENERIC_DAY	0	0	2010-02-20	1236	\N	86459	\N
87283	GENERIC_DAY	0	0	2010-03-23	1234	\N	86459	\N
87284	GENERIC_DAY	0	0	2010-03-20	1217	\N	86459	\N
87285	GENERIC_DAY	0	0	2010-02-18	1224	\N	86459	\N
87286	GENERIC_DAY	0	0	2010-03-13	1239	\N	86459	\N
87287	GENERIC_DAY	0	0	2010-03-27	1226	\N	86459	\N
87288	GENERIC_DAY	0	0	2010-03-27	1224	\N	86459	\N
87289	GENERIC_DAY	0	0	2010-03-19	1224	\N	86459	\N
87290	GENERIC_DAY	0	0	2010-03-02	1228	\N	86459	\N
87291	GENERIC_DAY	0	1	2010-02-15	1228	\N	86459	\N
87292	GENERIC_DAY	0	0	2010-03-06	1217	\N	86459	\N
87293	GENERIC_DAY	0	0	2010-02-20	1214	\N	86459	\N
87294	GENERIC_DAY	0	8	2010-03-15	1236	\N	86459	\N
87295	GENERIC_DAY	0	0	2010-02-25	1224	\N	86459	\N
87296	GENERIC_DAY	0	0	2010-03-30	1239	\N	86459	\N
87297	GENERIC_DAY	0	0	2010-03-06	1228	\N	86459	\N
87298	GENERIC_DAY	0	0	2010-02-24	1214	\N	86459	\N
87299	GENERIC_DAY	0	0	2010-03-06	1236	\N	86459	\N
87300	GENERIC_DAY	0	1	2010-02-18	1222	\N	86459	\N
87301	GENERIC_DAY	0	0	2010-03-08	1239	\N	86459	\N
87302	GENERIC_DAY	0	0	2010-02-27	1214	\N	86459	\N
87303	GENERIC_DAY	0	0	2010-02-16	1214	\N	86459	\N
87304	GENERIC_DAY	0	0	2010-03-03	1217	\N	86459	\N
87305	GENERIC_DAY	0	0	2010-02-23	1214	\N	86459	\N
87306	GENERIC_DAY	0	0	2010-03-26	1222	\N	86459	\N
87307	GENERIC_DAY	0	0	2010-03-17	1232	\N	86459	\N
87308	GENERIC_DAY	0	0	2010-03-07	1232	\N	86459	\N
87309	GENERIC_DAY	0	0	2010-02-12	1214	\N	86459	\N
87310	GENERIC_DAY	0	0	2010-02-20	1220	\N	86459	\N
87311	GENERIC_DAY	0	0	2010-03-30	1220	\N	86459	\N
87312	GENERIC_DAY	0	0	2010-03-09	1214	\N	86459	\N
87313	GENERIC_DAY	0	0	2010-03-24	1232	\N	86459	\N
87314	GENERIC_DAY	0	0	2010-03-21	1234	\N	86459	\N
87315	GENERIC_DAY	0	0	2010-02-27	1222	\N	86459	\N
87316	GENERIC_DAY	0	0	2010-03-21	1232	\N	86459	\N
87317	GENERIC_DAY	0	0	2010-02-13	1217	\N	86459	\N
87318	GENERIC_DAY	0	0	2010-03-12	1222	\N	86459	\N
87319	GENERIC_DAY	0	0	2010-03-25	1217	\N	86459	\N
87320	GENERIC_DAY	0	0	2010-03-17	1226	\N	86459	\N
87321	GENERIC_DAY	0	0	2010-03-19	1217	\N	86459	\N
87322	GENERIC_DAY	0	0	2010-03-11	1230	\N	86459	\N
87323	GENERIC_DAY	0	0	2010-02-27	1224	\N	86459	\N
87324	GENERIC_DAY	0	1	2010-02-19	1228	\N	86459	\N
87325	GENERIC_DAY	0	0	2010-02-14	1234	\N	86459	\N
87326	GENERIC_DAY	0	0	2010-03-14	1222	\N	86459	\N
87327	GENERIC_DAY	0	0	2010-02-25	1217	\N	86459	\N
87328	GENERIC_DAY	0	0	2010-03-15	1226	\N	86459	\N
87329	GENERIC_DAY	0	0	2010-03-20	1228	\N	86459	\N
87330	GENERIC_DAY	0	0	2010-02-24	1239	\N	86459	\N
87331	GENERIC_DAY	0	1	2010-02-18	1217	\N	86459	\N
87332	GENERIC_DAY	0	0	2010-02-13	1236	\N	86459	\N
87333	GENERIC_DAY	0	0	2010-02-19	1224	\N	86459	\N
87334	GENERIC_DAY	0	0	2010-03-02	1232	\N	86459	\N
87335	GENERIC_DAY	0	0	2010-03-04	1239	\N	86459	\N
87336	GENERIC_DAY	0	0	2010-03-05	1230	\N	86459	\N
87337	GENERIC_DAY	0	0	2010-02-18	1214	\N	86459	\N
87338	GENERIC_DAY	0	0	2010-02-25	1214	\N	86459	\N
87339	GENERIC_DAY	0	0	2010-03-02	1226	\N	86459	\N
87340	GENERIC_DAY	0	0	2010-03-26	1226	\N	86459	\N
87341	GENERIC_DAY	0	0	2010-03-13	1228	\N	86459	\N
87342	GENERIC_DAY	0	0	2010-03-28	1230	\N	86459	\N
87343	GENERIC_DAY	0	0	2010-03-27	1236	\N	86459	\N
87344	GENERIC_DAY	0	0	2010-03-11	1226	\N	86459	\N
87345	GENERIC_DAY	0	0	2010-02-26	1232	\N	86459	\N
87346	GENERIC_DAY	0	0	2010-03-07	1239	\N	86459	\N
87347	GENERIC_DAY	0	0	2010-03-15	1222	\N	86459	\N
87348	GENERIC_DAY	0	1	2010-02-23	1217	\N	86459	\N
87349	GENERIC_DAY	0	0	2010-03-07	1226	\N	86459	\N
87350	GENERIC_DAY	0	0	2010-03-11	1222	\N	86459	\N
87351	GENERIC_DAY	0	0	2010-03-11	1217	\N	86459	\N
87352	GENERIC_DAY	0	0	2010-02-24	1228	\N	86459	\N
87353	GENERIC_DAY	0	0	2010-03-13	1236	\N	86459	\N
87354	GENERIC_DAY	0	0	2010-02-24	1224	\N	86459	\N
87355	GENERIC_DAY	0	0	2010-03-16	1226	\N	86459	\N
87356	GENERIC_DAY	0	0	2010-02-27	1230	\N	86459	\N
87357	GENERIC_DAY	0	0	2010-03-28	1217	\N	86459	\N
87358	GENERIC_DAY	0	0	2010-03-29	1232	\N	86459	\N
87359	GENERIC_DAY	0	0	2010-03-14	1230	\N	86459	\N
87360	GENERIC_DAY	0	0	2010-03-13	1220	\N	86459	\N
87361	GENERIC_DAY	0	0	2010-03-02	1222	\N	86459	\N
87362	GENERIC_DAY	0	1	2010-02-12	1236	\N	86459	\N
87363	GENERIC_DAY	0	0	2010-02-28	1214	\N	86459	\N
87364	GENERIC_DAY	0	0	2010-02-23	1224	\N	86459	\N
87365	GENERIC_DAY	0	0	2010-03-13	1232	\N	86459	\N
87366	GENERIC_DAY	0	0	2010-02-26	1230	\N	86459	\N
87367	GENERIC_DAY	0	0	2010-03-19	1214	\N	86459	\N
87368	GENERIC_DAY	0	0	2010-03-04	1226	\N	86459	\N
87369	GENERIC_DAY	0	0	2010-03-31	1220	\N	86459	\N
87370	GENERIC_DAY	0	0	2010-03-30	1214	\N	86459	\N
87371	GENERIC_DAY	0	1	2010-02-15	1236	\N	86459	\N
87372	GENERIC_DAY	0	0	2010-03-10	1217	\N	86459	\N
87373	GENERIC_DAY	0	0	2010-03-24	1220	\N	86459	\N
87374	GENERIC_DAY	0	8	2010-03-11	1236	\N	86459	\N
87375	GENERIC_DAY	0	0	2010-03-06	1234	\N	86459	\N
87376	GENERIC_DAY	0	0	2010-02-12	1239	\N	86459	\N
87377	GENERIC_DAY	0	0	2010-02-23	1228	\N	86459	\N
87378	GENERIC_DAY	0	0	2010-03-01	1239	\N	86459	\N
87379	GENERIC_DAY	0	0	2010-03-17	1220	\N	86459	\N
87380	GENERIC_DAY	0	8	2010-03-08	1236	\N	86459	\N
87381	GENERIC_DAY	0	0	2010-03-20	1214	\N	86459	\N
87382	GENERIC_DAY	0	0	2010-03-28	1220	\N	86459	\N
87383	GENERIC_DAY	0	0	2010-02-26	1234	\N	86459	\N
87384	GENERIC_DAY	0	0	2010-03-03	1214	\N	86459	\N
87385	GENERIC_DAY	0	0	2010-02-26	1228	\N	86459	\N
87386	GENERIC_DAY	0	0	2010-02-26	1214	\N	86459	\N
87387	GENERIC_DAY	0	0	2010-03-01	1232	\N	86459	\N
87388	GENERIC_DAY	0	0	2010-03-28	1224	\N	86459	\N
87389	GENERIC_DAY	0	0	2010-03-21	1239	\N	86459	\N
87390	GENERIC_DAY	0	1	2010-02-16	1222	\N	86459	\N
87391	GENERIC_DAY	0	1	2010-02-18	1226	\N	86459	\N
87392	GENERIC_DAY	0	0	2010-02-14	1230	\N	86459	\N
87393	GENERIC_DAY	0	8	2010-03-30	1236	\N	86459	\N
87394	GENERIC_DAY	0	8	2010-03-12	1236	\N	86459	\N
87395	GENERIC_DAY	0	1	2010-02-18	1230	\N	86459	\N
87396	GENERIC_DAY	0	0	2010-02-27	1236	\N	86459	\N
87397	GENERIC_DAY	0	0	2010-03-27	1234	\N	86459	\N
87398	GENERIC_DAY	0	0	2010-03-10	1228	\N	86459	\N
87399	GENERIC_DAY	0	0	2010-03-23	1232	\N	86459	\N
87400	GENERIC_DAY	0	0	2010-03-07	1217	\N	86459	\N
87401	GENERIC_DAY	0	0	2010-03-25	1234	\N	86459	\N
87402	GENERIC_DAY	0	0	2010-03-05	1224	\N	86459	\N
87403	GENERIC_DAY	0	0	2010-02-14	1214	\N	86459	\N
87404	GENERIC_DAY	0	0	2010-03-19	1226	\N	86459	\N
87405	GENERIC_DAY	0	0	2010-03-08	1224	\N	86459	\N
87406	GENERIC_DAY	0	8	2010-03-26	1236	\N	86459	\N
87407	GENERIC_DAY	0	0	2010-03-15	1224	\N	86459	\N
87408	GENERIC_DAY	0	0	2010-03-05	1222	\N	86459	\N
87409	GENERIC_DAY	0	0	2010-03-09	1239	\N	86459	\N
87410	GENERIC_DAY	0	0	2010-03-03	1224	\N	86459	\N
87411	GENERIC_DAY	0	0	2010-03-27	1232	\N	86459	\N
87412	GENERIC_DAY	0	0	2010-03-26	1217	\N	86459	\N
87413	GENERIC_DAY	0	8	2010-03-22	1236	\N	86459	\N
87414	GENERIC_DAY	0	1	2010-02-23	1232	\N	86459	\N
87415	GENERIC_DAY	0	0	2010-03-13	1230	\N	86459	\N
87416	GENERIC_DAY	0	0	2010-03-29	1222	\N	86459	\N
87417	GENERIC_DAY	0	0	2010-02-13	1220	\N	86459	\N
87418	GENERIC_DAY	0	0	2010-03-11	1232	\N	86459	\N
87419	GENERIC_DAY	0	0	2010-02-21	1220	\N	86459	\N
87420	GENERIC_DAY	0	0	2010-03-24	1230	\N	86459	\N
87421	GENERIC_DAY	0	0	2010-03-01	1214	\N	86459	\N
87422	GENERIC_DAY	0	0	2010-03-29	1234	\N	86459	\N
87423	GENERIC_DAY	0	0	2010-02-27	1232	\N	86459	\N
87424	GENERIC_DAY	0	0	2010-03-28	1228	\N	86459	\N
87425	GENERIC_DAY	0	0	2010-03-16	1230	\N	86459	\N
87426	GENERIC_DAY	0	0	2010-02-19	1220	\N	86459	\N
87427	GENERIC_DAY	0	0	2010-03-13	1217	\N	86459	\N
87428	GENERIC_DAY	0	0	2010-03-03	1239	\N	86459	\N
87429	GENERIC_DAY	0	0	2010-03-10	1232	\N	86459	\N
87430	GENERIC_DAY	0	0	2010-02-25	1232	\N	86459	\N
87431	GENERIC_DAY	0	0	2010-02-17	1232	\N	86459	\N
87432	GENERIC_DAY	0	0	2010-03-21	1217	\N	86459	\N
87433	GENERIC_DAY	0	0	2010-02-21	1232	\N	86459	\N
87434	GENERIC_DAY	0	0	2010-02-17	1226	\N	86459	\N
87435	GENERIC_DAY	0	0	2010-03-18	1239	\N	86459	\N
87436	GENERIC_DAY	0	0	2010-03-18	1230	\N	86459	\N
87437	GENERIC_DAY	0	0	2010-02-25	1220	\N	86459	\N
87438	GENERIC_DAY	0	1	2010-02-16	1217	\N	86459	\N
87439	GENERIC_DAY	0	0	2010-02-13	1230	\N	86459	\N
87440	GENERIC_DAY	0	0	2010-03-25	1226	\N	86459	\N
87441	GENERIC_DAY	0	0	2010-02-26	1224	\N	86459	\N
87442	GENERIC_DAY	0	0	2010-03-19	1236	\N	86459	\N
87443	GENERIC_DAY	0	0	2010-03-16	1224	\N	86459	\N
87444	GENERIC_DAY	0	0	2010-02-13	1224	\N	86459	\N
87445	GENERIC_DAY	0	0	2010-03-06	1214	\N	86459	\N
87446	GENERIC_DAY	0	0	2010-02-21	1214	\N	86459	\N
87447	GENERIC_DAY	0	0	2010-03-25	1228	\N	86459	\N
87448	GENERIC_DAY	0	1	2010-02-15	1230	\N	86459	\N
87449	GENERIC_DAY	0	0	2010-03-26	1228	\N	86459	\N
87450	GENERIC_DAY	0	1	2010-02-18	1234	\N	86459	\N
87451	GENERIC_DAY	0	0	2010-03-18	1220	\N	86459	\N
87452	GENERIC_DAY	0	0	2010-03-16	1234	\N	86459	\N
87453	GENERIC_DAY	0	0	2010-03-08	1226	\N	86459	\N
87454	GENERIC_DAY	0	0	2010-03-15	1239	\N	86459	\N
87455	GENERIC_DAY	0	0	2010-03-25	1239	\N	86459	\N
87456	GENERIC_DAY	0	0	2010-03-21	1214	\N	86459	\N
87457	GENERIC_DAY	0	0	2010-03-18	1222	\N	86459	\N
87458	GENERIC_DAY	0	0	2010-02-20	1232	\N	86459	\N
87459	GENERIC_DAY	0	0	2010-03-18	1232	\N	86459	\N
87460	GENERIC_DAY	0	0	2010-02-16	1239	\N	86459	\N
87461	GENERIC_DAY	0	0	2010-03-19	1222	\N	86459	\N
87462	GENERIC_DAY	0	0	2010-03-16	1217	\N	86459	\N
87463	GENERIC_DAY	0	0	2010-03-25	1214	\N	86459	\N
87464	GENERIC_DAY	0	1	2010-02-19	1234	\N	86459	\N
87465	GENERIC_DAY	0	0	2010-03-27	1230	\N	86459	\N
87466	GENERIC_DAY	0	0	2010-03-31	1234	\N	86459	\N
87467	GENERIC_DAY	0	0	2010-03-17	1214	\N	86459	\N
87468	GENERIC_DAY	0	0	2010-03-05	1226	\N	86459	\N
87469	GENERIC_DAY	0	1	2010-02-23	1234	\N	86459	\N
87470	GENERIC_DAY	0	0	2010-02-21	1222	\N	86459	\N
87471	GENERIC_DAY	0	0	2010-03-10	1224	\N	86459	\N
87472	GENERIC_DAY	0	0	2010-03-09	1228	\N	86459	\N
87473	GENERIC_DAY	0	0	2010-03-08	1230	\N	86459	\N
87474	GENERIC_DAY	0	0	2010-03-04	1224	\N	86459	\N
87475	GENERIC_DAY	0	0	2010-02-28	1228	\N	86459	\N
87476	GENERIC_DAY	0	0	2010-02-14	1217	\N	86459	\N
87477	GENERIC_DAY	0	0	2010-02-17	1214	\N	86459	\N
87478	GENERIC_DAY	0	0	2010-02-27	1226	\N	86459	\N
87479	GENERIC_DAY	0	0	2010-03-07	1224	\N	86459	\N
87480	GENERIC_DAY	0	0	2010-02-15	1214	\N	86459	\N
87481	GENERIC_DAY	0	0	2010-03-14	1224	\N	86459	\N
87482	GENERIC_DAY	0	0	2010-02-15	1226	\N	86459	\N
87483	GENERIC_DAY	0	1	2010-02-19	1230	\N	86459	\N
87484	GENERIC_DAY	0	0	2010-03-22	1226	\N	86459	\N
87485	GENERIC_DAY	0	0	2010-03-30	1234	\N	86459	\N
87486	GENERIC_DAY	0	0	2010-03-22	1232	\N	86459	\N
87487	GENERIC_DAY	0	0	2010-02-25	1226	\N	86459	\N
87488	GENERIC_DAY	0	8	2010-03-23	1236	\N	86459	\N
87489	GENERIC_DAY	0	0	2010-02-14	1224	\N	86459	\N
87490	GENERIC_DAY	0	0	2010-03-08	1220	\N	86459	\N
87491	GENERIC_DAY	0	0	2010-03-04	1228	\N	86459	\N
87492	GENERIC_DAY	0	0	2010-03-07	1228	\N	86459	\N
87493	GENERIC_DAY	0	0	2010-03-09	1222	\N	86459	\N
87494	GENERIC_DAY	0	2	2010-02-12	1232	\N	86459	\N
87495	GENERIC_DAY	0	0	2010-02-22	1239	\N	86459	\N
87496	GENERIC_DAY	0	0	2010-02-24	1217	\N	86459	\N
87497	GENERIC_DAY	0	0	2010-02-24	1220	\N	86459	\N
87498	GENERIC_DAY	0	0	2010-03-20	1226	\N	86459	\N
87499	GENERIC_DAY	0	0	2010-03-15	1234	\N	86459	\N
87500	GENERIC_DAY	0	0	2010-02-28	1226	\N	86459	\N
87501	GENERIC_DAY	0	0	2010-03-13	1224	\N	86459	\N
87502	GENERIC_DAY	0	0	2010-03-22	1214	\N	86459	\N
87503	GENERIC_DAY	0	0	2010-03-25	1220	\N	86459	\N
87504	GENERIC_DAY	0	0	2010-03-17	1228	\N	86459	\N
87505	GENERIC_DAY	0	8	2010-03-01	1236	\N	86459	\N
87506	GENERIC_DAY	0	1	2010-02-22	1217	\N	86459	\N
87507	GENERIC_DAY	0	0	2010-03-05	1234	\N	86459	\N
87508	GENERIC_DAY	0	0	2010-03-29	1226	\N	86459	\N
87509	GENERIC_DAY	0	1	2010-02-18	1236	\N	86459	\N
87510	GENERIC_DAY	0	0	2010-03-23	1228	\N	86459	\N
87511	GENERIC_DAY	0	0	2010-03-19	1228	\N	86459	\N
87512	GENERIC_DAY	0	0	2010-03-06	1224	\N	86459	\N
87513	GENERIC_DAY	0	0	2010-03-07	1214	\N	86459	\N
87514	GENERIC_DAY	0	0	2010-02-21	1236	\N	86459	\N
87515	GENERIC_DAY	0	0	2010-03-30	1232	\N	86459	\N
87516	GENERIC_DAY	0	0	2010-03-02	1220	\N	86459	\N
87517	GENERIC_DAY	0	0	2010-03-02	1224	\N	86459	\N
87518	GENERIC_DAY	0	0	2010-03-04	1232	\N	86459	\N
87519	GENERIC_DAY	0	0	2010-03-09	1220	\N	86459	\N
87520	GENERIC_DAY	0	0	2010-03-24	1234	\N	86459	\N
87521	GENERIC_DAY	0	8	2010-02-24	1236	\N	86459	\N
87522	GENERIC_DAY	0	0	2010-03-11	1214	\N	86459	\N
87523	GENERIC_DAY	0	0	2010-02-20	1226	\N	86459	\N
87524	GENERIC_DAY	0	8	2010-03-31	1236	\N	86459	\N
87525	GENERIC_DAY	0	0	2010-02-25	1239	\N	86459	\N
87526	GENERIC_DAY	0	0	2010-03-29	1230	\N	86459	\N
87527	GENERIC_DAY	0	0	2010-03-11	1234	\N	86459	\N
87528	GENERIC_DAY	0	0	2010-02-28	1234	\N	86459	\N
87529	GENERIC_DAY	0	0	2010-03-20	1234	\N	86459	\N
87530	GENERIC_DAY	0	0	2010-03-21	1230	\N	86459	\N
87531	GENERIC_DAY	0	0	2010-02-21	1226	\N	86459	\N
87532	GENERIC_DAY	0	1	2010-02-22	1226	\N	86459	\N
87533	GENERIC_DAY	0	0	2010-02-27	1239	\N	86459	\N
87534	GENERIC_DAY	0	0	2010-03-15	1228	\N	86459	\N
87535	GENERIC_DAY	0	0	2010-03-12	1232	\N	86459	\N
87536	GENERIC_DAY	0	0	2010-03-31	1230	\N	86459	\N
87537	GENERIC_DAY	0	0	2010-03-23	1239	\N	86459	\N
87538	GENERIC_DAY	0	0	2010-03-25	1230	\N	86459	\N
87539	GENERIC_DAY	0	0	2010-03-22	1239	\N	86459	\N
87540	GENERIC_DAY	0	0	2010-03-20	1220	\N	86459	\N
87541	GENERIC_DAY	0	0	2010-03-10	1239	\N	86459	\N
87542	GENERIC_DAY	0	0	2010-03-31	1222	\N	86459	\N
87543	GENERIC_DAY	0	0	2010-03-11	1224	\N	86459	\N
87544	GENERIC_DAY	0	0	2010-02-20	1230	\N	86459	\N
87545	GENERIC_DAY	0	0	2010-03-22	1230	\N	86459	\N
87546	GENERIC_DAY	0	0	2010-02-22	1220	\N	86459	\N
87547	GENERIC_DAY	0	0	2010-03-09	1226	\N	86459	\N
87548	GENERIC_DAY	0	0	2010-02-26	1220	\N	86459	\N
87549	GENERIC_DAY	0	0	2010-02-28	1230	\N	86459	\N
87550	GENERIC_DAY	0	8	2010-03-29	1236	\N	86459	\N
87551	GENERIC_DAY	0	0	2010-02-26	1217	\N	86459	\N
87552	GENERIC_DAY	0	0	2010-02-13	1232	\N	86459	\N
87553	GENERIC_DAY	0	1	2010-02-19	1222	\N	86459	\N
87554	GENERIC_DAY	0	0	2010-03-17	1222	\N	86459	\N
87555	GENERIC_DAY	0	0	2010-03-28	1214	\N	86459	\N
87556	GENERIC_DAY	0	0	2010-02-26	1239	\N	86459	\N
87557	GENERIC_DAY	0	0	2010-02-20	1228	\N	86459	\N
87558	GENERIC_DAY	0	0	2010-03-02	1230	\N	86459	\N
87559	GENERIC_DAY	0	1	2010-02-18	1228	\N	86459	\N
87560	GENERIC_DAY	0	0	2010-02-22	1214	\N	86459	\N
87561	GENERIC_DAY	0	1	2010-02-18	1232	\N	86459	\N
87562	GENERIC_DAY	0	0	2010-03-12	1217	\N	86459	\N
87563	GENERIC_DAY	0	0	2010-03-16	1214	\N	86459	\N
87564	GENERIC_DAY	0	1	2010-02-16	1234	\N	86459	\N
87565	GENERIC_DAY	0	1	2010-02-22	1234	\N	86459	\N
87566	GENERIC_DAY	0	0	2010-03-01	1234	\N	86459	\N
87567	GENERIC_DAY	0	1	2010-02-16	1236	\N	86459	\N
87568	GENERIC_DAY	0	0	2010-03-05	1228	\N	86459	\N
87569	GENERIC_DAY	0	0	2010-02-15	1239	\N	86459	\N
87570	GENERIC_DAY	0	0	2010-03-03	1222	\N	86459	\N
87571	GENERIC_DAY	0	0	2010-03-21	1220	\N	86459	\N
87572	GENERIC_DAY	0	0	2010-03-14	1220	\N	86459	\N
87573	GENERIC_DAY	0	0	2010-02-28	1222	\N	86459	\N
87574	GENERIC_DAY	0	0	2010-03-18	1214	\N	86459	\N
87575	GENERIC_DAY	0	8	2010-03-10	1236	\N	86459	\N
87576	GENERIC_DAY	0	8	2010-03-03	1236	\N	86459	\N
87577	GENERIC_DAY	0	0	2010-03-17	1239	\N	86459	\N
87578	GENERIC_DAY	0	0	2010-03-14	1232	\N	86459	\N
87579	GENERIC_DAY	0	0	2010-03-31	1232	\N	86459	\N
87580	GENERIC_DAY	0	1	2010-02-15	1217	\N	86459	\N
87581	GENERIC_DAY	0	0	2010-03-01	1230	\N	86459	\N
87582	GENERIC_DAY	0	0	2010-03-30	1230	\N	86459	\N
87583	GENERIC_DAY	0	0	2010-03-24	1224	\N	86459	\N
87584	GENERIC_DAY	0	0	2010-03-04	1230	\N	86459	\N
87585	GENERIC_DAY	0	0	2010-03-25	1232	\N	86459	\N
87586	GENERIC_DAY	0	1	2010-02-12	1230	\N	86459	\N
87587	GENERIC_DAY	0	0	2010-03-02	1239	\N	86459	\N
87588	GENERIC_DAY	0	0	2010-02-13	1226	\N	86459	\N
87589	GENERIC_DAY	0	8	2010-03-16	1236	\N	86459	\N
87590	GENERIC_DAY	0	0	2010-02-12	1224	\N	86459	\N
87591	GENERIC_DAY	0	0	2010-03-29	1214	\N	86459	\N
87592	GENERIC_DAY	0	0	2010-03-01	1217	\N	86459	\N
87593	GENERIC_DAY	0	0	2010-03-01	1224	\N	86459	\N
87594	GENERIC_DAY	0	0	2010-03-20	1230	\N	86459	\N
87595	GENERIC_DAY	0	0	2010-03-06	1232	\N	86459	\N
87596	GENERIC_DAY	0	0	2010-03-05	1232	\N	86459	\N
87597	GENERIC_DAY	0	0	2010-02-13	1214	\N	86459	\N
87598	GENERIC_DAY	0	8	2010-03-18	1236	\N	86459	\N
87599	GENERIC_DAY	0	0	2010-03-14	1217	\N	86459	\N
87600	GENERIC_DAY	0	1	2010-02-19	1236	\N	86459	\N
87601	GENERIC_DAY	0	0	2010-03-18	1226	\N	86459	\N
87602	GENERIC_DAY	0	1	2010-02-22	1222	\N	86459	\N
87603	GENERIC_DAY	0	0	2010-03-20	1224	\N	86459	\N
87604	GENERIC_DAY	0	0	2010-03-02	1217	\N	86459	\N
87605	GENERIC_DAY	0	0	2010-03-31	1239	\N	86459	\N
87606	GENERIC_DAY	0	0	2010-02-21	1217	\N	86459	\N
87607	GENERIC_DAY	0	0	2010-03-09	1217	\N	86459	\N
87608	GENERIC_DAY	0	0	2010-03-29	1228	\N	86459	\N
87609	GENERIC_DAY	0	0	2010-03-29	1239	\N	86459	\N
87610	GENERIC_DAY	0	0	2010-02-14	1239	\N	86459	\N
87611	GENERIC_DAY	0	0	2010-03-01	1220	\N	86459	\N
87612	GENERIC_DAY	0	1	2010-02-19	1232	\N	86459	\N
87613	GENERIC_DAY	0	0	2010-03-23	1222	\N	86459	\N
87614	GENERIC_DAY	0	0	2010-03-17	1234	\N	86459	\N
87615	GENERIC_DAY	0	0	2010-02-14	1236	\N	86459	\N
87616	GENERIC_DAY	0	0	2010-02-23	1230	\N	86459	\N
87617	GENERIC_DAY	0	0	2010-03-01	1222	\N	86459	\N
87618	GENERIC_DAY	0	0	2010-03-26	1232	\N	86459	\N
87619	GENERIC_DAY	0	0	2010-02-18	1239	\N	86459	\N
87620	GENERIC_DAY	0	8	2010-03-09	1236	\N	86459	\N
87621	GENERIC_DAY	0	1	2010-02-12	1222	\N	86459	\N
87622	GENERIC_DAY	0	0	2010-02-17	1222	\N	86459	\N
87623	GENERIC_DAY	0	0	2010-03-16	1232	\N	86459	\N
87624	GENERIC_DAY	0	0	2010-02-22	1228	\N	86459	\N
87625	GENERIC_DAY	0	0	2010-02-21	1224	\N	86459	\N
87626	GENERIC_DAY	0	0	2010-02-17	1234	\N	86459	\N
87627	GENERIC_DAY	0	0	2010-02-14	1226	\N	86459	\N
87628	GENERIC_DAY	0	0	2010-03-05	1239	\N	86459	\N
87629	GENERIC_DAY	0	0	2010-03-04	1217	\N	86459	\N
87630	GENERIC_DAY	0	0	2010-03-29	1224	\N	86459	\N
87631	GENERIC_DAY	0	0	2010-03-23	1220	\N	86459	\N
87632	GENERIC_DAY	0	0	2010-03-21	1226	\N	86459	\N
87633	GENERIC_DAY	0	2	2010-02-22	1232	\N	86459	\N
87634	GENERIC_DAY	0	1	2010-02-12	1228	\N	86459	\N
87635	GENERIC_DAY	0	0	2010-03-05	1217	\N	86459	\N
87636	GENERIC_DAY	0	0	2010-02-14	1232	\N	86459	\N
87637	GENERIC_DAY	0	0	2010-03-13	1222	\N	86459	\N
87638	GENERIC_DAY	0	0	2010-03-14	1234	\N	86459	\N
87639	GENERIC_DAY	0	1	2010-02-15	1222	\N	86459	\N
87640	GENERIC_DAY	0	0	2010-02-14	1228	\N	86459	\N
87641	GENERIC_DAY	0	0	2010-02-23	1220	\N	86459	\N
87642	GENERIC_DAY	0	0	2010-03-04	1222	\N	86459	\N
87643	GENERIC_DAY	0	0	2010-03-31	1214	\N	86459	\N
87644	GENERIC_DAY	0	0	2010-02-25	1228	\N	86459	\N
87645	GENERIC_DAY	0	0	2010-03-27	1217	\N	86459	\N
87646	GENERIC_DAY	0	0	2010-03-08	1214	\N	86459	\N
87647	GENERIC_DAY	0	0	2010-02-17	1217	\N	86459	\N
87648	GENERIC_DAY	0	0	2010-03-27	1222	\N	86459	\N
87649	GENERIC_DAY	0	0	2010-03-27	1214	\N	86459	\N
87650	GENERIC_DAY	0	0	2010-03-26	1239	\N	86459	\N
87651	GENERIC_DAY	0	1	2010-02-15	1234	\N	86459	\N
87652	GENERIC_DAY	0	0	2010-03-05	1220	\N	86459	\N
87653	GENERIC_DAY	0	1	2010-02-19	1226	\N	86459	\N
87654	GENERIC_DAY	0	0	2010-03-14	1236	\N	86459	\N
87655	GENERIC_DAY	0	0	2010-03-03	1226	\N	86459	\N
87656	GENERIC_DAY	0	0	2010-02-28	1239	\N	86459	\N
87657	GENERIC_DAY	0	0	2010-02-27	1228	\N	86459	\N
87658	GENERIC_DAY	0	0	2010-03-09	1232	\N	86459	\N
87659	GENERIC_DAY	0	0	2010-03-12	1226	\N	86459	\N
87660	GENERIC_DAY	0	0	2010-03-26	1230	\N	86459	\N
87661	GENERIC_DAY	0	0	2010-02-20	1222	\N	86459	\N
87662	GENERIC_DAY	0	0	2010-03-10	1214	\N	86459	\N
87663	GENERIC_DAY	0	0	2010-03-02	1214	\N	86459	\N
87664	GENERIC_DAY	0	0	2010-02-27	1217	\N	86459	\N
87665	GENERIC_DAY	0	0	2010-02-17	1220	\N	86459	\N
87666	GENERIC_DAY	0	0	2010-03-26	1220	\N	86459	\N
87667	GENERIC_DAY	0	0	2010-03-07	1234	\N	86459	\N
87668	GENERIC_DAY	0	0	2010-03-20	1232	\N	86459	\N
87669	GENERIC_DAY	0	0	2010-03-24	1217	\N	86459	\N
87670	GENERIC_DAY	0	0	2010-03-27	1220	\N	86459	\N
87671	GENERIC_DAY	0	0	2010-02-19	1239	\N	86459	\N
87672	GENERIC_DAY	0	0	2010-03-09	1230	\N	86459	\N
87673	GENERIC_DAY	0	0	2010-03-30	1217	\N	86459	\N
87674	GENERIC_DAY	0	0	2010-03-31	1226	\N	86459	\N
87675	GENERIC_DAY	0	0	2010-03-24	1226	\N	86459	\N
87676	GENERIC_DAY	0	0	2010-02-24	1226	\N	86459	\N
87677	GENERIC_DAY	0	0	2010-03-30	1224	\N	86459	\N
87678	GENERIC_DAY	0	0	2010-02-24	1234	\N	86459	\N
87679	GENERIC_DAY	0	0	2010-03-10	1234	\N	86459	\N
87680	GENERIC_DAY	0	0	2010-03-12	1239	\N	86459	\N
87681	GENERIC_DAY	0	0	2010-02-21	1234	\N	86459	\N
75791	GENERIC_DAY	1	2	2010-01-19	1228	\N	60757	\N
75792	GENERIC_DAY	1	2	2010-01-19	1217	\N	60757	\N
75793	GENERIC_DAY	1	2	2010-01-19	1230	\N	60757	\N
75794	GENERIC_DAY	1	2	2010-01-19	1220	\N	60757	\N
75795	GENERIC_DAY	1	2	2009-12-22	1230	\N	60795	\N
75796	GENERIC_DAY	1	2	2009-12-25	1220	\N	60795	\N
75797	GENERIC_DAY	1	2	2009-12-23	1228	\N	60795	\N
75798	GENERIC_DAY	1	2	2009-12-24	1228	\N	60795	\N
75799	GENERIC_DAY	1	2	2009-12-24	1220	\N	60795	\N
75800	GENERIC_DAY	1	2	2009-12-24	1230	\N	60795	\N
75801	GENERIC_DAY	1	2	2009-12-23	1217	\N	60795	\N
75802	GENERIC_DAY	1	2	2009-12-25	1230	\N	60795	\N
75803	GENERIC_DAY	1	2	2009-12-22	1217	\N	60795	\N
75804	GENERIC_DAY	1	2	2009-12-23	1220	\N	60795	\N
75805	GENERIC_DAY	1	2	2009-12-24	1217	\N	60795	\N
75806	GENERIC_DAY	1	2	2009-12-25	1217	\N	60795	\N
75807	GENERIC_DAY	1	2	2009-12-22	1228	\N	60795	\N
75808	GENERIC_DAY	1	2	2009-12-22	1220	\N	60795	\N
75809	GENERIC_DAY	1	2	2009-12-23	1230	\N	60795	\N
75810	GENERIC_DAY	1	2	2009-12-25	1228	\N	60795	\N
75811	GENERIC_DAY	1	2	2010-01-14	1220	\N	60706	\N
75812	GENERIC_DAY	1	2	2010-01-12	1228	\N	60706	\N
75813	GENERIC_DAY	1	2	2010-01-13	1220	\N	60706	\N
75814	GENERIC_DAY	1	2	2010-01-14	1228	\N	60706	\N
75815	GENERIC_DAY	1	2	2010-01-15	1228	\N	60706	\N
75816	GENERIC_DAY	1	2	2010-01-12	1220	\N	60706	\N
75817	GENERIC_DAY	1	2	2010-01-14	1217	\N	60706	\N
75818	GENERIC_DAY	1	2	2010-01-12	1230	\N	60706	\N
75819	GENERIC_DAY	1	2	2010-01-13	1230	\N	60706	\N
75820	GENERIC_DAY	1	2	2010-01-14	1230	\N	60706	\N
75821	GENERIC_DAY	1	2	2010-01-12	1217	\N	60706	\N
75822	GENERIC_DAY	1	2	2010-01-13	1228	\N	60706	\N
75823	GENERIC_DAY	1	2	2010-01-13	1217	\N	60706	\N
75824	GENERIC_DAY	1	2	2010-01-15	1230	\N	60706	\N
75825	GENERIC_DAY	1	2	2010-01-15	1220	\N	60706	\N
75826	GENERIC_DAY	1	2	2010-01-15	1217	\N	60706	\N
87682	GENERIC_DAY	0	8	2010-03-24	1236	\N	86459	\N
87683	GENERIC_DAY	0	0	2010-03-12	1224	\N	86459	\N
87684	GENERIC_DAY	0	0	2010-02-13	1228	\N	86459	\N
87685	GENERIC_DAY	0	0	2010-03-09	1224	\N	86459	\N
87686	GENERIC_DAY	0	0	2010-02-20	1234	\N	86459	\N
87687	GENERIC_DAY	0	0	2010-03-12	1234	\N	86459	\N
87688	GENERIC_DAY	0	0	2010-03-23	1217	\N	86459	\N
87689	GENERIC_DAY	0	0	2010-03-08	1232	\N	86459	\N
87690	GENERIC_DAY	0	0	2010-03-19	1232	\N	86459	\N
87691	GENERIC_DAY	0	0	2010-03-26	1214	\N	86459	\N
87692	GENERIC_DAY	0	0	2010-02-14	1222	\N	86459	\N
87693	GENERIC_DAY	0	0	2010-03-14	1226	\N	86459	\N
87694	GENERIC_DAY	0	8	2010-03-05	1236	\N	86459	\N
87695	GENERIC_DAY	0	0	2010-03-04	1234	\N	86459	\N
87696	GENERIC_DAY	0	0	2010-03-10	1230	\N	86459	\N
87697	GENERIC_DAY	0	8	2010-02-26	1236	\N	86459	\N
87698	GENERIC_DAY	0	0	2010-03-30	1222	\N	86459	\N
87699	GENERIC_DAY	0	0	2010-03-26	1234	\N	86459	\N
87700	GENERIC_DAY	0	0	2010-02-18	1220	\N	86459	\N
87701	GENERIC_DAY	0	0	2010-03-08	1222	\N	86459	\N
87702	GENERIC_DAY	0	0	2010-03-24	1222	\N	86459	\N
87703	GENERIC_DAY	0	0	2010-03-04	1214	\N	86459	\N
87704	GENERIC_DAY	0	0	2010-03-22	1222	\N	86459	\N
87705	GENERIC_DAY	0	0	2010-02-13	1234	\N	86459	\N
87706	GENERIC_DAY	0	1	2010-02-16	1228	\N	86459	\N
87707	GENERIC_DAY	0	0	2010-02-15	1224	\N	86459	\N
87708	GENERIC_DAY	0	1	2010-02-12	1234	\N	86459	\N
87709	GENERIC_DAY	0	0	2010-02-12	1226	\N	86459	\N
87710	GENERIC_DAY	0	0	2010-03-24	1239	\N	86459	\N
87711	GENERIC_DAY	0	0	2010-03-08	1217	\N	86459	\N
87712	GENERIC_DAY	0	0	2010-03-31	1217	\N	86459	\N
87713	GENERIC_DAY	0	0	2010-02-19	1214	\N	86459	\N
87714	GENERIC_DAY	0	5	2010-02-23	1236	\N	86459	\N
87715	GENERIC_DAY	0	0	2010-02-21	1228	\N	86459	\N
87716	GENERIC_DAY	0	2	2010-02-16	1232	\N	86459	\N
87717	GENERIC_DAY	0	0	2010-03-03	1228	\N	86459	\N
87718	GENERIC_DAY	0	0	2010-02-24	1222	\N	86459	\N
87719	GENERIC_DAY	0	0	2010-03-06	1226	\N	86459	\N
87720	GENERIC_DAY	0	0	2010-02-23	1222	\N	86459	\N
87721	GENERIC_DAY	0	0	2010-02-25	1230	\N	86459	\N
87722	GENERIC_DAY	0	0	2010-03-19	1239	\N	86459	\N
87723	GENERIC_DAY	0	0	2010-03-15	1230	\N	86459	\N
87724	GENERIC_DAY	0	0	2010-03-05	1214	\N	86459	\N
87725	GENERIC_DAY	0	8	2010-03-02	1236	\N	86459	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
18710563	13	56298	56299	0
18710580	13	56298	56299	0
18874391	4	56324	56349	0
1277962	2	3850	3839	0
1277963	2	3845	3849	0
1277964	2	3838	3841	0
1277965	2	3841	3845	0
18874374	4	56324	56349	0
18710575	13	56266	56298	0
18874383	4	56324	56349	0
18710559	13	56266	56298	0
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
18874390	4	56330	57491	0
18874396	4	56330	57474	0
1278033	2	3868	3869	0
1278034	2	3868	3869	0
1277996	2	3842	3843	0
1277997	2	3841	3842	0
1277998	2	3850	3839	0
1277999	2	3845	3849	0
1278000	2	3838	3841	0
1278001	2	3844	3846	0
1278002	2	3841	3845	0
1278003	2	3839	3840	0
18743296	12	56275	56267	0
18710577	13	56275	56267	0
18710536	16	56257	56258	0
18710537	16	56258	56259	0
18710538	16	56259	56260	0
18710579	13	56260	56285	0
18710539	13	56260	56285	0
18710562	13	56260	56285	0
18874399	11	56306	56274	0
18907535	4	56263	56264	0
18907536	4	56281	56282	0
18710576	13	56266	56267	0
18710573	13	56267	56272	0
18907214	3	56302	56301	0
18907523	4	56302	56301	0
18907245	4	56302	56301	0
18908004	4	56302	56301	0
18907524	4	56292	56302	0
18908005	4	56292	56302	0
18907215	3	56292	56302	0
18907246	4	56292	56302	0
18907222	3	56293	56262	0
18908012	4	56293	56262	0
18907531	4	56293	56262	0
18907253	4	56293	56262	0
18907241	4	56294	56286	0
18907998	4	56294	56286	0
18907210	3	56294	56286	0
18907519	4	56294	56286	0
18907532	4	56262	56294	0
18907223	3	56262	56294	0
18908013	4	56262	56294	0
18907254	4	56262	56294	0
18907533	4	56295	56296	0
18907224	3	56295	56296	0
18908014	4	56295	56296	0
18874388	4	56330	57474	0
18874398	4	56330	57491	0
18874395	4	57474	57473	0
18874387	4	57474	57473	0
18874375	4	56321	56322	0
18874384	4	56321	56322	0
18874392	4	56321	56322	0
18874385	4	56322	56323	0
18874393	4	56322	56323	0
27656318	1	56338	56339	0
27656321	1	56350	56351	0
27656322	1	56351	56352	0
27656323	1	56352	56353	0
27656324	1	56353	56354	0
27656326	1	56333	56334	0
27656328	1	56334	56335	0
27656329	1	56335	56336	0
27656327	1	56331	56333	0
27656330	1	56330	56331	0
18874376	4	56322	56323	0
18874386	4	56323	56324	0
27656331	1	57476	57477	0
18874394	4	56323	56324	0
27656325	1	56354	56356	0
18874377	4	56323	56324	0
27656333	1	56356	56357	0
18874389	4	57491	57490	0
27656334	1	56357	57469	0
18874397	4	57491	57490	0
27656335	1	57469	57470	0
27656332	1	57471	57476	0
27656336	1	57470	57471	0
27656337	1	57483	57484	0
27656339	1	57484	57485	0
27656340	1	57485	57486	0
27656341	1	57486	57487	0
27656342	1	57487	57488	0
27656343	1	57488	57489	0
27656338	1	57481	57483	0
27656320	1	57479	57481	0
27656316	1	56343	56345	0
18710558	13	56266	56316	0
18710574	13	56266	56316	0
18710560	13	56266	56267	0
18907641	4	56302	56301	0
18907554	4	56302	56301	0
18907827	4	56302	56301	0
18907591	4	56302	56301	0
18907592	4	56292	56302	0
18907555	4	56292	56302	0
18907642	4	56292	56302	0
18907828	4	56292	56302	0
18907599	4	56293	56262	0
18907562	4	56293	56262	0
18907835	4	56293	56262	0
18907649	4	56293	56262	0
18907821	4	56294	56286	0
18907586	4	56294	56286	0
18907550	4	56294	56286	0
18907636	4	56294	56286	0
18907600	4	56262	56294	0
18907650	4	56262	56294	0
18907563	4	56262	56294	0
18907836	4	56262	56294	0
18907564	4	56295	56296	0
18907651	4	56295	56296	0
18907837	4	56295	56296	0
18907601	4	56295	56296	0
18907255	4	56295	56296	0
18907583	4	56277	56271	0
18907547	4	56277	56271	0
18907995	4	56277	56271	0
18907207	3	56277	56271	0
18907633	4	56277	56271	0
18907516	4	56277	56271	0
18907238	4	56277	56271	0
18907818	4	56277	56271	0
18907819	4	56282	56277	0
18907584	4	56282	56277	0
18907996	4	56282	56277	0
18907208	3	56282	56277	0
18907239	4	56282	56277	0
18907548	4	56282	56277	0
18907517	4	56282	56277	0
18907634	4	56282	56277	0
18710570	13	56269	56306	0
18710571	13	56283	56269	0
18907590	4	56274	56270	0
18907826	4	56274	56270	0
18907640	4	56274	56270	0
18908003	4	56274	56270	0
18907838	4	56271	56263	0
18907652	4	56271	56263	0
18907565	4	56271	56263	0
18907602	4	56271	56263	0
18907534	4	56271	56263	0
18908015	4	56271	56263	0
18907256	4	56271	56263	0
18907225	3	56271	56263	0
18710572	13	56272	56283	0
18907820	4	56286	56287	0
18907549	4	56286	56287	0
18907240	4	56286	56287	0
18907209	3	56286	56287	0
18907518	4	56286	56287	0
18907585	4	56286	56287	0
18907635	4	56286	56287	0
18907997	4	56286	56287	0
18907520	4	56287	56288	0
18907551	4	56287	56288	0
18907587	4	56287	56288	0
18907999	4	56287	56288	0
18907211	3	56287	56288	0
18907822	4	56287	56288	0
18907637	4	56287	56288	0
18907242	4	56287	56288	0
18907521	4	56288	56289	0
18907552	4	56288	56289	0
18907638	4	56288	56289	0
18907212	3	56288	56289	0
18907823	4	56288	56289	0
18907243	4	56288	56289	0
18907588	4	56288	56289	0
18908000	4	56288	56289	0
18907522	4	56289	56290	0
18907824	4	56289	56290	0
18907553	4	56289	56290	0
18907244	4	56289	56290	0
18907589	4	56289	56290	0
18907639	4	56289	56290	0
18908001	4	56289	56290	0
18907213	3	56289	56290	0
18907825	4	56309	56279	0
27656344	1	56345	56346	0
27656345	1	56346	56347	0
27656317	1	56341	56343	0
27656319	1	56339	56341	0
27656346	2	56343	56345	0
27656347	2	56341	56343	0
27656348	2	56338	56339	0
27656349	2	56339	56341	0
27656350	2	57479	57481	0
27656351	2	56350	56351	0
27656352	2	56351	56352	0
27656353	2	56352	56353	0
27656354	2	56353	56354	0
27656355	2	56354	56356	0
27656356	2	56333	56334	0
27656357	2	56331	56333	0
27656358	2	56334	56335	0
27656359	2	56335	56336	0
27656360	2	56330	56331	0
27656361	2	57476	57477	0
27656362	2	57471	57476	0
27656363	2	56356	56357	0
27656364	2	56357	57469	0
27656365	2	57469	57470	0
27656366	2	57470	57471	0
27656367	2	57483	57484	0
27656368	2	57481	57483	0
27656369	2	57484	57485	0
27656370	2	57485	57486	0
27656371	2	57486	57487	0
27656372	2	57487	57488	0
27656373	2	57488	57489	0
27656374	2	56345	56346	0
27656375	2	56346	56347	0
18908002	4	56309	56279	0
18907829	4	56308	56311	0
18907643	4	56308	56311	0
18907525	4	56308	56311	0
18907216	3	56308	56311	0
18907556	4	56308	56311	0
18907593	4	56308	56311	0
18908006	4	56308	56311	0
18907247	4	56308	56311	0
18907557	4	56310	56309	0
18907526	4	56310	56309	0
18907594	4	56310	56309	0
18907644	4	56310	56309	0
18908007	4	56310	56309	0
18907248	4	56310	56309	0
18907830	4	56310	56309	0
18907217	3	56310	56309	0
18907831	4	56312	56310	0
18908008	4	56312	56310	0
18907527	4	56312	56310	0
18907558	4	56312	56310	0
18907595	4	56312	56310	0
18907249	4	56312	56310	0
18907218	3	56312	56310	0
18907645	4	56312	56310	0
18907559	4	56311	56313	0
18907646	4	56311	56313	0
18907219	3	56311	56313	0
18907528	4	56311	56313	0
18908009	4	56311	56313	0
18907250	4	56311	56313	0
18907596	4	56311	56313	0
18907832	4	56311	56313	0
18907529	4	56314	56312	0
18907647	4	56314	56312	0
18907833	4	56314	56312	0
18907220	3	56314	56312	0
18907251	4	56314	56312	0
18907597	4	56314	56312	0
18908010	4	56314	56312	0
18907560	4	56314	56312	0
18907598	4	56313	56314	0
18907252	4	56313	56314	0
18907834	4	56313	56314	0
18907648	4	56313	56314	0
18907561	4	56313	56314	0
18907530	4	56313	56314	0
18907221	3	56313	56314	0
18908011	4	56313	56314	0
18710578	13	56316	56315	0
18710561	13	56316	56315	0
18907653	4	56263	56264	0
18907566	4	56263	56264	0
18907257	4	56263	56264	0
18908016	4	56263	56264	0
18907603	4	56263	56264	0
18907839	4	56263	56264	0
18907226	3	56263	56264	0
18907654	4	56281	56282	0
18907258	4	56281	56282	0
18907604	4	56281	56282	0
18908017	4	56281	56282	0
18907567	4	56281	56282	0
18907840	4	56281	56282	0
18907227	3	56281	56282	0
27656205	3	57493	85345	0
27656207	3	56326	56327	0
27656206	3	56324	56326	0
27656208	3	56327	56328	0
27656209	3	57494	85345	0
27656384	4	86383	86384	0
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
5672	3698	100.00
5673	3698	4000.00
7509	6301	100.00
7510	6302	100.00
79996	6302	100.00
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
11040	7080	100.00
11041	7118	100.00
11042	7119	100.00
11043	7120	100.00
11044	7121	100.00
11045	7122	100.00
85702	85768	100.00
85703	85769	100.00
85704	85770	100.00
85705	85771	100.00
85706	85772	100.00
85707	85773	100.00
85710	85774	100.00
86285	86215	100.00
11047	7123	100.00
11048	7124	100.00
86097	85842	100.00
86098	85843	100.00
86099	85844	100.00
86100	85845	100.00
86103	85847	100.00
86104	85848	100.00
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
57403	57256	100.00
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
86459
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
887
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id) FROM stdin;
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line) FROM stdin;
3622	3	proxecto-00003-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	30	1.00	f	3646
3623	3	proxecto-00003-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3647
3624	3	proxecto-00003-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	3648
3625	3	proxecto-00003-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	50	1.00	f	3649
85625	3	proxecto-00009-00048-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85753
85626	3	proxecto-00009-00049-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	85755
2139	3	proxecto-00001-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	1870
2140	3	proxecto-00001-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	1871
2141	3	proxecto-00001-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	1872
2142	3	proxecto-00001-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	1874
2143	3	proxecto-00001-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	7	1.00	f	1875
2144	3	proxecto-00001-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	14	1.00	f	1877
6907	25	proxecto-00006-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	6816
6908	25	proxecto-00006-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	6817
86046	5	proxecto-00013-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	86215
86047	5	proxecto-00013-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	86216
86048	5	proxecto-00013-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	86217
6909	25	proxecto-00006-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	6819
6910	25	proxecto-00006-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	6820
6911	25	proxecto-00006-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	6821
6912	25	proxecto-00006-00034-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6822
3626	3	proxecto-00003-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3650
3627	3	proxecto-00003-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	3651
3628	3	proxecto-00003-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	3652
3629	3	proxecto-00003-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	3653
3630	3	proxecto-00003-00009-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3654
3631	3	proxecto-00003-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	3655
3632	3	proxecto-00003-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	3656
3633	3	proxecto-00003-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	54	1.00	f	3657
6913	25	proxecto-00006-00035-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	6823
6914	25	proxecto-00006-00036-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	6824
6915	25	proxecto-00006-00037-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	6826
6916	25	proxecto-00006-00038-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	6827
6917	25	proxecto-00006-00039-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6828
6918	25	proxecto-00006-00040-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	6829
6919	25	proxecto-00006-00041-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	6830
6947	24	proxecto-00006-00047-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	7073
6948	24	proxecto-00006-00048-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	96	1.00	f	7074
6949	24	proxecto-00006-00049-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	7076
6950	24	proxecto-00006-00050-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	7077
3634	3	proxecto-00003-00013-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	103	1.00	f	3658
3635	3	proxecto-00003-00014-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	21	1.00	f	3659
3737	3	proxecto-00003-00015-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	3660
3738	3	proxecto-00003-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	12	1.00	f	3661
3739	3	proxecto-00003-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	3662
3740	3	proxecto-00003-00018-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	3663
3741	3	proxecto-00003-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	26	1.00	f	3664
3742	3	proxecto-00003-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	34	1.00	f	3665
3743	3	proxecto-00003-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	43	1.00	f	3666
3744	3	proxecto-00003-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	65	1.00	f	3667
3745	3	proxecto-00003-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	70	1.00	f	3668
3746	3	proxecto-00003-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	50	1.00	f	3669
3747	3	proxecto-00003-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	70	1.00	f	3670
3748	3	proxecto-00003-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	80	1.00	f	3671
3749	3	proxecto-00003-00027-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	3672
3750	3	proxecto-00003-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	42	1.00	f	3673
3751	3	proxecto-00003-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	300	1.00	f	3674
4866	3	proxecto-00005-00001-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	0.50	f	4713
4865	3	proxecto-00005-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	0.50	f	4713
4867	3	proxecto-00005-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\007MACHINE	100	1.00	f	4714
4869	3	proxecto-00005-00003-00002	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\007MACHINE	100	0.50	f	4715
4868	3	proxecto-00005-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	0.50	f	4715
6583	30	proxecto-00006-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	6301
85604	3	proxecto-00009-00027-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85524
6584	30	proxecto-00006-00004-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	6302
85605	3	proxecto-00009-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	85525
3761	5	proxecto-00004-00001-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	3698
3762	5	proxecto-00004-00002-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	200	1.00	f	3699
3763	5	proxecto-00004-00003-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	100	1.00	f	3700
85612	3	proxecto-00009-00035-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	85536
85613	3	proxecto-00009-00036-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85537
85614	3	proxecto-00009-00037-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85538
6588	30	proxecto-00006-00008-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	6307
6598	29	proxecto-00006-00010-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	6320
6599	29	proxecto-00006-00011-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6322
6600	29	proxecto-00006-00012-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	6323
6613	28	proxecto-00006-00014-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	6340
6614	28	proxecto-00006-00015-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	6341
85615	3	proxecto-00009-00038-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	85540
85616	3	proxecto-00009-00039-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85541
85617	3	proxecto-00009-00040-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85542
6615	28	proxecto-00006-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	6342
6616	28	proxecto-00006-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	6343
6623	27	proxecto-00006-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	6354
6624	27	proxecto-00006-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6355
6634	26	proxecto-00006-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6675
6635	26	proxecto-00006-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6677
6636	26	proxecto-00006-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	6678
6585	30	proxecto-00006-00005-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	6303
6586	30	proxecto-00006-00006-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	6304
6587	30	proxecto-00006-00007-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	6306
7188	23	proxecto-00006-00059-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7119
7189	23	proxecto-00006-00060-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7120
7190	23	proxecto-00006-00061-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7121
7191	23	proxecto-00006-00062-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7122
7192	23	proxecto-00006-00063-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	7123
7193	23	proxecto-00006-00064-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	7124
6951	24	proxecto-00006-00051-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	7079
6953	24	proxecto-00006-00053-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	7082
7185	23	proxecto-00006-00056-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	7116
7186	23	proxecto-00006-00057-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7117
6955	24	proxecto-00006-00046-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7084
57060	3	proxecto-00008-00018-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	57195
57061	3	proxecto-00008-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	57196
85618	3	proxecto-00009-00041-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85543
6952	24	proxecto-00006-00052-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7080
7187	23	proxecto-00006-00058-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	7118
85619	3	proxecto-00009-00042-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85544
85620	3	proxecto-00009-00043-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85545
85621	3	proxecto-00009-00044-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	85749
85622	3	proxecto-00009-00045-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	85750
85623	3	proxecto-00009-00046-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85751
85624	3	proxecto-00009-00047-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85752
85637	3	proxecto-00009-00060-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85770
85638	3	proxecto-00009-00061-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85771
85639	3	proxecto-00009-00062-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85772
57062	3	proxecto-00008-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	57197
57063	3	proxecto-00008-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57198
57064	3	proxecto-00008-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57200
57267	3	proxecto-00008-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	57201
57268	3	proxecto-00008-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	57202
57269	3	proxecto-00008-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57204
57270	3	proxecto-00008-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	57205
57271	3	proxecto-00008-00027-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57207
57272	3	proxecto-00008-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	57208
57273	3	proxecto-00008-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	57209
57274	3	proxecto-00008-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	57210
57275	3	proxecto-00008-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57212
57276	3	proxecto-00008-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57213
57277	3	proxecto-00008-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57215
57278	3	proxecto-00008-00034-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57217
57279	3	proxecto-00008-00035-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	57219
57280	3	proxecto-00008-00036-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57220
57281	3	proxecto-00008-00037-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57221
57282	3	proxecto-00008-00038-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	57223
57283	3	proxecto-00008-00039-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	57224
57284	3	proxecto-00008-00040-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57225
57285	3	proxecto-00008-00041-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57226
57286	3	proxecto-00008-00042-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	57227
57287	3	proxecto-00008-00043-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57228
57288	3	proxecto-00008-00044-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	57230
57289	3	proxecto-00008-00045-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	57231
57290	3	proxecto-00008-00046-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57232
57291	3	proxecto-00008-00047-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57233
57292	3	proxecto-00008-00048-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57234
57293	3	proxecto-00008-00049-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	57236
57294	3	proxecto-00008-00050-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	96	1.00	f	57237
57295	3	proxecto-00008-00051-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57239
57296	3	proxecto-00008-00052-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57240
57297	3	proxecto-00008-00053-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	57242
57298	3	proxecto-00008-00054-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	57244
57299	3	proxecto-00008-00055-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	57246
57300	3	proxecto-00008-00056-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57247
57301	3	proxecto-00008-00057-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57248
57302	3	proxecto-00008-00058-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57249
57303	3	proxecto-00008-00059-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57250
57304	3	proxecto-00008-00060-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57251
57305	3	proxecto-00008-00061-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57252
57306	3	proxecto-00008-00062-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57253
57307	3	proxecto-00008-00063-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	57254
57308	3	proxecto-00008-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	57255
57309	3	proxecto-00008-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	57256
86004	3	proxecto-00010-00028-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	86158
86005	3	proxecto-00010-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	86159
86006	3	proxecto-00010-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	86160
86007	3	proxecto-00010-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86162
86008	3	proxecto-00010-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86163
86009	3	proxecto-00010-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86165
86010	3	proxecto-00010-00034-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86167
86011	3	proxecto-00010-00035-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	86169
86012	3	proxecto-00010-00036-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86170
86013	3	proxecto-00010-00037-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86171
86014	3	proxecto-00010-00038-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	86173
86015	3	proxecto-00010-00039-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	86174
86016	3	proxecto-00010-00040-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86175
86017	3	proxecto-00010-00041-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86176
86018	3	proxecto-00010-00042-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	86177
86019	3	proxecto-00010-00043-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86178
86020	3	proxecto-00010-00044-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	15	1.00	f	86180
86021	3	proxecto-00010-00045-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	48	1.00	f	86181
86040	3	proxecto-00010-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	86205
86041	3	proxecto-00010-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	86206
85994	3	proxecto-00010-00018-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	85842
85995	3	proxecto-00010-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85843
85996	3	proxecto-00010-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85844
85997	3	proxecto-00010-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85845
85998	3	proxecto-00010-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85847
85999	3	proxecto-00010-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	85848
86000	3	proxecto-00010-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	85849
86001	3	proxecto-00010-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86154
86002	3	proxecto-00010-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	86155
86003	3	proxecto-00010-00027-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86157
85595	3	proxecto-00009-00018-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	85512
85596	3	proxecto-00009-00019-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85513
85597	3	proxecto-00009-00020-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85514
85598	3	proxecto-00009-00021-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85515
85599	3	proxecto-00009-00022-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85517
85600	3	proxecto-00009-00023-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	56	1.00	f	85518
85601	3	proxecto-00009-00024-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	85519
85602	3	proxecto-00009-00025-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85521
85603	3	proxecto-00009-00026-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	8	1.00	f	85522
85606	3	proxecto-00009-00029-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	28	1.00	f	85526
85607	3	proxecto-00009-00030-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	120	1.00	f	85527
85608	3	proxecto-00009-00031-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85529
85609	3	proxecto-00009-00032-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85530
85610	3	proxecto-00009-00033-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85532
85611	3	proxecto-00009-00034-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85534
85627	3	proxecto-00009-00050-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	96	1.00	f	85756
85628	3	proxecto-00009-00051-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85758
85629	3	proxecto-00009-00052-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85759
85630	3	proxecto-00009-00053-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	85761
85631	3	proxecto-00009-00054-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	85763
85632	3	proxecto-00009-00055-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	85765
85633	3	proxecto-00009-00056-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85766
85634	3	proxecto-00009-00057-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85767
85635	3	proxecto-00009-00058-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85768
85636	3	proxecto-00009-00059-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85769
85640	3	proxecto-00009-00063-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	85773
85641	3	proxecto-00009-00016-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	85774
85642	3	proxecto-00009-00017-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	256	1.00	f	85775
86022	3	proxecto-00010-00046-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86182
86023	3	proxecto-00010-00047-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86183
86024	3	proxecto-00010-00048-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86184
86025	3	proxecto-00010-00049-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	64	1.00	f	86186
86026	3	proxecto-00010-00050-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	96	1.00	f	86187
86027	3	proxecto-00010-00051-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86189
86028	3	proxecto-00010-00052-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86190
86029	3	proxecto-00010-00053-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	40	1.00	f	86192
86030	3	proxecto-00010-00054-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	32	1.00	f	86194
86031	3	proxecto-00010-00055-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	16	1.00	f	86196
86032	3	proxecto-00010-00056-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86197
86033	3	proxecto-00010-00057-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86198
86034	3	proxecto-00010-00058-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86199
86035	3	proxecto-00010-00059-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86200
86036	3	proxecto-00010-00060-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86201
86037	3	proxecto-00010-00061-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86202
86038	3	proxecto-00010-00062-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86203
86039	3	proxecto-00010-00063-00001	\\254\\355\\000\\005~r\\0009org.navalplanner.business.resources.entities.ResourceEnum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xr\\000\\016java.lang.Enum\\000\\000\\000\\000\\000\\000\\000\\000\\022\\000\\000xpt\\000\\006WORKER	24	1.00	f	86204
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
3408	4712
5674	3697
5675	3697
3370	3697
7513	6300
79997	6300
5696	6300
7517	6305
5697	6305
5701	6321
8005	6321
5705	6339
8010	6339
5709	6353
8013	6353
8015	6674
5716	6674
5717	6676
9291	6676
6978	6815
9295	6815
9302	6818
6979	6818
9308	6825
6980	6825
6993	7072
11029	7072
6994	7075
11032	7075
6995	7078
11034	7078
11036	7081
6996	7081
11046	7115
7518	6275
79998	6275
57128	57194
57129	57194
57134	57199
57133	57199
57137	57203
57138	57203
57144	57206
57143	57206
57147	57211
57148	57211
57151	57214
57150	57214
57154	57216
57153	57216
57158	57218
57159	57218
57368	57222
57369	57222
57376	57229
57375	57229
57380	57235
57379	57235
57383	57238
57384	57238
57387	57241
57386	57241
57389	57243
57390	57243
57401	57245
57400	57245
57404	57193
57405	57193
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
86287	86208
86281	86214
86279	86208
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1111	1	b2b9cdee-2785-4c03-8e01-cec0a93b61cf	CC Mugardos	1010
1112	1	e725226b-94f3-41df-88fe-a1855cedc808	CC Cadiz	1010
1113	1	193da183-85b3-4306-9495-f40b3181480b	CC Vigo	1010
1114	1	b666450b-7fa2-4fca-be96-edc3eaaf0146	CC Ferrol	1010
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name) FROM stdin;
1010	1	a3636840-33ed-4e25-8ffd-6f98aa72df2a	Centro de coste
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

COPY material_category (id, version, name, parent_id) FROM stdin;
202	1	Imported materials without category	\N
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
2222	USER	2	WRITE_AUTHORIZATION	1868	910	\N
3434	USER	3	WRITE_AUTHORIZATION	3255	910	\N
3436	USER	2	WRITE_AUTHORIZATION	4712	910	\N
3435	USER	4	WRITE_AUTHORIZATION	3697	910	\N
6363	USER	31	WRITE_AUTHORIZATION	6275	910	\N
57570	USER	2	WRITE_AUTHORIZATION	57193	910	\N
85851	USER	2	WRITE_AUTHORIZATION	85840	910	\N
85850	USER	2	WRITE_AUTHORIZATION	85510	910	\N
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
1868	Xavi	t	t	9	40000.00	4000.00	109	Ref	\N	0	2020	307
3255	REsp	\N	t	29	50000.00	0.00	1473	Ref	\N	0	2020	307
4712	Resp.	t	t	3	60000.00	0.00	380	Ref.	\N	1	2020	307
3697	asdf	\N	t	3	60000.00	0.00	400	asdf	\N	0	2020	307
6275	Xavier	\N	t	64	150000.00	0.00	2075	Ref,	\N	0	6464	307
57193	\N	\N	t	63	100000.00	0.00	2075	\N	\N	0	\N	307
85840	\N	\N	t	63	400000.00	0.00	2075	\N	\N	0	\N	307
85510	\N	\N	t	63	50000.00	0.00	2075	\N	\N	0	\N	307
86208	\N	\N	t	5	100000.00	0.00	256	\N	\N	5	2021	307
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
3255	5	Pedido 2	Desc.	proxecto-00003	2010-02-04 12:10:40.245	2010-11-25 00:00:00	3	\N	\N	\N	\N
6275	33	4º release Navalplan	Desc.	proxecto-00006	2009-12-14 00:00:00	2010-02-17 00:00:00	3	\N	\N	\N	\N
6320	29	Filtrado no listado de pedidos	\N	proxecto-00006-00010	\N	\N	0	6305	\N	\N	2
85510	3	4º release Navalplan - 3	Desc.	proxecto-00009	2010-04-21 00:00:00	2010-05-27 00:00:00	3	\N	56587	\N	\N
85511	3	Módulo de xestión de usuarios	\N	proxecto-00009-00001	\N	\N	3	85510	\N	\N	0
85512	3	Xestión de usuarios	\N	proxecto-00009-00018	\N	\N	0	85511	\N	\N	0
85513	3	Xestión de roles	\N	proxecto-00009-00019	\N	\N	0	85511	\N	\N	1
85514	3	Xestión de perfiles	\N	proxecto-00009-00020	\N	\N	0	85511	\N	\N	2
85515	3	Xestión de roles e pedidos	\N	proxecto-00009-00021	\N	\N	0	85511	\N	\N	3
85516	3	Módulo de organizacións de traballo	\N	proxecto-00009-00002	\N	\N	3	85510	\N	\N	1
85517	3	Xestión de código único	\N	proxecto-00009-00022	\N	\N	0	85516	\N	\N	0
85518	3	Revisión de formulario de pedidos	\N	proxecto-00009-00023	\N	\N	0	85516	\N	\N	1
3697	6	Pedido 3	asdf	proxecto-00004	2010-02-04 13:36:05.265	2010-02-25 00:00:00	3	\N	\N	\N	\N
3698	5	Tarefa 1	\N	proxecto-00004-00001	\N	\N	0	3697	\N	\N	0
3699	5	Tarefa 2	\N	proxecto-00004-00002	\N	\N	0	3697	\N	\N	1
3700	5	Tarefa 3	\N	proxecto-00004-00003	\N	\N	0	3697	\N	\N	2
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
6321	29	Módulo de xestión de usuarios	\N	proxecto-00006-00009	\N	\N	3	6275	\N	\N	2
6322	29	Recursos Virtuais	\N	proxecto-00006-00011	\N	\N	0	6321	\N	\N	0
6323	29	Recursos Virtuais (Continuación)	\N	proxecto-00006-00012	\N	\N	0	6321	\N	\N	1
6342	28	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00006-00016	\N	\N	0	6339	\N	\N	2
6343	28	Modelos de pedidos e planificación	\N	proxecto-00006-00017	\N	\N	0	6339	\N	\N	3
6353	27	Módulo de asignación de recursos	\N	proxecto-00006-00018	\N	\N	3	6275	\N	\N	4
6354	27	Interpolación polinómica na asignación avanzada	\N	proxecto-00006-00019	\N	\N	0	6353	\N	\N	0
6355	27	Asignación avanzada asignación automática configuración	\N	proxecto-00006-00020	\N	\N	0	6353	\N	\N	1
6674	26	Módulo de partes de traballo	\N	proxecto-00006-00021	\N	\N	3	6275	\N	\N	5
6675	26	Procura de partes de traballo	\N	proxecto-00006-00024	\N	\N	0	6674	\N	\N	0
6676	26	Módulo de materiais	\N	proxecto-00006-00022	\N	\N	3	6275	\N	\N	6
6677	26	Informe de necesidades de materiais	\N	proxecto-00006-00025	\N	\N	0	6676	\N	\N	0
57216	3	Módulo de materiais	\N	proxecto-00008-00007	\N	\N	3	57193	\N	\N	6
57217	3	Informe de necesidades de materiais	\N	proxecto-00008-00034	\N	\N	0	57216	\N	\N	0
57218	3	Módulo de xestión da calidade	\N	proxecto-00008-00008	\N	\N	3	57193	\N	\N	7
57219	3	Administración de check-lists	\N	proxecto-00008-00035	\N	\N	0	57218	\N	\N	0
6300	30	Módulo de xestión de usuarios	\N	proxecto-00006-00001	\N	\N	3	6275	\N	\N	0
6301	30	Xestión de usuarios	\N	proxecto-00006-00003	\N	\N	0	6300	\N	\N	0
6302	30	Xestión de roles	\N	proxecto-00006-00004	\N	\N	0	6300	\N	\N	1
6303	30	Xestión de perfiles	\N	proxecto-00006-00005	\N	\N	0	6300	\N	\N	2
57220	3	Cubrir formularios de calidade en planificación	\N	proxecto-00008-00036	\N	\N	0	57218	\N	\N	1
57221	3	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00008-00037	\N	\N	0	57218	\N	\N	2
57222	3	Módulo de integración con subcontratas	\N	proxecto-00008-00009	\N	\N	3	57193	\N	\N	8
4712	3	Pedido con máquinas	Desc.	proxecto-00005	2010-02-04 20:34:28.037	2010-03-04 00:00:00	3	\N	\N	\N	\N
4713	3	tarefa home	\N	proxecto-00005-00001	\N	\N	0	4712	\N	\N	0
4714	3	tarefa máquina	\N	proxecto-00005-00002	\N	\N	0	4712	\N	\N	1
4715	3	tarefa home-maquina	\N	proxecto-00005-00003	\N	\N	0	4712	\N	\N	2
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
57223	3	Administración das subcontratas	\N	proxecto-00008-00038	\N	\N	0	57222	\N	\N	0
57224	3	Formato de intercambio	\N	proxecto-00008-00039	\N	\N	0	57222	\N	\N	1
57225	3	Fluxo de importación/exportación	\N	proxecto-00008-00040	\N	\N	0	57222	\N	\N	2
57226	3	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00008-00041	\N	\N	0	57222	\N	\N	3
6304	30	Xestión de roles e pedidos	\N	proxecto-00006-00006	\N	\N	0	6300	\N	\N	3
6305	30	Módulo de organizacións de traballo	\N	proxecto-00006-00002	\N	\N	3	6275	\N	\N	1
6306	30	Xestión de código único	\N	proxecto-00006-00007	\N	\N	0	6305	\N	\N	0
6307	30	Revisión de formulario de pedidos	\N	proxecto-00006-00008	\N	\N	0	6305	\N	\N	1
6339	28	Módulo de planificación	\N	proxecto-00006-00013	\N	\N	3	6275	\N	\N	3
6340	28	Compartir estado pestañas planificación	\N	proxecto-00006-00014	\N	\N	0	6339	\N	\N	0
6341	28	Técnica de recálculo de asignacións	\N	proxecto-00006-00015	\N	\N	0	6339	\N	\N	1
57227	3	Convertir en fitos as subcontratacións	\N	proxecto-00008-00042	\N	\N	0	57222	\N	\N	4
57228	3	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00008-00043	\N	\N	0	57222	\N	\N	5
57229	3	Módulo de importación exportación	\N	proxecto-00008-00010	\N	\N	3	57193	\N	\N	9
57230	3	Definir workflow de pedidos para ERP	\N	proxecto-00008-00044	\N	\N	0	57229	\N	\N	0
57231	3	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00008-00045	\N	\N	0	57229	\N	\N	1
57232	3	Formato de intercambio de información de avance	\N	proxecto-00008-00046	\N	\N	0	57229	\N	\N	2
57233	3	Formato de intercambio de recursos	\N	proxecto-00008-00047	\N	\N	0	57229	\N	\N	3
57234	3	Formato de intercambio de materiais	\N	proxecto-00008-00048	\N	\N	0	57229	\N	\N	4
57235	3	Módulo de presentación	\N	proxecto-00008-00011	\N	\N	3	57193	\N	\N	10
57236	3	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00008-00049	\N	\N	0	57235	\N	\N	0
57237	3	Imprimir información pantalla do planificador	\N	proxecto-00008-00050	\N	\N	0	57235	\N	\N	1
57238	3	Módulo de arquitectura tecnolóxica	\N	proxecto-00008-00012	\N	\N	3	57193	\N	\N	11
57239	3	Desenvolvemento de paquetes debian	\N	proxecto-00008-00051	\N	\N	0	57238	\N	\N	0
57240	3	Enlazar a axuda de usuario	\N	proxecto-00008-00052	\N	\N	0	57238	\N	\N	1
57241	3	Módulo de Documentación da API	\N	proxecto-00008-00013	\N	\N	3	57193	\N	\N	12
57242	3	Documentación das APIs públicas	\N	proxecto-00008-00053	\N	\N	0	57241	\N	\N	0
57243	3	Módulo de arquivo histórico	\N	proxecto-00008-00014	\N	\N	3	57193	\N	\N	13
57244	3	Pasar pedidos a histórico	\N	proxecto-00008-00054	\N	\N	0	57243	\N	\N	0
57245	3	Módulo de extracción de informes	\N	proxecto-00008-00015	\N	\N	3	57193	\N	\N	14
6815	25	Módulo de xestión da calidade	\N	proxecto-00006-00026	\N	\N	3	6275	\N	\N	7
6678	26	Administración de check-lists	\N	proxecto-00006-00023	\N	\N	0	6815	\N	\N	0
6816	25	Cubrir formularios de calidade en planificación	\N	proxecto-00006-00029	\N	\N	0	6815	\N	\N	1
6817	25	Incorporar listas de chequeo nos modelos de planificación	\N	proxecto-00006-00030	\N	\N	0	6815	\N	\N	2
6818	25	Módulo de integración con subcontratas	\N	proxecto-00006-00027	\N	\N	3	6275	\N	\N	8
6819	25	Administración das subcontratas	\N	proxecto-00006-00031	\N	\N	0	6818	\N	\N	0
6820	25	Formato de intercambio	\N	proxecto-00006-00032	\N	\N	0	6818	\N	\N	1
6821	25	Fluxo de importación/exportación	\N	proxecto-00006-00033	\N	\N	0	6818	\N	\N	2
57246	3	Integración de JasperRports	\N	proxecto-00008-00055	\N	\N	0	57245	\N	\N	0
57247	3	Informes sobre organizacións de traballo	\N	proxecto-00008-00056	\N	\N	0	57245	\N	\N	1
57248	3	Informes sobre partes de traballo	\N	proxecto-00008-00057	\N	\N	0	57245	\N	\N	2
57249	3	Informes de horas traballadas por un traballador	\N	proxecto-00008-00058	\N	\N	0	57245	\N	\N	3
57250	3	Lista de avances de planificación da empresa	\N	proxecto-00008-00059	\N	\N	0	57245	\N	\N	4
57251	3	Lista de avances de traballo da empresa	\N	proxecto-00008-00060	\N	\N	0	57245	\N	\N	5
57252	3	Informes de horas estimadas/horas realizadas	\N	proxecto-00008-00061	\N	\N	0	57245	\N	\N	6
57253	3	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00008-00062	\N	\N	0	57245	\N	\N	7
57254	3	Informes de traballador indicando custos por hora	\N	proxecto-00008-00063	\N	\N	0	57245	\N	\N	8
57256	3	Análise	\N	proxecto-00008-00017	\N	\N	0	57193	\N	\N	16
6822	25	Interfaz de xestión de Subcontratación no pedido	\N	proxecto-00006-00034	\N	\N	0	6818	\N	\N	3
6823	25	Convertir en fitos as subcontratacións	\N	proxecto-00006-00035	\N	\N	0	6818	\N	\N	4
6824	25	Avance e curso de subcontratas en técnica de valor gañado	\N	proxecto-00006-00036	\N	\N	0	6818	\N	\N	5
6825	25	Módulo de importación exportación	\N	proxecto-00006-00028	\N	\N	3	6275	\N	\N	9
6826	25	Definir workflow de pedidos para ERP	\N	proxecto-00006-00037	\N	\N	0	6825	\N	\N	0
6827	25	Formato de intercambio de pedidos e elementos de pedidos	\N	proxecto-00006-00038	\N	\N	0	6825	\N	\N	1
6828	25	Formato de intercambio de información de avance	\N	proxecto-00006-00039	\N	\N	0	6825	\N	\N	2
6829	25	Formato de intercambio de recursos	\N	proxecto-00006-00040	\N	\N	0	6825	\N	\N	3
6830	25	Formato de intercambio de materiais	\N	proxecto-00006-00041	\N	\N	0	6825	\N	\N	4
7115	23	Módulo de extracción de informes	\N	proxecto-00006-00055	\N	\N	3	6275	\N	\N	14
7116	23	Integración de JasperRports	\N	proxecto-00006-00056	\N	\N	0	7115	\N	\N	0
7117	23	Informes sobre organizacións de traballo	\N	proxecto-00006-00057	\N	\N	0	7115	\N	\N	1
7118	23	Lista de avances de planificación da empresa	\N	proxecto-00006-00058	\N	\N	0	7115	\N	\N	4
7119	23	Lista de avances de traballo da empresa	\N	proxecto-00006-00059	\N	\N	0	7115	\N	\N	5
7120	23	Informes de horas estimadas/horas realizadas	\N	proxecto-00006-00060	\N	\N	0	7115	\N	\N	6
7121	23	Horas realizadas organizadas por tipo de traballo	\N	proxecto-00006-00061	\N	\N	0	7115	\N	\N	7
7122	23	Informes de traballador indicando custos por hora	\N	proxecto-00006-00062	\N	\N	0	7115	\N	\N	8
7072	24	Módulo de presentación	\N	proxecto-00006-00042	\N	\N	3	6275	\N	\N	10
7073	24	Imprimir o diagrama de Gantt en varias páxinas	\N	proxecto-00006-00047	\N	\N	0	7072	\N	\N	0
7074	24	Imprimir información pantalla do planificador	\N	proxecto-00006-00048	\N	\N	0	7072	\N	\N	1
7075	24	Módulo de arquitectura tecnolóxica	\N	proxecto-00006-00043	\N	\N	3	6275	\N	\N	11
7076	24	Desenvolvemento de paquetes debian	\N	proxecto-00006-00049	\N	\N	0	7075	\N	\N	0
7077	24	Enlazar a axuda de usuario	\N	proxecto-00006-00050	\N	\N	0	7075	\N	\N	1
7078	24	Módulo de Documentación da API	\N	proxecto-00006-00044	\N	\N	3	6275	\N	\N	12
7079	24	Documentación das APIs públicas	\N	proxecto-00006-00051	\N	\N	0	7078	\N	\N	0
7081	24	Módulo de arquivo histórico	\N	proxecto-00006-00045	\N	\N	3	6275	\N	\N	13
7082	24	Pasar pedidos a histórico	\N	proxecto-00006-00053	\N	\N	0	7081	\N	\N	0
7084	24	Informes sobre partes de traballo	\N	proxecto-00006-00046	\N	\N	0	7115	\N	\N	2
7080	24	Informes de horas traballadas por un traballador	\N	proxecto-00006-00052	\N	\N	0	7115	\N	\N	3
7123	23	Coordinación	\N	proxecto-00006-00063	\N	\N	0	6275	\N	\N	15
7124	23	Análise	\N	proxecto-00006-00064	\N	\N	0	6275	\N	\N	16
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
57193	3	4º release Navalplan - 2	Desc.	proxecto-00008	2010-02-12 18:21:59.723	2010-04-18 00:00:00	3	\N	56587	\N	\N
57194	3	Módulo de xestión de usuarios	\N	proxecto-00008-00001	\N	\N	3	57193	\N	\N	0
57195	3	Xestión de usuarios	\N	proxecto-00008-00018	\N	\N	0	57194	\N	\N	0
57196	3	Xestión de roles	\N	proxecto-00008-00019	\N	\N	0	57194	\N	\N	1
57197	3	Xestión de perfiles	\N	proxecto-00008-00020	\N	\N	0	57194	\N	\N	2
57198	3	Xestión de roles e pedidos	\N	proxecto-00008-00021	\N	\N	0	57194	\N	\N	3
57199	3	Módulo de organizacións de traballo	\N	proxecto-00008-00002	\N	\N	3	57193	\N	\N	1
57200	3	Xestión de código único	\N	proxecto-00008-00022	\N	\N	0	57199	\N	\N	0
57201	3	Revisión de formulario de pedidos	\N	proxecto-00008-00023	\N	\N	0	57199	\N	\N	1
57202	3	Filtrado no listado de pedidos	\N	proxecto-00008-00024	\N	\N	0	57199	\N	\N	2
57203	3	Módulo de xestión de usuarios	\N	proxecto-00008-00003	\N	\N	3	57193	\N	\N	2
57204	3	Recursos Virtuais	\N	proxecto-00008-00025	\N	\N	0	57203	\N	\N	0
57205	3	Recursos Virtuais (Continuación)	\N	proxecto-00008-00026	\N	\N	0	57203	\N	\N	1
57255	3	Coordinación	\N	proxecto-00008-00016	\N	\N	0	57193	\N	\N	15
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
57206	3	Módulo de planificación	\N	proxecto-00008-00004	\N	\N	3	57193	\N	\N	3
57207	3	Compartir estado pestañas planificación	\N	proxecto-00008-00027	\N	\N	0	57206	\N	\N	0
57208	3	Técnica de recálculo de asignacións	\N	proxecto-00008-00028	\N	\N	0	57206	\N	\N	1
57209	3	Filtrado de pedidos e tarefas de un pedido	\N	proxecto-00008-00029	\N	\N	0	57206	\N	\N	2
57210	3	Modelos de pedidos e planificación	\N	proxecto-00008-00030	\N	\N	0	57206	\N	\N	3
57211	3	Módulo de asignación de recursos	\N	proxecto-00008-00005	\N	\N	3	57193	\N	\N	4
57212	3	Interpolación polinómica na asignación avanzada	\N	proxecto-00008-00031	\N	\N	0	57211	\N	\N	0
57213	3	Asignación avanzada asignación automática configuración	\N	proxecto-00008-00032	\N	\N	0	57211	\N	\N	1
57214	3	Módulo de partes de traballo	\N	proxecto-00008-00006	\N	\N	3	57193	\N	\N	5
57215	3	Procura de partes de traballo	\N	proxecto-00008-00033	\N	\N	0	57214	\N	\N	0
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
85519	3	Filtrado no listado de pedidos	\N	proxecto-00009-00024	\N	\N	0	85516	\N	\N	2
85520	3	Módulo de xestión de usuarios	\N	proxecto-00009-00003	\N	\N	3	85510	\N	\N	2
85521	3	Recursos Virtuais	\N	proxecto-00009-00025	\N	\N	0	85520	\N	\N	0
85522	3	Recursos Virtuais (Continuación)	\N	proxecto-00009-00026	\N	\N	0	85520	\N	\N	1
85523	3	Módulo de planificación	\N	proxecto-00009-00004	\N	\N	3	85510	\N	\N	3
85524	3	Compartir estado pestañas planificación	\N	proxecto-00009-00027	\N	\N	0	85523	\N	\N	0
86208	6	Subcontratación da coordinación	\N	proxecto-00013	2010-04-21 00:00:00	2010-05-05 00:00:00	3	\N	\N	\N	\N
86214	5	Análise	\N	proxecto-00013-00002	2010-04-21 00:00:00	2010-05-01 16:00:00	3	86208	\N	\N	0
86215	5	Planificación	\N	proxecto-00013-00003	\N	\N	0	86214	\N	\N	0
86216	5	Seguimiento	\N	proxecto-00013-00004	\N	\N	0	86214	\N	\N	1
86217	5	Control de calidad	\N	proxecto-00013-00005	\N	\N	0	86214	\N	\N	2
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
3698	1
3699	1
3700	1
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
6301	1
6302	1
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
6823	1
6824	1
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
57249	1
57250	1
57251	1
57252	1
57253	1
57254	1
57255	1
57256	1
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
7080	1
7118	1
7119	1
7120	1
7121	1
7122	1
7123	1
7124	1
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
86215	1
86216	1
86217	1
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

COPY orderlinetemplate (order_line_template_id, workhours) FROM stdin;
44789	8
44790	16
44791	16
44792	40
44794	24
44795	56
44796	8
44798	40
44799	8
44801	24
44802	48
44803	28
44804	120
44806	24
44807	40
44809	40
44811	40
44813	48
44814	32
44815	32
44817	64
44818	16
44819	32
44820	40
44821	16
44822	32
44824	15
44825	48
44826	40
44827	24
44828	32
44830	64
44831	96
44833	32
44834	40
44836	40
44838	32
44840	16
44841	24
44842	24
44843	24
44945	24
44946	24
44947	24
44948	24
44949	24
44950	254
44951	256
56589	8
56590	16
56591	16
56592	40
56594	24
56595	56
56596	8
56598	40
56599	8
56601	24
56602	48
56603	28
56604	120
56606	24
56607	40
56609	40
56611	40
56613	48
56614	32
56615	32
56617	64
56618	16
56619	32
56620	40
56621	16
56622	32
56624	15
56625	48
56626	40
56627	24
56628	32
56630	64
56631	96
56633	32
56634	40
56636	40
56638	32
56640	16
56641	24
56642	24
56643	24
56644	24
56645	24
56646	24
56647	24
56648	24
56649	256
56650	256
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
606	4	PREFIX	1	5	f
607	15	proxecto	13	5	t
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
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, base_calendar_id, code) FROM stdin;
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
1226	4	315	1226
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
58384	8	1.00	56258	\N
58455	7	1.00	56259	\N
3069	2	1.00	3872	\N
3070	2	1.00	3872	\N
5051	0	1.00	3873	\N
58456	7	1.00	56260	\N
58472	5	1.00	56301	\N
58457	7	1.00	56302	\N
58458	7	1.00	56292	\N
58459	7	1.00	56293	\N
58460	7	1.00	56294	\N
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
60793	2	0.20	56295	\N
60794	2	0.10	56296	\N
60792	2	1.00	56304	\N
60790	2	1.00	56277	\N
60752	3	1.00	56269	\N
60753	3	1.00	56270	\N
60754	3	1.00	56271	\N
60705	4	1.00	56272	\N
60755	3	1.00	56306	\N
60791	2	1.00	56285	\N
58450	7	1.00	56286	\N
58451	7	1.00	56287	\N
58452	7	1.00	56288	\N
58453	7	1.00	56289	\N
86460	2	0.94	85407	88072
58454	7	1.00	56290	\N
60751	3	1.00	56274	\N
89399	1	1.00	86383	\N
89400	1	1.00	86383	\N
89401	1	1.00	86383	\N
89402	1	1.00	86384	\N
89403	1	1.00	86384	\N
89404	1	1.00	86384	\N
89405	1	0.70	86385	\N
60703	4	1.00	56275	\N
68413	1	0.75	56318	\N
68414	1	0.75	56319	\N
68415	1	1.00	56308	\N
68416	1	1.00	56309	\N
68417	1	1.00	56310	\N
68418	1	1.00	56311	\N
68419	1	1.00	56312	\N
68420	1	1.00	56313	\N
68421	1	1.00	56314	\N
68422	1	1.00	56315	\N
68423	1	1.00	56316	\N
58468	6	1.00	56298	\N
58469	6	1.00	56299	\N
58470	6	1.00	56266	\N
60704	4	1.00	56267	\N
58383	8	1.00	56257	\N
58461	7	1.00	56262	\N
60756	3	1.00	56263	\N
60757	3	1.00	56264	\N
60758	3	1.00	56281	\N
60795	2	1.00	56282	\N
60706	4	1.00	56283	\N
86458	0	1.00	57493	\N
86459	0	1.00	57494	\N
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
60793	1217
60794	1217
86458	1220
86460	1226
89399	1226
89400	1217
89401	1222
89402	1220
89403	1228
89404	1224
89405	1224
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
88072	2010-06-05	1.00	1.00	0
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
88072	0
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, task_element_id, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
28508162	3	2021	85408	2010-02-15 17:51:06.094	2010-02-15 18:02:07.281	Subcontratación da coordinación	100000.00	\N	t	t	t	t	2
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
3868	1	0	\N	\N
3869	1	0	\N	\N
85410	1	0	\N	\N
85411	1	0	\N	\N
85412	1	0	\N	\N
85413	1	0	\N	\N
85415	1	0	\N	\N
85416	1	0	\N	\N
85417	1	0	\N	\N
3870	1	0	\N	\N
85419	1	0	\N	\N
85420	1	0	\N	\N
85422	1	0	\N	\N
85423	1	0	\N	\N
85424	1	0	\N	\N
85425	1	0	\N	\N
85427	1	0	\N	\N
85428	1	0	\N	\N
85430	1	0	\N	\N
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
56257	1	0	\N	\N
56258	1	0	\N	\N
56259	1	0	\N	\N
56260	1	0	\N	\N
56353	1	0	\N	\N
56354	1	0	\N	\N
57476	1	0	\N	\N
56262	1	0	\N	\N
56263	1	0	\N	\N
56264	1	0	\N	\N
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
56283	1	0	\N	\N
56285	1	0	\N	\N
56286	1	0	\N	\N
56287	1	0	\N	\N
56288	1	0	\N	\N
56289	1	0	\N	\N
56290	1	0	\N	\N
56292	1	0	\N	\N
56293	1	0	\N	\N
56294	1	0	\N	\N
56295	1	0	\N	\N
56296	1	0	\N	\N
56298	1	0	\N	\N
56299	1	0	\N	\N
56304	1	0	\N	\N
56306	1	0	\N	\N
56308	1	0	\N	\N
56309	1	0	\N	\N
56310	1	0	\N	\N
56311	1	0	\N	\N
56312	1	0	\N	\N
56313	1	0	\N	\N
56314	1	0	\N	\N
56318	1	0	\N	\N
56319	1	0	\N	\N
57477	1	0	\N	\N
57479	1	0	\N	\N
57493	1	0	\N	\N
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
57491	1	0	\N	\N
57494	1	0	\N	\N
86357	1	0	\N	\N
56301	1	0	\N	\N
56302	1	0	\N	\N
56315	1	0	\N	\N
56316	1	0	\N	\N
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
85358	1	0	\N	\N
85359	1	0	\N	\N
85360	1	0	\N	\N
85361	1	0	\N	\N
85368	1	0	\N	\N
85346	1	0	\N	\N
85347	1	0	\N	\N
85348	1	0	\N	\N
85349	1	0	\N	\N
85366	1	0	\N	\N
85363	1	0	\N	\N
85364	1	0	\N	\N
85397	1	0	\N	\N
85398	1	0	\N	\N
85399	1	0	\N	\N
85400	1	0	\N	\N
85401	1	0	\N	\N
85402	1	0	\N	\N
85403	1	0	\N	\N
85404	1	0	\N	\N
85405	1	0	\N	\N
85393	1	0	\N	\N
85390	1	0	\N	\N
85391	1	0	\N	\N
85387	1	0	\N	\N
85388	1	0	\N	\N
85381	1	0	\N	\N
85382	1	0	\N	\N
85383	1	0	\N	\N
85384	1	0	\N	\N
85385	1	0	\N	\N
85355	1	0	\N	\N
85356	1	0	\N	\N
85374	1	0	\N	\N
85375	1	0	\N	\N
85376	1	0	\N	\N
86383	1	1	2010-04-21 00:00:00	\N
86384	1	1	2010-04-21 00:00:00	\N
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
57486	1	0	\N	\N
57487	1	0	\N	\N
57488	1	0	\N	\N
57489	1	0	\N	\N
57490	1	0	\N	\N
85377	1	0	\N	\N
85378	1	0	\N	\N
85379	1	0	\N	\N
86385	2	1	2010-04-21 00:00:00	\N
85407	1	0	\N	\N
85408	1	2	2010-04-21 00:00:00	28508162
85351	1	0	\N	\N
85352	1	0	\N	\N
85353	1	0	\N	\N
85395	1	0	\N	\N
85370	1	0	\N	\N
85371	1	0	\N	\N
85372	1	0	\N	\N
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
86383	86046
86384	86047
86385	86048
3872	4866
3872	4865
3873	4867
3874	4868
3874	4869
3868	3761
3869	3762
3870	3763
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
85386	5	Módulo de importación exportación	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	9
85408	5	Análise	\N	2010-04-21 00:00:00	2010-05-01 16:00:00	\N	85409	\N	16
3874	5	tarefa home-maquina	\N	2010-02-04 20:34:28.037	2010-02-13 04:34:28.037	\N	3875	\N	2
3873	5	tarefa máquina	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	\N	3875	\N	1
3872	5	tarefa home	\N	2010-02-04 20:34:28.037	2010-02-11 20:34:28.037	\N	3875	\N	0
3875	6	Pedido con máquinas	\N	2010-02-04 20:34:28.037	2010-02-24 20:34:28.037	2010-03-04	\N	\N	\N
3860	6	Tarefa23	\N	2010-02-04 12:10:40.245	2010-02-07 10:10:40.245	\N	3867	\N	22
3843	6	Tarefa6	\N	2010-02-26 12:10:40.245	2010-03-02 12:10:40.245	\N	3867	\N	5
3851	6	Tarefa14	\N	2010-02-04 12:10:40.245	2010-02-05 09:10:40.245	\N	3867	\N	13
56273	33	Módulo de planificación	\N	2009-12-22 00:00:00	2010-02-09 00:00:00	\N	56320	\N	3
56276	33	Módulo de asignación de recursos	\N	2009-12-14 00:00:00	2010-01-30 00:00:00	\N	56320	\N	4
56278	33	Módulo de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56320	\N	5
56280	33	Módulo de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56320	\N	6
56284	33	Módulo de xestión da calidade	\N	2009-12-14 00:00:00	2010-01-16 00:00:00	\N	56320	\N	7
56291	33	Módulo de integración con subcontratas	\N	2009-12-26 00:00:00	2010-01-26 00:00:00	\N	56320	\N	8
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
56297	33	Módulo de importación exportación	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	\N	56320	\N	9
56300	33	Módulo de presentación	\N	2009-12-19 00:00:00	2010-01-16 00:00:00	\N	56320	\N	10
56303	33	Módulo de arquitectura tecnolóxica	\N	2009-12-16 00:00:00	2009-12-29 00:00:00	\N	56320	\N	11
56305	33	Módulo de Documentación da API	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56320	\N	12
56307	33	Módulo de arquivo histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56320	\N	13
56317	33	Módulo de extracción de informes	\N	2009-12-14 00:00:00	2010-01-09 00:00:00	\N	56320	\N	14
56290	25	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-01-20 00:00:00	2010-01-26 00:00:00	\N	56291	\N	5
3868	5	Tarefa 1	\N	2010-02-04 13:36:05.265	2010-02-24 13:36:05.265	\N	3871	\N	0
3869	5	Tarefa 2	\N	2010-02-24 13:36:05.265	2010-03-13 13:36:05.265	\N	3871	\N	1
3870	5	Tarefa 3	\N	2010-02-04 13:36:05.265	2010-03-12 13:36:05.265	\N	3871	\N	2
3863	6	Tarefa26	\N	2010-02-04 12:10:40.245	2010-02-07 20:10:40.245	\N	3867	\N	25
3866	6	Tarefa29	\N	2010-02-04 12:10:40.245	2010-02-17 00:10:40.245	\N	3867	\N	28
3865	6	Tarefa28	\N	2010-02-04 12:10:40.245	2010-02-06 06:10:40.245	\N	3867	\N	27
3864	6	Tarefa27	\N	2010-02-04 12:10:40.245	2010-02-08 16:10:40.245	\N	3867	\N	26
3871	7	Pedido 3	\N	2010-02-04 13:36:05.265	2010-03-13 13:36:05.265	2010-02-25	\N	\N	\N
56321	8	Xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-13 02:21:59.723	\N	56325	\N	0
56322	8	Xestión de roles	\N	2010-02-13 02:21:59.723	2010-02-13 18:21:59.723	\N	56325	\N	1
56323	8	Xestión de perfiles	\N	2010-02-13 18:21:59.723	2010-02-14 10:21:59.723	\N	56325	\N	2
56324	8	Xestión de roles e pedidos	\N	2010-02-14 10:21:59.723	2010-02-16 02:21:59.723	\N	56325	\N	3
57474	8	Imprimir información pantalla do planificador	\N	2010-02-14 10:21:59.723	2010-02-18 10:21:59.723	\N	57475	\N	1
57483	8	Integración de JasperRports	\N	2010-02-15 18:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	0
57484	8	Informes sobre organizacións de traballo	\N	2010-02-16 10:21:59.723	2010-02-17 10:21:59.723	\N	57492	\N	1
57485	8	Informes sobre partes de traballo	\N	2010-02-17 10:21:59.723	2010-02-18 10:21:59.723	\N	57492	\N	2
57486	8	Informes de horas traballadas por un traballador	\N	2010-02-18 10:21:59.723	2010-02-19 10:21:59.723	\N	57492	\N	3
57494	8	Análise	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	16
56325	9	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-16 02:21:59.723	\N	57495	\N	0
57492	9	Módulo de extracción de informes	\N	2010-02-14 10:21:59.723	2010-02-22 10:21:59.723	\N	57495	\N	14
86383	6	Planificación	\N	2010-04-21 00:00:00	2010-04-28 00:00:00	\N	86386	\N	0
86384	6	Seguimiento	\N	2010-04-28 00:00:00	2010-05-05 00:00:00	\N	86386	\N	1
86385	6	Control de calidad	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	\N	86386	\N	2
86386	8	Análise	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-01	86387	\N	0
86387	8	Subcontratación da coordinación	\N	2010-04-21 00:00:00	2010-05-05 00:00:00	2010-05-05	\N	\N	\N
56326	8	Xestión de código único	\N	2010-02-16 02:21:59.723	2010-02-17 02:21:59.723	\N	56329	\N	0
56327	8	Revisión de formulario de pedidos	\N	2010-02-17 02:21:59.723	2010-02-19 10:21:59.723	\N	56329	\N	1
56328	8	Filtrado no listado de pedidos	\N	2010-02-19 10:21:59.723	2010-02-19 18:21:59.723	\N	56329	\N	2
85351	4	Xestión de código único	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85354	\N	0
85352	4	Revisión de formulario de pedidos	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85354	\N	1
85353	4	Filtrado no listado de pedidos	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85354	\N	2
85358	4	Compartir estado pestañas planificación	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85362	\N	0
85346	4	Xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85350	\N	0
85347	4	Xestión de roles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	1
85348	4	Xestión de perfiles	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85350	\N	2
85349	4	Xestión de roles e pedidos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85350	\N	3
85355	4	Recursos Virtuais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85357	\N	0
85356	4	Recursos Virtuais (Continuación)	\N	2010-04-21 00:00:00	2010-04-21 08:00:00	\N	85357	\N	1
85375	4	Formato de intercambio	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	1
85409	5	4º release Navalplan - 3	\N	2010-04-21 00:00:00	2010-06-05 00:00:00	2010-05-27	\N	\N	\N
56257	25	Xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-15 00:00:00	\N	56261	\N	0
56258	25	Xestión de roles	\N	2009-12-15 00:00:00	2009-12-17 00:00:00	\N	56261	\N	1
56259	25	Xestión de perfiles	\N	2009-12-17 00:00:00	2009-12-19 00:00:00	\N	56261	\N	2
56260	25	Xestión de roles e pedidos	\N	2009-12-19 00:00:00	2009-12-26 00:00:00	\N	56261	\N	3
56262	25	Xestión de código único	\N	2009-12-22 00:00:00	2009-12-25 00:00:00	\N	56265	\N	0
56263	25	Revisión de formulario de pedidos	\N	2010-01-08 00:00:00	2010-01-19 00:00:00	\N	56265	\N	1
56264	25	Filtrado no listado de pedidos	\N	2010-01-19 00:00:00	2010-01-20 00:00:00	\N	56265	\N	2
56266	25	Recursos Virtuais	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56268	\N	0
56267	25	Recursos Virtuais (Continuación)	\N	2009-12-19 00:00:00	2009-12-22 00:00:00	\N	56268	\N	1
56269	25	Compartir estado pestañas planificación	\N	2010-01-16 00:00:00	2010-01-21 00:00:00	\N	56273	\N	0
56270	25	Técnica de recálculo de asignacións	\N	2010-01-30 00:00:00	2010-02-09 00:00:00	\N	56273	\N	1
56271	25	Filtrado de pedidos e tarefas de un pedido	\N	2010-01-02 00:00:00	2010-01-08 00:00:00	\N	56273	\N	2
56272	25	Modelos de pedidos e planificación	\N	2009-12-22 00:00:00	2010-01-12 00:00:00	\N	56273	\N	3
56274	25	Interpolación polinómica na asignación avanzada	\N	2010-01-27 00:00:00	2010-01-30 00:00:00	\N	56276	\N	0
56275	25	Asignación avanzada asignación automática configuración	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56276	\N	1
56277	25	Procura de partes de traballo	\N	2009-12-26 00:00:00	2010-01-02 00:00:00	\N	56278	\N	0
56279	25	Informe de necesidades de materiais	\N	2010-01-09 00:00:00	2010-01-10 16:00:00	\N	56280	\N	0
56281	25	Administración de check-lists	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56284	\N	0
56282	25	Cubrir formularios de calidade en planificación	\N	2009-12-22 00:00:00	2009-12-26 00:00:00	\N	56284	\N	1
56330	8	Recursos Virtuais	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	56332	\N	0
56331	8	Recursos Virtuais (Continuación)	\N	2010-02-14 10:21:59.723	2010-02-14 18:21:59.723	\N	56332	\N	1
56333	8	Compartir estado pestañas planificación	\N	2010-02-14 18:21:59.723	2010-02-15 18:21:59.723	\N	56337	\N	0
56334	8	Técnica de recálculo de asignacións	\N	2010-02-15 18:21:59.723	2010-02-17 18:21:59.723	\N	56337	\N	1
56283	25	Incorporar listas de chequeo nos modelos de planificación	\N	2010-01-12 00:00:00	2010-01-16 00:00:00	\N	56284	\N	2
56285	25	Administración das subcontratas	\N	2009-12-26 00:00:00	2010-01-07 00:00:00	\N	56291	\N	0
56286	25	Formato de intercambio	\N	2010-01-01 00:00:00	2010-01-05 00:00:00	\N	56291	\N	1
56287	25	Fluxo de importación/exportación	\N	2010-01-05 00:00:00	2010-01-09 00:00:00	\N	56291	\N	2
56288	25	Interfaz de xestión de Subcontratación no pedido	\N	2010-01-09 00:00:00	2010-01-16 00:00:00	\N	56291	\N	3
56289	25	Convertir en fitos as subcontratacións	\N	2010-01-16 00:00:00	2010-01-20 00:00:00	\N	56291	\N	4
56292	25	Definir workflow de pedidos para ERP	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56297	\N	0
56293	25	Formato de intercambio de pedidos e elementos de pedidos	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56297	\N	1
56294	25	Formato de intercambio de información de avance	\N	2009-12-25 00:00:00	2010-01-01 00:00:00	\N	56297	\N	2
56295	25	Formato de intercambio de recursos	\N	2009-12-14 00:00:00	2009-12-30 00:00:00	\N	56297	\N	3
56296	25	Formato de intercambio de materiais	\N	2009-12-30 00:00:00	2010-02-12 00:00:00	\N	56297	\N	4
56298	25	Imprimir o diagrama de Gantt en varias páxinas	\N	2009-12-19 00:00:00	2009-12-31 00:00:00	\N	56300	\N	0
56299	25	Imprimir información pantalla do planificador	\N	2009-12-31 00:00:00	2010-01-16 00:00:00	\N	56300	\N	1
56301	25	Desenvolvemento de paquetes debian	\N	2009-12-23 00:00:00	2009-12-29 00:00:00	\N	56303	\N	0
56302	25	Enlazar a axuda de usuario	\N	2009-12-16 00:00:00	2009-12-23 00:00:00	\N	56303	\N	1
56304	25	Documentación das APIs públicas	\N	2009-12-14 00:00:00	2009-12-19 00:00:00	\N	56305	\N	0
56306	25	Pasar pedidos a histórico	\N	2010-01-21 00:00:00	2010-01-27 00:00:00	\N	56307	\N	0
56308	25	Integración de JasperRports	\N	2009-12-14 00:00:00	2009-12-16 00:00:00	\N	56317	\N	0
56309	25	Informes sobre organizacións de traballo	\N	2010-01-06 00:00:00	2010-01-09 00:00:00	\N	56317	\N	1
56310	25	Informes sobre partes de traballo	\N	2010-01-01 00:00:00	2010-01-06 00:00:00	\N	56317	\N	2
56311	25	Informes de horas traballadas por un traballador	\N	2009-12-16 00:00:00	2009-12-19 00:00:00	\N	56317	\N	3
56312	25	Lista de avances de planificación da empresa	\N	2009-12-29 00:00:00	2010-01-01 00:00:00	\N	56317	\N	4
56313	25	Lista de avances de traballo da empresa	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	5
56314	25	Informes de horas estimadas/horas realizadas	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	6
56335	8	Filtrado de pedidos e tarefas de un pedido	\N	2010-02-17 18:21:59.723	2010-02-18 22:21:59.723	\N	56337	\N	2
56315	25	Horas realizadas organizadas por tipo de traballo	\N	2009-12-24 00:00:00	2009-12-29 00:00:00	\N	56317	\N	7
56336	8	Modelos de pedidos e planificación	\N	2010-02-18 22:21:59.723	2010-02-23 22:21:59.723	\N	56337	\N	3
56316	25	Informes de traballador indicando custos por hora	\N	2009-12-19 00:00:00	2009-12-24 00:00:00	\N	56317	\N	8
56351	8	Fluxo de importación/exportación	\N	2010-02-13 10:21:59.723	2010-02-14 18:21:59.723	\N	56355	\N	2
56352	8	Interfaz de xestión de Subcontratación no pedido	\N	2010-02-14 18:21:59.723	2010-02-16 10:21:59.723	\N	56355	\N	3
56353	8	Convertir en fitos as subcontratacións	\N	2010-02-16 10:21:59.723	2010-02-17 02:21:59.723	\N	56355	\N	4
56318	25	Coordinación	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	15
56319	25	Análise	\N	2009-12-14 00:00:00	2010-02-11 00:00:00	\N	56320	\N	16
56354	8	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-02-17 02:21:59.723	2010-02-18 10:21:59.723	\N	56355	\N	5
56356	8	Definir workflow de pedidos para ERP	\N	2010-02-18 10:21:59.723	2010-02-19 01:21:59.723	\N	57472	\N	0
56357	8	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-02-19 01:21:59.723	2010-02-21 01:21:59.723	\N	57472	\N	1
57469	8	Formato de intercambio de información de avance	\N	2010-02-21 01:21:59.723	2010-02-22 17:21:59.723	\N	57472	\N	2
57470	8	Formato de intercambio de recursos	\N	2010-02-22 17:21:59.723	2010-02-23 17:21:59.723	\N	57472	\N	3
57471	8	Formato de intercambio de materiais	\N	2010-02-23 17:21:59.723	2010-02-25 01:21:59.723	\N	57472	\N	4
57473	8	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-02-18 10:21:59.723	2010-02-21 02:21:59.723	\N	57475	\N	0
57476	8	Desenvolvemento de paquetes debian	\N	2010-02-25 01:21:59.723	2010-02-26 09:21:59.723	\N	57478	\N	0
57477	8	Enlazar a axuda de usuario	\N	2010-02-26 09:21:59.723	2010-02-28 01:21:59.723	\N	57478	\N	1
56332	9	Módulo de xestión de usuarios	\N	2010-02-12 18:21:59.723	2010-02-14 18:21:59.723	\N	57495	\N	2
56337	9	Módulo de planificación	\N	2010-02-14 18:21:59.723	2010-02-23 22:21:59.723	\N	57495	\N	3
56348	9	Módulo de xestión da calidade	\N	2010-02-18 18:21:59.723	2010-02-23 10:21:59.723	\N	57495	\N	7
57472	9	Módulo de importación exportación	\N	2010-02-18 10:21:59.723	2010-02-25 01:21:59.723	\N	57495	\N	9
57475	9	Módulo de presentación	\N	2010-02-14 10:21:59.723	2010-02-21 02:21:59.723	\N	57495	\N	10
57478	9	Módulo de arquitectura tecnolóxica	\N	2010-02-25 01:21:59.723	2010-02-28 01:21:59.723	\N	57495	\N	11
57482	9	Módulo de arquivo histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57495	\N	13
57495	9	4º release Navalplan - 2	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	2010-04-18	\N	\N	\N
85345	2	Entrega	\N	2010-04-01 18:21:59.723	2010-04-01 18:21:59.723	\N	\N	\N	\N
56261	33	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-26 00:00:00	\N	56320	\N	0
86364	2	Enlazar a axuda de usuario	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86365	\N	1
86366	2	Documentación das APIs públicas	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86367	\N	0
86368	2	Pasar pedidos a histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86369	\N	0
85359	4	Técnica de recálculo de asignacións	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85362	\N	1
86370	2	Integración de JasperRports	\N	2010-05-26 00:00:00	2010-05-26 16:00:00	\N	86379	\N	0
86371	2	Informes sobre organizacións de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	1
86372	2	Informes sobre partes de traballo	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	2
86373	2	Informes de horas traballadas por un traballador	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86379	\N	3
85360	4	Filtrado de pedidos e tarefas de un pedido	\N	2010-04-21 00:00:00	2010-04-22 04:00:00	\N	85362	\N	2
85361	4	Modelos de pedidos e planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85362	\N	3
85366	4	Procura de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85367	\N	0
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
56265	33	Módulo de organizacións de traballo	\N	2009-12-22 00:00:00	2010-01-20 00:00:00	\N	56320	\N	1
56268	33	Módulo de xestión de usuarios	\N	2009-12-14 00:00:00	2009-12-22 00:00:00	\N	56320	\N	2
56320	33	4º release Navalplan	\N	2009-12-14 00:00:00	2010-02-12 00:00:00	2010-02-17	\N	\N	\N
56338	8	Interpolación polinómica na asignación avanzada	\N	2010-02-12 18:21:59.723	2010-02-13 18:21:59.723	\N	56340	\N	0
56339	8	Asignación avanzada asignación automática configuración	\N	2010-02-13 18:21:59.723	2010-02-15 10:21:59.723	\N	56340	\N	1
56343	8	Informe de necesidades de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	56344	\N	0
56349	8	Administración das subcontratas	\N	2010-02-16 02:21:59.723	2010-02-18 18:21:59.723	\N	56355	\N	0
57479	8	Documentación das APIs públicas	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57480	\N	0
57493	8	Coordinación	\N	2010-02-12 18:21:59.723	2010-04-01 18:21:59.723	\N	57495	\N	15
56329	9	Módulo de organizacións de traballo	\N	2010-02-16 02:21:59.723	2010-02-19 18:21:59.723	\N	57495	\N	1
56340	9	Módulo de asignación de recursos	\N	2010-02-12 18:21:59.723	2010-02-15 10:21:59.723	\N	57495	\N	4
56344	9	Módulo de materiais	\N	2010-02-17 02:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	6
56355	9	Módulo de integración con subcontratas	\N	2010-02-12 18:21:59.723	2010-02-18 18:21:59.723	\N	57495	\N	8
57480	9	Módulo de Documentación da API	\N	2010-02-12 18:21:59.723	2010-02-14 10:21:59.723	\N	57495	\N	12
86369	3	Módulo de arquivo histórico	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86382	\N	13
86379	3	Módulo de extracción de informes	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86382	\N	14
85370	4	Administración de check-lists	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85373	\N	0
85371	4	Cubrir formularios de calidade en planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	1
85372	4	Incorporar listas de chequeo nos modelos de planificación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85373	\N	2
85368	4	Informe de necesidades de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85369	\N	0
85363	4	Interpolación polinómica na asignación avanzada	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85365	\N	0
85364	4	Asignación avanzada asignación automática configuración	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85365	\N	1
85387	4	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85389	\N	0
85388	4	Imprimir información pantalla do planificador	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85389	\N	1
85381	4	Definir workflow de pedidos para ERP	\N	2010-04-21 00:00:00	2010-04-21 15:00:00	\N	85386	\N	0
85382	4	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85386	\N	1
85383	4	Formato de intercambio de información de avance	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85386	\N	2
85384	4	Formato de intercambio de recursos	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85386	\N	3
85385	4	Formato de intercambio de materiais	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85386	\N	4
85374	4	Administración das subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85380	\N	0
85376	4	Fluxo de importación/exportación	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	2
85377	4	Interfaz de xestión de Subcontratación no pedido	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85380	\N	3
85378	4	Convertir en fitos as subcontratacións	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85380	\N	4
85379	4	Avance e curso de subcontratas en técnica de valor gañado	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85380	\N	5
56350	8	Formato de intercambio	\N	2010-02-12 18:21:59.723	2010-02-13 10:21:59.723	\N	56355	\N	1
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
85354	5	Módulo de organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-23 08:00:00	\N	85409	\N	1
85396	5	Módulo de arquivo histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85409	\N	13
85395	4	Pasar pedidos a histórico	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85396	\N	0
85357	5	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	2
85380	5	Módulo de integración con subcontratas	\N	2010-04-21 00:00:00	2010-04-23 16:00:00	\N	85409	\N	8
85407	6	Coordinación	\N	2010-04-19 00:00:00	2010-06-05 00:00:00	\N	85409	\N	15
86382	3	4º release Navalplan - 4	\N	2010-05-26 00:00:00	2010-06-05 16:00:00	2010-07-21	\N	\N	\N
85373	5	Módulo de xestión da calidade	\N	2010-04-21 00:00:00	2010-04-23 00:00:00	\N	85409	\N	7
85362	5	Módulo de planificación	\N	2010-04-21 00:00:00	2010-04-26 00:00:00	\N	85409	\N	3
85369	5	Módulo de materiais	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	6
85350	5	Módulo de xestión de usuarios	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	0
85367	5	Módulo de partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	5
85365	5	Módulo de asignación de recursos	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	4
85406	5	Módulo de extracción de informes	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85409	\N	14
85397	4	Integración de JasperRports	\N	2010-04-21 00:00:00	2010-04-21 16:00:00	\N	85406	\N	0
85398	4	Informes sobre organizacións de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	1
85399	4	Informes sobre partes de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	2
85400	4	Informes de horas traballadas por un traballador	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	3
85401	4	Lista de avances de planificación da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	4
85402	4	Lista de avances de traballo da empresa	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	5
85403	4	Informes de horas estimadas/horas realizadas	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	6
85404	4	Horas realizadas organizadas por tipo de traballo	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	7
85405	4	Informes de traballador indicando custos por hora	\N	2010-04-21 00:00:00	2010-04-22 00:00:00	\N	85406	\N	8
85394	5	Módulo de Documentación da API	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	12
86355	2	Formato de intercambio de pedidos e elementos de pedidos	\N	2010-05-26 00:00:00	2010-05-28 00:00:00	\N	86359	\N	1
86356	2	Formato de intercambio de información de avance	\N	2010-05-26 00:00:00	2010-05-27 16:00:00	\N	86359	\N	2
86357	2	Formato de intercambio de recursos	\N	2010-05-26 00:00:00	2010-05-27 00:00:00	\N	86359	\N	3
86358	2	Formato de intercambio de materiais	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86359	\N	4
85393	4	Documentación das APIs públicas	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85394	\N	0
56341	8	Procura de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	56342	\N	0
86360	2	Imprimir o diagrama de Gantt en varias páxinas	\N	2010-05-26 00:00:00	2010-05-28 16:00:00	\N	86362	\N	0
56345	8	Administración de check-lists	\N	2010-02-18 18:21:59.723	2010-02-20 18:21:59.723	\N	56348	\N	0
56346	8	Cubrir formularios de calidade en planificación	\N	2010-02-20 18:21:59.723	2010-02-22 02:21:59.723	\N	56348	\N	1
56347	8	Incorporar listas de chequeo nos modelos de planificación	\N	2010-02-22 02:21:59.723	2010-02-23 10:21:59.723	\N	56348	\N	2
86361	2	Imprimir información pantalla do planificador	\N	2010-05-26 00:00:00	2010-05-30 00:00:00	\N	86362	\N	1
57481	8	Pasar pedidos a histórico	\N	2010-02-14 10:21:59.723	2010-02-15 18:21:59.723	\N	57482	\N	0
85392	5	Módulo de arquitectura tecnolóxica	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85409	\N	11
57487	8	Lista de avances de planificación da empresa	\N	2010-02-19 10:21:59.723	2010-02-20 10:21:59.723	\N	57492	\N	4
57488	8	Lista de avances de traballo da empresa	\N	2010-02-20 10:21:59.723	2010-02-21 10:21:59.723	\N	57492	\N	5
57489	8	Informes de horas estimadas/horas realizadas	\N	2010-02-21 10:21:59.723	2010-02-22 10:21:59.723	\N	57492	\N	6
57490	8	Horas realizadas organizadas por tipo de traballo	\N	2010-02-15 10:21:59.723	2010-02-16 10:21:59.723	\N	57492	\N	7
57491	8	Informes de traballador indicando custos por hora	\N	2010-02-14 10:21:59.723	2010-02-15 10:21:59.723	\N	57492	\N	8
86363	2	Desenvolvemento de paquetes debian	\N	2010-05-26 00:00:00	2010-05-27 08:00:00	\N	86365	\N	0
56342	9	Módulo de partes de traballo	\N	2010-02-15 10:21:59.723	2010-02-17 02:21:59.723	\N	57495	\N	5
85390	4	Desenvolvemento de paquetes debian	\N	2010-04-21 00:00:00	2010-04-22 08:00:00	\N	85392	\N	0
85391	4	Enlazar a axuda de usuario	\N	2010-04-21 00:00:00	2010-04-22 16:00:00	\N	85392	\N	1
85389	5	Módulo de presentación	\N	2010-04-21 00:00:00	2010-04-25 00:00:00	\N	85409	\N	10
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
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
85345
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
3875	2	4712
3872	3	4713
3873	3	4714
3874	3	4715
3871	3	3697
3868	5	3698
3869	5	3699
3870	5	3700
56261	9	6300
56265	9	6305
56268	9	6321
56338	3	57212
56339	3	57213
56341	3	57215
56343	3	57217
56345	3	57219
56346	3	57220
56347	3	57221
56349	3	57223
56350	3	57224
56351	3	57225
56352	3	57226
56353	3	57227
56354	3	57228
56356	3	57230
56357	3	57231
57469	3	57232
57470	3	57233
57471	3	57234
56273	9	6339
56276	9	6353
56278	9	6674
56280	9	6676
56284	9	6815
56291	9	6818
56297	9	6825
56300	9	7072
56303	9	7075
56257	17	6301
56258	17	6302
56259	17	6303
56260	17	6304
56262	17	6306
56263	17	6307
56264	17	6320
56266	17	6322
56267	17	6323
56269	17	6340
56270	17	6341
56271	17	6342
57473	3	57236
57474	3	57237
57476	3	57239
57477	3	57240
57479	3	57242
57481	3	57244
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
86365	2	86188
86367	2	86191
86369	2	86193
86379	2	86195
56325	2	57194
86382	2	85840
56329	2	57199
85428	3	86163
85430	3	86165
56332	2	57203
85432	3	86167
85434	3	86169
85435	3	86170
85436	3	86171
56337	2	57206
85438	3	86173
85439	3	86174
56340	2	57211
85440	3	86175
56342	2	57214
86386	3	86214
86387	3	86208
86383	5	86215
85441	3	86176
56344	2	57216
85442	3	86177
85443	3	86178
85445	3	86180
56348	2	57218
86355	3	86181
86356	3	86182
56305	9	7078
56307	9	7081
56317	9	7115
56320	9	6275
56272	17	6343
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
86384	5	86216
86385	5	86217
85350	2	85511
85354	2	85516
85357	2	85520
85346	3	85512
85347	3	85513
85348	3	85514
85349	3	85515
85351	3	85517
85352	3	85518
85353	3	85519
56274	17	6354
56275	17	6355
56277	17	6675
56279	17	6677
56281	17	6678
56282	17	6816
56283	17	6817
56285	17	6819
56286	17	6820
56287	17	6821
56288	17	6822
56289	17	6823
56290	17	6824
56292	17	6826
56293	17	6827
56294	17	6828
56295	17	6829
56296	17	6830
85355	3	85521
85356	3	85522
56355	2	57222
57472	2	57229
57475	2	57235
57478	2	57238
57480	2	57241
57482	2	57243
56321	3	57195
56322	3	57196
56323	3	57197
56324	3	57198
56326	3	57200
56327	3	57201
56328	3	57202
56330	3	57204
56331	3	57205
56333	3	57207
56334	3	57208
56335	3	57209
56336	3	57210
56298	17	7073
56299	17	7074
56301	17	7076
56302	17	7077
56304	17	7079
56306	17	7082
56308	17	7116
56309	17	7117
56310	17	7084
56311	17	7080
56312	17	7118
56313	17	7119
56314	17	7120
56315	17	7121
56316	17	7122
56318	17	7123
56319	17	7124
85429	2	86161
85431	2	86164
85433	2	86166
85362	2	85523
57492	2	57245
85437	2	86168
57495	2	57193
57483	3	57246
57484	3	57247
57485	3	57248
57486	3	57249
57487	3	57250
57488	3	57251
57489	3	57252
57490	3	57253
57491	3	57254
57493	3	57255
57494	3	57256
85365	2	85528
85367	2	85531
85369	2	85533
85444	2	86172
85373	2	85535
86359	2	86179
86362	2	86185
85380	2	85539
85386	2	85546
85389	2	85754
85392	2	85757
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
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
1239	Desc.
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
83224	1	5999f2c5-73a9-4683-96b1-8986e24f98aa	\N	78780	1214	\N
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
83325	1	50acdf15-5d16-4d6c-9e9a-b2e8d25a83c3	100	2010-02-08 00:00:00	\N	\N	83224	1214	7115	6161
83326	1	bfdf9707-350e-4298-a3cf-531ea1aaa9a8	100	2010-02-08 00:00:00	\N	\N	83224	1214	7072	6161
83327	1	84da72ad-df75-48d1-9fe7-f8c343516ce0	100	2010-02-01 00:00:00	\N	\N	83224	1214	7075	6161
83328	1	5ae68c6a-b76d-4dde-ab4f-d850bd4768e1	70	2010-02-15 00:00:00	\N	\N	83224	1214	7079	6161
83329	1	31e0bea5-1b0d-4436-9b1c-d0f7b4d33e08	300	2010-02-08 00:00:00	\N	\N	83224	1214	7124	6161
83330	1	71eb4133-c6e6-478c-9ae7-d4bc0463c6b7	300	2010-02-08 00:00:00	\N	\N	83224	1214	7123	6161
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
5858	1	Nome1	cod1	t	t	f	0
78780	1	Tipo2	code	f	t	f	0
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

