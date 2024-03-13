column view_name format a20;
select 'drop view ', view_name || ';' from user_views;