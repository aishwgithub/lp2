
def greedy_bfs_tsp(mat, start):
    visited = set()
    visited.add(start)
    path = [start]
    total_dist = 0

    while len(visited) < len(mat):

        curr_city = path[-1]
        unvisited = [i for i in range(len(mat)) if i not in visited]

        if not unvisited:
            break

        next_city = None
        min_dist = float('inf')

        for city in unvisited:
            if mat[curr_city][city] < min_dist:
                min_dist = mat[curr_city][city]
                next_city = city


        path.append(next_city)
        visited.add(next_city)
        total_dist += mat[curr_city][next_city]


    path.append(start)
    total_dist += mat[path[-2]][start]

    return path, total_dist


mat = [[0, 10, 15], [10, 0, 20], [15, 20, 0]]
start = 0
route, min_dist = greedy_bfs_tsp(mat, start)
print(min_dist)
print(route)
        
        
        









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

