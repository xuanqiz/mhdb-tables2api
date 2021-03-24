--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: assessments_age; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_age (
    id integer NOT NULL
);


ALTER TABLE public.assessments_age OWNER TO postgres;

--
-- Name: assessments_age_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_age_id_seq OWNER TO postgres;

--
-- Name: assessments_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_age_id_seq OWNED BY public.assessments_age.id;


--
-- Name: assessments_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_author (
    id integer NOT NULL,
    surname character varying(200) NOT NULL,
    first_initial character varying(1),
    middle_initial character varying(1)
);


ALTER TABLE public.assessments_author OWNER TO postgres;

--
-- Name: assessments_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_author_id_seq OWNER TO postgres;

--
-- Name: assessments_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_author_id_seq OWNED BY public.assessments_author.id;


--
-- Name: assessments_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_question (
    id integer NOT NULL,
    text character varying(200) NOT NULL
);


ALTER TABLE public.assessments_question OWNER TO postgres;

--
-- Name: assessments_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_question_id_seq OWNER TO postgres;

--
-- Name: assessments_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_question_id_seq OWNED BY public.assessments_question.id;


--
-- Name: assessments_question_questionaires; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_question_questionaires (
    id integer NOT NULL,
    question_id integer NOT NULL,
    questionnaire_id integer NOT NULL
);


ALTER TABLE public.assessments_question_questionaires OWNER TO postgres;

--
-- Name: assessments_question_questionaires_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_question_questionaires_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_question_questionaires_id_seq OWNER TO postgres;

--
-- Name: assessments_question_questionaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_question_questionaires_id_seq OWNED BY public.assessments_question_questionaires.id;


--
-- Name: assessments_questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    link character varying(200),
    description character varying(1500) NOT NULL,
    abbreviation character varying(50) NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    year integer NOT NULL,
    index_license integer,
    age_min smallint,
    age_max smallint,
    number_of_questions smallint,
    number_of_questions_with_ranges integer,
    minutes_to_complete integer,
    minutes_to_complete_with_ranges character varying(10),
    index_language_id integer,
    indices_reference_id integer,
    last_modified_by_id integer,
    CONSTRAINT assessments_questionnaire_age_max_check CHECK ((age_max >= 0)),
    CONSTRAINT assessments_questionnaire_age_min_check CHECK ((age_min >= 0)),
    CONSTRAINT assessments_questionnaire_index_license_check CHECK ((index_license >= 0)),
    CONSTRAINT assessments_questionnaire_minutes_to_complete_check CHECK ((minutes_to_complete >= 0)),
    CONSTRAINT assessments_questionnaire_number_of_questions_check CHECK ((number_of_questions >= 0)),
    CONSTRAINT assessments_questionnaire_number_of_questions_with_ranges_check CHECK ((number_of_questions_with_ranges >= 0)),
    CONSTRAINT assessments_questionnaire_year_check CHECK ((year >= 0))
);


ALTER TABLE public.assessments_questionnaire OWNER TO postgres;

--
-- Name: assessments_questionnaire_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_authors (
    id integer NOT NULL,
    questionnaire_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_authors OWNER TO postgres;

--
-- Name: assessments_questionnaire_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_authors_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_authors_id_seq OWNED BY public.assessments_questionnaire_authors.id;


--
-- Name: assessments_questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_id_seq OWNED BY public.assessments_questionnaire.id;


--
-- Name: assessments_questionnaire_indices_age; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_indices_age (
    id integer NOT NULL,
    questionnaire_id integer NOT NULL,
    age_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_indices_age OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_age_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_indices_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_indices_age_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_indices_age_id_seq OWNED BY public.assessments_questionnaire_indices_age.id;


--
-- Name: assessments_questionnaire_indices_disorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_indices_disorder (
    id integer NOT NULL,
    questionnaire_id integer NOT NULL,
    disordercategory_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_indices_disorder OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_disorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_indices_disorder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_indices_disorder_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_disorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_indices_disorder_id_seq OWNED BY public.assessments_questionnaire_indices_disorder.id;


--
-- Name: assessments_questionnaire_indices_respondent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_indices_respondent (
    id integer NOT NULL,
    questionnaire_id integer NOT NULL,
    respondent_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_indices_respondent OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_respondent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_indices_respondent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_indices_respondent_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_respondent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_indices_respondent_id_seq OWNED BY public.assessments_questionnaire_indices_respondent.id;


--
-- Name: assessments_questionnaire_indices_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_indices_subject (
    id integer NOT NULL,
    questionnaire_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_indices_subject OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_indices_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_indices_subject_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_indices_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_indices_subject_id_seq OWNED BY public.assessments_questionnaire_indices_subject.id;


--
-- Name: assessments_questionnaire_use_with_assessments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_questionnaire_use_with_assessments (
    id integer NOT NULL,
    from_questionnaire_id integer NOT NULL,
    to_questionnaire_id integer NOT NULL
);


ALTER TABLE public.assessments_questionnaire_use_with_assessments OWNER TO postgres;

--
-- Name: assessments_questionnaire_use_with_assessments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_questionnaire_use_with_assessments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_questionnaire_use_with_assessments_id_seq OWNER TO postgres;

--
-- Name: assessments_questionnaire_use_with_assessments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_questionnaire_use_with_assessments_id_seq OWNED BY public.assessments_questionnaire_use_with_assessments.id;


--
-- Name: assessments_reference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_reference (
    id integer NOT NULL,
    index integer NOT NULL,
    title character varying(300) NOT NULL,
    link character varying(200) NOT NULL,
    entry_date date NOT NULL,
    pubdate date,
    "PubMedID" integer,
    cogatlas_node_id integer,
    cogatlas_prop_id integer,
    last_modified_by_id integer,
    CONSTRAINT "assessments_reference_PubMedID_check" CHECK (("PubMedID" >= 0)),
    CONSTRAINT assessments_reference_cogatlas_node_id_check CHECK ((cogatlas_node_id >= 0)),
    CONSTRAINT assessments_reference_cogatlas_prop_id_check CHECK ((cogatlas_prop_id >= 0))
);


ALTER TABLE public.assessments_reference OWNER TO postgres;

--
-- Name: assessments_reference_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_reference_authors (
    id integer NOT NULL,
    reference_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.assessments_reference_authors OWNER TO postgres;

--
-- Name: assessments_reference_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_reference_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_reference_authors_id_seq OWNER TO postgres;

--
-- Name: assessments_reference_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_reference_authors_id_seq OWNED BY public.assessments_reference_authors.id;


--
-- Name: assessments_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_reference_id_seq OWNER TO postgres;

--
-- Name: assessments_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_reference_id_seq OWNED BY public.assessments_reference.id;


--
-- Name: assessments_respondent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_respondent (
    id integer NOT NULL
);


ALTER TABLE public.assessments_respondent OWNER TO postgres;

--
-- Name: assessments_respondent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_respondent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_respondent_id_seq OWNER TO postgres;

--
-- Name: assessments_respondent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_respondent_id_seq OWNED BY public.assessments_respondent.id;


--
-- Name: assessments_subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessments_subject (
    id integer NOT NULL
);


ALTER TABLE public.assessments_subject OWNER TO postgres;

--
-- Name: assessments_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assessments_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assessments_subject_id_seq OWNER TO postgres;

--
-- Name: assessments_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assessments_subject_id_seq OWNED BY public.assessments_subject.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: disorders_diagnosticcriterion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_diagnosticcriterion (
    id integer NOT NULL,
    diagnostic_criterion character varying(200) NOT NULL,
    equivalent_classes character varying(500) NOT NULL
);


ALTER TABLE public.disorders_diagnosticcriterion OWNER TO postgres;

--
-- Name: disorders_diagnosticcriterion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_diagnosticcriterion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_diagnosticcriterion_id_seq OWNER TO postgres;

--
-- Name: disorders_diagnosticcriterion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_diagnosticcriterion_id_seq OWNED BY public.disorders_diagnosticcriterion.id;


--
-- Name: disorders_diagnosticspecifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_diagnosticspecifier (
    id integer NOT NULL,
    diagnostic_specifier character varying(200) NOT NULL,
    equivalent_classes character varying(500) NOT NULL
);


ALTER TABLE public.disorders_diagnosticspecifier OWNER TO postgres;

--
-- Name: disorders_diagnosticspecifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_diagnosticspecifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_diagnosticspecifier_id_seq OWNER TO postgres;

--
-- Name: disorders_diagnosticspecifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_diagnosticspecifier_id_seq OWNED BY public.disorders_diagnosticspecifier.id;


--
-- Name: disorders_disorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_disorder (
    id integer NOT NULL,
    disorder character varying(200) NOT NULL,
    icd9cm character varying(100),
    icd10cm character varying(100),
    note character varying(500),
    index_diagnostic_specifier_id integer,
    index_disorder_category_id integer NOT NULL,
    index_severity_id integer
);


ALTER TABLE public.disorders_disorder OWNER TO postgres;

--
-- Name: disorders_disorder_equivalent_classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_disorder_equivalent_classes (
    id integer NOT NULL,
    disorder_id integer NOT NULL,
    equivalentclass_id integer NOT NULL
);


ALTER TABLE public.disorders_disorder_equivalent_classes OWNER TO postgres;

--
-- Name: disorders_disorder_equivalent_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_disorder_equivalent_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_disorder_equivalent_classes_id_seq OWNER TO postgres;

--
-- Name: disorders_disorder_equivalent_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_disorder_equivalent_classes_id_seq OWNED BY public.disorders_disorder_equivalent_classes.id;


--
-- Name: disorders_disorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_disorder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_disorder_id_seq OWNER TO postgres;

--
-- Name: disorders_disorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_disorder_id_seq OWNED BY public.disorders_disorder.id;


--
-- Name: disorders_disordercategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_disordercategory (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.disorders_disordercategory OWNER TO postgres;

--
-- Name: disorders_disordercategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_disordercategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_disordercategory_id_seq OWNER TO postgres;

--
-- Name: disorders_disordercategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_disordercategory_id_seq OWNED BY public.disorders_disordercategory.id;


--
-- Name: disorders_equivalentclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_equivalentclass (
    id integer NOT NULL
);


ALTER TABLE public.disorders_equivalentclass OWNER TO postgres;

--
-- Name: disorders_equivalentclass_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_equivalentclass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_equivalentclass_id_seq OWNER TO postgres;

--
-- Name: disorders_equivalentclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_equivalentclass_id_seq OWNED BY public.disorders_equivalentclass.id;


--
-- Name: disorders_icd10cm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_icd10cm (
    id integer NOT NULL,
    icd10cm character varying(50) NOT NULL
);


ALTER TABLE public.disorders_icd10cm OWNER TO postgres;

--
-- Name: disorders_icd10cm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_icd10cm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_icd10cm_id_seq OWNER TO postgres;

--
-- Name: disorders_icd10cm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_icd10cm_id_seq OWNED BY public.disorders_icd10cm.id;


--
-- Name: disorders_icd9cm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_icd9cm (
    id integer NOT NULL,
    icd9cm character varying(50) NOT NULL
);


ALTER TABLE public.disorders_icd9cm OWNER TO postgres;

--
-- Name: disorders_icd9cm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_icd9cm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_icd9cm_id_seq OWNER TO postgres;

--
-- Name: disorders_icd9cm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_icd9cm_id_seq OWNED BY public.disorders_icd9cm.id;


--
-- Name: disorders_severity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disorders_severity (
    id integer NOT NULL,
    severity character varying(50) NOT NULL,
    definition character varying(200) NOT NULL,
    equivalent_classes character varying(500)
);


ALTER TABLE public.disorders_severity OWNER TO postgres;

--
-- Name: disorders_severity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disorders_severity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disorders_severity_id_seq OWNER TO postgres;

--
-- Name: disorders_severity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disorders_severity_id_seq OWNED BY public.disorders_severity.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: resources_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resources_language (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    equivalent_classes character varying(100),
    parent_language_id integer
);


ALTER TABLE public.resources_language OWNER TO postgres;

--
-- Name: resources_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resources_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_language_id_seq OWNER TO postgres;

--
-- Name: resources_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resources_language_id_seq OWNED BY public.resources_language.id;


--
-- Name: assessments_age id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_age ALTER COLUMN id SET DEFAULT nextval('public.assessments_age_id_seq'::regclass);


--
-- Name: assessments_author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_author ALTER COLUMN id SET DEFAULT nextval('public.assessments_author_id_seq'::regclass);


--
-- Name: assessments_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question ALTER COLUMN id SET DEFAULT nextval('public.assessments_question_id_seq'::regclass);


--
-- Name: assessments_question_questionaires id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question_questionaires ALTER COLUMN id SET DEFAULT nextval('public.assessments_question_questionaires_id_seq'::regclass);


--
-- Name: assessments_questionnaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_id_seq'::regclass);


--
-- Name: assessments_questionnaire_authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_authors ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_authors_id_seq'::regclass);


--
-- Name: assessments_questionnaire_indices_age id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_age ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_indices_age_id_seq'::regclass);


--
-- Name: assessments_questionnaire_indices_disorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_disorder ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_indices_disorder_id_seq'::regclass);


--
-- Name: assessments_questionnaire_indices_respondent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_respondent ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_indices_respondent_id_seq'::regclass);


--
-- Name: assessments_questionnaire_indices_subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_subject ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_indices_subject_id_seq'::regclass);


--
-- Name: assessments_questionnaire_use_with_assessments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_use_with_assessments ALTER COLUMN id SET DEFAULT nextval('public.assessments_questionnaire_use_with_assessments_id_seq'::regclass);


--
-- Name: assessments_reference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference ALTER COLUMN id SET DEFAULT nextval('public.assessments_reference_id_seq'::regclass);


--
-- Name: assessments_reference_authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference_authors ALTER COLUMN id SET DEFAULT nextval('public.assessments_reference_authors_id_seq'::regclass);


--
-- Name: assessments_respondent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_respondent ALTER COLUMN id SET DEFAULT nextval('public.assessments_respondent_id_seq'::regclass);


--
-- Name: assessments_subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_subject ALTER COLUMN id SET DEFAULT nextval('public.assessments_subject_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: disorders_diagnosticcriterion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_diagnosticcriterion ALTER COLUMN id SET DEFAULT nextval('public.disorders_diagnosticcriterion_id_seq'::regclass);


--
-- Name: disorders_diagnosticspecifier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_diagnosticspecifier ALTER COLUMN id SET DEFAULT nextval('public.disorders_diagnosticspecifier_id_seq'::regclass);


--
-- Name: disorders_disorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder ALTER COLUMN id SET DEFAULT nextval('public.disorders_disorder_id_seq'::regclass);


--
-- Name: disorders_disorder_equivalent_classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder_equivalent_classes ALTER COLUMN id SET DEFAULT nextval('public.disorders_disorder_equivalent_classes_id_seq'::regclass);


--
-- Name: disorders_disordercategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disordercategory ALTER COLUMN id SET DEFAULT nextval('public.disorders_disordercategory_id_seq'::regclass);


--
-- Name: disorders_equivalentclass id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_equivalentclass ALTER COLUMN id SET DEFAULT nextval('public.disorders_equivalentclass_id_seq'::regclass);


--
-- Name: disorders_icd10cm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_icd10cm ALTER COLUMN id SET DEFAULT nextval('public.disorders_icd10cm_id_seq'::regclass);


--
-- Name: disorders_icd9cm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_icd9cm ALTER COLUMN id SET DEFAULT nextval('public.disorders_icd9cm_id_seq'::regclass);


--
-- Name: disorders_severity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_severity ALTER COLUMN id SET DEFAULT nextval('public.disorders_severity_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: resources_language id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources_language ALTER COLUMN id SET DEFAULT nextval('public.resources_language_id_seq'::regclass);


--
-- Data for Name: assessments_age; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_age (id) FROM stdin;
\.


--
-- Data for Name: assessments_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_author (id, surname, first_initial, middle_initial) FROM stdin;
\.


--
-- Data for Name: assessments_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_question (id, text) FROM stdin;
\.


--
-- Data for Name: assessments_question_questionaires; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_question_questionaires (id, question_id, questionnaire_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire (id, title, link, description, abbreviation, last_modified, year, index_license, age_min, age_max, number_of_questions, number_of_questions_with_ranges, minutes_to_complete, minutes_to_complete_with_ranges, index_language_id, indices_reference_id, last_modified_by_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_authors (id, questionnaire_id, author_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_indices_age; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_indices_age (id, questionnaire_id, age_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_indices_disorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_indices_disorder (id, questionnaire_id, disordercategory_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_indices_respondent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_indices_respondent (id, questionnaire_id, respondent_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_indices_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_indices_subject (id, questionnaire_id, subject_id) FROM stdin;
\.


--
-- Data for Name: assessments_questionnaire_use_with_assessments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_questionnaire_use_with_assessments (id, from_questionnaire_id, to_questionnaire_id) FROM stdin;
\.


--
-- Data for Name: assessments_reference; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_reference (id, index, title, link, entry_date, pubdate, "PubMedID", cogatlas_node_id, cogatlas_prop_id, last_modified_by_id) FROM stdin;
\.


--
-- Data for Name: assessments_reference_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_reference_authors (id, reference_id, author_id) FROM stdin;
\.


--
-- Data for Name: assessments_respondent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_respondent (id) FROM stdin;
\.


--
-- Data for Name: assessments_subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessments_subject (id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add age	7	add_age
26	Can change age	7	change_age
27	Can delete age	7	delete_age
28	Can view age	7	view_age
29	Can add author	8	add_author
30	Can change author	8	change_author
31	Can delete author	8	delete_author
32	Can view author	8	view_author
33	Can add respondent	9	add_respondent
34	Can change respondent	9	change_respondent
35	Can delete respondent	9	delete_respondent
36	Can view respondent	9	view_respondent
37	Can add subject	10	add_subject
38	Can change subject	10	change_subject
39	Can delete subject	10	delete_subject
40	Can view subject	10	view_subject
41	Can add reference	11	add_reference
42	Can change reference	11	change_reference
43	Can delete reference	11	delete_reference
44	Can view reference	11	view_reference
45	Can add questionnaire	12	add_questionnaire
46	Can change questionnaire	12	change_questionnaire
47	Can delete questionnaire	12	delete_questionnaire
48	Can view questionnaire	12	view_questionnaire
49	Can add question	13	add_question
50	Can change question	13	change_question
51	Can delete question	13	delete_question
52	Can view question	13	view_question
53	Can add language	14	add_language
54	Can change language	14	change_language
55	Can delete language	14	delete_language
56	Can view language	14	view_language
57	Can add diagnostic criterion	15	add_diagnosticcriterion
58	Can change diagnostic criterion	15	change_diagnosticcriterion
59	Can delete diagnostic criterion	15	delete_diagnosticcriterion
60	Can view diagnostic criterion	15	view_diagnosticcriterion
61	Can add diagnostic specifier	16	add_diagnosticspecifier
62	Can change diagnostic specifier	16	change_diagnosticspecifier
63	Can delete diagnostic specifier	16	delete_diagnosticspecifier
64	Can view diagnostic specifier	16	view_diagnosticspecifier
65	Can add disorder category	17	add_disordercategory
66	Can change disorder category	17	change_disordercategory
67	Can delete disorder category	17	delete_disordercategory
68	Can view disorder category	17	view_disordercategory
69	Can add equivalent class	18	add_equivalentclass
70	Can change equivalent class	18	change_equivalentclass
71	Can delete equivalent class	18	delete_equivalentclass
72	Can view equivalent class	18	view_equivalentclass
73	Can add icd10 cm	19	add_icd10cm
74	Can change icd10 cm	19	change_icd10cm
75	Can delete icd10 cm	19	delete_icd10cm
76	Can view icd10 cm	19	view_icd10cm
77	Can add icd9 cm	20	add_icd9cm
78	Can change icd9 cm	20	change_icd9cm
79	Can delete icd9 cm	20	delete_icd9cm
80	Can view icd9 cm	20	view_icd9cm
81	Can add severity	21	add_severity
82	Can change severity	21	change_severity
83	Can delete severity	21	delete_severity
84	Can view severity	21	view_severity
85	Can add disorder	22	add_disorder
86	Can change disorder	22	change_disorder
87	Can delete disorder	22	delete_disorder
88	Can view disorder	22	view_disorder
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: disorders_diagnosticcriterion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_diagnosticcriterion (id, diagnostic_criterion, equivalent_classes) FROM stdin;
\.


--
-- Data for Name: disorders_diagnosticspecifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_diagnosticspecifier (id, diagnostic_specifier, equivalent_classes) FROM stdin;
\.


--
-- Data for Name: disorders_disorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_disorder (id, disorder, icd9cm, icd10cm, note, index_diagnostic_specifier_id, index_disorder_category_id, index_severity_id) FROM stdin;
\.


--
-- Data for Name: disorders_disorder_equivalent_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_disorder_equivalent_classes (id, disorder_id, equivalentclass_id) FROM stdin;
\.


--
-- Data for Name: disorders_disordercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_disordercategory (id, name) FROM stdin;
\.


--
-- Data for Name: disorders_equivalentclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_equivalentclass (id) FROM stdin;
\.


--
-- Data for Name: disorders_icd10cm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_icd10cm (id, icd10cm) FROM stdin;
\.


--
-- Data for Name: disorders_icd9cm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_icd9cm (id, icd9cm) FROM stdin;
\.


--
-- Data for Name: disorders_severity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disorders_severity (id, severity, definition, equivalent_classes) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	assessments	age
8	assessments	author
9	assessments	respondent
10	assessments	subject
11	assessments	reference
12	assessments	questionnaire
13	assessments	question
14	resources	language
15	disorders	diagnosticcriterion
16	disorders	diagnosticspecifier
17	disorders	disordercategory
18	disorders	equivalentclass
19	disorders	icd10cm
20	disorders	icd9cm
21	disorders	severity
22	disorders	disorder
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-24 16:55:28.342245+01
2	auth	0001_initial	2021-03-24 16:55:28.426144+01
3	admin	0001_initial	2021-03-24 16:55:28.484673+01
4	admin	0002_logentry_remove_auto_add	2021-03-24 16:55:28.517443+01
5	admin	0003_logentry_add_action_flag_choices	2021-03-24 16:55:28.536911+01
6	resources	0001_initial	2021-03-24 16:55:28.550898+01
7	disorders	0001_initial	2021-03-24 16:55:28.657417+01
8	assessments	0001_initial	2021-03-24 16:55:28.840752+01
9	contenttypes	0002_remove_content_type_name	2021-03-24 16:55:28.988098+01
10	auth	0002_alter_permission_name_max_length	2021-03-24 16:55:29.032778+01
11	auth	0003_alter_user_email_max_length	2021-03-24 16:55:29.059378+01
12	auth	0004_alter_user_username_opts	2021-03-24 16:55:29.089592+01
13	auth	0005_alter_user_last_login_null	2021-03-24 16:55:29.121716+01
14	auth	0006_require_contenttypes_0002	2021-03-24 16:55:29.12522+01
15	auth	0007_alter_validators_add_error_messages	2021-03-24 16:55:29.166108+01
16	auth	0008_alter_user_username_max_length	2021-03-24 16:55:29.204397+01
17	auth	0009_alter_user_last_name_max_length	2021-03-24 16:55:29.236733+01
18	auth	0010_alter_group_name_max_length	2021-03-24 16:55:29.323266+01
19	auth	0011_update_proxy_permissions	2021-03-24 16:55:29.359221+01
20	auth	0012_alter_user_first_name_max_length	2021-03-24 16:55:29.384612+01
21	sessions	0001_initial	2021-03-24 16:55:29.3935+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: resources_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resources_language (id, name, equivalent_classes, parent_language_id) FROM stdin;
\.


--
-- Name: assessments_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_age_id_seq', 1, false);


--
-- Name: assessments_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_author_id_seq', 1, false);


--
-- Name: assessments_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_question_id_seq', 1, false);


--
-- Name: assessments_question_questionaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_question_questionaires_id_seq', 1, false);


--
-- Name: assessments_questionnaire_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_authors_id_seq', 1, false);


--
-- Name: assessments_questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_id_seq', 1, false);


--
-- Name: assessments_questionnaire_indices_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_indices_age_id_seq', 1, false);


--
-- Name: assessments_questionnaire_indices_disorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_indices_disorder_id_seq', 1, false);


--
-- Name: assessments_questionnaire_indices_respondent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_indices_respondent_id_seq', 1, false);


--
-- Name: assessments_questionnaire_indices_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_indices_subject_id_seq', 1, false);


--
-- Name: assessments_questionnaire_use_with_assessments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_questionnaire_use_with_assessments_id_seq', 1, false);


--
-- Name: assessments_reference_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_reference_authors_id_seq', 1, false);


--
-- Name: assessments_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_reference_id_seq', 1, false);


--
-- Name: assessments_respondent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_respondent_id_seq', 1, false);


--
-- Name: assessments_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assessments_subject_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: disorders_diagnosticcriterion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_diagnosticcriterion_id_seq', 1, false);


--
-- Name: disorders_diagnosticspecifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_diagnosticspecifier_id_seq', 1, false);


--
-- Name: disorders_disorder_equivalent_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_disorder_equivalent_classes_id_seq', 1, false);


--
-- Name: disorders_disorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_disorder_id_seq', 1, false);


--
-- Name: disorders_disordercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_disordercategory_id_seq', 1, false);


--
-- Name: disorders_equivalentclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_equivalentclass_id_seq', 1, false);


--
-- Name: disorders_icd10cm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_icd10cm_id_seq', 1, false);


--
-- Name: disorders_icd9cm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_icd9cm_id_seq', 1, false);


--
-- Name: disorders_severity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disorders_severity_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: resources_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resources_language_id_seq', 1, false);


--
-- Name: assessments_age assessments_age_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_age
    ADD CONSTRAINT assessments_age_pkey PRIMARY KEY (id);


--
-- Name: assessments_author assessments_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_author
    ADD CONSTRAINT assessments_author_pkey PRIMARY KEY (id);


--
-- Name: assessments_question assessments_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question
    ADD CONSTRAINT assessments_question_pkey PRIMARY KEY (id);


--
-- Name: assessments_question_questionaires assessments_question_que_question_id_questionnair_76bc684b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question_questionaires
    ADD CONSTRAINT assessments_question_que_question_id_questionnair_76bc684b_uniq UNIQUE (question_id, questionnaire_id);


--
-- Name: assessments_question_questionaires assessments_question_questionaires_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question_questionaires
    ADD CONSTRAINT assessments_question_questionaires_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_use_with_assessments assessments_questionnair_from_questionnaire_id_to_71b6e233_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_use_with_assessments
    ADD CONSTRAINT assessments_questionnair_from_questionnaire_id_to_71b6e233_uniq UNIQUE (from_questionnaire_id, to_questionnaire_id);


--
-- Name: assessments_questionnaire_indices_age assessments_questionnair_questionnaire_id_age_id_f4bd2775_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_age
    ADD CONSTRAINT assessments_questionnair_questionnaire_id_age_id_f4bd2775_uniq UNIQUE (questionnaire_id, age_id);


--
-- Name: assessments_questionnaire_authors assessments_questionnair_questionnaire_id_author__0c41ba73_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_authors
    ADD CONSTRAINT assessments_questionnair_questionnaire_id_author__0c41ba73_uniq UNIQUE (questionnaire_id, author_id);


--
-- Name: assessments_questionnaire_indices_disorder assessments_questionnair_questionnaire_id_disorde_efb2707c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_disorder
    ADD CONSTRAINT assessments_questionnair_questionnaire_id_disorde_efb2707c_uniq UNIQUE (questionnaire_id, disordercategory_id);


--
-- Name: assessments_questionnaire_indices_respondent assessments_questionnair_questionnaire_id_respond_4fcb9cdc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_respondent
    ADD CONSTRAINT assessments_questionnair_questionnaire_id_respond_4fcb9cdc_uniq UNIQUE (questionnaire_id, respondent_id);


--
-- Name: assessments_questionnaire_indices_subject assessments_questionnair_questionnaire_id_subject_d80c6e57_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_subject
    ADD CONSTRAINT assessments_questionnair_questionnaire_id_subject_d80c6e57_uniq UNIQUE (questionnaire_id, subject_id);


--
-- Name: assessments_questionnaire_authors assessments_questionnaire_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_authors
    ADD CONSTRAINT assessments_questionnaire_authors_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_indices_age assessments_questionnaire_indices_age_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_age
    ADD CONSTRAINT assessments_questionnaire_indices_age_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_indices_disorder assessments_questionnaire_indices_disorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_disorder
    ADD CONSTRAINT assessments_questionnaire_indices_disorder_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_indices_respondent assessments_questionnaire_indices_respondent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_respondent
    ADD CONSTRAINT assessments_questionnaire_indices_respondent_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_indices_subject assessments_questionnaire_indices_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_subject
    ADD CONSTRAINT assessments_questionnaire_indices_subject_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire assessments_questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire
    ADD CONSTRAINT assessments_questionnaire_pkey PRIMARY KEY (id);


--
-- Name: assessments_questionnaire_use_with_assessments assessments_questionnaire_use_with_assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_use_with_assessments
    ADD CONSTRAINT assessments_questionnaire_use_with_assessments_pkey PRIMARY KEY (id);


--
-- Name: assessments_reference_authors assessments_reference_au_reference_id_author_id_2fd3840d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference_authors
    ADD CONSTRAINT assessments_reference_au_reference_id_author_id_2fd3840d_uniq UNIQUE (reference_id, author_id);


--
-- Name: assessments_reference_authors assessments_reference_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference_authors
    ADD CONSTRAINT assessments_reference_authors_pkey PRIMARY KEY (id);


--
-- Name: assessments_reference assessments_reference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference
    ADD CONSTRAINT assessments_reference_pkey PRIMARY KEY (id);


--
-- Name: assessments_respondent assessments_respondent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_respondent
    ADD CONSTRAINT assessments_respondent_pkey PRIMARY KEY (id);


--
-- Name: assessments_subject assessments_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_subject
    ADD CONSTRAINT assessments_subject_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: disorders_diagnosticcriterion disorders_diagnosticcriterion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_diagnosticcriterion
    ADD CONSTRAINT disorders_diagnosticcriterion_pkey PRIMARY KEY (id);


--
-- Name: disorders_diagnosticspecifier disorders_diagnosticspecifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_diagnosticspecifier
    ADD CONSTRAINT disorders_diagnosticspecifier_pkey PRIMARY KEY (id);


--
-- Name: disorders_disorder_equivalent_classes disorders_disorder_equiv_disorder_id_equivalentcl_dbb940c7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder_equivalent_classes
    ADD CONSTRAINT disorders_disorder_equiv_disorder_id_equivalentcl_dbb940c7_uniq UNIQUE (disorder_id, equivalentclass_id);


--
-- Name: disorders_disorder_equivalent_classes disorders_disorder_equivalent_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder_equivalent_classes
    ADD CONSTRAINT disorders_disorder_equivalent_classes_pkey PRIMARY KEY (id);


--
-- Name: disorders_disorder disorders_disorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder
    ADD CONSTRAINT disorders_disorder_pkey PRIMARY KEY (id);


--
-- Name: disorders_disordercategory disorders_disordercategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disordercategory
    ADD CONSTRAINT disorders_disordercategory_pkey PRIMARY KEY (id);


--
-- Name: disorders_equivalentclass disorders_equivalentclass_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_equivalentclass
    ADD CONSTRAINT disorders_equivalentclass_pkey PRIMARY KEY (id);


--
-- Name: disorders_icd10cm disorders_icd10cm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_icd10cm
    ADD CONSTRAINT disorders_icd10cm_pkey PRIMARY KEY (id);


--
-- Name: disorders_icd9cm disorders_icd9cm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_icd9cm
    ADD CONSTRAINT disorders_icd9cm_pkey PRIMARY KEY (id);


--
-- Name: disorders_severity disorders_severity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_severity
    ADD CONSTRAINT disorders_severity_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: resources_language resources_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources_language
    ADD CONSTRAINT resources_language_pkey PRIMARY KEY (id);


--
-- Name: assessments_question_questionaires_question_id_083ce415; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_question_questionaires_question_id_083ce415 ON public.assessments_question_questionaires USING btree (question_id);


--
-- Name: assessments_question_questionaires_questionnaire_id_6deb2216; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_question_questionaires_questionnaire_id_6deb2216 ON public.assessments_question_questionaires USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire__disordercategory_id_c0fced5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__disordercategory_id_c0fced5d ON public.assessments_questionnaire_indices_disorder USING btree (disordercategory_id);


--
-- Name: assessments_questionnaire__from_questionnaire_id_c558a44f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__from_questionnaire_id_c558a44f ON public.assessments_questionnaire_use_with_assessments USING btree (from_questionnaire_id);


--
-- Name: assessments_questionnaire__questionnaire_id_29834196; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__questionnaire_id_29834196 ON public.assessments_questionnaire_indices_respondent USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire__questionnaire_id_2d47b306; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__questionnaire_id_2d47b306 ON public.assessments_questionnaire_indices_disorder USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire__questionnaire_id_62d629c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__questionnaire_id_62d629c8 ON public.assessments_questionnaire_indices_subject USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire__respondent_id_0569c9fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__respondent_id_0569c9fd ON public.assessments_questionnaire_indices_respondent USING btree (respondent_id);


--
-- Name: assessments_questionnaire__to_questionnaire_id_23e1efb7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire__to_questionnaire_id_23e1efb7 ON public.assessments_questionnaire_use_with_assessments USING btree (to_questionnaire_id);


--
-- Name: assessments_questionnaire_authors_author_id_54bf213e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_authors_author_id_54bf213e ON public.assessments_questionnaire_authors USING btree (author_id);


--
-- Name: assessments_questionnaire_authors_questionnaire_id_9d8bbf20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_authors_questionnaire_id_9d8bbf20 ON public.assessments_questionnaire_authors USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire_index_language_id_007330d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_index_language_id_007330d5 ON public.assessments_questionnaire USING btree (index_language_id);


--
-- Name: assessments_questionnaire_indices_age_age_id_81353e31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_indices_age_age_id_81353e31 ON public.assessments_questionnaire_indices_age USING btree (age_id);


--
-- Name: assessments_questionnaire_indices_age_questionnaire_id_eb701b17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_indices_age_questionnaire_id_eb701b17 ON public.assessments_questionnaire_indices_age USING btree (questionnaire_id);


--
-- Name: assessments_questionnaire_indices_reference_id_273e9f3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_indices_reference_id_273e9f3a ON public.assessments_questionnaire USING btree (indices_reference_id);


--
-- Name: assessments_questionnaire_indices_subject_subject_id_5fc9ffcd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_indices_subject_subject_id_5fc9ffcd ON public.assessments_questionnaire_indices_subject USING btree (subject_id);


--
-- Name: assessments_questionnaire_last_modified_by_id_81133b6f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_questionnaire_last_modified_by_id_81133b6f ON public.assessments_questionnaire USING btree (last_modified_by_id);


--
-- Name: assessments_reference_authors_author_id_9ecbb207; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_reference_authors_author_id_9ecbb207 ON public.assessments_reference_authors USING btree (author_id);


--
-- Name: assessments_reference_authors_reference_id_9a4400dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_reference_authors_reference_id_9a4400dc ON public.assessments_reference_authors USING btree (reference_id);


--
-- Name: assessments_reference_last_modified_by_id_f2c7e8ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assessments_reference_last_modified_by_id_f2c7e8ea ON public.assessments_reference USING btree (last_modified_by_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: disorders_disorder_equival_equivalentclass_id_15576733; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX disorders_disorder_equival_equivalentclass_id_15576733 ON public.disorders_disorder_equivalent_classes USING btree (equivalentclass_id);


--
-- Name: disorders_disorder_equivalent_classes_disorder_id_1de9d7b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX disorders_disorder_equivalent_classes_disorder_id_1de9d7b8 ON public.disorders_disorder_equivalent_classes USING btree (disorder_id);


--
-- Name: disorders_disorder_index_diagnostic_specifier_id_82e39e72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX disorders_disorder_index_diagnostic_specifier_id_82e39e72 ON public.disorders_disorder USING btree (index_diagnostic_specifier_id);


--
-- Name: disorders_disorder_index_disorder_category_id_e1726598; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX disorders_disorder_index_disorder_category_id_e1726598 ON public.disorders_disorder USING btree (index_disorder_category_id);


--
-- Name: disorders_disorder_index_severity_id_60537bac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX disorders_disorder_index_severity_id_60537bac ON public.disorders_disorder USING btree (index_severity_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: resources_language_parent_language_id_8ce90e03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX resources_language_parent_language_id_8ce90e03 ON public.resources_language USING btree (parent_language_id);


--
-- Name: assessments_questionnaire_indices_age assessments_question_age_id_81353e31_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_age
    ADD CONSTRAINT assessments_question_age_id_81353e31_fk_assessmen FOREIGN KEY (age_id) REFERENCES public.assessments_age(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_authors assessments_question_author_id_54bf213e_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_authors
    ADD CONSTRAINT assessments_question_author_id_54bf213e_fk_assessmen FOREIGN KEY (author_id) REFERENCES public.assessments_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_disorder assessments_question_disordercategory_id_c0fced5d_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_disorder
    ADD CONSTRAINT assessments_question_disordercategory_id_c0fced5d_fk_disorders FOREIGN KEY (disordercategory_id) REFERENCES public.disorders_disordercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_use_with_assessments assessments_question_from_questionnaire_i_c558a44f_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_use_with_assessments
    ADD CONSTRAINT assessments_question_from_questionnaire_i_c558a44f_fk_assessmen FOREIGN KEY (from_questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire assessments_question_index_language_id_007330d5_fk_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire
    ADD CONSTRAINT assessments_question_index_language_id_007330d5_fk_resources FOREIGN KEY (index_language_id) REFERENCES public.resources_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire assessments_question_indices_reference_id_273e9f3a_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire
    ADD CONSTRAINT assessments_question_indices_reference_id_273e9f3a_fk_assessmen FOREIGN KEY (indices_reference_id) REFERENCES public.assessments_reference(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire assessments_question_last_modified_by_id_81133b6f_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire
    ADD CONSTRAINT assessments_question_last_modified_by_id_81133b6f_fk_auth_user FOREIGN KEY (last_modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_question_questionaires assessments_question_question_id_083ce415_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question_questionaires
    ADD CONSTRAINT assessments_question_question_id_083ce415_fk_assessmen FOREIGN KEY (question_id) REFERENCES public.assessments_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_respondent assessments_question_questionnaire_id_29834196_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_respondent
    ADD CONSTRAINT assessments_question_questionnaire_id_29834196_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_disorder assessments_question_questionnaire_id_2d47b306_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_disorder
    ADD CONSTRAINT assessments_question_questionnaire_id_2d47b306_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_subject assessments_question_questionnaire_id_62d629c8_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_subject
    ADD CONSTRAINT assessments_question_questionnaire_id_62d629c8_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_question_questionaires assessments_question_questionnaire_id_6deb2216_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_question_questionaires
    ADD CONSTRAINT assessments_question_questionnaire_id_6deb2216_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_authors assessments_question_questionnaire_id_9d8bbf20_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_authors
    ADD CONSTRAINT assessments_question_questionnaire_id_9d8bbf20_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_age assessments_question_questionnaire_id_eb701b17_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_age
    ADD CONSTRAINT assessments_question_questionnaire_id_eb701b17_fk_assessmen FOREIGN KEY (questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_respondent assessments_question_respondent_id_0569c9fd_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_respondent
    ADD CONSTRAINT assessments_question_respondent_id_0569c9fd_fk_assessmen FOREIGN KEY (respondent_id) REFERENCES public.assessments_respondent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_indices_subject assessments_question_subject_id_5fc9ffcd_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_indices_subject
    ADD CONSTRAINT assessments_question_subject_id_5fc9ffcd_fk_assessmen FOREIGN KEY (subject_id) REFERENCES public.assessments_subject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_questionnaire_use_with_assessments assessments_question_to_questionnaire_id_23e1efb7_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_questionnaire_use_with_assessments
    ADD CONSTRAINT assessments_question_to_questionnaire_id_23e1efb7_fk_assessmen FOREIGN KEY (to_questionnaire_id) REFERENCES public.assessments_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_reference_authors assessments_referenc_author_id_9ecbb207_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference_authors
    ADD CONSTRAINT assessments_referenc_author_id_9ecbb207_fk_assessmen FOREIGN KEY (author_id) REFERENCES public.assessments_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_reference assessments_referenc_last_modified_by_id_f2c7e8ea_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference
    ADD CONSTRAINT assessments_referenc_last_modified_by_id_f2c7e8ea_fk_auth_user FOREIGN KEY (last_modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: assessments_reference_authors assessments_referenc_reference_id_9a4400dc_fk_assessmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessments_reference_authors
    ADD CONSTRAINT assessments_referenc_reference_id_9a4400dc_fk_assessmen FOREIGN KEY (reference_id) REFERENCES public.assessments_reference(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disorders_disorder_equivalent_classes disorders_disorder_e_disorder_id_1de9d7b8_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder_equivalent_classes
    ADD CONSTRAINT disorders_disorder_e_disorder_id_1de9d7b8_fk_disorders FOREIGN KEY (disorder_id) REFERENCES public.disorders_disorder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disorders_disorder_equivalent_classes disorders_disorder_e_equivalentclass_id_15576733_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder_equivalent_classes
    ADD CONSTRAINT disorders_disorder_e_equivalentclass_id_15576733_fk_disorders FOREIGN KEY (equivalentclass_id) REFERENCES public.disorders_equivalentclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disorders_disorder disorders_disorder_index_diagnostic_spe_82e39e72_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder
    ADD CONSTRAINT disorders_disorder_index_diagnostic_spe_82e39e72_fk_disorders FOREIGN KEY (index_diagnostic_specifier_id) REFERENCES public.disorders_diagnosticspecifier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disorders_disorder disorders_disorder_index_disorder_categ_e1726598_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder
    ADD CONSTRAINT disorders_disorder_index_disorder_categ_e1726598_fk_disorders FOREIGN KEY (index_disorder_category_id) REFERENCES public.disorders_disordercategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: disorders_disorder disorders_disorder_index_severity_id_60537bac_fk_disorders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disorders_disorder
    ADD CONSTRAINT disorders_disorder_index_severity_id_60537bac_fk_disorders FOREIGN KEY (index_severity_id) REFERENCES public.disorders_severity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: resources_language resources_language_parent_language_id_8ce90e03_fk_resources; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resources_language
    ADD CONSTRAINT resources_language_parent_language_id_8ce90e03_fk_resources FOREIGN KEY (parent_language_id) REFERENCES public.resources_language(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

