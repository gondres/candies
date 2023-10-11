int candies(List<int> arr, int n) {
  // Create a list to store the number of candies for each student
  List<int> candiesCount = List<int>.filled(n, 1);

  // Forward pass: Check ratings from left to right
  for (int i = 1; i < n; i++) {
    if (arr[i] > arr[i - 1]) {
      candiesCount[i] = candiesCount[i - 1] + 1;
    }
  }

  // Backward pass: Check ratings from right to left
  for (int i = n - 2; i >= 0; i--) {
    if (arr[i] > arr[i + 1] && candiesCount[i] <= candiesCount[i + 1]) {
      candiesCount[i] = candiesCount[i + 1] + 1;
    }
  }

  // Calculate the total number of candies
  int totalCandies = candiesCount.reduce((a, b) => a + b);

  return totalCandies;
}

void main() {
  List<int> ratings = [1, 2, 2];
  int n = ratings.length;
  int result = candies(ratings, n);
  print(result); // Output: 4
}
