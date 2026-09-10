:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:22,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:24,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'450fa9079230eab1337995d12c9e563d993525129d6ea5ca4719ace250bef4a8',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3617,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf',sourceHash:'6d69a411f8d92ed92a19245718d8181362d1fa86c5886ccdfcf4497513b03af1',warnings:[]}).
x_isa(x_calendarMonthIndex,x_NonAbduciblePredicate) :- x_cid(a65b1270ab746a).
xc_microtheory(a65b1270ab746a,x_CalendarsMt).
xc_source_file(a65b1270ab746a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746a,3).
xc_kb_names(a65b1270ab746a,[]).
xc_mapping_rows(a65b1270ab746a,[]).
x_comment(x_AustraliaDay,"An instance of #$AnnualHolidayType and a specialization of #$GregorianCalendarHoliday.  An instance of #$AustraliaDay occurs on the 26th day of every instance of #$January.  #$AustraliaDay commemorates the day in (#$YearFn 1788) when Captain Arthur Phillip became the first governor of the colony of New South Wales (see #$NewSouthWales-StateAustralia).") :- x_cid(a65b1270ab746b).
xc_microtheory(a65b1270ab746b,x_CalendarsMt).
xc_source_file(a65b1270ab746b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746b,4).
xc_kb_names(a65b1270ab746b,[]).
xc_mapping_rows(a65b1270ab746b,[]).
x_comment(x_DayOfWeekPriorToDateFn,"(#$DayOfWeekPriorToDateFn DAY-TYPE DATE) refers to the day [#$CalendarDay] which is an instance of the #$DayOfWeekType, DAY-TYPE, which most closely precedes but does not overlap DATE, an instance of #$Date.  See also #$dayOfWeekPriorToDate, #$DayOfWeekAfterDateFn, and #$dayOfWeekAfterDate.") :- x_cid(a65b1270ab746c).
xc_microtheory(a65b1270ab746c,x_CalendarsMt).
xc_source_file(a65b1270ab746c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746c,5).
xc_kb_names(a65b1270ab746c,[]).
xc_mapping_rows(a65b1270ab746c,[]).
x_comment(x_dayOfWeekPriorToDate,"(#$dayOfWeekPriorToDate DAY-TYPE DATE CALENDAR-DAY) means that CALENDAR-DAY is the instance of DAY-TYPE (a #$DayOfWeekType) which most closely precedes (but does not overlap) the specified date, DATE.  The #$Wednesday immediately prior to the third millenium would be the third argument of (#$dayOfWeekPriorToDate #$Wednesday #$TheTwentyFirstCenturyCE WEDNESDAY) and \"last Friday\" would be the third argument of (#$dayOfWeekPriorToDate #$Friday (#$IndexicalReferentFn #$Today-Indexical) FRIDAY).  See also #$DayOfWeekPriorToDateFn, #$dayOfWeekAfterDate, and #$DayOfWeekAfterDateFn.") :- x_cid(a65b1270ab746d).
xc_microtheory(a65b1270ab746d,x_CalendarsMt).
xc_source_file(a65b1270ab746d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746d,6).
xc_kb_names(a65b1270ab746d,[]).
xc_mapping_rows(a65b1270ab746d,[]).
x_comment(x_HolidayTypeByCalendarSystem,"An instance of #$SecondOrderCollection and a specialization of #$CalendarBasedTemporalObjectType.  Each instance of #$HolidayTypeByCalendarSystem is a collection of #$Holidays each of whose temporal extent is specified in terms of the same #$CalendarSystem.  Instances of #$HolidayTypeByCalendarSystem include #$GregorianCalendarHoliday, #$IslamicCalendarHoliday, and #$JewishCalendarHoliday.") :- x_cid(a65b1270ab746e).
xc_microtheory(a65b1270ab746e,x_CalendarsMt).
xc_source_file(a65b1270ab746e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746e,7).
xc_kb_names(a65b1270ab746e,[]).
xc_mapping_rows(a65b1270ab746e,[]).
x_comment(x_GregorianCalendarHoliday,"An instance of #$HolidayTypeByCalendarSystem.  Each instance of #$GregorianCalendarHoliday is a #$Holiday whose temporal extent is specified in terms of the #$GregorianCalendar (q.v.).") :- x_cid(a65b1270ab746f).
xc_microtheory(a65b1270ab746f,x_CalendarsMt).
xc_source_file(a65b1270ab746f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab746f,8).
xc_kb_names(a65b1270ab746f,[]).
xc_mapping_rows(a65b1270ab746f,[]).
x_comment(x_IslamicCalendarHoliday,"An instance of #$HolidayTypeByCalendarSystem.  Each instance of #$IslamicCalendarHoliday is a #$Holiday whose temporal extent is specified in terms of the #$IslamicLunarCalendar (q.v.).") :- x_cid(a65b1270ab7470).
xc_microtheory(a65b1270ab7470,x_CalendarsMt).
xc_source_file(a65b1270ab7470,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7470,9).
xc_kb_names(a65b1270ab7470,[]).
xc_mapping_rows(a65b1270ab7470,[]).
x_comment(x_JewishCalendarHoliday,"An instance of #$HolidayTypeByCalendarSystem.  Each instance of #$JewishCalendarHoliday is a #$Holiday whose temporal extent is specified in terms of the #$JewishCalendar (q.v.).") :- x_cid(a65b1270ab7471).
xc_microtheory(a65b1270ab7471,x_CalendarsMt).
xc_source_file(a65b1270ab7471,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7471,10).
xc_kb_names(a65b1270ab7471,[]).
xc_mapping_rows(a65b1270ab7471,[]).
x_comment('x_DayOfWeekPriorToDateFn-Inclusive',"(#$DayOfWeekPriorToDateFn-Inclusive DAY-TYPE DATE) refers to the day [#$CalendarDay] which is an instance of the #$DayOfWeekType, DAY-TYPE, which most closely precedes or overlaps DATE, an instance of #$Date.  This function differs from #$DayOfWeekPriorToDateFn because the latter returns the next DAY of DAY-OF-WEEK type which does not overlap DATE.") :- x_cid(a65b1270ab7472).
xc_microtheory(a65b1270ab7472,x_CalendarsMt).
xc_source_file(a65b1270ab7472,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7472,11).
xc_kb_names(a65b1270ab7472,[]).
xc_mapping_rows(a65b1270ab7472,[]).
x_comment('x_dayOfWeekPriorToDate-Inclusive',"(#$dayOfWeekPriorToDate-Inclusive DAY-TYPE DATE CALENDAR-DAY) means that CALENDAR-DAY is the instance of DAY-TYPE (a #$DayOfWeekType) which most closely precedes or overlaps the specified date, DATE.  This is the corresponding predicate to the #$EvaluatableFunction, #$DayOfWeekPriorToDateFn-Inclusive.") :- x_cid(a65b1270ab7473).
xc_microtheory(a65b1270ab7473,x_CalendarsMt).
xc_source_file(a65b1270ab7473,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7473,12).
xc_kb_names(a65b1270ab7473,[]).
xc_mapping_rows(a65b1270ab7473,[]).
x_genls(x_August,x_GregorianMonth) :- x_cid(a65b1270ab7474).
xc_microtheory(a65b1270ab7474,x_CalendarsMt).
xc_source_file(a65b1270ab7474,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7474,13).
xc_kb_names(a65b1270ab7474,[]).
xc_mapping_rows(a65b1270ab7474,[]).
x_genls(x_April,x_GregorianMonth) :- x_cid(a65b1270ab7475).
xc_microtheory(a65b1270ab7475,x_CalendarsMt).
xc_source_file(a65b1270ab7475,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7475,14).
xc_kb_names(a65b1270ab7475,[]).
xc_mapping_rows(a65b1270ab7475,[]).
x_genls(x_September,x_GregorianMonth) :- x_cid(a65b1270ab7476).
xc_microtheory(a65b1270ab7476,x_CalendarsMt).
xc_source_file(a65b1270ab7476,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7476,15).
xc_kb_names(a65b1270ab7476,[]).
xc_mapping_rows(a65b1270ab7476,[]).
x_genls(x_May,x_GregorianMonth) :- x_cid(a65b1270ab7477).
xc_microtheory(a65b1270ab7477,x_CalendarsMt).
xc_source_file(a65b1270ab7477,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7477,16).
xc_kb_names(a65b1270ab7477,[]).
xc_mapping_rows(a65b1270ab7477,[]).
x_genls(x_October,x_GregorianMonth) :- x_cid(a65b1270ab7478).
xc_microtheory(a65b1270ab7478,x_CalendarsMt).
xc_source_file(a65b1270ab7478,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7478,17).
xc_kb_names(a65b1270ab7478,[]).
xc_mapping_rows(a65b1270ab7478,[]).
x_genls(x_June,x_GregorianMonth) :- x_cid(a65b1270ab7479).
xc_microtheory(a65b1270ab7479,x_CalendarsMt).
xc_source_file(a65b1270ab7479,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab7479,18).
xc_kb_names(a65b1270ab7479,[]).
xc_mapping_rows(a65b1270ab7479,[]).
x_genls(x_February,x_GregorianMonth) :- x_cid(a65b1270ab747a).
xc_microtheory(a65b1270ab747a,x_CalendarsMt).
xc_source_file(a65b1270ab747a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747a,19).
xc_kb_names(a65b1270ab747a,[]).
xc_mapping_rows(a65b1270ab747a,[]).
x_genls(x_January,x_GregorianMonth) :- x_cid(a65b1270ab747b).
xc_microtheory(a65b1270ab747b,x_CalendarsMt).
xc_source_file(a65b1270ab747b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747b,20).
xc_kb_names(a65b1270ab747b,[]).
xc_mapping_rows(a65b1270ab747b,[]).
x_genls(x_November,x_GregorianMonth) :- x_cid(a65b1270ab747c).
xc_microtheory(a65b1270ab747c,x_CalendarsMt).
xc_source_file(a65b1270ab747c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747c,21).
xc_kb_names(a65b1270ab747c,[]).
xc_mapping_rows(a65b1270ab747c,[]).
x_genls(x_July,x_GregorianMonth) :- x_cid(a65b1270ab747d).
xc_microtheory(a65b1270ab747d,x_CalendarsMt).
xc_source_file(a65b1270ab747d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747d,22).
xc_kb_names(a65b1270ab747d,[]).
xc_mapping_rows(a65b1270ab747d,[]).
x_genls(x_March,x_GregorianMonth) :- x_cid(a65b1270ab747e).
xc_microtheory(a65b1270ab747e,x_CalendarsMt).
xc_source_file(a65b1270ab747e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747e,23).
xc_kb_names(a65b1270ab747e,[]).
xc_mapping_rows(a65b1270ab747e,[]).
x_genls(x_December,x_GregorianMonth) :- x_cid(a65b1270ab747f).
xc_microtheory(a65b1270ab747f,x_CalendarsMt).
xc_source_file(a65b1270ab747f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/CalendarsMt.krf').
xc_source_line(a65b1270ab747f,24).
xc_kb_names(a65b1270ab747f,[]).
xc_mapping_rows(a65b1270ab747f,[]).
kb_cache_footer(footer{count:22,digest:'450fa9079230eab1337995d12c9e563d993525129d6ea5ca4719ace250bef4a8',headerDigest:a91033680fea11d00ecd9de8a676492dfa50766bd2d7f09a9470a7ef46df31ad}).
