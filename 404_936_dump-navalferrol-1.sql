--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT fkfd509405efda874f;
ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT fkfd509405b5c68337;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT fkfd423ff0f1a3177c;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT fkfd423ff0c1c2746e;
ALTER TABLE ONLY public.directadvanceassignment DROP CONSTRAINT fkfc7b7be6a1127ce5;
ALTER TABLE ONLY public.directadvanceassignment DROP CONSTRAINT fkfc7b7be62f2d3aec;
ALTER TABLE ONLY public.generic_resource_allocation DROP CONSTRAINT fkf788b34975ed79ba;
ALTER TABLE ONLY public.calendardata DROP CONSTRAINT fkf4bee428a44abee3;
ALTER TABLE ONLY public.calendardata DROP CONSTRAINT fkf4bee4287fa34e3f;
ALTER TABLE ONLY public.description_values_in_line DROP CONSTRAINT fkf2a5f7475c390c4;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT fkf0e85724eae850b2;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT fkf0e8572475ed79ba;
ALTER TABLE ONLY public.resource DROP CONSTRAINT fkef86282edc874c20;
ALTER TABLE ONLY public.stretches DROP CONSTRAINT fkee374673ae0677b8;
ALTER TABLE ONLY public.subcontractedtaskdata DROP CONSTRAINT fkecc61140aef2ac0;
ALTER TABLE ONLY public.subcontractedtaskdata DROP CONSTRAINT fkecc6114019960f43;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fkeb02c3f1f1a3177c;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fkeb02c3f1efda874f;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fkeb02c3f1e7e1020b;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT fkeb02c3f148d21790;
ALTER TABLE ONLY public.quality_form_items DROP CONSTRAINT fke9754bc58b37665c;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT fke562c7e93fee60cc;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT fke3758148d5b6184d;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT fke3758148c29ad8eb;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT fke203860efda874f;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT fke203860c1c2746e;
ALTER TABLE ONLY public.advanceassignmenttemplate DROP CONSTRAINT fkdfdb0269b216ed4c;
ALTER TABLE ONLY public.advanceassignmenttemplate DROP CONSTRAINT fkdfdb026919b9dfde;
ALTER TABLE ONLY public.orderelement DROP CONSTRAINT fkdbbb4feed97bcc8c;
ALTER TABLE ONLY public.orderelement DROP CONSTRAINT fkdbbb4fee1e635c19;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkd9f8f120c1c2746e;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkd9f8f120707cd777;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT fkd9f8f120131853a1;
ALTER TABLE ONLY public.machineworkerassignment DROP CONSTRAINT fkd7d7eb129bebcf10;
ALTER TABLE ONLY public.machineworkerassignment DROP CONSTRAINT fkd7d7eb1286b2de7a;
ALTER TABLE ONLY public.orderlinegrouptemplate DROP CONSTRAINT fkd3056ef7ddc82952;
ALTER TABLE ONLY public.hoursgroup DROP CONSTRAINT fkcf1f2cd08bdc6ac6;
ALTER TABLE ONLY public.hoursgroup DROP CONSTRAINT fkcf1f2cd01ed629ea;
ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkc6c799292c57f12a;
ALTER TABLE ONLY public.profile_roles DROP CONSTRAINT fkc5b10467f3909054;
ALTER TABLE ONLY public.hoursperday DROP CONSTRAINT fkc001d52efd5e49bc;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f50b1524a73;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f506394139;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f5048d21790;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT fkbb493f501b8e7cf2;
ALTER TABLE ONLY public.advancemeasurement DROP CONSTRAINT fkbb2f91faa9e53843;
ALTER TABLE ONLY public.advancemeasurement DROP CONSTRAINT fkbb2f91fa2f2d3aec;
ALTER TABLE ONLY public.tasksource DROP CONSTRAINT fkb05e6e2067faf86e;
ALTER TABLE ONLY public.tasksource DROP CONSTRAINT fkb05e6e203d72bc6f;
ALTER TABLE ONLY public.task_quality_form_items DROP CONSTRAINT fkadeba4bf87fa6b5d;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT fka9542ec3c1c2746e;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT fka9542ec319b9dfde;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fka87c3108edc4db41;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fka87c310887287288;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT fka87c31085567ad13;
ALTER TABLE ONLY public.configuration DROP CONSTRAINT fka2d2a4d6cc119699;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT fka01fe4eee036cfed;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT fka01fe4ee8c80ccb7;
ALTER TABLE ONLY public.calendaravailability DROP CONSTRAINT fka01aabd9a44abee3;
ALTER TABLE ONLY public.orderelementtemplate DROP CONSTRAINT fk9bb0b28841638aab;
ALTER TABLE ONLY public.worker DROP CONSTRAINT fk9ac73f9e40901220;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT fk991fddeedc4db41;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT fk991fdde5567ad13;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT fk95548d7875999a91;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT fk95548d7861f02c44;
ALTER TABLE ONLY public.machine DROP CONSTRAINT fk9469dc27937680b7;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT fk8e542e813a156175;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT fk8e542e8114a5c61;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT fk8ca52236c29ad8eb;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT fk8ca5223648d21790;
ALTER TABLE ONLY public.material_category DROP CONSTRAINT fk8746516b53669f2;
ALTER TABLE ONLY public.description_values DROP CONSTRAINT fk82ca26e5fec79eb0;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT fk8217a424b216ed4c;
ALTER TABLE ONLY public.taskgroup DROP CONSTRAINT fk80e79bda4936bb8c;
ALTER TABLE ONLY public.advanceassignment DROP CONSTRAINT fk808010cfb216ed4c;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT fk7daad5cdc1c2746e;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT fk7daad5cd5078e161;
ALTER TABLE ONLY public.orderlinegroup DROP CONSTRAINT fk7d2eeb5d97b1c209;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT fk79800350b1524a73;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT fk7980035061f02c44;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39df82680f8;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39da44abee3;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT fk75a2f39d4ec080cf;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT fk7540af6be838f362;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT fk7540af6b1545e7a;
ALTER TABLE ONLY public.taskelement DROP CONSTRAINT fk70d5d997a5f3c581;
ALTER TABLE ONLY public.taskelement DROP CONSTRAINT fk70d5d997a44abee3;
ALTER TABLE ONLY public.taskmilestone DROP CONSTRAINT fk62b2994b4936bb8c;
ALTER TABLE ONLY public.orderline DROP CONSTRAINT fk6017744297b1c209;
ALTER TABLE ONLY public.line_field DROP CONSTRAINT fk5c13eccf415884f6;
ALTER TABLE ONLY public.stretchesfunction DROP CONSTRAINT fk593d3b4b1a5e11f8;
ALTER TABLE ONLY public.resourcecalendar DROP CONSTRAINT fk5863798ca44abee3;
ALTER TABLE ONLY public.virtualworker DROP CONSTRAINT fk5280da49161d6c65;
ALTER TABLE ONLY public.ordertemplate DROP CONSTRAINT fk4d68b9c8a44abee3;
ALTER TABLE ONLY public.ordertemplate DROP CONSTRAINT fk4d68b9c89a4a7d90;
ALTER TABLE ONLY public.orderlinetemplate DROP CONSTRAINT fk4a1d42dc9fb7fc18;
ALTER TABLE ONLY public.label DROP CONSTRAINT fk44d86d4707cd777;
ALTER TABLE ONLY public.resourceallocation DROP CONSTRAINT fk41e073aeff61540d;
ALTER TABLE ONLY public.resourceallocation DROP CONSTRAINT fk41e073ae15671e92;
ALTER TABLE ONLY public.material DROP CONSTRAINT fk407955279578651e;
ALTER TABLE ONLY public.machineworkersconfigurationunit DROP CONSTRAINT fk401dc6acffeb5538;
ALTER TABLE ONLY public.criterionsatisfaction DROP CONSTRAINT fk3f30d9adeae850b2;
ALTER TABLE ONLY public.criterionsatisfaction DROP CONSTRAINT fk3f30d9ad8c4c676c;
ALTER TABLE ONLY public.indirectadvanceassignment DROP CONSTRAINT fk3d1ffd218202350f;
ALTER TABLE ONLY public.indirectadvanceassignment DROP CONSTRAINT fk3d1ffd212f2d3aec;
ALTER TABLE ONLY public.indirectadvanceassignment DROP CONSTRAINT fk3d1ffd21218d7620;
ALTER TABLE ONLY public.derivedallocation DROP CONSTRAINT fk3afdc2bd87b470f0;
ALTER TABLE ONLY public.derivedallocation DROP CONSTRAINT fk3afdc2bd75ed79ba;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT fk3a79eb02f41d57f2;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT fk3a79eb02efda874f;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT fk3a79eb02e036cfed;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT fk3a79eb0261f02c44;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT fk3a79eb0219b9dfde;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT fk29d001558b37665c;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT fk29d0015519b9dfde;
ALTER TABLE ONLY public.task DROP CONSTRAINT fk27a9a55b595a0;
ALTER TABLE ONLY public.task DROP CONSTRAINT fk27a9a54936bb8c;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT fk1ccb0f74b5c68337;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT fk1ccb0f7419b9dfde;
ALTER TABLE ONLY public.calendarexception DROP CONSTRAINT fk1a9afa91adad7e51;
ALTER TABLE ONLY public.calendarexception DROP CONSTRAINT fk1a9afa91a44abee3;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fk1a95a222efda874f;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fk1a95a22248d21790;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT fk1a95a222131853a1;
ALTER TABLE ONLY public.heading_field DROP CONSTRAINT fk1961a43d415884f6;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT fk109ac09eefda874f;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT fk109ac09e8b37665c;
ALTER TABLE ONLY public.workreportslines_labels DROP CONSTRAINT workreportslines_labels_pkey;
ALTER TABLE ONLY public.workreports_labels DROP CONSTRAINT workreports_labels_pkey;
ALTER TABLE ONLY public.worker DROP CONSTRAINT worker_pkey;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_pkey;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_name_key;
ALTER TABLE ONLY public.work_report_type DROP CONSTRAINT work_report_type_code_key;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT work_report_pkey;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT work_report_line_pkey;
ALTER TABLE ONLY public.work_report_line DROP CONSTRAINT work_report_line_code_key;
ALTER TABLE ONLY public.work_report_label_type_assigment DROP CONSTRAINT work_report_label_type_assigment_pkey;
ALTER TABLE ONLY public.work_report DROP CONSTRAINT work_report_code_key;
ALTER TABLE ONLY public.virtualworker DROP CONSTRAINT virtualworker_pkey;
ALTER TABLE ONLY public.user_profiles DROP CONSTRAINT user_profiles_pkey;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_pkey;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_name_key;
ALTER TABLE ONLY public.type_of_work_hours DROP CONSTRAINT type_of_work_hours_code_key;
ALTER TABLE ONLY public.tasksource DROP CONSTRAINT tasksource_pkey;
ALTER TABLE ONLY public.tasksource DROP CONSTRAINT tasksource_orderelement_key;
ALTER TABLE ONLY public.taskmilestone DROP CONSTRAINT taskmilestone_pkey;
ALTER TABLE ONLY public.taskgroup DROP CONSTRAINT taskgroup_pkey;
ALTER TABLE ONLY public.taskelement DROP CONSTRAINT taskelement_pkey;
ALTER TABLE ONLY public.task DROP CONSTRAINT task_subcontrated_task_data_id_key;
ALTER TABLE ONLY public.task_source_hours_groups DROP CONSTRAINT task_source_hours_groups_pkey;
ALTER TABLE ONLY public.task_quality_form DROP CONSTRAINT task_quality_form_pkey;
ALTER TABLE ONLY public.task_quality_form_items DROP CONSTRAINT task_quality_form_items_pkey;
ALTER TABLE ONLY public.task DROP CONSTRAINT task_pkey;
ALTER TABLE ONLY public.subcontractedtaskdata DROP CONSTRAINT subcontractedtaskdata_task_element_id_key;
ALTER TABLE ONLY public.subcontractedtaskdata DROP CONSTRAINT subcontractedtaskdata_pkey;
ALTER TABLE ONLY public.stretchesfunction DROP CONSTRAINT stretchesfunction_pkey;
ALTER TABLE ONLY public.stretches DROP CONSTRAINT stretches_pkey;
ALTER TABLE ONLY public.specific_resource_allocation DROP CONSTRAINT specific_resource_allocation_pkey;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT resources_cost_category_assignment_pkey;
ALTER TABLE ONLY public.resources_cost_category_assignment DROP CONSTRAINT resources_cost_category_assignment_code_key;
ALTER TABLE ONLY public.resourcecalendar DROP CONSTRAINT resourcecalendar_pkey;
ALTER TABLE ONLY public.resourceallocation DROP CONSTRAINT resourceallocation_pkey;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_pkey;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_code_key;
ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_base_calendar_id_key;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT quality_form_pkey;
ALTER TABLE ONLY public.quality_form DROP CONSTRAINT quality_form_name_key;
ALTER TABLE ONLY public.quality_form_items DROP CONSTRAINT quality_form_items_pkey;
ALTER TABLE ONLY public.ordertemplate DROP CONSTRAINT ordertemplate_pkey;
ALTER TABLE ONLY public.ordersequence DROP CONSTRAINT ordersequence_pkey;
ALTER TABLE ONLY public.orderlinetemplate DROP CONSTRAINT orderlinetemplate_pkey;
ALTER TABLE ONLY public.orderlinegrouptemplate DROP CONSTRAINT orderlinegrouptemplate_pkey;
ALTER TABLE ONLY public.orderlinegroup DROP CONSTRAINT orderlinegroup_pkey;
ALTER TABLE ONLY public.orderline DROP CONSTRAINT orderline_pkey;
ALTER TABLE ONLY public.orderelementtemplate DROP CONSTRAINT orderelementtemplate_pkey;
ALTER TABLE ONLY public.orderelement DROP CONSTRAINT orderelement_pkey;
ALTER TABLE ONLY public.orderelement DROP CONSTRAINT orderelement_code_key;
ALTER TABLE ONLY public.order_table DROP CONSTRAINT order_table_pkey;
ALTER TABLE ONLY public.order_element_template_quality_form DROP CONSTRAINT order_element_template_quality_form_pkey;
ALTER TABLE ONLY public.order_element_template_label DROP CONSTRAINT order_element_template_label_pkey;
ALTER TABLE ONLY public.order_element_label DROP CONSTRAINT order_element_label_pkey;
ALTER TABLE ONLY public.order_authorization DROP CONSTRAINT order_authorization_pkey;
ALTER TABLE ONLY public.naval_user DROP CONSTRAINT naval_user_pkey;
ALTER TABLE ONLY public.naval_user DROP CONSTRAINT naval_user_loginname_key;
ALTER TABLE ONLY public.naval_profile DROP CONSTRAINT naval_profile_profilename_key;
ALTER TABLE ONLY public.naval_profile DROP CONSTRAINT naval_profile_pkey;
ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
ALTER TABLE ONLY public.material DROP CONSTRAINT material_code_key;
ALTER TABLE ONLY public.material_category DROP CONSTRAINT material_category_pkey;
ALTER TABLE ONLY public.material_assigment_template DROP CONSTRAINT material_assigment_template_pkey;
ALTER TABLE ONLY public.material_assigment DROP CONSTRAINT material_assigment_pkey;
ALTER TABLE ONLY public.machineworkersconfigurationunit DROP CONSTRAINT machineworkersconfigurationunit_pkey;
ALTER TABLE ONLY public.machineworkerassignment DROP CONSTRAINT machineworkerassignment_pkey;
ALTER TABLE ONLY public.machine DROP CONSTRAINT machine_pkey;
ALTER TABLE ONLY public.machine_configuration_unit_required_criterions DROP CONSTRAINT machine_configuration_unit_required_criterions_pkey;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_pkey;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_name_key;
ALTER TABLE ONLY public.label_type DROP CONSTRAINT label_type_code_key;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_pkey;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_name_key;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_code_key;
ALTER TABLE ONLY public.indirectadvanceassignment DROP CONSTRAINT indirectadvanceassignment_pkey;
ALTER TABLE ONLY public.hoursperday DROP CONSTRAINT hoursperday_pkey;
ALTER TABLE ONLY public.hoursgroup DROP CONSTRAINT hoursgroup_pkey;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT hour_cost_pkey;
ALTER TABLE ONLY public.hour_cost DROP CONSTRAINT hour_cost_code_key;
ALTER TABLE ONLY public.generic_resource_allocation DROP CONSTRAINT generic_resource_allocation_pkey;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_pkey;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_nif_key;
ALTER TABLE ONLY public.external_company DROP CONSTRAINT external_company_name_key;
ALTER TABLE ONLY public.directadvanceassignment DROP CONSTRAINT directadvanceassignment_pkey;
ALTER TABLE ONLY public.derivedallocation DROP CONSTRAINT derivedallocation_pkey;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT dependency_pkey;
ALTER TABLE ONLY public.day_assignment DROP CONSTRAINT day_assignment_pkey;
ALTER TABLE ONLY public.criteriontype DROP CONSTRAINT criteriontype_pkey;
ALTER TABLE ONLY public.criteriontype DROP CONSTRAINT criteriontype_name_key;
ALTER TABLE ONLY public.criteriontype DROP CONSTRAINT criteriontype_code_key;
ALTER TABLE ONLY public.criterionsatisfaction DROP CONSTRAINT criterionsatisfaction_pkey;
ALTER TABLE ONLY public.criterionsatisfaction DROP CONSTRAINT criterionsatisfaction_code_key;
ALTER TABLE ONLY public.criterionrequirement DROP CONSTRAINT criterionrequirement_pkey;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_pkey;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_name_key;
ALTER TABLE ONLY public.criterion DROP CONSTRAINT criterion_code_key;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_pkey;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_name_key;
ALTER TABLE ONLY public.cost_category DROP CONSTRAINT cost_category_code_key;
ALTER TABLE ONLY public.configuration DROP CONSTRAINT configuration_pkey;
ALTER TABLE ONLY public.calendarexceptiontype DROP CONSTRAINT calendarexceptiontype_pkey;
ALTER TABLE ONLY public.calendarexceptiontype DROP CONSTRAINT calendarexceptiontype_name_key;
ALTER TABLE ONLY public.calendarexceptiontype DROP CONSTRAINT calendarexceptiontype_code_key;
ALTER TABLE ONLY public.calendarexception DROP CONSTRAINT calendarexception_pkey;
ALTER TABLE ONLY public.calendardata DROP CONSTRAINT calendardata_pkey;
ALTER TABLE ONLY public.calendaravailability DROP CONSTRAINT calendaravailability_pkey;
ALTER TABLE ONLY public.basecalendar DROP CONSTRAINT basecalendar_pkey;
ALTER TABLE ONLY public.assignment_function DROP CONSTRAINT assignment_function_pkey;
ALTER TABLE ONLY public.all_criterions DROP CONSTRAINT all_criterions_pkey;
ALTER TABLE ONLY public.advancetype DROP CONSTRAINT advancetype_unitname_key;
ALTER TABLE ONLY public.advancetype DROP CONSTRAINT advancetype_pkey;
ALTER TABLE ONLY public.advancemeasurement DROP CONSTRAINT advancemeasurement_pkey;
ALTER TABLE ONLY public.advanceassignmenttemplate DROP CONSTRAINT advanceassignmenttemplate_pkey;
ALTER TABLE ONLY public.advanceassignment DROP CONSTRAINT advanceassignment_pkey;
DROP TABLE public.workreportslines_labels;
DROP TABLE public.workreports_labels;
DROP TABLE public.worker;
DROP TABLE public.work_report_type;
DROP TABLE public.work_report_line;
DROP TABLE public.work_report_label_type_assigment;
DROP TABLE public.work_report;
DROP TABLE public.virtualworker;
DROP TABLE public.user_roles;
DROP TABLE public.user_profiles;
DROP TABLE public.type_of_work_hours;
DROP TABLE public.tasksource;
DROP TABLE public.taskmilestone;
DROP TABLE public.taskgroup;
DROP TABLE public.taskelement;
DROP TABLE public.task_source_hours_groups;
DROP TABLE public.task_quality_form_items;
DROP TABLE public.task_quality_form;
DROP TABLE public.task;
DROP TABLE public.subcontractedtaskdata;
DROP TABLE public.stretchesfunction;
DROP TABLE public.stretches;
DROP TABLE public.specific_resource_allocation;
DROP TABLE public.resources_cost_category_assignment;
DROP TABLE public.resourcecalendar;
DROP TABLE public.resourceallocation;
DROP TABLE public.resource;
DROP TABLE public.quality_form_items;
DROP TABLE public.quality_form;
DROP TABLE public.profile_roles;
DROP TABLE public.ordertemplate;
DROP TABLE public.ordersequence;
DROP TABLE public.orderlinetemplate;
DROP TABLE public.orderlinegrouptemplate;
DROP TABLE public.orderlinegroup;
DROP TABLE public.orderline;
DROP TABLE public.orderelementtemplate;
DROP TABLE public.orderelement;
DROP TABLE public.order_table;
DROP TABLE public.order_element_template_quality_form;
DROP TABLE public.order_element_template_label;
DROP TABLE public.order_element_label;
DROP TABLE public.order_authorization;
DROP TABLE public.naval_user;
DROP TABLE public.naval_profile;
DROP TABLE public.material_category;
DROP TABLE public.material_assigment_template;
DROP TABLE public.material_assigment;
DROP TABLE public.material;
DROP TABLE public.machineworkersconfigurationunit;
DROP TABLE public.machineworkerassignment;
DROP TABLE public.machine_configuration_unit_required_criterions;
DROP TABLE public.machine;
DROP TABLE public.line_field;
DROP TABLE public.label_type;
DROP TABLE public.label;
DROP TABLE public.indirectadvanceassignment;
DROP TABLE public.hoursperday;
DROP TABLE public.hoursgroup;
DROP TABLE public.hour_cost;
DROP TABLE public.hibernate_unique_key;
DROP SEQUENCE public.hibernate_sequence;
DROP TABLE public.heading_field;
DROP TABLE public.generic_resource_allocation;
DROP TABLE public.external_company;
DROP TABLE public.directadvanceassignment;
DROP TABLE public.description_values_in_line;
DROP TABLE public.description_values;
DROP TABLE public.derivedallocation;
DROP TABLE public.dependency;
DROP TABLE public.day_assignment;
DROP TABLE public.criteriontype;
DROP TABLE public.criterionsatisfaction;
DROP TABLE public.criterionrequirement;
DROP TABLE public.criterion;
DROP TABLE public.cost_category;
DROP TABLE public.configuration;
DROP TABLE public.calendarexceptiontype;
DROP TABLE public.calendarexception;
DROP TABLE public.calendardata;
DROP TABLE public.calendaravailability;
DROP TABLE public.basecalendar;
DROP TABLE public.assignment_function;
DROP TABLE public.all_criterions;
DROP TABLE public.advancetype;
DROP TABLE public.advancemeasurement;
DROP TABLE public.advanceassignmenttemplate;
DROP TABLE public.advanceassignment;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
42312	4	t	707
57390	2	f	710
57389	3	t	710
40501	14	t	708
2223	18	f	707
42248	11	t	709
42254	10	t	709
42255	10	t	709
42249	11	t	709
42271	8	t	709
57394	6	t	710
57395	6	f	710
2828	16	f	707
57401	6	t	709
57402	6	t	709
57403	6	t	709
57404	6	f	709
57405	6	t	707
40502	14	t	708
42250	11	f	709
57396	6	f	710
57388	5	f	710
42311	8	t	707
57387	7	t	710
42256	6	t	708
2829	10	f	707
42268	5	t	709
42274	4	t	709
42269	5	f	709
2830	10	t	707
42310	3	t	709
57391	2	t	710
57392	2	f	710
2831	9	f	707
57393	2	f	710
42270	5	f	709
42257	6	t	708
57397	2	t	709
57398	2	t	709
57399	2	f	709
57400	2	t	707
\.


--
-- Data for Name: advanceassignmenttemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advanceassignmenttemplate (id, version, advance_type_id, order_element_template_id, reportglobaladvance, maxvalue) FROM stdin;
58295	1	709	58104	t	5.00
58296	1	709	58106	t	15.00
58292	2	709	58100	t	5.00
58293	2	709	58101	t	10.00
58294	2	709	58102	t	15.00
\.


--
-- Data for Name: advancemeasurement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancemeasurement (id, version, date, value, advance_assignment_id, communicationdate) FROM stdin;
40602	14	2010-03-15	25.00	40501	\N
42337	11	2010-03-30	2.00	42248	\N
42338	11	2010-03-02	1.00	42248	\N
42342	10	2010-04-02	3.00	42254	\N
42343	10	2010-03-31	5.00	42255	\N
42391	3	2010-03-18	20.00	57389	2010-03-18 19:10:19.12
42357	8	2010-03-18	10.00	42271	\N
42400	6	2010-03-15	30.00	57394	\N
42399	4	2010-04-18	90.00	57387	2010-03-18 19:17:29.138
42394	5	2010-03-27	40.00	57387	2010-03-18 19:17:29.138
42390	7	2010-03-18	30.00	57387	2010-03-18 19:17:29.138
42344	6	2010-03-15	25.00	42256	\N
42355	5	2010-03-30	2.00	42268	\N
42356	5	2010-03-02	1.00	42268	\N
42360	4	2010-03-31	5.00	42274	\N
42376	3	2010-03-18	4.00	42310	\N
42392	2	2010-03-15	30.00	57391	\N
\.


--
-- Data for Name: advancetype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY advancetype (id, version, unitname, defaultmaxvalue, updatable, unitprecision, active, percentage, qualityform) FROM stdin;
707	4	children	100.0000	f	0.0100	t	t	f
708	3	percentage	100.0000	f	0.0100	t	t	f
709	2	units	2147483647.0000	f	1.0000	t	f	f
710	1	subcontractor	100.0000	f	0.0100	t	t	f
58580	1	QF: Formulario de calidad Grupo 1	100.0000	f	0.0100	t	t	t
\.


--
-- Data for Name: all_criterions; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY all_criterions (generic_resource_allocation_id, criterion_id) FROM stdin;
4698	1241
4698	1214
19097	1242
19097	1214
19098	1214
19098	1242
19117	1242
19117	1215
19139	1214
19139	1241
19140	1241
19140	1214
19141	1241
19141	1212
19142	1241
19142	1212
19143	1241
19143	1212
\.


--
-- Data for Name: assignment_function; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY assignment_function (id, version) FROM stdin;
47270	3
47274	5
47271	9
\.


--
-- Data for Name: basecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY basecalendar (id, version, name) FROM stdin;
1	1	Default
1329	9	\N
1333	3	\N
1314	2	España
1319	3	Calendario Andalucía jornada laboral
1320	2	Andalucía media xornada
1321	1	Galicia jornada completa
1322	1	Calendario Asturias
1318	2	Galicia media xornada
1323	1	Galicia media xornada 2
1325	1	\N
1324	4	\N
1326	1	\N
1328	1	\N
1330	1	\N
1334	1	\N
1327	6	\N
1331	3	\N
1336	7	\N
1332	17	\N
1335	21	Calendario de maria perez
\.


--
-- Data for Name: calendaravailability; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendaravailability (id, version, startdate, enddate, base_calendar_id, position_in_calendar) FROM stdin;
1925	9	2010-03-08	\N	1329	0
1929	3	2010-03-01	\N	1333	0
1921	1	2010-03-11	\N	1325	0
1920	3	2010-03-12	\N	1324	0
1922	1	2010-03-11	\N	1326	0
1924	1	2010-03-11	\N	1328	0
1926	1	2010-03-11	\N	1330	0
1930	1	2010-03-11	\N	1334	0
1931	1	2010-03-29	2010-09-29	1327	0
1927	3	2010-03-15	2011-09-15	1331	0
1933	7	2010-03-01	\N	1336	0
1928	17	2010-03-08	\N	1332	0
11009	17	2010-04-01	\N	1335	0
\.


--
-- Data for Name: calendardata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendardata (id, version, parent, expiringdate, base_calendar_id, position_in_calendar) FROM stdin;
101	1	\N	\N	1	0
1435	1	1314	\N	1330	0
1415	2	\N	2010-03-12	1314	0
1420	1	\N	\N	1314	1
1421	3	1314	\N	1319	0
1422	2	1314	\N	1320	0
1423	1	1314	\N	1321	0
1439	1	1318	\N	1334	0
1432	6	1314	\N	1327	0
1424	1	1314	\N	1322	0
1419	2	1314	2010-03-18	1318	0
1425	1	1314	\N	1318	1
1426	1	1314	2010-03-18	1323	0
1427	1	1314	\N	1323	1
1430	1	1314	\N	1325	0
1428	4	1314	2010-03-12	1324	0
1429	3	1323	\N	1324	1
1431	1	1314	\N	1326	0
1436	3	1321	\N	1331	0
1433	1	1314	\N	1328	0
1434	9	1322	\N	1329	0
1438	3	1322	\N	1333	0
1441	7	1321	\N	1336	0
1437	17	1321	\N	1332	0
1440	21	1318	\N	1335	0
\.


--
-- Data for Name: calendarexception; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY calendarexception (id, version, date, hours, calendar_exception_id, base_calendar_id) FROM stdin;
1518	2	2010-05-03	0	610	1319
1520	2	2010-12-24	4	611	1319
1519	2	2010-12-31	4	611	1319
1521	1	2010-12-24	0	610	1320
1522	1	2010-12-31	0	610	1320
1523	1	2010-05-17	0	610	1321
1524	1	2010-12-31	4	611	1321
1525	1	2010-12-24	4	611	1321
1526	1	2010-09-08	0	608	1322
1527	1	2010-12-24	0	610	1322
1528	1	2010-12-31	0	610	1322
1537	2	2010-07-04	0	606	1331
1540	2	2010-07-03	0	606	1331
1542	2	2010-06-28	0	606	1331
1539	2	2010-07-01	0	606	1331
1536	2	2010-06-30	0	606	1331
1538	2	2010-06-29	0	606	1331
1541	2	2010-07-02	0	606	1331
1535	8	2010-06-21	0	606	1329
1529	8	2010-06-26	0	606	1329
1533	8	2010-06-24	0	606	1329
1532	8	2010-06-25	0	606	1329
1531	8	2010-06-27	0	606	1329
1530	8	2010-06-23	0	606	1329
1534	8	2010-06-22	0	606	1329
1549	16	2010-04-11	0	606	1332
1556	20	2010-05-08	0	606	1335
1555	20	2010-05-05	0	606	1335
1553	20	2010-05-03	0	606	1335
1552	20	2010-05-06	0	606	1335
1551	20	2010-05-04	0	606	1335
1550	20	2010-05-09	0	606	1335
1554	20	2010-05-07	0	606	1335
1547	16	2010-04-05	0	606	1332
1548	16	2010-04-09	0	606	1332
1544	16	2010-04-08	0	606	1332
1546	16	2010-04-06	0	606	1332
1543	16	2010-04-07	0	606	1332
1545	16	2010-04-10	0	606	1332
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
202	5	1314	A0001	\N	\N	\N	\N
\.


--
-- Data for Name: cost_category; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY cost_category (id, version, name, enabled, code) FROM stdin;
59085	1	Operarios con menos de 5 años de experiencia	t	aedefac3-741b-4308-af96-72f481cd942b
\.


--
-- Data for Name: criterion; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterion (id, version, code, name, active, id_criterion_type, parent) FROM stdin;
505	14	57f162da-57d4-4afc-a491-d65633f4e2fa	medicalLeave	t	131072	\N
506	13	c52a063b-a3e2-4f09-b5ff-ac845d9d4699	paternityLeave	t	131072	\N
507	4	4574e667-4cf8-4956-8702-bd7126404f43	hiredResourceWorkingRelationship	t	131076	\N
508	3	9abc6f99-e04d-428e-9c26-8bf6ff4571e4	firedResourceWorkingRelationship	t	131076	\N
1212	1	c56f6d50-e6dc-4890-9d1b-7c16485b50ba	Soldador	t	360448	\N
1213	1	512b906b-01a9-4362-8740-44627d8024ff	Electricista	t	360448	\N
1214	1	6537ad31-9bf5-4ce8-9ad3-f5692b183907	Carpintero	t	360448	\N
1215	1	1db71307-f7f9-4527-9ce9-b40430a99a70	Pintor	t	360448	\N
1216	1	fe26d5fb-dcd5-4383-b642-ad59a5fde2fc	Califugador	t	360448	\N
1217	1	b32dde75-3760-4e26-81ce-4f467e91eccf	Soldador submarino	t	360448	\N
1238	1	891872bd-d7e3-4e1e-9f46-c1e15efc155a	Pase entrada Navantia	t	360452	\N
1220	2	ebcce42f-410e-42eb-accb-65f9487075c9	Soldadura tercer nivel	t	360449	\N
1218	2	6da081fc-b7f0-4102-9449-78e74990d30a	Soldadura segundo nivel	t	360449	\N
1219	2	7df58204-20ce-45bb-9810-1d9c5f241d99	Soldadura primer nivel	t	360449	\N
1223	1	35d29b8f-8f17-492f-aaf4-a22e349f2bbe	España	t	360450	\N
1222	1	823f80ec-35f1-4a31-9cd9-b99562b28977	Cádiz	t	360450	1221
1224	1	bbb5b6f4-9871-45b6-9d4c-6001893c204e	Galicia	t	360450	1223
1227	1	fbb82690-d467-4e0b-897a-b20a2ef336fa	País Vasco	t	360450	1223
1221	1	9e2e5716-2506-46ec-903a-16cff5086432	Andalucía	t	360450	1223
1225	1	9cf38251-0d78-43fa-a0db-45cd10faa016	Vigo	t	360450	1224
1226	1	2d16207a-4a3c-40bc-b2f5-c1e156d2157f	Ferrol	t	360450	1224
1228	1	da30371d-9ee0-48ce-90a0-ce22cb2ca647	San Sebastián	t	360450	1227
1229	1	5b9caf3f-3494-44f5-bbbf-938cb8be4a30	Por obra	t	360451	\N
1230	1	eb6ce14a-47fd-41b8-92c4-b93da9773e72	Temporal	t	360451	\N
1231	1	a7957e63-3529-4bce-9d6e-bd9f2281729b	Indefinido	t	360451	\N
1232	1	4ecf8514-bdee-4652-8756-32fa986f7f78	En prácticas segundo ano	t	360451	\N
1233	1	3c16897b-4c20-4a78-99c9-8b9c507cfc92	En practicas primeiro ano	t	360451	\N
1234	1	276363ac-691a-4dd6-ad68-e4be8473785c	Pase entrada Barreras	t	360452	\N
1235	1	75eb759a-8afa-41b1-8e8d-346c8eaa169d	Certificado médico 2009	t	360452	\N
1236	1	6a050637-a254-472f-a287-766a78b85a15	Cetificado médico 2010	t	360452	\N
1237	1	132be233-c742-406a-baa4-8f2eafd09faa	Pase entrada Vulcano	t	360452	\N
1241	2	9d537872-05de-490f-bb9a-c49a67aadfc5	Grupo 1	t	360453	\N
1242	2	378f9411-15cd-4b17-9298-89fe332da3bb	Grupo 3	t	360453	\N
1243	2	862aa7ff-e371-4559-aff7-84ea59a74d4d	Grupo 2	t	360453	\N
1240	2	476ce21b-fc92-4ae3-999f-bf4e41ec5fce	Grupo 5	t	360453	\N
1239	2	3d45897a-ef64-4a3e-8675-c5dfc26e6797	Grupo 4	t	360453	\N
\.


--
-- Data for Name: criterionrequirement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionrequirement (id, criterion_requirement_type, version, hours_group_id, order_element_id, order_element_template_id, criterion_id, parent, valid) FROM stdin;
3403	DIRECT	15	\N	2123	\N	1241	\N	\N
3404	INDIRECT	15	\N	2124	\N	1241	3403	t
3405	INDIRECT	15	2323	\N	\N	1241	3403	t
3406	INDIRECT	15	\N	2125	\N	1241	3403	t
3407	INDIRECT	15	2324	\N	\N	1241	3403	t
3408	DIRECT	15	\N	2126	\N	1241	\N	\N
3409	INDIRECT	15	\N	2630	\N	1241	3408	t
3410	DIRECT	15	\N	2630	\N	1212	\N	\N
3411	INDIRECT	15	2731	\N	\N	1241	3408	t
3412	INDIRECT	15	2731	\N	\N	1212	3410	t
3414	DIRECT	15	\N	2631	\N	1212	\N	\N
3413	INDIRECT	15	\N	2631	\N	1241	3408	t
3416	INDIRECT	15	2732	\N	\N	1241	3408	t
3415	INDIRECT	15	2732	\N	\N	1212	3414	t
3417	DIRECT	15	\N	2632	\N	1212	\N	\N
3418	INDIRECT	15	\N	2632	\N	1241	3408	t
3419	INDIRECT	15	2733	\N	\N	1241	3408	t
3420	INDIRECT	15	2733	\N	\N	1212	3417	t
3421	DIRECT	15	\N	2633	\N	1241	\N	\N
3423	INDIRECT	15	\N	2634	\N	1241	3421	t
3422	DIRECT	15	\N	2634	\N	1214	\N	\N
3425	INDIRECT	15	2734	\N	\N	1214	3422	t
3424	INDIRECT	15	2734	\N	\N	1241	3421	t
3427	DIRECT	15	\N	2635	\N	1214	\N	\N
3426	INDIRECT	15	\N	2635	\N	1241	3421	t
3428	INDIRECT	15	2735	\N	\N	1241	3421	t
3429	INDIRECT	15	2735	\N	\N	1214	3427	t
3430	INDIRECT	15	\N	2636	\N	1241	3421	t
3431	DIRECT	15	\N	2636	\N	1214	\N	\N
3433	INDIRECT	15	2736	\N	\N	1214	3431	t
3724	DIRECT	8	\N	2133	\N	1242	\N	\N
3725	INDIRECT	8	\N	2641	\N	1242	3724	t
3726	INDIRECT	8	\N	2638	\N	1242	3724	t
3727	INDIRECT	8	2738	\N	\N	1242	3724	t
3728	INDIRECT	8	\N	2637	\N	1242	3724	t
3729	INDIRECT	8	2737	\N	\N	1242	3724	t
3731	INDIRECT	8	\N	2642	\N	1242	3724	t
3730	DIRECT	8	\N	2642	\N	1215	\N	\N
3732	INDIRECT	8	\N	2640	\N	1215	3730	t
3733	INDIRECT	8	\N	2640	\N	1242	3724	t
3734	INDIRECT	8	2740	\N	\N	1242	3724	t
3735	INDIRECT	8	2740	\N	\N	1215	3730	t
3737	INDIRECT	8	\N	2639	\N	1242	3724	t
3736	INDIRECT	8	\N	2639	\N	1215	3730	t
3738	INDIRECT	8	2739	\N	\N	1242	3724	t
3739	INDIRECT	8	2739	\N	\N	1215	3730	t
3740	INDIRECT	8	\N	2643	\N	1242	3724	t
3741	INDIRECT	8	\N	2643	\N	1215	3730	t
3743	INDIRECT	8	2741	\N	\N	1242	3724	t
3742	INDIRECT	8	2741	\N	\N	1215	3730	t
3744	INDIRECT	8	\N	2644	\N	1242	3724	t
3745	DIRECT	8	\N	2644	\N	1214	\N	\N
3746	INDIRECT	8	\N	2645	\N	1214	3745	t
3747	INDIRECT	8	\N	2645	\N	1242	3724	t
3749	INDIRECT	8	2742	\N	\N	1242	3724	t
3748	INDIRECT	8	2742	\N	\N	1214	3745	t
3750	INDIRECT	8	\N	2646	\N	1242	3724	t
3751	INDIRECT	8	\N	2646	\N	1214	3745	t
3752	INDIRECT	8	2743	\N	\N	1242	3724	t
3753	INDIRECT	8	2743	\N	\N	1214	3745	t
58256	DIRECT	2	\N	53635	\N	1215	\N	\N
58257	INDIRECT	2	\N	53636	\N	1215	58256	t
58258	INDIRECT	2	53758	\N	\N	1215	58256	t
58259	INDIRECT	2	\N	53637	\N	1215	58256	t
58260	INDIRECT	2	53759	\N	\N	1215	58256	t
58261	INDIRECT	2	\N	53638	\N	1215	58256	t
58262	INDIRECT	2	53760	\N	\N	1215	58256	t
58236	DIRECT	2	\N	\N	58099	1241	\N	\N
58237	INDIRECT	2	\N	\N	58100	1241	58236	t
58238	DIRECT	2	\N	\N	58100	1212	\N	\N
3432	INDIRECT	15	2736	\N	\N	1241	3421	t
58263	DIRECT	6	\N	53639	\N	1241	\N	\N
58264	DIRECT	6	\N	53640	\N	1212	\N	\N
58265	INDIRECT	6	\N	53640	\N	1241	58263	t
58266	INDIRECT	6	53761	\N	\N	1212	58264	t
58267	INDIRECT	6	53761	\N	\N	1241	58263	t
58269	INDIRECT	6	\N	53641	\N	1241	58263	t
58268	DIRECT	6	\N	53641	\N	1212	\N	\N
58271	INDIRECT	6	53762	\N	\N	1212	58268	t
58270	INDIRECT	6	53762	\N	\N	1241	58263	t
58273	DIRECT	6	\N	53642	\N	1212	\N	\N
58249	DIRECT	1	\N	\N	58103	1215	\N	\N
58250	INDIRECT	1	\N	\N	58104	1215	58249	t
58251	INDIRECT	1	53755	\N	\N	1215	58249	t
58252	INDIRECT	1	\N	\N	58105	1215	58249	t
58253	INDIRECT	1	53756	\N	\N	1215	58249	t
58254	INDIRECT	1	\N	\N	58106	1215	58249	t
58255	INDIRECT	1	53757	\N	\N	1215	58249	t
3754	INDIRECT	8	\N	2647	\N	1242	3724	t
3755	INDIRECT	8	\N	2647	\N	1214	3745	t
3756	INDIRECT	8	2744	\N	\N	1242	3724	t
3757	INDIRECT	8	2744	\N	\N	1214	3745	t
58239	INDIRECT	2	53752	\N	\N	1241	58236	t
58240	INDIRECT	2	53752	\N	\N	1212	58238	t
58241	INDIRECT	2	\N	\N	58101	1241	58236	t
58242	DIRECT	2	\N	\N	58101	1212	\N	\N
58272	INDIRECT	6	\N	53642	\N	1241	58263	t
58274	INDIRECT	6	53763	\N	\N	1241	58263	t
58275	INDIRECT	6	53763	\N	\N	1212	58273	t
58243	INDIRECT	2	53753	\N	\N	1212	58242	t
58244	INDIRECT	2	53753	\N	\N	1241	58236	t
58245	DIRECT	2	\N	\N	58102	1212	\N	\N
58246	INDIRECT	2	\N	\N	58102	1241	58236	t
58248	INDIRECT	2	53754	\N	\N	1241	58236	t
58247	INDIRECT	2	53754	\N	\N	1212	58245	t
\.


--
-- Data for Name: criterionsatisfaction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criterionsatisfaction (id, version, code, startdate, finishdate, isdeleted, criterion, resource) FROM stdin;
2020	2	2848af49-b314-4c78-ba35-46b86667e544	2010-03-11 16:44:08.905	\N	f	1212	1820
2021	2	10cb7b6b-2860-4181-b03f-32cd6d59ef79	2010-03-11 16:44:32.981	\N	f	1218	1820
2023	4	aa6c332d-6661-4294-be6b-7e86f4430098	2010-04-11 00:00:00	\N	f	1216	1828
2026	1	48e455f3-4cec-429f-b607-b04086239561	2010-04-01 00:00:00	\N	f	1243	1828
2022	5	6d8fcc94-3e78-4a96-953c-ae7d51d8a63a	2010-03-11 16:54:27.097	\N	t	1243	1828
2032	1	892978f2-5121-401b-ab58-64a37164f95f	2010-04-01 00:00:00	\N	f	1242	1834
2033	1	8ae72838-52d1-4e59-ad73-56467372a21b	2010-04-01 00:00:00	\N	f	1215	1834
2034	2	f98b9d10-4c09-4f93-a933-4c350d8da595	2010-04-01 00:00:00	\N	f	1214	1830
2030	5	dd414747-1bc5-4e6a-889b-9a484b4bee7e	2010-03-01 00:00:00	\N	t	1242	1830
2031	4	81bcef2e-e155-4fd8-93c5-386739eff099	2010-03-01 00:00:00	\N	t	1214	1830
2035	2	2d95fdde-55da-4399-9143-cee1d3b8edcf	2010-04-01 00:00:00	\N	f	1242	1830
2036	1	031ad241-8000-4115-91c1-0de78c9c5e7a	2010-03-01 00:00:00	\N	f	1242	1836
2029	6	66ebd1c4-48b5-489c-90a0-51ebaf6039a6	2010-03-01 00:00:00	\N	f	1241	1832
2025	16	97ceac58-3f79-4837-bbcd-2cdbd08f118b	2010-04-01 00:00:00	\N	f	1212	1826
2024	16	65cc5a5f-a372-4366-9584-541ab47f07af	2010-04-01 00:00:00	\N	f	1241	1826
2027	20	7e46de81-0b2f-4f7a-aff9-901dc5d93b23	2010-04-01 00:00:00	\N	f	1241	1829
2028	20	f2464d3a-0056-4b08-abdb-9ab8e3c3bc4a	2010-04-01 00:00:00	\N	f	1214	1829
\.


--
-- Data for Name: criteriontype; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY criteriontype (id, version, code, name, description, allowsimultaneouscriterionsperresource, allowhierarchy, enabled, resource) FROM stdin;
131072	15	851b6b2a-e976-4034-8421-6a575ed749a7	LEAVE	Leave	f	f	t	1
131073	11	cd195649-ab2a-4e32-b341-bdb4f4dc3c63	CATEGORY	Professional category	t	t	t	1
131074	9	9914b8f0-3c80-4357-99b0-0df94288e841	TRAINING	Training courses and labor training	t	t	t	1
131076	5	b8fac643-1279-4c5e-b021-870fdf784111	WORK_RELATIONSHIP	Relationship of the resource with the enterprise 	f	f	t	1
131077	1	2199e43a-e87f-4a29-816c-f430ac01fb67	LOCATION_GROUP	Location where the resource work	t	f	t	0
131075	8	a5226011-d6f0-45a1-9d39-7304d7db0e6d	JOB	Profesión	t	t	t	1
360448	1	62bb701b-ea21-4f3d-9c19-c4c6756e5b7f	Tipo de trabajo	Tipos de trabajo a realizar	t	f	t	0
360449	2	441c87ef-2ace-437a-bea9-5f80b4bc9b3c	Capacitación de soldadura		f	f	t	1
360450	1	807fbe6f-f82c-4e94-8a88-65796b514be9	Localización	\N	f	t	t	0
360451	1	c03901e8-95b7-4859-bca5-2b0f7bb606fa	Contrato laboral	\N	f	f	t	0
360452	1	abfe00ae-71b5-4512-b779-53cbb46d84db	Documentacion	\N	t	f	t	0
360453	2	511240aa-05f2-442e-8bb6-3ab052d4e750	Grupo	\N	f	f	t	0
\.


--
-- Data for Name: day_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY day_assignment (id, day_assignment_type, version, hours, day, resource_id, specific_resource_allocation_id, generic_resource_allocation_id, derived_allocation_id) FROM stdin;
7575	SPECIFIC_DAY	5	5	2010-03-09	1836	7279	\N	\N
7574	SPECIFIC_DAY	5	5	2010-03-10	1836	7279	\N	\N
19947	GENERIC_DAY	4	4	2010-04-21	1830	\N	19097	\N
19927	GENERIC_DAY	4	4	2010-05-04	1830	\N	19097	\N
19892	GENERIC_DAY	4	3	2010-08-24	1830	\N	19097	\N
19933	GENERIC_DAY	4	4	2010-04-05	1830	\N	19097	\N
19936	GENERIC_DAY	4	4	2010-05-26	1830	\N	19097	\N
19882	GENERIC_DAY	4	3	2010-08-26	1830	\N	19097	\N
19875	GENERIC_DAY	4	3	2010-08-17	1830	\N	19097	\N
19894	GENERIC_DAY	4	4	2010-04-19	1830	\N	19097	\N
19881	GENERIC_DAY	4	4	2010-05-19	1830	\N	19097	\N
19901	GENERIC_DAY	4	4	2010-05-11	1830	\N	19097	\N
19899	GENERIC_DAY	4	4	2010-06-28	1830	\N	19097	\N
19876	GENERIC_DAY	4	4	2010-05-20	1830	\N	19097	\N
19897	GENERIC_DAY	4	4	2010-07-22	1830	\N	19097	\N
19890	GENERIC_DAY	4	3	2010-08-25	1830	\N	19097	\N
19887	GENERIC_DAY	4	4	2010-04-20	1830	\N	19097	\N
19896	GENERIC_DAY	4	3	2010-08-05	1830	\N	19097	\N
19939	GENERIC_DAY	4	3	2010-07-27	1830	\N	19097	\N
19931	GENERIC_DAY	4	4	2010-04-07	1830	\N	19097	\N
19895	GENERIC_DAY	4	3	2010-08-19	1830	\N	19097	\N
19928	GENERIC_DAY	4	4	2010-06-03	1830	\N	19097	\N
19918	GENERIC_DAY	4	4	2010-05-05	1830	\N	19097	\N
19913	GENERIC_DAY	4	3	2010-08-09	1830	\N	19097	\N
19886	GENERIC_DAY	4	4	2010-05-12	1830	\N	19097	\N
20026	GENERIC_DAY	4	5	2010-07-06	1830	\N	19098	\N
19957	GENERIC_DAY	4	5	2010-04-22	1830	\N	19098	\N
19990	GENERIC_DAY	4	5	2010-05-04	1830	\N	19098	\N
20029	GENERIC_DAY	4	5	2010-07-12	1830	\N	19098	\N
19965	GENERIC_DAY	4	5	2010-04-05	1830	\N	19098	\N
19999	GENERIC_DAY	4	0	2010-05-29	1830	\N	19098	\N
19979	GENERIC_DAY	4	5	2010-06-28	1830	\N	19098	\N
19969	GENERIC_DAY	4	0	2010-07-24	1830	\N	19098	\N
20031	GENERIC_DAY	4	0	2010-04-11	1830	\N	19098	\N
20042	GENERIC_DAY	4	0	2010-05-30	1830	\N	19098	\N
19961	GENERIC_DAY	4	0	2010-04-10	1830	\N	19098	\N
20033	GENERIC_DAY	4	5	2010-04-01	1830	\N	19098	\N
19960	GENERIC_DAY	4	0	2010-08-07	1830	\N	19098	\N
19985	GENERIC_DAY	4	2	2010-05-07	1830	\N	19098	\N
20052	GENERIC_DAY	4	0	2010-06-12	1830	\N	19098	\N
19956	GENERIC_DAY	4	5	2010-07-22	1830	\N	19098	\N
19997	GENERIC_DAY	4	2	2010-06-11	1830	\N	19098	\N
20040	GENERIC_DAY	4	0	2010-04-25	1830	\N	19098	\N
20015	GENERIC_DAY	4	5	2010-04-07	1830	\N	19098	\N
19992	GENERIC_DAY	4	5	2010-05-19	1830	\N	19098	\N
20038	GENERIC_DAY	4	2	2010-07-09	1830	\N	19098	\N
20058	GENERIC_DAY	4	0	2010-05-23	1830	\N	19098	\N
19986	GENERIC_DAY	4	5	2010-04-28	1830	\N	19098	\N
19982	GENERIC_DAY	4	0	2010-05-15	1830	\N	19098	\N
20013	GENERIC_DAY	4	5	2010-07-21	1830	\N	19098	\N
19977	GENERIC_DAY	4	0	2010-04-24	1830	\N	19098	\N
20003	GENERIC_DAY	4	2	2010-05-14	1830	\N	19098	\N
19991	GENERIC_DAY	4	5	2010-04-21	1830	\N	19098	\N
20018	GENERIC_DAY	4	5	2010-05-25	1830	\N	19098	\N
19958	GENERIC_DAY	4	2	2010-04-02	1830	\N	19098	\N
20025	GENERIC_DAY	4	5	2010-05-27	1830	\N	19098	\N
19975	GENERIC_DAY	4	2	2010-07-30	1830	\N	19098	\N
20045	GENERIC_DAY	4	5	2010-07-15	1830	\N	19098	\N
19996	GENERIC_DAY	4	5	2010-04-26	1830	\N	19098	\N
19989	GENERIC_DAY	4	5	2010-07-08	1830	\N	19098	\N
20019	GENERIC_DAY	4	0	2010-06-05	1830	\N	19098	\N
20049	GENERIC_DAY	4	5	2010-05-12	1830	\N	19098	\N
19962	GENERIC_DAY	4	0	2010-06-19	1830	\N	19098	\N
20057	GENERIC_DAY	4	5	2010-05-06	1830	\N	19098	\N
20035	GENERIC_DAY	4	0	2010-05-01	1830	\N	19098	\N
19993	GENERIC_DAY	4	5	2010-07-05	1830	\N	19098	\N
19988	GENERIC_DAY	4	5	2010-07-13	1830	\N	19098	\N
20066	GENERIC_DAY	4	5	2010-08-02	1830	\N	19098	\N
19967	GENERIC_DAY	4	5	2010-07-14	1830	\N	19098	\N
20030	GENERIC_DAY	4	5	2010-06-16	1830	\N	19098	\N
19994	GENERIC_DAY	4	5	2010-06-29	1830	\N	19098	\N
19998	GENERIC_DAY	4	2	2010-08-06	1830	\N	19098	\N
20041	GENERIC_DAY	4	2	2010-07-16	1830	\N	19098	\N
20028	GENERIC_DAY	4	0	2010-07-03	1830	\N	19098	\N
20012	GENERIC_DAY	4	5	2010-06-07	1830	\N	19098	\N
20023	GENERIC_DAY	4	0	2010-05-02	1830	\N	19098	\N
20009	GENERIC_DAY	4	5	2010-08-05	1830	\N	19098	\N
20027	GENERIC_DAY	4	2	2010-05-28	1830	\N	19098	\N
19980	GENERIC_DAY	4	0	2010-07-11	1830	\N	19098	\N
19964	GENERIC_DAY	4	5	2010-05-18	1830	\N	19098	\N
19974	GENERIC_DAY	4	5	2010-06-30	1830	\N	19098	\N
20039	GENERIC_DAY	4	5	2010-06-17	1830	\N	19098	\N
19966	GENERIC_DAY	4	5	2010-07-01	1830	\N	19098	\N
20016	GENERIC_DAY	4	5	2010-04-13	1830	\N	19098	\N
20059	GENERIC_DAY	4	5	2010-05-05	1830	\N	19098	\N
20032	GENERIC_DAY	4	2	2010-04-30	1830	\N	19098	\N
20048	GENERIC_DAY	4	5	2010-04-19	1830	\N	19098	\N
20007	GENERIC_DAY	4	5	2010-06-10	1830	\N	19098	\N
19981	GENERIC_DAY	4	5	2010-05-20	1830	\N	19098	\N
20022	GENERIC_DAY	4	5	2010-07-29	1830	\N	19098	\N
20024	GENERIC_DAY	4	5	2010-04-27	1830	\N	19098	\N
20000	GENERIC_DAY	4	0	2010-05-22	1830	\N	19098	\N
20011	GENERIC_DAY	4	5	2010-05-11	1830	\N	19098	\N
19955	GENERIC_DAY	4	5	2010-05-03	1830	\N	19098	\N
20056	GENERIC_DAY	4	0	2010-04-04	1830	\N	19098	\N
20075	GENERIC_DAY	4	2	2010-04-09	1830	\N	19098	\N
22683	GENERIC_DAY	2	0	2010-06-13	1834	\N	19117	\N
22610	GENERIC_DAY	2	0	2010-05-08	1834	\N	19117	\N
22697	GENERIC_DAY	2	4	2010-05-07	1834	\N	19117	\N
22646	GENERIC_DAY	2	9	2010-07-07	1834	\N	19117	\N
22592	GENERIC_DAY	2	0	2010-06-12	1834	\N	19117	\N
22612	GENERIC_DAY	2	9	2010-05-26	1834	\N	19117	\N
22696	GENERIC_DAY	2	9	2010-06-22	1834	\N	19117	\N
22692	GENERIC_DAY	2	9	2010-07-13	1834	\N	19117	\N
22626	GENERIC_DAY	2	9	2010-04-19	1834	\N	19117	\N
22703	GENERIC_DAY	2	4	2010-04-16	1834	\N	19117	\N
22615	GENERIC_DAY	2	4	2010-06-04	1834	\N	19117	\N
22598	GENERIC_DAY	2	4	2010-06-11	1834	\N	19117	\N
22631	GENERIC_DAY	2	9	2010-06-23	1834	\N	19117	\N
22688	GENERIC_DAY	2	0	2010-07-10	1834	\N	19117	\N
22647	GENERIC_DAY	2	9	2010-04-28	1834	\N	19117	\N
22677	GENERIC_DAY	2	9	2010-06-01	1834	\N	19117	\N
22679	GENERIC_DAY	2	4	2010-04-23	1834	\N	19117	\N
22668	GENERIC_DAY	2	9	2010-05-18	1834	\N	19117	\N
22614	GENERIC_DAY	2	9	2010-07-22	1834	\N	19117	\N
22665	GENERIC_DAY	2	9	2010-07-15	1834	\N	19117	\N
22594	GENERIC_DAY	2	0	2010-06-05	1834	\N	19117	\N
22638	GENERIC_DAY	2	4	2010-04-02	1834	\N	19117	\N
22633	GENERIC_DAY	2	0	2010-05-23	1834	\N	19117	\N
22664	GENERIC_DAY	2	9	2010-07-21	1834	\N	19117	\N
22593	GENERIC_DAY	2	9	2010-05-24	1834	\N	19117	\N
22661	GENERIC_DAY	2	9	2010-07-29	1834	\N	19117	\N
22619	GENERIC_DAY	2	9	2010-05-25	1834	\N	19117	\N
22642	GENERIC_DAY	2	0	2010-06-27	1834	\N	19117	\N
22641	GENERIC_DAY	2	0	2010-04-10	1834	\N	19117	\N
22637	GENERIC_DAY	2	0	2010-06-19	1834	\N	19117	\N
22625	GENERIC_DAY	2	9	2010-04-13	1834	\N	19117	\N
22672	GENERIC_DAY	2	9	2010-04-06	1834	\N	19117	\N
22627	GENERIC_DAY	2	0	2010-06-26	1834	\N	19117	\N
22674	GENERIC_DAY	2	4	2010-05-14	1834	\N	19117	\N
22670	GENERIC_DAY	2	9	2010-07-06	1834	\N	19117	\N
22678	GENERIC_DAY	2	0	2010-04-03	1834	\N	19117	\N
22652	GENERIC_DAY	2	9	2010-07-27	1834	\N	19117	\N
22639	GENERIC_DAY	2	9	2010-07-08	1834	\N	19117	\N
22596	GENERIC_DAY	2	0	2010-08-01	1834	\N	19117	\N
22685	GENERIC_DAY	2	9	2010-04-27	1834	\N	19117	\N
22675	GENERIC_DAY	2	4	2010-06-25	1834	\N	19117	\N
22595	GENERIC_DAY	2	9	2010-04-14	1834	\N	19117	\N
22650	GENERIC_DAY	2	9	2010-06-16	1834	\N	19117	\N
22654	GENERIC_DAY	2	9	2010-07-19	1834	\N	19117	\N
22700	GENERIC_DAY	2	9	2010-06-24	1834	\N	19117	\N
22591	GENERIC_DAY	2	0	2010-05-30	1834	\N	19117	\N
22634	GENERIC_DAY	2	9	2010-06-21	1834	\N	19117	\N
22689	GENERIC_DAY	2	9	2010-05-10	1834	\N	19117	\N
22651	GENERIC_DAY	2	0	2010-05-02	1834	\N	19117	\N
22690	GENERIC_DAY	2	4	2010-07-09	1834	\N	19117	\N
22701	GENERIC_DAY	2	9	2010-07-20	1834	\N	19117	\N
22601	GENERIC_DAY	2	9	2010-07-12	1834	\N	19117	\N
22687	GENERIC_DAY	2	9	2010-05-12	1834	\N	19117	\N
22657	GENERIC_DAY	2	9	2010-06-03	1834	\N	19117	\N
22694	GENERIC_DAY	2	0	2010-05-09	1834	\N	19117	\N
22698	GENERIC_DAY	2	9	2010-05-20	1834	\N	19117	\N
22684	GENERIC_DAY	2	9	2010-06-02	1834	\N	19117	\N
22663	GENERIC_DAY	2	4	2010-07-16	1834	\N	19117	\N
22608	GENERIC_DAY	2	0	2010-05-22	1834	\N	19117	\N
22643	GENERIC_DAY	2	0	2010-07-25	1834	\N	19117	\N
22603	GENERIC_DAY	2	9	2010-04-29	1834	\N	19117	\N
22680	GENERIC_DAY	2	9	2010-05-11	1834	\N	19117	\N
22630	GENERIC_DAY	2	4	2010-07-30	1834	\N	19117	\N
22682	GENERIC_DAY	2	9	2010-04-21	1834	\N	19117	\N
22620	GENERIC_DAY	2	9	2010-05-27	1834	\N	19117	\N
22693	GENERIC_DAY	2	0	2010-07-24	1834	\N	19117	\N
22616	GENERIC_DAY	2	0	2010-04-24	1834	\N	19117	\N
22589	GENERIC_DAY	2	4	2010-05-28	1834	\N	19117	\N
22590	GENERIC_DAY	2	9	2010-07-14	1834	\N	19117	\N
22686	GENERIC_DAY	2	9	2010-07-28	1834	\N	19117	\N
22699	GENERIC_DAY	2	9	2010-07-26	1834	\N	19117	\N
22658	GENERIC_DAY	2	9	2010-05-31	1834	\N	19117	\N
22702	GENERIC_DAY	2	0	2010-05-16	1834	\N	19117	\N
22645	GENERIC_DAY	2	4	2010-04-30	1834	\N	19117	\N
22636	GENERIC_DAY	2	0	2010-04-17	1834	\N	19117	\N
22681	GENERIC_DAY	2	9	2010-04-22	1834	\N	19117	\N
22600	GENERIC_DAY	2	0	2010-06-06	1834	\N	19117	\N
22655	GENERIC_DAY	2	9	2010-04-26	1834	\N	19117	\N
22671	GENERIC_DAY	2	9	2010-04-08	1834	\N	19117	\N
22673	GENERIC_DAY	2	9	2010-06-07	1834	\N	19117	\N
22695	GENERIC_DAY	2	0	2010-06-20	1834	\N	19117	\N
22635	GENERIC_DAY	2	0	2010-04-25	1834	\N	19117	\N
22618	GENERIC_DAY	2	0	2010-04-04	1834	\N	19117	\N
22607	GENERIC_DAY	2	9	2010-05-19	1834	\N	19117	\N
22622	GENERIC_DAY	2	9	2010-04-20	1834	\N	19117	\N
22691	GENERIC_DAY	2	0	2010-07-18	1834	\N	19117	\N
22669	GENERIC_DAY	2	4	2010-06-18	1834	\N	19117	\N
22659	GENERIC_DAY	2	9	2010-05-03	1834	\N	19117	\N
22628	GENERIC_DAY	2	0	2010-05-15	1834	\N	19117	\N
22676	GENERIC_DAY	2	0	2010-05-01	1834	\N	19117	\N
57295	SPECIFIC_DAY	0	0	2010-04-10	1836	7282	\N	\N
57296	SPECIFIC_DAY	0	0	2010-05-01	1836	7282	\N	\N
57297	SPECIFIC_DAY	0	5	2010-04-27	1836	7282	\N	\N
57298	SPECIFIC_DAY	0	5	2010-04-19	1836	7282	\N	\N
57299	SPECIFIC_DAY	0	0	2010-04-24	1836	7282	\N	\N
57300	SPECIFIC_DAY	0	5	2010-05-03	1836	7282	\N	\N
57301	SPECIFIC_DAY	0	5	2010-04-22	1836	7282	\N	\N
57302	SPECIFIC_DAY	0	5	2010-04-28	1836	7282	\N	\N
57303	SPECIFIC_DAY	0	2	2010-04-09	1836	7282	\N	\N
20069	GENERIC_DAY	4	5	2010-05-26	1830	\N	19098	\N
20074	GENERIC_DAY	4	5	2010-06-03	1830	\N	19098	\N
19987	GENERIC_DAY	4	5	2010-04-29	1830	\N	19098	\N
20064	GENERIC_DAY	4	5	2010-06-15	1830	\N	19098	\N
20008	GENERIC_DAY	4	2	2010-05-21	1830	\N	19098	\N
20073	GENERIC_DAY	4	2	2010-04-23	1830	\N	19098	\N
19963	GENERIC_DAY	4	5	2010-07-07	1830	\N	19098	\N
19973	GENERIC_DAY	4	0	2010-07-25	1830	\N	19098	\N
20036	GENERIC_DAY	4	5	2010-04-20	1830	\N	19098	\N
19970	GENERIC_DAY	4	0	2010-05-16	1830	\N	19098	\N
20065	GENERIC_DAY	4	0	2010-04-17	1830	\N	19098	\N
20002	GENERIC_DAY	4	2	2010-04-16	1830	\N	19098	\N
20046	GENERIC_DAY	4	5	2010-06-08	1830	\N	19098	\N
20068	GENERIC_DAY	4	0	2010-07-17	1830	\N	19098	\N
20076	GENERIC_DAY	4	5	2010-07-26	1830	\N	19098	\N
20071	GENERIC_DAY	4	0	2010-08-01	1830	\N	19098	\N
20051	GENERIC_DAY	4	2	2010-07-02	1830	\N	19098	\N
19971	GENERIC_DAY	4	5	2010-06-02	1830	\N	19098	\N
20067	GENERIC_DAY	4	5	2010-04-15	1830	\N	19098	\N
20017	GENERIC_DAY	4	5	2010-05-13	1830	\N	19098	\N
20062	GENERIC_DAY	4	5	2010-05-31	1830	\N	19098	\N
20072	GENERIC_DAY	4	5	2010-08-04	1830	\N	19098	\N
20063	GENERIC_DAY	4	0	2010-05-09	1830	\N	19098	\N
19976	GENERIC_DAY	4	5	2010-04-12	1830	\N	19098	\N
57304	SPECIFIC_DAY	0	0	2010-04-17	1836	7282	\N	\N
57305	SPECIFIC_DAY	0	0	2010-04-25	1836	7282	\N	\N
57306	SPECIFIC_DAY	0	2	2010-04-16	1836	7282	\N	\N
57307	SPECIFIC_DAY	0	5	2010-04-21	1836	7282	\N	\N
57308	SPECIFIC_DAY	0	2	2010-04-30	1836	7282	\N	\N
57309	SPECIFIC_DAY	0	5	2010-04-20	1836	7282	\N	\N
57310	SPECIFIC_DAY	0	5	2010-04-12	1836	7282	\N	\N
57311	SPECIFIC_DAY	0	0	2010-05-08	1836	7282	\N	\N
57312	SPECIFIC_DAY	0	5	2010-04-26	1836	7282	\N	\N
57313	SPECIFIC_DAY	0	5	2010-04-08	1836	7282	\N	\N
57314	SPECIFIC_DAY	0	0	2010-05-02	1836	7282	\N	\N
57315	SPECIFIC_DAY	0	5	2010-04-29	1836	7282	\N	\N
57316	SPECIFIC_DAY	0	5	2010-05-10	1836	7282	\N	\N
57317	SPECIFIC_DAY	0	5	2010-04-14	1836	7282	\N	\N
57318	SPECIFIC_DAY	0	2	2010-04-23	1836	7282	\N	\N
57319	SPECIFIC_DAY	0	0	2010-04-18	1836	7282	\N	\N
57320	SPECIFIC_DAY	0	5	2010-05-06	1836	7282	\N	\N
57321	SPECIFIC_DAY	0	5	2010-04-15	1836	7282	\N	\N
57322	SPECIFIC_DAY	0	2	2010-05-07	1836	7282	\N	\N
57323	SPECIFIC_DAY	0	5	2010-05-05	1836	7282	\N	\N
57324	SPECIFIC_DAY	0	0	2010-05-09	1836	7282	\N	\N
57325	SPECIFIC_DAY	0	5	2010-05-04	1836	7282	\N	\N
57326	SPECIFIC_DAY	0	5	2010-04-13	1836	7282	\N	\N
57327	SPECIFIC_DAY	0	0	2010-04-11	1836	7282	\N	\N
22666	GENERIC_DAY	2	9	2010-04-15	1834	\N	19117	\N
22606	GENERIC_DAY	2	9	2010-04-01	1834	\N	19117	\N
22599	GENERIC_DAY	2	9	2010-06-15	1834	\N	19117	\N
22611	GENERIC_DAY	2	0	2010-05-29	1834	\N	19117	\N
22632	GENERIC_DAY	2	4	2010-07-23	1834	\N	19117	\N
22597	GENERIC_DAY	2	9	2010-05-05	1834	\N	19117	\N
22602	GENERIC_DAY	2	9	2010-06-17	1834	\N	19117	\N
22604	GENERIC_DAY	2	9	2010-07-05	1834	\N	19117	\N
22649	GENERIC_DAY	2	9	2010-06-09	1834	\N	19117	\N
22648	GENERIC_DAY	2	0	2010-04-11	1834	\N	19117	\N
22653	GENERIC_DAY	2	0	2010-07-31	1834	\N	19117	\N
22629	GENERIC_DAY	2	9	2010-05-06	1834	\N	19117	\N
22605	GENERIC_DAY	2	4	2010-05-21	1834	\N	19117	\N
22656	GENERIC_DAY	2	9	2010-05-13	1834	\N	19117	\N
22588	GENERIC_DAY	2	0	2010-04-18	1834	\N	19117	\N
22621	GENERIC_DAY	2	9	2010-04-07	1834	\N	19117	\N
22609	GENERIC_DAY	2	6	2010-08-02	1834	\N	19117	\N
22660	GENERIC_DAY	2	9	2010-04-12	1834	\N	19117	\N
22667	GENERIC_DAY	2	4	2010-04-09	1834	\N	19117	\N
22644	GENERIC_DAY	2	9	2010-06-08	1834	\N	19117	\N
22640	GENERIC_DAY	2	0	2010-07-11	1834	\N	19117	\N
22613	GENERIC_DAY	2	9	2010-04-05	1834	\N	19117	\N
22662	GENERIC_DAY	2	9	2010-05-04	1834	\N	19117	\N
22624	GENERIC_DAY	2	0	2010-07-17	1834	\N	19117	\N
22623	GENERIC_DAY	2	9	2010-06-14	1834	\N	19117	\N
22617	GENERIC_DAY	2	9	2010-06-10	1834	\N	19117	\N
56697	GENERIC_DAY	1	9	2010-05-04	1826	\N	19141	\N
56727	GENERIC_DAY	1	0	2010-05-09	1826	\N	19141	\N
56715	GENERIC_DAY	1	4	2010-04-30	1826	\N	19141	\N
56702	GENERIC_DAY	1	9	2010-04-12	1826	\N	19141	\N
56696	GENERIC_DAY	1	9	2010-04-20	1826	\N	19141	\N
56703	GENERIC_DAY	1	0	2010-04-18	1826	\N	19141	\N
56712	GENERIC_DAY	1	4	2010-04-02	1826	\N	19141	\N
56717	GENERIC_DAY	1	9	2010-05-06	1826	\N	19141	\N
56706	GENERIC_DAY	1	9	2010-05-03	1826	\N	19141	\N
56720	GENERIC_DAY	1	0	2010-04-04	1826	\N	19141	\N
56694	GENERIC_DAY	1	9	2010-04-01	1826	\N	19141	\N
56710	GENERIC_DAY	1	9	2010-05-05	1826	\N	19141	\N
56726	GENERIC_DAY	1	4	2010-04-23	1826	\N	19141	\N
56716	GENERIC_DAY	1	0	2010-04-03	1826	\N	19141	\N
56724	GENERIC_DAY	1	0	2010-05-01	1826	\N	19141	\N
57703	GENERIC_DAY	0	4	2010-05-14	1826	\N	19142	\N
57704	GENERIC_DAY	0	9	2010-05-20	1826	\N	19142	\N
57705	GENERIC_DAY	0	9	2010-05-18	1826	\N	19142	\N
57706	GENERIC_DAY	0	0	2010-05-23	1826	\N	19142	\N
57707	GENERIC_DAY	0	0	2010-06-13	1826	\N	19142	\N
57708	GENERIC_DAY	0	9	2010-06-17	1826	\N	19142	\N
57709	GENERIC_DAY	0	9	2010-05-13	1826	\N	19142	\N
57710	GENERIC_DAY	0	0	2010-06-06	1826	\N	19142	\N
57711	GENERIC_DAY	0	4	2010-05-21	1826	\N	19142	\N
57712	GENERIC_DAY	0	4	2010-06-11	1826	\N	19142	\N
57713	GENERIC_DAY	0	9	2010-05-26	1826	\N	19142	\N
57714	GENERIC_DAY	0	9	2010-06-09	1826	\N	19142	\N
57715	GENERIC_DAY	0	9	2010-06-15	1826	\N	19142	\N
57716	GENERIC_DAY	0	9	2010-06-01	1826	\N	19142	\N
57717	GENERIC_DAY	0	0	2010-06-12	1826	\N	19142	\N
57718	GENERIC_DAY	0	9	2010-05-27	1826	\N	19142	\N
57719	GENERIC_DAY	0	0	2010-06-05	1826	\N	19142	\N
57720	GENERIC_DAY	0	9	2010-06-08	1826	\N	19142	\N
57721	GENERIC_DAY	0	0	2010-05-15	1826	\N	19142	\N
57722	GENERIC_DAY	0	4	2010-06-04	1826	\N	19142	\N
57723	GENERIC_DAY	0	9	2010-06-16	1826	\N	19142	\N
57724	GENERIC_DAY	0	0	2010-05-30	1826	\N	19142	\N
57725	GENERIC_DAY	0	9	2010-06-02	1826	\N	19142	\N
57726	GENERIC_DAY	0	9	2010-06-10	1826	\N	19142	\N
57727	GENERIC_DAY	0	0	2010-05-16	1826	\N	19142	\N
57728	GENERIC_DAY	0	9	2010-06-03	1826	\N	19142	\N
57729	GENERIC_DAY	0	9	2010-06-14	1826	\N	19142	\N
57730	GENERIC_DAY	0	9	2010-06-07	1826	\N	19142	\N
57731	GENERIC_DAY	0	9	2010-05-24	1826	\N	19142	\N
57732	GENERIC_DAY	0	9	2010-05-31	1826	\N	19142	\N
57733	GENERIC_DAY	0	0	2010-05-29	1826	\N	19142	\N
57734	GENERIC_DAY	0	0	2010-05-22	1826	\N	19142	\N
57735	GENERIC_DAY	0	9	2010-05-19	1826	\N	19142	\N
57736	GENERIC_DAY	0	4	2010-05-28	1826	\N	19142	\N
57737	GENERIC_DAY	0	9	2010-05-25	1826	\N	19142	\N
57738	GENERIC_DAY	0	0	2010-06-20	1826	\N	19143	\N
57739	GENERIC_DAY	0	9	2010-06-22	1826	\N	19143	\N
57740	GENERIC_DAY	0	4	2010-07-02	1826	\N	19143	\N
57741	GENERIC_DAY	0	9	2010-06-30	1826	\N	19143	\N
57742	GENERIC_DAY	0	9	2010-06-23	1826	\N	19143	\N
57743	GENERIC_DAY	0	9	2010-06-28	1826	\N	19143	\N
57744	GENERIC_DAY	0	0	2010-07-04	1826	\N	19143	\N
57745	GENERIC_DAY	0	4	2010-06-25	1826	\N	19143	\N
57746	GENERIC_DAY	0	0	2010-07-03	1826	\N	19143	\N
20021	GENERIC_DAY	4	5	2010-06-01	1830	\N	19098	\N
20050	GENERIC_DAY	4	5	2010-06-14	1830	\N	19098	\N
20060	GENERIC_DAY	4	5	2010-04-08	1830	\N	19098	\N
19959	GENERIC_DAY	4	0	2010-07-10	1830	\N	19098	\N
19983	GENERIC_DAY	4	5	2010-07-19	1830	\N	19098	\N
20014	GENERIC_DAY	4	0	2010-07-18	1830	\N	19098	\N
19995	GENERIC_DAY	4	5	2010-05-10	1830	\N	19098	\N
20043	GENERIC_DAY	4	5	2010-06-09	1830	\N	19098	\N
20054	GENERIC_DAY	4	2	2010-06-18	1830	\N	19098	\N
20037	GENERIC_DAY	4	0	2010-05-08	1830	\N	19098	\N
20061	GENERIC_DAY	4	2	2010-07-23	1830	\N	19098	\N
20010	GENERIC_DAY	4	0	2010-04-03	1830	\N	19098	\N
20004	GENERIC_DAY	4	0	2010-06-13	1830	\N	19098	\N
19984	GENERIC_DAY	4	0	2010-07-31	1830	\N	19098	\N
20001	GENERIC_DAY	4	0	2010-06-20	1830	\N	19098	\N
20044	GENERIC_DAY	4	5	2010-05-24	1830	\N	19098	\N
19972	GENERIC_DAY	4	0	2010-07-04	1830	\N	19098	\N
20006	GENERIC_DAY	4	5	2010-04-06	1830	\N	19098	\N
20055	GENERIC_DAY	4	0	2010-05-17	1830	\N	19098	\N
20005	GENERIC_DAY	4	0	2010-06-06	1830	\N	19098	\N
20053	GENERIC_DAY	4	5	2010-07-28	1830	\N	19098	\N
20047	GENERIC_DAY	4	0	2010-04-18	1830	\N	19098	\N
19978	GENERIC_DAY	4	5	2010-07-20	1830	\N	19098	\N
20020	GENERIC_DAY	4	5	2010-07-27	1830	\N	19098	\N
20034	GENERIC_DAY	4	5	2010-08-03	1830	\N	19098	\N
20070	GENERIC_DAY	4	5	2010-04-14	1830	\N	19098	\N
19968	GENERIC_DAY	4	2	2010-06-04	1830	\N	19098	\N
57747	GENERIC_DAY	0	9	2010-06-21	1826	\N	19143	\N
57748	GENERIC_DAY	0	9	2010-06-24	1826	\N	19143	\N
57749	GENERIC_DAY	0	0	2010-06-26	1826	\N	19143	\N
57750	GENERIC_DAY	0	0	2010-06-19	1826	\N	19143	\N
57751	GENERIC_DAY	0	9	2010-07-01	1826	\N	19143	\N
57752	GENERIC_DAY	0	9	2010-07-05	1826	\N	19143	\N
57753	GENERIC_DAY	0	7	2010-07-06	1826	\N	19143	\N
57754	GENERIC_DAY	0	0	2010-06-27	1826	\N	19143	\N
57755	GENERIC_DAY	0	4	2010-06-18	1826	\N	19143	\N
57756	GENERIC_DAY	0	9	2010-06-29	1826	\N	19143	\N
57757	GENERIC_DAY	0	2	2010-08-20	1829	\N	4698	\N
57758	GENERIC_DAY	0	7	2010-09-06	1829	\N	4698	\N
57759	GENERIC_DAY	0	7	2010-08-24	1829	\N	4698	\N
57760	GENERIC_DAY	0	7	2010-09-13	1829	\N	4698	\N
57761	GENERIC_DAY	0	2	2010-07-30	1829	\N	4698	\N
57762	GENERIC_DAY	0	2	2010-07-23	1829	\N	4698	\N
57763	GENERIC_DAY	0	7	2010-08-23	1829	\N	4698	\N
57764	GENERIC_DAY	0	2	2010-08-06	1829	\N	4698	\N
57765	GENERIC_DAY	0	7	2010-08-17	1829	\N	4698	\N
57766	GENERIC_DAY	0	3	2010-07-16	1829	\N	4698	\N
57767	GENERIC_DAY	0	7	2010-08-25	1829	\N	4698	\N
57768	GENERIC_DAY	0	7	2010-09-09	1829	\N	4698	\N
57769	GENERIC_DAY	0	7	2010-08-18	1829	\N	4698	\N
57770	GENERIC_DAY	0	2	2010-09-10	1829	\N	4698	\N
57771	GENERIC_DAY	0	7	2010-07-26	1829	\N	4698	\N
57772	GENERIC_DAY	0	3	2010-07-09	1829	\N	4698	\N
57773	GENERIC_DAY	0	8	2010-07-13	1829	\N	4698	\N
57774	GENERIC_DAY	0	7	2010-09-07	1829	\N	4698	\N
57775	GENERIC_DAY	0	7	2010-08-26	1829	\N	4698	\N
57776	GENERIC_DAY	0	7	2010-08-05	1829	\N	4698	\N
57777	GENERIC_DAY	0	7	2010-09-08	1829	\N	4698	\N
57778	GENERIC_DAY	0	8	2010-07-15	1829	\N	4698	\N
57779	GENERIC_DAY	0	7	2010-08-10	1829	\N	4698	\N
57780	GENERIC_DAY	0	7	2010-08-16	1829	\N	4698	\N
57781	GENERIC_DAY	0	7	2010-09-14	1829	\N	4698	\N
57782	GENERIC_DAY	0	7	2010-08-03	1829	\N	4698	\N
57783	GENERIC_DAY	0	7	2010-07-29	1829	\N	4698	\N
57784	GENERIC_DAY	0	2	2010-08-13	1829	\N	4698	\N
57785	GENERIC_DAY	0	7	2010-09-01	1829	\N	4698	\N
57786	GENERIC_DAY	0	7	2010-08-31	1829	\N	4698	\N
57787	GENERIC_DAY	0	8	2010-07-14	1829	\N	4698	\N
57788	GENERIC_DAY	0	7	2010-08-11	1829	\N	4698	\N
57789	GENERIC_DAY	0	7	2010-08-30	1829	\N	4698	\N
57790	GENERIC_DAY	0	7	2010-08-04	1829	\N	4698	\N
57791	GENERIC_DAY	0	7	2010-08-19	1829	\N	4698	\N
57792	GENERIC_DAY	0	7	2010-09-16	1829	\N	4698	\N
57793	GENERIC_DAY	0	7	2010-09-02	1829	\N	4698	\N
57794	GENERIC_DAY	0	7	2010-07-21	1829	\N	4698	\N
57795	GENERIC_DAY	0	7	2010-07-28	1829	\N	4698	\N
57796	GENERIC_DAY	0	7	2010-08-02	1829	\N	4698	\N
57797	GENERIC_DAY	0	2	2010-08-27	1829	\N	4698	\N
57798	GENERIC_DAY	0	2	2010-09-03	1829	\N	4698	\N
57799	GENERIC_DAY	0	8	2010-07-12	1829	\N	4698	\N
57800	GENERIC_DAY	0	7	2010-09-15	1829	\N	4698	\N
57801	GENERIC_DAY	0	8	2010-07-19	1829	\N	4698	\N
57802	GENERIC_DAY	0	7	2010-08-09	1829	\N	4698	\N
57803	GENERIC_DAY	0	7	2010-07-22	1829	\N	4698	\N
57804	GENERIC_DAY	0	7	2010-08-12	1829	\N	4698	\N
57805	GENERIC_DAY	0	8	2010-07-08	1829	\N	4698	\N
57806	GENERIC_DAY	0	8	2010-07-07	1829	\N	4698	\N
57807	GENERIC_DAY	0	8	2010-07-20	1829	\N	4698	\N
57808	GENERIC_DAY	0	7	2010-07-27	1829	\N	4698	\N
57809	GENERIC_DAY	0	5	2010-07-19	1829	\N	19140	\N
57810	GENERIC_DAY	0	0	2010-08-01	1829	\N	19140	\N
57811	GENERIC_DAY	0	2	2010-07-09	1829	\N	19140	\N
57812	GENERIC_DAY	0	0	2010-07-18	1829	\N	19140	\N
57813	GENERIC_DAY	0	5	2010-08-02	1829	\N	19140	\N
57814	GENERIC_DAY	0	5	2010-07-26	1829	\N	19140	\N
57815	GENERIC_DAY	0	0	2010-07-10	1829	\N	19140	\N
57816	GENERIC_DAY	0	5	2010-08-04	1829	\N	19140	\N
57817	GENERIC_DAY	0	0	2010-07-17	1829	\N	19140	\N
57818	GENERIC_DAY	0	5	2010-07-15	1829	\N	19140	\N
57819	GENERIC_DAY	0	2	2010-07-30	1829	\N	19140	\N
57820	GENERIC_DAY	0	5	2010-07-20	1829	\N	19140	\N
57821	GENERIC_DAY	0	5	2010-07-22	1829	\N	19140	\N
57822	GENERIC_DAY	0	5	2010-07-14	1829	\N	19140	\N
57823	GENERIC_DAY	0	0	2010-07-25	1829	\N	19140	\N
57824	GENERIC_DAY	0	2	2010-07-23	1829	\N	19140	\N
57825	GENERIC_DAY	0	5	2010-07-13	1829	\N	19140	\N
57826	GENERIC_DAY	0	5	2010-07-29	1829	\N	19140	\N
57827	GENERIC_DAY	0	5	2010-08-03	1829	\N	19140	\N
57828	GENERIC_DAY	0	0	2010-07-24	1829	\N	19140	\N
57829	GENERIC_DAY	0	2	2010-08-06	1829	\N	19140	\N
57830	GENERIC_DAY	0	5	2010-07-27	1829	\N	19140	\N
57831	GENERIC_DAY	0	0	2010-07-31	1829	\N	19140	\N
57832	GENERIC_DAY	0	5	2010-07-28	1829	\N	19140	\N
57833	GENERIC_DAY	0	5	2010-07-08	1829	\N	19140	\N
57834	GENERIC_DAY	0	5	2010-08-05	1829	\N	19140	\N
57835	GENERIC_DAY	0	5	2010-07-12	1829	\N	19140	\N
57836	GENERIC_DAY	0	5	2010-07-21	1829	\N	19140	\N
57837	GENERIC_DAY	0	2	2010-07-16	1829	\N	19140	\N
57838	GENERIC_DAY	0	5	2010-07-07	1829	\N	19140	\N
57839	GENERIC_DAY	0	0	2010-07-11	1829	\N	19140	\N
19924	GENERIC_DAY	4	3	2010-08-12	1830	\N	19097	\N
19888	GENERIC_DAY	4	3	2010-08-11	1830	\N	19097	\N
19935	GENERIC_DAY	4	4	2010-04-26	1830	\N	19097	\N
19949	GENERIC_DAY	4	4	2010-07-07	1830	\N	19097	\N
19920	GENERIC_DAY	4	4	2010-05-10	1830	\N	19097	\N
19884	GENERIC_DAY	4	4	2010-07-20	1830	\N	19097	\N
19902	GENERIC_DAY	4	4	2010-07-01	1830	\N	19097	\N
19921	GENERIC_DAY	4	4	2010-05-18	1830	\N	19097	\N
19909	GENERIC_DAY	4	4	2010-07-12	1830	\N	19097	\N
19945	GENERIC_DAY	4	4	2010-04-15	1830	\N	19097	\N
19948	GENERIC_DAY	4	4	2010-04-22	1830	\N	19097	\N
19932	GENERIC_DAY	4	4	2010-05-03	1830	\N	19097	\N
19940	GENERIC_DAY	4	4	2010-06-01	1830	\N	19097	\N
19915	GENERIC_DAY	4	4	2010-07-21	1830	\N	19097	\N
19885	GENERIC_DAY	4	4	2010-07-06	1830	\N	19097	\N
19910	GENERIC_DAY	4	4	2010-06-30	1830	\N	19097	\N
19912	GENERIC_DAY	4	3	2010-08-03	1830	\N	19097	\N
19893	GENERIC_DAY	4	4	2010-04-28	1830	\N	19097	\N
19907	GENERIC_DAY	4	4	2010-04-12	1830	\N	19097	\N
19883	GENERIC_DAY	4	3	2010-08-18	1830	\N	19097	\N
19900	GENERIC_DAY	4	4	2010-06-02	1830	\N	19097	\N
19929	GENERIC_DAY	4	4	2010-05-31	1830	\N	19097	\N
19952	GENERIC_DAY	4	4	2010-06-16	1830	\N	19097	\N
19877	GENERIC_DAY	4	4	2010-06-14	1830	\N	19097	\N
19937	GENERIC_DAY	4	4	2010-07-13	1830	\N	19097	\N
19941	GENERIC_DAY	4	4	2010-07-08	1830	\N	19097	\N
19898	GENERIC_DAY	4	3	2010-08-10	1830	\N	19097	\N
19923	GENERIC_DAY	4	4	2010-06-17	1830	\N	19097	\N
19954	GENERIC_DAY	4	3	2010-07-26	1830	\N	19097	\N
19926	GENERIC_DAY	4	3	2010-08-23	1830	\N	19097	\N
19942	GENERIC_DAY	4	4	2010-04-06	1830	\N	19097	\N
19879	GENERIC_DAY	4	4	2010-07-15	1830	\N	19097	\N
19904	GENERIC_DAY	4	4	2010-05-06	1830	\N	19097	\N
19891	GENERIC_DAY	4	4	2010-04-27	1830	\N	19097	\N
19934	GENERIC_DAY	4	4	2010-07-19	1830	\N	19097	\N
19919	GENERIC_DAY	4	4	2010-04-13	1830	\N	19097	\N
19950	GENERIC_DAY	4	4	2010-05-25	1830	\N	19097	\N
19916	GENERIC_DAY	4	4	2010-06-07	1830	\N	19097	\N
19925	GENERIC_DAY	4	4	2010-05-24	1830	\N	19097	\N
19930	GENERIC_DAY	4	4	2010-04-01	1830	\N	19097	\N
19906	GENERIC_DAY	4	3	2010-07-28	1830	\N	19097	\N
19905	GENERIC_DAY	4	4	2010-05-13	1830	\N	19097	\N
19880	GENERIC_DAY	4	3	2010-08-02	1830	\N	19097	\N
19903	GENERIC_DAY	4	4	2010-06-10	1830	\N	19097	\N
19944	GENERIC_DAY	4	4	2010-06-09	1830	\N	19097	\N
19922	GENERIC_DAY	4	3	2010-07-29	1830	\N	19097	\N
56701	GENERIC_DAY	1	9	2010-04-21	1826	\N	19141	\N
56705	GENERIC_DAY	1	0	2010-05-02	1826	\N	19141	\N
56711	GENERIC_DAY	1	0	2010-04-25	1826	\N	19141	\N
56722	GENERIC_DAY	1	0	2010-04-24	1826	\N	19141	\N
56700	GENERIC_DAY	1	9	2010-04-27	1826	\N	19141	\N
56728	GENERIC_DAY	1	9	2010-05-10	1826	\N	19141	\N
56721	GENERIC_DAY	1	0	2010-04-17	1826	\N	19141	\N
56723	GENERIC_DAY	1	0	2010-05-08	1826	\N	19141	\N
56718	GENERIC_DAY	1	4	2010-04-16	1826	\N	19141	\N
56699	GENERIC_DAY	1	9	2010-04-26	1826	\N	19141	\N
56695	GENERIC_DAY	1	9	2010-04-13	1826	\N	19141	\N
56698	GENERIC_DAY	1	9	2010-04-15	1826	\N	19141	\N
56707	GENERIC_DAY	1	9	2010-04-14	1826	\N	19141	\N
56709	GENERIC_DAY	1	9	2010-05-12	1826	\N	19141	\N
56713	GENERIC_DAY	1	9	2010-05-11	1826	\N	19141	\N
56704	GENERIC_DAY	1	9	2010-04-28	1826	\N	19141	\N
56714	GENERIC_DAY	1	9	2010-04-22	1826	\N	19141	\N
56708	GENERIC_DAY	1	9	2010-04-19	1826	\N	19141	\N
56725	GENERIC_DAY	1	4	2010-05-07	1826	\N	19141	\N
56719	GENERIC_DAY	1	9	2010-04-29	1826	\N	19141	\N
52082	SPECIFIC_DAY	5	9	2010-04-28	1832	7283	\N	\N
52099	SPECIFIC_DAY	5	6	2010-04-15	1832	7283	\N	\N
52098	SPECIFIC_DAY	5	9	2010-05-05	1832	7283	\N	\N
52089	SPECIFIC_DAY	5	1	2010-04-05	1832	7283	\N	\N
52077	SPECIFIC_DAY	5	2	2010-04-01	1832	7283	\N	\N
52097	SPECIFIC_DAY	5	1	2010-04-08	1832	7283	\N	\N
52078	SPECIFIC_DAY	5	2	2010-03-23	1832	7283	\N	\N
52087	SPECIFIC_DAY	5	6	2010-04-20	1832	7283	\N	\N
52088	SPECIFIC_DAY	5	6	2010-04-22	1832	7283	\N	\N
52094	SPECIFIC_DAY	5	9	2010-05-04	1832	7283	\N	\N
52096	SPECIFIC_DAY	5	2	2010-03-16	1832	7283	\N	\N
52093	SPECIFIC_DAY	5	2	2010-03-30	1832	7283	\N	\N
52095	SPECIFIC_DAY	5	2	2010-03-17	1832	7283	\N	\N
52083	SPECIFIC_DAY	5	2	2010-03-08	1832	7283	\N	\N
52076	SPECIFIC_DAY	5	9	2010-04-29	1832	7283	\N	\N
52090	SPECIFIC_DAY	5	1	2010-04-07	1832	7283	\N	\N
52079	SPECIFIC_DAY	5	6	2010-04-14	1832	7283	\N	\N
52081	SPECIFIC_DAY	5	2	2010-03-25	1832	7283	\N	\N
52091	SPECIFIC_DAY	5	2	2010-03-10	1832	7283	\N	\N
52085	SPECIFIC_DAY	5	9	2010-05-03	1832	7283	\N	\N
52092	SPECIFIC_DAY	5	6	2010-04-19	1832	7283	\N	\N
52080	SPECIFIC_DAY	5	2	2010-03-31	1832	7283	\N	\N
52086	SPECIFIC_DAY	5	2	2010-03-18	1832	7283	\N	\N
52084	SPECIFIC_DAY	5	2	2010-03-22	1832	7283	\N	\N
52110	SPECIFIC_DAY	5	2	2010-03-24	1832	7283	\N	\N
52114	SPECIFIC_DAY	5	9	2010-05-06	1832	7283	\N	\N
52106	SPECIFIC_DAY	5	1	2010-04-23	1832	7283	\N	\N
52101	SPECIFIC_DAY	5	8	2010-05-10	1832	7283	\N	\N
52107	SPECIFIC_DAY	5	4	2010-05-07	1832	7283	\N	\N
52115	SPECIFIC_DAY	5	9	2010-04-27	1832	7283	\N	\N
52113	SPECIFIC_DAY	5	6	2010-04-13	1832	7283	\N	\N
52117	SPECIFIC_DAY	5	9	2010-04-26	1832	7283	\N	\N
52111	SPECIFIC_DAY	5	2	2010-03-29	1832	7283	\N	\N
52103	SPECIFIC_DAY	5	2	2010-03-15	1832	7283	\N	\N
52109	SPECIFIC_DAY	5	4	2010-04-30	1832	7283	\N	\N
52108	SPECIFIC_DAY	5	2	2010-04-09	1832	7283	\N	\N
52116	SPECIFIC_DAY	5	2	2010-03-09	1832	7283	\N	\N
52112	SPECIFIC_DAY	5	6	2010-04-21	1832	7283	\N	\N
52105	SPECIFIC_DAY	5	6	2010-04-12	1832	7283	\N	\N
52104	SPECIFIC_DAY	5	1	2010-04-06	1832	7283	\N	\N
52100	SPECIFIC_DAY	5	1	2010-04-16	1832	7283	\N	\N
52102	SPECIFIC_DAY	5	2	2010-03-11	1832	7283	\N	\N
7590	SPECIFIC_DAY	5	2	2010-04-02	1836	7279	\N	\N
7603	SPECIFIC_DAY	5	5	2010-03-16	1836	7279	\N	\N
7594	SPECIFIC_DAY	5	5	2010-03-23	1836	7279	\N	\N
7584	SPECIFIC_DAY	5	5	2010-04-01	1836	7279	\N	\N
7580	SPECIFIC_DAY	5	2	2010-03-26	1836	7279	\N	\N
7600	SPECIFIC_DAY	5	0	2010-03-20	1836	7279	\N	\N
7581	SPECIFIC_DAY	5	5	2010-03-22	1836	7279	\N	\N
7588	SPECIFIC_DAY	5	5	2010-03-15	1836	7279	\N	\N
7577	SPECIFIC_DAY	5	5	2010-03-30	1836	7279	\N	\N
7598	SPECIFIC_DAY	5	5	2010-03-25	1836	7279	\N	\N
7591	SPECIFIC_DAY	5	5	2010-03-18	1836	7279	\N	\N
7587	SPECIFIC_DAY	5	0	2010-04-04	1836	7279	\N	\N
7578	SPECIFIC_DAY	5	5	2010-03-17	1836	7279	\N	\N
7596	SPECIFIC_DAY	5	2	2010-03-19	1836	7279	\N	\N
7583	SPECIFIC_DAY	5	0	2010-03-14	1836	7279	\N	\N
7597	SPECIFIC_DAY	5	5	2010-03-29	1836	7279	\N	\N
7595	SPECIFIC_DAY	5	5	2010-03-08	1836	7279	\N	\N
7589	SPECIFIC_DAY	5	5	2010-03-31	1836	7279	\N	\N
7586	SPECIFIC_DAY	5	0	2010-03-21	1836	7279	\N	\N
7582	SPECIFIC_DAY	5	5	2010-04-06	1836	7279	\N	\N
7604	SPECIFIC_DAY	5	2	2010-04-07	1836	7279	\N	\N
7602	SPECIFIC_DAY	5	0	2010-03-28	1836	7279	\N	\N
7599	SPECIFIC_DAY	5	5	2010-03-24	1836	7279	\N	\N
7585	SPECIFIC_DAY	5	0	2010-03-13	1836	7279	\N	\N
7592	SPECIFIC_DAY	5	2	2010-03-12	1836	7279	\N	\N
7579	SPECIFIC_DAY	5	5	2010-03-11	1836	7279	\N	\N
7593	SPECIFIC_DAY	5	0	2010-04-03	1836	7279	\N	\N
7601	SPECIFIC_DAY	5	0	2010-03-27	1836	7279	\N	\N
7576	SPECIFIC_DAY	5	5	2010-04-05	1836	7279	\N	\N
19946	GENERIC_DAY	4	4	2010-07-05	1830	\N	19097	\N
19878	GENERIC_DAY	4	3	2010-08-16	1830	\N	19097	\N
19889	GENERIC_DAY	4	4	2010-06-08	1830	\N	19097	\N
19917	GENERIC_DAY	4	4	2010-05-27	1830	\N	19097	\N
19943	GENERIC_DAY	4	4	2010-06-29	1830	\N	19097	\N
19953	GENERIC_DAY	4	3	2010-08-04	1830	\N	19097	\N
19911	GENERIC_DAY	4	4	2010-04-08	1830	\N	19097	\N
19938	GENERIC_DAY	4	4	2010-06-15	1830	\N	19097	\N
19908	GENERIC_DAY	4	4	2010-04-29	1830	\N	19097	\N
19914	GENERIC_DAY	4	4	2010-07-14	1830	\N	19097	\N
19951	GENERIC_DAY	4	4	2010-04-14	1830	\N	19097	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY dependency (id, version, origin, destination, type) FROM stdin;
5472268	5	3838	3839	0
5472265	5	3838	3839	0
5472269	5	3842	3844	0
5472266	5	3842	3844	0
5472267	5	16572	3844	0
5472270	5	16572	3844	0
1441844	7	4547	3440	0
1441817	7	4547	3440	0
1442079	8	4547	3440	0
1310720	12	3437	3441	0
1442075	8	3434	3435	0
1441803	7	3434	3435	0
1441805	7	3434	3435	0
1441814	7	3434	3435	0
1441840	7	3434	3435	0
1441804	7	3435	3436	0
1441815	7	3435	3436	0
1441841	7	3435	3436	0
1441806	7	3435	3436	0
1442076	8	3435	3436	0
1442077	8	3438	3439	1
1441842	7	3438	3439	1
1441843	7	3439	3440	0
1441807	7	3439	3440	0
1442078	8	3439	3440	0
1441816	7	3439	3440	0
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
48481	Observaciones	
48480	Observaciones	
48482	Observaciones	
48483	Observaciones	
\.


--
-- Data for Name: description_values_in_line; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY description_values_in_line (description_value_id, fieldname, value) FROM stdin;
48585	Incidencias	
48586	Incidencias	
48587	Incidencias	Orden jefe
48588	Incidencias	
48589	Incidencias	
48581	Incidencias	
48583	Incidencias	
48584	Incidencias	
48582	Incidencias	
48590	Incidencias	
48591	Incidencias	Orden jefe
48592	Incidencias	
48593	Incidencias	
48594	Incidencias	
48595	Incidencias	
48596	Incidencias	
48597	Incidencias	
48598	Incidencias	
48599	Incidencias	
\.


--
-- Data for Name: directadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY directadvanceassignment (advance_assignment_id, direct_order_element_id, maxvalue) FROM stdin;
40501	2123	100.00
42248	2630	5.00
42254	2631	10.00
42255	2632	15.00
42271	2633	10.00
57394	2636	100.00
57401	53640	5.00
57402	53641	10.00
57403	53642	15.00
57389	53634	100.00
57387	53632	100.00
57397	53636	5.00
57398	53638	15.00
42256	2641	100.00
42268	2640	5.00
42274	2643	15.00
42310	2644	10.00
57391	2647	100.00
\.


--
-- Data for Name: external_company; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY external_company (id, version, name, nif, client, subcontractor, interactswithapplications, appuri, ourcompanylogin, ourcompanypassword, companyuser) FROM stdin;
1010	1	Navantia	B84076397	t	f	f	\N	\N	\N	\N
1011	1	Vulcano	A36600740	t	f	f	\N	\N	\N	\N
1012	1	Factoría Naval de Marín	A15000649	t	f	f	\N	\N	\N	\N
4242	6	Empresa CURSO2	A0002	t	t	t	http://localhost:8180/navalplan-ferrol/	curso1	curso1	4141
\.


--
-- Data for Name: generic_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY generic_resource_allocation (resource_allocation_id) FROM stdin;
4698
19097
19098
19117
19139
19140
19141
19142
19143
\.


--
-- Data for Name: heading_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY heading_field (heading_id, fieldname, length, positionnumber) FROM stdin;
47167	Observaciones	40	0
47168	Observaciones	40	0
\.


--
-- Data for Name: hibernate_unique_key; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hibernate_unique_key (next_hi) FROM stdin;
590
\.


--
-- Data for Name: hour_cost; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hour_cost (id, version, pricecost, initdate, enddate, type_of_work_hours_id, cost_category_id, code) FROM stdin;
59186	1	25.00	2010-01-01	2010-05-31	48381	59085	77807f57-72d4-4c76-823b-c84bcf572e23
\.


--
-- Data for Name: hoursgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY hoursgroup (id, version, code, resourcetype, workinghours, percentage, fixedpercentage, parent_order_line, order_line_template) FROM stdin;
53752	2	8c3505c8-2aa4-4980-973b-0e2bd5b709b6	WORKER	200	1.00	f	\N	58100
53753	2	a30e6450-7703-4169-817b-7ebeca7bbb37	WORKER	200	1.00	f	\N	58101
53754	2	92b2c71d-a37b-4788-a498-088abc864080	WORKER	100	1.00	f	\N	58102
53733	5	Ped-00006-00001-00001	WORKER	200	1.00	f	53634	\N
2323	18	Ped-00001-00003-00001	WORKER	100	1.00	f	2124	\N
2324	18	Ped-00001-00004-00001	WORKER	100	1.00	f	2125	\N
53732	10	Ped-00005-00001-00001	WORKER	0	1.00	f	53632	\N
2731	17	Ped-00001-00008-00001	WORKER	200	1.00	f	2630	\N
2732	17	Ped-00001-00009-00001	WORKER	200	1.00	f	2631	\N
2733	17	Ped-00001-00010-00001	WORKER	100	1.00	f	2632	\N
53755	1	b2054506-1397-42db-a0c7-f9f651aaba7d	WORKER	350	1.00	f	\N	58104
53756	1	53052b07-0843-49b3-a959-235ab204957f	WORKER	200	1.00	f	\N	58105
53757	1	08a59c34-ff77-45c2-b4bb-7aa6491819bb	WORKER	100	1.00	f	\N	58106
2738	11	Ped-00004-00002-00001	WORKER	100	1.00	f	2638	\N
2737	11	Ped-00004-00001-00001	WORKER	100	1.00	f	2637	\N
2740	11	Ped-00004-00004-00001	WORKER	350	1.00	f	2640	\N
2739	11	Ped-00004-00003-00001	WORKER	200	1.00	f	2639	\N
2741	10	Ped-00004-00007-00001	WORKER	100	1.00	f	2643	\N
2742	9	Ped-00004-00009-00001	WORKER	300	1.00	f	2645	\N
2743	9	Ped-00004-00010-00001	WORKER	250	1.00	f	2646	\N
2744	9	Ped-00004-00011-00001	WORKER	200	1.00	f	2647	\N
2734	16	Ped-00001-00012-00001	WORKER	300	1.00	f	2634	\N
2735	16	Ped-00001-00013-00001	WORKER	250	1.00	f	2635	\N
2736	16	Ped-00001-00014-00001	WORKER	200	1.00	f	2636	\N
53761	6	Ped-00001-00016-00001	WORKER	200	1.00	f	53640	\N
53762	6	Ped-00001-00017-00001	WORKER	200	1.00	f	53641	\N
53763	6	Ped-00001-00018-00001	WORKER	100	1.00	f	53642	\N
53758	2	Ped-00004-00013-00001	WORKER	350	1.00	f	53636	\N
53759	2	Ped-00004-00014-00001	WORKER	200	1.00	f	53637	\N
53760	2	Ped-00004-00015-00001	WORKER	100	1.00	f	53638	\N
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
1420	8	0
1420	8	1
1420	8	2
1420	8	3
1420	8	4
1421	9	0
1421	9	1
1421	9	2
1421	9	3
1421	4	4
1422	4	0
1422	4	1
1422	4	2
1422	4	3
1422	4	4
1422	0	5
1422	0	6
1423	9	0
1423	9	1
1423	9	2
1423	9	3
1423	4	4
1424	9	0
1424	9	1
1424	9	2
1424	9	3
1424	4	4
1425	9	0
1425	9	1
1425	9	2
1425	9	3
1425	4	4
1427	9	0
1427	9	1
1427	9	2
1427	9	3
1427	4	4
\.


--
-- Data for Name: indirectadvanceassignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY indirectadvanceassignment (advance_assignment_id, indirect_order_element_id) FROM stdin;
2223	2123
42249	2126
57395	2633
2828	2633
57404	53639
57405	53639
57390	53633
42312	53633
40502	2122
42250	2122
57396	2122
57388	53631
42311	53631
57399	53635
57400	53635
2829	2641
42269	2642
2830	2642
57392	2644
2831	2644
57393	2133
42270	2133
42257	2133
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label (id, version, code, name, label_type_id) FROM stdin;
1717	1	6f5eb7d4-38b7-47bd-8c9d-84054666defd	Urgente	1616
1718	1	984aec0f-c287-4c80-824e-fb552001d09e	Baja	1616
1719	1	be3b0910-22e4-4ce2-8efa-03951cd17c98	Muy urgente	1616
1720	1	dbb10b37-44f0-430d-8314-470487b245f9	Media	1616
1721	1	450bba6c-00b9-4c00-a375-89487d654714	Centro de coste 4	1617
1722	1	a2259c67-45ab-4f7c-bc18-ba3c75ddebb6	Centro de coste 3	1617
1723	1	6d9021b0-47f4-451e-94e7-61eecb8a9cb6	Centro de coste 2	1617
1724	1	91276c4b-3485-465f-b7c5-4c3203c63f40	Centro de coste 1	1617
1725	1	bc69057e-9b87-42ae-abfd-43d92279628b	Portugal	1618
1726	1	a42503cf-5e0f-41a2-bb50-5e05bf575885	Estados Unidos	1618
1727	1	670165e8-5c4a-461b-8ffc-71d91929c015	Reino Unido	1618
1728	1	ab888059-ce38-4b02-a6e4-f81f5fd0c1ca	España	1618
1729	1	0612aa63-9ba8-4b21-a8c1-bc025ba728eb	Brasil	1618
1730	1	928f1e0f-1d42-4f06-be76-0cde4e2ac4f6	Grupo 3	1619
1731	1	ad655a6e-9ec4-4113-815a-19730b8aeac2	Grupo 1	1619
1732	1	9eed3ed7-e3d6-40c8-8f90-afc91fef3eda	Grupo 2	1619
1733	1	5c3559d4-4f54-441e-a42f-fb9f0bd0e914	Grupo 5	1619
1734	1	aac4017f-67c7-4c82-84c4-35b407dc60ea	Grupo 4	1619
1737	2	6835e86c-021b-4fb1-92e4-b11bbab5b098	Risco medio	1620
1736	2	33162f2e-949d-449d-833f-00c2be87d996	Sen Risco	1620
1738	2	25fed97b-e2e0-44bb-995a-9a8077562ad5	Risco alto	1620
1735	2	8f65dc27-e8c4-4678-a8b2-da25f6da2092	Risco baixo	1620
\.


--
-- Data for Name: label_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY label_type (id, version, code, name) FROM stdin;
1616	1	91d90c7e-7def-4b0e-a4ec-0c4145878216	Prioridad
1617	1	5591f2fb-6963-44b0-8bd5-1d45f40cebde	Centro de coste
1618	1	b5a2f04a-e211-4277-a4e5-869668f513f5	Nacionalidad de cliente
1619	1	d2c96878-bbef-463d-aba3-33ed9a6820ba	Grupo
1620	2	622ee71f-e707-4e0a-b5d9-0e96664444c6	Nivel de risco do traballo
\.


--
-- Data for Name: line_field; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY line_field (heading_id, fieldname, length, positionnumber) FROM stdin;
47167	Incidencias	20	0
47168	Incidencias	20	0
\.


--
-- Data for Name: machine; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY machine (machine_id, name, description) FROM stdin;
1822	Chaflanadoras	Te chaflan que no veas
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

COPY material_category (id, version, name, parent_id) FROM stdin;
808	1	Imported materials without category	\N
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
911	2	wsreader	9134100ea9446b87a04cda86febe02900e53ca5af2f5b9422c5120bc3291079a7de3ea91ec72e944167e3fbcb97d35a2a904ee66bacf3727a67f7e5bf9fdaadc	\N	f
912	1	wswriter	a3d23705b1bb5ededfc890707b8e3331760206a6ceb213469fdf320dbe889170c2da17106005c5d057c51462621d7d77f33e005e6b9f1cddec6fa8c9b7a66eb8	\N	f
913	1	grupo1	ac06fb871673020d21d8bbbc390a145c3ce7c463f28ded021f85058755ba53afcd230df2fa5a1363200b656f2a8c572e30c84bcfcd181113e7279d49c8be7674	\N	f
914	1	grupo2	5d07b3c8c0854786a9e7d5e8fa6988b1ae7792c8f413849702e82035f58a5517b14eb8a480434f0ee64d8b0bc6ae4a262cc899c6c62df2a7f222f89be6ea4513	\N	f
915	1	grupo3	a4fdf00e4b23f97a5c6147e409ece60abb4440d70356347e3cf43a0e11cce2b528d02beef609ccb644297d131d64ca44a4461bdb626470aefc19a0b28f7dfb18	\N	f
916	1	grupo4	e54d1eb4d3eca1c6fb0f33dafa6496fdb86c3850ddfc89f1b1022cf7f253e6eb11416cfbabf62d503dec883d9a239e2df2ad48ada7125251af4d09808e04283f	\N	f
917	1	grupo5	3eff3ae4c978b369b3076d0103311b6d528987d9b76a5f8057377c0ad186f7da84fdd675dc6bca3559709b18e5c84de221845e7690588c9bebabb7948a29a3cc	\N	f
910	4	admin	1aab28c08d6c6ded90347d547b2e4cf2e433bf1916af13fed479f9614ec224136aa758ef24ff0bdf5086ea3516195c7a7893d5427666681b087e032d9ad1df3c	\N	f
4141	1	curso2	1ca6a8b3e35c32b0d9637f0713acfe2d6bf9a25ef7f5e385f6d388018c165a505e770db0057a04cc17635a826c1660b325d17ee80d31f52dfdfce3ab1b1bd8e8	curso2@navalplan.org	f
\.


--
-- Data for Name: order_authorization; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY order_authorization (id, order_authorization_subclass, version, authorizationtype, order_id, user_id, profile_id) FROM stdin;
2526	USER	11	WRITE_AUTHORIZATION	2133	915	\N
2525	USER	17	WRITE_AUTHORIZATION	2122	913	\N
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
53633	\N	\N	t	1	10000.00	0.00	200	ped_gr1_cu1	\N	1	4242	1314
53631	\N	\N	t	1	10000.00	0.00	0	ped_gr1_cu1	\N	1	4242	1314
2133	Pablo 	\N	t	15	100000.00	0.00	2250	\N	\N	0	\N	1321
2122	Maica	\N	t	18	100000.00	0.00	1950	\N	\N	0	1011	1321
\.


--
-- Data for Name: orderelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelement (id, version, name, description, code, initdate, deadline, schedulingstatetype, parent, template, externalcode, positionincontainer) FROM stdin;
2646	9	Cama y mesilla de camarote A	\N	Ped-00004-00010	\N	\N	0	2644	\N	\N	1
2647	10	Poner escotillas en camarote A	\N	Ped-00004-00011	\N	\N	0	2644	\N	\N	2
2122	20	Pedido Grupo 1	\N	Ped-00001	2010-03-08 00:00:00	2010-06-01 00:00:00	3	\N	\N	\N	\N
2123	18	Coordinación	\N	Ped-00001-00001	\N	\N	0	2122	\N	\N	0
2124	18	Reuniones con el cliente	\N	Ped-00001-00003	\N	\N	1	2123	\N	\N	0
2125	18	Reuniones con trabajadores	\N	Ped-00001-00004	\N	\N	1	2123	\N	\N	1
2126	18	Bloque 1	\N	Ped-00001-00002	\N	\N	3	2122	\N	\N	1
2630	17	Soldar uniones a techo	\N	Ped-00001-00008	\N	\N	0	2126	\N	\N	0
2631	17	Soldar uniones a suelo	\N	Ped-00001-00009	\N	\N	0	2126	\N	\N	1
2632	17	Repasar soldaduras huecos	\N	Ped-00001-00010	\N	\N	0	2126	\N	\N	2
2633	17	Bloque 2	\N	Ped-00001-00011	\N	\N	3	2122	\N	\N	2
53635	2	Modelo -Bloque 1 Grupo 3	\N	Ped-00004-00012	\N	\N	0	2133	58103	\N	3
53633	5	pedido do grupo 2 do curso2	\N	Ped-00006	2010-08-10 00:00:00	2010-12-01 00:00:00	4	\N	\N	\N	\N
53634	5	Illar camarote C	\N	Ped-00006-00001	2010-08-10 00:00:00	2010-12-01 00:00:00	4	53633	\N	PREFIX-00013-00014	0
2634	16	Techo de madera de camarote A	\N	Ped-00001-00012	\N	\N	0	2633	\N	\N	0
2635	16	Cama y mesilla de camarote A	\N	Ped-00001-00013	\N	\N	0	2633	\N	\N	1
2636	17	Poner escotillas camarote A	\N	Ped-00001-00014	\N	\N	0	2633	\N	\N	2
53636	2	Pintar camarotes A y B	\N	Ped-00004-00013	\N	\N	1	53635	58104	\N	0
53637	2	Pintar sala de maquinas	\N	Ped-00004-00014	\N	\N	1	53635	58105	\N	1
53638	2	Pintar cocina de buque	\N	Ped-00004-00015	\N	\N	1	53635	58106	\N	2
53631	10	pedido do grupo 1 do curso 2	\N	Ped-00005	2010-10-15 00:00:00	2010-12-01 00:00:00	4	\N	\N	\N	\N
53632	10	Poñer escotillas camarote A	\N	Ped-00005-00001	2010-10-15 00:00:00	2010-12-01 00:00:00	4	53631	\N	PREFIX-00014-00011	0
2133	14	Pedido Grupo 3	\N	Ped-00004	2010-03-08 00:00:00	2011-06-01 00:00:00	3	\N	\N	\N	\N
2641	10	Coordinacion	\N	Ped-00004-00005	\N	\N	3	2133	\N	\N	0
2638	11	Reuniones de cliente	\N	Ped-00004-00002	\N	\N	0	2641	\N	\N	0
2637	11	Reuniones con trabajadores	\N	Ped-00004-00001	\N	\N	0	2641	\N	\N	1
2642	10	Bloque 1	\N	Ped-00004-00006	\N	\N	0	2133	\N	\N	1
2640	11	Pintar camarotes A y B	\N	Ped-00004-00004	\N	\N	1	2642	\N	\N	0
2639	11	Pintar sala de maquinas	\N	Ped-00004-00003	\N	\N	1	2642	\N	\N	1
2643	10	Pintar cocina de buque	\N	Ped-00004-00007	\N	\N	1	2642	\N	\N	2
2644	10	Bloque 2	\N	Ped-00004-00008	\N	\N	3	2133	\N	\N	2
2645	9	Techo de madera de camarote A	\N	Ped-00004-00009	\N	\N	0	2644	\N	\N	0
53639	6	modelo Bloque 1 - Grupo1	\N	Ped-00001-00015	\N	\N	3	2122	58099	\N	3
53640	6	Soldar uniones a techo	\N	Ped-00001-00016	\N	\N	0	53639	58100	\N	0
53641	6	Soldar uniones a suelo	\N	Ped-00001-00017	\N	\N	0	53639	58101	\N	1
53642	6	Repasar soldaduras huecos	\N	Ped-00001-00018	\N	\N	0	53639	58102	\N	2
\.


--
-- Data for Name: orderelementtemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderelementtemplate (id, version, name, description, code, startasdaysfrombeginning, deadlineasdaysfrombeginning, schedulingstatetype, parent, positionincontainer) FROM stdin;
58103	1	Modelo -Bloque 1 Grupo 3	\N	Ped-00004-00006	\N	\N	0	\N	\N
58104	1	Pintar camarotes A y B	\N	Ped-00004-00004	\N	\N	1	58103	0
58105	1	Pintar sala de maquinas	\N	Ped-00004-00003	\N	\N	1	58103	1
58106	1	Pintar cocina de buque	\N	Ped-00004-00007	\N	\N	1	58103	2
58099	2	modelo Bloque 1 - Grupo1	\N	Ped-00001-00002	\N	\N	3	\N	\N
58100	2	Soldar uniones a techo	\N	Ped-00001-00008	\N	\N	0	58099	0
58101	2	Soldar uniones a suelo	\N	Ped-00001-00009	\N	\N	0	58099	1
58102	2	Repasar soldaduras huecos	\N	Ped-00001-00010	\N	\N	0	58099	2
\.


--
-- Data for Name: orderline; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderline (orderelementid, lasthoursgroupsequencecode) FROM stdin;
2124	1
2125	1
2630	1
2631	1
2632	1
2634	1
2635	1
2636	1
53634	1
53640	1
53641	1
53642	1
53632	1
53636	1
53637	1
53638	1
2638	1
2637	1
2640	1
2639	1
2643	1
2645	1
2646	1
2647	1
\.


--
-- Data for Name: orderlinegroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegroup (orderelementid) FROM stdin;
2122
2123
2126
2133
2633
2641
2642
2644
53631
53633
53635
53639
\.


--
-- Data for Name: orderlinegrouptemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinegrouptemplate (group_template_id) FROM stdin;
58099
58103
\.


--
-- Data for Name: orderlinetemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY orderlinetemplate (order_line_template_id, lasthoursgroupsequencecode) FROM stdin;
58104	0
58105	0
58106	0
58100	0
58101	0
58102	0
\.


--
-- Data for Name: ordersequence; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordersequence (id, version, prefix, lastvalue, numberofdigits, active) FROM stdin;
303	11	Ped	6	5	t
\.


--
-- Data for Name: ordertemplate; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY ordertemplate (order_template_id, base_calendar_id) FROM stdin;
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
58681	1	Formulario de calidad Grupo 1		0	t	58580
\.


--
-- Data for Name: quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY quality_form_items (quality_form_id, name, percentage, "position", idx) FROM stdin;
58681	Control de calidad 1	25.00	0	0
58681	Control de calidad 2	50.00	1	1
58681	Control de calidad 3	75.00	2	2
58681	Control de calidad 4	100.00	3	3
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resource (id, version, code, base_calendar_id) FROM stdin;
1822	1	cb218a2d-3a21-45b5-a880-9a96814d5002	1325
1820	4	216ccb38-3e0d-4772-ac69-f8a0134de43e	1324
1828	6	c5e371ab-8427-4d89-a511-56bc0f174931	1327
1834	3	6f0fe073-9b67-4cbd-a519-38962cf43ee4	1331
1830	9	03934d3a-9dcc-46b6-806b-fee4f10185dd	1329
1836	3	7af2eca6-fa57-4daa-864f-c7a0b1e1807f	1333
1832	8	24772671-8816-430c-b7d3-6f07285e2d30	1336
1826	18	0cb1a05d-c6a3-49fa-b7a9-569005740d5c	1332
1829	23	a2a31110-b41c-47a5-8004-18ca17412630	1335
\.


--
-- Data for Name: resourceallocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourceallocation (id, version, resourcesperday, task, assignment_function) FROM stdin;
7279	6	0.60	3838	\N
7282	5	0.60	3839	\N
19097	4	0.42	3842	\N
19098	4	0.55	3843	\N
19117	2	1.00	3841	\N
19141	9	1.00	3434	\N
19142	9	1.00	3435	\N
19143	9	1.00	3436	\N
19139	11	0.00	3438	\N
4698	11	0.78	3438	47274
19140	9	0.55	3439	\N
7283	10	0.50	2424	47271
\.


--
-- Data for Name: resourcecalendar; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resourcecalendar (base_calendar_id, capacity) FROM stdin;
1325	1
1324	1
1326	1
1328	1
1330	1
1334	1
1327	1
1331	1
1329	1
1333	1
1336	1
1332	1
1335	1
\.


--
-- Data for Name: resources_cost_category_assignment; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY resources_cost_category_assignment (id, version, code, initdate, enddate, cost_category_id, resource_id) FROM stdin;
59287	1	229cd8ba-fe7b-46fb-a3d9-934d7ff99cf8	2010-03-03	2010-04-01	59085	1829
\.


--
-- Data for Name: specific_resource_allocation; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY specific_resource_allocation (resource_allocation_id, resource) FROM stdin;
7279	1836
7282	1836
7283	1832
\.


--
-- Data for Name: stretches; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretches (assignment_function_id, date, lengthpercentage, amountworkpercentage, stretch_position) FROM stdin;
47271	2010-04-09	0.50	0.20	0
47271	2010-04-25	0.75	0.50	1
47271	2010-05-11	1.00	1.00	2
47274	2010-08-11	0.50	0.20	0
47274	2010-08-29	0.75	0.50	1
47274	2010-09-17	1.00	1.00	2
\.


--
-- Data for Name: stretchesfunction; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY stretchesfunction (assignment_function_id, type) FROM stdin;
47270	0
47274	0
47271	0
\.


--
-- Data for Name: subcontractedtaskdata; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY subcontractedtaskdata (id, version, externalcompany, task_element_id, subcontratationdate, subcontractcommunicationdate, workdescription, subcontractprice, subcontractedcode, nodewithoutchildrenexported, labelsexported, materialassignmentsexported, hoursgroupsexported, state) FROM stdin;
1409026	5	4242	3841	2010-03-15 22:59:34.746	2010-03-15 23:15:46.818	Prueba1	30000.00	POTRO	\N	t	t	t	2
17956879	4	4242	3844	2010-03-18 19:01:13.696	2010-03-18 19:03:02.746	pedido del grupo3 de curso 1	10000.00	ped_gr1_cu1	\N	\N	\N	t	2
17956870	9	4242	3440	2010-03-18 19:00:21.964	2010-03-18 19:01:21.673	Pedido do grupo 1 do curso 1	10000.00	ped_gr1_cu1	t	t	t	t	2
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task (task_element_id, calculatedvalue, startconstrainttype, constraintdate, subcontrated_task_data_id) FROM stdin;
2424	1	0	\N	\N
3434	1	0	\N	\N
3435	1	0	\N	\N
3436	1	0	\N	\N
3438	2	0	\N	\N
3439	0	1	2010-05-09 00:00:00	\N
3440	1	2	2010-08-07 00:00:00	17956870
16574	1	0	\N	\N
16575	1	0	\N	\N
16576	1	0	\N	\N
3838	1	0	\N	\N
3839	1	0	\N	\N
3841	1	2	2010-03-08 00:00:00	\N
3842	2	0	\N	\N
3843	0	0	\N	\N
3844	1	2	2010-10-14 00:00:00	17956879
16573	1	0	\N	\N
\.


--
-- Data for Name: task_quality_form; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form (id, version, quality_form_id, order_element_id, reportadvance) FROM stdin;
58782	5	58681	2122	f
\.


--
-- Data for Name: task_quality_form_items; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_quality_form_items (task_quality_form_id, name, percentage, "position", passed, date, idx) FROM stdin;
58782	Control de calidad 2	50.00	1	f	\N	1
58782	Control de calidad 3	75.00	2	f	\N	2
58782	Control de calidad 4	100.00	3	f	\N	3
58782	Control de calidad 1	25.00	0	t	2010-03-20 00:00:00	0
\.


--
-- Data for Name: task_source_hours_groups; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY task_source_hours_groups (task_source_id, hours_group_id) FROM stdin;
2424	2323
2424	2324
3434	2731
3435	2732
3436	2733
3438	2734
3439	2735
3838	2738
3839	2737
3841	2739
3841	2740
3841	2741
3842	2742
3843	2743
3844	2744
16573	53758
16573	53760
16573	53759
3440	2736
16574	53761
16575	53762
16576	53763
\.


--
-- Data for Name: taskelement; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskelement (id, version, name, notes, startdate, enddate, deadline, parent, base_calendar_id, positioninparent) FROM stdin;
16572	4	Recepción material	\N	2010-10-14 00:00:00	2010-10-14 00:00:00	\N	3846	\N	3
3437	39	Bloque 1	\N	2010-03-08 00:00:00	2010-07-07 00:00:00	\N	2425	\N	1
3441	39	Bloque 2	\N	2010-07-07 00:00:00	2010-12-01 00:00:00	\N	2425	\N	2
4547	8	Recepción de material	\N	2010-07-04 17:00:00	2010-07-04 17:00:00	\N	2425	\N	3
16577	9	modelo Bloque 1 - Grupo1	\N	2010-03-08 00:00:00	2010-04-02 01:00:00	\N	2425	\N	4
2425	45	Pedido Grupo 1	\N	2010-03-08 00:00:00	2010-12-01 00:00:00	2010-06-01	\N	\N	\N
3838	15	Reuniones de cliente	\N	2010-03-08 00:00:00	2010-04-08 00:00:00	\N	3840	\N	0
3839	15	Reuniones con trabajadores	\N	2010-04-08 00:00:00	2010-05-11 00:00:00	\N	3840	\N	1
3841	19	Bloque 1	\N	2010-03-08 00:00:00	2010-08-03 00:00:00	\N	3846	\N	1
3842	15	Techo de madera de camarote A	\N	2010-03-08 00:00:00	2010-08-28 00:00:00	\N	3845	\N	0
3843	15	Cama y mesilla de camarote A	\N	2010-03-08 00:00:00	2010-08-08 00:00:00	\N	3845	\N	1
3844	16	Poner escotillas en camarote A	\N	2010-10-14 00:00:00	2010-12-01 00:00:00	\N	3845	\N	2
3840	20	Coordinacion	\N	2010-03-08 00:00:00	2010-05-11 00:00:00	\N	3846	\N	0
3845	20	Bloque 2	\N	2010-03-08 00:00:00	2010-12-01 00:00:00	\N	3846	\N	2
3846	20	Pedido Grupo 3	\N	2010-03-08 00:00:00	2010-12-01 00:00:00	2011-06-01	\N	\N	\N
16573	1	Modelo -Bloque 1 Grupo 3	\N	2010-03-08 00:00:00	2010-05-28 07:00:00	\N	3846	\N	4
2424	34	Coordinación	\N	2010-03-08 00:00:00	2010-05-11 00:00:00	\N	2425	\N	0
3434	31	Soldar uniones a techo	\N	2010-03-08 00:00:00	2010-05-13 00:00:00	\N	3437	\N	0
3435	31	Soldar uniones a suelo	\N	2010-05-13 00:00:00	2010-06-18 00:00:00	\N	3437	\N	1
3436	31	Repasar soldaduras huecos	\N	2010-06-18 00:00:00	2010-07-07 00:00:00	\N	3437	\N	2
3438	31	Techo de madera de camarote A	\N	2010-07-07 00:00:00	2010-09-17 00:00:00	\N	3441	\N	0
3439	31	Cama y mesilla de camarote A	\N	2010-07-07 00:00:00	2010-08-07 00:00:00	\N	3441	\N	1
3440	32	Poner escotillas camarote A	\N	2010-08-07 00:00:00	2010-12-01 00:00:00	\N	3441	\N	2
16574	5	Soldar uniones a techo	\N	2010-03-08 00:00:00	2010-04-02 01:00:00	\N	16577	\N	0
16575	5	Soldar uniones a suelo	\N	2010-03-08 00:00:00	2010-04-02 01:00:00	\N	16577	\N	1
16576	5	Repasar soldaduras huecos	\N	2010-03-08 00:00:00	2010-03-20 12:00:00	\N	16577	\N	2
\.


--
-- Data for Name: taskgroup; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskgroup (task_element_id) FROM stdin;
2425
3437
3441
3840
3845
3846
16577
\.


--
-- Data for Name: taskmilestone; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY taskmilestone (task_element_id) FROM stdin;
4547
16572
\.


--
-- Data for Name: tasksource; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY tasksource (id, version, orderelement) FROM stdin;
3840	6	2641
3845	6	2644
3846	6	2133
3838	11	2638
3839	11	2637
3841	11	2642
3842	11	2645
3843	11	2646
3844	11	2647
16573	1	53635
3437	14	2126
3441	14	2633
16577	5	53639
2425	17	2122
2424	33	2123
3434	27	2630
3435	27	2631
3436	27	2632
3438	27	2634
3439	27	2635
3440	27	2636
16574	9	53640
16575	9	53641
16576	9	53642
\.


--
-- Data for Name: type_of_work_hours; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY type_of_work_hours (id, version, name, code, defaultprice, enabled) FROM stdin;
48379	1	Nomral	nm	20.00	t
48380	1	Extra	ex	30.00	t
48381	2	Normal convenio metal	nm_metal	30.00	t
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
910	ROLE_ADMINISTRATION
910	ROLE_READ_ALL_ORDERS
910	ROLE_CREATE_ORDER
910	ROLE_EDIT_ALL_ORDERS
911	ROLE_WS_READER
912	ROLE_WS_WRITER
912	ROLE_WS_READER
913	ROLE_ADMINISTRATION
913	ROLE_CREATE_ORDER
913	ROLE_EDIT_ALL_ORDERS
914	ROLE_ADMINISTRATION
914	ROLE_CREATE_ORDER
914	ROLE_EDIT_ALL_ORDERS
915	ROLE_ADMINISTRATION
915	ROLE_CREATE_ORDER
915	ROLE_EDIT_ALL_ORDERS
916	ROLE_ADMINISTRATION
916	ROLE_CREATE_ORDER
916	ROLE_EDIT_ALL_ORDERS
917	ROLE_ADMINISTRATION
917	ROLE_CREATE_ORDER
917	ROLE_EDIT_ALL_ORDERS
4141	ROLE_WS_READER
4141	ROLE_WS_WRITER
\.


--
-- Data for Name: virtualworker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY virtualworker (virtualworker_id, observations) FROM stdin;
\.


--
-- Data for Name: work_report; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report (id, version, code, date, work_report_type_id, resource_id, order_element_id) FROM stdin;
48481	1	bd1a996e-02fc-4587-a0ce-65805a9d8a29	\N	47168	1832	\N
48480	2	7d947463-16cf-4f1b-a4d7-34dd8ff1130b	\N	47167	1836	\N
48482	1	3d1e8ee5-27e0-4b20-91d3-2767d414ae89	\N	47168	1826	\N
48483	1	5a85724a-f1ee-4d2a-9107-7b7898675486	\N	47167	1834	\N
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
48585	1	73c5c82b-5784-4296-963c-db85d5a0ed78	8	2010-03-05 00:00:00	\N	\N	48481	1832	2123	48379
48586	1	0b6d3584-5c51-4cb0-8276-3a784e8306e3	6	2010-03-03 00:00:00	\N	\N	48481	1832	2123	48379
48587	1	fd1a36fb-8153-44b1-8c3a-32155c3380f8	4	2010-03-08 00:00:00	\N	\N	48481	1832	2641	48379
48588	1	719a2d31-8560-4ec9-81e0-62e1bb473603	5	2010-03-04 00:00:00	\N	\N	48481	1832	2123	48379
48589	1	1cedf6d9-8532-4f68-96a1-20633a92ddbe	2	2010-03-05 00:00:00	\N	\N	48481	1832	2123	48380
48581	2	d77dd6fa-5435-42d0-b4f9-6ac79517fa89	5	2010-03-04 00:00:00	\N	\N	48480	1836	2641	48379
48583	2	bbb9a273-7457-4aa7-9461-b43fc578bee9	8	2010-03-05 00:00:00	\N	\N	48480	1836	2641	48379
48584	2	2302dee8-ea82-4d8d-ae46-875bdbad59f4	6	2010-03-03 00:00:00	\N	\N	48480	1836	2641	48379
48582	2	4e93e88a-5b64-4f6b-9be7-30a64ac57478	2	2010-03-05 00:00:00	\N	\N	48480	1836	2641	48380
48590	1	cd35e656-9637-4c7a-aa72-b7335ea7c2ea	8	2010-05-27 00:00:00	\N	\N	48482	1826	2632	48379
48591	1	4cf51520-3f45-4c44-9305-242991696aff	9	2010-05-31 00:00:00	\N	\N	48482	1826	2632	48379
48592	1	59b578cd-0b41-49bc-ba6e-c6e7e822b2dd	4	2010-05-28 00:00:00	\N	\N	48482	1826	2632	48380
48593	1	dcf17a2d-edc1-469f-ae0f-bd1a8f5f1ca8	9	2010-05-26 00:00:00	\N	\N	48482	1826	2632	48379
48594	1	3fc38913-3b80-4828-91de-8e0bae20451c	8	2010-05-25 00:00:00	\N	\N	48482	1826	2632	48379
48595	1	67029e7d-4b68-4363-b522-0ed086a07735	8	2010-05-27 00:00:00	\N	\N	48483	1834	2643	48379
48596	1	1477b6b5-a750-4271-ae9a-6a9946309e67	9	2010-03-31 00:00:00	\N	\N	48483	1834	2643	48379
48597	1	0747b738-42d4-48d0-aa51-5b175f6840d0	8	2010-05-25 00:00:00	\N	\N	48483	1834	2643	48379
48598	1	14fb408d-f295-42c7-99ef-5619fdbe357b	4	2010-05-28 00:00:00	\N	\N	48483	1834	2643	48380
48599	1	c7c1ff06-bddd-4697-841d-4897b0a5ef2c	9	2010-05-26 00:00:00	\N	\N	48483	1834	2643	48379
\.


--
-- Data for Name: work_report_type; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY work_report_type (id, version, name, code, dateissharedbylines, resourceissharedinlines, orderelementissharedinlines, hoursmanagement) FROM stdin;
47167	1	Tipo Grupo 3	tg3	f	t	f	0
47168	1	Tipo Grupo 1	tg1	f	t	f	0
\.


--
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: naval
--

COPY worker (worker_id, firstname, surname, nif) FROM stdin;
1820	Eduardo	Grande Fernández	09345678-E
1828	Rafúll	Torquemada Días	666666666S
1834	Alicia 	Muñoz Lages	6666666D
1830	Alfonso	Domínguez Baúl	5555555E
1836	Elias	Baeza Robles	7777777H
1832	Javier	Pérez Campos	5656565L
1826	Javier	Martínez Álvarez	11111111F
1829	María 	Pérez Mariño	22222222D
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

