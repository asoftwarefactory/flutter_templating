const jsonTemplatePortico = """
{
    "id": "254",
    "groupId": "23",
    "createdAt": "2023-05-24T13:45:02.5954921Z",
    "isValid": true,
    "scopes": [
        "Portico"
    ],
    "names": [
        {
            "culture": "it",
            "label": "Portico"
        },
        {
            "culture": "en",
            "label": "Arcade"
        }
    ],
    "descriptions": [
        {
            "culture": "it",
            "label": "Descrizione Portico"
        },
        {
            "culture": "en",
            "label": "Arcade description"
        }
    ],
    "sections": [
        {
            "id": "3c0d9852-c60c-4fd0-9dd9-5f12b5c2c83e",
            "name": "Dimensioni generali",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Dimensioni"
                },
                {
                    "culture": "en",
                    "label": "Dimensioni"
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
                    "id": "bba2e3a8-67cd-4186-bfe1-672430463d56",
                    "name": "Altezza (cm)",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Altezza (cm)"
                        },
                        {
                            "culture": "en",
                            "label": "Altezza (cm)"
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
                    "id": "45896483-6c3e-4f13-8c5e-b8c0b75c2d2f",
                    "name": "Lunghezza (cm)",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Lunghezza (cm)"
                        },
                        {
                            "culture": "en",
                            "label": "Lunghezza (cm)"
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
                    "id": "8a7a44e9-4102-4b38-b1e4-836916135d53",
                    "name": "Superficie (mq)",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Superficie (mq)"
                        },
                        {
                            "culture": "en",
                            "label": "Superficie (mq)"
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
                    "id": "f26292b7-e9be-440f-b191-e22a6eacb774",
                    "name": "Test1",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Test1"
                        },
                        {
                            "culture": "en",
                            "label": "Test1"
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
                    "isArray": true,
                    "defaultValue": null,
                    "validators": [],
                    "items": [
                        {
                            "key": 1,
                            "label": "1 - uno"
                        },
                        {
                            "key": 2,
                            "label": "2 - due"
                        }
                    ],
                    "multiple": false,
                    "children": [],
                    "autocomplete": null,
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "9c47412f-56e2-4d16-8624-ef97572d6365",
                    "name": "field String autocomplete",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "field String autocomplete"
                        },
                        {
                            "culture": "en",
                            "label": "field String autocomplete"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "field String autocomplete"
                        },
                        {
                            "culture": "en",
                            "label": "field String autocomplete"
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
                    "autocomplete": {
                        "name": "Portico_Città",
                        "inputs": []
                    },
                    "type": "Field",
                    "workflowFieldId": null
                },
                {
                    "id": "9ea8e23b-6f82-427b-8d6a-b1b8c6a4ca6f",
                    "name": "field String autocomplete",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "field String autocomplete"
                        },
                        {
                            "culture": "en",
                            "label": "field String autocomplete"
                        }
                    ],
                    "descriptions": [
                        {
                            "culture": "it",
                            "label": "field String autocomplete"
                        },
                        {
                            "culture": "en",
                            "label": "field String autocomplete"
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
                    "autocomplete": {
                        "name": "Portico_Città_REgione",
                        "inputs": [
                            {
                                "fieldId": "0a313e8d-2627-46be-ba00-862fadb55597",
                                "autocompleteFieldName": "region"
                            }
                        ]
                    },
                    "type": "Field",
                    "workflowFieldId": null
                }
            ],
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "6940ad3e-c3e6-48b3-9489-b97b5148d85f",
            "name": "Struttura",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Struttura"
                },
                {
                    "culture": "en",
                    "label": "Structure"
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
                    "id": "b1908454-aff1-47a2-bcfc-543f5f835f5b",
                    "name": "Parete",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Parete"
                        },
                        {
                            "culture": "en",
                            "label": "Parete"
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
                            "id": "2f219df3-e1b9-4a0e-a470-39752bf0e587",
                            "name": "Superficie (mq)",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Superficie (mq)"
                                },
                                {
                                    "culture": "en",
                                    "label": "Superficie (mq)"
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
                            "id": "7bb6488f-4cc5-4192-a0b8-804009ddcf8d",
                            "name": "Colori parete",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Colori parete"
                                },
                                {
                                    "culture": "en",
                                    "label": "Colori parete"
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
                                    "id": "d15babf6-b25f-4cec-bfb4-742ccf6cf514",
                                    "name": "Colore",
                                    "searchable": false,
                                    "names": [
                                        {
                                            "culture": "it",
                                            "label": "Colore"
                                        },
                                        {
                                            "culture": "en",
                                            "label": "Colore"
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
                                }
                            ],
                            "autocomplete": null,
                            "type": "Group",
                            "workflowFieldId": null
                        },
                        {
                            "id": "fc5d7f7b-0ae9-4919-abea-da16b2d5acf3",
                            "name": "Supporti parete",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Supporti parete"
                                },
                                {
                                    "culture": "en",
                                    "label": "Supporti parete"
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
                                    "id": "c00ed910-9bca-4269-aef7-5ef5b6672fc4",
                                    "name": "Supporto",
                                    "searchable": false,
                                    "names": [
                                        {
                                            "culture": "it",
                                            "label": "Supporto"
                                        },
                                        {
                                            "culture": "en",
                                            "label": "Supporto"
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
                    "id": "9db9a457-a012-4e63-a5fd-49f79b03ef4b",
                    "name": "Pavimento",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Pavimento"
                        },
                        {
                            "culture": "en",
                            "label": "Floor"
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
                            "id": "a44c24cb-73f4-4719-99e8-5d8e8902c5e3",
                            "name": "Superficie (mq)",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Superficie (mq)"
                                },
                                {
                                    "culture": "en",
                                    "label": "Superficie (mq)"
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
                            "validators": [],
                            "items": [],
                            "multiple": false,
                            "children": [],
                            "autocomplete": null,
                            "type": "Field",
                            "workflowFieldId": null
                        },
                        {
                            "id": "bd90e4b7-2fca-426f-8778-e970be1d97c5",
                            "name": "Supporti pavimento",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Supporti parete"
                                },
                                {
                                    "culture": "en",
                                    "label": "Supporti pavimento"
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
                                    "id": "2de3495a-3cca-42fa-b2fc-28d564c2ad4e",
                                    "name": "Supporto",
                                    "searchable": false,
                                    "names": [
                                        {
                                            "culture": "it",
                                            "label": "Supporto"
                                        },
                                        {
                                            "culture": "en",
                                            "label": "Supporto"
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
                    "id": "ee398b49-c439-44eb-86cf-6287e498d5f9",
                    "name": "Soffitto",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Soffitto"
                        },
                        {
                            "culture": "en",
                            "label": "Soffitto"
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
                            "id": "af7e41ae-36ff-4235-a99b-42ba6cba7d26",
                            "name": "Supporti soffitto",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Supporti soffitto"
                                },
                                {
                                    "culture": "en",
                                    "label": "Supporti soffitto"
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
                                    "id": "52a18fb1-3a12-4f01-a4d0-ae9ff1746892",
                                    "name": "Supporto",
                                    "searchable": false,
                                    "names": [
                                        {
                                            "culture": "it",
                                            "label": "Supporto"
                                        },
                                        {
                                            "culture": "en",
                                            "label": "Supporto"
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
                                    "validators": [
  {
    "required": true,
    "type": "RequiredValidator"
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
                        },
                        {
                            "id": "20cec18b-0e6e-41d1-b429-203976841928",
                            "name": "Colori soffitto",
                            "searchable": false,
                            "names": [
                                {
                                    "culture": "it",
                                    "label": "Colori soffitto"
                                },
                                {
                                    "culture": "en",
                                    "label": "Colori soffitto"
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
                                    "id": "b5a1537a-622b-4ec3-addd-e93a5ff459bd",
                                    "name": "Colore",
                                    "searchable": false,
                                    "names": [
                                        {
                                            "culture": "it",
                                            "label": "Colore"
                                        },
                                        {
                                            "culture": "en",
                                            "label": "Colore"
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
            "autocomplete": null,
            "type": "Group",
            "workflowFieldId": null
        },
        {
            "id": "634479d0-796b-4c0b-bfa1-1a940b43d973",
            "name": "Immobile",
            "searchable": false,
            "names": [
                {
                    "culture": "it",
                    "label": "Immobile"
                },
                {
                    "culture": "en",
                    "label": "Building"
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
                    "id": "18f3eeb0-75e4-4ddf-a170-1f7dabe7e1f1",
                    "name": "Vincolo soprintendenza",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Vincolo soprintendenza"
                        },
                        {
                            "culture": "en",
                            "label": "Vincolo soprintendenza"
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
                    "fieldType": "Boolean",
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
                    "id": "f55474a1-82f0-4967-9f3d-97f537f43698",
                    "name": "Numero decreto vincolo",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Numero decreto vincolo"
                        },
                        {
                            "culture": "en",
                            "label": "Numero decreto vincolo"
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
                    "id": "d4597847-501b-448c-a4d3-c137b22d57a3",
                    "name": "Data decreto vincolo",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Data decreto vincolo"
                        },
                        {
                            "culture": "en",
                            "label": "Data decreto vincolo"
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
                },
                {
                    "id": "3b640b6b-6431-4f5c-8d9b-18a07caaa102",
                    "name": "Note",
                    "searchable": false,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Note"
                        },
                        {
                            "culture": "en",
                            "label": "Note"
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
                    "id": "0a313e8d-2627-46be-ba00-862fadb55597",
                    "name": "Nome proprietario",
                    "searchable": true,
                    "names": [
                        {
                            "culture": "it",
                            "label": "Nome proprietario"
                        },
                        {
                            "culture": "en",
                            "label": "Nome proprietario"
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
    "verticals": [
        {
            "id": "Test",
            "name": "prova",
            "fields": [
                {
                    "fieldId": "bba2e3a8-67cd-4186-bfe1-672430463d56",
                    "verticalFieldName": "Integer"
                },
                {
                    "fieldId": "b1908454-aff1-47a2-bcfc-543f5f835f5b",
                    "verticalFieldName": "Objects"
                },
                {
                    "fieldId": "2f219df3-e1b9-4a0e-a470-39752bf0e587",
                    "verticalFieldName": "Objects.Integer"
                },
                {
                    "fieldId": "7bb6488f-4cc5-4192-a0b8-804009ddcf8d",
                    "verticalFieldName": "Objects.Objects"
                },
                {
                    "fieldId": "d15babf6-b25f-4cec-bfb4-742ccf6cf514",
                    "verticalFieldName": "Objects.Objects.Integer"
                }
            ]
        }
    ],
    "enabledIfRules": [
        {
            "id": "7034fc92-1b5a-4c4d-ba0b-1f46574d432e",
            "name": "Regola sul vincolo",
            "conditions": [
                {
                    "fieldId": "18f3eeb0-75e4-4ddf-a170-1f7dabe7e1f1",
                    "constraint": "Equal",
                    "values": [
                        true
                    ]
                }
            ],
            "groupIds": [],
            "fieldIds": [
                "d4597847-501b-448c-a4d3-c137b22d57a3",
                "f55474a1-82f0-4967-9f3d-97f537f43698"
            ]
        },
        {
            "id": "445e0601-724d-4d24-a538-5f3c0b3161fa",
            "name": "Test1",
            "conditions": [
                {
                    "fieldId": "f55474a1-82f0-4967-9f3d-97f537f43698",
                    "constraint": "GreaterThan",
                    "values": [
                        1
                    ]
                }
            ],
            "groupIds": [],
            "fieldIds": [
                "f26292b7-e9be-440f-b191-e22a6eacb774"
            ]
        }
    ],
    "dataProviders": [
        {
            "id": "7547edff-a13e-46b7-8940-58f7f5c0ae92",
            "name": "dp supporti parete",
            "type": "Items",
            "dataProviderName": "Support",
            "inputs": [],
            "outputs": [
                {
                    "fieldId": "c00ed910-9bca-4269-aef7-5ef5b6672fc4",
                    "dataProviderFieldName": "Key"
                }
            ],
            "sectionChildId": "fc5d7f7b-0ae9-4919-abea-da16b2d5acf3"
        },
        {
            "id": "63d73c3c-21dc-4002-9882-476e963e5065",
            "name": "dp colori parete",
            "type": "Items",
            "dataProviderName": "Colors",
            "inputs": [],
            "outputs": [
                {
                    "fieldId": "d15babf6-b25f-4cec-bfb4-742ccf6cf514",
                    "dataProviderFieldName": "Key"
                }
            ],
            "sectionChildId": "7bb6488f-4cc5-4192-a0b8-804009ddcf8d"
        },
        {
            "id": "309c1d47-e8b9-4891-83eb-50f7307fd79b",
            "name": "dp supporti pavimento",
            "type": "Items",
            "dataProviderName": "Support",
            "inputs": [],
            "outputs": [
                {
                    "fieldId": "2de3495a-3cca-42fa-b2fc-28d564c2ad4e",
                    "dataProviderFieldName": "Key"
                }
            ],
            "sectionChildId": "bd90e4b7-2fca-426f-8778-e970be1d97c5"
        },
        {
            "id": "cda5373a-467c-41d8-864b-095f7dc7ffc6",
            "name": "test",
            "type": "FillGroup",
            "dataProviderName": "Cities",
            "inputs": [],
            "outputs": [
                {
                    "fieldId": "52a18fb1-3a12-4f01-a4d0-ae9ff1746892",
                    "dataProviderFieldName": "id"
                }
            ],
            "sectionChildId": "af7e41ae-36ff-4235-a99b-42ba6cba7d26"
        }
    ],
    "scoringRules": [],
    "steps": [
        {
            "groupIds": [
                "3c0d9852-c60c-4fd0-9dd9-5f12b5c2c83e",
                "6940ad3e-c3e6-48b3-9489-b97b5148d85f"
            ]
        },
        {
            "groupIds": [
                "634479d0-796b-4c0b-bfa1-1a940b43d973"
            ]
        }
    ],
    "name": "Portico",
    "migrationType": "Restrictive"
}
""";
