import 'package:flutter/material.dart';
import 'package:flutter_templating/flutter_templating.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "template app",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CoreTemplateWidget(template: templateFromJson(_jsonTemplate)),
    );
  }
}

const _jsonTemplate = """
{
    "id": "46",
    "groupId": "17",
    "createdAt": "2023-04-12T14:05:47.4817598Z",
    "isValid": true,
    "scopes": [
        "Works"
    ],
    "names": [
        {
            "culture": "it",
            "label": "Template Lavori"
        },
        {
            "culture": "en",
            "label": "Works Template"
        }
    ],
    "descriptions": [
        {
            "culture": "it",
            "label": "Template Lavori"
        },
        {
            "culture": "en",
            "label": "Works Template"
        }
    ],
    "sections": [
        {
            "id": "9aa22aa4-527a-4c37-8bed-c7253fdaa330",
            "name": "Informazioni sull'intervento",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Intervento"
                },
                {
                    "culture": "en",
                    "label": "Work"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": null
                },
                {
                    "culture": "en",
                    "label": null
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "58043e4c-48c2-4a3c-b648-53a6f9dee28b",
                    "name": "Settore",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Settore"
                        },
                        {
                            "culture": "en",
                            "label": "Sector"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": "MOB",
                            "label": "Mobilità"
                        },
                        {
                            "key": "MAN",
                            "label": "Manutenzione"
                        },
                        {
                            "key": "VER",
                            "label": "Verde"
                        },
                        {
                            "key": "URB",
                            "label": "Urbanistica"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "0d347c47-2635-48c2-9197-8a180248c780",
                    "name": "Tipologia Manutenzione",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Tipologia Manutenzione"
                        },
                        {
                            "culture": "en",
                            "label": "Type"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": "SCU",
                            "label": "Scuola"
                        },
                        {
                            "key": "EDI",
                            "label": "Edilizia"
                        },
                        {
                            "key": "SPO",
                            "label": "Sport"
                        },
                        {
                            "key": "CAS",
                            "label": "Casa"
                        },
                        {
                            "key": "ILL",
                            "label": "Impianti e illuminazione"
                        },
                        {
                            "key": "GLO",
                            "label": "Global"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "5d321d32-1915-4502-8f74-1729310b16f9",
                    "name": "Tipologia Mobilità",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Tipologia Mobilità"
                        },
                        {
                            "culture": "en",
                            "label": "Type"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": "TPL",
                            "label": "TPL"
                        },
                        {
                            "key": "CIC",
                            "label": "Ciclabilità"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "679c4d7e-b258-495a-853d-288bc86784f1",
                    "name": "Test Array",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Tets array"
                        },
                        {
                            "culture": "en",
                            "label": "Tets array"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "Tets array"
                        },
                        {
                            "culture": "en",
                            "label": "Tets array"
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "Integer",
                    "isArray": true,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": 1,
                            "label": "A"
                        },
                        {
                            "key": 2,
                            "label": "b"
                        },
                        {
                            "key": 3,
                            "label": "c"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "17884d9d-e980-4f86-a06d-fc77c7006fcc",
            "name": "Informazioni Amministrative",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Informazioni Amministrative"
                },
                {
                    "culture": "en",
                    "label": "Information"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": null
                },
                {
                    "culture": "en",
                    "label": null
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "eda13842-a5f3-4775-9300-840eb00c233b",
                    "name": "Protocollo Generale",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Protocollo Generale"
                        },
                        {
                            "culture": "en",
                            "label": "Registration Number"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "Integer",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "b380bbb0-cb98-48b5-bd9b-231f49a840a3",
                    "name": "Link Provvedimenti",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Link Provvedimenti"
                        },
                        {
                            "culture": "en",
                            "label": "Link"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": true,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "611e8b01-4189-46ef-b19b-486f04b9383c",
            "name": "Informazioni Economiche",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Informazioni Economiche"
                },
                {
                    "culture": "en",
                    "label": "Information"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": null
                },
                {
                    "culture": "en",
                    "label": null
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "ab94523b-e173-4f62-a743-12e4c2862564",
                    "name": "Importo QE",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Importo QE"
                        },
                        {
                            "culture": "en",
                            "label": "Importo QE"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "Currency",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [
                        {
                            "type": "DecimalNumbersValidator",
                            "required": null,
                            "numOfDecimals": 2,
                            "number": null,
                            "date": null,
                            "include": null,
                            "length": null,
                            "dateValue": null,
                            "dateValueType": null,
                            "regex": null,
                            "extensions": []
                        }
                    ],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "6c9cf760-a91e-4eb0-b1c8-d33ad5fa6011",
                    "name": "Anno Piano Triennale",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Anno Piano Triennale"
                        },
                        {
                            "culture": "en",
                            "label": "Year"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "DateNoUtc",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "23251256-5af7-4a6e-89e2-1e9496b845d6",
            "name": "Informazioni Gruppo di Lavoro",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Informazioni Gruppo di Lavoro"
                },
                {
                    "culture": "en",
                    "label": "Team"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": null
                },
                {
                    "culture": "en",
                    "label": null
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "842cd418-4ed0-478d-a3cf-8a0d50b968c8",
                    "name": "Gdl",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Gdl"
                        },
                        {
                            "culture": "en",
                            "label": "Gdl"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": null,
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": true,
                    "children": [
                        {
                            "id": "f9eeda90-7f50-43c2-ad7c-ae9e66ce0cc6",
                            "name": "SmartPAUserId",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "SmartPAUserId"
                                },
                                {
                                    "culture": "en",
                                    "label": "SmartPAUserId"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": null
                                },
                                {
                                    "culture": "en",
                                    "label": null
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        },
                        {
                            "id": "ebeaf39a-1791-45b5-bd8d-d138be187048",
                            "name": "QualificationName",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "QualificationName"
                                },
                                {
                                    "culture": "en",
                                    "label": "QualificationName"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": null
                                },
                                {
                                    "culture": "en",
                                    "label": null
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        },
                        {
                            "id": "ada18d01-8d99-4e2a-92c5-44a7b750e657",
                            "name": "DisplayName",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "DisplayName"
                                },
                                {
                                    "culture": "en",
                                    "label": "DisplayName"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": null
                                },
                                {
                                    "culture": "en",
                                    "label": null
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        }
                    ],
                    "autocomplete": null,
                    "type": "Group",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "953531c9-bb88-44bd-9190-e699d7b3dcd5",
            "name": "Informazioni sul cantiere",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Informazioni sul cantiere"
                },
                {
                    "culture": "en",
                    "label": "Informazioni sul cantiere"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": null
                },
                {
                    "culture": "en",
                    "label": null
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "3bf55638-0e9f-4112-ad65-9789f71ca7fc",
                    "name": "Impresa affidataria",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Impresa affidataria"
                        },
                        {
                            "culture": "en",
                            "label": "Impresa affidataria"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": null,
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": false,
                    "children": [
                        {
                            "id": "ce7f2633-e0eb-40cc-a2bc-bb96e9cfc176",
                            "name": "Denominazione",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Denominazione"
                                },
                                {
                                    "culture": "en",
                                    "label": "Denominazione"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": null
                                },
                                {
                                    "culture": "en",
                                    "label": null
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        },
                        {
                            "id": "e80256c0-8b29-42ee-adc7-5f112b1dd173",
                            "name": "Partita IVA",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Partita IVA"
                                },
                                {
                                    "culture": "en",
                                    "label": "Partita IVA"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": null
                                },
                                {
                                    "culture": "en",
                                    "label": null
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        }
                    ],
                    "autocomplete": null,
                    "type": "Group",
                    "workflowFieldId": null
                },
                {
                    "id": "3f893047-5ed9-41fd-8b36-2afb7fbd4872",
                    "name": "Importo lavori",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Importo lavori"
                        },
                        {
                            "culture": "en",
                            "label": "Cost"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "Currency",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [
                        {
                            "type": "DecimalNumbersValidator",
                            "required": null,
                            "numOfDecimals": 2,
                            "number": null,
                            "date": null,
                            "include": null,
                            "length": null,
                            "dateValue": null,
                            "dateValueType": null,
                            "regex": null,
                            "extensions": []
                        }
                    ],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "9bfd8b7e-c300-4cb7-ade6-8f142b492d0b",
                    "name": "AQ",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "AQ"
                        },
                        {
                            "culture": "en",
                            "label": "AQ"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": null
                        },
                        {
                            "culture": "en",
                            "label": null
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "0ed02707-5094-4ad5-8353-f2c0e3bbde59",
            "name": "Sezione di prova ricorsività",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Sezione di prova ricorsività"
                },
                {
                    "culture": "en",
                    "label": "Sezione di prova ricorsività"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": "Sezione di prova ricorsività, Sezione di prova ricorsività"
                },
                {
                    "culture": "en",
                    "label": "Sezione di prova ricorsività, Sezione di prova ricorsività"
                }
            ],
            "hidden": false,
            "readonly": false,
            "fieldType": null,
            "isArray": false,
            "defaultValue": null,
            "validators": [],
            "items": [],
            "multiple": false,
            "children": [
                {
                    "id": "b3ca57dd-4cb8-4358-8cc9-0b8c8cc6af22",
                    "name": "Sezione di prova ricorsività 2",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Sezione di prova ricorsività 2"
                        },
                        {
                            "culture": "en",
                            "label": "Sezione di prova ricorsività 2"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "Sezione di prova ricorsività 2, Sezione di prova ricorsività 2"
                        },
                        {
                            "culture": "en",
                            "label": "Sezione di prova ricorsività 2, Sezione di prova ricorsività 2"
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": null,
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [],
                    "multiple": true,
                    "children": [
                        {
                            "id": "2c87c060-c67d-48fd-bb06-b8fd7f79b03f",
                            "name": "Campo di prova",
                            "searchable": true,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Campo di prova"
                                },
                                {
                                    "culture": "en",
                                    "label": "Campo di prova"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "Campo di prova, Campo di prova"
                                },
                                {
                                    "culture": "en",
                                    "label": "Campo di prova, Campo di prova"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        }
                    ],
                    "autocomplete": null,
                    "type": "Group",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        }
    ],
    "enabledIfRules": [],
    "dataProviders": [
        {
            "id": "743f6c78-51c6-4c5f-ade2-767dfce5cab7",
            "name": "Data providers",
            "type": "FillGroup",
            "dataProviderName": "Gdl",
            "inputs": [],
            "outputs": [
                {
                    "fieldId": "f9eeda90-7f50-43c2-ad7c-ae9e66ce0cc6",
                    "dataProviderFieldName": "smartPAUserId"
                },
                {
                    "fieldId": "ada18d01-8d99-4e2a-92c5-44a7b750e657",
                    "dataProviderFieldName": "displayName"
                },
                {
                    "fieldId": "ebeaf39a-1791-45b5-bd8d-d138be187048",
                    "dataProviderFieldName": "qualificationName"
                }
            ],
            "sectionChildId": "842cd418-4ed0-478d-a3cf-8a0d50b968c8"
        }
    ],
    "steps": [
        {
            "id": "fgggegwgwegwgegwe",
            "groupIds": [
                "9aa22aa4-527a-4c37-8bed-c7253fdaa330",
                "17884d9d-e980-4f86-a06d-fc77c7006fcc",
                "611e8b01-4189-46ef-b19b-486f04b9383c",
                "23251256-5af7-4a6e-89e2-1e9496b845d6",
                "953531c9-bb88-44bd-9190-e699d7b3dcd5",
                "0ed02707-5094-4ad5-8353-f2c0e3bbde59"
            ]
        }, {
            "id": "fgggegwe",
            "groupIds": [
                "9aa22aa4-527a-4c37-8bed-c7253fdaa330",
                "17884d9d-e980-4f86-a06d-fc77c7006fcc",
                "611e8b01-4189-46ef-b19b-486f04b9383c",
                "23251256-5af7-4a6e-89e2-1e9496b845d6",
                "953531c9-bb88-44bd-9190-e699d7b3dcd5",
                "0ed02707-5094-4ad5-8353-f2c0e3bbde59"
            ]
        }
    ],
    "name": "Template Lavori",
    "migrationType": "Disabled"
}
""";
