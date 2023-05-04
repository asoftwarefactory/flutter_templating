const jsonTemplate = """
{
    "id": "56",
    "groupId": "17",
    "createdAt": "2023-05-03T15:51:36.6542803Z",
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
                    "fieldType": "Decimal",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [
                        {
                            "type": "DecimalNumbersValidator",
                            "required": true,
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
                            "label": "FELPA"
                        },
                        {
                            "key": 2,
                            "label": "PANTALONE"
                        },
                        {
                            "key": 3,
                            "label": "SCARPE"
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
                },
                {
                    "id": "cf954f61-c9f1-43fc-a366-59ce9c93b8de",
                    "name": "test currency",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "test currency"
                        },
                        {
                            "culture": "en",
                            "label": "test currency"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "test currency"
                        },
                        {
                            "culture": "en",
                            "label": "test currency"
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
                    "id": "fbe2c855-93f3-4801-92da-c5e9aa286351",
                    "name": "test file",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "test file"
                        },
                        {
                            "culture": "en",
                            "label": "test file"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "test file"
                        },
                        {
                            "culture": "en",
                            "label": "test file"
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "File",
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
                    "id": "09e4cb53-cd48-4540-9d91-06d532facfba",
                    "name": "test boolean",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "test bool"
                        },
                        {
                            "culture": "en",
                            "label": "test bool"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "test bool"
                        },
                        {
                            "culture": "en",
                            "label": "test bool"
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "Boolean",
                    "isArray": false,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": true,
                            "label": "brtrh"
                        },
                        {
                            "key": true,
                            "label": "hrhrt"
                        },
                        {
                            "key": true,
                            "label": "hrthrthr"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "eda1c41f-7169-4dd7-8e10-c561d8937145",
                    "name": "test dropdown",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "test dropdown"
                        },
                        {
                            "culture": "en",
                            "label": "test dropdown"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "test dropdown"
                        },
                        {
                            "culture": "en",
                            "label": "test dropdown"
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
                            "key": "frrr",
                            "label": "frfrfr"
                        },
                        {
                            "key": "ffrfrf",
                            "label": "frfrfrfr"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "03d007af-f9bb-41dd-b319-fabd4a3daa39",
                    "name": "test array string",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "test array string"
                        },
                        {
                            "culture": "en",
                            "label": "test array string"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "test array string"
                        },
                        {
                            "culture": "en",
                            "label": "test array string"
                        }
                    ],
                    "hidden": false,
                    "readonly": false,
                    "fieldType": "String",
                    "isArray": true,
                    "defaultValue": null,
                    "validators": [
                        {
                            "type": "MinimumItemsValidator",
                            "required": true,
                            "numOfDecimals": null,
                            "number": null,
                            "date": null,
                            "include": null,
                            "length": 1,
                            "dateValue": null,
                            "dateValueType": null,
                            "regex": null,
                            "extensions": []
                        },
                        {
                            "type": "MaximumItemsValidator",
                            "required": null,
                            "numOfDecimals": null,
                            "number": null,
                            "date": null,
                            "include": null,
                            "length": 3,
                            "dateValue": null,
                            "dateValueType": null,
                            "regex": null,
                            "extensions": []
                        }
                    ],
                    "items": [
                        {
                            "key": "drop1",
                            "label": "test array string"
                        },
                        {
                            "key": "drop2",
                            "label": "test array string"
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
            "id": "c6e0a38f-a155-42d2-834c-0720f4834b26",
            "name": "Sezione Prova Fields",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Sezione Prova Fields"
                },
                {
                    "culture": "en",
                    "label": "Sezione Prova Fields"
                }
            ],
            "descriptions": [
                {
                    "culture": "it",
                    "label": "Sezione Prova Fields"
                },
                {
                    "culture": "en",
                    "label": "Sezione Prova Fields"
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
                    "id": "00a862ec-7cff-4dfb-9bf4-b07d9c4e301a",
                    "name": "fields",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "fields"
                        },
                        {
                            "culture": "en",
                            "label": "fields"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "fields"
                        },
                        {
                            "culture": "en",
                            "label": "fields"
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
                            "id": "32b5c131-989c-4a8d-859c-5720f2e45c17",
                            "name": "String",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "String"
                                },
                                {
                                    "culture": "en",
                                    "label": "String"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "String"
                                },
                                {
                                    "culture": "en",
                                    "label": "String"
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
                        },
                        {
                            "id": "70888464-8cc2-4ce7-8ec2-bba7b1b63777",
                            "name": "Boolean",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Boolean"
                                },
                                {
                                    "culture": "en",
                                    "label": "Boolean"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "Boolean"
                                },
                                {
                                    "culture": "en",
                                    "label": "Boolean"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "Boolean",
                            "isArray": true,
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
                            "id": "f88d3052-02d9-4e13-9388-9859c7c400b9",
                            "name": "file",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "file"
                                },
                                {
                                    "culture": "en",
                                    "label": "file"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "file"
                                },
                                {
                                    "culture": "en",
                                    "label": "file"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "File",
                            "isArray": true,
                            "defaultValue": null,
                            "validators": [
                                {
                                    "type": "MinimumItemsValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 2,
                                    "dateValue": null,
                                    "dateValueType": null,
                                    "regex": null,
                                    "extensions": []
                                },
                                {
                                    "type": "MaximumItemsValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 5,
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
                            "id": "0f267258-39ed-4194-a12e-945f49cd5fb0",
                            "name": "datetime",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "datetime"
                                },
                                {
                                    "culture": "en",
                                    "label": "datetime"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "datetime"
                                },
                                {
                                    "culture": "en",
                                    "label": "datetime"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "DateTime",
                            "isArray": true,
                            "defaultValue": null,
                            "validators": [
                                {
                                    "type": "MinimumItemsValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 2,
                                    "dateValue": null,
                                    "dateValueType": null,
                                    "regex": null,
                                    "extensions": []
                                },
                                {
                                    "type": "MaximumItemsValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 5,
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
                            "id": "b9e03c90-9993-468d-be70-f4ab0ec5f4bd",
                            "name": "dateTime",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "dateTime"
                                },
                                {
                                    "culture": "en",
                                    "label": "dateTime"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "dateTime"
                                },
                                {
                                    "culture": "en",
                                    "label": "dateTime"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "DateTime",
                            "isArray": true,
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
                            "id": "11d55b16-b7f7-4edc-94e5-003d61027ff5",
                            "name": "test validatori",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "test validatori"
                                },
                                {
                                    "culture": "en",
                                    "label": "test validatori"
                                }
                            ],
                            "descriptions": [
                                {
                                    "culture": "it",
                                    "label": "test validatori"
                                },
                                {
                                    "culture": "en",
                                    "label": "test validatori"
                                }
                            ],
                            "hidden": false,
                            "readonly": false,
                            "fieldType": "String",
                            "isArray": false,
                            "defaultValue": null,
                            "validators": [
                                {
                                    "type": "RequiredValidator",
                                    "required": true,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": null,
                                    "dateValue": null,
                                    "dateValueType": null,
                                    "regex": null,
                                    "extensions": []
                                },
                                {
                                    "type": "MinimumLengthValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 3,
                                    "dateValue": null,
                                    "dateValueType": null,
                                    "regex": null,
                                    "extensions": []
                                },
                                {
                                    "type": "MaximumLengthValidator",
                                    "required": null,
                                    "numOfDecimals": null,
                                    "number": null,
                                    "date": null,
                                    "include": null,
                                    "length": 5,
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
            "groupIds": [
                "953531c9-bb88-44bd-9190-e699d7b3dcd5",
                "0ed02707-5094-4ad5-8353-f2c0e3bbde59"
            ]
        },
        {
            "groupIds": [
                "611e8b01-4189-46ef-b19b-486f04b9383c",
                "23251256-5af7-4a6e-89e2-1e9496b845d6",
                "9aa22aa4-527a-4c37-8bed-c7253fdaa330"
            ]
        },
        {
            "groupIds": [
                "17884d9d-e980-4f86-a06d-fc77c7006fcc",
                "c6e0a38f-a155-42d2-834c-0720f4834b26"
            ]
        }
    ],
    "name": "Template Lavori",
    "migrationType": "Disabled"
}
""";