// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

List<Covid> covidFromJson(String str) => List<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(List<Covid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
    Covid({
        this.year,
        this.weeknum,
        this.newCase,
        this.totalCase,
        this.newCaseExcludeabroad,
        this.totalCaseExcludeabroad,
        this.newRecovered,
        this.totalRecovered,
        this.newDeath,
        this.totalDeath,
        this.caseForeign,
        this.casePrison,
        this.caseWalkin,
        this.caseNewPrev,
        this.caseNewDiff,
        this.deathNewPrev,
        this.deathNewDiff,
        this.updateDate,
    });

    int? year;
    int? weeknum;
    int? newCase;
    int? totalCase;
    int? newCaseExcludeabroad;
    int? totalCaseExcludeabroad;
    int? newRecovered;
    int? totalRecovered;
    int? newDeath;
    int? totalDeath;
    int? caseForeign;
    int? casePrison;
    int? caseWalkin;
    int? caseNewPrev;
    int? caseNewDiff;
    int? deathNewPrev;
    int? deathNewDiff;
    DateTime? updateDate;

    factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        year: json["year"],
        weeknum: json["weeknum"],
        newCase: json["new_case"],
        totalCase: json["total_case"],
        newCaseExcludeabroad: json["new_case_excludeabroad"],
        totalCaseExcludeabroad: json["total_case_excludeabroad"],
        newRecovered: json["new_recovered"],
        totalRecovered: json["total_recovered"],
        newDeath: json["new_death"],
        totalDeath: json["total_death"],
        caseForeign: json["case_foreign"],
        casePrison: json["case_prison"],
        caseWalkin: json["case_walkin"],
        caseNewPrev: json["case_new_prev"],
        caseNewDiff: json["case_new_diff"],
        deathNewPrev: json["death_new_prev"],
        deathNewDiff: json["death_new_diff"],
        updateDate: json["update_date"] == null ? null : DateTime.parse(json["update_date"]),
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "weeknum": weeknum,
        "new_case": newCase,
        "total_case": totalCase,
        "new_case_excludeabroad": newCaseExcludeabroad,
        "total_case_excludeabroad": totalCaseExcludeabroad,
        "new_recovered": newRecovered,
        "total_recovered": totalRecovered,
        "new_death": newDeath,
        "total_death": totalDeath,
        "case_foreign": caseForeign,
        "case_prison": casePrison,
        "case_walkin": caseWalkin,
        "case_new_prev": caseNewPrev,
        "case_new_diff": caseNewDiff,
        "death_new_prev": deathNewPrev,
        "death_new_diff": deathNewDiff,
        "update_date": updateDate?.toIso8601String(),
    };
}
