{
    "uuid": "ed31dd6f-8352-44c0-9bc9-04e4393f93bd",
    "domains": [
        {
            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
            "description": "",
            "name": "Бинарный ответ",
            "values": [
                "Да",
                "Нет"
            ]
        },
        {
            "uuid": "8463c59e-50dc-4805-a982-3955b96e7f35",
            "description": "",
            "name": "Направление веб разработки",
            "values": [
                "Фронтенд",
                "Бэкенд"
            ]
        },
        {
            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
            "description": "",
            "name": "Направления разработки",
            "values": [
                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "МОБИЛЬНЫЕ ИГРЫ",
                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                "ДЕСКТОПНЫЕ ИГРЫ",
                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
            ]
        }
    ],
    "rules": [
        {
            "uuid": "1a9cc92a-fc0d-4cc4-8ffa-9cbd950f8fc5",
            "conditions": [
                {
                    "uuid": "f885f7d7-e813-4753-beff-5acf5209a772",
                    "value": "Да",
                    "variable": {
                        "uuid": "aacc2756-b8a5-477d-bcf7-98af1efa0006",
                        "description": "ОПЫТ В ВЕБ-РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webexp",
                        "question": "У вас есть опыт в веб разработке?",
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "bea3811d-03b8-45cc-9669-426dcd9c27d7",
                    "value": "Фронтенд",
                    "variable": {
                        "uuid": "4d216fd6-3a39-4cf9-a7b7-ee32723a2c52",
                        "description": "ОБЛАСТЬ ВЕБ-РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "8463c59e-50dc-4805-a982-3955b96e7f35",
                            "description": "",
                            "name": "Направление веб разработки",
                            "values": [
                                "Фронтенд",
                                "Бэкенд"
                            ]
                        },
                        "name": "webarea",
                        "question": "В какой области веб-разработки вы участвовали?",
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБ-РАЗРАБОТКЕ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ В ФРОНТЕНДЕ",
            "name": "R1",
            "results": [
                {
                    "uuid": "12f6d5b8-7e47-4907-b018-e86b587ece25",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "51ff998d-f781-479d-87d9-51304867dcce",
            "conditions": [
                {
                    "uuid": "3ee1ecac-2523-4170-805b-79866f30acdd",
                    "value": "Да",
                    "variable": {
                        "uuid": "aacc2756-b8a5-477d-bcf7-98af1efa0006",
                        "description": "ОПЫТ В ВЕБ-РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webexp",
                        "question": "У вас есть опыт в веб разработке?",
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "95bf076e-e4c3-406a-a321-165ff1821106",
                    "value": "Бэкенд",
                    "variable": {
                        "uuid": "4d216fd6-3a39-4cf9-a7b7-ee32723a2c52",
                        "description": "ОБЛАСТЬ ВЕБ-РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "8463c59e-50dc-4805-a982-3955b96e7f35",
                            "description": "",
                            "name": "Направление веб разработки",
                            "values": [
                                "Фронтенд",
                                "Бэкенд"
                            ]
                        },
                        "name": "webarea",
                        "question": "В какой области веб-разработки вы участвовали?",
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "25fe2a7e-d406-4768-8ebb-52cacd1d7577",
                    "value": "Да",
                    "variable": {
                        "uuid": "f5e9a489-1653-4c0f-a78a-edec8bdff7cf",
                        "description": "ОПЫТ РАБОТЫ С СУБД",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dbmsexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБ-РАЗРАБОТКЕ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ В БЭКЕНДЕ И СУБД",
            "name": "R2",
            "results": [
                {
                    "uuid": "d229d350-208f-482d-8900-d243b04ff8fd",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "69e7576c-9717-445e-be71-3cfc191e0300",
            "conditions": [
                {
                    "uuid": "e56ee7b6-1688-4555-a28a-3fb26bd13a6f",
                    "value": "Да",
                    "variable": {
                        "uuid": "aacc2756-b8a5-477d-bcf7-98af1efa0006",
                        "description": "ОПЫТ В ВЕБ-РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webexp",
                        "question": "У вас есть опыт в веб разработке?",
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "47069493-6e26-4dad-8559-26392dc536c9",
                    "value": "Бэкенд",
                    "variable": {
                        "uuid": "4d216fd6-3a39-4cf9-a7b7-ee32723a2c52",
                        "description": "ОБЛАСТЬ ВЕБ-РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "8463c59e-50dc-4805-a982-3955b96e7f35",
                            "description": "",
                            "name": "Направление веб разработки",
                            "values": [
                                "Фронтенд",
                                "Бэкенд"
                            ]
                        },
                        "name": "webarea",
                        "question": "В какой области веб-разработки вы участвовали?",
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "8d299f1b-dd80-4fe9-87b3-09f96c38e69d",
                    "value": "Нет",
                    "variable": {
                        "uuid": "f5e9a489-1653-4c0f-a78a-edec8bdff7cf",
                        "description": "ОПЫТ РАБОТЫ С СУБД",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dbmsexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВЕБ-РАЗРАБОТКЕ, ЕСЛИ ЕСТЬ ОПЫТ РАБОТЫ С БЭКЕНДОМ, НО НЕТ С СУБД",
            "name": "R3",
            "results": [
                {
                    "uuid": "292e9926-ac00-461c-b2aa-a78cb71f4c81",
                    "value": "Нет",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "f517b22f-4c63-435b-9064-c0b8ad08ec17",
            "conditions": [
                {
                    "uuid": "77a8fe7c-60bf-4d20-9cf0-2e5c76fc9390",
                    "value": "Нет",
                    "variable": {
                        "uuid": "aacc2756-b8a5-477d-bcf7-98af1efa0006",
                        "description": "ОПЫТ В ВЕБ-РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webexp",
                        "question": "У вас есть опыт в веб разработке?",
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВЕБ-РАЗРАБОТКЕ, ЕСЛИ У НЕГО НЕТ ОПЫТА ВЕБ-РАЗРАБОТКИ",
            "name": "R4",
            "results": [
                {
                    "uuid": "95616394-51b8-4f33-95bf-9788b1db3c80",
                    "value": "Нет",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "39791b1a-c293-4114-a17f-0e445e2798c4",
            "conditions": [
                {
                    "uuid": "6daad269-cef9-45b5-9ff3-b9a345be49dc",
                    "value": "Да",
                    "variable": {
                        "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
                        "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mathslv",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "c2866280-3f2b-4860-9a2b-df1036143e0f",
                    "value": "Да",
                    "variable": {
                        "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
                        "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "readart",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "e54dff33-0b1f-4bd9-be48-f7cae4b67cd8",
                    "value": "Да",
                    "variable": {
                        "uuid": "e3f81275-72fe-4cc5-92d7-f155d2226fd4",
                        "description": "НАПИСАНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "wroteart",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НАУЧНЫЙ СКЛАД УМА, ЕСЛИ ОН РЕШАЕТ ЗАДАЧИ, А ТАКЖЕ ЧИТАЕТ И ПИШЕТ НАУЧНЫЕ СТАТЬИ",
            "name": "R5",
            "results": [
                {
                    "uuid": "b23fa2a1-cf3c-4db4-88f1-7b5852595af7",
                    "value": "Да",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "d8affbd7-a496-46e6-a15f-4ee8733976c9",
            "conditions": [
                {
                    "uuid": "5c05426e-be10-4434-8d15-38221823c502",
                    "value": "Да",
                    "variable": {
                        "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
                        "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mathslv",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "b8295cb7-3960-4bea-b3c3-2561fb10115f",
                    "value": "Да",
                    "variable": {
                        "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
                        "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "readart",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "b79bfad1-0051-4f93-a9a6-7dea2a65f7b8",
                    "value": "Нет",
                    "variable": {
                        "uuid": "e3f81275-72fe-4cc5-92d7-f155d2226fd4",
                        "description": "НАПИСАНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "wroteart",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ НАУЧНОГО СКЛАДА УМА, ЕСЛИ ОН РЕШАЕТ ЗАДАЧИ, А ТАКЖЕ ЧИТАЕТ НАУЧНЫЕ СТАТЬИ, НО НЕ ПИШЕТ ИХ",
            "name": "R6",
            "results": [
                {
                    "uuid": "0f992f2d-b813-48f9-bc05-d301a1cd93a6",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "3bd5ed28-c058-4f0b-8182-09cc34475f8c",
            "conditions": [
                {
                    "uuid": "be7cf1f9-5908-4266-955d-ffd398342530",
                    "value": "Да",
                    "variable": {
                        "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
                        "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mathslv",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "e05de855-c78b-4284-b266-7a14f512ef71",
                    "value": "Нет",
                    "variable": {
                        "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
                        "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "readart",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ НАУЧНОГО СКЛАДА УМА, ЕСЛИ ОН РЕШАЕТ ЗАДАЧИ, НО НЕ ЧИТАЕТ НАУЧНЫЕ СТАТЬИ",
            "name": "R7",
            "results": [
                {
                    "uuid": "6a261b3a-850d-4c4b-b233-2822d901e9ff",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "8e97924f-a81a-4123-878a-17bf35bbda00",
            "conditions": [
                {
                    "uuid": "ab6b31f7-6f9f-43fb-8fc7-a866874d6d8a",
                    "value": "Нет",
                    "variable": {
                        "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
                        "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mathslv",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "10cef052-e258-407f-a0f0-186deeafbbb3",
                    "value": "Да",
                    "variable": {
                        "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
                        "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "readart",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ НАУЧНОГО СКЛАДА УМА, ЕСЛИ ОН НЕ РЕШАЕТ ЗАДАЧИ, НО ЧИТАЕТ НАУЧНЫЕ СТАТЬИ",
            "name": "R8",
            "results": [
                {
                    "uuid": "81e55124-0688-4386-9180-e80a6f4916ee",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "eeac1495-df81-4b96-adcf-4b7c14022adc",
            "conditions": [
                {
                    "uuid": "98bab48e-1800-4f20-a469-a58050645b79",
                    "value": "Нет",
                    "variable": {
                        "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
                        "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mathslv",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "efd53b2e-1d75-4631-be88-59268b7c623f",
                    "value": "Нет",
                    "variable": {
                        "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
                        "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "readart",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ НАУЧНОГО СКЛАДА УМА, ЕСЛИ ОН НЕ РЕШАЕТ ЗАДАЧИ И НЕ ЧИТАЕТ НАУЧНЫЕ СТАТЬИ",
            "name": "R9",
            "results": [
                {
                    "uuid": "79b1097d-2e3b-4805-98d8-e43179f14e53",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "ee9c0d3d-105d-4fd5-8023-d55a355231a6",
            "conditions": [
                {
                    "uuid": "e21d9b86-e2cc-4d75-81a1-dc68fd406a9b",
                    "value": "Да",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "d751ca5f-b85e-4c51-a910-5ca994625e71",
                    "value": "Да",
                    "variable": {
                        "uuid": "71584644-4e6a-4094-b8e4-c93f3798ac7e",
                        "description": "РЕАЛИЗАЦИЯ АЛГОРИТМОВ МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlalg",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К МО, ЕСЛИ У НЕГО НАУЧНЫЙ СКЛАД УМА И ЕСТЬ ОПЫТ В НАПИСАНИИ АЛГОРИТМОВ МО",
            "name": "R10",
            "results": [
                {
                    "uuid": "b89c2e50-076f-429b-947c-157f76652310",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "94f150a5-ca6a-4a7d-9fb9-c2f49c8d5c79",
            "conditions": [
                {
                    "uuid": "2a2ddbe5-c6a2-4a3d-8c64-ee23d6864b6c",
                    "value": "Да",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "96fc6913-2495-4004-99cd-0cf38d2b1495",
                    "value": "Нет",
                    "variable": {
                        "uuid": "71584644-4e6a-4094-b8e4-c93f3798ac7e",
                        "description": "РЕАЛИЗАЦИЯ АЛГОРИТМОВ МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlalg",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К МО, ЕСЛИ У НЕГО НАУЧНЫЙ СКЛАД УМА, НО НЕТ ОПЫТА В НАПИСАНИИ АЛГОРИТМОВ МО",
            "name": "R11",
            "results": [
                {
                    "uuid": "2ed5f39b-fd77-4102-956e-2210f375d607",
                    "value": "Нет",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "f3f93294-c641-4d29-84e6-19e7b26344a6",
            "conditions": [
                {
                    "uuid": "9c198e7c-8698-4254-8625-fb931905e88c",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "657c32d7-ef19-4608-9a78-381853f297a5",
                    "value": "Да",
                    "variable": {
                        "uuid": "71584644-4e6a-4094-b8e4-c93f3798ac7e",
                        "description": "РЕАЛИЗАЦИЯ АЛГОРИТМОВ МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlalg",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К МО, ЕСЛИ У НЕГО НЕТ НАУЧНОГО СКЛАДА УМА, НО ЕСТЬ ОПЫТ В НАПИСАНИИ АЛГОРИТМОВ МО",
            "name": "R12",
            "results": [
                {
                    "uuid": "1187a6cf-57a5-48fc-b536-757acf8b565b",
                    "value": "Нет",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "8edfbd9d-6dca-425d-a7e5-3a5496ae212a",
            "conditions": [
                {
                    "uuid": "ae89134b-57a1-4eb6-baf2-5231dc424f03",
                    "value": "Нет",
                    "variable": {
                        "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
                        "description": "НАУЧНЫЙ СКЛАД УМА",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "scimind",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "5c04fb30-f89f-445c-8ad7-7bb38a0c9ed2",
                    "value": "Нет",
                    "variable": {
                        "uuid": "71584644-4e6a-4094-b8e4-c93f3798ac7e",
                        "description": "РЕАЛИЗАЦИЯ АЛГОРИТМОВ МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlalg",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К МО, ЕСЛИ У НЕГО НЕТ НАУЧНОГО СКЛАДА УМА И ОПЫТА В НАПИСАНИИ АЛГОРИТМОВ МО",
            "name": "R13",
            "results": [
                {
                    "uuid": "689b2bae-0076-4b36-bc14-a8c100fdc921",
                    "value": "Нет",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "89323d38-d977-43cf-91ef-401214e4b1a7",
            "conditions": [
                {
                    "uuid": "6083e1dd-1d2c-46a6-8e1d-649d44c61e30",
                    "value": "Да",
                    "variable": {
                        "uuid": "ed03bd1c-dcdf-42df-a72f-224b9ab9798d",
                        "description": "ОПЫТ КОМПЬЮТЕРНЫХ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "d35155a4-6eb3-44e5-be01-682d4aacf3f1",
                    "value": "Да",
                    "variable": {
                        "uuid": "2b665353-eaa2-4a21-bc57-97faca913903",
                        "description": "ИДЕИ ПО УЛУЧШЕНИЮ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameids",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "c12779a9-2da1-45b2-8589-af8d8f8ed46f",
                    "value": "Да",
                    "variable": {
                        "uuid": "31374101-2a20-4f04-8a77-6024b69ba5e1",
                        "description": "ОТНОШЕНИЕ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visual",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ ИГРЫ НА КОМЬЮТЕРЕ, А ТАКЖЕ ИДЕИ ПО УЛУЧШЕНИЮ ИГР И ЛЮБОВЬ К ВИЗУАЛИЗАЦИИ",
            "name": "R14",
            "results": [
                {
                    "uuid": "90a8fea5-0175-4d77-8b63-c7dc9456be33",
                    "value": "Да",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "69905c0a-365c-41e0-9898-f22f6396a185",
            "conditions": [
                {
                    "uuid": "85b2b1f1-0b23-4383-b000-14b4a988fb4a",
                    "value": "Да",
                    "variable": {
                        "uuid": "ed03bd1c-dcdf-42df-a72f-224b9ab9798d",
                        "description": "ОПЫТ КОМПЬЮТЕРНЫХ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "89799d33-f5fa-497c-9eb5-32ddc8303cda",
                    "value": "Да",
                    "variable": {
                        "uuid": "2b665353-eaa2-4a21-bc57-97faca913903",
                        "description": "ИДЕИ ПО УЛУЧШЕНИЮ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameids",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "ffde9671-ee1e-480b-a41d-fe0d98fc801f",
                    "value": "Нет",
                    "variable": {
                        "uuid": "31374101-2a20-4f04-8a77-6024b69ba5e1",
                        "description": "ОТНОШЕНИЕ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visual",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВИЗУАЛИЗАЦИИ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ ИГРЫ НА КОМЬЮТЕРЕ, А ТАКЖЕ ИДЕИ ПО УЛУЧШЕНИЮ ИГР, НО НЕТ ЛЮБВИ К ВИЗУАЛИЗАЦИИ",
            "name": "R15",
            "results": [
                {
                    "uuid": "5eb38ee7-aa42-4ab2-b9e8-d08d425646a3",
                    "value": "Нет",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "85cb2785-4769-46a1-97c2-4d98ae6b47b6",
            "conditions": [
                {
                    "uuid": "2fe08459-3974-4754-8528-ad3a12c82cb7",
                    "value": "Да",
                    "variable": {
                        "uuid": "ed03bd1c-dcdf-42df-a72f-224b9ab9798d",
                        "description": "ОПЫТ КОМПЬЮТЕРНЫХ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "f13a1507-ca67-4134-b04b-08c9201685b9",
                    "value": "Нет",
                    "variable": {
                        "uuid": "2b665353-eaa2-4a21-bc57-97faca913903",
                        "description": "ИДЕИ ПО УЛУЧШЕНИЮ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameids",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВИЗУАЛИЗАЦИИ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ ИГРЫ НА КОМЬЮТЕРЕ, НО НЕТ ИДЕЙ ПО УЛУЧШЕНИЮ ИГР",
            "name": "R16",
            "results": [
                {
                    "uuid": "d2fb720b-92bb-4a32-91dc-5ea664b1024d",
                    "value": "Нет",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "c7fef51a-77e6-4c47-a920-3451d957e2fc",
            "conditions": [
                {
                    "uuid": "c193ca33-5f8d-4f9f-a518-f57f7423c571",
                    "value": "Нет",
                    "variable": {
                        "uuid": "ed03bd1c-dcdf-42df-a72f-224b9ab9798d",
                        "description": "ОПЫТ КОМПЬЮТЕРНЫХ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВИЗУАЛИЗАЦИИ, ЕСЛИ ОН НИКОГДА НЕ ИГРАЛ В КОМПЬЮТЕРНЫЕ ИГРЫ",
            "name": "R17",
            "results": [
                {
                    "uuid": "1f1502cc-7aa8-4b69-b8ae-248de56f1197",
                    "value": "Нет",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "e81866a5-f794-45d7-90d8-f6fbcc326bbf",
            "conditions": [
                {
                    "uuid": "5baaf90c-7f91-4124-85ee-b17d2328b8ff",
                    "value": "Да",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "8d9e5f4d-9a46-4f69-a3e6-b7296b250038",
                    "value": "Да",
                    "variable": {
                        "uuid": "40b8e574-92a1-429b-84e7-158f9c274782",
                        "description": "ОПЫТ РАБОТЫ С ИГРОВЫМ ДВИЖКОМ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "engexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР, ЕСЛИ У НЕГО ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ И ОПЫТ РАБОТЫ С ДВИЖКОМ",
            "name": "R18",
            "results": [
                {
                    "uuid": "0f9adfe6-0d2b-435a-94e8-c5012d708bf4",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "87304e8e-20d4-45ba-b8da-682c99772229",
            "conditions": [
                {
                    "uuid": "521a1e15-1837-40c2-910f-eb1f639fcea4",
                    "value": "Да",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "4c93f243-acef-401d-9a40-df7d424986bb",
                    "value": "Нет",
                    "variable": {
                        "uuid": "40b8e574-92a1-429b-84e7-158f9c274782",
                        "description": "ОПЫТ РАБОТЫ С ИГРОВЫМ ДВИЖКОМ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "engexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К РАЗРАБОТКЕ ИГР, ЕСЛИ У НЕГО ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ, НО НЕТ ОПЫТА РАБОТЫ С ДВИЖКОМ",
            "name": "R19",
            "results": [
                {
                    "uuid": "c32920dc-d28d-43a7-b654-430c0e9a4001",
                    "value": "Нет",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "2356594c-5075-4499-87d8-2dfc7e2f47e4",
            "conditions": [
                {
                    "uuid": "a38280ed-fbbf-4425-8cd2-9124c0cb3c39",
                    "value": "Нет",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "e94565ec-5fb4-49df-9ed4-4098a25e31aa",
                    "value": "Да",
                    "variable": {
                        "uuid": "40b8e574-92a1-429b-84e7-158f9c274782",
                        "description": "ОПЫТ РАБОТЫ С ИГРОВЫМ ДВИЖКОМ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "engexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К РАЗРАБОТКЕ ИГР, ЕСЛИ У НЕГО НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВИЗУАЛИЗАЦИИ, НО ЕСТЬ ОПЫТ РАБОТЫ С ДВИЖКОМ",
            "name": "R20",
            "results": [
                {
                    "uuid": "3e82478c-35f0-4447-b081-171dd9e23d5f",
                    "value": "Нет",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "1adfdf53-b248-4a94-bbab-d6b16c27bbd6",
            "conditions": [
                {
                    "uuid": "51a86155-1f54-41e2-83a2-4e33c32b76ba",
                    "value": "Нет",
                    "variable": {
                        "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "visaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "8e2d8e14-e283-4571-ac5d-a13e477ef3f3",
                    "value": "Нет",
                    "variable": {
                        "uuid": "40b8e574-92a1-429b-84e7-158f9c274782",
                        "description": "ОПЫТ РАБОТЫ С ИГРОВЫМ ДВИЖКОМ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "engexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К РАЗРАБОТКЕ ИГР, ЕСЛИ У НЕГО НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ВИЗУАЛИЗАЦИИ И ОПЫТА РАБОТЫ С ДВИЖКОМ",
            "name": "R21",
            "results": [
                {
                    "uuid": "5d4a23f5-a002-40d3-8a0b-6bbc28910846",
                    "value": "Нет",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "233e3abe-6c5e-4347-9da6-73772b76d501",
            "conditions": [
                {
                    "uuid": "774b8517-d3e2-4173-8b16-193578b86e88",
                    "value": "Да",
                    "variable": {
                        "uuid": "670b2113-d617-4158-9c89-7aad8e5bbb4a",
                        "description": "ОПЫТ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "0ca2d021-fe0b-4319-b25e-35b073c726bb",
                    "value": "Да",
                    "variable": {
                        "uuid": "b7b9ad92-e8d1-4b7a-8b9e-ca46c5c560b0",
                        "description": "ОПЫТ РАБОТЫ С ФРЕЙМВОРКАМИ ДЛЯ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtfram",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА ПРЕДРАСПОЛОЖЕННОСТЬ К ДЕСКТОПНОЙ РАЗРАБОТКЕ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ РАЗРАБОТКИ И ЗНАНИЕ ФРЕЙМВОРКОВ",
            "name": "R22",
            "results": [
                {
                    "uuid": "13c73103-5fce-4bb4-a8c9-5d54770a0072",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "52f26e87-11ae-4914-b3fc-3f15f4485ea5",
            "conditions": [
                {
                    "uuid": "ab668f38-9f60-468c-8d62-1d1fc747af60",
                    "value": "Да",
                    "variable": {
                        "uuid": "670b2113-d617-4158-9c89-7aad8e5bbb4a",
                        "description": "ОПЫТ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "af00812c-953c-4092-8e6b-8bb30503bdea",
                    "value": "Нет",
                    "variable": {
                        "uuid": "b7b9ad92-e8d1-4b7a-8b9e-ca46c5c560b0",
                        "description": "ОПЫТ РАБОТЫ С ФРЕЙМВОРКАМИ ДЛЯ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtfram",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ДЕСКТОПНОЙ РАЗРАБОТКЕ, ЕСЛИ У НЕГО ЕСТЬ ОПЫТ РАЗРАБОТКИ, НО НЕТ ЗНАНИЯ ФРЕЙМВОРКОВ",
            "name": "R23",
            "results": [
                {
                    "uuid": "9e8fa6d4-0de9-4631-8eb1-eb0d4dd29ac3",
                    "value": "Нет",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "c7802934-5617-4668-960a-cb0cf26cd769",
            "conditions": [
                {
                    "uuid": "944c5d59-2c88-4070-b762-bea3d147c29e",
                    "value": "Нет",
                    "variable": {
                        "uuid": "670b2113-d617-4158-9c89-7aad8e5bbb4a",
                        "description": "ОПЫТ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "6633c924-284a-47ae-8a76-3cf0e1aa0e7f",
                    "value": "Да",
                    "variable": {
                        "uuid": "b7b9ad92-e8d1-4b7a-8b9e-ca46c5c560b0",
                        "description": "ОПЫТ РАБОТЫ С ФРЕЙМВОРКАМИ ДЛЯ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtfram",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ДЕСКТОПНОЙ РАЗРАБОТКЕ, ЕСЛИ У НЕГО НЕТ ОПЫТА РАЗРАБОТКИ, НО ЕСТЬ ЗНАНИЕ ФРЕЙМВОРКОВ",
            "name": "R24",
            "results": [
                {
                    "uuid": "20827145-579a-431b-a296-55c9c1e98026",
                    "value": "Нет",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "509ce655-6d78-4622-b370-0d9efcdaa605",
            "conditions": [
                {
                    "uuid": "42be6c75-0400-403e-a9b4-61af95890a42",
                    "value": "Нет",
                    "variable": {
                        "uuid": "670b2113-d617-4158-9c89-7aad8e5bbb4a",
                        "description": "ОПЫТ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtexp",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "e287b6a8-300f-41cd-9fb1-df91ec2f446c",
                    "value": "Нет",
                    "variable": {
                        "uuid": "b7b9ad92-e8d1-4b7a-8b9e-ca46c5c560b0",
                        "description": "ОПЫТ РАБОТЫ С ФРЕЙМВОРКАМИ ДЛЯ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtfram",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "У ЧЕЛОВЕКА НЕТ ПРЕДРАСПОЛОЖЕННОСТИ К ДЕСКТОПНОЙ РАЗРАБОТКЕ, ЕСЛИ У НЕГО НЕТ ОПЫТА РАЗРАБОТКИ И ЗНАНИЯ ФРЕЙМВОРКОВ",
            "name": "R25",
            "results": [
                {
                    "uuid": "38571b5a-fe25-4303-a0f1-ac60dd1f1b05",
                    "value": "Нет",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "007cce0a-4e43-4a88-a9d6-7a9dfb322a4b",
            "conditions": [
                {
                    "uuid": "ec6476db-7794-4658-ab10-eaa893e823ec",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "e19c8019-7f6a-4d06-a60e-afd6a9b8331b",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ ВЕБ + МО",
            "name": "R26",
            "results": [
                {
                    "uuid": "766499bb-8854-4dad-8237-dd45e066de33",
                    "value": "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "587dae94-9866-46b5-ae5e-bf05a44ecc3f",
            "conditions": [
                {
                    "uuid": "612d079f-8db9-438b-92e8-5fdacf409966",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "0fc3854e-2a9a-449b-8272-251358c8ebc4",
                    "value": "Да",
                    "variable": {
                        "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mobaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ ВЕБ + МОБИЛЬНАЯ РАЗРАБОТКА",
            "name": "R27",
            "results": [
                {
                    "uuid": "81db58d5-fb6a-45cd-bbef-74eae095d8f6",
                    "value": "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "dfac2919-13c0-45ba-9d98-bc4b8659ae5c",
            "conditions": [
                {
                    "uuid": "b590ee50-449a-4712-89ef-4d6ae8ec33ae",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "7a70d5fd-2367-4acc-98d2-dd0e2631b8cf",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ ВЕБ + РАЗРАБОТКА ИГР",
            "name": "R28",
            "results": [
                {
                    "uuid": "aba6b10b-5b0d-49fd-8e5e-cc3827b97c31",
                    "value": "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "f3f52edb-5b70-4cce-81a7-33dba0049d20",
            "conditions": [
                {
                    "uuid": "1ea79c08-273c-49c7-9c30-67b92dffc916",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "e4d84641-ae93-42d4-b938-20a92faf00b7",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ ВЕБ + РАЗРАБОТКА ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "name": "R29",
            "results": [
                {
                    "uuid": "416572da-9120-4ee1-8868-2fba0837bee4",
                    "value": "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "1b197559-79e6-4ad5-85a7-41b074b7c2c8",
            "conditions": [
                {
                    "uuid": "f8cbbdea-6f5e-4091-8979-7897198cfa4a",
                    "value": "Да",
                    "variable": {
                        "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "webaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "6917ebbe-6a2d-423c-8283-c5bfee42a46f",
                    "value": "Да",
                    "variable": {
                        "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "consaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ ВЕБ + РАЗРАБОТКА КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "name": "R30",
            "results": [
                {
                    "uuid": "a2c0b242-0a00-4f7c-8c10-61214aa78e53",
                    "value": "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "fec96541-b138-4a4a-938d-b27a346af491",
            "conditions": [
                {
                    "uuid": "94cac3ac-e47a-4977-840c-9ac958e3776e",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "b25b91a4-8c8e-45a0-935e-4073fc6030dc",
                    "value": "Да",
                    "variable": {
                        "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mobaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МО + МОБИЛЬНАЯ РАЗРАБОТКА",
            "name": "R31",
            "results": [
                {
                    "uuid": "cbeb87eb-c244-452e-925c-30c9f63ec882",
                    "value": "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "345bf4e4-bcab-4fc9-896a-910c071a54b6",
            "conditions": [
                {
                    "uuid": "c3a8bb94-24b8-4921-a470-862dc676f040",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "0961f22f-eb73-4583-92a2-f94ad330f77c",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МО + РАЗРАБОТКА ИГР",
            "name": "R32",
            "results": [
                {
                    "uuid": "6cbeccbc-68f4-4782-9e90-c6a070a48926",
                    "value": "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "dab2d808-176f-47b7-a2fa-0882f498ffc6",
            "conditions": [
                {
                    "uuid": "1852ac3f-ae90-4a2d-b1cb-1bcbef7e738e",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "bbcf9cde-cff7-4972-ba7c-1252735699c1",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МО + РАЗРАБОТКА ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "name": "R33",
            "results": [
                {
                    "uuid": "f354e4ba-2d16-45c3-97c5-7099e235e762",
                    "value": "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "235d1518-d4e8-4246-ba68-8b7f6e2b1d8b",
            "conditions": [
                {
                    "uuid": "21463024-01f0-461e-abb7-2449445921e3",
                    "value": "Да",
                    "variable": {
                        "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mlaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "fa2404c2-de7f-4836-b14a-443232895072",
                    "value": "Да",
                    "variable": {
                        "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "consaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МО + РАЗРАБОТКА КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "name": "R34",
            "results": [
                {
                    "uuid": "dfa9c0e9-0853-490f-91be-e3bf243f267d",
                    "value": "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "55c66dda-186d-4de2-b03c-2bb5ec17dedc",
            "conditions": [
                {
                    "uuid": "16ed4941-ad40-4246-9813-c42bd866d19e",
                    "value": "Да",
                    "variable": {
                        "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mobaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "2be9d411-7fa7-4b80-8be7-1f98a459fe99",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МОБИЛЬНАЯ РАЗРАБОТКА + РАЗРАБОТКА ИГР",
            "name": "R35",
            "results": [
                {
                    "uuid": "072f2616-d556-4dbc-9a3a-3e31b2d36788",
                    "value": "МОБИЛЬНЫЕ ИГРЫ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "c31a9667-b7d1-4bb4-955b-f37f5789cdf4",
            "conditions": [
                {
                    "uuid": "e5388378-9d6c-4999-abe1-4a17f531d566",
                    "value": "Да",
                    "variable": {
                        "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mobaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "428667f9-2733-485b-a882-809599429cdc",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МОБИЛЬНАЯ РАЗРАБОТКА + РАЗРАБОТКА ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "name": "R36",
            "results": [
                {
                    "uuid": "bc6ed20d-906b-497f-95bc-1bab44e89156",
                    "value": "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "38d5d3c0-9e2b-4dc9-b65f-1c8051413db2",
            "conditions": [
                {
                    "uuid": "762518a6-26e3-4291-809e-0f553e41a0da",
                    "value": "Да",
                    "variable": {
                        "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "mobaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                },
                {
                    "uuid": "8f8727cc-5d76-4eb4-b986-3b6cb2ce2b5f",
                    "value": "Да",
                    "variable": {
                        "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "consaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ МОБИЛЬНАЯ РАЗРАБОТКА + РАЗРАБОТКА КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "name": "R37",
            "results": [
                {
                    "uuid": "da12e069-7647-4af7-8387-b2e89bfa9476",
                    "value": "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "0fd2472b-c847-4926-bf03-2d778c1caec6",
            "conditions": [
                {
                    "uuid": "272f5d31-5b18-4134-b717-168bf81cbdc1",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "d88439ed-fb34-440d-89a5-ff8b689b86f9",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ РАЗРАБОТКА ИГР + РАЗРАБОТКА ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "name": "R38",
            "results": [
                {
                    "uuid": "4fa883be-1e6e-4c8c-9f1c-2106758a5054",
                    "value": "ДЕСКТОПНЫЕ ИГРЫ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "6d5e2cfd-32ab-45de-9a7c-ccbad966c945",
            "conditions": [
                {
                    "uuid": "802f03df-156b-4ae6-bd7d-3ae3839d9637",
                    "value": "Да",
                    "variable": {
                        "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "gameaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "313ae977-9b1e-4fb5-a50b-808caeb9ad51",
                    "value": "Да",
                    "variable": {
                        "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "consaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ РАЗРАБОТКА ИГР + РАЗРАБОТКА КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "name": "R39",
            "results": [
                {
                    "uuid": "91dee7fe-7fcf-49c4-b464-10dfd426489f",
                    "value": "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        },
        {
            "uuid": "4a7e0b60-e56a-443d-857c-3c1605fbfce1",
            "conditions": [
                {
                    "uuid": "deb8d0d4-8514-4760-8e8c-ae1596c08b4f",
                    "value": "Да",
                    "variable": {
                        "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "dtaf",
                        "question": null,
                        "variableType": "inferred"
                    }
                },
                {
                    "uuid": "1c0cc601-979d-4567-aefc-962566cbbbb4",
                    "value": "Да",
                    "variable": {
                        "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
                        "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
                        "domain": {
                            "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                            "description": "",
                            "name": "Бинарный ответ",
                            "values": [
                                "Да",
                                "Нет"
                            ]
                        },
                        "name": "consaf",
                        "question": null,
                        "variableType": "prompted"
                    }
                }
            ],
            "description": "ЧЕЛОВЕКУ НРАВИТСЯ РАЗРАБОТКА ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ + РАЗРАБОТКА КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "name": "R40",
            "results": [
                {
                    "uuid": "8819e89f-7adf-4939-b45b-2fb36263e44d",
                    "value": "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ",
                    "variable": {
                        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
                        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
                        "domain": {
                            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                            "description": "",
                            "name": "Направления разработки",
                            "values": [
                                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                                "МОБИЛЬНЫЕ ИГРЫ",
                                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                                "ДЕСКТОПНЫЕ ИГРЫ",
                                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                            ]
                        },
                        "name": "result",
                        "question": null,
                        "variableType": "inferred"
                    }
                }
            ]
        }
    ],
    "target": {
        "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
        "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
        "domain": {
            "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
            "description": "",
            "name": "Направления разработки",
            "values": [
                "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                "МОБИЛЬНЫЕ ИГРЫ",
                "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                "ДЕСКТОПНЫЕ ИГРЫ",
                "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
            ]
        },
        "name": "result",
        "question": null,
        "variableType": "inferred"
    },
    "variables": [
        {
            "uuid": "aacc2756-b8a5-477d-bcf7-98af1efa0006",
            "description": "ОПЫТ В ВЕБ-РАЗРАБОТКЕ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "webexp",
            "question": "У вас есть опыт в веб разработке?",
            "variableType": "prompted"
        },
        {
            "uuid": "4d216fd6-3a39-4cf9-a7b7-ee32723a2c52",
            "description": "ОБЛАСТЬ ВЕБ-РАЗРАБОТКИ",
            "domain": {
                "uuid": "8463c59e-50dc-4805-a982-3955b96e7f35",
                "description": "",
                "name": "Направление веб разработки",
                "values": [
                    "Фронтенд",
                    "Бэкенд"
                ]
            },
            "name": "webarea",
            "question": "В какой области веб-разработки вы участвовали?",
            "variableType": "prompted"
        },
        {
            "uuid": "f5e9a489-1653-4c0f-a78a-edec8bdff7cf",
            "description": "ОПЫТ РАБОТЫ С СУБД",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "dbmsexp",
            "question": "У вас есть опыт работы с СУБД?",
            "variableType": "prompted"
        },
        {
            "uuid": "2a51f760-0edf-4c76-abd2-88c9526481ae",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВЕБУ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "webaf",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "3e6b42c9-5dfc-4042-a1fb-1273ee96af4c",
            "description": "РЕШЕНИЕ МАТЕМАТИЧЕСКИХ ЗАДАЧ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "mathslv",
            "question": "Вы любите решать математические задачи?",
            "variableType": "prompted"
        },
        {
            "uuid": "a68127ba-0510-4ac1-a111-e7d70fb53590",
            "description": "ЧТЕНИЕ НАУЧНЫХ СТАТЕЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "readart",
            "question": "Вы любите читать научные статьи?",
            "variableType": "prompted"
        },
        {
            "uuid": "e3f81275-72fe-4cc5-92d7-f155d2226fd4",
            "description": "НАПИСАНИЕ НАУЧНЫХ СТАТЕЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "wroteart",
            "question": "Вы любите писать научные статьи?",
            "variableType": "prompted"
        },
        {
            "uuid": "56f973c4-4b09-4a4e-a643-f49315bd000a",
            "description": "НАУЧНЫЙ СКЛАД УМА",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "scimind",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "71584644-4e6a-4094-b8e4-c93f3798ac7e",
            "description": "РЕАЛИЗАЦИЯ АЛГОРИТМОВ МО",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "mlalg",
            "question": "У вас есть опыт реализации алгоритмов МО?",
            "variableType": "prompted"
        },
        {
            "uuid": "88478f46-8d05-4c87-84e7-83ddebe9971e",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МО",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "mlaf",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "12d99e2b-9b53-4b79-801e-f9d70d5d36f8",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К МОБИЛЬНОЙ РАЗРАБОТКЕ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "mobaf",
            "question": "У вас есть опыт разработки мобильных приложений?",
            "variableType": "prompted"
        },
        {
            "uuid": "ed03bd1c-dcdf-42df-a72f-224b9ab9798d",
            "description": "ОПЫТ КОМПЬЮТЕРНЫХ ИГР",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "gameexp",
            "question": "Вы играете в компьютерные игры?",
            "variableType": "prompted"
        },
        {
            "uuid": "2b665353-eaa2-4a21-bc57-97faca913903",
            "description": "ИДЕИ ПО УЛУЧШЕНИЮ ИГР",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "gameids",
            "question": "У вас возникают идеи по улучшению уже существующих игр?",
            "variableType": "prompted"
        },
        {
            "uuid": "31374101-2a20-4f04-8a77-6024b69ba5e1",
            "description": "ОТНОШЕНИЕ К ВИЗУАЛИЗАЦИИ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "visual",
            "question": "Вам нравится комьютерная визуализация и 3D графика?",
            "variableType": "prompted"
        },
        {
            "uuid": "37331093-bc47-4cb2-8040-dce06d0f6582",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К ВИЗУАЛИЗАЦИИ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "visaf",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "40b8e574-92a1-429b-84e7-158f9c274782",
            "description": "ОПЫТ РАБОТЫ С ИГРОВЫМ ДВИЖКОМ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "engexp",
            "question": "У вас есть опыт работы с игровыми движками?",
            "variableType": "prompted"
        },
        {
            "uuid": "21817434-50e5-4b82-8018-9e27761fb064",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ ИГР",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "gameaf",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "670b2113-d617-4158-9c89-7aad8e5bbb4a",
            "description": "ОПЫТ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "dtexp",
            "question": "У вас есть опыт разработки десктопных приложений?",
            "variableType": "prompted"
        },
        {
            "uuid": "b7b9ad92-e8d1-4b7a-8b9e-ca46c5c560b0",
            "description": "ОПЫТ РАБОТЫ С ФРЕЙМВОРКАМИ ДЛЯ РАЗРАБОТКИ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "dtfram",
            "question": "Вы работали с фреймворками для создания десктопных приложений?",
            "variableType": "prompted"
        },
        {
            "uuid": "ef70eb6b-9bed-40e2-a481-a92f16412d33",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ РАЗРАБОТКЕ ДЕСКТОПНЫХ ПРИЛОЖЕНИЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "dtaf",
            "question": null,
            "variableType": "inferred"
        },
        {
            "uuid": "40f6e13b-5562-4b87-aa26-84c40ca23b95",
            "description": "ПРЕДРАСПОЛОЖЕННОСТЬ К РАЗРАБОТКЕ КОНСОЛЬНЫХ ПРИЛОЖЕНИЙ",
            "domain": {
                "uuid": "4f42f0df-718f-464d-b2f9-de70071dc2cb",
                "description": "",
                "name": "Бинарный ответ",
                "values": [
                    "Да",
                    "Нет"
                ]
            },
            "name": "consaf",
            "question": "У вас есть опыт разработки консольных приложений?",
            "variableType": "prompted"
        },
        {
            "uuid": "202f95c0-26e6-4c65-ae31-d2e0911c58da",
            "description": "НАИБОЛЕЕ ПОДХОДЯЩЕЕ НАПРАВЛЕНИЕ РАЗРАБОТКИ",
            "domain": {
                "uuid": "cf9a435a-9c81-4f7a-a224-e31af4023a78",
                "description": "",
                "name": "Направления разработки",
                "values": [
                    "ВЕБ-ИНТЕРФЕЙС ДЛЯ АЛГОРИТМОВ МАШИННОГО ОБУЧЕНИЯ",
                    "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ ДЛЯ ВЕБ-СЕРВИСОВ",
                    "ВЕБ-ИГРЫ ИЛИ СЕТЕВЫЕ ИГРЫ",
                    "КРОССПЛАТФОРМЕННЫЕ ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ ELECTRON",
                    "КОНСОЛЬНЫЕ УТИЛИТЫ ДЛЯ РАБОТЫ С ВЕБ-СЕРВИСАМИ",
                    "МОБИЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "АЛГОРИТМЫ МАШИННОГО ОБУЧЕНИЯ ДЛЯ ИГР",
                    "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "КОНСОЛЬНЫЕ ПРИЛОЖЕНИЯ С АЛГОРИТМАМИ МАШИННОГО ОБУЧЕНИЯ",
                    "МОБИЛЬНЫЕ ИГРЫ",
                    "ПРИЛОЖЕНИЯ НА ПЛАТФОРМЕ FLUTTER ИЛИ REACT/REACT NATIVE",
                    "ИНСТРУМЕНТЫ РАЗРАБОТЧИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ",
                    "ДЕСКТОПНЫЕ ИГРЫ",
                    "ТЕКСТОВЫЕ ИГРЫ ИЛИ КВЕСТЫ",
                    "ДЕСКТОПНЫЕ ПРИЛОЖЕНИЯ ДЛЯ РАБОТЫ С УТИЛИТАМИ"
                ]
            },
            "name": "result",
            "question": null,
            "variableType": "inferred"
        }
    ]
}
