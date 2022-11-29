CREATE TABLE [dbo].[accident_injury] (
    [summary_nr]     INT           NULL,
    [rel_insp_nr]    INT           NULL,
    [age]            INT           NULL,
    [sex]            INT           NULL,
    [nature_of_inj]  INT           NULL,
    [part_of_body]   INT           NULL,
    [src_of_injury]  INT           NULL,
    [event_type]     INT           NULL,
    [evn_factor]     INT           NULL,
    [hum_factor]     INT           NULL,
    [occ_code]       INT           NULL,
    [degree_of_inj]  INT           NULL,
    [task_assigned]  INT           NULL,
    [hazsub]         INT           NULL,
    [const_op]       INT           NULL,
    [const_op_cause] INT           NULL,
    [fat_cause]      INT           NULL,
    [fall_distance]  INT           NULL,
    [fall_ht]        INT           NULL,
    [injury_line_nr] INT           NULL,
    [load_dt]        DATETIME2     NULL,
    CONSTRAINT [FK_accident_injury_insp_no_activity_nr] FOREIGN KEY ([rel_insp_nr]) REFERENCES [dbo].[insp_no] ([activity_nr]),
    CONSTRAINT [FK_accident_injury_sum_no_summary_nr] FOREIGN KEY ([summary_nr]) REFERENCES [dbo].[sum_no] ([summary_nr])
);


GO

CREATE TABLE [dbo].[evCodes] (
    [code]    INT           NULL,
    [evTitle] VARCHAR (100) NULL
);


GO

CREATE TABLE [dbo].[queryOut] (
    [summary_nr]    INT          NOT NULL,
    [event_date]    DATETIME     NULL,
    [event_type]    INT          NULL,
    [evTitle]       VARCHAR (50) NULL,
    [event_keyword] VARCHAR (50) NULL,
    [part_of_body]  INT          NULL,
    [partTitle]     VARCHAR (50) NULL,
    [nature_of_inj] INT          NULL,
    [natTitle]      VARCHAR (50) NULL,
    [src_of_injury] INT          NULL,
    [srcTitle]      VARCHAR (50) NULL,
    [degree_of_inj] INT          NULL,
    [degTitle]      VARCHAR (50) NULL,
    CONSTRAINT [PK_queryOut_summary_nr] PRIMARY KEY CLUSTERED ([summary_nr] ASC)
);


GO

CREATE TABLE [dbo].[srcCodes] (
    [code]     INT          NULL,
    [srcTitle] VARCHAR (50) NULL
);


GO

CREATE TABLE [dbo].[insp_no] (
    [activity_nr] INT NOT NULL,
    CONSTRAINT [PK_insp_no_activity_nr] PRIMARY KEY CLUSTERED ([activity_nr] ASC)
);


GO

CREATE TABLE [dbo].[inspection] (
    [activity_nr]     INT           IDENTITY (1, 1) NOT NULL,
    [reporting_id]    INT           NULL,
    [state_flag]      VARCHAR (255) NULL,
    [estab_name]      VARCHAR (100) NULL,
    [site_address]    VARCHAR (100) NULL,
    [site_city]       VARCHAR (50)  NULL,
    [site_state]      VARCHAR (50)  NULL,
    [site_zip]        INT           NULL,
    [owner_type]      VARCHAR (50)  NULL,
    [owner_code]      INT           NULL,
    [adv_notice]      VARCHAR (50)  NULL,
    [safety_hlth]     VARCHAR (50)  NULL,
    [sic_code]        INT           NULL,
    [naics_code]      INT           NULL,
    [insp_type]       VARCHAR (50)  NULL,
    [insp_scope]      VARCHAR (50)  NULL,
    [union_status]    VARCHAR (50)  NULL,
    [safety_manuf]    VARCHAR (50)  NULL,
    [safety_const]    VARCHAR (50)  NULL,
    [safety_marit]    VARCHAR (50)  NULL,
    [health_manuf]    VARCHAR (50)  NULL,
    [health_const]    VARCHAR (50)  NULL,
    [health_marit]    VARCHAR (50)  NULL,
    [migrant]         VARCHAR (50)  NULL,
    [mail_street]     VARCHAR (50)  NULL,
    [mail_city]       VARCHAR (50)  NULL,
    [mail_state]      VARCHAR (50)  NULL,
    [mail_zip]        INT           NULL,
    [host_est_key]    VARCHAR (50)  NULL,
    [nr_in_estab]     INT           NULL,
    [open_date]       DATE          NULL,
    [case_mod_date]   DATE          NULL,
    [close_conf_date] DATE          NULL,
    [close_case_date] DATE          NULL,
    [ld_dt]           VARCHAR (50)  NULL,
    CONSTRAINT [FK_inspection_insp_no_activity_nr] FOREIGN KEY ([activity_nr]) REFERENCES [dbo].[insp_no] ([activity_nr])
);


GO

CREATE TABLE [dbo].[violation] (
    [activity_nr]          INT           NOT NULL,
    [citation_id]          VARCHAR (50)  NULL,
    [delete_flag]          VARCHAR (50)  NULL,
    [standard]             VARCHAR (50)  NULL,
    [viol_type]            VARCHAR (50)  NULL,
    [issuance_date]        DATE          NULL,
    [abate_date]           DATE          NULL,
    [abate_complete]       VARCHAR (50)  NULL,
    [current_penalty]      FLOAT (53)    NULL,
    [initial_penalty]      FLOAT (53)    NULL,
    [contest_date]         DATE          NULL,
    [final_order_date]     DATE          NULL,
    [nr_instances]         INT           NULL,
    [nr_exposed]           INT           NULL,
    [rec]                  VARCHAR (50)  NULL,
    [gravity]              INT           NULL,
    [emphasis]             VARCHAR (255) NULL,
    [hazcat]               VARCHAR (255) NULL,
    [fta_insp_nr]          INT           NULL,
    [fta_issuance_date]    DATE          NULL,
    [fta_penalty]          FLOAT (53)    NULL,
    [fta_contest_date]     DATE          NULL,
    [fta_final_order_date] VARCHAR (255) NULL,
    [hazsub1]              VARCHAR (50)  NULL,
    [hazsub2]              INT           NULL,
    [hazsub3]              INT           NULL,
    [hazsub4]              INT           NULL,
    [hazsub5]              VARCHAR (255) NULL,
    [load_dt]              VARCHAR (50)  NULL,
    CONSTRAINT [FK_violation_insp_no_activity_nr] FOREIGN KEY ([activity_nr]) REFERENCES [dbo].[insp_no] ([activity_nr])
);


GO

CREATE TABLE [dbo].[osha_data_dictionary] (
    [table_name]      VARCHAR (50)  NULL,
    [column_name]     VARCHAR (50)  NULL,
    [attribute_name]  VARCHAR (50)  NULL,
    [definition]      VARCHAR (300) NULL,
    [column_datatype] VARCHAR (50)  NULL,
    [display_name]    VARCHAR (50)  NULL
);


GO

CREATE TABLE [dbo].[partCodes] (
    [code]      INT          NULL,
    [partTitle] VARCHAR (50) NULL
);


GO

CREATE TABLE [dbo].[accident] (
    [summary_nr]    INT           NOT NULL,
    [report_id]     VARCHAR (512) NOT NULL,
    [event_date]    VARCHAR (512) NULL,
    [event_desc]    VARCHAR (512) NULL,
    [event_keyword] VARCHAR (512) NULL,
    CONSTRAINT [FK_accident_sum_no_summary_nr] FOREIGN KEY ([summary_nr]) REFERENCES [dbo].[sum_no] ([summary_nr])
);


GO

CREATE TABLE [dbo].[accident_abstract] (
    [summary_nr]    INT           NOT NULL,
    [line_nr]       INT           NULL,
    [abstract_text] VARCHAR (100) NULL,
    CONSTRAINT [KEY_accident_abstract_summary_nr] UNIQUE NONCLUSTERED ([summary_nr] ASC)
);


GO

CREATE TABLE [dbo].[natCodes] (
    [code]     INT          NULL,
    [natTitle] VARCHAR (50) NULL
);


GO

CREATE TABLE [dbo].[sum_no] (
    [summary_nr] INT IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_sum_no_summary_nr] PRIMARY KEY CLUSTERED ([summary_nr] ASC)
);


GO

CREATE TABLE [dbo].[related_activity] (
    [activity_nr] INT          NULL,
    [rel_type]    VARCHAR (50) NULL,
    [rel_act_nr]  INT          NULL,
    [rel_safety]  VARCHAR (50) NULL,
    [rel_health]  VARCHAR (50) NULL,
    [load_dt]     VARCHAR (50) NULL
);


GO

CREATE TABLE [dbo].[degCodes] (
    [code]     INT          NULL,
    [degTitle] VARCHAR (50) NULL
);


GO

CREATE NONCLUSTERED INDEX [IDX_accident_abstract_summary_nr]
    ON [dbo].[accident_abstract]([summary_nr] ASC);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'LINK BETWEEN SUMMARY AND INSPECTION NUMBERS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'accident_injury';


GO

