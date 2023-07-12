-- CreateTable
CREATE TABLE "affiliates" (
    "id" SERIAL NOT NULL,
    "affiliate_name" VARCHAR(70) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "affiliates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_blocked_channels" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER,
    "chat_uuid_id" BIGINT NOT NULL,
    "chat_channel_id" BIGINT NOT NULL,
    "channel_type" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "chat_blocked_channels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_channels" (
    "id" BIGSERIAL NOT NULL,
    "channel_id" VARCHAR(50) NOT NULL,
    "channel_type" SMALLINT NOT NULL,
    "channel_name" VARCHAR(20) DEFAULT '',
    "description" VARCHAR(30) DEFAULT '',
    "status" SMALLINT NOT NULL,
    "group_id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "chat_channels_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_messages" (
    "id" BIGSERIAL NOT NULL,
    "chat_messages" TEXT NOT NULL,
    "message_type" SMALLINT NOT NULL,
    "message_from" INTEGER,
    "message_to" INTEGER,
    "statistics_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "chat_messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chat_uuids" (
    "id" BIGSERIAL NOT NULL,
    "chat_uuid" VARCHAR(36) NOT NULL,
    "auth_key" VARCHAR(8) NOT NULL,
    "status" SMALLINT NOT NULL,
    "user_id" INTEGER,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "chat_uuids_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_agendas" (
    "id" BIGSERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "agenda_type" VARCHAR(20) NOT NULL,
    "mode" VARCHAR(20) NOT NULL,
    "option" VARCHAR(20) NOT NULL,
    "criteria" INTEGER NOT NULL,
    "date" DATE,
    "week_number" INTEGER NOT NULL,
    "time_from" TIME(0),
    "time_to" TIME(6) NOT NULL,
    "time_zone" VARCHAR(255),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_agendas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_call_rates" (
    "id" SERIAL NOT NULL,
    "min_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "max_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "call_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "commission_percentage" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "consultant_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_call_rates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_gallery" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "image_name" VARCHAR(255) NOT NULL,
    "is_approved" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_gallery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_ivr_numbers" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "site_ivr_number_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_ivr_numbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_messages" (
    "id" SERIAL NOT NULL,
    "message_subject" VARCHAR(100) NOT NULL,
    "message_body" VARCHAR(500) NOT NULL,
    "parent_id" INTEGER NOT NULL DEFAULT 0,
    "mark_as_read" BOOLEAN NOT NULL DEFAULT false,
    "consultant_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_online_durations" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "online_time" TIMESTAMP(0) NOT NULL,
    "offline_time" TIMESTAMP(0),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_online_durations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_out_payments" (
    "id" SERIAL NOT NULL,
    "period" VARCHAR(10) NOT NULL,
    "paid_amount" DECIMAL(9,5) NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "is_invoice_generated" BOOLEAN NOT NULL DEFAULT false,
    "payment_status" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "bonus_amount" DECIMAL(9,5) NOT NULL DEFAULT 0,

    CONSTRAINT "consultant_out_payments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_part_payments" (
    "id" SERIAL NOT NULL,
    "period" VARCHAR(10) NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "amount" DECIMAL(9,5) NOT NULL,
    "payment_status" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_part_payments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_phone_numbers" (
    "id" SERIAL NOT NULL,
    "phone_number" VARCHAR(20) NOT NULL,
    "idd_code" VARCHAR(5) NOT NULL,
    "type" VARCHAR(10) NOT NULL,
    "surcharge_amount" DECIMAL(8,4) NOT NULL DEFAULT 0,
    "consultant_id" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_phone_numbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_prs_numbers" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "site_ivr_number_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_prs_numbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_specializations" (
    "id" SERIAL NOT NULL,
    "specialization_id" INTEGER NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_specializations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_statistics" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "no_of_consultations" INTEGER NOT NULL DEFAULT 0,
    "review_score" INTEGER NOT NULL DEFAULT 0,
    "no_of_reviews" INTEGER NOT NULL DEFAULT 0,
    "no_of_favorites" INTEGER NOT NULL DEFAULT 0,
    "total_call_duration" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_statistics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultant_tips" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "statistics_id" INTEGER NOT NULL,
    "tipping_method" VARCHAR(5) NOT NULL,
    "tip_amount" DECIMAL(5,2) NOT NULL,
    "vat_rate" DECIMAL(5,2) NOT NULL,
    "vat_amount" DECIMAL(5,2) NOT NULL,
    "coach_get_amount" DECIMAL(5,2) NOT NULL,
    "exchange_rate" DECIMAL(5,2) NOT NULL,
    "customer_currency" VARCHAR(3) NOT NULL,
    "coach_currency" VARCHAR(3) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultant_tips_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultants" (
    "id" SERIAL NOT NULL,
    "po_box_number" VARCHAR(30),
    "street" VARCHAR(50),
    "city" VARCHAR(50),
    "zip_code" VARCHAR(10),
    "birthday" DATE,
    "gender" VARCHAR(25),
    "contact_number_fixed" VARCHAR(20),
    "contact_number_mobile" VARCHAR(20),
    "company_name" VARCHAR(100),
    "vat_number" VARCHAR(15),
    "vat_amount" DOUBLE PRECISION,
    "vat_obligated" SMALLINT NOT NULL DEFAULT 1,
    "ivr_status" SMALLINT NOT NULL DEFAULT 3,
    "chat_status" SMALLINT NOT NULL DEFAULT 3,
    "is_blocked" BOOLEAN NOT NULL DEFAULT false,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "is_chat_enabled" BOOLEAN NOT NULL DEFAULT false,
    "agenda" SMALLINT NOT NULL DEFAULT 0,
    "user_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "currency_code" VARCHAR(3) NOT NULL,
    "call_rates_enabled" BOOLEAN NOT NULL DEFAULT false,
    "min_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "max_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "call_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "chat_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,
    "commission_percentage" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "credit_code" VARCHAR(8) NOT NULL,
    "provider_sequence" VARCHAR(10),
    "last_login" TIMESTAMP(0),
    "ivr_status_logout_option" INTEGER NOT NULL DEFAULT 1,
    "chat_status_logout_option" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "is_activation_mail_sent" BOOLEAN DEFAULT false,

    CONSTRAINT "consultants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultants_custom_details" (
    "id" SERIAL NOT NULL,
    "extension" INTEGER NOT NULL,
    "nickname" VARCHAR(20) NOT NULL,
    "avatar" VARCHAR(20),
    "photo_consult" SMALLINT NOT NULL DEFAULT 0,
    "intro_audio" VARCHAR(20),
    "intro_video" VARCHAR(20),
    "consultant_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultants_custom_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultants_extension_details" (
    "id" SERIAL NOT NULL,
    "extension" INTEGER NOT NULL DEFAULT 0,
    "nickname" VARCHAR(20) NOT NULL,
    "avatar" VARCHAR(20),
    "photo_consult" SMALLINT NOT NULL DEFAULT 0,
    "intro_audio" VARCHAR(20),
    "intro_video" VARCHAR(20),
    "info_short" JSON,
    "info_long" JSON,
    "consultant_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultants_extension_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consultants_languages" (
    "id" SERIAL NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "consultants_languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact_us_messages" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(35) NOT NULL,
    "parent_id" INTEGER NOT NULL DEFAULT 0,
    "email" VARCHAR(254) NOT NULL,
    "message" VARCHAR(500) NOT NULL,
    "ip" VARCHAR(50) NOT NULL,
    "mark_as_read" BOOLEAN NOT NULL DEFAULT false,
    "group_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "contact_us_messages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "countries" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "code" VARCHAR(5) NOT NULL,
    "idd_code" VARCHAR(5) NOT NULL,
    "currency_code" VARCHAR(5) NOT NULL,
    "vat_rate" DECIMAL(5,2) NOT NULL,
    "effective_vat_rate" DECIMAL(5,2) NOT NULL,
    "direct_number_enabled" SMALLINT NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "countries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "country_vat_rates" (
    "id" SERIAL NOT NULL,
    "vat_rate" DECIMAL(5,2) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "country_vat_rates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_customer_reviews" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "comment" VARCHAR(500),
    "rating" INTEGER NOT NULL,
    "parent_id" INTEGER NOT NULL,
    "is_flagged" BOOLEAN NOT NULL DEFAULT false,
    "is_visible" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "statistics_id" INTEGER NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "credit_customer_id" INTEGER NOT NULL,
    "created_user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "flagged_user_id" INTEGER,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "credits_customer_reviews_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_customer_viewed_coaches" (
    "id" BIGSERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "credits_customer_viewed_coaches_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_customers" (
    "id" SERIAL NOT NULL,
    "pseudo_name" VARCHAR(35) NOT NULL,
    "current_credits" DECIMAL(11,5) NOT NULL DEFAULT 0,
    "currency_code" VARCHAR(3) NOT NULL,
    "credit_code" VARCHAR(20) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "avatar" VARCHAR(15),
    "is_blocked" BOOLEAN NOT NULL DEFAULT false,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "last_login" TIMESTAMP(0),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "current_seconds" INTEGER NOT NULL DEFAULT 0,
    "country_confirmed_at" TIMESTAMP(0),

    CONSTRAINT "credits_customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_refund_bank_details" (
    "id" BIGSERIAL NOT NULL,
    "account_name" VARCHAR(60) NOT NULL,
    "account_currency" VARCHAR(5) NOT NULL,
    "bank_name" VARCHAR(45) NOT NULL,
    "iban_number" VARCHAR(45) NOT NULL,
    "swift_code" VARCHAR(15) NOT NULL,
    "address" VARCHAR(70) NOT NULL,
    "city" VARCHAR(20) NOT NULL,
    "zip_code" VARCHAR(15) NOT NULL,
    "account_type" VARCHAR(8) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "credits_refund_bank_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_refund_details" (
    "id" BIGSERIAL NOT NULL,
    "reason" VARCHAR(250) NOT NULL,
    "po_box_number" VARCHAR(20) NOT NULL,
    "street" VARCHAR(25) NOT NULL,
    "city" VARCHAR(25) NOT NULL,
    "telephone_number" VARCHAR(15) NOT NULL,
    "statistics_id" INTEGER NOT NULL,
    "credit_refund_bank_detail_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "credits_refund_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "credits_transactions" (
    "id" SERIAL NOT NULL,
    "event_id" TEXT NOT NULL,
    "reference_id" VARCHAR(30) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "amount" DECIMAL(8,2) NOT NULL,
    "currency_code" VARCHAR(5) NOT NULL,
    "payment_method" VARCHAR(25) NOT NULL,
    "payment_brand" VARCHAR(25) NOT NULL,
    "payment_gateway" VARCHAR(25) NOT NULL,
    "card_number_last_four" VARCHAR(4),
    "status" VARCHAR(10) NOT NULL,
    "remark" VARCHAR(100),
    "user_id" INTEGER NOT NULL,
    "credit_type_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "group_id" INTEGER,
    "plan_id" INTEGER,

    CONSTRAINT "credits_transactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "currency_exchange_rates" (
    "id" SERIAL NOT NULL,
    "eur" JSON NOT NULL,
    "chf" JSON NOT NULL,
    "cad" JSON NOT NULL,
    "usd" JSON NOT NULL,
    "gbp" JSON NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "currency_exchange_rates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deleted_customer_accounts" (
    "id" SERIAL NOT NULL,
    "credit_customer_id" INTEGER NOT NULL,
    "reason" INTEGER NOT NULL,
    "remark" VARCHAR(250) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "deleted_customer_accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "divisions" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "label" VARCHAR(50) NOT NULL,
    "parent_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "divisions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "favorite_consultants" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "favorite_consultants_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "group_ivr_numbers" (
    "id" SERIAL NOT NULL,
    "country_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "site_ivr_number_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "group_ivr_numbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "groups" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "abbreviation" VARCHAR(5) NOT NULL,
    "status" SMALLINT NOT NULL,
    "group_type_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "horoscope_daily" (
    "id" SERIAL NOT NULL,

    CONSTRAINT "horoscope_daily_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "horoscope_subscribers" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "sign" SMALLINT NOT NULL,
    "time_period" SMALLINT NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "horoscope_subscribers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ivr_call_statistics_hourly" (
    "id" SERIAL NOT NULL,
    "year" VARCHAR(4),
    "month" VARCHAR(2),
    "day" VARCHAR(2),
    "hour" VARCHAR(2),
    "call_status" VARCHAR(20),
    "call_status_count" INTEGER NOT NULL,
    "call_duration" INTEGER DEFAULT 0,
    "conversation_duration" INTEGER DEFAULT 0,
    "allocated_vat_amount" DECIMAL(9,5) DEFAULT 0,
    "consultant_total_earning" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "surcharge_amount" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "group_id_count" INTEGER NOT NULL,

    CONSTRAINT "ivr_call_statistics_hourly_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ivr_known_users" (
    "id" SERIAL NOT NULL,
    "number" VARCHAR(15) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "group_id" INTEGER DEFAULT 3,

    CONSTRAINT "ivr_known_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" SERIAL NOT NULL,
    "label" VARCHAR(15) NOT NULL,
    "key" VARCHAR(5) NOT NULL,
    "iso_id" VARCHAR(5) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "media_storages" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(10) NOT NULL,
    "name" VARCHAR(30) NOT NULL,
    "extension" VARCHAR(5) NOT NULL,
    "web_location" VARCHAR(50) NOT NULL,
    "physical_location" VARCHAR(50) NOT NULL,
    "uploaded_user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "media_storages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" SERIAL NOT NULL,
    "migration" VARCHAR(255) NOT NULL,
    "batch" INTEGER NOT NULL,

    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" SERIAL NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    "src_user_id" INTEGER NOT NULL,
    "src_user_role_id" INTEGER NOT NULL,
    "dst_user_id" INTEGER,
    "reference" VARCHAR(50) NOT NULL,
    "mark_as_read" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_access_tokens" (
    "id" VARCHAR(100) NOT NULL,
    "user_id" BIGINT,
    "client_id" INTEGER NOT NULL,
    "name" VARCHAR(255),
    "scopes" TEXT,
    "revoked" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_access_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_auth_codes" (
    "id" VARCHAR(100) NOT NULL,
    "user_id" BIGINT NOT NULL,
    "client_id" INTEGER NOT NULL,
    "scopes" TEXT,
    "revoked" BOOLEAN NOT NULL,
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_auth_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_clients" (
    "id" SERIAL NOT NULL,
    "user_id" BIGINT,
    "name" VARCHAR(255) NOT NULL,
    "secret" VARCHAR(100) NOT NULL,
    "redirect" TEXT NOT NULL,
    "personal_access_client" BOOLEAN NOT NULL,
    "password_client" BOOLEAN NOT NULL,
    "revoked" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "oauth_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_personal_access_clients" (
    "id" SERIAL NOT NULL,
    "client_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "oauth_personal_access_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_refresh_tokens" (
    "id" VARCHAR(100) NOT NULL,
    "access_token_id" VARCHAR(100) NOT NULL,
    "revoked" BOOLEAN NOT NULL,
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_refresh_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "password_reveals" (
    "id" BIGSERIAL NOT NULL,
    "account_owner_user_id" INTEGER NOT NULL,
    "revealed_user_id" INTEGER NOT NULL,
    "revealed_count" INTEGER NOT NULL,
    "last_revealed_at" TIMESTAMP(0),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "password_reveals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "passwords_resets" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "token" VARCHAR(100) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "passwords_resets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(10) NOT NULL,
    "value" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "photo_consults" (
    "id" SERIAL NOT NULL,
    "media_storage_id" INTEGER NOT NULL,
    "consultant_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "note" VARCHAR(800) NOT NULL,
    "status" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "photo_consults_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promo_campaign_code_claims" (
    "id" SERIAL NOT NULL,
    "ip" VARCHAR(40) NOT NULL,
    "claimed_date" TIMESTAMP(0) NOT NULL,
    "source" VARCHAR(10) NOT NULL,
    "claimed_amount" DECIMAL(5,2) NOT NULL,
    "promo_campaign_id" INTEGER NOT NULL,
    "promo_campaign_code_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "promo_campaign_code_claims_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promo_campaign_codes" (
    "id" SERIAL NOT NULL,
    "promo_campaign_code" VARCHAR(8) NOT NULL,
    "promo_campaign_code_type_id" INTEGER NOT NULL,
    "promo_campaign_id" INTEGER NOT NULL,
    "group_id" INTEGER,
    "user_id" INTEGER,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "usage" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "promo_campaign_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promo_campaign_invitees" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "promo_campaign_code_id" INTEGER NOT NULL,
    "status" VARCHAR(10) NOT NULL,
    "approved_at" TIMESTAMP(0),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "promo_campaign_invitees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "promo_campaigns" (
    "id" SERIAL NOT NULL,
    "campaign_name" VARCHAR(35) NOT NULL,
    "campaign_type_id" INTEGER NOT NULL,
    "allowed_groups" JSON NOT NULL,
    "allowed_countries" JSON NOT NULL,
    "reward_type_id" INTEGER NOT NULL,
    "reward_amount" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "campaign_start_date" TIMESTAMP(0),
    "campaign_end_date" TIMESTAMP(0),
    "is_enabled" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "allowed_consultants" JSON,
    "is_campaign_audience" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "promo_campaigns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_division_routes" (
    "id" SERIAL NOT NULL,
    "role_division_id" INTEGER NOT NULL,
    "route_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "role_division_routes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_divisions" (
    "id" SERIAL NOT NULL,
    "role_id" INTEGER NOT NULL,
    "division_id" INTEGER NOT NULL,
    "parent_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "role_divisions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "label" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "routes" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "label" VARCHAR(100),
    "permission_id" INTEGER NOT NULL DEFAULT 1,
    "remark" VARCHAR(12) NOT NULL,
    "slug" VARCHAR(100) NOT NULL,
    "module_name" VARCHAR(30),
    "uri" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "routes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "site_ivr_numbers" (
    "id" SERIAL NOT NULL,
    "number" VARCHAR(15) NOT NULL,
    "is_default" BOOLEAN NOT NULL DEFAULT false,
    "type_id" SMALLINT NOT NULL,
    "group_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "per_minute_rate" DECIMAL(4,2) NOT NULL DEFAULT 0,

    CONSTRAINT "site_ivr_numbers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "specializations" (
    "id" SERIAL NOT NULL,
    "specialization" JSON NOT NULL,
    "type" VARCHAR(20) NOT NULL,
    "parent_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "specializations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "statistics" (
    "id" SERIAL NOT NULL,
    "unique_id" VARCHAR(36) NOT NULL,
    "dst_number" VARCHAR(15) DEFAULT '',
    "type" SMALLINT NOT NULL,
    "type_id" INTEGER NOT NULL,
    "extension" INTEGER DEFAULT 0,
    "provider_id" INTEGER DEFAULT 0,
    "src_number" VARCHAR(15) DEFAULT '',
    "start_time" TIMESTAMP(0) NOT NULL,
    "ringing_start_time" TIMESTAMP(0),
    "connected_time" TIMESTAMP(0),
    "hangup_time" TIMESTAMP(0),
    "end_time" TIMESTAMP(0),
    "total_duration" INTEGER DEFAULT 0,
    "conversation_duration" INTEGER DEFAULT 0,
    "coach_rate" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "vat_rate" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "allocated_vat_amount" DECIMAL(9,5) DEFAULT 0,
    "credit_without_vat" DECIMAL(9,5) DEFAULT 0,
    "credit_before" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "credit_after" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "consultant_earning_for_minute" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "consultant_total_earning" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "surcharge_amount" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "status" VARCHAR(35) DEFAULT '',
    "customer_currency_code" VARCHAR(4) DEFAULT '',
    "customer_currency_rate" DECIMAL(9,5) DEFAULT 0,
    "coach_currency_code" VARCHAR(4) DEFAULT '',
    "coach_currency_rate" DECIMAL(9,5) DEFAULT 0,
    "company_and_coach_currency_rate" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "company_and_customer_currency_rate" DECIMAL(9,5) NOT NULL DEFAULT 0,
    "consultant_id" INTEGER,
    "user_id" INTEGER,
    "credit_customer_id" INTEGER,
    "site_ivr_number_id" INTEGER,
    "chat_channel_id" BIGINT,
    "group_id" INTEGER,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "statistics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subscribers" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "ip" VARCHAR(15) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "token" VARCHAR(32) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "subscribers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subscribers_pre_release" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "ip" VARCHAR(50) NOT NULL,
    "country_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    "token" VARCHAR(32) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "subscribers_pre_release_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "technical_issues" (
    "id" SERIAL NOT NULL,
    "problem" VARCHAR(500) NOT NULL,
    "group_id" INTEGER NOT NULL,
    "statistics_id" INTEGER NOT NULL,
    "credit_customer_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "technical_issues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tracings" (
    "id" SERIAL NOT NULL,
    "statistics_id" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(0) NOT NULL,
    "info" VARCHAR(80),
    "credit_before" DECIMAL(9,5) NOT NULL,
    "credit_after" DECIMAL(9,5) NOT NULL,
    "status" INTEGER,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "tracings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "used_promo_campaign_codes" (
    "id" SERIAL NOT NULL,
    "promo_campaign_code" VARCHAR(8) NOT NULL,
    "source" VARCHAR(10) NOT NULL,
    "status" VARCHAR(10) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "used_promo_campaign_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_bank_accounts" (
    "id" SERIAL NOT NULL,
    "account_name" VARCHAR(50) NOT NULL,
    "currency_code" VARCHAR(5) NOT NULL,
    "bank_name" VARCHAR(100),
    "account_number" VARCHAR(50) NOT NULL,
    "account_type" VARCHAR(10) NOT NULL,
    "swift_code" VARCHAR(12),
    "bank_address" VARCHAR(300),
    "bank_city" VARCHAR(35),
    "bank_zip_code" VARCHAR(10),
    "recipient_account_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "user_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_bank_accounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_campaign_invitees" (
    "id" BIGSERIAL NOT NULL,
    "user_email" VARCHAR(254) NOT NULL,
    "user_campaign_id" BIGINT NOT NULL,
    "opened_at" TIMESTAMP(0),
    "claimed_at" TIMESTAMP(0),
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_campaign_invitees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_campaigns" (
    "id" BIGSERIAL NOT NULL,
    "campaign_name" VARCHAR(200) NOT NULL,
    "campaign_amount" DECIMAL(6,2) NOT NULL DEFAULT 0,
    "language_id" INTEGER NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_campaigns_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_divisions" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "division_id" INTEGER NOT NULL,
    "user_type" VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_divisions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_role_divisions" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "role_division_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_role_divisions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_routes" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "route_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "user_routes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(35),
    "last_name" VARCHAR(35),
    "email" VARCHAR(254) NOT NULL,
    "password" VARCHAR(128) NOT NULL,
    "group_id" INTEGER NOT NULL,
    "token" VARCHAR(100),
    "status" SMALLINT NOT NULL DEFAULT 0,
    "default_role_division_id" INTEGER,
    "is_logged" BOOLEAN NOT NULL DEFAULT false,
    "remember_token" VARCHAR(100),
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "provider" VARCHAR(255),
    "provider_id" VARCHAR(255),
    "deleted_at" TIMESTAMP(0),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "user_token" TEXT,
    "email_verified_at" TIMESTAMP(6),
    "ip" VARCHAR(100),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_authentications" (
    "id" SERIAL NOT NULL,
    "ip" VARCHAR(50) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "user_agent_info" TEXT NOT NULL,
    "site" VARCHAR(15) NOT NULL,
    "user_id" INTEGER NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "users_authentications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users_invalid_login_attempts" (
    "id" SERIAL NOT NULL,
    "ip" VARCHAR(15) NOT NULL,
    "site" VARCHAR(15) NOT NULL,
    "email" VARCHAR(254) NOT NULL,
    "user_agent_info" TEXT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "users_invalid_login_attempts_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "fk_index_affiliate_user_id" ON "affiliates"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_blocked_channels_chat_channel_id" ON "chat_blocked_channels"("chat_channel_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_blocked_channels_chat_uuid_id" ON "chat_blocked_channels"("chat_uuid_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_blocked_channels_user_id" ON "chat_blocked_channels"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "chat_channels_channel_id_unique" ON "chat_channels"("channel_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_channels_group_id" ON "chat_channels"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_channels_user_id" ON "chat_channels"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_chat_messages_statistics_id" ON "chat_messages"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_chat_messages_message_from" ON "chat_messages"("message_from");

-- CreateIndex
CREATE INDEX "fk_index_chat_messages_message_to" ON "chat_messages"("message_to");

-- CreateIndex
CREATE UNIQUE INDEX "chat_uuids_chat_uuid_unique" ON "chat_uuids"("chat_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "chat_uuids_auth_key_unique" ON "chat_uuids"("auth_key");

-- CreateIndex
CREATE INDEX "fk_index_chat_uuids_user_id" ON "chat_uuids"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_agendas_consultant_id" ON "consultant_agendas"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_agendas_group_id" ON "consultant_agendas"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_call_rates_consultant_id" ON "consultant_call_rates"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_gallery_consultant_id" ON "consultant_gallery"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_gallery_user_id" ON "consultant_gallery"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_ivr_numbers_consultant_id" ON "consultant_ivr_numbers"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_ivr_numbers_country_id" ON "consultant_ivr_numbers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_ivr_numbers_group_id" ON "consultant_ivr_numbers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_ivr_numbers_site_ivr_number_id" ON "consultant_ivr_numbers"("site_ivr_number_id");

-- CreateIndex
CREATE UNIQUE INDEX "consultant_ivr_numbers_consultant_id_country_id_group_id_site_i" ON "consultant_ivr_numbers"("consultant_id", "country_id", "group_id", "site_ivr_number_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_messages_consultant_id" ON "consultant_messages"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_online_durations_consultant_id" ON "consultant_online_durations"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_out_payments_consultant_id" ON "consultant_out_payments"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_part_payments_consultant_id" ON "consultant_part_payments"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_phone_number_consultant_id" ON "consultant_phone_numbers"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_prs_numbers_consultant_id" ON "consultant_prs_numbers"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_prs_numbers_country_id" ON "consultant_prs_numbers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_prs_numbers_group_id" ON "consultant_prs_numbers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_prs_numbers_site_ivr_number_id" ON "consultant_prs_numbers"("site_ivr_number_id");

-- CreateIndex
CREATE UNIQUE INDEX "consultant_prs_numbers_consultant_id_country_id_group_id_site_i" ON "consultant_prs_numbers"("consultant_id", "country_id", "group_id", "site_ivr_number_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_specializations_consultant_id" ON "consultant_specializations"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_specializations_specialization_id" ON "consultant_specializations"("specialization_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_statistics_consultant_id" ON "consultant_statistics"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_statistics_group_id" ON "consultant_statistics"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "consultant_statistics_consultant_id_group_id_unique" ON "consultant_statistics"("consultant_id", "group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_tips_consultant_id" ON "consultant_tips"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_tips_customer_id" ON "consultant_tips"("customer_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_tips_statistics_id" ON "consultant_tips"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_country_id" ON "consultants"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_user_id" ON "consultants"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_consultants_custom_detail_consultant_id" ON "consultants_custom_details"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultants_extension_detail_consultant_id" ON "consultants_extension_details"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultants_extension_detail_group_id" ON "consultants_extension_details"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultants_language_consultant_id" ON "consultants_languages"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultants_language_language_id" ON "consultants_languages"("language_id");

-- CreateIndex
CREATE INDEX "fk_index_contact_us_messages_country_id" ON "contact_us_messages"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_contact_us_messages_group_id" ON "contact_us_messages"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_country_vat_rates_country_id" ON "country_vat_rates"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_consultant_id" ON "credits_customer_reviews"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_created_user_id" ON "credits_customer_reviews"("created_user_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_credit_customer_id" ON "credits_customer_reviews"("credit_customer_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_flagged_user_id" ON "credits_customer_reviews"("flagged_user_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_group_id" ON "credits_customer_reviews"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_consultant_credits_customer_reviews_statistics_id" ON "credits_customer_reviews"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_customer_viewed_coaches_consultant_id" ON "credits_customer_viewed_coaches"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_customer_viewed_coaches_group_id" ON "credits_customer_viewed_coaches"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_customer_viewed_coaches_user_id" ON "credits_customer_viewed_coaches"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_credit_customer_country_id" ON "credits_customers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_credit_customer_group_id" ON "credits_customers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_credit_customer_language_id" ON "credits_customers"("language_id");

-- CreateIndex
CREATE INDEX "fk_index_credit_customer_user_id" ON "credits_customers"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_refund_bank_details_country_id" ON "credits_refund_bank_details"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_refund_bank_details_credit_refund_bank_detail_" ON "credits_refund_details"("credit_refund_bank_detail_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_refund_details_statistics_id" ON "credits_refund_details"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_transaction_group_id" ON "credits_transactions"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_credits_transaction_user_id" ON "credits_transactions"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_deleted_customer_accounts_credit_customer_id" ON "deleted_customer_accounts"("credit_customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "divisions_name_parent_id_unique" ON "divisions"("name", "parent_id");

-- CreateIndex
CREATE INDEX "fk_index_favorite_consultants_consultant_id" ON "favorite_consultants"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_favorite_consultants_group_id" ON "favorite_consultants"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_favorite_consultants_user_id" ON "favorite_consultants"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_group_ivr_numbers_country_id" ON "group_ivr_numbers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_group_ivr_numbers_group_id" ON "group_ivr_numbers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_group_ivr_numbers_site_ivr_number_id" ON "group_ivr_numbers"("site_ivr_number_id");

-- CreateIndex
CREATE UNIQUE INDEX "group_ivr_numbers_country_id_group_id_site_ivr_number_id_unique" ON "group_ivr_numbers"("country_id", "group_id", "site_ivr_number_id");

-- CreateIndex
CREATE UNIQUE INDEX "groups_name_unique" ON "groups"("name");

-- CreateIndex
CREATE UNIQUE INDEX "groups_abbreviation_unique" ON "groups"("abbreviation");

-- CreateIndex
CREATE INDEX "fk_index_horoscope_subscribers_group_id" ON "horoscope_subscribers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_ivr_known_users_user_id" ON "ivr_known_users"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_media_storages_group_id" ON "media_storages"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_media_storages_uploaded_user_id" ON "media_storages"("uploaded_user_id");

-- CreateIndex
CREATE INDEX "fk_index_notifications_dst_user_id" ON "notifications"("dst_user_id");

-- CreateIndex
CREATE INDEX "fk_index_notifications_src_user_id" ON "notifications"("src_user_id");

-- CreateIndex
CREATE INDEX "fk_index_notifications_src_user_role_id" ON "notifications"("src_user_role_id");

-- CreateIndex
CREATE INDEX "oauth_access_tokens_user_id_index" ON "oauth_access_tokens"("user_id");

-- CreateIndex
CREATE INDEX "oauth_clients_user_id_index" ON "oauth_clients"("user_id");

-- CreateIndex
CREATE INDEX "oauth_personal_access_clients_client_id_index" ON "oauth_personal_access_clients"("client_id");

-- CreateIndex
CREATE INDEX "oauth_refresh_tokens_access_token_id_index" ON "oauth_refresh_tokens"("access_token_id");

-- CreateIndex
CREATE INDEX "fk_index_password_reveals_account_owner_user_id" ON "password_reveals"("account_owner_user_id");

-- CreateIndex
CREATE INDEX "fk_index_password_reveals_revealed_user_id" ON "password_reveals"("revealed_user_id");

-- CreateIndex
CREATE INDEX "fk_index_password_reset_group_id" ON "passwords_resets"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_password_reset_user_id" ON "passwords_resets"("user_id");

-- CreateIndex
CREATE INDEX "passwords_resets_email_index" ON "passwords_resets"("email");

-- CreateIndex
CREATE INDEX "fk_index_photo_consults_consultant_id" ON "photo_consults"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_photo_consults_customer_id" ON "photo_consults"("customer_id");

-- CreateIndex
CREATE INDEX "fk_index_photo_consults_group_id" ON "photo_consults"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_photo_consults_media_storage_id" ON "photo_consults"("media_storage_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_code_claims_promo_campaign_code_id" ON "promo_campaign_code_claims"("promo_campaign_code_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_code_claims_promo_campaign_id" ON "promo_campaign_code_claims"("promo_campaign_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_code_claims_user_id" ON "promo_campaign_code_claims"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "promo_campaign_codes_promo_campaign_code_unique" ON "promo_campaign_codes"("promo_campaign_code");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_codes_group_id" ON "promo_campaign_codes"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_codes_promo_campaign_id" ON "promo_campaign_codes"("promo_campaign_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_codes_user_id" ON "promo_campaign_codes"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_promo_campaign_invitees_promo_campaign_code_id" ON "promo_campaign_invitees"("promo_campaign_code_id");

-- CreateIndex
CREATE UNIQUE INDEX "promo_campaigns_campaign_name_unique" ON "promo_campaigns"("campaign_name");

-- CreateIndex
CREATE INDEX "fk_index_role_division_route_permission_id" ON "role_division_routes"("permission_id");

-- CreateIndex
CREATE INDEX "fk_index_role_division_route_role_division_id" ON "role_division_routes"("role_division_id");

-- CreateIndex
CREATE INDEX "fk_index_role_division_route_route_id" ON "role_division_routes"("route_id");

-- CreateIndex
CREATE INDEX "fk_index_role_division_division_id" ON "role_divisions"("division_id");

-- CreateIndex
CREATE INDEX "fk_index_role_division_role_id" ON "role_divisions"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "routes_name_unique" ON "routes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "routes_slug_unique" ON "routes"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "site_ivr_numbers_number_unique" ON "site_ivr_numbers"("number");

-- CreateIndex
CREATE INDEX "fk_index_site_ivr_number_country_id" ON "site_ivr_numbers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_site_ivr_number_group_id" ON "site_ivr_numbers"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_site_ivr_number_language_id" ON "site_ivr_numbers"("language_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_chat_channel_id" ON "statistics"("chat_channel_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_consultant_id" ON "statistics"("consultant_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_credit_customer_id" ON "statistics"("credit_customer_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_group_id" ON "statistics"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_site_ivr_number_id" ON "statistics"("site_ivr_number_id");

-- CreateIndex
CREATE INDEX "fk_index_statistics_user_id" ON "statistics"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_subscribers_country_id" ON "subscribers"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_pr_subscribers_country_id" ON "subscribers_pre_release"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_technical_issues_credit_customer_id" ON "technical_issues"("credit_customer_id");

-- CreateIndex
CREATE INDEX "fk_index_technical_issues_group_id" ON "technical_issues"("group_id");

-- CreateIndex
CREATE INDEX "fk_index_technical_issues_statistics_id" ON "technical_issues"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_tracings_statistics_id" ON "tracings"("statistics_id");

-- CreateIndex
CREATE INDEX "fk_index_used_promo_campaign_codes_user_id" ON "used_promo_campaign_codes"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_user_bank_account_country_id" ON "user_bank_accounts"("country_id");

-- CreateIndex
CREATE INDEX "fk_index_user_bank_account_user_id" ON "user_bank_accounts"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_bank_accounts_account_number_user_id_unique" ON "user_bank_accounts"("account_number", "user_id");

-- CreateIndex
CREATE INDEX "fk_index_user_campaign_invitees_user_campaign_id" ON "user_campaign_invitees"("user_campaign_id");

-- CreateIndex
CREATE INDEX "fk_index_user_campaigns_language_id" ON "user_campaigns"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_campaigns_campaign_name_language_id_is_deleted_unique" ON "user_campaigns"("campaign_name", "language_id", "is_deleted");

-- CreateIndex
CREATE INDEX "fk_index_user_divisions_division_id" ON "user_divisions"("division_id");

-- CreateIndex
CREATE INDEX "fk_index_user_divisions_user_id" ON "user_divisions"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_user_role_division_division_id" ON "user_role_divisions"("role_division_id");

-- CreateIndex
CREATE INDEX "fk_index_user_role_division_user_id" ON "user_role_divisions"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_user_route_permission_id" ON "user_routes"("permission_id");

-- CreateIndex
CREATE INDEX "fk_index_user_route_route_id" ON "user_routes"("route_id");

-- CreateIndex
CREATE INDEX "fk_index_user_route_user_id" ON "user_routes"("user_id");

-- CreateIndex
CREATE INDEX "fk_index_user_default_role_id" ON "users"("default_role_division_id");

-- CreateIndex
CREATE INDEX "fk_index_user_group_id" ON "users"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_group_id_unique" ON "users"("email", "group_id");

-- CreateIndex
CREATE INDEX "fk_index_user_login_user_id" ON "users_authentications"("user_id");

-- AddForeignKey
ALTER TABLE "affiliates" ADD CONSTRAINT "affiliates_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_blocked_channels" ADD CONSTRAINT "chat_blocked_channels_chat_channel_id_foreign" FOREIGN KEY ("chat_channel_id") REFERENCES "chat_channels"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_blocked_channels" ADD CONSTRAINT "chat_blocked_channels_chat_uuid_id_foreign" FOREIGN KEY ("chat_uuid_id") REFERENCES "chat_uuids"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_blocked_channels" ADD CONSTRAINT "chat_blocked_channels_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_channels" ADD CONSTRAINT "chat_channels_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_channels" ADD CONSTRAINT "chat_channels_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_messages" ADD CONSTRAINT "chat_messages_message_from_foreign" FOREIGN KEY ("message_from") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_messages" ADD CONSTRAINT "chat_messages_message_to_foreign" FOREIGN KEY ("message_to") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_messages" ADD CONSTRAINT "chat_messages_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "chat_uuids" ADD CONSTRAINT "chat_uuids_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_agendas" ADD CONSTRAINT "consultant_agendas_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_agendas" ADD CONSTRAINT "consultant_agendas_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_call_rates" ADD CONSTRAINT "consultant_call_rates_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_gallery" ADD CONSTRAINT "consultant_gallery_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_gallery" ADD CONSTRAINT "consultant_gallery_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_ivr_numbers" ADD CONSTRAINT "consultant_ivr_numbers_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_ivr_numbers" ADD CONSTRAINT "consultant_ivr_numbers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_ivr_numbers" ADD CONSTRAINT "consultant_ivr_numbers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_ivr_numbers" ADD CONSTRAINT "consultant_ivr_numbers_site_ivr_number_id_foreign" FOREIGN KEY ("site_ivr_number_id") REFERENCES "site_ivr_numbers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_messages" ADD CONSTRAINT "consultant_messages_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_online_durations" ADD CONSTRAINT "consultant_online_durations_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_out_payments" ADD CONSTRAINT "consultant_out_payments_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_part_payments" ADD CONSTRAINT "consultant_part_payments_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_phone_numbers" ADD CONSTRAINT "consultant_phone_numbers_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_prs_numbers" ADD CONSTRAINT "consultant_prs_numbers_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_prs_numbers" ADD CONSTRAINT "consultant_prs_numbers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_prs_numbers" ADD CONSTRAINT "consultant_prs_numbers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_prs_numbers" ADD CONSTRAINT "consultant_prs_numbers_site_ivr_number_id_foreign" FOREIGN KEY ("site_ivr_number_id") REFERENCES "site_ivr_numbers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_specializations" ADD CONSTRAINT "consultant_specializations_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_specializations" ADD CONSTRAINT "consultant_specializations_specialization_id_foreign" FOREIGN KEY ("specialization_id") REFERENCES "specializations"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_statistics" ADD CONSTRAINT "consultant_statistics_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_statistics" ADD CONSTRAINT "consultant_statistics_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_tips" ADD CONSTRAINT "consultant_tips_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_tips" ADD CONSTRAINT "consultant_tips_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultant_tips" ADD CONSTRAINT "consultant_tips_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants" ADD CONSTRAINT "consultants_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants" ADD CONSTRAINT "consultants_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants_custom_details" ADD CONSTRAINT "consultants_custom_details_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants_extension_details" ADD CONSTRAINT "consultants_extension_details_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants_extension_details" ADD CONSTRAINT "consultants_extension_details_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants_languages" ADD CONSTRAINT "consultants_languages_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "consultants_languages" ADD CONSTRAINT "consultants_languages_language_id_foreign" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contact_us_messages" ADD CONSTRAINT "contact_us_messages_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "contact_us_messages" ADD CONSTRAINT "contact_us_messages_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "country_vat_rates" ADD CONSTRAINT "country_vat_rates_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_created_user_id_foreign" FOREIGN KEY ("created_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_credit_customer_id_foreign" FOREIGN KEY ("credit_customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_flagged_user_id_foreign" FOREIGN KEY ("flagged_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_reviews" ADD CONSTRAINT "credits_customer_reviews_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_viewed_coaches" ADD CONSTRAINT "credits_customer_viewed_coaches_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_viewed_coaches" ADD CONSTRAINT "credits_customer_viewed_coaches_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customer_viewed_coaches" ADD CONSTRAINT "credits_customer_viewed_coaches_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customers" ADD CONSTRAINT "credits_customers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customers" ADD CONSTRAINT "credits_customers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customers" ADD CONSTRAINT "credits_customers_language_id_foreign" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_customers" ADD CONSTRAINT "credits_customers_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_refund_bank_details" ADD CONSTRAINT "credits_refund_bank_details_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_refund_details" ADD CONSTRAINT "credits_refund_details_credit_refund_bank_detail_id_foreign" FOREIGN KEY ("credit_refund_bank_detail_id") REFERENCES "credits_refund_bank_details"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_refund_details" ADD CONSTRAINT "credits_refund_details_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_transactions" ADD CONSTRAINT "credits_transactions_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "credits_transactions" ADD CONSTRAINT "credits_transactions_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deleted_customer_accounts" ADD CONSTRAINT "deleted_customer_accounts_credit_customer_id_foreign" FOREIGN KEY ("credit_customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "favorite_consultants" ADD CONSTRAINT "favorite_consultants_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "favorite_consultants" ADD CONSTRAINT "favorite_consultants_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "favorite_consultants" ADD CONSTRAINT "favorite_consultants_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "group_ivr_numbers" ADD CONSTRAINT "group_ivr_numbers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "group_ivr_numbers" ADD CONSTRAINT "group_ivr_numbers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "group_ivr_numbers" ADD CONSTRAINT "group_ivr_numbers_site_ivr_number_id_foreign" FOREIGN KEY ("site_ivr_number_id") REFERENCES "site_ivr_numbers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "horoscope_subscribers" ADD CONSTRAINT "horoscope_subscribers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ivr_known_users" ADD CONSTRAINT "ivr_known_users_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "media_storages" ADD CONSTRAINT "media_storages_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "media_storages" ADD CONSTRAINT "media_storages_uploaded_user_id_foreign" FOREIGN KEY ("uploaded_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_dst_user_id_foreign" FOREIGN KEY ("dst_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_src_user_id_foreign" FOREIGN KEY ("src_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_src_user_role_id_foreign" FOREIGN KEY ("src_user_role_id") REFERENCES "role_divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "password_reveals" ADD CONSTRAINT "password_reveals_account_owner_user_id_foreign" FOREIGN KEY ("account_owner_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "password_reveals" ADD CONSTRAINT "password_reveals_revealed_user_id_foreign" FOREIGN KEY ("revealed_user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "passwords_resets" ADD CONSTRAINT "passwords_resets_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "passwords_resets" ADD CONSTRAINT "passwords_resets_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "photo_consults" ADD CONSTRAINT "photo_consults_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "photo_consults" ADD CONSTRAINT "photo_consults_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "photo_consults" ADD CONSTRAINT "photo_consults_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "photo_consults" ADD CONSTRAINT "photo_consults_media_storage_id_foreign" FOREIGN KEY ("media_storage_id") REFERENCES "media_storages"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_code_claims" ADD CONSTRAINT "promo_campaign_code_claims_promo_campaign_code_id_foreign" FOREIGN KEY ("promo_campaign_code_id") REFERENCES "promo_campaign_codes"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_code_claims" ADD CONSTRAINT "promo_campaign_code_claims_promo_campaign_id_foreign" FOREIGN KEY ("promo_campaign_id") REFERENCES "promo_campaigns"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_code_claims" ADD CONSTRAINT "promo_campaign_code_claims_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_codes" ADD CONSTRAINT "promo_campaign_codes_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_codes" ADD CONSTRAINT "promo_campaign_codes_promo_campaign_id_foreign" FOREIGN KEY ("promo_campaign_id") REFERENCES "promo_campaigns"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_codes" ADD CONSTRAINT "promo_campaign_codes_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "promo_campaign_invitees" ADD CONSTRAINT "promo_campaign_invitees_promo_campaign_code_id_foreign" FOREIGN KEY ("promo_campaign_code_id") REFERENCES "promo_campaign_codes"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_division_routes" ADD CONSTRAINT "role_division_routes_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_division_routes" ADD CONSTRAINT "role_division_routes_role_division_id_foreign" FOREIGN KEY ("role_division_id") REFERENCES "role_divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_division_routes" ADD CONSTRAINT "role_division_routes_route_id_foreign" FOREIGN KEY ("route_id") REFERENCES "routes"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_divisions" ADD CONSTRAINT "role_divisions_division_id_foreign" FOREIGN KEY ("division_id") REFERENCES "divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_divisions" ADD CONSTRAINT "role_divisions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "site_ivr_numbers" ADD CONSTRAINT "site_ivr_numbers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "site_ivr_numbers" ADD CONSTRAINT "site_ivr_numbers_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "site_ivr_numbers" ADD CONSTRAINT "site_ivr_numbers_language_id_foreign" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_chat_channel_id_foreign" FOREIGN KEY ("chat_channel_id") REFERENCES "chat_channels"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_consultant_id_foreign" FOREIGN KEY ("consultant_id") REFERENCES "consultants"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_credit_customer_id_foreign" FOREIGN KEY ("credit_customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_site_ivr_number_id_foreign" FOREIGN KEY ("site_ivr_number_id") REFERENCES "site_ivr_numbers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "statistics" ADD CONSTRAINT "statistics_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subscribers" ADD CONSTRAINT "subscribers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subscribers_pre_release" ADD CONSTRAINT "subscribers_pre_release_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "technical_issues" ADD CONSTRAINT "technical_issues_credit_customer_id_foreign" FOREIGN KEY ("credit_customer_id") REFERENCES "credits_customers"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "technical_issues" ADD CONSTRAINT "technical_issues_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "technical_issues" ADD CONSTRAINT "technical_issues_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tracings" ADD CONSTRAINT "tracings_statistics_id_foreign" FOREIGN KEY ("statistics_id") REFERENCES "statistics"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "used_promo_campaign_codes" ADD CONSTRAINT "used_promo_campaign_codes_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_bank_accounts" ADD CONSTRAINT "user_bank_accounts_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_bank_accounts" ADD CONSTRAINT "user_bank_accounts_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_campaign_invitees" ADD CONSTRAINT "user_campaign_invitees_user_campaign_id_foreign" FOREIGN KEY ("user_campaign_id") REFERENCES "user_campaigns"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_campaigns" ADD CONSTRAINT "user_campaigns_language_id_foreign" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_divisions" ADD CONSTRAINT "user_divisions_division_id_foreign" FOREIGN KEY ("division_id") REFERENCES "divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_divisions" ADD CONSTRAINT "user_divisions_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_role_divisions" ADD CONSTRAINT "user_role_divisions_role_division_id_foreign" FOREIGN KEY ("role_division_id") REFERENCES "role_divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_role_divisions" ADD CONSTRAINT "user_role_divisions_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_routes" ADD CONSTRAINT "user_routes_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_routes" ADD CONSTRAINT "user_routes_route_id_foreign" FOREIGN KEY ("route_id") REFERENCES "routes"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user_routes" ADD CONSTRAINT "user_routes_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_default_role_division_id_foreign" FOREIGN KEY ("default_role_division_id") REFERENCES "role_divisions"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_group_id_foreign" FOREIGN KEY ("group_id") REFERENCES "groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "users_authentications" ADD CONSTRAINT "users_authentications_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

