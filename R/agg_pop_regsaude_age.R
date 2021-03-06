agg_pop_regsaude_age <- '

{
  "size": 0,
  "_source": {
    "excludes": []
  },
  "aggs": {
    "3": {
      "terms": {
        "field": "def_sexo",
        "size": 5
      },
      "aggs": {
        "1": {
          "sum": {
            "field": "POPULACAO"
          }
        },
        "4": {
          "terms": {
            "field": "def_FXETARIA",
            "size": 20
          },
          "aggs": {
            "1": {
              "sum": {
                "field": "POPULACAO"
              }
            },
            "2": {
              "terms": {
                "field": "def_RSAUDCOD",
                "size": 10000
              },
              "aggs": {
                "1": {
                  "sum": {
                    "field": "POPULACAO"
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "stored_fields": [
    "*"
  ],
  "script_fields": {},
  "docvalue_fields": [],
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        },
        {
          "bool": {
            "minimum_should_match": 1,
            "should": [
              {
                "match_phrase": {
                  "def_FXETARIA": "ate 04 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "05 a 09 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "10 a 14 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "15 a 19 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "20 a 24 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "25 a 29 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "30 a 34 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "35 a 39 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "40 a 44 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "45 a 49 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "50 a 54 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "55 a 59 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "60 a 64 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "65 a 69 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "70 a 74 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "75 a 79 anos"
                }
              },
              {
                "match_phrase": {
                  "def_FXETARIA": "80 anos ou mais"
                }
              }
            ]
          }
        }
      ],
      "filter": [],
      "should": [],
      "must_not": []
    }
  }
}

'