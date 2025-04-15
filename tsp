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








another:

import math 
# Calculate Euclidean distance between two points 
def distance(city1, city2): 
    return math.sqrt((city1[0] - city2[0])**2 + (city1[1] - city2[1])**2) 
 
# Nearest Neighbor Heuristic 
def tsp_nearest_neighbor(cities): 
    n = len(cities) 
    visited = [False] * n 
    path = [] 
    total_distance = 0 
 
    current = 0  # start from city 0 
    visited[current] = True 
    path.append(current) 
 
    for _ in range(n - 1): 
        nearest = None 
        min_dist = float('inf') 
 
        for i in range(n): 
            if not visited[i]: 
                d = distance(cities[current], cities[i]) 
                if d < min_dist: 
                    min_dist = d 
                    nearest = i 
 
        visited[nearest] = True 
        path.append(nearest) 
        total_distance += min_dist 
        current = nearest 
 
    # Return to starting city 
    total_distance += distance(cities[current], cities[path[0]]) 
    path.append(path[0])  # to make the cycle complete 
 
    return path, total_distance 
 
# Example Usage 
if __name__ == "__main__": 
    # Cities are represented as (x, y) coordinates 
    cities = [(0, 0), (1, 5), (5, 2), (6, 6), (8, 3)] 
 
    route, dist = tsp_nearest_neighbor(cities) 
 
    print("Optimal Path (approx):") 
    for i in route: 
        print(f"City {i} at {cities[i]}") 
    print(f"Total Distance: {dist:.2f}") 

