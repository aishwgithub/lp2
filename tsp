import numpy as np
def greedy_tsp(distance_matrix):
    n = len(distance_matrix)
    unvisited = set(range(1, n)) 
    tour = [0] 
    total_distance = 0
    while unvisited:
        last_city = tour[-1]
        next_city = min(unvisited, key=lambda city: distance_matrix[last_city][city]) 
        
        tour.append(next_city)
        total_distance += distance_matrix[last_city][next_city]
        unvisited.remove(next_city)
    tour.append(0) 
    total_distance += distance_matrix[tour[-2]][0] 
    return tour, total_distance


distance_matrix = np.array([
[0, 29, 20, 21],
[29, 0, 15, 17],
[20, 15, 0, 28],
[21, 17, 28, 0]
])

tour, total_distance = greedy_tsp(distance_matrix)
print("Greedy TSP Tour:", tour)
print("Total Distance:", total_distance)



