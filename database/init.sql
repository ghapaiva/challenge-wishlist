CREATE DATABASE wishlist_db;
CREATE DATABASE wishlist_keycloak_db;

\connect wishlist_keycloak_db
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 15.13

-- Started on 2025-09-12 16:06:31 UTC

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
-- TOC entry 214 (class 1259 OID 16387)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64),
    details_json text
);


ALTER TABLE public.admin_event_entity OWNER TO root;

--
-- TOC entry 215 (class 1259 OID 16392)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 16395)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO root;

--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16415)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO root;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: client; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16438)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 16443)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 16446)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 16449)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16452)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO root;

--
-- TOC entry 227 (class 1259 OID 16457)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16462)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO root;

--
-- TOC entry 229 (class 1259 OID 16468)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 16471)
-- Name: component; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO root;

--
-- TOC entry 231 (class 1259 OID 16476)
-- Name: component_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 16481)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO root;

--
-- TOC entry 233 (class 1259 OID 16484)
-- Name: credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer,
    version integer DEFAULT 0
);


ALTER TABLE public.credential OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 16490)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO root;

--
-- TOC entry 235 (class 1259 OID 16495)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 16498)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO root;

--
-- TOC entry 237 (class 1259 OID 16502)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO root;

--
-- TOC entry 238 (class 1259 OID 16507)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO root;

--
-- TOC entry 239 (class 1259 OID 16512)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO root;

--
-- TOC entry 240 (class 1259 OID 16517)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO root;

--
-- TOC entry 241 (class 1259 OID 16520)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO root;

--
-- TOC entry 242 (class 1259 OID 16525)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO root;

--
-- TOC entry 243 (class 1259 OID 16528)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO root;

--
-- TOC entry 244 (class 1259 OID 16534)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO root;

--
-- TOC entry 245 (class 1259 OID 16537)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO root;

--
-- TOC entry 246 (class 1259 OID 16542)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO root;

--
-- TOC entry 247 (class 1259 OID 16547)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO root;

--
-- TOC entry 248 (class 1259 OID 16553)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO root;

--
-- TOC entry 249 (class 1259 OID 16556)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL,
    organization_id character varying(255),
    hide_on_login boolean DEFAULT false
);


ALTER TABLE public.identity_provider OWNER TO root;

--
-- TOC entry 250 (class 1259 OID 16568)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO root;

--
-- TOC entry 251 (class 1259 OID 16573)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO root;

--
-- TOC entry 252 (class 1259 OID 16578)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO root;

--
-- TOC entry 253 (class 1259 OID 16583)
-- Name: jgroups_ping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.jgroups_ping (
    address character varying(200) NOT NULL,
    name character varying(200),
    cluster_name character varying(200) NOT NULL,
    ip character varying(200) NOT NULL,
    coord boolean
);


ALTER TABLE public.jgroups_ping OWNER TO root;

--
-- TOC entry 254 (class 1259 OID 16588)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36),
    type integer DEFAULT 0 NOT NULL,
    description character varying(255)
);


ALTER TABLE public.keycloak_group OWNER TO root;

--
-- TOC entry 255 (class 1259 OID 16594)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO root;

--
-- TOC entry 256 (class 1259 OID 16600)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO root;

--
-- TOC entry 257 (class 1259 OID 16604)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO root;

--
-- TOC entry 258 (class 1259 OID 16612)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO root;

--
-- TOC entry 259 (class 1259 OID 16619)
-- Name: org; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    alias character varying(255) NOT NULL,
    redirect_url character varying(2048)
);


ALTER TABLE public.org OWNER TO root;

--
-- TOC entry 260 (class 1259 OID 16624)
-- Name: org_domain; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO root;

--
-- TOC entry 261 (class 1259 OID 16629)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO root;

--
-- TOC entry 262 (class 1259 OID 16634)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO root;

--
-- TOC entry 263 (class 1259 OID 16639)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO root;

--
-- TOC entry 264 (class 1259 OID 16644)
-- Name: realm; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO root;

--
-- TOC entry 265 (class 1259 OID 16677)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO root;

--
-- TOC entry 266 (class 1259 OID 16682)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO root;

--
-- TOC entry 267 (class 1259 OID 16685)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO root;

--
-- TOC entry 268 (class 1259 OID 16688)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO root;

--
-- TOC entry 269 (class 1259 OID 16691)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO root;

--
-- TOC entry 270 (class 1259 OID 16696)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO root;

--
-- TOC entry 271 (class 1259 OID 16703)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO root;

--
-- TOC entry 272 (class 1259 OID 16708)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO root;

--
-- TOC entry 273 (class 1259 OID 16711)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO root;

--
-- TOC entry 274 (class 1259 OID 16714)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO root;

--
-- TOC entry 275 (class 1259 OID 16719)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO root;

--
-- TOC entry 276 (class 1259 OID 16726)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO root;

--
-- TOC entry 277 (class 1259 OID 16732)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO root;

--
-- TOC entry 278 (class 1259 OID 16735)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO root;

--
-- TOC entry 279 (class 1259 OID 16738)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO root;

--
-- TOC entry 280 (class 1259 OID 16743)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO root;

--
-- TOC entry 281 (class 1259 OID 16748)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO root;

--
-- TOC entry 282 (class 1259 OID 16753)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO root;

--
-- TOC entry 283 (class 1259 OID 16759)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO root;

--
-- TOC entry 284 (class 1259 OID 16764)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO root;

--
-- TOC entry 285 (class 1259 OID 16767)
-- Name: revoked_token; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.revoked_token (
    id character varying(255) NOT NULL,
    expire bigint NOT NULL
);


ALTER TABLE public.revoked_token OWNER TO root;

--
-- TOC entry 286 (class 1259 OID 16770)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO root;

--
-- TOC entry 287 (class 1259 OID 16775)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO root;

--
-- TOC entry 288 (class 1259 OID 16778)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO root;

--
-- TOC entry 289 (class 1259 OID 16781)
-- Name: server_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.server_config (
    server_config_key character varying(255) NOT NULL,
    value text NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.server_config OWNER TO root;

--
-- TOC entry 290 (class 1259 OID 16787)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO root;

--
-- TOC entry 291 (class 1259 OID 16793)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO root;

--
-- TOC entry 292 (class 1259 OID 16798)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO root;

--
-- TOC entry 293 (class 1259 OID 16801)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO root;

--
-- TOC entry 294 (class 1259 OID 16809)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO root;

--
-- TOC entry 295 (class 1259 OID 16814)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO root;

--
-- TOC entry 296 (class 1259 OID 16819)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO root;

--
-- TOC entry 297 (class 1259 OID 16824)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO root;

--
-- TOC entry 298 (class 1259 OID 16829)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL,
    membership_type character varying(255) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO root;

--
-- TOC entry 299 (class 1259 OID 16832)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO root;

--
-- TOC entry 300 (class 1259 OID 16836)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO root;

--
-- TOC entry 301 (class 1259 OID 16839)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO root;

--
-- TOC entry 4203 (class 0 OID 16387)
-- Dependencies: 214
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4204 (class 0 OID 16392)
-- Dependencies: 215
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.associated_policy (policy_id, associated_policy_id) VALUES ('25b1871d-8418-4d66-b196-e643d05d0ae3', '0f3e6ad2-a900-4e03-b101-9d30175bfe18');


--
-- TOC entry 4205 (class 0 OID 16395)
-- Dependencies: 216
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1f2d789b-27b7-4a88-87d2-6a5f88f999d5', NULL, 'auth-cookie', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c7911809-544b-409f-9bf8-f79213fdc257', NULL, 'auth-spnego', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('100d9aaf-e796-40f0-ae43-c0bce7e06df8', NULL, 'identity-provider-redirector', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('223ff7e2-58a7-48cc-bc08-a71a6eaa46dc', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', 2, 30, true, '4cf49c08-382b-4e88-9889-7c09aca95a4c', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('56a1a172-8f56-46ab-8c34-8f7366e74a1f', NULL, 'auth-username-password-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4cf49c08-382b-4e88-9889-7c09aca95a4c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9972c11b-a1ba-46ec-8cd3-70001a7a092c', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4cf49c08-382b-4e88-9889-7c09aca95a4c', 1, 20, true, '6983f7d4-daa1-4d3c-8224-acd2af332751', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('df042bd2-979f-4db3-8715-f9d7e5b5824b', NULL, 'conditional-user-configured', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '6983f7d4-daa1-4d3c-8224-acd2af332751', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d9959ab4-f692-472f-8ed5-df25be4343db', NULL, 'auth-otp-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '6983f7d4-daa1-4d3c-8224-acd2af332751', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('3ee1d772-038b-48a7-9d4a-61f208c54ddf', NULL, 'webauthn-authenticator', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '6983f7d4-daa1-4d3c-8224-acd2af332751', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('62f69e58-0915-4cbb-91a0-fe2623408923', NULL, 'auth-recovery-authn-code-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '6983f7d4-daa1-4d3c-8224-acd2af332751', 3, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('640a0459-8a64-43b3-b1f7-eb9146dfd837', NULL, 'direct-grant-validate-username', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '49c3b8af-fdfe-4225-814c-d237a80a096f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6953f277-e7f6-4c10-9006-d15b85886962', NULL, 'direct-grant-validate-password', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '49c3b8af-fdfe-4225-814c-d237a80a096f', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a29463c8-3bf7-4f42-85cd-c874d8efa7b3', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '49c3b8af-fdfe-4225-814c-d237a80a096f', 1, 30, true, '653af1cc-bfff-44c0-84d0-b12c04c69922', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ac88a292-3dc1-4940-a1dc-f3f923db0bf0', NULL, 'conditional-user-configured', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '653af1cc-bfff-44c0-84d0-b12c04c69922', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1dcbac1c-0da2-44c0-bd21-a45ffaf66adf', NULL, 'direct-grant-validate-otp', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '653af1cc-bfff-44c0-84d0-b12c04c69922', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8af7d4e5-e103-46d2-a043-935add99a7ca', NULL, 'registration-page-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4d3ff5d8-924f-4d9e-ac2f-b05983f1aadb', 0, 10, true, '3b066e3f-c87a-4140-a1e2-1f51bb122057', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('53e02910-cf6e-4541-9ddf-155372500e67', NULL, 'registration-user-creation', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3b066e3f-c87a-4140-a1e2-1f51bb122057', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('061dd3ac-1a23-4cc6-9ff1-1d85ea754be1', NULL, 'registration-password-action', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3b066e3f-c87a-4140-a1e2-1f51bb122057', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('95e5a26d-60fb-405a-a6a0-a60dd1dcb74a', NULL, 'registration-recaptcha-action', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3b066e3f-c87a-4140-a1e2-1f51bb122057', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f448e148-21be-4fce-b808-732bbf6290e7', NULL, 'registration-terms-and-conditions', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3b066e3f-c87a-4140-a1e2-1f51bb122057', 3, 70, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9bdd3a78-91a8-4334-837c-f8d4a627524c', NULL, 'reset-credentials-choose-user', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '30f2726c-e8e2-4a0b-9291-89c40a2d4298', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7afc876a-54b0-4929-af48-ebf8080bde7f', NULL, 'reset-credential-email', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '30f2726c-e8e2-4a0b-9291-89c40a2d4298', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('30992c17-e06c-4446-a802-796230ccc15c', NULL, 'reset-password', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '30f2726c-e8e2-4a0b-9291-89c40a2d4298', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('27189d6e-c06e-4207-850a-081758e30ea4', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '30f2726c-e8e2-4a0b-9291-89c40a2d4298', 1, 40, true, 'e3074476-a09b-4341-bb20-d9293871f67a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6c273f45-eb7b-4b4a-9ec8-f4839dee8cbe', NULL, 'conditional-user-configured', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'e3074476-a09b-4341-bb20-d9293871f67a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('966ce929-4e7d-4545-9027-4fb6496dbcb7', NULL, 'reset-otp', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'e3074476-a09b-4341-bb20-d9293871f67a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('758fa2ae-4493-4aa2-b87d-b5684b189e7d', NULL, 'client-secret', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '75298f53-59fa-44a7-9f38-db85f72518b5', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ed20cb6b-aa9a-427b-b238-16f1fd014181', NULL, 'client-jwt', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '75298f53-59fa-44a7-9f38-db85f72518b5', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('28674234-166f-4d27-8218-94baacb90293', NULL, 'client-secret-jwt', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '75298f53-59fa-44a7-9f38-db85f72518b5', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7359ac16-6ff3-4d19-9cfc-3d23f229824b', NULL, 'client-x509', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '75298f53-59fa-44a7-9f38-db85f72518b5', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('030711d6-863f-4d41-aa7f-b1de3569699d', NULL, 'idp-review-profile', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'c2893dc4-905c-48c6-9ed6-7f96f61ab8b7', 0, 10, false, NULL, '53bf1144-d48e-42e2-91e1-cf94d41d5167');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('75559a54-46f2-4dda-ae7a-4a1ed619d9b2', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'c2893dc4-905c-48c6-9ed6-7f96f61ab8b7', 0, 20, true, '2e2aee2f-d4f4-4cd0-90d8-b009ddd3143f', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e00afc5e-4760-49f1-96c1-a83d1a00d5fe', NULL, 'idp-create-user-if-unique', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '2e2aee2f-d4f4-4cd0-90d8-b009ddd3143f', 2, 10, false, NULL, 'e26d97b9-5b59-45ee-900e-b87d2516353a');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ad24b6a1-bb33-4e66-a231-c83a73bc5f36', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '2e2aee2f-d4f4-4cd0-90d8-b009ddd3143f', 2, 20, true, '8cc53a0b-5d84-4ea2-a438-81f477002457', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f3c64ef6-bb6f-4599-a491-fc47f040d986', NULL, 'idp-confirm-link', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '8cc53a0b-5d84-4ea2-a438-81f477002457', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2bcf89ff-fad4-4846-8d00-d285e092c437', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '8cc53a0b-5d84-4ea2-a438-81f477002457', 0, 20, true, 'a4e21690-d9b8-4509-96c8-e709077c4701', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1a626046-820e-4a40-be08-9e23fa4399d5', NULL, 'idp-email-verification', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'a4e21690-d9b8-4509-96c8-e709077c4701', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ba7ae337-a38b-4170-8acb-c2888227ef85', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'a4e21690-d9b8-4509-96c8-e709077c4701', 2, 20, true, 'b1df33cd-0eb0-4bfd-94b3-f977ac5efcc4', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a37f3e25-4b94-498a-a34f-f58eaec17fd6', NULL, 'idp-username-password-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b1df33cd-0eb0-4bfd-94b3-f977ac5efcc4', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bd4acd8c-2deb-487e-b3cd-d38652fe2e7e', NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b1df33cd-0eb0-4bfd-94b3-f977ac5efcc4', 1, 20, true, '4618a781-72df-4aec-807c-8dc3db6c2c3a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e5418eda-a386-4439-82b4-ba9059e44cde', NULL, 'conditional-user-configured', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4618a781-72df-4aec-807c-8dc3db6c2c3a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9e2d0abc-6e29-4d31-b2c6-38c8db60e72e', NULL, 'auth-otp-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4618a781-72df-4aec-807c-8dc3db6c2c3a', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('94680ca3-98d1-451c-9b2a-9a03c67b7238', NULL, 'webauthn-authenticator', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4618a781-72df-4aec-807c-8dc3db6c2c3a', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e5e0fb20-95d3-4f37-9e45-61e809532971', NULL, 'auth-recovery-authn-code-form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4618a781-72df-4aec-807c-8dc3db6c2c3a', 3, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c3a95447-a88f-4a84-98aa-38e71922172f', NULL, 'http-basic-authenticator', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'fba9f641-e36c-458b-9a15-bc75f236e253', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('3c01117a-7289-4042-9373-fae72195fe9f', NULL, 'docker-http-basic-authenticator', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '86a82806-fc32-49fb-82fb-9c873be622fb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('40375f84-1086-48de-a383-3d000ff0ddd7', NULL, 'auth-cookie', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('49832f17-76b1-408f-9e02-f169fab91019', NULL, 'auth-spnego', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('494c2900-2fef-41c3-9e88-f9ad58e9317d', NULL, 'identity-provider-redirector', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c970e9c2-191b-4beb-9a7c-5f4f08cd8d9d', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', 2, 30, true, '9380b61b-6f37-414b-a506-7ffdfcf3858a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5d01659d-bd9f-41a7-af1c-7e9987d000a0', NULL, 'auth-username-password-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '9380b61b-6f37-414b-a506-7ffdfcf3858a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('93d15f60-14c7-42d2-a3bf-4ab750c14d8c', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', '9380b61b-6f37-414b-a506-7ffdfcf3858a', 1, 20, true, '4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('99959135-9b72-4842-8c3b-050f819a13c0', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('b4b5611d-efe0-4db1-aad3-a3f355f48952', NULL, 'auth-otp-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ee8b2a17-fe8f-4328-8762-7afef1491c15', NULL, 'webauthn-authenticator', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('fd47e401-9458-4c69-a8e5-5cb4dac25215', NULL, 'auth-recovery-authn-code-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', 3, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('4beaf568-482c-422f-8124-bbce4c61d60a', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', 2, 26, true, 'c28974cf-fe60-456c-bcf1-960dbbfb214e', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('21ddf058-769e-4511-8977-44f4b1474e43', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'c28974cf-fe60-456c-bcf1-960dbbfb214e', 1, 10, true, 'ca62515a-edb6-4638-ad8d-d98d5997bfee', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('141b127c-5a4b-49b7-b792-9b3353dea58e', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ca62515a-edb6-4638-ad8d-d98d5997bfee', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bcf528ae-4d5f-4f08-ae01-32f7ba90e797', NULL, 'organization', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ca62515a-edb6-4638-ad8d-d98d5997bfee', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('7e75bd1a-ae39-4e89-b810-329627520458', NULL, 'direct-grant-validate-username', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'bdfc890d-302f-4eb9-be90-e9b872642050', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('979078fe-3398-4193-9ea3-cbb84de7b108', NULL, 'direct-grant-validate-password', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'bdfc890d-302f-4eb9-be90-e9b872642050', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5500649f-ee1d-44bb-8645-2141d7a99327', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'bdfc890d-302f-4eb9-be90-e9b872642050', 1, 30, true, '83b8d9c9-fb1e-404d-b61d-971a5be9a58f', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('36c0eb00-97eb-425c-81f8-b9b4adc6c151', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', '83b8d9c9-fb1e-404d-b61d-971a5be9a58f', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('00dd7730-f174-4ced-90f9-1a225bb66600', NULL, 'direct-grant-validate-otp', '71832a48-eab3-4e5a-bc8a-1720377b95da', '83b8d9c9-fb1e-404d-b61d-971a5be9a58f', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('33cb4f5c-77e7-4805-9d3b-7d8f8591fec4', NULL, 'registration-page-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '9eae92c6-28f9-46ff-9084-3adffc427dcc', 0, 10, true, 'aca76924-8fe2-410a-a5ae-13b1a9eadd34', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('84cc6033-2d22-4fb3-9239-fd4e4f1a3ce2', NULL, 'registration-user-creation', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'aca76924-8fe2-410a-a5ae-13b1a9eadd34', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('78e6cc10-2618-4017-964d-3f1bf9e3eb92', NULL, 'registration-password-action', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'aca76924-8fe2-410a-a5ae-13b1a9eadd34', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('773a25a7-5706-4490-938f-7005641c9341', NULL, 'registration-recaptcha-action', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'aca76924-8fe2-410a-a5ae-13b1a9eadd34', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('576f72b0-17e1-42b2-87c5-44ddefa8a704', NULL, 'registration-terms-and-conditions', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'aca76924-8fe2-410a-a5ae-13b1a9eadd34', 3, 70, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('535a37ed-6563-4c54-9da0-d00c0d30e3b6', NULL, 'reset-credentials-choose-user', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('081b5790-a600-4702-b2f2-a65c74477928', NULL, 'reset-credential-email', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f50222f6-fd85-425e-945d-b7f682123cff', NULL, 'reset-password', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('aed2a34f-94bf-406d-8a8c-b2e4154a79a0', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 1, 40, true, '532efed1-33c7-462e-bc24-8d29182154f5', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d5f329e0-8c8c-4f1a-97e5-84c141ad474a', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', '532efed1-33c7-462e-bc24-8d29182154f5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5b9e9872-069c-4361-b5c4-467227de295b', NULL, 'reset-otp', '71832a48-eab3-4e5a-bc8a-1720377b95da', '532efed1-33c7-462e-bc24-8d29182154f5', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c1fc59ac-b3ee-4cc8-8ffa-f83bdfb32251', NULL, 'client-secret', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ee776678-6db3-48df-a8e1-fe1cbe52a718', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('231820b0-eeb7-4f83-820f-df34cfaa951f', NULL, 'client-jwt', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ee776678-6db3-48df-a8e1-fe1cbe52a718', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2690a443-6c6b-4988-823d-f1f39684a972', NULL, 'client-secret-jwt', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ee776678-6db3-48df-a8e1-fe1cbe52a718', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('19425877-5177-4092-874c-062b1018c019', NULL, 'client-x509', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ee776678-6db3-48df-a8e1-fe1cbe52a718', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2d3e22d0-a382-4d03-9e76-f5e54db921b7', NULL, 'idp-review-profile', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ccb97002-e873-454a-ac34-b21928cb377f', 0, 10, false, NULL, '07c0c090-ecb7-422a-b655-e104bcc9b78d');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f2af3f34-d23a-42ec-a175-67b411861659', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ccb97002-e873-454a-ac34-b21928cb377f', 0, 20, true, '4de4cf3e-eda2-49c7-8b1a-3b849e06c83d', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a3fa1fe5-68fc-46f5-a76c-dddd5f80e1f8', NULL, 'idp-create-user-if-unique', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4de4cf3e-eda2-49c7-8b1a-3b849e06c83d', 2, 10, false, NULL, '1f23b8c6-4041-479c-b523-ec6d8b3cd380');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e580bcce-9d82-4c2e-9792-f16a6f6c60d2', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', '4de4cf3e-eda2-49c7-8b1a-3b849e06c83d', 2, 20, true, 'a43a4306-92bf-43f8-b80b-823cf0168a63', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('54c6d18f-3645-4988-abc0-5c8ec2952f8b', NULL, 'idp-confirm-link', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'a43a4306-92bf-43f8-b80b-823cf0168a63', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9a6e3233-1e0e-44a4-bf04-199e93cd2a3e', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'a43a4306-92bf-43f8-b80b-823cf0168a63', 0, 20, true, 'be4c9803-63e7-4722-91a7-050292a2a946', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('121a5f58-df67-4063-b85d-a8027c383d1d', NULL, 'idp-email-verification', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'be4c9803-63e7-4722-91a7-050292a2a946', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('575020ca-5da7-43ea-b782-017cbeb18060', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'be4c9803-63e7-4722-91a7-050292a2a946', 2, 20, true, '44850331-e7ea-4234-a161-693840a01cc9', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('b7602eed-7cfb-45d2-a840-35d38d846925', NULL, 'idp-username-password-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '44850331-e7ea-4234-a161-693840a01cc9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9ad1631f-5091-480a-a030-89f70e6887b5', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', '44850331-e7ea-4234-a161-693840a01cc9', 1, 20, true, '25b2810b-13ea-4bda-a0d3-eb5691e1e39a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6665e71f-00d7-48c5-8338-8017e10a8006', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', '25b2810b-13ea-4bda-a0d3-eb5691e1e39a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('4613c259-e7c6-407e-bf3f-071656c7dce8', NULL, 'auth-otp-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '25b2810b-13ea-4bda-a0d3-eb5691e1e39a', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('fffb5962-d327-4575-a558-924d38edb933', NULL, 'webauthn-authenticator', '71832a48-eab3-4e5a-bc8a-1720377b95da', '25b2810b-13ea-4bda-a0d3-eb5691e1e39a', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1c4e9cfd-9b64-48fb-9064-96c49eacc861', NULL, 'auth-recovery-authn-code-form', '71832a48-eab3-4e5a-bc8a-1720377b95da', '25b2810b-13ea-4bda-a0d3-eb5691e1e39a', 3, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('003d77fd-8dd7-488d-92de-a643df071f64', NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ccb97002-e873-454a-ac34-b21928cb377f', 1, 50, true, 'f281aeba-0788-42d3-aaa0-d1d06cbc07ce', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('44cdc099-94e2-4c69-9494-59c7d0b93f4b', NULL, 'conditional-user-configured', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f281aeba-0788-42d3-aaa0-d1d06cbc07ce', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('31b03845-4b8b-41e8-bc05-a5b279d6c3ba', NULL, 'idp-add-organization-member', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f281aeba-0788-42d3-aaa0-d1d06cbc07ce', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('18743874-186e-41fe-a679-2e2fb15975f2', NULL, 'http-basic-authenticator', '71832a48-eab3-4e5a-bc8a-1720377b95da', '44eb58ab-0403-4bd1-92bf-c7103451d3a8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('69bf99f8-9dbf-4dff-b6e0-7a77237b68be', NULL, 'docker-http-basic-authenticator', '71832a48-eab3-4e5a-bc8a-1720377b95da', '2dd7d872-8cea-49c5-89ec-7f7ce66a4d61', 0, 10, false, NULL, NULL);


--
-- TOC entry 4206 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', 'browser', 'Browser based authentication', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4cf49c08-382b-4e88-9889-7c09aca95a4c', 'forms', 'Username, password, otp and other auth forms.', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('6983f7d4-daa1-4d3c-8224-acd2af332751', 'Browser - Conditional 2FA', 'Flow to determine if any 2FA is required for the authentication', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('49c3b8af-fdfe-4225-814c-d237a80a096f', 'direct grant', 'OpenID Connect Resource Owner Grant', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('653af1cc-bfff-44c0-84d0-b12c04c69922', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4d3ff5d8-924f-4d9e-ac2f-b05983f1aadb', 'registration', 'Registration flow', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3b066e3f-c87a-4140-a1e2-1f51bb122057', 'registration form', 'Registration form', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('30f2726c-e8e2-4a0b-9291-89c40a2d4298', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e3074476-a09b-4341-bb20-d9293871f67a', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('75298f53-59fa-44a7-9f38-db85f72518b5', 'clients', 'Base authentication for clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c2893dc4-905c-48c6-9ed6-7f96f61ab8b7', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('2e2aee2f-d4f4-4cd0-90d8-b009ddd3143f', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('8cc53a0b-5d84-4ea2-a438-81f477002457', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('a4e21690-d9b8-4509-96c8-e709077c4701', 'Account verification options', 'Method with which to verity the existing account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('b1df33cd-0eb0-4bfd-94b3-f977ac5efcc4', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4618a781-72df-4aec-807c-8dc3db6c2c3a', 'First broker login - Conditional 2FA', 'Flow to determine if any 2FA is required for the authentication', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('fba9f641-e36c-458b-9a15-bc75f236e253', 'saml ecp', 'SAML ECP Profile Authentication Flow', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('86a82806-fc32-49fb-82fb-9c873be622fb', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f4eb9455-e2d0-4302-adc4-2aa8e9792559', 'browser', 'Browser based authentication', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('9380b61b-6f37-414b-a506-7ffdfcf3858a', 'forms', 'Username, password, otp and other auth forms.', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4ee5eb7f-8a75-4767-9fb4-3f9fcadc9201', 'Browser - Conditional 2FA', 'Flow to determine if any 2FA is required for the authentication', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c28974cf-fe60-456c-bcf1-960dbbfb214e', 'Organization', NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ca62515a-edb6-4638-ad8d-d98d5997bfee', 'Browser - Conditional Organization', 'Flow to determine if the organization identity-first login is to be used', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('bdfc890d-302f-4eb9-be90-e9b872642050', 'direct grant', 'OpenID Connect Resource Owner Grant', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('83b8d9c9-fb1e-404d-b61d-971a5be9a58f', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('9eae92c6-28f9-46ff-9084-3adffc427dcc', 'registration', 'Registration flow', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('aca76924-8fe2-410a-a5ae-13b1a9eadd34', 'registration form', 'Registration form', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('532efed1-33c7-462e-bc24-8d29182154f5', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ee776678-6db3-48df-a8e1-fe1cbe52a718', 'clients', 'Base authentication for clients', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ccb97002-e873-454a-ac34-b21928cb377f', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4de4cf3e-eda2-49c7-8b1a-3b849e06c83d', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('a43a4306-92bf-43f8-b80b-823cf0168a63', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('be4c9803-63e7-4722-91a7-050292a2a946', 'Account verification options', 'Method with which to verity the existing account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('44850331-e7ea-4234-a161-693840a01cc9', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('25b2810b-13ea-4bda-a0d3-eb5691e1e39a', 'First broker login - Conditional 2FA', 'Flow to determine if any 2FA is required for the authentication', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f281aeba-0788-42d3-aaa0-d1d06cbc07ce', 'First Broker Login - Conditional Organization', 'Flow to determine if the authenticator that adds organization members is to be used', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('44eb58ab-0403-4bd1-92bf-c7103451d3a8', 'saml ecp', 'SAML ECP Profile Authentication Flow', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('2dd7d872-8cea-49c5-89ec-7f7ce66a4d61', 'docker auth', 'Used by Docker clients to authenticate against the IDP', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'basic-flow', true, true);


--
-- TOC entry 4207 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('53bf1144-d48e-42e2-91e1-cf94d41d5167', 'review profile config', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('e26d97b9-5b59-45ee-900e-b87d2516353a', 'create unique user config', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('07c0c090-ecb7-422a-b655-e104bcc9b78d', 'review profile config', '71832a48-eab3-4e5a-bc8a-1720377b95da');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('1f23b8c6-4041-479c-b523-ec6d8b3cd380', 'create unique user config', '71832a48-eab3-4e5a-bc8a-1720377b95da');


--
-- TOC entry 4208 (class 0 OID 16410)
-- Dependencies: 219
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('53bf1144-d48e-42e2-91e1-cf94d41d5167', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('e26d97b9-5b59-45ee-900e-b87d2516353a', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('07c0c090-ecb7-422a-b655-e104bcc9b78d', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('1f23b8c6-4041-479c-b523-ec6d8b3cd380', 'false', 'require.password.update.after.registration');


--
-- TOC entry 4209 (class 0 OID 16415)
-- Dependencies: 220
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4210 (class 0 OID 16420)
-- Dependencies: 221
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', true, true, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', true, true, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('3c99275f-4b2d-470f-9454-e415f974bd9f', true, false, 'wishlist-realm', 0, false, NULL, NULL, true, NULL, false, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, 0, false, false, 'wishlist Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', true, false, 'account', 0, true, NULL, '/realms/wishlist/account/', false, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', true, false, 'account-console', 0, true, NULL, '/realms/wishlist/account/', false, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', true, true, 'security-admin-console', 0, true, NULL, '/admin/wishlist/console/', false, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', true, true, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', true, true, 'wishlist-api', 0, false, 'qbgFAV7UqAzBj7yETqpLCs2RvpS4f4Hm', '', false, '', false, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'openid-connect', -1, true, false, 'Wishlist API', true, 'client-secret', '', 'Client required to WishList API connects with Keycloak Authentication.', NULL, true, false, true, false);


--
-- TOC entry 4211 (class 0 OID 16438)
-- Dependencies: 222
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client_attributes (client_id, name, value) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'client.use.lightweight.access.token.enabled', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'client.use.lightweight.access.token.enabled', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'client.use.lightweight.access.token.enabled', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'client.use.lightweight.access.token.enabled', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'client.secret.creation.time', '1757692580');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'standard.token.exchange.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'oauth2.device.authorization.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'oidc.ciba.grant.enabled', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'backchannel.logout.session.required', 'true');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'backchannel.logout.revoke.offline.tokens', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'realm_client', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'display.on.consent.screen', 'false');
INSERT INTO public.client_attributes (client_id, name, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'frontchannel.logout.session.required', 'true');


--
-- TOC entry 4212 (class 0 OID 16443)
-- Dependencies: 223
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4213 (class 0 OID 16446)
-- Dependencies: 224
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4214 (class 0 OID 16449)
-- Dependencies: 225
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4215 (class 0 OID 16452)
-- Dependencies: 226
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', 'offline_access', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('7df131f3-e5e8-4c79-b7c3-2639b08165ae', 'role_list', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('1f1209c4-3c17-4737-ad29-44a956e92f53', 'saml_organization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'Organization Membership', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', 'profile', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('a224404a-8166-407f-b847-31f49522c700', 'email', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('4bf48d7c-3cc3-44e3-85fa-f763496f57c4', 'address', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('24afeddd-caca-411b-887a-e683743815e2', 'phone', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('61918b39-dd0b-4fc3-a7b4-1e7a06005440', 'roles', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('fc9fd756-2c83-4a2f-98e5-c3010ea24830', 'web-origins', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('9b03836a-b3cc-4177-b7bb-08985135899b', 'microprofile-jwt', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('a11024b7-1c87-4d38-8839-8701cb10f6cc', 'acr', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('10ae1890-3ce5-4a6c-9aab-033b4c944c8c', 'basic', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'OpenID Connect scope for add all basic claims to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('f56338db-7c4f-417c-a1b6-6b5ccea8954c', 'service_account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'Specific scope for a client enabled for service accounts', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('e29be01a-016d-4cc8-baca-5cf58bff1606', 'organization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'Additional claims about the organization a subject belongs to', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('8421216f-523d-477e-81bc-c734ab73c4dc', 'offline_access', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('b869b0ac-6084-4eff-a314-f3078b03d711', 'role_list', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('7446fc6f-3d48-44b1-bbcf-9344b61c6f3d', 'saml_organization', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'Organization Membership', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('2bb41343-db41-424e-ac9e-e3d7109463b8', 'profile', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('0c33816e-ae8b-4c67-afd4-2b137eebc285', 'email', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('a00a7749-4b00-415e-af00-b2d2c2cc6e27', 'address', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', 'phone', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('c51d8918-747c-454e-920e-9a54d5961c4c', 'roles', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('d9b7430c-9d16-460f-9e69-3c3efff65e0f', 'web-origins', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', 'microprofile-jwt', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('988f31fd-b955-4f1c-b06e-eab9dc4be530', 'acr', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', 'basic', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'OpenID Connect scope for add all basic claims to the token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('92b4c161-1580-4cf2-bc2a-6f683c48d71a', 'service_account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'Specific scope for a client enabled for service accounts', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', 'organization', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'Additional claims about the organization a subject belongs to', 'openid-connect');


--
-- TOC entry 4216 (class 0 OID 16457)
-- Dependencies: 227
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7df131f3-e5e8-4c79-b7c3-2639b08165ae', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7df131f3-e5e8-4c79-b7c3-2639b08165ae', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1f1209c4-3c17-4737-ad29-44a956e92f53', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a224404a-8166-407f-b847-31f49522c700', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a224404a-8166-407f-b847-31f49522c700', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a224404a-8166-407f-b847-31f49522c700', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4bf48d7c-3cc3-44e3-85fa-f763496f57c4', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4bf48d7c-3cc3-44e3-85fa-f763496f57c4', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4bf48d7c-3cc3-44e3-85fa-f763496f57c4', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('24afeddd-caca-411b-887a-e683743815e2', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('24afeddd-caca-411b-887a-e683743815e2', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('24afeddd-caca-411b-887a-e683743815e2', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('61918b39-dd0b-4fc3-a7b4-1e7a06005440', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('61918b39-dd0b-4fc3-a7b4-1e7a06005440', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('61918b39-dd0b-4fc3-a7b4-1e7a06005440', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('fc9fd756-2c83-4a2f-98e5-c3010ea24830', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('fc9fd756-2c83-4a2f-98e5-c3010ea24830', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('fc9fd756-2c83-4a2f-98e5-c3010ea24830', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9b03836a-b3cc-4177-b7bb-08985135899b', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9b03836a-b3cc-4177-b7bb-08985135899b', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a11024b7-1c87-4d38-8839-8701cb10f6cc', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a11024b7-1c87-4d38-8839-8701cb10f6cc', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('10ae1890-3ce5-4a6c-9aab-033b4c944c8c', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('10ae1890-3ce5-4a6c-9aab-033b4c944c8c', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f56338db-7c4f-417c-a1b6-6b5ccea8954c', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f56338db-7c4f-417c-a1b6-6b5ccea8954c', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e29be01a-016d-4cc8-baca-5cf58bff1606', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e29be01a-016d-4cc8-baca-5cf58bff1606', '${organizationScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e29be01a-016d-4cc8-baca-5cf58bff1606', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8421216f-523d-477e-81bc-c734ab73c4dc', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8421216f-523d-477e-81bc-c734ab73c4dc', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b869b0ac-6084-4eff-a314-f3078b03d711', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b869b0ac-6084-4eff-a314-f3078b03d711', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7446fc6f-3d48-44b1-bbcf-9344b61c6f3d', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('2bb41343-db41-424e-ac9e-e3d7109463b8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('2bb41343-db41-424e-ac9e-e3d7109463b8', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('2bb41343-db41-424e-ac9e-e3d7109463b8', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c33816e-ae8b-4c67-afd4-2b137eebc285', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c33816e-ae8b-4c67-afd4-2b137eebc285', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c33816e-ae8b-4c67-afd4-2b137eebc285', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a00a7749-4b00-415e-af00-b2d2c2cc6e27', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a00a7749-4b00-415e-af00-b2d2c2cc6e27', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('a00a7749-4b00-415e-af00-b2d2c2cc6e27', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c51d8918-747c-454e-920e-9a54d5961c4c', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c51d8918-747c-454e-920e-9a54d5961c4c', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('c51d8918-747c-454e-920e-9a54d5961c4c', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d9b7430c-9d16-460f-9e69-3c3efff65e0f', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d9b7430c-9d16-460f-9e69-3c3efff65e0f', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d9b7430c-9d16-460f-9e69-3c3efff65e0f', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('988f31fd-b955-4f1c-b06e-eab9dc4be530', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('988f31fd-b955-4f1c-b06e-eab9dc4be530', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('92b4c161-1580-4cf2-bc2a-6f683c48d71a', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('92b4c161-1580-4cf2-bc2a-6f683c48d71a', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', '${organizationScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', 'true', 'include.in.token.scope');


--
-- TOC entry 4217 (class 0 OID 16462)
-- Dependencies: 228
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1203b543-c776-40f7-9215-1e89e9d55ae9', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('2eb79431-c979-467b-99de-c1c8f318f129', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('413b2e61-5722-4fb1-8680-b62c34c9f5ae', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('23bc3309-3c5b-4b05-a1ea-9a8b21ce56d5', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1f878744-a80b-4197-9f73-f620b31df72b', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '92b4c161-1580-4cf2-bc2a-6f683c48d71a', true);


--
-- TOC entry 4218 (class 0 OID 16468)
-- Dependencies: 229
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', '98bb9c86-1350-4b8a-ad7c-a02a466c5fd3');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('8421216f-523d-477e-81bc-c734ab73c4dc', '4688f8e4-30a0-40c0-8be6-71b832bbddd5');


--
-- TOC entry 4219 (class 0 OID 16471)
-- Dependencies: 230
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('cc443278-c8c5-4c5b-9595-c84f98772b79', 'Trusted Hosts', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('7581fdfe-c35c-478a-803a-b54e45630212', 'Consent Required', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('17c55548-085c-45e4-8a5c-fa9ec89cce9e', 'Full Scope Disabled', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('ae34c25b-ebec-4f6d-b634-6c1778942aeb', 'Max Clients Limit', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('49924564-f996-41e9-953a-827bed18d848', 'Allowed Protocol Mapper Types', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('92b80a90-ed23-460f-b2c9-e334c2fc017f', 'Allowed Client Scopes', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'Allowed Protocol Mapper Types', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('7e8be07b-58cf-43eb-bd36-65865f7a4dba', 'Allowed Client Scopes', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('9564b10d-696d-4215-925a-ee04d7613466', 'rsa-generated', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('24927aaf-d880-453e-903d-b99e153c0c66', 'rsa-enc-generated', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2842a6ab-d2ce-41f7-a1ca-d8e757742ae2', 'hmac-generated-hs512', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('af7cd3b5-4379-435c-a167-2d284208fafe', 'aes-generated', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'aes-generated', 'org.keycloak.keys.KeyProvider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('e1a61658-da85-4462-a6d1-782894233a34', NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'declarative-user-profile', 'org.keycloak.userprofile.UserProfileProvider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('32847286-cdbb-4a9d-908f-b4f4bf062394', 'rsa-generated', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'rsa-generated', 'org.keycloak.keys.KeyProvider', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('95738b88-5b42-4a54-a4cf-c880753b1f08', 'rsa-enc-generated', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('0d9eed19-9dcc-47ef-b4aa-c84ec4cd400d', 'hmac-generated-hs512', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'hmac-generated', 'org.keycloak.keys.KeyProvider', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('e43d433d-73c2-4473-bb25-9bb7a7ec8dc5', 'aes-generated', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'aes-generated', 'org.keycloak.keys.KeyProvider', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('376c04f9-95df-4a22-ab94-b39d984f43a6', 'Trusted Hosts', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('c6e47f21-fa1c-4dbd-a984-c71f81429b93', 'Consent Required', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('d9883948-01c5-4635-97a2-c2c65cc39729', 'Full Scope Disabled', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('4b4dfa4d-4d14-4590-8a17-9da09c6ed0a8', 'Max Clients Limit', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'Allowed Protocol Mapper Types', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('16f09cc6-0e89-4639-8881-1b5f2078cae7', 'Allowed Client Scopes', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('0813d966-bc1d-48cb-b5d7-77d5451223f0', 'Allowed Protocol Mapper Types', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('711f5d98-f8a4-4bc6-ba77-e4cec8f7d358', 'Allowed Client Scopes', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'authenticated');


--
-- TOC entry 4220 (class 0 OID 16476)
-- Dependencies: 231
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ae6a6c44-f635-4d36-96f9-96f3fcb591bf', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2e209c8a-6ffb-4cfe-9db2-d4be2c72074b', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4caac0ef-6e2a-416f-b280-e9966c13d6a2', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ff5ac45d-3f9c-4b70-aaa1-5b06c360987c', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1064943a-a170-4ff6-8a6d-019b219bc590', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('146ec0c7-340a-462d-b6d2-e115de52d64f', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1d2d8cc3-43f9-41c0-bf14-cc0befa79a19', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('3358c1d9-7ada-4b8b-990b-0596ff42c531', '49924564-f996-41e9-953a-827bed18d848', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fdbf39c3-a77a-46a8-8828-d2deec38a14c', 'cc443278-c8c5-4c5b-9595-c84f98772b79', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8b71b60a-1997-4862-bd20-6f90beb8d362', 'cc443278-c8c5-4c5b-9595-c84f98772b79', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7bee83bd-1ea0-463e-8521-8b0563d380ed', 'ae34c25b-ebec-4f6d-b634-6c1778942aeb', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9cc43176-5b00-4371-ba6c-1f1da2ce2d90', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('47d71fd4-a9e0-4f56-9ce2-085e96c0d17f', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f9b37ac5-ce0a-4b93-8652-bdfb4534de7e', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6d56f38b-0d8d-449a-8449-defdc4a2610c', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b33e91ea-d226-4b0e-b716-e0eec172ecac', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7b4d5cf5-fdba-45a2-8a79-fa400d6af6e4', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('678b065e-db0b-4824-ac03-2c43ec7ddcaf', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b0ff777f-a4e5-41a0-91a5-701a805f5ad9', 'df3b3010-8c43-4aa4-9cf3-88b575535ce5', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2108941c-c35c-46a4-81d8-a309b7d1b019', '92b80a90-ed23-460f-b2c9-e334c2fc017f', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d6127e6e-ceaf-4d73-9c18-5607a845c020', '7e8be07b-58cf-43eb-bd36-65865f7a4dba', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0e0672c5-2b65-4ae8-93fe-40bb9db87c0f', 'af7cd3b5-4379-435c-a167-2d284208fafe', 'secret', 'XbRsYTwYgpgWQncDaZj2tg');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f6294318-687e-4d09-a2c8-ec2e73c7d97b', 'af7cd3b5-4379-435c-a167-2d284208fafe', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1c7c14aa-430a-4a2f-b92b-e73d989f118a', 'af7cd3b5-4379-435c-a167-2d284208fafe', 'kid', '7c3ca38f-c855-4e9c-b1a3-5e048b2834cd');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('70d79a51-e841-45cd-8546-24305e2b36b8', '2842a6ab-d2ce-41f7-a1ca-d8e757742ae2', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('27f5effa-e2db-4cc2-831e-c157453b2a4d', '2842a6ab-d2ce-41f7-a1ca-d8e757742ae2', 'kid', '88b90594-53e5-4c16-9575-8d383079084d');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e0c7f441-69ab-4f65-8dfe-582004475820', '2842a6ab-d2ce-41f7-a1ca-d8e757742ae2', 'algorithm', 'HS512');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5e646e58-a63d-47b1-b942-b5ff638c3161', '2842a6ab-d2ce-41f7-a1ca-d8e757742ae2', 'secret', 'PNPllssiVgrlxJtrH34B3F3HXq-KuRKi6vUEgnMifL4AaG_Swy1-cgiIwyIeHODt3zmJjMzLK9F-LvCuuflJbbY8SQMjEba7IyAPh_ifcAOPa6fRdSsFfO_arz6ga0JE4wSGY-Ar-dDfsN7pwLB2R51gEH3rLaLyY-tI79Ho_Zg');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f6dd96fb-3ec5-4ff6-9c6f-71d27d127662', '9564b10d-696d-4215-925a-ee04d7613466', 'privateKey', 'MIIEowIBAAKCAQEAtPuE2sDH/K4EGroYfaVvZ9MefRpY/ES4TSfkmo+asu/epgOiEBo56z0KmotI4UNQTz+tx6qlm94KqU/AMMtAr6fDCYvaDFHTMYBBNtc8YQvm+GPw/GlJUvGQfoowPDxKp0uUC2iBu6oMblTq9sXIl78bxqemQPB+2sG0w4LGy/PnGjeYpc7RWoOG+AAw0JrXxMx5OHHCu2bEP0haz9tVCHMcPF3ZuvRCbytzNtaAsmNvwRXaDXykYZUTuZAAzrFAl74QeNI4aJSJ/d5R8DJ77UWoWi7VuoywDeP1EgCNBMbh9wJ7bx9C0DYhy0RTP7Ju1yom+LLbJFaEHX20dyqWFQIDAQABAoIBACOplEpOxpmh6KkjloPbv5Ij5dQdBv/ewrphbAiQ15j+706jVKH7qQITqy082QWacA7Nq362v59xJ4SpdGOpCXwTgLk216ap0QXmEfOugfVVlRPJDcmPLaWseB6XOF4GO2ev2uJMm5PRNFXhYdNysc5FGEIS8w3E1hphJS+Ja4bwmfdZjFxsHBGZeoSA2sMoTlXN2b5VEnIuBDudIn9rtOmLsq7KA4SgAsYvRq4N7Z51NXGWRGTq2uL6GSGMoPuhUKbMwurEAzEFux8Wc9DwdLH0DuVNLEJ0YmqIHdYKX8J1GyHHFqvcfa92aH8DLZXRufoHHlRBnKbK3GoTCrZT5lkCgYEA2zauvvgESntLdqL+HVkpwq/i71yTfb8xrrE8N/QKFjhTdO1OlSE9ANe2WvoxMpXpSMTEjxSA+mcwVjfZciKfPH8mSPDqqIZFPDAncmac+u/FwQLdgifca8NKvgGteFckFXpARRnlffMgPgxakNfN9/yYKAemVQNR3yJYdQLFRScCgYEA01px+tMCnhI2wMz996Jbrt6r76sgRCC2hevndehryEiZNNatiEPZmjLVJFesP/Mb6d+85Rii29tzDPdPgSW9pE6QXv3LxTptMeA85sPmMUq3gu2eIZXtRB1Zz/qN4Y6TQ+0IxlnrrHEqMI2jdB+Cx0M3ZUhaQOXBdW0FrGCPaGMCgYAD1U708+1PSByntG3xIXADgYPcX6gMmN1Lirnc2J2cidubvdKT9QLWEu+TY7Cci9aKeTZesiMXPdqwh0V8I3LZYffParcPv1lSlhz6eSThlnPEzkIFVqEaGU4jSHA6HHv7DCo3ix5iN3Am5Zxnz/5ACeC3Qnr8HZS+7CDT2vqMHQKBgB+vYoEI206ZSm4TDUvvojEQHtSaYgb0pIhlOlj51Ba9k4JRYMiZ62hrkHqXTjJ0Hs4sBaSO0fOF7bSW6utgnhKg2JH1GHRj8vTUOi0aV0syeVp+hwNf96cLg2hjlpunBTrcsUETP/qlKH8I7OU+yBtZX1emxikOiLcy9fPGshkjAoGBAJOVAz8a8OF9iaz/G74xap+90yOqvSiYRQktoX8JniV6W1JgtaUEHC7wq2dfRyQI1gpM9LYu9wdHk8wbrJzkJcs8AoArY2rxr2vJBI6cXlHx78vBT4exh6LktoO1Qa27IgILyIutkD5z0hACdc9o91erA+WgqmYEHRqWzW6R2aYM');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('17a29522-3351-4941-a495-d12522d4e805', '9564b10d-696d-4215-925a-ee04d7613466', 'keyUse', 'SIG');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b657a541-0fbe-4177-81fc-d4c52609c7a1', '9564b10d-696d-4215-925a-ee04d7613466', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d30e8cbc-1415-40b7-a45c-932d387bf373', '9564b10d-696d-4215-925a-ee04d7613466', 'certificate', 'MIICmzCCAYMCBgGZPqKr6TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwOTEyMTU1MjUyWhcNMzUwOTEyMTU1NDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC0+4TawMf8rgQauhh9pW9n0x59Glj8RLhNJ+Saj5qy796mA6IQGjnrPQqai0jhQ1BPP63HqqWb3gqpT8Awy0Cvp8MJi9oMUdMxgEE21zxhC+b4Y/D8aUlS8ZB+ijA8PEqnS5QLaIG7qgxuVOr2xciXvxvGp6ZA8H7awbTDgsbL8+caN5ilztFag4b4ADDQmtfEzHk4ccK7ZsQ/SFrP21UIcxw8Xdm69EJvK3M21oCyY2/BFdoNfKRhlRO5kADOsUCXvhB40jholIn93lHwMnvtRahaLtW6jLAN4/USAI0ExuH3AntvH0LQNiHLRFM/sm7XKib4stskVoQdfbR3KpYVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIvDVWD8hCnum1EAlwxM9lCrt82H7Q5RZqQ2yZx5EuegKTFnjZqtWBVi4E1CCQHSmSEL2fDOztpDu7lkKRi4Rb/DjW5x6+ghcT+XQceA1Fvil3IZn0Krq/iMeBFkWiqIGThUr4pBtKw+pCTaf8zvbOJqN20lVMrE/fl5iUa7kaAs98aOapXO01B9Vh9rl/Z0AndUEqzpaw/hA+V8sreiZXz1TlCU+lomg1SaXMx2pDRT2hF+AulCIZPByzfgG2MsenSRF51enAaQufQWvPrb7XXdsKXLXGdI9K8NHeIQg4TPsjpVMCX0Ee+ticKOWn2GeNhFKx3eiIIa3mxxoTtcIqU=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('c70d9f7f-7f23-4964-8872-6032b1c51307', '24927aaf-d880-453e-903d-b99e153c0c66', 'keyUse', 'ENC');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a25f1574-939e-4d6d-8ad5-20efa13aedd6', '24927aaf-d880-453e-903d-b99e153c0c66', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('218efae0-9b7e-496d-b9b9-18f9da8e6dbb', '24927aaf-d880-453e-903d-b99e153c0c66', 'privateKey', 'MIIEpAIBAAKCAQEAsZO1zLE02zT726xl3ItjZoFOK+mB6OqNJoh744e7D7i9xixwq/3rB1G1SpvfYkVv6f3wBGFxip6mbHiMR4C5aStVgI3R7giln3Rkp1aK+ouOn//wJpSlRYNVIJ9Ev44A1809OU7+4J/gqYgYc4htHWDgjQ5fShC/QBCzikJOwoTOkNvBrkGBASeTl3Pvi19JiSwqnv4t7nKxOV8HQWsZ1PKtpbDbD0csKVSHNCEu/BRdBM3VC6QxGy9n/QImVrXUyKSY7MSyX4GmuyQeDpBJnK1aYiK4tbR02AcrJ5BgHedxcDjvQLw8Hg3FCc7FIO/QsQkgQCXzaeQd9HlR1liqdwIDAQABAoIBAAKpXK5/lyqmg4IqP1W+VasR714DaWVYUO1JNmkDNO+zY3J/0AUWNTXlKMQuFVcNcj0d4vg2+2VBETWCbZxnCPKul5fFGq/WFw6OflYBdqKpk67TYzjw0EcOcpZ6A4CiXD1yFqOwHSMB5wXaVhEy8/1wvJFy9SBjEQPp8wb0n3hwmPwtVoxMRKFurUhuk/jdNGRbulX13VHcRhqVfJ2m4GzaO94Qx2Sk0OSg6nRq6e/VD82yf0sJEh2RzONLQ3F8D1GRgmytkJjS1r6ZaTsrGVM8HeUvJuvVAMvYvXIq4ZdqhTaNYU/p8azLWlx6rmY92Vrm58Ps3je2W6VnVpYd9eECgYEA84Pns13O40R7KEAZKKE2o+4TWnjHtAa2VyCvUQPoi8VUldFk9t3i4S6JcaWGWZmzVhyKTkfhirio7wl6baTkdC9PMhJjYXRdhdgKob7sXAC3mp9kjTcSf8eDfMkBxBHDiUIdSql/No5MXrO8j1uq7jCIJ8UVuLtvW0D/6rNqxYMCgYEAuq5ggcAmuIwByiPc+uK0KLK+m5YAmr15DDWJDSNugSzbtXYoN15P78J5tn52VEvayuqkg/uDDrAi8lY6KdSliIhwNbvagXDfcC/BN83XeeIGbo5Yua8NdybAGuvzDAj71NacDPJstcTzgmCrvrBa4bXmSczOcS9sSkipqCJ9KP0CgYEAzMd36VZRzLyh9M8yWQB5OpHSpJo9Fh8u50YNKEvpGuDuqK5WAWPGjybbXj6cJG0kap3FkN7RxB5Vse5+jgXEOBAwwSLFgAajPxLWnf44NYZE4Dp6DGbrn5jf8ef3HDL0BFEc4NR4riAsCNeNEeE8dOFLHmaWRasZkduvWmdWupECgYEAlVZn14QqtZky2U0FOyJeMuyCtJ4zz5XhHtY40+zTOrzy6eAi3eAxnEB783SJHngsCAXbI8XxGq/m1OwLzWjSHz3eXe3wJ3pvFCTvsb+WL2eT858l9SzHXdj+9spn/Om245Xm8iiAtIxgrJy+52XW3hcQqVsQjtT8ERS9u8YTT9UCgYALLbzuPSBlrrf46KJ9eROYOjDacpG0r+EuRPlOeyzl9Wryx1y4EDI+OLInzUYnBw1asHJLFovP+v/2+O7vnOx6lyFDaxOpE1WSIehmam7uYRQF2zKS+gcYtAXG/a24JK1b5lN3WknXQCtUC282ATCnVMFNpfUh/jQpHuYoes7QZA==');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('361f98b2-01b0-49ec-83b9-d4dbad0872db', '24927aaf-d880-453e-903d-b99e153c0c66', 'certificate', 'MIICmzCCAYMCBgGZPqKsJDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjUwOTEyMTU1MjUyWhcNMzUwOTEyMTU1NDMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxk7XMsTTbNPvbrGXci2NmgU4r6YHo6o0miHvjh7sPuL3GLHCr/esHUbVKm99iRW/p/fAEYXGKnqZseIxHgLlpK1WAjdHuCKWfdGSnVor6i46f//AmlKVFg1Ugn0S/jgDXzT05Tv7gn+CpiBhziG0dYOCNDl9KEL9AELOKQk7ChM6Q28GuQYEBJ5OXc++LX0mJLCqe/i3ucrE5XwdBaxnU8q2lsNsPRywpVIc0IS78FF0EzdULpDEbL2f9AiZWtdTIpJjsxLJfgaa7JB4OkEmcrVpiIri1tHTYBysnkGAd53FwOO9AvDweDcUJzsUg79CxCSBAJfNp5B30eVHWWKp3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADUwifnjcMDAweu6/jOvO3bX8V81Globpnq0TWnY8OFU9txhrrS+U6O+kmA7Lchgp6jzD/f/8xJBZH85E+OxVv6CRVEWhhKheZMrQCnH9vT/XtbvGKCRIk4qjDlTgnCBt+LCRrRcIMZQBzQ7x1xjLp6kYuYOy/KTmnyeJO+geQm0lwl908up/5+2EnMjNxRw09uFIRy2LYQIMV0ZIo1+SLx9Du/l5zs63XqtTqMBgTVOBvCNTOyxVF3Jg8JeVDJOKXUGM6tvO++TbajjmkLxXTi/FSDTFzSSVlHvoZfL0Ag1H9GEGAsNAPW4oOpOLPEO7dfSsxpdVMabmyVSJDhaBMg=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('242c8ebd-45e0-4889-b929-9abf212616fa', '24927aaf-d880-453e-903d-b99e153c0c66', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('49654f7d-9039-4b3d-a4d0-926eed99d7d1', 'e1a61658-da85-4462-a6d1-782894233a34', 'kc.user.profile.config', '{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}]}');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e2043a19-d751-47f6-94f1-af7b818a27db', '95738b88-5b42-4a54-a4cf-c880753b1f08', 'keyUse', 'ENC');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fc6c3aa7-90f3-4401-b411-b0b4235b3596', '95738b88-5b42-4a54-a4cf-c880753b1f08', 'certificate', 'MIICnzCCAYcCBgGZPqMLETANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAh3aXNobGlzdDAeFw0yNTA5MTIxNTUzMTZaFw0zNTA5MTIxNTU0NTZaMBMxETAPBgNVBAMMCHdpc2hsaXN0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs2NdBMJp7YDzcX0FX5s2biKE3o3YHIJgrmHTzMyVp93JjNwiqssOWi+TI6r73SHfXKZYaCI2xLxg1f+bZL7I4hehk5zliIYD1FMegr25RpdwPJNrePHH8tjjY3SyK3DzT6rJdtsUs/BaryEdyC6NAel2b13YYric3yhoTWaWgvgmKqOVHNeRd92JUqHW+GvDJJqly02de6mNdl47LEgZV+UUqyJGrFLemaakENwhfcN0MPWRJZO3Pc3L/M9OG52SoIO2bSfpgYc/5lDdeEnMv2WmJl7oJJfAD0HMNBhe4vaUAfrIFpfU9rFsqd/Rb3LX18PN1zDYYzd5XEI5RQvqfQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBmO0cAgqHvgJmb2/IYXJxhQ929OrShB97YsKmPFqNAu5nNNp5ETvqJNpfe4d+OXlD/Tmb1YfFQCEqTFS3RrfSG28aaXyNnjfQzR38QcgY+MP5Mx8ptrreqlNBpocSY1weRUjDbpLa8+x5EbCm63pLs6uoTHUbF+kmO8LkPCQnfBG3rwjR2boqenqvaTzgJC/og/MrnFL9IqickXP486rleIx3bM/1QM6nGcMu93h6E3xgZ1QWSGwoObWMR0EJWSDAwDdDYDLCXYCccMeg3atHiEjVu8+FBd+/0nVzpLsO8K96Inqgnhqy+UFohxshgjxlDPHASlOHJsHQf6cwW58Ng');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1023acf7-6e09-476b-88b2-a0eccaf76bfc', '95738b88-5b42-4a54-a4cf-c880753b1f08', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('36b84566-80f6-4d87-a5e9-a223cf2c4140', '95738b88-5b42-4a54-a4cf-c880753b1f08', 'privateKey', 'MIIEowIBAAKCAQEAs2NdBMJp7YDzcX0FX5s2biKE3o3YHIJgrmHTzMyVp93JjNwiqssOWi+TI6r73SHfXKZYaCI2xLxg1f+bZL7I4hehk5zliIYD1FMegr25RpdwPJNrePHH8tjjY3SyK3DzT6rJdtsUs/BaryEdyC6NAel2b13YYric3yhoTWaWgvgmKqOVHNeRd92JUqHW+GvDJJqly02de6mNdl47LEgZV+UUqyJGrFLemaakENwhfcN0MPWRJZO3Pc3L/M9OG52SoIO2bSfpgYc/5lDdeEnMv2WmJl7oJJfAD0HMNBhe4vaUAfrIFpfU9rFsqd/Rb3LX18PN1zDYYzd5XEI5RQvqfQIDAQABAoIBAD60MMOFIXm/ZVj6FnLA0lnU/xS8CBqPCDRsRZiEupsez2DJYeTJbY7gqlIBZmB5gpXkH2rm6rYCEuc6nZqthZJiKDxsz17VWWlSVIvmvWiLbtP9w8dW3ElqvrD5DX5Z0PK8BAfjtGzhSxGEReC/RNKyRI/RAd4gIdVvTmYfweStOgWso3M7SqE3puvV7yc1DBrXtWZAV/ZuoFIZ/IV1spaufn8UT/cx8gXXg6Sm1EQClsWxvKmMccyiXbuNRBIHo4vWOC0zagrifu1ViWQ8B5Rbe+A+LcJ6YzMOKol+qvAwKWq2lGMs1WmlG7BuED6+Gova8rdBzc/+DLVIofb/txECgYEA792EDEfrPeP5Imit10KwvYINaV2Isz8eteKzeTtrqT1F45c1X3DwZ78Gx3ypyLNgXlqoumOkHev9fAMQKh6KZsMXyGaF8DLliaBvsIKP1MKyJARf8tHzDH3STwsEzmZHZry06eOe/cA0KPSKIRJtsO5sdzIMvXjqxKkzLg62aE8CgYEAv3RuD4+Ea+8OSOzwQVy6wvFn0al4OpO5Y6kCEriO7TdxDC6rbXkjsOwhQMuv5oEXSWsaQZmPGQRYiIAVPPB4+0gDPbBSDshM8IUJSUe8becfDiNQYVtQSb7s5pzhzs/4sPiRG+kz1rz3Dv09AbWXISr9U9lYcAFG+fKyhaaxQXMCgYAz1ihaSxSQfHrzr7GZ6oStf7SMR7VqH0LwxbxJf8jleyNmauAS7yJVGVhKtisu/2zdFzSNi0kFWmGecj8FCzKXwKOcIGPjo+wtEOnyOFUDAsxisjtWC389/Nb9VAFG5Z2amz9xqEpMxkO/chGD0iq4aN4x6DQOoloCBBrWYkGTSwKBgAOQY0we29Q2iwmIf6B33XIrlEcu5HIStezJBKTckqyPz6buZ3qOOr/cZXITWJ7t4EUZnU+DUEqi7hL8b2jHATmMSaMoWR61U9lWYKngj/1rxAQ7XA+z53a3+yj/2qRC8to4hlsCqFhjBCZfSHdzrfCMIFMjRKYxH+UfQ3uBcuNJAoGBAIaE22WbzLsZWoxFkM77Ay9AieF5h7D7MrPN9rAdZ5jl5UG/VfQGEQwJCrMcqIo3ZboaPHYJlnsi4tqSimw98JNGa5jn3DGF+K37+3DgoFIjGdPnL/WBZqKSX7QbeljYSF5HzJ0fjJ6NGNw2w5xCHHQsKHke4+OYA0XSFIv5HAMG');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('138310d3-5f7e-4e39-900e-6fa01fff8ef7', '95738b88-5b42-4a54-a4cf-c880753b1f08', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8f7c2c53-fca2-4453-adc8-80e6d03f5db7', '0d9eed19-9dcc-47ef-b4aa-c84ec4cd400d', 'secret', 'W7X_8l49qcdppe0wP2Lc59T8mxT8gxXnnD9tUTgWbMMjIMrCpeRa2lEM-LdvgZKRFstYF0s2yOXg7vTnuLMIC3dXHrKKKImCGH7eWHwy9_h5vLnmEHRheutA_mCffY3raMkKGW7vtIJsaI_H8d0ZJque1QTSxRAasHO2fES6eu0');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a4fccbfe-7a2d-40fd-b49e-91ef028e140c', '0d9eed19-9dcc-47ef-b4aa-c84ec4cd400d', 'kid', '7e9d52e7-c8fd-4f82-8950-124b30a58333');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('296bef0f-02b0-452d-b291-efe062a1f3a8', '0d9eed19-9dcc-47ef-b4aa-c84ec4cd400d', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d6e6f41e-4cf6-430a-a798-4e1178249eb4', '0d9eed19-9dcc-47ef-b4aa-c84ec4cd400d', 'algorithm', 'HS512');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5b1b8265-5518-448b-a0c4-0cd30f70784f', '32847286-cdbb-4a9d-908f-b4f4bf062394', 'certificate', 'MIICnzCCAYcCBgGZPqMKFTANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAh3aXNobGlzdDAeFw0yNTA5MTIxNTUzMTZaFw0zNTA5MTIxNTU0NTZaMBMxETAPBgNVBAMMCHdpc2hsaXN0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy9K4e0Y63PJUInX8qL9LdEAXH+vXL4f0ValFde/E7xt3otu7L9vyg8kXFo87N8z1ys9gVvoLM3Ps1uxO4zleUg2rIDeDKD1sEPvRyqut3v4sV2JNU9JFoU56WcTJPqDyFC8E/2qPObM6cMNLqmpD6/CosVR8iT1G9e/fwhwus3tN8rdBxZQ1di77wziFAU7n3WCF/JAghtbj816jmxKTHnxENhttDBQZbo8gPyiUpeYnNWXejKopiYEERqw7JbX6WmD63mxC33Q+W0Y8hKfnRWBEwpgkMpamAaJ9Wrw/3qeswpkla//fmBAuMl+LBnmT5x7UwFA8IxgVupyxBA/d5QIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQA10hp31CbF8xSNQQhwedh7+aTkEMM/LznA6a+VPHjLmGg36coagKzz4Ig4MSgbFHKSecigEDN+UBgdJxob2XwTrFlQXjaVMS0uSkrsn5+KatO33wyreIEu0JxiX9YHPDq6rneeQlVbAtdAIIj5XVCPH7CB+Lzz8BEahvFTanC+RqvuhSdAfcMEDkSFMdvm3RIszveZQEfDm/pZEBfVwW1bQmwr+RXs1ABFyWApj7ifuPWJVfqqTMrzTJHQsK+e3DrHHHr+gVF8DyaCfE3TjSmUWi+yKnsL0aJfKDzaBybRW0OUq6jmitsqhPmWXa+Vso9GawNB/D/dRf5x89C8Udrw');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6ea532c2-0a4b-40cb-8b90-3416720ba6ca', '32847286-cdbb-4a9d-908f-b4f4bf062394', 'keyUse', 'SIG');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a36c3a11-a740-48f0-8bc5-e63c28189ed6', '32847286-cdbb-4a9d-908f-b4f4bf062394', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('94f6c3f1-da70-4200-bf34-56966ef669df', '32847286-cdbb-4a9d-908f-b4f4bf062394', 'privateKey', 'MIIEowIBAAKCAQEAy9K4e0Y63PJUInX8qL9LdEAXH+vXL4f0ValFde/E7xt3otu7L9vyg8kXFo87N8z1ys9gVvoLM3Ps1uxO4zleUg2rIDeDKD1sEPvRyqut3v4sV2JNU9JFoU56WcTJPqDyFC8E/2qPObM6cMNLqmpD6/CosVR8iT1G9e/fwhwus3tN8rdBxZQ1di77wziFAU7n3WCF/JAghtbj816jmxKTHnxENhttDBQZbo8gPyiUpeYnNWXejKopiYEERqw7JbX6WmD63mxC33Q+W0Y8hKfnRWBEwpgkMpamAaJ9Wrw/3qeswpkla//fmBAuMl+LBnmT5x7UwFA8IxgVupyxBA/d5QIDAQABAoIBAANWGlmhFc973tiAzMaIpDmkcWcgjYm/vCfDL9nKjNxpTYwHktgRIyQRSyrimwla/DEYugET/lfldYEbUPJO2YWKgvlxvmq5cheYIAfDirOJdZHgOtGF9PMo5/xfbQREGBPa+lJYkMKqLGMZ23iNIC35eVu24cCyrcwDdoGehsOmRbvteweI7mdbjKXkPf58PkJ86mdTj5Awo4BO+z97xFV+ObPqeSRxQVGX0ZAyQPR+EQ0l0uv5raBOae8YTWnT+QKNGyKYA67Za+9y1SHHyBP8nDnB5LJ++WAJZgOqgdLJ549qmyknPbqCtNjPDiNRIUg/b+erpcjnLDZuUjtXoAECgYEA+vd8tzvUf6CVnUckR/lqkR0HKC2J7J46/tut8ZVV0UlgCbBCCT2MmKAyV0Wz6cM1sf4NzxKWbX7u7ebpnS3H5Vm0pmpdWIEfVXiGV3Dgf+50ellrbElFQrvoGPuiNWfmy1I7xiKLlOuleLwn0zGuZpWJ36G3Ubo+/y9KWkBjsuMCgYEAz+kwVeL8SwnE9Wnd20n+kfaXYYYOMewyd/UZB0w+wVmXJdR9Lsr1CZS6NrK6B3UaxXL53K8R/Rz4Xvf0LXXH80OTyoZlyADXPsTcnrQm3of76/txFlGIX4IoOIbLo9Yi9NnZB6mbvYc43La9slsmcXHGGlUc+juS9UxDLkbGXpcCgYEAsc5mLevVwhaj6apdqiCrv+QxDeY1sc7pPWem9WI4Su8Re8vE/Yb99aSKBgr8TMJhaJn2bp9ctHcaELNpEFM/LN9BfiYdvHa/HG8nvwvaAsmO/KAd27qNt5op9olRg0T531ODxfzzp67MrZ2hGaA5T7Ti2e5ZUy4BNArtQsQb3sECgYBOUum7oUwsNJz3Ww+SGfkGIeB7g9X7JqEIodPw9N87VbXkMX2LUDgpiNbx3jjIsGwKcDsC0Q00zmIe3MgnDBTsZsvZYvIa+34bDmySeQmfkZjtGIdMwiBe4pimWtmCehwnI55oDZQ3PSbFty4Vb9M2r4bSyrek6SZ+tGEmoNEANwKBgAGaWryWoVGAlpTx3/sqTYaatLY7IwpYyTBNQbEhzpiF34bprWNf7Nb4m6pwVitAI0SFyaTQLihl6fTofsqBqliYw3Y5nw8155fIVf6XklqHp6BRMg07vzHYn47t76LO/Llct+LL/FyFss10Qku2hv5UvRbGyQfJwHAG0szqW6wF');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('3cc84c69-02d8-4263-b562-7890f869d94f', 'e43d433d-73c2-4473-bb25-9bb7a7ec8dc5', 'kid', 'b960f537-9ced-4342-a5dc-b544d37a116b');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('cae3f6a5-5c78-46c0-8f2c-87ae5148defd', 'e43d433d-73c2-4473-bb25-9bb7a7ec8dc5', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2a590554-31d4-4300-9b85-14cd9bf101ac', 'e43d433d-73c2-4473-bb25-9bb7a7ec8dc5', 'secret', '613kmmiy_6AJqpwJbmRUHA');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('5519b659-d36e-48eb-befb-aa4740a41d10', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6ef056e4-55c7-47c0-b897-0cfcdc949993', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d830fef7-ec8e-4449-8fa6-3d40c2f97b3c', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('90c4c357-7e3a-4203-bf35-35cda447e5e5', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('edc00a46-d98a-49e0-a5c6-8b8da182b23e', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('41dab199-111b-4773-a84b-4ce22f02a9ff', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d725d595-3ca8-41a0-ab7d-8e74f7e6015e', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2195937f-b959-4e9b-b53f-69d7920d500e', '0acb13b3-c3c9-4ae7-b169-3648e22ace78', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9e082a68-ed51-4e35-89cc-2a711ee87096', '4b4dfa4d-4d14-4590-8a17-9da09c6ed0a8', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('35670c65-d9d1-4683-a36d-64f078bfba86', '376c04f9-95df-4a22-ab94-b39d984f43a6', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('79c98bc7-2236-429f-bd5a-f8386e4e2fb1', '376c04f9-95df-4a22-ab94-b39d984f43a6', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6416bd0c-045c-410c-877e-305713230fc2', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b7d4638d-141a-40ac-b671-bb18966a9359', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('c81fc302-2e54-449a-947d-110dc27223ec', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2910ebad-9d96-4508-9253-8e0bba845d90', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fb6393e9-ef04-43bf-aa59-124bb0e9efc4', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9758164c-8c96-48df-a91d-8aeeeacde9ff', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0bbbe7f3-c473-445e-880a-c0c3016b2bbc', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('8232d707-b54c-48f2-847b-63695b9ca279', '0813d966-bc1d-48cb-b5d7-77d5451223f0', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('39fb7d4f-26d1-4e58-896b-2cb8de00757a', '16f09cc6-0e89-4639-8881-1b5f2078cae7', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('db8df744-9243-4c57-92be-5685996d7789', '711f5d98-f8a4-4bc6-ba77-e4cec8f7d358', 'allow-default-scopes', 'true');


--
-- TOC entry 4221 (class 0 OID 16481)
-- Dependencies: 232
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '93b919cd-e59e-411c-9140-0884a70de24c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'a4d4bef6-df7b-4ec6-8d0c-d816f60d7e28');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'a30901b6-8cb3-4f28-868b-363bbc342460');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '37fcb83c-bbbc-43ce-9257-148e8a6ec30e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '0e7fca1d-6d28-4181-90e2-a7661954b67b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '08317778-211f-451c-a709-9d4fece410bc');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '30625f18-1f01-4458-bb09-aa919cc105df');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'a968c822-377f-4608-9ada-a11802cd04d6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '2a4b6d10-7d4c-436e-a845-cf5c23ad05cb');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'cec2cc42-2759-45f7-a792-0149daf1c3aa');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '4da4176b-7235-4cff-b300-df9e4ced69b3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '7e89a92e-78c8-42ff-8151-800d09395612');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'f62229cd-2677-48b5-ab6d-c581726c9678');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '9011ea6f-2eb0-4db9-8d14-2cf95e788f47');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'b6207ab8-0f83-4a67-9b87-ed9b0bc8934a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '66d7aa69-41e6-408a-b8dd-f012994a63a2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '54f8d078-96a4-4727-a565-e4e6f8e4adba');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '35bc499e-7a9f-4180-95c9-bd1c01c10b30');
INSERT INTO public.composite_role (composite, child_role) VALUES ('0e7fca1d-6d28-4181-90e2-a7661954b67b', '66d7aa69-41e6-408a-b8dd-f012994a63a2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('37fcb83c-bbbc-43ce-9257-148e8a6ec30e', 'b6207ab8-0f83-4a67-9b87-ed9b0bc8934a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('37fcb83c-bbbc-43ce-9257-148e8a6ec30e', '35bc499e-7a9f-4180-95c9-bd1c01c10b30');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', '7dc33609-58ad-438a-b1b7-37e6ce888339');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', '0b014b5d-e35a-4a71-98a3-85da12ce8a87');
INSERT INTO public.composite_role (composite, child_role) VALUES ('0b014b5d-e35a-4a71-98a3-85da12ce8a87', 'f1002583-2c03-4c76-a9f4-e0e0e437ce44');
INSERT INTO public.composite_role (composite, child_role) VALUES ('4cb951b4-630c-4c4a-9428-d251164933be', '0d0d5c69-abb1-4b74-935a-7d6cb52259df');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '2b3b50c6-9e48-4f4b-a9e2-1380ef0a8c1e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', '98bb9c86-1350-4b8a-ad7c-a02a466c5fd3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', '864a3995-9af7-4060-92a5-3f71cf1ad54a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '6d46127b-1247-47a8-952a-16db3aa5f279');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'ee555cf9-17b6-481b-95b4-086169cb1c94');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '84fe68bb-b647-43c0-b46f-d6a5709f387a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '48b5fed3-1e6e-4ad1-8cf6-8908381ab166');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'bb822ab2-0223-4a78-90b8-ccb90b7dfd0e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '9988d546-a47e-437e-b19c-81cecc8250f9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '83f10404-c605-4c86-a438-aa0e66005d09');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'd1fa048e-4667-4846-bbee-084bfb37751c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'd472340a-d0dd-487f-a3f4-8cabcd62bb37');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '1a6ec481-ca9e-4404-ae8d-4daa7104d634');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '04dcd327-5eba-42bf-a15c-060567acafb4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'bf43b6cc-5e04-401a-ae16-b61031c18081');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '99a3ee6b-910a-4065-b761-39d64d238d98');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '41955d6e-1b10-482c-b323-ea2f49c0a7cd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '22aec272-1cd3-4fec-9e32-10cdcbf2045b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '0f87c65a-01db-4dbd-b56c-0d1d1b24e7ed');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '80acdbc7-2c06-4a56-a0dc-a62f0b02e94c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('48b5fed3-1e6e-4ad1-8cf6-8908381ab166', '22aec272-1cd3-4fec-9e32-10cdcbf2045b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('84fe68bb-b647-43c0-b46f-d6a5709f387a', '41955d6e-1b10-482c-b323-ea2f49c0a7cd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('84fe68bb-b647-43c0-b46f-d6a5709f387a', '80acdbc7-2c06-4a56-a0dc-a62f0b02e94c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '5abeb070-dea3-4264-8fcc-65ef6c2bb3a9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'd22d0a69-63ea-4d32-817a-8c2f18efd10b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '6537e237-a381-46de-b90a-76b123ab848a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '8771e67f-d41e-4bff-bdbc-c939962a9a6f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '292d150f-5d33-4110-8f7a-d84f2d4e436e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'b04d73ed-ca55-4952-a8d2-4f3cc9ba37c9');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'b8d2b7b1-523e-4881-9ddc-d00dfd32809a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'fa1baae6-5fcf-4392-becf-18ac3bc0bb56');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '5944c77a-137b-472c-aa45-7974c074befd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'fd8205a4-f415-4642-ba8d-9bab7c930537');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '1721a898-3e8c-4d46-9c3b-a5a880f47070');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '18fbfd0c-a8c2-41d2-9ded-28e4a753ff14');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '0d9fa8bb-cc1d-489d-a409-f6c09e52a92a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '42f656d1-d47e-4197-9624-cacd4987a32d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '93c0a697-a552-44c0-939a-6e1015858d76');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '6fa576c6-e59b-4c27-9899-d93c50e04328');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '5b7c23db-5f8c-420e-b96a-f57c60b424ea');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', 'dcf95fb6-cc40-46a2-8a81-404ffc6c5fe6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6537e237-a381-46de-b90a-76b123ab848a', '42f656d1-d47e-4197-9624-cacd4987a32d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6537e237-a381-46de-b90a-76b123ab848a', '5b7c23db-5f8c-420e-b96a-f57c60b424ea');
INSERT INTO public.composite_role (composite, child_role) VALUES ('8771e67f-d41e-4bff-bdbc-c939962a9a6f', '93c0a697-a552-44c0-939a-6e1015858d76');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', 'bac91ad5-452b-43d2-9c0d-f2f95f45da4a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('bac91ad5-452b-43d2-9c0d-f2f95f45da4a', '45415cd3-f14e-4654-9508-a36ef26c0c20');
INSERT INTO public.composite_role (composite, child_role) VALUES ('81de0ca6-4d2f-41ed-b7ee-115562bf4138', '5ac20c02-48b0-4b7a-8ee4-ed8190f3057b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'e290dff6-9c35-4288-b3a2-92278d78c399');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'ad7bf2dc-89c0-4393-99e1-adfcbc5ad512');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', '4688f8e4-30a0-40c0-8be6-71b832bbddd5');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', '001008dc-de72-4823-aafc-a1b8a8e98634');


--
-- TOC entry 4222 (class 0 OID 16484)
-- Dependencies: 233
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) VALUES ('3d4e38ab-d4b2-4431-a8f4-86daa9ea99c6', NULL, 'password', 'db5b767f-981a-4d92-afc9-1338141251b3', 1757692472567, NULL, '{"value":"pEtht6TOFa1aXnklMdeWNeYQYyDLQObZ+wVOFNzR+GA=","salt":"hGQf9pgaFF/J7wuar4mxWA==","additionalParameters":{}}', '{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}', 10, 0);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority, version) VALUES ('afd1dac0-3b45-49c1-a110-8b18bea5c8b3', NULL, 'password', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', 1757765456573, 'My password', '{"value":"uZntc2kQ/nDlD+uM92ZU7bhiFjRybT4BQ3X/Yl2L2Bg=","salt":"Cc1pNpfRcWjlf/AnLaQrCQ==","additionalParameters":{}}', '{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}', 10, 1);


--
-- TOC entry 4223 (class 0 OID 16490)
-- Dependencies: 234
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2025-09-12 15:54:26.697315', 1, 'EXECUTED', '9:6f1016664e21e16d26517a4418f5e3df', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2025-09-12 15:54:26.71025', 2, 'MARK_RAN', '9:828775b1596a07d1200ba1d49e5e3941', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2025-09-12 15:54:26.738206', 3, 'EXECUTED', '9:5f090e44a7d595883c1fb61f4b41fd38', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2025-09-12 15:54:26.740884', 4, 'EXECUTED', '9:c07e577387a3d2c04d1adc9aaad8730e', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2025-09-12 15:54:26.812753', 5, 'EXECUTED', '9:b68ce996c655922dbcd2fe6b6ae72686', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2025-09-12 15:54:26.817171', 6, 'MARK_RAN', '9:543b5c9989f024fe35c6f6c5a97de88e', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2025-09-12 15:54:26.877187', 7, 'EXECUTED', '9:765afebbe21cf5bbca048e632df38336', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2025-09-12 15:54:26.884357', 8, 'MARK_RAN', '9:db4a145ba11a6fdaefb397f6dbf829a1', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2025-09-12 15:54:26.889244', 9, 'EXECUTED', '9:9d05c7be10cdb873f8bcb41bc3a8ab23', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2025-09-12 15:54:26.952449', 10, 'EXECUTED', '9:18593702353128d53111f9b1ff0b82b8', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2025-09-12 15:54:26.989143', 11, 'EXECUTED', '9:6122efe5f090e41a85c0f1c9e52cbb62', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2025-09-12 15:54:26.992231', 12, 'MARK_RAN', '9:e1ff28bf7568451453f844c5d54bb0b5', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2025-09-12 15:54:27.004044', 13, 'EXECUTED', '9:7af32cd8957fbc069f796b61217483fd', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2025-09-12 15:54:27.015708', 14, 'EXECUTED', '9:6005e15e84714cd83226bf7879f54190', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2025-09-12 15:54:27.016816', 15, 'MARK_RAN', '9:bf656f5a2b055d07f314431cae76f06c', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2025-09-12 15:54:27.018281', 16, 'MARK_RAN', '9:f8dadc9284440469dcf71e25ca6ab99b', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2025-09-12 15:54:27.019744', 17, 'EXECUTED', '9:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2025-09-12 15:54:27.045398', 18, 'EXECUTED', '9:3368ff0be4c2855ee2dd9ca813b38d8e', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2025-09-12 15:54:27.076263', 19, 'EXECUTED', '9:8ac2fb5dd030b24c0570a763ed75ed20', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2025-09-12 15:54:27.084844', 20, 'EXECUTED', '9:f91ddca9b19743db60e3057679810e6c', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2025-09-12 15:54:27.088697', 21, 'MARK_RAN', '9:831e82914316dc8a57dc09d755f23c51', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2025-09-12 15:54:27.091752', 22, 'MARK_RAN', '9:f91ddca9b19743db60e3057679810e6c', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2025-09-12 15:54:27.143837', 23, 'EXECUTED', '9:bc3d0f9e823a69dc21e23e94c7a94bb1', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2025-09-12 15:54:27.147509', 24, 'EXECUTED', '9:c9999da42f543575ab790e76439a2679', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2025-09-12 15:54:27.148816', 25, 'MARK_RAN', '9:0d6c65c6f58732d81569e77b10ba301d', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2025-09-12 15:54:27.391151', 26, 'EXECUTED', '9:fc576660fc016ae53d2d4778d84d86d0', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2025-09-12 15:54:27.430839', 27, 'EXECUTED', '9:43ed6b0da89ff77206289e87eaa9c024', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2025-09-12 15:54:27.433604', 28, 'EXECUTED', '9:44bae577f551b3738740281eceb4ea70', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2025-09-12 15:54:27.465738', 29, 'EXECUTED', '9:bd88e1f833df0420b01e114533aee5e8', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2025-09-12 15:54:27.473122', 30, 'EXECUTED', '9:a7022af5267f019d020edfe316ef4371', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2025-09-12 15:54:27.48219', 31, 'EXECUTED', '9:fc155c394040654d6a79227e56f5e25a', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2025-09-12 15:54:27.484894', 32, 'EXECUTED', '9:eac4ffb2a14795e5dc7b426063e54d88', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2025-09-12 15:54:27.487686', 33, 'EXECUTED', '9:54937c05672568c4c64fc9524c1e9462', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2025-09-12 15:54:27.488663', 34, 'MARK_RAN', '9:f9753208029f582525ed12011a19d054', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2025-09-12 15:54:27.501458', 35, 'EXECUTED', '9:33d72168746f81f98ae3a1e8e0ca3554', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2025-09-12 15:54:27.504138', 36, 'EXECUTED', '9:61b6d3d7a4c0e0024b0c839da283da0c', 'addColumn tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2025-09-12 15:54:27.506454', 37, 'EXECUTED', '9:8dcac7bdf7378e7d823cdfddebf72fda', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2025-09-12 15:54:27.508205', 38, 'EXECUTED', '9:a2b870802540cb3faa72098db5388af3', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2025-09-12 15:54:27.510197', 39, 'EXECUTED', '9:132a67499ba24bcc54fb5cbdcfe7e4c0', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2025-09-12 15:54:27.510824', 40, 'MARK_RAN', '9:938f894c032f5430f2b0fafb1a243462', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2025-09-12 15:54:27.511693', 41, 'MARK_RAN', '9:845c332ff1874dc5d35974b0babf3006', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2025-09-12 15:54:27.514372', 42, 'EXECUTED', '9:fc86359c079781adc577c5a217e4d04c', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2025-09-12 15:54:28.375517', 43, 'EXECUTED', '9:59a64800e3c0d09b825f8a3b444fa8f4', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2025-09-12 15:54:28.377585', 44, 'EXECUTED', '9:d48d6da5c6ccf667807f633fe489ce88', 'addColumn tableName=USER_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2025-09-12 15:54:28.379123', 45, 'EXECUTED', '9:dde36f7973e80d71fceee683bc5d2951', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2025-09-12 15:54:28.381319', 46, 'EXECUTED', '9:b855e9b0a406b34fa323235a0cf4f640', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2025-09-12 15:54:28.382027', 47, 'MARK_RAN', '9:51abbacd7b416c50c4421a8cabf7927e', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2025-09-12 15:54:28.447356', 48, 'EXECUTED', '9:bdc99e567b3398bac83263d375aad143', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2025-09-12 15:54:28.449827', 49, 'EXECUTED', '9:d198654156881c46bfba39abd7769e69', 'addColumn tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2025-09-12 15:54:28.467774', 50, 'EXECUTED', '9:cfdd8736332ccdd72c5256ccb42335db', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2025-09-12 15:54:28.688438', 51, 'EXECUTED', '9:7c84de3d9bd84d7f077607c1a4dcb714', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2025-09-12 15:54:28.690511', 52, 'EXECUTED', '9:5a6bb36cbefb6a9d6928452c0852af2d', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2025-09-12 15:54:28.692051', 53, 'EXECUTED', '9:8f23e334dbc59f82e0a328373ca6ced0', 'update tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2025-09-12 15:54:28.69385', 54, 'EXECUTED', '9:9156214268f09d970cdf0e1564d866af', 'update tableName=CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2025-09-12 15:54:28.697573', 55, 'EXECUTED', '9:db806613b1ed154826c02610b7dbdf74', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2025-09-12 15:54:28.701057', 56, 'EXECUTED', '9:229a041fb72d5beac76bb94a5fa709de', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2025-09-12 15:54:28.733479', 57, 'EXECUTED', '9:079899dade9c1e683f26b2aa9ca6ff04', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2025-09-12 15:54:28.960885', 58, 'EXECUTED', '9:139b79bcbbfe903bb1c2d2a4dbf001d9', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2025-09-12 15:54:28.976007', 59, 'EXECUTED', '9:b55738ad889860c625ba2bf483495a04', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2025-09-12 15:54:28.979983', 60, 'EXECUTED', '9:e0057eac39aa8fc8e09ac6cfa4ae15fe', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2025-09-12 15:54:28.98502', 61, 'EXECUTED', '9:42a33806f3a0443fe0e7feeec821326c', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2025-09-12 15:54:28.987793', 62, 'EXECUTED', '9:9968206fca46eecc1f51db9c024bfe56', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2025-09-12 15:54:28.989059', 63, 'EXECUTED', '9:92143a6daea0a3f3b8f598c97ce55c3d', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2025-09-12 15:54:28.990562', 64, 'EXECUTED', '9:82bab26a27195d889fb0429003b18f40', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2025-09-12 15:54:28.992228', 65, 'EXECUTED', '9:e590c88ddc0b38b0ae4249bbfcb5abc3', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2025-09-12 15:54:29.022885', 66, 'EXECUTED', '9:5c1f475536118dbdc38d5d7977950cc0', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2025-09-12 15:54:29.05269', 67, 'EXECUTED', '9:e7c9f5f9c4d67ccbbcc215440c718a17', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2025-09-12 15:54:29.055782', 68, 'EXECUTED', '9:88e0bfdda924690d6f4e430c53447dd5', 'addColumn tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2025-09-12 15:54:29.086639', 69, 'EXECUTED', '9:f53177f137e1c46b6a88c59ec1cb5218', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2025-09-12 15:54:29.091016', 70, 'EXECUTED', '9:a74d33da4dc42a37ec27121580d1459f', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2025-09-12 15:54:29.093109', 71, 'EXECUTED', '9:fd4ade7b90c3b67fae0bfcfcb42dfb5f', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2025-09-12 15:54:29.096551', 72, 'EXECUTED', '9:aa072ad090bbba210d8f18781b8cebf4', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2025-09-12 15:54:29.101776', 73, 'EXECUTED', '9:1ae6be29bab7c2aa376f6983b932be37', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2025-09-12 15:54:29.102852', 74, 'MARK_RAN', '9:14706f286953fc9a25286dbd8fb30d97', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2025-09-12 15:54:29.117987', 75, 'EXECUTED', '9:2b9cc12779be32c5b40e2e67711a218b', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2025-09-12 15:54:29.148109', 76, 'EXECUTED', '9:91fa186ce7a5af127a2d7a91ee083cc5', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2025-09-12 15:54:29.150029', 77, 'EXECUTED', '9:6335e5c94e83a2639ccd68dd24e2e5ad', 'addColumn tableName=CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2025-09-12 15:54:29.150696', 78, 'MARK_RAN', '9:6bdb5658951e028bfe16fa0a8228b530', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2025-09-12 15:54:29.161611', 79, 'EXECUTED', '9:d5bc15a64117ccad481ce8792d4c608f', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2025-09-12 15:54:29.162937', 80, 'MARK_RAN', '9:077cba51999515f4d3e7ad5619ab592c', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2025-09-12 15:54:29.188631', 81, 'EXECUTED', '9:be969f08a163bf47c6b9e9ead8ac2afb', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2025-09-12 15:54:29.189458', 82, 'MARK_RAN', '9:6d3bb4408ba5a72f39bd8a0b301ec6e3', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2025-09-12 15:54:29.195522', 83, 'EXECUTED', '9:966bda61e46bebf3cc39518fbed52fa7', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2025-09-12 15:54:29.196124', 84, 'MARK_RAN', '9:8dcac7bdf7378e7d823cdfddebf72fda', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2025-09-12 15:54:29.219504', 85, 'EXECUTED', '9:7d93d602352a30c0c317e6a609b56599', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2025-09-12 15:54:29.221768', 86, 'EXECUTED', '9:71c5969e6cdd8d7b6f47cebc86d37627', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2025-09-12 15:54:29.224548', 87, 'EXECUTED', '9:a9ba7d47f065f041b7da856a81762021', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2025-09-12 15:54:29.229224', 88, 'EXECUTED', '9:fffabce2bc01e1a8f5110d5278500065', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.232298', 89, 'EXECUTED', '9:fa8a5b5445e3857f4b010bafb5009957', 'addColumn tableName=REALM; customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.23595', 90, 'EXECUTED', '9:67ac3241df9a8582d591c5ed87125f39', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.254609', 91, 'EXECUTED', '9:ad1194d66c937e3ffc82386c050ba089', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.257847', 92, 'EXECUTED', '9:d9be619d94af5a2f5d07b9f003543b91', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.258392', 93, 'MARK_RAN', '9:544d201116a0fcc5a5da0925fbbc3bde', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.262343', 94, 'EXECUTED', '9:43c0c1055b6761b4b3e89de76d612ccf', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.263407', 95, 'MARK_RAN', '9:8bd711fd0330f4fe980494ca43ab1139', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2025-09-12 15:54:29.266272', 96, 'EXECUTED', '9:e07d2bc0970c348bb06fb63b1f82ddbf', 'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.320159', 97, 'EXECUTED', '9:24fb8611e97f29989bea412aa38d12b7', 'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.321047', 98, 'MARK_RAN', '9:259f89014ce2506ee84740cbf7163aa7', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.334396', 99, 'MARK_RAN', '9:04baaf56c116ed19951cbc2cca584022', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.35461', 100, 'EXECUTED', '9:60ca84a0f8c94ec8c3504a5a3bc88ee8', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.355915', 101, 'MARK_RAN', '9:d3d977031d431db16e2c181ce49d73e9', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.376485', 102, 'EXECUTED', '9:0b305d8d1277f3a89a0a53a659ad274c', 'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2025-09-12 15:54:29.379854', 103, 'EXECUTED', '9:2c374ad2cdfe20e2905a84c8fac48460', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2025-09-12 15:54:29.383785', 104, 'EXECUTED', '9:47a760639ac597360a8219f5b768b4de', 'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('17.0.0-9562', 'keycloak', 'META-INF/jpa-changelog-17.0.0.xml', '2025-09-12 15:54:29.414159', 105, 'EXECUTED', '9:a6272f0576727dd8cad2522335f5d99e', 'createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('18.0.0-10625-IDX_ADMIN_EVENT_TIME', 'keycloak', 'META-INF/jpa-changelog-18.0.0.xml', '2025-09-12 15:54:29.43699', 106, 'EXECUTED', '9:015479dbd691d9cc8669282f4828c41d', 'createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('18.0.15-30992-index-consent', 'keycloak', 'META-INF/jpa-changelog-18.0.15.xml', '2025-09-12 15:54:29.459445', 107, 'EXECUTED', '9:80071ede7a05604b1f4906f3bf3b00f0', 'createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('19.0.0-10135', 'keycloak', 'META-INF/jpa-changelog-19.0.0.xml', '2025-09-12 15:54:29.461343', 108, 'EXECUTED', '9:9518e495fdd22f78ad6425cc30630221', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('20.0.0-12964-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2025-09-12 15:54:29.479342', 109, 'EXECUTED', '9:e5f243877199fd96bcc842f27a1656ac', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('20.0.0-12964-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2025-09-12 15:54:29.480132', 110, 'MARK_RAN', '9:1a6fcaa85e20bdeae0a9ce49b41946a5', 'createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('client-attributes-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-20.0.0.xml', '2025-09-12 15:54:29.487432', 111, 'EXECUTED', '9:3f332e13e90739ed0c35b0b25b7822ca', 'addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.0.2-17277', 'keycloak', 'META-INF/jpa-changelog-21.0.2.xml', '2025-09-12 15:54:29.490104', 112, 'EXECUTED', '9:7ee1f7a3fb8f5588f171fb9a6ab623c0', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.1.0-19404', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2025-09-12 15:54:29.50419', 113, 'EXECUTED', '9:3d7e830b52f33676b9d64f7f2b2ea634', 'modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('21.1.0-19404-2', 'keycloak', 'META-INF/jpa-changelog-21.1.0.xml', '2025-09-12 15:54:29.505803', 114, 'MARK_RAN', '9:627d032e3ef2c06c0e1f73d2ae25c26c', 'addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('22.0.0-17484-updated', 'keycloak', 'META-INF/jpa-changelog-22.0.0.xml', '2025-09-12 15:54:29.520888', 115, 'EXECUTED', '9:90af0bfd30cafc17b9f4d6eccd92b8b3', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('22.0.5-24031', 'keycloak', 'META-INF/jpa-changelog-22.0.0.xml', '2025-09-12 15:54:29.558653', 116, 'MARK_RAN', '9:a60d2d7b315ec2d3eba9e2f145f9df28', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('23.0.0-12062', 'keycloak', 'META-INF/jpa-changelog-23.0.0.xml', '2025-09-12 15:54:29.672769', 117, 'EXECUTED', '9:2168fbe728fec46ae9baf15bf80927b8', 'addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('23.0.0-17258', 'keycloak', 'META-INF/jpa-changelog-23.0.0.xml', '2025-09-12 15:54:29.684639', 118, 'EXECUTED', '9:36506d679a83bbfda85a27ea1864dca8', 'addColumn tableName=EVENT_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.0-9758', 'keycloak', 'META-INF/jpa-changelog-24.0.0.xml', '2025-09-12 15:54:29.783447', 119, 'EXECUTED', '9:502c557a5189f600f0f445a9b49ebbce', 'addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.0-9758-2', 'keycloak', 'META-INF/jpa-changelog-24.0.0.xml', '2025-09-12 15:54:29.785848', 120, 'EXECUTED', '9:bf0fdee10afdf597a987adbf291db7b2', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.0-26618-drop-index-if-present', 'keycloak', 'META-INF/jpa-changelog-24.0.0.xml', '2025-09-12 15:54:29.78911', 121, 'MARK_RAN', '9:04baaf56c116ed19951cbc2cca584022', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.0-26618-reindex', 'keycloak', 'META-INF/jpa-changelog-24.0.0.xml', '2025-09-12 15:54:29.810364', 122, 'EXECUTED', '9:08707c0f0db1cef6b352db03a60edc7f', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.2-27228', 'keycloak', 'META-INF/jpa-changelog-24.0.2.xml', '2025-09-12 15:54:29.813636', 123, 'EXECUTED', '9:eaee11f6b8aa25d2cc6a84fb86fc6238', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.2-27967-drop-index-if-present', 'keycloak', 'META-INF/jpa-changelog-24.0.2.xml', '2025-09-12 15:54:29.814626', 124, 'MARK_RAN', '9:04baaf56c116ed19951cbc2cca584022', 'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('24.0.2-27967-reindex', 'keycloak', 'META-INF/jpa-changelog-24.0.2.xml', '2025-09-12 15:54:29.815919', 125, 'MARK_RAN', '9:d3d977031d431db16e2c181ce49d73e9', 'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-tables', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:29.819741', 126, 'EXECUTED', '9:deda2df035df23388af95bbd36c17cef', 'addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-creation', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:29.838874', 127, 'EXECUTED', '9:3e96709818458ae49f3c679ae58d263a', 'createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-cleanup-uss-createdon', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:29.97654', 128, 'EXECUTED', '9:78ab4fc129ed5e8265dbcc3485fba92f', 'dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-cleanup-uss-preload', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.071426', 129, 'EXECUTED', '9:de5f7c1f7e10994ed8b62e621d20eaab', 'dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-cleanup-uss-by-usersess', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.169167', 130, 'EXECUTED', '9:6eee220d024e38e89c799417ec33667f', 'dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-cleanup-css-preload', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.262644', 131, 'EXECUTED', '9:5411d2fb2891d3e8d63ddb55dfa3c0c9', 'dropIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-2-mysql', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.2637', 132, 'MARK_RAN', '9:b7ef76036d3126bb83c2423bf4d449d6', 'createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28265-index-2-not-mysql', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.285136', 133, 'EXECUTED', '9:23396cf51ab8bc1ae6f0cac7f9f6fcf7', 'createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-org', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.299347', 134, 'EXECUTED', '9:5c859965c2c9b9c72136c360649af157', 'createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('unique-consentuser', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.30716', 135, 'EXECUTED', '9:5857626a2ea8767e9a6c66bf3a2cb32f', 'customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('unique-consentuser-mysql', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.307944', 136, 'MARK_RAN', '9:b79478aad5adaa1bc428e31563f55e8e', 'customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('25.0.0-28861-index-creation', 'keycloak', 'META-INF/jpa-changelog-25.0.0.xml', '2025-09-12 15:54:30.34649', 137, 'EXECUTED', '9:b9acb58ac958d9ada0fe12a5d4794ab1', 'createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-org-alias', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.351313', 138, 'EXECUTED', '9:6ef7d63e4412b3c2d66ed179159886a4', 'addColumn tableName=ORG; update tableName=ORG; addNotNullConstraint columnName=ALIAS, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_ALIAS, tableName=ORG', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-org-group', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.35524', 139, 'EXECUTED', '9:da8e8087d80ef2ace4f89d8c5b9ca223', 'addColumn tableName=KEYCLOAK_GROUP; update tableName=KEYCLOAK_GROUP; addNotNullConstraint columnName=TYPE, tableName=KEYCLOAK_GROUP; customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-org-indexes', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.373065', 140, 'EXECUTED', '9:79b05dcd610a8c7f25ec05135eec0857', 'createIndex indexName=IDX_ORG_DOMAIN_ORG_ID, tableName=ORG_DOMAIN', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-org-group-membership', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.375434', 141, 'EXECUTED', '9:a6ace2ce583a421d89b01ba2a28dc2d4', 'addColumn tableName=USER_GROUP_MEMBERSHIP; update tableName=USER_GROUP_MEMBERSHIP; addNotNullConstraint columnName=MEMBERSHIP_TYPE, tableName=USER_GROUP_MEMBERSHIP', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('31296-persist-revoked-access-tokens', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.378377', 142, 'EXECUTED', '9:64ef94489d42a358e8304b0e245f0ed4', 'createTable tableName=REVOKED_TOKEN; addPrimaryKey constraintName=CONSTRAINT_RT, tableName=REVOKED_TOKEN', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('31725-index-persist-revoked-access-tokens', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.395742', 143, 'EXECUTED', '9:b994246ec2bf7c94da881e1d28782c7b', 'createIndex indexName=IDX_REV_TOKEN_ON_EXPIRE, tableName=REVOKED_TOKEN', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-idps-for-login', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.434225', 144, 'EXECUTED', '9:51f5fffadf986983d4bd59582c6c1604', 'addColumn tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_REALM_ORG, tableName=IDENTITY_PROVIDER; createIndex indexName=IDX_IDP_FOR_LOGIN, tableName=IDENTITY_PROVIDER; customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-32583-drop-redundant-index-on-client-session', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.521747', 145, 'EXECUTED', '9:24972d83bf27317a055d234187bb4af9', 'dropIndex indexName=IDX_US_SESS_ID_ON_CL_SESS, tableName=OFFLINE_CLIENT_SESSION', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0.32582-remove-tables-user-session-user-session-note-and-client-session', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.532334', 146, 'EXECUTED', '9:febdc0f47f2ed241c59e60f58c3ceea5', 'dropTable tableName=CLIENT_SESSION_ROLE; dropTable tableName=CLIENT_SESSION_NOTE; dropTable tableName=CLIENT_SESSION_PROT_MAPPER; dropTable tableName=CLIENT_SESSION_AUTH_STATUS; dropTable tableName=CLIENT_USER_SESSION_NOTE; dropTable tableName=CLI...', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.0.0-33201-org-redirect-url', 'keycloak', 'META-INF/jpa-changelog-26.0.0.xml', '2025-09-12 15:54:30.534047', 147, 'EXECUTED', '9:4d0e22b0ac68ebe9794fa9cb752ea660', 'addColumn tableName=ORG', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('29399-jdbc-ping-default', 'keycloak', 'META-INF/jpa-changelog-26.1.0.xml', '2025-09-12 15:54:30.538749', 148, 'EXECUTED', '9:007dbe99d7203fca403b89d4edfdf21e', 'createTable tableName=JGROUPS_PING; addPrimaryKey constraintName=CONSTRAINT_JGROUPS_PING, tableName=JGROUPS_PING', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.1.0-34013', 'keycloak', 'META-INF/jpa-changelog-26.1.0.xml', '2025-09-12 15:54:30.542887', 149, 'EXECUTED', '9:e6b686a15759aef99a6d758a5c4c6a26', 'addColumn tableName=ADMIN_EVENT_ENTITY', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.1.0-34380', 'keycloak', 'META-INF/jpa-changelog-26.1.0.xml', '2025-09-12 15:54:30.545104', 150, 'EXECUTED', '9:ac8b9edb7c2b6c17a1c7a11fcf5ccf01', 'dropTable tableName=USERNAME_LOGIN_FAILURE', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.0-36750', 'keycloak', 'META-INF/jpa-changelog-26.2.0.xml', '2025-09-12 15:54:30.549152', 151, 'EXECUTED', '9:b49ce951c22f7eb16480ff085640a33a', 'createTable tableName=SERVER_CONFIG', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.0-26106', 'keycloak', 'META-INF/jpa-changelog-26.2.0.xml', '2025-09-12 15:54:30.55025', 152, 'EXECUTED', '9:b5877d5dab7d10ff3a9d209d7beb6680', 'addColumn tableName=CREDENTIAL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.6-39866-duplicate', 'keycloak', 'META-INF/jpa-changelog-26.2.6.xml', '2025-09-12 15:54:30.551714', 153, 'EXECUTED', '9:1dc67ccee24f30331db2cba4f372e40e', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.6-39866-uk', 'keycloak', 'META-INF/jpa-changelog-26.2.6.xml', '2025-09-12 15:54:30.553387', 154, 'EXECUTED', '9:b70b76f47210cf0a5f4ef0e219eac7cd', 'addUniqueConstraint constraintName=UK_MIGRATION_VERSION, tableName=MIGRATION_MODEL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.6-40088-duplicate', 'keycloak', 'META-INF/jpa-changelog-26.2.6.xml', '2025-09-12 15:54:30.554794', 155, 'EXECUTED', '9:cc7e02ed69ab31979afb1982f9670e8f', 'customChange', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.2.6-40088-uk', 'keycloak', 'META-INF/jpa-changelog-26.2.6.xml', '2025-09-12 15:54:30.556468', 156, 'EXECUTED', '9:5bb848128da7bc4595cc507383325241', 'addUniqueConstraint constraintName=UK_MIGRATION_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '4.29.1', NULL, NULL, '7692466382');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('26.3.0-groups-description', 'keycloak', 'META-INF/jpa-changelog-26.3.0.xml', '2025-09-12 15:54:30.559106', 157, 'EXECUTED', '9:e1a3c05574326fb5b246b73b9a4c4d49', 'addColumn tableName=KEYCLOAK_GROUP', '', NULL, '4.29.1', NULL, NULL, '7692466382');


--
-- TOC entry 4224 (class 0 OID 16495)
-- Dependencies: 235
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1000, false, NULL, NULL);


--
-- TOC entry 4225 (class 0 OID 16498)
-- Dependencies: 236
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'bf25319e-9f4e-4edf-a0dc-ecabd44a57c6', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '7df131f3-e5e8-4c79-b7c3-2639b08165ae', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '1f1209c4-3c17-4737-ad29-44a956e92f53', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'a224404a-8166-407f-b847-31f49522c700', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '4bf48d7c-3cc3-44e3-85fa-f763496f57c4', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '24afeddd-caca-411b-887a-e683743815e2', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '61918b39-dd0b-4fc3-a7b4-1e7a06005440', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'fc9fd756-2c83-4a2f-98e5-c3010ea24830', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '9b03836a-b3cc-4177-b7bb-08985135899b', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'a11024b7-1c87-4d38-8839-8701cb10f6cc', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '10ae1890-3ce5-4a6c-9aab-033b4c944c8c', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'e29be01a-016d-4cc8-baca-5cf58bff1606', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '8421216f-523d-477e-81bc-c734ab73c4dc', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'b869b0ac-6084-4eff-a314-f3078b03d711', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '7446fc6f-3d48-44b1-bbcf-9344b61c6f3d', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '2bb41343-db41-424e-ac9e-e3d7109463b8', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '0c33816e-ae8b-4c67-afd4-2b137eebc285', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'a00a7749-4b00-415e-af00-b2d2c2cc6e27', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'c51d8918-747c-454e-920e-9a54d5961c4c', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'd9b7430c-9d16-460f-9e69-3c3efff65e0f', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '988f31fd-b955-4f1c-b06e-eab9dc4be530', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920', false);


--
-- TOC entry 4226 (class 0 OID 16502)
-- Dependencies: 237
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4227 (class 0 OID 16507)
-- Dependencies: 238
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4228 (class 0 OID 16512)
-- Dependencies: 239
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4229 (class 0 OID 16517)
-- Dependencies: 240
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4230 (class 0 OID 16520)
-- Dependencies: 241
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4231 (class 0 OID 16525)
-- Dependencies: 242
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4232 (class 0 OID 16528)
-- Dependencies: 243
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4233 (class 0 OID 16534)
-- Dependencies: 244
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4234 (class 0 OID 16537)
-- Dependencies: 245
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4235 (class 0 OID 16542)
-- Dependencies: 246
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4236 (class 0 OID 16547)
-- Dependencies: 247
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4237 (class 0 OID 16553)
-- Dependencies: 248
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('de411b71-3187-4266-80d2-a0a64e25e7db', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('7956d55e-2473-4a88-8a92-f1938e50c882', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('c0d70d20-c204-43c7-862b-a8120fb61b37', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('d22d0a69-63ea-4d32-817a-8c2f18efd10b', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('9111fd35-f2f9-4713-9ed8-13fd5fbf0020', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('b04d73ed-ca55-4952-a8d2-4f3cc9ba37c9', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('292d150f-5d33-4110-8f7a-d84f2d4e436e', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('8771e67f-d41e-4bff-bdbc-c939962a9a6f', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('42f656d1-d47e-4197-9624-cacd4987a32d', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('b8d2b7b1-523e-4881-9ddc-d00dfd32809a', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('5cc4c71c-0d0c-473d-af2b-ae19ddf8f469', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('6fa576c6-e59b-4c27-9899-d93c50e04328', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('93c0a697-a552-44c0-939a-6e1015858d76', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('5b7c23db-5f8c-420e-b96a-f57c60b424ea', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('5944c77a-137b-472c-aa45-7974c074befd', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('6537e237-a381-46de-b90a-76b123ab848a', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('fd8205a4-f415-4642-ba8d-9bab7c930537', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('18fbfd0c-a8c2-41d2-9ded-28e4a753ff14', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('fa1baae6-5fcf-4392-becf-18ac3bc0bb56', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('0d9fa8bb-cc1d-489d-a409-f6c09e52a92a', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('1721a898-3e8c-4d46-9c3b-a5a880f47070', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('ad7bf2dc-89c0-4393-99e1-adfcbc5ad512', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('de11f44c-9e07-4caf-aca0-88b389f2fb9c', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('5abeb070-dea3-4264-8fcc-65ef6c2bb3a9', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('f9b811b3-9570-4a92-9557-a0a4033e4818', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('5ac20c02-48b0-4b7a-8ee4-ed8190f3057b', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('dcf95fb6-cc40-46a2-8a81-404ffc6c5fe6', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('81de0ca6-4d2f-41ed-b7ee-115562bf4138', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('fcc9271d-28b5-4ddd-8575-6421430daf00', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('bac91ad5-452b-43d2-9c0d-f2f95f45da4a', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('f26bcdb1-789a-47e4-bd7a-a73c55fb1df3', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');
INSERT INTO public.group_role_mapping (role_id, group_id) VALUES ('45415cd3-f14e-4654-9508-a36ef26c0c20', '7216b8d5-7e11-43b1-bde8-6f9ad66d6850');


--
-- TOC entry 4238 (class 0 OID 16556)
-- Dependencies: 249
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4239 (class 0 OID 16568)
-- Dependencies: 250
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4240 (class 0 OID 16573)
-- Dependencies: 251
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4241 (class 0 OID 16578)
-- Dependencies: 252
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4242 (class 0 OID 16583)
-- Dependencies: 253
-- Data for Name: jgroups_ping; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4243 (class 0 OID 16588)
-- Dependencies: 254
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.keycloak_group (id, name, parent_group, realm_id, type, description) VALUES ('7216b8d5-7e11-43b1-bde8-6f9ad66d6850', 'admin', ' ', '71832a48-eab3-4e5a-bc8a-1720377b95da', 0, 'Admin group');
INSERT INTO public.keycloak_group (id, name, parent_group, realm_id, type, description) VALUES ('15092de6-1c31-41a4-9862-a48017267a90', 'user', ' ', '71832a48-eab3-4e5a-bc8a-1720377b95da', 0, 'User group');


--
-- TOC entry 4244 (class 0 OID 16594)
-- Dependencies: 255
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, '${role_default-roles}', 'default-roles-master', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, '${role_admin}', 'admin', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('93b919cd-e59e-411c-9140-0884a70de24c', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, '${role_create-realm}', 'create-realm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a4d4bef6-df7b-4ec6-8d0c-d816f60d7e28', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_create-client}', 'create-client', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a30901b6-8cb3-4f28-868b-363bbc342460', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-realm}', 'view-realm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('37fcb83c-bbbc-43ce-9257-148e8a6ec30e', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-users}', 'view-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0e7fca1d-6d28-4181-90e2-a7661954b67b', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-clients}', 'view-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('08317778-211f-451c-a709-9d4fece410bc', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-events}', 'view-events', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('30625f18-1f01-4458-bb09-aa919cc105df', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-identity-providers}', 'view-identity-providers', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a968c822-377f-4608-9ada-a11802cd04d6', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_view-authorization}', 'view-authorization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2a4b6d10-7d4c-436e-a845-cf5c23ad05cb', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-realm}', 'manage-realm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('cec2cc42-2759-45f7-a792-0149daf1c3aa', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-users}', 'manage-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4da4176b-7235-4cff-b300-df9e4ced69b3', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-clients}', 'manage-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7e89a92e-78c8-42ff-8151-800d09395612', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-events}', 'manage-events', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f62229cd-2677-48b5-ab6d-c581726c9678', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-identity-providers}', 'manage-identity-providers', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9011ea6f-2eb0-4db9-8d14-2cf95e788f47', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_manage-authorization}', 'manage-authorization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b6207ab8-0f83-4a67-9b87-ed9b0bc8934a', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_query-users}', 'query-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('66d7aa69-41e6-408a-b8dd-f012994a63a2', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_query-clients}', 'query-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('54f8d078-96a4-4727-a565-e4e6f8e4adba', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_query-realms}', 'query-realms', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('35bc499e-7a9f-4180-95c9-bd1c01c10b30', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_query-groups}', 'query-groups', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7dc33609-58ad-438a-b1b7-37e6ce888339', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_view-profile}', 'view-profile', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0b014b5d-e35a-4a71-98a3-85da12ce8a87', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_manage-account}', 'manage-account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f1002583-2c03-4c76-a9f4-e0e0e437ce44', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_manage-account-links}', 'manage-account-links', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0ff68afd-45e9-4ac6-a73b-387d4038db8d', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_view-applications}', 'view-applications', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0d0d5c69-abb1-4b74-935a-7d6cb52259df', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_view-consent}', 'view-consent', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4cb951b4-630c-4c4a-9428-d251164933be', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_manage-consent}', 'manage-consent', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7fedf8a8-e90d-47ac-b53a-e9d129499606', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_view-groups}', 'view-groups', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('aff5258c-c012-4fc6-9527-0a38e136cf76', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', true, '${role_delete-account}', 'delete-account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'b9f19e40-ee40-4943-adf9-9be151cb1be7', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7e13b044-0b6d-4ee2-9b8b-2ad854a6716b', '2eb79431-c979-467b-99de-c1c8f318f129', true, '${role_read-token}', 'read-token', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '2eb79431-c979-467b-99de-c1c8f318f129', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2b3b50c6-9e48-4f4b-a9e2-1380ef0a8c1e', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', true, '${role_impersonation}', 'impersonation', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '413b2e61-5722-4fb1-8680-b62c34c9f5ae', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('98bb9c86-1350-4b8a-ad7c-a02a466c5fd3', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, '${role_offline-access}', 'offline_access', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('864a3995-9af7-4060-92a5-3f71cf1ad54a', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, '${role_uma_authorization}', 'uma_authorization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', '71832a48-eab3-4e5a-bc8a-1720377b95da', false, '${role_default-roles}', 'default-roles-wishlist', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6d46127b-1247-47a8-952a-16db3aa5f279', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_create-client}', 'create-client', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ee555cf9-17b6-481b-95b4-086169cb1c94', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-realm}', 'view-realm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('84fe68bb-b647-43c0-b46f-d6a5709f387a', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-users}', 'view-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('48b5fed3-1e6e-4ad1-8cf6-8908381ab166', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-clients}', 'view-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('bb822ab2-0223-4a78-90b8-ccb90b7dfd0e', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-events}', 'view-events', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9988d546-a47e-437e-b19c-81cecc8250f9', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-identity-providers}', 'view-identity-providers', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('83f10404-c605-4c86-a438-aa0e66005d09', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_view-authorization}', 'view-authorization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d1fa048e-4667-4846-bbee-084bfb37751c', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-realm}', 'manage-realm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d472340a-d0dd-487f-a3f4-8cabcd62bb37', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-users}', 'manage-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1a6ec481-ca9e-4404-ae8d-4daa7104d634', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-clients}', 'manage-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('04dcd327-5eba-42bf-a15c-060567acafb4', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-events}', 'manage-events', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('bf43b6cc-5e04-401a-ae16-b61031c18081', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-identity-providers}', 'manage-identity-providers', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('99a3ee6b-910a-4065-b761-39d64d238d98', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_manage-authorization}', 'manage-authorization', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('41955d6e-1b10-482c-b323-ea2f49c0a7cd', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_query-users}', 'query-users', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('22aec272-1cd3-4fec-9e32-10cdcbf2045b', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_query-clients}', 'query-clients', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0f87c65a-01db-4dbd-b56c-0d1d1b24e7ed', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_query-realms}', 'query-realms', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('80acdbc7-2c06-4a56-a0dc-a62f0b02e94c', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_query-groups}', 'query-groups', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f2c5bb1c-eba5-4890-b82f-2cb51e7ee215', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_realm-admin}', 'realm-admin', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5abeb070-dea3-4264-8fcc-65ef6c2bb3a9', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_create-client}', 'create-client', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d22d0a69-63ea-4d32-817a-8c2f18efd10b', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-realm}', 'view-realm', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6537e237-a381-46de-b90a-76b123ab848a', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-users}', 'view-users', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8771e67f-d41e-4bff-bdbc-c939962a9a6f', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-clients}', 'view-clients', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('292d150f-5d33-4110-8f7a-d84f2d4e436e', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-events}', 'view-events', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b04d73ed-ca55-4952-a8d2-4f3cc9ba37c9', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-identity-providers}', 'view-identity-providers', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b8d2b7b1-523e-4881-9ddc-d00dfd32809a', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_view-authorization}', 'view-authorization', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fa1baae6-5fcf-4392-becf-18ac3bc0bb56', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-realm}', 'manage-realm', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5944c77a-137b-472c-aa45-7974c074befd', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-users}', 'manage-users', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fd8205a4-f415-4642-ba8d-9bab7c930537', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-clients}', 'manage-clients', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1721a898-3e8c-4d46-9c3b-a5a880f47070', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-events}', 'manage-events', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('18fbfd0c-a8c2-41d2-9ded-28e4a753ff14', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-identity-providers}', 'manage-identity-providers', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0d9fa8bb-cc1d-489d-a409-f6c09e52a92a', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_manage-authorization}', 'manage-authorization', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('42f656d1-d47e-4197-9624-cacd4987a32d', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_query-users}', 'query-users', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('93c0a697-a552-44c0-939a-6e1015858d76', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_query-clients}', 'query-clients', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6fa576c6-e59b-4c27-9899-d93c50e04328', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_query-realms}', 'query-realms', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5b7c23db-5f8c-420e-b96a-f57c60b424ea', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_query-groups}', 'query-groups', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('dcf95fb6-cc40-46a2-8a81-404ffc6c5fe6', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_view-profile}', 'view-profile', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('bac91ad5-452b-43d2-9c0d-f2f95f45da4a', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_manage-account}', 'manage-account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('45415cd3-f14e-4654-9508-a36ef26c0c20', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_manage-account-links}', 'manage-account-links', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fcc9271d-28b5-4ddd-8575-6421430daf00', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_view-applications}', 'view-applications', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5ac20c02-48b0-4b7a-8ee4-ed8190f3057b', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_view-consent}', 'view-consent', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('81de0ca6-4d2f-41ed-b7ee-115562bf4138', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_manage-consent}', 'manage-consent', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('de11f44c-9e07-4caf-aca0-88b389f2fb9c', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_view-groups}', 'view-groups', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f26bcdb1-789a-47e4-bd7a-a73c55fb1df3', 'af3400fd-6400-429e-94df-f9e2e8847b2a', true, '${role_delete-account}', 'delete-account', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'af3400fd-6400-429e-94df-f9e2e8847b2a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e290dff6-9c35-4288-b3a2-92278d78c399', '3c99275f-4b2d-470f-9454-e415f974bd9f', true, '${role_impersonation}', 'impersonation', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '3c99275f-4b2d-470f-9454-e415f974bd9f', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ad7bf2dc-89c0-4393-99e1-adfcbc5ad512', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', true, '${role_impersonation}', 'impersonation', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'f7fd23c3-a83e-49c0-a93d-7a74a9c039e0', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f9b811b3-9570-4a92-9557-a0a4033e4818', '1f878744-a80b-4197-9f73-f620b31df72b', true, '${role_read-token}', 'read-token', '71832a48-eab3-4e5a-bc8a-1720377b95da', '1f878744-a80b-4197-9f73-f620b31df72b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4688f8e4-30a0-40c0-8be6-71b832bbddd5', '71832a48-eab3-4e5a-bc8a-1720377b95da', false, '${role_offline-access}', 'offline_access', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('001008dc-de72-4823-aafc-a1b8a8e98634', '71832a48-eab3-4e5a-bc8a-1720377b95da', false, '${role_uma_authorization}', 'uma_authorization', '71832a48-eab3-4e5a-bc8a-1720377b95da', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5cc4c71c-0d0c-473d-af2b-ae19ddf8f469', '4f0b55a5-863b-4439-96c5-3999ffc999f9', true, NULL, 'uma_protection', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7956d55e-2473-4a88-8a92-f1938e50c882', '4f0b55a5-863b-4439-96c5-3999ffc999f9', true, 'In this role, the user can access the GET requests for customers routes', 'view-customers', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9111fd35-f2f9-4713-9ed8-13fd5fbf0020', '4f0b55a5-863b-4439-96c5-3999ffc999f9', true, 'In this role, the user can access the POST, PUT and DELETE requests for customers routes', 'manage-customers', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('de411b71-3187-4266-80d2-a0a64e25e7db', '4f0b55a5-863b-4439-96c5-3999ffc999f9', true, 'In this role, the user can access the GET requests for wishlists routes', 'view-wishlists', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('c0d70d20-c204-43c7-862b-a8120fb61b37', '4f0b55a5-863b-4439-96c5-3999ffc999f9', true, 'In this role, the user can access the POST, PUT and DELETE requests for customers routes', 'manage-wishlists', '71832a48-eab3-4e5a-bc8a-1720377b95da', '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);


--
-- TOC entry 4245 (class 0 OID 16600)
-- Dependencies: 256
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.migration_model (id, version, update_time) VALUES ('onso9', '26.3.2', 1757692471);


--
-- TOC entry 4246 (class 0 OID 16604)
-- Dependencies: 257
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('399d057f-16a9-41f7-ae5d-73305c459df7', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765775, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765775","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765775","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('e037a5a4-3a14-4bab-8c6e-50fa36f1a9e9', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765779, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765779","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765779","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('e4bd0d54-456d-4569-9dbd-a275f7204af1', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765781, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765781","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765781","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('f4ac62d7-de20-4e09-abbc-23820227a395', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765799, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765799","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765799","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('eeca00f1-d342-4d4c-8cd8-1372743167fc', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765825, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765825","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765825","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('aefcdeb5-fab5-4e4e-9347-c3767e4b8e69', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765671, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765671","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765671","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('a899b8cf-214f-44b5-bdf0-6d87f6154891', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765731, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765731","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765731","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('24377bd1-f6f1-42a6-aaf3-815566599f48', '4f0b55a5-863b-4439-96c5-3999ffc999f9', '0', 1757765853, '{"authMethod":"openid-connect","notes":{"clientId":"4f0b55a5-863b-4439-96c5-3999ffc999f9","userSessionStartedAt":"1757765853","iss":"http://localhost:8080/realms/wishlist","startedAt":"1757765853","level-of-authentication":"-1"}}', 'local', 'local', 0);
INSERT INTO public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) VALUES ('93bc1485-9520-4d4d-8271-8d69770abf3b', '03f61e81-240f-4c23-b326-2c0c754f7aa6', '0', 1757765935, '{"authMethod":"openid-connect","redirectUri":"http://localhost:8080/admin/master/console/","notes":{"clientId":"03f61e81-240f-4c23-b326-2c0c754f7aa6","iss":"http://localhost:8080/realms/master","startedAt":"1757764243","response_type":"code","level-of-authentication":"-1","code_challenge_method":"S256","nonce":"95f02ecd-6b29-4fdf-b92b-56d128291eb0","response_mode":"query","scope":"openid","userSessionStartedAt":"1757764243","redirect_uri":"http://localhost:8080/admin/master/console/","state":"f63ce2a4-b08e-4673-8816-5ad7a4c90db6","code_challenge":"qLKwBDfb5GTHccODGCxDFWgKNFOiMg5ycw9GdBaRutI"}}', 'local', 'local', 6);


--
-- TOC entry 4247 (class 0 OID 16612)
-- Dependencies: 258
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('aefcdeb5-fab5-4e4e-9347-c3767e4b8e69', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765671, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765671,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765671}"},"state":"LOGGED_IN"}', 1757765671, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('a899b8cf-214f-44b5-bdf0-6d87f6154891', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765731, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765731,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765731}"},"state":"LOGGED_IN"}', 1757765731, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('399d057f-16a9-41f7-ae5d-73305c459df7', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765775, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765775,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765775}"},"state":"LOGGED_IN"}', 1757765775, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('e037a5a4-3a14-4bab-8c6e-50fa36f1a9e9', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765779, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765779,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765779}"},"state":"LOGGED_IN"}', 1757765779, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('e4bd0d54-456d-4569-9dbd-a275f7204af1', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765781, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765781,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765781}"},"state":"LOGGED_IN"}', 1757765781, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('f4ac62d7-de20-4e09-abbc-23820227a395', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765799, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765799,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765799}"},"state":"LOGGED_IN"}', 1757765799, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('eeca00f1-d342-4d4c-8cd8-1372743167fc', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765825, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765825,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765825}"},"state":"LOGGED_IN"}', 1757765825, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('24377bd1-f6f1-42a6-aaf3-815566599f48', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', '71832a48-eab3-4e5a-bc8a-1720377b95da', 1757765853, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","authenticators-completed":"{\"7e75bd1a-ae39-4e89-b810-329627520458\":1757765853,\"979078fe-3398-4193-9ea3-cbb84de7b108\":1757765853}"},"state":"LOGGED_IN"}', 1757765853, NULL, 0);
INSERT INTO public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) VALUES ('93bc1485-9520-4d4d-8271-8d69770abf3b', 'db5b767f-981a-4d92-afc9-1338141251b3', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 1757764243, '0', '{"ipAddress":"192.168.65.1","authMethod":"openid-connect","rememberMe":false,"started":0,"notes":{"KC_DEVICE_NOTE":"eyJpcEFkZHJlc3MiOiIxOTIuMTY4LjY1LjEiLCJvcyI6Ik1hYyBPUyBYIiwib3NWZXJzaW9uIjoiMTAuMTUuNyIsImJyb3dzZXIiOiJDaHJvbWUvMTQwLjAuMCIsImRldmljZSI6Ik1hYyIsImxhc3RBY2Nlc3MiOjAsIm1vYmlsZSI6ZmFsc2V9","AUTH_TIME":"1757764243","authenticators-completed":"{\"56a1a172-8f56-46ab-8c34-8f7366e74a1f\":1757764243}"},"state":"LOGGED_IN"}', 1757765935, NULL, 6);


--
-- TOC entry 4248 (class 0 OID 16619)
-- Dependencies: 259
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4249 (class 0 OID 16624)
-- Dependencies: 260
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4250 (class 0 OID 16629)
-- Dependencies: 261
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.policy_config (policy_id, name, value) VALUES ('0f3e6ad2-a900-4e03-b101-9d30175bfe18', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config (policy_id, name, value) VALUES ('25b1871d-8418-4d66-b196-e643d05d0ae3', 'defaultResourceType', 'urn:wishlist-api:resources:default');


--
-- TOC entry 4251 (class 0 OID 16634)
-- Dependencies: 262
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9967803e-7f93-48d1-ab2d-df5a3852bb5f', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', 'd249944f-f932-4974-a020-d28fe7386ae6', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '03f61e81-240f-4c23-b326-2c0c754f7aa6', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f9b8ef26-d616-4faf-b204-6e24a1a829f9', 'role list', 'saml', 'saml-role-list-mapper', NULL, '7df131f3-e5e8-4c79-b7c3-2639b08165ae');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2f795cca-6370-4cb1-9381-51abe0619cbf', 'organization', 'saml', 'saml-organization-membership-mapper', NULL, '1f1209c4-3c17-4737-ad29-44a956e92f53');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a11e6943-b054-4191-9f1c-52caf6612bc4', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a13b0281-8cb5-4a1c-aacb-c6c7e788a1f3');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'a224404a-8166-407f-b847-31f49522c700');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a224404a-8166-407f-b847-31f49522c700');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '4bf48d7c-3cc3-44e3-85fa-f763496f57c4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '24afeddd-caca-411b-887a-e683743815e2');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '24afeddd-caca-411b-887a-e683743815e2');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '61918b39-dd0b-4fc3-a7b4-1e7a06005440');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '61918b39-dd0b-4fc3-a7b4-1e7a06005440');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e237a22a-c8a9-44fb-b815-10ff985d9404', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '61918b39-dd0b-4fc3-a7b4-1e7a06005440');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fc0c287e-30f4-43ba-ba60-084faf0c4d47', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'fc9fd756-2c83-4a2f-98e5-c3010ea24830');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '9b03836a-b3cc-4177-b7bb-08985135899b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '9b03836a-b3cc-4177-b7bb-08985135899b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3e6d1fb8-9fd7-4466-9eb2-f13c8ac26594', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, 'a11024b7-1c87-4d38-8839-8701cb10f6cc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'auth_time', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, '10ae1890-3ce5-4a6c-9aab-033b4c944c8c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('44d19fad-101d-4eaa-b78f-35abadb38d22', 'sub', 'openid-connect', 'oidc-sub-mapper', NULL, '10ae1890-3ce5-4a6c-9aab-033b4c944c8c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, 'f56338db-7c4f-417c-a1b6-6b5ccea8954c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, 'f56338db-7c4f-417c-a1b6-6b5ccea8954c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, 'f56338db-7c4f-417c-a1b6-6b5ccea8954c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'organization', 'openid-connect', 'oidc-organization-membership-mapper', NULL, 'e29be01a-016d-4cc8-baca-5cf58bff1606');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6a9b9992-0772-4a99-88e2-add2238e123a', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '4d84f615-d8aa-41a3-97c6-079541e2d394', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('db56fbb1-6cf9-4e15-9d08-9414e556673c', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'b869b0ac-6084-4eff-a314-f3078b03d711');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b15c31d9-7c41-4bde-9b2c-69ed819758de', 'organization', 'saml', 'saml-organization-membership-mapper', NULL, '7446fc6f-3d48-44b1-bbcf-9344b61c6f3d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7ee296ed-4421-4a17-94ea-1c300dd2effc', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '2bb41343-db41-424e-ac9e-e3d7109463b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0c33816e-ae8b-4c67-afd4-2b137eebc285');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0c33816e-ae8b-4c67-afd4-2b137eebc285');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'address', 'openid-connect', 'oidc-address-mapper', NULL, 'a00a7749-4b00-415e-af00-b2d2c2cc6e27');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'cdea8fb3-78a4-4f5b-a785-22d5fd9935f2');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'c51d8918-747c-454e-920e-9a54d5961c4c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'c51d8918-747c-454e-920e-9a54d5961c4c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8b84eab3-d631-48ce-8ec0-1c46c9c4c972', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'c51d8918-747c-454e-920e-9a54d5961c4c');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('99eb7c9a-c86f-4964-9a06-d1a55cd2d868', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, 'd9b7430c-9d16-460f-9e69-3c3efff65e0f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'baf5bf0c-1f7d-4d8b-a8e0-579552dd5f50');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a9257bec-c253-4bd1-ba84-0af044583c63', 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, '988f31fd-b955-4f1c-b06e-eab9dc4be530');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'auth_time', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e605195d-7344-48f8-8cd9-710f542fcf98', 'sub', 'openid-connect', 'oidc-sub-mapper', NULL, '052e0f3b-bab8-4e4a-ae2a-7f4fbedb3628');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, '92b4c161-1580-4cf2-bc2a-6f683c48d71a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, '92b4c161-1580-4cf2-bc2a-6f683c48d71a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', NULL, '92b4c161-1580-4cf2-bc2a-6f683c48d71a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'organization', 'openid-connect', 'oidc-organization-membership-mapper', NULL, '9d3d4ef3-ba6d-4670-9dfd-f1a2fb0f9920');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '74b79722-350b-4eac-8969-c7fa0f90ee5a', NULL);


--
-- TOC entry 4252 (class 0 OID 16639)
-- Dependencies: 263
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8e22c363-e54e-4c1e-9348-7dd6a2ebcc74', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f9b8ef26-d616-4faf-b204-6e24a1a829f9', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f9b8ef26-d616-4faf-b204-6e24a1a829f9', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f9b8ef26-d616-4faf-b204-6e24a1a829f9', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0348e898-c5ee-495e-907d-8feb931814cf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0e796cd5-b424-4a46-bde2-16fded1b7d91', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3cbf26fd-0b4e-4bf2-8f8c-72214f264153', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('40dff810-5adc-4328-aa37-5659f459b964', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4fad6d6c-f71e-40a1-b87a-5bbb9492a5fc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6109b330-2f22-4bbe-8a07-f55678b155de', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('66ac104a-7f2c-4611-9fb2-1d80e2264e12', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6ac31334-6a68-4768-98c5-8a515d502aed', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7b505c7c-dd3c-40a8-976e-876c2fd2ae67', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('82c0c2aa-a1d7-4c83-bdc1-d29da66fa4be', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91c1161f-d53b-4c57-b59c-db8c7eede5bc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a11e6943-b054-4191-9f1c-52caf6612bc4', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a11e6943-b054-4191-9f1c-52caf6612bc4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a11e6943-b054-4191-9f1c-52caf6612bc4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a11e6943-b054-4191-9f1c-52caf6612bc4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2f22f9f-9850-4263-a0f4-3790fa53b8ae', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c2fdd928-0b2c-43b3-bf26-3c1ed773e87e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('01cacaa5-c4dd-40fa-b6c7-fff6e938416b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8bd350c1-291f-453f-8380-fa1f7c28f0e9', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('908e90fc-60a2-4528-807a-e7cbbeb79e73', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('56764eef-344e-47de-8bff-17fe9f8c9f47', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a034b607-2e4e-438e-8daf-5c3e42971145', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0b99bb4f-c802-4a22-8dd2-d04277827cdc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e237a22a-c8a9-44fb-b815-10ff985d9404', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e237a22a-c8a9-44fb-b815-10ff985d9404', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f70ae95b-2a4f-4e2f-8523-48ac27d79936', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fc0c287e-30f4-43ba-ba60-084faf0c4d47', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fc0c287e-30f4-43ba-ba60-084faf0c4d47', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('410b4cd9-013a-4b60-b024-cd6f1eb1688d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('563ebcf6-d0c1-4694-a31e-199c4dd9d7f7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e6d1fb8-9fd7-4466-9eb2-f13c8ac26594', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e6d1fb8-9fd7-4466-9eb2-f13c8ac26594', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e6d1fb8-9fd7-4466-9eb2-f13c8ac26594', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('44d19fad-101d-4eaa-b78f-35abadb38d22', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('44d19fad-101d-4eaa-b78f-35abadb38d22', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'AUTH_TIME', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'auth_time', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('63fa39df-fb1e-43bd-9c4c-83a26e8fd6eb', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('91370324-b078-40b5-a5c7-9ce05e85e111', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a0452709-36bd-4019-bffa-080f17f81ebb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'client_id', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'client_id', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f058dd78-a710-4aff-8b83-d2d2102a6944', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'organization', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('55bedf87-de0d-40f9-b15a-92c58de4f973', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db56fbb1-6cf9-4e15-9d08-9414e556673c', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db56fbb1-6cf9-4e15-9d08-9414e556673c', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('db56fbb1-6cf9-4e15-9d08-9414e556673c', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d31ef6f-9bda-4a63-9b06-c543ffd4518f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('320f02c6-3da3-47f1-bf0e-a7c195e15f31', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4004cd01-af82-498f-b067-020c51d7652f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4d4f6823-c8d8-4b66-98b9-192b347776ce', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5f3a902d-a4f0-4be2-973e-79206fbb6c31', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6870a3f2-bc02-4809-b4db-826cd64f72d3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('70c1ef09-5b12-4687-b0a7-bf661243c20e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ee296ed-4421-4a17-94ea-1c300dd2effc', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ee296ed-4421-4a17-94ea-1c300dd2effc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ee296ed-4421-4a17-94ea-1c300dd2effc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7ee296ed-4421-4a17-94ea-1c300dd2effc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('88d9fb1e-68d5-4e9d-b0ff-7c747617929e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8db85b35-edf0-4415-8d0a-ef9bc39ac8b6', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('969f117e-7f1a-42d2-85d1-0ff638a2ddd6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('989e7115-0ee4-4160-a17e-166636aaf723', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b3182271-87e4-4ca4-8fe6-894b162adf0e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b5a0d312-5e5e-4786-918b-e558b87d8540', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e7d1adeb-0c5a-42bd-8a46-4d4d9cd66303', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f76e210c-0cbc-4787-8e84-36e21d186260', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('582cb2fc-ffff-47ae-96d9-8c6fbde19446', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('6bedcedc-3c8f-4b5f-8be7-b8946c4fe91e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('eae32cd0-6cf9-4d0c-9546-2d4d45f375cf', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1aea2ba1-b3ef-42cc-99b7-f602c1d9219f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8b84eab3-d631-48ce-8ec0-1c46c9c4c972', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8b84eab3-d631-48ce-8ec0-1c46c9c4c972', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('ecdd2d75-6dae-4deb-bad5-043132f0cceb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('99eb7c9a-c86f-4964-9a06-d1a55cd2d868', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('99eb7c9a-c86f-4964-9a06-d1a55cd2d868', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('57ce9004-020f-4ada-b617-4118275343d6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f55fff1e-9777-4dd6-ac8a-db756f8a2c18', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9257bec-c253-4bd1-ba84-0af044583c63', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9257bec-c253-4bd1-ba84-0af044583c63', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9257bec-c253-4bd1-ba84-0af044583c63', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'AUTH_TIME', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'auth_time', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('702a2cf3-4f1c-474c-867b-c72102b65634', 'long', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e605195d-7344-48f8-8cd9-710f542fcf98', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e605195d-7344-48f8-8cd9-710f542fcf98', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'client_id', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'client_id', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3bc3595c-59fe-481c-bab3-24ca056ea615', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('433726e9-102d-4174-9eb3-6b79c4926322', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('465757a7-52ae-4d41-961d-b247f981d394', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'organization', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('43a1d5ab-f8f0-4761-8991-3727e25d0275', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'true', 'introspection.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('e56e6f7b-a301-4d85-b674-260baa458496', 'String', 'jsonType.label');


--
-- TOC entry 4253 (class 0 OID 16644)
-- Dependencies: 264
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'wishlist', 0, NULL, false, false, false, false, 'NONE', 1800, 36000, false, false, '3c99275f-4b2d-470f-9454-e415f974bd9f', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'f4eb9455-e2d0-4302-adc4-2aa8e9792559', '9eae92c6-28f9-46ff-9084-3adffc427dcc', 'bdfc890d-302f-4eb9-be90-e9b872642050', 'c29b40b5-6b09-4cfa-9c79-cf2a78a28e30', 'ee776678-6db3-48df-a8e1-fe1cbe52a718', 2592000, false, 900, true, false, '2dd7d872-8cea-49c5-89ec-7f7ce66a4d61', 0, false, 0, 0, '5246950e-d5c6-42f8-b589-dd5f0d9d5e41');
INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '413b2e61-5722-4fb1-8680-b62c34c9f5ae', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '0090edf1-2c41-4a9a-b8ca-25f0e89bb1d0', '4d3ff5d8-924f-4d9e-ac2f-b05983f1aadb', '49c3b8af-fdfe-4225-814c-d237a80a096f', '30f2726c-e8e2-4a0b-9291-89c40a2d4298', '75298f53-59fa-44a7-9f38-db85f72518b5', 2592000, false, 900, true, false, '86a82806-fc32-49fb-82fb-9c873be622fb', 0, false, 0, 0, 'a2474bc7-5ff9-420b-99f6-bd64b9dbebaa');


--
-- TOC entry 4254 (class 0 OID 16677)
-- Dependencies: 265
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.referrerPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'no-referrer');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxTemporaryLockouts', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceStrategy', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'MULTIPLE');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('realmReusableOtpCode', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('firstBrokerLoginFlowId', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'c2893dc4-905c-48c6-9ed6-7f96f61ab8b7');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayName', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'Keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayNameHtml', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.referrerPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'no-referrer');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxTemporaryLockouts', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceStrategy', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'MULTIPLE');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', '71832a48-eab3-4e5a-bc8a-1720377b95da', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', '71832a48-eab3-4e5a-bc8a-1720377b95da', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', '71832a48-eab3-4e5a-bc8a-1720377b95da', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', '71832a48-eab3-4e5a-bc8a-1720377b95da', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', '71832a48-eab3-4e5a-bc8a-1720377b95da', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', '71832a48-eab3-4e5a-bc8a-1720377b95da', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('realmReusableOtpCode', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByAdminLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByUserLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '300');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DeviceCodeLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '600');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DevicePollingInterval', '71832a48-eab3-4e5a-bc8a-1720377b95da', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityName', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithms', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ES256,RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpId', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreference', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachment', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKey', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirement', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeout', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityNamePasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ES256,RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpIdPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaBackchannelTokenDeliveryMode', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'poll');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaExpiresIn', '71832a48-eab3-4e5a-bc8a-1720377b95da', '120');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaInterval', '71832a48-eab3-4e5a-bc8a-1720377b95da', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaAuthRequestedUserHint', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'login_hint');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('parRequestUriLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('firstBrokerLoginFlowId', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'ccb97002-e873-454a-ac34-b21928cb377f');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('frontendUrl', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('saml.signature.algorithm', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('acr.loa.map', '71832a48-eab3-4e5a-bc8a-1720377b95da', '{}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayName', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'Wishlist');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayNameHtml', '71832a48-eab3-4e5a-bc8a-1720377b95da', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('organizationsEnabled', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('adminPermissionsEnabled', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('verifiableCredentialsEnabled', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionIdleTimeout', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionMaxLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionIdleTimeout', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionMaxLifespan', '71832a48-eab3-4e5a-bc8a-1720377b95da', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.profiles', '71832a48-eab3-4e5a-bc8a-1720377b95da', '{"profiles":[]}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.policies', '71832a48-eab3-4e5a-bc8a-1720377b95da', '{"policies":[]}');


--
-- TOC entry 4255 (class 0 OID 16682)
-- Dependencies: 266
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4256 (class 0 OID 16685)
-- Dependencies: 267
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4257 (class 0 OID 16688)
-- Dependencies: 268
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'jboss-logging');
INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('71832a48-eab3-4e5a-bc8a-1720377b95da', 'jboss-logging');


--
-- TOC entry 4258 (class 0 OID 16691)
-- Dependencies: 269
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4259 (class 0 OID 16696)
-- Dependencies: 270
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf');
INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, '71832a48-eab3-4e5a-bc8a-1720377b95da');


--
-- TOC entry 4260 (class 0 OID 16703)
-- Dependencies: 271
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4261 (class 0 OID 16708)
-- Dependencies: 272
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4262 (class 0 OID 16711)
-- Dependencies: 273
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.redirect_uris (client_id, value) VALUES ('b9f19e40-ee40-4943-adf9-9be151cb1be7', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '/admin/master/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('af3400fd-6400-429e-94df-f9e2e8847b2a', '/realms/wishlist/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', '/realms/wishlist/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '/admin/wishlist/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '/*');


--
-- TOC entry 4263 (class 0 OID 16714)
-- Dependencies: 274
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4264 (class 0 OID 16719)
-- Dependencies: 275
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('d01ee8ff-08c7-4460-86cb-bc901f2bd88c', 'VERIFY_EMAIL', 'Verify Email', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('9fb19d88-f63a-4047-a403-fe899f8b52bc', 'UPDATE_PROFILE', 'Update Profile', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('2a441c1d-8b85-4496-8755-52d038c7572c', 'CONFIGURE_TOTP', 'Configure OTP', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('12f295f5-4f3b-43f6-83b2-6f2945f01650', 'UPDATE_PASSWORD', 'Update Password', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('cc3a27b5-45da-4b45-868f-6bda26c53d37', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('aa5c7b3d-6baf-4770-8f8f-aa881f5f0b79', 'delete_account', 'Delete Account', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('097f50fb-a12e-458f-83ad-e1ea16aaf4c5', 'delete_credential', 'Delete Credential', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'delete_credential', 100);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('167067ff-cb37-4d8c-a364-38f5845f4386', 'update_user_locale', 'Update User Locale', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('3061baa8-bd4a-48af-9278-43db4d8fbc82', 'CONFIGURE_RECOVERY_AUTHN_CODES', 'Recovery Authentication Codes', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'CONFIGURE_RECOVERY_AUTHN_CODES', 120);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('24e4397d-18b8-44ac-afc5-5e9a2f7b9e04', 'webauthn-register', 'Webauthn Register', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('de50c2ba-755d-4986-a90f-e9afb5d2a105', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('6dcd4be6-f4ed-44dd-873d-0dfa5cdf00ef', 'VERIFY_PROFILE', 'Verify Profile', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'VERIFY_PROFILE', 90);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('4f6ed82d-7ebe-4d71-877a-2950257fe1f0', 'idp_link', 'Linking Identity Provider', '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', true, false, 'idp_link', 110);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('c8eb70aa-774b-4735-bf88-2afe853daaab', 'VERIFY_EMAIL', 'Verify Email', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('f9778366-432d-4f3b-9fb7-91bc25e47697', 'UPDATE_PROFILE', 'Update Profile', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('c024bc61-b247-490b-afb6-a71d7cb36373', 'CONFIGURE_TOTP', 'Configure OTP', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b4569bc9-c33b-4a49-9190-70a6f15d28cb', 'UPDATE_PASSWORD', 'Update Password', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('85c8c29e-a348-4a23-a1fa-419594b0c694', 'TERMS_AND_CONDITIONS', 'Terms and Conditions', '71832a48-eab3-4e5a-bc8a-1720377b95da', false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('94eb9746-87f5-47b0-883e-a0a7c8230b61', 'delete_account', 'Delete Account', '71832a48-eab3-4e5a-bc8a-1720377b95da', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('a0339060-f33d-4f8f-b4a4-d56a93845185', 'delete_credential', 'Delete Credential', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'delete_credential', 100);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('6030b33e-5198-476a-a720-b33ec531adcc', 'update_user_locale', 'Update User Locale', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('c0fdedbf-d932-43c7-923d-1cdbf1655b97', 'CONFIGURE_RECOVERY_AUTHN_CODES', 'Recovery Authentication Codes', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'CONFIGURE_RECOVERY_AUTHN_CODES', 120);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('1433800d-bcbb-4002-b575-26745c88d2a6', 'webauthn-register', 'Webauthn Register', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('3a86954a-1317-414a-b01f-ec3ac4c23335', 'webauthn-register-passwordless', 'Webauthn Register Passwordless', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('a7dfcbc1-7be0-45cf-bc7d-0b714709b7a1', 'VERIFY_PROFILE', 'Verify Profile', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'VERIFY_PROFILE', 90);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b5fdd9b3-fda8-4b43-b5c4-a22819674d1c', 'idp_link', 'Linking Identity Provider', '71832a48-eab3-4e5a-bc8a-1720377b95da', true, false, 'idp_link', 110);


--
-- TOC entry 4265 (class 0 OID 16726)
-- Dependencies: 276
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4266 (class 0 OID 16732)
-- Dependencies: 277
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4267 (class 0 OID 16735)
-- Dependencies: 278
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4268 (class 0 OID 16738)
-- Dependencies: 279
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', true, 0, 1);


--
-- TOC entry 4269 (class 0 OID 16743)
-- Dependencies: 280
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4270 (class 0 OID 16748)
-- Dependencies: 281
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('0f3e6ad2-a900-4e03-b101-9d30175bfe18', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', 0, 0, '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('25b1871d-8418-4d66-b196-e643d05d0ae3', 'Default Permission', 'A permission that applies to the default resource type', 'resource', 1, 0, '4f0b55a5-863b-4439-96c5-3999ffc999f9', NULL);


--
-- TOC entry 4271 (class 0 OID 16753)
-- Dependencies: 282
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) VALUES ('f332179e-ca7f-48e9-a8f7-f070041f6aa0', 'Default Resource', 'urn:wishlist-api:resources:default', NULL, '4f0b55a5-863b-4439-96c5-3999ffc999f9', '4f0b55a5-863b-4439-96c5-3999ffc999f9', false, NULL);


--
-- TOC entry 4272 (class 0 OID 16759)
-- Dependencies: 283
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4273 (class 0 OID 16764)
-- Dependencies: 284
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.resource_uris (resource_id, value) VALUES ('f332179e-ca7f-48e9-a8f7-f070041f6aa0', '/*');


--
-- TOC entry 4274 (class 0 OID 16767)
-- Dependencies: 285
-- Data for Name: revoked_token; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4275 (class 0 OID 16770)
-- Dependencies: 286
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4276 (class 0 OID 16775)
-- Dependencies: 287
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '0b014b5d-e35a-4a71-98a3-85da12ce8a87');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('d249944f-f932-4974-a020-d28fe7386ae6', '7fedf8a8-e90d-47ac-b53a-e9d129499606');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'bac91ad5-452b-43d2-9c0d-f2f95f45da4a');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('4d84f615-d8aa-41a3-97c6-079541e2d394', 'de11f44c-9e07-4caf-aca0-88b389f2fb9c');


--
-- TOC entry 4277 (class 0 OID 16778)
-- Dependencies: 288
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4278 (class 0 OID 16781)
-- Dependencies: 289
-- Data for Name: server_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4279 (class 0 OID 16787)
-- Dependencies: 290
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) VALUES ('is_temporary_admin', 'true', 'db5b767f-981a-4d92-afc9-1338141251b3', 'cd60a63d-eb06-4d78-973a-47c1555f40c7', NULL, NULL, NULL);


--
-- TOC entry 4280 (class 0 OID 16793)
-- Dependencies: 291
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4281 (class 0 OID 16798)
-- Dependencies: 292
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4282 (class 0 OID 16801)
-- Dependencies: 293
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('db5b767f-981a-4d92-afc9-1338141251b3', NULL, '7575035b-d3f5-4a4e-a328-e64206603945', false, true, NULL, NULL, NULL, '7d9ce9a6-50c2-4af2-b5f3-49676890bcdf', 'admin', 1757692472430, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('7f72eb84-196f-4f2b-9839-44a0cb932160', NULL, 'a4ebe616-8bf5-464d-9c56-79ff7770eba1', false, true, NULL, NULL, NULL, '71832a48-eab3-4e5a-bc8a-1720377b95da', 'service-account-wishlist-api', 1757692580441, '4f0b55a5-863b-4439-96c5-3999ffc999f9', 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('a85cf1e1-1b8d-4748-aa6f-770387a63ac7', 'john.doe@email.com', 'john.doe@email.com', true, true, NULL, 'John', 'Doe', '71832a48-eab3-4e5a-bc8a-1720377b95da', 'john.doe', 1757765445167, NULL, 0);


--
-- TOC entry 4283 (class 0 OID 16809)
-- Dependencies: 294
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4284 (class 0 OID 16814)
-- Dependencies: 295
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4285 (class 0 OID 16819)
-- Dependencies: 296
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4286 (class 0 OID 16824)
-- Dependencies: 297
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4287 (class 0 OID 16829)
-- Dependencies: 298
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.user_group_membership (group_id, user_id, membership_type) VALUES ('7216b8d5-7e11-43b1-bde8-6f9ad66d6850', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7', 'UNMANAGED');
INSERT INTO public.user_group_membership (group_id, user_id, membership_type) VALUES ('7216b8d5-7e11-43b1-bde8-6f9ad66d6850', '7f72eb84-196f-4f2b-9839-44a0cb932160', 'UNMANAGED');


--
-- TOC entry 4288 (class 0 OID 16832)
-- Dependencies: 299
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 4289 (class 0 OID 16836)
-- Dependencies: 300
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('a2474bc7-5ff9-420b-99f6-bd64b9dbebaa', 'db5b767f-981a-4d92-afc9-1338141251b3');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('32494f01-27c9-41ee-b96a-6214ab0753b5', 'db5b767f-981a-4d92-afc9-1338141251b3');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', '7f72eb84-196f-4f2b-9839-44a0cb932160');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5cc4c71c-0d0c-473d-af2b-ae19ddf8f469', '7f72eb84-196f-4f2b-9839-44a0cb932160');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5246950e-d5c6-42f8-b589-dd5f0d9d5e41', 'a85cf1e1-1b8d-4748-aa6f-770387a63ac7');


--
-- TOC entry 4290 (class 0 OID 16839)
-- Dependencies: 301
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.web_origins (client_id, value) VALUES ('03f61e81-240f-4c23-b326-2c0c754f7aa6', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('74b79722-350b-4eac-8969-c7fa0f90ee5a', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('4f0b55a5-863b-4439-96c5-3999ffc999f9', '*');


--
-- TOC entry 3853 (class 2606 OID 16843)
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- TOC entry 3845 (class 2606 OID 16845)
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- TOC entry 3945 (class 2606 OID 16847)
-- Name: server_config SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.server_config
    ADD CONSTRAINT "SERVER_CONFIG_pkey" PRIMARY KEY (server_config_key);


--
-- TOC entry 3825 (class 2606 OID 16849)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3718 (class 2606 OID 16851)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3733 (class 2606 OID 16853)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3720 (class 2606 OID 16855)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3872 (class 2606 OID 16857)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3708 (class 2606 OID 16859)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3745 (class 2606 OID 16861)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3741 (class 2606 OID 16863)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3784 (class 2606 OID 16865)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3764 (class 2606 OID 16867)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3769 (class 2606 OID 16869)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 16871)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3780 (class 2606 OID 16873)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3788 (class 2606 OID 16875)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3796 (class 2606 OID 16877)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3874 (class 2606 OID 16879)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3877 (class 2606 OID 16881)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3880 (class 2606 OID 16883)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3889 (class 2606 OID 16885)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3805 (class 2606 OID 16887)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3715 (class 2606 OID 16889)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3761 (class 2606 OID 16891)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3792 (class 2606 OID 16893)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3864 (class 2606 OID 16895)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3980 (class 2606 OID 16897)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3710 (class 2606 OID 16899)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3939 (class 2606 OID 16901)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3723 (class 2606 OID 16903)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3869 (class 2606 OID 16905)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3885 (class 2606 OID 16907)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3827 (class 2606 OID 16909)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3690 (class 2606 OID 16911)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3706 (class 2606 OID 16913)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3696 (class 2606 OID 16915)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3700 (class 2606 OID 16917)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3703 (class 2606 OID 16919)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 16921)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3748 (class 2606 OID 16923)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3812 (class 2606 OID 16925)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3856 (class 2606 OID 16927)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3887 (class 2606 OID 16929)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3752 (class 2606 OID 16931)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3972 (class 2606 OID 16933)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3910 (class 2606 OID 16935)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3921 (class 2606 OID 16937)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3916 (class 2606 OID 16939)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3693 (class 2606 OID 16941)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3902 (class 2606 OID 16943)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3926 (class 2606 OID 16945)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3905 (class 2606 OID 16947)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3942 (class 2606 OID 16949)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3964 (class 2606 OID 16951)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3978 (class 2606 OID 16953)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3974 (class 2606 OID 16955)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3774 (class 2606 OID 16957)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3960 (class 2606 OID 16959)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3953 (class 2606 OID 16961)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 16963)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 16965)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3802 (class 2606 OID 16967)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3814 (class 2606 OID 16969)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3817 (class 2606 OID 16971)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3819 (class 2606 OID 16973)
-- Name: jgroups_ping constraint_jgroups_ping; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.jgroups_ping
    ADD CONSTRAINT constraint_jgroups_ping PRIMARY KEY (address);


--
-- TOC entry 3831 (class 2606 OID 16975)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 16977)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3840 (class 2606 OID 16979)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3858 (class 2606 OID 16981)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 16983)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3892 (class 2606 OID 16985)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3895 (class 2606 OID 16987)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3897 (class 2606 OID 16989)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3986 (class 2606 OID 16991)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3931 (class 2606 OID 16993)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3936 (class 2606 OID 16995)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3933 (class 2606 OID 16997)
-- Name: revoked_token constraint_rt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.revoked_token
    ADD CONSTRAINT constraint_rt PRIMARY KEY (id);


--
-- TOC entry 3947 (class 2606 OID 16999)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3983 (class 2606 OID 17001)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3992 (class 2606 OID 17003)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3755 (class 2606 OID 17005)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3731 (class 2606 OID 17007)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3726 (class 2606 OID 17009)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3908 (class 2606 OID 17011)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3739 (class 2606 OID 17013)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3759 (class 2606 OID 17015)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3883 (class 2606 OID 17017)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3900 (class 2606 OID 17019)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 17021)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3810 (class 2606 OID 17023)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3713 (class 2606 OID 17025)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3728 (class 2606 OID 17027)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3968 (class 2606 OID 17029)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3956 (class 2606 OID 17031)
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3924 (class 2606 OID 17033)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3914 (class 2606 OID 17035)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3919 (class 2606 OID 17037)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3929 (class 2606 OID 17039)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3958 (class 2606 OID 17041)
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- TOC entry 3834 (class 2606 OID 17043)
-- Name: migration_model uk_migration_update_time; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_update_time UNIQUE (update_time);


--
-- TOC entry 3836 (class 2606 OID 17045)
-- Name: migration_model uk_migration_version; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT uk_migration_version UNIQUE (version);


--
-- TOC entry 3847 (class 2606 OID 17047)
-- Name: org uk_org_alias; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_alias UNIQUE (realm_id, alias);


--
-- TOC entry 3849 (class 2606 OID 17049)
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- TOC entry 3851 (class 2606 OID 17051)
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- TOC entry 3867 (class 2606 OID 17053)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3970 (class 2606 OID 17055)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3765 (class 1259 OID 17056)
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3766 (class 1259 OID 17057)
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3691 (class 1259 OID 17058)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3694 (class 1259 OID 17059)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3704 (class 1259 OID 17060)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3697 (class 1259 OID 17061)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3698 (class 1259 OID 17062)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3701 (class 1259 OID 17063)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3734 (class 1259 OID 17064)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3716 (class 1259 OID 17065)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- TOC entry 3711 (class 1259 OID 17066)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3721 (class 1259 OID 17067)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3729 (class 1259 OID 17068)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3735 (class 1259 OID 17069)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3859 (class 1259 OID 17070)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3736 (class 1259 OID 17071)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3746 (class 1259 OID 17072)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3742 (class 1259 OID 17073)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3743 (class 1259 OID 17074)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3749 (class 1259 OID 17075)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3750 (class 1259 OID 17076)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3756 (class 1259 OID 17077)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3757 (class 1259 OID 17078)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3762 (class 1259 OID 17079)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3793 (class 1259 OID 17080)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3794 (class 1259 OID 17081)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3767 (class 1259 OID 17082)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3770 (class 1259 OID 17083)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3771 (class 1259 OID 17084)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3772 (class 1259 OID 17085)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3777 (class 1259 OID 17086)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3778 (class 1259 OID 17087)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3781 (class 1259 OID 17088)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3782 (class 1259 OID 17089)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3785 (class 1259 OID 17090)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3786 (class 1259 OID 17091)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3789 (class 1259 OID 17092)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3790 (class 1259 OID 17093)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3799 (class 1259 OID 17094)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3800 (class 1259 OID 17095)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3803 (class 1259 OID 17096)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3815 (class 1259 OID 17097)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3806 (class 1259 OID 17098)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3807 (class 1259 OID 17099)
-- Name: idx_idp_for_login; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_idp_for_login ON public.identity_provider USING btree (realm_id, enabled, link_only, hide_on_login, organization_id);


--
-- TOC entry 3808 (class 1259 OID 17100)
-- Name: idx_idp_realm_org; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_idp_realm_org ON public.identity_provider USING btree (realm_id, organization_id);


--
-- TOC entry 3828 (class 1259 OID 17101)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3829 (class 1259 OID 17102)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3841 (class 1259 OID 17103)
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- TOC entry 3842 (class 1259 OID 17104)
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- TOC entry 3843 (class 1259 OID 17105)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3854 (class 1259 OID 17106)
-- Name: idx_org_domain_org_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_org_domain_org_id ON public.org_domain USING btree (org_id);


--
-- TOC entry 3911 (class 1259 OID 17107)
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- TOC entry 3912 (class 1259 OID 17108)
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- TOC entry 3860 (class 1259 OID 17109)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3870 (class 1259 OID 17110)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3724 (class 1259 OID 17111)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3875 (class 1259 OID 17112)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3881 (class 1259 OID 17113)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3878 (class 1259 OID 17114)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3865 (class 1259 OID 17115)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3890 (class 1259 OID 17116)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3893 (class 1259 OID 17117)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3898 (class 1259 OID 17118)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3903 (class 1259 OID 17119)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3906 (class 1259 OID 17120)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3917 (class 1259 OID 17121)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3922 (class 1259 OID 17122)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3927 (class 1259 OID 17123)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3934 (class 1259 OID 17124)
-- Name: idx_rev_token_on_expire; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_rev_token_on_expire ON public.revoked_token USING btree (expire);


--
-- TOC entry 3937 (class 1259 OID 17125)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3737 (class 1259 OID 17126)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3940 (class 1259 OID 17127)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3943 (class 1259 OID 17128)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3832 (class 1259 OID 17129)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3961 (class 1259 OID 17130)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3962 (class 1259 OID 17131)
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- TOC entry 3948 (class 1259 OID 17132)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3949 (class 1259 OID 17133)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3954 (class 1259 OID 17134)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3753 (class 1259 OID 17135)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3965 (class 1259 OID 17136)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3984 (class 1259 OID 17137)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3987 (class 1259 OID 17138)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3990 (class 1259 OID 17139)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3966 (class 1259 OID 17140)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3975 (class 1259 OID 17141)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3976 (class 1259 OID 17142)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3981 (class 1259 OID 17143)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3993 (class 1259 OID 17144)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3950 (class 1259 OID 17145)
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3951 (class 1259 OID 17146)
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 4014 (class 2606 OID 17147)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4000 (class 2606 OID 17152)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4011 (class 2606 OID 17157)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4002 (class 2606 OID 17162)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4030 (class 2606 OID 17167)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4056 (class 2606 OID 17172)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4027 (class 2606 OID 17177)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4032 (class 2606 OID 17182)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4049 (class 2606 OID 17187)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4058 (class 2606 OID 17192)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4018 (class 2606 OID 17197)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 4028 (class 2606 OID 17202)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4023 (class 2606 OID 17207)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4007 (class 2606 OID 17212)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3996 (class 2606 OID 17217)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3997 (class 2606 OID 17222)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3998 (class 2606 OID 17227)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3999 (class 2606 OID 17232)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4059 (class 2606 OID 17237)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4003 (class 2606 OID 17242)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4004 (class 2606 OID 17247)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4020 (class 2606 OID 17252)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4001 (class 2606 OID 17257)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4006 (class 2606 OID 17262)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 4005 (class 2606 OID 17267)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4024 (class 2606 OID 17272)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4055 (class 2606 OID 17277)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 4053 (class 2606 OID 17282)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4054 (class 2606 OID 17287)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3994 (class 2606 OID 17292)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4047 (class 2606 OID 17297)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4037 (class 2606 OID 17302)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4042 (class 2606 OID 17307)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4038 (class 2606 OID 17312)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4039 (class 2606 OID 17317)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3995 (class 2606 OID 17322)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4048 (class 2606 OID 17327)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4040 (class 2606 OID 17332)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4041 (class 2606 OID 17337)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4035 (class 2606 OID 17342)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4033 (class 2606 OID 17347)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4034 (class 2606 OID 17352)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4036 (class 2606 OID 17357)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4043 (class 2606 OID 17362)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4008 (class 2606 OID 17367)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4051 (class 2606 OID 17372)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 4050 (class 2606 OID 17377)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4012 (class 2606 OID 17382)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4013 (class 2606 OID 17387)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4025 (class 2606 OID 17392)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4026 (class 2606 OID 17397)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4016 (class 2606 OID 17402)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4017 (class 2606 OID 17407)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 4060 (class 2606 OID 17412)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4046 (class 2606 OID 17417)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4021 (class 2606 OID 17422)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4009 (class 2606 OID 17427)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4022 (class 2606 OID 17432)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 4010 (class 2606 OID 17437)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4031 (class 2606 OID 17442)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4044 (class 2606 OID 17447)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4045 (class 2606 OID 17452)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4029 (class 2606 OID 17457)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4052 (class 2606 OID 17462)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4057 (class 2606 OID 17467)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4019 (class 2606 OID 17472)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4015 (class 2606 OID 17477)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2025-09-13 12:21:06 UTC

--
-- PostgreSQL database dump complete
--

