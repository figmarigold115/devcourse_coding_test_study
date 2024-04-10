def solution(numbers, target):
    answer = 0
    ans = [0]
    
    for num in numbers:
        cal = []
        for a in ans:
            cal.append(a+num)
            cal.append(a-num)
        ans = cal
    
    for an in ans:
        if an == target:
            answer += 1
    
    return answer