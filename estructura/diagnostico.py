'''
Preguntas
1. ¿Está deprimido por alguna situación de su vida?
2. ¿Muy poco sueño?
3. ¿Se fatiga o pierde la energía casi cada día?
4. ¿Baja autoestima?= si
5. ¿Come muy poco?
6. ¿Problemas de memoria, atención y concentración?
7. ¿Pensamiento de que todo le sale mal?
8. ¿Ve el futuro negativamente?
9. ¿Tiene pensamientos negativos?
10. ¿Se desanima con facilidad?
11. ¿Pensamiento suicida?
12. ¿Pensamiento de hacerse daño?
13. ¿No quiere conversar con nadie?
14. ¿No quiere salir a ningún lado?
15. ¿Se siente triste o vacío?
16. ¿Se siente a veces o siempre irritable?
17. ¿Ha perdido o aumentado 5% de su peso corporal?
18. ¿Presenta insomnio casi cada día?
19. ¿Se agita en actividades psicomotoras?
20. ¿Presenta sensación de inutilidad y confusión?
21. ¿Ha perdido a un ser querido recientemente?
22. ¿Tiene alucinaciones?
23. ¿Está pasando por algún problema?
24. ¿Piensa que no tiene suerte en su vida?
25. ¿Todos los síntomas se presentan de vez en cuando?
26. ¿Todos los síntomas se presentan todos los días?
27. ¿Está muy estresado?
28. ¿Siente que su vida no tiene sentido?
29. ¿Se siente agotado y con miedo?
30. ¿Sufre de falta de motivación por realizar sus cosas cotidianas?
31. ¿No tiene pasión por nada?
32. ¿Tiene ganas de dormir en el día?
33. ¿Se encuentra en un estado de ilusión?
34. ¿Escucha voces en la cabeza?
35. ¿Es muy impulsivo (a)?
36. ¿Es muy nervioso (a)?

'''

rules = {
    1: [1, 2, 3, 4, 5],
    2: [6, 7, 8, 9, 10],
    3: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    4: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
    5: [11, 12, 13, 14],
    6: [3, 15, 16, 19],
    7: [3, 15, 16, 18, 19, 20],
    8: [18, 20],
    9: [3, 6, 11, 15, 16, 17, 18, 19, 20, 21, 22],
    10: [6, 11, 17, 21, 22],
    11: [7, 9, 23, 24, 25],
    12: [7, 9, 23, 24, 25, 26, 27],
    13: [26, 27],
    14: [28, 29, 30, 31, 32],
    15: [22, 33, 34, 35, 36],
    16: [22, 33, 34, 35, 36]
}

results = {
    1: 1,
    2: 2,
    3: 2,
    4: 3,
    5: 3,
    6: 4,
    7: 5,
    8: 5,
    9: 6,
    10: 6,
    11: 7,
    12: 8,
    13: 8,
    14: 9,
    15: 10,
    16: 10
}

type_of_depression = {
    1: 'Depresión distimia leve',
    2: 'Depresión distimia moderado',
    3: 'Depresión distimia grave',
    4: 'Depresión mayor leve',
    5: 'Depresión mayor moderado',
    6: 'Depresión mayor grave',
    7: 'Depresión neurótica moderado',
    8: 'Depresión neurótica grave',
    9: 'Depresión existencial',
    10: 'Depresión psicótica',
}

def determine_depression_type(answers):
    matching_rules = []
    for rule_number, rule_answers in rules.items():
        if set(rule_answers).issubset(answers):
            matching_rules.append(rule_number)

    for rule_number in sorted(matching_rules, reverse=True):
        depression_type = results.get(rule_number)
        if depression_type:
            return depression_type
    
    return None


'''
answers = [7, 9, 23, 24, 25]

depression_type = determine_depression_type(answers)
if depression_type:
    print("El tipo de depresión es:", depression_type)
else:
    print("No se pudo determinar el tipo de depresión.")
'''




