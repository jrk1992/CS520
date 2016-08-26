
    alter table application_degrees 
        drop constraint FK_p23g7k8rypw0ba1ekhgytb5g;

    alter table applications 
        drop constraint FK_lmcomkxa52fc4kw1pgin4ov1i;

    alter table applications 
        drop constraint FK_45fx5ileqp86itptlqie2vwp0;

    alter table applications 
        drop constraint FK_3k2w7gtt3v412p8xhjmrfdjqo;

    alter table applications 
        drop constraint FK_5wuipr3kwue77u3x0x6xfqnaa;

    alter table applications 
        drop constraint FK_lp9a5ppf6ye4dedegq72a32t4;

    alter table authorities 
        drop constraint FK_s21btj9mlob1djhm3amivbe5e;

    alter table files 
        drop constraint FK_5ok1awgnfwcf01537ylbycyq1;

    alter table job_committee_members 
        drop constraint FK_8i1xpob5ig8dunf8go0gceh4b;

    alter table job_committee_members 
        drop constraint FK_d12kbfko72rgnlcp96meiykvv;

    alter table jobs 
        drop constraint FK_4gbcg6sweyjppsfb9tw4fk1yp;

    alter table reviews 
        drop constraint FK_bnaf4eil2cek30ntv43920vu;

    alter table reviews 
        drop constraint FK_lrodxjcqcl3wfmb4bkhvrxolx;

    alter table rounds 
        drop constraint FK_38dtvawacp71xvc1dpfrpapin;

    drop table if exists application_degrees cascade;

    drop table if exists applications cascade;

    drop table if exists authorities cascade;

    drop table if exists files cascade;

    drop table if exists job_committee_members cascade;

    drop table if exists jobs cascade;

    drop table if exists reviews cascade;

    drop table if exists rounds cascade;

    drop table if exists users cascade;

    drop sequence hibernate_sequence;
