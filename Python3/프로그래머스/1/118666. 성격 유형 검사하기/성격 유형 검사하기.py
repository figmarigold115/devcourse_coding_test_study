def solution(survey, choices):
    answer = ''
    num = len(survey)
    score = {'R': 0, 'T': 0, 'C': 0, 'F': 0, 'J': 0, 'M': 0, 'A': 0, 'N': 0}
    mbti = [('R', 'T'), ('C', 'F'), ('J', 'M'), ('A', 'N')]
    
    for i in range(num):
        if choices[i] < 4:
            score[survey[i][0]] += 4 - choices[i]
        elif choices[i] > 4:
            score[survey[i][1]] += choices[i] - 4
        else:
            continue
    
    for m in mbti:
        if score[m[0]] >= score[m[1]]:
            answer += m[0]
        else:
            answer += m[1]
    
    return answer